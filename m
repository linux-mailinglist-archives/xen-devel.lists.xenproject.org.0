Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DF7523E42
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 22:02:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327239.550009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nosW8-00069r-7N; Wed, 11 May 2022 20:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327239.550009; Wed, 11 May 2022 20:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nosW8-00067B-3X; Wed, 11 May 2022 20:01:04 +0000
Received: by outflank-mailman (input) for mailman id 327239;
 Wed, 11 May 2022 20:01:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SAT7=VT=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nosW5-000675-08
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 20:01:02 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12b88735-d165-11ec-a406-831a346695d4;
 Wed, 11 May 2022 22:00:59 +0200 (CEST)
Received: from [177.183.162.244] (helo=[192.168.0.5])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nosV8-0008ee-V8; Wed, 11 May 2022 22:00:04 +0200
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
X-Inumbo-ID: 12b88735-d165-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gDHQr/46Ll+YF5RXidB7bzodWcAOTgjTzZrI+em3L64=; b=g39PxeAmrsyeqF7oG7t83UmsmK
	q+jHGkHAbmWvohxv26/jw0X2fC5ZQGAB+1t+RR3Dc/QcY0t/UuqqV0Rw0e0vNKpR3Ghg3EjPFEyRu
	xmyuTU8VIa0JckQ1LnJMbsmPzyPVIePtyYzY2GC02et+W2URhxptR9GwDO/JS6MpbzrCHGb/n2EjF
	MPTZc218MFC/xIv1c3Q0VBsXMBQNsxYCCeLWiYkZzdC6cvR08qY5ppLv8+FOFZTVkTAZbUvYrBQWZ
	fyGL7frjV8v7tGHHjzO9nQTkj7crGcqaoQ0KxvgjDlDQp5VOe0vE/nPeGF7YvXLizE8zXvpcRYVIg
	fCPXiI+Q==;
Message-ID: <1c7dfe73-6691-1ca5-7555-27e81dff4dcd@igalia.com>
Date: Wed, 11 May 2022 16:58:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 22/30] panic: Introduce the panic post-reboot notifier
 list
Content-Language: en-US
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Sven Schnelle
 <svens@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
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
 <7017c234-7c73-524a-11b6-fefdd5646f59@igalia.com> <YnvoPe2cTS31qbjb@osiris>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <YnvoPe2cTS31qbjb@osiris>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/05/2022 13:45, Heiko Carstens wrote:
> [...]
>>
>> Hey S390/SPARC folks, sorry for the ping!
>>
>> Any reviews on this V1 would be greatly appreciated, I'm working on V2
>> and seeking feedback in the non-reviewed patches.
> 
> Sorry, missed that this is quite s390 specific. So, yes, this looks
> good to me and nice to see that one of the remaining CONFIG_S390 in
> common code will be removed!
> 
> For the s390 bits:
> Acked-by: Heiko Carstens <hca@linux.ibm.com>

No need for apologies, I really appreciate your review!
Will add your Ack for V2 =)

Cheers,


Guilherme

