Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F798D52D9
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 22:07:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733075.1139178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCm3h-0008Aq-Kn; Thu, 30 May 2024 20:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733075.1139178; Thu, 30 May 2024 20:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCm3h-000882-Hu; Thu, 30 May 2024 20:07:33 +0000
Received: by outflank-mailman (input) for mailman id 733075;
 Thu, 30 May 2024 20:07:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/CNF=NB=acm.org=bvanassche@srs-se1.protection.inumbo.net>)
 id 1sCm3g-00086D-4P
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 20:07:32 +0000
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e3de31e-1ec0-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 22:07:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by 009.lax.mailroute.net (Postfix) with ESMTP id 4Vqy352wXTzlgMVW;
 Thu, 30 May 2024 20:07:29 +0000 (UTC)
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id rlAwti_y4elY; Thu, 30 May 2024 20:07:24 +0000 (UTC)
Received: from [100.96.154.26] (unknown [104.132.0.90])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Vqy2z2TfbzlgMVV;
 Thu, 30 May 2024 20:07:23 +0000 (UTC)
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
X-Inumbo-ID: 3e3de31e-1ec0-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1717099644; x=1719691645; bh=+yfFxI5vXGgBtiGU+D99/ljE
	G0kpvZXmxQcSkudrr9s=; b=SqjKoZZdpT4MNXYDyRUM4JuIL15+lNbQrcfJuZsH
	5i+fsrz5hnUl5DlaKW9QovdJ8SbgPABGz/lXk+zTUX3IvVSOZF4hWm47ReZABvHU
	1s1mscyI3oBlHP5Trs1lvEnLVrL3MR78iVb0m7+89cOwsGpuvycL4ADEymuw7yOK
	9MD9bMpEl08HInq9MOQgt8+vi3M9lBRE3UqeLb9J4kdp+Fh7/qcGLKjRlZCsb8Bx
	RHiqCZS/DM7HHcWymvBmLE2Q9l8U7sARF6UgjfX76g9qvw1SryWswVnTVCdSLau+
	ynch4c8cn09wBIf16ogwWgDF+qVJWH9byKOSFXu+7Qieag==
X-Virus-Scanned: by MailRoute
Message-ID: <53fc8442-e27b-4e05-b93e-7b39b9146cce@acm.org>
Date: Thu, 30 May 2024 13:07:22 -0700
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
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240529050507.1392041-9-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/24 22:04, Christoph Hellwig wrote:
> Consolidate setting zone-related queue limits in sd_zbc_read_zones
> instead of splitting them between sd_zbc_revalidate_zones and
> sd_zbc_read_zones, and move the early_zone_information initialization
> in sd_zbc_read_zones above setting up the queue limits.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


