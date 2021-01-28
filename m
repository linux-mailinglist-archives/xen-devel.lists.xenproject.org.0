Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B68307394
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 11:22:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76852.138853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l54Qx-000319-Sl; Thu, 28 Jan 2021 10:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76852.138853; Thu, 28 Jan 2021 10:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l54Qx-00030j-PV; Thu, 28 Jan 2021 10:21:51 +0000
Received: by outflank-mailman (input) for mailman id 76852;
 Thu, 28 Jan 2021 10:21:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wA0P=G7=gmail.com=rjwysocki@srs-us1.protection.inumbo.net>)
 id 1l54Qw-00030N-AK
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 10:21:50 +0000
Received: from mail-ot1-f50.google.com (unknown [209.85.210.50])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 056ddad7-296b-4d7e-a700-6599ee558b13;
 Thu, 28 Jan 2021 10:21:49 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id d7so4674680otf.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 02:21:49 -0800 (PST)
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
X-Inumbo-ID: 056ddad7-296b-4d7e-a700-6599ee558b13
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HDfQ7EgSz4He6IVrUzqy89nGy356H19n/4Ap6Knawyw=;
        b=kswgEGTy+8Ov4JP/MLpEyrBJLBVAaOYCtPFuZrROR2AVOnml51wrc9dbEiotKYTGUW
         qbZD5o9r+naOO8WyXoA55UsAuCXkvB4MAQpXsA5B1pdzKlUBW4Xew0ecLc8zQ9zY7ZJ5
         NiqTZhtUf00QvM9W7BnNNL7ke8Gs8gztM7aPmNlBRXEybX32ssStTrCq0dqolr2+3pM0
         mK7cxxuxdTb2kQDQC18ZvZV3di1fwWdL4+huuJeNzl6axpvLygH9zFN8hpwsyXjzK4Zb
         Q4UOXkorpfZOCyjkFxJNTnb0wQGpqkWwSHbcKKnMOX1juy8lngcuzEGzZT2sBYxKZXL7
         0OTg==
X-Gm-Message-State: AOAM533DJ0pYvR2zMbDaxhc6NgdLUPQjReBwnb45CckAJ/njkxiB9I/R
	XGsgBw5TSPwh/RmVceXhMZolvoNBJ14xqo3kV/8=
X-Google-Smtp-Source: ABdhPJwJviHVEMHN6dwg9pHl9sFzPeOTWi/Tyw7MUMRzUkqGbWVHXybuLc31QSYFbmu849bxozre+7WWIBRJddZRpNc=
X-Received: by 2002:a05:6830:2313:: with SMTP id u19mr11117098ote.321.1611829309173;
 Thu, 28 Jan 2021 02:21:49 -0800 (PST)
MIME-Version: 1.0
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com> <20210128071133.60335-30-chaitanya.kulkarni@wdc.com>
In-Reply-To: <20210128071133.60335-30-chaitanya.kulkarni@wdc.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 28 Jan 2021 11:21:36 +0100
Message-ID: <CAJZ5v0h01e4LgV0c5FxLorcc6iFW2LVzC=hJcd7LNAJ6D0E8jg@mail.gmail.com>
Subject: Re: [RFC PATCH 29/34] power/swap: use bio_new in hib_submit_io
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	dm-devel@redhat.com, linux-block@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, drbd-dev@lists.linbit.com, 
	xen-devel@lists.xenproject.org, linux-nvme <linux-nvme@lists.infradead.org>, 
	"open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>, target-devel@vger.kernel.org, 
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com, 
	Linux PM <linux-pm@vger.kernel.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Jens Axboe <axboe@kernel.dk>, 
	Philipp Reisner <philipp.reisner@linbit.com>, Lars Ellenberg <lars.ellenberg@linbit.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, roger.pau@citrix.com, 
	Minchan Kim <minchan@kernel.org>, ngupta@vflare.org, 
	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Alasdair Kergon <agk@redhat.com>, 
	Mike Snitzer <snitzer@redhat.com>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	"Ted Ts'o" <tytso@mit.edu>, jaegeuk@kernel.org, Eric Biggers <ebiggers@kernel.org>, 
	djwong@kernel.org, shaggy@kernel.org, konishi.ryusuke@gmail.com, 
	Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>, damien.lemoal@wdc.com, naohiro.aota@wdc.com, 
	jth@kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, 
	Pavel Machek <pavel@ucw.cz>, Andrew Morton <akpm@linux-foundation.org>, Hannes Reinecke <hare@suse.de>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Takashi Iwai <tiwai@suse.de>, 
	Alex Shi <alex.shi@linux.alibaba.com>, asml.silence@gmail.com, 
	Ming Lei <ming.lei@redhat.com>, Tejun Heo <tj@kernel.org>, osandov@fb.com, 
	Bart Van Assche <bvanassche@acm.org>, jefflexu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 28, 2021 at 8:21 AM Chaitanya Kulkarni
<chaitanya.kulkarni@wdc.com> wrote:
>

Please explain in the changelog why making this change is a good idea.

> Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
> ---
>  kernel/power/swap.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/power/swap.c b/kernel/power/swap.c
> index c73f2e295167..e92e36c053a6 100644
> --- a/kernel/power/swap.c
> +++ b/kernel/power/swap.c
> @@ -271,13 +271,12 @@ static int hib_submit_io(int op, int op_flags, pgoff_t page_off, void *addr,
>                 struct hib_bio_batch *hb)
>  {
>         struct page *page = virt_to_page(addr);
> +       sector_t sect = page_off * (PAGE_SIZE >> 9);
>         struct bio *bio;
>         int error = 0;
>
> -       bio = bio_alloc(GFP_NOIO | __GFP_HIGH, 1);
> -       bio->bi_iter.bi_sector = page_off * (PAGE_SIZE >> 9);
> -       bio_set_dev(bio, hib_resume_bdev);
> -       bio_set_op_attrs(bio, op, op_flags);
> +       bio = bio_new(hib_resume_bdev, sect, op, op_flags, 1,
> +                     GFP_NOIO | __GFP_HIGH);
>
>         if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE) {
>                 pr_err("Adding page to bio failed at %llu\n",
> --
> 2.22.1
>

