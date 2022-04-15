Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C41B502378
	for <lists+xen-devel@lfdr.de>; Fri, 15 Apr 2022 07:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305346.520416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfECB-0006FK-Sf; Fri, 15 Apr 2022 05:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305346.520416; Fri, 15 Apr 2022 05:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfECB-0006DE-PX; Fri, 15 Apr 2022 05:08:35 +0000
Received: by outflank-mailman (input) for mailman id 305346;
 Fri, 15 Apr 2022 05:08:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0QNy=UZ=opensource.wdc.com=prvs=0972008b0=damien.lemoal@srs-se1.protection.inumbo.net>)
 id 1nfEC9-0006D8-TF
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 05:08:34 +0000
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1633e9b5-bc7a-11ec-a405-831a346695d4;
 Fri, 15 Apr 2022 07:08:30 +0200 (CEST)
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2022 13:08:28 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Apr 2022 21:38:53 -0700
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Apr 2022 22:08:29 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Kfkqw14Ytz1Rwrw
 for <xen-devel@lists.xenproject.org>; Thu, 14 Apr 2022 22:08:28 -0700 (PDT)
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id dF0E43yWNVGO for <xen-devel@lists.xenproject.org>;
 Thu, 14 Apr 2022 22:08:27 -0700 (PDT)
Received: from [10.225.163.9] (unknown [10.225.163.9])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Kfkqn6sCZz1Rvlx;
 Thu, 14 Apr 2022 22:08:21 -0700 (PDT)
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
X-Inumbo-ID: 1633e9b5-bc7a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1649999311; x=1681535311;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Fza98p6Hk/Oo3R5YjAQC2Nws92s1JhenlM6js5zQuBI=;
  b=eH7fhRQ5Emf7mnVoxYT0vT1ynrsoefol7CjLKx/XFK1lQ81oC9FnkImk
   0NvSAhootdN/mtykKo57EDtbn7QC7BqNjq7L/dHxLEFE6ljGWqWQIm0i3
   BW5OG8PE8TF6wOemfDnO5HzDUZnLBPyHAYk2akTrdI//A9C6bbVD9C8CG
   6QbLAAhWuHhV9fk4K+f8Pjrbv15O0S56sdANUVtss7i9WT7pH9QsV4tH5
   kCwbUNkuqTLEkoJQ/bUoE233322a65AFm2rEvTmKcnFsaa+C4zrvzX79x
   SMjZjjguqq845PbqpRFsFxIU8MBB741m0wBEDKq9MFre5pFWtmZ0idIkm
   g==;
X-IronPort-AV: E=Sophos;i="5.90,261,1643644800"; 
   d="scan'208";a="196832497"
IronPort-SDR: r/U+vtci+X4HPe9ujWMwpfkUfbsbCcWqXKxHoayJa6xV+i8v5i2KJRe1VLg0TixUuTDlh8KxUp
 xtu7gnPqPhAHBOpyCftZaSWw6kYpv4UNlptcVlimSaiEGocv+DQsQVCE0rd+HVrSWwP+Ch6KLr
 fRto+V9OoRAsqeiUsp7ZcOOXRLV1l8koA7C0phXDh93tn7qhJtYJ/BN2HJ/00GDqFatPr1iIwb
 UMOseDrWaxa5Dt0ktXrx4ay9KUVlHM+UiXIQgZgW3pIxDTHMnpEYqWO6/+Iviw7p3MNBB20myA
 a68RRPf1uCn8s+L/9Ibci2A6
IronPort-SDR: iL0mm+wiCaUehNzQTIAc5nHSO2tqDZxn1PKkGf9DXqWxstPp2kNwcB7Deo9AkpRy3RSw4yW4PY
 BOD6EeF/DGebidA6uvD5DpM7isv4WzqSJ8w8F9764sNrbz/HjjFv4964ZZ/GBpOZFrzNUPAeXV
 0rfe6BnNHdU2m8txIDi1Le0heuK4ojGJkkzlLD/NADRr8hp81l8bm4CQ8KZMF27OimFMxuEaOP
 QQOp5d2WGJE3M4c1zAU2bMhrbTxmYZeczUt1U7NjlOtuWa0rx2bl6W91DnlIbxAxGCLEP1xOJ+
 veA=
WDCIronportException: Internal
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1649999307; x=1652591308; bh=Fza98p6Hk/Oo3R5YjAQC2Nws92s1JhenlM6
	js5zQuBI=; b=PnLGxxEK3pLyssa8yxGNdC4XjW2wbor1ccVbtGFYLuF6J3cLtHd
	AbpMYH7aDhgG/pTbCzP2Jz5UXeITA2uAAyiR/Fy6attbFAobIm77MiZ1d9JwxmK8
	shfFnnjg3a2RytIj37jVhbyrF9O4v+hLyhCzQz2dnHJygtOnBuY0SiH0emrVEC5V
	37Q51RwNl9CEkvSI7J63mNoy2HlvXkxHid/Xl33/pVaD25Hfmrh/cyibuFKv7AtS
	/tmUO1ElBPCNJo60JkfPy33eMUDO0eae+UlOxVUV5CwFdxfl0b0VIs1osnbs2TmY
	qPuOzeMMi/kXJvdALFOBXWDwdlihcT0EYFQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Message-ID: <d7a39cfc-9b28-f0d6-bf62-4351c55daec2@opensource.wdc.com>
Date: Fri, 15 Apr 2022 14:08:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 27/27] direct-io: remove random prefetches
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: dm-devel@redhat.com, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, drbd-dev@lists.linbit.com,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
 ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, linux-mm@kvack.org
References: <20220415045258.199825-1-hch@lst.de>
 <20220415045258.199825-28-hch@lst.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220415045258.199825-28-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/15/22 13:52, Christoph Hellwig wrote:
> Randomly poking into block device internals for manual prefetches isn't
> exactly a very maintainable thing to do.  And none of the performance
> criticil direct I/O implementations still use this library function

s/criticil/critical

> anyway, so just drop it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>


-- 
Damien Le Moal
Western Digital Research

