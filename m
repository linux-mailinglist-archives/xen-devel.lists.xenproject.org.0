Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D92DA56354
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 10:13:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904772.1312606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqTm2-0008Ep-8k; Fri, 07 Mar 2025 09:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904772.1312606; Fri, 07 Mar 2025 09:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqTm2-0008Cc-66; Fri, 07 Mar 2025 09:13:42 +0000
Received: by outflank-mailman (input) for mailman id 904772;
 Fri, 07 Mar 2025 09:13:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqTm0-0008CG-1p
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 09:13:40 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74d2eba5-fb34-11ef-9ab5-95dc52dad729;
 Fri, 07 Mar 2025 10:13:39 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43bc63876f1so13587645e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Mar 2025 01:13:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd435c6ffsm74559375e9.33.2025.03.07.01.13.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 01:13:38 -0800 (PST)
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
X-Inumbo-ID: 74d2eba5-fb34-11ef-9ab5-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741338818; x=1741943618; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Cyl9hUZgtMTThSqrYpMZScOq562GDDGL0ex6bxdyrfA=;
        b=QaxOsY2edx+KIWJ4amHtTMk8z8qiXUhJX6e0gBGi5NcwnfpSeDCiBMDVjq8Nekp1Ex
         hX1IZYExYspm1lH7YLta3fI/L6H3ntxLud8559ASW6fXD0s0FPBU7UN0QwUHe7MFb4c5
         wyzAu/Z4/t3XlELND6m7zEskZ2JGHyciN8QxSJ7uI75LtX/hXxSEZoXIey7UabLARUHb
         YG05gDKekex9d9qXtEEz96+B/+S7kTDxB07SCfcnbgERbH+jXoqequD87/873KUDOmDb
         4a7s+Gux0/gaDu04DrUCk2bU4kzAMjBRdkFKVYev1AUyG7HjL7P0SrGOwDPWFq1JbX4O
         lzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741338818; x=1741943618;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cyl9hUZgtMTThSqrYpMZScOq562GDDGL0ex6bxdyrfA=;
        b=E5LtSreOeEHbiXogRJWS6a+vARqBVGqLfRs4aMq3BfOJD9C47QwRIldbdYUsd996ua
         cz48Pjjb6RsB9WonM/HMlVuoRuVOb341pKnTonseMDp/i/BxceigjiyDDHHqa1hhRcF8
         F6oq2nOO9uwsGi7bHgdIqShKtn9u4843X3j0felB75wvKqX4iMGgfusWZexgtA2YtLah
         nk6q3UB9nUKJiluS5dnawDaeyN198MlPKKQFrZvBGI7enLlMo0E6CQD2yogVGGfuSqyl
         xvB9PZBydiauiHHxRrc28+xY8U8Q3Uvgmz/NrD9mcJoH/aoS70ak716YVRIUxLQJ/1HS
         kHSw==
X-Forwarded-Encrypted: i=1; AJvYcCXXfrQTjLLRppcq8+og946PVWFjuaDrH4lLRY08uN7HprxM5f38Cm+Pc6bCh+avlyL0K0hMLeu+f/E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOm46meNHZly3jzQiabAaAHsliI5+FP0KzSzF/+z+fY3jipzK2
	/PSMSguP2l8LATKZPGHwah04azBQqL7f0vpGDqyjnUjajm+bu677fZHnlvgTIA==
X-Gm-Gg: ASbGncudjmYGOPeHKvqAaB+ZFKQYmJ1eVK92L2ukaHVh0yWvHk+vhlfTlgGwZD51EKF
	G7LOGtGOVUIISAhT/CWXtGe+B8n3WWa5uBvRcL3OlwXGGq8loeXlCYFzmptZKYoTg15uLakNgtD
	/fCrCMjTdYKf5TnobRJeGHWi4Zvu66pxiGC6IBNe5n8X16ZvlWZ9wzqWRuiq4dxgxu+qR/O7Kdw
	V/Fw7xdyd1MUluC5Wf6Ze5ZnViyJTEDgZIIu/1d3w7lo8zgRsdKe1JSNLbI0qtEW0jfRvhyMHz/
	3s68YaaLKTt/SC+t2f5Yv+mJFgS47P8eoS+SQmnLHtIzgaaixJsG8JgKqqvGvELKIXGPzrPsnck
	Zt3lN5OluMooe1lcdE2AoIpTvGBwj6g==
X-Google-Smtp-Source: AGHT+IH5JfPLmzm6C79jD6Q1GDomSrY809xBbIONYCtMy6x8qUuxCduNUFjHq3ZtU1YIc2cmkjDEdw==
X-Received: by 2002:a05:600c:4750:b0:439:60ef:ce94 with SMTP id 5b1f17b1804b1-43c621ccff7mr14863225e9.21.1741338818458;
        Fri, 07 Mar 2025 01:13:38 -0800 (PST)
Message-ID: <09e07468-8558-477a-9e1d-1247620faea0@suse.com>
Date: Fri, 7 Mar 2025 10:13:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] x86/IDT: Make idt_tables[] be per_cpu(idt)
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250305000247.2772029-1-andrew.cooper3@citrix.com>
 <20250305000247.2772029-3-andrew.cooper3@citrix.com>
 <636170c8-2b61-4918-8c17-5c4953aa25ca@suse.com>
 <1cf7e95c-eea5-4a93-81ea-7505ee158b4f@citrix.com>
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
In-Reply-To: <1cf7e95c-eea5-4a93-81ea-7505ee158b4f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.03.2025 02:09, Andrew Cooper wrote:
> On 05/03/2025 2:01 pm, Jan Beulich wrote:
>> On 05.03.2025 01:02, Andrew Cooper wrote:
>>> This can be a plain per_cpu() variable, and __read_mostly seeing as it's
>>> allocated once and never touched again.
>> cpu_smpboot_free() certainly touches (really: modifies) it again.
> 
> Not really.  That's a dead path because we always park CPUs.

On Intel hardware; not (yet) on AMD / Hygon iirc.

Jan

> But fine, I'll rephrase to "not touched again during it's lifetime".
> 
> ~Andrew


