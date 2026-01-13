Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5372FD1823E
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 11:47:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201429.1517071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfbvK-0003B3-TP; Tue, 13 Jan 2026 10:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201429.1517071; Tue, 13 Jan 2026 10:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfbvK-00037z-QY; Tue, 13 Jan 2026 10:46:54 +0000
Received: by outflank-mailman (input) for mailman id 1201429;
 Tue, 13 Jan 2026 10:46:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thT7=7S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfbvI-00037q-Ut
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 10:46:52 +0000
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [2a00:1450:4864:20::444])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b36678c-f06d-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 11:46:51 +0100 (CET)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-42fb6ce71c7so6253294f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 02:46:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5ee243sm43675352f8f.31.2026.01.13.02.46.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 02:46:50 -0800 (PST)
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
X-Inumbo-ID: 2b36678c-f06d-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768301211; x=1768906011; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5U0AiMomd6hbs2G3hf8fB/84mrZcrRs8c70BTXP2QVk=;
        b=b1r33Yo3wrk9cXmS2FdU3rv5SZ/qdoa1YPmqxdcns/EMuPJvzl2bsWZUORKeKD9t5q
         YL+f5H7dlG5GV8x6Ocx41ydUtw3E+VBiSKDw67WbhNyf4YEJ4RcloSWBup0Sw96Pswik
         TJqTzD0sIc3wTa0DlkDjGvG/IOlv8E94SsXyx4GLngybdz7J3GbaVxu82JVLoIs8VKKG
         /yLT+Je5Kwd6XjrC9Xyzu+D1+hfl1lK2Qs095ftupaYGOYPFOI58Z3jk5Tu4d+7GP0jL
         wtE53+yjxR6phnW7b7sTWzbAbLC0wF5tDuabAm9oMDx54j7F2+E5TxSTASUhwk1V8hkB
         /x3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301211; x=1768906011;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5U0AiMomd6hbs2G3hf8fB/84mrZcrRs8c70BTXP2QVk=;
        b=fgE59GwWZmqjH4bhw+UxNuwdceyXYxLM6Za/viNsjZexw3qo7sR2MfZnpTUe419G+N
         WqzC15IFFmzTB2VUOGIpT5j+fQ2wpmfjrTa9QWuO1F6aOiQMNaeMZmFuUwIFUUjLR1ne
         SCse3nHTLm4nguSoTwhmJo0QUu3ZaBwjfOhYCp5g1WAapYKoH9JtgFloyBf8zdLULlM4
         +3/J3Fx+3F0/2Uz3qwRLBjVqLlu10OLB2fL18I5+e3k8mKQHoehq2CN0n9dN5nSBA9eo
         FMoLM2DD+bPXqU7RJw4A5MD+vaNQBnsuDv4PPF7q4EkRc3MLrkfnUfPJo+VsFhTU+iha
         0n7w==
X-Forwarded-Encrypted: i=1; AJvYcCUsh7NB8kBK2lKqgHeKeDAR/WbcPcepk2i4vvelcw7rvArfJBAjEWxykB1mL3CjeWcrRT6xsOUpMRQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwU8z5c4J9EhthCa6KvKTN3zh8dzHZ9hrIxEiofM7IckNl9aXJ7
	exE965oKvZJqVGQdtfN4nLyyzoVZmFAAfknXgZArYnY7KWX8oonHOPpzdpnFaCqd0w==
X-Gm-Gg: AY/fxX4dDCEAvHyWpVxZJWFgXepA99xtgwcEUhs6cAM8+ILXBAHqd2k7/zJE7QijUz8
	ZGrSGZCffDPThDewh+kHC2L4ewJMIIEG/ewgyD4w/ViMBJESUCYVob1nwyMJd/Pvm5fwvltzXGB
	VBdYcmOxuxNhRxKWYgXxqpHFf8TTOKQJnXX1immlQFEUjFBeD9e7pUEJ+R291tnkaOVYFyg+/1c
	zdg+Q1GpSePqOIeafEGybnpCv+G+MlZJAkxPOz30XRylwQwMtOKbka9z+BwcK0T2ff75wZKwciJ
	ceXI9ig/QVhd1ifMUfHGNgFOuUfN/8v5PCX7T0G49x4L0z3gVAFba/LaNmrW6Ntni1eJVgmq7Q4
	pZtjupaZBgqte+XxPbI/MNb+mjEx84uLikhB2SCeyV/gtMF2i8/HRl9s3BL0ihFugg5Dr3TR+JO
	WuZxh/BXnjiKSCG6Xa9fbwJzV6fYWLx4MAOUwyaLdsPjlfz4P6Qg/5B4Nim9czQdM1wvO6gfu6f
	4k=
