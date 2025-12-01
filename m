Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CACC96369
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 09:40:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175574.1500198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPzS8-0005uT-4M; Mon, 01 Dec 2025 08:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175574.1500198; Mon, 01 Dec 2025 08:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPzS8-0005s5-1m; Mon, 01 Dec 2025 08:40:12 +0000
Received: by outflank-mailman (input) for mailman id 1175574;
 Mon, 01 Dec 2025 08:40:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0dw1=6H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vPzS6-0005rz-8z
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 08:40:10 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 574ea253-ce91-11f0-9d19-b5c5bf9af7f9;
 Mon, 01 Dec 2025 09:40:08 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-42e2ba54a6fso414876f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Dec 2025 00:40:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1ca1a4bbsm24176321f8f.21.2025.12.01.00.40.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 00:40:07 -0800 (PST)
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
X-Inumbo-ID: 574ea253-ce91-11f0-9d19-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764578407; x=1765183207; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QCuVcawJcegDzU/oe5lo3A0KNiYJZ5XjXC5r/TZeQ5E=;
        b=Eu+eOajXokHmeG78LhkH5q2CqwMryR1w0xotJMXEP1jkpBSnkz5uIloPBAqRljCi7b
         6t8HVUffl4E+FpV3+puPXzkjFQYVdhOjLxpnSGFXvbkiiNXNYTiwHJJrMJ/nmdn0mdm8
         xsCrspHElzQL+d8OAIVJCdvJZdUI9ihs4KSf36u9Zw9fwojetpBrqdDmPmAhJuee+88N
         CRKwxtWzeWM6kXDkxP/LAFSAnjSgxVeoFSgd4XnyZ/Dj/X/B5B1W69OIk8m6kRvg5lgi
         9kTa73tsVw8ALhC8ThsjcZitloVKbsmVOdRMpPUhwNhmFNX9uQa8aaOMNAr0uRqXINEq
         BBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764578407; x=1765183207;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCuVcawJcegDzU/oe5lo3A0KNiYJZ5XjXC5r/TZeQ5E=;
        b=EQ4s6KTL5e5Jh8CJfU0d5qgIIA1P7jpODZmNpgjBJrP/zwlD8J2jFUAIL601eTtXvu
         wDg4Z/6J7xO5kVvmpV7+m6b4q9g6muj6cnRLtG+5QS1ajbSh6/tu0qDd45Me72CQvfZ/
         QzY+wZkZi7PAeVd59yxw0RYmOEPV0gNcaIKoicfWTEBtHor9CwTNSVFZ8gcB6d0klyoq
         Q702JfZW95GmnFw6LqaGCKmr6wzy8OE7/zuo8dqJh3NVrihYXe6TXLKgESz1htg96wpx
         /CLfbmNP51mBe/daV94LJB0POXtgbO5BhXwkZP5VIog6oxYL5Pzo/ET90LQuOLQyMoAX
         UyGA==
X-Forwarded-Encrypted: i=1; AJvYcCU7++FwISZnH2dZWm9sXwJx6F2stnGMAQSDM99RfXj5SBFzCE4G+KKOvmSZhtlBlPWgw0EJtZWos2Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhuuOyDk2WL2q814N5P2bymjC9h1mxlOM5MGj1QQNXXARJVMp/
	RaiIKbRI/gBUMD6GyHFbOuCVsADxJwDp0A7wGFWCOzz1/vuiCeftBu/TDzdZaHS9mw==
X-Gm-Gg: ASbGncvQQVU+PE9AAIUQppBnm2MgOQb7XuLFyymqNcohjOyMKOWeC3WPNepANuFTYYj
	IYjvhNLGr63GcHV3wq2b+usNXNqdRK6VFnytupdF43gG6Wn5Q/Srjf5ty/fHLYNfb/ObCrtdZi8
	fBKZOXpLmRKA0qGCIE5ufGMY+wpiPcvNHwsavR0iw/Vd9yfMIPSqT8Wvl12sxZxKGZ5d08tBDfF
	vbMOefrJIxRqa9qkcVhMdKOJmlG72dgIg0nJCNQLPYPKe0qk4hXGlUnvwO1XP+IYLR6tVwQK48T
	m9UqvNIIvj/ErRyKh+0BaM3TjaxMGZN0MuYabLVnhXpjcgFzEbZYbVyQrVxHSCbDw45ow9Bu4UV
	VB73m9rb1fdcEKuwpXDccnKdhMMxTwOJQjYH54HHq8MqhkRYnb3FDY3j60I8rgRdOKyjAgxgG2K
	kQzyOuCpmYis/FwdAZtjEr53xIX39ur+1Qg20uQndo7/OQpEWQJAWes/dn3Ne6jtABypHNBYDOZ
	rA=
X-Google-Smtp-Source: AGHT+IFr1ASkrPWsHWfA0uXawemXCvxvbdQzsCi+vXMnS1BtLRReLoMzSG7eMT8NBo+dh5NzeuV8LA==
X-Received: by 2002:a05:6000:228a:b0:42b:3e20:f1b3 with SMTP id ffacd0b85a97d-42cc1cd9b45mr41144022f8f.9.1764578407430;
        Mon, 01 Dec 2025 00:40:07 -0800 (PST)
Message-ID: <0173e0bd-130a-4966-b0f1-882f8dd78aa1@suse.com>
Date: Mon, 1 Dec 2025 09:40:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: move vcpu_kick() declaration to common header
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <b009997b5f3e7489fadb5f62f1623fc4d13bf271.1764344988.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <b009997b5f3e7489fadb5f62f1623fc4d13bf271.1764344988.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.11.2025 17:23, Oleksii Kurochko wrote:
> The vcpu_kick() declaration is duplicated across multiple
> architecture-specific event.h headers (ARM, x86, PPC).
> 
> Remove the redundant declarations and move vcpu_kick() into
> the common xen/include/xen/sched.h header.
> 
> Drop the definition of vcpu_kick() from ppc/include/asm/event.h,
> as it is already provided in ppc/stubs.c.
> 
> Add inclusion of xen/sched.h in the files where vcpu_kick() is
> used.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit preferably with at least ...

> --- a/xen/arch/x86/cpu/mcheck/vmce.c
> +++ b/xen/arch/x86/cpu/mcheck/vmce.c
> @@ -12,6 +12,7 @@
>  #include <xen/event.h>
>  #include <xen/kernel.h>
>  #include <xen/delay.h>
> +#include <xen/sched.h>
>  #include <xen/smp.h>
>  #include <xen/mm.h>
>  #include <asm/hvm/save.h>

... this change omitted. This file includes the private "mce.h", which in turn
includes xen/sched.h.

> --- a/xen/arch/x86/pv/traps.c
> +++ b/xen/arch/x86/pv/traps.c
> @@ -10,6 +10,7 @@
>  #include <xen/event.h>
>  #include <xen/hypercall.h>
>  #include <xen/lib.h>
> +#include <xen/sched.h>
>  #include <xen/softirq.h>

Somewhat similarly here, xen/event.h includes xen/sched.h. That's less obviously
guaranteed, though, so making the include explicit here is likely okay.

Jan

