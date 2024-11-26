Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3833C9D952B
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 11:09:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843517.1259129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFsVa-0005wb-Tm; Tue, 26 Nov 2024 10:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843517.1259129; Tue, 26 Nov 2024 10:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFsVa-0005uY-Qp; Tue, 26 Nov 2024 10:09:26 +0000
Received: by outflank-mailman (input) for mailman id 843517;
 Tue, 26 Nov 2024 10:09:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zjIj=SV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFsVZ-0005uS-AD
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 10:09:25 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 817716ed-abde-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 11:09:21 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4349e1467fbso18111655e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 02:09:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434a4d41f9bsm25304605e9.18.2024.11.26.02.09.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 02:09:20 -0800 (PST)
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
X-Inumbo-ID: 817716ed-abde-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzAiLCJoZWxvIjoibWFpbC13bTEteDMzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjgxNzcxNmVkLWFiZGUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjE1NzYxLjY5NjE0LCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732615761; x=1733220561; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7lX9jabNt1n8cU2Vc1vfU+uQxnd+BYj60bQdNXWpFFo=;
        b=QW/jqOfEa8x1Plfp/UTJY5WhsdCbbNvM/dUNekM3mzztOBQThmkPpSWLt5cDz8oBC6
         QP/n48MQG7YgEb7v54/bcMcQDtwSRSt2A9kQYFswQ+bbejRQxJH7CMgOHFTQHZNsjpfB
         gXuK7pJ+19zxqH9TjZUx7zNOPI2krikGV1/Li9rmGF89juWEAhie+4yh5GZSoqsPKx9/
         YRdevPMGAqEPv4qaAs01WhTP7RX02ANR1x8Dn4ul+Ehl2sprfXPU+8YzdX5+GWRJGHGD
         i+WZQ+jkQv1qtHvCvhF5IY9s27CAxMRkq9QuX8K+GFjgs9XIc8yma+yxuphqNbB19e4D
         wvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732615761; x=1733220561;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lX9jabNt1n8cU2Vc1vfU+uQxnd+BYj60bQdNXWpFFo=;
        b=FSQox7JqG8nMHr0BWkEfo/+1JTAyFBFb3aVzxUHAH+A/qqq3OePSwGdHtZB3X4rrRN
         QzpcLGeKzhOaeIsjFnb5kSBfL9bkQQjfFSiGI3dA1+bwbmsvlf0QNZztbC/ucenz9sWP
         7XgnYgf6zBlmLfRkcZwEwpQFvG3TSQqhZDTjcRWW65TTADFWsXpM3Es/RmIH+wVP3SZr
         liZ9NCo0AgIjfH2yvd9f8YwRWcv+Y1DFimo7wateqDwBrjSFnQ8cNv3l/rJWIkO6D2ue
         aKS5IKqheEtDUWToBObbjz9PqmBA95caEx1HQ+j5ffnHakfHz9eUv5RZJzA0E7utke9g
         7cvw==
X-Forwarded-Encrypted: i=1; AJvYcCVblyx5uFqsfD+tmGr84/hTlIuMW42bymFjd67ACcTJ5xcPx4MMsZ8SQ1O/TqW4xmQ/mTZqSgWCxTg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztKGdDgx/2rGpEeZRiqwUIlALtEr32krxjf/6m++hy1x9zjqVC
	Cv/uVVCbRHxvb2ipdQQ0tWMj3vrTWJ/TMVgMMqkqWqWDGiic2ISrBFH7FaJofQ==
X-Gm-Gg: ASbGnctj2kUUea1OJLi4NL+bs/XFis4a2I59ggWiCCTBk3+FfDiRGe2xQWKwgQ0vqjz
	D9f/vi9KTtOwcES+JzhYMt7remGFIvEP4efx6hhuqdkUHbyGM0qU/9GKrK45rj0FRlQHBtJfa2n
	T+N92sI39O2pgquWjdC79j8repixjM1Bwn2QJ1q8md9XBLMPaTrumrLLaWVb4sY8NDEi2YCSmnj
	Wjymaelgd2T6xCbCv/GTfM5zuhvsgdnC+b9k1wg1UQxHGS6we8vfYqer1pSpvv5T2zcCwXejw+p
	vvL67qq0qkzAnNdKgOOjnBvni+hgEWb7plk=
X-Google-Smtp-Source: AGHT+IFWoj5mj2bJ+8SADbdIJtMJxf9g6qHkYhbgr34MMmrG2e5YpuRC3YB8axCWOU9VqWXvg5lSjA==
X-Received: by 2002:a05:600c:1c2a:b0:434:a902:97cd with SMTP id 5b1f17b1804b1-434a9029a54mr49165e9.12.1732615761118;
        Tue, 26 Nov 2024 02:09:21 -0800 (PST)
Message-ID: <aa722ea4-304b-47ec-9d93-ee88a03b7b53@suse.com>
Date: Tue, 26 Nov 2024 11:09:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/15] kconfig: introduce domain builder config option
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-6-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241123182044.30687-6-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.11.2024 19:20, Daniel P. Smith wrote:
> Hyperlaunch domain builder will be the consolidated boot time domain building
> logic framework. Introduces the config option to enable this domain builder to
> and turn on the ability to load the domain configuration via a flattened device
> tree.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  xen/arch/x86/Kconfig                |  2 ++
>  xen/arch/x86/domain_builder/Kconfig | 15 +++++++++++++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 xen/arch/x86/domain_builder/Kconfig

I think I mentioned this already back when the much bigger series was first
posted: Please no underscores in new file (or directory) names; dashes are
to be preferred.

Jan


