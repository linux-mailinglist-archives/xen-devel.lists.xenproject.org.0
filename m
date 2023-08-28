Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD6A78B326
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 16:30:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591525.924009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qadFt-0004yS-A2; Mon, 28 Aug 2023 14:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591525.924009; Mon, 28 Aug 2023 14:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qadFs-0004h4-VP; Mon, 28 Aug 2023 14:30:12 +0000
Received: by outflank-mailman (input) for mailman id 591525;
 Mon, 28 Aug 2023 13:21:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3W1q=EN=kernel.org=brauner@srs-se1.protection.inumbo.net>)
 id 1qacB3-00032e-Pk
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 13:21:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be281668-45a5-11ee-8783-cb3800f73035;
 Mon, 28 Aug 2023 15:21:06 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1E9A96187E;
 Mon, 28 Aug 2023 13:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6569C433C8;
 Mon, 28 Aug 2023 13:20:54 +0000 (UTC)
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
X-Inumbo-ID: be281668-45a5-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693228864;
	bh=QtirhpZ6M4wRBs0PcZuQKaZInNnIQCord7zI9oR3eYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dGzUUvJG87+eWzsz6xzROYCBNDl7W5LTOJNZSdrdj6kC4UZhu/D9tYCBTY1kzrQPe
	 x7WILXB1VLYusnI7i57xbkDNp7AlezoIITxDEYtPZbpKeaRaDjmpnSpx19pqxTzCO1
	 eHWv5jG6Kk405k0HzfGlQ5FnGrphH6RQF/qbsChQZpHtUi1E5k/RJY2W8E0veW1Pw4
	 WmlHIAC8kSpEcFeEGWLjHX2ee4G742ubGUZGwha6A7RHD325wN5SUYbEQ3omUMFDG/
	 CM1aA/cNlMXqkEYlHa/Phek8pvPKy4SQPmUA3IhuobWAQwG6yFUbEhG6jgGYrQO+H2
	 J9dq9/E4F2ZeQ==
Date: Mon, 28 Aug 2023 15:20:47 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	linux-block@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
	Alasdair Kergon <agk@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna Schumaker <anna@kernel.org>, Chao Yu <chao@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Dave Kleikamp <shaggy@kernel.org>, David Sterba <dsterba@suse.com>,
	dm-devel@redhat.com, drbd-dev@lists.linbit.com,
	Gao Xiang <xiang@kernel.org>, Jack Wang <jinpu.wang@ionos.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	jfs-discussion@lists.sourceforge.net,
	Joern Engel <joern@lazybastard.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	linux-bcache@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
	linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Mike Snitzer <snitzer@kernel.org>, Minchan Kim <minchan@kernel.org>,
	ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Song Liu <song@kernel.org>, Sven Schnelle <svens@linux.ibm.com>,
	target-devel@vger.kernel.org, Ted Tso <tytso@mit.edu>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	xen-devel@lists.xenproject.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH v2 0/29] block: Make blkdev_get_by_*() return handle
Message-ID: <20230828-durften-hauswand-67319ee0c17c@brauner>
References: <20230810171429.31759-1-jack@suse.cz>
 <20230825015843.GB95084@ZenIV>
 <20230825134756.o3wpq6bogndukn53@quack3>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230825134756.o3wpq6bogndukn53@quack3>

> So besides my last fput() worry about I think this could work and would be
> probably a bit nicer than what I have. But before going and redoing the whole
> series let me gather some more feedback so that we don't go back and forth.
> Christoph, Christian, Jens, any opinion?

I'll be a bit under water for the next few days, I expect but I'll get
back to this. I think not making you redo this whole thing from scratch
is what I'd prefer unless there's really clear advantages. But I don't
want to offer a haphazard opinion in the middle of the merge window.

