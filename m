Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE69B0BD08
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 08:54:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051048.1419373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udkQ1-0007xI-OE; Mon, 21 Jul 2025 06:54:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051048.1419373; Mon, 21 Jul 2025 06:54:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udkQ1-0007v7-L6; Mon, 21 Jul 2025 06:54:37 +0000
Received: by outflank-mailman (input) for mailman id 1051048;
 Mon, 21 Jul 2025 06:54:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1udkQ0-0007v1-Kh
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 06:54:36 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f4f204a-65ff-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 08:54:34 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45600581226so41967575e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 20 Jul 2025 23:54:34 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f280:2981:7570:f40b:efd1?
 (p200300cab711f28029817570f40befd1.dip0.t-ipconnect.de.
 [2003:ca:b711:f280:2981:7570:f40b:efd1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca319cbsm9620004f8f.38.2025.07.20.23.54.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Jul 2025 23:54:33 -0700 (PDT)
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
X-Inumbo-ID: 8f4f204a-65ff-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753080874; x=1753685674; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1Gg/XiMwLS+GNdqcTfhxe55hSpqN3DAZd2h5/HqG08U=;
        b=BO9PHcxmkQDoC8XpGyTYHWf0pv3uRuLPSbkneHoVpmHm7M7ZK9CgDFmmZY65e2EbjR
         wVArvRp4TLV4d4pY3Dqopjt7wODy68CIBFPwnvpdDi1bxfG5J+3XXtWFBAiinJlP+JMl
         ZmQKeAj/e2e0GuSKZK0TuzyX6MiZgX70t6rcl9aT1s8fxo5BuhcG6e6msVPt+C5SHjrU
         WtCAS5aWAw/JOWanHpKOK+gsRVTuqSnHr8bnLSR8ZvAz6hf7YijWj3aAaGbNk6OyQrS6
         OSln/1UFeH8AUXmY6HxEvclxtms8e6+msazyFZT3Mi9BDUWhm98/ipB53b74bSyRpMvj
         SaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753080874; x=1753685674;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Gg/XiMwLS+GNdqcTfhxe55hSpqN3DAZd2h5/HqG08U=;
        b=Qd5Rul6eEF4rXuRFIuJuuhioMoBhiNY4A/iyHwWo+BLM6y9L+V/2XzuoVhnUD8ofwU
         67iWlxii9/PLGVhIhcfTRi7CzRD99dV/UFZQseASyR6j+9Vo0DHgkqA2zEZALuGkBV6t
         19RxusWCu01Oh+z4mkdpvE4OOZ08LpgtngulcyLDzC995nZ9f2AK570LtHuEtuEW0ome
         uEyAqbK9Gy9jiiHuQ/GMuJqHEljBF+0/KqjjNTjPCgF20r5/xEd8H6OSy8Kz549rtWh/
         C/ZvB8eTXRA3cEMhSSDvVqcn4+GpYNtyLvfvZwggWzFNa+MF0+d/zCJS0823sLPcxycW
         9ETQ==
X-Gm-Message-State: AOJu0YxbQw6uz+xmCyCtHVrRpneAs3ly87Cp4rN3uXrbJmS819Za4X5L
	phuSSl6zvMhIXvK60zpIfGIpfAsMg3bYSBH4DAUNjnjNOv5K5Cg4WnBDI4mJo/OTqg==
X-Gm-Gg: ASbGncuH8bZqLxnZYfu+9vhSlsRUvzsxXGKYWRhqhMWCBf2uhJtMYm3qck4QMznS4Vk
	LBLcUFoOON4WKIQhQ7ecT0+wds/C4M61qI60pKlYDOHDYeqJl/c3Zfw6SfmqzXOXQlQ3LyVv15t
	eaF521Se25BtqsyP3r5PMdmDt3tIvn5prH+GeTyFgX3Dh4rfEptJYjUqYfY8D+W/ccvxU0Oo3ZX
	/1Rhid5TPvVJDsYyFwJfm2TXzs5xKR7hK/BPtfDS2eIbip4ll2zyltdz8LH5RbsIPGs14Edoca3
	QgCPDodz9D66yQBOKPdAoSPpaZnql/BAZ6H7o60wbJkYmaDCNPYqgTAQBMpW4+o6Gkrj0Dd1jbD
	s6ECx9pc31sBsJ0VYBDLnQIt9H+JY4cZJRabzrjDQdUL39g8AtsNgncVwSPaQ0SvjEiLXBq/7uL
	p0MGQMWrs5HfyyjWFQqr9nA5OZ6QU0pOlPzyRMeX2Nvj5Q0uQNSndaKaEW
X-Google-Smtp-Source: AGHT+IGz6Nw0P/0ptM2j15CHUVOnVnwNmuemcdi7SBAFj8wzPHcbynfnbMezECyo2KVDiw5Af4VJpw==
X-Received: by 2002:a05:6000:290d:b0:3a4:d53d:be23 with SMTP id ffacd0b85a97d-3b60dd731cfmr15865922f8f.30.1753080873812;
        Sun, 20 Jul 2025 23:54:33 -0700 (PDT)
Message-ID: <2f947a82-d641-469b-a7b0-07732e182bc9@suse.com>
Date: Mon, 21 Jul 2025 08:54:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] x86: Convert remaining INTEL_FAM6_* users
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250718155502.2610047-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Cc: Xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <20250718155502.2610047-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.07.2025 17:54, Andrew Cooper wrote:
> This is a mechanical change to use the VFM constants rather than the
> family-specific ones.
> 
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1934721940
> 
> Andrew Cooper (4):
>   x86/mwait-idle: Update vendor/family/model logic
>   x86/cpu-policy: Update vendor/family/model logic
>   x86/spec-ctrl: Update vendor/family/model logic
>   x86/intel-family: Resync with Linux

Acked-by: Jan Beulich <jbeulich@suse.com>


