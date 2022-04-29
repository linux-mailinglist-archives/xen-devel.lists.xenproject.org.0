Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6BD5154A9
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 21:35:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317668.537103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkWOt-0005ig-82; Fri, 29 Apr 2022 19:35:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317668.537103; Fri, 29 Apr 2022 19:35:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkWOt-0005h4-54; Fri, 29 Apr 2022 19:35:35 +0000
Received: by outflank-mailman (input) for mailman id 317668;
 Fri, 29 Apr 2022 19:35:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BV3H=VH=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nkWOr-0005gy-9i
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 19:35:33 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88118ffb-c7f3-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 21:35:32 +0200 (CEST)
Received: from [179.113.53.197] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nkWOO-000AEq-R6; Fri, 29 Apr 2022 21:35:05 +0200
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
X-Inumbo-ID: 88118ffb-c7f3-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lwmIjCyQy1cvf/HfruQUsqg2HO2zLsQJj36FVBjRlMY=; b=FMeK+qaOrNt+CW3KPA3fG+Sm88
	9dOTCLRIKwFZQHJ+4m/FuvGgtzWqdtsbg7jNNtnRqzh6mH5yhN/kcNgqlSXGFzr+Is403C8lKfeIe
	GFE0d2xZtQSLJr4I8RU79yspLu2jmEMkBcLB9rf7ILb4vrthTaqCp6aHTQGFnReVgkS13mVrLfnHx
	HX+CWHd9YGmcd+hSxhVaiC1N67Jxo0tAWbskOVNhQbgFNnliiB3BK9xH4rhhSehlShKQIEHmaxjCC
	oWiRKIIVo1UNa1pRoT5oqrZz7cmRkXzPYEYIQdMbmHXt76jbfgPiC/AOizH1U1QXiwvnp20pJNRvp
	Fw18KdiA==;
Message-ID: <5af45ed0-7b0a-5664-a9d3-c53ea001a35e@igalia.com>
Date: Fri, 29 Apr 2022 16:34:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier list
Content-Language: en-US
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, bhe@redhat.com,
 Petr Mladek <pmladek@suse.com>, kexec@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linuxppc-dev@lists.ozlabs.org,
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
 linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-mips@vger.kernel.org,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-s390 <linux-s390@vger.kernel.org>, linux-tegra@vger.kernel.org,
 linux-um@lists.infradead.org,
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 netdev <netdev@vger.kernel.org>, openipmi-developer@lists.sourceforge.net,
 rcu@vger.kernel.org,
 "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>,
 xen-devel@lists.xenproject.org,
 "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>, kernel-dev@igalia.com,
 kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com,
 alejandro.j.jimenez@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
 Jonathan Corbet <corbet@lwn.net>, d.hatayama@jp.fujitsu.com,
 Dave Hansen <dave.hansen@linux.intel.com>, dyoung@redhat.com,
 feng.tang@intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 mikelley@microsoft.com, hidehiro.kawai.ez@hitachi.com, jgross@suse.com,
 john.ogness@linutronix.de, Kees Cook <keescook@chromium.org>,
 Andrew Lutomirski <luto@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, paulmck@kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, stern@rowland.harvard.edu,
 Thomas Gleixner <tglx@linutronix.de>, vgoyal@redhat.com,
 vkuznets@redhat.com, Will Deacon <will@kernel.org>,
 Alex Elder <elder@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
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
 <mchehab@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 Richard Henderson <rth@twiddle.net>, Richard Weinberger <richard@nod.at>,
 Robert Richter <rric@kernel.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tony Luck <tony.luck@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Wei Liu <wei.liu@kernel.org>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-22-gpiccoli@igalia.com>
 <CAMo8BfKzA+oy-Qun9-aO3xCr4Jy_rfdjYqMX=W9xONCSX8O51Q@mail.gmail.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <CAMo8BfKzA+oy-Qun9-aO3xCr4Jy_rfdjYqMX=W9xONCSX8O51Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/04/2022 13:04, Max Filippov wrote:
> [...]
>>  arch/xtensa/platforms/iss/setup.c     |  4 ++--For xtensa:
> 
> For xtensa:
> Acked-by: Max Filippov <jcmvbkbc@gmail.com>
> 

Perfect, thanks Max!
Cheers,


Guilherme

