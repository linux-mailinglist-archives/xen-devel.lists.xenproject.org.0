Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CBECCBCFE
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 13:39:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189530.1510288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWDHM-0006fR-Cl; Thu, 18 Dec 2025 12:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189530.1510288; Thu, 18 Dec 2025 12:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWDHM-0006dS-9f; Thu, 18 Dec 2025 12:38:48 +0000
Received: by outflank-mailman (input) for mailman id 1189530;
 Thu, 18 Dec 2025 12:38:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vWDHK-0006dM-QP
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 12:38:46 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7dd810db-dc0e-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 13:38:45 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so4109715e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 04:38:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be272eaf8sm42043145e9.5.2025.12.18.04.38.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 04:38:44 -0800 (PST)
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
X-Inumbo-ID: 7dd810db-dc0e-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766061524; x=1766666324; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hTaNE6jE2EfaSY0JmCXlxPm00ZQkbBPUxTgCLf6xoEY=;
        b=C+ODcsvonzvxbWHkjHyBJ0ihj1F/QlBBS5wcoi/f52tYL43omisE4ZsdMUQ1+XavqT
         GcUXCwPXV8Y03b+9RSOl6OcYJkJIxeKDY9HQHatlex2Smzoang49QNoJNyDBFZMymKvz
         SpfshmLIPClG8fhbBUpKL/WNvEZB0ftxjjcbMTbVrbHRl0sqNYyzoy6hulhQp550FYNS
         0ggph9+P2etXJE1JlypsunyhnFz53HpZ5RDBex04M+62tuhXdT3/j/K72bLFEi75nfOz
         vgyyTP9vxeDN3+z+ZVVs/zLYWkWvTGrVKcbk+YJ7XrX7yU6cqwMLux7a1aHjCTWCTapQ
         cbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766061524; x=1766666324;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTaNE6jE2EfaSY0JmCXlxPm00ZQkbBPUxTgCLf6xoEY=;
        b=p6jRlTvKB/8pJNPd3iXn8apUxggKqgpRkciZ8H5tLr+e5mGHK07vVGRLgOyTm1qAGG
         FAtZ0dWDVa5i6S6FvQFA7iYu74ZnEZvFnQGNHWcDMvaXXdVSbW+ybdsx2XkHQfsVakYO
         A2NtoBbodJXaRhN8e/qmkWQJ64ro8/VeYKNeEV42e3vycG5Oa6BXz1uN64zczWwTAGOM
         9UoObkTpGU8h3OB+PghceabEFpSgZwRAzTf9s9yxPGLNzuHI+kKGi+VUP6PfrPfrgYmG
         2mGgZRq8yduW0VcSYQw+Da3ilK3xQFnHXxfyY0Hbe8xVdDL+klSg1LZfpGuvDp95TXfj
         BBZA==
X-Forwarded-Encrypted: i=1; AJvYcCWWKtRidyPk+vfDcP24AqfzccNSybbonEE8RLwESJ4vDiBaUmBSXDCUmSukZZK2k4UD82u5y2GnMUo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/KKLyMIhDus8PplSoL76OIR3iMzuMbbCkdWmWWQhzyVI+KmEe
	bswaAiYqnle9kz28TUQVfcuZA/KsYBMOq1OMmz9q7o7E4M1NURjDmKKwH2gTr7iFKw==
X-Gm-Gg: AY/fxX40sKDMpITNZ1ynES+TZo6b1H9y770diNQc+EJZAuPWqZoRwt5rttcB4+Tm/mC
	dfrO5Q+eCytvgIOc1BDZzr01aiFQxncIRwxWsfJhKiMFJsgXEx6IgeY1wDbXKlY8mpAM2R0bgBa
	ljtZT3PWdIByDvb72BPz46LdS3QAxRI7wfWgBEal9L5AhhqBiWNL5u1pthtLfuV0BAugjHtY00E
	RWQmeWZ+JzK6sKu9OBSFckbDTNB3HRpedy1JlNPwVUu6eoUkj8bPvRpqJaVHmMYlIEt2R2h5aEV
	vKA7gZN6/IDSj2pWQF6XFhm0y54/Cm/ImiLTOpojSED5NJ30mnJuQ+qWzBqGmZBTyKXKUqm3NJ7
	V0ScHpnRafEmlQ4i7KK/F95XUh1bLddIEdW1DxSP7gBhVyR7RvbOmRy3rQy5u/L547Z7RiBoBNb
	gEf1KLFcIVOCx9AU272jgsfQcNHav2hsawAjGQw1wsia36ZDFYOEbGhPpFCHy1YmJaJClo6ZQax
	0Q=
X-Google-Smtp-Source: AGHT+IGoBeBvzpE64OpixgY1teLRik67wzqXTYLB61j0ttsJaKzgY4Awyjf+y4D/7VndXDj5I8vb9A==
X-Received: by 2002:a05:600c:37c8:b0:477:1bb6:17e5 with SMTP id 5b1f17b1804b1-47a8f90d9f7mr232781625e9.30.1766061524300;
        Thu, 18 Dec 2025 04:38:44 -0800 (PST)
Message-ID: <39fb28a6-25eb-4654-aa8a-311a8593c007@suse.com>
Date: Thu, 18 Dec 2025 13:38:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/19] xen/dom0less: abstract Arm-specific p2m type
 name for device MMIO mappings
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1765879052.git.oleksii.kurochko@gmail.com>
 <912db2169ad1ba5e021fc58972fd92aabc213c5f.1765879052.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <912db2169ad1ba5e021fc58972fd92aabc213c5f.1765879052.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.12.2025 17:55, Oleksii Kurochko wrote:
> Introduce arch_dt_passthrough_p2m_type() and use it instead of
> `p2m_mmio_direct_dev` to avoid leaking Arm-specific naming into
> common Xen code, such as dom0less passthrough property handling.
> 
> This helps reduce platform-specific terminology in shared logic and
> improves clarity for future non-Arm ports (e.g. RISC-V or PowerPC).
> 
> No functional changes — the definition is preserved via a static inline
> function for Arm.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Since there still is no Arm ack here, could you please clarify in how far
this is a prereq for subsequent patches? Looking at just the next one, I
can't spot a dependency, i.e. that next one could go in as it has the
necessary ack.

Jan

