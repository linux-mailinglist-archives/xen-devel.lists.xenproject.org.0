Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6D3A2E79D
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 10:25:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884486.1294191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thQ2Y-0006j5-LF; Mon, 10 Feb 2025 09:25:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884486.1294191; Mon, 10 Feb 2025 09:25:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thQ2Y-0006gn-HW; Mon, 10 Feb 2025 09:25:18 +0000
Received: by outflank-mailman (input) for mailman id 884486;
 Mon, 10 Feb 2025 09:25:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thQ2W-0006gh-RV
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 09:25:16 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed41f7d4-e790-11ef-b3ef-695165c68f79;
 Mon, 10 Feb 2025 10:25:11 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aaf0f1adef8so770081266b.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 01:25:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7ced6fe0dsm52584966b.179.2025.02.10.01.25.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 01:25:10 -0800 (PST)
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
X-Inumbo-ID: ed41f7d4-e790-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739179511; x=1739784311; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Pvo+E0a0jmGQspmj+sBecBampFq4UbsYgntNElkRm4k=;
        b=bzWDGqGNl4NzEzhVL/IlY+a28Qf1tfDhBZDf+bf1ZPbdR6sEmEgMcE5g1G+xNtnWnN
         gkd6O7lQbDEMO5BlqoSc/HVthhFmhdyFI7hC0LxjWBdquCx+5ENNyTxFxydPp/jhaxh8
         0T2ZGxy7EBus3tR6QyzvipF0M2FgVbQ+bx5E0crVx9++bli5DnllZKpuipKgC7QptiDE
         L+m+yLSLlSIxYsrOfW60nXV4DOELmniKy/Bv8UTnjy1nvaYjpe33Q5ByxouOyOy/n1Ro
         hZnRMVFZdV8Cj/5Kwzxeil8HcXg117eCqMf9+1EeooLjSwXkrGYVDkJR/spAr9NVTxct
         MSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739179511; x=1739784311;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pvo+E0a0jmGQspmj+sBecBampFq4UbsYgntNElkRm4k=;
        b=bPxM8HSw2vcYuqmL0zO6alT27ByxyCG+uv3Xy/TB0R4oqYFGCMgLkjpMgCvZQ4nElU
         tlRrGBK2wsAFNV2qEuutqjzVVaX8lqhsMD/cmx2kE39hP939NvJGd8ZHyuyFBimcrEQW
         SRg18byCQ6UJ4uXc2vMcvoXDgkuvU7IHLMQiUPiL2OuNfFXqvjKCk56gOxao8ggSP4p+
         Hsezd7UE+0kwNR8dC4smst5Rs1+Nzs03eBVCPxxNJq3a3ZUVphaokY3YmXSfbr9Itmeh
         Zr9EMuTgBz0T+KF5GRxdws30YGYe0LKGzDn8A0zWeI851HiZxITy7NkcErMXZHfbn+Hg
         kpew==
X-Forwarded-Encrypted: i=1; AJvYcCV7Dbbun5+0wocWFFrST1jWL5wzUVr0Y2Af6D1G8PzhklCFqdqZaozG2velgXBPJjGd5wMMUlFHi6c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXjEqryUCb4qE2XPWQ3kBrCDUTSDWynb/SQRN//sLamdo2E4eY
	wMPHcEl04SZdjhQo4CtxwRm7Z7Bus50qwD7HXHaThuETG0oBHFJ9utbgCnVNVQ==
X-Gm-Gg: ASbGncvszFQTIB+JCptJ/QwLjuuAYtlYriqVyr6+pb0ITRQKZhWM0+Vpx0CpA9K6OCK
	rgt7EktWaFR7zmrzLoMO9J0hkGMm4XyP71hEZS1TLJbLhIaOA/1h+bQ6ZWDanx3Cfqb9orPEM09
	/Pb0etv+sipwI9DveyahLth4OCqurGvzUttwcHbCVL1YU0YztT34IGBaHFD9xA58z0wGI56/Svq
	7ptpYxYxQpUOnkvU9wg4R13Te9sbCUOoUyk1ClrVAod1gV3RSBth4EAWdjybUoNfusP32CxzINu
	89vLUXomvNPv/wB8Z92rIEw31y+NAPvg5oqnUSm2HPp4gRdZZ70aqOeSXFiTjW2NufRrS+HjtGp
	n
X-Google-Smtp-Source: AGHT+IEKUtW6rJEhdeJcIvJUQgbM/JI+VCKrdHgS0gWgLVZ1uHRwkxECyi1lFUUUO9PurYt3b3f7Hw==
X-Received: by 2002:a17:906:3ad2:b0:ab7:beeb:d1f1 with SMTP id a640c23a62f3a-ab7beebd6e6mr276300066b.51.1739179510931;
        Mon, 10 Feb 2025 01:25:10 -0800 (PST)
Message-ID: <b62763a2-899b-4d4d-9c9c-64a2698714e2@suse.com>
Date: Mon, 10 Feb 2025 10:25:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] xen: Centralise the declaration of
 dump_execution_state()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250208000256.431883-1-andrew.cooper3@citrix.com>
 <20250208000256.431883-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250208000256.431883-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.02.2025 01:02, Andrew Cooper wrote:
> Three architectures have an identical dump_execution_state(), and PPC has a
> stub for show_execution_state() that just isn't wired up yet.
> 
> show_execution_state() is declared in a common header, meaning that
> dump_execution_state() really ought to be too.  Move them both into xen/bug.h
> as they're tightly tied to run_in_exception_handler().

Hmm, show_execution_state() certainly has wider use than just with
run_in_exception_handler(). I don't think kernel.h was a great home for its
decl, but I'm thinking the same of bug.h. Nevertheless (not the least short
of having any better suggestion) ...

>  Drop the include of
> xen/kernel.h from ubsan.c which was required reviously for RISC-V to compile.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


