Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8099A7322C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 13:23:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929165.1331779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txmGg-0000kv-GQ; Thu, 27 Mar 2025 12:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929165.1331779; Thu, 27 Mar 2025 12:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txmGg-0000iC-DC; Thu, 27 Mar 2025 12:23:30 +0000
Received: by outflank-mailman (input) for mailman id 929165;
 Thu, 27 Mar 2025 12:23:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txmGf-0000i6-3b
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 12:23:29 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4940bb3c-0b06-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 13:23:28 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso9734905e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 05:23:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82dede2csm35992945e9.5.2025.03.27.05.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 05:23:26 -0700 (PDT)
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
X-Inumbo-ID: 4940bb3c-0b06-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743078207; x=1743683007; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bTPhyEMXk+tORdkZr/zDeBb+9KP4rzPVR9XPCIDuS3E=;
        b=Sj35227kVJ1HZLDxIrwwBeFRHiKzVHcvTHmiXnWlZoqsEy4LIxBHC7apb8Kqumj6+2
         c+cbD0s3EwVZ5x2e5ottz9TJREa+trQuUWlvVuOVb2RDls8pdmUxAzijYP6Sr11I86N6
         KpLIe7d0vbG3fCjx+5ina1uVwYgKtbVUR2cC8U4Sf9bPwPR41zXijAKtXMASlZ8j/tXD
         2ZxvNEjFVkp9I+2K3oWMweNkOWu2qEkTEhvEHjOd52mCEbyvCkne9dN1QiE8toGb2iOv
         m976e9+O/YHZCgDn/+sEkgGkM8yFHC0wsnnqGHfp+6EdmAv+8YlLVQN6OfnWL5OqgocA
         PHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743078207; x=1743683007;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTPhyEMXk+tORdkZr/zDeBb+9KP4rzPVR9XPCIDuS3E=;
        b=LRtwyEa1sdn4fpB5yMdW4Vt98j70V4E9LdCDjPymFRT6zPD2WDC8aNHrlaCuSQ/3RZ
         zJ5M2Ntte8NAW+UfF920ztfpgMsasoZTpIl9eEw+EEExAouF1pcJooCXCgCxvN8TUzPC
         2CW9rV7/4i0tVo41N6Vqdw1R1IaXRvmEe6/saqApK5s9hlNHz5zomtPopBV+Up+Dj+U4
         XxAiAhZg6Zg1lCoaQNOsztMJDLV47JeQOd2EMvzSuqkhWzLB6gB8HIIYijzQkhHBOU+N
         wijo2v5w1dGHlDn9kUyrwOD3iwXccCnJ+v6GwCohdjdpRFR1IcJQlMpyNHNXC9zOAevL
         XKIw==
X-Forwarded-Encrypted: i=1; AJvYcCWEcB/ZU/U0BoYYzqQEHDcQioyMOcD+AlM23kqvh85eHnkmILHq+Okob4grCN5zQ8fU119Tr+Dp+TU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFBpyPLZ5yNAKgCCiFcNftgyCiBgffshcRXPuTNh8xihx4UULg
	mNzsoW8+1XCL3lA4XU/sYvJVZUC8JaxZbhpynX1IHiGekO5Kh3ftJLHT+2hviA==
X-Gm-Gg: ASbGnct2GJmVZ+Hwy0LVRGER7H99BOS7Qz0AqRfa2poNxe1c9FrsSGHeujl7N4L1pg1
	K/+f19meP0l5RIcPIFX8k9qoWaYLdoNuBlD+lT9pXm9cd3MKCkTqXRnRi9aa8Hp5DPPvxwabV2i
	g33hftDZ0mVhdjes1Y22IkaNGRdmersndfZc6TQ3OG4K/kWZnXECB9pQKGDclEBkp4cpusbF860
	U71fFePdK2C3RIkT7acNUmHCYaiMOGJ9qOnjCbFx41JN3OSLB5QyaWKBXv5ir7HYeZQ/JJeb9mr
	ErV/4icFV5BauC4dg6GIuQd93IvCjJlPV7Fojr9YgnXWQGNmoXIdI5Wdm4UQjFTmALIrVu5URuI
	X5YIot1h+N3mF13zYn1Tye4cLH4lFzw==
X-Google-Smtp-Source: AGHT+IF8LevP+UUHro83uKkoDeziRKtSXmwJz9vR2xx2bSJENiP+Gylrs2YNP/Bqt0EtwwHAb+bCsg==
X-Received: by 2002:a05:6000:2911:b0:390:f552:d291 with SMTP id ffacd0b85a97d-39ad1748a57mr2903956f8f.22.1743078206995;
        Thu, 27 Mar 2025 05:23:26 -0700 (PDT)
Message-ID: <57895f8b-f082-40bd-af66-adbdc9894938@suse.com>
Date: Thu, 27 Mar 2025 13:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/riscv: introduce preinit_xen_time()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <1a04711f46a1c0a7cdf709abc37f143747215495.1742918184.git.oleksii.kurochko@gmail.com>
 <86c067f2-87ff-4e75-b94a-9d760fc730e5@suse.com>
 <cb66e1e4-7ac4-4a98-9bdb-b92e6c069f0a@gmail.com>
 <f76b12af-172a-4faf-9e60-54c4626db8c3@suse.com>
 <9fabdf22-bc0c-4c4d-9652-1b5072d83660@gmail.com>
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
In-Reply-To: <9fabdf22-bc0c-4c4d-9652-1b5072d83660@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2025 12:48, Oleksii Kurochko wrote:
> I think it can be left as it is now as if timebase-frequency will be u64 then
> it means that it will be needed to read two u32 values and in this case dt_property_read_u32()
> will return 0 and the panic will occur.

Fair enough; please say a word on this aspect in the description, though.

Jan

