Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A553A528A0E
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 18:15:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330113.553434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqdNH-0003KP-Ft; Mon, 16 May 2022 16:15:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330113.553434; Mon, 16 May 2022 16:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqdNH-0003Ia-CN; Mon, 16 May 2022 16:15:11 +0000
Received: by outflank-mailman (input) for mailman id 330113;
 Mon, 16 May 2022 16:15:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z64Z=VY=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nqdNF-0003IU-UF
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 16:15:09 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a4c678d-d533-11ec-bd2c-47488cf2e6aa;
 Mon, 16 May 2022 18:15:09 +0200 (CEST)
Received: from [177.183.162.244] (helo=[192.168.0.5])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nqdMt-006sm6-Mg; Mon, 16 May 2022 18:14:47 +0200
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
X-Inumbo-ID: 5a4c678d-d533-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PIv49Au7mWUtjtiXxMXTyggVGnciDRRtT7um8nVDYk4=; b=W9A8UVl73mnQpa2JfREz1/RjUD
	zYyRgDERy8oLTucF5f6T3XYTYFxiYllr5CQxIlx/2/XHDyXsh2W9hjY4uVe+74TxD7M98QISaac+a
	M7XywdJvFk3YG6Om4dgtt5ZeREfbqmya73Q1q8sGS0PyxTmdYWxoXovpo5Reb9GHmn6GX3kYePtt9
	IQtccx7PFkV6oeWvXiWxYIASmBN1PSkHoG23EqfeJ4/9AnnlTg/3Cg5Gj6/V0JoJ4G9Oz6SNv0UpO
	oX86uCQ+LAaAZQRMJjQodINX8vAHrHrxg8rbSrTF+qNyz++8FSDvG3i4nZYWzKQgJVfsg8L/5DYyI
	pIoBjijQ==;
Message-ID: <90133fbb-2b5e-e7cd-e1fc-1f74e8bcd388@igalia.com>
Date: Mon, 16 May 2022 13:14:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 18/30] notifier: Show function names on notifier routines
 if DEBUG_NOTIFIERS is set
Content-Language: en-US
To: Steven Rostedt <rostedt@goodmis.org>, Xiaoming Ni <nixiaoming@huawei.com>
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
 vgoyal@redhat.com, vkuznets@redhat.com, will@kernel.org,
 Arjan van de Ven <arjan@linux.intel.com>,
 Cong Wang <xiyou.wangcong@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Valentin Schneider <valentin.schneider@arm.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-19-gpiccoli@igalia.com>
 <9f44aae6-ec00-7ede-ec19-6e67ceb74510@huawei.com>
 <20220510132922.61883db0@gandalf.local.home>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20220510132922.61883db0@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/05/2022 14:29, Steven Rostedt wrote:
> [...]
> Also, don't sprinkle #ifdef in C code. Instead:
> 
> 	if (IS_ENABLED(CONFIG_DEBUG_NOTIFIERS))
> 		pr_info("notifers: regsiter %ps()\n",
> 			n->notifer_call);
> 
> 
> Or define a print macro at the start of the C file that is a nop if it is
> not defined, and use the macro.

Thanks, I'll go with the IS_ENABLED() idea in V2 - appreciate the hint.
Cheers,


Guilherme

