Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E658D304E
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 10:11:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731614.1137215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCEOc-0004nH-GW; Wed, 29 May 2024 08:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731614.1137215; Wed, 29 May 2024 08:10:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCEOc-0004l6-DL; Wed, 29 May 2024 08:10:54 +0000
Received: by outflank-mailman (input) for mailman id 731614;
 Wed, 29 May 2024 08:10:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZZuD=NA=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1sCEOa-0004jZ-St
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 08:10:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f66e79c7-1d92-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 10:10:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8CFE16280B;
 Wed, 29 May 2024 08:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485B6C2BD10;
 Wed, 29 May 2024 08:10:48 +0000 (UTC)
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
X-Inumbo-ID: f66e79c7-1d92-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716970250;
	bh=PgFyg9WLnPMWyhLQvcC3XtuqulgVK5WUqskSxNXqJas=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DZK1VEReps9AHETpZWUhqpsG+MI00Z0ABB6+gsyW4Gi/Z5H2wxRpGys0fUV/CkDBi
	 ekm5UCfe5kEy0dcpfusrq9SB9N1ZwavpRU82ufk8JfWE2lzM+/YXbDY2BXVIIMJY0E
	 T5zQzfJHsOYj5o65HP0rDO9kO+0LU/4axtrqsBUXTVh+zCLdt4IzBnkae9F0/64AST
	 gqMNnuwWzByDW5WKf7i4hE7fr6Q5anX+m2We3adJ81nyxudkw5rtlBVLP6JZkCEX3i
	 Pcy2SlsuFxqd5emx5tb3bXdTCobvVRykH3xWoY1UPtWqs2G9X7g/qXHlmyyZj0p92U
	 NdB9TJbaHuhIA==
Message-ID: <868a031d-a6f5-4f89-b0ee-f74f6ab38dbc@kernel.org>
Date: Wed, 29 May 2024 17:10:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] sd: add a sd_disable_discard helper
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
 <20240529050507.1392041-5-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240529050507.1392041-5-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/29/24 14:04, Christoph Hellwig wrote:
> Add helper to disable discard when it is not supported and use it
> instead of sd_config_discard in the I/O completion handler.  This avoids
> touching more fields than required in the I/O completion handler and
> prepares for converting sd to use the atomic queue limits API.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


