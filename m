Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFB35ADB64
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 00:25:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399225.640325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVKX5-0001JN-Kh; Mon, 05 Sep 2022 22:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399225.640325; Mon, 05 Sep 2022 22:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVKX5-0001Gj-Hy; Mon, 05 Sep 2022 22:25:31 +0000
Received: by outflank-mailman (input) for mailman id 399225;
 Mon, 05 Sep 2022 22:25:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVKX3-0001Gc-TA
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 22:25:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVKX2-0003zM-I3; Mon, 05 Sep 2022 22:25:28 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVKX2-0003oB-BY; Mon, 05 Sep 2022 22:25:28 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=aZ+QETFKjDryICpffzfkU/TwRnDas8qPNjdsl2OrVl4=; b=D5rnJiwTSCpk/rxHW7BTPLf+fD
	3WDtdjUzADm4jx3uegFApnyr5md62f9ud3waWMWGc7TBHvp16mVDICnx8XeaXRWR7gy+3qF3PHW/R
	z73I0wwpT8uob5FuD20amlA/69UEJQzpBKNBx3OsgOMf+i7MSOIB7COBVbY2r89pPBcI=;
Message-ID: <057e2a04-545f-0de8-1d42-8b19ae19f009@xen.org>
Date: Mon, 5 Sep 2022 23:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
To: Jens Wiklander <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand.Marquis@arm.com,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220818105601.1896082-1-jens.wiklander@linaro.org>
 <20220818105601.1896082-4-jens.wiklander@linaro.org>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v5 3/9] xen/arm: add a primitive FF-A mediator
In-Reply-To: <20220818105601.1896082-4-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jens,

More remarks.

On 18/08/2022 11:55, Jens Wiklander wrote:
> +/* Negotiated FF-A version to use with the SPMC */
> +static uint32_t ffa_version __read_mostly;

NIT: if this is not meant to be modified after boot, then I would 
suggest to use __ro_after_init. This was introduced recently and will 
prevent the variable to be modified after boot.
> +
> +static bool ffa_get_version(uint32_t *vers)

This is not __init. Is this going to be called at runtime by a domain? 
If yes...

> +{
> +    const struct arm_smccc_1_2_regs arg = {
> +        .a0 = FFA_VERSION,
> +        .a1 = FFA_MY_VERSION,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +    if ( resp.a0 == FFA_RET_NOT_SUPPORTED )
> +    {
> +        printk(XENLOG_ERR "ffa: FFA_VERSION returned not supported\n");

... this wants to be a XENLOG_G_ERR to rate limited it. XENLOG_ERR is 
not by default and will allow a domain to spam Xen console.

A rule of thumb is any code reachable for a domain (other than dom0) 
should use XENLOG_G_* when printing or gprintk(XENLOG_*, ) if you want 
to print the domain ID and ratelimit. Note that the latter doesn't 
require the G_* becauce it will add it automatically.

> +        return false;
> +    }
> +
> +    *vers = resp.a0;
> +
> +    return true;
> +}
> +
> +static u16 get_vm_id(const struct domain *d)
> +{
> +    /* +1 since 0 is reserved for the hypervisor in FF-A */
> +    return d->domain_id + 1;
> +}
> +
> +static void set_regs(struct cpu_user_regs *regs, register_t v0, register_t v1,
> +                     register_t v2, register_t v3, register_t v4, register_t v5,
> +                     register_t v6, register_t v7)
> +{
> +        set_user_reg(regs, 0, v0);
> +        set_user_reg(regs, 1, v1);
> +        set_user_reg(regs, 2, v2);
> +        set_user_reg(regs, 3, v3);
> +        set_user_reg(regs, 4, v4);
> +        set_user_reg(regs, 5, v5);
> +        set_user_reg(regs, 6, v6);
> +        set_user_reg(regs, 7, v7);
> +}
> +
> +static void set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
> +                             uint32_t w3)
> +{
> +    set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, 0, 0, 0, 0);
> +}
> +
> +static void handle_version(struct cpu_user_regs *regs)
> +{
> +    struct domain *d = current->domain;
> +    struct ffa_ctx *ctx = d->arch.ffa;
> +    uint32_t vers = get_user_reg(regs, 1);
> +
> +    if ( vers < FFA_VERSION_1_1 )
> +        vers = FFA_VERSION_1_0;
> +    else
> +        vers = FFA_VERSION_1_1;
> +
> +    ctx->guest_vers = vers;
> +    set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
> +}
> +
> +bool ffa_handle_call(struct cpu_user_regs *regs, uint32_t fid)
> +{
> +    struct domain *d = current->domain;
> +    struct ffa_ctx *ctx = d->arch.ffa;
> +
> +    if ( !ctx )
> +        return false;
> +
> +    switch ( fid )
> +    {
> +    case FFA_VERSION:
> +        handle_version(regs);
> +        return true;
> +    case FFA_ID_GET:
> +        set_regs_success(regs, get_vm_id(d), 0);
> +        return true;
> +
> +    default:
> +        printk(XENLOG_ERR "ffa: unhandled fid 0x%x\n", fid);

This one definitely want to be a XENLOG_G_ERR. But I would use 
gprintk(XENLOG_ERR, ).

Cheers,

-- 
Julien Grall

