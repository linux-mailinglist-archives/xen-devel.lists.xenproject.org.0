Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B6352BB5E
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 15:11:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332124.555772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrJS9-00039S-Kp; Wed, 18 May 2022 13:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332124.555772; Wed, 18 May 2022 13:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrJS9-00036c-HA; Wed, 18 May 2022 13:11:01 +0000
Received: by outflank-mailman (input) for mailman id 332124;
 Wed, 18 May 2022 13:11:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g5V8=V2=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nrJS6-00036J-Pn
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 13:10:59 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f378af27-d6ab-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 15:10:57 +0200 (CEST)
Received: from 200-161-159-120.dsl.telesp.net.br ([200.161.159.120]
 helo=[192.168.1.60]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nrJR1-009xZP-0G; Wed, 18 May 2022 15:09:51 +0200
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
X-Inumbo-ID: f378af27-d6ab-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Du0yR9uhHpKwWrKsjoqMfifs7bCXApVmJcTLKS159Q8=; b=KR8Ca3qzn6Prru2b2ovD3a5c88
	3Yl32PXNgwJAzJv1K+GwtALbIi3R7PHWPogPI//mjA46BacEdcFlczlu7VgbqBbi0iRFln4dhAmL3
	5vAwoEH2Y5npRXnrsBS0Pt1IPEFHpxBOrNJbK+CGAUFY1mpA/Xk/bDS+XL+ITQtGq3i57YSw2ze27
	6u/aeZyJiDji8Ld6K9lb+iY/t9E1NA5TGk8rCRjPY8WXYQAQH85dDOYmikTTt80JzPDf76BhHmUH/
	IE+yGx2cI+Y6f449JTeHotkEOnM9AIr+trG8kHtj2MTTykTHXqJtKMQ7SzJhAjeP0O52jetyt0xPW
	XVvP+JXg==;
Message-ID: <8a1159c6-b4c1-87b9-8a09-6d5696f8f3f4@igalia.com>
Date: Wed, 18 May 2022 10:09:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 19/30] panic: Add the panic hypervisor notifier list
Content-Language: en-US
To: Petr Mladek <pmladek@suse.com>
Cc: Scott Branden <scott.branden@broadcom.com>,
 Sebastian Reichel <sre@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 David Gow <davidgow@google.com>, Evan Green <evgreen@chromium.org>,
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
 <d72b9aab-675c-ac89-b73a-b1de4a0b722d@igalia.com> <YoSijKwuwbY9uHxG@alley>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <YoSijKwuwbY9uHxG@alley>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/05/2022 04:38, Petr Mladek wrote:
> [...]
> I have answered this in more detail in the other reply, see
> https://lore.kernel.org/r/YoShZVYNAdvvjb7z@alley
> 
> I agree that both notifiers in
> 
>     drivers/soc/bcm/brcmstb/pm/pm-arm.c
>     drivers/firmware/google/gsmi.c
> 
> better fit into the hypervisor list after all.
> 
> Best Regards,
> Petr

Perfect, thanks - will keep both in such list for V2.

