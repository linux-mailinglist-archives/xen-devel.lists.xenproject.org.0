Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1063A7F725
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 09:57:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941546.1341022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u23ox-0003OT-Gk; Tue, 08 Apr 2025 07:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941546.1341022; Tue, 08 Apr 2025 07:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u23ox-0003LC-DV; Tue, 08 Apr 2025 07:56:35 +0000
Received: by outflank-mailman (input) for mailman id 941546;
 Tue, 08 Apr 2025 07:56:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u23ov-00030n-Kb
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 07:56:33 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc0de5c0-144e-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 09:56:31 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cfb6e9031so47576455e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 00:56:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c300968cfsm14334914f8f.16.2025.04.08.00.56.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 00:56:31 -0700 (PDT)
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
X-Inumbo-ID: fc0de5c0-144e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744098991; x=1744703791; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wH+DNb7xG/dYEb1AC7qIscZbABMw2gGqyyblCrsHwCs=;
        b=SysU3U88SsqEq+eGZlk7E4rNBU11laTdDqYipJRwjOdLhEXYmXIkan24y2DT70KcOJ
         LlJSS6pyvkscqCeqM67+LXKA6eglzsBlG/ukLIeRFLh/mR2XH54UkU+GK/GuZ9RqEF08
         rZ8EwI5ThfLRw9UTHv204PVtv2KKfUS0+WDD+sEUAoUqfzbKkEON/an1/bjKTQP5GptY
         C9P4VnJLcINhudf/p5SwqO+dWZA2AZhLkh53M19jT3Q3c2a6AbziJN4hkRXFN6Blqipt
         +BYOY01Du7KqSxTWczEM763wUXYBGCWk1LncGYpQRXgJbhQimqi0T+5wGBPQQ6sPw/wB
         32zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744098991; x=1744703791;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wH+DNb7xG/dYEb1AC7qIscZbABMw2gGqyyblCrsHwCs=;
        b=DAsRxswUgRCvAv41XPzP+enmIwdnaW1s++LNUisVomadn8sRLx4UssStrWHAdVdn0D
         sIVqVTA6RV0elDrN4PGHnlD+aHWkoBSvj7teNkvhQHLSfVBduwmm7Bpa86aD+v8LCrkz
         vik+Tcm0hTwL5x5q7YxgjlVpE2yXgQ4lTd5ySE54NBwDavLPd+Sb0o4B4SU0gpZKqBWC
         SqjZqsnp+c6+0n0UrAPf+g+9Hx37ipB4ffAPTGg4uI1yy/rjlek2X88O0ywfKRXtu9ph
         mjwd364wozcKcJRIzw4Lr4x+KTadk34AqmUAvrAAxMTWgaDhrm8iRwLaHRo6yRhpSecg
         jgbg==
X-Forwarded-Encrypted: i=1; AJvYcCWektlU86XLYfC8knV10OjLnahpU+AJBKln4vpP2RPXwY30m093kgUFxorIXgYwwBLvnFuGBSMvfTQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwldplXcPOvYX9Fusz4sZFa+bnAa9YIKDFnSbq3HfcFCrnICpdz
	96uMEMh+LDw4HtGNLa3HtOLjDWm2QvuKntna9tKh1ubj3rroBS80icmNPmmVhA==
X-Gm-Gg: ASbGncvZ3XbWQ8rssyFLGQ4RB+Td4uPWN2FCZrV3bnyPYa57/NQ5xyB69TVa+Xz+vEj
	petA/kOl5hDGllolzWmy+hjAXm1UtRRdK1EFL5eKsGk8gqT/YdjQfjrElO+rbu2CX4KAzUqoqDj
	WYAsnQo/rxck52olfbVPTTcfGxIWiQ6oT6uU6SqeUHVKLiF+WLAC4LfKlJdx8NRTIj5oad5ic1U
	bCatKcS8c8VYYcgwbEylv+Xlu/c41Chld2020obp+4eBLN7awkhgJZGqTRi4MsI0h0GtyuXe7FF
	o3pcyMg4Xkfs/7TePt+gpPQz0f6eVkUZLxm1JFh5Uz1gjZZkM9keEhuG7VqVf8HNlcQo2uU/lif
	DKsyMFD5atHtwSG/ipXzqq8RHknGIyA==
X-Google-Smtp-Source: AGHT+IH82w03gA2heZiLFVa9qchWrk3kH2ybNU03Fl5c4c9NBp6lCSbvGDFAXZqpnXU+6TPVt5Z8DA==
X-Received: by 2002:a05:600c:1e03:b0:43d:683:8cb2 with SMTP id 5b1f17b1804b1-43ecf8ceb2dmr142615685e9.14.1744098991318;
        Tue, 08 Apr 2025 00:56:31 -0700 (PDT)
Message-ID: <ddd716cd-88c9-4146-ae4d-405d66cf08ab@suse.com>
Date: Tue, 8 Apr 2025 09:56:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] xen: x86: irq: initialize irq desc in create_irq()
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250407164608.2558071-1-volodymyr_babchuk@epam.com>
 <20250407164608.2558071-2-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20250407164608.2558071-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.04.2025 18:46, Volodymyr Babchuk wrote:
> While building xen with GCC 14.2.1 with "-fcondition-coverage" option
> or with "-Og", the compiler produces a false positive warning:
> 
>   arch/x86/irq.c: In function ‘create_irq’:
>   arch/x86/irq.c:281:11: error: ‘desc’ may be used uninitialized [-Werror=maybe-uninitialized]
>     281 |     ret = init_one_irq_desc(desc);
>         |           ^~~~~~~~~~~~~~~~~~~~~~~
>   arch/x86/irq.c:269:22: note: ‘desc’ was declared here
>     269 |     struct irq_desc *desc;
>         |                      ^~~~
>   cc1: all warnings being treated as errors
>   make[2]: *** [Rules.mk:252: arch/x86/irq.o] Error 1
> 
> While we have signed/unsigned comparison both in "for" loop and in
> "if" statement, this still can't lead to use of uninitialized "desc",
> as either loop will be executed at least once, or the function will
> return early. So this is a clearly false positive warning due to a
> bug [1] in GCC.
> 
> Initialize "desc" with NULL to make GCC happy.
> 
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=119665
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Just one other remark here: Personally I dislike the use of multiple or otherwise
excessive patch subject prefixes. xen/x86/irq: or even x86/irq: would have been
better here, imo.

Jan

