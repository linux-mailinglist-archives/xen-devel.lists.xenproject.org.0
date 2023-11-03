Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7067E054B
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 16:11:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627204.978114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyvoV-0005zd-W9; Fri, 03 Nov 2023 15:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627204.978114; Fri, 03 Nov 2023 15:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyvoV-0005xX-TE; Fri, 03 Nov 2023 15:10:23 +0000
Received: by outflank-mailman (input) for mailman id 627204;
 Fri, 03 Nov 2023 15:10:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=va+T=GQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qyvoU-0005xR-Hd
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 15:10:22 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a708aea-7a5b-11ee-9b0e-b553b5be7939;
 Fri, 03 Nov 2023 16:10:20 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40859c464daso16101485e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Nov 2023 08:10:20 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 bg13-20020a05600c3c8d00b0040644e699a0sm2777734wmb.45.2023.11.03.08.10.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Nov 2023 08:10:18 -0700 (PDT)
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
X-Inumbo-ID: 1a708aea-7a5b-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699024219; x=1699629019; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L7xL0JHxy48XbKJOsjFmJ5Xt0LCUmhYdcJs/vX5UpwE=;
        b=ZO6tfBp9OKaePYeiG6h9PT6o4PT5k4lqSuQFycCWklqNLvi3r4/17veCX15mGT9zdB
         Z15Ve4rBTezCA8kn7e1xkIy2W0SRsEQCpK1j/Vvv3VSkEimTKzwwX6jp8t1F99GSec4/
         kfkyFMxiv8D2ipiCtqXI265ULjuI8wi9BH4wA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699024219; x=1699629019;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L7xL0JHxy48XbKJOsjFmJ5Xt0LCUmhYdcJs/vX5UpwE=;
        b=Nep1BKYL9utYLTBUdFl2Ldadg8/dwh0YaFrmUoY2OEEhZqTymCX8+1NZ6zQVBEZ2Bi
         Z+MPkO4lPioshszwCcHF7SfQ/eNyAYHsyU9qUBy3cQpD1zdbdc0FDbmV69suThKKbKri
         70pYM3/Jg3AZH6y2j8ODcTepCHmF1+fI4THkrAVBTnJATphTAwiN0VSwADI0gqvz5p4i
         n4BBuSMT/6JtYHy8P/a9yrNNH2zMp08HTO4vRdQUv+6yylFi1UfCiP1jTRml0M1zdBrA
         k/L6w+pMmR42qIM+LqnHq0ajpV442HgJc1SeUqPhhdi+pH/gq1CbcXYxJAlTUO4PzAoX
         x0kw==
X-Gm-Message-State: AOJu0Yz0Xstur8vCLnfDVfy7RKIBhNdPWTPPRyjJDo0iKQmDLbDi//Q5
	je+BQTDISlbC3+ZrSQ0TqCSewA==
X-Google-Smtp-Source: AGHT+IE0lqnJco/5hh8ZwGVR9ztCQwr6fxuwBDfLY6LMZjSdDjBoU/V/2YOcccOUtcEOfLIsWUftRA==
X-Received: by 2002:a05:600c:a01:b0:409:5bd2:aa08 with SMTP id z1-20020a05600c0a0100b004095bd2aa08mr6621356wmp.11.1699024219242;
        Fri, 03 Nov 2023 08:10:19 -0700 (PDT)
Message-ID: <93fc77ad-8696-4d83-b916-e47f883ac366@citrix.com>
Date: Fri, 3 Nov 2023 15:10:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3] x86/x2apic: introduce a mixed physical/cluster mode
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20231103144537.90914-1-roger.pau@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20231103144537.90914-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/11/2023 2:45 pm, Roger Pau Monne wrote:
> The current implementation of x2APIC requires to either use Cluster Logical or

I'd suggest starting with "Xen's current ..." to make it clear that this
is our logic, not a property of x2APIC itself.

> Physical mode for all interrupts.  However the selection of Physical vs Logical
> is not done at APIC setup, an APIC can be addressed both in Physical or Logical
> destination modes concurrently.
>
> Introduce a new x2APIC mode called mixed, which uses Logical Cluster mode for
> IPIs, and Physical mode for external interrupts, thus attempting to use the
> best method for each interrupt type.
>
> Using Physical mode for external interrupts allows more vectors to be used, and
> interrupt balancing to be more accurate.
>
> Using Logical Cluster mode for IPIs allows less accesses to the ICR register

s/less/fewer/

> when sending those, as multiple CPUs can be targeted with a single ICR register
> write.
>
> A simple test calling flush_tlb_all() 10000 times in a tight loop on a 96 CPU
> box gives the following average figures:
>
> Physical mode: 26617931ns
> Mixed mode:    23865337ns
>
> So ~10% improvement versus plain Physical mode.  Note that Xen uses Cluster
> mode by default, and hence is already using the fastest way for IPI delivery at
> the cost of reducing the amount of vectors available system-wide.

96 looks suspiciously like an Intel number.  In nothing else, you ought
to say which CPU is it, because microarchitecture matters.  By any
chance can we try this on one of the Bergamos, to give us a datapoint at
512?

