Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A1B322504
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 05:52:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88566.166582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEPf6-00024j-TM; Tue, 23 Feb 2021 04:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88566.166582; Tue, 23 Feb 2021 04:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEPf6-00024K-Q3; Tue, 23 Feb 2021 04:51:04 +0000
Received: by outflank-mailman (input) for mailman id 88566;
 Tue, 23 Feb 2021 04:51:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Sev=HZ=gmail.com=akihiko.odaki@srs-us1.protection.inumbo.net>)
 id 1lEPf5-00024F-AI
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 04:51:03 +0000
Received: from mail-ej1-x630.google.com (unknown [2a00:1450:4864:20::630])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4fe7bf9-a9ed-46c1-8b0b-9ee3bfec0e83;
 Tue, 23 Feb 2021 04:51:02 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id g5so32657138ejt.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Feb 2021 20:51:02 -0800 (PST)
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
X-Inumbo-ID: c4fe7bf9-a9ed-46c1-8b0b-9ee3bfec0e83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eyV0i+C+/h3drfKQYSgn5N2vYzhLCJd5VmWoT2VkEoU=;
        b=pzVLXKEKzvs2zueS4b8VZnt0B2A1VZQiMUTosGz2+LxDz2sOSMm+4do8amPtPwMInW
         RTNppoTFhwerWxvd4vhBVP+eccc8gKnbIsswMJkxxtgERcS3nh5YFFdYuC7ppTAghvUI
         GHspGWPEUc0tGE4oLfW4Oxd4aiB4rw9ySmsHad/Yf3U+TrO7ezR2NHXuZVcz1IM0gJQb
         XuITgLxiNTVC8HZ/14qhgD5HqwSjUDKAiPErn2GV2VZZKpWxSC/B4hDsNoI3R7dQqEyT
         HcSxTeU6R2eZL+FKcL8uuWWDx0cp67PYw2T1lAsCaz48ianIB3zX7ptpgkpadRjKovCS
         jERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eyV0i+C+/h3drfKQYSgn5N2vYzhLCJd5VmWoT2VkEoU=;
        b=a9QT7lADcTvoZDotF4lPtr1NC3X9i9x2DsKI3iwQ6nXerO51CiH9RRjYFy04oY5jlj
         YJjOALKASeCiRrwOZ2YgAgq1Sbd3BhopiB35mD230CdR98MjcRTSyEW/kHqomZ4akBYV
         ixwsZQGGkqEED+i2XBaqK5+XzLb30Ow9NleNKNMVFw2EnidVYC5Pkh17eUoC5KUigexn
         /UBnWf240GIltVLNe5/V0FJfhY8E5AP63nBlRPzuFNS39DEaMcp8bIudSwWt1uSDABcE
         etePUgitNHAHLzjjvd/SSNYYpvr8Drs3hNcUst54UpIGzVHYRnQP1N2o6OO4cIkyf3nK
         rq5g==
X-Gm-Message-State: AOAM530AbTlsSf5ps9TiQZdk//PoIPnOeunId+0MFYr0SN0JWpk1E5v3
	d2oMNubYN7dratH6kMy9IXBGI/cuPgALOdjeTsg=
X-Google-Smtp-Source: ABdhPJyEsVXOt5ffezeXVPCwJHnmQ5QdmAVNmzijrNpdiNHtBYNLyYXnrDbjRFz4rLHU+fbg3MyG2RTIHwjDpj372Ck=
X-Received: by 2002:a17:906:3856:: with SMTP id w22mr23918943ejc.77.1614055861541;
 Mon, 22 Feb 2021 20:51:01 -0800 (PST)
MIME-Version: 1.0
References: <20210221133414.7262-1-akihiko.odaki@gmail.com> <20210222105738.w2q6vp5pi4p6bx5m@sirius.home.kraxel.org>
In-Reply-To: <20210222105738.w2q6vp5pi4p6bx5m@sirius.home.kraxel.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Tue, 23 Feb 2021 13:50:51 +0900
Message-ID: <CAMVc7JVo_XJcGcxW0Wmqje3Y40fRZDY6T8dnQTc2=Ehasz4UHw@mail.gmail.com>
Subject: Re: [PATCH] virtio-gpu: Respect graphics update interval for EDID
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu Developers <qemu-devel@nongnu.org>, xen-devel@lists.xenproject.org, 
	"Michael S. Tsirkin" <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2021=E5=B9=B42=E6=9C=8822=E6=97=A5(=E6=9C=88) 19:57 Gerd Hoffmann <kraxel@r=
edhat.com>:
>
> On Sun, Feb 21, 2021 at 10:34:14PM +0900, Akihiko Odaki wrote:
> > This change introduces an additional member, refresh_rate to
> > qemu_edid_info in include/hw/display/edid.h.
> >
> > This change also isolates the graphics update interval from the
> > display update interval. The guest will update the frame buffer
> > in the graphics update interval, but displays can be updated in a
> > dynamic interval, for example to save update costs aggresively
> > (vnc) or to respond to user-generated events (sdl).
> > It stabilizes the graphics update interval and prevents the guest
> > from being confused.
>
> Hmm.  What problem you are trying to solve here?
>
> The update throttle being visible by the guest was done intentionally,
> so the guest can throttle the display updates too in case nobody is
> watching those display updated anyway.

Indeed, we are throttling the update for vnc to avoid some worthless
work. But typically a guest cannot respond to update interval changes
so often because real display devices the guest is designed for does
not change the update interval in that way. That is why we have to
tell the guest a stable update interval even if it results in wasted
frames.

Regards,
Akihiko Odaki

>
> take care,
>   Gerd
>

