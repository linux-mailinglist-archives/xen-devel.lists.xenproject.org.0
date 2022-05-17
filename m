Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCF952A5FD
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 17:20:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331065.554518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqyzf-0002lb-97; Tue, 17 May 2022 15:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331065.554518; Tue, 17 May 2022 15:20:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqyzf-0002hv-69; Tue, 17 May 2022 15:20:15 +0000
Received: by outflank-mailman (input) for mailman id 331065;
 Tue, 17 May 2022 15:20:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ghfa=VZ=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nqyzc-0002hl-QB
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 15:20:13 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5b88e2b-d5f4-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 17:20:08 +0200 (CEST)
Received: from 200-161-159-120.dsl.telesp.net.br ([200.161.159.120]
 helo=[192.168.1.60]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nqyyz-008b70-84; Tue, 17 May 2022 17:19:33 +0200
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
X-Inumbo-ID: d5b88e2b-d5f4-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wF3LghB7qFMkIN+RAhS0nW2784Fxel03VlqG6SoZfk8=; b=giQ6MXmBG17+JbZaHvCpLgBjCU
	FwsDXgX/b02O0QP8I+vkUwgy5+Lo+D5E+EJOGL5/JJvM2lmeYDRT6QF5s/JgDpbjXa08hzTZAOCcp
	H5UDG57PmVcXgDQ83UJ5J0cHOAPIvQgCaZLx9/QPzE06aTWYPlZURlCiNkAkSPoI1FmBlizReQXpJ
	dIElRXTKibRc33b/9HZXXl+Wf0mzN1goXhA+a9ZGenrB/fdH27xO8ledb2joDR0cLh2vGAmqvotM+
	JR0bWUJ+tmRYLx16LGJtXMspUiQTF3daEYzd/24Q2VypEyjqgtCV1aoMRt2LQ9YZpXkratOMOe37t
	53QKNYiQ==;
Message-ID: <bc485d09-0958-0ddc-7b2d-cbc806cf6a01@igalia.com>
Date: Tue, 17 May 2022 12:19:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
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
 <244a412c-4589-28d1-bb77-d3648d4f0b12@igalia.com> <YoOe7ifxfW8CEHdt@alley>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <YoOe7ifxfW8CEHdt@alley>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/05/2022 10:11, Petr Mladek wrote:
> [...]
>> You mentioned 2 cases:
>>
>> (a) Same notifier_list used in different situations;
>>
>> (b) Same *notifier callback* used in different lists;
>>
>> Mine is case (b), right? Can you show me an example of case (a)?
> 
> There are many examples of case (a):
> 
> [... snip ...] 
> These all call the same list/chain in different situations.
> The situation is distinguished by @val.
> 
> 
>> You can see in the following patches (or grep the kernel) that people are using
>> this identification parameter to determine which kind of OOPS trigger
>> the callback to condition the execution of the function to specific
>> cases.
> 
> Could you please show me some existing code for case (b)?
> I am not able to find any except in your patches.
> 

Hi Petr, thanks for the examples - I agree with you. In the end, seems
I'm kind of abusing the API. This id is used to distinguish different
situations in which the callback is called, but in the same
"realm"/notifier list.

In my case I have different list calling the same callback and
(ab-)using the id to make distinction. I can rework the patches using
pointer comparison, it's fine =)

So, I'll drop this patch in V2.

> Anyway, the solution in 16th patch is bad, definitely.
> hv_die_panic_notify_crash() uses "val" to disinguish
> both:
> 
>      + "panic_notifier_list" vs "die_chain"
>      + die_val when callen via "die_chain"
> 
> The API around "die_chain" API is not aware of enum panic_notifier_val
> and the API using "panic_notifier_list" is not aware of enum die_val.
> As I said, it is mixing apples and oranges and it is error prone.
> 

OK, I'll re-work that patch - there's more there to be changed, that one
is complex heheh

Cheers!

