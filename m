Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CDF9B5E53
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 09:59:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827923.1242692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t64Y6-0003Cy-TB; Wed, 30 Oct 2024 08:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827923.1242692; Wed, 30 Oct 2024 08:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t64Y6-0003AV-Qa; Wed, 30 Oct 2024 08:59:30 +0000
Received: by outflank-mailman (input) for mailman id 827923;
 Wed, 30 Oct 2024 08:59:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOPv=R2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t64Y5-0003AP-Uv
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 08:59:29 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42e072c3-969d-11ef-99a3-01e77a169b0f;
 Wed, 30 Oct 2024 09:59:24 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a9a156513a1so994439366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 01:59:24 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1e1a6bfesm556135566b.19.2024.10.30.01.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 01:59:23 -0700 (PDT)
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
X-Inumbo-ID: 42e072c3-969d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmIiLCJoZWxvIjoibWFpbC1lajEteDYyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQyZTA3MmMzLTk2OWQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjc4NzY0Ljk0NzczMywic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730278764; x=1730883564; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UJJL7BbHzklazQyNw54jptkXrs4TvgBkQxtspX9M0BI=;
        b=XQBmdUPfvPstm/SbMkG+QL1bPseAGHZ28IHA04I+xcvh0iVttWQdtIwfgxD3VkIytu
         yKEzRRRaG7Z4UQMF1OQ2sHOzqJvF/Xcq85w5oh+oznf8iMj5UPdd6YBromdoj2IIp1rg
         g4WKj9//PMePOxvocQ2FiE5o8UYyFGwEOQkBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730278764; x=1730883564;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UJJL7BbHzklazQyNw54jptkXrs4TvgBkQxtspX9M0BI=;
        b=P2Jw8/Wkqd2IoveG33ko5VgyFOIxiLSStipaligNCAUb84eHopB38DyyA7ShwMSXMo
         qBKlvsMqgI5pDqDS4NQRsHYyJSnI1j5i64cZFk6rRPeEyOVJuWU43wZpLpnuOylIB+N4
         AN7NRuSE2tJO7yDly26l9GSumXPNwcqjed01yEB/2mwby6/VFFIMEV4NK6E+WFPlzgGW
         9I21yVf9efhuoIdYC/X4HVXFa6/ZRGb25aVYT0vCWiirSxGz3CM5zmesJC6Vyc7lJxg6
         kxFRNIz7NFHuUVG3U+FsULMBDwqTn28F24cioX3TnWP8YCtCnIfOVFTQn5CONVk4CrGi
         DxRQ==
X-Gm-Message-State: AOJu0YzUEm/sAhRhy4xHnWP36YKAzMXmOV0tuRfX1iHJV6nKuNg8ZvHd
	casScMG5fBXP9sGh9I15hrGKp5btyLJnabVUWyY9qR/WDwew+GbFS6UH/30Senk=
X-Google-Smtp-Source: AGHT+IH+6ZGwYDENhUTAH/YrLpCNO26dQ8isy3aF5wkrgKU+NuXFgBshsnXO2xmxcGkEYgcz32JtHA==
X-Received: by 2002:a17:907:971f:b0:a9a:1585:dd3b with SMTP id a640c23a62f3a-a9de5ee1a7fmr1319495066b.21.1730278764179;
        Wed, 30 Oct 2024 01:59:24 -0700 (PDT)
Date: Wed, 30 Oct 2024 09:59:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: Re: [PATCH] x86/cpu-policy: Extend the guest max policy max
 leaf/subleaves
Message-ID: <ZyH1az6sb2wnVxgu@macbook>
References: <20241029175505.2698661-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241029175505.2698661-1-andrew.cooper3@citrix.com>

