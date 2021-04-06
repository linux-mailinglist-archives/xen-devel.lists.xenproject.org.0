Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D6C355596
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 15:45:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105960.202604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTlzz-00030t-1Z; Tue, 06 Apr 2021 13:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105960.202604; Tue, 06 Apr 2021 13:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTlzy-00030X-Uc; Tue, 06 Apr 2021 13:44:06 +0000
Received: by outflank-mailman (input) for mailman id 105960;
 Tue, 06 Apr 2021 13:44:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTlzx-00030Q-Pm
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 13:44:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTlzv-0007eJ-M6; Tue, 06 Apr 2021 13:44:03 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTlzv-0007NQ-Cg; Tue, 06 Apr 2021 13:44:03 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=gJN23I4Q/wriX+nEdwGqDDRW8Vt/TNXMrjMBXOvWcX4=; b=rU27z10f8DuT5vT0o0gZYUOMHF
	NmGcaY07UTJol6aBl1ASMlb3Xv1iCmH+pO5Uvrp4nezZFXVB9ubYJsQKXCHbZyBG8rncBtTZQKreL
	8mk2tH8+iEz/cbqOR4JsuLGPtH1d5c+9zP7Ed5iHWmwF0N0Ras5ILYv1JCXCdm9rHCOA=;
Subject: Re: [PATCH] rangeset: no need to use snprintf()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <2338703b-3613-41c6-8ae6-387ba2869408@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <80d625d8-6812-7d02-c946-a3905cbc306d@xen.org>
Date: Tue, 6 Apr 2021 14:44:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <2338703b-3613-41c6-8ae6-387ba2869408@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 06/04/2021 09:50, Jan Beulich wrote:
> As of the conversion to safe_strcpy() years ago there has been no need
> anymore to use snprintf() to prevent storing a not-nul-terminated string.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

> 
> --- a/xen/common/rangeset.c
> +++ b/xen/common/rangeset.c
> @@ -436,14 +436,7 @@ struct rangeset *rangeset_new(
>       BUG_ON(flags & ~RANGESETF_prettyprint_hex);
>       r->flags = flags;
>   
> -    if ( name != NULL )
> -    {
> -        safe_strcpy(r->name, name);
> -    }
> -    else
> -    {
> -        snprintf(r->name, sizeof(r->name), "(no name)");
> -    }
> +    safe_strcpy(r->name, name ?: "(no name)");

I realize the current code is not checking the return, but I wonder we 
should rather than silently truncating the string.

This is not a new issue, so it can dealt separately if we decide to 
check the return.

Cheers,

-- 
Julien Grall

