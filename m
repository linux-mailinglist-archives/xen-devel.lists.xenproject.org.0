Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA77A07C7D
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 16:52:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868896.1280404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVupC-0004bU-UA; Thu, 09 Jan 2025 15:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868896.1280404; Thu, 09 Jan 2025 15:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVupC-0004Z1-R7; Thu, 09 Jan 2025 15:51:58 +0000
Received: by outflank-mailman (input) for mailman id 868896;
 Thu, 09 Jan 2025 15:51:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4O/P=UB=kernel.org=djwong@srs-se1.protection.inumbo.net>)
 id 1tVupB-0004Yt-H4
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 15:51:57 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a700028d-cea1-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 16:51:56 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D378CA420AB;
 Thu,  9 Jan 2025 15:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E5AC4CED2;
 Thu,  9 Jan 2025 15:51:55 +0000 (UTC)
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
X-Inumbo-ID: a700028d-cea1-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736437915;
	bh=4PNW5U1RCpwSI6ed5qCmkDfjxSB39XjXAAnaje7o+L4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F9BSlQcxUU/kvrDz8ezVoOO+s/YBhBI99DBGbLdRbteRKBcsdBNKhfA6NIrkjDYkC
	 9GtrmQ7VK0dv7qDBCLFFprwhk5flkxmRl+V2FYyKWlDlaQk5dy/y43RuJc1rAObSVE
	 sl7FszvwCJ3ZWmJ3LwoRXHehBmq48TqQ4/nOFcPMPAGWGxlPfP39p5Evt4580Qxykh
	 T6IreW5JxdI40u2aiQRRvDdYRS5jpPoTlnD0T3RTnaN10Mg41YwaqUaSESqRhF+j/w
	 8yWPU7z9RguVCtFoKzz3OeFzncyxzknkL/0P6P7tlQkSO/uCgw6CAfTy6ch0j+etXR
	 6KWhdTwfzx9bw==
Date: Thu, 9 Jan 2025 07:51:54 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Joel Granados <joel.granados@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-serial@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-aio@kvack.org,
	linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
	codalist@coda.cs.cmu.edu, linux-mm@kvack.org,
	linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev,
	fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
	io-uring@vger.kernel.org, bpf@vger.kernel.org,
	kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com,
	linux-security-module@vger.kernel.org, keyrings@vger.kernel.org
Subject: Re: [PATCH] treewide: const qualify ctl_tables where applicable
Message-ID: <20250109155154.GP1306365@frogsfrogsfrogs>
References: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>

On Thu, Jan 09, 2025 at 02:16:39PM +0100, Joel Granados wrote:
> Add the const qualifier to all the ctl_tables in the tree except the
> ones in ./net dir. The "net" sysctl code is special as it modifies the
> arrays before passing it on to the registration function.
> 
> Constifying ctl_table structs will prevent the modification of
> proc_handler function pointers as the arrays would reside in .rodata.
> This is made possible after commit 78eb4ea25cd5 ("sysctl: treewide:
> constify the ctl_table argument of proc_handlers") constified all the
> proc_handlers.

Sounds like a good idea,
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org> # xfs

--D

