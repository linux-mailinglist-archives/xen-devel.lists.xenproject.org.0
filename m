Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64563AFAEA4
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 10:30:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035314.1407552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYhEZ-0004HE-4Q; Mon, 07 Jul 2025 08:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035314.1407552; Mon, 07 Jul 2025 08:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYhEZ-0004FN-0y; Mon, 07 Jul 2025 08:29:55 +0000
Received: by outflank-mailman (input) for mailman id 1035314;
 Mon, 07 Jul 2025 08:29:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uYhEX-0004FH-OL
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 08:29:53 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d3bd3a1-5b0c-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 10:29:51 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so2754425f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 01:29:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8434f06fsm81404095ad.87.2025.07.07.01.29.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 01:29:50 -0700 (PDT)
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
X-Inumbo-ID: 8d3bd3a1-5b0c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751876991; x=1752481791; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=471omZRgZ8JsvS+OYLDUBwLEQjaeFOtbLSvp+l7HNOM=;
        b=Vd/KegVe6EhKWSZpEz9+/Gqp9UYFO5r+KNUdXnFm7ReoWVGTsWuJIRoWumstsCxYsA
         ce8xeHCRTEeElOZZhDwDgCaFclNvkxrM46uX8H9AINWKQfj42BkaULh9iTX7BXc/lj7F
         nvejbp6WTUOnQahBIRiaTwQ+wFeWQKJcVK0VRc+ErhAQDmtA3ENpAPxugbVjMFs0qVFP
         d4MRR5VbH6bt/Ec86m3m/CLnk873zfP1aLd56OmtuMvBiDnSF2Kxsf7UC8Anvj2ZpDLx
         zMp//Zq/z4HLSLwTTrRZLw3mWo+H7tj3+x6so/wHBToPZ3/wiKFb8jwm1myoZhlfMZed
         n40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751876991; x=1752481791;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=471omZRgZ8JsvS+OYLDUBwLEQjaeFOtbLSvp+l7HNOM=;
        b=Kio7Tm80II1aIOVHLsdr3FYd5ESXC6W7PW7V6hb1b0DAOx4TDIJs0wP2y2c6uWJeXH
         GYoflYcOYeuqdzHOU9cOjqeGnaJqtTfnuy3+SJdzs9uzTUQ+4cRTelDLOM459ouX6Dwj
         zDmheRTYp864TziLMFmfceTKPl2vJeRWtgMXLQonSHxknpPzxQdVm7kBg1ZbpoBWnl4+
         unvadBZGZv0I3U07bmuS+7aPAgTys7h3zl9aeMS9N9F/NAOlDa4hVHFXuUk8sN2XEP+L
         UVkdqL13DGtEFkGieGmvWL7dDeSixNZdWminjuKSnWukXxQHQC2tMoIk5NLOZU4Oi4sW
         gmhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUNu7qpqr4Auy0Tu4pyzBi5kABXsUDwgAyXi/wvWfxiUHk945W40+LIfpAXvCSQ8U9CVeGkn0gCnI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyEOAfNYJ/ZVCyNcFb+Z8sY/OzTL8pXRLrKRc4PGjJ/cTFUbKa0
	ywrJc9+3oYT1ftipswVTjkjZaiHlVvYvFljRX1HsjiczpEwQe3v9UBC/8KyxXRv0ZQ==
X-Gm-Gg: ASbGncv5APFjwhaMJWMeGW5I07bFRiNAnYHFt5NuTZFenEQQIZxbUH3H6BRdy93O1iT
	WLuRXaTlfPWdQRdC82HuZa7s031ceINE/rcMsyF0F9S5aGKZuOn0MqhXXLwxKinLmRYUa6hG+kz
	GplQeXQ1nUXAna8t8jnN4aaKcsuadRUZiGefEj2w88AFaDQ6vL1XWab0LMD3+rgUSbqcQRyNiRq
	AfHwoiX1h4JrKvV/Kzfze+4sFjn+Bf6twgR5Lhi1dtvB0jpHUOcKxRVYqbUKdT04lBcVsdR/ZJP
	Rto4w2loTk4nFEPxTAYicrAf/S8RtMkmMHC4RphS4p8a2Du2bkXThxVnAuR9n4ZEjN1s6vcUKj2
	ZKBWVe9uBFYd59treiCOTxfzLoOWm4lH6Saq7OtS9tNTFtYM=
