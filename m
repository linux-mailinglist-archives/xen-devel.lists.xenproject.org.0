Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0325B515498
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 21:32:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317658.537093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkWLU-00058U-PU; Fri, 29 Apr 2022 19:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317658.537093; Fri, 29 Apr 2022 19:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkWLU-00055p-M4; Fri, 29 Apr 2022 19:32:04 +0000
Received: by outflank-mailman (input) for mailman id 317658;
 Fri, 29 Apr 2022 19:32:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BV3H=VH=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nkWLS-00055j-6O
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 19:32:03 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09a92712-c7f3-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 21:32:00 +0200 (CEST)
Received: from [179.113.53.197] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nkWKu-000A9h-7O; Fri, 29 Apr 2022 21:31:28 +0200
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
X-Inumbo-ID: 09a92712-c7f3-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=juYOl8ucSjuSHKXBe+1Ir5OPZr6pZdgx66h4OReE1Ko=; b=pi8CeEHRcdz9D2M05lfyhONNOe
	Il5P/FNtKNDpfNnQvQkUO53LGYEhZ3HsOKcMT79tXUkEM7BDaPWYeiTRxruHlFJpgYZGLdkNZ+Vsx
	oyZivn3CQn+HYfOJsn02OXmy5/HYryfVse/FM/IqF31FwAMG26clpYwK7OV3zBWRhtbMoUne9k8x/
	cgyBslKy2FDshbzCm4dWwDcEIOqWM+BTXUAPCGsxBvDFlTKuVtiafdc18oTYk2LsBlxeiWqHf76sU
	fr20/x47wOCPaQYIMtyh+VGeHVXZk4bWHmVx7ebZUj8zme4Hs0U5M9F5U1lcdb0DAeivSR+YRjiw8
	sBGOVwOQ==;
Message-ID: <039cdf14-efc5-383b-3f3d-294a5ed9243e@igalia.com>
Date: Fri, 29 Apr 2022 16:31:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 13/30] s390/consoles: Improve panic notifiers reliability
Content-Language: en-US
To: Heiko Carstens <hca@linux.ibm.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
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
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-14-gpiccoli@igalia.com> <YmwyjMtT7QTZiHaa@osiris>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <YmwyjMtT7QTZiHaa@osiris>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/04/2022 15:46, Heiko Carstens wrote:
> [...]
> 
> Code looks good, and everything still seems to work. I applied this
> internally for the time being, and if it passes testing, I'll schedule
> it for the next merge window.
> 
> Thanks!

Perfect Heiko, thanks a bunch for your review and tests!
Let me know if anything breaks heh
Cheers,


Guilherme

