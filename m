Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E1D532446
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 09:41:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336211.560550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPAq-0004z5-NF; Tue, 24 May 2022 07:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336211.560550; Tue, 24 May 2022 07:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPAq-0004v1-JD; Tue, 24 May 2022 07:41:48 +0000
Received: by outflank-mailman (input) for mailman id 336211;
 Tue, 24 May 2022 07:41:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ru06=WA=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1ntP5u-0003DA-Nd
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 07:36:45 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b34d2f76-dad8-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 22:41:21 +0200 (CEST)
Received: from 200-161-159-120.dsl.telesp.net.br ([200.161.159.120]
 helo=[192.168.1.60]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ntEr0-00Gje9-7b; Mon, 23 May 2022 22:40:38 +0200
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
X-Inumbo-ID: b34d2f76-dad8-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LG2HkLvcft3PZ/5y+RaNtcoQpztQykGkc8EQp8pxJfI=; b=fPCMiuZns16FgBzoGF9Je3OLkO
	LL4L2QHAG/wGtiXgEhS21zRsWqE1LMzGwwDxe6f9KpfZaY9eV7CGD4vwhcqTRNInSSR1HDaLnpPpS
	miMpU8/+9j0GmfawjCEu88Tqk7uAI9V6UbtlRLQsT2Paj7KpRr9Eexx/1nt9uyC0/PRdqZ6qso//5
	331flFwFw5rYDxq1lD4s7YGntuImz8x8p2XDCS463SY8sQhksTBKudAp4pKnME8DpTbZ4fGAvbQxT
	wafY442u8mSqR6x/cwniP7CEUq4fd8W+eVImWzP4xrptC52doj1jXiLwbdsJQSnWbw0nF1P7Xd8f/
	wPYC4mSw==;
Message-ID: <0dda86c0-3a54-8c70-d1e7-18bbb4d41bab@igalia.com>
Date: Mon, 23 May 2022 17:40:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 12/30] parisc: Replace regular spinlock with spin_trylock
 on panic path
Content-Language: en-US
To: Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, kexec@lists.infradead.org,
 pmladek@suse.com, bhe@redhat.com, akpm@linux-foundation.org,
 bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org,
 linux-alpha@vger.kernel.org, linux-edac@vger.kernel.org,
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
 rostedt@goodmis.org, senozhatsky@chromium.org, stern@rowland.harvard.edu,
 tglx@linutronix.de, vgoyal@redhat.com, vkuznets@redhat.com, will@kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-13-gpiccoli@igalia.com>
 <6a7c924a-54a9-c5ea-8a9d-3ea92987b436@gmx.de>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <6a7c924a-54a9-c5ea-8a9d-3ea92987b436@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/04/2022 13:55, Helge Deller wrote:
> [...]
> You may add:
> Acked-by: Helge Deller <deller@gmx.de> # parisc
> 
> Helge

Hi Helge, do you think would be possible to still pick this one for
v5.19 or do you prefer to hold for the next release?

I'm working on V2, so if it's merged for 5.19 I won't send it again.
Thanks,


Guilherme

