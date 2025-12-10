Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5384CB2F0C
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 13:45:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182911.1505724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTJYS-0003Od-IO; Wed, 10 Dec 2025 12:44:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182911.1505724; Wed, 10 Dec 2025 12:44:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTJYS-0003Mv-Fj; Wed, 10 Dec 2025 12:44:28 +0000
Received: by outflank-mailman (input) for mailman id 1182911;
 Wed, 10 Dec 2025 12:44:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NJGl=6Q=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vTJYR-0003Mp-IJ
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 12:44:27 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f510f13e-d5c5-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 13:44:24 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-640e9f5951aso1379572a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 04:44:24 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6496db4d839sm2203256a12.21.2025.12.10.04.44.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 04:44:23 -0800 (PST)
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
X-Inumbo-ID: f510f13e-d5c5-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765370664; x=1765975464; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lAwvMfCMhh5cdxo7JU3Ky1Pa6SEDggGx0ky1nAkrQxo=;
        b=h9yZD1T2JJAUyhWLJNZJA4I3noPYQ7G6zfo1GmEcCDTd89fl3lNo7BCm6XbO+lZnPD
         cRZPH7ORGlHTYZobXOZZl37xQdEE+7G8FxUcIoLmPx7fnPQ5W2nJpbIItXlZnbH89T8w
         1ofmdAAYvkT8w6ZBOi4zIs8pX0esUE5sgYqdIMxeVK8CS7KwOLYvQ2hwB5LnQqT0f71/
         InqRQ7+HLGPxQ30gEyFmAB3KWIPhXUZvvsiln4jHRmSfq593QM5dST4nspxx6mll1HxL
         Cm4FT/sullkQeczbeqF8jh1XpJcpVSD+7EbmsymgmI327gE4vSdfhHDrKnEwVR13r9N8
         eN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765370664; x=1765975464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lAwvMfCMhh5cdxo7JU3Ky1Pa6SEDggGx0ky1nAkrQxo=;
        b=UFHmg9zHgyLLGRuJOSn0C/tCIjaYp+QBctHT83KYyXb1lSYp5af1Cdi46zpz2yQ588
         s8PPnQjSMkk3zm/Xolbywo8yhW3VP+TfEXhlP99V/61u7eNz07X8yOdZzwPrZAsbYFje
         hN8Gwg7f/HtNd4rld1/EvZc4d6/AIFSsSBGgYOR0y9TFIMAnGkKzM4HXenz2CsNDH7Vb
         BdsoBl0eHLxABSYSpJt5lYeP9vR4HBrO8GyJQA0J2YrJLtZB4hIO3E54jRT9zhuf09a7
         pTcL0FfnDdyljCodBm2ybQhn+KHGBMILRsUySQKSFJcIP85dqhFynvEGm8lHMxHM0jAH
         GGJg==
X-Forwarded-Encrypted: i=1; AJvYcCVWpsz7tEo4tiCM09+TNLfJkPAfWFtr3YWhy4BR/D/oG4dFNZVgCggW2UWoF2a1dgyCCFbQTWDKa3w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy87yJjCj4FyU4j+V3LRAJwujSY5tUTcuGXz83TtDzHABFf8YbP
	uYF9yNqG/w4ttO6bfsPmXzm/8SR9goWRjqP9gWBKuyKRm1OxX96YzgMS
X-Gm-Gg: AY/fxX6TYj2QVBAXn3N9ahEKwWkh+zn1FFsPRFK295nVfMmm4N0QmZBYc4psWC3KDVW
	cnsdSdB+ZHNMFdRtenPF1rDYM8J4R3F1KvXzZYWpQhIYpMtLY8juoghNIrGjc6859lM5czVDgOw
	NFXveVkFv7+hMjzPJRKvSxDbUgz4zVBVWeP1iJ5cnNU0j9D000vNc1l5EBtbmNu/H9711W6+j1T
	7fCXjHBa+rcvVIfh9BUVYH1/wn+Ony6JmPBOgFBEM7Moae+4kGmWF3ZxvNa8a0IGiYO2XuZFlvj
	s5oxoIgtUVS4RPDSaRKHBY/AAP2ekvcTDzUVwgO140ZRsM04o20ujaPHJnQzs/zm2q7Wulap9tP
	ZA78KSqDrmpc8MQFwwllVCcKILCOX8H3z1KffMLHtCPATzXyMGqys7HoF/9ky7lW1e2aKBe2y+2
	OoKyIYap1Hnpz2a7G4CsxOa9x/aBUNolTnUfcLmK+fUTu19WI2g8uGJe9IDqrt
