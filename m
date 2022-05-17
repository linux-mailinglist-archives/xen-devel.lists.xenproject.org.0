Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D29052A6C7
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 17:34:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331134.554618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzDY-0000ge-8f; Tue, 17 May 2022 15:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331134.554618; Tue, 17 May 2022 15:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzDY-0000dc-4c; Tue, 17 May 2022 15:34:36 +0000
Received: by outflank-mailman (input) for mailman id 331134;
 Tue, 17 May 2022 15:34:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ghfa=VZ=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nqzDX-0008NM-De
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 15:34:35 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9b7a344-d5f6-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 17:34:34 +0200 (CEST)
Received: from 200-161-159-120.dsl.telesp.net.br ([200.161.159.120]
 helo=[192.168.1.60]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nqzDK-008cDX-EE; Tue, 17 May 2022 17:34:22 +0200
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
X-Inumbo-ID: d9b7a344-d5f6-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=H3qrTQv7Tt4PXBVt8796c6Ly9chEP2DhR9UJaIWJhqo=; b=Kd/s+xrChiBK9NaSmFnFXM3RYc
	UbvPwTdgYlS5Qa0rscW/rbtbKNYmUFJYz6cuBPp5A2fzucoID0yV96EUGF05FAOiWz8RXWusO+AHA
	8G50ebt3m708xrBW8WQ3edVZ8TFa1h54Wb9WFcR4fr7CEuRFULxnhNWBP/+YYHyvucLESFjbnRE2j
	n9qbZb3QL+2yKsrt97dJ6Amu5IZoY/oVzVzN5MU2xEsTlE/L+2AbQmiktH83j3MJhKZ0jI46IVrKr
	LNwCY2ghNt9ogJWj8KzB1ejgALFJxydhnjupRBVywOgqfhSwQwo7FdrzyqWruEBFvoxYw8EKWcKt2
	QJUgWtTw==;
Message-ID: <31f96f73-46b5-aa6f-a5db-5052c6f3fc92@igalia.com>
Date: Tue, 17 May 2022 12:33:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 17/30] tracing: Improve panic/die notifiers
Content-Language: en-US
To: Petr Mladek <pmladek@suse.com>, rostedt@goodmis.org
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
 peterz@infradead.org, senozhatsky@chromium.org, stern@rowland.harvard.edu,
 tglx@linutronix.de, vgoyal@redhat.com, vkuznets@redhat.com, will@kernel.org
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-18-gpiccoli@igalia.com>
 <20220511114541.GC26047@pathway.suse.cz>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20220511114541.GC26047@pathway.suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/05/2022 08:45, Petr Mladek wrote:
> [...]
> DIE_OOPS and PANIC_NOTIFIER are from different enum.
> It feels like comparing apples with oranges here.
> 
> IMHO, the proper way to unify the two notifiers is
> a check of the @self parameter. Something like:
> 
> static int trace_die_panic_handler(struct notifier_block *self,
> 				unsigned long ev, void *unused)
> {
> 	if (self == trace_die_notifier && val != DIE_OOPS)
> 		goto out;
> 
> 	ftrace_dump(ftrace_dump_on_oops);
> out:
> 	return NOTIFY_DONE;
> }
> 
> Best Regards,
> Petr

OK Petr, thanks - will implement your suggestion in V2 (CC Steven)

Cheers!

