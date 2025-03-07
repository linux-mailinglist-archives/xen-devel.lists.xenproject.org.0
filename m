Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B255A564E0
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 11:13:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904843.1312657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqUhP-0005Kv-Fv; Fri, 07 Mar 2025 10:12:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904843.1312657; Fri, 07 Mar 2025 10:12:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqUhP-0005Iq-Ch; Fri, 07 Mar 2025 10:12:59 +0000
Received: by outflank-mailman (input) for mailman id 904843;
 Fri, 07 Mar 2025 10:12:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqUhN-0005Ij-RX
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 10:12:57 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc0644f6-fb3c-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 11:12:54 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43bcad638efso9714585e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Mar 2025 02:12:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd426c56esm80085555e9.8.2025.03.07.02.12.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 02:12:53 -0800 (PST)
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
X-Inumbo-ID: bc0644f6-fb3c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741342374; x=1741947174; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mj7dpYe51f8Bs06A85T+QoEdXgUq3kWARWy1uDkTrD4=;
        b=Ka0XbAvCDkMoQcUcFeop/fLZMTJ9ETef60YknjUM001XupZ2RFxUNoptsmhcpqt7m1
         4BH3eJThgbggKjIdl/lgld9YqNc4DtLitaenRHPaiYNxA5rdhQoJwLaAvjBJ2SAuA2O4
         ApGjbOKxcfEQo08Iue80xsSQbE8P4TYto5qnt5IJMjOfmDpchP89um0clnUXt5JLIAPq
         MqoRzsr0NSfE6QJLTozRfMAQ+kSpcu0ha/x31GDkCsp5nM6cHYR1waRN1+111+96rIku
         Vst4YJ2Ae4XtUEnC4pMGDZVoq4WoMcHDqrx/BJBGoC5HgJdeomkf/euq0CJjBY4tbmJF
         ykXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741342374; x=1741947174;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mj7dpYe51f8Bs06A85T+QoEdXgUq3kWARWy1uDkTrD4=;
        b=tXQkEeTuyHoAYYhdA5Ps+eb0rfWjJJGfSB5Jl56s5dtPXZpeeCDVPlKJrce/+92TtL
         8LmY93g+X3eix+RhkcypqIm+gq53lEYBDpn1LnjJzf6/L1znbwyL2+3UqFFueBTZKRoj
         x9IlLGe2IZ9Im1aGWeaZftveIYWQc7JfvXH3y2u/CJTXrxhO5WKiTjRgKuRkC+LPzsKQ
         ZHWr9ENSJCDSKOdrMzJMRdWYQbsHPisSKT94ShAA5Fx/fhFBWx/DYPhVwRNFrsYPBM32
         RIkVP7cswttcKcz/uxB3F5TLnFacyVZQPLnvTu0GlZZuOfdxNCNOWbsCWue8fVEkKWgw
         okSw==
X-Gm-Message-State: AOJu0YzgvABnxNZt4ga/go7wb2OtyG9dkyC5s78+BNq112Wb1XqlzoaA
	eWQeN0aDmTGo3S71GVnjis9DuWjjd1IravzmMOm5gXUXrpuX+cfQco/Cgv3dsVtuLtJkq6nhGvk
	=
X-Gm-Gg: ASbGncvh00bJl3M5c0vc7lcaImJn00AvFtPlMXHnf0lNIyBLD/SlNrnADKhw+Vol5Al
	E3A5EHu7bQtenZogKxRTybdw/ULpch6EpkmsN/Yn31d39FdHuISgoshffcA6lUNJFoXEtci2BuP
	BXzBbHBtmqNsZ37Qm0I5KUps5dTbSInkWjMJhi76HuPryTpLz+FpVqtU1FlfFTZ46QCuHd/vYhW
	J1im8L8OZUrDsos3PicP2A6E0CyJDO9LYYdUm4Rfhml7jubwfy6FcnDI8t59AtKONUb60B+d15f
	3OjkC1AJGlPpKHGrr0FK9YfT409Q9ds+ydoxFZDn041Vi20U7v4dSlMcVLwfPkMM+MwYNtkNubf
	vp6p519Eo5rIfknbm45CzcmIuvnhCcA==
