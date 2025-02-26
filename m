Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB3CA4569E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 08:27:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896190.1304868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnBpV-0003xV-VZ; Wed, 26 Feb 2025 07:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896190.1304868; Wed, 26 Feb 2025 07:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnBpV-0003vj-Sv; Wed, 26 Feb 2025 07:27:41 +0000
Received: by outflank-mailman (input) for mailman id 896190;
 Wed, 26 Feb 2025 07:27:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnBpU-0003vb-Pc
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 07:27:40 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2838f71f-f413-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 08:27:39 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-439350f1a0bso3263655e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 23:27:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba543fecsm11275415e9.30.2025.02.25.23.27.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 23:27:38 -0800 (PST)
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
X-Inumbo-ID: 2838f71f-f413-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740554858; x=1741159658; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBnEzw0SpJx5IDWabD3CNkR3tDUVXzOnZheJh+ylFvs=;
        b=bjfBk2Kr9dQ8sxMRAt7N4dH45IBuyxcLaY4FhC6P40D+j9nepDxK5FchzfiR6uaKy5
         93DAhFN+NsQlYohcyC3qm+nlYL/0X7jgZ7dmDNtnneHhKAq2YkzkMleMDfDCzsAz/ix0
         hkT4T0gb6epk8GdUhLA4Yxi9vV9wOTGl9gfNluI5b+e4Vg7H/2ZSmnM/ww5wTtwah0KQ
         eZaLdoyUNdMf7E5fl1moVj5yLXodPvSFJvKycfRnoYKabnxf1KjJQr1DQZE9dl1grGmD
         bqPiE5c2pVn33C/UaPdPwPIGJEVPOhbwiIuB8pjxtEgMhCXhPGH7mFBFsfgx1KzwOp2+
         6vxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740554858; x=1741159658;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBnEzw0SpJx5IDWabD3CNkR3tDUVXzOnZheJh+ylFvs=;
        b=JBhzDZdKgo/8m7/4E8ImgTimvs2JK15QcGexDrnRmo/yOLwxwHrMwGuVilYWexrWdV
         8WF9CbhOJlYJp+tpl8KRgJGE8Ekic6pV2GDdtxWY9PXopR/jCjZc5fT9ZS/vgXaoYAE8
         Nhxqe+7mKadCbhrUXa/xKjmUZVi/DOtuCnSaEh+rCljG1JpJOaojDWTir84Spo+UIZFF
         xaZG++q3SAoLibUxkmxD0nb4sN95t3SpNvzQNTfYXaEZT9OhyCD9U41NEo1qx6c1oDAT
         oQlaCtrF/sRlf9hL2zx8JeSkg+QP7NMxBCdKzDq8r/aSC3/RIa0tzkstVCECY3DwjTE3
         K/Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVd3JiVjoHkRZoLUOOwNZ0PIFDWuCT6C0bbfqpjyH2yA0sLVp/TlEMtg435+doo+qMw2FhK44RX0+0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx2IvnRVK07LZOfATXTB5pu3QJLvHQzs2sTXZL5u6oaVcKGEwH8
	gR52hAgNSwnguqPh5pHQFl4/AjJt4X7N+Ht4RHg38B67mYDNs3lnGE9cgprIHQ==
X-Gm-Gg: ASbGnctivlhUjQJVWdhwo3iZ6U+W7z6WGuwiG3YN3j/mNCmz6iUX0AvWoJ9Po7Sd+U7
	BD3vHQHDKa2aeEZQnQt/cXaYTmCGyzjTOQnniL+TRZ+COWCLMKwEQ2tCaIS8aBGY+dhuGIcJYgL
	35FFIqOveaqhfXSyqGrbFOVbEGRoe4hEkZUlzYj+YFGQDTYQkkp8Qebpp4UhcXB+8jRh077U6AQ
	Y6QdPDP89iovxuDwTKeKFi/aSDuu9lpN+MdAIOZIq9x3G7C7JnmNM15iGuwQgY8TXo0ml7R8BiL
	0YvRG7mp08VbnckEhDRrOeN4G4f0EmOX2U85nWmlJbrBE9CprL0BOoIsvUE+0rumrCypd1IwlbH
	X43t0cV20HMI=
X-Google-Smtp-Source: AGHT+IF4Mfj/wFyo64hA650XXiakxPN0BlGT6DtTzFsGldhR5lyuQ16aCopc2A6/RdTMTe75qxqymg==
X-Received: by 2002:a05:600c:54ea:b0:439:871d:d4c0 with SMTP id 5b1f17b1804b1-439a2eb09f6mr196866925e9.3.1740554858446;
        Tue, 25 Feb 2025 23:27:38 -0800 (PST)
Message-ID: <0563d503-e7da-4b2f-9a97-e5b6b3e78108@suse.com>
Date: Wed, 26 Feb 2025 08:27:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/traps: Move cpuid_hypervisor_leaves() into cpuid.c
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250225223137.1183313-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250225223137.1183313-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.02.2025 23:31, Andrew Cooper wrote:
> It's out of place in traps.c, and only has a single caller.  Make it static
> inside cpuid.c.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



