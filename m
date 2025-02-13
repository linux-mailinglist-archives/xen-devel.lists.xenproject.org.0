Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A655A3394F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 08:54:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887171.1296711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiU3R-0006EU-NJ; Thu, 13 Feb 2025 07:54:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887171.1296711; Thu, 13 Feb 2025 07:54:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiU3R-0006D1-KJ; Thu, 13 Feb 2025 07:54:37 +0000
Received: by outflank-mailman (input) for mailman id 887171;
 Thu, 13 Feb 2025 07:54:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiU3Q-0006Cv-JK
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 07:54:36 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c48fd6e6-e9df-11ef-a075-877d107080fb;
 Thu, 13 Feb 2025 08:54:35 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ab7f860a9c6so128076566b.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 23:54:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba5327fc9bsm77238966b.75.2025.02.12.23.54.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 23:54:34 -0800 (PST)
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
X-Inumbo-ID: c48fd6e6-e9df-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739433275; x=1740038075; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zdvaPk3izpEGuYQ5fMrH1HYGcQiZuqND24Jk0T6/qzw=;
        b=K1gAxhameFu6IVu+IBBZKa5AUYV8PxEsOHXfFvLP8qu78Btky1ZqJNKWsUxiSPVWWk
         hCfT9HCMd0V5G/kA5oD3iAMuCp5w1vIahhe2FHMnzbBEbFYZD/fAoK/XkidbR4uCfACB
         1yv3XmM+2rF6k+N5WK8NJpfFLsAE/g5sHn2lGo19wp5ZWQftDOkNta84db/zuYCsEPOX
         99QjATezy7vxToTShEQxEbvaXUBBm8kr5R8cw+SkEAJE2qyPbMyNni6tNE4EGd4oj3eZ
         VDg6E4Ht2loNhcorftthU6CszzDgQ1ci3+TNOkib6FyEemL/W9CpUwu2BjQmjpE05F3l
         oFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739433275; x=1740038075;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdvaPk3izpEGuYQ5fMrH1HYGcQiZuqND24Jk0T6/qzw=;
        b=q/mBYnHBLyjA3lPU1wJg/e+99umfmzZ7nkcNf1kGc0sXNy/mnoiLFsjOv66Y3zxaG6
         EQUu6wKMtJ/FpgEmSKGTs9I+F4e7xHV2AtMLQnZYfeH4OOf7QJGBUZ3BUcQDjyfvK7I4
         qDDnbBZwc+hkj9g+a7LDodJknX8o06WBhgBMTUscV+P+U1+KWVQDWlfbTw6v0WKS0lvK
         H4QLxyoA5VyPKEQvssTV4pIDapBQliNIN+MJSR7npIAr1pJDU4iNnBFy3Ffa1JWeoK4i
         RrLYyJJcCmhZwEEBJLDizadb/PLlp5YmDRAvEJbQ5Ho1787EwiiB3z65V6BCH9uGSTCo
         pGVg==
X-Gm-Message-State: AOJu0YyOkp9zNwsZYbUC3JZM0ybnQDUcF693oG0+xjyJITVUbh2kNwYP
	Ya3J0NtnVUTUa54b9ABL0fr/XZ8IqlMdg/H7UI8PqquUfbH7bIvqD9DLxuswjw==
X-Gm-Gg: ASbGnctA878GaaXpVNrHMrEvAgbG7Yt68bSLq8Y+V88J8p/RCzHEYlxshcT+kPylRWs
	34yikGhPyY4Q+fWWIIIFr1UvuBK4LVNh/h20tUYqb8zSahSbaudZuUjg/t8HkhZKuUR6yRKGbEW
	KAfXrCY9lC506h/U+OFnxA09mX4Hkgtqg/P610ro3fqzFIfvvydmnUn8E/VkwA699j3YsLBRTo5
	2n+QD2eR0X5AT2+8mffnxhGwNfJQrE1K/FtyQqQaFyxI2mkFVTxJ+w6NSUxsapJR/HQf8u9hvCz
	D+VrmoncnIXl/89Bx1WA1u6MMcA8E7Z4ydEtB5JjFWSfrChLJpZf2mhEnPai2sj3o6TJVfm+Y0d
	q
X-Google-Smtp-Source: AGHT+IFmkrcG0XI0mKsuqlL1lYBS3ydxUFrZ2BVsgw0DF3TTU8+qynmcJVChwUg7MH4j1A5ORmxyHQ==
X-Received: by 2002:a17:907:9495:b0:ab7:9a7a:d37a with SMTP id a640c23a62f3a-ab7f34a0a58mr644142566b.43.1739433275246;
        Wed, 12 Feb 2025 23:54:35 -0800 (PST)
Message-ID: <a92378ca-ba24-4332-897c-9cb072fdebc8@suse.com>
Date: Thu, 13 Feb 2025 08:54:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG?] Wrong RC reported during 'make install'
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, committers@xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <69a52464-4e2e-43fc-9792-46d7a9614a80@gmail.com>
 <alpine.DEB.2.22.394.2502121347430.619090@ubuntu-linux-20-04-desktop>
 <4d53aa6e-640d-4b49-9e45-0684fb263833@citrix.com>
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
In-Reply-To: <4d53aa6e-640d-4b49-9e45-0684fb263833@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.02.2025 01:51, Andrew Cooper wrote:
> On 12/02/2025 9:52 pm, Stefano Stabellini wrote:
>> On Wed, 12 Feb 2025, Oleksii Kurochko wrote:
>>> Hello everyone,
>>>
>>> During the installation of Xen on an ARM server machine from the source code,
>>> I found that the wrong release candidate (rc) is being used:
>>>   $ make install  
>>>     install -m0644 -p xen //boot/xen-4.20-rc  
>>>     install: cannot remove ‘//boot/xen-4.20-rc’: Permission denied  
>>>     make[1]: *** [Makefile:507: _install] Error 1
>>> My expectation is that it should be xen-4.20-rc4.
>>>
>>> I'm not sure if this behavior is intentional or if users are expected to set
>>> the XEN_VENDORVERSION variable manually to ensure the correct release
>>> candidate number.
>>>
>>> In my opinion, we should set the proper release candidate number after
>>> "xen-4.20-rc" automatically.
>>>
>>> Does anyone have any thoughts or suggestions on how to resolve this issue?
>> Hi Oleksii,
>>
>> I did a quick test and I see exactly the same on x86 as well. This patch
>> fixes it, but then it would need someone to update the RC number in
>> xen/Makefile every time a new RC is made.
>>
>> ---
>> xen: add RC version number to xen filename
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> This is a direct consequence of the request to keep XEN_EXTRAVERSION at
> "-rc" throughout the release cycle.
> 
> I'm having to manually edit that simply to create the tarballs
> correctly, which in turn means that the tarball isn't a byte-for-byte
> identical `git archive` of the tag it purports to be.

Just for my understanding - may I ask why this editing is necessary?
Other release technicians never mentioned the (indeed undesirable)
need to do so.

> I'd not twigged that it mean the builds from the tarballs reported false
> information too.
> 
> While I appreciate the wish to not have a commit per RC bumping
> XEN_EXTRAVERSION, I think the avoidance of doing so is creating more
> problems than it solves, and we should revert back to the prior way of
> doing things.

Sure, if it truly is getting in the way, then it needs re-considering.
Just to mention it: Then the question is going to be though whether
really to merely adjust XEN_EXTRAVERSION, or whether instead to do
this consistently in all (three?) places.

Jan

