Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7505220FA
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 18:18:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325867.548630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noSYm-000434-RD; Tue, 10 May 2022 16:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325867.548630; Tue, 10 May 2022 16:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noSYm-00040h-Ng; Tue, 10 May 2022 16:18:04 +0000
Received: by outflank-mailman (input) for mailman id 325867;
 Tue, 10 May 2022 16:18:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F+UO=VS=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1noSYj-00040P-EW
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 16:18:04 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1a85d54-d07c-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 18:17:59 +0200 (CEST)
Received: from [177.183.162.244] (helo=[192.168.0.5])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1noSY8-0008UD-Jz; Tue, 10 May 2022 18:17:24 +0200
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
X-Inumbo-ID: c1a85d54-d07c-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DG+kC/U+ySej5D6tfV4OCa8YH0d8ESpuNC4bFJt4RU8=; b=C2KkFYKUIxmXZpa9w2+Tc0j2Ea
	RFFr76ch465vsOUiMZW1uqZNDnhRYy0QqpFeaougTFG9GOX2EvcKO8NnFtvJdvaTDSvmTGm5I6bLE
	gx/SYLZAEuVfjx7NJeu1tB8cieKdzixVjql/phg2ZRqRsu9xZgqdP1nbzw6Nv7UUXN3Dua0weQYl6
	+N3ACyNpHY020LPMtgokauBK3/rzBv0qIzP0VJEueNDPsJdk0Noe60ugWXyfyRTapgsSXBPVXAg4/
	oobDhrEfQYteiYAwrodL1TGkVGLJREzPqDYfYYN3sh0JBT6vnlq6trf1vxZCJI19NPJiA+YiSFKJe
	qkMs6K7A==;
Message-ID: <244a412c-4589-28d1-bb77-d3648d4f0b12@igalia.com>
Date: Tue, 10 May 2022 13:16:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 14/30] panic: Properly identify the panic event to the
 notifiers' callbacks
Content-Language: en-US
To: Petr Mladek <pmladek@suse.com>
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
 vkuznets@redhat.com, will@kernel.org
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-15-gpiccoli@igalia.com> <YnqBsXBImU64PAOL@alley>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <YnqBsXBImU64PAOL@alley>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/05/2022 12:16, Petr Mladek wrote:
> [...]
> Hmm, this looks like a hack. PANIC_UNUSED will never be used.
> All notifiers will be always called with PANIC_NOTIFIER.
> 
> The @val parameter is normally used when the same notifier_list
> is used in different situations.
> 
> But you are going to use it when the same notifier is used
> in more lists. This is normally distinguished by the @nh
> (atomic_notifier_head) parameter.
> 
> IMHO, it is a bad idea. First, it would confuse people because
> it does not follow the original design of the parameters.
> Second, the related code must be touched anyway when
> the notifier is moved into another list so it does not
> help much.
> 
> Or do I miss anything, please?
> 
> Best Regards,
> Petr

Hi Petr, thanks for the review.

I'm not strong attached to this patch, so we could drop it and refactor
the code of next patches to use the @nh as identification - but
personally, I feel this parameter could be used to identify the list
that called such function, in other words, what is the event that
triggered the callback. Some notifiers are even declared with this
parameter called "ev", like the event that triggers the notifier.


You mentioned 2 cases:

(a) Same notifier_list used in different situations;

(b) Same *notifier callback* used in different lists;

Mine is case (b), right? Can you show me an example of case (a)? You can
see in the following patches (or grep the kernel) that people are using
this identification parameter to determine which kind of OOPS trigger
the callback to condition the execution of the function to specific
cases. IIUIC, this is more or less what I'm doing, but extending the
idea for panic notifiers.

Again, as a personal preference, it makes sense to me using id's VS
comparing pointers to differentiate events/callers.

Cheers,


Guilherme

