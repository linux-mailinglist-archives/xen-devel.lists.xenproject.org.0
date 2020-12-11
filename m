Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD322D81E2
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 23:22:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50955.89829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knqnH-0000fE-KM; Fri, 11 Dec 2020 22:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50955.89829; Fri, 11 Dec 2020 22:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knqnH-0000ep-Gv; Fri, 11 Dec 2020 22:21:43 +0000
Received: by outflank-mailman (input) for mailman id 50955;
 Fri, 11 Dec 2020 22:21:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nv6e=FP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1knqnG-0000ek-B3
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 22:21:42 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0884bbe5-0e28-4ced-a7a7-41fb5a21ab23;
 Fri, 11 Dec 2020 22:21:40 +0000 (UTC)
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
X-Inumbo-ID: 0884bbe5-0e28-4ced-a7a7-41fb5a21ab23
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607725300;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=SlMSeRdV/lwxDX3djLyqBMWP9qBV06XtN2qLgsx2f6c=;
  b=VCYhqaHM2dBvS/Cww6DttZnDNb+r9wMY4QQ3V77rWPcFBQw3q6eDHD3I
   sp5mQ4sF1YKOKP+qvKsorBoAjWBDA4cKuNlVWBBXzIM2jk8jKJdSuG2eC
   y9MPUMRl4FZKzVT0zbufW64bf4SNgrq2lafFJNFo4JE10e9Zcq+YpE5we
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: zxKa8rgyFeg2y8fCG3oi7VnW2gUpr9OYlkvCF/sBtRwerKcGUj3U846xesB6P0sd8TbXpQL30D
 M+yqnl9FyOSn4AVTQICd1n20O7aUuBZJHO1hO49Y7WMuixViLEiIv7JOWQDh2eVZ9soCVAFoQW
 vfrc7AECE95KCs5m0z0M9zvfWWGUs6ClwL+l6kwP1ibvxZE1mGugR63NagsSn+AjDypKzJbLJy
 9z6mlpc3fKmjPgHdEEba0IFcfG0cgQo5L6XZQsW65QXYXuCPJHzmXpVX8QCySh2BtbtSv6z0yL
 eso=
X-SBRS: 5.2
X-MesageID: 33047865
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,412,1599537600"; 
   d="scan'208";a="33047865"
Subject: Re: [patch 27/30] xen/events: Only force affinity mask for percpu
 interrupts
To: Thomas Gleixner <tglx@linutronix.de>, <boris.ostrovsky@oracle.com>,
	=?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, LKML
	<linux-kernel@vger.kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>, "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "afzal
 mohammed" <afzal.mohd.ma@gmail.com>, <linux-parisc@vger.kernel.org>, "Russell
 King" <linux@armlinux.org.uk>, <linux-arm-kernel@lists.infradead.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Christian Borntraeger
	<borntraeger@de.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
	<linux-s390@vger.kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
	<rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
	<daniel@ffwll.ch>, Pankaj Bharadiya
	<pankaj.laxminarayan.bharadiya@intel.com>, Chris Wilson
	<chris@chris-wilson.co.uk>, Wambui Karuga <wambui.karugax@gmail.com>,
	<intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Tvrtko
 Ursulin" <tvrtko.ursulin@linux.intel.com>, Linus Walleij
	<linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>, Lee Jones
	<lee.jones@linaro.org>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
	<dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
	<linux-ntb@googlegroups.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "Michal
 Simek" <michal.simek@xilinx.com>, <linux-pci@vger.kernel.org>, "Karthikeyan
 Mitran" <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Tariq Toukan <tariqt@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, <netdev@vger.kernel.org>,
	<linux-rdma@vger.kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, "Leon
 Romanovsky" <leon@kernel.org>
References: <20201210192536.118432146@linutronix.de>
 <20201210194045.250321315@linutronix.de>
 <7f7af60f-567f-cdef-f8db-8062a44758ce@oracle.com>
 <2164a0ce-0e0d-c7dc-ac97-87c8f384ad82@suse.com>
 <871rfwiknd.fsf@nanos.tec.linutronix.de>
 <9806692f-24a3-4b6f-ae55-86bd66481271@oracle.com>
 <877dpoghio.fsf@nanos.tec.linutronix.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <edbedd7a-4463-d934-73c9-fa046c19cf6d@citrix.com>
