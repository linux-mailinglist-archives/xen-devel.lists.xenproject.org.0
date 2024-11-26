Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F45C9D9501
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 10:59:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843487.1259100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFsLW-0002om-IA; Tue, 26 Nov 2024 09:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843487.1259100; Tue, 26 Nov 2024 09:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFsLW-0002mB-Eu; Tue, 26 Nov 2024 09:59:02 +0000
Received: by outflank-mailman (input) for mailman id 843487;
 Tue, 26 Nov 2024 09:59:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zjIj=SV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFsLV-0002m5-3N
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 09:59:01 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0dbc7bc4-abdd-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 10:58:58 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5cf6f804233so6285621a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 01:58:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d01d3c0e2bsm4959421a12.52.2024.11.26.01.58.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 01:58:57 -0800 (PST)
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
X-Inumbo-ID: 0dbc7bc4-abdd-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmYiLCJoZWxvIjoibWFpbC1lZDEteDUyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjBkYmM3YmM0LWFiZGQtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjE1MTM4LjAxMzY1NCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732615137; x=1733219937; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HrIBwtm1zvbGr15cT0+vVk2sAOQSQvRvsuHiR6e54M0=;
        b=fZKDaTo8M43AUJyz4/9ilNVnTQ38xR2gAnoZs8mQVP5g33tDsRWHbDaLOax24ppi3k
         f+pxopqDzTxu1og8pjXuNJkh6cQuCkJKs8qg1AEpeaurMAQDupcqaK7OCy7at3mfIlWy
         /u4q+jej612GgN+isPIoEvJi9Hm3zAeU99WdDEDU47AGDXRK3t+pP6/foq0DP7JIUYED
         AFf1PpFzeq0kfzgexjXVe3Vp1jkcC94c9zNdgaPL9tOxxZqzHeoZX1ys1vkbuiN5rrHu
         9E7DnfM4aui0f8l6JPzWIDiDrqH/XP46D73B5nbYwWnB/cG1WAkhkeYg2GOGvY3lbUQq
         Gd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732615137; x=1733219937;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrIBwtm1zvbGr15cT0+vVk2sAOQSQvRvsuHiR6e54M0=;
        b=ZZten+lFHPJ+e/BPjNpnL8H9AiGutY2d+cIociw77q7+HQFHwTzbku46P0ElwjhgZl
         jL1Q5eZ2l3ZUNCjRBw3qhLiDaCwhdQD/HX6bxi5P/Nh4UU14rWZICDNunzoltWEkKVoO
         a9rCHMTuJt19KD2vS0MsjE4WGNpLHJA405Pn+iCWl6tg89UfO1sh0vTH4irQ+RT19S13
         1U2ck6PcmvWgg9jRmlc0ozntAw53QxuuahsKy5C1HtzCn4TEyzS5Hp8XRsk2QHDYUCiN
         +rtNkgCOxM6xFStruaw9Xd2sFitB0e4GpV4md7W0qGcGE1M8PcssriFl8IcI7NJBQSkO
         4NIg==
X-Forwarded-Encrypted: i=1; AJvYcCV7TjiwjjTWOIBhk6AhJNzgL+bWKWcjp9feZm8VrmZiOlJ4DexWEUZjicd/gMcf4TtyFtlRR1ZI2h4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YznBZiH4DKUyeup/QNu2NsaZ+G9Lp+3yYtNnxAp7d1JMM1879bt
	V4RsHdsUulFf4wQUSLSBbb2BW5IkxYup/wpbmBdYBn6LWnefWdk0MidhbXNVcQ==
X-Gm-Gg: ASbGncupZyvLyrQBey0TH2cNqRPpsTSFeAlBbmIvYqbsm50poNT3Nm0Q2rQJp74zWfL
	6uQ2Hi3GiAw3P9QwhFBap0I3JeHPeGOw4Tlcsxv/wzyh7v4d6QFUMf8U/Dj/HAbGsLEH4T0iLtI
	JIxyKMesP/aVKnsTBJWS8CEvet++Rl0JKIlSG7/wTVCe2JN7l+ZLTvvHPAMOQqX9uE69CreN+Jw
	xfFh27uCIDLEASWcS50X2lXE1AtOtKpZuEK2KI57m35dW0NGSD3Fomp/xfhliCMaTlvv82wY/RZ
	qeBLX/tAnq8zQgCb4qCOtMCikzlOw6ZJ4eg=
X-Google-Smtp-Source: AGHT+IFmQnlJimCLT/w440j1RlkGdMbjhGxXUw3jZKEvFpBoMFkVInzJXiu2SC+vO4E+ejXfW6vbGA==
X-Received: by 2002:a05:6402:3509:b0:5cf:1b53:1bf4 with SMTP id 4fb4d7f45d1cf-5d020626645mr12468556a12.17.1732615137470;
        Tue, 26 Nov 2024 01:58:57 -0800 (PST)
Message-ID: <cf1f87d1-f616-4944-94fa-69a777249072@suse.com>
Date: Tue, 26 Nov 2024 10:58:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/uaccess: rework user access speculative harden
 guards
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 "consulting@bugseng.com" <consulting@bugseng.com>
References: <20241126093508.6966-1-roger.pau@citrix.com>
 <20241126093508.6966-2-roger.pau@citrix.com>
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
In-Reply-To: <20241126093508.6966-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2024 10:35, Roger Pau Monne wrote:
> The current guards to select whether user accesses should be speculative
> hardened violate Misra rule 20.7, as the UA_KEEP() macro doesn't (and can't)
> parenthesize the 'args' argument.

For my own education: This definitely isn't the only place where we use a
macro with variable arguments, and where the use of the respective macro
parameter can't be parenthesized. Given patch 2, why is e.g.

#define emulate_fpu_insn_stub(bytes...)                                 \
do {                                                                    \
    unsigned int nr_ = sizeof((uint8_t[]){ bytes });                    \
    memcpy(get_stub(stub), ((uint8_t[]){ bytes, 0xc3 }), nr_ + 1);      \
    invoke_stub("", "", "=m" (dummy) : "i" (0));                        \
    put_stub(stub);                                                     \
} while (0)

not an issue? The first use of "bytes" is in figure braces, so probably
fine. Yet the second use is followed by a comma, so unlikely to be okay.

Somewhat similarly for

#define AMD_OSVW_ERRATUM(osvw_id, ...)  osvw_id, __VA_ARGS__, 0

where we're using the C99 form rather than the GNU extension, and where
hence __VA_ARGS__ would - by extrapolation of the Misra rule - need
parenthesizing, when it isn't and can't be.

Isn't it rather the case that variable argument macros need a more general
deviation, if not an adjustment to the Misra rule? Extending the Cc list
some ...

Jan

