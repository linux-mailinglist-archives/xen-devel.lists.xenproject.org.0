Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 248898D4020
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 23:12:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732385.1138363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCQaF-00048W-Ie; Wed, 29 May 2024 21:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732385.1138363; Wed, 29 May 2024 21:11:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCQaF-000470-FK; Wed, 29 May 2024 21:11:43 +0000
Received: by outflank-mailman (input) for mailman id 732385;
 Wed, 29 May 2024 21:11:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EvTx=NA=acm.org=bvanassche@srs-se1.protection.inumbo.net>)
 id 1sCQaE-00046u-EK
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 21:11:42 +0000
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a4659fb-1e00-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 23:11:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by 008.lax.mailroute.net (Postfix) with ESMTP id 4VqMWZ58Ltz6Cnk97;
 Wed, 29 May 2024 21:11:38 +0000 (UTC)
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id MByd4wIRut8R; Wed, 29 May 2024 21:11:34 +0000 (UTC)
Received: from [100.96.154.26] (unknown [104.132.0.90])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4VqMWR0L4Mz6Cnk95;
 Wed, 29 May 2024 21:11:30 +0000 (UTC)
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
X-Inumbo-ID: 0a4659fb-1e00-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1717017094; x=1719609095; bh=wVUy7o3bXf/noy6YSu0RsfBf
	kRiwLQrgb5cMP2Pa7q8=; b=QFjHmHY3/zEesfTR56+Y2SAfx/9kF8USAaPfodaa
	1NlbISeQtFhMQo5eKeT71tNXYkxOsczf07HR2Jg7kDECPZHbMqyg4jYdehcmpc6U
	pDScRpKKu8Rjyhm7pbf60HZtmxriYQ66+aBloWTpP6m/aGYjU5d8dR4eSVUqQ/OA
	xYtc6lzNLpfolCh3T1Mfx+tpCeFXkuhAlul/aC6d93xzuIXsbbqvGhKw9HLqQ8Hv
	yZpoz1hZaaNwZnzsSClMVINGA6pWnoN6MCYirTHscroKGo27eDVHIhGrEeOJHh7Z
	7W5OQwUFrkBQjwlsjPeC4wUGmMgkfdxis25NEBJvc3gvXQ==
X-Virus-Scanned: by MailRoute
Message-ID: <7828c48b-2a37-4033-a634-7a4fad4f94fd@acm.org>
Date: Wed, 29 May 2024 14:11:28 -0700
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
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240529050507.1392041-8-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/24 22:04, Christoph Hellwig wrote:
> Split the logic to pick the right discard mode into a little helper
> to prepare for further changes.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

