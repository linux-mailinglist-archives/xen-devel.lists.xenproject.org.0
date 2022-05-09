Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F00465202B9
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 18:40:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324695.546856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no6Qn-00011h-LE; Mon, 09 May 2022 16:40:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324695.546856; Mon, 09 May 2022 16:40:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no6Qn-0000ym-Hg; Mon, 09 May 2022 16:40:21 +0000
Received: by outflank-mailman (input) for mailman id 324695;
 Mon, 09 May 2022 16:40:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11C1=VR=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1no6Qm-0000yg-La
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 16:40:20 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b611e419-cfb6-11ec-8fc4-03012f2f19d4;
 Mon, 09 May 2022 18:40:19 +0200 (CEST)
Received: from [177.183.162.244] (helo=[192.168.0.5])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1no6QL-0009Bp-09; Mon, 09 May 2022 18:39:53 +0200
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
X-Inumbo-ID: b611e419-cfb6-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=48dgNwNPuCnyD3VVOBf09xe2NjnTaXdW0ldox8dhrAY=; b=eLWL69Jp3Hs5nKIC07c/DVmIhZ
	tbuXXOS52wa7kstrEszNfv7tW4JmReP+jwvf/WSB2LnPtAjsR79TSRqPXDYlR/UhgTYs3JxE63TxY
	WFAF2HLKU7kQDGOjOij/SccvoodNoUy/77Q7Rw1bHNyMkUGePOlK3tPiGlMKv0HFeJaDvBKfB5C4T
	7/g7A8xShBgXvVATUWH+9aEVvFCEwhRR4Tyt7Zyibz7aNPTHMnncwalkA+46VUbkJ44ERvwAtMmTs
	hWWtwgYVptx9ug9t6aPZQ1zrU+TA/lel56oNayZ3d7me/ZMI8w2lxg28JbHkciwHu/jkRujv3gimI
	sEcDvBWQ==;
Message-ID: <92e03ebf-6a64-69dc-bf16-9552b9fedad8@igalia.com>
Date: Mon, 9 May 2022 13:39:21 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 24/30] panic: Refactor the panic path
Content-Language: en-US
To: "d.hatayama@fujitsu.com" <d.hatayama@fujitsu.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "bhe@redhat.com" <bhe@redhat.com>, "pmladek@suse.com" <pmladek@suse.com>,
 "kexec@lists.infradead.org" <kexec@lists.infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 "mikelley@microsoft.com" <mikelley@microsoft.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
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
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "dyoung@redhat.com" <dyoung@redhat.com>,
 "feng.tang@intel.com" <feng.tang@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
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
 "will@kernel.org" <will@kernel.org>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-25-gpiccoli@igalia.com>
 <TYAPR01MB6507D01F5694BC33628BB7DB95C69@TYAPR01MB6507.jpnprd01.prod.outlook.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <TYAPR01MB6507D01F5694BC33628BB7DB95C69@TYAPR01MB6507.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hey Hatayma, thanks for your great analysis and no need for apologies!

I'll comment/respond properly inline below, just noticing here that I've
CCed Mark and Marc (from the ARM64 perspective), Michael (Hyper-V
perspective) and Hari (PowerPC perspective), besides the usual suspects
as Petr, Baoquan, etc.

