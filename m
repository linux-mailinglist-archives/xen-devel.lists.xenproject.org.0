Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D68F49F2C8
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 06:15:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261756.453615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDJbP-0004PY-FB; Fri, 28 Jan 2022 05:15:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261756.453615; Fri, 28 Jan 2022 05:15:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDJbP-0004Mc-C2; Fri, 28 Jan 2022 05:15:15 +0000
Received: by outflank-mailman (input) for mailman id 261756;
 Thu, 27 Jan 2022 21:38:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mi6w=SL=gmail.com=konishi.ryusuke@srs-se1.protection.inumbo.net>)
 id 1nDCTD-00083P-M5
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 21:38:19 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7120faee-7fb9-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 22:38:18 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id b9so7889197lfq.6
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jan 2022 13:38:18 -0800 (PST)
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
X-Inumbo-ID: 7120faee-7fb9-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z+U+izVFukrEKq10kL5qCCsiT3qJmeLAo+mnNrOVCPU=;
        b=DwtRea8LCCOg/PGJHjd1bTltmn0bHa2clILkAwGYtZppoAY25qIBMTxyD6B5uMLit6
         7wk+d+sZiWX35l8wQaAoyrJ9H5CizW30SYci3NU1ojzD14qB67btK2MGpyfbQ3U8Fswu
         zxqpCDGkYCIAg/NDZ5r6/eIuacbMkuvBlqu9ammCZDYbuScyx0/VXZFI/czsoS4aCdCY
         RzPo3aqhubsJoGDCZLj5SmdkiGyLla36RWFVNiU5MVGZ7MrbcY5xEOS4+eUv/n2M8qYN
         MVuY5Y428ZMyJxOjYYJ1BtbtHPjLQ+HBbJ/bfmBPwl0UHF3vKl1N9F7XDbteSxFshMZ6
         OfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z+U+izVFukrEKq10kL5qCCsiT3qJmeLAo+mnNrOVCPU=;
        b=wngYF+42Xvjt3euV9Yf7vclKE70OwRw/M73t0sczfW0MRWmsUtOAuiZlNPqFfSNi78
         wK+pqMdxYyQXWYhhckI8UgqDEe/pkuZhvmqdI/mpsMNR0rSXQLW+U7I4QG7bwmelDFai
         S2gYkHuAvLA2rjLwn7erTlA1wbp/wGuLCINGmI47BIlX4pM30va611QkQOFwldb4X2u0
         DK9Yys4LsHm0rqvkvZEh6XTAuokXAm4ka7WP/sk7rtJf1xgaVt1KgN/47loWbuvd/Us7
         pI5SuyUAZf2xDo2972Mt9hTsCvDmrXq7YQi2+9WCnFB0qSqEXgUjnlopgE5QpoT5ZH/w
         xnwA==
X-Gm-Message-State: AOAM533cgxTEA5snDxrk8mgywg8vN7fcxgCLVdaPDADu6UChFdXoxBy3
	E6/wybSQukOaNWGqaPK59KmLJo9Fgwc3kvxlLJ4=
X-Google-Smtp-Source: ABdhPJxaVoQ4SfBVmSOjFCGrgluhZGplrFWaRNqk5pMVob8JHRQWRWEKNtxwMeMPmpBWjy5SR70YaIdo0zrC/X/8wRA=
X-Received: by 2002:ac2:58f7:: with SMTP id v23mr4043478lfo.390.1643319497799;
 Thu, 27 Jan 2022 13:38:17 -0800 (PST)
MIME-Version: 1.0
References: <20220124091107.642561-1-hch@lst.de> <20220124091107.642561-3-hch@lst.de>
In-Reply-To: <20220124091107.642561-3-hch@lst.de>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Fri, 28 Jan 2022 06:38:05 +0900
Message-ID: <CAKFNMomoLqbbOwg5d6aBHCyGT5v+NF=N2Rm3QwYk8NDXsoJHtA@mail.gmail.com>
Subject: Re: [PATCH 02/19] nilfs2: remove nilfs_alloc_seg_bio
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>, 
	Mike Snitzer <snitzer@redhat.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Md . Haris Iqbal" <haris.iqbal@ionos.com>, 
	Jack Wang <jinpu.wang@ionos.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.co>, 
	Philipp Reisner <philipp.reisner@linbit.com>, Lars Ellenberg <lars.ellenberg@linbit.com>, 
	linux-block@vger.kernel.org, device-mapper development <dm-devel@redhat.com>, 
	linux-fsdevel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-nilfs <linux-nilfs@vger.kernel.org>, ntfs3@lists.linux.dev, 
	xen-devel@lists.xenproject.org, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 24, 2022 at 6:11 PM Christoph Hellwig <hch@lst.de> wrote:
>
> bio_alloc will never fail when it can sleep.  Remove the now simple
> nilfs_alloc_seg_bio helper and open code it in the only caller.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/nilfs2/segbuf.c | 31 ++++---------------------------
>  1 file changed, 4 insertions(+), 27 deletions(-)

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Thanks!

Ryusuke Konishi

