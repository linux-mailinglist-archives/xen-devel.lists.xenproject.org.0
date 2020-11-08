Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8040B2AABD7
	for <lists+xen-devel@lfdr.de>; Sun,  8 Nov 2020 16:15:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.21708.48053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbmPT-0006iy-MF; Sun, 08 Nov 2020 15:15:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21708.48053; Sun, 08 Nov 2020 15:15:15 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbmPT-0006iZ-Ij; Sun, 08 Nov 2020 15:15:15 +0000
Received: by outflank-mailman (input) for mailman id 21708;
 Sun, 08 Nov 2020 15:15:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P9lC=EO=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1kbmPR-0006iN-QS
 for xen-devel@lists.xenproject.org; Sun, 08 Nov 2020 15:15:14 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 8bfef111-cd1c-43f2-aad5-8e067207ac4c;
 Sun, 08 Nov 2020 15:15:11 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-SiUou0D8O3uLZ12GtKLeuQ-1; Sun, 08 Nov 2020 10:15:08 -0500
Received: by mail-wr1-f70.google.com with SMTP id q15so3064560wrw.8
 for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2020 07:15:08 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id l3sm11508325wmg.32.2020.11.08.07.15.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Nov 2020 07:15:06 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=P9lC=EO=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
	id 1kbmPR-0006iN-QS
	for xen-devel@lists.xenproject.org; Sun, 08 Nov 2020 15:15:14 +0000
X-Inumbo-ID: 8bfef111-cd1c-43f2-aad5-8e067207ac4c
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 8bfef111-cd1c-43f2-aad5-8e067207ac4c;
	Sun, 08 Nov 2020 15:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604848510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xCiEM7AQz5QZ2RvY5C0nr85g19BsqN3bEHGGJWjun8g=;
	b=REGghAwvDG700XxvFoEua2gT/PxE7PR+OMgmuToJtos0TbUsFc02pLoUFyg5u9TQ6GTd0A
	n2qVLz8dMOc4QT5AipGmGCRZLazwmkyyRNOI5YOh3w3XFNLLFv4FhPz+BkhcnUxXhI8aJz
	0KdtWMnG4Kk3tZ5ava30mnW7p3HOdPk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-SiUou0D8O3uLZ12GtKLeuQ-1; Sun, 08 Nov 2020 10:15:08 -0500
X-MC-Unique: SiUou0D8O3uLZ12GtKLeuQ-1
Received: by mail-wr1-f70.google.com with SMTP id q15so3064560wrw.8
        for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2020 07:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xCiEM7AQz5QZ2RvY5C0nr85g19BsqN3bEHGGJWjun8g=;
        b=sQ8Zb2abkMf5VSKXJdO/fGGuiJjZmK9Lau44+aQnr/p5VwV9FaGUBuMe2uBHGaxxM9
         0QStuatTi9GkF4rpOLwqGcXv3zn/6yxHan61Xjcs7c9PpOToN+FICwHeTF5CYevrbrwD
         JYKA1c6/C9x2vJF15RojYTIqOlnfDNnsMaedsVztk/fsj6Kw2cpF5h9JmapAsZ4vMf9F
         WK1mkFhVWioCE4j6yDwKneezNx3TfQRQjneKXKTFHYzgtmrvxHdkX+1htk9tqZbq3Su1
         xCrK7jvo57pDyPbvhyB6NaZ9+JQoTKU6ovB/49AlmdD6qZaCKA6uLfF1N6995kY2KqKm
         r5kw==
X-Gm-Message-State: AOAM531QEdSanxLN+LRRCZJVlzQVwCPucxxxXPeCsIa/Q3nKm9n+kcVF
	ia9LI0Ny52mi8pKkL+VcdkTzMJAJGXJyZlYY6Pz8/3q/KnEEy4gkzJAm+yaduWeCylMe/tTpqst
	MNmn3B8gA8ZAAOdVGKU5JijXQoeg=
X-Received: by 2002:a1c:80d3:: with SMTP id b202mr10142607wmd.139.1604848507853;
        Sun, 08 Nov 2020 07:15:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBz6wtcRAgwxrEGiAL8ElHcOzDdD7qQjz/7QuIFGOGrDkKJazoMrCqH8844xWODBZg8NNGyg==
X-Received: by 2002:a1c:80d3:: with SMTP id b202mr10142589wmd.139.1604848507695;
        Sun, 08 Nov 2020 07:15:07 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.gmail.com with ESMTPSA id l3sm11508325wmg.32.2020.11.08.07.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2020 07:15:06 -0800 (PST)
Subject: Re: [PATCH 23/24] virtio-blk: remove a spurious call to
 revalidate_disk_size
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>, Josef Bacik <josef@toxicpanda.com>,
 Ilya Dryomov <idryomov@gmail.com>, Jack Wang <jinpu.wang@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Minchan Kim <minchan@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
 Song Liu <song@kernel.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, dm-devel@redhat.com,
 linux-block@vger.kernel.org, drbd-dev@lists.linbit.com,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-raid@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
References: <20201106190337.1973127-1-hch@lst.de>
 <20201106190337.1973127-24-hch@lst.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d23bd50a-7555-438b-9e3b-131414b2d1a5@redhat.com>
Date: Sun, 8 Nov 2020 16:15:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201106190337.1973127-24-hch@lst.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/11/20 20:03, Christoph Hellwig wrote:
> revalidate_disk_size just updates the block device size from the disk 
> size. Thus calling it from revalidate_disk_size doesn't actually do 

s/revalidate_disk_size/virtblk_update_cache_mode/

> anything.


