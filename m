Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B570E51FD3E
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 14:51:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324518.546602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no2r7-0005d2-34; Mon, 09 May 2022 12:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324518.546602; Mon, 09 May 2022 12:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no2r6-0005aW-WF; Mon, 09 May 2022 12:51:17 +0000
Received: by outflank-mailman (input) for mailman id 324518;
 Mon, 09 May 2022 12:51:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11C1=VR=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1no2r5-0005aQ-E2
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 12:51:15 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4dfc307-cf96-11ec-8fc4-03012f2f19d4;
 Mon, 09 May 2022 14:51:13 +0200 (CEST)
Received: from [177.183.162.244] (helo=[192.168.0.5])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1no2qT-0003gn-07; Mon, 09 May 2022 14:50:37 +0200
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
X-Inumbo-ID: b4dfc307-cf96-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vNWZxas8t1kFoCf13D7/vaEHrhXkMcvheesCeQUODMg=; b=LiRqvKrtw9XJxMP26bz+wzbn1n
	fBHqZS6c/XR8QMIkcDbMMcoNGulyS43Rfp83nqthIjvwxcC0/rE6EUbNIf51/kQdvFB0MZLjpT1Zt
	jPlWUhML/RrgwA/8AbWtoLwz1yzaOdGTpwde1q8bM8ZApOffPjJ50hQj+UprMTPvFMZ+3kTukzvDC
	T+M3aUntgoIptglMOe9noJu8WxIIHyHpxsCC1uL0UNNnEkCrtSTA6MLc7ESoFMKljoD3/1VBzhboF
	ZG7o2pwmSFhOEypVckR6q5+g5/pOsvXV3qshYFBj5WEOrVLcV95X7vQdrWZ9lJh80TjIodpEGtnLe
	+KvSh8AA==;
Message-ID: <f9c3de3c-1709-a1aa-2ece-c9fbfd5e6d6a@igalia.com>
Date: Mon, 9 May 2022 09:50:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 08/30] powerpc/setup: Refactor/untangle panic notifiers
Content-Language: en-US
To: Hari Bathini <hbathini@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, pmladek@suse.com,
 kexec@lists.infradead.org, bhe@redhat.com, linux-leds@vger.kernel.org,
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
 rostedt@goodmis.org, senozhatsky@chromium.org, stern@rowland.harvard.edu,
 tglx@linutronix.de, vgoyal@redhat.com, vkuznets@redhat.com, will@kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 akpm@linux-foundation.org
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-9-gpiccoli@igalia.com>
 <3c34d8e2-6f84-933f-a4ed-338cd300d6b0@linux.ibm.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <3c34d8e2-6f84-933f-a4ed-338cd300d6b0@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/05/2022 15:55, Hari Bathini wrote:
> [...] 
> The change looks good. I have tested it on an LPAR (ppc64).
> 
> Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>
> 

Hi Michael. do you think it's possible to add this one to powerpc/next
(or something like that), or do you prefer a V2 with his tag?
Thanks,


Guilherme

