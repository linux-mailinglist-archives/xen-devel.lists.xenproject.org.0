Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE7AA022C0
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 11:17:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865632.1276882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUk9w-0008QE-4U; Mon, 06 Jan 2025 10:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865632.1276882; Mon, 06 Jan 2025 10:16:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUk9w-0008NK-1b; Mon, 06 Jan 2025 10:16:32 +0000
Received: by outflank-mailman (input) for mailman id 865632;
 Mon, 06 Jan 2025 10:16:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9khw=T6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tUk9u-0008NE-L9
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 10:16:30 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ad7ead3-cc17-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 11:16:28 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4361e89b6daso97168775e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 02:16:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436604e9c2csm564212475e9.43.2025.01.06.02.16.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 02:16:27 -0800 (PST)
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
X-Inumbo-ID: 4ad7ead3-cc17-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736158588; x=1736763388; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4EhysA5vxf8/t+mhDzBIb4/H2MJ8QdQgnYT2PRiwSS0=;
        b=D+CbkFnA65xDvd0ecvra0Q7oTxq+IbxiRCSyTZwYkFkyO9zYmLIvLr0noTbk7w9nVE
         q8BKBqi5aqC1jfx3ZXbpllkcfIovgq1N9B0dwUXwr3i3wtBNNP9Ip8KMKanREN0GVb/g
         3LhgzuT7U7FZSuBienxV9jgwoMi8XmuTYU/5YRbkWPrV+n28gzlIGa+ZdzMeMdFVSpdW
         Bzs5gOv/2dBfr/Eg6REnrleuJRbRIXRJ/XNHHfQaJFqO3eKavIi4KomTLl4IMA5cAHKc
         PI8DQOmuINq0XS3zWdkbekfjyHkO03vxmMmS/EnHD6i1Ng/7BRK7bYNwpWdyrsiw2XTC
         SNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736158588; x=1736763388;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EhysA5vxf8/t+mhDzBIb4/H2MJ8QdQgnYT2PRiwSS0=;
        b=nfyDGZBvmO+DfoCtULNmOtSqQqDz98B/zJVWxV8t1RijEG41U8G2SenH/M3iTKg/pz
         pk4nDaOGWOH3dDsn4JUFGeL6GhxIQkGhifXVtyz/U6kkgion76BI3IzjmFK0CFFi7Weh
         Bv9Aql3QRn/rlZn6f0qBaVUF35H8kI5gbMZowbkQZl7tdFkwaVtSW14X9olQGOi/fbt2
         nL1vN4tMqJkaXSxfhb+GMNq214jfJWWe1ZzcDSbWRbpMV36f0FfSHt8Esh0NGR9eQiQj
         RT/t1GV3WlfY7V6QkBQXdH6yZ5yaMvWddDc+fcuh1SR1ew6zOBU/50sHBlRgU9LEOMLr
         Ynnw==
X-Forwarded-Encrypted: i=1; AJvYcCXikb8st4FBRNmUiwr9YG4Rmw0nonCyKkKgkp1LKGyxtysBqzG2TNggTe4wBE2xFAoQGNZ832iDso4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBbcoYRMZljsg6EActh49mZqvtnSS33HUeiqJGa7bBYhcW6QCE
	WwVZVdU63vGJXkdYn2jB/5PJgn7z3Ny1Pse6l9g1efKpV+ewSBdS8pMfoKWI0A==
X-Gm-Gg: ASbGnctsTc8E5WKfHkPr+mQPOlP5Nbu8PX0aQAkTY3MjPzHEdFYPtOR/uGmmVv1KpbN
	feiQ5Iy6WloPybzmUeawFtlo2aydM0z/pCB78E/+2UTkBTBeSkF7B5bkeNDsZ+k2IqQoDgyxMuT
	03jufAMRFV40dc8TKkdrb6koDGoPiDE/u6pBk0efj4wfmxWF/f6OsiZSzAoB4IAaDA/asFCi0Sr
	YEdvU7PgFFDXW/tP64I6xJvG1v5GlLWZBD1stXlXaNSy/0N+P82EtonnY4ueSv3Y54BXduUwVFs
	NW4nWP/51Opx/EhSXrGJLq7QWjTX0bbcHISLfc5OaQ==
X-Google-Smtp-Source: AGHT+IFegCytHadH/Bsuu9OAOKvDO/4OPXNOv27Rj0veS0i7+S9KRm4NriSbJAoYV5LdQNlcVtPDRA==
X-Received: by 2002:a05:600c:5246:b0:42c:bb96:340e with SMTP id 5b1f17b1804b1-43668b7857amr529670425e9.31.1736158587859;
        Mon, 06 Jan 2025 02:16:27 -0800 (PST)
Message-ID: <c8684340-33f9-41d3-94e4-77ee3bc18306@suse.com>
Date: Mon, 6 Jan 2025 11:16:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] xen: mem_access: conditionally compile vm_event.c
 & monitor.c
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <20241230063051.3332332-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20241230063051.3332332-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.12.2024 07:30, Sergiy Kibrik wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Extend coverage of CONFIG_MEM_ACCESS option and make the build of VM events
> and monitoring support optional.

Yet doesn't this end up in things becoming misleading? Don't we rather need a
2nd Kconfig option, with a dependency between the two? Or alternatively a
rename of the existing option (to describe the higher-level feature rather
than the lower level one)? Tamas, I'm particularly interested in knowing your
view here as well.

