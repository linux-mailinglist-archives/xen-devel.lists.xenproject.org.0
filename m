Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 612BE7F8417
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 20:23:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640907.999708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6bmD-0008L7-FQ; Fri, 24 Nov 2023 19:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640907.999708; Fri, 24 Nov 2023 19:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6bmD-0008Hj-C9; Fri, 24 Nov 2023 19:23:45 +0000
Received: by outflank-mailman (input) for mailman id 640907;
 Fri, 24 Nov 2023 19:23:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AaTM=HF=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r6bmB-0008Hd-83
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 19:23:43 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9ff9151-8afe-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 20:23:42 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-332d2b6a84cso1496721f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 11:23:42 -0800 (PST)
Received: from [10.80.4.253] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 i18-20020a5d5592000000b003316a2aedadsm4997231wrv.36.2023.11.24.11.23.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 11:23:40 -0800 (PST)
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
X-Inumbo-ID: f9ff9151-8afe-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700853821; x=1701458621; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=59+8DK1c7Gd9frVkLXFKI8kQq9QLX9w870GtKkuAKnQ=;
        b=T/zju1BStrLJwTrtfFZUwaUcxG5aBPAIuWp8+Mveuu2FNADX7q4rHM5XRUZVAYiajn
         mmQZS8tuemFghMBAFjZMx3g/ry6VZ52+FrhsEd3y37xkbdC50rw3Msg+ykqqBAVfPAm8
         RzZRqrqk5tGiIQ0jwgm08gTwnpP/NzLHRVm6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700853821; x=1701458621;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=59+8DK1c7Gd9frVkLXFKI8kQq9QLX9w870GtKkuAKnQ=;
        b=Dljj5Hc9izJJjvVAQK+r0hkwbEDoCKaE7VC4Jy6bq4poFHmPXS/xtWkFOg137f/hdr
         dyfaC2GeVXZV8P/IhSaIJnyldOoqtowgPmZzgujeHesJ10TSuZXd5EHWO125MqeQn27G
         Amsz2t2nQ22nc7DcLeoUU4y37jbYOGrlYtBTm716CL+HN5XylFYFuDxyMJAjkn2v6X5o
         rvi/YUFah0h/tyZlNB88gfj5/IJYZ8Y73IWpsDpqC8QS+w3KzLgfDuFmdTxtq5NFrO2w
         EEblGdDoTLoBe73ICCy3smDV3tBtFhGti4vZpVuyxIdvF9s0bGBr39TxHDzex4+hIFKB
         Mocw==
X-Gm-Message-State: AOJu0YwOAtbBgKzJI4YYeNA1GdLONjQE8ejK0iqmjxJrpfvndYomjiNM
	DaWQ69YXotnlPJgKLFcrX2a8Iw==
X-Google-Smtp-Source: AGHT+IFtVeG5dzc0EZWRycjZ3rrhQHCzG5ejn1s4/jujVm4e2QBtRj3FAih4KRlPumypc5Dp/O/fQA==
X-Received: by 2002:a5d:68ca:0:b0:32f:8181:7d2b with SMTP id p10-20020a5d68ca000000b0032f81817d2bmr3195063wrw.32.1700853821135;
        Fri, 24 Nov 2023 11:23:41 -0800 (PST)
