Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C565E8D52A8
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 21:51:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733039.1139148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sClnr-0004V6-OE; Thu, 30 May 2024 19:51:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733039.1139148; Thu, 30 May 2024 19:51:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sClnr-0004SX-LO; Thu, 30 May 2024 19:51:11 +0000
Received: by outflank-mailman (input) for mailman id 733039;
 Thu, 30 May 2024 19:51:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/CNF=NB=acm.org=bvanassche@srs-se1.protection.inumbo.net>)
 id 1sClnq-0003tQ-0a
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 19:51:10 +0000
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5043a6e-1ebd-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 21:51:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by 008.lax.mailroute.net (Postfix) with ESMTP id 4VqxhD06zdz6Cnk9V;
 Thu, 30 May 2024 19:51:08 +0000 (UTC)
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id x4rVbmHKH9zP; Thu, 30 May 2024 19:51:03 +0000 (UTC)
Received: from [100.96.154.26] (unknown [104.132.0.90])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4Vqxh56rNhz6Cnk9T;
 Thu, 30 May 2024 19:51:01 +0000 (UTC)
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
X-Inumbo-ID: f5043a6e-1ebd-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1717098663; x=1719690664; bh=BLwZbOo2VuEjeawIOT3dZywp
	LeD1IzBghu5o+yp6hiA=; b=BMa7rd7XppGue5oaVmK2KHUY3MIK85AfzEEn+EKp
	bcNLOjbFEai52dS82B0yhSPKs5RyqQXlGiN4QD+YUDbrcAZHAjNBuw86VOjnbcWc
	KpSflEQS63VRNlvjxLG6uywRVDTYgOMSrCxedOS87bGL09MYLZfeGA3T5ub8rgQI
	sS/meOXbeO/ZoOUiTMgwb/aGcVJUK8awiaLnzIKJ7y1nfc5R9zHMSdwMeuPfjcqP
	3xL2my5/vEmEuShKNLcDV1pHPpTg6z1N0uk5Ah0GFOd0IfgaFouOWdGCAH9KTqO3
	3vxrR40G8smQRaSEyQHqccCit4O/AMIRLYUJfU2LODky0g==
X-Virus-Scanned: by MailRoute
Message-ID: <391fad91-7a65-4b2d-aa5d-58a5bc341d5f@acm.org>
Date: Thu, 30 May 2024 12:51:01 -0700
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
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240529050507.1392041-6-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/24 22:04, Christoph Hellwig wrote:
> Add helper to disable WRITE SAME when it is not supported and use it
> instead of sd_config_write_same in the I/O completion handler.  This
> avoids touching more fields than required in the I/O completion handler
> and  prepares for converting sd to use the atomic queue limits API.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


