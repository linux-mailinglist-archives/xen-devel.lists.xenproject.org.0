Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE44EA12A30
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 18:53:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872981.1283979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY7ZN-0005uA-Hz; Wed, 15 Jan 2025 17:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872981.1283979; Wed, 15 Jan 2025 17:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY7ZN-0005sg-En; Wed, 15 Jan 2025 17:52:45 +0000
Received: by outflank-mailman (input) for mailman id 872981;
 Wed, 15 Jan 2025 17:52:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p+DL=UH=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1tY7ZL-0005sa-U0
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 17:52:44 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84b171ba-d369-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 18:52:42 +0100 (CET)
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
X-Inumbo-ID: 84b171ba-d369-11ef-a0e1-8be0dac302b0
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736963561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HoxPdbGDiDXMZjZ2YzakPSB0m74gINsG6VFgtuazYj8=;
	b=O59TkAiVIoh/kyWqt3sD2QUaiElCxlt4joNfsm5Vy47rl6VB5TFRsEG8yyBoGzvY2r/6mY
	lQrxl2KFOtZwXB8o2yGswqA28AwPR3ILexVj+8YMlHNoNTQyAqrecm5DQu43fEOAoeu1zB
	AUUJUV3mFLL/jKj4Q1eejS9vRnjN/1NreJFiVLN6lXCv97Xxmp1pRrzkdAR4+8k7oYySE3
	EjRlx3bwRLZ1kPZatpooq203bOQXFsUoJ5K9wvWgIoGkzYbbWPFekFpYB6FKtIibo4IGCl
	3qtrgWckX7984+Okk9ULQbx1KIxKVOK20qnnIXjJMWBsTxDlkgtJ8kE9XE9ROg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736963561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HoxPdbGDiDXMZjZ2YzakPSB0m74gINsG6VFgtuazYj8=;
	b=fzGlQJbELsuQf/TIokTn215dpIYwMgfAYRUXgXNteW1TJ/rfCFCi40yte9UtrzUzNBp68H
	ns68VXLDVpNCEbAA==
To: Joel Granados <joel.granados@kernel.org>, Thomas =?utf-8?Q?Wei=C3=9Fsc?=
 =?utf-8?Q?huh?=
 <linux@weissschuh.net>, Kees Cook <kees@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
 codalist@coda.cs.cmu.edu, linux-mm@kvack.org, linux-nfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, fsverity@lists.linux.dev,
 linux-xfs@vger.kernel.org, io-uring@vger.kernel.org, bpf@vger.kernel.org,
 kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org, Song Liu
 <song@kernel.org>, "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, "Darrick J. Wong"
 <djwong@kernel.org>, Jani Nikula <jani.nikula@intel.com>, Corey Minyard
 <cminyard@mvista.com>, Joel Granados <joel.granados@kernel.org>
Subject: Re: [PATCH v2] treewide: const qualify ctl_tables where applicable
In-Reply-To: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
Date: Wed, 15 Jan 2025 18:52:40 +0100
Message-ID: <87jzawarrr.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jan 10 2025 at 15:16, Joel Granados wrote:
> sed:
>     sed --in-place \
>       -e "s/struct ctl_table .table = &uts_kern/const struct ctl_table *table = \&uts_kern/" \
>       kernel/utsname_sysctl.c
>
> Reviewed-by: Song Liu <song@kernel.org>
> Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org> # for kernel/trace/
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com> # SCSI
> Reviewed-by: Darrick J. Wong <djwong@kernel.org> # xfs
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Acked-by: Corey Minyard <cminyard@mvista.com>
> Signed-off-by: Joel Granados <joel.granados@kernel.org>

Acked-by: Thomas Gleixner <tglx@linutronix.de>

