Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DD1CCB82B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 11:58:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189429.1510168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWBi9-0007bi-TB; Thu, 18 Dec 2025 10:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189429.1510168; Thu, 18 Dec 2025 10:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWBi9-0007aH-QJ; Thu, 18 Dec 2025 10:58:21 +0000
Received: by outflank-mailman (input) for mailman id 1189429;
 Thu, 18 Dec 2025 10:58:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vWBi8-0007a9-GS
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 10:58:20 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 763f9952-dc00-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 11:58:19 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47aa03d3326so2922365e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 02:58:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432449af076sm4339139f8f.40.2025.12.18.02.58.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 02:58:18 -0800 (PST)
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
X-Inumbo-ID: 763f9952-dc00-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766055499; x=1766660299; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6btMFf/7F0g6qu9Qr/0CQBxczde0quIjY+5JtXdT8F0=;
        b=EwuITvUI0ZcFkpdL0muVWMHwM4cg6eU1AwdselzTOIYFzFVijSu0vcaFOgq8SLBQOD
         17vg7hOv5pBlfvRvZRcmAPIkkzCbghQ1JbQf8ibgQqYCbNSLOAXz+vspmwK78fPTe+ON
         wPq+tN51Z5bzZl34a1bOIymnitdQhsVNOZyij16AkbuNYutqv8EWcdux/LHF1LcFv32Y
         L7eC5LuUpUkGZs/0cgjA0dkkpLjZhgSF2zE7myXnRgN+9za1KONbQlLsAmq8Mhw586Jh
         eX7sjPXJIvMkCqRlkhIVVYcZZ/2rtBkvgyeeaASth34rO03xNFvPni4h4cpuQGLrmZrb
         sKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766055499; x=1766660299;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6btMFf/7F0g6qu9Qr/0CQBxczde0quIjY+5JtXdT8F0=;
        b=rTyrnj5EB3mjXZI9oTSEIuClJ4Wtd8q20JUxWAVUR1MMoaHxrZ9KMrnqiddJ1ytk4c
         UGRJnCcvJJfjHtE7NIkPkynpji4Ad7BNpUi7LxHim3eHZsgj4zm/wxeMWjEA2rEwZ4B7
         dymFArH8RitfY0JLeISgHYQGXPWvtQR1G1Dn+yjysxcwKVg1tymLuPW1eMZr1jEyXmuo
         FaB2MZL518CVXX/bUtpvkTbU3EEcXverHrTV4uRnE2PDtloGtNMpssf57c74ZPDqSJWl
         aJ/kN/QK1ZYOdsamUJGDBwUhN6LAPShqR/jfkHvkzkBI75qfQPYpKlXeizwMkGLUOdh0
         giAw==
X-Gm-Message-State: AOJu0Yx1po0SagMc2VLcXpH6tMlmgR/TV0dWyhkZ8XmDU8Fa9XVgc99l
	X8Kg9yWReR3dQSTlcaOfGRO/o98fQRM27w5xwaEvBSmoVqN0uNXYBbztK5DdkSboMKLqlu2Tt1m
	ouTQ=
X-Gm-Gg: AY/fxX4hQ5jUSirSl8HkVUlTGnCMz6XgNf765Ivhh5f8mxTlNb3tSRPwv1QeKnmfRET
	Zf4+Njsp8deUM/VImTOYXgw/jfHdm0ZiDnPn0OOJEW8K9C9jJX6FMXt2sFoXLE9a5vXeprD94TM
	tpkSFwc7b0C6DTniir3ZbjmtBFCUWlZx8JRN6uP3OTOpoWqSirkSaWZbH1nJIDJSiDc+qZYqfbd
	A3z1M0BbWDDTdmi9JwyQxg4wv4/moyZGdaO6eNaaosooZPlV9+avb5WZrhrTDgYoqome3YTkDzq
	05K4so6leErcYDjwMdB0dpTG8HryhVITTJVxJ2yWiXS4S3L9y4Ez03L5f1GbKqGCoRv8nXDmM64
	EpYG5ULJKhU93JQoIfxmKoQonJuCCVL0f3PC9VsDFGUbtMLV9cnu/1W6Ob49tFiC86aQaNZVWwT
	pKgNk2FKKM9hueFzuFk/GuWLqX0J1FhXRCU3qsMXQvtDflvVTT+S8CkxE0fDZi0sxF9zdgifacR
	Ss=
X-Google-Smtp-Source: AGHT+IGk6OSEisVPhunDkBLTCpb35i9ml5L2R8/NmZ2bqKeSh5ArnaUaeUHHHsoFQZZhvCvYRYf//g==
X-Received: by 2002:a05:600c:4e49:b0:477:aed0:f401 with SMTP id 5b1f17b1804b1-47a8f90653bmr191733135e9.23.1766055498765;
        Thu, 18 Dec 2025 02:58:18 -0800 (PST)
Message-ID: <4c2a53b1-7133-4900-8bc8-26fc97aa1702@suse.com>
Date: Thu, 18 Dec 2025 11:58:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86emul: use vpath uniformly in harnesses
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

While seemingly independent, the latter really depends on the former, or else
the fuzzing harness build's behavior would be dependent upon the test harness
having been built (and hence x86_emulate/ there being absent / present,
offering source files [as symlinks] which really should be taken from the xen/
subtree).

1: test: use vpath uniformly for access to code living elsewhere
2: fuzz: use vpath uniformly for access to code living elsewhere

Jan

