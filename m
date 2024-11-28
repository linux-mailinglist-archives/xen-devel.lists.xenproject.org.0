Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8220F9DB4BC
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 10:26:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845184.1260648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGamr-0003yG-K4; Thu, 28 Nov 2024 09:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845184.1260648; Thu, 28 Nov 2024 09:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGamr-0003wB-HY; Thu, 28 Nov 2024 09:26:13 +0000
Received: by outflank-mailman (input) for mailman id 845184;
 Thu, 28 Nov 2024 09:26:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2vEu=SX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tGamp-0003w5-Mm
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 09:26:11 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cba90656-ad6a-11ef-a0cd-8be0dac302b0;
 Thu, 28 Nov 2024 10:26:06 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5ced377447bso998708a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2024 01:26:06 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d098894a02sm470976a12.25.2024.11.28.01.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 01:26:05 -0800 (PST)
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
X-Inumbo-ID: cba90656-ad6a-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzIiLCJoZWxvIjoibWFpbC1lZDEteDUzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImNiYTkwNjU2LWFkNmEtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzg1OTY2Ljk3NzYyOCwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732785966; x=1733390766; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CAnJAo3tGTKZjpuHv5Mt4fJ2DYTcSIoQU4NDZzheyS0=;
        b=gMAAy+ADRAKq+kd0kwKcMm/fvurcr1nQUf2Em3AeboS7lWV1P/L3k9EAsREiUYsglM
         pn/MdrRyy1KbJT3MUZvs4Deec+Fg3Tz1hOVdZiR5z8sftKRQXKdGOpfGjK7ptZ/uZmAx
         4DQpFnP5hzGLTIk7YAmmD0c4BAnOrgciAkRPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732785966; x=1733390766;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CAnJAo3tGTKZjpuHv5Mt4fJ2DYTcSIoQU4NDZzheyS0=;
        b=dvH9q+3w2tfXSQmGAaPuOFTxjWxIJfuz6Obkz4YrnHEni9ratZ82QkamlRU6hqRJhF
         8ytcy60KBFKau7CGB2pM/Hy/Xp64UcjTrBHu0M+DGdyVdE38C4wE71JFlcK1LOZ+d1tA
         9x9FN2z7LleN34G9prGC4bBVWtm4CkztBjSEES1QYbhyutbT14VrqjLbcfJhdwpSlrq1
         mFuQkXNUkqsrwvs65PtV/CR+6VKRGZZKwz+Zkh9UMBpuSocFwm1qMPYIuLsgPZXrCooB
         yz5RMUDJbFRKBG5RAqepRRJUh7DbjXWrymlejGNAcMKvcVYp2VhMSSy09W5KGXvXo/OK
         tmyA==
X-Gm-Message-State: AOJu0YyHg1qKyK3jLZxiftju1HGZ7KLySapzFy1+0CQNdxWvgOdJzBZd
	hEbC/M7n0qMbsmy+3YckQ672WJ8htV4L4Q+pEcUQ7rTS+1JiMOTZbgvKHhATk2w=
X-Gm-Gg: ASbGnctuuHmio/2qc0jaf3ex9+hJc60gKaB8g8dCD3Zks0TGKB5jB192KDnhmuE/a5W
	KvL3SsTzuYP+f4q+GKIxIlA7OJd5qaaqx4BUVSDdlIABZaSxusba59DG+7uJs12piIc7jjJz9Mb
	Hv8NLLmicoQoN8u2pQJfg1DOwS3uSje8+EAmiJIjFprbNgn0NgkZCOXsUxKTXANJ+KRbc57M1kW
	24Xy+szExGw4i1EN5DQ1ymF/CbDsWDhzVf0av6RVm4NgUJ2ecL7OncnCBA=
X-Google-Smtp-Source: AGHT+IGamuOqR1l919RuGaNLXDmH+HFm//ZKsToTHlKOX3RiI7Q1ttczdtROMa2QoDo7iECQXRDxRw==
X-Received: by 2002:a05:6402:518c:b0:5d0:9588:9744 with SMTP id 4fb4d7f45d1cf-5d09588a276mr2130685a12.29.1732785966247;
        Thu, 28 Nov 2024 01:26:06 -0800 (PST)
Date: Thu, 28 Nov 2024 10:26:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] x86/vlapic: Drop vlapic->esr_lock
Message-ID: <Z0g3LBzM-8ox5dAW@macbook>
References: <20241128004737.283521-1-andrew.cooper3@citrix.com>
 <20241128004737.283521-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241128004737.283521-3-andrew.cooper3@citrix.com>

On Thu, Nov 28, 2024 at 12:47:37AM +0000, Andrew Cooper wrote:
> With vlapic->hw.pending_esr held outside of the main regs page, it's much
> easier to use atomic operations.
> 
> Use xchg() in vlapic_reg_write(), and *set_bit() in vlapic_error().
> 
> The only interesting change is that vlapic_error() now needs to take an
> err_bit rather than an errmask, but thats fine for all current callers and
> forseable changes.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> It turns out that XSA-462 had an indentation bug in it.
> 
> Our spinlock infrastructure is obscenely large.  Bloat-o-meter reports:
> 
>   add/remove: 0/0 grow/shrink: 0/3 up/down: 0/-111 (-111)
>   Function                                     old     new   delta
>   vlapic_init                                  208     190     -18
>   vlapic_error                                 112      67     -45
>   vlapic_reg_write                            1145    1097     -48
> 
> In principle we could revert the XSA-462 patch now, and remove the LVTERR
> vector handling special case.  MISRA is going to complain either way, because
> it will see the cycle through vlapic_set_irq() without considering the
> surrounding logic.
> ---
>  xen/arch/x86/hvm/vlapic.c             | 32 ++++++---------------------
>  xen/arch/x86/include/asm/hvm/vlapic.h |  1 -
>  2 files changed, 7 insertions(+), 26 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 98394ed26a52..f41a5d4619bb 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -102,14 +102,9 @@ static int vlapic_find_highest_irr(struct vlapic *vlapic)
>      return vlapic_find_highest_vector(&vlapic->regs->data[APIC_IRR]);
>  }
>  
> -static void vlapic_error(struct vlapic *vlapic, unsigned int errmask)
> +static void vlapic_error(struct vlapic *vlapic, unsigned int err_bit)

Having to use ilog2() in the callers is kind of ugly.  I would rather
keep the same function parameter (a mask), and then either assert that
it only has one bit set, or iterate over all possible set bits on the
mask.

I assume you had a preference for doing it at the caller because it
would then be done by the preprocessor as the passed values are
macros.  Maybe we could add a wrapper about it:

static void vlapic_set_error_bit(struct vlapic *vlapic, unsigned int bit)
{ ... }

#define vlapic_error(v, m) ({         \
    BUILD_BUG_ON((m) & ((m) - 1));    \
    vlapic_set_error_bit(v, ilog2(m));\
})


>  {
> -    unsigned long flags;
> -    uint32_t esr;
> -
> -    spin_lock_irqsave(&vlapic->esr_lock, flags);
> -    esr = vlapic->hw.pending_esr;
> -    if ( (esr & errmask) != errmask )
> +    if ( !test_and_set_bit(err_bit, &vlapic->hw.pending_esr) )
>      {
>          uint32_t lvterr = vlapic_get_reg(vlapic, APIC_LVTERR);
>          bool inj = false;
> @@ -124,15 +119,12 @@ static void vlapic_error(struct vlapic *vlapic, unsigned int errmask)
>              if ( (lvterr & APIC_VECTOR_MASK) >= 16 )
>                   inj = true;

The line above also has bogus indentation.

Thanks, Roger.

