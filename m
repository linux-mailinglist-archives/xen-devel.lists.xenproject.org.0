Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A6A824E7B
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 07:10:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661947.1031774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLdPq-0006cN-Sh; Fri, 05 Jan 2024 06:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661947.1031774; Fri, 05 Jan 2024 06:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLdPq-0006a0-Q5; Fri, 05 Jan 2024 06:10:46 +0000
Received: by outflank-mailman (input) for mailman id 661947;
 Fri, 05 Jan 2024 06:10:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0sKf=IP=bombadil.srs.infradead.org=BATV+47ea59da63ebb99efca2+7439+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1rLdPo-0006Zq-Tt
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 06:10:44 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27506bd4-ab91-11ee-98ef-6d05b1d4d9a1;
 Fri, 05 Jan 2024 07:10:43 +0100 (CET)
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1rLdPN-00G2Yc-1R; Fri, 05 Jan 2024 06:10:17 +0000
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
X-Inumbo-ID: 27506bd4-ab91-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dSHA2/+sx7Ginf1zZQjwMoxOOLN3aAKl+o5J049zcoQ=; b=VzS7OQo05vKzjkbMgtDbyoqlq1
	xMjqJoHMrYZx0z8X2pzLagECzGMwlohl9ymKqBvvmtpDIlsWY6AG4N/f1Z7a0npjBNyE4ZwknljfO
	Adoqi4XTmVgFGXh4zBStmNMnqV7aBBtXocYkaX6HML2N7/QqnRhhdS2TWAoeezhinIAaanN7Ej7dv
	hxVnm2Vk5habqISRNzPmh9q8JmfV7hW/bJTp3S/nkUAXM07TMl3K+hndw/tt6Sa2uemEb90WWvc6e
	e9D7SiAdy2v6KE4fIeq1gb230I0mhq6ROH5a4jotGgz0Zrj+acjX4nO0JO/pnPZhJ1+dxysUg9Aw0
	JvaSlTvg==;
Date: Thu, 4 Jan 2024 22:10:17 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jan Kara <jack@suse.cz>
Cc: Yu Kuai <yukuai1@huaweicloud.com>, axboe@kernel.dk,
	roger.pau@citrix.com, colyli@suse.de, kent.overstreet@gmail.com,
	joern@lazybastard.org, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com,
	josef@toxicpanda.com, dsterba@suse.com, viro@zeniv.linux.org.uk,
	brauner@kernel.org, nico@fluxnic.net, xiang@kernel.org,
	chao@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca,
	jack@suse.com, konishi.ryusuke@gmail.com, willy@infradead.org,
	akpm@linux-foundation.org, hare@suse.de, p.raghav@samsung.com,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-nilfs@vger.kernel.org, yukuai3@huawei.com,
	yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH RFC v3 for-6.8/block 04/17] mtd: block2mtd: use bdev apis
Message-ID: <ZZedSYAedA05Oex2@infradead.org>
References: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
 <20231221085712.1766333-5-yukuai1@huaweicloud.com>
 <20240104112855.uci45hhqaiitmsir@quack3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104112855.uci45hhqaiitmsir@quack3>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Jan 04, 2024 at 12:28:55PM +0100, Jan Kara wrote:
> What do you think? Because when we are working with the folios it is rather
> natural to use their mapping for dirty balancing?

The real problem is that block2mtd pokes way to deep into block
internals.

I think the saviour here is Christians series to replace the bdev handle
with a struct file, which will allow to use the normal file write path
here and get rid of the entire layering volation.


