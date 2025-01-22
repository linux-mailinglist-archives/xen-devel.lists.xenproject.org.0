Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF28A19190
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2025 13:42:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875928.1286327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taa3N-0003Nr-Qz; Wed, 22 Jan 2025 12:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875928.1286327; Wed, 22 Jan 2025 12:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taa3N-0003MJ-O6; Wed, 22 Jan 2025 12:41:53 +0000
Received: by outflank-mailman (input) for mailman id 875928;
 Wed, 22 Jan 2025 12:41:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cfnn=UO=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1taa3M-0003MB-Nj
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2025 12:41:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f706d4a-d8be-11ef-99a4-01e77a169b0f;
 Wed, 22 Jan 2025 13:41:50 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 248C25C5EA3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2025 12:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423C8C4CEE2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2025 12:41:48 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30738a717ffso40026961fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2025 04:41:48 -0800 (PST)
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
X-Inumbo-ID: 3f706d4a-d8be-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737549708;
	bh=/nRt7/FOVju0HHPP7y/y/GmcikIqd0uun9LCjQjrq7E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VoyrM/KR3y6SyzXqcrUXIeXUzSXAukF1jTugO3Tp/XeZbDQsZz0btjWFVZexImUyA
	 GNv9Ye0JlCb6LXyPS9Jx9MVxR+Wdtkk0Ms+qZSrA1Lr8Xe+0i9vU/ISeGtF/6vb7Vs
	 1Uj3RovlFmNzqVfmuzQ82cCacT+Fx0ki2YqsVx1IY92F3iqqKCafCCMLWLqphwdRxg
	 srLeLPCzyALTJw1qCRW7tcb44xO01Rx4zDtdApARN9p2pthq2z1LppbizS751cMHo9
	 cZn++ylUYdHjeWMHwboi8qRzV/CerfY2kd1XCsOqWLze560AIlYM8svAXpyzid0N54
	 v69z43CGgr7bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG9349shETfNB8/2IB4+bG/Ffl4qnhYwL2NyI63dwEg7JiaXHUqjOdmsySZTR9lUF6qKRYzsgIbk8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpbRwIIRIX6TthMOYjU0on1f7R+FF/2M9NU4Eq5nE7nAawTOVX
	Ni7kcglkPU7160lKx/oeOqAIAkQeKZyWNm73jHZncV2FRhbHH+wDofj6wIUbHwVCF/jGKpvcR9Q
	OHGUginZsvLxhpASol/51nxkQn/4=
X-Google-Smtp-Source: AGHT+IFcRSReB7hah7mapcirnp1PWu31SswN3BbR4HjBYPEG79Tzl030J0TjqkE7fYQS4xaDIi2/KgOUqh2J3fswv1A=
X-Received: by 2002:a05:651c:2228:b0:302:4130:e19c with SMTP id
 38308e7fff4ca-3072caa15c1mr71017091fa.19.1737549706586; Wed, 22 Jan 2025
 04:41:46 -0800 (PST)
MIME-Version: 1.0
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
 <Z4+jwDBrZNRgu85S@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com> <nslqrapp4v3rknjgtfk4cg64ha7rewrrg24aslo2e5jmxfwce5@t4chrpuk632k>
In-Reply-To: <nslqrapp4v3rknjgtfk4cg64ha7rewrrg24aslo2e5jmxfwce5@t4chrpuk632k>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 22 Jan 2025 13:41:35 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEZPe8zk7s67SADK9wVH3cfBup-sAZSC6_pJyng9QT7aw@mail.gmail.com>
X-Gm-Features: AbW1kvaDj3u8bGVj1m4rnYAkpiRSTpmPAB3bThAH-GyuG2Tmgw9okzkp1e58uCc
Message-ID: <CAMj1kXEZPe8zk7s67SADK9wVH3cfBup-sAZSC6_pJyng9QT7aw@mail.gmail.com>
Subject: Re: Re: [PATCH v2] treewide: const qualify ctl_tables where applicable
To: Joel Granados <joel.granados@kernel.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
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
	linux-security-module@vger.kernel.org, keyrings@vger.kernel.org, 
	Song Liu <song@kernel.org>, "Steven Rostedt (Google)" <rostedt@goodmis.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, "Darrick J. Wong" <djwong@kernel.org>, 
	Jani Nikula <jani.nikula@intel.com>, Corey Minyard <cminyard@mvista.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jan 2025 at 13:25, Joel Granados <joel.granados@kernel.org> wrote:
>
> On Tue, Jan 21, 2025 at 02:40:16PM +0100, Alexander Gordeev wrote:
> > On Fri, Jan 10, 2025 at 03:16:08PM +0100, Joel Granados wrote:
> >
> > Hi Joel,
> >
> > > Add the const qualifier to all the ctl_tables in the tree except for
> > > watchdog_hardlockup_sysctl, memory_allocation_profiling_sysctls,
> > > loadpin_sysctl_table and the ones calling register_net_sysctl (./net,
> > > drivers/inifiniband dirs). These are special cases as they use a
> > > registration function with a non-const qualified ctl_table argument or
> > > modify the arrays before passing them on to the registration function.
> > >
> > > Constifying ctl_table structs will prevent the modification of
> > > proc_handler function pointers as the arrays would reside in .rodata.
> > > This is made possible after commit 78eb4ea25cd5 ("sysctl: treewide:
> > > constify the ctl_table argument of proc_handlers") constified all the
> > > proc_handlers.
> >
> > I could identify at least these occurences in s390 code as well:
> Hey Alexander
>
> Thx for bringing these to my attention. I had completely missed them as
> the spatch only deals with ctl_tables outside functions.
>
> Short answer:
> These should not be included in the current patch because they are a
> different pattern from how sysctl tables are usually used. So I will not
> include them.
>
> With that said, I think it might be interesting to look closer at them
> as they seem to be complicating the proc_handler (I have to look at them
> closer).
>
> I see that they are defining a ctl_table struct within the functions and
> just using the data (from the incoming ctl_table) to forward things down
> to proc_do{u,}intvec_* functions. This is very odd and I have only seen
> it done in order to change the incoming ctl_table (which is not what is
> being done here).
>
> I will take a closer look after the merge window and circle back with
> more info. Might take me a while as I'm not very familiar with s390
> code; any additional information on why those are being used inside the
> functions would be helpfull.
>

Using const data on the stack is not as useful, because the stack is
always mapped writable.

Global data structures marked 'const' will be moved into an ELF
section that is typically mapped read-only in its entirely, and so the
data cannot be modified by writing to it directly. No such protection
is possible for the stack, and so the constness there is only enforced
at compile time.

