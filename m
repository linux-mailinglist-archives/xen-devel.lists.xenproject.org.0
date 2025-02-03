Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A229A2557A
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 10:09:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880505.1290577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tesSQ-0004Xd-QK; Mon, 03 Feb 2025 09:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880505.1290577; Mon, 03 Feb 2025 09:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tesSQ-0004WB-Nb; Mon, 03 Feb 2025 09:09:30 +0000
Received: by outflank-mailman (input) for mailman id 880505;
 Mon, 03 Feb 2025 09:09:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tesSO-0004W3-Vg
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 09:09:28 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91c7d98a-e20e-11ef-a0e7-8be0dac302b0;
 Mon, 03 Feb 2025 10:09:27 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5dc7eba78e6so7412421a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 01:09:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc724a9ed8sm7163244a12.61.2025.02.03.01.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 01:09:26 -0800 (PST)
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
X-Inumbo-ID: 91c7d98a-e20e-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738573767; x=1739178567; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P56XFqIvCkrbxFdjJ26YM3I21vQGATz+C/FgBXmIiDc=;
        b=GlgN0Ma7+VNFMuCtBl1WnLko12sanPJloSgxYiDjAPA37xpKPiLSMIDA6O3pKH9JEA
         1HF1/itA12jqpxk8oihNLOQSuEc0Vi4CjbhOf7f+II+qlNgq2NhM+r3lDC7P72Ck1VQu
         6SPsYnJASSvFKKwxChWxB2yFBVlK1diutC1Gxj+IrNIC4KxcFerZ/tOlFUnS+03T1X2y
         HvMP11ay09dl1N716jh0rzjYjYPuU0GhpgpOGVziG6hPxf1BH6igyMp0kDWAhLy9fZ1E
         9q102N1NKMiJuxKj8KKCZKJ/AgXaMAePr3kTRhmNMuIRuE0X/f34iODilSaADF6NcIFz
         y76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738573767; x=1739178567;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P56XFqIvCkrbxFdjJ26YM3I21vQGATz+C/FgBXmIiDc=;
        b=CQh4tTtF0Bx7j62XrvvLv0kPRst78AB5qQMYerljdvAakILOvXONcTFCckC394xlCo
         jIZjrs/CJ24QB2J0eEtFKz7hbFzCCi4ZfnPUYO2/dGbSvsydtBiS4mJ8eR/XLvEgzPeC
         TB4PYV181I7AQiy2dLE3U5OrVW4a7W8itKXecnxIcJy/mLOBrG7kE0LRJaMbVexg5mdO
         Y8A2S0xWtjg6nRTDtZHLqW5YUZnqwZld89EYQwLIGTYVTvLaAvxp46VFg7Znivc7j7+y
         z9S99/EbW92EIki8ov5wowG3dcXzi4mF0hp1QkZi5fGborXkQm9NcIu+pUTyfDKziCe0
         Fvtw==
X-Forwarded-Encrypted: i=1; AJvYcCWLBMbfHVJ3RuYeiPKtWMDneWjYvyEzF3P9jZBL6BYvnF8MWAbrPYQDCdRGwNRUt9w34orilG1+i7M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyT5a6JkrND2FCFc24AQekjQckISHfINYoTkzeU2OFmB3e4EOai
	P2ptiGSfKS/j8E3pu4hyDhCu6j4X4iAhd5SQWHvL0/AkaX8asHAh6oBPvB1GcQ==
X-Gm-Gg: ASbGncv7xePgJYR6WSpBiGTLXmZEi6Ks84VJAZyktynNhchre8ZukOh7xa3lkj8/9Hb
	iHT4Mq7UNn+0s6vYltmAz9Eimf8EvCjlOQCbVAqpit3N+wgIsHkxdj/rt+A3sFdKnyfWt+3Tql4
	uN/m41vheHhU0LuW6OZvI3fiJnOmQUT/8sGL1/BXMHW2LnN3gnucyTBHv2di33BmKamQW9q+Z41
	/TiugFVNXyh6evCf8rl1OD+Mcx+73yCR4spXF6IslBRsoPlzz3Q2AAmlXzUE6/YfccnfkC7fhj7
	+82YmLEwcGFBpHCgcwaITJX3C3iIhJRJNc3djag9daE/X9nRP/mR88yxiaWV9WYgFX69FImHUno
	k
X-Google-Smtp-Source: AGHT+IGoqeqO6M3koYfByU9y9LJSfO3KEXMCeJJ173dizrk4hTiPrswZt2xxbphKfG4w9BMrU7nqow==
X-Received: by 2002:a05:6402:d0d:b0:5d8:211a:4d59 with SMTP id 4fb4d7f45d1cf-5dc5efc6899mr23840833a12.19.1738573766968;
        Mon, 03 Feb 2025 01:09:26 -0800 (PST)
