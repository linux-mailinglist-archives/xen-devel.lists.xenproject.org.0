Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 483EE9A66BC
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 13:38:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823392.1237384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2qjs-00087T-DP; Mon, 21 Oct 2024 11:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823392.1237384; Mon, 21 Oct 2024 11:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2qjs-00084e-AC; Mon, 21 Oct 2024 11:38:20 +0000
Received: by outflank-mailman (input) for mailman id 823392;
 Mon, 21 Oct 2024 11:38:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=euus=RR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t2qjq-00084Y-Oz
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 11:38:18 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f72124fe-8fa0-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 13:38:17 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-37d58377339so4794198f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 04:38:17 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a915a2df1sm192872366b.225.2024.10.21.04.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 04:38:15 -0700 (PDT)
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
X-Inumbo-ID: f72124fe-8fa0-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729510697; x=1730115497; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yvUdusz1h2YQeWtwQ/ZRTPbFevemmJzPasRPm9EkN4c=;
        b=LoFicQMDSLKj7BlM/HPa58AdbURTcz/NqVZkYaSnE/6ra05ScR4pgEYKjRWnq5ZA/3
         wDK8vBaDQoZTwM8wugymc4XJRYfqUExdRjpMcnKrFqd+uo4wsrKo2/4kkp3AHQTKRiPg
         cM+vWMAbxGj64NZeeMMX28cacM1MNBhU9ltyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729510697; x=1730115497;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yvUdusz1h2YQeWtwQ/ZRTPbFevemmJzPasRPm9EkN4c=;
        b=Xc2ks78LdnJsmIdTv2dypefDqL/dFtmtjW/eCLiwIcecac2ePUNtxlVf8D7Yrh7wh5
         /a9b4W4wRjOFVf9SbVO/UcYnq217HUFAtxIsCIerh8ioT1liyUwTJusgkeJpoEdmrKq/
         7DfY8McmvNibV2jdnrSWShu3Dxp/l3KMudHrSKf70MVLPQlHvRrq3PgYNTI9miIPkn/+
         7p/GesNr3EQPLeM2slzFj6O4vfyWkuVFftpFtU9SEQxguCdW5ZhcY5o0N45+P5DJQ863
         GGCOEPx76i5EboXEUrbqZphS71FtbzHPZvsay9BL5CXiGYRHO2/YDUIixfGKEHnOHFwk
         MZZA==
X-Forwarded-Encrypted: i=1; AJvYcCWU+4r+aNoP1/pMUtHdJea2+StNwdo1Dm/dnMZsPPYSy20qSIAivK5ACQTL2b8OKoO40+6eNoHGlmI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/YNGWoHhgwhNcwVYb/GZ6kuNkIuI1z6FVIXKTruRF6Jewn2f4
	wCkceHneOV5I94/qdYV2807QzYdTttJpdxKalzs3kRw/y5Ls88xc3+5B2CAa3OY=
X-Google-Smtp-Source: AGHT+IE3yZo/bVXu3hz9Hjlj0tqX7bmP21ZBBILv73KA7a1bTrACKDxmWGJb8qxrAnWwp6TWn5j8YA==
X-Received: by 2002:adf:f708:0:b0:37d:7e71:67a0 with SMTP id ffacd0b85a97d-37ea21c3026mr9896440f8f.9.1729510695572;
        Mon, 21 Oct 2024 04:38:15 -0700 (PDT)
Message-ID: <0f3a9c97-3903-414c-b076-5012e6bc9350@citrix.com>
Date: Mon, 21 Oct 2024 12:38:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/io-apic: fix directed EOI when using AMd-Vi interrupt
 remapping
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Willi Junga <xenproject@ymy.be>,
 David Woodhouse <dwmw@amazon.co.uk>
References: <20241018080813.45759-1-roger.pau@citrix.com>
 <9270ef0c-9dfa-4fbf-8060-3c507c0c6684@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9270ef0c-9dfa-4fbf-8060-3c507c0c6684@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/10/2024 12:10 pm, Andrew Cooper wrote:
> On 18/10/2024 9:08 am, Roger Pau Monne wrote:
>> When using AMD-VI interrupt remapping the vector field in the IO-APIC RTE is
>> repurposed to contain part of the offset into the remapping table.  Previous to
>> 2ca9fbd739b8 Xen had logic so that the offset into the interrupt remapping
>> table would match the vector.  Such logic was mandatory for end of interrupt to
>> work, since the vector field (even when not containing a vector) is used by the
>> IO-APIC to find for which pin the EOI must be performed.
>>
>> Introduce a table to store the EOI handlers when using interrupt remapping, so
>> that the IO-APIC driver can translate pins into EOI handlers without having to
>> read the IO-APIC RTE entry.  Note that to simplify the logic such table is used
>> unconditionally when interrupt remapping is enabled, even if strictly it would
>> only be required for AMD-Vi.
>>
>> Reported-by: Willi Junga <xenproject@ymy.be>
>> Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
>> Fixes: 2ca9fbd739b8 ('AMD IOMMU: allocate IRTE entries instead of using a static mapping')
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Yet more fallout from the multi-MSI work.  That really has been a giant
> source of bugs.
>
>> ---
>>  xen/arch/x86/io_apic.c | 47 ++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 47 insertions(+)
>>
>> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
>> index e40d2f7dbd75..8856eb29d275 100644
>> --- a/xen/arch/x86/io_apic.c
>> +++ b/xen/arch/x86/io_apic.c
>> @@ -71,6 +71,22 @@ static int apic_pin_2_gsi_irq(int apic, int pin);
>>  
>>  static vmask_t *__read_mostly vector_map[MAX_IO_APICS];
>>  
>> +/*
>> + * Store the EOI handle when using interrupt remapping.
>> + *
>> + * If using AMD-Vi interrupt remapping the IO-APIC redirection entry remapped
>> + * format repurposes the vector field to store the offset into the Interrupt
>> + * Remap table.  This causes directed EOI to longer work, as the CPU vector no
>> + * longer matches the contents of the RTE vector field.  Add a translation
>> + * table so that directed EOI uses the value in the RTE vector field when
>> + * interrupt remapping is enabled.
>> + *
>> + * Note Intel VT-d Xen code still stores the CPU vector in the RTE vector field
>> + * when using the remapped format, but use the translation table uniformly in
>> + * order to avoid extra logic to differentiate between VT-d and AMD-Vi.
>> + */
>> +static unsigned int **apic_pin_eoi;
> I think we can get away with this being uint8_t rather than unsigned
> int, especially as we're allocating memory when not strictly necessary.
>
> The only sentinel value we use is IRQ_VECTOR_UNASSIGNED which is -1.
>
> Vector 0xff is strictly SPIV and not allocated for anything else, so can
> be reused as a suitable sentinel here.

Actually, vectors 0 thru 0x0f are also strictly invalid, and could be
used as sentinels.  That's probably better than trying to play integer
promotion games between IRQ_VECTOR_UNASSIGNED and uint8_t.

~Andrew

