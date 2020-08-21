Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F1024D3C7
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 13:20:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k955Q-0004nC-4Z; Fri, 21 Aug 2020 11:19:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vzen=B7=gmail.com=s.temerkhanov@srs-us1.protection.inumbo.net>)
 id 1k955O-0004n7-2h
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 11:19:54 +0000
X-Inumbo-ID: ddbd6d81-ef82-406b-ba1e-ffcb3f525b23
Received: from mail-ej1-x644.google.com (unknown [2a00:1450:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ddbd6d81-ef82-406b-ba1e-ffcb3f525b23;
 Fri, 21 Aug 2020 11:19:53 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id u21so1178456ejz.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2020 04:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=r9mUBDdCChJ7DyrvluFvFlo34+h/SN9Wr9TC+d4UVAY=;
 b=GX2sY70IHGEMKOSsQu4o63XR2XAaSgAbcYDdzPR9LiPo0ghc3yU1ZuzNBAOLDfPIRM
 xoaOpNL+DSmesq3sptdM8g7ISb3OS96L8MpZZ9/vf4y7tLk26BQPxwrlgzr5/lkEPqvq
 wRqDKELH7uoZz13ZytQmg7CRukwS+EyU7LZgtIWQ/zskkSu4dEgfzEOgGHXoaz4hobHq
 HmN6bP7/2K9D7m61xIpOzjHC4cmIgalkkcnlF2aTNGxKUECfHg20pt74sEUJHCc4Jo1q
 vwbJS+Wl35xciI+JCLTvbsZXF4fgMJ6/yPB2OgadXGwzOPn7kjOntW+kgOSO/a+rJOCe
 G/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=r9mUBDdCChJ7DyrvluFvFlo34+h/SN9Wr9TC+d4UVAY=;
 b=FtbwfMxz8jO639IXsTFBDn5J2g8sHyYFLbxTvFTRVtbJ7h9AndMECHsbKn95ll09TU
 FajpsEbfp+KEZ2bQULUzouybrx/72nj1XOwkzbs/UpqqUotdeyL6K4yp+3LUOKPNRHU5
 /F4mZFrBmILrE+r/AuJ6CQ0t46bvl+loSV95rzEGfEcF1JUbj70uexM7lZoFSiuou4qJ
 6+WXUFD924Hz1DdNl1hoMiEiH/BYbIX3fwr5OA4lhtCjgCH7HQyk+2fAV+NspA9gI3Sm
 RgOBfVwsIEWUWL+YTOafYjWhofe8zLlbQJirPXhsMwEpkbQ3hKKQ2VIA218jj3gAENZk
 svRg==
X-Gm-Message-State: AOAM533zvTzL7fokaEBz2NvuQrlnhYsAGofq6AoMHZorarK7YPCXnpSM
 0T8l7Vo1Xb+hLnyE3NtZgR2vccNVyhfFIcMDTiIfnkR5Bko=
X-Google-Smtp-Source: ABdhPJxtWE2QcMEz9LzTZRl1k1zHTfkiiDae3Rsox9iSOHrqMUdd1OJWnQW0oEy8VhFhfVknoU6WH7SbIkkz8eL9UnU=
X-Received: by 2002:a17:907:206a:: with SMTP id
 qp10mr1734551ejb.497.1598008792302; 
 Fri, 21 Aug 2020 04:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy9-cJuxC0jLPh6O-UCraThzg2wvNO29ZvxrBmVkatt_sg@mail.gmail.com>
 <20200821071547.18894-1-s.temerkhanov@gmail.com>
 <ccc1883f-876f-c1ea-bd68-b3c8ab267a8f@suse.com>
In-Reply-To: <ccc1883f-876f-c1ea-bd68-b3c8ab267a8f@suse.com>
From: Sergei Temerkhanov <s.temerkhanov@gmail.com>
Date: Fri, 21 Aug 2020 14:19:40 +0300
Message-ID: <CAPEA6dYXaw=ZYv1jJqK=8twVpKXQ8bG0erABKC6HiQh-DcZ-DQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Xen: Use a dedicated pointer for IRQ data
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

>Did you see any specific problem where handler_data is written by
another component?

I've posted this series in the thread
https://lists.xenproject.org/archives/html/xen-devel/2020-08/msg00957.html
where the problem is caused exactly by that behavior

>In case this is a real problem I don't think your approach will be accepte=
d
Any comments/suggestions are welcome

Regards,
Sergey

On Fri, Aug 21, 2020 at 1:18 PM J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wro=
te:
>
> On 21.08.20 09:15, Sergey Temerkhanov wrote:
> > Use a dedicated pointer for IRQ data to avoid conflicts with some
> > other parts of the kernel code which my use handler_data for their
> > own purposes while still running on Xen
> >
> > Sergey Temerkhanov (2):
> >    Xen: Use a dedicated irq_info structure pointer
> >    Xen: Rename irq_info structure
> >
> >   drivers/xen/events/events_2l.c       |  2 +-
> >   drivers/xen/events/events_base.c     | 80 +++++++++++++--------------=
-
> >   drivers/xen/events/events_fifo.c     |  5 +-
> >   drivers/xen/events/events_internal.h | 12 ++---
> >   include/linux/irq.h                  | 17 ++++++
> >   kernel/irq/chip.c                    | 14 +++++
> >   6 files changed, 78 insertions(+), 52 deletions(-)
> >
>
> Did you see any specific problem where handler_data is written by
> another component?
>
> In case this is a real problem I don't think your approach will be
> accepted, especially the IRQ subsystem maintainers probably won't
> like it.
>
> And please include the maintainers of the files you are modifying in
> the recipients list of the patch(es).
>
>
> Juergen

