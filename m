Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC730A1D9BD
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 16:43:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878042.1288215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcRGP-0008OY-LN; Mon, 27 Jan 2025 15:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878042.1288215; Mon, 27 Jan 2025 15:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcRGP-0008Le-IZ; Mon, 27 Jan 2025 15:43:01 +0000
Received: by outflank-mailman (input) for mailman id 878042;
 Mon, 27 Jan 2025 15:43:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N5Z6=UT=infradead.org=willy@srs-se1.protection.inumbo.net>)
 id 1tcRGO-0008Km-03
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 15:43:00 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 617af748-dcc5-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 16:42:58 +0100 (CET)
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tcRG3-00000009b8r-2Zcd; Mon, 27 Jan 2025 15:42:39 +0000
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
X-Inumbo-ID: 617af748-dcc5-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=754tTQ0Xv0FV1pAPiQ7XMzOqvV5Ru3eT2/4MtIxHkKc=; b=Pyozw0tsKLD9gp97o+N6ZbHkTo
	Il8/2Vpa4F0aqTQ5eLNtncdojFavxqC+3hOoMyt2pPZYgpxoa7oSXp+1z19h2FwdJ9ksectEr6L5y
	pdndzuM9IJbuYbMGyY8OnttTeia0ZsfUEQN3vE3Kvu3ywzVzVm7PiaoVN1j+XGx7cGtNMyIWcHM2K
	IHU9EJmiTnsw2atKedPjlIYgnndG3plYffG/psV0clxoDlPsLg9vBJ8MCt7RCyZQNR2Rl4uIk2hOI
	SGpvgckCCBw+KC2Pto4K/lzMPYNt+Lyqoqjs99RL8H5P/AQH7nlJDuMDpJ1IZ/IMsyAIp8YsG+ytq
	PlpOQ/eA==;
Date: Mon, 27 Jan 2025 15:42:39 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Joel Granados <joel.granados@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
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
	linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
	Song Liu <song@kernel.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Corey Minyard <cminyard@mvista.com>
Subject: Re: Re: Re: [PATCH v2] treewide: const qualify ctl_tables where
 applicable
Message-ID: <Z5epb86xkHQ3BLhp@casper.infradead.org>
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
 <Z4+jwDBrZNRgu85S@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <nslqrapp4v3rknjgtfk4cg64ha7rewrrg24aslo2e5jmxfwce5@t4chrpuk632k>
 <CAMj1kXEZPe8zk7s67SADK9wVH3cfBup-sAZSC6_pJyng9QT7aw@mail.gmail.com>
 <f4lfo2fb7ajogucsvisfd5sg2avykavmkizr6ycsllcrco4mo3@qt2zx4zp57zh>
 <87jzag9ugx.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzag9ugx.fsf@intel.com>

On Mon, Jan 27, 2025 at 04:55:58PM +0200, Jani Nikula wrote:
> You could have static const within functions too. You get the rodata
> protection and function local scope, best of both worlds?

timer_active is on the stack, so it can't be static const.

Does this really need to be cc'd to such a wide distribution list?

