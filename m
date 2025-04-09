Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEBEA8218F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 12:01:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943718.1342373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2SEI-0005xY-Ca; Wed, 09 Apr 2025 10:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943718.1342373; Wed, 09 Apr 2025 10:00:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2SEI-0005ul-9b; Wed, 09 Apr 2025 10:00:22 +0000
Received: by outflank-mailman (input) for mailman id 943718;
 Wed, 09 Apr 2025 10:00:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5vFf=W3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2SEG-0005uP-9A
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 10:00:20 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 713c4fd4-1529-11f0-9eaa-5ba50f476ded;
 Wed, 09 Apr 2025 12:00:18 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so45406125e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 03:00:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893f0a80sm1172850f8f.68.2025.04.09.03.00.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 03:00:17 -0700 (PDT)
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
X-Inumbo-ID: 713c4fd4-1529-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744192818; x=1744797618; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5cRYYtEYKApOJth6FY32FTm/VcHgLQzSmgOZwKZX/ws=;
        b=MguLpULJ0y3S+RgUK+yztw0FnTBxoGbShfdODqidsamiWZkd0ADhmDWoT+byH2/gke
         oRM0lImhQ0djlRCA7cAa+7W3Ow3GeANFDnHeYVkIULegQST8D5dWS+QZGvjhvMQ2Pw4M
         nm+nzy1ffJVoL3TU3yr3YDJTEfmLqf8TM/26YoxdRm10qsInm2i0gH2rH0N7dmH7TrZI
         3HAFzN0mItMD7bNCC4WwHqX+AV7ssmptmC9C7Jg6nTvMzP5RUokKZiPa1sIKlXSeC76W
         +bpFm023neYaVdiefMWS8D0zvo7F8Sj9JXEg5ZaXtnRVoL75UTwvZK5rRpOw7CzbEn/2
         We9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744192818; x=1744797618;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cRYYtEYKApOJth6FY32FTm/VcHgLQzSmgOZwKZX/ws=;
        b=TNLRP2/AEzvgh1Pic3e0KbrCrIFCa6G0AaBTSRFMbndRiR7rx45Sr7HAO20lNCAS3m
         lGUBUa11zLHnTDlb6Hy1kRyhbcA49/LAmPeOeb9Vmoeq5jF/W1FHSibHR8XYvPfLbxy4
         l8/jD5FE9j7rsTInjhcUKP2syOXU5nIclarzqdhBuIHsZo6TMIuI0o/P0UJgTHUcG4gG
         P3ghFBmcM74luAh2rT6lzNujadf1m2gLOK1P7MDUaLP+1U1zV5gLjtkS0aAQcAMOuscD
         lYRzZekWIEJqOJkspRj4pTpwC8g1bcU6uZTnriP1WqU1mtQsjCDn88ea17i7CZ7tCvW7
         QvJA==
X-Forwarded-Encrypted: i=1; AJvYcCUm37H494QOZ/X9IY1sHKrncazzmp4AWBO//j3SD8PxhDAqmHiL+r9xModPuZp8dOIMrp3HuDmWbAU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxuivZNUZfaYe1TGmdSVsg3YgzQSnreITctimv9SVqiGKPtf6qo
	oyV5RG6YyDmKnjW/U4OuKh/xSAVEt9Pg7Fk6TSBz5r4RCY+eyY9jmwshHX+auw==
X-Gm-Gg: ASbGncvjoNuFLfNJtwAk2Ri1v0POhvaT4U+noo8JGGWtmAaTXEpd+P1jyy3RDHYqiZH
	ozK6DD+qJ2FI0QLau+dlOIBPb3p/J4L5IKQgycIi17lpA+F2DM52FoQ8izqpGQvxCNE713EYAIP
	vPtAdxuffeP4yYh7c3KBYTQ11QtwJOv27RGwjDKgVxhX4jZriV1WRkvREbsyJwQettTvvv/ac0g
	2idxCZRqCs8BS6e4KnrEDBRt4wxzv9C9yqByf66JOyP7BIJLCn/9TEClTkqDRRtowlQdlKiXeJn
	VM30ouOvinOu39VDbzig4c27LtTLoKTMQ1kPJUfG2LBvKB1ptHmOJJcSM1ve8u1ggQPZbOYcf5H
	XBQ3yQfWJaTsQSadfyoM6GybVZg==
X-Google-Smtp-Source: AGHT+IH1fdyvBFo4kIbhc+fZkuIuPYp5DFiegcW8IHwN8SuXq0/Kjv4FnaZ37cB5Drll15kjfDDxvg==
X-Received: by 2002:a05:600c:8508:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-43f252f558fmr11624555e9.14.1744192818103;
        Wed, 09 Apr 2025 03:00:18 -0700 (PDT)
Message-ID: <ef0b6eea-a7e5-406d-a8ba-062b3c6e17e1@suse.com>
Date: Wed, 9 Apr 2025 12:00:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/hvm: fix write emulation of RO ranges
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250408093156.83277-1-roger.pau@citrix.com>
 <20250408093156.83277-3-roger.pau@citrix.com>
 <16c73cae-2ac0-4811-97d3-b25c95ed5abc@suse.com>
 <Z_Y4xFzaltr_XKO4@macbook.lan>
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
In-Reply-To: <Z_Y4xFzaltr_XKO4@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.04.2025 11:07, Roger Pau Monné wrote:
> On Tue, Apr 08, 2025 at 03:57:17PM +0200, Jan Beulich wrote:
>> On 08.04.2025 11:31, Roger Pau Monne wrote:
>>> When running on AMD hardware in HVM mode the guest linear address (GLA)
>>> will not be provided to hvm_emulate_one_mmio(), and instead is
>>> unconditionally set of ~0.  As a consequence mmio_ro_emulated_write() will
>>> always report an error, as the fault GLA generated by the emulation of the
>>> access won't be ~0.
>>
>> Which means subpage_mmio_write_accept() is flawed, too, on AMD (or more
>> generally whenever .gla_valid isn't set).
> 
> Oh, yes, good catch.  I didn't notice that one.  We should move all
> those checks to use a paddr rather than a gla.

Really that function could just be passed the offset into the page.

>>> Fix this by only checking for the fault GLA in mmio_ro_emulated_write()
>>> when the guest is PV.
>>
>> This narrows checking too much, imo. For VT-x we could continue to do so,
>> provided we pass e.g. npfec down into hvm_emulate_one_mmio(), i.e. make
>> the gla_valid flag visible there.
> 
> I don't think we should rely on the gla at all in
> mmio_ro_emulated_write(), and instead just use the physical address.

But you can't validate a physical address against a CR2 value. And I view
this validation as meaningful, to guard (best effort, but still) against
e.g. insn re-writing under our feet.

Jan

