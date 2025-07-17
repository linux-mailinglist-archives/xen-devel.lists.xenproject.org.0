Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 876A2B0847C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 08:02:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046110.1416339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucHgs-00053e-KU; Thu, 17 Jul 2025 06:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046110.1416339; Thu, 17 Jul 2025 06:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucHgs-00050k-HT; Thu, 17 Jul 2025 06:01:58 +0000
Received: by outflank-mailman (input) for mailman id 1046110;
 Thu, 17 Jul 2025 06:01:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucHgr-00050c-Q7
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 06:01:57 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b37c5fc-62d3-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 08:01:56 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so3603835e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 23:01:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9e06995sm15000912b3a.38.2025.07.16.23.01.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 23:01:55 -0700 (PDT)
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
X-Inumbo-ID: 8b37c5fc-62d3-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752732116; x=1753336916; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PwdNJf1YjEmOkFNA6olmueZmxke7bf/c5jqDnusTM3o=;
        b=J5x2JAH+l2Ys66qohyyrBW4ALf5FRimL1QMN/qkTSTA1LpmqOEH8jA05+W0sOiFHA5
         ubzhq7dTbRNSloydpCrXQr9eFNxfgRNSFKPPPYxafjHUrbSmcpyJ3sGPoiumGR3ap8CM
         BbEMASKOzKfwOrG2LSnyedMvWuFVDIYKCZg/+eq4fPP895UQg51TT1Q1Bsd5DG1ZDrNP
         xrn6n8tFsTvb4IZu2nQ/O9voqYJxAG1I8DOy2aRBcLav6Hz3HCCk4mjW+zEemLnXNiJP
         YbXK31fM0QXndzOQkVzGvbp8hXx1f73CKfTvAXpdmzFhzjNjW/iCiNj0gF/D1j/O2Y0k
         Vnpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752732116; x=1753336916;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PwdNJf1YjEmOkFNA6olmueZmxke7bf/c5jqDnusTM3o=;
        b=Cw+7ihOy3VmD1bQxeyibOlFkb4n1tpaNgtfpxG9+TuDXu3CTZaD2Gx62quGr3xyGqV
         Bnw+0byClRYYoTrMPxicDNznswzjprEtCETd+In7Q/TWZMxzvSoxT24JVr0K+8KedKwD
         KxrS0+svluS/Dq5pOOk0cHX7R26FQSY5XFNx4T1hLsrhXwaAmZPi65tXmOCkEmxr8jnF
         jqMn/lgKdJu0uu4dEhJgfnEQ2Ltxg5Ved4GYNM2aekFS2KX6gZykSBGrqFu/7dpP0evA
         FIJOaGrV83DMC5e7AoFzWV2uLOFI2gOtDP9YnylKZVt/DNbAvueU6XdShOLntCnJ4iwH
         DaGw==
X-Forwarded-Encrypted: i=1; AJvYcCU9HA7MGvayuvWkgHidfqxAHqNRe+kcqj23y7XtEfN8KsEzrhrE6WAY86eLKgR8SI5fuRy9O5hCcEo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzT0gU026DwZAXFRW5dk0RahnAvDFXZlFX42P+WGYP7qaxcxoF+
	3rRjpfD65FsksFU39IRAHPDezBoK2RTvRcFhTnLbfK6WNm/px3ULXuI1L5aBb+XJRg==
X-Gm-Gg: ASbGncsk9NrwHgCRBNjN5xnwdXOPRu5F5SRQ4/Go95DQeQrrseKobgvg/pdwE6u7zZv
	6Ip9li8bRlSvVM8u31RJMFljKInKMnCcD5jLEBDDJgmHSUOy0uDi+9xsbbMAMF91T0C8TMEkYoO
	ZM9XDbcnqsxTQy7SCWGnGd4s7UjfrAmli3T2Kt2jHj12sZmOwe98CwalQODfPI1App9owGr0T4/
	ygiowWVT6Y6YzwEHXfO9yG12OApGZoQacIBtPqYMNZ9WS56NaZkK7adOfZUItJbi9rwe8okz/Lc
	XvYN1E9N+XrlYEJonFHggbBK3w5if/ZYd5JMlz1/FxaafQk3oRevhEW3J2ycpG9eBdCAOgN63kI
	7Jqwjk6BFzSKoWV2sG9XOz73Gjuxtf70qX1Hbu5sOD5WYfqtKwG0HxRnUvB5GPR2OwQSUaek2oj
	00+IXd2wg=
X-Google-Smtp-Source: AGHT+IHp5lGDUQ2F/KR2hdBBcnWaguG/QG24o1yw4/7aUSjfHOiHzRZlath/w4NmNcMS2TRZzQTDgg==
X-Received: by 2002:a05:6000:3cf:b0:3b4:9721:2b32 with SMTP id ffacd0b85a97d-3b60e4d22e8mr4138425f8f.10.1752732115652;
        Wed, 16 Jul 2025 23:01:55 -0700 (PDT)
Message-ID: <6a2f7ba9-e5f0-4f04-9634-a5a4b2190cdf@suse.com>
Date: Thu, 17 Jul 2025 08:01:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] build: force compiler to use atomics when coverage is
 enabled
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250716212253.406346-1-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20250716212253.406346-1-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2025 23:23, Volodymyr Babchuk wrote:
> By default GCC uses "simple" coverage counter update
> mechanism. It is perfectly fine for single-threaded (or single CPU in
> our case) setups, but will cause race conditions on SMP systems.
> 
> For example, I observed that counters are going backwards when running
> Xen inside QEMU.
> 
> GCC starting from version 7 and LLVM/Clang starting from version 11
> support -fprofile-update=atomic option, which forces coverage counter
> updates to be atomic, which resolves the issue. As Xen runs mostly on
> SMP systems, force use this option if it is supported by a compiler.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


