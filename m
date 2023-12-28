Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 268B481F357
	for <lists+xen-devel@lfdr.de>; Thu, 28 Dec 2023 01:19:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660175.1029720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rIe6X-0000O0-4x; Thu, 28 Dec 2023 00:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660175.1029720; Thu, 28 Dec 2023 00:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rIe6X-0000LE-0z; Thu, 28 Dec 2023 00:18:29 +0000
Received: by outflank-mailman (input) for mailman id 660175;
 Thu, 28 Dec 2023 00:18:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7FLA=IH=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rIe6V-0000L8-1U
 for xen-devel@lists.xenproject.org; Thu, 28 Dec 2023 00:18:27 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9da79bfd-a516-11ee-9b0f-b553b5be7939;
 Thu, 28 Dec 2023 01:18:24 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-55361b7f38eso6526442a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Dec 2023 16:18:24 -0800 (PST)
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
X-Inumbo-ID: 9da79bfd-a516-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703722704; x=1704327504; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ty1HrluIyWlwK9H1Q2n+4+yZjMwvSzLh2UT0uncqt3M=;
        b=Jg1ItsrSgCFkQdmapDQFEKD0DWbh/IUDSFM8Y7wtEZyNM2N3TdWPRx99nJL9Jq2657
         rSjZCCTvDIac5tSiS/QMgBMWkigbMzIy3b3Ri4WnJXlcqql52/Fk2aqzz6p6hjzIzTws
         MT391Pt/Ehcpsm1C52OKgINM7jbuIIgTe5nPwoMrOYS4Zo/qIh6Yv5iO6XIdAHm+zI5Y
         lavnbLvuQ480PpJd3KK/SCli+JVqSlA4iOt0mpBy+K0lHKIGhTQpVsF1AqtzTzRiQY8a
         BLoqZl5hISAryWKEwTCi+P0flYjfdGHdk59jw5L/ddmcPHvVgNOrBqPML5NvmoOuqmdn
         On4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703722704; x=1704327504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ty1HrluIyWlwK9H1Q2n+4+yZjMwvSzLh2UT0uncqt3M=;
        b=eBkcid1zSAyy0XnZnOPKEWjNUr+yUut6NqFmSF7QdUg3+cuNl5jeY0wh47HllljAWO
         MhHcD/iOYtiDjZKFUI06DZwHx3CqEEAMXBe8loEiEO1kKR1dYNDQGqfdKzXqH5HGk7cW
         txCESk3Du22e5PwTvqLPaMDZQ9A5pHDOGaNgCRN0sBuEpOlnYHjt8HKymWArtRkGHIjz
         ADxgm3EqPor+Ul2AtoWPSdGvrnbho20himViGmJIVtwB7vCmQp8TqfDsLl8WMjAunGnI
         RrhmcdvL/btnVi3R0IF52Z9X8X580MFQ2GgWFg7qMdh9220uNfvMOTDf+5NeLiNN3vbs
         S/5Q==
X-Gm-Message-State: AOJu0YytyHNRr5kKmi4L0xlp8gZjuBb6jOCGBDlSWmcbfL1wGBuqXQCK
	GzIXx+Hj+CHiqJvRn2N3/2l89S0ZBAgzvP8pkwo=
X-Google-Smtp-Source: AGHT+IH+icQOdSmL+RmUd2rkZZgZLefJYIdwnl/forEw6n8Z14HqAecth59X0pozY0FoEPJvT9FtVYOm87a184fgFM0=
X-Received: by 2002:a50:ab1d:0:b0:553:49f1:8366 with SMTP id
 s29-20020a50ab1d000000b0055349f18366mr4425930edc.77.1703722704263; Wed, 27
 Dec 2023 16:18:24 -0800 (PST)
MIME-Version: 1.0
References: <20231227023544.1253277-1-marmarek@invisiblethingslab.com>
In-Reply-To: <20231227023544.1253277-1-marmarek@invisiblethingslab.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 27 Dec 2023 19:18:12 -0500
Message-ID: <CAKf6xpsa_8nRyR-dY8sTQ6HsywZBmDvu29WwerxNkvJFqHq+fQ@mail.gmail.com>
Subject: Re: [PATCH] libxl: Disable relocating memory for qemu-xen in
 stubdomain too
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Neowutran <xen@neowutran.ovh>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 26, 2023 at 11:49=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> According to comments (and experiments) qemu-xen cannot handle memory
> reolcation done by hvmloader. The code was already disabled when running
> qemu-xen in dom0 (see libxl__spawn_local_dm()), but it was missed when
> adding qemu-xen support to stubdomain. Adjust libxl__spawn_stub_dm() to
> be consistent in this regard.
>
> Reported-by: Neowutran <xen@neowutran.ovh>
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,
Jason

