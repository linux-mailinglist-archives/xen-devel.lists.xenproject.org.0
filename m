Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD0E5222B1
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 19:29:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325936.548747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noTfz-0000Kc-Pz; Tue, 10 May 2022 17:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325936.548747; Tue, 10 May 2022 17:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noTfz-0000Hu-N8; Tue, 10 May 2022 17:29:35 +0000
Received: by outflank-mailman (input) for mailman id 325936;
 Tue, 10 May 2022 17:29:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uVqW=VS=goodmis.org=rostedt@kernel.org>)
 id 1noTfy-0000Ho-Cv
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 17:29:34 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c100f377-d086-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 19:29:32 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7D1D5B81E8F;
 Tue, 10 May 2022 17:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2BFC385C2;
 Tue, 10 May 2022 17:29:23 +0000 (UTC)
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
X-Inumbo-ID: c100f377-d086-11ec-8fc4-03012f2f19d4
Date: Tue, 10 May 2022 13:29:22 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Xiaoming Ni <nixiaoming@huawei.com>
Cc: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 <akpm@linux-foundation.org>, <bhe@redhat.com>, <pmladek@suse.com>,
 <kexec@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <bcm-kernel-feedback-list@broadcom.com>, <coresight@lists.linaro.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-alpha@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-edac@vger.kernel.org>,
 <linux-hyperv@vger.kernel.org>, <linux-leds@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linux-parisc@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
 <linux-s390@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <linux-um@lists.infradead.org>, <linux-xtensa@linux-xtensa.org>,
 <netdev@vger.kernel.org>, <openipmi-developer@lists.sourceforge.net>,
 <rcu@vger.kernel.org>, <sparclinux@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <x86@kernel.org>,
 <kernel-dev@igalia.com>, <kernel@gpiccoli.net>, <halves@canonical.com>,
 <fabiomirmar@gmail.com>, <alejandro.j.jimenez@oracle.com>,
 <andriy.shevchenko@linux.intel.com>, <arnd@arndb.de>, <bp@alien8.de>,
 <corbet@lwn.net>, <d.hatayama@jp.fujitsu.com>,
 <dave.hansen@linux.intel.com>, <dyoung@redhat.com>, <feng.tang@intel.com>,
 <gregkh@linuxfoundation.org>, <mikelley@microsoft.com>,
 <hidehiro.kawai.ez@hitachi.com>, <jgross@suse.com>,
 <john.ogness@linutronix.de>, <keescook@chromium.org>, <luto@kernel.org>,
 <mhiramat@kernel.org>, <mingo@redhat.com>, <paulmck@kernel.org>,
 <peterz@infradead.org>, <senozhatsky@chromium.org>,
 <stern@rowland.harvard.edu>, <tglx@linutronix.de>, <vgoyal@redhat.com>,
 <vkuznets@redhat.com>, <will@kernel.org>, Arjan van de Ven
 <arjan@linux.intel.com>, Cong Wang <xiyou.wangcong@gmail.com>, Sebastian
 Andrzej Siewior <bigeasy@linutronix.de>, Valentin Schneider
 <valentin.schneider@arm.com>
Subject: Re: [PATCH 18/30] notifier: Show function names on notifier
 routines if DEBUG_NOTIFIERS is set
Message-ID: <20220510132922.61883db0@gandalf.local.home>
In-Reply-To: <9f44aae6-ec00-7ede-ec19-6e67ceb74510@huawei.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
	<20220427224924.592546-19-gpiccoli@igalia.com>
	<9f44aae6-ec00-7ede-ec19-6e67ceb74510@huawei.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 28 Apr 2022 09:01:13 +0800
Xiaoming Ni <nixiaoming@huawei.com> wrote:

> > +#ifdef CONFIG_DEBUG_NOTIFIERS
> > +	{
> > +		char sym_name[KSYM_NAME_LEN];
> > +
> > +		pr_info("notifiers: registered %s()\n",
> > +			notifier_name(n, sym_name));
> > +	}  
> 
> Duplicate Code.
> 
> Is it better to use __func__ and %pS?
> 
> pr_info("%s: %pS\n", __func__, n->notifier_call);
> 
> 
> > +#endif

Also, don't sprinkle #ifdef in C code. Instead:

	if (IS_ENABLED(CONFIG_DEBUG_NOTIFIERS))
		pr_info("notifers: regsiter %ps()\n",
			n->notifer_call);


Or define a print macro at the start of the C file that is a nop if it is
not defined, and use the macro.

-- Steve

