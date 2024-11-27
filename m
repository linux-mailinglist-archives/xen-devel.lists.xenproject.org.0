Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 237EA9DA40B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 09:39:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844525.1260025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGDZN-0004QV-R3; Wed, 27 Nov 2024 08:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844525.1260025; Wed, 27 Nov 2024 08:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGDZN-0004Na-N3; Wed, 27 Nov 2024 08:38:45 +0000
Received: by outflank-mailman (input) for mailman id 844525;
 Wed, 27 Nov 2024 08:38:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p/Ub=SW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tGDZL-0004NT-HO
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 08:38:43 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0070375b-ac9b-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 09:38:40 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a9a0ec0a94fso914790066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 00:38:40 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b2f045asm673371366b.53.2024.11.27.00.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 00:38:39 -0800 (PST)
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
X-Inumbo-ID: 0070375b-ac9b-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmYiLCJoZWxvIjoibWFpbC1lajEteDYyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjAwNzAzNzViLWFjOWItMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjk2NzIwLjA2OTU2NSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732696719; x=1733301519; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OjjvxKboRXZPNee3B/TmfmSTltTUEFR2gR/s08zGRrw=;
        b=jvy2P5K+9f3ePrIsdPzOIcmtDrl5pQz4MH3iQIJTLVsateyYSJQYtOIO430NITHzq+
         Am92zAOfQ1eNWAcfQcaHwxfMz0uNXpPnVGyGTP2JFAgp9vwDpu4k+5xBb+TLpaoQosZF
         bXk2TAzlUP7gT9f4SspFNqkzCTEokD1kdLC44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732696719; x=1733301519;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OjjvxKboRXZPNee3B/TmfmSTltTUEFR2gR/s08zGRrw=;
        b=FFOpY/n0aiN9CPjqPD3TAON7IbKh4OHaLxLFWS9nQ92WeZjdwupbK3HkkRnHQxqXWb
         kWpw9f4AiGyUH14YJex1s2fZoCtBLAUdrxgpUGqJd/muDiX02bCCfux4fS5Zk0hd5LHx
         jAkItCWW5unGlhVBGZQDy45bQZeBYpyXmXyPSESGuwjWMXX6lt00JTR3x8XerKaeBJEH
         WtymifHsU2jr5by0zCGBfVQzBhFWvQy4G34a1Ezayfxrt0GMITTXvM42MGAhXSWSFtsm
         StGqxjPGDCN8os/TxQq8WAmvDiIEZKcBIBiC9KFUNZ2r4wOIansHGmAKMGHaMhjOqCA9
         s6AQ==
X-Gm-Message-State: AOJu0Ywgnt/nbtw7SnpppTCc79wXrjP822isNRUxI2Bh+imcsQ9KcKCg
	++CAcchka7tlQhV7HnRbD3mMLifJjqyi9Q+BTFXxJ447zj4CdQUyWSXBCqczEXk=
X-Gm-Gg: ASbGncsxBhXPr9llc+KTSfyCvCaMmmVXtYZhp4qLfKLgjCWcFRR8eXzzHvMcqPCcwUa
	2BH98mQd4xvKfd69qr8EZ6dM/WdDsAU3HqnPHYanrqQhpJZsrkbzeAjykWQRTrI/x6Dv4//q81J
	5DRN9gYPMErpMjjlTBTxmP0Ml+ve8UnLoZbGao0OA7lYGSWoczwD7HP2vxFJUUZ6YuM4UKGsZ0A
	8LFDgbmqVGhCW7iDwJPXvfOKdyVWhXD1+oIzEIgkS8i14bMI1RjMauNmzQ=
X-Google-Smtp-Source: AGHT+IHWmnHvJVcXC/Va7CGjRO8UsRelgZhzA0jTOLPzR2IZCT9Dl4XnRDQf+uRWo5O8ve7V503NRQ==
X-Received: by 2002:a17:906:2181:b0:a9a:bbcf:a3a2 with SMTP id a640c23a62f3a-aa580f57adcmr114571466b.34.1732696719479;
        Wed, 27 Nov 2024 00:38:39 -0800 (PST)