On Tue, Oct 29, 2024 at 05:55:05PM +0000, Andrew Cooper wrote:
> We already have one migration case opencoded (feat.max_subleaf).  A more
> recent discovery is that we advertise x2APIC to guests without ensuring that
> we provide max_leaf >= 0xb.
> 
> In general, any leaf known to Xen can be safely configured by the toolstack if
> it doesn't violate other constraints.
> 
> Therefore, introduce guest_common_{max,default}_leaves() to generalise the
> special case we currently have for feat.max_subleaf, in preparation to be able
> to provide x2APIC topology in leaf 0xb even on older hardware.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> 
> On a KabyLake I have to hand, here's the delta in what xen-cpuid -p reports:
> 
>   git diff --no-index xen-cpuid-p-{before,after}.log
>   diff --git a/xen-cpuid-p-before.log b/xen-cpuid-p-after.log
>   index 5a76d05..24e22be 100644
>   --- a/xen-cpuid-p-before.log
>   +++ b/xen-cpuid-p-after.log
>   @@ -61,7 +61,7 @@ Host policy: 33 leaves, 2 MSRs
>      index    -> value
>      000000ce -> 0000000080000000
>      0000010a -> 000000000e000c04
>   -PV Max policy: 33 leaves, 2 MSRs
>   +PV Max policy: 58 leaves, 2 MSRs
>     CPUID:
>      leaf     subleaf  -> eax      ebx      ecx      edx
>      00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
>   @@ -75,7 +75,7 @@ PV Max policy: 33 leaves, 2 MSRs
>      0000000d:00000000 -> 00000007:00000000:00000340:00000000
>      0000000d:00000001 -> 00000007:00000000:00000000:00000000
>      0000000d:00000002 -> 00000100:00000240:00000000:00000000
>   -  80000000:ffffffff -> 80000008:00000000:00000000:00000000
>   +  80000000:ffffffff -> 80000021:00000000:00000000:00000000
>      80000001:ffffffff -> 00000000:00000000:00000123:28100800
>      80000002:ffffffff -> 65746e49:2952286c:6f655820:2952286e
>      80000003:ffffffff -> 55504320:2d334520:30333231:20367620
>   @@ -87,7 +87,7 @@ PV Max policy: 33 leaves, 2 MSRs
>      index    -> value
>      000000ce -> 0000000080000000
>      0000010a -> 000000001c020004
>   -HVM Max policy: 35 leaves, 2 MSRs
>   +HVM Max policy: 60 leaves, 2 MSRs
>     CPUID:
>      leaf     subleaf  -> eax      ebx      ecx      edx
>      00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
>   @@ -103,7 +103,7 @@ HVM Max policy: 35 leaves, 2 MSRs
>      0000000d:00000002 -> 00000100:00000240:00000000:00000000
>      0000000d:00000003 -> 00000040:000003c0:00000000:00000000
>      0000000d:00000004 -> 00000040:00000400:00000000:00000000
>   -  80000000:ffffffff -> 80000008:00000000:00000000:00000000
>   +  80000000:ffffffff -> 80000021:00000000:00000000:00000000
>      80000001:ffffffff -> 00000000:00000000:00000123:2c100800
>      80000002:ffffffff -> 65746e49:2952286c:6f655820:2952286e
>      80000003:ffffffff -> 55504320:2d334520:30333231:20367620
> ---
>  xen/arch/x86/cpu-policy.c | 39 +++++++++++++++++++++++++--------------
>  1 file changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
> index b6d9fad56773..78bc9872b09a 100644
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -391,6 +391,27 @@ static void __init calculate_host_policy(void)
>      p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
>  }
>  
> +/*
> + * Guest max policies can have any max leaf/subleaf within bounds.
> + *
> + * - Some incoming VMs have a larger-than-necessary feat max_subleaf.
> + * - Some VMs we'd like to synthesise leaves not present on the host.
> + */
> +static void __init guest_common_max_leaves(struct cpu_policy *p)
> +{
> +    p->basic.max_leaf       = ARRAY_SIZE(p->basic.raw) - 1;
> +    p->feat.max_subleaf     = ARRAY_SIZE(p->feat.raw) - 1;
> +    p->extd.max_leaf        = 0x80000000U + ARRAY_SIZE(p->extd.raw) - 1;
> +}
> +
> +/* Guest default policies inherit the host max leaf/subleaf settings. */
> +static void __init guest_common_default_leaves(struct cpu_policy *p)
> +{
> +    p->basic.max_leaf       = host_cpu_policy.basic.max_leaf;
> +    p->feat.max_subleaf     = host_cpu_policy.feat.max_subleaf;
> +    p->extd.max_leaf        = host_cpu_policy.extd.max_leaf;
> +}

I think this what I'm going to ask is future work.  After the
modifications done to the host policy by max functions
(calculate_{hvm,pv}_max_policy()) won't the max {sub,}leaf adjustments
better be done taking into account the contents of the policy, rather
than capping to the host values?

(note this comment is strictly for guest_common_default_leaves(), the
max version is fine using ARRAY_SIZE).

Thanks, Roger.

