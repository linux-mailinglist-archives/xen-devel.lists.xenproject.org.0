Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E29514E5C
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 16:51:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317433.536748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkRy1-0003D6-QN; Fri, 29 Apr 2022 14:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317433.536748; Fri, 29 Apr 2022 14:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkRy1-0003B3-N3; Fri, 29 Apr 2022 14:51:33 +0000
Received: by outflank-mailman (input) for mailman id 317433;
 Fri, 29 Apr 2022 14:51:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BV3H=VH=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nkRxz-0003Ax-P3
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 14:51:31 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da8dd4a2-c7cb-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 16:51:30 +0200 (CEST)
Received: from [179.113.53.197] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nkRxT-000A9L-NU; Fri, 29 Apr 2022 16:51:00 +0200
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
X-Inumbo-ID: da8dd4a2-c7cb-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Cjm9Suf796xRefBryIv3VFGXEqCg0nq87G3JemtP6KI=; b=bOkvcmrOB4yWUf0ctf6A3r5C4o
	aGPNIkUqTShj3NXe1fQ9QnabHeBC5wUw85w3lcbzp41YUx6lI64SyTBc+R9iDEVFjkoDKQQTgPy7h
	273qYkEvGo09cqDCBxJ/qx7PIhv1bF1QhE39mt6cGaKYQ3WbFc+SFQq5LvAEXFJkLusPN7e5Q2PZK
	roci1iw1YHbfVmH13T9qkHZElt6ySbfsFxOd+T6mw3OVW5ydz5FagyqIAlf4Yk69T4v6GBs3z1SwV
	dFo6XNp8moGQFWImiZj9BmwXekz/oeTAh8/7Imc9/VjCAhGKmOrC5yxOD82kD1wVNeFw+T4dSUWnI
	V5zt266A==;
Message-ID: <e169f964-2cd7-b9c5-7080-0505d52caa12@igalia.com>
Date: Fri, 29 Apr 2022 11:50:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 20/30] panic: Add the panic informational notifier list
Content-Language: en-US
To: Suzuki K Poulose <suzuki.poulose@arm.com>, paulmck@kernel.org
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 bcm-kernel-feedback-list@broadcom.com, coresight@lists.linaro.org,
 linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
 kexec@lists.infradead.org, linux-leds@vger.kernel.org,
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
 mingo@redhat.com, peterz@infradead.org, rostedt@goodmis.org,
 senozhatsky@chromium.org, stern@rowland.harvard.edu, tglx@linutronix.de,
 vgoyal@redhat.com, vkuznets@redhat.com, will@kernel.org,
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
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, pmladek@suse.com,
 bhe@redhat.com
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-21-gpiccoli@igalia.com>
 <7956ab00-66b6-bd89-dcc0-f10cf2741e4d@arm.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <7956ab00-66b6-bd89-dcc0-f10cf2741e4d@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Thanks Paul and Suzuki for the ACKs.
Cheers,


Guilherme

