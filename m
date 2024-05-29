Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5A68D315B
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 10:31:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731667.1137305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCEi3-00070y-SX; Wed, 29 May 2024 08:30:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731667.1137305; Wed, 29 May 2024 08:30:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCEi3-0006yE-Pp; Wed, 29 May 2024 08:30:59 +0000
Received: by outflank-mailman (input) for mailman id 731667;
 Wed, 29 May 2024 08:30:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZZuD=NA=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1sCEi3-0006y8-3S
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 08:30:59 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3ba5716-1d95-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 10:30:56 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 47202CE1665;
 Wed, 29 May 2024 08:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC01C2BD10;
 Wed, 29 May 2024 08:30:46 +0000 (UTC)
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
X-Inumbo-ID: c3ba5716-1d95-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716971448;
	bh=okobbeHOzXq6ivMGxWAQOlHqPIeKQZDwNC64vcjjQ6o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oJHg4EaC6VLoBZLA2tkfhAXWRViSHX90IfPOto1y2u0MBzS2lz8peI4cgrhwJmiR6
	 j9IGX6ydtNHZbJidgJPmMLDbdMXz0lQ2SjJFcgOj/ZzOZSBuyzHMbC9X6txlhFCKjq
	 zicWj7/lpaI7DNz0gaj1s72zKODzpr9MW0uRepDVL9LHZlHfiRvRJLXPYCR5+1kuWl
	 1WzRU4j7uDZm8UVS5ixrUgADkNSKzvq4M0wIXGo6299fOfN++X+wdoS1ukfz0V0jSB
	 OymHRmFQtxJAOdroVyR9aNThRLSfqkLHyDmmUaVQP0WnD4PbxrI2HzlwMAzSkKWaIa
	 Mi/WLM+Dn9sPQ==
Message-ID: <cf5628a4-50e5-4397-9633-c00a3df2a2df@kernel.org>
Date: Wed, 29 May 2024 17:30:45 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] block: add special APIs for run-time disabling of
 discard and friends
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, Josef Bacik
 <josef@toxicpanda.com>, Ilya Dryomov <idryomov@gmail.com>,
 Dongsheng Yang <dongsheng.yang@easystack.cn>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 linux-um@lists.infradead.org, linux-block@vger.kernel.org,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
References: <20240529050507.1392041-1-hch@lst.de>
 <20240529050507.1392041-13-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240529050507.1392041-13-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/29/24 14:04, Christoph Hellwig wrote:
> A few drivers optimistically try to support discard, write zeroes and
> secure erase and disable the features from the I/O completion handler
> if the hardware can't support them.  This disable can't be done using
> the atomic queue limits API because the I/O completion handlers can't
> take sleeping locks or freezer the queue.  Keep the existing clearing

s/freezer/freeze

> of the relevant field to zero, but replace the old blk_queue_max_*
> APIs with new disable APIs that force the value to 0.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

With the typo fixed, looks OK to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


