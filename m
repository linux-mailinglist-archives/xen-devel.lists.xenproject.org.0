Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D22CADB0A
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 17:04:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180914.1504014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSdjA-0002RO-Ir; Mon, 08 Dec 2025 16:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180914.1504014; Mon, 08 Dec 2025 16:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSdjA-0002PY-G7; Mon, 08 Dec 2025 16:04:44 +0000
Received: by outflank-mailman (input) for mailman id 1180914;
 Mon, 08 Dec 2025 16:04:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSdj8-0002PN-P5
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 16:04:42 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a5b4893-d44f-11f0-9cce-f158ae23cfc8;
 Mon, 08 Dec 2025 17:04:40 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47775fb6cb4so39190805e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 08:04:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479311e7142sm250627015e9.11.2025.12.08.08.04.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 08:04:38 -0800 (PST)
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
X-Inumbo-ID: 9a5b4893-d44f-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765209880; x=1765814680; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PD2q+aIGMbRjnQLajzi1FIIMn+lQW9NrQYTkDN5YL/Y=;
        b=a1foIE7pQOB93tfCT0b4ay0YhvdrEFWdusvPiM7bZP2/LDQhEiDQaxs4JoV7zipecv
         DcP0qmk/CMpHtOPh6F8ObUxo+EydZhrAS3REyt43FOjy5Qf40KsIrpwLkFmtxKHwmoCg
         fsrZTvZlP6CHnBMrzAmRuPoH7xXxm9l5JzHG1iKyKD+uCKmsBHF1u4vqpFnWSk4bphBB
         0i+OUY8o0FtoqeshWaB2dp7E8MeL2NsqnKT3VAzpo9BNk0TZDNDtvrjExOl47UEKbkjQ
         HKfUgtn7FuUZmOv+h4khY8HsbYgaDSoy7eFoae11wUDUjxDcostc6iApkedVdCx6VCHR
         fyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765209880; x=1765814680;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PD2q+aIGMbRjnQLajzi1FIIMn+lQW9NrQYTkDN5YL/Y=;
        b=Qbuz9VGE/UgFi71MxKSfeyFXndi8s2YIQnxlkfYQjxyyUyoWEws9Jlb4xFHAyF4HUD
         CEdY6bUPoq+OE5hpBf8+LfzwWI2wrimFpcpL0MQN05fFM0Ah9an3h8zFuPNQJabiDJWt
         OOgCH9Yp7K6yeOowVVk6ReaYVAPYNy/6JAaQR502CHo79WL7JkqyHKHJwUTDB3ykaida
         m67pvyieN9WVyl2uaDkYdxR10EZt3t0hzhLMUkJ9nVQzWUqNjG1AAp3skmmpa52RJhCL
         wjr521pdCT2jL4YPgieHUPnEeQUgTRuHs+baU3WJv7p2d3S12L6brTcbcWLtuPGD2IJS
         Qt2g==
X-Forwarded-Encrypted: i=1; AJvYcCWVChsWJ7e8TcbF0dtiVSv4wVrPQji6xI+z9mBU3yH8FleN0i37BISLbJk1gXk23T+g2JfJop9W03o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyo7KYiw+Zul+DDvMaZUgrWasWgb97c6nP6Ns6CGz/8DtwUE+CX
	ESpzHb07CalfFBueV7q1ol9wJ+rOtnabVw+esd509ZrkoPLdB/ippQE6N1ZPME4gJg==
X-Gm-Gg: ASbGnctuDnu8D4erCjSy05/8XZCeus+gcRd2ZOVYmxEFRMgiZTk/XEdZCNbJf+a2NrU
	ejDn5+iPtITM1JM9NwKt4mhbpVem31eGrOcJtyZ6gWERejbtYuzbts+oIvuGdoyULw60uMsJ92K
	7s+6m+eoiCrhg5gLiCvlgcvIbOOVJZqjOGxpLHDSlFmxsxxyQ9wkcX5DXvTO9V1wOFVZOHzqeBa
	jAS9VLIxP3CXQe5ZnT08bvkDSfB6QMl0fp7FSx5+Y+sVD7JPggzK0fLbKCEZXz1yg9qOqjojVVQ
	mECIDbDJSawG09H/9pn/Z00Ixh0Epyu8T11Cn4Yibmoj3WYhm2VlF2bktOthoq+kxyqzjgSbqGm
	O2s4xvu80fUs7WdKz1C3iTrHvoaOIcxhS9qdNJDkb65KtFbJpt2a6ARu1TSS4wyiWX1PdZXj25j
	Sylzs/fl2/+2XyuB8joSDMMranjyS0uSXMHmkS4gUupRq+U43Ls/qb1yDULw1kwEEoeZ9t6Y4u/
	MQ=
X-Google-Smtp-Source: AGHT+IF0WxToV3EqatS1zdXokSESR3o2AaEskF1WbnWBLXzuntvlzY3zGse0pl0ex2tz9X4zTmG25w==
X-Received: by 2002:a05:600c:1991:b0:477:8b77:155f with SMTP id 5b1f17b1804b1-47939df427cmr78644145e9.8.1765209880158;
        Mon, 08 Dec 2025 08:04:40 -0800 (PST)
Message-ID: <73146271-c849-4d16-8eb8-80e7d59f42f2@suse.com>
Date: Mon, 8 Dec 2025 17:04:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 09/11] x86: Migrate spec_ctrl vendor checks to
 x86_vendor_is()
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
 <20251126164419.174487-10-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20251126164419.174487-10-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2025 17:44, Alejandro Vallejo wrote:
> @@ -938,7 +938,7 @@ static bool __init retpoline_calculations(void)
>   */
>  static bool __init rsb_is_full_width(void)
>  {
> -    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
> +    if ( !x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) ||

One other aspect: If already you touch lines still using the old (being
phased out) field names, please rename at the same time. This may then
also help with line length in some cases.

Jan