Date: Wed, 27 Nov 2024 09:38:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Javi Merino <javi.merino@cloud.com>
Subject: Re: [PATCH] x86/APIC: Remove workaround Pentium 3AP APIC_ESR erratum
Message-ID: <Z0bajveZYoKu3qE4@macbook>
References: <3270b77c005745dcf56cc833bdf3e4c703190b05.1732639041.git.javi.merino@cloud.com>
 <20241126205859.23090-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241126205859.23090-1-andrew.cooper3@citrix.com>

On Tue, Nov 26, 2024 at 08:58:59PM +0000, Andrew Cooper wrote:
> The SDM instructs software to write 0 to ESR prior to reading it.  However,
> due to an original Pentium erratum, most logic skips the write based on there
> being more than 3 LVTs; a stand-in to identify the Pentium.
> 
> Xen, being 64bit, doesn't need compatibility for i586 processors.
> 
> Introduce a new apic_read_esr() helper, quoting the SDM to explain why a
> function named apic_read_esr() has a write in it too.
> 
> Use the new helper throughout apic.c and smpboot.c, which allows us to remove
> some useless reads of APIC_LVR.  This in turn removes the external callers of
> get_maxlvt(), so make it local to apic.c
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Just a couple of nits.

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Javi Merino <javi.merino@cloud.com>
> 
> Based on Javi's patch correcting error_interrupt()
> 
> Bloat-o-meter reports:
> 
>   add/remove: 0/1 grow/shrink: 0/3 up/down: 0/-269 (-269)
>   Function                                     old     new   delta
>   get_maxlvt                                    48       -     -48
>   __cpu_up                                    1465    1417     -48
>   clear_local_APIC                            1109    1050     -59
>   setup_local_APIC                             942     828    -114
> ---
>  xen/arch/x86/apic.c             | 29 ++++++++++-------------------
>  xen/arch/x86/include/asm/apic.h | 24 +++++++++++++++++++++++-
>  xen/arch/x86/smpboot.c          | 17 ++++-------------
>  3 files changed, 37 insertions(+), 33 deletions(-)
> 
> diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
> index b4f542d25918..017d97054b06 100644
> --- a/xen/arch/x86/apic.c
> +++ b/xen/arch/x86/apic.c
> @@ -142,7 +142,7 @@ int get_physical_broadcast(void)
>          return 0xf;
>  }
>  
> -int get_maxlvt(void)
> +static int get_maxlvt(void)

I think returning unsigned would be more natural here, IMO uint8_t
would also be fine since it's the size of the field.

