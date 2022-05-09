Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CA7520271
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 18:28:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324685.546845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no6EQ-00073N-Fs; Mon, 09 May 2022 16:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324685.546845; Mon, 09 May 2022 16:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no6EQ-000704-Bl; Mon, 09 May 2022 16:27:34 +0000
Received: by outflank-mailman (input) for mailman id 324685;
 Mon, 09 May 2022 16:27:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11C1=VR=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1no6EN-0006zx-QF
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 16:27:33 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eaa26e73-cfb4-11ec-8fc4-03012f2f19d4;
 Mon, 09 May 2022 18:27:28 +0200 (CEST)
Received: from [177.183.162.244] (helo=[192.168.0.5])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1no6Dc-0008Ch-Cc; Mon, 09 May 2022 18:26:44 +0200
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
X-Inumbo-ID: eaa26e73-cfb4-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9i+OK+B4WtRAOc8WSMPsYke6rlZ4xBWZoesmtMxOiqA=; b=GajbuIp7qtfA1gL+RPS2SXW7q0
	Vraxp03Er1/ulBPczR4jeK2gXNYw1QHwX+65lsLXsgoQAcIdxZGe/+WWRC335caKoXycxD0Z3x4PP
	PCChOAEvQHFR3h4UawQfb9N6Z8knUowIzg0/dNyhzWus6YExYHQOg3lgx3zNijxQY/5UEVyTsU5Ee
	oRSolpioMk06T89IZHAQg91xzRBm4fNuENY64OTsnaWwgm+PjfUORhXl2iNP0+mT/pErDsk4F7R+0
	xGrr2cJy2Cu50umiX4PUdpi4rNkK5XT6AYQf77hlh8AUJqbCwwyU3G8+vIO6rDA82b9ywoWo/D9EX
	Ws9UFdfQ==;
Message-ID: <e4c71307-d59c-fec8-1fef-f67b86d5fb07@igalia.com>
Date: Mon, 9 May 2022 13:26:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 09/30] coresight: cpu-debug: Replace mutex with
 mutex_trylock on panic notifier
Content-Language: en-US
To: Suzuki K Poulose <suzuki.poulose@arm.com>, akpm@linux-foundation.org,
 bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 coresight@lists.linaro.org, linuxppc-dev@lists.ozlabs.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org,
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
 vkuznets@redhat.com, will@kernel.org, Leo Yan <leo.yan@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Mike Leach <mike.leach@linaro.org>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-10-gpiccoli@igalia.com>
 <3cafe4fd-8a0b-2633-44a3-2995abd6c38c@arm.com>
 <65f24bc5-2211-0139-ee12-b2608e81ceb1@igalia.com>
 <d9ec6f31-6125-0723-b7d7-5898abeb3289@arm.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <d9ec6f31-6125-0723-b7d7-5898abeb3289@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/05/2022 13:14, Suzuki K Poulose wrote:
> [...]> 
> I have queued this to coresight/next.
> 
> Thanks
> Suzuki


Thanks a lot Suzuki!

