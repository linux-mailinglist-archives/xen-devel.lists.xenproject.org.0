Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F5191A1F5
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 10:56:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749843.1158085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMkv1-0005M1-94; Thu, 27 Jun 2024 08:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749843.1158085; Thu, 27 Jun 2024 08:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMkv1-0005JY-6H; Thu, 27 Jun 2024 08:55:51 +0000
Received: by outflank-mailman (input) for mailman id 749843;
 Thu, 27 Jun 2024 08:55:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMkuz-000555-Ke
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 08:55:49 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c451cad-3463-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 10:55:48 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ec1620a956so91002291fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 01:55:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-72748e84e87sm677629a12.70.2024.06.27.01.55.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jun 2024 01:55:47 -0700 (PDT)
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
X-Inumbo-ID: 0c451cad-3463-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719478548; x=1720083348; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6Awv0ts2nk01U12NTVtimSVfj6ZfJzzZ7Sdo/w/gFQ8=;
        b=UgwsfbmqjIxLnKYjYyp3h69oEyTdyio8SfCb2P4AcMH1AK5XSdUzTFPHb1em+05hhE
         zxSnOs+OqP8KpHhCFo8aEntn2xNapl7JaRIZSTUIjzHRCccIPKjPml9ZnY/cFAbxFQJf
         VZ4EC33SxP50kYnUT7jn/D09TL+ADMXg7ir8EP3O6c8fYw5dt9xHmLgEUBj0Owu8v39E
         yuZuPAREn1UfINsyVBHceuJKK6bH0/ZqtIE1S1FCLdrPjEkRFMolP46kuush+vQvbTpk
         NFklTnmlg5pdnNbDjDOAuEUAys7i1fv90E/gw41ZIRRPnDn0mTN6DQRjMHu+ZPY0Y5oQ
         D6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719478548; x=1720083348;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Awv0ts2nk01U12NTVtimSVfj6ZfJzzZ7Sdo/w/gFQ8=;
        b=qs59qvZQNynhRHWlhg6eYd85vlq648sLFELAZbCIVkKTqI6/5QP6KZtDUhc9dfg8iU
         UxgwCMRpU/b3FnDALJOX8dMPg53uUPVyM2XcAM4g0qMIYw95i7hozl2JIq9V+/WPkcfI
         hq590/xyFSF95sDE1f5GlJrCPdrhq3F+0AISRucYEH3996QzRcGCxoEdsya/xTojslbZ
         iQoabBcbvsSe/fOVnEIsSvVfDb8Dv0cg6Kw4xXTZJ4WS2+QM9y/sP1CoJvTDZCH4C1uH
         dt1dtRl0rSGNO6sSIh0tbqc4KaaSXc6Avyx2HID6C7lcKn72mRZpPrnvYSZ6a/PrXrJA
         lTWw==
X-Forwarded-Encrypted: i=1; AJvYcCUo3B8IUTN3CTawwtLeW0OK13yPCGioJZmKoqCwbGeJHrRcgZDZk1zejFidjC3M8bqQuAHxr1L0hZ/jpKIJtdmW95Gr3uxHNVCoG06gddI=
X-Gm-Message-State: AOJu0YwseMUv6JtUY1hIT7NmwNjSLlQiZqLnYW3BKbrqygWi8PRboivo
	JKUq2JeXNlEGITtE3G/oqjVF+UROy6hGg6MDf/6D4a9wKxVW1ATJdNWWlu/3lg==
X-Google-Smtp-Source: AGHT+IGgYW9f5po6C6SmcZsYlVPiFCF8NHaOPufrVDCQXNF8oILRG7goseTBb+40ohuNhSw1gHfFpQ==
X-Received: by 2002:a2e:9e48:0:b0:2ec:680d:daed with SMTP id 38308e7fff4ca-2ec680ddb67mr47114201fa.1.1719478548047;
        Thu, 27 Jun 2024 01:55:48 -0700 (PDT)
Message-ID: <b508c1b8-1bdd-4378-a76d-7056452406d3@suse.com>
Date: Thu, 27 Jun 2024 10:55:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: PE/COFF image header for RISC-V target
To: Milan Djokic <Milan.Djokic@rt-rk.com>
Cc: "milandjokic1995@gmail.com" <milandjokic1995@gmail.com>,
 Nikola Jelic <nikola.jelic@rt-rk.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <87b5e458498bbff2e54ac011a50ff1f9555c3613.1717354932.git.milan.djokic@rt-rk.com>
 <0e10ee9c215269b577321ba44f5d038a5eb299a7.1718193326.git.milan.djokic@rt-rk.com>
 <8112bee8-efdc-4db9-b0d4-58b160b4e923@suse.com>
 <DU5PR08MB103973ABF5E6F12853F5D24E1CEC12@DU5PR08MB10397.eurprd08.prod.outlook.com>
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
In-Reply-To: <DU5PR08MB103973ABF5E6F12853F5D24E1CEC12@DU5PR08MB10397.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2024 18:16, Milan Djokic wrote:
>> Signed-off-by: Nikola Jelic <nikola.jelic@rt-rk.com>
> 
> This isn't you, is it? Your S-o-b is going to be needed, too.
> 
> Nikola.jelic@rt-rk.com is the initial author of the patch, I'll add myself also if necessary
> 
>> +config RISCV_EFI
>> +     bool "UEFI boot service support"
>> +     depends on RISCV_64
>> +     default n
> 
> Nit: This line can be omitted (and if I'm not mistaken we generally do omit
> such).
> 
> If we remove the default value, EFI header shall be included into xen image by default.

Why's this? Or in other words, what are you deriving this from? Not specifying
a default implicitly means "n", from all I know.

> We want to keep it as optional for now, and generate plain elf as default format (until full EFI support is implemented)

