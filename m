Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0154949D2
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 09:47:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258997.446618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAT5a-00012t-1s; Thu, 20 Jan 2022 08:46:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258997.446618; Thu, 20 Jan 2022 08:46:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAT5Z-00010h-Uf; Thu, 20 Jan 2022 08:46:37 +0000
Received: by outflank-mailman (input) for mailman id 258997;
 Thu, 20 Jan 2022 08:46:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YbOW=SE=ionos.com=jinpu.wang@srs-se1.protection.inumbo.net>)
 id 1nAT5Y-00010b-Fy
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 08:46:36 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 790d3e33-79cd-11ec-bc18-3156f6d857e4;
 Thu, 20 Jan 2022 09:46:35 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id m4so25409045edb.10
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jan 2022 00:46:34 -0800 (PST)
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
X-Inumbo-ID: 790d3e33-79cd-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cgwK+h4TcKTuzoMVgpyjaT6hqJgZPgeFi9/82jcEytw=;
        b=bSaFa+URfbmU/MszEXVOlamjch2d/bVKLmiJuU4jZJRaWnRGqGHrY9tAQfmQRbRXiV
         uc/9kTk3/S5l1jHMLdTRmVU57otES44XeerqdTVprmM6I9EDUZQLX+yH0h63YbxWR9mE
         9nbGRPoufn7nse+dFWj62siY9k2GshoKLCrxbi33+uXmG5HvTOiNXAwJCNJOjjOHmaSp
         XOP01luyWgvqHzNdBA4wIYoRQp0k9Ft6zqCX+Ra/R90oY2R7/AxbMlg/sS1PwZuWZg03
         Z3JDZLtjXW1ZdUyTLOQOdSV8iGdn5zWa6hPXzsGCHlb9LWK1Z0CByscOqozFwyTfAd7X
         /t3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cgwK+h4TcKTuzoMVgpyjaT6hqJgZPgeFi9/82jcEytw=;
        b=yZRWVUi81W0QNsLqeyq3zlHT9lg5hU/P0eAV1BlfntXncPYSH/ku58ruYHNFCI3rrG
         Oz/nvGouMfCYvH6hT1c2/tPFO7Ox5aqjxDPjQUa76v4ImitY+vl6KvMCKNVNtX7XPm9L
         Wb+g58NZ6eOiobFQV6y6Ku3dWVedIFNUu34lCm04OXEZLJ+03tvqSSquTYgVG9Vd4iZs
         r6D+Mj9m/ywIfshfMO1PL8JUXNQj6XZNv2vZivQatlJjgGPn7E34Ni1egjJUF1BSwkb6
         sMVsF64vHDVO2QMBTB3ka+WGnJq5gdRA824h1qE/6eWGoyzmivsmwpr1Ye9B32cgUcI6
         Fq0Q==
X-Gm-Message-State: AOAM533iBIQ5pY9B0GqszzcAJJJEF/pp5RoTt7HiAYWKfkXSqVyoI8Mt
	6NWyFMoi+PN89cjG5DCC9tMsnJeVCDA7qWyXOVjRww==
X-Google-Smtp-Source: ABdhPJxuyj+5hYqiz1QG79H/zXO6tZsV+Dq+Pw3BW6UC4M2lhhCbPthTcTo8B1M9EwB4FqJ6g90lXSpEfvPIb7w08Cw=
X-Received: by 2002:a05:6402:195:: with SMTP id r21mr34247351edv.174.1642668394471;
 Thu, 20 Jan 2022 00:46:34 -0800 (PST)
MIME-Version: 1.0
References: <20220118071952.1243143-1-hch@lst.de> <20220118071952.1243143-11-hch@lst.de>
 <CAMGffEmFZB1PPE09bfxQjKw-tJhdprEkF-OWrVF4Kjsf1OwQ_g@mail.gmail.com> <20220120083746.GA5622@lst.de>
In-Reply-To: <20220120083746.GA5622@lst.de>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Thu, 20 Jan 2022 09:46:23 +0100
Message-ID: <CAMGffE=+ENBdRfugG4k3yB_ca3rqwnaKFXC4+8=CZ=LGvggA6w@mail.gmail.com>
Subject: Re: [PATCH 10/19] rnbd-srv: simplify bio mapping in process_rdma
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>, 
	Mike Snitzer <snitzer@redhat.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Md . Haris Iqbal" <haris.iqbal@ionos.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.co>, 
	Philipp Reisner <philipp.reisner@linbit.com>, Lars Ellenberg <lars.ellenberg@linbit.com>, 
	linux-block@vger.kernel.org, dm-devel@redhat.com, 
	linux-fsdevel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev, 
	xen-devel@lists.xenproject.org, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 20, 2022 at 9:37 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Jan 19, 2022 at 01:20:54AM +0100, Jinpu Wang wrote:
> > this changes lead to IO error all the time, because bio_add_page return len.
> > We need  if (bio_add_page(bio, virt_to_page(data), datalen,
> >                      offset_in_page(data)) < datalen)
>
> Does this version look good to you?
>
> http://git.infradead.org/users/hch/block.git/commitdiff/62adb08e765b889dd8db4227cad33a710e36d631

Yes, lgtm, thank you!
Reviewed-by: Jack Wang <jinpu.wang@ionons.com>
Tested-by: Jack Wang <jinpu.wang@ionos.com>

