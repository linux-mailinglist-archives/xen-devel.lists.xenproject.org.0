Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDB4A02E3D
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 17:51:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865855.1277128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUqJO-0002p4-B3; Mon, 06 Jan 2025 16:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865855.1277128; Mon, 06 Jan 2025 16:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUqJO-0002nb-6S; Mon, 06 Jan 2025 16:50:42 +0000
Received: by outflank-mailman (input) for mailman id 865855;
 Mon, 06 Jan 2025 16:50:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9khw=T6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tUqJN-0002mM-4k
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 16:50:41 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c389d48-cc4e-11ef-a0df-8be0dac302b0;
 Mon, 06 Jan 2025 17:50:40 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-436a03197b2so52461365e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 08:50:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b42757sm614166555e9.39.2025.01.06.08.50.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 08:50:39 -0800 (PST)
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
X-Inumbo-ID: 5c389d48-cc4e-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736182239; x=1736787039; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P+7X1XXH/xaXHFEjaZPe9altewNzGcSF4ccQVfsvT6Q=;
        b=BzbmhZooqI+s9HxLsSH8Gya2Cc6Q9XN+XudX3uLt4dq7RZbIPVCQXd68AlldS4qWcT
         H9IT4c2CJcZYHNkcN0YTkNYe6iojtP9+7HzPHBtmN18/wKix7GBBNW3rPPVBoCH/X0d0
         itZzFMizi0Snh1vMgQJ/ksBafUU62jPH8zPecX7dOWvYXSFt7CKeBzEBXT65wA++oLrT
         ZnhVd33einUx5SHerpR/TTObYTdIuk3lVnuETAdDFgedP+AF3LMM5WlEOJ5eCrRQILmV
         h6pBrj7FB1Itk2GeI4uCJVhVyC53lNN9eUiou/w09Gduhsf62gFB8VOh5PmmYnd9fZAN
         NwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736182239; x=1736787039;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+7X1XXH/xaXHFEjaZPe9altewNzGcSF4ccQVfsvT6Q=;
        b=a829L3u3ouVujnKEQAQL2FtsqLFNk6VDuldt0V72+BgtLBp4ohg3Ah7qJiw88wLsoK
         bIwNOlsQQRXCeXNuZRoL982EoFy5jDivOYxpRQdjRm3qr6H2C0b87R623k0Pp3Le2ytg
         d/6xZV185BGOSVX9yJimit5jgJA4YVKp/ZrMjLDILcxPvfU8Um528PakT3dq9uusI2oH
         Sk5QGhIObzkdC8Co2NLNPjyApUZAyKVgSbWH+eBmSEfiemC4hbMZN6lttmaSVXFvNg21
         iu25lwzfCWsa/Ilh0Xw+w6WCE1UyKRzx+3Q47BwPUT5/bj7hUprC7C0h09azAGHgog7e
         pwYw==
X-Forwarded-Encrypted: i=1; AJvYcCVc0XIr0f+43vSHyugqG17x1H4MoVxkttfdcSZ02LNc2frMGSU9i7pwlFric5CFaWbDiKTx0pQBnIg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQRz5SCR5/9f0kX4u022fV00B7u7O4EXzZ02FXk1UFIEj/y+zG
	4bX3NN3JT3jc4nL/LUDVunXAXxGVAgjgpmlZGD7i9tZ9g+WVLLrCcMAHDrbiaE7NB9HQzuM8mCc
	=
X-Gm-Gg: ASbGncvEw8NijH5QWNvybmWkRF6IntfqwRPWXWEjhV8rUHQ90BBjoFhuuac2nhkazh6
	mPfFXRTavWqJzdgaL/P2ZnCNebqZgVKbou+0u3eKpfjNzo5On6VyAvS6PxY525OgJblbJdJilT8
	Adi0pC9FAwr8p+SHy1r/FpSwDyRB56mV8+rit/4XMFxvIBxQGTiG3RmkNL0mofUQwvQQifQezPK
	e28c1eyB7o/WyfJdXusawBZ2P8JCcVAzQUbWtDNAvcWHGVrvUGKlEd/yurXSKRQD43lB487jxer
	csF7c9MUowEkhaTlwObJZe23k7cmaHUCN+gnset2Bg==
X-Google-Smtp-Source: AGHT+IHh99JI5qGA8vI7lsPXvquv6H1lSmJ+tHE/WjaLbBtC5NxjfwH15Gl5+JrGdcvLjGoMtDtMSA==
X-Received: by 2002:a05:600c:350b:b0:434:ffd7:6fca with SMTP id 5b1f17b1804b1-436685488b2mr457006855e9.2.1736182239425;
        Mon, 06 Jan 2025 08:50:39 -0800 (PST)
Message-ID: <0968cf4a-b641-471e-ae28-dc2da4752110@suse.com>
Date: Mon, 6 Jan 2025 17:50:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 v2] x86/amd: Misc setup for Fam1Ah processors
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250106164124.620662-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250106164124.620662-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.01.2025 17:41, Andrew Cooper wrote:
> Fam1Ah is similar to Fam19h in these regards.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Oh, noticed too late that you sent a v2. So here as well:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

