Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DC352164B
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 15:03:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325591.548232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noPVZ-00023m-KE; Tue, 10 May 2022 13:02:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325591.548232; Tue, 10 May 2022 13:02:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noPVZ-00020I-Fg; Tue, 10 May 2022 13:02:33 +0000
Received: by outflank-mailman (input) for mailman id 325591;
 Tue, 10 May 2022 13:02:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F+UO=VS=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1noPVX-00020C-Dn
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 13:02:32 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7143e740-d061-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 15:02:28 +0200 (CEST)
Received: from [177.183.162.244] (helo=[192.168.0.5])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1noPUd-0004lT-6O; Tue, 10 May 2022 15:01:35 +0200
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
X-Inumbo-ID: 7143e740-d061-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JWyep5EFfEPXN0/UUFSWkvsTwBT4W/fOxchQHhKa4RM=; b=sx6DF8PoUIO1mHu5cZY1RxwoA9
	niB1KysO8rrmF0zp8Z8GTN/NtCj2d4QR4yv3E2E5W17RExRi8A0KAmcw+03c1G1ooU/Pm21U+zIEh
	0zp/hEbV2HUhNtVPnHFdp5DB6IlN6W8R3VOm7oythqBX2GRaLpOj+rJPIjIYg4FRTMuO76QGoLFC6
	YTJOWt6WzTDBhnK8IJgaIHAnWrK2atb9lCglavMKbFL3MElzKi625NHcWNdIldxGBU96c/pM4S0g8
	wJXsSSNXtcQC2Akbyu07xQvQmC9j0tVwKiovTIAilxmwfqg23OLqdBOLywiRmkuVFih5uNhaytVXp
	cz9YcgaQ==;
Message-ID: <0a20dd06-f459-638e-cb4d-8255ab1a1f23@igalia.com>
Date: Tue, 10 May 2022 10:00:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 05/30] misc/pvpanic: Convert regular spinlock into trylock
 on panic path
Content-Language: en-US
To: Petr Mladek <pmladek@suse.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
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
 vkuznets@redhat.com, will@kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Mihai Carabas <mihai.carabas@oracle.com>,
 Shile Zhang <shile.zhang@linux.alibaba.com>,
 Wang ShaoBo <bobo.shaobowang@huawei.com>,
 zhenwei pi <pizhenwei@bytedance.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-6-gpiccoli@igalia.com> <YnpXGOXicwdy1E6n@alley>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <YnpXGOXicwdy1E6n@alley>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/05/2022 09:14, Petr Mladek wrote:
> [...]
>> With that said, it's dangerous to use regular spinlocks in such path,
>> as introduced by commit b3c0f8774668 ("misc/pvpanic: probe multiple instances").
>> This patch fixes that by replacing regular spinlocks with the trylock
>> safer approach.
> 
> It seems that the lock is used just to manipulating a list. A super
> safe solution would be to use the rcu API: rcu_add_rcu() and
> list_del_rcu() under rcu_read_lock(). The spin lock will not be
> needed and the list will always be valid.
> 
> The advantage would be that it will always call members that
> were successfully added earlier. That said, I am not familiar
> with pvpanic and am not sure if it is worth it.
> 
>> It also fixes an old comment (about a long gone framebuffer code) and
>> the notifier priority - we should execute hypervisor notifiers early,
>> deferring this way the panic action to the hypervisor, as expected by
>> the users that are setting up pvpanic.
> 
> This should be done in a separate patch. It changes the behavior.
> Also there might be a discussion whether it really should be
> the maximal priority.
> 
> Best Regards,
> Petr

Thanks for the review Petr. Patch was already merged - my goal was to be
concise, i.e., a patch per driver / module, so the patch kinda fixes
whatever I think is wrong with the driver with regards panic handling.

Do you think it worth to remove this patch from Greg's branch just to
split it in 2? Personally I think it's not worth, but opinions are welcome.

About the RCU part, this one really could be a new patch, a good
improvement patch - it makes sense to me, we can think about that after
the fixes I guess.

Cheers,


Guilherme

