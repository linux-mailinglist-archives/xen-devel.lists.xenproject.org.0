Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3971352A885
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 18:47:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331294.554782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr0LZ-0008Nz-VJ; Tue, 17 May 2022 16:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331294.554782; Tue, 17 May 2022 16:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr0LZ-0008Ls-Rq; Tue, 17 May 2022 16:46:57 +0000
Received: by outflank-mailman (input) for mailman id 331294;
 Tue, 17 May 2022 16:46:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ghfa=VZ=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nr0LX-0008Lm-Qj
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 16:46:55 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f50859c6-d600-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 18:46:54 +0200 (CEST)
Received: from 200-161-159-120.dsl.telesp.net.br ([200.161.159.120]
 helo=[192.168.1.60]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nr0L8-008hJL-On; Tue, 17 May 2022 18:46:30 +0200
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
X-Inumbo-ID: f50859c6-d600-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SayoV/bDRPXgJ3Ch+E1XrP+3ZKBsDTlU6fUN8lp8tUA=; b=NFkpBbcNKXWz56FUYb1Bkzyxr7
	6pY/CyDxLh4gcyoAU547/3Tabh/NOqK7gz3NyBwq82xJqiEBF4takjF5Ea4MxM1+r5wku8pOVYUcB
	ywM/ZaJlNeBGlkQDKAAkvdKcd6hk5MAb9a5XNcjDCG3MlNSgk+v7vfXWUOesl/qG/NSZ4K/pjk0dM
	SubvLJBNURMO5WMoXdrxUQfhd0uSTHup7fDjOSHoKefOTjSKlQG/UGn8QEvdGVnYTtMgbwm4d3/K8
	B+J9kKyINLLhiDLqbwoDlrvd49iM915Hk5YhXi74qG93lapXX9eWm/gnnOawNxBPCH4bdsTvQIyr9
	Yagr/AQw==;
Message-ID: <599b72f6-76a4-8e6d-5432-56fb1ffd7e0b@igalia.com>
Date: Tue, 17 May 2022 13:45:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier list
Content-Language: en-US
To: Petr Mladek <pmladek@suse.com>, "Luck, Tony" <tony.luck@intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "bhe@redhat.com" <bhe@redhat.com>,
 "kexec@lists.infradead.org" <kexec@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
 "rcu@vger.kernel.org" <rcu@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>,
 "halves@canonical.com" <halves@canonical.com>,
 "fabiomirmar@gmail.com" <fabiomirmar@gmail.com>,
 "alejandro.j.jimenez@oracle.com" <alejandro.j.jimenez@oracle.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "bp@alien8.de" <bp@alien8.de>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "d.hatayama@jp.fujitsu.com" <d.hatayama@jp.fujitsu.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "dyoung@redhat.com" <dyoung@redhat.com>, "Tang, Feng" <feng.tang@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "mikelley@microsoft.com" <mikelley@microsoft.com>,
 "hidehiro.kawai.ez@hitachi.com" <hidehiro.kawai.ez@hitachi.com>,
 "jgross@suse.com" <jgross@suse.com>,
 "john.ogness@linutronix.de" <john.ogness@linutronix.de>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "luto@kernel.org" <luto@kernel.org>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "paulmck@kernel.org" <paulmck@kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "vgoyal@redhat.com" <vgoyal@redhat.com>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "will@kernel.org" <will@kernel.org>, Alex Elder <elder@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Chris Zankel
 <chris@zankel.net>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Corey Minyard <minyard@acm.org>, Dexuan Cui <decui@microsoft.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 James Morse <james.morse@arm.com>, Johannes Berg
 <johannes@sipsolutions.net>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Pavel Machek <pavel@ucw.cz>, Richard Weinberger <richard@nod.at>,
 Robert Richter <rric@kernel.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Sven Schnelle <svens@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Wei Liu <wei.liu@kernel.org>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-22-gpiccoli@igalia.com> <YoJgcC8c6LaKADZV@alley>
 <63a74b56-89ef-8d1f-d487-cdb986aab798@igalia.com>
 <bed66b9467254a5a8bafc1983dad643a@intel.com>
 <e895ce94-e6b9-caf6-e5d3-06bf0149445c@igalia.com> <YoOs9GJ5Ovq63u5Q@alley>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <YoOs9GJ5Ovq63u5Q@alley>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/05/2022 11:11, Petr Mladek wrote:
> [...]
>>> Then notifiers could make an informed choice on whether to deep dive to
>>> get all the possible details (when there is no kdump) or just skim the high
>>> level stuff (to maximize chance of getting a successful kdump).
>>>
>>> -Tony
>>
>> Good idea Tony! What if I wire a kexec_crash_loaded() in the notifier?
> 
> I like this idea.
> 
> One small problem is that kexec_crash_loaded() has valid result
> only under kexec_mutex. On the other hand, it should stay true
> once loaded so that the small race window should be innocent.
> 
>> With that, are you/Petr/Dinh OK in moving it for the info list?
> 
> Sounds good to me.
> 
> Best Regards,
> Petr

Perfect, I'll do that for V2 then =)

Tony / Dinh - can I just *skip* this notifier *if kdump* is set or else
we run the code as-is? Does that make sense to you?

I'll postpone it to run almost in the end of info list (last position is
for panic_print).

Thanks,


Guilherme

