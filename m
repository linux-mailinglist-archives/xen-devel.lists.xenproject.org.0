Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DC7A22D24
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 14:00:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879520.1289723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdU99-00027X-UK; Thu, 30 Jan 2025 12:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879520.1289723; Thu, 30 Jan 2025 12:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdU99-00025f-RH; Thu, 30 Jan 2025 12:59:51 +0000
Received: by outflank-mailman (input) for mailman id 879520;
 Thu, 30 Jan 2025 12:59:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdU97-00025X-JX
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 12:59:49 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15798fbe-df0a-11ef-a0e6-8be0dac302b0;
 Thu, 30 Jan 2025 13:59:47 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5d3f28881d6so982498a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 04:59:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc7240487csm1034743a12.34.2025.01.30.04.59.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 04:59:46 -0800 (PST)
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
X-Inumbo-ID: 15798fbe-df0a-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738241987; x=1738846787; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wwVeJj4CxR7oTo3eqhOfTKhj7jWcIGyhA+/cpoWWkXY=;
        b=LDEiM1Vo6NM/urnyExr+Cxk0TkxmfYwSrBoJAYbWm8Zx2g18KM+OrsodfqoHCqiMQu
         I9E3cQW74LZvKP1HjIvSYzP6TUa454UqpkhbFzP8LxVYDdsSTF39EO2et7KUPKRnUK6h
         NDtj9KgdC+CB8rOV2OknljPt9h5LOZFECHK8bHeVQ+uer/chT0eTxVDTd33vRtSgm5Ul
         mHx+wlIEJTEEGPJcupaTMUosQTuyO4JUWiQXdFMiNCrtLVo/SWPVyVRbENipwS9VZ/8M
         hCdGf0CXM/kk+fvEMSoyRpJs965hVoTo2w7h0D9xca98Ew9PVHBDpkdkJOgDrW1Y6YA6
         /fww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738241987; x=1738846787;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwVeJj4CxR7oTo3eqhOfTKhj7jWcIGyhA+/cpoWWkXY=;
        b=TyseVTdRJLGxfR919uFV/nFrMcnmssw9TV4EZ22Vx1J2sEUIrJPXzMhDPgOUBxrBuj
         KolBYN899TcM+m/eTk4SBAnxxbaMyUZkNQQXGZoHL6oJ1/WbVOA29z9IW66Rf3YeOV2B
         oh3GPn20tEyDyx3dw+axY1JCKt6G0bzL3mpGyKhsDdTasEPxCcd0IAfWpeSEEfGuhMK7
         jpP6mGTvCBb5Zq0L5e8z3v8gqJGGmLImqjas4JGsWLiyvzYi4FmB5UnYInK7pnu4XvxK
         /qdHSkacGurRT2bFbSh844Pr6sgJpF08ElqjwqywnvEM1q1RMQXy5e8WFFvHFBNTem85
         OUOg==
X-Forwarded-Encrypted: i=1; AJvYcCUdQtRDJDLODTPw7VbDvUjyAf+3VnaS5Mn82ZCtrnmKYNtzaM9vkbXp4984jXWdTFUGxf5WvkfL5S4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnjsmVgOJV59+WL3PXogInKWmnCTdyiddgPKIK5oJtsqLbtZr2
	nk0I8P5IvuUth28UBXtaM4k8uH6O9pYsINENZFJ0m7Yd7U2VP1MRpjS3hw6fMpo3HU6Ov9YD+y8
	=
X-Gm-Gg: ASbGncs/3naOVUsM/ofEnxMfmW8KVARX63bSvxkW0LjxsGKrFTxM3UhcvSoztfhwZVB
	jW7eKEHCpfYLtcBYuFuo5UpuJcmKYpYrphbZTIksAovDWSTt+0FdGoPk15OzHCgTHkz1nJCMhoj
	V8t0BWy6abyJnkCg5nGsmsLTS0RvHemkAZwAxisVpMQDCAofsk0RI+NATDy9+GlgH4uoHMDPbZI
	x+E2POhsR5YAAFWq2gbSBmZ3n44qW5nEfw/P8kiW8/VG4q/NREvIYPcbkRZEDoW5XY+tcM9S3k0
	WuTx0egxUb5xyNW65I+32uD4BCzyETHi6eldx/A9Xz3XtjusrG4D2W0oytEj0aR/41ae627+zHB
	T
