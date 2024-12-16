Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 878509F333D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 15:30:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858160.1270420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNC7H-0005E8-8k; Mon, 16 Dec 2024 14:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858160.1270420; Mon, 16 Dec 2024 14:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNC7H-0005BN-5f; Mon, 16 Dec 2024 14:30:35 +0000
Received: by outflank-mailman (input) for mailman id 858160;
 Mon, 16 Dec 2024 14:30:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNC7F-00058e-Py
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 14:30:33 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4de7ac73-bbba-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 15:30:31 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so17101075e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 06:30:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c80120e8sm8448853f8f.6.2024.12.16.06.30.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 06:30:30 -0800 (PST)
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
X-Inumbo-ID: 4de7ac73-bbba-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734359431; x=1734964231; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kYZKkBzEG+u1J0E0fhjpe0G6dOD4egf6xz8FN1afcA8=;
        b=CjgF+9Ke6tDEEPTyTYvZMPHk7JrNev5FFQL4gIxLQJptMODkD+TnMxDYh83Ir12uk3
         b8K4vhBGSeymy+PG0tq1a+PO5smc1/cU9723qu5xJ5pPJ6tI6vw6qCOM7iOCSMo9gXQH
         OAFZEDJfbbCmGg/CGRAYXPaFkd/Qv5GX/Ox4dq4ar/syixe0XxsBklrfll0E0uvgAYaC
         HcveRFaGnPfoXEPOZZoSd1BoxR8oa7O9J733rRjq0DnwKPo6fqDXLwgOYUgpRTHOs/n4
         hd8VobE8tlzogWAKwOuGcmJ60cHkaRmMiVXBrQwb8AIJwnxHO047cvnGiU8fe8QWYgFg
         3AVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734359431; x=1734964231;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYZKkBzEG+u1J0E0fhjpe0G6dOD4egf6xz8FN1afcA8=;
        b=bibn2mVni4BW4dJMECpfcpeL8wZ/Nc2fJnhgO10EWkgYJwgoRBaZnMv9CzkWZSCxbJ
         6VZommXQHbY03qsBWvTUaK9m/iJZ1dko2JZmPdVdGZWiX9npdibdxz59WZhuSO59uCWB
         sd9OYECcuonDVtnHYnNw43+iVVay9iWwG2UFH66qlLPfO62q+Ap11gtE8C7xyE3cMnSC
         45IjQiMW3BDZ2vcZ8DOlmkAgwHTmmEjPP3cJ9+OgSgEd+vzAc5mQEpxVR0S7Mo/DRlD/
         KS8sS/PJiV4DNU7DwA7n65XzOEeBCuES+UyPrcS1sOGsn7ZNQfn6+eTS1g9iHelxVsJL
         fvDw==
X-Forwarded-Encrypted: i=1; AJvYcCVpGynn4tUqVS916Vs1LHaK/BRJtVvllVYmWWIF4AaB2+Fv/SzR0PQwXYYzD2J2pZj/7IS4EzCN5aA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkQRgwGKj0+mNjFCDEGG1kMWSNgoI8QOaR2dYGzC4qU48/ORrK
	CzLdToAMeZrd1mCqCUINc1F1JUB42UUWEtAt2N8+klBwZZQDKF7IqidUGBEfVA==
X-Gm-Gg: ASbGncsZPKILgPSKPVOv025vo7n/KlErzJRK7EEpE3qJdsp9TGyNpo2qrEVITTIb60R
	JE/4WMPWxbdccQU50f66NwEc6AeAtEZeomj2qF7wZg//ZnSgaZgwIbIZBqliNPtH+9lP/km6qRG
	ijYSghkzvrNA9XXuxu/g1Eff6qD9QXmwwvZz0ZqrkUe9IsMoL4+SBxYizynutN6mGz7MH3jTSX8
	cR9wDWIgheZeckRSFosA+vhGiDViF65YSYvX/JS0OwjZkqS+YB4pzg/a5sBpKPpZ7Oj1uwzGhqi
	JPHLTR2USJKdVGN5Mbq177MiHxNvhrbiwxH4vE3ENA==
X-Google-Smtp-Source: AGHT+IFXG0tASyJ02bOKLmQz2kd3j56YyHnAJrriI3PymZvSigN2UBSkfM90U3mpskKQlpvo5aUFRw==
X-Received: by 2002:a05:600c:1c16:b0:434:fddf:5c0c with SMTP id 5b1f17b1804b1-4362aa1ac74mr117033905e9.4.1734359431258;
        Mon, 16 Dec 2024 06:30:31 -0800 (PST)
Message-ID: <f9242213-4371-44b7-a963-e26848116c5c@suse.com>
Date: Mon, 16 Dec 2024 15:30:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] xen/riscv: implement prereq for DTB relocation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1733937787.git.oleksii.kurochko@gmail.com>
 <2d2d6ca32aa7db490d47154530f01216651ba335.1733937787.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <2d2d6ca32aa7db490d47154530f01216651ba335.1733937787.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2024 18:27, Oleksii Kurochko wrote:
> @@ -175,10 +176,16 @@ static inline void invalidate_icache(void)
>  #define clear_page(page) memset((void *)(page), 0, PAGE_SIZE)
>  #define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
>  
> -/* TODO: Flush the dcache for an entire page. */
>  static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
>  {
> -    BUG_ON("unimplemented");
> +    const void *v = map_domain_page(_mfn(mfn));
> +
> +    BUG_ON(clean_and_invalidate_dcache_va_range(v, PAGE_SIZE));

Please avoid expressions with side effects in BUG_ON(). This wants to be

    if ( clean_and_invalidate_dcache_va_range(v, PAGE_SIZE) )
        BUG();

Then
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

