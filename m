Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F89A81DFF
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 09:11:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943549.1342263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Pay-0001po-4t; Wed, 09 Apr 2025 07:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943549.1342263; Wed, 09 Apr 2025 07:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Pay-0001nK-1d; Wed, 09 Apr 2025 07:11:36 +0000
Received: by outflank-mailman (input) for mailman id 943549;
 Wed, 09 Apr 2025 07:11:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5vFf=W3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2Pax-0001je-1u
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 07:11:35 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddd96fbb-1511-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 09:11:33 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso6914257f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 00:11:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893f0b35sm733060f8f.70.2025.04.09.00.11.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 00:11:32 -0700 (PDT)
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
X-Inumbo-ID: ddd96fbb-1511-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744182692; x=1744787492; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zx5Eptr3LyGKweZlwDlU+8etOP8YBXBEzZ0eiNtWjis=;
        b=EgLpFAtA5hhT1029ZRvJiiOl7eG61FFLgSHiW7r5G199JId+IaLQS/ksU6NgGQGJkB
         U6fwMj1CZ5KFu7VSYVADzHC+n49BI/EXI0Vem03vBIvGnUp8Dc4u6x64VBc3HTC2Q1BU
         8Hoc82PI3m5eZOWxmllCyiwjvpi7wCnxNlD4eCARLnHlCzGmio353+ZZicK/iqpHLSlI
         +jYMsT4N8+g00yP3C4nidW8YJJcNShXX4YWGbRVNwQyo+6biioY1uJcXTdUOEseKwPda
         toeYYbKKcTVR/5kJEughN5dWnIuTBVsAiQXIpXUNWNG/bUW+4fFK2LNNp/ZmW219eeVA
         HIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744182692; x=1744787492;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zx5Eptr3LyGKweZlwDlU+8etOP8YBXBEzZ0eiNtWjis=;
        b=nbyKyMIZmN7q1xrZtZ73YEqHVx4dBd53e3QTyb5ULMtKmSA5vM91mGLDmoo60mHsF+
         SlO8YxwdCpOolhCD75s+/82sXABN1/+XMqFro3qKCebbv3j6FqVMUUd6vSnXj4+5senB
         wj+mP7uYC5Juho9O0IBWAvCBk3q8Q3H7gntqa9sISyOdXPA+FDHhJg1W/h3HZn90uW9K
         09tqQ89BxAf9htmxkoKHkF8ACu9mAOY5vY0varOE7mdNf+lyWkdUfkGvzkfmbBi3ai6J
         x4nLzbAPlPPCglIPv83CP3yEbKNqtRe6wLazCNxMr3HYcEUuaKcRag5i+pckucwjSxZk
         YWlg==
X-Forwarded-Encrypted: i=1; AJvYcCXqXiEO3lUiwrNdJdSFeKWncz4g6D4eIWJBWxOdCIsMJKvMBN3npIayQ8ZXkZLiyHvptRY0TurJdps=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAxCpp3bj7bpRz417KwItZpyrbFXyNvMdLeUHqSxZAfXKJcVHZ
	RKVbZPLByHI3l9Mf9HdkzQd/7g8BLuczHgAl1s/+l4EvIxX8WRwLlAKXTbf+vQ==
X-Gm-Gg: ASbGncvGraiHdlP17N3QtLUaje597x4Pykn1s0+KIoLo9tlTnSaOYyTA/TE+Ln/tUeV
	AiI/dtdzhecayDne9tVXzwgwjo3pl1rj2L6XLOsuZSly6qM86DD5bkFG+/MjeQmt9srAJTNlLhS
	mbhYWiHltmajll0YZSyRy0xKt/PPrYz22ZspcuFYyC3rA64m/VTp8fMl2AfyXRd+qRlcv0v1Xnf
	7NvGkUq5eqq+jHaOC25N6Q0kcysMKBo4trjIDgFcKITfT26hfUbE8eCPTKZjQvqSJplGZRIICXy
	nLcsMb1zV53BDiI/C7EbiDtTfMFCd+vILBS3kQ0ocsJtLW9J35Y19J8D3zGOQvEyrsl0B6GWtlF
	T3fx8Nmo0UYZJtTrwOsmRGLBySA==
X-Google-Smtp-Source: AGHT+IHr2KsvBBFK6nxM80fE/xLwz9lmYP98JkcD4SRscfFrWhKho223pMKQGzdzGZs2k5S/WtZT0A==
X-Received: by 2002:a05:6000:1448:b0:39c:1f11:bb2 with SMTP id ffacd0b85a97d-39d87ab1387mr1373097f8f.22.1744182692453;
        Wed, 09 Apr 2025 00:11:32 -0700 (PDT)
Message-ID: <699022cf-ca2a-4500-92b9-914fbbc2c12d@suse.com>
Date: Wed, 9 Apr 2025 09:11:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3.1 2/2] x86/amd: Enable TCE in Xen
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <2bac0ded3456e04b49b48cf0808203e76fc6a622.1743771654.git.teddy.astie@vates.tech>
 <79b08632b74dc13b8c399003eb76d198cb73ac32.1743771654.git.teddy.astie@vates.tech>
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
In-Reply-To: <79b08632b74dc13b8c399003eb76d198cb73ac32.1743771654.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.04.2025 11:10, Teddy Astie wrote:
> Aside exposing this flag to guests, Xen can also make use of it to reduce the cost of
> some TLB flushes. Enable this flag if supported by hardware.

As said before: This needs to come with (perhaps a lot of) justification as
to it being safe for Xen to use without any adjustments anywhere else. This
exercise may not be left to the reviewer(s).

Jan

