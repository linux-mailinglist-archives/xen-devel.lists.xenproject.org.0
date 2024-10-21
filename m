Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 112F09A6DAF
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 17:09:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823660.1237690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2u1e-0006Xt-Tq; Mon, 21 Oct 2024 15:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823660.1237690; Mon, 21 Oct 2024 15:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2u1e-0006Vr-Ql; Mon, 21 Oct 2024 15:08:54 +0000
Received: by outflank-mailman (input) for mailman id 823660;
 Mon, 21 Oct 2024 15:08:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=euus=RR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t2u1c-0006Vh-Up
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 15:08:52 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 613ee9cb-8fbe-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 17:08:51 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so533322666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 08:08:51 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a9155a1c9sm212970066b.129.2024.10.21.08.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 08:08:50 -0700 (PDT)
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
X-Inumbo-ID: 613ee9cb-8fbe-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729523330; x=1730128130; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E5ZZ1ZGwLNfx5yh4T1bZZfcgIUaSUikY7n52pslz2Y8=;
        b=TfrflGPddnkA2k+eUPLSj3bgj6mktjzkWk8HlTh49UdOwDL8FNfMuZcHBgh8+Vj9C2
         rP8zFUtleg3rqRoDTQlYDyBZMZwgESj1zHF3hfkYlGr50ZQrK35WXbAFmQ/1tar0vVFZ
         f53bftP9qCQfhxBQlA6tBl7PtDen1eQ8EcX/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729523330; x=1730128130;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5ZZ1ZGwLNfx5yh4T1bZZfcgIUaSUikY7n52pslz2Y8=;
        b=tqDfgulnGLRhXqUDCEg8jluxwHbAmFUvvzc2O95LrjjJpkZMuyvlPfNmXwV5VaWQV9
         vFSj4YMoONnyWPgDuFQaknmSF48hMW7aIth84xtnW2EJj+9lIqNbWjbn8sL5w4MCuUK3
         Q0doJokzBwZPDfFrlrGsWpFhkXxVqJmDsWLK3mfA8BbzpGHPHd6WB2XI6Diu5giWrqhH
         RA0Lat8UcRlWz3rMfi47BbcMKNO53ljsxPtTE2HWfy5Kvtdp/sqrN+BlUCSeN0zhP8MO
         Znck02U6tY5/Rm8B1kRXlitejH759juBEBPbbZR6oxitLlLe/6Dcooju5yEhCXlzzMed
         aXAQ==
X-Gm-Message-State: AOJu0YzyPEQeajXY5gx7hD78ZPuigSS/A8AKh84ulRx9feBXb60TlhPf
	sZZ6DkyLecIrMlkLdeXHyWJ6tJc+tG9WWSP27DRK2VG1WmhUpK4pkXkyWIQA6+w=
X-Google-Smtp-Source: AGHT+IGuzF+pfvTHUY9k+H0C++iUwOl+kj7Czq0vqGssig8KcYLa7nR+bErcQZZdDkTMI0BsWrxX5A==
X-Received: by 2002:a17:907:9450:b0:a9a:139:5ef3 with SMTP id a640c23a62f3a-a9aa8a41db6mr30109566b.55.1729523330538;
        Mon, 21 Oct 2024 08:08:50 -0700 (PDT)
Message-ID: <c917e062-60dc-4595-88ad-2838e63b0887@citrix.com>
Date: Mon, 21 Oct 2024 16:08:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/io-apic: fix directed EOI when using AMd-Vi interrupt
 remapping
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 David Woodhouse <dwmw2@infradead.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Willi Junga <xenproject@ymy.be>
References: <20241018080813.45759-1-roger.pau@citrix.com>
 <10e0f567ab3be0eae4c6473326da3a6d369ba8ff.camel@infradead.org>
 <ZxZf4nHFhhfyMF12@macbook.local>
 <5970c852-8800-414a-83f9-66392bdbe016@citrix.com>
 <D51KQITG2YWD.34JT5C9Y10XS9@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <D51KQITG2YWD.34JT5C9Y10XS9@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/10/2024 4:03 pm, Alejandro Vallejo wrote:
> On Mon Oct 21, 2024 at 3:51 PM BST, Andrew Cooper wrote:
>> On 21/10/2024 3:06 pm, Roger Pau Monné wrote:
>>> On Mon, Oct 21, 2024 at 12:34:37PM +0100, David Woodhouse wrote:
>>>> On Fri, 2024-10-18 at 10:08 +0200, Roger Pau Monne wrote:
>>>>> When using AMD-VI interrupt remapping the vector field in the IO-APIC RTE is
>>>>> repurposed to contain part of the offset into the remapping table.  Previous to
>>>>> 2ca9fbd739b8 Xen had logic so that the offset into the interrupt remapping
>>>>> table would match the vector.  Such logic was mandatory for end of interrupt to
>>>>> work, since the vector field (even when not containing a vector) is used by the
>>>>> IO-APIC to find for which pin the EOI must be performed.
>>>>>
>>>>> Introduce a table to store the EOI handlers when using interrupt remapping, so
>>>>> that the IO-APIC driver can translate pins into EOI handlers without having to
>>>>> read the IO-APIC RTE entry.  Note that to simplify the logic such table is used
>>>>> unconditionally when interrupt remapping is enabled, even if strictly it would
>>>>> only be required for AMD-Vi.
>>>>>
>>>>> Reported-by: Willi Junga <xenproject@ymy.be>
>>>>> Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
>>>>> Fixes: 2ca9fbd739b8 ('AMD IOMMU: allocate IRTE entries instead of using a static mapping')
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>> Hm, couldn't we just have used the pin#?
>>> Yes, but that would require a much bigger change that what's currently
>>> presented here, and for backport purposes I think it's better done
>>> this way for fixing this specific bug.
>>>
>>> Changing to use pin# as the IR offset is worthwhile, but IMO needs to
>>> be done separated from the bugfix here.
>>>
>>>> The AMD IOMMU has per-device IRTE, so you *know* you can just use IRTE
>>>> indices 0-23 for the I/O APIC pins.
>>> Aren't there IO-APICs with more than 24 pins?
>> Recent Intel SoCs have a single IO-APIC with 120 pins.
>>
>> ~Andrew
> I can't say I understand why though.
>
> In practice you have the legacy ISA IRQs and the 4 legacy PCI INTx. If you have
> a weird enough system you might have more than one PCIe bus, but even that fits
> more than nicely in 24 "pins". Does ACPI give more than 4 IRQs these days after
> an adequate blood sacrifice to the gods of AML?

There's a whole bunch of pins for misc non-PCI(e) things, including
plain GPIO lines.

~Andrew