>  {
>      unsigned int v = apic_read(APIC_LVR);
>  
> @@ -209,9 +209,7 @@ void clear_local_APIC(void)
>          apic_write(APIC_LDR, v);
>      }
>  
> -    if (maxlvt > 3)        /* Due to Pentium errata 3AP and 11AP. */
> -        apic_write(APIC_ESR, 0);
> -    apic_read(APIC_ESR);
> +    apic_read_esr();
>  }
>  
>  void __init connect_bsp_APIC(void)
> @@ -488,7 +486,7 @@ static void resume_x2apic(void)
>  
>  void setup_local_APIC(bool bsp)
>  {
> -    unsigned long oldvalue, value, maxlvt;
> +    unsigned long oldvalue, value;

uint32_t would possibly be better here, since those are used to store
the contents of a register, but would need changes in the print
formatters.

>      int i, j;
>  
>      BUILD_BUG_ON((SPURIOUS_APIC_VECTOR & 0x0f) != 0x0f);
> @@ -614,17 +612,13 @@ void setup_local_APIC(bool bsp)
>          value = APIC_DM_NMI | APIC_LVT_MASKED;
>      apic_write(APIC_LVT1, value);
>  
> -    maxlvt = get_maxlvt();
> -    if (maxlvt > 3)     /* Due to the Pentium erratum 3AP. */
> -        apic_write(APIC_ESR, 0);
> -    oldvalue = apic_read(APIC_ESR);
> +    oldvalue = apic_read_esr();
>  
>      value = ERROR_APIC_VECTOR;      // enables sending errors
>      apic_write(APIC_LVTERR, value);
> -    /* spec says clear errors after enabling vector. */
> -    if (maxlvt > 3)
> -        apic_write(APIC_ESR, 0);
> -    value = apic_read(APIC_ESR);
> +
> +    value = apic_read_esr();
> +
>      if (value != oldvalue)
>          apic_printk(APIC_VERBOSE,
>                      "ESR value before enabling vector: %#lx  after: %#lx\n",
> @@ -719,11 +713,9 @@ int lapic_resume(void)
>      apic_write(APIC_LVTT, apic_pm_state.apic_lvtt);
>      apic_write(APIC_TDCR, apic_pm_state.apic_tdcr);
>      apic_write(APIC_TMICT, apic_pm_state.apic_tmict);
> -    apic_write(APIC_ESR, 0);
> -    apic_read(APIC_ESR);
> +    apic_read_esr();
>      apic_write(APIC_LVTERR, apic_pm_state.apic_lvterr);
> -    apic_write(APIC_ESR, 0);
> -    apic_read(APIC_ESR);
> +    apic_read_esr();
>      local_irq_restore(flags);
>      return 0;
>  }
> @@ -1389,8 +1381,7 @@ static void cf_check error_interrupt(void)
>      unsigned int i;
>  
>      /* First tickle the hardware, only then report what went on. -- REW */

I think the comment can be removed now, as there's no "tickle" in this
context anymore?

> -    apic_write(APIC_ESR, 0);
> -    v = apic_read(APIC_ESR);
> +    v = apic_read_esr();
>      ack_APIC_irq();
>  
>      for ( i = 0; i < ARRAY_SIZE(entries); ++i )
> diff --git a/xen/arch/x86/include/asm/apic.h b/xen/arch/x86/include/asm/apic.h
> index d8eda6df6d86..337eb5cf6642 100644
> --- a/xen/arch/x86/include/asm/apic.h
> +++ b/xen/arch/x86/include/asm/apic.h
> @@ -151,6 +151,29 @@ static inline u32 get_apic_id(void)
>      return x2apic_enabled ? id : GET_xAPIC_ID(id);
>  }
>  
> +static inline uint32_t apic_read_esr(void)
> +{
> +    /*
> +     * The SDM states:
> +     *   Before attempt to read from the ESR, software should first write to
> +     *   it. (The value written does not affect the values read subsequently;
> +     *   only zero may be written in x2APIC mode.) This write clears any
> +     *   previously logged errors and updates the ESR with any errors detected
> +     *   since the last write to the ESR. This write also rearms the APIC
> +     *   error interrupt triggering mechanism.
> +     */
> +    if ( x2apic_enabled )
> +    {
> +        apic_wrmsr(APIC_ESR, 0);
> +        return apic_rdmsr(APIC_ESR);
> +    }
> +    else

There's no need for the else case if the previous branch unconditionally
ends with a return.  Can reduce indentation.

> +    {
> +        apic_mem_write(APIC_ESR, 0);
> +        return apic_mem_read(APIC_ESR);
> +    }
> +}
> +
>  void apic_wait_icr_idle(void);
>  
>  int get_physical_broadcast(void);
> @@ -161,7 +184,6 @@ static inline void ack_APIC_irq(void)
>  	apic_write(APIC_EOI, 0);
>  }
>  
> -extern int get_maxlvt(void);
>  extern void clear_local_APIC(void);
>  extern void connect_bsp_APIC (void);
>  extern void disconnect_bsp_APIC (int virt_wire_setup);
> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
> index 79a79c54c304..7c77125fe715 100644
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -422,7 +422,7 @@ void asmlinkage start_secondary(void *unused)
>  static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
>  {
>      unsigned long send_status = 0, accept_status = 0;
> -    int maxlvt, timeout, i;
> +    int timeout, i;

You could make those unsigned I believe.

Thanks, Roger.

