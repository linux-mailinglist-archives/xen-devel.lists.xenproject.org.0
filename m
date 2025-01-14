Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2548CA1030B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 10:32:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871059.1282104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXdHh-0003pD-4x; Tue, 14 Jan 2025 09:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871059.1282104; Tue, 14 Jan 2025 09:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXdHh-0003mE-1F; Tue, 14 Jan 2025 09:32:29 +0000
Received: by outflank-mailman (input) for mailman id 871059;
 Tue, 14 Jan 2025 09:32:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iLru=UG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tXdHg-0003ZR-2Z
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 09:32:28 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77f9fecd-d25a-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 10:32:27 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5d3d143376dso7529419a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 01:32:27 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95af24bsm608344366b.134.2025.01.14.01.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 01:32:26 -0800 (PST)
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
X-Inumbo-ID: 77f9fecd-d25a-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736847147; x=1737451947; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vc6InP4rrRJV9qMpa0VWNFtyEUnPmljL2ysGpC295uo=;
        b=nRH9PVlFssdFAkXeO2uqFUlrcbP3k4X4m498AizKvdz1hiuFWT9dgmHKYfH6rHQ7DC
         W9aw/lD4xr76F2wgXdXAyk5SXOIuXyKdcrlsuNmSASy+ZGkjfmfXv/j00PuORBF1UaRz
         RLIGpiYka4EzkNGE9hFZCg05Plba+FQgKE9Ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736847147; x=1737451947;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vc6InP4rrRJV9qMpa0VWNFtyEUnPmljL2ysGpC295uo=;
        b=mDzr0c+CA9WcZ5wHr6rZh++23s+nb1kWgv7pMuewqybxe0ot4y6uwvpcXIOjRz1Ycl
         y5qSOy00cSUd8HnEdg3YM1X0zxuk6eAdkwUdmpF90MrzVqCaTyEMAifNqStvfWxze2m9
         0/ff4oHY3xsaNlU4u5zt5rrWxaYtuA9p8PR6hysnYGmUlnYTd+cxhkz1G4D0CnF/1RRU
         K0B+D0M9YO9U8fF3LLfQGyOwj+7lTj/Za+EABaLWmZ2HyO3bZp4CBp8AYqZjkgjXMZ2L
         pukSxIKKLf/ePcUoEyEGTDSIp3MNczv/mqyDVVmOvAjkrEplARD9yNg8lS2Eu0ghF4Tn
         8QZA==
X-Gm-Message-State: AOJu0YzyFczMzlqOnC02DrKHU5frtPcNTr/lccXU5AAibBPSzuq73E47
	2NS23/7KfR5lrNkYQF5Wa2nQVX2aFg9IIrF8V+mzpQNHVFuuUfudN0cLiL1iBzs=
X-Gm-Gg: ASbGncsgumfU7jpeEKWpIHpBA8L8WT3HkDkoX8CbnFCxoXeEMlPQvMPNq9J5YWZNGiw
	cFeHaXikZlWA/F4i1v1xUGvKkb4fm32XzhmP48Q/kvBN6tTNJiXnQsPzuSQIb7sZ+54CukRRaUr
	Rtc9FAFNxJgMr6Y1mkvDk52t9ab4VVlTKyrCbdZFG6RSWG88PjtnxPe4qpZxV11JTmtQDBYQ3Jy
	hJUuIxhgtOgnWhnaL9wPcXeZIeGTOzlyTizRUWqdsxwpmvs8EBJOPPlgZkH5w==
X-Google-Smtp-Source: AGHT+IF5wm/tp9Wah8W7uIa+PYzV45EC6H3HVnVibHi/ZH4Qan4tATQN3VFIZ0Idc+trtm7YCZokHA==
X-Received: by 2002:a17:907:97c3:b0:aae:83c6:c67e with SMTP id a640c23a62f3a-ab2abde5517mr2136513066b.55.1736847146666;
        Tue, 14 Jan 2025 01:32:26 -0800 (PST)
Date: Tue, 14 Jan 2025 10:32:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] intel/msr: Fix handling of MSR_RAPL_POWER_UNIT
Message-ID: <Z4YvKdwtHjmJUVF3@macbook.local>
References: <0ac778dbcc7ab383447abe672225ff77b0d4802e.1736793323.git.teddy.astie@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0ac778dbcc7ab383447abe672225ff77b0d4802e.1736793323.git.teddy.astie@vates.tech>

On Mon, Jan 13, 2025 at 06:42:44PM +0000, Teddy Astie wrote:
> Solaris 11.4 tries to access this MSR on some Intel platforms without properly
> setting up a proper #GP handler, which leads to a immediate crash.
> 
> Emulate the access of this MSR by giving it a legal value (all values set to
> default, as defined by Intel SDM "RAPL Interfaces").
> 
> Fixes: 84e848fd7a1 ('x86/hvm: disallow access to unknown MSRs')

Hm, 

> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> Does it have a risk of negatively affecting other operating systems expecting
> this MSR read to fail ?
> ---
>  xen/arch/x86/include/asm/msr-index.h |  2 ++
>  xen/arch/x86/msr.c                   | 16 ++++++++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
> index 9cdb5b2625..2adcdf344f 100644
> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -144,6 +144,8 @@
>  #define MSR_RTIT_ADDR_A(n)                 (0x00000580 + (n) * 2)
>  #define MSR_RTIT_ADDR_B(n)                 (0x00000581 + (n) * 2)
>  
> +#define MSR_RAPL_POWER_UNIT                 0x00000606
> +
>  #define MSR_U_CET                           0x000006a0
>  #define MSR_S_CET                           0x000006a2
>  #define  CET_SHSTK_EN                       (_AC(1, ULL) <<  0)
> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> index 289cf10b78..b14d42dacf 100644
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -169,6 +169,22 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>          if ( likely(!is_cpufreq_controller(d)) || rdmsr_safe(msr, *val) == 0 )
>              break;
>          goto gp_fault;
> +    

Trailing spaces in the added newline.

> +        /*
> +         * Solaris 11.4 DomU tries to use read this MSR without setting up a
> +         * proper #GP handler leading to a crash. Emulate this MSR by giving a
> +         * legal value.
> +         */

The comment should be after (inside) the case statement IMO (but not
strong opinion.  Could you also raise a bug with Solaris and put a
link to the bug report here, so that we have a reference to it?

> +    case MSR_RAPL_POWER_UNIT:
> +        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR)) )

Has Centaur ever released a CPU with RAPL?

> +            goto gp_fault;
> +
> +        /*
> +         * Return a legal register content with all default values defined in
> +         * Intel Architecture Software Developer Manual 16.10.1 RAPL Interfaces
> +         */
> +        *val = 0x0000A1003;

The SPR Specification defines the default as 000A0E03h:

* SDM:

Energy Status Units (bits 12:8): Energy related information (in
Joules) is based on the multiplier, 1/2^ESU; where ESU is an unsigned
integer represented by bits 12:8. Default value is 10000b, indicating
energy status unit is in 15.3 micro-Joules increment.

* SPR:

Energy Units (ENERGY_UNIT):
Energy Units used for power control registers.
The actual unit value is calculated by 1 J / Power(2,ENERGY_UNIT).
The default value of 14 corresponds to Ux.14 number.

Note that KVM just returns all 0s [0], so we might consider doing the
same, as otherwise that could lead OSes to poke at further RAPL
related MSRs if the returned value from MSR_RAPL_POWER_UNIT looks
plausible.

[0] https://elixir.bootlin.com/linux/v6.12.6/source/arch/x86/kvm/x86.c#L4236

Thanks.

