Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 903BB9B7C93
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 15:18:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828734.1243731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Vzx-0003Yr-9f; Thu, 31 Oct 2024 14:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828734.1243731; Thu, 31 Oct 2024 14:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Vzx-0003Wi-6u; Thu, 31 Oct 2024 14:18:05 +0000
Received: by outflank-mailman (input) for mailman id 828734;
 Thu, 31 Oct 2024 14:18:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zW4/=R3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t6Vzw-0003Ub-26
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 14:18:04 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efb824ac-9792-11ef-a0c3-8be0dac302b0;
 Thu, 31 Oct 2024 15:18:01 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53a097aa3daso958244e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 07:18:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd9a9faesm57818665e9.35.2024.10.31.07.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 07:18:00 -0700 (PDT)
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
X-Inumbo-ID: efb824ac-9792-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmIiLCJoZWxvIjoibWFpbC1sZjEteDEyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImVmYjgyNGFjLTk3OTItMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzg0MjgxLjUyOTYxMywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730384281; x=1730989081; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7JvtvPfUj51h9Hw/gq3o2g1USb7SgwrVFE4xQiogMyc=;
        b=EBAGPX6qSevAz4wBgIycXISUa4tokLu44bAOvfwUDs3U1B74+VMV59OiVcSi6drbA+
         9BAOSjt+9JUC8nALZ70RyS9LveL92JnZk/JIVcLsyL03uRwO4293pNaqP8ryY/+AE/JA
         MfBHibbCQ6IfzhcLTn1x9OKkJEo8nKqCRt2lu3/iwR9QwXVVw4JZdBPlcDOO9MA4q5dw
         bWZWIiX9gG5OidVONUj2h38jA+9NFs/Vuca7sTdbB51qHakR5lfWjcFSY7uVw5047azW
         rebDLAqyFssTiSmdpoJUUz3lObJeGWH84Peasey6AWGTmNrWVgd0seMdcSEswg9a9aO4
         DItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730384281; x=1730989081;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JvtvPfUj51h9Hw/gq3o2g1USb7SgwrVFE4xQiogMyc=;
        b=Hcm2kM/6IbBS/TCE2zaECpScNyvaHxgyh06s7JtNODnVkFhb6ZZqph4cVJ2i9+sI6u
         UelaPZQJfwY9sMHM7GPRok8hT9HkKsH5Pa9qT8SzUJ3T6YgvEQn5WHU6jU+J9G0rA4X4
         8meQiQEc418wzyZGcZwVaCRu8CUqRci04pEnYQtXzzzrgF5BebZYCTldbRvzaaIxlc/Q
         1oypbhrIKM5Lzg+f/qYMNHiYo7TsaUWucuu9MhjMeuZy7KVBgYhXjVeOvk1lLFujwSVc
         q0krTD25IG1fhVN53ndOkXj80jLdfcJulQ9+fT3cgbXNE/sN3DIp5ZTisVeXfzqhouGP
         afYg==
X-Forwarded-Encrypted: i=1; AJvYcCXsJwS2ZKYSHf9UunrFezVKvmUEVV8olY3kqTJ3KXgMfghid2ITi437tuFf9lTyLv++VAKmhpT27hM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDj/QKaADyMu2i0Aurkagpl6faLfwOr73m8lOV/PcdAUz69LAI
	lqmhmEST7mJEnCauGmyicEA8PNJj3RPBpPiBEl67puAGz7tHRpghkmLo2fqeMA==
X-Google-Smtp-Source: AGHT+IG7BkcG8XeQoz0g+hHLj4vVu2eyFv/psc68qPnSIJCENmJxzN14q7X+ilJ25n4NpgOW8GowcA==
X-Received: by 2002:a05:6512:b83:b0:535:66ff:c681 with SMTP id 2adb3069b0e04-53d65e1ab82mr73488e87.48.1730384280945;
        Thu, 31 Oct 2024 07:18:00 -0700 (PDT)
Message-ID: <438b5872-58b2-45df-a949-7f606b22922a@suse.com>
Date: Thu, 31 Oct 2024 15:17:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/hvm: Use constants for x86 modes
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <0ffcb0031eaa095b5864735d2f9edbe1d374e009.1730380434.git.teddy.astie@vates.tech>
 <0f41efad-8eac-4b77-a974-e5a2798dbf8a@citrix.com>
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
In-Reply-To: <0f41efad-8eac-4b77-a974-e5a2798dbf8a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.10.2024 15:13, Andrew Cooper wrote:
> On 31/10/2024 1:27 pm, Teddy Astie wrote:
>> In many places of x86 HVM code, constants integer are used to indicate in what mode is
>> running the CPU (real, v86, 16-bits, 32-bits, 64-bits). However, these constants are
>> are written directly as integer which hides the actual meaning of these modes.
>>
>> This patch introduces X86_MODE_* macros and replace those occurences with it.
>>
>> Signed-off-by Teddy Astie <teddy.astie@vates.tech>
>> ---
>> I am not sure of other places that uses these integer constants.
> 
> I think you've got most of them.
> 
> The problem (and it's preexisting, not something with your change), is
> that these aren't actually modes.  They're all a combination of certain
> aspects of various modes settings.
> 
> https://sandpile.org/x86/mode.htm has a pretty complete breakdown of modes.
> 
> The problem is that here, we mostly want a shorthand for "code segment
> size", but including some aspects of how segmentation works.

Hence how about

#define X86_CODE_REAL  0
#define X86_CODE_VM86  1
#define X86_CODE_16BIT 2
#define X86_CODE_32BIT 4
#define X86_CODE_64BIT 8

?

