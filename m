Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5176990365E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 10:27:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738159.1144825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGwqJ-0002N6-1Z; Tue, 11 Jun 2024 08:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738159.1144825; Tue, 11 Jun 2024 08:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGwqI-0002LN-V0; Tue, 11 Jun 2024 08:26:58 +0000
Received: by outflank-mailman (input) for mailman id 738159;
 Tue, 11 Jun 2024 08:26:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7xGt=NN=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1sGwqH-0001QC-Ha
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 08:26:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d0b71e1-27cc-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 10:26:56 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A868E60D2E;
 Tue, 11 Jun 2024 08:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91B8C2BD10;
 Tue, 11 Jun 2024 08:26:50 +0000 (UTC)
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
X-Inumbo-ID: 5d0b71e1-27cc-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718094415;
	bh=zPCa8xPO5T29Ue6m/rGvsIVSedmfYpv71DR4OREdVBQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ez17pQw3y3AnnRAsbp/TeB/EKjEe7TyilW2EVLSJJrew7wwyol5eLtQF972oIfLpG
	 oYcDa9ge7GLmbENS0nP9E6ta6tD7CQef1VnquDAuNjK/vmtFTMl8qc2CWkRZn6DFMS
	 raKMjYT80FmXY5BCGp2iWYpN2mIcXyE1s1Z58hYCCGi8z4FHsqMGJz+kXo4P2Nk278
	 r+zW/RpHA3mNDdc41rCNeksvCw0askxtETJGNAUBwkUPNPgC4kqE5kupqRA+Iycdzy
	 jj5qMbPiZljguvK2fsauAxET3ATsJgfsyWMl0BAtw4WiWIzM56ISDOgnDaaVGyV3zf
	 MkLh4tzLpuL/g==
Message-ID: <b5db88d4-5639-47a9-9611-2628235f4244@kernel.org>
Date: Tue, 11 Jun 2024 17:26:49 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/26] block: move the bounce flag into the feature field
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
 <20240611051929.513387-27-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-27-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> Move the bounce field into the flags field to reclaim a little bit of

s/flags/feature

> space.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


