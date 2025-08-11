Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 127C5B20642
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 12:48:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077279.1438345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQ5D-0003pB-CG; Mon, 11 Aug 2025 10:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077279.1438345; Mon, 11 Aug 2025 10:48:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQ5D-0003mP-9S; Mon, 11 Aug 2025 10:48:51 +0000
Received: by outflank-mailman (input) for mailman id 1077279;
 Mon, 11 Aug 2025 10:48:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ku41=2X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulQ5B-0003LS-59
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 10:48:49 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2ca76de-76a0-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 12:48:48 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-af9618282a5so812624866b.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 03:48:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a38b5sm1984422066b.45.2025.08.11.03.48.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:48:47 -0700 (PDT)
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
X-Inumbo-ID: c2ca76de-76a0-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754909328; x=1755514128; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbm3KbZyAJ+XghdbEalKI6jCWVJ4zMDPQPcHycTTnlA=;
        b=PQntT7brKEqCaiPw6MG7jy4RchpqymOIYpYbJf2j1Zg7/x3iwt7jDUP/b/Vqb006ye
         cX8J3OtAvSdiEO4rHlzn0CzKeBFG8OVZa91EHahiSDElzFXUr7EVWcdsANFh3NhhgSFv
         Q+Q/lvGUVdwyaGQ3qwtJGUC2ED9HMylbiUoF5prxpFe+lFKyb+L7h1EAPRDJtizmqr2j
         A0Cmq6ewLyaF+rYLS6pPwRZ1IPi2boEIJu8DPkFvGDoEkUQ7Ml77LxNRaIMxDjbcTe5y
         ohyASVjjzLlkgSd0fXdjIqsSImDvwYQ7PKGsZwa1tJgjnler3SmXYc8cd6dO3uTUKZmq
         c/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909328; x=1755514128;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sbm3KbZyAJ+XghdbEalKI6jCWVJ4zMDPQPcHycTTnlA=;
        b=lo57cVESKxStKoTzGpeCbUD+eIOQq9fy3E31PzZrMfqvKLO6oX6e0PvWefPvup6SQB
         v07A1HmMRDPNwKK2585XIXukfuvOqGR63UBh1sy2vIYinimu9pUwQOXNs3ZqdIMcj5hO
         sBAVS53erxdXCdoCMUQiGZPk+HHlzL17KgmYPrsErsepXuUvJMwqP1nLuCy4+DWzrPt6
         njlanldYLtKwPHi5SueP5X/lv9OtuTeiwEswFB95UXMw5l5ffYN7CpcUuO3KHMCfxVHl
         TGz8b7/cBuCG4pdgu6L+a24Tii49chQSp2JMH+oW9L6nyzSvgNGLZB1Zf7dLlsciWEFH
         nbTg==
X-Gm-Message-State: AOJu0YzrUxnkRZzPHcB9K3HLOk8yxtygg0aWR9I5CyisHv312rb7ecm7
	aYKG/RG2TJa1gYnYflAJu3GNmdsByogSIIUhCc/qBAVKMBKtEqx240wd0LLQiiZVxqzGg2igZJL
	BslU=
X-Gm-Gg: ASbGncuWkdoiBGApgiNQ7J2ZzyiH1ldNDVqa3UOTjVCv2RgvnwkxE9P8kvYKG0GnKmD
	MQV+HRMeB60Rgw55L8LJ7/OFiTiauGHsA4YdV4ACiyG5qStSuu1o6FQ6gYogNyeKX/nWwi7N9nu
	MxaVzv73gsu/2IRltEfSkgR6KdDYXiWeZDeR78Sgso9mXjChMGoLtgFPkc/7aD4+l6d1jZklEv0
	fpOXXPlFPfbcqo0KwdjB12laXER/Hba+A4SGoRp4gUBF2KP0V+wxVpLKVtH6g6nFGS4yFmsI0Br
	FzBzmDcuqiK5LPYp3bJUijQfwoHf2dh2Maej/eQiaV78gAAEP+u9zV9/9Ihw9adNf3Uv+PJfWEI
	BkNdAsL8D3rPZILes796U+gpJVdU9YSzlpktsV8fJ04Yuu3pDJxCF+3HiHKu/+rghRLT7LdBO4R
	MrvsRGZU98cmm40ntPew==
X-Google-Smtp-Source: AGHT+IGq/AcezY/TTTrAfKIyX187mJ/fBPxnqnKeXTijPj9qBoXcaE73CnlcyYTHg3rzR3H6RqcKCg==
X-Received: by 2002:a17:907:c08:b0:ad8:9a86:cf52 with SMTP id a640c23a62f3a-af9c640db18mr1164942566b.11.1754909327824;
        Mon, 11 Aug 2025 03:48:47 -0700 (PDT)
Message-ID: <ddfd86ad-19b3-495b-930c-1770dd92fa99@suse.com>
Date: Mon, 11 Aug 2025 12:48:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] x86/mm: unmapping and marking-as-I/O in
 arch_init_memory()
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

What we unmap there are mappings we better wouldn't have established in
the first place. Arrange for us to only ever map RAM, and then drop the
unmapping code, which was flawed anyway.

Nothing with a similar effect as patch 1 needs doing for xen.efi: Prior
to GNU binutils commit a844415db878 ("bfd/PE: correct SizeOfImage
calculation") too large a size was calculated. With that change in place,
image size is properly rounded up to a multiple of 2Mb.

1: mkelf32: pad load segment to 2Mb boundary
2: mm: drop unmapping from marking-as-I/O in arch_init_memory()

Jan