As far as the stats go, it would be helpful to give a number for Cluster
mode too, because if it's different from Mixed mode (in this test), then
it shows an error in our reasoning.

> Make the newly introduced mode the default one.
>
> Note the printing of the APIC addressing mode done in connect_bsp_APIC() has
> been removed, as with the newly introduced mixed mode this would require more
> fine grained printing, or else would be incorrect.  The addressing mode can
> already be derived from the APIC driver in use, which is printed by different
> helpers.
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Thankyou for doing this.  It's far less invasive than I was fearing.

One real bug (which Gitlab will block on), one other suspected bug that
probably nothing will notice. Minor notes otherwise.

> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index b184dde8b15f..80deba5d2550 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -9,6 +9,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>  ### Changed
>  
>  ### Added
> + - On x86 introduce a new x2APIC driver that uses Cluster Logical addressing
> +   mode for IPIs and Physical addressing mode for external interrupts.

Could I request that you copy the structure of 4.18 post-reformat, in
the hope that I don't have to repeat that patch for 4.19.

Something like

 - On x86:
   - Introduce a new ...

> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index eac77573bd75..cd9286f295e5 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -228,11 +228,18 @@ config XEN_ALIGN_2M
>  
>  endchoice
>  
> -config X2APIC_PHYSICAL
> -	bool "x2APIC Physical Destination mode"
> +choice
> +	prompt "x2APIC Destination mode"

"x2APIC Driver default" is going to be more meaningful to a non-expert
reading this menu entry, IMO.

> diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
> index 707deef98c27..875952adc42d 100644
> --- a/xen/arch/x86/genapic/x2apic.c
> +++ b/xen/arch/x86/genapic/x2apic.c
> @@ -180,6 +180,34 @@ static const struct genapic __initconstrel apic_x2apic_cluster = {
>      .send_IPI_self = send_IPI_self_x2apic
>  };
>  
> +/*
> + * Mixed x2APIC mode: use physical for external (device) interrupts, and
> + * cluster for inter processor interrupts.  Such mode has the benefits of not
> + * sharing the vector space with all CPUs on the cluster, while still allowing
> + * IPIs to be more efficiently delivered by not having to perform an ICR write
> + * for each target CPU.
> + */
> +static const struct genapic __initconstrel apic_x2apic_mixed = {
> +    APIC_INIT("x2apic_mixed", NULL),

Newline here please.

> +    /*
> +     * The following fields are exclusively used by external interrupts and
> +     * hence are set to use Physical destination mode handlers.
> +     */
> +    .int_delivery_mode = dest_Fixed,
> +    .int_dest_mode = 0 /* physical delivery */,
> +    .vector_allocation_cpumask = vector_allocation_cpumask_phys,
> +    .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,

And here.

> +    /*
> +     * The following fields are exclusively used by IPIs and hence are set to
> +     * use Cluster Logical destination mode handlers.  Note that init_apic_ldr
> +     * is not used by IPIs, but the per-CPU fields it initializes are only used
> +     * by the IPI hooks.
> +     */
> +    .init_apic_ldr = init_apic_ldr_x2apic_cluster,
> +    .send_IPI_mask = send_IPI_mask_x2apic_cluster,
> +    .send_IPI_self = send_IPI_self_x2apic

Trailing comma please.

> +};
> +
>  static int cf_check update_clusterinfo(
>      struct notifier_block *nfb, unsigned long action, void *hcpu)
>  {
> @@ -220,38 +248,56 @@ static struct notifier_block x2apic_cpu_nfb = {
>  static int8_t __initdata x2apic_phys = -1;
>  boolean_param("x2apic_phys", x2apic_phys);
>  
> +enum {
> +   unset, physical, cluster, mixed
> +} static __initdata x2apic_mode = unset;
> +
> +static int __init parse_x2apic_mode(const char *s)

cf_check

> +{
> +    if ( !cmdline_strcmp(s, "physical") )
> +        x2apic_mode = physical;
> +    else if ( !cmdline_strcmp(s, "cluster") )
> +        x2apic_mode = cluster;
> +    else if ( !cmdline_strcmp(s, "mixed") )
> +        x2apic_mode = mixed;
> +    else
> +        return EINVAL;

-EINVAL ?

> +
> +    return 0;
> +}
> +custom_param("x2apic-mode", parse_x2apic_mode);
> +
>  const struct genapic *__init apic_x2apic_probe(void)
>  {
> -    if ( x2apic_phys < 0 )
> +    /* x2apic-mode option has preference over x2apic_phys. */
> +    if ( x2apic_phys >= 0 && x2apic_mode == unset )
> +        x2apic_mode = x2apic_phys ? physical : cluster;

I know this is just a rearrangement, but IMO it's clearer to follow as:

/* Honour the legacy cmdline setting if it's the only one provided. */
if (  x2apic_mode == unset && x2apic_phys >= 0 )
    ...

There are too many x2apic's in the first comment to read what's going on
at a glance.

~Andrew

