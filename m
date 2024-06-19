Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E33C790F041
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 16:21:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743836.1150826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJwBg-0000t5-4A; Wed, 19 Jun 2024 14:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743836.1150826; Wed, 19 Jun 2024 14:21:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJwBg-0000rW-1V; Wed, 19 Jun 2024 14:21:24 +0000
Received: by outflank-mailman (input) for mailman id 743836;
 Wed, 19 Jun 2024 14:21:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cBaG=NV=kernel.dk=axboe@srs-se1.protection.inumbo.net>)
 id 1sJwBe-0000rK-42
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 14:21:22 +0000
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [2607:f8b0:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 324fb57a-2e47-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 16:21:20 +0200 (CEST)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-7119502613bso87121a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 07:21:20 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb6b110sm10739431b3a.153.2024.06.19.07.21.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 07:21:17 -0700 (PDT)
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
X-Inumbo-ID: 324fb57a-2e47-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1718806878; x=1719411678; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TrxAc+Uu30dWHZppC8CN0wQM7I31e2d3aLis3drkvvE=;
        b=bY+UHX/2zRIjrVvW40Mnc/ieysEDD91I1SaSAGd9LoP7sDKihsZfQO8EYmYXxyhbrg
         JIUv/E3wSanGNRFy7VD7nBDVmUfFllGIspm/2n2mkyXeR3LXTQuoxVcxsOkRJ26FutKo
         3zia1zTJpbIcxJUZv9GUFRIqAbW2NQJ7xQDLc4un30dPk15/3/zfHaUs647XIxEMiz7g
         gVSfHu5CWUn6gHejngvakANbPnD3MaYD9wsSBJX241/fV7qZXmJuN4qwaw/5aJfHsT34
         Jaz1PiU6n8utr8/DA97MQ7sJxoyTrm81fZlUA8hDy4OXw+0FMWKbBbzHEntoRAojcFmD
         YVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718806878; x=1719411678;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TrxAc+Uu30dWHZppC8CN0wQM7I31e2d3aLis3drkvvE=;
        b=liOl2UXldQ5pvKi+jyvMvZdAfh/JSn31H7GwUqZvtygD0dgEr/Rq+gBWMW3I9uOkPp
         Xj3LJ8Rk3KhUuU74oLTjA1wMUo7KZ7O4YLOr+A68L2HkEp/fmZ/IDaLVX7fE2mJWZc/v
         TCXFezAzbO/WmIuNVKVnnHntAvC/Fk90dfbkFT8AD/yT35nzzRgu4XZq/Ze/wMgd8Hg9
         Mq6vG6/SEXBC3vWR9k4xzB+vg0PELAb/EXfuH9GU+MYumCW9UYt78+t1svTrzrRW9rmT
         P03jGyTe4TdwBd1HS6Ks7OL2rPnvleCVfTyzN7UWGrQpqJQapb8p7aNhhl9+G9KI8BMv
         MSxA==
X-Forwarded-Encrypted: i=1; AJvYcCUcsIV4mcKZtpuakXY/Cj2lLpC/n6tI6SzorWmrpHZlNWOCFynvQLlaFH4dbyUTSMVYX6j4ODK9lSW89/GiCQZW6ih033Mw+3u4e1V/gsM=
X-Gm-Message-State: AOJu0YwqE17j6kvTYBFebscwoEc6/khG0Jq5wWUDr+qR4gCrfE1tSxf+
	UbX2hQYY5g7IJ0mT2MDv6lUlILcK8Gl1j3GH2ap3zSQ4ZkZKvoemqqNKPVBOdLU=
X-Google-Smtp-Source: AGHT+IGlNYahWungPdY/VG0D2i+/kOzAqG/9vIEbq77BhnEO6pEhdeI5ihGxkaZBKQBmSE54SEc3pA==
X-Received: by 2002:a05:6a21:33a5:b0:1b8:622a:cf7c with SMTP id adf61e73a8af0-1bcbb727134mr2697727637.3.1718806878609;
        Wed, 19 Jun 2024 07:21:18 -0700 (PDT)
Message-ID: <e8e718ca-7d3a-4bce-b88a-3bcbe1fa32b0@kernel.dk>
Date: Wed, 19 Jun 2024 08:21:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: move features flags into queue_limits v2
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
 drbd-dev@lists.linbit.com, nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-block@vger.kernel.org
References: <20240617060532.127975-1-hch@lst.de>
 <171880672048.115609.5962725096227627176.b4-ty@kernel.dk>
Content-Language: en-US
In-Reply-To: <171880672048.115609.5962725096227627176.b4-ty@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/19/24 8:18 AM, Jens Axboe wrote:
> 
> On Mon, 17 Jun 2024 08:04:27 +0200, Christoph Hellwig wrote:
>> this is the third and last major series to convert settings to
>> queue_limits for this merge window.  After a bunch of prep patches to
>> get various drivers in shape, it moves all the queue_flags that specify
>> driver controlled features into the queue limits so that they can be
>> set atomically and are separated from the blk-mq internal flags.
>>
>> Note that I've only Cc'ed the maintainers for drivers with non-mechanical
>> changes as the Cc list is already huge.
>>
>> [...]
> 
> Applied, thanks!

Please check for-6.11/block, as I pulled in the changes to the main
block branch and that threw some merge conflicts mostly due to Damien's
changes in for-6.11/block. While fixing those up, I also came across
oddities like:

(limits->features & limits->features & BLK_FEAT_ZONED)) {

which don't make much sense and hence I changed them to

(limits->features & BLK_FEAT_ZONED)) {

-- 
Jens Axboe


