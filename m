Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6A5A25EC1
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 16:31:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880702.1290780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teyPk-0001iI-9q; Mon, 03 Feb 2025 15:31:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880702.1290780; Mon, 03 Feb 2025 15:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teyPk-0001ff-6y; Mon, 03 Feb 2025 15:31:08 +0000
Received: by outflank-mailman (input) for mailman id 880702;
 Mon, 03 Feb 2025 15:31:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9wUg=U2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1teyPh-0001fZ-W7
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 15:31:06 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0356b02-e243-11ef-a0e7-8be0dac302b0;
 Mon, 03 Feb 2025 16:31:02 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso27904285e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 07:31:02 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e245f492sm157397605e9.38.2025.02.03.07.31.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 07:31:01 -0800 (PST)
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
X-Inumbo-ID: e0356b02-e243-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738596662; x=1739201462; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o4y7RKcH4ES8YRgtSUBEzEuPXY5O9ttzmk1Tn46cRQk=;
        b=RzauVGdrVmPmqVZllCpypVb59OsIdFDvk2Z3uKhnIfRsi3uWpynELmcqAir5F/D9Ck
         UuPH7pwtfeMjrgPviAdrtfPJgrajdrDgZkxht12R0ekJvAtA+crfUjdBsUIw2EGADO8F
         /QKp89gyN+d5azHj5lM3Bdn/xTUp4a5rvT0qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738596662; x=1739201462;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4y7RKcH4ES8YRgtSUBEzEuPXY5O9ttzmk1Tn46cRQk=;
        b=e2yr1hErgMzBALm8nd+RaOo6+7fLpTrAZ/GaEOoHiOQVMNonEWlAL3sdWwDMcbeC0e
         yMOqycmrunFeHwQ6sPj5LYmSWooIQezFv8I3wqr0sh0gtBSFs9sa+IZOSVcLYYKz2QWb
         QfwjXPOJp3LVesfmKulAdv4/2qu2JvhixgZIDlfNp3HLsHggPTV06oxnbeP1ck4gn5fr
         Vo6zOCeIdkW12m+66im/FEBtIEE5a+37TtFsGYbvWSjdKA7s5z8sGqP8AfcSm44oakGO
         qyHeHMQJRxFYbzsR+MuiZDokD4AgACFPMukLMPbttNfeCObV84pMwg4uuscxenF8rUN9
         rdrg==
X-Forwarded-Encrypted: i=1; AJvYcCUHJTtEedoD4G10c54CA7P++zopM/YtA2zT7q0qVRVOVtUM3JrH4vHU53DOpt49HBQHSdIes295Y+4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVBPbre3MsHrEq/oIV9MK0Jc6cID3zAFPBakJirLs+6zIfizdV
	p/Cp0Y/8pObw4R1Y8vJ8DKXnW0VmyZxfM5N4KQJljHhh8w3LyU/l3MZl+NcMEok=
X-Gm-Gg: ASbGncvW36GonGKRLaDslTRIzlAGXsD4V8fp3cAcz7cQ5Q0WezgziSbxwG36MMbySsE
	5UVjl9goEZxd2+Vow/NHZFIVoWTazYUrr9bvHG54Zpsx6kcCFguqa8CAXQei0pGzoI0B9pOjHsp
	ILwwXH+HApnI4rv0+jMMPFxOoxTpoxhIddftg1l/KL/rCybKHwGYLGWPnny4E8UgBcz1FY5WZyo
	5CMVvXbjDSqhxqmcZt5uOyDHL9V9ALS2sX0FuGs8i1on/ZozQ2/5/VP1y9OuZdyd5sh92I6Gy2m
	SMltD4Qt9Ej9muheaxgmbDwD97CNOHk587FC+if2ZJOV8gyG3L9B3yI=
X-Google-Smtp-Source: AGHT+IHyD5bJW8QrQDi/yAJ3j9xWLsqxnDq+ZCnhvzEgRXpZx1JjUhX9fujnMcgTrmrFA7/0GETcUg==
X-Received: by 2002:a05:600c:1daa:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-438e6ed8f0amr116102665e9.9.1738596661897;
        Mon, 03 Feb 2025 07:31:01 -0800 (PST)
Message-ID: <3d1a3b72-288e-4e62-bf09-85e416e41317@citrix.com>
Date: Mon, 3 Feb 2025 15:31:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 2/3] x86/PCI: init segments earlier
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2bb9d3c4-0761-4d63-8193-29293e35eb04@suse.com>
 <940ccd1b-9ad8-4b68-a035-36f45326872b@suse.com>
 <a4cc2c27-ed02-4453-9730-09d532b3edad@citrix.com>
 <114b766d-c68d-4644-90ad-bd120bd54434@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <114b766d-c68d-4644-90ad-bd120bd54434@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/02/2025 9:09 am, Jan Beulich wrote:
