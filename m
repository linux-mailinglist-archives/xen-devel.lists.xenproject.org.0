Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5D68D52E1
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 22:08:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733079.1139187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCm4S-0000IN-TP; Thu, 30 May 2024 20:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733079.1139187; Thu, 30 May 2024 20:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCm4S-0000Fo-Qe; Thu, 30 May 2024 20:08:20 +0000
Received: by outflank-mailman (input) for mailman id 733079;
 Thu, 30 May 2024 20:08:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/CNF=NB=acm.org=bvanassche@srs-se1.protection.inumbo.net>)
 id 1sCm4R-0000Fe-DQ
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 20:08:19 +0000
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a99fc40-1ec0-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 22:08:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by 009.lax.mailroute.net (Postfix) with ESMTP id 4Vqy411LtgzlgMVW;
 Thu, 30 May 2024 20:08:17 +0000 (UTC)
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 1HkePWDZ3j6e; Thu, 30 May 2024 20:08:13 +0000 (UTC)
Received: from [100.96.154.26] (unknown [104.132.0.90])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Vqy3w21PZzlgMVV;
 Thu, 30 May 2024 20:08:12 +0000 (UTC)
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
X-Inumbo-ID: 5a99fc40-1ec0-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1717099693; x=1719691694; bh=HAP2WXDhccKrBY2e7nb7eVhK
	KMZLSAfPEEOn8QVjvBM=; b=obeHdmp9YsUXuOZQLqScMEmH6Ih7ZfY/4iMCkRPI
	LYigt/zOg1B/psGhSXL1A6Nun9Xb4ACnTmneav70Y/d2lCEMW1iyAULS0JOi7N+M
	4D0Z++5JAW5CvV9F2QsCWiTxD25HQJrjl8jRDIIicgxUnyiQBaH4qocTpaXWsRpQ
	NFHwx9+r/3FZrmIkDJAMiSIYHaIZ4Dz1EiaeUipwbed35LdTnRzrbsLX4Btd/RQ/
	RHjxP9YfAad0XG4VPmEW2MotDp1hU4Cf4txtLNGvfUWjW59v/jqig6nN1/pf0pbD
	Jb5Rn6a1EQX7UKGspz9POkgxHq+rMXXDAO1vlh1wffB6ow==
X-Virus-Scanned: by MailRoute
Message-ID: <f4bf4ccd-04fe-4067-a658-270887abb50d@acm.org>
Date: Thu, 30 May 2024 13:08:11 -0700
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
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240529050507.1392041-12-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/24 22:04, Christoph Hellwig wrote:
> Remove all APIs that are unused now that sd and sr have been converted
> to the atomic queue limits API.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


