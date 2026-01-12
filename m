Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9DCD122F3
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 12:10:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200088.1516094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfFo2-0000kF-Mu; Mon, 12 Jan 2026 11:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200088.1516094; Mon, 12 Jan 2026 11:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfFo2-0000io-K8; Mon, 12 Jan 2026 11:09:54 +0000
Received: by outflank-mailman (input) for mailman id 1200088;
 Mon, 12 Jan 2026 11:09:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfFo0-0000ii-V3
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 11:09:52 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35fb855c-efa7-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 12:09:49 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47d6a1f08bbso25189355e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 03:09:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8636cb0dsm145224695e9.0.2026.01.12.03.09.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 03:09:48 -0800 (PST)
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
X-Inumbo-ID: 35fb855c-efa7-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768216189; x=1768820989; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nm8iEbogXW+I4NZ0oLtTvYx6OEt6tCFiFjB53NtPnLY=;
        b=BegrDdt2bDOv8MUQrIn5SPN210hUsqBvHX1Eh0syoa/coQdU2+6gw5poRMRHrfXo/1
         th2FkaNVD2WLngYuCzBwHKLChQtISvxNoc5ARO4u5t1ckxiNfQ9f8d1uERwZTA5z4B8C
         2saKh/kucBQlwTTJHPJ8z90Z5Dn+UpNE4+DnEtYeNkpjLDYannZW4oqnCeJZNwNVixMJ
         0U8tQ5nAnQtE0ZKriRc1sAWoa+/AvY9SY34hU/is8jcHNH9zLsfDZuMHn7fJjGZpB1PC
         FPKmXTBekRPw5EgvPmI2SIlM4L9uDgTgoPu49GuCI1gJRKiLvFRJPhUQpb4/rpiNP/+j
         0FPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768216189; x=1768820989;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nm8iEbogXW+I4NZ0oLtTvYx6OEt6tCFiFjB53NtPnLY=;
        b=JdMfRf9KlAJO4VYUcKLkuLOb9Rhft/GuFl/lq3VfZC3BtVb/dX/67NBV/nN1QtKt4E
         sh2r5CbcUhViixgYqIxvzAqoR39BHV01O+1PXCeO994KvvDLAxPTobIjtCkTgAbsy9sd
         chdO/xpt3N70T7+lAO0s3vlPWsF5A3GM4wy6Ek4wS0e+VO2Ldx/V7PvS2aOkRlJOxfEs
         UTdkE7FgCFciTXAQwggxluKRCTSiwloz7Oh3iN8yDli8lQPQHsmChTrvcnMhFRQyQc0Y
         dUYahUH+w+j25Uh+HwixxeMKU6mm927CvYHVw67du31NoMXEEwieS3o7cy3M5xSiX9bl
         fJow==
X-Forwarded-Encrypted: i=1; AJvYcCXyw8R5rw3hZpINraJ5WUDEmr5o3F9OENvOY5ed/rTUvfN+htzUXCwyAMbCdp1EMryeoQNDpES1M6Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6NwhRogfdalEd0F6YSFAZgOzDIM/sud22m5kshJSYiPLjRKM8
	PP/gsCBuCOOEIaFVpdHcfC2aMPw70W8eXMqKnYTuDmkLcJMfL1XkDoh1b7BPmJaFmA==
X-Gm-Gg: AY/fxX5Y+LoHeizFBCooCGp/7h6Aoad0exqqxoO/j6ZLNC1jZ/PkhbN9c1MPksLUrjj
	u9prYk6ueK2iI2t0wTvmyNUCpFjoK/P94K34HWL7N5lwBoix0bQpitkQU6t10+4vjWU/pN+Emdl
	jxVQzyc5WRGJf8zWkunpZ04WOW1si8T5kRRDJheCMTv1x6nBWywnmUzEOV77A409M1m/F1hZIya
	7TuI1gghgYkLonLvRnRFP1kq4liUDLh0U5lIRg2F7J4ZN55uNqmt6QDXKf+clSfwqmKTnLWPiDD
	mt3ozA8xHJU1OgL4ruq9NHT7hQlO301cXxPaJPtAiOfdS9vGKEcEXRaF1dZl9uyp3O+h0nKoNv4
	Bre7jcWObqNEazEq30VqYdIhBtEpHHdeleTQxiQ/FqhEHRLL66C13RDYpdnZGSxGPXYj8P5PQNJ
	rgR/TmCvMQU+MJVgkn2XaNf8xi/LHD4wNyEVaDrliqzF0nGmFDNkYyxzIeFC2t3Wq4/3Ro2kBir
	2E=
X-Google-Smtp-Source: AGHT+IGHyMrWlUenyvhRqmDx19vLYJnz0K3B5KZMnIRr82BYzqLLMKrSMvqjA6Zw/IV4UlYhjZDMRQ==
X-Received: by 2002:a05:600c:8b33:b0:47a:81b7:9a20 with SMTP id 5b1f17b1804b1-47d84b19f5emr179483225e9.9.1768216188803;
        Mon, 12 Jan 2026 03:09:48 -0800 (PST)
Message-ID: <ec57461b-dde6-413d-a825-3538f46a1209@suse.com>
Date: Mon, 12 Jan 2026 12:09:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/altp2m: altp2m_get_effective_entry() should honor
 ap2m->default_access
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Tamas K Lengyel <tamas@tklengyel.com>
References: <dbab519006501b3971fa913310a06755a14c4548.1767982955.git.w1benny@gmail.com>
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
In-Reply-To: <dbab519006501b3971fa913310a06755a14c4548.1767982955.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.01.2026 19:28, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> Commit 7e5b662 fixed p2m_altp2m_get_or_propagate() to use the altp2m's
> default_access when propagating entries from the host p2m. However, the same
> fix was not applied to altp2m_get_effective_entry(), which has the same issue.
> 
> When altp2m_get_effective_entry() prepopulates a superpage from the host
> p2m, it incorrectly uses the host p2m's access permissions instead of
> the altp2m's default_access. This causes problems when the superpage is
> later split (e.g., when setting mem_access on a specific 4K page): all
> 512 entries inherit the host p2m's access rights instead of the altp2m's
> default_access.
> 
> This issue became apparent after commit 50baf2d, which causes the host p2m
> to use superpages more frequently. Before that commit, the host p2m
> typically had 4K entries after VM restore, so the prepopulate branch was
> rarely taken.
> 
> Symptoms include memory-access events firing for unexpected pages when
> using VMI tools with altp2m, particularly after VM resume.
> The issue can be worked around by booting with "hap_1gb=0 hap_2mb=0".
> 
> Fixes: 7e5b662 ("x86/altp2m: p2m_altp2m_get_or_propagate() should honor ap2m->default_access")

You didn't even Cc Tamas, who I think once again will need to ack this.
Already with the referenced change I didn't quite understand the
reasoning.

However, two formal points: Please use 12-digit hashes, as demanded by
sending-patches.pandoc. Plus I don't think Fixes: is quite right here.
That earlier change of yours didn't mean to do more than it did, by its
title and description. We relatively recently introduced Amends:, which
may be a suitable fit here.

Jan

