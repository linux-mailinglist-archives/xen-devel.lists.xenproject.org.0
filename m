Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE148D529C
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 21:48:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733022.1139118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCll3-0001UY-Tw; Thu, 30 May 2024 19:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733022.1139118; Thu, 30 May 2024 19:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCll3-0001Rl-RE; Thu, 30 May 2024 19:48:17 +0000
Received: by outflank-mailman (input) for mailman id 733022;
 Thu, 30 May 2024 19:48:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/CNF=NB=acm.org=bvanassche@srs-se1.protection.inumbo.net>)
 id 1sCll2-0001RU-47
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 19:48:16 +0000
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d4247be-1ebd-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 21:48:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by 008.lax.mailroute.net (Postfix) with ESMTP id 4Vqxcs6krTz6Cnk9T;
 Thu, 30 May 2024 19:48:13 +0000 (UTC)
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id ZPBeIfQpf7PL; Thu, 30 May 2024 19:48:09 +0000 (UTC)
Received: from [100.96.154.26] (unknown [104.132.0.90])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4Vqxcl3Zhlz6Cnk9F;
 Thu, 30 May 2024 19:48:07 +0000 (UTC)
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
X-Inumbo-ID: 8d4247be-1ebd-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1717098489; x=1719690490; bh=dyGzZSWLsyackA37XVq9nl02
	3b/Svu5aWeAkdF5uPBU=; b=rGDN10KGvDcmbfFgFHYGEoAseaR0fagJcQ3Kgqep
	Lubtq290OW2C91K9XeG9czurQf/wRzgWunDsFsAMxwo9wkZ+qvmKm4R0a1IhEFZs
	mDWx9FVqmwxJ1uh0jSOQryGjPbUDq3am1SqtPcwOYoYJeBhb7NS+0SA896mRwdax
	46is36KI4H8l2gh+0pU4iA/zQI9dYtDmKkBX014QQbhNpPugXqH9dZ3vHZGJc29x
	QNtcdSGsqF3KHp+AUYXr1LTxQON8ZUdXzrzE864yWEALccGzPTaLHZ74IyVMr54h
	4/Z8+E6et0bHB2aWboLglX7RhsaK/9E7/5fftwo1zhVw2w==
X-Virus-Scanned: by MailRoute
Message-ID: <55cbf9eb-a52c-4d1f-aaac-5d426b60d436@acm.org>
Date: Thu, 30 May 2024 12:48:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] sd: simplify the ZBC case in
 provisioning_mode_store
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
 <20240529050507.1392041-4-hch@lst.de>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240529050507.1392041-4-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/24 22:04, Christoph Hellwig wrote:
> Don't reset the discard settings to no-op over and over when a user
> writes to the provisioning attribute as that is already the default
> mode for ZBC devices.  In hindsight we should have made writing to
> the attribute fail for ZBC devices, but the code has probably been
> around for far too long to change this now.

If Damien's feedback gets addressed, feel free to add:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


