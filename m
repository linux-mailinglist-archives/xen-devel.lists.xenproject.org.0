Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E45F984B442
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 13:04:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676866.1053181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXKBZ-0007Fn-W4; Tue, 06 Feb 2024 12:04:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676866.1053181; Tue, 06 Feb 2024 12:04:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXKBZ-0007DW-TM; Tue, 06 Feb 2024 12:04:21 +0000
Received: by outflank-mailman (input) for mailman id 676866;
 Tue, 06 Feb 2024 12:04:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gccX=JP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXKBY-0007DQ-J0
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 12:04:20 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db59c915-c4e7-11ee-8a47-1f161083a0e0;
 Tue, 06 Feb 2024 13:04:19 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40ff13d2628so1256205e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 04:04:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 y6-20020a056000108600b0033b48190e5esm1142771wrw.67.2024.02.06.04.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 04:04:18 -0800 (PST)
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
X-Inumbo-ID: db59c915-c4e7-11ee-8a47-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707221059; x=1707825859; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PDFsRplueq1dCGsrwap+oi9L81OYSkGPgI5OtHRQPt0=;
        b=CZQIhkxYXOTszJeui2CmaibiyS+SfEU6tv8Kj3LKWaU7d0/zIfKnxGgzcICfOwLEvl
         EN1VZb+Oxe+K2lQeqWbpRg8AFyOy+Lx8I+yesmlsh/8Bk6LC0xl8P8DPx4C0GGwBsKkw
         Gx1hLaAo/FlGxa0DGx5Rses0T8epfbhcp1BCjEveR9gX2ZBq1V/6P4kOGTEqOBOM93il
         bQ7k+GtGkF28pRQ5xmNS0bTTpHfD1gyapQKsyaKbKl2SJsj0LpcZDv3BpFwyg0BYv+eC
         t8PfdIbOQISn4P2shO52v4Vde1im46YNzNfKICXVBkpMAWE/1TICGDl4liXI2aD/+Z6v
         iObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707221059; x=1707825859;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PDFsRplueq1dCGsrwap+oi9L81OYSkGPgI5OtHRQPt0=;
        b=wBiaz+DKk481CqwY03mQsE/tcwrN8elvjnYo8geuth5DThALo9YZYjJd/4itrNAvC6
         +L2/T1EOyFIs5iSYu920yIrqC+6uGTYiytT8oSW6s1ODm9juSzp8stc9CfvyTPBGtKVL
         MF2vzrxMpugSwLxxgx1Y3SEjAhz02Ey/gBwUpk3OCrzU0KtdaGWJdHiHlVbHJsEBGlg5
         i6/9ifhIl82dK0BISZa+xagPOafue0pCrgXqM6kEMSbVbTJfunlYZ2BM9P2G+G2NdWkg
         6DAyWfGDX1XZx/e+6uRnv6VhXk1TP+ZWcp9YcGbb4Sm2GdzhUlu9SOc8B/JkemxDheWs
         vsFg==
X-Gm-Message-State: AOJu0Yw6jp4ZR9WlmNPgk3BSaht3M6GJ4CWrebDfIFNv+0qVKqEiDx0Q
	jHBXuIeccUugBo/lfguoR1xXzIbdd/iNkVKPRDJuMvAEZH5L1Tgdw+CEL6dx5g==
X-Google-Smtp-Source: AGHT+IHZeUbwUVREyRUvntKsEr26KtuNTB2oDglTFws6gyR+jv0KW8pkgoRE6ChZyZAKmwIlyvLqag==
X-Received: by 2002:a05:600c:4e0d:b0:40f:f1ab:f71d with SMTP id b13-20020a05600c4e0d00b0040ff1abf71dmr273992wmq.9.1707221058801;
        Tue, 06 Feb 2024 04:04:18 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU0IdNNHHTkOQXjoukpKfTL3geEvGtI6Z8DJMdl5z0Wh2e80IYthpG8rkQyUUhFKmwCzN8ieZ5QjTADUgXi5HsjhCpKNYT20pz59THQPbYhGmawwpX0QLJW7nLxJbulzPx4STq8iv1Ao+TtSfeIAf7eWkM2B90cuRNJsT7KH3v4KIR5qWHvNW7g2ZR8gAsOg24VOcwjqAAgwMfGRuG6tTVYNUIMR5/4zdoXnMPmRBrG4cdC0dMXGu414YgUAQ4+hxca5LfUHak8dLB6oRGRQPCtfNgDutNxleiiD+fQwxKyk2OHDJi8d0qLXrRWno3FBdCaKdowXFoYQj6SFkXXYOUK3+7qhS9JXTm9uP5VCzY/afyBdyCuaGIUovzFXMCfo4//qxhKPLzPQ00bwfPAXpIh+bA9mQrBCt7/iYGOn3OZLoy5J708y0bRFSwXjvOw2Jw=
