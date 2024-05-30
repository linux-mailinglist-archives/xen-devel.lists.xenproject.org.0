Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E03C8D5295
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 21:47:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733015.1139108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sClk7-0000vA-LV; Thu, 30 May 2024 19:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733015.1139108; Thu, 30 May 2024 19:47:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sClk7-0000sn-I8; Thu, 30 May 2024 19:47:19 +0000
Received: by outflank-mailman (input) for mailman id 733015;
 Thu, 30 May 2024 19:47:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/CNF=NB=acm.org=bvanassche@srs-se1.protection.inumbo.net>)
 id 1sClk6-0000sh-E4
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 19:47:18 +0000
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a3a6d97-1ebd-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 21:47:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by 008.lax.mailroute.net (Postfix) with ESMTP id 4Vqxbk6tSqz6Cnk9T;
 Thu, 30 May 2024 19:47:14 +0000 (UTC)
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id tO0K_eu1GhdP; Thu, 30 May 2024 19:47:08 +0000 (UTC)
Received: from [100.96.154.26] (unknown [104.132.0.90])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4VqxbZ4pbBz6Cnk9F;
 Thu, 30 May 2024 19:47:06 +0000 (UTC)
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
X-Inumbo-ID: 6a3a6d97-1ebd-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1717098428; x=1719690429; bh=gIZD+XBfeoiXCs+vsIOauc0J
	AFtw0ViQpf0RwIfdqeI=; b=LeBK1nTDoaUU8KAvyoiidxeqI1H8VC7yltJTPW4y
	XkYIFoLA0Xsv871K8AMKv1pruRb7L5Vojxd3TXpVjOmpzCKnxzsAzPwXavUCLmiG
	5Io9SoOjP5YKnml8f0lVeIWDw6umtR8N2JBzgwVMlGiuo36RH4kWKMRKIp7SrKHq
	49OVo1TUglVJnZ/FHnf1DulkWr6IflF9OncnRDnJq9pnqGyM16QVtbsNy1ahrI3q
	GKMmq9vzmNV1PmpyA8YGpgIcN378oHvXWXKo5o6AkOKWk1xSeOKUZJjERmaxIpao
	1jHLbCjdnG+qM70N4r3Tjg99XIgFTQPKTwcpUYGYirs6RQ==
X-Virus-Scanned: by MailRoute
Message-ID: <8d927897-0436-4f47-9b03-c3e9adb90f40@acm.org>
Date: Thu, 30 May 2024 12:47:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] block: take io_opt and io_min into account for
 max_sectors
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
 <20240529050507.1392041-3-hch@lst.de>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240529050507.1392041-3-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/24 22:04, Christoph Hellwig wrote:
> The soft max_sectors limit is normally capped by the hardware limits and
> an arbitrary upper limit enforced by the kernel, but can be modified by
> the user.  A few drivers want to increase this limit (nbd, rbd) or
> adjust it up or down based on hardware capabilities (sd).
> 
> Change blk_validate_limits to default max_sectors to the optimal I/O
> size, or upgrade it to the preferred minimal I/O size if that is
> larger than the kernel default if no optimal I/O size is provided based
> on the logic in the SD driver.
> 
> This keeps the existing kernel default for drivers that do not provide
> an io_opt or very big io_min value, but picks a much more useful
> default for those who provide these hints, and allows to remove the
> hacks to set the user max_sectors limit in nbd, rbd and sd.
> 
> Note that rd picks a different value for the optimal I/O size vs the
             ^^
             rbd?

> user max_sectors value, so this is a bit of a behavior change that
> could use careful review from people familiar with rbd.

Anyway:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


