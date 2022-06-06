Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0903153E4FD
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 16:11:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342618.567675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyDRm-0000ax-Kf; Mon, 06 Jun 2022 14:11:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342618.567675; Mon, 06 Jun 2022 14:11:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyDRm-0000Yh-HR; Mon, 06 Jun 2022 14:11:10 +0000
Received: by outflank-mailman (input) for mailman id 342618;
 Mon, 06 Jun 2022 14:11:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BfO3=WN=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1nyDRl-0000Yb-6P
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 14:11:09 +0000
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [2607:f8b0:4864:20::c2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81e5d5e4-e5a2-11ec-b605-df0040e90b76;
 Mon, 06 Jun 2022 16:11:07 +0200 (CEST)
Received: by mail-oo1-xc2a.google.com with SMTP id
 c17-20020a4ac311000000b0040ea8bf80f2so2811681ooq.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jun 2022 07:11:07 -0700 (PDT)
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
X-Inumbo-ID: 81e5d5e4-e5a2-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XEqJbeUtBUA7H3dETz0qV/lyhxCqf96iNnmhrd/lyBM=;
        b=nysprAenqNM4Mh2AKXkktVBD4SzwxWdU+Ux0NQ1Poi1P39NDpwkIieYI83zhNR+vpB
         wLL4HKuZhu6KtKsVC9+YvtiPE/0g7/QPg8Ex964zKYVJ+WCrbq6/rEfI/wtK62Ywu0ca
         nnaK1itiSkud0inplRvkuh43CgNx5T0Ek4e14aKDbpKpwU55oqI4uIPUu3YoZpJSM0tb
         KkomVsCewUKdYyRIOStaSOdeDuS0XXGc1JxhFXJAQRnhUTfD0D57R5ebQXhJJvHWiJve
         cApzA5pXnnmXk2b2g8Jy+8Uqw+bAoM0LfyE756JT5sJMr3XGqtL3BGZEhk9AoGeR7WcM
         1vuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XEqJbeUtBUA7H3dETz0qV/lyhxCqf96iNnmhrd/lyBM=;
        b=EX8p4RMQsiSVUIOwQUj72n7vUXhPaVOmwKGmrdiqLZ0zoBm/Ag3pU+coEqVu5ZCuYj
         O17SkxBvjDWlpKSqUUmQSrJzuT/Li2nDlpQp77FPeFwQrMgVl0Uypx8nN1snHtbU2mAK
         avl00HMR+WTuqbI8a8P2epCO8MR6/aaZ+zypMi8Y2leZ3/majY4ZixsokNjJJkCcjjqU
         Ts5ftDFDvQcUM3rrDwv3E0pieinXL1hZU6/SU75BSlURCYCoHwbFn6+F1jNuoIV1oALs
         2df+9Id1euIphAI8to3w5PvO9I0OD6nu4s6dMpYtPSfwKN2CjgKK0p5Y2vhiG2DO41ne
         Xpww==
X-Gm-Message-State: AOAM530nq81xDhT3QKJwWCtajUApVNQ8DkuIzVaBaj9Xw4vGMeqxgdWu
	UWhiOpgKRC3xRW7kFAelJOxWsk2tR5P+qhRjbcI=
X-Google-Smtp-Source: ABdhPJyrTZDaPeuBNCzLwj6fz+hW7GMmUfhUnksLKfF0rD0O+/mmMLD+Axjfuq0nQv2I9DOds4sEnec3Ze/pIdF6YcY=
X-Received: by 2002:a4a:6f49:0:b0:35e:1902:1d3b with SMTP id
 i9-20020a4a6f49000000b0035e19021d3bmr10104470oof.1.1654524666311; Mon, 06 Jun
 2022 07:11:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
 <8d45d05dae0b5a2aa62120c7ff62295319a74478.1654486751.git-series.marmarek@invisiblethingslab.com>
 <CABfawhn7XGoMRb9LsSwNyaCb92KD5jC4juM+NwOMyOntOgo5pg@mail.gmail.com> <Yp4JLd8UGS3jjD5Z@mail-itl>
In-Reply-To: <Yp4JLd8UGS3jjD5Z@mail-itl>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 6 Jun 2022 10:10:32 -0400
Message-ID: <CABfawhmz3+EJZ6qrqKOQ==Hmm93i+a4WBk8FcbOaBSxmaM3New@mail.gmail.com>
Subject: Re: [RFC PATCH 01/12] drivers/char: Add support for Xue USB3 debugger
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 6, 2022 at 10:03 AM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Mon, Jun 06, 2022 at 09:32:52AM -0400, Tamas K Lengyel wrote:
> > > +/* Supported xHC PCI configurations */
> > > +#define XUE_XHC_CLASSC 0xC0330ULL
> > > +#define XUE_XHC_VEN_INTEL 0x8086ULL
> > > +#define XUE_XHC_DEV_Z370 0xA2AFULL
> > > +#define XUE_XHC_DEV_Z390 0xA36DULL
> > > +#define XUE_XHC_DEV_WILDCAT_POINT 0x9CB1ULL
> > > +#define XUE_XHC_DEV_SUNRISE_POINT 0x9D2FULL
> > > +#define XUE_XHC_DEV_CANNON_POINT 0x9DEDULL
> >
> > I had to add an extra device ID here to get it working on my NUC,
> > would be nice if we could add that to the list of supported configs so
> > I don't need to custom patch:
> >
> > #define XUE_XHC_DEV_COMET_LAKE 0x02EDULL
> >
> > The patch is here:
> > https://github.com/tklengyel/xen/commit/dd0423aba6caa4ef41dff65470598a1=
c0c1105ae
>
> Interesting, I think known_xhc() is used only in the EFI variant of Xue.
> Xen one just looks for any XHC based on the device class. And indeed, I
> works for me on Tiger Lake that is not included here.
>
> I did need to select specific controller, since I have 3 of them:
> 00:0d.0 USB controller: Intel Corporation Tiger Lake-LP Thunderbolt 4 USB=
 Controller (rev 01)
> 00:0d.2 USB controller: Intel Corporation Tiger Lake-LP Thunderbolt 4 NHI=
 #0 (rev 01)
> 00:14.0 USB controller: Intel Corporation Tiger Lake-LP USB 3.2 Gen 2x1 x=
HCI Host Controller (rev 20)
>
> So, I need dbgp=3Dxue2 or dbgp=3Dxue@pci00:14.0.

Interesting! OK, I'll give that a shot and see if it works that way
for me too, it's certainly been a while since I last tested :)

Thanks,
Tamas

