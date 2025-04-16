Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6857BA904F9
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 15:53:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956189.1349683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u53Ct-0007XZ-BM; Wed, 16 Apr 2025 13:53:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956189.1349683; Wed, 16 Apr 2025 13:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u53Ct-0007Ur-8S; Wed, 16 Apr 2025 13:53:39 +0000
Received: by outflank-mailman (input) for mailman id 956189;
 Wed, 16 Apr 2025 13:53:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u53Cr-0006w9-K5
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 13:53:37 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31ab6fc0-1aca-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 15:53:36 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso56733175e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 06:53:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b4f3bbbsm21756025e9.23.2025.04.16.06.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 06:53:36 -0700 (PDT)
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
X-Inumbo-ID: 31ab6fc0-1aca-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744811616; x=1745416416; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gZ6J9rpP6h10ozm+glciDHFSwaYn6AwPwAL+U9KFwwM=;
        b=HIKn5VTPN4/7vAJ4o5C3Kydq19x6LKRx8RHKi8USvJwZ0hShKcBKM3k7hC4yHrVGrb
         oeyzyQFg7nXbYQYsCoC6rIUbPZNzx9eUF83ApVIi/9dQrQYQOVf+fSt87v1xm9JXMxR7
         oGVV1oPZN7XlVtlhAH8KhhyncS44Bl6TF0WaYFBr5iJ4NDS3RQ3wA7Ban3SC8ReL6pX0
         zKRLHgzBp/9K2OKL9SNzTqzZMswRMgwLMo2hkipDCQXWZO0e2vhzchjuHxbx5XLkQXB+
         CRAd+LwQyDMGCvsmXJvPufSJnTTo+7yKWw3Q8Z5FzAk53QchQ1ygfPfkzOTPt/6STjzW
         bzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744811616; x=1745416416;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZ6J9rpP6h10ozm+glciDHFSwaYn6AwPwAL+U9KFwwM=;
        b=O8lav6TRe/ZG3e+avVcDjvsiQkJHsEEFq2g8tYCfr9YMFF7sUE4JnfRMYxPwVapdOq
         vFDX+X2WE+qwA1tjiBCrG+DVDlQ5eQoIf4ilHYEvSqinGzT+8bMza5AWi3EAUa+Lj+0P
         W38KstsXoFeg8TBaBWiMJM/32hHw+eBDZt56eokPbKmyxBUdhAksAn3tPCgWG/TV3kUF
         /jnR4P+1ss0wYAL7+AS+Li3e/fS2JMCLgfolowOIfeEpado8H7lAcJ4rfq/KqoLHd3HL
         JhNk1lqrEtvstH5J4pvwcNCeI51peIm9cYmwk9bUbNU9wiEAGbGal/HQsuGQ2PNY2QED
         NiLg==
X-Gm-Message-State: AOJu0YyYiQ2T55yDVLdFpycexAWhiWJyri/7Xn8f3J5HklJ96Jqq8LFp
	LUQWiD6FWgRj6u45sr3ypQ0ykmR/3nFcyClZQaXUxncBejtOwdbvMdJ5/y5zQ4ZbflDgzyAVsMQ
	=
X-Gm-Gg: ASbGnctzNlDWzlQ9DuKEAnIFIsNTu9IHnmHE/+juezte1vSBqFdrs7PBRBQWSskxdEW
	syVX2naGftXr8J5OhbzPspBR+cZ8cOVPoi6UE9NsNTJJXNPDPxAsUIcZENUFc45+GF9Famk6Aag
	katoSuOGY6oIiFSOhtj8/G05CUB/F6ZT1BzULddXI3Fw16cySVacq7utWydSKD/2aYqyyWfPg5k
	K1yROhx42o2oZuHaMIsFAy6yjwcT1sBYO5GHnqTjaRyuR0rpLn90u/0Z2eQNd2nZBWh9WyM038R
	5wRk4YhYQXT2xav32Q0l5CSZbhGhI78d/stRUsIO2SlcX/mPCoSG7mGR5+vHvmiM14HmROdQ+eu
	SrHfXYjwooxM24VhmTjrZrUFVLNBMOYMeC5c0
X-Google-Smtp-Source: AGHT+IHXemsl68FAItCqDZCjt6YnuHe6UvCijCoDEc+DcV7qbj4hd5uGLecKsrhLFP6yrypp5WKStQ==
X-Received: by 2002:a05:600c:cc5:b0:43c:ec0a:ddfd with SMTP id 5b1f17b1804b1-4405d5fd8damr17323965e9.6.1744811616270;
        Wed, 16 Apr 2025 06:53:36 -0700 (PDT)
Message-ID: <ada5deaf-6af8-4427-8ba9-d07000628e7b@suse.com>
Date: Wed, 16 Apr 2025 15:53:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Assert in x86_emulate_wrapper triggerable by HVM domain
From: Jan Beulich <jbeulich@suse.com>
To: Manuel Andreas <manuel.andreas@tum.de>
Cc: xen-devel@lists.xenproject.org
References: <e7347061-6dc6-44a3-ad41-270e705db2c5@tum.de>
 <26f9b5dd-2201-4dd7-bf26-863a9b114b62@suse.com>
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
In-Reply-To: <26f9b5dd-2201-4dd7-bf26-863a9b114b62@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.04.2025 15:52, Jan Beulich wrote:
> On 15.04.2025 23:52, Manuel Andreas wrote:
>> my fuzzing infrastructure discovered that an assert in 
>> x86_emulate_wrapper is able to be triggered by an HVM domain executing a 
>> specially crafted repeating movs instruction.
>>
>> Specifically, if the emulation of the rep movs instruction triggers an 
>> exception (e.g. by accessing invalid memory after some amount of 
>> iterations), the emulation will be halted at that point.
>> However, the instruction manual requires that _some_ register state 
>> (namely the updated value of rcx) shall be commited, whereas the 
>> instruction pointer needs to be rolled back to point to the address of 
>> the instruction itself. The assert checks for the latter. Problematic is 
>> the fact that for these type of repeating instructions, Xen seems to 
>> eventually just commit all register state when it encounters an exception:
> 
> If my analysis is correct, none of this matters here; the core emulator
> is working correctly. Hence also why the in-tree fuzzer wouldn't have
> caught it. Would you please give the patch a try that I just sent, with
> Cc to you (sorry, the list archive didn't pick it up yet, hence no link)?

https://lists.xen.org/archives/html/xen-devel/2025-04/msg01283.html


