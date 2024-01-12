Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C09182BEAB
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 11:33:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666743.1037599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOEqf-00014W-9K; Fri, 12 Jan 2024 10:33:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666743.1037599; Fri, 12 Jan 2024 10:33:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOEqf-00012s-6D; Fri, 12 Jan 2024 10:33:13 +0000
Received: by outflank-mailman (input) for mailman id 666743;
 Fri, 12 Jan 2024 10:33:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nnUc=IW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rOEqe-00012e-1P
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 10:33:12 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb020cf2-b135-11ee-9b0f-b553b5be7939;
 Fri, 12 Jan 2024 11:33:09 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2cd5b467209so57291741fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jan 2024 02:33:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p6-20020a056e0206c600b003607f777e2bsm855479ils.11.2024.01.12.02.33.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jan 2024 02:33:09 -0800 (PST)
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
X-Inumbo-ID: fb020cf2-b135-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705055589; x=1705660389; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ashpNaP+sl1EW6oRNvDkHVBwTLskjs740wSzWpmuUr0=;
        b=Jh/SE2WUt662JSjrStZ8DF/z2aO06JNekL1n91a/pWk+E6O3rqkr5TLYcDu3doHyoQ
         vlpNQhUdlPO1brOWirjsX7/AN+nxhqkf9GFESCebguLGqv54s4Amgi36yxRwnikS/oUs
         QneCKk2qBRZAV9UCEN9+zeXNFLXKgeqqPFCUxmEHUZeBhJJu5ZL5XsuQyalfEbBxx+Ka
         z8rnY0WtQqyy4BRX2HQ3NVqr82N22YYQfifZ4ASPyB2m3pM+/2Fnos1bhGnFDIfgtu9t
         6GvteJ9Bn7+NEwpqK+nO6coa183JN0W4yl62WCIsoUxpbsaSiiNCwvtGrGXwE7+60rEl
         xqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705055589; x=1705660389;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ashpNaP+sl1EW6oRNvDkHVBwTLskjs740wSzWpmuUr0=;
        b=CNuqSRX7Arp97GvdlB1g/XBOrLKrwJRGCMljcH1NS6GlEkNQxtg33esoY2FCN9Adac
         uFa8Ap/ev06ibwC5ug1xlwHX4FTRrxQ0mpLtOmbSrmnwQQQBc7tj7gek5prgwNllseHn
         iDTIGV/YZE49jQMSykhjk0nm4rxh1i1vJX/ZQGV0KAYde6BqKXgMPWD7UW6lRI5qqXJq
         dClBWXWYKOzEeynC2kkZ2CwbEhgG8O1zD9ntzjMOLcVQcwGvvOjOUSSoU6tGTzpuVxbj
         cshYnb20ywhHye5RjmkFoAKM0kvPxG46HNlE4o2Zkxz03HpX/cxms3MFVJLj18REuUPT
         twHw==
X-Gm-Message-State: AOJu0YwDh6f44o5G/+YPosZ11V1TJUQsIln/z+d1MuSNQD7PVJfZ0wif
	Kl32I/N7UKSu+YjnFq/3DP33DMH+Zy8Y
X-Google-Smtp-Source: AGHT+IEgP1xPoRvmccTCfuFvJ7KxnVGy0HBsuoXV+M8KfWNebW9cEGZZoIRpZ+VKfLpKLxIRnHUMMQ==
X-Received: by 2002:a2e:7c01:0:b0:2cc:63e4:884c with SMTP id x1-20020a2e7c01000000b002cc63e4884cmr568781ljc.50.1705055589413;
        Fri, 12 Jan 2024 02:33:09 -0800 (PST)
Message-ID: <36c8f8e9-3573-4e14-9357-aabf9b4d8f12@suse.com>
Date: Fri, 12 Jan 2024 11:33:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] x86/vmx: Fix IRQ handling for EXIT_REASON_INIT
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Reima ISHII <ishiir@g.ecc.u-tokyo.ac.jp>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Takahiro Shinagawa <shina@ecc.u-tokyo.ac.jp>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240111231323.4043461-1-andrew.cooper3@citrix.com>
 <20240111231323.4043461-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240111231323.4043461-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.01.2024 00:13, Andrew Cooper wrote:
> When receiving an INIT, a prior bugfix tried to ignore the INIT and continue
> onwards.
> 
> Unfortunately it's not safe to return at that point in vmx_vmexit_handler().
> Just out of context in the first hunk is a local_irqs_enabled() which is
> depended-upon by the return-to-guest path, causing the following checklock
> failure in debug builds:
> 
>   (XEN) Error: INIT received - ignoring
>   (XEN) CHECKLOCK FAILURE: prev irqsafe: 0, curr irqsafe 1
>   (XEN) Xen BUG at common/spinlock.c:132
>   (XEN) ----[ Xen-4.19-unstable  x86_64  debug=y  Tainted:     H  ]----
>   ...
>   (XEN) Xen call trace:
>   (XEN)    [<ffff82d040238e10>] R check_lock+0xcd/0xe1
>   (XEN)    [<ffff82d040238fe3>] F _spin_lock+0x1b/0x60
>   (XEN)    [<ffff82d0402ed6a8>] F pt_update_irq+0x32/0x3bb
>   (XEN)    [<ffff82d0402b9632>] F vmx_intr_assist+0x3b/0x51d
>   (XEN)    [<ffff82d040206447>] F vmx_asm_vmexit_handler+0xf7/0x210
> 
> Luckily, this is benign in release builds.  Accidentally having IRQs disabled
> when trying to take an IRQs-on lock isn't a deadlock-vulnerable pattern.
> 
> Drop the problematic early return.  In hindsight, it's wrong to skip other
> normal VMExit steps.
> 
> Fixes: b1f11273d5a7 ("x86/vmx: Don't spuriously crash the domain when INIT is received")
> Reported-by: Reima ISHII <ishiir@g.ecc.u-tokyo.ac.jp>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



