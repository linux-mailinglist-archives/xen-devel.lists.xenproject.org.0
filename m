Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D33B0541D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 10:08:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043715.1413729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubahd-00069v-Sr; Tue, 15 Jul 2025 08:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043715.1413729; Tue, 15 Jul 2025 08:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubahd-00067V-Q7; Tue, 15 Jul 2025 08:07:53 +0000
Received: by outflank-mailman (input) for mailman id 1043715;
 Tue, 15 Jul 2025 08:07:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/5o=Z4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubahc-00067F-Cy
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 08:07:52 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb394228-6152-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 10:07:47 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so3962083f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 01:07:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de43227acsm106476825ad.124.2025.07.15.01.07.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 01:07:46 -0700 (PDT)
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
X-Inumbo-ID: cb394228-6152-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752566867; x=1753171667; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FAep8PwS0qWaP034kQJg0eVsqtlDspxMDCfg1X7AxUw=;
        b=FER3aONAEKw2y9Ym6kVyb0wUEf12o+YaTF1pnCCvjXHViPz5z0QWbRTC2mUjc9MSg6
         7xpgeIKsaL31KZwhbdLcWh5GaFnOMv5LjZnMVkDX9fZQDgg8q7dCqP0Ycn1U3Gg+Grub
         D+Z8Bps/oFFYCRdrY6nHiNAl+B1i9iGm+hlSctI5OAB/kfvm7TCNSy5QAugGCIyAcjSZ
         GhltCSdDmurBuz0Ga3YAJiqFDGMDIS9O9WNja1RizIZdXxWTWsE0Amk4d/RRHpUBjZ6x
         uIY54kpwz4LX3r5rzh8cl9InJFtW/itIw4VPg8eQp3snVFtJrFWB5lWO7Yf1O7Vhy+N+
         qciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752566867; x=1753171667;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAep8PwS0qWaP034kQJg0eVsqtlDspxMDCfg1X7AxUw=;
        b=frFjGZRD5duQp9opnN98zIvuPdnDU0B+9sV0EvasZK1R/HymIWvtD1R/FDBkj0buM5
         JitwtmDFH4krb4TGMfkMO8uQ3WiwIwaxtZ8ByFvJy3ZYl8UiSUtdq2WBIhq2iKOYcleo
         sT+hJ+sYDSSNOwlZHjhCtALVy6JWSvQ/IEry50prolgAjNnunGM5dHO0lGpCMf73GXwm
         hBF7kvrjdO0wjcJ96oDhjqOzN78gKA79S/ifpP63sXBjQbIAkBy/0aNpQKdlKp6edNBB
         xIhF8MRSiTeK2hEGdukvHe48KvYHiPixV26IaUeqOoTdxEFWNt3y5rwaNaynZEXokyq6
         rbUg==
X-Forwarded-Encrypted: i=1; AJvYcCXojQvIVMHO+s9EONfkIFdntANjSw9DMO4bAYMNmcDGCOwwNLV2RtHdj5y/tSzHCcMFljS/JtZr4t4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzA87wzwtpOWKUU1cna9OMLLteA8f3wOSKNxWlmYgnTtR5r7xD9
	rtO6hZ1s3p4N2h5tasAS6hzOHiIG48hGbPYiBwcpIyjDBDaedxmFOs3+WcWMd57tAw==
X-Gm-Gg: ASbGncufqG1nueb/DlQhjeMHbTT6slZN7DZqpwSyrYosoX2Eg5rNLtfbwrjhH10R0sL
	L4J43SbF8WkDT1YeQ35AvtW2FRn27RNx9YQWPy8Jx2x/uhI5hZTOKlO5lwrNJXw56Ms/QCfe9h2
	JdTGXoqzXeLL/smoUwzyAWM95ugvWbnpKuPFOeECOlmy3w69av7AGuG9PaS4lGguKVpcVGvtzoV
	Q9exqRZJECkOSqOcSvRgc2KQHAfM1n6lIhJqaW0oHp6s/1zASubenHsULJF1RQU7kImxkHySsGo
	J6UJ0zWRvoxRhdzA9TGdYmPE7dibGMdsvWSxTqp5FZg4aGNLgx3aXL5zDieKaVoKQX6uxIEcVQD
	bp7s5wZgnsSWCdGaVNMdI1lD3v+L8nH6Qbfeg1GWBgsKb/TBGXhbpaW5EK28cJuJEgL894y+wxK
	a7STl6MBI=
X-Google-Smtp-Source: AGHT+IGRdAabhQiQXw5/8jDgOTNoLK0TH8+2B9a+fs3D8a677ZjiO80Ehu2x01Crt4VbvNrYsZk17Q==
X-Received: by 2002:a05:6000:2d82:b0:3a4:eeb5:58c0 with SMTP id ffacd0b85a97d-3b60a1573dbmr888512f8f.20.1752566866778;
        Tue, 15 Jul 2025 01:07:46 -0700 (PDT)
Message-ID: <228caccd-aa9b-40b3-b57b-22791255b716@suse.com>
Date: Tue, 15 Jul 2025 10:07:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4] misra: address violation of MISRA C Rule 10.1
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5da6c3af9bf59e6116fc57f48ec7612883771f0b.1752514332.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <5da6c3af9bf59e6116fc57f48ec7612883771f0b.1752514332.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.07.2025 19:53, Dmytro Prokopchuk1 wrote:
> Rule 10.1: Operands shall not be of an
> inappropriate essential type
> 
> The following are non-compliant:
> - boolean used as a numeric value.
> 
> The result of the '__isleap' macro is a boolean.
> Suppress analyser tool finding.
> 
> The result of 'NOW() > timeout' is a boolean,
> which is compared to a numeric value. Fix this.
> Regression was introdiced by commit:
> be7f047e08 (xen/arm: smmuv3: Replace linux functions with xen functions.)
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> Changes since v3:
> - added a SAF comment instead of using ternary operator
> - removed pointless cast
> - updated commit message
> 
> CI: https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/dimaprkp4k/xen/ECLAIR_normal/deviate_10.1_rule/ARM64/10678198209/PROJECT.ecd;/by_service.html#service&kind
> ---
>  docs/misra/safe.json                  | 8 ++++++++
>  xen/common/time.c                     | 3 ++-
>  xen/drivers/passthrough/arm/smmu-v3.c | 2 +-
>  3 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
> index e3489dba8e..964f8344ce 100644
> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -116,6 +116,14 @@
>          },
>          {
>              "id": "SAF-14-safe",
> +            "analyser": {
> +                "eclair": "MC3A2.R10.1"
> +            },
> +            "name": "Rule 10.1: use boolean as an array index",
> +            "text": "Using a boolean type as an array index is safe because the array size equals exactly two."

Isn't this too strict? Use of a boolean would be fine as well for larger
arrays. In fact, we allow integers (without compile-time known bounds) to
be used as array indexes, too. Hence I see no reason to mention array
dimension here at all.

> --- a/xen/common/time.c
> +++ b/xen/common/time.c
> @@ -84,7 +84,8 @@ struct tm gmtime(unsigned long t)
>      }
>      tbuf.tm_year = y - 1900;
>      tbuf.tm_yday = days;
> -    ip = (const unsigned short int *)__mon_lengths[__isleap(y)];
> +    /* SAF-14-safe use boolean as an array index */
> +    ip = __mon_lengths[__isleap(y)];

Thanks for dropping the cast, yet you doing so also needs to be mentioned
in the description (making clear this is deliberate, and why).

Jan

