Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 216828D313E
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 10:28:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731660.1137296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCEfU-00051W-Dl; Wed, 29 May 2024 08:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731660.1137296; Wed, 29 May 2024 08:28:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCEfU-0004zP-A7; Wed, 29 May 2024 08:28:20 +0000
Received: by outflank-mailman (input) for mailman id 731660;
 Wed, 29 May 2024 08:28:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZZuD=NA=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1sCEfS-0004zF-6t
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 08:28:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64fbfd93-1d95-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 10:28:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0AABA62064;
 Wed, 29 May 2024 08:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF68BC2BD10;
 Wed, 29 May 2024 08:28:12 +0000 (UTC)
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
X-Inumbo-ID: 64fbfd93-1d95-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716971294;
	bh=4xLTsI+g+6PM4GZdcp6tkOURF5lktb+4fm2gix3vClQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=creCoCfkg1r9P0k8mhbQwfgzqAswZmiHcWn5Bd1MuoZI86SxYC6hCoH0KS7axJpRP
	 T5h8NZUH+144AFLShb1Ye209bRfiGKQfICluAxPCjIl31GxjbCY/ZZO9BCNN2JyPxs
	 KI2ckBHEkR0/WvEE3z6RgUJOVV2nWrAL1xRk0dgjzNMb2/4WydlFDV4Vv9Q9Exms4t
	 zw1nCtAcJ7pSBxyqVgpFzXBd4oJqfsn4Md73ZGniohT92LzP2SC+w4HfaZP9jPfdIk
	 B1KifcBYlefe27lPs+SGjeRu5o3YScEpjkE/6WSWgxZ1cgJ6Uev8aMv3ZeVlm9xQqD
	 86KgS37/4vtFA==
Message-ID: <89f98897-bfb4-48d1-9b60-d793fde9fade@kernel.org>
Date: Wed, 29 May 2024 17:28:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] block: remove unused queue limits API
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
 <20240529050507.1392041-12-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240529050507.1392041-12-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/29/24 14:04, Christoph Hellwig wrote:
> Remove all APIs that are unused now that sd and sr have been converted
> to the atomic queue limits API.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

I think that disk_set_max_open_zones() and disk_set_max_active_zones() can also
go away.

-- 
Damien Le Moal
Western Digital Research


