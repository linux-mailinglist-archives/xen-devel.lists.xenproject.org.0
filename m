Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D80BF51FF5B
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 16:17:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324606.546734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no4CC-00048w-CD; Mon, 09 May 2022 14:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324606.546734; Mon, 09 May 2022 14:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no4CC-000461-9L; Mon, 09 May 2022 14:17:08 +0000
Received: by outflank-mailman (input) for mailman id 324606;
 Mon, 09 May 2022 14:17:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11C1=VR=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1no4CA-00045s-GY
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 14:17:06 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b29197c2-cfa2-11ec-a406-831a346695d4;
 Mon, 09 May 2022 16:17:03 +0200 (CEST)
Received: from [177.183.162.244] (helo=[192.168.0.5])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1no4Bp-000ApE-Jf; Mon, 09 May 2022 16:16:45 +0200
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
X-Inumbo-ID: b29197c2-cfa2-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vHtkmd2lwLYVtO4FWqrbyaVkWxRk4axb2Qa+PPeChZA=; b=LskkzzJmYfWYXPeDfr2IdCaTLR
	3hA3AwAXsFwPvw1yZOWysZYMySqHGiMeZOm0bDb2Q6RbJ01gLxUFvc0TPbGO4CNTknFlmWLHek9+j
	fNw6GIgfVAC2AwFEbPjx/A49ZgvLf4C98a1NhLhauKhl6X16yGXgUhVYkbLiMhd2bcyjc8FRhGAlV
	b0fE3r5ZHANgTVnzKk9zmgNYn+K1dB4VlK+OrOntysNOTeFSF6+gnM24q5MRGfpCActKh2ASDkGBP
	/lhbboZ2BaxSaPQdOYRyUWk/WZOTlB1ImMULVLiCjsomiGL/EUGjICR18d54kbZvnwoQGALy9IH6V
	nZhYpE5g==;
Message-ID: <7017c234-7c73-524a-11b6-fefdd5646f59@igalia.com>
Date: Mon, 9 May 2022 11:16:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 22/30] panic: Introduce the panic post-reboot notifier
 list
Content-Language: en-US
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Heiko Carstens <hca@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-leds@vger.kernel.org, pmladek@suse.com, bhe@redhat.com,
 akpm@linux-foundation.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
 kexec@lists.infradead.org, linux-tegra@vger.kernel.org,
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
 rostedt@goodmis.org, senozhatsky@chromium.org, stern@rowland.harvard.edu,
 tglx@linutronix.de, vgoyal@redhat.com, vkuznets@redhat.com, will@kernel.org
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-23-gpiccoli@igalia.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20220427224924.592546-23-gpiccoli@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/04/2022 19:49, Guilherme G. Piccoli wrote:
> Currently we have 3 notifier lists in the panic path, which will
> be wired in a way to allow the notifier callbacks to run in
> different moments at panic time, in a subsequent patch.
> 
> But there is also an odd set of architecture calls hardcoded in
> the end of panic path, after the restart machinery. They're
> responsible for late time tunings / events, like enabling a stop
> button (Sparc) or effectively stopping the machine (s390).
> 
> This patch introduces yet another notifier list to offer the
> architectures a way to add callbacks in such late moment on
> panic path without the need of ifdefs / hardcoded approaches.
> 
> Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Sven Schnelle <svens@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>

Hey S390/SPARC folks, sorry for the ping!

Any reviews on this V1 would be greatly appreciated, I'm working on V2
and seeking feedback in the non-reviewed patches.

Thanks in advance,


Guilherme

