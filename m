Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAAB88FCF2
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 11:25:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698867.1091057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpmwY-0005qm-Fg; Thu, 28 Mar 2024 10:25:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698867.1091057; Thu, 28 Mar 2024 10:25:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpmwY-0005nn-CD; Thu, 28 Mar 2024 10:25:10 +0000
Received: by outflank-mailman (input) for mailman id 698867;
 Thu, 28 Mar 2024 10:25:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JFXD=LC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rpmwX-0005ng-5R
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 10:25:09 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e54ae1a-eced-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 11:24:59 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a46f0da1b4fso94771866b.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 03:25:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z11-20020a170906240b00b00a46be5169f1sm579808eja.181.2024.03.28.03.25.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Mar 2024 03:25:05 -0700 (PDT)
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
X-Inumbo-ID: 6e54ae1a-eced-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711621506; x=1712226306; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=keu/BgzfN40koPXV0xhL2rcwYWv0vTaeY1B/CUGsKq0=;
        b=cNbu764rBl3eLKMUCc78Ju6LWdpmPyuEaTYM6SveohpC7vk9BQJji0tfY0toUQxf8W
         IILbg/meAanZWUfFXIh3hGdbxsxVQ/72ZmZ1lsRTueemGIEBywnwuFhDbs4SG1s37LEQ
         KO5wiZiUNMK7U9+ZH5m4lOxGO/DBEdtvAGaKOZDtj5/M/rknCBiUSiKp2xJb3xoFd+sA
         DeKTBgvmqbjNUu8MFaRdMy6kl+TJHm6jBsL5JFxGaKpyQ2bMaqyA14zYqL92Hd6IXZoM
         uuItQTBVccGRJ/8GVu3G+Ff/CaOML6dwXgUvfRqKKUnjQDoznXh30OBWSfbKQTR629a8
         yKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711621506; x=1712226306;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=keu/BgzfN40koPXV0xhL2rcwYWv0vTaeY1B/CUGsKq0=;
        b=YVrnCaX9FjloFMIXRnsCr3UFicoCOdBhriCA7CflxRbJK1cgomcdHWcuRJLeOe+T/b
         6Zv/wnI6XBjkanNlcj3rj+LLQw+RRQXfqDPIvrHdwvgH8OhUShrKgH3KEjW6UEhNtISU
         6TYH9PMLRP7ob5YYFsWVg8DX7ntff+gMK+yVjXW9QkJmdSdJUe5mOgy2C9P9Pq+DVQv8
         K+eMAwmi3KCm+rmGCNyZlzLSUVyPCTdOu10eZsnJR0kH5+smRgDWEQxSZN0NdioQc3t7
         MYTyivNeV1AdHIc9NVTECE23kQaPxvlw0Ngfqt5WWV0ZW1KbTFKaJlKNesp9MkmTZgh7
         JCFA==
X-Gm-Message-State: AOJu0YyMM8msHmilC6Sd9AXxD9S5Db8Ze6JprYjR9iWYKXpxXppdFxHw
	lIl5d/gMAryCXF5xpUQFNSrfy/zTHuu7s0QBFpVhmYut3a1J0Z017tS6QfanC3LweXWC2KGGIM4
	=
X-Google-Smtp-Source: AGHT+IEcuSrquROV1yL7Xu7B63KfCf5l3e0wkSp7kizvf6Ja6hi7/wUkHuPbxQLT7tFaDmzZKYLjTg==
X-Received: by 2002:a17:906:692:b0:a46:a8ba:60b3 with SMTP id u18-20020a170906069200b00a46a8ba60b3mr1401008ejb.37.1711621505835;
        Thu, 28 Mar 2024 03:25:05 -0700 (PDT)
Message-ID: <f922e7af-9415-44dd-8c05-6eb093080ed6@suse.com>
Date: Thu, 28 Mar 2024 11:25:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: Re: Violations of mandatory MISRA C:2012 Rule 19.1 in X86_64 build
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: xen-devel@lists.xenproject.org
References: <fa2bc5da-b866-05ac-409f-c26e025428c3@bugseng.com>
Content-Language: en-US
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
In-Reply-To: <fa2bc5da-b866-05ac-409f-c26e025428c3@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2023 18:40, Roberto Bagnara wrote:
> Mandatory Rule 19.1 (An object shall not be assigned or copied to an
> overlapping object) is directly targeted at two undefined behaviors,
> one of which is the subject of 6.5.16.1p3, namely:
> 
>    If the value being stored in an object is read from another object
>    that overlaps in any way the storage of the first object, then the
>    overlap shall be exact and the two objects shall have qualified or
>    unqualified versions of a compatible type; otherwise, the behavior
>    is undefined.

I'd like to come back to this, for two reasons:

1) In the description of -fstrict-aliasing, gcc 13.2 doc says "Even with
-fstrict-aliasing, type-punning is allowed, provided the memory is accessed
through the union type." We even build with -fno-strict-aliasing, yet
misra/rules.rst has no mention at all of type punning being permitted.

2) With us using -fno-strict-aliasing, I wonder in how far e.g. commit
7225f13aef03 ("x86: avoid Misra Rule 19.1 violations") wasn't pointless, as
imo the "compatible types" part of the C spec clause then can be treated as
irrelevant.

To me both simply mean we're relying on another compiler extension that's
not exactly spelled out as such.

Opinions?

Jan

