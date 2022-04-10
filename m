Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DA84FAC57
	for <lists+xen-devel@lfdr.de>; Sun, 10 Apr 2022 08:26:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302359.516007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndR1m-0002QZ-Pf; Sun, 10 Apr 2022 06:26:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302359.516007; Sun, 10 Apr 2022 06:26:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndR1m-0002OA-Mp; Sun, 10 Apr 2022 06:26:26 +0000
Received: by outflank-mailman (input) for mailman id 302359;
 Sun, 10 Apr 2022 06:26:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aDry=UU=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1ndR1l-0002O4-Eo
 for xen-devel@lists.xenproject.org; Sun, 10 Apr 2022 06:26:25 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24c8be4f-b897-11ec-8fbc-03012f2f19d4;
 Sun, 10 Apr 2022 08:26:24 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E057168AFE; Sun, 10 Apr 2022 08:26:20 +0200 (CEST)
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
X-Inumbo-ID: 24c8be4f-b897-11ec-8fbc-03012f2f19d4
Date: Sun, 10 Apr 2022 08:26:20 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
Cc: Christoph Hellwig <hch@lst.de>, dm-devel@redhat.com,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-um@lists.infradead.org, linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, Jens Axboe <axboe@kernel.dk>,
	linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
	ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com,
	linux-mm@kvack.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Coly Li <colyli@suse.de>
Subject: Re: [PATCH 24/27] block: remove QUEUE_FLAG_DISCARD
Message-ID: <20220410062620.GA16234@lst.de>
References: <20220409045043.23593-1-hch@lst.de> <20220409045043.23593-25-hch@lst.de> <72e9bd34-3380-e305-65f0-a17306f5bd08@linbit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72e9bd34-3380-e305-65f0-a17306f5bd08@linbit.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sat, Apr 09, 2022 at 10:15:33AM +0200, Christoph Böhmwalder wrote:
> On 09.04.22 06:50, Christoph Hellwig wrote:
>> Just use a non-zero max_discard_sectors as an indicator for discard
>> support, similar to what is done for write zeroes.
>>
>> The only places where needs special attention is the RAID5 driver,
>> which must clear discard support for security reasons by default,
>> even if the default stacking rules would allow for it.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
>> Acked-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com> [btrfs]
>
> I think you may have a typo there: my ACK was for drbd, not btrfs.

Indeed, sorry.

