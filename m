Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE903340E8
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 15:58:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96165.181704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK0IG-0004qZ-8D; Wed, 10 Mar 2021 14:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96165.181704; Wed, 10 Mar 2021 14:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK0IG-0004qA-4L; Wed, 10 Mar 2021 14:58:36 +0000
Received: by outflank-mailman (input) for mailman id 96165;
 Wed, 10 Mar 2021 14:58:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lK0IE-0004q2-Fy
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 14:58:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lK0IC-00044f-Qy; Wed, 10 Mar 2021 14:58:32 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lK0IC-0002OO-Fo; Wed, 10 Mar 2021 14:58:32 +0000
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
	bh=lodQ7FG7ZXZ4/aX0c5msg2K6xV7OPC6YGi3udVI9Da8=; b=M6RZIVEsNY+4LeQi8nqbm0qlrh
	45ZOro3r2r+Kc7zWzDCLXK2F1rpCd47uv+aaa6DswVFAni9+BoPeATPx7ZicMKYYQiglYFBccEJkO
	4jH6K9hzDa1N097t34RLWlcvlvgephc5Tij8q7npla1caIiZt8dFGPoEZL0qUhm0wGJc=;
Subject: Re: [PATCH][4.15] gnttab: work around "may be used uninitialized"
 warning
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <a6b73c54-3010-6716-cac3-8f3b462a4dc7@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ec2b85b6-072d-481d-3b02-c8dedf043dac@xen.org>
Date: Wed, 10 Mar 2021 14:58:30 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <a6b73c54-3010-6716-cac3-8f3b462a4dc7@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 10/03/2021 10:13, Jan Beulich wrote:
> Sadly I was wrong to suggest dropping vaddrs' initializer during review
> of v2 of the patch introducing this code. gcc 4.3 can't cope.

What's the error? Are you sure this is not going to hiding a potential 
miscompilation of the function?

> 
> Fixes: 52531c734ea1 ("xen/gnttab: Rework resource acquisition")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -4026,7 +4026,7 @@ int gnttab_acquire_resource(
>       struct grant_table *gt = d->grant_table;
>       unsigned int i, final_frame;
>       mfn_t tmp;
> -    void **vaddrs;
> +    void **vaddrs = NULL;
I am a bit nervous to inialize vaddrs to NULL for a few reasons:
   1) It is not 100% obvious (e.g. it takes more than a second) that 
vaddrs will always be initialized.
   2) A compiler will not be able to help us if we are adding code 
without initialized vaddrs.

It also feels wrong to me to try to write Xen in a way that will make a 
10 years compiler happy...

If we still want to support them, then maybe a better approach would be 
to turn off to turn off -Werror for some version of GCC. So we can 
continue to benefit from the newer compiler diagnostics.

Cheers,

-- 
Julien Grall

