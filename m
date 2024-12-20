Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CF79F92C9
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 14:09:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861823.1273866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOckj-0004eF-Mi; Fri, 20 Dec 2024 13:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861823.1273866; Fri, 20 Dec 2024 13:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOckj-0004br-JT; Fri, 20 Dec 2024 13:09:13 +0000
Received: by outflank-mailman (input) for mailman id 861823;
 Fri, 20 Dec 2024 13:09:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tOckh-0004bl-Qc
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 13:09:11 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99aa9e5e-bed3-11ef-99a3-01e77a169b0f;
 Fri, 20 Dec 2024 14:09:09 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43635796b48so12124455e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2024 05:09:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b119b6sm80811795e9.22.2024.12.20.05.09.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Dec 2024 05:09:09 -0800 (PST)
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
X-Inumbo-ID: 99aa9e5e-bed3-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734700149; x=1735304949; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/DbzH+G5ALaJjfb6JUJuM0SmHhzstkfyXiRu1blFeAc=;
        b=Gsby8QdQkJ77NV6Q/Flh0n9MdmmqDydAyGnAJf3oTbvdHSShn+sbcxm7wS9Xfze4mQ
         F2Y6OJCGjGLH0nsn2ajtw0yZhacphlfaoTaSt4tbzZYzRaWO6rKKeg7z3/jHFXJ4wHi9
         pKgiMj3HDy6zAVYmVDbtXn1zfrpO0X4osZiDLOSCvmKuf0eWzBNIg7U2n+Az3N98ZRFl
         UPQ+8LScAW9HpF6MlY6tZDHI8k8WviPe+t1Uz8BHQidYGEEs6s4T4z0BB6agnVVJBzlu
         OM38jBC38NIWantq1tq4I3C9isADpCHXZaT7ofxUn6h2JbOjxpxWZIbTMtpLkfs+FXDP
         Y2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734700149; x=1735304949;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DbzH+G5ALaJjfb6JUJuM0SmHhzstkfyXiRu1blFeAc=;
        b=pvr0TBTXtadfxtA+NrLShVmVJJxGseVFZUr+dJ750MRX4fsU5eCSzmUa3pcmlsAAne
         3kHV7+JYZNSuzRfKXdBYP4AR8elLU70yXOF5aEqzhvtck40o+UvmUXs/TP5K5i8m8Sz6
         /5jkbgqMscM7Bf+h5DwLNDdExaad/TJFpJA+w9VGrKSmxjBAPXiN/03voRNQd+hpxbOX
         cU5m229ByA4cGFJtxGxhSqsfcrylgX15zxPrW2RmhpeYlID5kY4OAsj7teezpSVOv9Hs
         pjI6WDcvABGWQXS5WqAEToSfYY1M3Hv66giZo7Lu9QnUVMlmHkU+TfsWNf9QdmnNgozL
         U0zw==
X-Forwarded-Encrypted: i=1; AJvYcCWESnuhM24ChAKdWJ2Cn0r1OA95SUD56a2roWKk+xPY9PODBuVnJV6sAcWGuxJCyzdSCrMrGAVVpwA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVHoRpBjk4NJnlgKp8gWVENrHwtfJqUMXIjQWFBCfhqe/7KLiT
	iAPiHraM3NhDbynRvWu9H5fnn89IYZjhMWalU+amZujaj5uSwFVxxCsDXtuoEg==
X-Gm-Gg: ASbGncv8Y6GJU+2rMgjbsV9z9F3KfTkha3JYZrDKZKDFZqeJz8BijDrD9qRLPUyqtC1
	2DjwJPgV/PCY6nAISczCqHEvF7U4ZeCQu+aHkLrv4xb5Vld27rlCYch+dzYMWD0yhLJh3exns7X
	IprxxZWzOu+RtJSzdbS7ITH8+AhFujRAnQyqwNH2mu/bfJrGSkBGxSGFqK2b2Qd6mveBm7zwYsO
	Wg8xs1HQQ/f1vyvY7TUm2/fJzV/N8EWIffvgqMkcv8yJlQY7Pj70DBjX6VGMZgKhnVaMdl6MUe+
	IMOSTQUbJaEiAPDpCWg+uX3muRTy2Mt+39b/gSNXAg==
X-Google-Smtp-Source: AGHT+IEsm+RdyLje2bhcs7m+lKtD6L3chMQuhqOKsMYTxp1pOATRpfX5VLv09AZk7R2/ppq/E18pAQ==
X-Received: by 2002:a05:600c:1506:b0:434:e65e:457b with SMTP id 5b1f17b1804b1-4365c763d36mr68676395e9.3.1734700149300;
        Fri, 20 Dec 2024 05:09:09 -0800 (PST)
Message-ID: <258c4e83-4379-4212-b80a-4fe909849e66@suse.com>
Date: Fri, 20 Dec 2024 14:09:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86: Add Support for Paging-Write Feature
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1734652343.git.w1benny@gmail.com>
 <f381634bd45c647d145a81c0076211ea044febc8.1734652343.git.w1benny@gmail.com>
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
In-Reply-To: <f381634bd45c647d145a81c0076211ea044febc8.1734652343.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.12.2024 00:55, Petr Beneš wrote:
> --- a/xen/arch/x86/mm/p2m-ept.c
> +++ b/xen/arch/x86/mm/p2m-ept.c
> @@ -176,6 +176,10 @@ static void ept_p2m_type_to_flags(const struct p2m_domain *p2m,
>              break;           
>          case p2m_access_rwx:
>              break;
> +        case p2m_access_r_pw:
> +            entry->w = entry->x = 0;
> +            entry->pw = !!cpu_has_vmx_ept_paging_write;
> +            break;
>      }

To avoid the flag becoming "sticky", I think you need to clear it ahead of
this switch() (or right at the start of the function).

Jan

