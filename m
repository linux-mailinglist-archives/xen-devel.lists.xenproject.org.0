Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A582DA5F5E8
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 14:25:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912141.1318466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsiYG-000204-8Y; Thu, 13 Mar 2025 13:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912141.1318466; Thu, 13 Mar 2025 13:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsiYG-0001xR-55; Thu, 13 Mar 2025 13:24:44 +0000
Received: by outflank-mailman (input) for mailman id 912141;
 Thu, 13 Mar 2025 13:24:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/sFJ=WA=kernel.dk=axboe@srs-se1.protection.inumbo.net>)
 id 1tsiYE-0001xL-A1
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 13:24:42 +0000
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [2607:f8b0:4864:20::d2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 849abd27-000e-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 14:24:41 +0100 (CET)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-85ad83ba141so95368039f.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 06:24:40 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-85db879e512sm31580739f.28.2025.03.13.06.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 06:24:39 -0700 (PDT)
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
X-Inumbo-ID: 849abd27-000e-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1741872280; x=1742477080; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PLsvEgnbim2yotRJtm3RxSyGerYXasNwsqr+/KVpS4=;
        b=LeOw1zCrzrGMnHC0MTw0tnRlKNIY2n3q1d97jlYIN7htpGS7Fo33aJkpZU/i+UbsGz
         bwZIAOpLDonWjuU2nNHH8LxYCVeVLTO8LKplcMl+jm4fUN+LpEs93Y5O7qdup0wgwQgY
         Ro0UmjQiZW66emqH5cIZpSWWknCAdKnoEzgbD3wN0kw4VoNJpLAaev6csHvg+aFm2DHR
         EBe1UHq5WefzjkT16dnpWdZyqTlG5H3v76o5KU/1Vw9QQV5Ky6/+PnQhcuYmbVOvXnAS
         LaFUb4kvN6/GKrzjSaVBOleMsNdVQBd7aYAupBMBUuNVCxqJ7rYd4FvhSgs7A5cZccMs
         nSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741872280; x=1742477080;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5PLsvEgnbim2yotRJtm3RxSyGerYXasNwsqr+/KVpS4=;
        b=l0itK7uYEUKcm6EaRndBTAfUGeJ7fujzbQKJD6nFWQ0d9kQNpVzwrd8kJZbT1/x/ou
         IVCv6lzWhEcQWyYxc7gzTntDvzR4uonDOjUxoNTId1irnlVKT4NWmCLiniOJtAgtGhIV
         +hJTZBxUZH0TO0Y59/rKU/4xjQiMQyzgg8ZTv6WA5d/9Rxj9Hxxg/1Hfpvm9+WJ0hIMK
         eZaIpPSZVnxldL0W9gvLNGzI2F4mndeyD1Ks7v+WEJk+iWGyNlnh7lSPOzM+9j59QNPe
         NnQaUDiUKpFwiREVWq0UDm14H7ff28HDC4+9tiLxjXrTRI9WGe4v+6NIuwyUy+pQ9fsT
         8qSw==
X-Forwarded-Encrypted: i=1; AJvYcCVaOCgLPodBpU7H+XyJb3lbIelkQ2fSxlzPku5pONPX6echHFe1iGx679B2chtasEU9MyLdbhmOIy8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYJebKwwO0Z55rvSkj3RX+0cGKx4hYsKNIkE8ac5Cld51dimZZ
	0LfcJQc0Ly1qPDOZ2CKCB6QUCMQzAQ3lCbW8/0H5LUYMbi2CNTNERZipzU/GbB8=
X-Gm-Gg: ASbGncvwpkRldo8269IDUYH++H+SMGI9rH3x1qZyL+lWMqaNMa5/pwRfbE2A/7lsnZr
	eNr8oAFPMvL2GUDrzDXAuHcz+WfqRjDYAYmAjL0IRa8t69VHLobVtLUyeFQWfO+chHSIIrh0jQy
	AgCmjI9P8rvrbYS3iZLYg46FZ+3PyLUtQF5eos65NQff4DD/kqb2JiXjglwMcChnOvftc/4k92j
	JJreh2p9UYr6XfOl+BAXYYTryN1fHQuflfYnfLyu9lq6pBWR7gDs4fKYto6RdAWak/ggssFw50T
	UGn57YH++ppzEDWcgGf4jLy72lh1b+Q5Xa0=
X-Google-Smtp-Source: AGHT+IEer637uehs/daevOydns9iUer0NF8/Lop3Ui7LDoPjH6cMpb131IF3qkXQqxQNFL57dNEHAg==
X-Received: by 2002:a05:6602:380d:b0:85b:5494:5519 with SMTP id ca18e2360f4ac-85b54946d71mr1891701439f.5.1741872279762;
        Thu, 13 Mar 2025 06:24:39 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: "Md. Haris Iqbal" <haris.iqbal@ionos.com>, 
 Jack Wang <jinpu.wang@ionos.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Richard Weinberger <richard@nod.at>, 
 Zhihao Cheng <chengzhihao1@huawei.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>, 
 Chaitanya Kulkarni <kch@nvidia.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Anuj Gupta <anuj20.g@samsung.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org, 
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org
In-Reply-To: <20250313035322.243239-1-anuj20.g@samsung.com>
References: <CGME20250313040150epcas5p347f94dac34fd2946dea51049559ee1de@epcas5p3.samsung.com>
 <20250313035322.243239-1-anuj20.g@samsung.com>
Subject: Re: [PATCH] block: remove unused parameter
Message-Id: <174187227786.18244.14269218969550436496.b4-ty@kernel.dk>
Date: Thu, 13 Mar 2025 07:24:37 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Thu, 13 Mar 2025 09:23:18 +0530, Anuj Gupta wrote:
> request_queue param is not used by blk_rq_map_sg and __blk_rq_map_sg.
> remove it.
> 
> 

Applied, thanks!

[1/1] block: remove unused parameter
      commit: 61667cb6644f6fb01eb8baa928e381c016b5ed7b

Best regards,
-- 
Jens Axboe




