Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A936B523E82
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 22:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327269.550054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nosgT-0000jF-3r; Wed, 11 May 2022 20:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327269.550054; Wed, 11 May 2022 20:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nosgS-0000fz-Va; Wed, 11 May 2022 20:11:44 +0000
Received: by outflank-mailman (input) for mailman id 327269;
 Wed, 11 May 2022 20:11:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SAT7=VT=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nosgR-0000fL-Gf
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 20:11:43 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 924c99e6-d166-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 22:11:42 +0200 (CEST)
Received: from [177.183.162.244] (helo=[192.168.0.5])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nosg4-0009ub-Ok; Wed, 11 May 2022 22:11:21 +0200
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
X-Inumbo-ID: 924c99e6-d166-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CJFn3sQ0AXqP082WliZpvB/FNlzjPtgRZLj1CZSBav8=; b=H0RwJ9q3twuN5LBJHRtfqxptfc
	+ZBTnXeu+L1QTWv6VeJ074IpruVUqgFdW2irvRDjWrUeZMfUmFqRter3RBPu9sBjZvDxvw8AhX4xB
	NGR1Fc+pyWr1+lwnwPjEPDyZEUU6BxtInHBrU2MsFuhkvRoiyT0qN7DKB5jSGNAhlNUyQGg7oS78I
	1IGokeMYkc2KXY4h6njrMqutcn89GTgmPXm9L8Rca7UD8k1O9WKCSzu2tsWk1It1LXW6uhsh6pzXU
	eq99TNaaB0b0wsrDl7wLGrG68y5q49uL+rS1rPP4MnQKtWlwuuoA5/zs3LiCVa22Xsjm4CNZYglTD
	lORMiUaA==;
Message-ID: <37190938-8133-aafa-ea4a-e50f574dd73b@igalia.com>
Date: Wed, 11 May 2022 17:10:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 10/30] alpha: Clean-up the panic notifier code
Content-Language: en-US
To: Petr Mladek <pmladek@suse.com>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, rth@gcc.gnu.org,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org,
 linux-alpha@vger.kernel.org, bhe@redhat.com, kexec@lists.infradead.org,
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
 vkuznets@redhat.com, will@kernel.org
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-11-gpiccoli@igalia.com>
 <f6def662-5742-b3a8-544f-bf15c636d83d@igalia.com> <YnpzpkfuwzJYbPYj@alley>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <YnpzpkfuwzJYbPYj@alley>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/05/2022 11:16, Petr Mladek wrote:
> [...]
> Yeah, it is pretty strange behavior.
> 
> I looked into the history. This notifier was added into the alpha code
> in 2.4.0-test2pre2. In this historic code, the default panic() code
> either rebooted after a timeout or ended in a infinite loop. There
> was not crasdump at that times.
> 
> The notifier allowed to change the behavior. There were 3 notifiers:
> 
>    + mips and mips64 ended with blinking in panic()
>    + alpha did __halt() in this srm case
> 
> They both still do this. I guess that it is some historic behavior
> that people using these architectures are used to.
> 
> Anyway, it makes sense to do this as the last notifier after
> dumping other information.
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> 
> Best Regards,
> Petr

Thanks a bunch for the review - added your tag for V2 =)

