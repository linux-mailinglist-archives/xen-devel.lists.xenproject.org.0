Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 107D89F4791
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 10:30:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858670.1270916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNTtv-0000t0-L3; Tue, 17 Dec 2024 09:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858670.1270916; Tue, 17 Dec 2024 09:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNTtv-0000qb-Hx; Tue, 17 Dec 2024 09:29:59 +0000
Received: by outflank-mailman (input) for mailman id 858670;
 Tue, 17 Dec 2024 09:29:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNTtu-0000qV-4X
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 09:29:58 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 792d1282-bc59-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 10:29:54 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43622354a3eso35146505e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 01:29:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4363602c9d7sm111021545e9.16.2024.12.17.01.29.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 01:29:53 -0800 (PST)
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
X-Inumbo-ID: 792d1282-bc59-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734427794; x=1735032594; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3A9RlaLr39wUofKB4B3KHUPUw1GkTQLzaTY0Xa0Iy4A=;
        b=I08UMmPctIHnFaYefJfZwgtZX73tyS8Ka27fyjGnKymknQFI0Y9Ee9bSrSENkZvQqj
         N97bnhLw8pNWl88egrBoRGp8WqYL4VPVz+JkZMwHA/tUKKblsVIvfuQcDzsX6Vi0jkCp
         LoWlY6udJoSrvP6jN5H9EGDeAC3kvBNz8N9/G/wOl5bTWLCftrwIwP/eivM7M8sN/Oqs
         qOw5ZMZ7OQyYuoTwEzkCJ6jNgwsIhACFudhIJ9ka5nak88XGY9x/flnDdXXHFkQi1yNo
         gL+lR1KnfKk7s/GS44A6QSIzEhZzlP7h2eb8LbCPy/w7Gp+fPdIRX9vn+D8sGhI3bYbJ
         HSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734427794; x=1735032594;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3A9RlaLr39wUofKB4B3KHUPUw1GkTQLzaTY0Xa0Iy4A=;
        b=GzAckfzC7gEFTdCzykroU08LFOTIqUhnLYF+FVFqnGm17ooTf5Ht2JdPQnXQOuCkeY
         LKvXFkTNCc6Vh5wWFNgVm+mGy+kcYCSbSS3BK3UPW6Cz9VafuDnp2XIw7oPL/KPVof0T
         chhXMb9jhWsqWYQ0xfx6l4WPqCxL9aPNso3e261EbkcvIKQdJ1hqPwmPkR1SbkS80k7t
         Z98IwILO06pHFBvic2uhgIQsNsH+CHGsTgj+0/n5w3t2p5c78IA2UW3SIo17lOSZkgML
         PbuY9qiopLSiJ9+wJIM3VAK59mzhwpUTuM/g97Wm+WHAVxnRdOVTG9qwmBDly5f2mFEN
         X93A==
X-Forwarded-Encrypted: i=1; AJvYcCVNVuc2Z8oGpnsO9vSBzqwuX0YQ1ow1hgnSqzQoVBxpRrrtC9IH3nUgpfUf1oGi/j/t1EcUq/HvhgY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxq+2lvUukG3slDcf1Zzo3aNpmUH8dpZxqW+DGeNZ9dOz3kDSHm
	M8KnsgICwFO6THxV0yvJ7zhRSmki80NpZJ0Vga7TJnCEmhNZlh6fnCB6RCczbg==
X-Gm-Gg: ASbGncsplHTUtbht2/UJ7LPoZYmxBBpRm1jAg7QDjhGTxjxqDbY7a7iBQuuwGZPn5SR
	6VSnWShjJehwl6HHv18zNiYlRQtSpniw29FLautK25hZDZUcfK7Ko2BtiC0ls6TqSlr7Sz8TDA6
	WoAZwcpr/6jHoo1SB4lMgU19P1GpPeprmnEy+w+SSNYhuLydNpkavZq7yjW2dsgglnLRgY+e9ow
	cIUZWVjvjMHgwivT/e3mbY3Lqy9BpeF+e0Qf73O/tGUMJo5Euhy26N0kYRHVj2NHbRgBEGOPWgc
	Jouk6jBJkCwWlYAeEgpnxI/qGQjpy2MT60NA/BY8Cg==
