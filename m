Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BABC80E58
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 15:01:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171102.1496128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNX82-0005AL-K6; Mon, 24 Nov 2025 14:01:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171102.1496128; Mon, 24 Nov 2025 14:01:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNX82-00057a-HS; Mon, 24 Nov 2025 14:01:18 +0000
Received: by outflank-mailman (input) for mailman id 1171102;
 Mon, 24 Nov 2025 14:01:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNX80-00057U-Uj
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 14:01:16 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 064d8412-c93e-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 15:01:08 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4775ae5684fso20545995e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 06:01:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477a9741cbfsm148951455e9.6.2025.11.24.06.01.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 06:01:06 -0800 (PST)
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
X-Inumbo-ID: 064d8412-c93e-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763992867; x=1764597667; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ML58FBPSxysCWpD1yxLQZEGp5iIqJHiw0QRyZEcff1Q=;
        b=fL3PO3cUrWDRtwr+bm8581q79Gt4tsS93k9geIwKlh3z78ygEGa7ZzYGQ2CyY5gduj
         FDHILpR3Glr5vCHx7deBsi/fk54b3viu2CwDU92QQDO1nw06wMZLCtFBtKyB+wfg9pPf
         PLarGPvA/pLXX6DjS2lHI4XgF1BOmTt8GqlgNErailnX/YSZ/p9Q7Ee6OVP5IsepgqD/
         F/G2CpsqG+JHnCE2ymbzX2lfrcF5vGvvAec5FothJu+bddPgTIhL5yyzuU3lVHMPOl60
         GlhQz90EWPigClZvgh0SFx+n3OD2QpVqsPvxOgzaC7Ti2ZwIfIkgeeccBqg81g8ahROv
         m23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763992867; x=1764597667;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ML58FBPSxysCWpD1yxLQZEGp5iIqJHiw0QRyZEcff1Q=;
        b=XuIoMJzcLmEBnyw+EUaDeuwP5Dr4hJFmWl9Ihq4CsOpS4A6PEdeOoeX+EHrkK7ekji
         m13a70Beaouv+KJdvRDzfEOflcl25JYfLcopMlRxo/qIBSAWQUXsjJttoHIE7Lt4A0Vb
         O+9Ytn6WhKFuSPIpzyjV9D2O77lUU0xpFhxDvrDM60lD0F0lChWFlwMxBnUG0RnnTvTN
         8z1Yvv9VWLXeTxUz8s5Tn6Oj3vz6Lr6WbnvfBN8sXOCp9GkbdiyZLhq3qpLsFNfXC4F4
         R1kqfZfn++F56CEdbAm8FcL9ODPJ0QnQVgUTCdQFz4vtZ84pK+xoYWaV+YAx7hM1qCVt
         sIOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCWTbnVAVT55I8KdgaWv+I1bjpXQDpOMGv8OfXYzk6z4ESvGYZy7rCZFTSh9ZR2y7L7O/WvM2uWDA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKEXlr6aLSqnl/csu5jy+ZrOJ2UkjrY4ooC5652zdEtq/UtCdA
	0pBd7uC1arKlM8hyOTlcnnItwpd2uo65raaisjC03p5/fkM6hmb7V1H3YdmdGTmyqg==
X-Gm-Gg: ASbGncub7lFSjtf40uDpbXyNL3dKaufrizix+80sSvLG4buxTI3Mgc8IXGMADbH3Gm5
	MohxTCEN335QzTZlG7OFoathWbBbVgr0j6GyxW+kgOD1cRLuBEtYXV+t3vaVK6/PQcoFgkK21oo
	8ok/ldzVbfS5o5a6C5xOa+/BYQN72np6/PR/hwlDzehsds8OP7d/rZNpfCwAfwSwQsjuJjG8h6X
	kukx3IrWnL5LCNWzspIe+wK9hkkCuq2KSZuRTZ6NNXT3kW954hVYyjOsAAumP5P78enf0CB/WHe
	OnQEPniyZPDRanM0ob31yAwBFgePTfJDzDqPy5bNrACYd45Qi1meotjcDWL6lJKhKpUj3/yT0jn
	dQtHbsUDkT0NZ9O3q6qjZEWKLmT+Lmi52dkAuyqs3cm9EnbNl3LhwN1FAoLGpWM7NJM/Ysw2bwQ
	Iw3owNmugOMkI2WtOzubjmxuUVA7Llg7xH8882TtkEhsmoqgArD8+lNITeNqlSVmgKBT4Of+BqA
	Go=
X-Google-Smtp-Source: AGHT+IFT1whUjKYtTgpEDECPBcXmS320OB8fUYbyoj3mdZOOD5r0xDswf0JegDZjF4l6TsozKANY5w==
X-Received: by 2002:a05:600c:1c82:b0:477:9650:3175 with SMTP id 5b1f17b1804b1-477c1057310mr142509235e9.0.1763992867286;
        Mon, 24 Nov 2025 06:01:07 -0800 (PST)
Message-ID: <0372e719-a79e-445b-a354-2e11562bfdc2@suse.com>
Date: Mon, 24 Nov 2025 15:01:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] xen/p2m: move xenmem_access_to_p2m_access() to
 common p2m.c
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251121091554.1003315-1-Penny.Zheng@amd.com>
 <20251121091554.1003315-6-Penny.Zheng@amd.com>
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
In-Reply-To: <20251121091554.1003315-6-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.11.2025 10:15, Penny Zheng wrote:
> Memory access and ALTP2M are two seperate features, while both depending on
> helper xenmem_access_to_p2m_access(). So it betters lives in common p2m.c,
> other than mem_access.c which will be compiled out when VM_EVENT=n && ALTP2M=y.
> Guard xenmem_access_to_p2m_access() with VM_EVENT || ALTP2M, otherwise it
> will become unreachable when both VM_EVENT=n and ALTP2M=n, and hence
> violating Misra rule 2.1
> We also need to move declaration from mem_access.h to p2m-common.h
> An extra blank line is inserted after each case-block to correct coding
> style at the same time.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


