Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6746C91E81
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 12:58:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174776.1499722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOx7L-0004gt-Ep; Fri, 28 Nov 2025 11:58:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174776.1499722; Fri, 28 Nov 2025 11:58:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOx7L-0004eC-C4; Fri, 28 Nov 2025 11:58:27 +0000
Received: by outflank-mailman (input) for mailman id 1174776;
 Fri, 28 Nov 2025 11:58:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/8R=6E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOx7K-0004e6-8B
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 11:58:26 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87b3892c-cc51-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 12:58:19 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-42b3108f41fso1164151f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Nov 2025 03:58:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1ca8bae9sm8946676f8f.33.2025.11.28.03.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Nov 2025 03:58:18 -0800 (PST)
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
X-Inumbo-ID: 87b3892c-cc51-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764331098; x=1764935898; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KGoqwkJNCDWxY+Zjt/8k/Lf4X5YblVVpiasPP8+c4hg=;
        b=FhGfzUMHmf5FlPOIUoFmiOu+25nbY1F+L/31ksYAQ+evG8Z0RQpEZNVUoAhFZ76Yzg
         rPspcl0mdWsc2MnAo+FInEiznTxtzqR/W4AzzBswuow5l4O00O/BGpFHlAlEPcvMW8ny
         5If1cOt/xfE+E9Fij5XZxELcSUz2QJzLmij/q8D1Y/UG/OVnBHTXAXPKNW964DloQ9OJ
         pjoZQvu4Mtl0Ht+rQBc2OvBLhl7InvwJiu7ozuwQcBUhXttc+/PcV2RzA6MaqypTwE9K
         2FYbG5ejFuop723zUZ38nRyc13+R6wOeyv1bfHjANQPOonSfU5tIfpcVUUj8uFoAZTmh
         /B4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764331098; x=1764935898;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGoqwkJNCDWxY+Zjt/8k/Lf4X5YblVVpiasPP8+c4hg=;
        b=PjpR1d4VccaR+nkrRo1HqK+qkcD+xHxABtaEoiCxxmfSl/I9J+aHTVYRRDjaK1jSzF
         7NZNYuklZ6UP6jrMIlUMTAXsWI2noT1imW8NhtRjsnQqlrXI41zc+ulmOU9jmP2mEiQr
         Ow6RAp9tQnC08U4tri08nCdmrgn5d7ap0HtnBbGeIrPtTRz8NlYBaCpi2ZXdVKWsw004
         Cyrsxl5ykKjYDYF/h9lZW98hLxI66Mzb2CUBBuxkQg7oMHB7ou4KPYCJGQng/y3g3pI/
         R2U9w2Gc8K5ZUByYLhSrP/kX4AbZiRTxkNLPjN3g4cTBu/flu8edY20gLC3uYmfvNM1q
         SYGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtF7qnkTNXH+wmQpKH3EBa4nMPTRHcH/Xo743jv9UFBTBM5anzFOd1qC8l2gliNzaSXDSRgSAYCn8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YywdIvbWiUi6ABQJmw5VPrEgt/cwl6Sw/fAiMRjEyPMsQ67D7/P
	psXPZrCtMtkpEERU+UDqvGvzgxfCxpBt/yL54141AaxIZkMWXvI2gIoY+tGE58/GMw==
X-Gm-Gg: ASbGncuk4wjB1Dn5rxMGFGpTKO4io4NRnOIdjKYOfdE8DXRBkKYNAdGlCxR+OiQ0ZQu
	0ru2iDD+VhwzBN9xO/4bDN6OyNiBQkTcddKf2JdBtJbv40H0tbkt7KTbsPZaiJgZ70CW1CgvsXp
	kwOu/390CikDsHI9EEsHLx8h1K4oGmoKczVeIh7sC+VBfLLfV9sk8dOxu+Xatk0Vxuyt5v1OMN1
	BpmliZJm8uy8ZeZIY3wCMTxWUM4Cntkpm6veoR97x+uS9su2oQygHc+gSfKj6/R3Pj0FcK3cv2+
	kHSBZMB7naJkLGiCTqhe82FBJyVOFBl9GGmwMmqw/xbGpMcH4UBD6V0WXemz213zYQbEHng3mNg
	oXfU64l88BDO8/oEfFTHi2iAcXYZiOA/RWb20GizyfalsIP7lMZTwdfw+F9sR6gNUJboS2wBhpj
	iKzAfmTgMlbJb7M4FeVKook/Zk6TmQBoSVZnPc2YThmnz+HIU2nwX0ZZw0c5dtzcZv/v0wxHvnI
	9A=
X-Google-Smtp-Source: AGHT+IFMxSGD45ZCoJZBu3jUjLurYk6YUswtcXBxj43cGpaEUwGRJa/KWn7dR7nQbJDuvGqpklgyNg==
X-Received: by 2002:a05:6000:2311:b0:429:8d0f:e92 with SMTP id ffacd0b85a97d-42cc1abe1b2mr29895087f8f.6.1764331098477;
        Fri, 28 Nov 2025 03:58:18 -0800 (PST)
Message-ID: <18a52859-1b73-44b9-a54d-2f37c7ec9933@suse.com>
Date: Fri, 28 Nov 2025 12:58:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen: move vcpu_kick() declaration to common header
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>, Paul Durrant
 <paul@xen.org>, xen-devel@lists.xenproject.org
References: <f291e02042a24de86cab5f62cb2301ad8c72fecf.1764328801.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <f291e02042a24de86cab5f62cb2301ad8c72fecf.1764328801.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.11.2025 12:38, Oleksii Kurochko wrote:
> The vcpu_kick() declaration is duplicated across multiple
> architecture-specific event.h headers (ARM, x86, PPC).
> 
> Remove the redundant declarations and move vcpu_kick() into
> the common xen/include/xen/event.h header.
> 
> Drop the definition of vcpu_kick() from ppc/include/asm/event.h,
> as it is already provided in ppc/stubs.c.
> 
> Include <xen/event.h> instead of <asm/event.h> in places where
> vcpu_kick() is used, since its declaration now resides in
> <xen/event.h>.

Centralizing is of course good. Question is whether xen/event.h is a good
home for the decl. Generally related decls live in xen/sched.h. There was,
however, a vague plan to try to split that up some. Others, REST
maintainers in particular: Thoughts?

Jan

