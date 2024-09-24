Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A219847CD
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 16:40:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803014.1213402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st6hU-0000DT-Hi; Tue, 24 Sep 2024 14:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803014.1213402; Tue, 24 Sep 2024 14:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st6hU-0000B5-ED; Tue, 24 Sep 2024 14:39:36 +0000
Received: by outflank-mailman (input) for mailman id 803014;
 Tue, 24 Sep 2024 14:39:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4pT6=QW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1st6hT-0000Az-Cr
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 14:39:35 +0000
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [2a00:1450:4864:20::143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0508808-7a82-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 16:39:33 +0200 (CEST)
Received: by mail-lf1-x143.google.com with SMTP id
 2adb3069b0e04-5356bb5522bso6659856e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 07:39:33 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930f2ecasm91792666b.146.2024.09.24.07.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 07:39:31 -0700 (PDT)
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
X-Inumbo-ID: d0508808-7a82-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727188772; x=1727793572; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ty9j8+PI+H4p7xWIP3r+ShNxPvzSkvJr6OpFE28EWzM=;
        b=hnGbRN6t4ixSy36/Xqw1mkZANjegXRgTfn9MAbSbkhDxQA2hmrdyX6fonPVv4h9x0/
         UJxuNAqEOps3oZxQ5Bq2GM7d8SvVLaXnj4DjKPEy/euWTbtxAa/CrSCm87aS+XvJqBsu
         AxtbansZF5MmP9WfBu+XvT4l/qomLhv8Zkjz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727188772; x=1727793572;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ty9j8+PI+H4p7xWIP3r+ShNxPvzSkvJr6OpFE28EWzM=;
        b=heLXs4avBuPaMst0x6ws39ZJgTmyAJ0WkAqRfwm/vBNEmUik4rmiKeRfKpulCVabSz
         5CsN2nfJsB5Zi51Y6/Km/6Oti6GGu54grk+KMsv8b6PjWAU6OT2+hpIcs3AvG+NxtXb9
         8e/31zn0mi4y652lB3RgMq+ufZxQ6Lj0vlqDF1oNKSeg6JdXcMXDEQi3LtbP0VMCDmSr
         opIzTFxGynGA/nD642/d5V9VTF+KTEdr5eN/QbkyldoXSu1l68+JLpFBVe7ozaSpektA
         rRrB/6jQHRSBanz7fUR/C1v3F8kQmpX4dmQXNdcXRcWE2G29AN76phqsVfFucKIuwLGa
         oFEw==
X-Gm-Message-State: AOJu0YzTzfWkRa5rEqU20GpykNFvJkLUBDUCLZA1eYSPhBixHyG7kPMM
	j9P9mIGRXHUh85Y/2h4cK7YYQOCiIXGaUz12pDHqAkIXgkesZp3xL1D9K1+kjTg=
X-Google-Smtp-Source: AGHT+IEFYeGZZGRwMMUkPDTgc7lkzNK6sNlF9WzIkD/XlOW+yu95S0xs9BQS4hMvhlpFfCQD1tW9Ng==
X-Received: by 2002:ac2:4c41:0:b0:536:533c:c460 with SMTP id 2adb3069b0e04-536ac3401d2mr7561241e87.50.1727188772427;
        Tue, 24 Sep 2024 07:39:32 -0700 (PDT)
Message-ID: <2c9e40d3-0b79-4c2c-8996-74a7aeabead3@citrix.com>
Date: Tue, 24 Sep 2024 15:39:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Further simplify CR4 handling in
 dom0_construct_pv()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>
References: <20240924112343.193506-1-andrew.cooper3@citrix.com>
 <ZvKw25fHecADv9NT@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZvKw25fHecADv9NT@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/09/2024 1:30 pm, Roger Pau Monné wrote:
> On Tue, Sep 24, 2024 at 12:23:43PM +0100, Andrew Cooper wrote:
>> The logic would be more robust disabling SMAP based on its precense in CR4,
>> rather than on certain features.
>>
>> A forthcoming feature, LASS, needs the same treatment here.  Introduce minimum
>> enumeration information, although it will take a bit more work to get LASS
>> fully usable in guests.
> Reading the ISA, doesn't LASS require SMAP to be enabled in %cr4, and
> hence disabling SMAP already disables LASS? (without having to toggle
> the LASS %cr4 bit)
>
> "A supervisor-mode data access causes a LASS violation only if
> supervisor-mode access protection is enabled (because CR4.SMAP = 1)
> and either RFLAGS.AC = 0 or the access implicitly accesses a system
> data structure."
>
> We can consider also disabling it, but I think it would need to be
> noted that such disabling is not strictly necessary, as disabling SMAP
> already disables LASS.

Hmm.  LASS looks to have no CR4 dependencies on SMAP or SMEP, and the
ISE does suggest they can be used independently.

However, I see no connection to paging (beyond LMA), and that is going
to become a problem in due course.

Anyway - I'll drop the LASS aspect for now.  It can be left to whomever
gets some working real hardware first.

~Andrew

