Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEC4848555
	for <lists+xen-devel@lfdr.de>; Sat,  3 Feb 2024 12:32:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675358.1050722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWEFB-0000sG-42; Sat, 03 Feb 2024 11:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675358.1050722; Sat, 03 Feb 2024 11:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWEFB-0000qV-1H; Sat, 03 Feb 2024 11:31:33 +0000
Received: by outflank-mailman (input) for mailman id 675358;
 Sat, 03 Feb 2024 11:31:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JBn0=JM=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rWEF9-0000qJ-CM
 for xen-devel@lists.xenproject.org; Sat, 03 Feb 2024 11:31:31 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c54990be-c287-11ee-8a45-1f161083a0e0;
 Sat, 03 Feb 2024 12:31:30 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d073b54359so34282471fa.0
 for <xen-devel@lists.xenproject.org>; Sat, 03 Feb 2024 03:31:28 -0800 (PST)
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
X-Inumbo-ID: c54990be-c287-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1706959887; x=1707564687; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iiyj18aRrfUjaARWFPuGN9TX5sHlhFENgj9Qgnt8pDY=;
        b=N7G0XJg2zW3lc/kSGXcgeK3/uzxEhluGOH5tiO/4XFE/CF/dcyug/mFNEm8Vu6jhaQ
         OQ32HXVAZP8Kr8C2XbzDJrta5m4BZa9ruGPhdHUen7j3VJVuwVtsVH+lPQqmAO+zYTvo
         mDIQD2Q0rqVWHe3LkPpA+zkLbl48v0x2Z3v5qmCBfqgaM/GIjmgl56iH6b/wTkWFKiBO
         3+1iX9EcD7H5DLNnZU0eLPiqWAoicyAs/CmWL7SdWtC/Kj4SPVJBx3tEdjgXbixiFIlN
         TSUMDeJ48RhfdtsDX0QGzGvu2O+Kc+mZJRuxCzKNvhOqP5+pv3S2puhBY9RkbbFbx5UD
         vbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706959887; x=1707564687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iiyj18aRrfUjaARWFPuGN9TX5sHlhFENgj9Qgnt8pDY=;
        b=dYcQX/7GFi+gCmB4j6u7iaGX7sa44q9nU6wYVDBKV3Hq1Ytkj/yRGZXRGvZdEhbT8A
         yQC3eCqjKG0GkkfAzwLuQg2oqmoNQLvu7bB/6GE3It8xEldC0COZ7kB0f1a1ckUre4IZ
         T2hYZKhvO7DvnKxmss0h7w4/Y5W8F/zFBV9uNGkCZ5b3Le0k9m3XhjLT3+a3GCL+LyDQ
         hWKYBqH05YSuArdVGjsjxznJmnpl3ywMrbZYJfe3onItmUrsw2smtd4ypMh8PekV/Efb
         g/cbemETMQFXPsqbttbLtFiA217/Kzm4oPkAoatEam03Ef3/BP4vR3sz5kU7QrJ7eg03
         SGaA==
X-Gm-Message-State: AOJu0Yzqnot68wU6Mzaj9ja3TwJ0WvPmJJ/fTiQRxXx7bSH+Q/YetYGU
	ll+VWXSJuPhgoCSZZ+WK3ja7uGqSaxXz6BYumD1lsXx5uoXz6i9E7dltsqfmlQ9vhOsDBdLeUxx
	6g+Nq4dlUnKB9hF0eXWkWcR4CZ5+oGyvj6ne16w==
X-Google-Smtp-Source: AGHT+IF99EqKUWQtk6SXSV/8x9o3bEaJnVobDpePd5hGbz9dX+6eVxFynBcxRSdve8zHx7AWsKhU8FtZIgHn12Ax6MY=
X-Received: by 2002:a05:651c:211a:b0:2d0:6bc4:238c with SMTP id
 a26-20020a05651c211a00b002d06bc4238cmr8514483ljq.42.1706959887565; Sat, 03
 Feb 2024 03:31:27 -0800 (PST)
MIME-Version: 1.0
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-2-carlo.nonato@minervasys.tech> <c6f2c117-c8a7-4356-8421-4781090279c0@suse.com>
In-Reply-To: <c6f2c117-c8a7-4356-8421-4781090279c0@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Sat, 3 Feb 2024 12:31:16 +0100
Message-ID: <CAG+AhRXA_RFLN2nxN7SwtTbwzyFZLteLxG2vsw9MTiJs5VbWAA@mail.gmail.com>
Subject: Re: [PATCH v6 01/15] xen/common: add cache coloring common code
To: Jan Beulich <jbeulich@suse.com>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Thu, Feb 1, 2024 at 1:18=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 29.01.2024 18:17, Carlo Nonato wrote:
> > --- /dev/null
> > +++ b/docs/misc/cache-coloring.rst
> > @@ -0,0 +1,87 @@
> > +Xen cache coloring user guide
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > +
> > +The cache coloring support in Xen allows to reserve Last Level Cache (=
LLC)
> > +partitions for Dom0, DomUs and Xen itself. Currently only ARM64 is sup=
ported.
> > +
> > +To compile LLC coloring support set ``CONFIG_LLC_COLORING=3Dy``.
> > +
> > +If needed, change the maximum number of colors with
> > +``CONFIG_NR_LLC_COLORS=3D<n>``.
> > +
> > +Compile Xen and the toolstack and then configure it via
> > +`Command line parameters`_.
> > +
> > +Background
> > +**********
> > +
> > +Cache hierarchy of a modern multi-core CPU typically has first levels =
dedicated
> > +to each core (hence using multiple cache units), while the last level =
is shared
> > +among all of them. Such configuration implies that memory operations o=
n one
> > +core (e.g. running a DomU) are able to generate interference on anothe=
r core
> > +(e.g .hosting another DomU). Cache coloring allows eliminating this
> > +mutual interference, and thus guaranteeing higher and more predictable
> > +performances for memory accesses.
>
> Since you say "eliminating" - what about shared mid-level caches? What ab=
out
> shared TLBs?

Cache coloring can help in reducing the interference, but you're right and
there are other factors to be considered. We will update the documentation =
to
better specify the applicability range and relax the terminology concerning
"eliminating" etc.

Thanks

> Jan