X-Google-Smtp-Source: AGHT+IHX//L0Apb17iDGkowW4NwxM1ADyh12wPTyr1I5Ay4cKE440xSSzfY9o5UcqqBT/0Uh5VeSMA==
X-Received: by 2002:a05:6000:2411:b0:431:c2:c632 with SMTP id ffacd0b85a97d-432c38d22f0mr25915882f8f.57.1768301211011;
        Tue, 13 Jan 2026 02:46:51 -0800 (PST)
Message-ID: <e573cbe5-858c-4a7e-953b-f371c174125c@suse.com>
Date: Tue, 13 Jan 2026 11:46:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] PCI: determine whether a device has extended config
 space
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <05bc9acd-3054-4c5a-be87-cfd8d7bfa0f8@suse.com>
 <52eb1293-b5d4-4f7a-b53b-285e4dd274a5@suse.com>
 <cf24b83d-517f-4cd8-b7c0-94f60738dc50@amd.com>
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
In-Reply-To: <cf24b83d-517f-4cd8-b7c0-94f60738dc50@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.01.2026 22:07, Stewart Hildebrand wrote:
> On 1/6/26 08:47, Jan Beulich wrote:
>> ---
>> Note that alloc_pdev()'s switch doesn't handle DEV_TYPE_PCI2PCIe_BRIDGE at
>> all. Such bridges will therefore not have ->ext_cfg set (which is likely
>> wrong).
> 
> I initially read "set" as in "set to true", but I think you mean that ext_cfg
> isn't assigned at all.

Both are the same really, due to alloc_pdev() using xzalloc().

> Though perhaps it should actually be set to true, because ...
> 
>> Shouldn't we handle them like DEV_TYPE_LEGACY_PCI_BRIDGE (or
>> DEV_TYPE_PCI?) anyway (just like VT-d's set_msi_source_id() does)?
> 
> ... in pdev_type(), we will only reach DEV_TYPE_PCI2PCIe_BRIDGE if it has
> PCI_CAP_ID_EXP, which would indicate the device has extended config. So maybe it
> would be better to handle it similar to DEV_TYPE_PCIe2PCI_BRIDGE in
> alloc_pdev().

Hence my question. Since apparently you agree, I'll make that change. Maybe
in a separate, prereq patch.

>> @@ -420,6 +467,19 @@ static struct pci_dev *alloc_pdev(struct
>>              break;
>>      }
>>  
>> +    if ( pdev->ext_cfg &&
>> +         /*
>> +          * Regular PCI devices have 256 bytes, but PCI-X 2 and PCI Express
>> +          * devices have 4096 bytes.  Even if the device is capable, that
>> +          * doesn't mean we can access it.  Maybe we don't have a way to
>> +          * generate extended config space accesses, or the device is behind a
>> +          * reverse Express bridge.  So we try reading the dword at
>> +          * PCI_CFG_SPACE_SIZE which must either be 0 or a valid extended
>> +          * capability header.
>> +          */
>> +         pci_conf_read32(pdev->sbdf, PCI_CFG_SPACE_SIZE) == 0xffffffffU )
>> +        pdev->ext_cfg = false;
> 
> I'm using a machine where
> xen/arch/x86/x86_64/mmconfig-shared.c:is_mmconf_reserved() will initially return
> false during Xen boot:
> 
> (XEN) PCI: MCFG configuration 0: base f0000000 segment 0000 buses 00 - 3f
> (XEN) PCI: Not using MCFG for segment 0000 bus 00-3f
> 
> Then, during dom0 boot, dom0 will call PHYSDEVOP_pci_mmcfg_reserved, after which
> MCFG becomes enabled in Xen:
> 
> (XEN) PCI: Using MCFG for segment 0000 bus 00-3f
> 
> On such machines where mmcfg/ECAM is initially disabled, this will effectively
> set ->ext_cfg to false for all devices discovered at Xen boot.
> 
> I'm not really sure if I have any good suggestions, but perhaps we could add a
> macro or small function that returns something like
>    ( pdev->ext_cfg && pci_conf_read32(pdev->sbdf, PCI_CFG_SPACE_SIZE) != 0xffffffffU )
> to allow this checking to happen dynamically (but this still wouldn't handle the
> aliasing quirk). Maybe re-run the ext_cfg detection logic at the end of
> PHYSDEVOP_pci_mmcfg_reserved?
> 
> Regardless, I'd be happy to provide my R-b without this addressed, but I am
> curious if others think this as an issue?

Hmm, no, I forgot to consider that case (which in principle I'm well aware of).
Will need to fix in v2.

>> --- a/xen/include/xen/pci.h
>> +++ b/xen/include/xen/pci.h
>> @@ -126,6 +126,9 @@ struct pci_dev {
>>  
>>      nodeid_t node; /* NUMA node */
>>  
>> +    /* Whether the device has extended config space. */
> 
> Nit: it would be nice to clearly state if this means the extended config is
> accessible, or whether the device merely has it (but might not be accessible).

Well. Would the indicator be of any use if it wasn't accessible? Because if it
isn't accessible, we may not even be certain it exists. But yes, I can surely
make it "... has (accessible) extended ...".

Jan

