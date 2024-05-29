Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C92A8D306B
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 10:12:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731619.1137226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCEQ6-0005bE-TH; Wed, 29 May 2024 08:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731619.1137226; Wed, 29 May 2024 08:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCEQ6-0005Z2-QO; Wed, 29 May 2024 08:12:26 +0000
Received: by outflank-mailman (input) for mailman id 731619;
 Wed, 29 May 2024 08:12:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZZuD=NA=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1sCEQ4-0005Yu-TO
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 08:12:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ccc38e1-1d93-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 10:12:23 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BFBE9623A4;
 Wed, 29 May 2024 08:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7666DC32786;
 Wed, 29 May 2024 08:12:19 +0000 (UTC)
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
X-Inumbo-ID: 2ccc38e1-1d93-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716970341;
	bh=6hbYxOsQLA742vo6TjIi/DCNFqZKNxvrO5GmFHCpV44=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R5mS/igRnNYSuaOU/WungJiFXByfPmU52aV3/8lDlnahx3fw8xYGEgm9I0GwjGMLI
	 rxgEHuZC8FN59Nts7D7mlYOVBxUtXbONIbSuFZA/nsChkRReh17QPPy3Nln5IcP01O
	 bsT5Xv1cO9MaQHL1Y0r23CFCdo5I/pmKCJKFQuVPp2FGd5eU3g8CUn1vaagml+SwH/
	 VFaQ6/MQ6XcCtKYl3ZsNtZ6oahfm06jpUk78jThj1RR2tPWitAJRbqdrAgZ8cH96NI
	 HA2Qjk0f15qnfydLy1JSV5a8XNMA+v8I41uKRHJ4B+z8Gf4xJOm2ZPo9UslIKFHhn/
	 xR//bL6vRZCpw==
Message-ID: <dd7a2835-8c38-4b52-aaea-f80064ccd22b@kernel.org>
Date: Wed, 29 May 2024 17:12:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] sd: add a sd_disable_write_same helper
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
 <20240529050507.1392041-6-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240529050507.1392041-6-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/29/24 14:04, Christoph Hellwig wrote:
> Add helper to disable WRITE SAME when it is not supported and use it
> instead of sd_config_write_same in the I/O completion handler.  This
> avoids touching more fields than required in the I/O completion handler
> and  prepares for converting sd to use the atomic queue limits API.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


