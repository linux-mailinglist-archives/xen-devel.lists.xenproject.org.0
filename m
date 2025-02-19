Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E63A3BE8E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 13:50:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892846.1301796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkjWf-0003ih-R9; Wed, 19 Feb 2025 12:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892846.1301796; Wed, 19 Feb 2025 12:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkjWf-0003ee-OC; Wed, 19 Feb 2025 12:50:05 +0000
Received: by outflank-mailman (input) for mailman id 892846;
 Wed, 19 Feb 2025 12:50:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVer=VK=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1tkjWe-000261-NL
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 12:50:04 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09f4bb12-eec0-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 13:50:04 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-30795988ebeso69469121fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 04:50:04 -0800 (PST)
Received: from [192.168.10.20] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309221d7074sm18431661fa.102.2025.02.19.04.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 04:50:02 -0800 (PST)
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
X-Inumbo-ID: 09f4bb12-eec0-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739969403; x=1740574203; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s4G7gk522e8bmGNzP+nxylmwifT4pfCnD3JkwT6gmrs=;
        b=kNoyGHBtPuSo0szvYfpPNjmfBKSqUskC4rQ0SJcX+hKQHQLCq3+9U7IQlWRl11R28o
         I64iyEi+DF8F/s58Fc4hJUhZrg21Vay48fjdya5FTqx6bmCvCOJKD+B3lWeipiSUqv7d
         E9S1H51Vbkd/u73ZI8FQNSB1SwD92tSVAqfzt8XrFgv519NA30RGcvnWmqQv2mvJTmgq
         YHHeUXBzJiscHfi31jvq/YLeyB4qIiKPDKixzeWMpFszl4m6sSYXxmS4ky/RdMXkoKjS
         mCLtN8QImVmf/QzKMFU8mtjm0w5sb0GgDb2SE87xx8uVsYUzJhJn0fIFGEbI3G/fmca5
         KKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739969403; x=1740574203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s4G7gk522e8bmGNzP+nxylmwifT4pfCnD3JkwT6gmrs=;
        b=OhOhWRDdWV/WsiNpur9UpxcoPYohFfmC7ghbrekEC9hIfXPsgx15VMTNaKi/E7MvU8
         1gVB75VMAyQC8hSVhnBf9mh8tGUcwZ4N49nrpcw3j17DrYsdDg1G0nGyF03PfOp6b6qB
         zFb9vfMrd1qMPPoS9xDa1ZiqTRLSpdwECe5lFPf8SPCwYml/l2rDBxgfHBXTOSLOuUXU
         WMR5T3UzPPD94x31tLL8t/kle4h/Xx4j/mBzN2dAOwhkxtuE09gV/qIEGbDLrvREpdAs
         Y8Fpan0+MID7yqF6kIoAG4tQc8LpNdBQl3lQ2iZRTqGzp4WRmmNaNhlwMqcHcCIsSmEz
         FxJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdSBWASK2j0ljR1n3tA5lKvoRK6XmKy95x1pJAryVGQ9JBuhPk4czx2rIeyvk0Lj13Eq65L5/+T68=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9+ZSXUmge6STxhyRmfiZTAOrWZocAFiGL9HOlBXXntptiBVzr
	1RaC2ylZwbwNogrzOZA+VJE1HFk6InqE521jroOzI842vd4oGQG9
X-Gm-Gg: ASbGncvZBkLd104tw+8m0TZ+cMhhv3zNVmLL6somQFkTRkU+k8O01mNuQwHk2529cJT
	mi+OI14lvYcs6RCGSiIS8mWLfg2gf9qhDSanKhNt2SRYOJXgJ4UQ7F+WYRh+vSs+3c7v/QlDGsA
	VdNCggx5AAQ6Vjqoxhr2gA9IKnG+BKf8xBYQfQb13WipZyPE4yvPBmHO1EHLCi2lrf25/oXRYgO
	FJ8bTJX5/bjdReyaRsmah49uKz7OJakVL7GQquuvSlm+YleRfrClk1SVQxAvCIHsNHvLigSaaw/
	GggiHcvT+QaKrR/z
X-Google-Smtp-Source: AGHT+IHJXHyPueDursJ3qg5xafYwyM6WPyA6AZINtIckdFX/BSN1M3NobbZ+peK0bViTK6nTpRqGbQ==
X-Received: by 2002:a2e:87ca:0:b0:309:2012:cc59 with SMTP id 38308e7fff4ca-30927ad5181mr57987151fa.26.1739969403082;
        Wed, 19 Feb 2025 04:50:03 -0800 (PST)
Message-ID: <bd009e11-d7f3-42e7-8807-af4846e6ee8c@gmail.com>
Date: Wed, 19 Feb 2025 14:50:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] code style exercise: Drivers folder samples
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Artem_Mygaiev@epam.com, jbeulich@suse.com,
 Luca.Fancellu@arm.com, roger.pau@citrix.com,
 marmarek@invisiblethingslab.com, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech
References: <20250216102108.2665222-1-andr2000@gmail.com>
 <6c25b6fb-989c-4788-9f3f-c2e309bec4ba@epam.com>
Content-Language: en-US
From: Oleksandr Andrushchenko <andr2000@gmail.com>
In-Reply-To: <6c25b6fb-989c-4788-9f3f-c2e309bec4ba@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello, Grygorii!

