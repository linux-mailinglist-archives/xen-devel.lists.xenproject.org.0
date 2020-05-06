Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC221C6E64
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 12:29:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWHId-0004Qt-1Y; Wed, 06 May 2020 10:29:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/PJ=6U=arndb.de=arnd@srs-us1.protection.inumbo.net>)
 id 1jWHIb-0004Qo-LO
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 10:29:09 +0000
X-Inumbo-ID: 6ad4651a-8f84-11ea-9887-bc764e2007e4
Received: from mout.kundenserver.de (unknown [212.227.17.13])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ad4651a-8f84-11ea-9887-bc764e2007e4;
 Wed, 06 May 2020 10:29:08 +0000 (UTC)
Received: from mail-qk1-f170.google.com ([209.85.222.170]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mn2iP-1ip0aK0jCB-00k4J1 for <xen-devel@lists.xenproject.org>; Wed, 06 May
 2020 12:29:07 +0200
Received: by mail-qk1-f170.google.com with SMTP id b6so1297684qkh.11
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2020 03:29:06 -0700 (PDT)
X-Gm-Message-State: AGi0PuZkYMq+fogU5Y/X54TUJuatwgT1PGwe6+/WRRIdIqE7HFRBa68H
 QhfU/n6gZcghIH1gXTgJ01kXRqYhQHkX3Q9UAsk=
X-Google-Smtp-Source: APiQypLplZDjvgilEtNOvewSJ4/Rigx9zKpijezGZjbjJHJFpHNinyeAHrYJil4GkKYLbPsidhx2J3DNgSsgw1MT/WA=
X-Received: by 2002:a37:aa82:: with SMTP id t124mr7608771qke.3.1588760945935; 
 Wed, 06 May 2020 03:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200505141546.824573-1-arnd@arndb.de>
 <30d49e6d-570b-f6fd-3a6f-628abcc8b127@suse.com>
 <CAK8P3a0mWH=Zcq180+cTRMpqOkGt05xDP1+kCTP6yc9grAg2VQ@mail.gmail.com>
 <48893239-dde9-4e94-040d-859f4348816d@suse.com>
 <CAK8P3a2_7+_a_cwDK1cwfrJX4azQJhd_Y0xB18cCUn6=p7fVsg@mail.gmail.com>
 <2c6e4b36-6618-1889-55c4-16eeb1ef6f57@suse.com>
In-Reply-To: <2c6e4b36-6618-1889-55c4-16eeb1ef6f57@suse.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 6 May 2020 12:28:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a05wLCy0GT88mc451h3uXuU86aZ7XC=YXYXi12J0dFJkw@mail.gmail.com>
Message-ID: <CAK8P3a05wLCy0GT88mc451h3uXuU86aZ7XC=YXYXi12J0dFJkw@mail.gmail.com>
Subject: Re: [PATCH] xenbus: avoid stack overflow warning
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:no1xygskoIyr6XbP9tD+FwsVm3E8iYChYzqkU68yj5KmNi+94Kh
 rDcAY43aGW9TvjUt0ToyFy1pdtD+dEXA/kFLaFDyQvgXHxJW+X67v3/UWMvbrS+pTG3LXuV
 GhM0mvGwZGIyTKAvC4XfsK4Rt6U4Jo2DA2WgD4Kt8tu1omkpECs/zOeJfs0CeFIzRoouj1k
 5IlKeoINCQZiv4jCeixWw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oGesJvs0B7Y=:rUfkz73Y/00BVlFWH9iBAl
 qfXet7RQSK2KJsWO+X/Vh8Nnd9X48siQf9a1QeSxgfNbAVjlp6O+okklTmm9i8SAKa65pxkCt
 xMAsFZBRcsKcNhyq7OcZ08mU7cPgB5p3e/dn+lqAn6ImyZ/CIw5lNLtqW+9k2ytywUzFReoeK
 nXN9jLblTn1VaIg3wRT0WcLt49PDrhiQUSvyudAcQmlc9/tpJvcadqdqbCnd45nv4nPiCLsp6
 qZtQ8Uy2pdVoLDpz/9j7+mn/maU8C1bAMyd500es+k9voAOtqn5detjZ+1NjRI0hrBxFZYyi8
 JJwJXoG4aiDlRVGH/152JGnuYIiixScw8cWH21U0vXZQF1AVTTsSbzLD56gp1KBLtleDZc6h2
 +WyrDuqBwuSMVzy9IGjUMQ+fwpoPlA2rBaMhx+EgFwF1lrKdPtEGM7D05JztDsishMQSk3vWv
 91MBEHND373SRpf1OpOE3YsHfpJvt7LvBjrhHrUMpmL3szZCADM4Sk/qGTHV7VqrFZr/p0DHT
 dxvRZp9iG4VlVyXjq8dtT30Y3QDrVMZGZbSlHOiQEqHanYxEnMC7xxgegCKhQ3tWnGP71D8sM
 y3aXf5j/vLSfC+GNyujPfg3pQ42ybGfxfz8NV5VP5Yh/bk143xqcE3J2bCRKEf3+uSq2R+Q8j
 M72lID4WSeLxXyV4/bt7FeuaJwzdpIQTSdI2gAPnbPZl3aAhNQEVO/i8aGDLx67skc2E1XEL4
 R3QafzT/gANnGqPW2DfIrSEFTLlLd1VP9alX7dhEN25MKO6zJucnGGpjK70hEr3uzatdp6YS0
 rtYC/qh5rgBbaM4qzVl9N8jQlJ5NZS9nShZxeCMhrFvjAwHiyY=
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

On Wed, May 6, 2020 at 7:12 AM J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wrot=
e:
>
> On 05.05.20 22:57, Arnd Bergmann wrote:
> > On Tue, May 5, 2020 at 6:02 PM J=C3=BCrgen Gro=C3=9F <jgross@suse.com> =
wrote:
> >> On 05.05.20 17:01, Arnd Bergmann wrote:
> >>> On Tue, May 5, 2020 at 4:34 PM J=C3=BCrgen Gro=C3=9F <jgross@suse.com=
> wrote:
> >>>> On 05.05.20 16:15, Arnd Bergmann wrote:
> >>>
> >>> I considered that as well, and don't really mind either way. I think =
it does
> >>> get a bit ugly whatever we do. If you prefer the union, I can respin =
the
> >>> patch that way.
> >>
> >> Hmm, thinking more about it I think the real clean solution would be t=
o
> >> extend struct map_ring_valloc_hvm to cover the pv case, too, to add th=
e
> >> map and unmap arrays (possibly as a union) to it and to allocate it
> >> dynamically instead of having it on the stack.
> >>
> >> Would you be fine doing this?
> >
> > This is a little more complex than I'd want to do without doing any tes=
ting
> > (and no, I don't want to do the testing either) ;-)
> >
> > It does sound like a better approach though.
>
> I take this as you are fine with me writing the patch and adding you as
> "Reported-by:"?

Yes, definitely. Thanks!

     Arnd

