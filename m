Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BAAB51AD8
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 17:07:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118436.1464213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwMPN-0006Ev-8M; Wed, 10 Sep 2025 15:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118436.1464213; Wed, 10 Sep 2025 15:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwMPN-0006DS-5T; Wed, 10 Sep 2025 15:06:53 +0000
Received: by outflank-mailman (input) for mailman id 1118436;
 Wed, 10 Sep 2025 15:06:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwMPM-0006DM-JE
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 15:06:52 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7f4a9d4-8e57-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 17:06:51 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-afcb7ae6ed0so1082028566b.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 08:06:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0783047123sm181469166b.14.2025.09.10.08.06.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 08:06:50 -0700 (PDT)
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
X-Inumbo-ID: c7f4a9d4-8e57-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757516811; x=1758121611; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dR/60dyN9WxiyGh9aLPatEMOll/KaCt99sCErUf0ooE=;
        b=KFknUBqpALO/ehvM71SCD7L7NPPG6RxNLbrOtiOPpFguEVZDhrNxY0xGY8k1uJOlc3
         EcyyZ3F/THbSb+sSO2FZJsuLXmInz/COifkuZQ5bfw0rG+hFSpI5TSB1YmOj5cUzA24s
         uqLpOPzXFNVjlBo1FpCSplDRG8SHcqJNQlz1MietDEn1SomHoMtTQRBtqd/KDV6dCYVw
         k7ru4/6jbPHh6lIFFoopFtPhsE9wplGiAjiV3w6i/3JjV6l0GB/IqqEv89S3c8Jos1cR
         wYCoD/Q1gEMq5FGeWJedEU49xxUcR1tZUevBURV/KMrOpAOApLZ3lgPdeeks4yOeHbwI
         aAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757516811; x=1758121611;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dR/60dyN9WxiyGh9aLPatEMOll/KaCt99sCErUf0ooE=;
        b=f0WmRoQRIIRwrLBDz3+Iq3v7770xYLeUq87Ogfz8xpik3CcNafEErus7t3SKts8UxI
         QhtLBgXaaSwF67BaHXWX16qyn4S1FMVuG3Ekb5k7bYiyAQFM1uS4iRvJGwjIBFr/iMGp
         8N7itdW34ph8m8pYtKl+qcVS8NSqi4EVPR8wKDRH1EUkzmg0aglofK2yLjAIRtINLtpz
         iMKvML8cSy2eZCZtSYYyY0SuoqLith1I5QZDoZhpl2DwH4b7s7NU0et67gEixdAB8gq9
         fHtRAiD9yiRrKLB4g+42wXzLL5kOJXKOfybi27aWwbFDwqJnJ2QMBGEsy9Lcyb68qiat
         oCCA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ5CiZVGv4sRuGQhfv1/aA+B3VrJk3IQy69rbx0gdoPUr7v5snifSq7VXVtD+o0SCxaHN5kURFiJo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwrCTHnQryRDW5R8RznBvokQ3TsFSbuvF1xOLBHRQE95padExki
	QxNZD+8+zUhsNXvZm6XgCFKbI3d7KfTDZ/Y/Ffu+OqLLL1xq3/HoaZbAOCrifl0jyg==
X-Gm-Gg: ASbGncuAImRz0dL9AHucAvrLNxHMHT4+mqC+ZIFS1vtySlS+VYz98sJFbZdoTCMrSiw
	pKEQX7DU+sAvl4YaVutrpWbtcx+06fqRx0+e8Ii/BMFdZAFA6HonVDKWQE6NXvjE8+UFAD2ZcqD
	YUouTvGuLqB9KbAjR0/4EglB1o1qj8AbwtMD4xkK9bLe5n2G70oJdzcZQdkREZKaytHzVhQB+vT
	KyEAp/+6C5b90Un1HG8gHu6BmZ3gMUrFo6J62ozMLaUGWTBf0YD08CB1CTSCrgGtHdX18GwlihD
	Xq9LQxQeuxpLOJ6Kou28beBnp0cU4mLWBRwiTLvS9vheAEfhIvpkz5sTesgzh+1v0/WP/34ST5m
	yCrBA8+BIFKq80VroYGaKqaE0yd/CAM/+1pwrQ6iAvTDxgpQusw/zHSxeXx8acE5y4yFZ6pDXpt
	dyljx4MEs=
X-Google-Smtp-Source: AGHT+IF7JNiTdkIYILG5qWoolBaY3CB5Tfw2xhI/pWNKc2iuFrieR1zbBhKG1qzc15mbsjxV9PDOqw==
X-Received: by 2002:a17:907:a07:b0:b04:67f3:890f with SMTP id a640c23a62f3a-b04b166c8afmr1520070466b.33.1757516811097;
        Wed, 10 Sep 2025 08:06:51 -0700 (PDT)
Message-ID: <4e61f21e-6e1e-4baf-a78e-2b17b876d20c@suse.com>
Date: Wed, 10 Sep 2025 17:06:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/26] xen/x86: make VM_EVENT depend on
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-6-Penny.Zheng@amd.com>
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
In-Reply-To: <20250910073827.3622177-6-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2025 09:38, Penny Zheng wrote:
> VM event could only be enabled/disabled via vm_event domctl-op, so
> CONFIG_VM_EVENT shall depend on CONFIG_MGMT_HYPERCALLS
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Looks plausible to me, so:
Acked-by: Jan Beulich <jbeulich@suse.com>
but really Tamas (now Cc-ed) should also get a chance to express possible
concerns.

Jan

