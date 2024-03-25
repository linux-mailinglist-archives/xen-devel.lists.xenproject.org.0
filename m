Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB8C889487
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 09:01:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697598.1088478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rofG4-0007GX-Ml; Mon, 25 Mar 2024 08:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697598.1088478; Mon, 25 Mar 2024 08:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rofG4-0007E4-K8; Mon, 25 Mar 2024 08:00:40 +0000
Received: by outflank-mailman (input) for mailman id 697598;
 Mon, 25 Mar 2024 08:00:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x9L4=K7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rofG3-0007Dy-HA
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 08:00:39 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c47c5de0-ea7d-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 09:00:38 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56be32b9775so3274897a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 01:00:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m10-20020a50cc0a000000b0056b0af78d80sm2693558edi.34.2024.03.25.01.00.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 01:00:37 -0700 (PDT)
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
X-Inumbo-ID: c47c5de0-ea7d-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711353638; x=1711958438; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T3xtqaI6E5IJGgpu63j4LIE+WzlbHTlvZqtf48fDVaY=;
        b=CIx36ZFNIbDr0fGn6JAMiLhxnculB81+XxI646QfK6LBVCr9FU2QKrei/ftQ8pGDnL
         Y6wzB7reyrXRSI7o2yLD8UFtHWbxhC7i6mn4XpNTS04O9qcg4RG6AKcjcivz1tIRPxyX
         hl4Lz+Q1zMAbncFIA261afhCRXsdgOUNVRYBU6Y1xPwjLQptje8WR4DQy4GKwx5TUiVZ
         Ct+QwljvsLllwEkNfFIpnlXIqFE0MwtbtH+Kuh/mMAFHbXvvk4r4stxbafW6u/TIOPFW
         OkbVUpsraNldnfoaTHVaOLle6pnsS9ymlgDvupbcZSu9BBMTHix6HmxlTyHzHxzpfBpf
         jmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711353638; x=1711958438;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T3xtqaI6E5IJGgpu63j4LIE+WzlbHTlvZqtf48fDVaY=;
        b=Grt6M2oLMJmY36TRMlcxDD848rnvQiYq35RIoq1Isgdle/mDuSXSlxP3sqkHsSRfBx
         NUqN23dnv+U2VH+kRk+Y7uZEeAOKnIrLFyLWjC5zE61p6ramvaEeeE2dut4sGlp2RJRE
         A2rWNqGIpLqI3Bo9+MOFD6qbYr8QY6Ot7i+T20GeU1ZiahHvtNr2X2A8JsYTcfhtjGB1
         4csW+/RqmBd+n7sM+aUTNob6vkradSYs+ZrhstIY2YOSOK8eURr0QV+e6nH7K66N2AWU
         RydfaadExKFRy5ZWRn1Jd9+Aa1jidc5RhKCODJt512er6avpJg+GV3HPj/9jMuWTrfG4
         6Vqw==
X-Forwarded-Encrypted: i=1; AJvYcCUM/HtSgVHe89W7qcJg+NS+UuZ32+6xjx12x5CkBnH7xs5ZQS/3+9EeNn9ECoQ4GyOihT00oGz37zwRw3k/mkpjW+kLe3phdBgV/ZcT1yk=
X-Gm-Message-State: AOJu0Yz0EDZKNH82OrZJqy8Ws7C/4FROjO2y/f24FW5kZ4dg/DwMbgHC
	50QhyqJyci64A4FLpSL0mkhDsjb1aST6e64bV7wCZ0REFI0IMCSc62CWQmWErA==
X-Google-Smtp-Source: AGHT+IEQbRbOqCds/lpBopflOuZv0IISC88KF2F+p2wSu0sJEKG3gHaoJeYRUpgJgIz+ZCrKpIrPhw==
X-Received: by 2002:a50:9fa5:0:b0:568:1444:a828 with SMTP id c34-20020a509fa5000000b005681444a828mr3726915edf.37.1711353637983;
        Mon, 25 Mar 2024 01:00:37 -0700 (PDT)
Message-ID: <9a9464de-f288-4f98-a194-22def7f2c4be@suse.com>
Date: Mon, 25 Mar 2024 09:00:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 00/11] address some violations of MISRA C Rule 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <cover.1711118582.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.03.2024 17:01, Nicola Vetrini wrote:
> Hi all,
> 
> this series aims to refactor some macros that cause violations of MISRA C Rule
> 20.7 ("Expressions resulting from the expansion of macro parameters shall be
> enclosed in parentheses"). All the macros touched by these patches are in some
> way involved in violations, and the strategy adopted to bring them into
> compliance is to add parentheses around macro arguments where needed.
> 
> Given that the community has previously requested a deviation from the rule, as
> stated in docs/misra/deviations.rst, and reported below for convenience [1],
> some macro parameters do not need any adjusting (e.g., when used as lhs to
> an assignment in statement expressions).
> 
> Patch 1 is taken, with adjustments, from [2]. Patches 2 and 3 are taken from [3]
> without any modifications. All other patches are new in this series and are
> pairwise indipendent.
> 
> [1] - Code violating Rule 20.7 is safe when macro parameters are used:
>        (1) as function arguments;
>        (2) as macro arguments;
>        (3) as array indices;
>        (4) as lhs in assignments.
> 
> [2] https://lore.kernel.org/xen-devel/b93a64b93ef4210f5fe96368c2522e5e71e9c87c.1709896401.git.nicola.vetrini@bugseng.com/
> [3] https://lore.kernel.org/xen-devel/cover.1710762555.git.nicola.vetrini@bugseng.com/
> 
> Nicola Vetrini (11):
>   xen/list: address violations of MISRA C Rule 20.7
>   xen/xsm: add parentheses to comply with MISRA C Rule 20.7
>   xen/efi: efibind: address violations of MISRA C Rule 20.7
>   xentrace: address violation of MISRA C Rule 20.7
>   xen: address MISRA C Rule 20.7 violation in generated hypercall
>   xen/efi: address violations of MISRA C Rule 20.7
>   xen/page_alloc: address violations of MISRA C Rule 20.7
>   x86/altcall: address violations of MISRA C Rule 20.7
>   x86/msi: address violation of MISRA C Rule 20.7 and coding style
>   x86/hvm: address violations of Rule 20.7
>   x86/public: hvm: address violations of MISRA C Rule 20.7

Just to clarify: While most of the patches here are new, two(?) I think
were submitted before. As such, to indicate that, the series as a whole
would want to be tagged v2.

Jan

