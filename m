Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 461A31C6283
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 22:58:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jW4dF-0004ry-1o; Tue, 05 May 2020 20:57:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MjzU=6T=arndb.de=arnd@srs-us1.protection.inumbo.net>)
 id 1jW4dD-0004rt-DS
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 20:57:35 +0000
X-Inumbo-ID: 0a95c2be-8f13-11ea-ae69-bc764e2007e4
Received: from mout.kundenserver.de (unknown [212.227.17.13])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a95c2be-8f13-11ea-ae69-bc764e2007e4;
 Tue, 05 May 2020 20:57:34 +0000 (UTC)
Received: from mail-qv1-f41.google.com ([209.85.219.41]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N49Qd-1j5ECr2dDl-0107Nk for <xen-devel@lists.xenproject.org>; Tue, 05 May
 2020 22:57:32 +0200
Received: by mail-qv1-f41.google.com with SMTP id y19so1784160qvv.4
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2020 13:57:32 -0700 (PDT)
X-Gm-Message-State: AGi0PuY8zWWwp807FEScVvJ8Zm1FJbWCnA5VF4tFUVJLKqRheNkX9n9B
 NSfByNeCpI7+T/wZr88IIHvYnlNGuLdNwhK33GQ=
X-Google-Smtp-Source: APiQypJrgFYMvWYQxR3/H4be6yfzqH6LIElWNTCfGS8MCkKF2CDVLP6zcvtTKAL/xjFld7TVJiEQt5NIfuQ2sfTN1L0=
X-Received: by 2002:ad4:4a8b:: with SMTP id h11mr4439312qvx.210.1588712251082; 
 Tue, 05 May 2020 13:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200505141546.824573-1-arnd@arndb.de>
 <30d49e6d-570b-f6fd-3a6f-628abcc8b127@suse.com>
 <CAK8P3a0mWH=Zcq180+cTRMpqOkGt05xDP1+kCTP6yc9grAg2VQ@mail.gmail.com>
 <48893239-dde9-4e94-040d-859f4348816d@suse.com>
In-Reply-To: <48893239-dde9-4e94-040d-859f4348816d@suse.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 5 May 2020 22:57:15 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2_7+_a_cwDK1cwfrJX4azQJhd_Y0xB18cCUn6=p7fVsg@mail.gmail.com>
Message-ID: <CAK8P3a2_7+_a_cwDK1cwfrJX4azQJhd_Y0xB18cCUn6=p7fVsg@mail.gmail.com>
Subject: Re: [PATCH] xenbus: avoid stack overflow warning
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eSPut2LR8tLz9Gzz4klRf8e6S9M70N85/jjDmGdciw76UpH+DKg
 Br6YHWXJF1V9PdpF7cCOCME8zBq3T+F4THcpTx9HGFNvgavsbUFoi/bcAEAPf84zpq8/Bqd
 a4srMQ4BndtOstdNzP4Pwo5sy4pPTUBmJ0WqflcoNn+IQvGjfWx7liVUA1wFSTAtdmSgzY+
 akwufJWkjOPvm1jBzbAnA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WxzfDs83W4I=:vtkzVRGM2JCTD4CZbpLuqZ
 MEYBZS4ZM8eTEeSrw2k32hXmS3rosOYTAO+AwW5XoIDEYo6pfSsdY81uVMiZStVyxBfM4YXSE
 jf6aYfCyWE2NK8S8SM/radEhX+nraQvwmTCJL901WhDWdD3JGkHbiKtWcQBEHcKuKjFLV3Ms0
 U1QTD8uZ3Uy3ohslLg4SA3Z5dt2nfy2UHFVeVLj7FKQz2txWyWwGiLiYugvXePZcuhNmVx3DN
 goej5W9nfSxtFqyrv9zQGS1Bp2dN8HIidNGf+AhwoI/W3DiiUDdJGxcWPuY/AlcvvldCG5pcW
 lzyhCMjooz9t9h4CMzSsbEyfN5XikLQPoATrItKHcVX5RQqXhYGsoDaC1qQMXsXMmun9EYkQH
 eyu3Q4aZOTZeR0KSnMqmCUQ6G1HWQz25g0lsaBPo4VFa8cluVYomC9ujsVQM+VByiOhQdkc6W
 vGcJu0/SgVrcQLPwY6m6A2UnJxza5kIZCTc39cXviKk8fi2u85ZyG47xXhOmEhzk8niF8vdXM
 g78FLyrpN5zZSpxCm899i9/KbKchHQhqV6P/QND7k4PwvwpkKHhQ4hPo72xj+fc5vgIFpBVm/
 gRq6Fasdg4CC9216JHrFC9CIewSEsvg7eAmGAxrmri1PAESDcByaI/0tWBok0Wk45HixECbVs
 xlO1y82meQcZN/PV33kgg/Ybnlvl1sGPsV/DPKhe5ddVH1QVq/RFbf08A96fjER61QmM53uTy
 OUEni7QZj8c2Z7H4SnXDVkZFbKbV+ZjsOnNQSFNdKvTWR0iGlexJgL8EpnQtxhSpVoti2fEJp
 HRfztUO0zNRtYxUe8WkxWy1WighfLMakJ1Nb1Ur5F1fZMSkhzc=
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Yan Yankovskyi <yyankovskyi@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 5, 2020 at 6:02 PM J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wrot=
e:
> On 05.05.20 17:01, Arnd Bergmann wrote:
> > On Tue, May 5, 2020 at 4:34 PM J=C3=BCrgen Gro=C3=9F <jgross@suse.com> =
wrote:
> >> On 05.05.20 16:15, Arnd Bergmann wrote:
> >
> > I considered that as well, and don't really mind either way. I think it=
 does
> > get a bit ugly whatever we do. If you prefer the union, I can respin th=
e
> > patch that way.
>
> Hmm, thinking more about it I think the real clean solution would be to
> extend struct map_ring_valloc_hvm to cover the pv case, too, to add the
> map and unmap arrays (possibly as a union) to it and to allocate it
> dynamically instead of having it on the stack.
>
> Would you be fine doing this?

This is a little more complex than I'd want to do without doing any testing
(and no, I don't want to do the testing either) ;-)

It does sound like a better approach though.

      Arnd