Message-ID: <114b766d-c68d-4644-90ad-bd120bd54434@suse.com>
Date: Mon, 3 Feb 2025 10:09:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 2/3] x86/PCI: init segments earlier
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2bb9d3c4-0761-4d63-8193-29293e35eb04@suse.com>
 <940ccd1b-9ad8-4b68-a035-36f45326872b@suse.com>
 <a4cc2c27-ed02-4453-9730-09d532b3edad@citrix.com>
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
In-Reply-To: <a4cc2c27-ed02-4453-9730-09d532b3edad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.02.2025 15:46, Andrew Cooper wrote:
> On 30/01/2025 11:12 am, Jan Beulich wrote:
>> In order for amd_iommu_detect_one_acpi()'s call to pci_ro_device() to
>> have permanent effect, pci_segments_init() needs to be called ahead of
>> making it there. Without this we're losing segment 0's r/o map, and thus
>> we're losing write-protection of the PCI devices representing IOMMUs.
>> Which in turn means that half-way recent Linux Dom0 will, as it boots,
>> turn off MSI on these devices, thus preventing any IOMMU events (faults
>> in particular) from being reported on pre-x2APIC hardware.
>>
>> As the acpi_iommu_init() invocation was moved ahead of
>> acpi_mmcfg_init()'s by the offending commit, move the call to
>> pci_segments_init() accordingly.
>>
>> Fixes: 3950f2485bbc ("x86/x2APIC: defer probe until after IOMMU ACPI table parsing")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Of course it would have been quite a bit easier to notice this issue if
>> radix_tree_insert() wouldn't work fine ahead of radix_tree_init() being
>> invoked for a given radix tree, when the index inserted at is 0.
>>
>> While hunting down various other dead paths to actually find the root
>> cause, it occurred to me that it's probably not a good idea to fully
>> disallow config space writes for r/o devices: Dom0 won't be able to size
>> their BARs (luckily the IOMMU "devices" don't have any, but e.g. serial
>> ones generally will have at least one), for example. Without being able
>> to size BARs it also will likely be unable to correctly account for the
>> address space taken by these BARs. However, outside of vPCI it's not
>> really clear to me how we could reasonably emulate such BAR sizing
>> writes - we can't, after all, allow Dom0 to actually write to the
>> underlying physical registers, yet we don't intercept reads (i.e. we
>> can't mimic expected behavior then).
>>
>> --- a/xen/arch/x86/x86_64/mmconfig-shared.c
>> +++ b/xen/arch/x86/x86_64/mmconfig-shared.c
>> @@ -402,8 +402,6 @@ void __init acpi_mmcfg_init(void)
>>  {
>>      bool valid = true;
>>  
>> -    pci_segments_init();
>> -
>>      /* MMCONFIG disabled */
>>      if ((pci_probe & PCI_PROBE_MMCONF) == 0)
>>          return;
>> --- a/xen/drivers/passthrough/x86/iommu.c
>> +++ b/xen/drivers/passthrough/x86/iommu.c
>> @@ -55,6 +55,8 @@ void __init acpi_iommu_init(void)
>>  {
>>      int ret = -ENODEV;
>>  
>> +    pci_segments_init();
>> +
>>      if ( !iommu_enable && !iommu_intremap )
>>          return;
>>  
>>
> 
> I can't help but feel this is taking a bad problem and not making it any
> better.
> 
> pci_segments_init() is even less (obviously) relevant in
> apci_iommu_init() than it is in acpi_mmcfg_init(), and given the
> fine-grain Kconfig-ing going on, is only one small step from
> accidentally being compiled out.

The alternative I did consider was to move the call into __start_xen()
itself. Anything going beyond that looks more intrusive than we'd like
it at this point of the release cycle.

> ARM is in a bad state too, with this initialisation even being behind
> the PCI Passthrough cmdline option.
> 
> IMO there are two problems here; one as you pointed out
> (radix_tree_insert() doesn't fail), and that PCI handling requires
> explicit initialisation to begin with.
> 
> Looking through radix tree, it wouldn't be hard to create a
> RADIX_TREE_INIT macro to allow initialisation at compile time for
> suitable objects (pci_segments and acpi_ivrs currently).
> 
> That involves exporting rcu_node_{alloc,free}(), although the last
> caller of radix_tree_set_alloc_callbacks() was dropped when TMEM went,
> so we could reasonably remove that infrastructure too, at which point
> radix_tree_init() is a simple zero of the structure.

Yes, seeing that this was even an extension of ours (i.e. Linux doesn't
have such), it's certainly worth getting rid of. If nothing else, then
for the two cf_check annotations that's we'd then be able to drop. I'll
make a patch.

> Dealing with alloc_pseg(0) is harder.  As we never free the PCI
> segments, we could just opencode the radix_tree_root of height=1 with a
> static pseg0 structure, and that would drop the need for
> pci_segemnts_init() completely.

I'm afraid this would end up being too much open-coding for my taste.

I'd put this differently: Unlike the radix tree initialization, the
setting up of segment 0 isn't a prereq to acpi_iommu_init(). We could
keep acpi_mmcfg_init() doing that, by way of calling pci_add_segment(0)
(and that would simply be a no-op if acpi_iommu_init() ended up
introducing segment 0 already).

Jan

