Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D64BDB2CBCF
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 20:24:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086958.1445120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoR05-0004bZ-7Q; Tue, 19 Aug 2025 18:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086958.1445120; Tue, 19 Aug 2025 18:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoR05-0004ZV-3j; Tue, 19 Aug 2025 18:24:01 +0000
Received: by outflank-mailman (input) for mailman id 1086958;
 Tue, 19 Aug 2025 18:24:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h/XH=27=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uoR04-0004ZP-GD
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 18:24:00 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac8b7175-7d29-11f0-a32a-13f23c93f187;
 Tue, 19 Aug 2025 20:23:59 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3bb30c72433so1903471f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Aug 2025 11:23:59 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b42a97c02sm54800675e9.23.2025.08.19.11.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 11:23:57 -0700 (PDT)
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
X-Inumbo-ID: ac8b7175-7d29-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755627838; x=1756232638; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/HqCqQjPQM0UofdHnvsNAQ8zMX7BE4Zl71l3xB7c6I0=;
        b=JrQ6JAmY2ZsM3SaMeGCcUcSx0qImqbVCe2Y7MZa6nbhWifa8OpqCnUFuXkwtQrXKfX
         avW/L/t8l4TQOt9GgQX35A+JrBgVxQuGHmJpNq+igviCxVUtTcZTGKaeO6FMqS7DYRGo
         iOQYHK2TwYHBmF2hkFiSwwdBSDv0SZgbpD9ts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755627838; x=1756232638;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HqCqQjPQM0UofdHnvsNAQ8zMX7BE4Zl71l3xB7c6I0=;
        b=W9em8LZKfWi3zxthmGvIC89NRSfvSQJXNNWU3WqU6T27zU+KEV+XRr/lfP6rpN2po+
         qLX3QWSGp1slq81/ubNmCdf38zgVpa9F7rVI0oYyVZs59fYYNe9jJeg8vHEqr2bE0EXs
         MEpniIG9cnK8R9x0LpYM1TLu0nWvbvlWscPwr3rkhTOQ64Qwoh66qc6hNa7HHtPSQcXt
         0D/LAkR6iyNd/T1Wgm601A2/6HW2Kv9E7g/QiSA+bIcATdGWwbb3av+zClTKsQ/bv2lz
         Tx45SAYqLBXl2jvFCNMXR0jOpJyaok/pP4LlUoFORl/wjmOJADp0o9o7jK458/JXmumx
         frtw==
X-Forwarded-Encrypted: i=1; AJvYcCUzGVwWHbW7eQbZbDsIwRowP7a3fgcOydrgTvw2H/oeFRSsGVFvjJfRQBbLA2R3Xv/OkU6tD/eYqVM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxxby71eFrvO3dGXA0lx58aEnJMHAT3W/qOxW0JO2K8TuQP2ZXT
	/d77NkIr10TF2Op6OxiqdSzt10x2Y3TetPLqP3Ux9nCwwmRHse9vW+buLbUpl1UhcOYToojtPIR
	D5dhn
X-Gm-Gg: ASbGnctwj801TW2rE9RUZ1xNgK9eXdpij6BO6TQii7XCY2RXIuyoGHUmMEmzs7CbMc0
	brluaVQMENVpC3+c3g+XcoprOhIBUjUwWvFXBGPav76ZPn8rPs5Gx2WQSM6FtD3l+m50vcS/OBw
	5QJhGMJFrx+agz3JGE93FcBOQjzzsHdjMrSRKVbBgDCv/boMlyJJ0jPkrlqT3XjhMZ7CYf62X26
	AvHK2hlUDwBJ8Cc1kT3ZaIE1Zy9vFK48eqX/Ifri2AOD3aNF4wt4yyrCKMD2JyywGXZq2oaZ39A
	jd2tHSdPxDpBJvmrkfG3jUgRz3dvWLUlNGNa90+Vl3UFEX3WSKeUNTMcf0Wx4iWxyWgeeIRqhbc
	8ANp92xws0sl5mWbqw0RDI2YxLxTqqjZuOXAAQ2VMRacf5Vu4CI+kgmq5PCclNo4ADskPGS0ebe
	l5ogM=
