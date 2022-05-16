Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E745289B8
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 18:09:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330075.553390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqdHU-0008V2-U5; Mon, 16 May 2022 16:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330075.553390; Mon, 16 May 2022 16:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqdHU-0008SR-Pq; Mon, 16 May 2022 16:09:12 +0000
Received: by outflank-mailman (input) for mailman id 330075;
 Mon, 16 May 2022 16:09:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z64Z=VY=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nqdHS-0008SA-R2
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 16:09:10 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 845c204f-d532-11ec-837e-e5687231ffcc;
 Mon, 16 May 2022 18:09:09 +0200 (CEST)
Received: from [177.183.162.244] (helo=[192.168.0.5])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nqdH5-006sEZ-4a; Mon, 16 May 2022 18:08:47 +0200
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
X-Inumbo-ID: 845c204f-d532-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GMtpV7L0kGUwGya4swBOPC8ZOVfItfrxYDvgMpAmkJQ=; b=mu0bEGyUCfuWuU1+3MGwpfSVuq
	s6/6eTwkcMLsn+hqh74arIfl7IvjJUFkkA8WCdLFr55WWGsb4tEiMy/+3c9yyNaTe26kJ467c7Aa+
	OVcjrOHxswFanqY90Yd7eenIDB3EwcpTVl3dOD010KynXuUWSiabOa/xgPRFmboMRGQYor+jwG1Cv
	mj7+eVkhBj2Q43ts9jeuWbjXw4tm3Jz5FqLPOTC5pNe5ykFg2VnMrebedEuX2X8Dc6Z0wdLCGwMFU
	8xiaC4NGK1X9iOa8nP8hSMfwLdqMEw0xpnZedCTljeij+zSzzN7p5ST6lBhkCoAPIOrm2lBlmeS/R
	fNRTCdfQ==;
Message-ID: <cfc89eba-1079-6c80-4806-1fb8af1404f1@igalia.com>
Date: Mon, 16 May 2022 13:08:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 22/30] panic: Introduce the panic post-reboot notifier
 list
Content-Language: en-US
To: Petr Mladek <pmladek@suse.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
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
 vkuznets@redhat.com, will@kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Heiko Carstens <hca@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-23-gpiccoli@igalia.com> <YoJjpBrz34QO+rn9@alley>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <YoJjpBrz34QO+rn9@alley>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/05/2022 11:45, Petr Mladek wrote:
> [...]
> 
> The patch looks good to me. I would just suggest two changes.
> 
> 1. I would rename the list to "panic_loop_list" instead of
>    "panic_post_reboot_list".
> 
>    It will be more clear that it includes things that are
>    needed before panic() enters the infinite loop.
> 
> 
> 2. I would move all the notifiers that enable blinking here.
> 
>    The blinking should be done only during the infinite
>    loop when there is nothing else to do. If we enable
>    earlier then it might disturb/break more important
>    functionality (dumping information, reboot).
> 

Perfect, I agree with you. I'll change both points in V2 =)

