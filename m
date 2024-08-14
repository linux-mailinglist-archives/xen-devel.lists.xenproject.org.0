Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6AC951692
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 10:29:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776826.1186999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9N1-0001O1-8V; Wed, 14 Aug 2024 08:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776826.1186999; Wed, 14 Aug 2024 08:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9N1-0001Ly-43; Wed, 14 Aug 2024 08:28:39 +0000
Received: by outflank-mailman (input) for mailman id 776826;
 Wed, 14 Aug 2024 08:28:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhoJ=PN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1se9N0-0001LZ-2E
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 08:28:38 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3384169a-5a17-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 10:28:36 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5af326eddb2so1042612a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 01:28:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bd1968af77sm3591110a12.40.2024.08.14.01.28.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 01:28:35 -0700 (PDT)
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
X-Inumbo-ID: 3384169a-5a17-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723624116; x=1724228916; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6Nu4pPZi5zBW3bAq5eXnFW4GeiCLLJkowiSjAPbXk0A=;
        b=LMuN1ofZSaGI3Qx+e2hw8ywfqqOhuEJb+BMPkG47mFDX1Bl5rXXsNx46FCRZ/CZgbY
         U+Lx+CnCFXDH5OumfI1uHY7gbWiDDiv0aZPuE7FB2RRMoNDYfyBhFbwLJrEQukv3/4dr
         QrVp0PLTDE8/t1bM6nLQrZqa0+VOas93AjZR1shg8hsYU5fSgozY9JzHxHK/62mQoGOV
         xvJpcUn3ZuLMvUmsUcOHTEwYrFtoKOWx7IOSFOgPcmm1D1eG6KWxgpAFMs295QHXOgj6
         BOFlH/aEiydoSccP3eryLXJwSbP94CgN7vwiyLsVwxEv3bC0taT0gRAK6M705lxjHBvd
         2yKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723624116; x=1724228916;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Nu4pPZi5zBW3bAq5eXnFW4GeiCLLJkowiSjAPbXk0A=;
        b=r3Y/rqwHu4Sxoy6lX7LealSH/K9U+1LFORQyMRqMdX+B3njNJqPkLYus3GCaSGKg2H
         5eAH8FZgsuB2uRKzIzqVR0Vka1YFDQhlm8DV8T82GOjGr3Zm3Xhpo5vuoB1SKOSZ5wrb
         ANS719XCkD7otbGEhxDJ3VFQTZ/TBTiLB+4gY4TI/m2x5tuVz3BcN9hAKDpOkSMyjoCA
         wv2a8KpGl5hh9bLX6E3/d/Ug4k1zbt/J8dkbMzWt+hPnt/Iud6tZpmlfFp4a9gQQPwfL
         AFWIVg8MOuPSYcUE2S+v7ZHr8zOjIAvmPguzMc0rFy2xXZLid5RzipXblqJKC11dGJ3k
         4AmA==
X-Gm-Message-State: AOJu0YxO/M8jisZMScfS5PuJ8hIZwlt1d5L6gZpGlm/0ejt8g9CKOZa9
	TkBeGKjrExGllxw9WuSR/5e7VMCENyNwnuCywUFrscTSJwC2fPw/a8uhfJMgWfkozQqiFarE7cE
	=
X-Google-Smtp-Source: AGHT+IFMiNfmATHueVOy0wRe/gQPpD2yaHzdlrEzRRIs6B2fvPRGiRKwTikAKXEvEZEPVCOrRdD6Ow==
X-Received: by 2002:a05:6402:2742:b0:5a1:5c0c:cbd6 with SMTP id 4fb4d7f45d1cf-5bea5e53c6cmr1216959a12.8.1723624116048;
        Wed, 14 Aug 2024 01:28:36 -0700 (PDT)
Message-ID: <2500a119-1734-44c2-9868-640bcc8ead2d@suse.com>
Date: Wed, 14 Aug 2024 10:28:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5 0/3] x86/CPUID: leaf pruning
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

These three related patches were previously part of the AMX series.
For AVX10 some of this is going to be needed (or at least wanted) too,
though, hence I'm now refreshing these separately. Neither of the
three is strictly a functional prereq, but two of the three introduce
new functions which then are further altered while adding AVX10 (and
AMX) logic. Presumably none of these would be necessary anymore once
toolstack side work planned by Andrew gets carried out.

All taken together: Until it is clear that one or more of these are
strictly not needed / wanted (in this or another form), having these
ahead of the actual work seems preferable over accidentally losing
adjustments done for AVX10 / AMX (and down the road perhaps others).

1: adjust extended leaves out of range clearing
2: shrink max_{,sub}leaf fields according to actual leaf contents
3: move bounding of max_{,sub}leaf fields to library code

Jan

