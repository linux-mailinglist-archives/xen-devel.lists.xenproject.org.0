Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 125FEACED7C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 12:23:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006537.1385729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7l4-0003HQ-0j; Thu, 05 Jun 2025 10:23:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006537.1385729; Thu, 05 Jun 2025 10:23:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7l3-0003FC-UQ; Thu, 05 Jun 2025 10:23:37 +0000
Received: by outflank-mailman (input) for mailman id 1006537;
 Thu, 05 Jun 2025 10:23:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN7l3-0003F6-1j
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 10:23:37 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 238e15c4-41f7-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 12:23:35 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so587129f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 03:23:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31331a0d21dsm952252a91.47.2025.06.05.03.23.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 03:23:34 -0700 (PDT)
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
X-Inumbo-ID: 238e15c4-41f7-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749119015; x=1749723815; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jvFthMSL8+Z8GEs8FOFne7Ns+18c478NJDhlKFOmtKU=;
        b=aKFd/yb2vfvySiKvWvlS90AlwPZbOm1Q44nvFoVdlVEdAjqH/XURIb4m4R2NAHQpAS
         NAQsuXTcVfImmh1grD4RrZWYcTWfr843DEN1eGZks5xB3/ul7LumS2zh15A7BcmxcOZp
         ku2VBPEk+LKnDkFW46IQRtpXKmQQGEZg7l/yZMHxFgkliWXGk+B8JLZBTOsuWyayD2po
         3n9kaWPv4hvQOYDSe43Lv/dKrS/BjtsMTQB0vZfEjRSnq9RcJIODWjf6Hy8/w7DOQHjp
         umItMQwGKP1jzZA6DDokbhDYEd3nRqyrHMGxt1JopoqeEgVrayCN/t+SRZ25he56cl+4
         XChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749119015; x=1749723815;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jvFthMSL8+Z8GEs8FOFne7Ns+18c478NJDhlKFOmtKU=;
        b=b5NUY+SHkSW2gseplY9n1dXd45yEpKFSKo0vhOqoE/3mh69klARbBQe4eH69BI/w9x
         bQ+jDgg1gGS5FNSx2Z0Q9yymsqdM/YxL7slGexeo62l4u0Zz6HKBO3CZrMGW8aO/n0cD
         4m0bokESj1REZOzCZM2JmrgUIFCswS++R2KB0FfXYKu/nxYXre6dE26x6kZr1A0XWXxU
         2Ijs1CT/MFCRcdUYwq6PYTmYqGTASj5lcZJQqeB5+5K+CzVKXruiQSmBLrPASoYHXqEu
         2/VNZrxL8Alpi0YHmSM5t/3envOD099OH9w+xcBtAtc05dOmb6S4x+8lj5exSiN9bVov
         p3sw==
X-Gm-Message-State: AOJu0YwnoiEciQ2jI73vvso/SjWEio9oTjT1PA02mJvuIvghUCsC4Tsx
	fc4gILyTwTPEwsSVTdCUZt+6BPtLPeMHK1uJ8FJEccrC6tkL7uKFxGtToxjQe2USESQ788/Eh3P
	p0+g=
X-Gm-Gg: ASbGncsHHNAIud+Y/Z4lRuz5hZ/yGvbfb2a9wE+3HWCTAD95nARbnSrSVgxDGz7a2ER
	swg9yct7s3d4+QkL7zhKIZQQSCVaOzuPj6UlyXq2+JOmDtWNsNpV7jS8izkHLV/eXwsBEYN83I3
	WccqOOOgl4nIK4L6E6KcDVfKO87/B3vMgrwV6nH5zsYwI3tBvOZefd9wPwSA98O/TC4aJUvIqzN
	yCPZydK3bKC6bWmvxXA2sGCtUXup8LbBTE3gNLuBCNFBSviaNP4yjEXu8lWtmek3V8JLCxjWOpO
	OxcY9aNPoIINZZW8/Vs6/Bk5r4Pq72gISAt9ulynxZqHaGFQXZkfrwtGNgx8GF81ketGtbi1T4V
	rz9dCZbu89WoH7z+cyqWtsD7xuV8SB5YP9ln7
X-Google-Smtp-Source: AGHT+IFRZeGhZtz6XcZ0X62AWvysjnmmBzClvDGk1IyxS7k24rmsQhPGx4Bmw6TEPXwji9Mg81Ot2g==
X-Received: by 2002:a05:6000:430c:b0:3a4:f435:5801 with SMTP id ffacd0b85a97d-3a51d923793mr5352539f8f.17.1749119015372;
        Thu, 05 Jun 2025 03:23:35 -0700 (PDT)
Message-ID: <73481cbf-337f-4e85-81d2-3487366cd822@suse.com>
Date: Thu, 5 Jun 2025 12:23:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5 0/6] x86: memcpy() / memset() (non-)ERMS flavors plus
 fallout
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Language: en-US
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

While the performance varies quite a bit on older (pre-ERMS) and newer
(ERMS) hardware, so far we've been going with just a single flavor of
these two functions, and oddly enough with ones not consistent with one
another. Using plain memcpy() / memset() on MMIO (video frame buffer)
is generally okay, but the ERMS variant of memcpy() turned out to
regress (boot) performance in a way easily visible to the human eye
(meanwhile addressed by using ioremap_wc() there).

01: x86: suppress ERMS for internal use when MISC_ENABLE.FAST_STRING is clear
02: x86: re-work memset()
03: x86: re-work memcpy()
04: x86: control memset() and memcpy() inlining
05: x86: introduce "hot" and "cold" page clearing functions
06: mm: allow page scrubbing routine(s) to be arch controlled

Jan

