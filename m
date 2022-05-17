Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2524452A6BC
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 17:33:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331124.554605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzCg-0008RX-TT; Tue, 17 May 2022 15:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331124.554605; Tue, 17 May 2022 15:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzCg-0008Ox-QF; Tue, 17 May 2022 15:33:42 +0000
Received: by outflank-mailman (input) for mailman id 331124;
 Tue, 17 May 2022 15:33:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ghfa=VZ=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nqzCe-0008NM-O1
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 15:33:40 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8b2801c-d5f6-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 17:33:38 +0200 (CEST)
Received: from 200-161-159-120.dsl.telesp.net.br ([200.161.159.120]
 helo=[192.168.1.60]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nqzCM-008c9O-8K; Tue, 17 May 2022 17:33:22 +0200
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
X-Inumbo-ID: b8b2801c-d5f6-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sBxOdf5zzlugJkhZHabZzTAtpXD19gBRD4MewoqTr3w=; b=NsQp7JvDHeiG0InrgCzgj6qEMn
	+0HDDirskWRJUwtuX9QZNgVpRKlGO/3aNrbmen6tXlKUhuV0+BbQy2aMCyUUGcetLiuWPChDYhZG2
	uActfFtkCGU4c6w7jw5eo3KbRLxEWlPGvaIXcW9KuVcgcDuIdvQJ7CUukGXL9th36+kW270UNj6cp
	KwfiG//V+ceMXkXz56bGppHfbEL7x2Yf8p2OfzRzA+P3gciDRGzrJlW3tYAmf8L72SPmNmKgXgiQH
	oN/Ktah8yVYeK7YuYx/7jPfAZeKiiCyehjDs7pB9vGbI0WRx7KI28Glco3R/cH3PEM9mA0rVYqkMG
	3w57FnRw==;
Message-ID: <007af382-dcf5-b06d-acad-08f8d6ec7f8b@igalia.com>
Date: Tue, 17 May 2022 12:32:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 15/30] bus: brcmstb_gisb: Clean-up panic/die notifiers
Content-Language: en-US
To: Petr Mladek <pmladek@suse.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
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
 Brian Norris <computersforpeace@gmail.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-16-gpiccoli@igalia.com> <YnqEqDnMfUgC4dM6@alley>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <YnqEqDnMfUgC4dM6@alley>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/05/2022 12:28, Petr Mladek wrote:
> [...]
> IMHO, the check of the @self parameter was the proper solution.
> 
> "gisb_die_notifier" list uses @val from enum die_val.
> "gisb_panic_notifier" list uses @val from enum panic_notifier_val.
> 
> These are unrelated types. It might easily break when
> someone defines the same constant also in enum die_val.
> 
> Best Regards,
> Petr

OK Petr, I'll drop this idea for V2 - will just remove the useless
header / prototype then. (CC Florian)


Cheers,


Guilherme

