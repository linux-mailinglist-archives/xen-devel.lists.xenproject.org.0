Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1330A3A4827
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 19:55:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140610.259768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrlND-0003a1-QQ; Fri, 11 Jun 2021 17:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140610.259768; Fri, 11 Jun 2021 17:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrlND-0003XQ-Mt; Fri, 11 Jun 2021 17:55:15 +0000
Received: by outflank-mailman (input) for mailman id 140610;
 Fri, 11 Jun 2021 17:55:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a66D=LF=kernel.dk=axboe@srs-us1.protection.inumbo.net>)
 id 1lrlNC-0003Wp-EK
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 17:55:14 +0000
Received: from mail-pj1-x1032.google.com (unknown [2607:f8b0:4864:20::1032])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d155e491-025b-4736-a1ec-82a9a14b9543;
 Fri, 11 Jun 2021 17:55:11 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id ei4so6107751pjb.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jun 2021 10:55:11 -0700 (PDT)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
 by smtp.gmail.com with ESMTPSA id
 x3sm6384950pgx.8.2021.06.11.10.55.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 10:55:10 -0700 (PDT)
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
X-Inumbo-ID: d155e491-025b-4736-a1ec-82a9a14b9543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FiCqgV8kjys+3xuqiyCwJtcf1Wj53LQ5ch2SqyLytgY=;
        b=SD6IZ6g/PQccK+DJj47BNWbjBcu51Hoxg75XX8W0NsqQBg0ABF+hnuOUc/UFnpm8im
         oNVX3uykvZuuO5Y8ikPd3y+WsvzDFhqLGs4yWHQFnc8RzIYufWCIOXqn3AApkjH4Q2eg
         xQaVfA+BsocsKdfD6NHf1Rfl2fMGnqoxNR3DdZP0eXDcQ/vjXZbD88x8d17C79EnssGA
         MaA3XiWo9+AFyaOrA1MdfYif3vi99movLQHJefeIj5rihTG1TSe1D2qp8+37dXVxo+jK
         juNRW5LpLgfCfOOUxjWz+2zHY1TAZQqD4FUpZkK9KYz4TPA/VoJTiiPZCp8OQM00GFzi
         g76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FiCqgV8kjys+3xuqiyCwJtcf1Wj53LQ5ch2SqyLytgY=;
        b=NtO7hYyBiRpM/GiQLFm3nx0+F74AdnJwkWAZ5ChUAlGk+QoN6hD3X6y2barpVYq5iR
         IqoIVzmmqq3+bI5z1hbxTjg3DQKAkzdUP3/3/GitFS192z15yTIen/RTSnRYsoWBOCHO
         n157NAmhh0JJBXvzJYNrv58PdvTN9UYA4EBTIGeRmgojko+mSRhj7RoprhVZVhYnVde2
         +IyiM5UmTXlQmoWRuKdsbGTjOFAyp1ACLG1WTZdBZeH2fIKYQGLKpDHF9u54beBcuXx1
         /BmYg+wChpNVeuk1aMu4pL6Lse9kV4Me/yQr5yRAoaPl0mKo5QlbKX1/rrxrx0NUdrzH
         Zo3Q==
X-Gm-Message-State: AOAM5303B4NfsVVF+i1J+Yr9PH1hTv9MhpT1RU5rbcP8RJoHmGSw1PqS
	kcTzjEsPudWyMEayEM4YcWF9Ng==
X-Google-Smtp-Source: ABdhPJxMGSnZ9kJAsN6p7k0McSncvftPUJip5kVUuOxTF3REguFHe02Lgz4i9/8fJhn7M2nOfjp+aA==
X-Received: by 2002:a17:90a:9481:: with SMTP id s1mr5656508pjo.48.1623434110978;
        Fri, 11 Jun 2021 10:55:10 -0700 (PDT)
Subject: Re: simplify gendisk and request_queue allocation for blk-mq based
 drivers
To: Christoph Hellwig <hch@lst.de>
Cc: Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>,
 Josef Bacik <josef@toxicpanda.com>, Tim Waugh <tim@cyberelk.net>,
 Geoff Levand <geoff@infradead.org>, Ilya Dryomov <idryomov@gmail.com>,
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>, Jack Wang <jinpu.wang@ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Mike Snitzer <snitzer@redhat.com>, Maxim Levitsky <maximlevitsky@gmail.com>,
 Alex Dubov <oakad@yahoo.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, dm-devel@redhat.com,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20210602065345.355274-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <fa9590e3-20eb-5215-d2f7-6489169c232c@kernel.dk>
Date: Fri, 11 Jun 2021 11:55:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210602065345.355274-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/2/21 12:53 AM, Christoph Hellwig wrote:
> Hi all,
> 
> this series is the scond part of cleaning up lifetimes and allocation of
> the gendisk and request_queue structure.  It adds a new interface to
> allocate the disk and queue together for blk based drivers, and uses that
> in all drivers that do not have any caveats in their gendisk and
> request_queue lifetime rules.

Applied, thanks.

-- 
Jens Axboe


