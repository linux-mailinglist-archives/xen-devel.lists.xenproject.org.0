Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AD46E0D6A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 14:26:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520682.808530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmw1t-0000MN-VQ; Thu, 13 Apr 2023 12:26:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520682.808530; Thu, 13 Apr 2023 12:26:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmw1t-0000Jn-SA; Thu, 13 Apr 2023 12:26:21 +0000
Received: by outflank-mailman (input) for mailman id 520682;
 Thu, 13 Apr 2023 12:26:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pmw1t-0000Jd-0J
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 12:26:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pmw1s-0001jK-LU; Thu, 13 Apr 2023 12:26:20 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.20.117]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pmw1s-0004af-DB; Thu, 13 Apr 2023 12:26:20 +0000
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
	bh=jOO+IcLy6m2G+FcfCMMlFmJIrteZRP85wg/5Z1eG/mc=; b=pfwaeJqPTxtNQ5xgPsx8+VM0QL
	ryrPsPK/Yv1uy+nqs4QiqlOxe7SH6EWx+fW/cVU+T+1FObsNGXiAtU1F8ug/nN3iFA5cPoPT6I5XP
	ihrEPdlo21ZQ5TVxv/Vrbwu+DUIDHaMVYrqkYh1k0tzP4tJJZXGqOR6hP8qICevh8WbM=;
Message-ID: <ad1d5ebd-38e5-bab9-24ac-6facc8ccb95c@xen.org>
Date: Thu, 13 Apr 2023 13:26:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [XEN PATCH v8 02/22] xen/arm: tee: add a primitive FF-A mediator
Content-Language: en-US
To: Jens Wiklander <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Marc Bonnici <marc.bonnici@arm.com>,
 Achin Gupta <achin.gupta@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-3-jens.wiklander@linaro.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230413071424.3273490-3-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jens,

Mainly reviewing this patch from a Xen PoV. I will leave the others to 
review the patch from a spec-compliance PoV.

On 13/04/2023 08:14, Jens Wiklander wrote:
> +struct ffa_ctx {
> +    /* FF-A version used by the guest */
> +    uint32_t guest_vers;
> +};
> +
> +/* Negotiated FF-A version to use with the SPMC */
> +static uint32_t ffa_version __ro_after_init;

Coding style: We tend to add attributes just after the type. E.g.:

static uint32_t __ro_after_init ffa_version;

I can deal with this one on commit if there is nothing else to change.

[...]

> +static int ffa_domain_init(struct domain *d)
> +{
> +    struct ffa_ctx *ctx;
> +
> +    if ( !ffa_version )
> +        return -ENODEV;
> +
> +    ctx = xzalloc(struct ffa_ctx);
> +    if ( !ctx )
> +        return -ENOMEM;
> +
> +    d->arch.tee = ctx;
> +
> +    return 0;
> +}
> +
> +/* This function is supposed to undo what ffa_domain_init() has done */

I think there is a problem in the TEE framework. The callback 
.relinquish_resources() will not be called if domain_create() failed. So 
this will result to a memory leak.

We also can't call .relinquish_resources() on early domain creation 
failure because relinquishing resources can take time and therefore 
needs to be preemptible.

So I think we need to introduce a new callback domain_free() that will 
be called arch_domain_destroy(). Is this something you can look at?

> +static int ffa_relinquish_resources(struct domain *d)
> +{
> +    struct ffa_ctx *ctx = d->arch.tee;
> +
> +    if ( !ctx )
> +        return 0;
> +
> +    XFREE(d->arch.tee);
> +
> +    return 0;
> +}

Cheers,

-- 
Julien Grall

