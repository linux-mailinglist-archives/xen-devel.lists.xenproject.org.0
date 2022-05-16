Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9115952870B
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 16:30:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329908.553191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqbjD-0004br-Ko; Mon, 16 May 2022 14:29:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329908.553191; Mon, 16 May 2022 14:29:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqbjD-0004ZP-Hv; Mon, 16 May 2022 14:29:43 +0000
Received: by outflank-mailman (input) for mailman id 329908;
 Mon, 16 May 2022 14:29:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z64Z=VY=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nqbjA-0004ZJ-T5
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 14:29:41 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d6078a0-d524-11ec-bd2c-47488cf2e6aa;
 Mon, 16 May 2022 16:29:38 +0200 (CEST)
Received: from [177.183.162.244] (helo=[192.168.0.5])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nqbiH-006jqF-NN; Mon, 16 May 2022 16:28:45 +0200
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
X-Inumbo-ID: 9d6078a0-d524-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dr1+fxlRa10p1m+vrzAuj1y5TNI2rJf4d/f63MyjB+M=; b=fYzY4ecO4EXD3ATClVXmZ0bJur
	Dv8wK0czHKvUOBFU8VuldwMBw90SyqpgmdhMVGQ8nXO736KAANyIsoQXQP33B+3yyoD0JCNk+aqdE
	wV4BChThAKeGVlTD0SJGL4Vxo4e8WEaw/u07Aef0GJ4zliM2Txb1MiVoO17nGrOaES7KtCdKD9gb0
	sGHl/FYmvmjU5t6Sh9/lpO3xyoHOnkZh2Wlu5eWU81axQTiGRY/vWICGCkOGZAWHyJcpjaIpuAOez
	xXU+abi85zQz75A1GTgWOD+LFSEreERO76kWgkEOfnkbC3cJ3TOsglz2ZOZKp2XuFNlT0F2Yx1p5e
	+2fZkv1A==;
Message-ID: <c6a55df0-11f5-21ae-8a61-b37141d2436b@igalia.com>
Date: Mon, 16 May 2022 11:28:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 20/30] panic: Add the panic informational notifier list
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
 vkuznets@redhat.com, will@kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Josh Triplett
 <josh@joshtriplett.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Leo Yan <leo.yan@linaro.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Mike Leach <mike.leach@linaro.org>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Neeraj Upadhyay <quic_neeraju@quicinc.com>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-21-gpiccoli@igalia.com> <YoJbeuTNBXOIypSH@alley>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <YoJbeuTNBXOIypSH@alley>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/05/2022 11:11, Petr Mladek wrote:
> [...]
> 
> All notifiers moved in this patch seems to fit well the "info"
> notifier list. The patch looks good from this POV.
> 
> I still have to review the rest of the patches to see if it
> is complete.
> 
> Best Regards,
> Petr

Thanks a bunch for the review =)

