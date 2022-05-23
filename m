Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB400531178
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 17:01:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335963.560207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt9YY-0001n4-Sm; Mon, 23 May 2022 15:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335963.560207; Mon, 23 May 2022 15:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt9YY-0001lI-P9; Mon, 23 May 2022 15:01:14 +0000
Received: by outflank-mailman (input) for mailman id 335963;
 Mon, 23 May 2022 15:01:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Smdb=V7=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nt9YW-0001lB-HN
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 15:01:12 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d0a9c15-daa9-11ec-bd2c-47488cf2e6aa;
 Mon, 23 May 2022 17:01:09 +0200 (CEST)
Received: from 200-161-159-120.dsl.telesp.net.br ([200.161.159.120]
 helo=[192.168.1.60]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nt9XQ-00GTti-N1; Mon, 23 May 2022 17:00:05 +0200
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
X-Inumbo-ID: 2d0a9c15-daa9-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=keKJrvyQ/+r75XOnYYRl19FO+VGyiPJcwICfZxDBkqs=; b=O+C3jDB0Vwu4Y/gkTmW/RCmTwy
	kNqD2emzzlOs/8A7J1xO/TSH5qapt6sCckUwfqeKLJwoCrpUi4pUQfOKCsbI70QtSFMdfNTmFr+H0
	NXT6Oh9iPuG4hVKz84ZvxHpmEirVLNSMQMza54o3VmB+D23FpdTtf7JnpYZ61zk10z8NLp053Dtmb
	5G5TvLT8W+VF+imYpIQccZx+LAQHhkmqjWgwAULVFomENEWSpKhN5UeAVPt+Y1vZC04/4FyRoMtUE
	OHqcld4S4ftUjXzRb6CJS95k+7T+FIlHKMRNj13Qcs75Xk/j3Ix2WaTpEwsP72+2bzr+hEFsSu6v0
	WUJ5ifAA==;
Message-ID: <0fac8c71-6f18-d15c-23f5-075dbc45f3f9@igalia.com>
Date: Mon, 23 May 2022 11:56:12 -0300
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
 <edbaa4fa-561c-6f5e-f2ab-43ae68acaede@igalia.com>
 <d1cc0bee-2a98-0c2e-8796-6fb7fae6b803@broadcom.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <d1cc0bee-2a98-0c2e-8796-6fb7fae6b803@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/05/2022 16:20, Scott Branden wrote:
> [...] 
>> Hi Scott / Desmond, thanks for the detailed answer! Is this adapter
>> designed to run in x86 only or you have other architectures' use cases?
> The adapter may be used in any PCIe design that supports DMA.
> So it may be possible to run in arm64 servers.
>>
>> [...]
>> With that said, and given this is a lightweight notifier that ideally
>> should run ASAP, I'd keep this one in the hypervisor list. We can
>> "adjust" the semantic of this list to include lightweight notifiers that
>> reset adapters.
> Sounds the best to keep system operating as tested today.
>>
>> With that said, Petr has a point - not always such list is going to be
>> called before kdump. So, that makes me think in another idea: what if we
>> have another list, but not on panic path, but instead in the custom
>> crash_shutdown()? Drivers could add callbacks there that must execute
>> before kexec/kdump, no matter what.
> It may be beneficial for some other drivers but for our use we would 
> then need to register for the panic path and the crash_shutdown path. 
> We notify the VK card for 2 purposes: one to stop DMA so memory stop 
> changing during a kdump.  And also to get the card into a good state so 
> resets happen cleanly.

Thanks Scott! With that, I guess it's really better to keep this
notifier in this hypervisor/early list - I'm planning to do that for V2.
Unless Petr or somebody has strong feelings against that, of course.

Cheers,


Guilherme

