Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD272B4D71
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 18:38:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28560.57657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keiRq-0000ZD-SF; Mon, 16 Nov 2020 17:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28560.57657; Mon, 16 Nov 2020 17:37:50 +0000
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
	id 1keiRq-0000Yr-OT; Mon, 16 Nov 2020 17:37:50 +0000
Received: by outflank-mailman (input) for mailman id 28560;
 Mon, 16 Nov 2020 17:37:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BrUE=EW=kernel.org=song@srs-us1.protection.inumbo.net>)
 id 1keiRp-0000Ym-2t
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 17:37:49 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e20b3a0-7447-45de-9c27-6f6a82752644;
 Mon, 16 Nov 2020 17:37:48 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13FF322409
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 17:37:47 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 19so37211wmf.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 09:37:47 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BrUE=EW=kernel.org=song@srs-us1.protection.inumbo.net>)
	id 1keiRp-0000Ym-2t
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 17:37:49 +0000
X-Inumbo-ID: 2e20b3a0-7447-45de-9c27-6f6a82752644
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2e20b3a0-7447-45de-9c27-6f6a82752644;
	Mon, 16 Nov 2020 17:37:48 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 13FF322409
	for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 17:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605548267;
	bh=ftduAERcAIXDqH3TIoaKNDFMaog9lpKkHZKNbYpzPJA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=wH0K96aiOcV3zWDXEfO4eGXrSbfel4fzpavvJrcvlGnm+IOvE6CCXcyPRZ9CDEpWQ
	 ERyPgn3goZaj4Rjri8kCDsRD2QqVIDrl9bwMtmzAsZXelVyGcoi/J8IVVb6h9ki8ms
	 Nt6zKSXy/JZjbcTnM2HNzH4y+CQMSryqUl+eemUA=
Received: by mail-wm1-f51.google.com with SMTP id 19so37211wmf.1
        for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 09:37:47 -0800 (PST)
X-Gm-Message-State: AOAM531q7xsz7Xf2N58I4Ok+/rP+xF/irONLWmynjxrtI8d9V3B0+mg8
	UlzJTC8/TGUW3A9eodQ2GB2fhu577Ggy7EO2a44=
X-Google-Smtp-Source: ABdhPJwSJNXG5A+c75VC7fB+eg5ocrYD0cMopnWErnzA3/FY5Qe4JfgRdEHZElz1KxxX9qTRF1opV72EejXl51sD+G0=
X-Received: by 2002:a1c:bbc4:: with SMTP id l187mr17490114wmf.133.1605548265533;
 Mon, 16 Nov 2020 09:37:45 -0800 (PST)
MIME-Version: 1.0
References: <20201116145809.410558-1-hch@lst.de> <20201116145809.410558-29-hch@lst.de>
In-Reply-To: <20201116145809.410558-29-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Mon, 16 Nov 2020 09:37:34 -0800
X-Gmail-Original-Message-ID: <CAPhsuW5YeO0-Cb=avHu2osRKjz19Lvk4jWqaCdaqFnjbdPJtrw@mail.gmail.com>
Message-ID: <CAPhsuW5YeO0-Cb=avHu2osRKjz19Lvk4jWqaCdaqFnjbdPJtrw@mail.gmail.com>
Subject: Re: [PATCH 28/78] md: implement ->set_read_only to hook into BLKROSET processing
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>, 
	Josef Bacik <josef@toxicpanda.com>, Ilya Dryomov <idryomov@gmail.com>, 
	Jack Wang <jinpu.wang@cloud.ionos.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Minchan Kim <minchan@kernel.org>, Mike Snitzer <snitzer@redhat.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, dm-devel@redhat.com, 
	linux-block@vger.kernel.org, drbd-dev@lists.linbit.com, nbd@other.debian.org, 
	ceph-devel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-raid <linux-raid@vger.kernel.org>, linux-nvme@lists.infradead.org, 
	linux-scsi@vger.kernel.org, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2020 at 6:58 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Implement the ->set_read_only method instead of parsing the actual
> ioctl command.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Song Liu <song@kernel.org>

[...]

