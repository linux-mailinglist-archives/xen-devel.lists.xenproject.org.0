Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1EDA20994
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 12:22:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878440.1288624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcjg8-0004AM-0f; Tue, 28 Jan 2025 11:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878440.1288624; Tue, 28 Jan 2025 11:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcjg7-00047T-Ts; Tue, 28 Jan 2025 11:22:47 +0000
Received: by outflank-mailman (input) for mailman id 878440;
 Tue, 28 Jan 2025 11:22:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQvE=UU=kernel.org=joel.granados@srs-se1.protection.inumbo.net>)
 id 1tcjg6-00047L-K2
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 11:22:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30cc1af1-dd6a-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 12:22:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3179E5C5D79;
 Tue, 28 Jan 2025 11:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98109C4CEDF;
 Tue, 28 Jan 2025 11:22:41 +0000 (UTC)
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
X-Inumbo-ID: 30cc1af1-dd6a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738063362;
	bh=AJfDJn9pFkPItjs+l9CjDlC33TdlTCE01Kr4mfJIOJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=foTouGKI5Xpt6DiifiySGU1Px4B0JlxynZkL/A+4GJ+F1wUAFkM/N4G83a9sI8N06
	 lsMHA2F0I+BGkV1h4oylhwmSeJznMzbN+UJy9qwbYRK5QlpfqNfv8Msq/ndA/iDm4I
	 JYp3P2GR22dNEIcBnZOOATJGYPU+gMIFK9XfLLma3B24+UKToDLZL/ZLBF6bwp16qy
	 HMKr9svtYad8MrCuOMMF5t2I0WLB8bGS9HGYMu9w94+SD6sanYCztaTmP2cubx4D+F
	 lhSPEntAtoYhJR/j92VqRwE5MifEf7tNzvj9NQnTwv0sbHofELHMou005/QzH1lonP
	 yczCENnq4hKEA==
Date: Tue, 28 Jan 2025 12:22:37 +0100
From: Joel Granados <joel.granados@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Jani Nikula <jani.nikula@intel.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, linux-serial@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, 
	netfs@lists.linux.dev, codalist@coda.cs.cmu.edu, linux-mm@kvack.org, 
	linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev, fsverity@lists.linux.dev, 
	linux-xfs@vger.kernel.org, io-uring@vger.kernel.org, bpf@vger.kernel.org, 
	kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, 
	keyrings@vger.kernel.org, Song Liu <song@kernel.org>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	"Darrick J. Wong" <djwong@kernel.org>, Corey Minyard <cminyard@mvista.com>
Subject: Re: Re: Re: Re: [PATCH v2] treewide: const qualify ctl_tables where
 applicable
Message-ID: <u2fwibsnbfvulxj6adigla6geiafh2vuve4hcyo4vmeytwjl7p@oz6xonrq5225>
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
 <Z4+jwDBrZNRgu85S@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <nslqrapp4v3rknjgtfk4cg64ha7rewrrg24aslo2e5jmxfwce5@t4chrpuk632k>
 <CAMj1kXEZPe8zk7s67SADK9wVH3cfBup-sAZSC6_pJyng9QT7aw@mail.gmail.com>
 <f4lfo2fb7ajogucsvisfd5sg2avykavmkizr6ycsllcrco4mo3@qt2zx4zp57zh>
 <87jzag9ugx.fsf@intel.com>
 <Z5epb86xkHQ3BLhp@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5epb86xkHQ3BLhp@casper.infradead.org>

On Mon, Jan 27, 2025 at 03:42:39PM +0000, Matthew Wilcox wrote:
> On Mon, Jan 27, 2025 at 04:55:58PM +0200, Jani Nikula wrote:
> > You could have static const within functions too. You get the rodata
> > protection and function local scope, best of both worlds?
> 
> timer_active is on the stack, so it can't be static const.
> 
> Does this really need to be cc'd to such a wide distribution list?
That is a very good question. I removed 160 people from the original
e-mail and left the ones that where previously involved with this patch
and left all the lists for good measure. But it seems I can reduce it
even more.

How about this: For these treewide efforts I just leave the people that
are/were involved in the series and add two lists: linux-kernel and
linux-hardening.

Unless someone screams, I'll try this out on my next treewide.

Thx for the feedback

Best

-- 

Joel Granados