X-Google-Smtp-Source: AGHT+IFfXowhNC600y8aw0doIJF2sVTY+PN+VHV2XtfOM1eL1l9f8xPrTlLYGBrHh/YGIhEfL6Fpow==
X-Received: by 2002:a05:600c:524a:b0:436:488f:4f3 with SMTP id 5b1f17b1804b1-436488f0687mr20986365e9.17.1734427793816;
        Tue, 17 Dec 2024 01:29:53 -0800 (PST)
Message-ID: <cf8d3ff6-b72d-468e-a14f-1dfbc741f376@suse.com>
Date: Tue, 17 Dec 2024 10:29:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] tools/libacpi: clear ASL warning about PCI0
To: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20241215154659.151158-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241216235241.217642-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241216235241.217642-2-Ariel.Otilibili-Anieli@eurecom.fr>
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
In-Reply-To: <20241216235241.217642-2-Ariel.Otilibili-Anieli@eurecom.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.12.2024 00:50, Ariel Otilibili wrote:
> iasl complains _HID and _ADR cannot be used at the same time:
> 
> ```
> /usr/bin/iasl -vs -p tools/firmware/hvmloader/dsdt_anycpu.tmp -tc tools/firmware/hvmloader/dsdt_anycpu.asl 2>&1 | grep -B10 HID
> 
> tools/firmware/hvmloader/dsdt_anycpu.asl     40:        Device (PCI0)
> Warning  3073 -                                    Multiple types ^  (Device object requires either a _HID or _ADR, but not both)
> ```
> 
> Per ACPI 2.0 (Jul. 27, 2000; Section 6.1, page 146), the configuration was legit:
> 
> "A device object must contain either an _HID object or an _ADR object,
> but can contain both." [1]
> 
> But, per ACPI 6.5 (Aug. 2022), this is no more legit:
> 
> "A device object must contain either an _HID object or an _ADR object,
> but must not contain both." [2]
> 
> Generally _HID devices are enumerated and have their drivers loaded
> by ACPI ("ASL 2.0 Introduction and Overview", page 4).
> 
> Removing _ADR, the warning is cleared out.
> 
> The change should be compatible down to OSes released after ACPI 2.0,
> including Windows XP:

So my earlier hint apparently wasn't clear enough. I really would have
expected you to determine in what version the wording changed. Even 5.1
still has the old wording, and that's more than 10 years newer than 2.0.
And then in 6.0 the wording first changed to "but should not contain
both."

With this I'm afraid considering just WinXP is insufficient. May I also
point you at a Win2K related comment in acpi_build_tables(), seemingly
suggesting that that still was a "ACPI 1.0 operating system"? Further
in that function you'll find that apparently, besides the 1.0 special
case, we only support ACPI revisions 4 and 5. Therefore the spec change
in v6 would become relevant only once we actually supported (and
surfaced to guests) v6. At that point I'd further be of the opinion that
unless it can be proven that _ADR is unused by any OS we (ever) care(d)
about, we'd need to further split the set of DSDTs we may make use of.
One (pair) for up to 5.x with _ADR present, and another (pair) for 6.0
and newer with _ADR absent.

I'm further afraid that ...

> 1. The _HID kept in the DSDT files is the EISA ID "PNP0A03",
> Microsoft recognizes it as PCI bus:
> 
> ```
> $ curl -k -s https://download.microsoft.com/download/1/6/1/161ba512-40e2-4cc9-843a-923143f3456c/devids.txt | grep PNP0A
> 
> PNP0A00         ISA Bus
> PNP0A01         EISA Bus
> PNP0A02         MCA Bus
> PNP0A03         PCI Bus
> PNP0A04         VESA/VL Bus
> PNP0A05         Generic ACPI Bus
> PNP0A06         Generic ACPI Extended-IO Bus (EIO bus)
> ```
> 
> 2. Linux 6.12 uses also _HID for identifying PCI devices [3]:

... this fact alone means very little here. The more important question is
whether there are / were OSes which use(d) _ADR for any purpose even when
_HID is there. With just looking at the surface of just Linux, I find e.g.
a library-like function acpi_get_local_u64_address(), all users of which
would need auditing. Plus, once done, we'd then still only know the state
of things in one specific Linux version.

Bottom line: I wonder whether iasl has an option to suppress that warning.
Sadly I can't find a new enough iasl anywhere on the systems I have easy
access to, so I can't check myself. If there was no way to suppress this
warning, I'd wonder whether this wasn't a shortcoming of the tool, as the
warning is clearly inappropriate when dealing with tables for pre-v6
configurations.

Jan

