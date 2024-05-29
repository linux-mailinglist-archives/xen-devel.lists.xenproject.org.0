Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA288D30D2
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 10:19:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731638.1137257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCEW6-00006V-VC; Wed, 29 May 2024 08:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731638.1137257; Wed, 29 May 2024 08:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCEW6-0008UC-S7; Wed, 29 May 2024 08:18:38 +0000
Received: by outflank-mailman (input) for mailman id 731638;
 Wed, 29 May 2024 08:18:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZZuD=NA=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1sCEW6-0008Tu-0G
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 08:18:38 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09e31287-1d94-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 10:18:35 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B51DBCE1717;
 Wed, 29 May 2024 08:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 058B3C32786;
 Wed, 29 May 2024 08:18:24 +0000 (UTC)
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
X-Inumbo-ID: 09e31287-1d94-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716970707;
	bh=tdLgkL/G57QWDQYIQEXqBgxXMvBYXtk7Q684oBRA8MI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LtR3Oh2agCU9HURoDtBiUh7iTJLGV4B2vVD+qBUmDBqW0QyV3eFxvnbTWLYWNw50G
	 RB5F6E5jmfbwdx4YKjiEpROnk6sbnVvAIqXTJDWEejc7ZNcxGoEWiuHV14ngXeucKK
	 3MdK9HGPHlJYvUXI/8tUaQ0uLgAUaBXFpEhxviGN3usBWl1+GVSFyj7trFfsAdECb8
	 GTGIG7ne+XR/vEI89MNuxclVJdVem1+wTntjOmKx7Ai3Wvm2rt9icq/wfCzCOfhHWj
	 IZ28O7umJrgJMRyP+GPGCXscEvF3FCY+uz4C0cntcL17ACYS8VsyxIYO/y9XSQCsU4
	 hNmwuFFXE3C5w==
Message-ID: <633e78ae-eed4-4437-a6f7-e8c5e22756c8@kernel.org>
Date: Wed, 29 May 2024 17:18:23 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] sd: cleanup zoned queue limits initialization
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
 <20240529050507.1392041-9-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240529050507.1392041-9-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/29/24 14:04, Christoph Hellwig wrote:
> Consolidate setting zone-related queue limits in sd_zbc_read_zones
> instead of splitting them between sd_zbc_revalidate_zones and
> sd_zbc_read_zones, and move the early_zone_information initialization
> in sd_zbc_read_zones above setting up the queue limits.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