X-Google-Smtp-Source: AGHT+IHOEkk2KXETBL2fXWcRZFPJnbcjRIHLPMB5HWMI6uFQjnDoLdUedLmCrogrsDr8juo9Lw+zGQ==
X-Received: by 2002:aa7:d612:0:b0:640:abb1:5eff with SMTP id 4fb4d7f45d1cf-64963f319c4mr3300732a12.8.1765370663859;
        Wed, 10 Dec 2025 04:44:23 -0800 (PST)
Message-ID: <db24c624-0432-48ec-aecc-3efaa4973303@gmail.com>
Date: Wed, 10 Dec 2025 13:44:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 19/19] xen/riscv: introduce metadata table to store P2M
 type
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
 <2c41da84b3e7fb0f6e6c3c856bff6edaf9e1d505.1763986955.git.oleksii.kurochko@gmail.com>
 <889df78f-7196-4b44-9558-fb83f432e18a@suse.com>
 <36be69fb-9362-43a4-8308-1e62be60d27f@gmail.com>
 <621089a4-d946-46ce-a3cf-4d0938d4a39a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <621089a4-d946-46ce-a3cf-4d0938d4a39a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/10/25 8:06 AM, Jan Beulich wrote:
> On 09.12.2025 18:09, Oleksii Kurochko wrote:
>> On 12/9/25 2:47 PM, Jan Beulich wrote:
>>> On 24.11.2025 13:33, Oleksii Kurochko wrote:
>>>> +            *md_pg = p2m_alloc_page(p2m);
>>>> +            if ( !*md_pg )
>>>> +            {
>>>> +                printk("%pd: can't allocate metadata page\n", p2m->domain);
>>>> +                domain_crash(p2m->domain);
>>>> +
>>>> +                return;
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +
>>>> +    if ( *md_pg )
>>>> +        metadata = __map_domain_page(*md_pg);
>>>> +
>>>> +    if ( t >= p2m_first_external )
>>>> +    {
>>>> +        metadata[ctx->index].type = t;
>>>> +
>>>> +        t = p2m_ext_storage;
>>>> +    }
>>>> +    else if ( metadata )
>>>> +        metadata[ctx->index].type = p2m_invalid;
>>>> +
>>>> +    pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
>>>> +
>>>> +    unmap_domain_page(metadata);
>>>>    }
>>> Just to mention (towards future work): Once a metadata page goes back to be
>>> entirely zero-filled, it could as well be hooked off and returned to the pool.
>>> Not doing so may mean detaining an unused page indefinitely.
>> Won’t that already happen when p2m_free_table() is called?
> Well, that's when both page table and metadata table are freed. But what if a
> leaf page table is moving back to holding all p2m_ram_rw mappings? Then the
> metadata page is unused, but will remain allocated.

Good point...

This could be a rather expensive operation, since in the code:
   +    else if ( metadata )
   +        metadata[ctx->index].type = p2m_invalid;
we would have to check all other metadata entries to determine whether they are
(p2m_invalid) or not, and return the page to the pool.

It would be nice to have something like metadata.used_entries_num, but the entire
page is used for type entries.
As an option, we could reserve 8 bits to store a counter of the number of used
entries in the metadata page, and then use metadata[0].used_entries_num to check
whether it is zero. If it is zero, we could simply return the metadata page to the
pool in the “else if (metadata)” case mentioned above.

How bad is this idea? Any better suggestions?

~ Oleksii


