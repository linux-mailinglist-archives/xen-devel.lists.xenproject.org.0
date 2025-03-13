Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BDFA5FA11
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 16:37:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912583.1318845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskcT-0004pM-QE; Thu, 13 Mar 2025 15:37:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912583.1318845; Thu, 13 Mar 2025 15:37:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskcT-0004mq-Ml; Thu, 13 Mar 2025 15:37:13 +0000
Received: by outflank-mailman (input) for mailman id 912583;
 Thu, 13 Mar 2025 15:37:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tskcR-0004mk-Jx
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 15:37:11 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0747057a-0021-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 16:37:10 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso7897295e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 08:37:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df35f7sm2510940f8f.13.2025.03.13.08.37.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 08:37:09 -0700 (PDT)
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
X-Inumbo-ID: 0747057a-0021-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741880230; x=1742485030; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JIDOKshzjMLATMAQwSG8pmsWQPm95r5pi5IJnhbPMG4=;
        b=fYW2JYtcOLvzFa8PlHHnerVf9NM1Q5yvGi1X/feVoQcFwp1Lnm5K+jijrb15ocdPrj
         8Cw8o3h6X9OHq65gegYxCAKbOX0skZISgyhL3nnEvCSdOf2+q9CP2UfE42Aui/rdS8lw
         twDywMBabITyn/NwrTheSkR1EI1KUefAkxt8p253ewhLKdya0JrV7ytgdBIwwq2JROSD
         4ktOzVmYrV5QS+I5KBm1jToj1lkZPyxTGCkfkWs8rB9RZMW11T+NMbHaN/WsZcU96dxm
         PVnUGe03x5qKcwSIlsB+PXsTR8z3mOxkf5SlDaE37o+ArNrldliE6/snZAjIfpN00kQH
         x8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741880230; x=1742485030;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIDOKshzjMLATMAQwSG8pmsWQPm95r5pi5IJnhbPMG4=;
        b=PVetNeqvcx/jjaTG5KeE4vIWvq0lOw+/HNQf3IYa2gQbLRbiglBQg1YSs2g6fcSp9c
         flAq6SlyD8iSNIjJhtV2i3XpwnywFs3E7DrOaC16nIiQhROnz50a3ziVW/x4iaQI8xXV
         MgxWMDDGTQ84pq5EUFNyxlJ+fmnbUD5UvqEz7qRd+aQhEk8dTrV+TFhcYj1TpDkwVBvk
         pNvT7zzzrfgsbARQkWdEiN5aZrOD8uyZ7vzjhCj9bmRhH7S52nRTXI+ZO7cpYM5AdlS2
         dSXKStA1V40P2A45YXpOLFyzjswMzyfk3L/mz4JYye6PY32uIrA5sw9ycjV+mruzDLmI
         QSsw==
X-Forwarded-Encrypted: i=1; AJvYcCWLslt4ZwBQ5MuJT2BkMc+ibaN+OFuMfAQY11NvVi6W366vNlVEFq/WFbRxvF8uF/oyUFu83HkKxac=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy01XddaOUT1EBK9pXPDrIjWQmsO+JEBsng+CY4kcc2pekX8pty
	k5Z8Ec6/H93f5YY6UszEo6P6K31qZqCQRJ+90368oc5LvlO0G5eN7xLHHFxBaQ==
X-Gm-Gg: ASbGncuG876jTugxYolH897RWR0QL3YPjVQBpn/IED5wQLshMVPv8x6Qy9X6RylAe1X
	uOcv6ZaOI7GvE11YyhqlWvW1l0T5U6DVvh6VnYWJ8tZfzt6gbxMeIBwSeG3jPhYTJl3feHQCLmA
	u3OuH3pJoTB+DFKLbJGP00xjSLz3AKoCRfv5i6HedqKASRy0dJPqPffSap6o5TTt9NylSZu4Mpy
	LPaWHglDQs+SA82wkM2DCzXgeMfnnFyxgHaY+jhU/Oku9WSo2xR809bWgtoJYywmIadeVhR3Fg3
	P0sa2Pd9jCj0cumJYbpHbNQORexEuBPKrdfbwH9zxJVHN0p1EeCPDDLYYilXh9mke8K/DjVulT1
	JTTbGz0H8itjoKKEqcWQ3rFL7De1k4Q==
X-Google-Smtp-Source: AGHT+IGFJMaTdhhLuyW6D1qsH9Mlu6ejF8C336kzQscU4mnj9XwA5yIuW36SXDYo0QBX/38cz2fmMg==
X-Received: by 2002:a5d:5988:0:b0:391:41fb:89ff with SMTP id ffacd0b85a97d-396c1d1b783mr6551f8f.27.1741880230076;
        Thu, 13 Mar 2025 08:37:10 -0700 (PDT)
Message-ID: <6eddbd26-88ca-4d0c-b56a-4e7abcc3933b@suse.com>
Date: Thu, 13 Mar 2025 16:37:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/16] xen/arm: Introduce system suspend config option
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>, xen-devel@lists.xenproject.org
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <28da91c2859e0226585951ea3d6e7017b402ec0b.1741164138.git.xakep.amatop@gmail.com>
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
In-Reply-To: <28da91c2859e0226585951ea3d6e7017b402ec0b.1741164138.git.xakep.amatop@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.03.2025 10:11, Mykola Kvach wrote:
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -475,6 +475,17 @@ config ARM64_HARDEN_BRANCH_PREDICTOR
>  config ARM32_HARDEN_BRANCH_PREDICTOR
>      def_bool y if ARM_32 && HARDEN_BRANCH_PREDICTOR
>  
> +config SYSTEM_SUSPEND
> +	bool "System suspend support"
> +	default y
> +	depends on ARM_64
> +	help
> +	  This option enables the system suspend support. This is the
> +	  mechanism that allows the system to be suspended to RAM and
> +	  later resumed.
> +
> +	  If unsure, say Y.

I wonder if something like this makes sense to place in an arch-specific
Kconfig. It's also not becoming clear here why only Arm64 would permit it.

Jan

