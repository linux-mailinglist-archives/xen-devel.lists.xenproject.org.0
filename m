Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E7936F705
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 10:20:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120396.227679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcONF-0000jT-PJ; Fri, 30 Apr 2021 08:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120396.227679; Fri, 30 Apr 2021 08:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcONF-0000j6-Lm; Fri, 30 Apr 2021 08:19:45 +0000
Received: by outflank-mailman (input) for mailman id 120396;
 Fri, 30 Apr 2021 08:19:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lcONE-0000j1-1y
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 08:19:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lcONA-0006ID-SS; Fri, 30 Apr 2021 08:19:40 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lcONA-0007o6-HT; Fri, 30 Apr 2021 08:19:40 +0000
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
	bh=glfHiN++vwRTdePC5cGdWv1bK8ZQYIWXvg/UgYJwrR4=; b=ao33Nmygkq3iM6QrmajT5TRPzj
	O+8fR7YPiOayNCYP0pEItEMVEbisa0xI40Ow1j0Rg2BzNrHHbXcb375FA4o7Ulz3SOD4zPPVVIqfZ
	npKnD7aFlq65euJOz7bUWP5XkJQLGfn9YxryW/hp6On5TyEKpgnq55rqYnzQbaXHO2rQ=;
Subject: Re: [PATCH] public/gnttab: relax v2 recommendation
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <dcd9ede1-9471-6866-4ba7-b6a7664b5e35@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8eac6f09-4d1d-6fcc-4218-8c9a0760a6bb@xen.org>
Date: Fri, 30 Apr 2021 09:19:38 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <dcd9ede1-9471-6866-4ba7-b6a7664b5e35@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 29/04/2021 14:10, Jan Beulich wrote:
> With there being a way to disable v2 support, telling new guests to use
> v2 exclusively is not a good suggestion.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/include/public/grant_table.h
> +++ b/xen/include/public/grant_table.h
> @@ -121,8 +121,10 @@ typedef uint32_t grant_ref_t;
>    */
>   
>   /*
> - * Version 1 of the grant table entry structure is maintained purely
> - * for backwards compatibility.  New guests should use version 2.
> + * Version 1 of the grant table entry structure is maintained largely for
> + * backwards compatibility.  New guests are recommended to support using
> + * version 2 to overcome version 1 limitations, but to be able to fall back
> + * to version 1.

v2 is not supported on Arm and I don't see it coming anytime soon. 
AFAIK, Linux will also not use grant table v2 unless the guest has a 
address space larger than 44 (?) bits.

I can't remember why Linux decided to not use it everywhere, but this is 
a sign that v2 is not always desired.

So I think it would be better to recommend new guest to use v1 unless 
they hit the limitations (to be details).

Cheers,

-- 
Julien Grall