X-Google-Smtp-Source: AGHT+IHLqJ78fXRkDAONZaCq2vBnZbryfWrBDathI8Gg2BbCXrEtWn5wkGhghg36F8nnywiiut2HYw==
X-Received: by 2002:a05:6402:278f:b0:5d3:ba42:e9e3 with SMTP id 4fb4d7f45d1cf-5dc5efbf53dmr17741131a12.13.1738241986825;
        Thu, 30 Jan 2025 04:59:46 -0800 (PST)
Message-ID: <86fba4ae-5a54-4fc0-bdaa-290332462cbf@suse.com>
Date: Thu, 30 Jan 2025 13:59:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] tools/hvmloader: Replace LAPIC_ID() with
 cpu_to_apicid[]
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20250128163342.1491-1-alejandro.vallejo@cloud.com>
 <20250128163342.1491-3-alejandro.vallejo@cloud.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20250128163342.1491-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.01.2025 17:33, Alejandro Vallejo wrote:
> Replace uses of the LAPIC_ID() macro with accesses to the
> cpu_to_apicid[] lookup table. This table contains the APIC IDs of each
> vCPU as probed at runtime rather than assuming a predefined relation.
> 
> Moved smp_initialise() ahead of apic_setup() in order to initialise
> cpu_to_apicid ASAP and avoid using it uninitialised. Note that bringing
> up the APs doesn't need the APIC in hvmloader becasue it always runs
> virtualized and uses the PV interface.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> Changes from v7 of the longer topology series:
>   * Removed ASSERT() for the MP tables and merely skipped writing them
>     if any vCPU has an APIC ID >=255.

Throughout the patch I can't anything matching this; ...

> --- a/tools/firmware/hvmloader/config.h
> +++ b/tools/firmware/hvmloader/config.h
> @@ -48,8 +48,9 @@ extern uint8_t ioapic_version;
>  
>  #define IOAPIC_ID           0x01
>  
> +extern uint32_t *cpu_to_apicid;
> +
>  #define LAPIC_BASE_ADDRESS  0xfee00000
> -#define LAPIC_ID(vcpu_id)   ((vcpu_id) * 2)
>  
>  #define PCI_ISA_DEVFN       0x08    /* dev 1, fn 0 */
>  #define PCI_ISA_IRQ_MASK    0x0c20U /* ISA IRQs 5,10,11 are PCI connected */
> --- a/tools/firmware/hvmloader/hvmloader.c
> +++ b/tools/firmware/hvmloader/hvmloader.c
> @@ -224,7 +224,7 @@ static void apic_setup(void)
>  
>      /* 8259A ExtInts are delivered through IOAPIC pin 0 (Virtual Wire Mode). */
>      ioapic_write(0x10, APIC_DM_EXTINT);
> -    ioapic_write(0x11, SET_APIC_ID(LAPIC_ID(0)));
> +    ioapic_write(0x11, SET_APIC_ID(cpu_to_apicid[0]));
>  }
>  
>  struct bios_info {
> @@ -341,11 +341,11 @@ int main(void)
>  
>      printf("CPU speed is %u MHz\n", get_cpu_mhz());
>  
> +    smp_initialise();
> +
>      apic_setup();
>      pci_setup();
>  
> -    smp_initialise();
> -
>      perform_tests();
>  
>      if ( bios->bios_info_setup )
> --- a/tools/firmware/hvmloader/mp_tables.c
> +++ b/tools/firmware/hvmloader/mp_tables.c
> @@ -199,7 +199,7 @@ static void fill_mp_config_table(struct mp_config_table *mpct, int length)
>  static void fill_mp_proc_entry(struct mp_proc_entry *mppe, int vcpu_id)
>  {
>      mppe->type = ENTRY_TYPE_PROCESSOR;
> -    mppe->lapic_id = LAPIC_ID(vcpu_id);
> +    mppe->lapic_id = cpu_to_apicid[vcpu_id];
>      mppe->lapic_version = 0x11;
>      mppe->cpu_flags = CPU_FLAG_ENABLED;
>      if ( vcpu_id == 0 )
> --- a/tools/firmware/hvmloader/util.c
> +++ b/tools/firmware/hvmloader/util.c
> @@ -827,7 +827,7 @@ static void acpi_mem_free(struct acpi_ctxt *ctxt,
>  
>  static uint32_t acpi_lapic_id(unsigned cpu)
>  {
> -    return LAPIC_ID(cpu);
> +    return cpu_to_apicid[cpu];
>  }
>  
>  void hvmloader_acpi_build_tables(struct acpi_config *config,

... no conditional is being added anywhere. What am I missing?

Thing is - this way I'm uncertain whether the wording above is
imprecise, or whether I should really ask that we continue to write all
entries with at most 8-bit-wide APIC IDs, omitting just those with
wider ones.

Jan

