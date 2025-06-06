Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB7CACFD69
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 09:22:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008019.1387233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNRPQ-0001Xn-C7; Fri, 06 Jun 2025 07:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008019.1387233; Fri, 06 Jun 2025 07:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNRPQ-0001VF-8u; Fri, 06 Jun 2025 07:22:36 +0000
Received: by outflank-mailman (input) for mailman id 1008019;
 Fri, 06 Jun 2025 07:22:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNRPO-0001V9-Np
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 07:22:34 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 034a5696-42a7-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 09:22:33 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso1651589f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 00:22:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2360309266bsm6588095ad.74.2025.06.06.00.22.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 00:22:32 -0700 (PDT)
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
X-Inumbo-ID: 034a5696-42a7-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749194552; x=1749799352; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7ntZFmKiwYH95etsfz9OpmHkTVQttLVLgGPMkYGx32s=;
        b=Cieza3+td0sVzYCAJrolj4+ke6VjqwvVgCW1VEph56P7WiycssDmDBPa0Ps6Ap/eHu
         MszQcz00KppE28NMBTKIHIC79cQlOmdPtbcEccT0EQ0CLywJNc3p3j4IQIXH6MSjhKUz
         2uOZLB0s+znrdKwCFu5kDm7X3YAJxWYtqs0/g4JJi6LtknVYsLaxGvr99JVqhXkyfH+0
         0413Njv+vqWzD3CjdPwNCTmFn6CZCjQwBn89OZk22WVsUvcWp0/E/kbBTt4NccnMPgj7
         +jdWEg22d0hNyLBRt6U4EcmI+Dx6uw2YJY/+GgH8zJgp7oquleDm9aH5wCbjc1XlClHU
         RIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749194552; x=1749799352;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ntZFmKiwYH95etsfz9OpmHkTVQttLVLgGPMkYGx32s=;
        b=bBYxL0c4a63zsXzNP7V7vn4otukgoLvVpn9YgSf46Bhx10J/uZ5b2sm9lEge0tL8QO
         U/CCfWSl8SEw5vqr0eocTtw+KGuQDHxOHmLlDxPhL9aKU0z5TCNJfQ2ykZqdahWbUhS+
         Ae2Maa4DzC8U2qS/Zq9+lIVXFkY44ewUTYpqsFbDGxDEJMEuOOmIWHuWwt5GoDUC87C8
         dtSVWoSnBurf/dBSW6dzWRp9SsMzEy012N5HVTLU23GE4ugD2XIWEiafNiMT4+jKXEx9
         iPVINS1K4EK7DVXMSIxM3Bo7GVxIGzTf0NvNz04xmTqVbfTWpGUGuOGOl/rfQVErl8zP
         DE/w==
X-Forwarded-Encrypted: i=1; AJvYcCWlYELDrh4gBH9k9gAJzfhOdRTQcVmy1OES1PsgBTupBmZKr3OM6wO0rwq8Uj6J+r0oGIoe3M1cXdY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyBtdpYelADVxJ7EZFRRd0dvVsrKvvHaBZ7YjNwk1v1RehDd1k
	M6IGo28/rUoiDC35y80De2MKe5tCXpQ0yNObsH+aUW++uvE83pB/bGlwsgOVTbhHOQ==
X-Gm-Gg: ASbGncveTRrco4eJLRbJ73W6rDsSY1EstnrBzNKTjybKCgavREl9+zz6OBBVl0i+5Ff
	VqHqbwcPy5fCZ1NwlghKOUTQDNjyg0K/WFm8yQDWgmRJLsrneX2xzaLkNR2RDErVO1G4Wzwi1nV
	d1rHD36wwjHBsG5M66lniUMW5k/+CCjaF+Onj4ZicSUr499OuqZNp1ERcnWhmnpn+UMBzvIHhe0
	9QQ2jYUJhulykBfSWSJ6XAwitjEpEbp7YI7jDK0Rgi6+sp4s4x/6BZUv2XAsa07mRGxlj61BUcx
	tEcwnJTR3wxqGneodHTGeoiEYcw0CvuNYice7H5rutfRg38JzVdwj4O+h+Mnjui1yKXw7GOwYvZ
	eZ6Hperxlqu8UjNV3deGYeXMrikp6B8mAmFNhAL5PK35OhtcuzR5Tpy2grw==
X-Google-Smtp-Source: AGHT+IEPunL/Z6eliYTF1BSH1171nPVhYPNEsdmzlYZdkbO8omc4VYwOyuMNPLtVsRDJoY8ObzXQDQ==
X-Received: by 2002:a05:6000:4023:b0:3a4:e68e:d33c with SMTP id ffacd0b85a97d-3a531ab7294mr1612704f8f.47.1749194552533;
        Fri, 06 Jun 2025 00:22:32 -0700 (PDT)
Message-ID: <6eaf2b27-969a-4326-9726-8b6e0994e006@suse.com>
Date: Fri, 6 Jun 2025 09:22:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/EFI: Fix detection of buildid
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250605111638.2869914-1-andrew.cooper3@citrix.com>
 <20250605111638.2869914-2-andrew.cooper3@citrix.com>
 <0a314400-126a-4c2a-b36c-dda61bb0b751@suse.com>
 <a477369d-77d0-48fa-8ac4-120d49e32d11@citrix.com>
 <4d1f1b70-e309-453b-bae6-e066d49a417a@suse.com>
 <9200277c-aa8e-4fd9-ab6a-f9e106114f54@citrix.com>
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
In-Reply-To: <9200277c-aa8e-4fd9-ab6a-f9e106114f54@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.06.2025 19:01, Andrew Cooper wrote:
> On 05/06/2025 2:24 pm, Jan Beulich wrote:
>> On 05.06.2025 14:14, Andrew Cooper wrote:
>>> On 05/06/2025 1:02 pm, Jan Beulich wrote:
>>>> On 05.06.2025 13:16, Andrew Cooper wrote:
>>> This really is a property of being a PE32+ binary, and nothing to do
>>> with EFI.
>> Which still can be checked for without having this code path being taken
>> for xen.gz, too: You could e.g. check for &efi > &_end. That's firmly an
>> image property (yet I expect you're going to sigh about yet another hack).
> 
> It's all hacks, but no.
> 
> I'm amazed MISRA hasn't spotted that we've got a global `struct efi
> efi;` and a label named efi, creating an alias for the object with it
> out of bounds in the compiled image.  But even then, it's based on
> XEN_BUILD_EFI not XEN_BUILD_PE and does not distinguish the property
> that matters.

The use of XEN_BUILD_EFI in the linker script should have been switched
to XEN_BUILD_PE when the split was introduced.

> But the argument I'm going to make this this:  Why do you want a check,
> even if you can find a correct one (and as said before, I cannot)?
> 
> This function is run exactly once.  We've excluded "nothing given by the
> toolchain", and excluded "what the toolchain gave us was not the
> expected ELF note".  The only thing left (modulo toolchain bugs) is the
> CodeView region, and if it's not a valid CodeView region then we've
> wasted a handful of cycles.

Two reasons: Having code which cannot possibly do anything useful isn't
good. Misra calls the latest the body of the inner if() "unreachable code"
and objects to the presence of such in a build. (I'm pretty sure Eclair
wouldn't spot it, but that doesn't eliminate this being a violation of
the respective rule.)

And then, based on your reasoning above, why don't you also drop the
#ifdef CONFIG_X86?

Jan