Jan

> This is to reduce code size on Arm when this option isn't enabled.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> ---
>  xen/arch/arm/Makefile      |  4 ++--
>  xen/arch/arm/vsmc.c        |  3 ++-
>  xen/common/Makefile        |  4 ++--
>  xen/include/xen/monitor.h  |  9 +++++++++
>  xen/include/xen/vm_event.h | 14 +++++++++++---
>  5 files changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 43ab5e8f25..8903eb0bf2 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -39,7 +39,7 @@ obj-$(CONFIG_LIVEPATCH) += livepatch.o
>  obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
>  obj-$(CONFIG_MEM_ACCESS) += mem_access.o
>  obj-y += mm.o
> -obj-y += monitor.o
> +obj-$(CONFIG_MEM_ACCESS) += monitor.o
>  obj-y += p2m.o
>  obj-y += platform.o
>  obj-y += platform_hypercall.o
> @@ -65,7 +65,7 @@ obj-$(CONFIG_VGICV2) += vgic-v2.o
>  obj-$(CONFIG_GICV3) += vgic-v3.o
>  obj-$(CONFIG_HAS_ITS) += vgic-v3-its.o
>  endif
> -obj-y += vm_event.o
> +obj-$(CONFIG_MEM_ACCESS) += vm_event.o
>  obj-y += vtimer.o
>  obj-$(CONFIG_SBSA_VUART_CONSOLE) += vpl011.o
>  obj-y += vsmc.o
> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
> index 62d8117a12..1c13326bdf 100644
> --- a/xen/arch/arm/vsmc.c
> +++ b/xen/arch/arm/vsmc.c
> @@ -330,7 +330,8 @@ void do_trap_smc(struct cpu_user_regs *regs, const union hsr hsr)
>      }
>  
>      /* If monitor is enabled, let it handle the call. */
> -    if ( current->domain->arch.monitor.privileged_call_enabled )
> +    if ( IS_ENABLED(CONFIG_MEM_ACCESS) &&
> +         current->domain->arch.monitor.privileged_call_enabled )
>          rc = monitor_smc();
>  
>      if ( rc == 1 )
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index cba3b32733..e3c6a857ab 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -54,7 +54,7 @@ obj-y += timer.o
>  obj-$(CONFIG_TRACEBUFFER) += trace.o
>  obj-y += version.o
>  obj-y += virtual_region.o
> -obj-y += vm_event.o
> +obj-$(CONFIG_MEM_ACCESS) += vm_event.o
>  obj-$(CONFIG_HAS_VMAP) += vmap.o
>  obj-y += vsprintf.o
>  obj-y += wait.o
> @@ -68,7 +68,7 @@ obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o
>  
>  ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
>  obj-y += domctl.o
> -obj-y += monitor.o
> +obj-$(CONFIG_MEM_ACCESS) += monitor.o
>  obj-y += sysctl.o
>  endif
>  
> diff --git a/xen/include/xen/monitor.h b/xen/include/xen/monitor.h
> index 713d54f7c1..f1359abb94 100644
> --- a/xen/include/xen/monitor.h
> +++ b/xen/include/xen/monitor.h
> @@ -27,8 +27,17 @@
>  struct domain;
>  struct xen_domctl_monitor_op;
>  
> +#ifdef CONFIG_MEM_ACCESS
>  int monitor_domctl(struct domain *d, struct xen_domctl_monitor_op *mop);
>  void monitor_guest_request(void);
> +#else
> +static inline int monitor_domctl(struct domain *d,
> +                                 struct xen_domctl_monitor_op *mop)
> +{
> +    return -EINVAL;
> +}
> +static inline void monitor_guest_request(void) {}
> +#endif
>  
>  int monitor_traps(struct vcpu *v, bool sync, vm_event_request_t *req);
>  
> diff --git a/xen/include/xen/vm_event.h b/xen/include/xen/vm_event.h
> index 9a86358b42..72e720e378 100644
> --- a/xen/include/xen/vm_event.h
> +++ b/xen/include/xen/vm_event.h
> @@ -50,9 +50,6 @@ struct vm_event_domain
>      unsigned int last_vcpu_wake_up;
>  };
>  
> -/* Clean up on domain destruction */
> -void vm_event_cleanup(struct domain *d);
> -
>  /* Returns whether a ring has been set up */
>  bool vm_event_check_ring(struct vm_event_domain *ved);
>  
> @@ -88,7 +85,18 @@ void vm_event_cancel_slot(struct domain *d, struct vm_event_domain *ved);
>  void vm_event_put_request(struct domain *d, struct vm_event_domain *ved,
>                            vm_event_request_t *req);
>  
> +#ifdef CONFIG_MEM_ACCESS
> +/* Clean up on domain destruction */
> +void vm_event_cleanup(struct domain *d);
>  int vm_event_domctl(struct domain *d, struct xen_domctl_vm_event_op *vec);
> +#else
> +static inline void vm_event_cleanup(struct domain *d) {}
> +static inline int vm_event_domctl(struct domain *d,
> +                                  struct xen_domctl_vm_event_op *vec)
> +{
> +    return -EINVAL;
> +}
> +#endif
>  
>  void vm_event_vcpu_pause(struct vcpu *v);
>  void vm_event_vcpu_unpause(struct vcpu *v);