On 18.02.25 11:56, Grygorii Strashko wrote:
>
>
> On 16.02.25 12:21, Oleksandr Andrushchenko wrote:
>> Hello, everybody!
>>
>> As agreed before [1] I am sending a series to show two samples of the
>> formatting done with clang-format. The clang-format configuration can be
>> found at [2]. It already has some notes on previous discussions when
>> Luca presented his version of that configuration and which I used to
>> start from.
>>
>> There are two diff files which show what happens in case the same is
>> applied to the whole xen/drivers directory:
>> - first one is the result of the "git diff" command, 1.2M [3]
>> - the second one is for "git diff --ignire-all-space", 600K [4]
>>
>> This is not to limit the reviewers from seeing a bigger picture and not
>> only the files in this series.
>> N.B. xen/drivers uses tabs a lot, so this is no surprise the size
>> difference is big enough: roughly space conversion is half of the changes.
>>
>> While reviewing the changes I have collected some of the unexpected things
>> done by clang-format and some interesting pieces. You can find those
>> below. For some of those I have filed an issue on clang-format and hope the
>> community will lead me in resolving those. Of course what I collected is
>> not the complete list of such changes, so I hope we can discuss missed
>> ones here.
>>
>>  From this exercise I can definitely tell that clang-format does help a
>> lot and has potential to be employed as a code formatting tool for Xen.
>> Of course it cannot be used as is now and will require discussions on the
>> Xen coding style and possibly submitting patches to clang-format to
>> satisfy those which cannot be handled by the tool now.
>>
>> Stay safe,
>> Oleksandr Andrushchenko
>>
>> 1. Const string arrays reformatting
>> In case the length of items change we might need to introduce a bigger
>> change wrt new formatting of unaffected lines
>> ==============================================================================
>>
>> --- a/xen/drivers/acpi/tables.c
>> +++ b/xen/drivers/acpi/tables.c
>> @@ -38,10 +38,10 @@
>> -static const char *__initdata
>> -mps_inti_flags_polarity[] = { "dfl", "high", "res", "low" };
>> -static const char *__initdata
>> -mps_inti_flags_trigger[] = { "dfl", "edge", "res", "level" };
>> +static const char *__initdata mps_inti_flags_polarity[] = { "dfl", "high",
>> + "res", "low" };
>> +static const char *__initdata mps_inti_flags_trigger[] = { "dfl", "edge", "res",
>>
>> --- a/xen/drivers/acpi/utilities/utglobal.c
>> +++ b/xen/drivers/acpi/utilities/utglobal.c
>>   static const char *const acpi_gbl_region_types[ACPI_NUM_PREDEFINED_REGIONS] = {
>> -    "SystemMemory",
>> -    "SystemIO",
>> -    "PCI_Config",
>> -    "EmbeddedControl",
>> -    "SMBus",
>> -    "CMOS",
>> -    "PCIBARTarget",
>> -    "DataTable"
>> +    "SystemMemory", "SystemIO", "PCI_Config", "EmbeddedControl",
>> +    "SMBus",        "CMOS",     "PCIBARTarget", "DataTable"
>>   };
>>
>> 2. Long strings in ptintk violations
>> I filed an issue on printk format strings [5]
>> ==============================================================================
>> @@ -225,9 +231,9 @@ void __init acpi_table_print_madt_entry(struct acpi_subtable_header *header)
>>           printk(KERN_DEBUG PREFIX
>> -                   "GIC Distributor (gic_id[0x%04x] address[0x%"PRIx64"] gsi_base[%d])\n",
>> -                   p->gic_id, p->base_address,
>> -                   p->global_irq_base);
>> +               "GIC Distributor (gic_id[0x%04x] address[0x%" PRIx64
>> +               "] gsi_base[%d])\n",
>> +               p->gic_id, p->base_address, p->global_irq_base);
>>
>> @@ -629,12 +628,14 @@ acpi_parse_one_rmrr(struct acpi_dmar_header *header)
>> -           printk(XENLOG_ERR VTDPREFIX
>> -                  "Overlapping RMRRs [%"PRIx64",%"PRIx64"] and [%"PRIx64",%"PRIx64"]\n",
>> -                  rmrru->base_address, rmrru->end_address,
>> -                  base_addr, end_addr);
>> +            printk(XENLOG_ERR VTDPREFIX "Overlapping RMRRs [%" PRIx64
>> +                                        ",%" PRIx64 "] and [%" PRIx64
>> +                                        ",%" PRIx64 "]\n",
>> +                   rmrru->base_address, rmrru->end_address, base_addr,
>> +                   end_addr);
>
> It doesn't understand properly things like "PRIx64" :(
>
> Most of other items, I've mentioned already,
>> Unhappy: it's probably "known" things - identification of complex defines and
>> static struct/arrays declarations. 
>
> And for them, probably, no magic automation tools exist which will satisfy everybody as,
> at least static definitions are usually formatted to achieve better readability
> which is always subjective.
Strongly agree
>
> The tags /* clang-format off/clang-format on */ might be useful.
>
Yes, I guess we will be forced to use those
> [..]
>
> Honestly, It looks a bit strange that Xen community is considering batch automated code formatting,
> For example Linux kernel cleanly rejected such approach.
> Linux kernel docs "4.1.1. Coding style" section [1].
>
> Another thing, checking the new code and accepting code style violations (if any) on per-patch basis.
The main difference, and it was brought by Jan before [1], the possible existence
of  the three different code styles in a single patch: xen, libxl and Linux...
Not sure that such a case can be handled. Of course we may require that no such
patch should exist, but it does depend on the change being made.
Thus, no guarantee
>
> [1] https://docs.kernel.org/process/4.Coding.html
>
> BR,
> -grygorii
[1] https://old-list-archives.xen.org/archives/html/xen-devel/2025-02/msg00464.html

