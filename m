Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D73BC4B62
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 14:07:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139542.1474834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6SxD-0001Gd-R5; Wed, 08 Oct 2025 12:07:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139542.1474834; Wed, 08 Oct 2025 12:07:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6SxD-0001Eb-Nv; Wed, 08 Oct 2025 12:07:35 +0000
Received: by outflank-mailman (input) for mailman id 1139542;
 Wed, 08 Oct 2025 12:07:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6SxB-0001EV-Sg
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 12:07:33 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dff6b5c-a43f-11f0-9809-7dc792cee155;
 Wed, 08 Oct 2025 14:07:31 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6394b4ff908so12151536a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 05:07:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6378811236csm14530263a12.42.2025.10.08.05.07.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 05:07:30 -0700 (PDT)
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
X-Inumbo-ID: 5dff6b5c-a43f-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759925251; x=1760530051; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7Ifth4+zrKdS40QdAI1wpWKZYdxVmm+a5pKskycY0Q=;
        b=KOkQDCHF/QtmRPpLB3p3GhRcL7hqglKHgIAc4Lvi8v4h2h/kV13rwBSH2A72qb3isu
         evZZdasLxOh8xUbjENNPWWfNCwmF2whrLDkYRuNiRjRAgRyCtw/Bf/yWCqJmqo4fJD0l
         08xBS97PFSytQi1w/C06ANbxgaQp7a52tYMJy1l5L7uBjljy90qRGudOn9KitJkLI2rj
         0ai+b1Timy1DgNsjAHpjtMMtuPh6zWYn0vqEsRhz8ttTjP0XNeu8oMqEKaqUZVvce98D
         1GTAR1IVFQ5f1NbzSPnn7D4Z0mIWHrcCOY/N1mYgKM/qW0XZKb31k1DCfoWFydfbTIQ+
         suzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759925251; x=1760530051;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g7Ifth4+zrKdS40QdAI1wpWKZYdxVmm+a5pKskycY0Q=;
        b=PpzyUgFzyLZJ1PTX0c/KDfofWYpc5L/26aG7NA0oHdX6TUrq9Erb+sSx0SYUJo22Hr
         JVhwFVjUbsYRBH+RNj1YCsGuziWOSIW8QC8ZlN7KDYBiyPchUxEoQl9p2LFzRqGe1w/p
         +4Fvf75tRCC2RrVW0RK/cELIoqNuEwJ8o7yxQ/mKW+0X2RP36l+1/25KWuPB7pOmA50d
         uYMNyXp4Ey+Kupzo2SfU1BvgK96qcbW/3ScsnotwMlaIU5aQZVRS7+u5zoRzaXM/8aBx
         NdKPEM8HocenhoZutW7NAKcHRFrlYa/gbYeZtsAq263szbHK58qSRI+aOd2ua62jxBRL
         xFpA==
X-Gm-Message-State: AOJu0Yw9tkM1fIFHBC3ePH9r6spto3XS0lWtxSpUVbW2mDgb5Hw3JEd/
	jypz1E7/3mh71VralLZUhkPEtXm1ApAXGtgjfb//g6c4QNYWwGps/J/0DaSIAxSrMNrI04Femld
	PUxo=
X-Gm-Gg: ASbGnct++tSoNaFUg4lb27iaMJZ+eTKj3j9DtMxFDLiWhH7lWIliKx+rGaKrS3e8qwJ
	cVsFUj/YEp9dvCYxQgebfUepWi49cck5zR1UOYDne6xgMV3Giu6aN6ApZhyZFbWU6y5WO58eMhF
	gk0rJpzCU37eA+o172qWe3ZOm7uMVu0DOlBZY8xYjKVi2rUiG7MKuA9oOm+cgOH8wu5wpxNZdW8
	O4FAuFSyeKvdyg1ONhNiCKP7ppbivghqVF796l1QStDapwKqEyYnd4X0UAm0B65zFEnyGA8HnJy
	uYzSdnxXUecvr5WVIA5+JZC7LYOjVNwpfARWSUHzQvj67w27628Y5rhO6UKs6zeEgvX/XpVcD1x
	CbtaFX21TdovuKIC5E+KVLYwlsrWyFAjbuNHEpNiCKqU/8fv2Ip4povE6QLvqGS2RzD2Ye6gcFD
	ZtawpV6M82qM2GNqkRdNV5l9bkm522EBI=
X-Google-Smtp-Source: AGHT+IGppk3PYTEa67Ozu7keRbsbjmgzhloby8HY3c+zTkhVN1HH5ARhE1BEeCE6NTU4028cfJDB8A==
X-Received: by 2002:aa7:dcca:0:b0:636:240f:9ece with SMTP id 4fb4d7f45d1cf-639d5c75d2amr2350835a12.34.1759925251119;
        Wed, 08 Oct 2025 05:07:31 -0700 (PDT)
Message-ID: <265d5053-af61-42cb-a3b9-ef60df39c21b@suse.com>
Date: Wed, 8 Oct 2025 14:07:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <amc96@srcf.net>, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>, Grygorii Strashko <grygorii_strashko@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.21??? 0/3] x86/vLAPIC: CMCI LVT handling
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

1: add indirection to LVT handling
2: drop VLAPIC_VERSION
3: properly support the CMCI LVT

Now having this coded up, I realize it may be too intrusive at this point of
the release cycle. Still I wanted to propose it ...

Jan

