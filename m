Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8E92D7DC4
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 19:12:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50823.89610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knmu2-0008Fe-Eu; Fri, 11 Dec 2020 18:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50823.89610; Fri, 11 Dec 2020 18:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knmu2-0008FF-BU; Fri, 11 Dec 2020 18:12:26 +0000
Received: by outflank-mailman (input) for mailman id 50823;
 Fri, 11 Dec 2020 18:12:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pcPH=FP=gmail.com=andy.shevchenko@srs-us1.protection.inumbo.net>)
 id 1knmu1-0008FA-FL
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 18:12:25 +0000
Received: from mail-pg1-x52a.google.com (unknown [2607:f8b0:4864:20::52a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65348a7e-327b-40e1-9d88-b9f5d3ecd324;
 Fri, 11 Dec 2020 18:12:24 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id w16so7648879pga.9
 for <xen-devel@lists.xenproject.org>; Fri, 11 Dec 2020 10:12:24 -0800 (PST)
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
X-Inumbo-ID: 65348a7e-327b-40e1-9d88-b9f5d3ecd324
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q/1zdMH3DpxGtZ8QgtITmolgonObU/7AjOPUuWKrWNo=;
        b=Pm8buLXst2LcV9x4pk4vIxyybuwSbvL97o6tQP/6i0ZC0zOJ6xhhPvOmmJHnVFkhgw
         sQfgcxJImHA+DnVZbZxb64zhatDbthp68cZ4iRaEqM/K8XSe9UZnfE94uYtkDbOOpabu
         L1rj/JPmJET4DAk/lcrawpEkrx9i3ul2i6qGlaQuFoK2UkPf+SMWdOeOPPS8QAdKSG2Q
         g24KIZVw1nm3kfJCayecl50J7bltlRshvQcWiGMUSmazoa8KfAW/iwqyejRvRxGzsh3A
         q/OBzRHzggVvK36H+lQNs9ICk+Z16dfzwLBUVGvlOwEUqmBMnCQtHV8wDQuwIxn+Jo8v
         0Yfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q/1zdMH3DpxGtZ8QgtITmolgonObU/7AjOPUuWKrWNo=;
        b=HUzHojBGCWGhBPpgV/zA3WQ2D6vjaZLwtQ3nqx60IOUJIG1dIcSX2jWSw9mkk3fDuo
         AdxvNqi5rafwV+07Iykgn01kcb/VxzlQ6sqSte6R1NhoG7VDg/tNXEyuanEdlyKl+Bs2
         7y4iVe7zZDGiuxI2PpqdLnIm4JoCA0c0tVyEGBiFb2+uwGw2wNRm1UStSWHzwKRdgDwn
         iEFXSsoYDUpMH7u5DNCcUz0Ywg5xEoa/WqLpuFB8xZV80DYA8E3a6OIChVCtyqLXKEEt
         kzPSebDKzYHRsbF5sRFNGLuuokbP5USWyYE1tgcu9mCysWUu6cnK7+PuG9QM1gNSBcJQ
         w7tw==
X-Gm-Message-State: AOAM5317bKwsAx64UINu5ehzbA84dB2HfW4tJctwkR0GVf/JWvZKkT8w
	0p9vqKU5t8W2quZW2Qyaco0iYtrSsO4J01uWeSs=
X-Google-Smtp-Source: ABdhPJzPNFm8swDHOmLl35eT5h+YQB676NTtT2BWFgfALxfYZ8r2UnWa+iJwNQSLiKZOMQcPIak2nNSo7eC4Ue1vtXA=
X-Received: by 2002:a63:4002:: with SMTP id n2mr13054398pga.4.1607710343875;
 Fri, 11 Dec 2020 10:12:23 -0800 (PST)
MIME-Version: 1.0
References: <20201210192536.118432146@linutronix.de> <20201210194044.157283633@linutronix.de>
In-Reply-To: <20201210194044.157283633@linutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 11 Dec 2020 20:12:07 +0200
Message-ID: <CAHp75Veo9aQLCp9ZuCcoexPLHM=R_PEu6uhP_P2bSpsVzyUaNQ@mail.gmail.com>
Subject: Re: [patch 16/30] mfd: ab8500-debugfs: Remove the racy fiddling with irq_desc
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Lee Jones <lee.jones@linaro.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	afzal mohammed <afzal.mohd.ma@gmail.com>, linux-parisc@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Christian Borntraeger <borntraeger@de.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, 
	Chris Wilson <chris@chris-wilson.co.uk>, Wambui Karuga <wambui.karugax@gmail.com>, 
	intel-gfx <intel-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Jon Mason <jdmason@kudzu.us>, 
	Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, linux-ntb@googlegroups.com, 
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Michal Simek <michal.simek@xilinx.com>, 
	linux-pci <linux-pci@vger.kernel.org>, 
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, 
	Tariq Toukan <tariqt@nvidia.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, netdev <netdev@vger.kernel.org>, 
	"open list:HFI1 DRIVER" <linux-rdma@vger.kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 10, 2020 at 9:57 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> First of all drivers have absolutely no business to dig into the internals
> of an irq descriptor. That's core code and subject to change. All of this
> information is readily available to /proc/interrupts in a safe and race
> free way.
>
> Remove the inspection code which is a blatant violation of subsystem
> boundaries and racy against concurrent modifications of the interrupt
> descriptor.
>
> Print the irq line instead so the information can be looked up in a sane
> way in /proc/interrupts.

...

> -               seq_printf(s, "%3i:  %6i %4i",
> +               seq_printf(s, "%3i:  %6i %4i %4i\n",

Seems different specifiers, I think the intention was something like
               seq_printf(s, "%3i:  %4i %6i %4i\n",

>                            line,
> +                          line + irq_first,
>                            num_interrupts[line],
>                            num_wake_interrupts[line]);


-- 
With Best Regards,
Andy Shevchenko

