Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A65515355
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 20:06:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317606.537016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkUzz-0001By-SV; Fri, 29 Apr 2022 18:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317606.537016; Fri, 29 Apr 2022 18:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkUzz-0001A9-PK; Fri, 29 Apr 2022 18:05:47 +0000
Received: by outflank-mailman (input) for mailman id 317606;
 Fri, 29 Apr 2022 18:05:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BV3H=VH=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nkUzy-0001A3-CZ
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 18:05:46 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fca0ee22-c7e6-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 20:05:44 +0200 (CEST)
Received: from [179.113.53.197] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nkUzF-0006RF-Du; Fri, 29 Apr 2022 20:05:01 +0200
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
X-Inumbo-ID: fca0ee22-c7e6-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CfgJSltNTETfm69VgWZeJ1xxMOJuVJJeVDaV1//hOM4=; b=slyIgXmeUq77MnrSUr5lBtJx9z
	m86cp15BT6gKICc3jCqWbY2B0tpa99u5bAed7DYYXL/rMf6XHJRMLSIrTGUcJCHpVtGl/+APLcmrh
	RXQpa9HZXWVydxhVU95+hp+ZiaA0uHFZXPx5zEc5qg8trUY5PT1GKrapnos8zeTpFOAoQJEAx9vvn
	efpqnWK3jhpJIbXy7DD12LOMiGnr6GupNgQCAiVUmjcrI2J6NMnifvEjcuVQUbIlOFxyQL8HlLyj5
	ydadfwYuZkTNnyuPFseli5ffoVSkxD0MS5bvuilrJblEdywU2jKWaFEjPPnVXRJf3ScYrp3fr3KhT
	ij4JQKSA==;
Message-ID: <0147d038-571b-0802-c210-ccd4d52cd5dd@igalia.com>
Date: Fri, 29 Apr 2022 15:04:22 -0300
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
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <PH0PR21MB30256260CCF4CAB713BBB11ED7FC9@PH0PR21MB3025.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/04/2022 14:30, Michael Kelley (LINUX) wrote:
> From: Guilherme G. Piccoli <gpiccoli@igalia.com> Sent: Wednesday, April 27, 2022 3:49 PM
>> [...]
>>
>> @@ -2843,7 +2843,7 @@ static void __exit vmbus_exit(void)
>>  	if (ms_hyperv.misc_features & HV_FEATURE_GUEST_CRASH_MSR_AVAILABLE) {
>>  		kmsg_dump_unregister(&hv_kmsg_dumper);
>>  		unregister_die_notifier(&hyperv_die_report_block);
>> -		atomic_notifier_chain_unregister(&panic_notifier_list,
>> +		atomic_notifier_chain_unregister(&panic_hypervisor_list,
>>  						&hyperv_panic_report_block);
>>  	}
>>
> 
> Using the hypervisor_list here produces a bit of a mismatch.  In many cases
> this notifier will do nothing, and will defer to the kmsg_dump() mechanism
> to notify the hypervisor about the panic.   Running the kmsg_dump()
> mechanism is linked to the info_list, so I'm thinking the Hyper-V panic report
> notifier should be on the info_list as well.  That way the reporting behavior
> is triggered at the same point in the panic path regardless of which
> reporting mechanism is used.
> 

Hi Michael, thanks for your feedback! I agree that your idea could work,
but...there is one downside: imagine the kmsg_dump() approach is not set
in some Hyper-V guest, then we would rely in the regular notification
mechanism [hv_die_panic_notify_crash()], right?
But...you want then to run this notifier in the informational list,
which...won't execute *by default* before kdump if no kmsg_dump() is
set. So, this logic is convoluted when you mix it with the default level
concept + kdump.

May I suggest something? If possible, take a run with this patch set +
DEBUG_NOTIFIER=y, in *both* cases (with and without the kmsg_dump()
set). I did that and they run almost at the same time...I've checked the
notifiers called, it's like almost nothing runs in-between.

I feel the panic notification mechanism does really fit with a
hypervisor list, it's a good match with the nature of the list, which
aims at informing the panic notification to the hypervisor/FW.
Of course we can modify it if you prefer...but please take into account
the kdump case and how it complicates the logic.

Let me know your considerations, in case you can experiment with the
patch set as-is.
Cheers,


Guilherme

