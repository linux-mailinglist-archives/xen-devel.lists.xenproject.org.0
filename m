Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A6A7F9A32
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 07:49:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641608.1000292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7VQ6-00041Z-AR; Mon, 27 Nov 2023 06:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641608.1000292; Mon, 27 Nov 2023 06:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7VQ6-0003ya-7G; Mon, 27 Nov 2023 06:48:38 +0000
Received: by outflank-mailman (input) for mailman id 641608;
 Mon, 27 Nov 2023 06:48:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E76h=HI=ftp.linux.org.uk=viro@srs-se1.protection.inumbo.net>)
 id 1r7VQ3-0003yU-TK
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 06:48:36 +0000
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk
 [2a03:a000:7:0:5054:ff:fe1c:15ff])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbedde74-8cf0-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 07:48:34 +0100 (CET)
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1r7VP7-003r7k-26; Mon, 27 Nov 2023 06:47:37 +0000
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
X-Inumbo-ID: fbedde74-8cf0-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PRdjsHwBJnTnCFJ6KWMNGkw3R1XwKUQdbL+BMJT0K70=; b=X33IAizBXxOu44K+tKNOQcX6aN
	L3R58WnMzMuH49yXIvG7omqQGa3O2DELuiG9T0RDZfJfL9RxoTFv7kUL42tZGssHxvodfBhu53zAl
	oziCAbD1I4rfcGgYF7+pmO1j4z7VlfcJSt54k/bu5RznWMw8UGAKzI85OeNE+/rj2cbLblF4OE6VJ
	eTO7WwvbpkhSAH2j8YC9xxeFsHPww+97YyGIXXbr6H0E8B8/2bjSezQMUryHuqSaucYpxVB9Oms42
	fJOuOXLDq1bOpbdO9PADT2+G/2FCegqrb+HsEfhKX3cA8yGKyYkW0zp9+6loKz3FcpZ/JElMbJsDK
	wQbg0j1Q==;
Date: Mon, 27 Nov 2023 06:47:37 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: hch@infradead.org, ming.lei@redhat.com, axboe@kernel.dk,
	roger.pau@citrix.com, colyli@suse.de, kent.overstreet@gmail.com,
	joern@lazybastard.org, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com,
	josef@toxicpanda.com, dsterba@suse.com, brauner@kernel.org,
	nico@fluxnic.net, xiang@kernel.org, chao@kernel.org, tytso@mit.edu,
	adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
	konishi.ryusuke@gmail.com, dchinner@redhat.com,
	linux@weissschuh.net, min15.li@samsung.com, yukuai3@huawei.com,
	dlemoal@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
	hare@suse.de, p.raghav@samsung.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org, gfs2@lists.linux.dev,
	linux-nilfs@vger.kernel.org, yi.zhang@huawei.com,
	yangerkun@huawei.com
Subject: Re: [PATCH block/for-next v2 00/16] block: remove field 'bd_inode'
 from block_device
Message-ID: <20231127064737.GH38156@ZenIV>
References: <20231127062116.2355129-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127062116.2355129-1-yukuai1@huaweicloud.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Mon, Nov 27, 2023 at 02:21:00PM +0800, Yu Kuai wrote:
> From: Yu Kuai <yukuai3@huawei.com>
> 
> Changes in v2:
>  - split different portions into different patches, as greg k-h
>  suggested.
>  - use container_of() instead of "bdev + 1" to get the address of
>  bd_inode in the new helper, as grep k-h suggested.

You might have misinterpreted gregkh - in your place I would rather
do a one-patch never-rebased branch (introduction of bdev_inode() in
form that returns bdev->bd_inode), with followup in your branch that
switches it to your variant.  Then conversions of ->bd_inode users,
to be either picked by individual filesystems of staying in your branch.
Any filesystem tree could merge from your never-rebased branch, after
which they could switch their ->bd_inode uses to the new helper, without
introducing any bisection hazards or interdependencies.
After the next -rc1, once all ->bd_inode users are gone from the tree -
remove the field.

