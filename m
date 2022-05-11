Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9DC523E62
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 22:05:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327252.550031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nosaH-0007AP-2C; Wed, 11 May 2022 20:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327252.550031; Wed, 11 May 2022 20:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nosaG-000776-V4; Wed, 11 May 2022 20:05:20 +0000
Received: by outflank-mailman (input) for mailman id 327252;
 Wed, 11 May 2022 20:05:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SAT7=VT=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nosaE-00075w-I5
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 20:05:18 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad310eb4-d165-11ec-a406-831a346695d4;
 Wed, 11 May 2022 22:05:17 +0200 (CEST)
Received: from [177.183.162.244] (helo=[192.168.0.5])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nosZy-0009Kz-VC; Wed, 11 May 2022 22:05:03 +0200
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
X-Inumbo-ID: ad310eb4-d165-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cfPMnwRmX7h9FC5zogrRSwPWC8hDFfBXdcAc10BCDXg=; b=PNZaBGeXFsuAaBpHuaMdvRY4/s
	9D5MPz4xTVgTuRGWrB/KEfGG5tVa1JqSC/LT3Rso5sabWhCAduFdYhflwDt6bgTFq6qWGSH0+ncvk
	oTm6f/w8sOzZYRkq+1JkZmdb25beje8r1H2EX6HM4WVyQEo/2Q4CTK9pG4z28p8fSDjazKpN99+TQ
	EpXC0JAykc5ZUnUcVTqfleYx6Z4fPGlU4RkoA5IfJGN2tN+4XLZXjyd3oEcuP2YNdEgKXaQFpZZnR
	Vejz8nGO8jKYtblRG3YNO8+SxkagQsqAK3ZztXb4IgRQ6EnIjofQ7r4kch6g3mJv37QTO/U/Hn9jn
	eVwzVLtQ==;
Message-ID: <c8818906-f113-82b6-b58b-d47ae0c16b4f@igalia.com>
Date: Wed, 11 May 2022 17:03:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 23/30] printk: kmsg_dump: Introduce helper to inform
 number of dumpers
Content-Language: en-US
To: Steven Rostedt <rostedt@goodmis.org>
Cc: akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org,
 linux-alpha@vger.kernel.org, linux-edac@vger.kernel.org,
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
 <20220427224924.592546-24-gpiccoli@igalia.com>
 <20220510134014.3923ccba@gandalf.local.home>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20220510134014.3923ccba@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/05/2022 14:40, Steven Rostedt wrote:
> On Wed, 27 Apr 2022 19:49:17 -0300
> "Guilherme G. Piccoli" <gpiccoli@igalia.com> wrote:
> 
>> Currently we don't have a way to check if there are dumpers set,
>> except counting the list members maybe. This patch introduces a very
>> simple helper to provide this information, by just keeping track of
>> registered/unregistered kmsg dumpers. It's going to be used on the
>> panic path in the subsequent patch.
> 
> FYI, it is considered "bad form" to reference in the change log "this
> patch". We know this is a patch. The change log should just talk about what
> is being done. So can you reword your change logs (you do this is almost
> every patch). Here's what I would reword the above to be:
> 
>  Currently we don't have a way to check if there are dumpers set, except
>  perhaps by counting the list members. Introduce a very simple helper to
>  provide this information, by just keeping track of registered/unregistered
>  kmsg dumpers. This will simplify the refactoring of the panic path.

Thanks for the hint, you're right - it's almost in all of my patches.
I'll reword all of them (except the ones already merged) to remove this
"bad form".

Cheers,


Guilherme

