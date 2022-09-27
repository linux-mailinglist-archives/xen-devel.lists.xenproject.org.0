Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B85925EC3FA
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 15:16:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412562.655942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odAQu-0007X4-I8; Tue, 27 Sep 2022 13:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412562.655942; Tue, 27 Sep 2022 13:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odAQu-0007Tw-F1; Tue, 27 Sep 2022 13:15:32 +0000
Received: by outflank-mailman (input) for mailman id 412562;
 Tue, 27 Sep 2022 13:15:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Wqf=Z6=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1odAQs-0007Tq-Dp
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 13:15:30 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 753ce9d5-3e66-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 15:15:29 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id r18so20571396eja.11
 for <xen-devel@lists.xenproject.org>; Tue, 27 Sep 2022 06:15:29 -0700 (PDT)
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
X-Inumbo-ID: 753ce9d5-3e66-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=9veZoOWQRZ+PH+Nkd5KG1hCn+KNodqzcpmqxxFh+XYQ=;
        b=V5IqUljfDK/x48H7ZVpwrZhZ9w69zyONo2K4GfuOfDlaQZ6FlAlFlC16ayBmKvzSxV
         CV0Ag9P+8y4+wad5UYteIb+4jfqTGGmp3S25mwyS2ofNByFK2p3m3hz+E4P82d0rTsQ3
         zK5PKLOVntGJmxLbmQhrziTpWYPdGjZ+dnmVwKcXkE7IEte5QIH+ZdjRtstaX8BNQNhT
         kkIeacpMTmATCS+6pSjwFssL68xYiVtpC2dd+bDKfV689F4xORjxlJA7VlQ5Q83/ajFV
         CAemEa7Bmpznn+mofXVX8Jev0LOfsMwstvxC+g4n0/m2TDPbGkNHPA4Q4e4JLYf6e8z4
         qMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9veZoOWQRZ+PH+Nkd5KG1hCn+KNodqzcpmqxxFh+XYQ=;
        b=UkqBCrTN/coR7XlYwxhyD/5/S0AycOZEaFZvEeodRzi17k5skq2ejrHL4TvKPJNa+8
         pvDscSeGFy2DKMExL9PBOPUm+Os4izMThyDSYmVV/782RXcP57p6EOfoAks+u6BPv03u
         TC6nl7c2kJu1VBjKngXnTCg2bo3xbns8Hl30LE8KK60HUL+SIpk/8fxKBq8jJC5/O2Xk
         HcM6Pbktu8oI5ne15P2TPtOEbB7egd9FR0Z8PiXs4sAzfiVjJsjObt5AvecQSKnKQCTS
         iEjr3xNZHa9HjH2aDnuju+nXcLxdvT4SJ7Poht12pfJRSr6eFtZLJ/fgU6U0OKWZqjA5
         hZng==
X-Gm-Message-State: ACrzQf0qrE6yh2d7RKdZi2UIFnmCY6jMRUBh4v9oNdPEr4oEvkaIrb+7
	P36vJfWHHPFnGiMQKPrH8nZaWWHfhS7aWQCXEOA=
X-Google-Smtp-Source: AMsMyM4Tkkfx88Q5Bz6ENmEJrN8n6eocl5Jf2H5SZGnxaeXXVbN9FHKMwg9O+fGO7KCn9lnFpIuN6qOyaflncDtvnU0=
X-Received: by 2002:a17:907:e9e:b0:783:1a8c:9198 with SMTP id
 ho30-20020a1709070e9e00b007831a8c9198mr12647561ejc.202.1664284528942; Tue, 27
 Sep 2022 06:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220905135019.3749982-1-marmarek@invisiblethingslab.com>
 <20220905135019.3749982-2-marmarek@invisiblethingslab.com> <CAKf6xpvD_FfodR1NnY-NhEE2EADGAMdYM1WcoqPAKsFeamWnSg@mail.gmail.com>
In-Reply-To: <CAKf6xpvD_FfodR1NnY-NhEE2EADGAMdYM1WcoqPAKsFeamWnSg@mail.gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 27 Sep 2022 09:15:16 -0400
Message-ID: <CAKf6xpvstXH=FNaa2yNxm3c=J5Tmf5P-kuyG+FFvRPL1GpJ7wQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] tools/libxl: enable in-band reconnect marker for
 stubdom QMP proxy
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 6, 2022 at 8:45 AM Jason Andryuk <jandryuk@gmail.com> wrote:
>
> On Mon, Sep 5, 2022 at 9:50 AM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > This enables stubdom reliably detect when it needs to reconnect QMP
> > socket. It is critical, as otherwise QEMU will not send its handshake,
> > and so libxl will timeout while waiting on one. When it happens during
> > domain startup, it can result in error like this:
> >
> > libxl: libxl_pci.c:1772:device_pci_add_done: Domain 3:libxl__device_pci=
_add failed for PCI device 0:0:14.0 (rc -9)
> > libxl: libxl_create.c:1904:domcreate_attach_devices: Domain 3:unable to=
 add pci devices
> >
> > See vchan-socket-proxy commit message for details about this reconnect
> > corner case.
> >
> > Stubdomain side needs to use --reconnect-marker=3D1 option too.
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Also
Tested-by: Jason Andryuk <jandryuk@gmail.com>

