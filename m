Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8A08D3087
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 10:15:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731629.1137246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCESX-0006uu-F9; Wed, 29 May 2024 08:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731629.1137246; Wed, 29 May 2024 08:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCESX-0006tO-CM; Wed, 29 May 2024 08:14:57 +0000
Received: by outflank-mailman (input) for mailman id 731629;
 Wed, 29 May 2024 08:14:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZZuD=NA=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1sCESW-0006tI-EI
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 08:14:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 871fa197-1d93-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 10:14:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 55AC2626B5;
 Wed, 29 May 2024 08:14:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B98BC2BD10;
 Wed, 29 May 2024 08:14:50 +0000 (UTC)
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
X-Inumbo-ID: 871fa197-1d93-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716970493;
	bh=807aMJTkC1p+AoxUwaQMdhMlZoRzxAswKTa2dL4juDQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UxzQFdZDojD5zpNCznqhTAYgdt/u91jAQBq4urzSctjoQNdJc95kx61nCycDlwl+Q
	 1JAZAr2BWpd8fVSOv1QtVb8WnA/H3q5yZ/J6rV5BrOS0h/5R7SBN4XhluIsMA1bnkC
	 ZgxW77pqNTlnmVDHqOWJDaloGp+tPXvK5/dfQKe4x5GXGHc718XUnBvEf6dq9tu658
	 4RCg8AKM8Yv0x+3AoBe6WqI19ZjEWYVxMLHJL8shoIDvIkL5J73b1/ED3qKdfnQSgN
	 6cjSWuxuKauqmy2HYUIA1sDs9N0HxdoZvZ2tKGZTyDH71GI3SCMxH44xQHHHqS1bMT
	 OeyWAOUjf5bLQ==
Message-ID: <87cbfdc6-4ba3-4a3c-9d80-24584fa38f27@kernel.org>
Date: Wed, 29 May 2024 17:14:50 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] sd: factor out a sd_discard_mode helper
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
 <20240529050507.1392041-8-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240529050507.1392041-8-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/29/24 14:04, Christoph Hellwig wrote:
> Split the logic to pick the right discard mode into a little helper
> to prepare for further changes.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