X-Google-Smtp-Source: AGHT+IHh4QFZ9R1Ft0tWfr4XVGkUUExkwUpPx6pDNNA22WLT0aeV4FD7x5geQ+DvgqCr9EWkACMRUg==
X-Received: by 2002:a05:6000:41d4:b0:3b3:9c56:49bf with SMTP id ffacd0b85a97d-3b49aa87874mr6279197f8f.56.1751876991059;
        Mon, 07 Jul 2025 01:29:51 -0700 (PDT)
Message-ID: <faaa96f7-918e-4130-bde4-bb17194e1c25@suse.com>
Date: Mon, 7 Jul 2025 10:29:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/22] include/xen/slr-table.h: Secure Launch Resource
 Table definitions
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <49517f41e112720bdd2b76e8eb3d9b1064671f60.1748611041.git.sergii.dmytruk@3mdeb.com>
 <24c11542-0490-4fdc-bda8-01a5b3770856@suse.com> <aGqqisydEetf5mJ_@MjU3Nj>
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
In-Reply-To: <aGqqisydEetf5mJ_@MjU3Nj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.07.2025 18:55, Sergii Dmytruk wrote:
> On Wed, Jul 02, 2025 at 04:36:27PM +0200, Jan Beulich wrote:
>> On 30.05.2025 15:17, Sergii Dmytruk wrote:
>>> The file provides constants, structures and several helper functions for
>>> parsing SLRT.
>>>
>>> The data described by the structures is passed to Xen by a bootloader
>>> which initiated DRTM.
>>>
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>> Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
>>> Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
>>> ---
>>>  xen/include/xen/slr-table.h | 276 ++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 276 insertions(+)
>>>  create mode 100644 xen/include/xen/slr-table.h
>>
>> Btw, please don't forget to Cc maintainers of code you're changing / adding.
> 
> What do you mean?  I'm running add_maintainers.pl on the patches.

The Cc: list had none of the REST maintainers. (Whether there's a bug in the
script I can't tell.)

>>> +/*
>>> + * Prototype of a function pointed to by slr_entry_dl_info::dl_handler.
>>> + */
>>> +typedef void (*dl_handler_func)(struct slr_bl_context *bl_context);
>>
>> I keep wondering why this ...
>>
>>> +/*
>>> + * DRTM Dynamic Launch Configuration
>>> + */
>>> +struct slr_entry_dl_info
>>> +{
>>> +    struct slr_entry_hdr hdr;
>>> +    uint64_t dce_size;
>>> +    uint64_t dce_base;
>>> +    uint64_t dlme_size;
>>> +    uint64_t dlme_base;
>>> +    uint64_t dlme_entry;
>>> +    struct slr_bl_context bl_context;
>>> +    uint64_t dl_handler;
>>
>> ... then isn't used right here, instead requiring a cast somewhere (presumably,
>> as code using this isn't visible in this patch).
> 
> As was mentioned earlier: because size of a pointer between Xen and a
> bootloader doesn't necessarily match.  What you're proposing can break
> under certain conditions.

But the header isn't shared with a bootloader's code base. It's private to
Xen.

>>> +} __packed;
>>
>> I similarly keep wondering why there are all these packed attributes here, when
>> (afaics) all of the structures are defined in a way that any padding is explicit
>> anyway.
> 
> As before: it won't hurt, it's future-proof, just in case and to let
> reader of the code know the structure must have no padding.  If you want
> them gone, I can do that, but I think it will make the code harder to
> maintain.

Well, if there's a maintenance concern, then I would of course like to learn
about that. I could see such being the case if the file was imported from
somewhere. But with neither description nor any code comment not saying so,
that doesn't look to be the case.

Jan

