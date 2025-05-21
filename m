Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4058ABFCA8
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 20:16:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992417.1376173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHnzN-00064L-BS; Wed, 21 May 2025 18:16:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992417.1376173; Wed, 21 May 2025 18:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHnzN-000627-8j; Wed, 21 May 2025 18:16:25 +0000
Received: by outflank-mailman (input) for mailman id 992417;
 Wed, 21 May 2025 18:16:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iqa2=YF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uHnzL-00061i-FS
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 18:16:23 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2779b36-366f-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 20:16:21 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so43733265e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 11:16:21 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f7baaf2asm78199995e9.34.2025.05.21.11.16.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 11:16:19 -0700 (PDT)
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
X-Inumbo-ID: b2779b36-366f-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747851381; x=1748456181; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GhcJzQKC5gshz1J2+48hyL/oKwr3Dj/y63z851yN1N0=;
        b=YmfcPcVCV96q57nZEwYk10nh3EMwdCy84XUU6LsFG/aF9s1jxxLOSovegAmS+joyJ1
         fOil63YqHXfpsJES1H5Ir+iyVNMQTThHFt5EBT3y5YvCRaemsd6s48CGqOjhXOYvoSVb
         Kti2aUyO/cIvhip2r+fNmD4rOp/0r2neyBgtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747851381; x=1748456181;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhcJzQKC5gshz1J2+48hyL/oKwr3Dj/y63z851yN1N0=;
        b=vXNuCisZTfnTlFM463GyGJE9xdEpmj3DbglprnIO1IYv5ye42/dVZWX25XK75i/O27
         g7/BhtjRUMU2Wl+QFRoO8UnicVd/e7mdeystYCr2woKC6ogTDz2aLh1+/pV+U51yFQFb
         ZFQafQi9rKQw/fLt8uHJ6hMm6XqwiSWJaNQ4uQLCQrCL0pemszIZDdAnoTPBIipSCTRW
         lPiNMMLsNx1RnUsSgdyIjitFCA9S805Iiopiub3ozJPxGvVcD+POJia67PuLJb0MGOJu
         v5kX0aSH3g3lbDogAR0nroItLYZ3b/7gVr7NKwlbcOqwzFXdhAiH0izdqZEZuzwWjRvv
         RQlg==
X-Forwarded-Encrypted: i=1; AJvYcCWVlONhC9wOb4aF6JF2//+xjl6GGUoGHtADu15nU2oIf894vE9b0UEQkDyWQUVPK+dDXkkqRQv4lf4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywn/wzDOjErzqr/xXR90sRO2gn+7n52YeAMdByepcj4KChpe9tl
	f0ywL9wNBCi0Yp0IDiqOOe4wBr4uBMAH36ORpj+iDtmqLm/GJzpi07p7/+ok6/t5x3A=
X-Gm-Gg: ASbGncvdVS9WDRl6S1T4Ij9UfZ/NG6mbE0Q3AXWy3JbpqNBsxKd8Sop44IqAQ/FydUY
	UV4ybb7TLoMvldLFyq6Ib8NoyBe3XpneXgc8MRVAxntHxBDk6e7rn9JeY4vNSD6PuouMiVW+iM2
	9KIq8Ap/voUBPTCJRD2tR1Uwok+r5lzSlFW1yFKXENdIgpzTX8PUnftwO+xreI4Bq6hff/uC/Lh
	sztzs2vlQY59K4gk2ZRJyHo9YzsS03GczUo1v4yaPLQc5SDerQHjoiQLlCmXIrYgEGvhw8l1A45
	kSfeAtpVi4fARWOD5xy20B/Q3OijZPweB7pT++zioZZuL+sz5PDmpTwPYTzhje9F/LprleqMLnO
	7SLj12gFGaNlBfgj7
X-Google-Smtp-Source: AGHT+IGSnTJJvprQsF/PO2Qhvr509i65mjqnn9h2fhttHDdFkmg6eaLxuoCLskdG5P8Jo7A5071L7w==
X-Received: by 2002:a05:600c:3e88:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-442fd627303mr212091845e9.13.1747851380662;
        Wed, 21 May 2025 11:16:20 -0700 (PDT)
Message-ID: <b66645c8-0e3e-4414-acd3-a0acc6731a14@citrix.com>
Date: Wed, 21 May 2025 19:16:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/boot: attempt to print trace and panic on AP
 bring up stall
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20250521165504.89885-1-roger.pau@citrix.com>
 <20250521165504.89885-3-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250521165504.89885-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/05/2025 5:55 pm, Roger Pau Monne wrote:
> With the current AP bring up code Xen can get stuck indefinitely if an AP

You want a comma between "code, Xen" to make the sentence easier to parse.

> freezes during boot after the 'callin' step.  Introduce a 10s timeout while
> waiting for APs to finish startup.

5s is the timeout used in other parts of AP bringup.  I'd suggest being
consistent here.


> On failure of an AP to complete startup send an NMI to trigger the printing

Again, a comma between "startup, send" would go a long way.

> of a stack backtrace on the stuck AP and panic on the BSP.
>
> The sending of the NMI re-uses the code already present in fatal_trap(), by
> moving it to a separate function.

I'd be tempted to split the patch in two.

>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---

It may be worth nothing that this came from the ICX143 investigation,
even if it wasn't relevant in the end?

> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
> index 48ce996ba414..77dce3e3e22b 100644
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -1388,10 +1389,17 @@ int __cpu_up(unsigned int cpu)
>      time_latch_stamps();
>  
>      set_cpu_state(CPU_STATE_ONLINE);
> +    start = NOW();
>      while ( !cpu_online(cpu) )
>      {
>          cpu_relax();
>          process_pending_softirqs();
> +        if ( NOW() > start + SECONDS(10) )

(NOW() - start) > SECONDS(10)

It has one fewer boundary conditions, even if it is rather unlikely that
start + 10s will overflow.

> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index c94779b4ad4f..9b9e3726e2fb 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -734,6 +736,40 @@ static int cf_check nmi_show_execution_state(
>      return 1;
>  }
>  
> +void show_execution_state_nmi(const cpumask_t *mask, bool show_all)
> +{
> +    unsigned int msecs, pending;
> +
> +    force_show_all = show_all;
> +
> +    watchdog_disable();
> +    console_start_sync();
> +
> +    cpumask_copy(&show_state_mask, mask);
> +    set_nmi_callback(nmi_show_execution_state);
> +    /* Ensure new callback is set before sending out the NMI. */
> +    smp_wmb();

I know this is only moving code, but this is wrong.  So is the smp_mb()
in the x2apic drivers.

It would only be correct in principle for xAPIC (which is an MMIO
store), except it's UC and is strongly ordered anyway.  Furthermore, the
sequence point for the send_IPI_mask() prevents the compiler from
reordering this unsafely.

The x2APIC drivers need LFENCE;MFENCE on Intel, and just MFENCE on AMD,
and this (critically) is not smp_mb(), which is now just a locked operation.

I bet these aren't the only examples of incorrect barriers WRT IPIs.  I
guess we should fix those separately.

~Andrew

