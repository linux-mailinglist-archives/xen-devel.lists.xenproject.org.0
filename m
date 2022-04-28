Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D49512812
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 02:29:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315887.534572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njs22-0001eF-1b; Thu, 28 Apr 2022 00:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315887.534572; Thu, 28 Apr 2022 00:29:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njs21-0001bY-UQ; Thu, 28 Apr 2022 00:29:17 +0000
Received: by outflank-mailman (input) for mailman id 315887;
 Thu, 28 Apr 2022 00:29:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQtA=VG=infradead.org=rdunlap@srs-se1.protection.inumbo.net>)
 id 1njs1z-0001bS-VW
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 00:29:17 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a603863-c68a-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 02:29:13 +0200 (CEST)
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njs1D-00B2Sy-UA; Thu, 28 Apr 2022 00:28:28 +0000
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
X-Inumbo-ID: 3a603863-c68a-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=oTHdXx/bNqvs0tUKZg1jX0QKDhKts3seYpf9QVBefoo=; b=GN1/nse5iki/WFV8HZE7gnZx8M
	eJUoKq0F73m9M9r3NgIBqsY0+vw93A0bLY3hZk7W2z6ntNRxf9y3czUAh8lb6xtyiL6iRkCGoMbr3
	13t311Tat608CEGCcNXVW95sxa2A683FvRnnoYsLI49dqQLiYKn/y05pL/vMxI0Bf3XOAu94o11W+
	nn9qk8zdTyrvuFjTnWtZ6o7af2OgOBH9Lb3syZMjRdfGkSipXa4zeUfKnDbho+LORacM3SyNN4LMV
	DjLIUchKFzC9+E73n2pj1o853yXO/ZfWMQcrLme864qTb5ygY07AwvTErV57FcFGuv7kOYC61ZuBl
	QQvKsP1Q==;
Message-ID: <4fe85e9c-4e96-e9d5-9fd8-f062bafcda4f@infradead.org>
Date: Wed, 27 Apr 2022 17:28:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 24/30] panic: Refactor the panic path
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
 vkuznets@redhat.com, will@kernel.org
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-25-gpiccoli@igalia.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220427224924.592546-25-gpiccoli@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/27/22 15:49, Guilherme G. Piccoli wrote:
> +	crash_kexec_post_notifiers
> +			This was DEPRECATED - users should always prefer the

			This is DEPRECATED - users should always prefer the

> +			parameter "panic_notifiers_level" - check its entry
> +			in this documentation for details on how it works.
> +			Setting this parameter is exactly the same as setting
> +			"panic_notifiers_level=4".

-- 
~Randy

