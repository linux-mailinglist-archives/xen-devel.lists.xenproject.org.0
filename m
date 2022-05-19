Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AA152D218
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 14:10:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332862.556632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrexj-0007UR-UC; Thu, 19 May 2022 12:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332862.556632; Thu, 19 May 2022 12:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrexj-0007RW-Ph; Thu, 19 May 2022 12:09:03 +0000
Received: by outflank-mailman (input) for mailman id 332862;
 Thu, 19 May 2022 12:09:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YazC=V3=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nrexh-0007RQ-Vb
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 12:09:02 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7655cc7c-d76c-11ec-837e-e5687231ffcc;
 Thu, 19 May 2022 14:08:59 +0200 (CEST)
Received: from 200-161-159-120.dsl.telesp.net.br ([200.161.159.120]
 helo=[192.168.1.60]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nrewo-00BE00-NL; Thu, 19 May 2022 14:08:07 +0200
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
X-Inumbo-ID: 7655cc7c-d76c-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8Or+sigV8tAW403lBCNOcYfh+f/QtBZxoM4MtJnkEDo=; b=JqidS10tAFi8w45bv/QRWgkoh/
	KOgIwZ/tIUUpLlbLrbLO1ldSksH/br07uow35GeONuGXn9H2gl6Zc+ITyazsuepTHCwyY7cXFe/h7
	MtwjDL5RB9ZO6kq5gTfsayx//B9lueprkuY9Bysrv6zGbl5LRv1UeYThThR2djyvHZK5yH9WAOS3f
	IAvBZnCmpegeYcMo7srxsmSG31D8d5jvfPawZOHcM5Mv+NhxsgRuyQoZ7I4NYbnvdtmZ38tbx+LTT
	WmYVOrIBhGzwQtf/+4wAyIFnS+fHagBv45fyKy1zunamCTiZMunglm+e59nItrKVAlZjSL4ou4wbM
	ShGTIh/g==;
Message-ID: <73ade79a-5d76-0e68-708c-f14d3665a7d2@igalia.com>
Date: Thu, 19 May 2022 09:07:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 19/30] panic: Add the panic hypervisor notifier list
Content-Language: en-US
To: Petr Mladek <pmladek@suse.com>
Cc: David Gow <davidgow@google.com>, Evan Green <evgreen@chromium.org>,
 Julius Werner <jwerner@chromium.org>,
 Scott Branden <scott.branden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Sebastian Reichel <sre@kernel.org>,
 linux-pm@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 akpm@linux-foundation.org, bhe@redhat.com, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 rcu@vger.kernel.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com,
 kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com,
 alejandro.j.jimenez@oracle.com, andriy.shevchenko@linux.intel.com,
 arnd@arndb.de, bp@alien8.de, corbet@lwn.net, d.hatayama@jp.fujitsu.com,
 dave.hansen@linux.intel.com, dyoung@redhat.com, feng.tang@intel.com,
 gregkh@linuxfoundation.org, mikelley@microsoft.com,
 hidehiro.kawai.ez@hitachi.com, jgross@suse.com, john.ogness@linutronix.de,
 keescook@chromium.org, luto@kernel.org, mhiramat@kernel.org,
 mingo@redhat.com, paulmck@kernel.org, peterz@infradead.org,
 rostedt@goodmis.org, senozhatsky@chromium.org, stern@rowland.harvard.edu,
 tglx@linutronix.de, vgoyal@redhat.com, vkuznets@redhat.com, will@kernel.org,
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
 <YoSnGmBJ3kYs5WMf@alley> <fbbd0a8d-2ef4-4a39-4b75-354918e85778@igalia.com>
 <YoXr2AD+Jc/ukUhJ@alley>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <YoXr2AD+Jc/ukUhJ@alley>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/05/2022 04:03, Petr Mladek wrote:
> [...]
> I would ignore it for now. If anyone would want to safe the log
> then they would need to read it. They will most likely use
> the existing kmsg_dump() infastructure. In fact, they should
> use it to avoid a code duplication.
> 
> Best Regards,
> Petr

Cool, thanks! I agree, let's expect people use kmsg_dump() as they should =)