X-Google-Smtp-Source: AGHT+IHSw3mQYQM81KhX/bYTCGBeiJYXuG2QjR6E+SNk7nWFQL3i48NLQrY1aTSlqudO2MKOqCGBRw==
X-Received: by 2002:a05:6000:430e:b0:3b9:16e5:bd36 with SMTP id ffacd0b85a97d-3c32c9117aamr28174f8f.15.1755627838424;
        Tue, 19 Aug 2025 11:23:58 -0700 (PDT)
Message-ID: <6852c430-155c-4530-8aa6-67a6e97ef6b3@citrix.com>
Date: Tue, 19 Aug 2025 19:23:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/iommu: setup MMCFG ahead of IOMMU
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20250819171826.60700-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250819171826.60700-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/08/2025 6:18 pm, Roger Pau Monne wrote:
> Otherwise the PCI accesses to segments different than the first one done by
> the IOMMU initialization code would silently fail by returning all ones.
>
> Introduce a new helper, called pci_setup(), and move both the creation of
> PCI segment 0 internal data structures, plus the parsing of ACPI MMCFG
> table to it.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

And moving acpi_mmcfg_init() slightly earlier from acpi_boot_init() into
pci_setup().

> diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
> index 26bb7f6a3c3a..e75a29e851a7 100644
> --- a/xen/arch/x86/pci.c
> +++ b/xen/arch/x86/pci.c
> @@ -139,6 +142,19 @@ int pci_sanitize_bar_memory(struct rangeset *r)
>      return 0;
>  }
>  
> +void __init pci_setup(void)
> +{
> +    /*
> +     * Ahead of any ACPI table parsing make sure we have control structures
> +     * for PCI segment 0.
> +     */
> +    if ( pci_add_segment(0) )
> +        panic("Could not initialize PCI segment 0\n");
> +
> +    /* Parse ACPI MMCFG ahead of IOMMU, so accesses to segments > 0 is setup. */

"ahead of IOMMU" isn't helpful here because the relevant context is in
the caller.  Instead, I'd just say:

/* Parse ACPI MMCFG to see if other segments are available. */

> +    acpi_mmcfg_init();
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 6fb42c5a5f95..bd648323bfed 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1938,11 +1938,10 @@ void asmlinkage __init noreturn __start_xen(void)
>      setup_system_domains();
>  
>      /*
> -     * Ahead of any ACPI table parsing make sure we have control structures
> -     * for PCI segment 0.
> +     * Initialize PCI (create segment 0, setup MMCFG access) ahead of IOMMU
> +     * setup, as it requires access to the PCI config space.
>       */

Again, this isn't terribly clear IMO.

"ahead of IOMMU setup, as the IOMMUs might not all live on segment 0." ?


> -    if ( pci_add_segment(0) )
> -        panic("Could not initialize PCI segment 0\n");
> +    pci_setup();
>  
>      /*
>       * IOMMU-related ACPI table parsing has to happen before APIC probing, for
> diff --git a/xen/arch/x86/x86_64/mmconfig-shared.c b/xen/arch/x86/x86_64/mmconfig-shared.c
> index f1a3d42c5b21..fbe2676f8636 100644
> --- a/xen/arch/x86/x86_64/mmconfig-shared.c
> +++ b/xen/arch/x86/x86_64/mmconfig-shared.c
> @@ -402,6 +402,9 @@ void __init acpi_mmcfg_init(void)
>  {
>      bool valid = true;
>  
> +    if ( acpi_disabled )
> +        return;

This is fine for the patch, making things consistent with the prior
behaviour.

However, I think it's well gone time we drop support for pre-APCI
systems, including things like acpi_disabled, etc.

Nothing good can possibly come of these codepaths these days.

~Andrew

