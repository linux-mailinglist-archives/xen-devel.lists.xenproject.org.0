Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BC5B15874
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 07:33:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063392.1429125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugzR6-0004G6-EU; Wed, 30 Jul 2025 05:33:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063392.1429125; Wed, 30 Jul 2025 05:33:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugzR6-0004Dp-BN; Wed, 30 Jul 2025 05:33:08 +0000
Received: by outflank-mailman (input) for mailman id 1063392;
 Wed, 30 Jul 2025 05:33:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSpT=2L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugzR4-0004Dj-Ve
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 05:33:06 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab4ec75c-6d06-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 07:33:06 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b78d13bf10so1480620f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 22:33:06 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f23f:1903:a31c:2815:3201?
 (p200300cab711f23f1903a31c28153201.dip0.t-ipconnect.de.
 [2003:ca:b711:f23f:1903:a31c:2815:3201])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589539e491sm11783705e9.26.2025.07.29.22.33.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 22:33:05 -0700 (PDT)
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
X-Inumbo-ID: ab4ec75c-6d06-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753853585; x=1754458385; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YaW5dxGDsSlpJqXv1Z6V56X7J9dKwv4y6wWMcg7L0xU=;
        b=ftIfCYuMkvGRfZ/T/BFJChRDzfo9YhBCd4VjhGKXMmbMEJ2WCx5j4h7QlOS4lMsZfJ
         i6XPnuBGXiO0ik31XLLGv8JuhjfdQg31RRBwOzPG8V/+DHYmD82kor3JtSsOqCo+nmkk
         U1HI+s0c+QchBC+OwXMrW39R69muA1lhF1epyt5zlVHVSIcfZtW5Pvk+KEBYGEg43cai
         IjaVl5mqNUTMxL478vHbRgPoArhpVYOqf1bfpeoTPEyTYLNTThVXqdwulyKndbHV+Y9E
         uh7cngk/WU/XWZ4zaWgREqKkB5jWPm1Zu61raVzJGxo722k+Bbx90QrM7E2Wb+7ijNGt
         UGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753853585; x=1754458385;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YaW5dxGDsSlpJqXv1Z6V56X7J9dKwv4y6wWMcg7L0xU=;
        b=vNcC/S3oGLF87WUWRJT0oiaXoSLHXlZRYz/skIWTbKq+vftJ4f+Zi3R6ae227nYfKN
         JvYEwjH7NFB9ysUGDT3MsmC4zrnhIM2kGmx2/6pselNcyScg04DbSW0h4nqtlw98O+Ki
         1ZVaqiTK5EQga8MlZDA153iYcNw6/JlO7jLBefAmvrx7cMoaI2BI+Ht08MJest3ElTZn
         Nk3LoaVh4lXzzVHWMHSI3TpMvDAH362HGPAI4N45Q2ZB22d2c9TU+1L5VlcpczXGAS4v
         ueEG1PX6Bz8PvdKp+urU6G5y/04E5HW/IKZv3bmOBu5U1vKOXDulUx7+caGNeHwqCFa2
         +uSA==
X-Forwarded-Encrypted: i=1; AJvYcCW9WpFi7k5P4M+ljV2lOT/mS46/ca6VLZrCEje4RYGzv3p851TNWBX3GVk3+fqz0d1a7hpV6hXw+yQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzq3U5LY3CfUCqV5lxOGyfGQSlcG4GYgVS8aNmJFwqmJBaX4+wO
	kEj5/wJH36RuTQL9QGSPaAkJZjm/HjmQ8VZ1WB9+YKno7+tVO9Bk2n8YORotEUOXYQ==
X-Gm-Gg: ASbGncsxv9hS2O/9tAARUnidcgarsgRoRfeBX2Rgf7ZKMeX8d6vCW3o9KIvqqOJBRcd
	SEdT/oQ7wgJbsKupi9b97kjP3qntgFa2DtzOcy0pGDbSt2XTrPffWPOV7f4FCLqnM4T0JOWJzbo
	ubCVGX1vHkcNjjI1gGyIaf2OAqXL6PWaYuUrCB3bO7b7C1+8WVK0T3XEyKmTOFXLf8f5Wwa0lN4
	Q7ELzcyOwO0arR8WMr4iHueLd0ynP4xHd1kN0i7DiPhIHBSbPMYIFmtqk7uRrMfAZrK0aoS4ySb
	2/uoSfKTueJT1Tt6jm86zGWE6CE95Hs1OzimODLj+2xYkXX7rzGE0AiUchD1gx7IaVWyG9zipqw
	U0p1DNCQSGc01Dwtmcka3CKZU6LkOxwPviAcNuEJUjTL70o+VZVbGzF2yUiTd/9cVGNhE323mSZ
	ggDfDpMHLrouNvqx346k7eQHC8o9N5RNHF1MNzSb7JrxkzPxDJrSRVqOsn
X-Google-Smtp-Source: AGHT+IEUBSHPcTLy+jsK8m139xGS/ho2Q0RUoBMPaG5UBYQTLdGTQZM6qIW/EOGOTnjAbfRAnGrcyw==
X-Received: by 2002:a05:6000:400c:b0:3a5:2f23:3789 with SMTP id ffacd0b85a97d-3b794fed896mr1369411f8f.15.1753853585420;
        Tue, 29 Jul 2025 22:33:05 -0700 (PDT)
Message-ID: <c2cf4ecc-9a06-4ccc-86ad-3accd8a5d7a2@suse.com>
Date: Wed, 30 Jul 2025 07:33:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/9] x86/altp2m: Remove p2m_altp2m_check stubs from
 unsupported architectures
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1752691429.git.w1benny@gmail.com>
 <3c46e6bd09b2481360fbdf812926d199c5416198.1752691429.git.w1benny@gmail.com>
 <888b0ca0-4fe0-4457-a614-fb853dec7a98@suse.com>
 <CAKBKdXig2ogkT4993He8scocdx3jz4yVG97ESYQnqXGmTuNrcQ@mail.gmail.com>
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
In-Reply-To: <CAKBKdXig2ogkT4993He8scocdx3jz4yVG97ESYQnqXGmTuNrcQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.07.2025 22:39, Petr Beneš wrote:
> On Tue, Jul 22, 2025 at 4:56 PM Jan Beulich <jbeulich@suse.com> wrote:
>> Hmm, using IS_ENABLED() would certainly be preferred.
> 
> Why? Very similar usage is a few lines above, with #ifdef
> CONFIG_MEM_PAGING and CONFIG_MEM_SHARING.

Our preference towards IS_ENABLED() (where possible) likely post-dates
the addition of those #ifdef-s.

Jan

