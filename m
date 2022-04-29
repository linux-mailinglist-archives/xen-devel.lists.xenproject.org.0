Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCE6514B09
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 15:48:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317353.536637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkQyT-0007o1-P9; Fri, 29 Apr 2022 13:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317353.536637; Fri, 29 Apr 2022 13:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkQyT-0007mC-Lx; Fri, 29 Apr 2022 13:47:57 +0000
Received: by outflank-mailman (input) for mailman id 317353;
 Fri, 29 Apr 2022 13:47:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BV3H=VH=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nkQyP-0007m6-B4
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 13:47:56 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5daac61-c7c2-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 15:47:51 +0200 (CEST)
Received: from [179.113.53.197] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nkQxe-0007JF-GW; Fri, 29 Apr 2022 15:47:06 +0200
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
X-Inumbo-ID: f5daac61-c7c2-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=C2OEpCl3NbPTnDM8xzX2S4IX9JfHaO7AlvKh6b2mc6o=; b=pqe8NQsff608mhiYOzk5PDnm3n
	SqpJEt2cMOf7fKd9x6EBmHDeHOX5PyCqZaiQd+rsoiJqYRJfq3hy0YC1K+f5G6E1EYGyBkHkky/4o
	A4sr1jLh/ZiZsTRb8VvM35RQhf4WjzvO8x5RrxtfBf8C8C5PVdUgz7Ik51+zFewe+U63oi8LhMtjA
	jsMfNQ3e75qfSDrR+BCOQg4pDZsV5C5nFo1cAeFeQ7vSqL72QRCGkkh8ptmyZp43zUawgc2bKvA+V
	5dpGhl6WFgQXUob6WnQm5VHnfuqrvgLJ/w/gTZOEZRu0JtLeyWnhBKRg4Xfo6FA1ZDb4qCsQBNlya
	WoHGALzQ==;
Message-ID: <832eecc5-9569-1d95-6ab8-f029b660dfcb@igalia.com>
Date: Fri, 29 Apr 2022 10:46:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 17/30] tracing: Improve panic/die notifiers
Content-Language: en-US
To: Steven Rostedt <rostedt@goodmis.org>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, coresight@lists.linaro.org,
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
 senozhatsky@chromium.org, stern@rowland.harvard.edu, tglx@linutronix.de,
 vgoyal@redhat.com, vkuznets@redhat.com, will@kernel.org
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-18-gpiccoli@igalia.com>
 <b8771b37-01f5-f50b-dbb3-9db4ee26e67e@gmail.com>
 <20220429092351.10bca4dd@gandalf.local.home>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20220429092351.10bca4dd@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/04/2022 10:23, Steven Rostedt wrote:
> On Fri, 29 Apr 2022 12:22:44 +0300
> Sergei Shtylyov <sergei.shtylyov@gmail.com> wrote:
> 
>>> +	switch (ev) {
>>> +	case DIE_OOPS:
>>> +		do_dump = 1;
>>> +		break;
>>> +	case PANIC_NOTIFIER:
>>> +		do_dump = 1;
>>> +		break;  
>>
>>    Why not:
>>
>> 	case DIE_OOPS:
>> 	case PANIC_NOTIFIER:
>> 		do_dump = 1;
>> 		break;
> 
> Agreed.
> 
> Other than that.
> 
> Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> 
> -- Steve

Thanks Sergei and Steven, good idea! I thought about the switch change
you propose, but I confess I got a bit confused by the "fallthrough"
keyword - do I need to use it?

About the s/int/bool, for sure! Not sure why I didn't use bool at
first...heheh

Cheers,


Guilherme

