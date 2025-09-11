Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBF1B536DE
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 17:04:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120388.1465342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwiqF-0000rL-EB; Thu, 11 Sep 2025 15:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120388.1465342; Thu, 11 Sep 2025 15:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwiqF-0000pc-BY; Thu, 11 Sep 2025 15:04:07 +0000
Received: by outflank-mailman (input) for mailman id 1120388;
 Thu, 11 Sep 2025 15:04:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwiqE-0000pV-9j
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 15:04:06 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8efe49ef-8f20-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 17:04:05 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b04271cfc3eso107013666b.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 08:04:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32dd0fdsm147535466b.50.2025.09.11.08.04.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 08:04:04 -0700 (PDT)
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
X-Inumbo-ID: 8efe49ef-8f20-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757603044; x=1758207844; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8iCpDT/tx/mro9DOysbu9Xqq5zQA2MGoutiWSGpk8mY=;
        b=CZtS2Q7wce/dL3ZOp2YA1hLY96loQjbauPap8iq7UxuB6x2Yaqh2D/FYe06cDWTNc2
         KeYdSk6uvPpEiQj/kzpTpiyrrvqS5IZ739L9YZfJaOQQArh+af5vht9pUdpaDILNVGYJ
         GmBeXgywinqbk4P2qvp0EKcWhuhOftdLXw5slvwOZGsnnzdZlz6HeN2iX81cboO0Lvh6
         45lvCnH7Bh/iM2HCHpc5m1pj07N8+/5qZ5tvjHUzea1oAduSLgl0z+2amplUVemjCJe+
         RAGP7DgJJeP72s4iIEaD6z0gdsDOEfdNHihL3DtzeoHgzhNyfQdXRZvmoAMsd1tHoIdn
         wUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757603044; x=1758207844;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iCpDT/tx/mro9DOysbu9Xqq5zQA2MGoutiWSGpk8mY=;
        b=FEs6RNS2X6A5sViDH5z5UgvHuwZdzHh7b9IxSAx2V8xspD0b5fXMmCTWWB7+Rc5Caf
         16HuKGgMl9CJNVK8YPQRTzX62xsP2RWHSlvQKaI8HsLMgHeGr/HI2KOWYSykvPTqx5TF
         6RD/DX3I20wiAfiwn8Dx8tmx3cQeVATV5gnHBv/UATN681rLe5FLpfS+Yk13Fr5V9bNy
         rx+WkfEZx3sanI9N57tNrsrNGDZ2dXebCcHWX1fQWeykPhUTHlsQh2PTm2OJQeomiGLp
         qDkuFG9nrheX4meHPh7bKFi9Ba29jWox5aMvOZxN8s8r1Wy83cBdepvYcXDFOPUD+JMs
         tPzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWtPDJFvxDAtCdTyDqvzKwKwpvXss/VUiy/0Y1QVvn22AWPkcX6sxceKDCCgQkaRiZ6iAAQi09/FI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzhXjXM8c3KWHSmHP9EUzS6Hqpc+k2o1dbfGL4G56LFyNhfVjcL
	RK5xseLMJ8ts88v2qIKYbs+/l01lbTMPNIG/J86nT+4eo6F7zgDKmqAIBG5pFxSC+Q==
X-Gm-Gg: ASbGncsV7ZvPXzuqkVDYzsd7wgfhePHBfnK1X7/PESjos3FCLCrSA3PScbpRvyNBbxd
	mehcfTb9TbtgnAWpWdoZCXesKtTIFfLcY1mX/5abZqqelSfsQW4EpWnC/2u+EWSGIdZGn0dtkBw
	9eJ6N0hOtLM5CaCEqpqxnXOuAtmuMcwGEo9bnt/nso39/5bT1OzTLn14wtKdb9kXnhQgQcSWKAO
	P4372R3mojGrGmE/lB4whoSwNo1Z99DRH15FREB5Jq0XtB9Bxv+kctYWdzfy1ldGStaaqZQqoXD
	xVWgVR3VXY9Djp0UHRIdGKlrk2jUHSGIsVG282i/q8sy8WkG8K16p9ygjJ7RDQuYKHnmXO11Y/R
	8aPEuRvREWCpyedkvPZzFAth54em0n/SNl28MAkqD2WPyGXAkMLewYAMsRClCeNfu2MOHhiTyqj
	D0LuWukhnj+tnobEbDrOZPfjKB3F6H
X-Google-Smtp-Source: AGHT+IEwIj+hPkJpYoCFpJxg+pnZeko3tkv0RfVYId9ciB4q1ML5W+3jNfQKqj0C1ezJeRwIDfWt/w==
X-Received: by 2002:a17:907:807:b0:b04:7a92:c7cb with SMTP id a640c23a62f3a-b04b1687dc3mr1807994366b.37.1757603044310;
        Thu, 11 Sep 2025 08:04:04 -0700 (PDT)
Message-ID: <b77e3087-8f58-48fb-8370-0d71ed47811c@suse.com>
Date: Thu, 11 Sep 2025 17:04:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] libacpi: Prevent CPU hotplug AML from corrupting
 memory
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250911115308.16580-1-alejandro.garciavallejo@amd.com>
 <20250911115308.16580-2-alejandro.garciavallejo@amd.com>
 <42bf6ed7-3a6b-4021-9a53-1891117ff2ba@citrix.com>
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
In-Reply-To: <42bf6ed7-3a6b-4021-9a53-1891117ff2ba@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.09.2025 14:03, Andrew Cooper wrote:
> On 11/09/2025 12:53 pm, Alejandro Vallejo wrote:
>> CPU hotplug relies on the online CPU bitmap being provided on PIO 0xaf00
>> by the device model. The GPE handler checks this and compares it against
>> the "online" flag on each MADT LAPIC entry, setting the flag to its
>> related bit in the bitmap and adjusting the table's checksum.
>>
>> The bytecode doesn't, however, stop at NCPUS. It keeps comparing until it
>> reaches 128, even if that overflows the MADT into some other (hopefully
>> mapped) memory. The reading isn't as problematic as the writing though.
>>
>> If an "entry" outside the MADT is deemed to disagree with the CPU bitmap
>> then the bit where the "online" flag would be is flipped, thus
>> corrupting that memory. And the MADT checksum gets adjusted for a flip
>> that happened outside its range. It's all terrible.
>>
>> Note that this corruption happens regardless of the device-model being
>> present or not, because even if the bitmap holds 0s, the overflowed
>> memory might not at the bits corresponding to the "online" flag.
>>
>> This patch adjusts the DSDT so entries >=NCPUS are skipped.
>>
>> Fixes: c70ad37a1f7c("HVM vcpu add/remove: setup dsdt infrastructure...")
>> Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>> Half RFC. Not thoroughly untested. Pipeline is green, but none of this is tested
>> there.
>>
>> v2:
>>   * New patch with the general fix for HVM too. Turns out the correction
>>     logic was buggy after all.
> 
> Hmm, this does sound rather more serious.  I have a nagging feeling that
> until recently we always wrote 128 MADT entries.

Not exactly recently, but looks like that's my fault then: 0875433389240
("hvmloader: limit CPUs exposed to guests").

Jan

