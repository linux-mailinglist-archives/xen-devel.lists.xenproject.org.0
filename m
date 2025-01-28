Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9556A21013
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 19:00:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878734.1288928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcpsJ-0006ma-5c; Tue, 28 Jan 2025 17:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878734.1288928; Tue, 28 Jan 2025 17:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcpsJ-0006k5-34; Tue, 28 Jan 2025 17:59:47 +0000
Received: by outflank-mailman (input) for mailman id 878734;
 Tue, 28 Jan 2025 17:59:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00fH=UU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tcpsI-0006jw-JH
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 17:59:46 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a825a812-dda1-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 18:59:45 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aaf57c2e0beso1191709266b.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 09:59:45 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e124fasm820827466b.22.2025.01.28.09.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 09:59:44 -0800 (PST)
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
X-Inumbo-ID: a825a812-dda1-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738087185; x=1738691985; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+bT13YwSCmbqd57Ai80c9Ct3aDWgaPvXeyrjPEKM4U8=;
        b=dlcvq0tmSk2NChQyRIrn72YZQjtR50jLqp1uD6kC14ZjNgrGBa5MZgVFuqRAhwDf4V
         xdlmaogduOpR4nXcaDbnXM/DmE1r3Io13Ps+pYwWW6uizFxD5YSSR+jeALPSeGGLr2KI
         FClk5BW9e2TGt4fvm3FMcC1EJ1jEtiwZ5o6YU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738087185; x=1738691985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bT13YwSCmbqd57Ai80c9Ct3aDWgaPvXeyrjPEKM4U8=;
        b=iAFQlJE4Vyb4djUJUC78lxuWekF3UP4ZOTOXNDPbYklIsoodubs0BQ2R3/1loqauOS
         B9oOul3FuyeNosYDAetgaNzH9DvjCnL7HZFgIEFCFGscPxZpuxWSscCBXzrQsOlrsjQF
         pfUb7bXDHe4ijFSSjmvemn2xgGd4MP9dEnzJ3fjPytNXEcDtn3dhDLb4HVAFF8u1jPRP
         wM46rF39UbQy1Iwz7gVdV0OeK/EtXMFiOUQ2CozfdZeAzCcnZ/cgo++hkcISNWfjGCRx
         4FdYFQrJGcMrENyy/7y2bUL0JawQH5cq0GevvhwOcJwr25LXsmT7FDIwcJG4hXJjnFhq
         i5HA==
X-Gm-Message-State: AOJu0Yzs1sGafZzcnWno918duFOWBrNgb9JmicctUGUiQo/mN3DOfz0O
	S8FWjw8Tw1rxHZXjA7iUz3gn/VhGtU5WqDNZV/vvKUcuM87aANLOnvXPSGrzG9k=
X-Gm-Gg: ASbGncviwZSQiEZ8E+hZ0KoDumM67LtW0mhdYdo5kX+zz5VRlxAzIDZp+nwqElI+36H
	Usu7+AF45jv5lDafpWKBy9lnAkpo39nsPW8FsHC8HbyWL4sb4mKSVphrhR7VE0D24kjmtHQutl2
	1WxnDszBxAimQ9r7alMhsGjyXxiXK8yVxDZJQkwqsdQV2hf2z4Jcspe1dlc9w1xFexwtEH61dc2
	sKPab5FGcRDrZGhCoWX+iQuQBWK7WX9maiBfOPddzM1xAtXCe2OssJaFufCr1baOPnx8YdyOJEw
	TA3qV1ZZNjGjXLt3SBrv
X-Google-Smtp-Source: AGHT+IEQUCFPNNnXoO2yaDC0IClurJDA6SchU18icLWmn9JLnYSTfKaJb4eIO+uMO6gq46LcImil0w==
X-Received: by 2002:a17:907:961a:b0:aac:619:7ed8 with SMTP id a640c23a62f3a-ab6cfc86accmr8975366b.7.1738087184793;
        Tue, 28 Jan 2025 09:59:44 -0800 (PST)
