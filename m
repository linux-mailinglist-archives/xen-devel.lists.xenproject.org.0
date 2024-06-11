Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3D590419B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 18:51:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738640.1145459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH4i5-0004Z7-97; Tue, 11 Jun 2024 16:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738640.1145459; Tue, 11 Jun 2024 16:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH4i5-0004Wm-5t; Tue, 11 Jun 2024 16:51:01 +0000
Received: by outflank-mailman (input) for mailman id 738640;
 Tue, 11 Jun 2024 16:50:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GLyx=NN=toxicpanda.com=josef@srs-se1.protection.inumbo.net>)
 id 1sH4i3-0004Wg-Hs
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 16:50:59 +0000
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [2607:f8b0:4864:20::b2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6544281-2812-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 18:50:58 +0200 (CEST)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-dfa727cde2dso6227383276.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 09:50:58 -0700 (PDT)
Received: from localhost (syn-076-182-020-124.res.spectrum.com.
 [76.182.20.124]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-62ccaef2825sm20935207b3.139.2024.06.11.09.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 09:50:56 -0700 (PDT)
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
X-Inumbo-ID: c6544281-2812-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20230601.gappssmtp.com; s=20230601; t=1718124657; x=1718729457; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k7qH/Egkqtc5OmSCKcG8suDn1pwScsKWRQ+gioBgKgY=;
        b=PJESTWoQVy6Dhkt6D7dBOsO6aw4Cg07a8vF8akRIb2EBaRYSDHChl7n57hw7EODl9s
         KOv4+Ddfrh2UXXVaGaWsBV/g/BGIm+McSqa3ftaffhA0pzKIkAIjtK7kK0cSJIg1gzEA
         DCEEsJ6rjoe3/pcBAClEQzKGjL0yj0xnEKNkatCP8TCYDLEV/FqkDQf3pX58H5Lqc6lJ
         DLcsRkC73Fm2jHWr66DOXlWbZJXdzCiKdohpILjRNUuQL30LxgxyySFR0EnFjQbpnO99
         NVAf+vSjTpuCkyXUPi9TiWIJre2itl3aIip9jtko6ZSqsixxJVb2q6JpkZVy6rJcIL9o
         /NyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718124657; x=1718729457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7qH/Egkqtc5OmSCKcG8suDn1pwScsKWRQ+gioBgKgY=;
        b=w0OANrEeaXOW833fM9sCZg98eX7bKPkmtqC56RgZENoJHrsxnUEzPrvD4v8z9/EHe5
         covFfXYt956SYFr6a2AJ0CkddhYNuP7X5KXgLfUnKOIpldmWqlucGLGzpCQpuQw0nIXE
         v5O7OxvGo61+vxQikkP5mALTZ6lRf5eJ/zsv8MHwRTlV9pLkYj/8oEstSD4OkEzxIuSy
         IOt5yPFnNUcp1O0pwOu9+o4FYP7QGlyj68MZmN+1CBBgDN6tmE0VLW2nYDbb42qggz+x
         IyharMJpcrb16PeUU8H1W+Y2oOzKPncDqhXWzrO4OXbPSXA80FsVdD/TNQfBl4jaAZNc
         gSFw==
X-Forwarded-Encrypted: i=1; AJvYcCUQzyq19Md2j3RF4F3H7qNClVFbHygpIq1IwRq0BBV2Ql+jAK9y4maXTr6QfepHQLV7LyPiFC4PRE6F52ZirXvQ942O9B4OlcwdgRJm7zo=
X-Gm-Message-State: AOJu0YxjGEzzCi529dKk1ELVPMyIhQHkBfAFo7CznKYXxm+/Mr47pzCt
	XPXOZuuLzvfs5i6aTqUKiaVRb1GxVjHK/Jg6HyWXd4t54Gz44xWUpDgLN2D5fxM=
X-Google-Smtp-Source: AGHT+IFLbNcRGoXteJvsvQz9ePKtTqtffGprFSIVvQoC+S7q0aJ0DFFhhqHjAFy+KyUVXYjD8ktBew==
X-Received: by 2002:a0d:d851:0:b0:618:95a3:70b9 with SMTP id 00721157ae682-62cd565129cmr130634777b3.36.1718124656832;
        Tue, 11 Jun 2024 09:50:56 -0700 (PDT)
Date: Tue, 11 Jun 2024 12:50:55 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Weinberger <richard@nod.at>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Ming Lei <ming.lei@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
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
Subject: Re: [PATCH 09/26] nbd: move setting the cache control flags to
 __nbd_set_size
Message-ID: <20240611165055.GD247672@perftesting>
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-10-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611051929.513387-10-hch@lst.de>

On Tue, Jun 11, 2024 at 07:19:09AM +0200, Christoph Hellwig wrote:
> Move setting the cache control flags in nbd in preparation for moving
> these flags into the queue_limits structure.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