Message-ID: <09869431-ed00-4102-93fd-84c697a5c950@suse.com>
Date: Tue, 6 Feb 2024 13:04:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 1/4] xen: add SAF deviation for debugging and
 logging effects
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1706886631.git.simone.ballarin@bugseng.com>
 <7c6aeedac626b171ed44df50ce5e3e2c76593f60.1706886631.git.simone.ballarin@bugseng.com>
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
In-Reply-To: <7c6aeedac626b171ed44df50ce5e3e2c76593f60.1706886631.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.02.2024 16:16, Simone Ballarin wrote:
> Rule 13.1: Initializer lists shall not contain persistent side effects
> 
> Effects caused by debug/logging macros and functions (like ASSERT, __bad_atomic_size,
> LOG, etc ...) that crash execution or produce logs are not dangerous in initializer
> lists. The evaluation order in abnormal conditions is not relevant. Evaluation order
> of logging effects is always safe.

I thought I said so before: When talking of just logging, evaluation order
may very well have a impact on correctness. Therefore we shouldn't mix
debugging and logging.

> Function hvm_get_guest_tsc_fixed (indirectly) performs different side effects.
> For example it calls hvm_get_guest_time_fixed that contains an ASSERT and calls
> to spin_lock and spin_unlock.
> 
> These side effects are not dangerous: they can be executed regardless of the
> initializer list evaluation order
> 
> This patch deviates violations using SAF commits caused by debug/logging macros and
> functions.

DYM "comments"?

> --- a/xen/arch/arm/device.c
> +++ b/xen/arch/arm/device.c
> @@ -331,6 +331,7 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
>          .p2mt = p2mt,
>          .skip_mapping = !own_device ||
>                          (is_pci_passthrough_enabled() &&
> +                        /* SAF-3-safe effects for debugging/logging reasons are safe */
>                          (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE)),

Taking this just as example: I think the comment is too long. Just
saying (leaving aside my comment higher up) "debugging/logging"
would imo be sufficient.

> --- a/xen/arch/arm/guestcopy.c
> +++ b/xen/arch/arm/guestcopy.c
> @@ -110,26 +110,34 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
>  unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
>  {
>      return copy_guest((void *)from, (vaddr_t)to, len,
> -                      GVA_INFO(current), COPY_to_guest | COPY_linear);
> +                      /* SAF-4-safe No persistent side effects */
> +                      GVA_INFO(current),

I _still_ think this leaves ambiguity. The more that you need to look
up GVA_INFO() to recognize what this is about.

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -800,6 +800,7 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
>  {
>      struct segment_register seg;
>      struct hvm_hw_cpu ctxt = {
> +        /* SAF-3-safe effects for debugging/logging reasons are safe */
>          .tsc = hvm_get_guest_tsc_fixed(v, v->domain->arch.hvm.sync_tsc),

A prereq for this imo is that the function take const struct vcpu *.
But I'm not sure that'll suffice. The function can change at any time,
rendering the comment here stale perhaps without anyone noticing.

> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1521,6 +1521,7 @@ long vcpu_yield(void)
>  
>      SCHED_STAT_CRANK(vcpu_yield);
>  
> +    /* SAF-4-safe No persistent side effects */
>      TRACE_2D(TRC_SCHED_YIELD, current->domain->domain_id, current->vcpu_id);
>      raise_softirq(SCHEDULE_SOFTIRQ);
>      return 0;
> @@ -1899,6 +1900,7 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          if ( copy_from_guest(&sched_shutdown, arg, 1) )
>              break;
>  
> +        /* SAF-4-safe No persistent side effects */
>          TRACE_3D(TRC_SCHED_SHUTDOWN,
>                   current->domain->domain_id, current->vcpu_id,
>                   sched_shutdown.reason);
> @@ -1916,6 +1918,7 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          if ( copy_from_guest(&sched_shutdown, arg, 1) )
>              break;
>  
> +        /* SAF-4-safe No persistent side effects */
>          TRACE_3D(TRC_SCHED_SHUTDOWN_CODE,
>                   d->domain_id, current->vcpu_id, sched_shutdown.reason);
>  

For all of these iirc the suggestion was to latch current into a local
variable (named "curr" by convention).

Jan

