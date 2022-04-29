Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C69D6514F28
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 17:20:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317454.536787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkSPb-0007JP-IU; Fri, 29 Apr 2022 15:20:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317454.536787; Fri, 29 Apr 2022 15:20:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkSPb-0007G6-EP; Fri, 29 Apr 2022 15:20:03 +0000
Received: by outflank-mailman (input) for mailman id 317454;
 Fri, 29 Apr 2022 15:20:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BV3H=VH=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nkSPZ-0006x7-2i
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 15:20:02 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4e51ca0-c7cf-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 17:19:59 +0200 (CEST)
Received: from [179.113.53.197] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nkSOj-000BaQ-FP; Fri, 29 Apr 2022 17:19:09 +0200
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
X-Inumbo-ID: d4e51ca0-c7cf-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PkGMRtr7ZOpuAUYdkK5YcnBWQgNByIkM+TF/PhPSt00=; b=McsgIEmWszU/NtZ864aphbd05/
	AA+Hs7uyIJtJtMr4867fKRnrcDZ/B0ve7meILjRDqPYrpj2SCcZq87R4becMzN/EmmpSkGxa2bXfq
	pUhMsFJRA7hiMl/hulL8uwaQ3NgTviAzyrP9F3cuPytnlSXUcQgJY1SVDx/EfT4PyEI3blubrtgBl
	Y/qFy6eJFuUH765RC4uiwWYgWdDuIIe2xttNarhTtSLeO0f5vFGPmxPe8sb1rSPH9MLQ8MhCgLKVk
	8Yh9XWbluokYf/vW7/yQXLp3HdC2BoK3CBL6+DlGPNeddie6sMCK3FiVbeA/PpCZCA2PeX8k9qatt
	P0Tqe4Tg==;
Message-ID: <31248811-d3ed-63dd-e255-c3be07fb1434@igalia.com>
Date: Fri, 29 Apr 2022 12:18:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier list
Content-Language: en-US
To: minyard@acm.org, elder@ieee.org, Alex Elder <elder@kernel.org>,
 cminyard@mvista.com
Cc: akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org,
 linux-alpha@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
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
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Chris Zankel
 <chris@zankel.net>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Dexuan Cui <decui@microsoft.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Heiko Carstens <hca@linux.ibm.com>,
 Helge Deller <deller@gmx.de>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 James Morse <james.morse@arm.com>, Johannes Berg
 <johannes@sipsolutions.net>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Pavel Machek <pavel@ucw.cz>, Richard Henderson <rth@twiddle.net>,
 Richard Weinberger <richard@nod.at>, Robert Richter <rric@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tony Luck <tony.luck@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Wei Liu <wei.liu@kernel.org>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-22-gpiccoli@igalia.com>
 <20220428162616.GE442787@minyard.net>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20220428162616.GE442787@minyard.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/04/2022 13:26, Corey Minyard wrote:
> [...]
> 
> For the IPMI portion:
> 
> Acked-by: Corey Minyard <cminyard@mvista.com>

Thanks Alex and Corey for the ACKs!

> 
> Note that the IPMI panic_event() should always return, but it may take
> some time, especially if the IPMI controller is no longer functional.
> So the risk of a long delay is there and it makes sense to move it very
> late.
> 

Thanks, I agree - the patch moves it to the (latest - 1) position, since
some arch code might run as the latest and effectively stops the machine.
Cheers,


Guilherme