On 09/05/2022 12:16, d.hatayama@fujitsu.com wrote:
> Sorry for the delayed response. Unfortunately, I had 10 days holidays
> until yesterday...
> [...] 
>> +                       We currently have 4 lists of panic notifiers; based
>> +                       on the functionality and risk (for panic success) the
>> +                       callbacks are added in a given list. The lists are:
>> +                       - hypervisor/FW notification list (low risk);
>> +                       - informational list (low/medium risk);
>> +                       - pre_reboot list (higher risk);
>> +                       - post_reboot list (only run late in panic and after
>> +                       kdump, not configurable for now).
>> +                       This parameter defines the ordering of the first 3
>> +                       lists with regards to kdump; the levels determine
>> +                       which set of notifiers execute before kdump. The
>> +                       accepted levels are:
>> +                       0: kdump is the first thing to run, NO list is
>> +                       executed before kdump.
>> +                       1: only the hypervisor list is executed before kdump.
>> +                       2 (default level): the hypervisor list and (*if*
> 
> Hmmm, why are you trying to change default setting?
> 
> Based on the current design of kdump, it's natural to put what the
> handlers for these level 1 and level 2 handlers do in
> machine_crash_shutdown(), as these are necessary by default, right?
> 
> Or have you already tried that and figured out it's difficult in some
> reason and reached the current design? If so, why is that difficult?
> Could you point to if there is already such discussion online?
> 
> kdump is designed to perform as little things as possible before
> transferring the execution to the 2nd kernel in order to increase
> reliability. Just detour to panic() increases risks of kdump failure
> in the sense of increasing the executed codes in the abnormal
> situation, which is very the note in the explanation of
> crash_kexec_post_notifiers.
> 
> Also, the current implementation of crash_kexec_post_notifiers uses
> the panic notifier, but this is not from the technical
> reason. Ideally, it should have been implemented in the context of
> crash_kexec() independently of panic().
> 
> That is, it looks to me that, in addition to changing design of panic
> notifier, you are trying to integrate shutdown code of the crash kexec
> and the panic paths. If so, this is a big design change for kdump.
> I'm concerned about increase of reliability. I'd like you to discuss
> them carefully.

From my understanding (specially based on both these threads [0] and
[1]), 3 facts are clear and quite complex in nature:

(a) Currently, the panic notifier list is a "no man's land" - it's a
mess, all sort of callbacks are added there, some of them are extremely
risk for breaking kdump, others are quite safe (like setting a
variable). Petr's details in thread [0] are really clear and express in
great way how confusing and conflicting the panic notifiers goals are.

(b) In order to "address" problems in the antagonistic goals of
notifiers (see point (a) above and thread [0]), we have this
quirk/workaround called "crash_kexec_post_notifiers". This is useful,
but (almost as for attesting how this is working as band-aid over
complex and fundamental issues) see the following commits:

a11589563e96 ("x86/Hyper-V: Report crash register data or kmsg before
running crash kernel")

06e629c25daa ("powerpc/fadump: Fix inaccurate CPU state info in vmcore
generated with panic")

They hardcode such workaround, because they *need* some notifiers'
callbacks. But notice they *don't need all of them*, only some important
ones (that usually are good considering the risk, it's a good
cost/benefit). Since we currently have an all-or-nothing behavior for
the panic notifiers, both PowerPC and Hyper-V end-up bringing all of
them to run before kdump due to the lack of flexibility, increasing a
lot the risk of failure for kdump.

(c) To add on top of all such complexity, we don't have a custom
machine_crash_shutdown() handler for some architectures like ARM64, and
the feeling is that's not right to add a bunch of callbacks / complexity
in such architecture code, specially since we have the notifiers
infrastructure in the kernel. I've recently started a discussion about
that with ARM64 community, please take a look in [1].

With that said, we can use (a) + (b) + (c) to justify our argument here:
the panic notifiers should be refactored! We need to try to encompass
the antagonistic goals of kdump (wants to be the first thing to run,
early as possible) VS. the notifiers that are necessary, even before
kdump (like Hyper-V / PowerPC fadump ones, but there are more of these,
the FW/hypervisors notifiers).

I guarantee to you we cannot make 100% of people happy - the
panic-related areas like kdump, etc are full of trade-offs. We improve
something, other stuff breaks. This series attempts to clearly
distribute the notifiers in 3 buckets, and introduces a level setting
that tunes such buckets to run before or after the kdump in a highly
flexible way, trying to make the most users happy and capable of tuning
their systems.

I understand that likely setting the notifiers to 0 would make kdump
maintainers happy, because we'd keep the same behavior as before.
But..then we make PPC / Hyper-V and some other users unsatisfied. Level
2 seems to me a good compromise. I'm willing to add a KConfig option to
allow distros to hard set their defaults - that might make sense to
legacy distros as older RHEL / CentOS or server-only distros.

Finally, you mention about integrating the crash shutdown and the panic
paths - I'm not officially doing that, but I see that they are very
related and all cases I've ever seen in the last 3-4 years I've been
working with kdump, it was triggered from panic, from settings "panic_on_X".

I understand we have the regular kexec path (!kdump), some notifiers
might make sense in both paths, and in this case we could duplicate them
(one callback, 2 notifier lists) and control against double execution. I
tried doing that in patch 16 of this series (Hyper-V stuff), but due to
the lack of ARM64 custom crash shutdown handler, I couldn't. We can
think in some alternatives, and improve these (naturally)
connected/related paths, but this is not the goal of this specific
series. I'm hereby trying to improve/clarify the panic (and kdump) path,
not the pure kexec path.

Let me know if I can clarify more specific points you have or if there
are flaws in my logic - I appreciate the discussions/reviews.
Cheers,


Guilherme



[0] "notifier/panic: Introduce panic_notifier_filter" -
https://lore.kernel.org/lkml/YfPxvzSzDLjO5ldp@alley/

[1] "Should arm64 have a custom crash shutdown handler?" -
https://lore.kernel.org/lkml/427a8277-49f0-4317-d6c3-4a15d7070e55@igalia.com/