Date: Fri, 11 Dec 2020 22:21:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <877dpoghio.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 11/12/2020 21:27, Thomas Gleixner wrote:
> On Fri, Dec 11 2020 at 09:29, boris ostrovsky wrote:
>
>> On 12/11/20 7:37 AM, Thomas Gleixner wrote:
>>> On Fri, Dec 11 2020 at 13:10, Jürgen Groß wrote:
>>>> On 11.12.20 00:20, boris.ostrovsky@oracle.com wrote:
>>>>> On 12/10/20 2:26 PM, Thomas Gleixner wrote:
>>>>>> Change the implementation so that the channel is bound to CPU0 at the XEN
>>>>>> level and leave the affinity mask alone. At startup of the interrupt
>>>>>> affinity will be assigned out of the affinity mask and the XEN binding will
>>>>>> be updated.
>>>>> If that's the case then I wonder whether we need this call at all and instead bind at startup time.
>>>> After some discussion with Thomas on IRC and xen-devel archaeology the
>>>> result is: this will be needed especially for systems running on a
>>>> single vcpu (e.g. small guests), as the .irq_set_affinity() callback
>>>> won't be called in this case when starting the irq.
>> On UP are we not then going to end up with an empty affinity mask? Or
>> are we guaranteed to have it set to 1 by interrupt generic code?
> An UP kernel does not ever look on the affinity mask. The
> chip::irq_set_affinity() callback is not invoked so the mask is
> irrelevant.
>
> A SMP kernel on a UP machine sets CPU0 in the mask so all is good.
>
>> This is actually why I brought this up in the first place --- a
>> potential mismatch between the affinity mask and Xen-specific data
>> (e.g. info->cpu and then protocol-specific data in event channel
>> code). Even if they are re-synchronized later, at startup time (for
>> SMP).
> Which is not a problem either. The affinity mask is only relevant for
> setting the affinity, but it's not relevant for delivery and never can
> be.
>
>> I don't see anything that would cause a problem right now but I worry
>> that this inconsistency may come up at some point.
> As long as the affinity mask becomes not part of the event channel magic
> this should never matter.
>
> Look at it from hardware:
>
> interrupt is affine to CPU0
>
>      CPU0 runs:
>      
>      set_affinity(CPU0 -> CPU1)
>         local_irq_disable()
>         
>  --> interrupt is raised in hardware and pending on CPU0
>
>         irq hardware is reconfigured to be affine to CPU1
>
>         local_irq_enable()
>
>  --> interrupt is handled on CPU0
>
> the next interrupt will be raised on CPU1
>
> So info->cpu which is registered via the hypercall binds the 'hardware
> delivery' and whenever the new affinity is written it is rebound to some
> other CPU and the next interrupt is then raised on this other CPU.
>
> It's not any different from the hardware example at least not as far as
> I understood the code.

Xen's event channels do have a couple of quirks.

Binding an event channel always results in one spurious event being
delivered.  This is to cover notifications which can get lost during the
bidirectional setup, or re-setups in certain configurations.

Binding an interdomain or pirq event channel always defaults to vCPU0. 
There is no way to atomically set the affinity while binding.  I believe
the API predates SMP guest support in Xen, and noone has fixed it up since.

As a consequence, the guest will observe the event raised on vCPU0 as
part of setting up the event, even if it attempts to set a different
affinity immediately afterwards.  A little bit of care needs to be taken
when binding an event channel on vCPUs other than 0, to ensure that the
callback is safe with respect to any remaining state needing initialisation.

Beyond this, there is nothing magic I'm aware of.

We have seen soft lockups before in certain scenarios, simply due to the
quantity of events hitting vCPU0 before irqbalance gets around to
spreading the load.  This is why there is an attempt to round-robin the
userspace event channel affinities by default, but I still don't see why
this would need custom affinity logic itself.

Thanks,

~Andrew

