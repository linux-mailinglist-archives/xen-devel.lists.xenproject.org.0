Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E363903186
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 07:47:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737796.1144241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGuLL-0007CF-56; Tue, 11 Jun 2024 05:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737796.1144241; Tue, 11 Jun 2024 05:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGuLL-0007AP-2S; Tue, 11 Jun 2024 05:46:51 +0000
Received: by outflank-mailman (input) for mailman id 737796;
 Tue, 11 Jun 2024 05:46:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7xGt=NN=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1sGuLI-0007AJ-UP
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 05:46:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcdfc634-27b5-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 07:46:47 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DA72160C78;
 Tue, 11 Jun 2024 05:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6E2C2BD10;
 Tue, 11 Jun 2024 05:46:40 +0000 (UTC)
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
X-Inumbo-ID: fcdfc634-27b5-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718084804;
	bh=ExeLOYUGYjsXp3wdbBqJbcQ6b1Q8a86JlJB2p9Et3no=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WBxCLVZAQ2Cg02C5kvrfE9AgQqRfV0Vp9wUF3fqyRhPTMqteB7yjcEcGuYnFUrdIw
	 Nu+HCmDrsEWaDY0FS7c46/3H7ATl/iGMVLCSF+Y1IXagrNKa23K/U8gLfuLZVv+pfk
	 se724bhlH7gvtfrzVvNU5z4sgOI97FPDkZ/i4w+FATTtdCE12k8Vsqx39K60DyqVqK
	 eKEG3WqOVb470PJhBzxUxSx4QvapUkoaIbwLZb4Jn2jRXEpSQbkqLj2jPx5RESJvRH
	 5VCPbFYE05UT1aOpVYJIEWldcQvGMdLjZeDXOZ3CBVDxeKuyv8iCzyjAX6fSrOkmTW
	 QhoVFafzbn1yw==
Message-ID: <d50efca4-ba29-49f9-94cc-5bd4795f6e38@kernel.org>
Date: Tue, 11 Jun 2024 14:46:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/26] sd: fix sd_is_zoned
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
 drbd-dev@lists.linbit.com, nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-block@vger.kernel.org
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-2-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> Since commit 7437bb73f087 ("block: remove support for the host aware zone
> model"), only ZBC devices expose a zoned access model.  sd_is_zoned is
> used to check for that and thus return false for host aware devices.
> 
> Fixes: 7437bb73f087 ("block: remove support for the host aware zone model")
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


