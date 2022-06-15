Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB71E54CB85
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 16:38:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350186.576442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1UA6-0000Me-Sz; Wed, 15 Jun 2022 14:38:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350186.576442; Wed, 15 Jun 2022 14:38:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1UA6-0000KP-PN; Wed, 15 Jun 2022 14:38:26 +0000
Received: by outflank-mailman (input) for mailman id 350186;
 Wed, 15 Jun 2022 14:38:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kvx/=WW=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1o1UA5-0000KJ-I0
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 14:38:25 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce622bdb-ecb8-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 16:38:23 +0200 (CEST)
Received: from 179.red-81-39-194.dynamicip.rima-tde.net ([81.39.194.179]
 helo=[192.168.15.167]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1o1U8m-002LYs-SW; Wed, 15 Jun 2022 16:37:04 +0200
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
X-Inumbo-ID: ce622bdb-ecb8-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=75kgVCcqOPOLeu4JBiLLFab/dM4uNZ1dcLuvpDx9ZCg=; b=kAIWl67VuUe8cBDkmFOZTh4b+J
	Uy6PgE2+CwIEzhFEfsXCTAadcMkk5TefuTIBHvgzxNrjmUz+/r/f3fMBR5i8mMC7UweLMh9MkeJoD
	97gkOJRUGibA77qDy9s4vL7NkQkS1Sv+TX4WpruLFHmbGvImVgE9LeYadgdIraA8AGxMlB+PxaWy/
	1adKvJuvvpCbTsZosCqi5SMDlMupfKEgEY7JpKMS8HhvbF7gyowCTheRqW0YX0S9D05qpW9G1fKLt
	DJUWQ6k8Tz/HxaHb6kuJRSWnDBXrsJA/DQco3hh/lFSm8XLWvSeNFNfH2bKr+ugXM0hH/Gw2zl2s+
	laFslj7w==;
Message-ID: <362f6520-8209-1721-823c-11928338f57d@igalia.com>
Date: Wed, 15 Jun 2022 11:36:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 24/30] panic: Refactor the panic path
Content-Language: en-US
To: Petr Mladek <pmladek@suse.com>
Cc: bhe@redhat.com, d.hatayama@jp.fujitsu.com,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Mark Rutland <mark.rutland@arm.com>, mikelley@microsoft.com,
 vkuznets@redhat.com, akpm@linux-foundation.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
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
 arnd@arndb.de, bp@alien8.de, corbet@lwn.net, dave.hansen@linux.intel.com,
 dyoung@redhat.com, feng.tang@intel.com, gregkh@linuxfoundation.org,
 hidehiro.kawai.ez@hitachi.com, jgross@suse.com, john.ogness@linutronix.de,
 keescook@chromium.org, luto@kernel.org, mhiramat@kernel.org,
 mingo@redhat.com, paulmck@kernel.org, peterz@infradead.org,
 rostedt@goodmis.org, senozhatsky@chromium.org, stern@rowland.harvard.edu,
 tglx@linutronix.de, vgoyal@redhat.com, will@kernel.org
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-25-gpiccoli@igalia.com>
 <87fskzuh11.fsf@email.froward.int.ebiederm.org>
 <0d084eed-4781-c815-29c7-ac62c498e216@igalia.com> <Yqic0R8/UFqTbbMD@alley>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <Yqic0R8/UFqTbbMD@alley>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Perfect Petr, thanks for your feedback!

I'll be out for some weeks, but after that what I'm doing is to split
the series in 2 parts:

(a) The general fixes, which should be reviewed by subsystem maintainers
and even merged individually by them.

(b) The proper panic refactor, which includes the notifiers list split,
etc. I'll think about what I consider the best solution for the
crash_dump required ones, and will try to split in very simple patches
to make it easier to review.

Cheers,


Guilherme

