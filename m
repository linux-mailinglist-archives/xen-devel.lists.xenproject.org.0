Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B88518BAD
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 19:58:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319852.540282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlwnB-0004uq-Kf; Tue, 03 May 2022 17:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319852.540282; Tue, 03 May 2022 17:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlwnB-0004sL-Gw; Tue, 03 May 2022 17:58:33 +0000
Received: by outflank-mailman (input) for mailman id 319852;
 Tue, 03 May 2022 17:58:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ivXl=VL=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nlwn7-0004sF-KH
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 17:58:32 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1badf24-cb0a-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 19:58:27 +0200 (CEST)
Received: from [179.113.53.197] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nlwlp-0009Ge-E7; Tue, 03 May 2022 19:57:09 +0200
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
X-Inumbo-ID: a1badf24-cb0a-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=V5OlIrQZACaQuAvW/eyS6B/1Zwik+ew1I16AuySJnIg=; b=gjAznZuoR4/m9kKzzhqzuGrpkT
	xtMc6cJN1cBQNuGvg6XyrPFTI1ixzsXC2Qdeh+HpywC/rv8GnlBjcukr7ohfRrQ9c8Vv3g1C+degf
	BKLK1MQn4ihq1pQ2tLJ4K6bqakBNB70xc08nkdXZEPCNZh6tlfswNgMdLLmr3btmvO+ASGsTB1McO
	bjtFx1IEqa+FJgHwAOYextuGE9H3QAozC9Ow4n5OqOMhRYX1e/PE6FhaxFfCh6NihoHwyZzrtpHli
	GlpKhk1VLnB8Ef855kd7QLHnrR7/smJu3dr6Yo1GdqpDjEKpnWDlt7/NfiaCRZ690xo8EgxQrZVRx
	GY9vS48w==;
Message-ID: <dccb35f9-8fff-8b53-3b31-fbe55b2781c0@igalia.com>
Date: Tue, 3 May 2022 14:56:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 19/30] panic: Add the panic hypervisor notifier list
Content-Language: en-US
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "bhe@redhat.com" <bhe@redhat.com>, "pmladek@suse.com" <pmladek@suse.com>,
 "kexec@lists.infradead.org" <kexec@lists.infradead.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
 "vgoyal@redhat.com" <vgoyal@redhat.com>, vkuznets <vkuznets@redhat.com>,
 "will@kernel.org" <will@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andrea Parri <parri.andrea@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 David Gow <davidgow@google.com>, "David S. Miller" <davem@davemloft.net>,
 Dexuan Cui <decui@microsoft.com>, Doug Berger <opendmb@gmail.com>,
 Evan Green <evgreen@chromium.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Hari Bathini
 <hbathini@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Julius Werner <jwerner@chromium.org>, Justin Chen <justinpopo6@gmail.com>,
 KY Srinivasan <kys@microsoft.com>, Lee Jones <lee.jones@linaro.org>,
 Markus Mayer <mmayer@broadcom.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Mihai Carabas <mihai.carabas@oracle.com>, Nicholas Piggin
 <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Pavel Machek <pavel@ucw.cz>, Scott Branden <scott.branden@broadcom.com>,
 Sebastian Reichel <sre@kernel.org>,
 Shile Zhang <shile.zhang@linux.alibaba.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Wang ShaoBo <bobo.shaobowang@huawei.com>, Wei Liu <wei.liu@kernel.org>,
 zhenwei pi <pizhenwei@bytedance.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-20-gpiccoli@igalia.com>
 <PH0PR21MB30256260CCF4CAB713BBB11ED7FC9@PH0PR21MB3025.namprd21.prod.outlook.com>
 <0147d038-571b-0802-c210-ccd4d52cd5dd@igalia.com>
 <PH0PR21MB30257E4E6E16BB8FFDE8F312D7C09@PH0PR21MB3025.namprd21.prod.outlook.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <PH0PR21MB30257E4E6E16BB8FFDE8F312D7C09@PH0PR21MB3025.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/05/2022 14:44, Michael Kelley (LINUX) wrote:
> [...]
>>
>> Hi Michael, thanks for your feedback! I agree that your idea could work,
>> but...there is one downside: imagine the kmsg_dump() approach is not set
>> in some Hyper-V guest, then we would rely in the regular notification
>> mechanism [hv_die_panic_notify_crash()], right?
>> But...you want then to run this notifier in the informational list,
>> which...won't execute *by default* before kdump if no kmsg_dump() is
>> set. So, this logic is convoluted when you mix it with the default level
>> concept + kdump.
> 
> Yes, you are right.  But to me that speaks as much to the linkage
> between the informational list and kmsg_dump() being the core
> problem.  But as I described in my reply to Patch 24, I can live with
> the linkage as-is.

Thanks for the feedback Michael!

> [...] 
>> I feel the panic notification mechanism does really fit with a
>> hypervisor list, it's a good match with the nature of the list, which
>> aims at informing the panic notification to the hypervisor/FW.
>> Of course we can modify it if you prefer...but please take into account
>> the kdump case and how it complicates the logic.
> 
> I agree that the runtime effect of one list vs. the other is nil.  The
> code works and can stay as you written it.
> 
> I was trying to align from a conceptual standpoint.  It was a bit
> unexpected that one path would be on the hypervisor list, and the
> other path effectively on the informational list.  When I see
> conceptual mismatches like that, I tend to want to understand why,
> and if there is something more fundamental that is out-of-whack.
> 

Totally agree with you here, I am like that as well - try to really
understand the details, this is very important specially in this patch
set, since it's a refactor and affects every user of the notifiers
infrastructure.

Again, just to double-say it: feel free to suggest any change for the
Hyper-V portion (might as well for any patch in the series, indeed) -
you and the other Hyper-V maintainers own this code and I'd be glad to
align with your needs, you are honor citizens in the panic notifiers
area, being one the most heavy users for that =)

Cheers,


Guilherme

