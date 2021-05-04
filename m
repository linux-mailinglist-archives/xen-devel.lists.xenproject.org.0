Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40703372992
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 13:32:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122119.230302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldtHI-0005WE-AG; Tue, 04 May 2021 11:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122119.230302; Tue, 04 May 2021 11:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldtHI-0005Vp-7B; Tue, 04 May 2021 11:31:48 +0000
Received: by outflank-mailman (input) for mailman id 122119;
 Tue, 04 May 2021 11:31:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMRT=J7=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1ldtHG-0005Vk-GK
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 11:31:46 +0000
Received: from mail-lj1-x22c.google.com (unknown [2a00:1450:4864:20::22c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca75a0d6-ff98-48b7-be0f-1851e254e5c6;
 Tue, 04 May 2021 11:31:45 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id v5so1903476ljg.12
 for <xen-devel@lists.xenproject.org>; Tue, 04 May 2021 04:31:45 -0700 (PDT)
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
X-Inumbo-ID: ca75a0d6-ff98-48b7-be0f-1851e254e5c6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AJ8cGkmcBjEKVQ14Njcx0L8K0NUqs1k2Jl/LKA+r4xM=;
        b=BI3CZWk7tQaYSWhWn0E3v1WHCiBa5BBk+GarLzyDVXAZOHBxhBstKOKpyc1Gam4S1l
         MKshVKBp0JgrV5AKS6EDD0F35xJHL+/RVbJ5H8wPrz/OtSLUfuPeoLN7Yo9dSztVrxjh
         Yw7ZKA54APs1S67g3wotv6H1QogK8RZNhf/fsCsGGmTdGUnOdRWXe1WEHR+WqK4UBVHo
         3nC2BKcTOhWR8lWilE/RByNwKUc6nPsqavGA3DWtXIOJW0eujW8Wl+QG1Ct7LynyADUN
         tWSKjeVoW6xyK1OszBGHZzP7jsSt1aIH9rrQV+YGy5PX5B8rasU6u3a8geoXACcz0SZw
         0mXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AJ8cGkmcBjEKVQ14Njcx0L8K0NUqs1k2Jl/LKA+r4xM=;
        b=oUOwtgS95ly6QRjMhu+oMirXheuyoOIZwo7xCGLJuPYNccAgOpVyy3+3B4u4/hnGra
         BwtfcMuSdnJpkGuSrkbzckWjrAbWrIHgzHViyUSDRv6bVkfVuxSYGKBwS9mE7MRS34+k
         TZ42ihwXfdkkW7TbRWMLviajTsf+uQ++w+o90c0SA257NC5NNAJ6behRCw6GL+6m9Ygm
         iSA5LFQ7qRv1JgTTOMEUYp28xL+ePLiN8CfV7GJ+EEb9xm98orQSBOwjgOxau5Q4IrKp
         POOTtOcjNHgUc0zbSXpuXdrolSojX0UvTq0+x16qTl5CubSjqsn8rD3r/yrJFyJatJzS
         LXUg==
X-Gm-Message-State: AOAM531k+oQUVDMi637tyPR1atSy5wiNsdKpULEdOZ6EMU0PxZPa8Lf6
	pz6LTqTkj7YOMOv6XXFv26eR9LjEDi5obQEnuAk=
X-Google-Smtp-Source: ABdhPJzzeHtjx63/vg6E/VRtgoKuSHrf5qwXUvuOdG4o8I4/U/AYByYvI2mMR/4GRIgXvp2FAvXxbxiX5uTAJ6eugsY=
X-Received: by 2002:a2e:a7d4:: with SMTP id x20mr17071038ljp.285.1620127904669;
 Tue, 04 May 2021 04:31:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210503192810.36084-1-jandryuk@gmail.com> <20210503192810.36084-11-jandryuk@gmail.com>
 <398aa86f-13e4-e5d4-29d6-4491a05c920a@suse.com>
In-Reply-To: <398aa86f-13e4-e5d4-29d6-4491a05c920a@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 4 May 2021 07:31:33 -0400
Message-ID: <CAKf6xpvvMLT1ie089dqmjvsNgC+GZjbBkNTr4tS2VwRf0tEGbw@mail.gmail.com>
Subject: Re: [PATCH 10/13] libxc: Add xc_set_cpufreq_hwp
To: Jan Beulich <jbeulich@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 4, 2021 at 4:03 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 03.05.2021 21:28, Jason Andryuk wrote:
> > Add xc_set_cpufreq_hwp to allow calling xen_systctl_pm_op
> > SET_CPUFREQ_HWP.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> >
> > ---
> > Am I allowed to do set_hwp = *set_hwp struct assignment?
>
> I'm puzzled by the question - why would you not be?

Yes, I thought it perfectly sensible to do.    However, I didn't see
other places in the file assigning structs, so I was not sure if there
was some reason against it.

Thanks for taking a look.

Regards,
Jason

