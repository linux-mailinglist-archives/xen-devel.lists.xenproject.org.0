Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E2E52D257
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 14:21:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332887.556664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrf99-0002WH-I0; Thu, 19 May 2022 12:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332887.556664; Thu, 19 May 2022 12:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrf99-0002UP-Dn; Thu, 19 May 2022 12:20:51 +0000
Received: by outflank-mailman (input) for mailman id 332887;
 Thu, 19 May 2022 12:20:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YazC=V3=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nrf98-0002NI-54
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 12:20:50 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1af77b2b-d76e-11ec-837e-e5687231ffcc;
 Thu, 19 May 2022 14:20:44 +0200 (CEST)
Received: from 200-161-159-120.dsl.telesp.net.br ([200.161.159.120]
 helo=[192.168.1.60]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nrf8d-00BEVm-Gn; Thu, 19 May 2022 14:20:19 +0200
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
X-Inumbo-ID: 1af77b2b-d76e-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=e6xrJm1a3ay+4weLnrCkh2SRSEeyZycIIB/twweqf9Y=; b=BhOEtl3IEpq+ZutVgH7P2rHsfA
	mhGkC2PSuDrVyQ8IQfXtbB2pfD2fLPqKTP1L2vPLew3hLPbkforpZGHUalxvr86M8T2G/zNh0P/pw
	wi++cJ5XXfisCo4sQPAYOpaVMhBvNWB3svhNAgbQKxYFPy0Oeko+Z9jhUOVMogS4VQkCRHPLo2bnq
	jjqxb69zYzPORFRcZZlayXhHSqDz7B+6f3XjEVdBQ2ftzK2PDz+TwQa11JztdT1Ouzc0j+U1m1POY
	rbklHHuyIwI+fwGIyQbgwTEldlCv1PEui/a5Qzds7nWr2ZDdu+bcGybfUaDSvUQ/88wOr+qjGKQ2s
	3BFZ9Urg==;
Message-ID: <edbaa4fa-561c-6f5e-f2ab-43ae68acaede@igalia.com>
Date: Thu, 19 May 2022 09:19:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 19/30] panic: Add the panic hypervisor notifier list
Content-Language: en-US
To: Scott Branden <scott.branden@broadcom.com>, Petr Mladek
 <pmladek@suse.com>, Sebastian Reichel <sre@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Desmond yan <desmond.yan@broadcom.com>
Cc: David Gow <davidgow@google.com>, Evan Green <evgreen@chromium.org>,
 Julius Werner <jwerner@chromium.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-pm@vger.kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-um@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org,
 kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com,
 fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com,
 andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de,
 corbet@lwn.net, d.hatayama@jp.fujitsu.com, dave.hansen@linux.intel.com,
 dyoung@redhat.com, feng.tang@intel.com, gregkh@linuxfoundation.org,
 mikelley@microsoft.com, hidehiro.kawai.ez@hitachi.com, jgross@suse.com,
 john.ogness@linutronix.de, keescook@chromium.org, luto@kernel.org,
 mhiramat@kernel.org, mingo@redhat.com, paulmck@kernel.org,
 peterz@infradead.org, rostedt@goodmis.org, senozhatsky@chromium.org,
 stern@rowland.harvard.edu, tglx@linutronix.de, vgoyal@redhat.com,
 vkuznets@redhat.com, will@kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andrea Parri <parri.andrea@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 "David S. Miller" <davem@davemloft.net>, Dexuan Cui <decui@microsoft.com>,
 Doug Berger <opendmb@gmail.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Justin Chen <justinpopo6@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Lee Jones <lee.jones@linaro.org>, Markus Mayer <mmayer@broadcom.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Mihai Carabas <mihai.carabas@oracle.com>, Nicholas Piggin
 <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Pavel Machek <pavel@ucw.cz>, Shile Zhang <shile.zhang@linux.alibaba.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Wang ShaoBo <bobo.shaobowang@huawei.com>, Wei Liu <wei.liu@kernel.org>,
 zhenwei pi <pizhenwei@bytedance.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-20-gpiccoli@igalia.com> <YoJZVZl/MH0KiE/J@alley>
 <ad082ce7-db50-13bb-3dbb-9b595dfa78be@igalia.com> <YoOpyW1+q+Z5as78@alley>
 <d72b9aab-675c-ac89-b73a-b1de4a0b722d@igalia.com>
 <81878a67-21f1-fee8-1add-f381bc8b05df@broadcom.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <81878a67-21f1-fee8-1add-f381bc8b05df@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/05/2022 19:17, Scott Branden wrote:
> Hi Guilherme,
> 
> +Desmond
> [...] 
>>>> I'm afraid it breaks kdump if this device is not reset beforehand - it's
>>>> a doorbell write, so not high risk I think...
>>>>
>>>> But in case the not-reset device can be probed normally in kdump kernel,
>>>> then I'm fine in moving this to the reboot list! I don't have the HW to
>>>> test myself.
>>>
>>> Good question. Well, it if has to be called before kdump then
>>> even "hypervisor" list is a wrong place because is not always
>>> called before kdump.
>> [...]
> We register to the panic notifier so that we can kill the VK card ASAP
> to stop DMAing things over to the host side.  If it is not notified then
> memory may not be frozen when kdump is occurring.
> Notifying the card on panic is also needed to allow for any type of 
> reset to occur.
> 
> So, the only thing preventing moving the notifier later is the chance
> that memory is modified while kdump is occurring.  Or, if DMA is 
> disabled before kdump already then this wouldn't be an issue and the 
> notification to the card (to allow for clean resets) can be done later.

Hi Scott / Desmond, thanks for the detailed answer! Is this adapter
designed to run in x86 only or you have other architectures' use cases?

I'm not expert on that, but I guess whether DMA is "kept" or not depends
a bit if IOMMU is used. IIRC, there was a copy of the DMAR table in
kdump (at least for Intel IOMMU). Also, devices are not properly
quiesced on kdump IIUC, we don't call shutdown/reset handlers, they're
skip due to the crash nature - so there is a risk of devices doing bad
things in the new kernel.

With that said, and given this is a lightweight notifier that ideally
should run ASAP, I'd keep this one in the hypervisor list. We can
"adjust" the semantic of this list to include lightweight notifiers that
reset adapters.

With that said, Petr has a point - not always such list is going to be
called before kdump. So, that makes me think in another idea: what if we
have another list, but not on panic path, but instead in the custom
crash_shutdown()? Drivers could add callbacks there that must execute
before kexec/kdump, no matter what.

Let me know your thoughts Scott / Desmond / Petr and all interested parties.
Cheers,


Guilherme