Date: Tue, 28 Jan 2025 18:59:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 1/3] tools/hvmloader: Retrieve (x2)APIC IDs from the APs
 themselves
Message-ID: <Z5kbD08TFyH0hwwF@macbook.local>
References: <20250128163342.1491-1-alejandro.vallejo@cloud.com>
 <20250128163342.1491-2-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250128163342.1491-2-alejandro.vallejo@cloud.com>

On Tue, Jan 28, 2025 at 04:33:40PM +0000, Alejandro Vallejo wrote:
> Make it so the APs expose their own APIC IDs in a lookup table (LUT). We
> can use that LUT to populate the MADT, decoupling the algorithm that
> relates CPU IDs and APIC IDs from hvmloader.
> 
> Modified the printf to also print the APIC ID of each CPU, as well as
> fixing a (benign) wrong specifier being used for the vcpu id.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> Changes from the v7 version of this patch in the longer topology series:
>   * s/cpu_to_x2apicid/cpu_to_apicid/
>     * Though, as I already stated, I don't think this is a good idea.
>   * Dynamically size cpu_to_apicid rather than using HVM_MAX_VCPUS.
>   * Got rid of the ap_callin removal. It's not as trivial if we don't
>     want to assume cpu0 always has apicid=0. Part of the complaints on
>     the previous versions involved the inability to do that.
>   * For debugging sanity, I've added the apicid to the CPU boot printf.
>       * Later on, toolstack will choose the APIC IDs and it's helpful
>         to know the relationship in the logs.
>       * While at it, fix the vcpu specifier s/%d/%u/
>   * Check for leaf 0xb while probing for x2apic support.
> ---
>  tools/firmware/hvmloader/smp.c | 43 +++++++++++++++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/firmware/hvmloader/smp.c b/tools/firmware/hvmloader/smp.c
> index 1b940cefd071..c61ed524f947 100644
> --- a/tools/firmware/hvmloader/smp.c
> +++ b/tools/firmware/hvmloader/smp.c
> @@ -31,9 +31,38 @@
>  
>  static int ap_callin;
>  
> +/** True if x2apic support is exposed to the guest. */
> +static bool has_x2apic;
> +
> +/**
> + * Lookup table of (x2)APIC IDs.

Not sure you need to explicitly mention (x2) in the comment?  It will
either be xAPIC or x2APIC IDs, but just using "APIC IDs" should cover
both unambiguously?

> + *
> + * Each entry is populated for its respective CPU as they come online. This is
> + * required for generating the MADT with minimal assumptions about ID
> + * relationships.
> + */
> +uint32_t *cpu_to_apicid;
> +
> +static uint32_t read_apic_id(void)
> +{
> +    uint32_t apic_id;
> +
> +    if ( has_x2apic )
> +        cpuid(0xb, NULL, NULL, NULL, &apic_id);
> +    else
> +    {
> +        cpuid(1, NULL, &apic_id, NULL, NULL);
> +        apic_id >>= 24;
> +    }
> +
> +    return apic_id;
> +}
> +
>  static void cpu_setup(unsigned int cpu)
>  {
> -    printf(" - CPU%d ... ", cpu);
> +    uint32_t apicid = cpu_to_apicid[cpu] = read_apic_id();
> +
> +    printf(" - CPU%u[%u] ... ", cpu, apicid);

I would explicitly name the field in the print:

" - CPU%u APIC ID %u ... "

As otherwise it's not obvious what the value in the braces is (and you
have to go look at the code).

>      cacheattr_init();
>      printf("done.\n");
>  
> @@ -104,8 +133,20 @@ static void boot_cpu(unsigned int cpu)
>  void smp_initialise(void)
>  {
>      unsigned int i, nr_cpus = hvm_info->nr_vcpus;
> +    uint32_t ecx, max_leaf;

Noticed you could narrow the scope of ecx, but at the price of
introducing the definition line inside of the if condition.  I don't
have a strong opinion, and I assume you prefer it this way, which is
fine IMO.

Thanks, Roger.

