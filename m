Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AA78242A8
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 14:25:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661795.1031515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLNiH-0000VT-Nm; Thu, 04 Jan 2024 13:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661795.1031515; Thu, 04 Jan 2024 13:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLNiH-0000Td-J9; Thu, 04 Jan 2024 13:24:45 +0000
Received: by outflank-mailman (input) for mailman id 661795;
 Thu, 04 Jan 2024 13:24:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0by4=IO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rLNiG-0000TX-Mu
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 13:24:44 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e98994c-ab04-11ee-9b0f-b553b5be7939;
 Thu, 04 Jan 2024 14:24:42 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2cce70ad1a3so6066871fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 05:24:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bo18-20020a056638439200b0046993034c91sm7838595jab.77.2024.01.04.05.24.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 05:24:41 -0800 (PST)
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
X-Inumbo-ID: 9e98994c-ab04-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704374682; x=1704979482; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l/Y/pHB1cOv89Zwm8ZKzvm42bYzUtc5kUIKjcJZbFdY=;
        b=By5shpZcS5qgiSQ78oMF2l3LC9TI0EOvYgJumy290vE69+KOPu8oSd9CQ/2JrCKdQK
         SNr8ET1BYoQ8sbiPnZpDLMB6iY8+TklYYcHoAGFzmO7B8Ig9nM7LuxsLpjHzYw7FOi/a
         NXlINFQV95jTgVLIk4ACVenGfsfaVInem9gls//9oAH+26hkWyPt87NvAka4oihyBRk5
         wfFX+/jM8GzaqYUV70us7bohkNNqdwYtYyvJJ/O0aQuerjadupU3ce62JWq8cFwA3d/4
         i72MLC/zpVCgx6QqKz5/HsQkLYYhivGdw7suEKWoKUhEDGgCYfiKVAl+QS2EptsHBNaA
         pjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704374682; x=1704979482;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l/Y/pHB1cOv89Zwm8ZKzvm42bYzUtc5kUIKjcJZbFdY=;
        b=gNjhnK4qGCQnG9SRPLJIiH7KdPkET6tbQ0HKssZjBd+VWrdaIjCQgHvBf46lBGWWsT
         G+pYlv5vDyXIUnIPRgVOMFblMZxIO1XXxx5aukzk4Jy2T/ToAvXjgr8/8269YOhg7PGt
         p09wkDt4Wsai1YU/lbG4jlmyRydr+kymNAtX/3l+eVYMGdfpyy93d7ORcACzbd+McxnA
         1ruxG3pdRj0WojnsdEzLAknZivVlj+d1e4nktxnO2s6LPe0NjTitY+LkcDYN+XOIsExR
         HC5Cy/8FRF93ObXibbU5hw6YSl9AAvCuxD6F2Ha8gF4lTWQWOtn44nX+H5RF9QvaK746
         N9Tw==
X-Gm-Message-State: AOJu0Yy1qPjEcd5X+/pUN+Lf6vx+FIpi9VnaeOWPI4sANYtJSNJ3a4kC
	df9avJ1mkp6v5cvcknM/ny3XOIwezezq
X-Google-Smtp-Source: AGHT+IEAnTbf13WwzQuShuJT0+HyMwTqhV1U5Clf6pe2mYMMZTLx2HFz/OuCWM84hi93QqX1j2RvTw==
X-Received: by 2002:a2e:b170:0:b0:2cc:811f:f9ae with SMTP id a16-20020a2eb170000000b002cc811ff9aemr318969ljm.47.1704374682079;
        Thu, 04 Jan 2024 05:24:42 -0800 (PST)
Message-ID: <07c7d954-c0f8-447c-9205-646ca2a1de1d@suse.com>
Date: Thu, 4 Jan 2024 14:24:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/livepatch: Make check_for_livepatch_work() faster in
 the common case
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20231222220045.2840714-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20231222220045.2840714-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2023 23:00, Andrew Cooper wrote:
> When livepatching is enabled, this function is used all the time.  Really do
> check the fastpath first, and annotate it likely() as this is the right answer
> 100% of the time (to many significant figures).
> 
> This cuts out 3 pointer dereferences in the "nothing to do path", and it seems
> the optimiser has an easier time too.  Bloat-o-meter reports:
> 
>   add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-57 (-57)
>   Function                                     old     new   delta
>   check_for_livepatch_work.cold               1201    1183     -18
>   check_for_livepatch_work                    1021     982     -39
> 
> which isn't too shabby for no logical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> I'm still a little disappointed with the code generation.  GCC still chooses
> to set up the full stack frame (6 regs, +3 more slots) intermixed with the
> per-cpu calculations.
> 
> In isolation, GCC can check the boolean without creating a stack frame:
> 
>   <work_to_to>:
>     48 89 e2                mov    %rsp,%rdx
>     48 8d 05 de e1 37 00    lea    0x37e1de(%rip),%rax        # ffff82d0405b6068 <per_cpu__work_to_do>
>     48 81 ca ff 7f 00 00    or     $0x7fff,%rdx
>     8b 4a c1                mov    -0x3f(%rdx),%ecx
>     48 8d 15 45 aa 39 00    lea    0x39aa45(%rip),%rdx        # ffff82d0405d28e0 <__per_cpu_offset>
>     48 8b 14 ca             mov    (%rdx,%rcx,8),%rdx
>     0f b6 04 02             movzbl (%rdx,%rax,1),%eax
>     c3                      retq
> 
> but I can't find a way to convince GCC that it would be worth not setting up a
> stack frame in in the common case, and having a few extra mov reg/reg's later
> in the uncommon case.
> 
> I haven't tried manually splitting the function into a check() and a do()
> function.  Views on whether that might be acceptable?  At a guess, do() would
> need to be a static noinline to avoid it turning back into what it currently
> is.

Or maybe move the fast-path check into an inline function, which calls the
(renamed) out-of-line one only when the fast-path check passes? Downside
would be that the per-CPU work_to_do variable then couldn't be static anymore.

Jan