I fully second this.

>> --- /dev/null
>> +++ b/xen/arch/riscv/include/asm/pe.h
>> @@ -0,0 +1,148 @@
>> +#ifndef _ASM_RISCV_PE_H
>> +#define _ASM_RISCV_PE_H
>> +
>> +#define LINUX_EFISTUB_MAJOR_VERSION     0x1
>> +#define LINUX_EFISTUB_MINOR_VERSION     0x0
>> +
>> +#define MZ_MAGIC                    0x5a4d          /* "MZ" */
>> +
>> +#define PE_MAGIC                    0x00004550      /* "PE\0\0" */
>> +#define PE_OPT_MAGIC_PE32           0x010b
>> +#define PE_OPT_MAGIC_PE32PLUS       0x020b
>> +
>> +/* machine type */
>> +#define IMAGE_FILE_MACHINE_RISCV32  0x5032
>> +#define IMAGE_FILE_MACHINE_RISCV64  0x5064
> 
> Apart from this, hardly anything in this header is RISC-V specific.
> Please consider moving to xen/include/xen/.
> 
> We shall move generic part into xen/include/xen/efi. This is something which should be considered for use on arm/x86 also.

It isn't, no. That's the case for Arm only so far afaict.

> Currently PE/COFF header is directly embedded into
> head.S for arm/x86
> 
>> +    char     name[8];                /* name or "/12\0" string tbl offset */
> 
> Why 12?
> 
> Either section name is specified in this field or string table offset if section name can't fit into 8 bytes, which is the case here.

Well, yes, I'm certainly aware of that. But the question wasn't about the
format, it was specifically about the hardcoded value 12. Why not 11 or 13?

> Btw this is taken over from linux kernel together with the PE/COFF header structures: https://github.com/torvalds/linux/blob/master/include/linux/pe.h

Which is in no way removing the need for you to be able to explain the
changes you're making.

>> + * struct riscv_image_header - riscv xen image header
> 
> You saying "xen": Is there anything Xen-specific in this struct?
> 
> Not really related to xen, this is generic riscv PE image header, comment fixed in new version
> 
>> +        .long   0                                       /* LoaderFlags */
>> +        .long   (section_table - .) / 8                 /* NumberOfRvaAndSizes */
>> +        .quad   0                                       /* ExportTable */
>> +        .quad   0                                       /* ImportTable */
>> +        .quad   0                                       /* ResourceTable */
>> +        .quad   0                                       /* ExceptionTable */
>> +        .quad   0                                       /* CertificationTable */
>> +        .quad   0                                       /* BaseRelocationTable */
> 
> Would you mind clarifying on what basis this set of 6 entries was
> chosen?
> 
> These fields and their sizes are defined in official PE format, see details from specification bellow
> 
> [cid:542690de-3bb0-4708-a447-996a03277578]

Again, I'm aware of the specification. Yet like the 12 above the 6 here
looks arbitrarily chosen. There are more entries in this table which
are permitted to be present (and well-defined). There could also be
fewer of them; any absent entry is implicitly holding the value 0 afaia.

>> +/* Section table */
>> +section_table:
>> +        .ascii  ".text\0\0\0"
>> +        .long   0
>> +        .long   0
>> +        .long   0                                       /* SizeOfRawData */
>> +        .long   0                                       /* PointerToRawData */
>> +        .long   0                                       /* PointerToRelocations */
>> +        .long   0                                       /* PointerToLineNumbers */
>> +        .short  0                                       /* NumberOfRelocations */
>> +        .short  0                                       /* NumberOfLineNumbers */
>> +        .long   IMAGE_SCN_CNT_CODE | \
>> +                IMAGE_SCN_MEM_READ | \
>> +                IMAGE_SCN_MEM_EXECUTE                   /* Characteristics */
>> +
>> +        .ascii  ".data\0\0\0"
>> +        .long   _end - xen_start                        /* VirtualSize */
>> +        .long   xen_start - efi_head                    /* VirtualAddress */
>> +        .long   __init_end_efi - xen_start              /* SizeOfRawData */
>> +        .long   xen_start - efi_head                    /* PointerToRawData */
>> +        .long   0                                       /* PointerToRelocations */
>> +        .long   0                                       /* PointerToLineNumbers */
>> +        .short  0                                       /* NumberOfRelocations */
>> +        .short  0                                       /* NumberOfLineNumbers */
>> +        .long   IMAGE_SCN_CNT_INITIALIZED_DATA | \
>> +                IMAGE_SCN_MEM_READ | \
>> +                IMAGE_SCN_MEM_WRITE                    /* Characteristics */
> 
> IOW no code and the entire image expressed as data. Interesting.
> No matter whether that has a reason or is completely arbitrary, I
> think it, too, wants commenting on.
> 
> This is correct, currently we have extended image with PE/COFF (EFI) header which allows xen boot from EFI loader (or U-boot) environment. And these updates are pure data. We are actively working on the implementation of Boot/Runtime services which shall be in the code section part and enable full UEFI compatible xen application for riscv.

Such a choice, even if transient, needs explaining in the description
(or maybe even a code comment) then.

> Why does the blank line disappear? And why is ...
> 
>>      . = ALIGN(POINTER_ALIGN);
>>      __init_end = .;
> 
> ... __init_end not good enough? (I think I can guess the answer, but
> then I further think the name of the symbol is misleading. )
> 
> Init_end_efi is used only when EFI sections are included into image.

Again, my question was different: I asked why a symbol we have already
isn't good enough, i.e. why another one needs adding.

> We have aligned with arm implementation here, you can take a look also there.

And yet again, as per above, you need to be able to explain your decisions.
You can't just say "it's done this way elsewhere as well". What if that
"elsewhere" has an obvious or maybe just subtle bug?

Jan

