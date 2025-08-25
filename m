Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1BCB343C2
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 16:30:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093287.1448818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqYDQ-00024E-6W; Mon, 25 Aug 2025 14:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093287.1448818; Mon, 25 Aug 2025 14:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqYDQ-000222-36; Mon, 25 Aug 2025 14:30:32 +0000
Received: by outflank-mailman (input) for mailman id 1093287;
 Mon, 25 Aug 2025 14:30:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqYDP-00021w-31
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 14:30:31 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cdf02ec-81c0-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 16:30:30 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-61c266e81caso3168920a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 07:30:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c312a5821sm4949001a12.13.2025.08.25.07.30.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 07:30:29 -0700 (PDT)
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
X-Inumbo-ID: 0cdf02ec-81c0-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756132229; x=1756737029; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zqJ6hL2c4mfNRMdVhDhnwOoK8oBtxOpq7vtcK6QdqUk=;
        b=NmT3n59DRdkALxeJUK4/wIMHSz4RP4WXluFYM0NSwkwiHTnb2ruyD6kN+OGvL7EM+E
         VgZwF0BUWHBg4CZ8elRsIDYtoqBpHzSZYsD77DrSpHNCEISwJQQj2BTKtJe2WBotRaTs
         YTev0GN5GncHG4HXezkhVHTStrs12u2eZxwMev5h62fLGkWiaTRqUmdXCzh/38xT4Ol0
         8m/XnKtsC22qbfgjk9Ue7LvH0v+ZxzqbTCGO9fGCQbUZz5jC91cwKmg8C3rRNmMQFTG9
         ny5xd1Xpcg7xT8ICCblw8eV2dIAzHXHUwwKvkBNcsipiV5XiikmEoCVQt9SDSYOVywSl
         VS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756132229; x=1756737029;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqJ6hL2c4mfNRMdVhDhnwOoK8oBtxOpq7vtcK6QdqUk=;
        b=C4+zASZt1wOhxuNDy4rTGhrDiJTbFx03PdWz93U3PGaU6B86s8eEU64I+hggr01BjY
         OV080jpf0TUqZuZEr6jJURYZZUBKOsURulWZvnwkYiAjwSeep48VJ5fSmQsp1VV9nX9+
         46i5LrtgU6r4zbng6TAqlYHPPGNpGNtn9DaGM4HTYtlSOjw4KBd+sk5rkPKtMwhThWHp
         Ab5ttf+tU5I59M5NH7aM3QoK7ZyPHL8bZiNzkYdz2A0svljTy9WpRsqGEn8sczy6sf+6
         FcME6iTwvBh8rSpN0AyauAlxi+F9V5/3IOKqdjIK32ZVvw/YYXWYxTmdxxcGleqr+KmG
         2iww==
X-Forwarded-Encrypted: i=1; AJvYcCV54cEgJzeGOZuWYKgCRiT9OVCU0WwzxbD7weBV7XrN6Om5//yUzn02BWy/KiiubHJQwGFqO+YQoHs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxX2gqNtNszFQ+IT4/GOaHsxEqoaGr2gEpv8yurD0gepmQEUX6h
	FTOUqRNDpC5myWveocAhhQ/BQganhDxncR7KPRuBbGKdCeWOYL0xdxP5iVGJ2EHMkQ==
X-Gm-Gg: ASbGncunTI0WEeeXtriEYi1OB6nV9asgjG0CTz38aPFwiMSSi+hs5ZdcPCTig7o+5Dd
	KMEarrL2o9om+vOcUY0XFagaFVtmrs8Rsfbgw2PKZbtFEyX1K+CtOHPUFWxx0zrrmjz4/QQtTX3
	OoztKBIkcfI33nns0ljhOjxWfNsbVVFLJtJibQ+noJkrLqDxkwkR6CF8zl3l4VReFTrpUR9Rkz2
	mLD9MOKFBnGgPz4qh0B0t2rlSqLbDJEAucCV42R9ohJt3pPfIiA/7k4KvmlcKxUTq0J8gM7du7L
	dwUUl2vffe3PsbD4a3UQskfGCfQaVXh3I8Z8YMBsTMrtRzXOCdmKF8hC68WCpYAI4EaVHx5WzfQ
	1X5BjMOK6FBOg3MIAHzuqLDfDMdGl4XXMG+ZwMHoVCQlTA+yL4NUUyRUz27xllJjqaNsJCgfVY1
	toAmR6PT4=
X-Google-Smtp-Source: AGHT+IHD43aOoU88HGrM4sx8GW94U3jJteSg/j3xRtl2u5+jKJujOuO0InkbCN8WKKFzAYLySXf5cw==
X-Received: by 2002:a05:6402:210b:b0:61c:4034:e414 with SMTP id 4fb4d7f45d1cf-61c4034e604mr6428275a12.7.1756132229428;
        Mon, 25 Aug 2025 07:30:29 -0700 (PDT)
Message-ID: <42b2163e-1cb0-4f15-a1a5-4d7eaad6bf30@suse.com>
Date: Mon, 25 Aug 2025 16:30:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/13] tools: fix help info for "xenpm
 set-cpufreq-cppc"
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-4-Penny.Zheng@amd.com>
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
In-Reply-To: <20250822105218.3601273-4-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.08.2025 12:52, Penny Zheng wrote:
> Change "balance" to "ondemand" in help info for "xenpm set-cpufreq-cppc"
> 
> Fixes: 81ce87fc5e36 (xen/cpufreq: rename cppc preset name to "XEN_SYSCTL_CPPC_SET_PRESET_ONDEMAND")
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


