Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AB5513688
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 16:13:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316587.535535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk4te-0001TG-LB; Thu, 28 Apr 2022 14:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316587.535535; Thu, 28 Apr 2022 14:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk4te-0001QY-IH; Thu, 28 Apr 2022 14:13:30 +0000
Received: by outflank-mailman (input) for mailman id 316587;
 Thu, 28 Apr 2022 14:13:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/SSK=VG=ieee.org=elder@srs-se1.protection.inumbo.net>)
 id 1nk4tc-0000yD-E2
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 14:13:28 +0000
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [2607:f8b0:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d4d27e4-c6fd-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 16:13:24 +0200 (CEST)
Received: by mail-il1-x130.google.com with SMTP id g10so2055293ilf.6
 for <xen-devel@lists.xenproject.org>; Thu, 28 Apr 2022 07:13:25 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58]) by smtp.googlemail.com with ESMTPSA id
 y21-20020a6bc415000000b00648da092c8esm4431ioa.14.2022.04.28.07.13.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 07:13:23 -0700 (PDT)
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
X-Inumbo-ID: 5d4d27e4-c6fd-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=bCT2JlxzOcDaE6ycYVbjB0p6hzfQxFS5OmPVl0XHT4A=;
        b=ByPVeKDwQRcuSB47O0Zefv/dFt5S0aRWMNs2oJF7maE4wXnsormuysnBE3KE+1D9p9
         PB3FB3BjkOR/97x+74MBqA5RA9WqHK53ukE6KnmiwNvHyxwXKz6iLxoZSM4bciItAhHz
         gddQYhhdQpsolBOdwDYZPGvNMFMyqb4ql/QD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bCT2JlxzOcDaE6ycYVbjB0p6hzfQxFS5OmPVl0XHT4A=;
        b=agqo5ToYGDYiPPynIpg5HMBY0XFQm9D1ccVgSVEfxgm+s8jDrSDEOk+cnIi3IMfh7O
         iBcmPxvPWk+WVU2kn+aMIbx/uGwUh4shqjPlxP4oo7LL4dqpVck0y24ztMd/DzKVyfzt
         KDi8TUFYH/jIkn13o1TBI4+maJgvPg3j8XEFnRhADDRIAz+1E7qqlT7uGBMloZKWiST4
         sGvImVa5Ma7ta+U+aaQJNgVeey5CwQ4AlKeMzAOXj8/Pp6OOvOg85shIuN6L8sbYoOxM
         B01sahC8uIS55oFWcvFAv6beLYcF4jHOhwGtDIsg99mibumQf9M+/56IRjJS2fuP51mx
         mfFw==
X-Gm-Message-State: AOAM530BTyR4nesLu/zLMa+95g2uIBJz1gzAHonfZKtvtGwF4QxxX305
	hQ+6esw1eZQOVYgN0SQXfnQokw==
X-Google-Smtp-Source: ABdhPJw448TngRonNTsTASYhGkruvfda4Cqi/x7py0vOs1UkbxiFSjNKZ9c5oG5pi/4oeINikW5dJA==
X-Received: by 2002:a92:cac3:0:b0:2c9:a265:4cab with SMTP id m3-20020a92cac3000000b002c9a2654cabmr13504351ilq.241.1651155203895;
        Thu, 28 Apr 2022 07:13:23 -0700 (PDT)
Message-ID: <4cae140c-982a-6b9f-661c-4e0fdfa3297b@ieee.org>
Date: Thu, 28 Apr 2022 09:13:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier list
Content-Language: en-US
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, akpm@linux-foundation.org,
 bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 coresight@lists.linaro.org, linuxppc-dev@lists.ozlabs.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
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
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 James Morse <james.morse@arm.com>, Johannes Berg
 <johannes@sipsolutions.net>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Pavel Machek <pavel@ucw.cz>, Richard Henderson <rth@twiddle.net>,
 Richard Weinberger <richard@nod.at>, Robert Richter <rric@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tony Luck <tony.luck@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Wei Liu <wei.liu@kernel.org>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-22-gpiccoli@igalia.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20220427224924.592546-22-gpiccoli@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/27/22 5:49 PM, Guilherme G. Piccoli wrote:
> This patch renames the panic_notifier_list to panic_pre_reboot_list;
> the idea is that a subsequent patch will refactor the panic path
> in order to better split the notifiers, running some of them very
> early, some of them not so early [but still before kmsg_dump()] and
> finally, the rest should execute late, after kdump. The latter ones
> are now in the panic pre-reboot list - the name comes from the idea
> that these notifiers execute before panic() attempts rebooting the
> machine (if that option is set).
> 
> We also took the opportunity to clean-up useless header inclusions,
> improve some notifier block declarations (e.g. in ibmasm/heartbeat.c)
> and more important, change some priorities - we hereby set 2 notifiers
> to run late in the list [iss_panic_event() and the IPMI panic_event()]
> due to the risks they offer (may not return, for example).
> Proper documentation is going to be provided in a subsequent patch,
> that effectively refactors the panic path.
> 
> Cc: Alex Elder <elder@kernel.org>

For "drivers/net/ipa/ipa_smp2p.c":

Acked-by: Alex Elder <elder@kernel.org>

> Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
> Cc: Corey Minyard <minyard@acm.org>
> Cc: Dexuan Cui <decui@microsoft.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Haiyang Zhang <haiyangz@microsoft.com>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Johannes Berg <johannes@sipsolutions.net>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: "K. Y. Srinivasan" <kys@microsoft.com>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Robert Richter <rric@kernel.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Stephen Hemminger <sthemmin@microsoft.com>
> Cc: Sven Schnelle <svens@linux.ibm.com>
> Cc: Tony Luck <tony.luck@intel.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Wei Liu <wei.liu@kernel.org>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
> 

. . .

