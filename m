Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8523382D891
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 12:49:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667332.1038493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPLSP-0007Jw-LF; Mon, 15 Jan 2024 11:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667332.1038493; Mon, 15 Jan 2024 11:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPLSP-0007IM-Hm; Mon, 15 Jan 2024 11:48:45 +0000
Received: by outflank-mailman (input) for mailman id 667332;
 Mon, 15 Jan 2024 11:48:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JaYU=IZ=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rPLSO-0007ID-Hh
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 11:48:44 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07dcd2a5-b39c-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 12:48:42 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50e759ece35so9865985e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 03:48:42 -0800 (PST)
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
X-Inumbo-ID: 07dcd2a5-b39c-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1705319322; x=1705924122; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFIlhrybhO+sljsKgOTurLEBsQ668No2Ssxyu2yEUfQ=;
        b=h4ClJs1VV+WZh4oGcDQgT3ndOVCvnbzVnyAeErxLxWJ89VdnINA+pZirxF9uDOn5JD
         LFu90xD5Qyy8iBJFhFBcSxlXpx5SFhptTGD6ncOX/AHe+01f6OdaUW+0L+HXEQ/b/RfM
         38WAna6bruLtrSfDSnBglzNzEkKB25r+xfaAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705319322; x=1705924122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFIlhrybhO+sljsKgOTurLEBsQ668No2Ssxyu2yEUfQ=;
        b=fq9JN1Cix8jQzPSOfV70V+ckrit1DH0kPgvIWScO1qsbaKCGL25iACNakA0i053xFK
         1nDgU2s6k0vbACf/tehjzeYFcuV4LJrhtofT5n6jfTu7k+Pw1BGGxZnoL4Za/1LAB40r
         OmVKHdzIp0GB3dGc5i9432leiYNyiZS+q7WHJHT0A/7aON4p/d4sPkKB74nwa46kh7L5
         XluJ7oKn89mM+ZRHz4iou/e5XZndvMcjnlp3OXeqwwGfZryqEaDTkflViGCIbplGLthd
         spe5IcLa3NQsj3bm8TNqtsdKCkNgi3JabdYUk1CFv4b3NczQbhysGhuoXJ0ez91q18lj
         AfuA==
X-Gm-Message-State: AOJu0YyUWtMlj0r2MAgnz7GMPjwenbtO27hdGj79DyXcTUzxzPJMHlcq
	GLB879K+fyuqQRmUVwlZDJyhsooxsINIEsXK7Ps2n3yDx3Bg3g==
X-Google-Smtp-Source: AGHT+IHtUWQa5erx+MxhAgpsypVEmwtRRGihZqNMzfcFv0DNqbzTFJi4c+DnJUBffc0PpmjAZXqZkFCXNQcqjqRzSRY=
X-Received: by 2002:a05:6512:2256:b0:50e:e168:9fcd with SMTP id
 i22-20020a056512225600b0050ee1689fcdmr2916492lfu.26.1705319321871; Mon, 15
 Jan 2024 03:48:41 -0800 (PST)
MIME-Version: 1.0
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-12-stewart.hildebrand@amd.com> <CA+zSX=Z33cixDd1w10zwC-c80z-sB4E8Nu__nTNi30n-FW6GwA@mail.gmail.com>
 <39c114b7-2384-4209-bae5-edabb243226e@amd.com>
In-Reply-To: <39c114b7-2384-4209-bae5-edabb243226e@amd.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 15 Jan 2024 11:48:30 +0000
Message-ID: <CA+zSX=Zk4sSThR49xYY1eW8hiHwLq-jQ=ODcq9=6B+QO4RsqcA@mail.gmail.com>
Subject: Re: [PATCH v12 11/15] vpci: add initial support for virtual PCI bus topology
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 1:50=E2=80=AFPM Stewart Hildebrand
<stewart.hildebrand@amd.com> wrote:
>
> On 1/12/24 06:46, George Dunlap wrote:
> > On Tue, Jan 9, 2024 at 9:54=E2=80=AFPM Stewart Hildebrand
> > <stewart.hildebrand@amd.com> wrote:
> >> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> >> index 37f5922f3206..b58a822847be 100644
> >> --- a/xen/include/xen/sched.h
> >> +++ b/xen/include/xen/sched.h
> >> @@ -484,6 +484,14 @@ struct domain
> >>       * 2. pdev->vpci->lock
> >>       */
> >>      rwlock_t pci_lock;
> >> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> >> +    /*
> >> +     * The bitmap which shows which device numbers are already used b=
y the
> >> +     * virtual PCI bus topology and is used to assign a unique SBDF t=
o the
> >> +     * next passed through virtual PCI device.
> >> +     */
> >> +    DECLARE_BITMAP(vpci_dev_assigned_map, VPCI_MAX_VIRT_DEV);
> >> +#endif
> >>  #endif
> >
> > Without digging through the whole series, how big do we expect this
> > bitmap to be on typical systems?
> >
> > If it's only going to be a handful of bytes, keeping it around for all
> > guests would be OK; but it's large, it would be better as a pointer,
> > since it's unused on the vast majority of guests.
>
> Since the bitmap is an unsigned long type it will typically be 8 bytes, a=
lthough only 4 bytes are actually used. VPCI_MAX_VIRT_DEV is currently fixe=
d at 32, as we are only tracking D (not the whole SBDF) in the bitmap so fa=
r.

OK, that's fine with me.  (FYI I replied because I thought you needed
my ack specifically for sched.h; looks like any of THE REST will do,
however.)

 -George