> On 02.02.2025 15:46, Andrew Cooper wrote:
>> On 30/01/2025 11:12 am, Jan Beulich wrote:
>>> In order for amd_iommu_detect_one_acpi()'s call to pci_ro_device() to
>>> have permanent effect, pci_segments_init() needs to be called ahead of
>>> making it there. Without this we're losing segment 0's r/o map, and thus
>>> we're losing write-protection of the PCI devices representing IOMMUs.
>>> Which in turn means that half-way recent Linux Dom0 will, as it boots,
>>> turn off MSI on these devices, thus preventing any IOMMU events (faults
>>> in particular) from being reported on pre-x2APIC hardware.
>>>
>>> As the acpi_iommu_init() invocation was moved ahead of
>>> acpi_mmcfg_init()'s by the offending commit, move the call to
>>> pci_segments_init() accordingly.
>>>
>>> Fixes: 3950f2485bbc ("x86/x2APIC: defer probe until after IOMMU ACPI table parsing")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Of course it would have been quite a bit easier to notice this issue if
>>> radix_tree_insert() wouldn't work fine ahead of radix_tree_init() being
>>> invoked for a given radix tree, when the index inserted at is 0.
>>>
>>> While hunting down various other dead paths to actually find the root
>>> cause, it occurred to me that it's probably not a good idea to fully
>>> disallow config space writes for r/o devices: Dom0 won't be able to size
>>> their BARs (luckily the IOMMU "devices" don't have any, but e.g. serial
>>> ones generally will have at least one), for example. Without being able
>>> to size BARs it also will likely be unable to correctly account for the
>>> address space taken by these BARs. However, outside of vPCI it's not
>>> really clear to me how we could reasonably emulate such BAR sizing
>>> writes - we can't, after all, allow Dom0 to actually write to the
>>> underlying physical registers, yet we don't intercept reads (i.e. we
>>> can't mimic expected behavior then).
>>>
>>> --- a/xen/arch/x86/x86_64/mmconfig-shared.c
>>> +++ b/xen/arch/x86/x86_64/mmconfig-shared.c
>>> @@ -402,8 +402,6 @@ void __init acpi_mmcfg_init(void)
>>>  {
>>>      bool valid = true;
>>>  
>>> -    pci_segments_init();
>>> -
>>>      /* MMCONFIG disabled */
>>>      if ((pci_probe & PCI_PROBE_MMCONF) == 0)
>>>          return;
>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>> @@ -55,6 +55,8 @@ void __init acpi_iommu_init(void)
>>>  {
>>>      int ret = -ENODEV;
>>>  
>>> +    pci_segments_init();
>>> +
>>>      if ( !iommu_enable && !iommu_intremap )
>>>          return;
>>>  
>>>
>> I can't help but feel this is taking a bad problem and not making it any
>> better.
>>
>> pci_segments_init() is even less (obviously) relevant in
>> apci_iommu_init() than it is in acpi_mmcfg_init(), and given the
>> fine-grain Kconfig-ing going on, is only one small step from
>> accidentally being compiled out.
> The alternative I did consider was to move the call into __start_xen()
> itself. Anything going beyond that looks more intrusive than we'd like
> it at this point of the release cycle.

Moving into __start_xen() would be ok if we think we're getting too
close to the release.  It makes it clearer that there is explicit
ordering necessary.

>
>> ARM is in a bad state too, with this initialisation even being behind
>> the PCI Passthrough cmdline option.
>>
>> IMO there are two problems here; one as you pointed out
>> (radix_tree_insert() doesn't fail), and that PCI handling requires
>> explicit initialisation to begin with.
>>
>> Looking through radix tree, it wouldn't be hard to create a
>> RADIX_TREE_INIT macro to allow initialisation at compile time for
>> suitable objects (pci_segments and acpi_ivrs currently).
>>
>> That involves exporting rcu_node_{alloc,free}(), although the last
>> caller of radix_tree_set_alloc_callbacks() was dropped when TMEM went,
>> so we could reasonably remove that infrastructure too, at which point
>> radix_tree_init() is a simple zero of the structure.
> Yes, seeing that this was even an extension of ours (i.e. Linux doesn't
> have such), it's certainly worth getting rid of. If nothing else, then
> for the two cf_check annotations that's we'd then be able to drop. I'll
> make a patch.

Oh, even better. 

>
>> Dealing with alloc_pseg(0) is harder.  As we never free the PCI
>> segments, we could just opencode the radix_tree_root of height=1 with a
>> static pseg0 structure, and that would drop the need for
>> pci_segemnts_init() completely.
> I'm afraid this would end up being too much open-coding for my taste.

I didn't much like the suggestion either.

> I'd put this differently: Unlike the radix tree initialization, the
> setting up of segment 0 isn't a prereq to acpi_iommu_init(). We could
> keep acpi_mmcfg_init() doing that, by way of calling pci_add_segment(0)
> (and that would simply be a no-op if acpi_iommu_init() ended up
> introducing segment 0 already).

That might be ok.

~Andrew

