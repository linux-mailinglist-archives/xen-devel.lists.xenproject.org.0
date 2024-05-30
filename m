Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FBA8D529D
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 21:48:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733023.1139128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCll8-0001k4-5q; Thu, 30 May 2024 19:48:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733023.1139128; Thu, 30 May 2024 19:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCll8-0001hr-2L; Thu, 30 May 2024 19:48:22 +0000
Received: by outflank-mailman (input) for mailman id 733023;
 Thu, 30 May 2024 19:48:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=csea=NB=gmail.com=idryomov@srs-se1.protection.inumbo.net>)
 id 1sCll6-0001RU-EY
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 19:48:20 +0000
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [2001:4860:4864:20::29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90242bff-1ebd-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 21:48:19 +0200 (CEST)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-24c9f73ccaaso721319fac.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 12:48:19 -0700 (PDT)
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
X-Inumbo-ID: 90242bff-1ebd-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717098498; x=1717703298; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41y1G1yWB6PRjXPqqWESihB4DpKvKPtS6LjA52lk1aM=;
        b=OIZ+wTtEi+sATpwCjdmYQf9r7LANBeAjWEEiDlm8qcJTj6chROqfgCMyLyl8LBAOsy
         lE90EStB9lpJZyWzf/WsZqe2cVhQIepyrtN/Zpn9Bfeka24LHc5Y+2PFvOMc4JK3+Efm
         8QPqjUusCe6r+St/Jz6Mlkf+9qwOeqbCAnnbl319vPZhxXAAshKkdfK2FS+jRgSu/3g9
         8a+XIDkM1EkTz97783v3UuFRGvUZduOzSZKtywWXw9QcYHqg5KOw7yBhRi2BSzpLr+VB
         1r87unwrdR12Rq7mmR1A9L7h3xr+rfFGl4kTdxUc8kb0oo6+hqgYQBQLJu8DCceZvL5T
         uAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717098498; x=1717703298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41y1G1yWB6PRjXPqqWESihB4DpKvKPtS6LjA52lk1aM=;
        b=NIeo7a+PfFrb8UJQaj7deG19JQwryMlY2lt9hydKZEsYhF4Dd1K0jkQLY53RUkLO3J
         jkuaQ0t5yTzEf2QCOspKefcBxlyp2DRvXAOxGUZv5jljr76zu8eqNjc1rA0xHBF5F2Et
         +EwYZPCnBXNYBFiOGmkepR/cQx5xrlcWVE89LbTxqEh5PgRdQv4TYgQUpR0iVJEvwD5q
         46LVVBI0RN5Y6QekM0wuDiNKNLYcf5n9Lto9gCjDEDzOfuCSVr1St9PCRfU7VR5rA11h
         bo1JCkVAFedmvjTjPGuuNo+4LerJGOU0bwNNX6a2I8XctBgcJEsG1w7sVWNIsMqWG5va
         YOdA==
X-Forwarded-Encrypted: i=1; AJvYcCWbzg6sjX03hcU8aapmL9YEfQiZL4tcKuxasYeRSsYSphiXgefHZ6IlCtD77qKy+2YJuAEhyGKgxNo+sv8Eo4EiQROAT24qVKhVSa6yKzw=
X-Gm-Message-State: AOJu0YxE4tBcofKoiEDP4OnkiYTAwqgPnFSoNLKba9vBJiF7pnWsvjTg
	IsF0y0pU38HFqe/63RRpUshbjpT0lAgUvv+CzZXQamMf+FBFYvqTwG59AI7RH6zW+K1nfFw1doa
	Zb847FnVyrK8c+vcZ0LB1pM16t7o=
X-Google-Smtp-Source: AGHT+IGxcLZtvGZ8VsT8cGFEuW/elxJjHWgoM8RDpdS5UpADe97i5sefwnR8gwVFsz1jHFTWagn8cx64x4raaIJwd/s=
X-Received: by 2002:a05:6870:b492:b0:250:6f7c:495 with SMTP id
 586e51a60fabf-2506f7c0a24mr2683166fac.9.1717098498330; Thu, 30 May 2024
 12:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240529050507.1392041-1-hch@lst.de> <20240529050507.1392041-3-hch@lst.de>
In-Reply-To: <20240529050507.1392041-3-hch@lst.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Thu, 30 May 2024 21:48:06 +0200
Message-ID: <CAOi1vP-F0FO4WTnrEt7FC-uu2C8NTbejvJQQGdZqT475c2G1jA@mail.gmail.com>
Subject: Re: [PATCH 02/12] block: take io_opt and io_min into account for max_sectors
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Josef Bacik <josef@toxicpanda.com>, 
	Dongsheng Yang <dongsheng.yang@easystack.cn>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	linux-um@lists.infradead.org, linux-block@vger.kernel.org, 
	nbd@other.debian.org, ceph-devel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 7:05=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> The soft max_sectors limit is normally capped by the hardware limits and
> an arbitrary upper limit enforced by the kernel, but can be modified by
> the user.  A few drivers want to increase this limit (nbd, rbd) or
> adjust it up or down based on hardware capabilities (sd).
>
> Change blk_validate_limits to default max_sectors to the optimal I/O
> size, or upgrade it to the preferred minimal I/O size if that is
> larger than the kernel default if no optimal I/O size is provided based
> on the logic in the SD driver.
>
> This keeps the existing kernel default for drivers that do not provide
> an io_opt or very big io_min value, but picks a much more useful
> default for those who provide these hints, and allows to remove the
> hacks to set the user max_sectors limit in nbd, rbd and sd.
>
> Note that rd picks a different value for the optimal I/O size vs the
> user max_sectors value, so this is a bit of a behavior change that
> could use careful review from people familiar with rbd.

Hi Christoph,

For rbd, this change effectively lowers max_sectors from 4M to 64K or
less and that is definitely not desirable.  From previous interactions
with users we want max_sectors to match max_hw_sectors -- this has come
up a quite a few times over the years.  Some people just aren't aware
of the soft cap and the fact that it's adjustable and get frustrated
over the time poured into debugging their iostat numbers for workloads
that can send object (set) size I/Os.

Looking at the git history, we lowered io_opt from objset_bytes to
opts->alloc_size in commit [1], but I guess io_opt was lowered just
along for the ride.  What that commit was concerned with is really
discard_granularity and to a smaller extent io_min.

How much difference does io_opt make in the real world?  If what rbd
does stands in the way of a tree-wide cleanup, I would much rather bump
io_opt back to objset_bytes (i.e. what max_user_sectors is currently
set to).

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D16d80c54ad42c573a897ae7bcf5a9816be54e6fe

Thanks,

                Ilya