X-Google-Smtp-Source: AGHT+IGoRGmaBEm98vWLkj939Fmpcj5E1peF+HSQuS1bUF/v/XFDxoAL/yBsZ/J0+tBdUcZ+24Zk7w==
X-Received: by 2002:a05:600c:3b9c:b0:43b:cfbb:3806 with SMTP id 5b1f17b1804b1-43c601e07e8mr21194435e9.14.1741342373824;
        Fri, 07 Mar 2025 02:12:53 -0800 (PST)
Message-ID: <489c9ef9-4ea2-42f1-b3b5-0992a4ef9cbd@suse.com>
Date: Fri, 7 Mar 2025 11:12:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/events: fix global virq handling
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Juergen Gross <jgross@suse.com>
References: <0315252d-0378-4699-bff7-ce745d753438@suse.com>
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
In-Reply-To: <0315252d-0378-4699-bff7-ce745d753438@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.03.2025 11:11, Jan Beulich wrote:

Sorry, missed
From: Juergen Gross <jgross@suse.com>

Jan

> VIRQs are split into "global" and "per vcpu" ones. Unfortunately in
> reality there are "per domain" ones, too.
> 
> send_global_virq() and set_global_virq_handler() make only sense for
> the real "global" ones, so replace virq_is_global() with a new
> function get_virq_type() returning one of the 3 possible types (global,
> domain, vcpu VIRQ).
> 
> To make its intended purpose more clear, also rename
> send_guest_global_virq() to send_guest_domain_virq().
> 
> Fixes: 980822c5edd1 ("xen/events: allow setting of global virq handler only for unbound virqs")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> As I don't have much time today (I'm having a day off), only compile
> tested. Please try a CI run with this patch before applying!
> 
> Whether the "domain" infix in send_guest_domain_virq() is really useful
> I don't know. Maybe we should go even father with renaming, to have
> {vcpu,domain}_send_virq()?
> ---
> v2: Also rename send_guest_global_virq().
> 
> --- a/xen/arch/arm/include/asm/event.h
> +++ b/xen/arch/arm/include/asm/event.h
> @@ -47,9 +47,9 @@ static inline void local_event_delivery_
>  }
>  
>  /* No arch specific virq definition now. Default to global. */
> -static inline bool arch_virq_is_global(unsigned int virq)
> +static inline enum virq_type arch_get_virq_type(unsigned int virq)
>  {
> -    return true;
> +    return VIRQ_GLOBAL;
>  }
>  
>  #endif
> --- a/xen/arch/ppc/include/asm/event.h
> +++ b/xen/arch/ppc/include/asm/event.h
> @@ -17,9 +17,9 @@ static inline int vcpu_event_delivery_is
>  }
>  
>  /* No arch specific virq definition now. Default to global. */
> -static inline bool arch_virq_is_global(unsigned int virq)
> +static inline enum virq_type arch_get_virq_type(unsigned int virq)
>  {
> -    return true;
> +    return VIRQ_GLOBAL;
>  }
>  
>  static inline int local_events_need_delivery(void)
> --- a/xen/arch/riscv/include/asm/event.h
> +++ b/xen/arch/riscv/include/asm/event.h
> @@ -24,9 +24,9 @@ static inline void local_event_delivery_
>  }
>  
>  /* No arch specific virq definition now. Default to global. */
> -static inline bool arch_virq_is_global(unsigned int virq)
> +static inline enum virq_type arch_get_virq_type(unsigned int virq)
>  {
> -    return true;
> +    return VIRQ_GLOBAL;
>  }
>  
>  #endif /* ASM__RISCV__EVENT_H */
> --- a/xen/arch/x86/include/asm/event.h
> +++ b/xen/arch/x86/include/asm/event.h
> @@ -41,10 +41,10 @@ static inline void local_event_delivery_
>      vcpu_info(current, evtchn_upcall_mask) = 0;
>  }
>  
> -/* No arch specific virq definition now. Default to global. */
> -static inline bool arch_virq_is_global(unsigned int virq)
> +/* Only global arch specific virq definitions. */
> +static inline enum virq_type arch_get_virq_type(unsigned int virq)
>  {
> -    return true;
> +    return VIRQ_GLOBAL;
>  }
>  
>  #ifdef CONFIG_PV_SHIM
> --- a/xen/common/argo.c
> +++ b/xen/common/argo.c
> @@ -440,7 +440,7 @@ signal_domain(struct domain *d)
>  {
>      argo_dprintk("signalling domid:%u\n", d->domain_id);
>  
> -    send_guest_global_virq(d, VIRQ_ARGO);
> +    send_guest_domain_virq(d, VIRQ_ARGO);
>  }
>  
>  static void
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -127,7 +127,7 @@ static struct domain *get_global_virq_ha
>      return global_virq_handlers[virq] ?: hardware_domain;
>  }
>  
> -static bool virq_is_global(unsigned int virq)
> +static enum virq_type get_virq_type(unsigned int virq)
>  {
>      switch ( virq )
>      {
> @@ -135,14 +135,17 @@ static bool virq_is_global(unsigned int
>      case VIRQ_DEBUG:
>      case VIRQ_XENOPROF:
>      case VIRQ_XENPMU:
> -        return false;
> +        return VIRQ_VCPU;
> +
> +    case VIRQ_ARGO:
> +        return VIRQ_DOMAIN;
>  
>      case VIRQ_ARCH_0 ... VIRQ_ARCH_7:
> -        return arch_virq_is_global(virq);
> +        return arch_get_virq_type(virq);
>      }
>  
>      ASSERT(virq < NR_VIRQS);
> -    return true;
> +    return VIRQ_GLOBAL;
>  }
>  
>  static struct evtchn *_evtchn_from_port(const struct domain *d,
> @@ -476,7 +479,7 @@ int evtchn_bind_virq(evtchn_bind_virq_t
>      struct domain *d = current->domain;
>      int            virq = bind->virq, vcpu = bind->vcpu;
>      int            rc = 0;
> -    bool           is_global;
> +    enum virq_type type;
>  
>      if ( (virq < 0) || (virq >= ARRAY_SIZE(v->virq_to_evtchn)) )
>          return -EINVAL;
> @@ -486,9 +489,9 @@ int evtchn_bind_virq(evtchn_bind_virq_t
>      * speculative execution.
>      */
>      virq = array_index_nospec(virq, ARRAY_SIZE(v->virq_to_evtchn));
> -    is_global = virq_is_global(virq);
> +    type = get_virq_type(virq);
>  
> -    if ( is_global && vcpu != 0 )
> +    if ( type != VIRQ_VCPU && vcpu != 0 )
>          return -EINVAL;
>  
>      if ( (v = domain_vcpu(d, vcpu)) == NULL )
> @@ -496,7 +499,7 @@ int evtchn_bind_virq(evtchn_bind_virq_t
>  
>      write_lock(&d->event_lock);
>  
> -    if ( is_global && get_global_virq_handler(virq) != d )
> +    if ( type == VIRQ_GLOBAL && get_global_virq_handler(virq) != d )
>      {
>          rc = -EBUSY;
>          goto out;
> @@ -756,7 +759,8 @@ int evtchn_close(struct domain *d1, int
>          if ( chn1->u.virq == VIRQ_DOM_EXC )
>              domain_deinit_states(d1);
>  
> -        v = d1->vcpu[virq_is_global(chn1->u.virq) ? 0 : chn1->notify_vcpu_id];
> +        v = d1->vcpu[get_virq_type(chn1->u.virq) != VIRQ_VCPU
> +            ? 0 : chn1->notify_vcpu_id];
>  
>          write_lock_irqsave(&v->virq_lock, flags);
>          ASSERT(read_atomic(&v->virq_to_evtchn[chn1->u.virq]) == port1);
> @@ -900,7 +904,7 @@ bool evtchn_virq_enabled(const struct vc
>      if ( !v )
>          return false;
>  
> -    if ( virq_is_global(virq) && v->vcpu_id )
> +    if ( get_virq_type(virq) != VIRQ_VCPU && v->vcpu_id )
>          v = domain_vcpu(v->domain, 0);
>  
>      return read_atomic(&v->virq_to_evtchn[virq]);
> @@ -913,7 +917,7 @@ void send_guest_vcpu_virq(struct vcpu *v
>      struct domain *d;
>      struct evtchn *chn;
>  
> -    ASSERT(!virq_is_global(virq));
> +    ASSERT(get_virq_type(virq) == VIRQ_VCPU);
>  
>      read_lock_irqsave(&v->virq_lock, flags);
>  
> @@ -933,14 +937,14 @@ void send_guest_vcpu_virq(struct vcpu *v
>      read_unlock_irqrestore(&v->virq_lock, flags);
>  }
>  
> -void send_guest_global_virq(struct domain *d, uint32_t virq)
> +void send_guest_domain_virq(struct domain *d, uint32_t virq)
>  {
>      unsigned long flags;
>      int port;
>      struct vcpu *v;
>      struct evtchn *chn;
>  
> -    ASSERT(virq_is_global(virq));
> +    ASSERT(get_virq_type(virq) != VIRQ_VCPU);
>  
>      if ( unlikely(d == NULL) || unlikely(d->vcpu == NULL) )
>          return;
> @@ -995,9 +999,9 @@ static DEFINE_SPINLOCK(global_virq_handl
>  
>  void send_global_virq(uint32_t virq)
>  {
> -    ASSERT(virq_is_global(virq));
> +    ASSERT(get_virq_type(virq) == VIRQ_GLOBAL);
>  
> -    send_guest_global_virq(get_global_virq_handler(virq), virq);
> +    send_guest_domain_virq(get_global_virq_handler(virq), virq);
>  }
>  
>  int set_global_virq_handler(struct domain *d, uint32_t virq)
> @@ -1008,7 +1012,7 @@ int set_global_virq_handler(struct domai
>  
>      if (virq >= NR_VIRQS)
>          return -EINVAL;
> -    if (!virq_is_global(virq))
> +    if (get_virq_type(virq) != VIRQ_GLOBAL)
>          return -EINVAL;
>  
>      if (global_virq_handlers[virq] == d)
> @@ -1204,7 +1208,7 @@ int evtchn_bind_vcpu(evtchn_port_t port,
>      switch ( chn->state )
>      {
>      case ECS_VIRQ:
> -        if ( virq_is_global(chn->u.virq) )
> +        if ( get_virq_type(chn->u.virq) != VIRQ_VCPU )
>              chn->notify_vcpu_id = v->vcpu_id;
>          else
>              rc = -EINVAL;
> --- a/xen/include/xen/event.h
> +++ b/xen/include/xen/event.h
> @@ -24,17 +24,17 @@
>  void send_guest_vcpu_virq(struct vcpu *v, uint32_t virq);
>  
>  /*
> - * send_global_virq: Notify the domain handling a global VIRQ.
> - *  @virq:     Virtual IRQ number (VIRQ_*)
> + * send_guest_domain_virq:
> + *  @d:        Domain to which VIRQ should be sent
> + *  @virq:     Virtual IRQ number (VIRQ_*), may not be per-vCPU
>   */
> -void send_global_virq(uint32_t virq);
> +void send_guest_domain_virq(struct domain *d, uint32_t virq);
>  
>  /*
> - * send_guest_global_virq:
> - *  @d:        Domain to which VIRQ should be sent
> - *  @virq:     Virtual IRQ number (VIRQ_*), must be global
> + * send_global_virq: Notify the domain handling a global VIRQ.
> + *  @virq:     Virtual IRQ number (VIRQ_*)
>   */
> -void send_guest_global_virq(struct domain *d, uint32_t virq);
> +void send_global_virq(uint32_t virq);
>  
>  /*
>   * sent_global_virq_handler: Set a global VIRQ handler.
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -84,6 +84,12 @@ extern domid_t hardware_domid;
>  #define XEN_CONSUMER_BITS 3
>  #define NR_XEN_CONSUMERS ((1 << XEN_CONSUMER_BITS) - 1)
>  
> +enum virq_type {
> +    VIRQ_GLOBAL,
> +    VIRQ_DOMAIN,
> +    VIRQ_VCPU
> +};
> +
>  struct evtchn
>  {
>      rwlock_t lock;


