Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 343722E3293
	for <lists+xen-devel@lfdr.de>; Sun, 27 Dec 2020 20:21:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59290.104144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktbb4-0002ir-1S; Sun, 27 Dec 2020 19:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59290.104144; Sun, 27 Dec 2020 19:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktbb3-0002iS-UM; Sun, 27 Dec 2020 19:20:53 +0000
Received: by outflank-mailman (input) for mailman id 59290;
 Sun, 27 Dec 2020 19:20:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yGTU=F7=gmail.com=groeck7@srs-us1.protection.inumbo.net>)
 id 1ktbb3-0002iN-CJ
 for xen-devel@lists.xenproject.org; Sun, 27 Dec 2020 19:20:53 +0000
Received: from mail-ot1-x330.google.com (unknown [2607:f8b0:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 934ec2cd-2fcd-427a-9816-676897cb42da;
 Sun, 27 Dec 2020 19:20:52 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id d8so7587456otq.6
 for <xen-devel@lists.xenproject.org>; Sun, 27 Dec 2020 11:20:52 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id v17sm8555011oou.41.2020.12.27.11.20.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 27 Dec 2020 11:20:50 -0800 (PST)
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
X-Inumbo-ID: 934ec2cd-2fcd-427a-9816-676897cb42da
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0sVC8j/qFLW+R/BiCcbxfbFuWt0QadRRyfbTVS1VwHY=;
        b=snNRM2UJuxFlYbt0opdNq/Km+jTrugWz+XCv9dvNVL/debD4RiSNjJuvvfbPHP8li7
         KIhX0/QgOmUeidxtdeZSEin831Gb4MPxK/Nsdy82P6kpVKu6N4Nc/2a1j/rhKSYYtPfM
         OdujcskdH0zj17962B4EA6DAWt+WbPQDoOQkCV+q0RBuHOc2AwsMveKzxEy1LnZjcBm6
         WwVaL7EiOv3pK+MmaGP2Q6W+EWp/A0H6XAJ9Sli5mcOq3SMT90MXTM6BUD6s+YNQPnp0
         3oKuBMFCRu9MNXQfN7PDX/uDAX7jwXSxxMeoGH5bWQ0ZYiFJh6LgmVaIuZavb11TOu03
         Stkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=0sVC8j/qFLW+R/BiCcbxfbFuWt0QadRRyfbTVS1VwHY=;
        b=CTXaTPG7IIOLrbKkXdBAH+TZxv+Q4h2AJmeoH5i7CNKovyL1NoN5p9p0TiZnPuI6ja
         y949OJqvy/IFNLHlXjflCDUuI3BEOxbWXz20DoD23uRGEIickxPD7MzIseuH2N3QnY/j
         1aIGaQNx30Cl48D2l+2QnRMO6KSWYfUnAubat/MrfzAoSUiqDcGAet92Mmt4f2e/0Xjo
         ORND30xb/ZzSRDjGPOnsqfUkFeb5FlaKiR7ECS7lzuYyWTXPknNwA9fBF87Xv+ansYSF
         Wpm6+gNNHA6OcJfjqfdF4MG+wormh1VaKSkfYOg4cXFmzYYZvNVMDvtyTNVVolJUV6QA
         fULQ==
X-Gm-Message-State: AOAM5337g1HitOjEW6JSIKyaDTXXkF8WYgMG8U/+ndIvuLADB4IMpcxt
	R7SY5bSWUJ3qBe89iYKRVCc=
X-Google-Smtp-Source: ABdhPJy5MA8pTqBMHg7t7kC9SkPKcTOcLW8SMiIKlPFipG2wn4l5044FI2Bd1WiObQwt+tJVlAueHQ==
X-Received: by 2002:a05:6830:cf:: with SMTP id x15mr30498943oto.55.1609096852047;
        Sun, 27 Dec 2020 11:20:52 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 27 Dec 2020 11:20:49 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	dri-devel@lists.freedesktop.org,
	Chris Wilson <chris@chris-wilson.co.uk>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Saeed Mahameed <saeedm@nvidia.com>, netdev@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>, linux-s390@vger.kernel.org,
	afzal mohammed <afzal.mohd.ma@gmail.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Dave Jiang <dave.jiang@intel.com>, xen-devel@lists.xenproject.org,
	Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>, Helge Deller <deller@gmx.de>,
	Russell King <linux@armlinux.org.uk>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	linux-pci@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Wambui Karuga <wambui.karugax@gmail.com>,
	Allen Hubbe <allenbh@gmail.com>, Juergen Gross <jgross@suse.com>,
	David Airlie <airlied@linux.ie>, linux-gpio@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lee Jones <lee.jones@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	linux-parisc@vger.kernel.org,
	Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Tariq Toukan <tariqt@nvidia.com>, Jon Mason <jdmason@kudzu.us>,
	linux-ntb@googlegroups.com, intel-gfx@lists.freedesktop.org,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [patch 02/30] genirq: Move status flag checks to core
Message-ID: <20201227192049.GA195845@roeck-us.net>
References: <20201210192536.118432146@linutronix.de>
 <20201210194042.703779349@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210194042.703779349@linutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Thu, Dec 10, 2020 at 08:25:38PM +0100, Thomas Gleixner wrote:
> These checks are used by modules and prevent the removal of the export of
> irq_to_desc(). Move the accessor into the core.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Yes, but that means that irq_check_status_bit() may be called from modules,
but it is not exported, resulting in build errors such as the following.

arm64:allmodconfig:

ERROR: modpost: "irq_check_status_bit" [drivers/perf/arm_spe_pmu.ko] undefined!

Guenter

> ---
>  include/linux/irqdesc.h |   17 +++++------------
>  kernel/irq/manage.c     |   17 +++++++++++++++++
>  2 files changed, 22 insertions(+), 12 deletions(-)
> 
> --- a/include/linux/irqdesc.h
> +++ b/include/linux/irqdesc.h
> @@ -223,28 +223,21 @@ irq_set_chip_handler_name_locked(struct
>  	data->chip = chip;
>  }
>  
> +bool irq_check_status_bit(unsigned int irq, unsigned int bitmask);
> +
>  static inline bool irq_balancing_disabled(unsigned int irq)
>  {
> -	struct irq_desc *desc;
> -
> -	desc = irq_to_desc(irq);
> -	return desc->status_use_accessors & IRQ_NO_BALANCING_MASK;
> +	return irq_check_status_bit(irq, IRQ_NO_BALANCING_MASK);
>  }
>  
>  static inline bool irq_is_percpu(unsigned int irq)
>  {
> -	struct irq_desc *desc;
> -
> -	desc = irq_to_desc(irq);
> -	return desc->status_use_accessors & IRQ_PER_CPU;
> +	return irq_check_status_bit(irq, IRQ_PER_CPU);
>  }
>  
>  static inline bool irq_is_percpu_devid(unsigned int irq)
>  {
> -	struct irq_desc *desc;
> -
> -	desc = irq_to_desc(irq);
> -	return desc->status_use_accessors & IRQ_PER_CPU_DEVID;
> +	return irq_check_status_bit(irq, IRQ_PER_CPU_DEVID);
>  }
>  
>  static inline void
> --- a/kernel/irq/manage.c
> +++ b/kernel/irq/manage.c
> @@ -2769,3 +2769,23 @@ bool irq_has_action(unsigned int irq)
>  	return res;
>  }
>  EXPORT_SYMBOL_GPL(irq_has_action);
> +
> +/**
> + * irq_check_status_bit - Check whether bits in the irq descriptor status are set
> + * @irq:	The linux irq number
> + * @bitmask:	The bitmask to evaluate
> + *
> + * Returns: True if one of the bits in @bitmask is set
> + */
> +bool irq_check_status_bit(unsigned int irq, unsigned int bitmask)
> +{
> +	struct irq_desc *desc;
> +	bool res = false;
> +
> +	rcu_read_lock();
> +	desc = irq_to_desc(irq);
> +	if (desc)
> +		res = !!(desc->status_use_accessors & bitmask);
> +	rcu_read_unlock();
> +	return res;
> +}

