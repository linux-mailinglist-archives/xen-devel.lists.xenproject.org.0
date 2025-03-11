Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0244DA5BFEC
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 13:01:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908005.1315177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tryIP-0004oH-2t; Tue, 11 Mar 2025 12:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908005.1315177; Tue, 11 Mar 2025 12:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tryIP-0004mJ-0E; Tue, 11 Mar 2025 12:01:17 +0000
Received: by outflank-mailman (input) for mailman id 908005;
 Tue, 11 Mar 2025 12:01:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tryIO-0004mC-3c
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 12:01:16 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87cf5d88-fe70-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 13:01:14 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4394a823036so45643725e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 05:01:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cf279a1ffsm84110395e9.39.2025.03.11.05.01.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 05:01:13 -0700 (PDT)
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
X-Inumbo-ID: 87cf5d88-fe70-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741694473; x=1742299273; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Zl6n5xOacHuvpmSQimiKC2F3O5KK6ryJGO7gWHZHhl4=;
        b=dsUKx728OQrBdLzhWYZ2BQDYTaD/HXgz9rpcmmsTz1qbkV5irpTx4u+i8aohIDgxtu
         FlJOW4V/cmvLgWecoVPdVBkXWQRO3b0iotm+0caONT7fP0btnFCQ+0ZuywU+/KQcW1Ga
         bKFmiMZr9GzzXk2/eqm1OcKpDIvw3jg/B4uyekE01JJt+NmsWKOkN6YP41pJ5xJBv6K1
         e0qhYoI83g6iM8q2v4VrcBkLfenZXeGuzUe+vIx6+e9NORmBs1THTUgYkejGjpioiLE8
         KfOr4eAuJYUvjhEoXVLPV2uId7Qf7DWW0y71MlfPnf6DB7EEvYBVLnm2tjvwN8GluiJC
         84kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741694473; x=1742299273;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zl6n5xOacHuvpmSQimiKC2F3O5KK6ryJGO7gWHZHhl4=;
        b=gVOqNuWSg74+8KX872PJC8SS0aODbv9iXcJqSw+Z4ou76BFI4gTwREGY5qeAsLhi/Q
         l92xrWSp3xySrsiWkBnGimi4EiJi51dCCubWQ/ucCEF++T9ruetX8WH/o8f0COYuyjKJ
         XhlDpAwQvx+D5Tjv/e6Ef0UKwJ7EAIZKMW1F2jYMazQ6VDsRgqdLznn51nTrW2UdVvwx
         t/PTMTq9ZwZc20kPGCDotiQ818wW0Pw+j70xDqJoH+tQvbXTX47xvW2CjaLmOjJgc3BG
         mhNz480v3DJ0RPe45HAn3dlFWoel8vsSQWhJd2v0swwWKgR3RCmhdm69vPDxyQksRYt/
         0fNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4OKp+cA+jWNSRIA1HnMlhw5ZBXJPCJJyb+1OQ3nDbNmlktMm/WTY1ZAoXCCpJclo1Eey7h7K8OcA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIOYrrPpxHmzEUSM6EO1q87L1gwpW/fZw/I+Wft/b6u9yy+afv
	D2as7B0kipKsTSP9WJEW+Ux+Kz5/4RUvHLXe8f1Lxat/M8cAdKDG9fGI7iFucw==
X-Gm-Gg: ASbGncuWMPCtYHowtSoghzsVFl7xOIQAawei3FEeSCAhgr0ohjXM2fxKD/skCF0HalF
	b4IyH0DJ/S/z4L5OLY4BZPUhDfYLyznAEiQ1FFbAmqwlH1597JpkZ53IHRCD2EMgw1bpmoaz8wh
	I1k5d7/JCjhHhmndqll/sZBv2gzLAZe3b9wO3HUsRzqlLZHQzWPqo+DuRzEYLumij/PDmoCtCRR
	sLNSqOm12EjZee4MKyup2xTmSbL3GYCGK87mf7ku0dgpChFlsqVtJTjpmUjEVZ05c5LzXPB73X+
	NYSBcQXRU6qFM1GaWDEktkpE96AJjwSmDiPaOURRlxtxpt2pQKVqcH/8KAoWyGpj/vS7P+W6tQ6
	AUR5cHx8kFPPCqXuZna+tYOjZRClLNw==
X-Google-Smtp-Source: AGHT+IGLOoMKoeisVkocYdGNAZNHiCcunKHrpM6wa0JSXS4/Q6WxL0OeIb7NY0IGem0iZy1TONV3nw==
X-Received: by 2002:a05:600c:46cb:b0:43c:f470:7605 with SMTP id 5b1f17b1804b1-43d01bdd4a4mr46418275e9.12.1741694473446;
        Tue, 11 Mar 2025 05:01:13 -0700 (PDT)
Message-ID: <16cb9d3c-c02e-487b-9982-466f0e2f0c41@suse.com>
Date: Tue, 11 Mar 2025 13:01:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] xen: kconfig: rename MEM_ACCESS -> VM_EVENT
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1741687645.git.Sergiy_Kibrik@epam.com>
 <8d35ec8373b65bca2fe471eac7a17cb2a98db3fc.1741687645.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <8d35ec8373b65bca2fe471eac7a17cb2a98db3fc.1741687645.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2025 11:23, Sergiy Kibrik wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -92,7 +92,7 @@ config HAS_VMAP
>  config MEM_ACCESS_ALWAYS_ON
>  	bool
>  
> -config MEM_ACCESS
> +config VM_EVENT
>  	def_bool MEM_ACCESS_ALWAYS_ON
>  	prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
>  	depends on HVM

I still don't see why we would then stick to MEM_ACCESS_ALWAYS_ON as a name
for the sibling option.

Jan

