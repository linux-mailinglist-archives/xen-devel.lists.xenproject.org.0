Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC6C2D739A
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 11:13:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50306.88923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knfQl-0005ZA-HW; Fri, 11 Dec 2020 10:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50306.88923; Fri, 11 Dec 2020 10:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knfQl-0005YW-DF; Fri, 11 Dec 2020 10:13:43 +0000
Received: by outflank-mailman (input) for mailman id 50306;
 Fri, 11 Dec 2020 10:13:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=riDw=FP=linux.intel.com=tvrtko.ursulin@srs-us1.protection.inumbo.net>)
 id 1knfQj-0005Xv-5B
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 10:13:41 +0000
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c62624c6-125c-4083-ae3a-8b632c09ba5d;
 Fri, 11 Dec 2020 10:13:40 +0000 (UTC)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 02:13:38 -0800
Received: from ynaki-mobl1.ger.corp.intel.com (HELO [10.214.252.46])
 ([10.214.252.46])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 02:13:24 -0800
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
X-Inumbo-ID: c62624c6-125c-4083-ae3a-8b632c09ba5d
IronPort-SDR: MgrogHbCDcqKd4MJcKL5V92Lj0EAhxjNUtf16Ksen8CIJC2PbPspAJEp6RSXlKS1bIqBbDWp3Z
 /5x64WaKNpFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="173644269"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; 
   d="scan'208";a="173644269"
IronPort-SDR: RsQ7lmI/Ay9vaPccFC88f8JfxCXrqcVSXV/MMPaui8twEB+RtpNdJLZX44RdUN4vBcYtBFso8b
 xcHG9HzNR9pw==
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; 
   d="scan'208";a="321689328"
Subject: Re: [patch 14/30] drm/i915/pmu: Replace open coded kstat_irqs() copy
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, afzal mohammed <afzal.mohd.ma@gmail.com>,
 linux-parisc@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Wambui Karuga <wambui.karugax@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, Jon Mason <jdmason@kudzu.us>,
 Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
 linux-ntb@googlegroups.com, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-pci@vger.kernel.org,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Tariq Toukan <tariqt@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, linux-rdma@vger.kernel.org,
 Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20201210192536.118432146@linutronix.de>
 <20201210194043.957046529@linutronix.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <ad05af1a-5463-2a80-0887-7629721d6863@linux.intel.com>
Date: Fri, 11 Dec 2020 10:13:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201210194043.957046529@linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 10/12/2020 19:25, Thomas Gleixner wrote:
> Driver code has no business with the internals of the irq descriptor.
> 
> Aside of that the count is per interrupt line and therefore takes
> interrupts from other devices into account which share the interrupt line
> and are not handled by the graphics driver.
> 
> Replace it with a pmu private count which only counts interrupts which
> originate from the graphics card.
> 
> To avoid atomics or heuristics of some sort make the counter field
> 'unsigned long'. That limits the count to 4e9 on 32bit which is a lot and
> postprocessing can easily deal with the occasional wraparound.

After my failed hasty sketch from last night I had a different one which 
was kind of heuristics based (re-reading the upper dword and retrying if 
it changed on 32-bit). But you are right - it is okay to at least start 
like this today and if later there is a need we can either do that or 
deal with wrap at PMU read time.

So thanks for dealing with it, some small comments below but overall it 
is fine.

> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/i915/i915_irq.c |   34 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/i915/i915_pmu.c |   18 +-----------------
>   drivers/gpu/drm/i915/i915_pmu.h |    8 ++++++++
>   3 files changed, 43 insertions(+), 17 deletions(-)
> 
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -60,6 +60,24 @@
>    * and related files, but that will be described in separate chapters.
>    */
>   
> +/*
> + * Interrupt statistic for PMU. Increments the counter only if the
> + * interrupt originated from the the GPU so interrupts from a device which
> + * shares the interrupt line are not accounted.
> + */
> +static inline void pmu_irq_stats(struct drm_i915_private *priv,

We never use priv as a local name, it should be either i915 or dev_priv.

> +				 irqreturn_t res)
> +{
> +	if (unlikely(res != IRQ_HANDLED))
> +		return;
> +
> +	/*
> +	 * A clever compiler translates that into INC. A not so clever one
> +	 * should at least prevent store tearing.
> +	 */
> +	WRITE_ONCE(priv->pmu.irq_count, priv->pmu.irq_count + 1);

Curious, probably more educational for me - given x86_32 and x86_64, and 
the context of it getting called, what is the difference from just doing 
irq_count++?

> +}
> +
>   typedef bool (*long_pulse_detect_func)(enum hpd_pin pin, u32 val);
>   
>   static const u32 hpd_ilk[HPD_NUM_PINS] = {
> @@ -1599,6 +1617,8 @@ static irqreturn_t valleyview_irq_handle
>   		valleyview_pipestat_irq_handler(dev_priv, pipe_stats);
>   	} while (0);
>   
> +	pmu_irq_stats(dev_priv, ret);
> +
>   	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>   
>   	return ret;
> @@ -1676,6 +1696,8 @@ static irqreturn_t cherryview_irq_handle
>   		valleyview_pipestat_irq_handler(dev_priv, pipe_stats);
>   	} while (0);
>   
> +	pmu_irq_stats(dev_priv, ret);
> +
>   	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>   
>   	return ret;
> @@ -2103,6 +2125,8 @@ static irqreturn_t ilk_irq_handler(int i
>   	if (sde_ier)
>   		raw_reg_write(regs, SDEIER, sde_ier);
>   
> +	pmu_irq_stats(i915, ret);
> +
>   	/* IRQs are synced during runtime_suspend, we don't require a wakeref */
>   	enable_rpm_wakeref_asserts(&i915->runtime_pm);
>   
> @@ -2419,6 +2443,8 @@ static irqreturn_t gen8_irq_handler(int
>   
>   	gen8_master_intr_enable(regs);
>   
> +	pmu_irq_stats(dev_priv, IRQ_HANDLED);
> +
>   	return IRQ_HANDLED;
>   }
>   
> @@ -2514,6 +2540,8 @@ static __always_inline irqreturn_t
>   
>   	gen11_gu_misc_irq_handler(gt, gu_misc_iir);
>   
> +	pmu_irq_stats(i915, IRQ_HANDLED);
> +
>   	return IRQ_HANDLED;
>   }
>   
> @@ -3688,6 +3716,8 @@ static irqreturn_t i8xx_irq_handler(int
>   		i8xx_pipestat_irq_handler(dev_priv, iir, pipe_stats);
>   	} while (0);
>   
> +	pmu_irq_stats(dev_priv, ret);
> +
>   	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>   
>   	return ret;
> @@ -3796,6 +3826,8 @@ static irqreturn_t i915_irq_handler(int
>   		i915_pipestat_irq_handler(dev_priv, iir, pipe_stats);
>   	} while (0);
>   
> +	pmu_irq_stats(dev_priv, ret);
> +
>   	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>   
>   	return ret;
> @@ -3941,6 +3973,8 @@ static irqreturn_t i965_irq_handler(int
>   		i965_pipestat_irq_handler(dev_priv, iir, pipe_stats);
>   	} while (0);
>   
> +	pmu_irq_stats(dev_priv, IRQ_HANDLED);
> +
>   	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>   
>   	return ret;
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -423,22 +423,6 @@ static enum hrtimer_restart i915_sample(
>   	return HRTIMER_RESTART;
>   }

In this file you can also drop the #include <linux/irq.h> line.

>   
> -static u64 count_interrupts(struct drm_i915_private *i915)
> -{
> -	/* open-coded kstat_irqs() */
> -	struct irq_desc *desc = irq_to_desc(i915->drm.pdev->irq);
> -	u64 sum = 0;
> -	int cpu;
> -
> -	if (!desc || !desc->kstat_irqs)
> -		return 0;
> -
> -	for_each_possible_cpu(cpu)
> -		sum += *per_cpu_ptr(desc->kstat_irqs, cpu);
> -
> -	return sum;
> -}
> -
>   static void i915_pmu_event_destroy(struct perf_event *event)
>   {
>   	struct drm_i915_private *i915 =
> @@ -581,7 +565,7 @@ static u64 __i915_pmu_event_read(struct
>   				   USEC_PER_SEC /* to MHz */);
>   			break;
>   		case I915_PMU_INTERRUPTS:
> -			val = count_interrupts(i915);
> +			val = READ_ONCE(pmu->irq_count);

I guess same curiosity about READ_ONCE like in the increment site.

>   			break;
>   		case I915_PMU_RC6_RESIDENCY:
>   			val = get_rc6(&i915->gt);
> --- a/drivers/gpu/drm/i915/i915_pmu.h
> +++ b/drivers/gpu/drm/i915/i915_pmu.h
> @@ -108,6 +108,14 @@ struct i915_pmu {
>   	 */
>   	ktime_t sleep_last;
>   	/**
> +	 * @irq_count: Number of interrupts
> +	 *
> +	 * Intentionally unsigned long to avoid atomics or heuristics on 32bit.
> +	 * 4e9 interrupts are a lot and postprocessing can really deal with an
> +	 * occasional wraparound easily. It's 32bit after all.
> +	 */
> +	unsigned long irq_count;
> +	/**
>   	 * @events_attr_group: Device events attribute group.
>   	 */
>   	struct attribute_group events_attr_group;
> 

Regards,

Tvrtko

