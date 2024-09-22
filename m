Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 829EA97E188
	for <lists+xen-devel@lfdr.de>; Sun, 22 Sep 2024 14:26:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801559.1211541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssLeI-0001cD-P0; Sun, 22 Sep 2024 12:25:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801559.1211541; Sun, 22 Sep 2024 12:25:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssLeI-0001Zb-M5; Sun, 22 Sep 2024 12:25:10 +0000
Received: by outflank-mailman (input) for mailman id 801559;
 Sun, 22 Sep 2024 12:25:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ssLeG-0001ZU-Ob
 for xen-devel@lists.xenproject.org; Sun, 22 Sep 2024 12:25:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ssLeG-0002pq-Dh; Sun, 22 Sep 2024 12:25:08 +0000
Received: from 90-181-218-29.rco.o2.cz ([90.181.218.29] helo=[10.5.48.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ssLeG-0002n5-65; Sun, 22 Sep 2024 12:25:08 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=xKraE2iOxeknuu72nMYYpDLxHRa8SPwRfWYO7u0r3sk=; b=yrC72zy1ktXOptU1n3oYfUlne3
	Mn4XlsCzR9S6+YJl+FvhnqzjhqWr30AmS2/5HLh68MPGW8zvSd8HjD1xXkxZkEbd0XqCKphK634P+
	76zALNc7wbErF26t8ZNgrI1QIXbgty4W+I6Fy/2hO6llehIOYhXVPoiRdRbfdMcZPsvc=;
Message-ID: <ec473bbd-1fea-4ccf-80d5-2f55f2db69ed@xen.org>
Date: Sun, 22 Sep 2024 14:25:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] xen/arm: ffa: fix version negotiation
Content-Language: en-GB
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1726676338.git.bertrand.marquis@arm.com>
 <716e806316f8249611c8268f781efbea19273b4a.1726676338.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <716e806316f8249611c8268f781efbea19273b4a.1726676338.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

NIT Typo: s/fix/Fix/ to match the other title

On 19/09/2024 14:19, Bertrand Marquis wrote:
> Fix FFA version negotiation with the firmware to follow the
> specification guidance more closely.

To confirm, below is based on 13.2.1 in DEN0077A, is that correct? If 
so, can you add a link in the commit message (and maybe code).

> When the firmware returns OK we can have several cases:
> - the version requested is accepted but the firmware supports a greater
>    one in the same major.
> - the firmware supports a greater major version. It could still return
>    OK even if the version requested is not accepted. Reject it.
> - the firmware supports a lower version. It will return OK and give that
>    version. Check if we support it and use it or reject it if we do not.
> 
> Adapt the code to:
> - reject any version lower than the one we support or not with the same
>    major version
> - use the version returned if in our supported range (currently 1.1
>    only)
> - use 1.1 if the version returned is greater.
> 
> Also adapt the handling of version requests from VM:
> - return an error for a different major
> - return 1.1 for a version >= 1.1
> - return 1.0 if 1.0 was requested
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>   xen/arch/arm/tee/ffa.c | 38 ++++++++++++++++++++++++++++++--------
>   1 file changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 7ff2529b2055..1f602f25d097 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -141,13 +141,24 @@ static void handle_version(struct cpu_user_regs *regs)
>       struct ffa_ctx *ctx = d->arch.tee;
>       uint32_t vers = get_user_reg(regs, 1);
>   
> -    if ( vers < FFA_VERSION_1_1 )
> -        vers = FFA_VERSION_1_0;
> -    else
> -        vers = FFA_VERSION_1_1;
> +    /**

Coding style: We are use a single '*' to start comment.

> +     * As of now we only support 1.0 or 1.1.
> +     * For any 1.x >= 1.1 return OK with 1.1
> +     * For 1.0 return OK with 1.0
> +     * For anything else return an error.
> +     */
 > +    if ( (vers >> FFA_VERSION_MAJOR_SHIFT) == FFA_MY_VERSION_MAJOR )
 > +    {> +        if ( vers < FFA_VERSION_1_1 )
> +            vers = FFA_VERSION_1_0;
> +        else
> +            vers = FFA_VERSION_1_1;

I feel the logic is fragile. The first ``if`` is generic and I think it 
would be easy to update the major version without updating 
handle_version(). To some extend, the same problem would happen with the 
minor version.

AFAICT, this is not a new issue, but as you touch the code, we should 
probably harden it. I could settle with a BUILD_BUG_ON() to catch any 
change of the minor/major.

>   
> -    ctx->guest_vers = vers;
> -    ffa_set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
> +        ctx->guest_vers = vers;
> +        ffa_set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
> +    }
> +    else
> +        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>   }
>   
>   static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
> @@ -530,7 +541,8 @@ static bool ffa_probe(void)
>           goto err_no_fw;
>       }
>   
> -    if ( vers < FFA_MIN_SPMC_VERSION || vers > FFA_MY_VERSION )
> +    if ( vers < FFA_MIN_SPMC_VERSION ||
> +              (vers >> FFA_VERSION_MAJOR_SHIFT) != FFA_MY_VERSION_MAJOR )

Coding style: the second line should be aligned with 'vers' rather than 
indented.

>       {
>           printk(XENLOG_ERR "ffa: Incompatible version %#x found\n", vers);
>           goto err_no_fw;
> @@ -542,7 +554,17 @@ static bool ffa_probe(void)
>       printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
>              major_vers, minor_vers);
>   
> -    ffa_fw_version = vers;
> +    /**

Coding style: We start comment with /*.

> +     * If the call succeed and the version returned is higher or equal to
> +     * the one Xen requested, the version requested by Xen will be the one
> +     * used. If the version returned is lower but compatible with Xen, Xen
> +     * will use that version instead.
> +     * A version with a different major is rejected before.
> +     */
> +    if ( vers > FFA_MY_VERSION )
> +        ffa_fw_version = FFA_MY_VERSION;
> +    else
> +        ffa_fw_version = vers;

Looking at the code after your series (didn't check before). We don't 
seem to use ffa_fw_version for other than checking that FFA was 
detected. So wouldn't it be better to stop storing the version?

Cheers,

-- 
Julien Grall


