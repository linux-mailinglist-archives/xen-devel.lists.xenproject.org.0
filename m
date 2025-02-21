Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 806A4A3F455
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 13:31:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894433.1303132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlSB3-0004aL-Sz; Fri, 21 Feb 2025 12:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894433.1303132; Fri, 21 Feb 2025 12:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlSB3-0004YM-Q8; Fri, 21 Feb 2025 12:30:45 +0000
Received: by outflank-mailman (input) for mailman id 894433;
 Fri, 21 Feb 2025 12:30:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tlSB2-0004YG-De
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 12:30:44 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa2c61ca-f04f-11ef-9896-31a8f345e629;
 Fri, 21 Feb 2025 13:30:42 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38f22fe889aso1701143f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2025 04:30:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba532322e6sm1640163566b.1.2025.02.21.04.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2025 04:30:41 -0800 (PST)
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
X-Inumbo-ID: aa2c61ca-f04f-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740141041; x=1740745841; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p585K4kbO73gGGTAGQFLmSHM5LtnHW2af3G+j1d0+o4=;
        b=SbXZHpsSvNQDXrdgRQhye2c0cSMnCJb0yXqXJ+z5npuf/oS2nK11PYQcAyYhqDpaSa
         EsesFnn8q3qsA2T5ugyTFsumpObrjk1g9oR5SgDFPncESML7RBHebVlEk5v3wishZWQx
         BQJs8w5l5NfMZ8T98KcZt/8qR4Fu4alMsm+bz48IRNx8uR9c0s+dj/CH9ZlwbFKAJK7U
         xHj5mhroJbAtEpWlWy64lB2kvPZdXsxHIrSugitJCW2qhG0E+KSBW8bbAc2dwZDQEK3t
         Br+Dm5TnzMfUGG+4urudkvx0D39RroVINzImX/eIEi8wNCNV+R8s0osKRo4CF7dmQ+0q
         n/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740141041; x=1740745841;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p585K4kbO73gGGTAGQFLmSHM5LtnHW2af3G+j1d0+o4=;
        b=Oda5CgkGglNc4ilh8tHMH9OLLO5CARuBCzgRL5MFjO6cfk1QFm593TIkPYm7+Xyp9S
         vHu0DCrJXMuZXDInfKIeQgQxZIuTTHiKKU8PjcQcUO8yFKOLZyZ3eCvgY/eUb5f+Pvc6
         K1jAx9mMzl3WMVIWJIlhg43yAyKxZKz3cM5Jf8JEq4aF00QWNjwYn9ErwsOPu4kLVjVz
         GEkmpQakQtinC982Silkni/C2t8Jba5h5IwUFWeP//tNGdNwlUPKFhtAJ5mHRURJ1jV4
         3NHG6SiuChruSvfjaMWvMieeJvaguDpkm/V4d7ALV9+kD7WSv33hLyTy6VHA1Fp3VMEo
         4TYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp9/kQJHWz1J1JlIlLX7TNh9qBM3zeh7aAjSkjjqWgaRyG5hOjTUJFpcF2uj5Rf3s0QN6Fk7UHM7c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwzYCzhqOMohWpfFCFr7+EWrCGziLjuvKbgwkq3z9Nx1uoFTFYs
	0kUu3GnSLGYN7/D0YVYBhD+DHzOKwhMe53CWlGwERCe5i1WTpx86rmeQS0UuKg==
X-Gm-Gg: ASbGnctqZV+X7aQ5LXODm46wIfK2RgSZLGNx0Gg7Mjwip5/vnnvmunbH6Tc4RiSy4Vr
	cukzO7oFDq8PQbx4K8ZYL+L3ikLWkY9X/52OXHvaOFlsjPdAJa8fPkSZuW8R6DD0s+k1HG70oW+
	8EZCimtckKOHicJ9ThPdfUzSdbDfyNKlP6WxVxMiq8HrjLwv5da+C3ti5p9SmjraHjPlbGB6GVV
	JqSdUbnxI1DnHTnpdeX92LFp7KJDzv5llFU29EvU6YBoEgUUZ3dvTIkpUW3cVdnKaX6Ri3UWjgO
	gFL5QSa+NpMc8Jl2VxZuADCtS6yd27t9ZOnR9r1OqV4Qh67KzTIYFqDGv/MZrH/Ed3+QyPIY0tb
	J16SO+CIhc6U=
X-Google-Smtp-Source: AGHT+IGuWdIFlrAm64VeF7eAkVYIhUBa7f+ODJom+4wCCZdMTsKfkbEfV6rJe93BYAp/22eEH+sIag==
X-Received: by 2002:a5d:648b:0:b0:38f:3e1c:211d with SMTP id ffacd0b85a97d-38f6e95bb57mr3710752f8f.14.1740141041507;
        Fri, 21 Feb 2025 04:30:41 -0800 (PST)
Message-ID: <e1215fff-65cf-418b-b13f-6405c38b1787@suse.com>
Date: Fri, 21 Feb 2025 13:30:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v7 1/4] automation: drop debian:11-riscv64
 container
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1740071755.git.oleksii.kurochko@gmail.com>
 <659bd8c00e79be1a47fc2aae75accd69b3bedaf4.1740071755.git.oleksii.kurochko@gmail.com>
 <d2a9d3f1-0584-4c9c-95c5-5babf0ffde06@suse.com>
 <d7b833b3-780c-449c-a07b-3b7198a0fa62@gmail.com>
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
In-Reply-To: <d7b833b3-780c-449c-a07b-3b7198a0fa62@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.02.2025 12:57, Oleksii Kurochko wrote:
> 
> On 2/21/25 9:35 AM, Jan Beulich wrote:
>> On 20.02.2025 18:44, Oleksii Kurochko wrote:
>>> There are two reasons for that:
>>> 1. In the README, GCC baseline is chosen to be 12.2, whereas Debian 11
>>>     uses GCC 10.2.1.
>> Which README is this? Not the one at the root of the tree, afaics, which
>> continues to mention only x86 and Arm.
> 
> I missed to add this patch:https://gitlab.com/xen-project/people/olkur/xen/-/commit/57901e60066e93d986670aa91fb390774c965d3f.
> 
> Would it be enough just to do a reply for this patch series and send what git format-patch gives?

Don't know. In particular I have been under the impression that "git format-patch"
formats things slightly differently than what "git am" would expect. Can't you use
"git send-email" here as well, making that patch 0.5/4?

Jan