Message-ID: <6f712c33-fcfe-42e1-a31d-53e0c7ffea44@cloud.com>
Date: Fri, 24 Nov 2023 19:23:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/13] xen/spinlock: add
 rspin_[un]lock_irq[save|restore]()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: javi.merino@cloud.com, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20231120113842.5897-1-jgross@suse.com>
 <20231120113842.5897-7-jgross@suse.com>
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <20231120113842.5897-7-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/11/2023 11:38, Juergen Gross wrote:
> Instead of special casing rspin_lock_irqsave() and
> rspin_unlock_irqrestore() for the console lock, add those functions
> to spinlock handling and use them where needed.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - new patch
> ---
>   xen/arch/x86/traps.c       | 14 ++++++++------
>   xen/common/spinlock.c      | 16 ++++++++++++++++
>   xen/drivers/char/console.c | 18 +-----------------
>   xen/include/xen/console.h  |  5 +++--
>   xen/include/xen/spinlock.h |  7 +++++++
>   5 files changed, 35 insertions(+), 25 deletions(-)
> 
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index e1356f696a..f72769e79b 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -647,13 +647,15 @@ void show_stack_overflow(unsigned int cpu, const struct cpu_user_regs *regs)
>   void show_execution_state(const struct cpu_user_regs *regs)
>   {
>       /* Prevent interleaving of output. */
> -    unsigned long flags = console_lock_recursive_irqsave();
> +    unsigned long flags;
> +
> +    rspin_lock_irqsave(&console_lock, flags);

This feels a bit weird because rspin_lock_irqsave() being lowercase
hints that it's a either a function or behaves like one. For that it
should take &flags instead.

>   
>       show_registers(regs);
>       show_code(regs);
>       show_stack(regs);
>   
> -    console_unlock_recursive_irqrestore(flags);
> +    rspin_unlock_irqrestore(&console_lock, flags);
>   }
>   
>   void cf_check show_execution_state_nonconst(struct cpu_user_regs *regs)
> @@ -663,7 +665,7 @@ void cf_check show_execution_state_nonconst(struct cpu_user_regs *regs)
>   
>   void vcpu_show_execution_state(struct vcpu *v)
>   {
> -    unsigned long flags = 0;
> +    unsigned long flags;
>   
>       if ( test_bit(_VPF_down, &v->pause_flags) )
>       {
> @@ -698,7 +700,7 @@ void vcpu_show_execution_state(struct vcpu *v)
>   #endif
>   
>       /* Prevent interleaving of output. */
> -    flags = console_lock_recursive_irqsave();
> +    rspin_lock_irqsave(&console_lock, flags);
>   
>       vcpu_show_registers(v);
>   
> @@ -708,7 +710,7 @@ void vcpu_show_execution_state(struct vcpu *v)
>            * Stop interleaving prevention: The necessary P2M lookups involve
>            * locking, which has to occur with IRQs enabled.
>            */
> -        console_unlock_recursive_irqrestore(flags);
> +        rspin_unlock_irqrestore(&console_lock, flags);
>   
>           show_hvm_stack(v, &v->arch.user_regs);
>       }
> @@ -717,7 +719,7 @@ void vcpu_show_execution_state(struct vcpu *v)
>           if ( guest_kernel_mode(v, &v->arch.user_regs) )
>               show_guest_stack(v, &v->arch.user_regs);
>   
> -        console_unlock_recursive_irqrestore(flags);
> +        rspin_unlock_irqrestore(&console_lock, flags);
>       }
>   
>   #ifdef CONFIG_HVM
> diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
> index 26c667d3cc..17716fc4eb 100644
> --- a/xen/common/spinlock.c
> +++ b/xen/common/spinlock.c
> @@ -475,6 +475,16 @@ void rspin_lock(rspinlock_t *lock)
>       lock->recurse_cnt++;
>   }
>   
> +unsigned long __rspin_lock_irqsave(rspinlock_t *lock)
> +{
> +    unsigned long flags;
> +
> +    local_irq_save(flags);
> +    rspin_lock(lock);
> +
> +    return flags;
> +}
> +
>   void rspin_unlock(rspinlock_t *lock)
>   {
>       if ( likely(--lock->recurse_cnt == 0) )
> @@ -484,6 +494,12 @@ void rspin_unlock(rspinlock_t *lock)
>       }
>   }
>   
> +void rspin_unlock_irqrestore(rspinlock_t *lock, unsigned long flags)
> +{
> +    rspin_unlock(lock);
> +    local_irq_restore(flags);
> +}
> +
>   #ifdef CONFIG_DEBUG_LOCK_PROFILE
>   
>   struct lock_profile_anc {
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 369b2f9077..cc743b67ec 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -120,7 +120,7 @@ static int __read_mostly sercon_handle = -1;
>   int8_t __read_mostly opt_console_xen; /* console=xen */
>   #endif
>   
> -static DEFINE_RSPINLOCK(console_lock);
> +DEFINE_RSPINLOCK(console_lock);
>   
>   /*
>    * To control the amount of printing, thresholds are added.
> @@ -1158,22 +1158,6 @@ void console_end_log_everything(void)
>       atomic_dec(&print_everything);
>   }
>   
> -unsigned long console_lock_recursive_irqsave(void)
> -{
> -    unsigned long flags;
> -
> -    local_irq_save(flags);
> -    rspin_lock(&console_lock);
> -
> -    return flags;
> -}
> -
> -void console_unlock_recursive_irqrestore(unsigned long flags)
> -{
> -    rspin_unlock(&console_lock);
> -    local_irq_restore(flags);
> -}
> -
>   void console_force_unlock(void)
>   {
>       watchdog_disable();
> diff --git a/xen/include/xen/console.h b/xen/include/xen/console.h
> index ab5c30c0da..dff0096b27 100644
> --- a/xen/include/xen/console.h
> +++ b/xen/include/xen/console.h
> @@ -8,8 +8,11 @@
>   #define __CONSOLE_H__
>   
>   #include <xen/inttypes.h>
> +#include <xen/spinlock.h>
>   #include <public/xen.h>
>   
> +extern rspinlock_t console_lock;
> +
>   struct xen_sysctl_readconsole;
>   long read_console_ring(struct xen_sysctl_readconsole *op);
>   
> @@ -20,8 +23,6 @@ void console_init_postirq(void);
>   void console_endboot(void);
>   int console_has(const char *device);
>   
> -unsigned long console_lock_recursive_irqsave(void);
> -void console_unlock_recursive_irqrestore(unsigned long flags);
>   void console_force_unlock(void);
>   
>   void console_start_sync(void);
> diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
> index c99ee52458..53f0f72ac4 100644
> --- a/xen/include/xen/spinlock.h
> +++ b/xen/include/xen/spinlock.h
> @@ -218,7 +218,14 @@ void _spin_barrier(spinlock_t *lock);
>    */
>   int rspin_trylock(rspinlock_t *lock);
>   void rspin_lock(rspinlock_t *lock);
> +#define rspin_lock_irqsave(l, f)                                \
> +    ({                                                          \
> +        BUILD_BUG_ON(sizeof(f) != sizeof(unsigned long));       \
> +        ((f) = __rspin_lock_irqsave(l));                        \
> +    })

If f is &flags, then s/f/*(f)/ would be needed in these 2 cases.

On other matters if we had -Wconversion turned on by default that
BUILD_BUG_ON() wouldn't be needed. Not that you can do it (I'm sure the 
codebase would explode everywhere if we switched it on), but might be
something to consider in the future.

> +unsigned long __rspin_lock_irqsave(rspinlock_t *lock);
>   void rspin_unlock(rspinlock_t *lock);
> +void rspin_unlock_irqrestore(rspinlock_t *lock, unsigned long flags);
>   
>   #define spin_lock(l)                  _spin_lock(l)
>   #define spin_lock_cb(l, c, d)         _spin_lock_cb(l, c, d)

Cheers,
Alejandro

