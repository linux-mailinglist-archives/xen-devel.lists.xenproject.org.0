Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 333B58517B6
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 16:13:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679637.1057186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZXzW-0004Cs-9b; Mon, 12 Feb 2024 15:13:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679637.1057186; Mon, 12 Feb 2024 15:13:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZXzW-0004BP-72; Mon, 12 Feb 2024 15:13:06 +0000
Received: by outflank-mailman (input) for mailman id 679637;
 Mon, 12 Feb 2024 15:13:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iVD=JV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZXzV-0004Ay-5k
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 15:13:05 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37f7168c-c9b9-11ee-8a4c-1f161083a0e0;
 Mon, 12 Feb 2024 16:13:04 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-51187830d6dso1306635e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 07:13:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e11-20020a05600c218b00b00410b98a5c77sm4697261wme.32.2024.02.12.07.13.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 07:13:03 -0800 (PST)
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
X-Inumbo-ID: 37f7168c-c9b9-11ee-8a4c-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707750783; x=1708355583; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xx6RQITngQNSwNElmlNiSCVTEr0o1+m656emyig+vpk=;
        b=dlT89y9gYv5+qUojVoj1LKGvrv+aWYK+HF3FqzVazMunkIprEUeWYqv0DzZjr1oabI
         AoeqhEKTHWCQJnDH+wfhui+eD71DKEcYmm0FakUiCeUL5gkqlQfTAe+LLq/JX4Wr1Sue
         1le66k/xR6n19KCPJSzm4AMsuLBOTcPY2wHYMgSTFkpekQIDd9YfCG6/WoK/wpoG/Kna
         /+6wJP2nyh92ToUYtSmwTrtI6u1/vMGY9fnRZZV4znaiiZ3qSBStqgWBF3/A8sxTiF1O
         RdiB0FPgP0FU6pOXJK3SAMOvv+3k186qFwS0+tCU6TNozGEnj//yckmioW3dIeTjYsmk
         bYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707750783; x=1708355583;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xx6RQITngQNSwNElmlNiSCVTEr0o1+m656emyig+vpk=;
        b=djSqQ/olfbsOAuB4eUYsV11kWmxvyZH/0c2u60LSa+qyzIEvt54A0OBGd3O49QSwXW
         UnZvLJcX7laXgJDuPKgXxLcRHKOrCUT7Xuh/Jio7uxmgFH7mhDWRASeI3kBUM69ZGGJF
         es/1avY23xFNPiHSc2tlr1ckjwdWH7fg0R+MRnZQGuFu+YR8Mq8vXog7fg6kO1G1a7eZ
         po6OgzKtaQ8v3f0JhFU60tno+oDmOw530TMfi3QbXrXIgPAbfQbDichZzhOGgr7qz3ZF
         /jLqkpEMI4ewxpVqwEr+fDyrXnrXMlBbT4zETYQkaN87Zz3F/isn+I5wsRDCoLjyHnCe
         qjdQ==
X-Gm-Message-State: AOJu0YyJA7IVUNIP5jpkPyNWS4fM7BOmvKx1jg+KOItmrSn6J8jz6CCi
	GJQJwYzEtn8RN3Qt0xbQDW1HgOIE6O4sVD8rAi4MNoOrDhsfqpdnL+DEOH3sTQ==
X-Google-Smtp-Source: AGHT+IG12MZySDOfZEwetu/MxoPJMuy6CDtVGBF5fvhPMZZZPE6K6f3rnFoOuII+sJXPkRFnrIKW9g==
X-Received: by 2002:a05:6512:400c:b0:511:3b8b:6eb2 with SMTP id br12-20020a056512400c00b005113b8b6eb2mr6203557lfb.42.1707750783600;
        Mon, 12 Feb 2024 07:13:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8WGAkqHrhp1u1aeAdciGiK7Mq2qXGa6Uu41dYi+pHY4IsyLsxwpCRJIMSXN1r32VhnrX0tFbnqq2VQZSXNAw+SUIzCZOpIUJGS4wbCKdVMrGmcZ9RIMafMF6K2nqhSVUqGPOr3bI/CJ+OJEk355YAyJOLIDTONTE7WO94e2Qj3/w8AbpQlOzeSHuQGarP1BJMZ1x5Wp2GDYSMDa3QwNLJEU2a2sAINR94qVY72rfq96ebaPk1kzoLjTLcY8nNMG1V7ix1UekPGvekTyhYGov2fLy/1jA/MlVcuQJtAYmxMqy05sWQRPE=
Message-ID: <3a74458a-809f-40e4-9c86-e58e339fe96c@suse.com>
Date: Mon, 12 Feb 2024 16:13:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/30] xen/riscv: introduce smp.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <4d0a8aba3ec17fa428f8d18f0008f863481b1f67.1707146506.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <4d0a8aba3ec17fa428f8d18f0008f863481b1f67.1707146506.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 16:32, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



