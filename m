Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EEF51734A
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 17:51:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318997.539042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlYKU-00086S-P4; Mon, 02 May 2022 15:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318997.539042; Mon, 02 May 2022 15:51:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlYKU-000839-LI; Mon, 02 May 2022 15:51:18 +0000
Received: by outflank-mailman (input) for mailman id 318997;
 Mon, 02 May 2022 15:51:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7iax=VK=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nlYKT-000833-S3
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 15:51:17 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2d74348-ca2f-11ec-a405-831a346695d4;
 Mon, 02 May 2022 17:51:16 +0200 (CEST)
Received: from [179.113.53.197] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nlYKD-0006x9-MY; Mon, 02 May 2022 17:51:01 +0200
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
X-Inumbo-ID: b2d74348-ca2f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vs1TxitJVaqXfZt5+JAgzgpJc3Rl9y+sqSF7sQt0958=; b=CYM+I+cStAj6nsmkdvAL01St6e
	IV8WQNLOxWhy3UHpXhc9ZYxNJzq7ZxpyOwHWort+30gmSz14Tjb7K8kvM2hGR2PPX3dc7GXMEaskm
	g34Tjq/8qIJgML47/2DCuEUnFB03pqMfnk/uwmQB09CDWgBvh7TL/gFDoH0TI9HOJ3bezLUV1DrKv
	MwXxD9LKMhdDIB0wdDr6Kr32RysL68LVvKOkDfa5SERbORMzBS0ZyutauBA2Ekqa3472ChMBhe54V
	1FaXK1lleaqm8beFaaq7IO5wyd2Jb5T5RV+lvaTO/6luDzRXN43duubtlHaOQOQQCOGaRTF8O2nxl
	BUemy2kw==;
Message-ID: <af03a6ef-6b92-31cd-72d4-47b82bc47f87@igalia.com>
Date: Mon, 2 May 2022 12:50:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 15/30] bus: brcmstb_gisb: Clean-up panic/die notifiers
Content-Language: en-US
To: Florian Fainelli <f.fainelli@gmail.com>, akpm@linux-foundation.org,
 bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
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
 Brian Norris <computersforpeace@gmail.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-16-gpiccoli@igalia.com>
 <eaf3a893-00dd-8717-202e-911b395670e1@gmail.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <eaf3a893-00dd-8717-202e-911b395670e1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/05/2022 12:38, Florian Fainelli wrote:
> [...] 
> 
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> Not sure if the Fixes tag is warranted however as this is a clean up, 
> and not really fixing a bug.

Perfect, thanks Florian. I'll add your ACK and remove the fixes tag in V2.
Cheers,


Guilherme

