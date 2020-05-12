Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CF81CF7D8
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 16:51:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYWF9-0003wP-U3; Tue, 12 May 2020 14:50:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9uWS=62=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jYWF8-0003wI-1g
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 14:50:50 +0000
X-Inumbo-ID: f7c61a42-945f-11ea-b07b-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7c61a42-945f-11ea-b07b-bc764e2007e4;
 Tue, 12 May 2020 14:50:49 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id f18so13961915lja.13
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2020 07:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pUXqzPRwKc5es8JMb7JTyBoF2txoWiHqL8hOELqpXxA=;
 b=vONPMWinD+FUp5soNwqt2Bc6gVEFpFgQd0srt9kx73anU3wjOmLtC0lS82Z+JRrLL7
 VaAFU3vI48UXeZ/wFCAQHKcCFCtPd9grzB6YOnNjou8wij9khtvd23xRW9vMgAX57gAk
 ARKL/OiaDzbxTWhQwFcYSlNZmvggl/tBiI2iIJMwNlLr2iyaCPdDRoCmZmBgLPP+oYn0
 1ymjoP+NdKThT29fLbXQZUuDgvVWT/4mIG3aqmtXZencOXi1FsRQxm1jJtlKjsBId0Ml
 Wjb132M3uUxp4Ac+3MTNDc704KYEj1d9s9d1OqXXRteyPB0ZKLQ+vvvWXsplUB+yqjvm
 O2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pUXqzPRwKc5es8JMb7JTyBoF2txoWiHqL8hOELqpXxA=;
 b=Hx2H/DrrPqagshM0n7QIMbRwK9B+C3VTFSbwvGTVij9kcpoWdLClYrociEqgGgAJ3w
 TkGEm8rrmbjOV3PzDCWOjhqtBfhu2FwfgXL5iH87JeqND/E+3d+p+czbXcaPsor8qPrk
 tWMdU3BVStE5TgMTif2qqneuflKLX9YbGds0gs+rhkdW/02TncHHDw3wxAr2UaVgaHZ/
 O3sCmTC3ibbvrN7pzeUut1pguDbA8s3w71SIZeMNp+HjOgolCdbtcJXyElo27FBzOVKy
 0zx7N1IyhS4gKiA/5vxv4ELwM8tEgq2mjVyjz007mAnObGxDpNliJW/F2CvEAIE76oQ0
 LuMw==
X-Gm-Message-State: AOAM530xV6SB19bnFtAwiXiSYjQa1eMz+awZ/C5bqyXD7Um7+YAbUrGX
 mGQ6S/XTsuseeN6FHiwIPS8rtEGqzekp014l47I=
X-Google-Smtp-Source: ABdhPJyhuOmZ5kgyx7PEzutZc/kB1yw+GXfBfKt3GFrhmLh7QGgbNV6+m3/jHbIQr7bjMTbuL8Cx141as+znoe4z/ZY=
X-Received: by 2002:a05:651c:c8:: with SMTP id
 8mr13185719ljr.182.1589295048261; 
 Tue, 12 May 2020 07:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587682041.git.rosbrookn@ainfosec.com>
 <73e709cf0a87f3728de438e4a3b849462fd098ac.1587682041.git.rosbrookn@ainfosec.com>
 <59C12770-F12A-45B7-AB62-8BB3A0DC96D8@citrix.com>
 <CAEBZRSdtmyuKP4+yv8-2FjAkmBAc8L9MNr9r5cT4yUcyNM_v=g@mail.gmail.com>
 <47D89BFE-68EE-4E2F-80C0-6E6444CBDB04@citrix.com>
In-Reply-To: <47D89BFE-68EE-4E2F-80C0-6E6444CBDB04@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Tue, 12 May 2020 10:50:36 -0400
Message-ID: <CAEBZRScrMTobo8a5scX4sUeh1W59T2-A9kuDkGqbxNLa4-JfQA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] golang/xenlight: add NameToDomid and DomidToName
 util functions
To: George Dunlap <George.Dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> > I just tested this way, and it does not work as expected. Since
> > C.INVALID_DOMID is #define'd, cgo does not know it is intended to be
> > used as uint32_t, and decides to declare C.INVALID_DOMID as int. So,
> > C.INVALID_DOMID = ^int(0) = -1, which overflows Domid.
> >
> > I tried a few things in the cgo preamble without any luck.
> > Essentially, one cannot define a const uint32_t in C space, and use
> > that to define a const in Go space.
> >
> > Any ideas?
>
> The following seems to work for me.  In the C section:
>
> // #define INVALID_DOMID_TYPED ((uint32_t)INVALID_DOMID)
>
> Then:
>
>     DomidInvalid Domid = C.INVALID_DOMID_TYPED
>
> Attached is a PoC.  What do you think?

Yes, that looks good.

Thanks,
-NR

