Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A7A8D52A4
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 21:51:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733034.1139137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sClnN-0003vO-Gb; Thu, 30 May 2024 19:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733034.1139137; Thu, 30 May 2024 19:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sClnN-0003tW-Du; Thu, 30 May 2024 19:50:41 +0000
Received: by outflank-mailman (input) for mailman id 733034;
 Thu, 30 May 2024 19:50:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/CNF=NB=acm.org=bvanassche@srs-se1.protection.inumbo.net>)
 id 1sClnM-0003tQ-1B
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 19:50:40 +0000
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2e70403-1ebd-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 21:50:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by 008.lax.mailroute.net (Postfix) with ESMTP id 4Vqxgd2Y61z6Cnk9V;
 Thu, 30 May 2024 19:50:37 +0000 (UTC)
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id NvbqtULo1Ahy; Thu, 30 May 2024 19:50:32 +0000 (UTC)
Received: from [100.96.154.26] (unknown [104.132.0.90])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4VqxgW0TsNz6Cnk9T;
 Thu, 30 May 2024 19:50:30 +0000 (UTC)
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
X-Inumbo-ID: e2e70403-1ebd-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1717098632; x=1719690633; bh=7QFmifQMChBXa8KST+DsqdnF
	Epu7aV4gNbQITRSzRXY=; b=WUjlX1PDIQyMgUb/0/yO+Fvzm6H2r3VbR/ytQbyG
	ja1ZtUlCegyS9BGCsSsID9x1/+kDjEs1NxZDIrjljFC2ZUpQ8nSD6H6RckeDAaV/
	8NybhiHj4Sye5m61h+RgA1L76P3LsN9DZgjtG7WVblDA+TCSZ/ARfrUBW1SRcvIq
	CUnB7FlcYqzV2NUiwaoz3LW53sA83Z9iucHomhpMAkPcCpOBKOEtiyurze8Qo3I0
	N3az9ReZGqTkXsyoXq0i+KzjVMS+igSHckcZ9ZyYDlURgNiKKLrMqPh/lqphOWEQ
	PLQr+L12hPXk4p6dZ8EbtkCXzU85zv+TAPmk7Obq/DjhLg==
X-Virus-Scanned: by MailRoute
Message-ID: <bb168ec3-b3e8-4e40-8f8c-eb0a1dd00f16@acm.org>
Date: Thu, 30 May 2024 12:50:30 -0700
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
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240529050507.1392041-5-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/24 22:04, Christoph Hellwig wrote:
> Add helper to disable discard when it is not supported and use it
> instead of sd_config_discard in the I/O completion handler.  This avoids
> touching more fields than required in the I/O completion handler and
> prepares for converting sd to use the atomic queue limits API.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


