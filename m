Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A20952897F
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 18:07:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330056.553368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqdFY-0007Jr-AF; Mon, 16 May 2022 16:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330056.553368; Mon, 16 May 2022 16:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqdFY-0007Hs-6n; Mon, 16 May 2022 16:07:12 +0000
Received: by outflank-mailman (input) for mailman id 330056;
 Mon, 16 May 2022 16:07:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z64Z=VY=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nqdFW-0007Hk-I1
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 16:07:10 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c92025b-d532-11ec-bd2c-47488cf2e6aa;
 Mon, 16 May 2022 18:07:09 +0200 (CEST)
Received: from [177.183.162.244] (helo=[192.168.0.5])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nqdEm-006s2D-Fy; Mon, 16 May 2022 18:06:24 +0200
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
X-Inumbo-ID: 3c92025b-d532-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hkxxY/QtEmLaEz91h3ZbibgaO5mIVJpTDxNjCMnCCRs=; b=QJKb57mFKwMFscTO5WFY4RSj23
	KQ6n8H9l2g2SttLbeQWPGo2evZPJbMnkbERgI1GrlJbCyaovBQ7YNgsYgYWZV4AUB43bBYpAdAI4t
	tSUTgJhvOvNj6CgwWpUnZT0VvP1nPFnrhSTYeteC8TI+m63sh71ROWTeeLMsXDtJw57P/+L4voDEA
	fAA2sLoZLSjWU8escrCVSpKI49cJB+42jd6GXOMXbMkFbQNvfMy7UNTlghfu62nr5uAdPO/Hn/wFd
	nMAbmXIqsuv6JnFGW2A+NmrSU+Aj1YnRvsm6Le3RHEDyDM6bMieEJqNdqhsYzjUU2qgiLiCJOh07u
	ze5flEbQ==;
Message-ID: <63a74b56-89ef-8d1f-d487-cdb986aab798@igalia.com>
Date: Mon, 16 May 2022 13:05:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier list
Content-Language: en-US
To: Petr Mladek <pmladek@suse.com>, Tony Luck <tony.luck@intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>
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
 vkuznets@redhat.com, will@kernel.org, Alex Elder <elder@kernel.org>,
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
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <YoJgcC8c6LaKADZV@alley>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Thanks again for the review! Comments inline below:


On 16/05/2022 11:33, Petr Mladek wrote:
> [...]
>> --- a/drivers/edac/altera_edac.c
>> +++ b/drivers/edac/altera_edac.c
>> @@ -2163,7 +2162,7 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
>>  		int dberror, err_addr;
>>  
>>  		edac->panic_notifier.notifier_call = s10_edac_dberr_handler;
>> -		atomic_notifier_chain_register(&panic_notifier_list,
>> +		atomic_notifier_chain_register(&panic_pre_reboot_list,
> 
> My understanding is that this notifier first prints info about ECC
> errors and then triggers reboot. It might make sense to split it
> into two notifiers.

I disagree here - looping the maintainers for comments (CCing Dinh /
Tony). BTW, sorry for not having you on CC already Dinh, it was my mistake.

So, my reasoning here is: this notifier should fit the info list,
definitely! But...it's very high risk for kdump. It deep dives into the
regmap API (there are locks in such code) plus there is an (MM)IO write
to the device and an ARM firmware call. So, despite the nature of this
notifier _fits the informational list_, the _code is risky_ so we should
avoid running it before a kdump.

Now, we indeed have a chicken/egg problem: want to avoid it before
kdump, BUT in case kdump is not set, kmsg_dump() (and console flushing,
after your suggestion Petr) will run before it and not save collected
information from EDAC PoV.

My idea: I could call a second kmsg_dump() or at least a panic console
flush for within such notifier. Let me know what you think Petr (also
Dinh / Tony and all interested parties).


> [...] 
>> --- a/drivers/leds/trigger/ledtrig-panic.c
>> +++ b/drivers/leds/trigger/ledtrig-panic.c
>> @@ -64,7 +63,7 @@ static long led_panic_blink(int state)
>>  
>>  static int __init ledtrig_panic_init(void)
>>  {
>> -	atomic_notifier_chain_register(&panic_notifier_list,
>> +	atomic_notifier_chain_register(&panic_pre_reboot_list,
>>  				       &led_trigger_panic_nb);
> 
> Blinking => should go to the last "post_reboot/loop" list.
> [...] 
>> --- a/drivers/misc/ibmasm/heartbeat.c
>> +++ b/drivers/misc/ibmasm/heartbeat.c
>> @@ -32,20 +31,23 @@ static int suspend_heartbeats = 0;
>>  static int panic_happened(struct notifier_block *n, unsigned long val, void *v)
>>  {
>>  	suspend_heartbeats = 1;
>> -	return 0;
>> +	return NOTIFY_DONE;
>>  }
>>  
>> -static struct notifier_block panic_notifier = { panic_happened, NULL, 1 };
>> +static struct notifier_block panic_notifier = {
>> +	.notifier_call = panic_happened,
>> +};
>>  
>>  void ibmasm_register_panic_notifier(void)
>>  {
>> -	atomic_notifier_chain_register(&panic_notifier_list, &panic_notifier);
>> +	atomic_notifier_chain_register(&panic_pre_reboot_list,
>> +					&panic_notifier);
> 
> Same here. Blinking => should go to the last "post_reboot/loop" list.

Ack on both.

IBMasm is not blinking IIUC, but still fits properly the loop list. This
notifier would make a heartbeat mechanism stop, and once it's stopped,
service processor is allowed to reboot - that's my understanding.


Cheers,


Guilherme

