Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A653EB0EB23
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 09:01:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053343.1422104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueTSx-000372-89; Wed, 23 Jul 2025 07:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053343.1422104; Wed, 23 Jul 2025 07:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueTSx-000354-5D; Wed, 23 Jul 2025 07:00:39 +0000
Received: by outflank-mailman (input) for mailman id 1053343;
 Wed, 23 Jul 2025 07:00:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueTSv-00034y-Bs
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 07:00:37 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb17457e-6792-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 09:00:35 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso2931126f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 00:00:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e519ce84esm908887a91.5.2025.07.23.00.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 00:00:34 -0700 (PDT)
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
X-Inumbo-ID: bb17457e-6792-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753254034; x=1753858834; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Clq0LFY5apsDxvtfgh8IsDRcO+ydcsrCr706DBs4aYc=;
        b=P6xIet7qj8YoTu4TosB6zQ20KXFbjgIdkPeRzxnXktOFpfs20xfOdnx8YSvexAuHi8
         VhmTSNZ/KDEX6Sz6Sb0DJKHucQroJzAjVqZX8GK7ur5XmPTPpXfipWRemDfU4yowCpWE
         ojX6pRdFBGSZqAVwz+yg8t4XedqoAC/N4M2AkiefCUBKH28gkBs0FbJw4jfCYXGgdfMk
         hX2PLxkpeL73Z59UI26MK0n8mu1rgIig9/BqgDgRmx3MHZ2dphwtk/BvVZ85aLpGR/ga
         L1ZsuraYqdBMDLgAir6pRgPx7hFvOOfT6annTrV+nPQZt6OmPS7LXgoVCZkAXyzYs3u9
         Pk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753254034; x=1753858834;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Clq0LFY5apsDxvtfgh8IsDRcO+ydcsrCr706DBs4aYc=;
        b=azJHPB+mcJ86J/rCypJTA0Z+vU4zU2BJazW/m7ZX7dieE49SWfUMhgzCtI48aN91M3
         4xI8hkMxDkn02yAs4Fs6rRRCgR1KZ4hk0Y9CCrfS+FNOoBx9dZUVq9EpOj9nu2cg6lv/
         vzWK+MI5F5fuyeqMzRzV0Ya5pBqlJI92U0b0y8Y1Qhib4um2k/L30x1wF0021SGuwf49
         9DUz69P1BbCGMEAlooltplHV4kv8/Ahr9LUiWBKklp2+jfc8fR7sJm2EEBb5wGyH0Y91
         bGNExqlUOScq6ZmjM6BEYQwLcpsSlMAjkW4hu+mKtkhVj8F7/tLFl3bPnz10V3KOfYxZ
         dyzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4TaAtZxoYidJlyPCUKoRu1lBLTPG33czU4ogvUBjDvmyRDLOdTSWNuU54qil9WqOk/tXPnLAN00M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwH8hDn6dG53lG5I3L7RuZ9yJ4iE1ScF4MkyPclVXyjXBpZ8vqg
	J+jQiwQ5nvWPIqb7OvYBXqwM2OcjsuiAL37fu8QD/aXZIPMX0YwtsPWoZAmup6TFTg==
X-Gm-Gg: ASbGncu5eO0oV5c17iZeGz1BeYQHJ6OzomvLBOtki+IJuc249TciGfI8stEXrcwLgl7
	JMyvY/9eNXvpBuPvLW/xPwUd2zG/XUmmtAmXbYr4DMmV5mF41aoSqKRPBXE/OtsD/oNb2GlEXnp
	JTMfHRwls9b4wiZNyPqQFa41vmc9Dzte6fJF9gFZz8JTUiCgROTKPtMAECR4kbv+mKK8/Z/QgXs
	ZClvI3NitzvDOruTVqFDIDQT5Tpa/wSmdqrxN/y+FVdEb2xxLztrrA1nvI6o8NzO8SIFoqFuzdN
	USswRqQJkw0juENMTLjyMeTXCG/ECipZmmjpzaO8x7drFuhQc15GitH5crWaGAFreud/PLwSYZu
	AuGRjiKmzvky4TlvZAW54xDbpQZLY10PzqzfvySxBLuXobadgWkvHq73tXw/Zl+rUGjgsM/G+Ry
	KCrKrIBU8=
X-Google-Smtp-Source: AGHT+IECO78kVAlyw9VHlNWC8CqKkE9W10wJo6kDRQXr3fHSm7vIezUzOx5CBmNsT3Gsnpw4kbP5gw==
X-Received: by 2002:a5d:5d07:0:b0:3b5:dc04:3f59 with SMTP id ffacd0b85a97d-3b768f162b3mr1194736f8f.37.1753254034523;
        Wed, 23 Jul 2025 00:00:34 -0700 (PDT)
Message-ID: <70c1c4c7-144a-4205-9f09-fc9160c31232@suse.com>
Date: Wed, 23 Jul 2025 09:00:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/x86: move monitor.o out of PV_SHIM_EXCLUSIVE
 condition
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250723065206.1451514-1-Penny.Zheng@amd.com>
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
In-Reply-To: <20250723065206.1451514-1-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2025 08:52, Penny Zheng wrote:
> Since we move "!PV_SHIM_EXCLUSIVE" dependency from CONFIG_HVM, there is
> a chance that a randconfig picking both PV_SHIM_EXCLUSIVE=y and HVM=y results
> in hvm.c being built, but monitor.c not being built, which leaves
> functions like monitor_traps(), etc, undefined, causing linking to fail.
> So we move monitor.o out of PV_SHIM_EXCLUSIVE condition to fix above linking
> failure.
> 
> Fixes: 568f806cba4c ("xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"")
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


