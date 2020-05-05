Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ADC1C5A59
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 17:01:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVz4j-0007v3-Uq; Tue, 05 May 2020 15:01:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MjzU=6T=arndb.de=arnd@srs-us1.protection.inumbo.net>)
 id 1jVz4j-0007uy-1g
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 15:01:37 +0000
X-Inumbo-ID: 4f9d86e5-8ee1-11ea-9dc6-12813bfff9fa
Received: from mout.kundenserver.de (unknown [212.227.126.134])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f9d86e5-8ee1-11ea-9dc6-12813bfff9fa;
 Tue, 05 May 2020 15:01:36 +0000 (UTC)
Received: from mail-qk1-f174.google.com ([209.85.222.174]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N0Ip5-1jBP5c18a7-00xLdy for <xen-devel@lists.xenproject.org>; Tue, 05 May
 2020 17:01:35 +0200
Received: by mail-qk1-f174.google.com with SMTP id c10so2574414qka.4
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2020 08:01:34 -0700 (PDT)
X-Gm-Message-State: AGi0PuZlLKX3+47mdNkiSAKNhkHFhBzn7pT1c0KPY9Ju5ofMB+7NClnY
 4DnhnhhvIy2D3973ZxC23s1sRQHH89kXQOHSyek=
X-Google-Smtp-Source: APiQypKEmmDkWyjdjHqC8UEv4XIcDMi+fpqsIc8gLYnt2vwvk7Vu3FpHhRwPKldfTYlGKweDKG4ilgk/kiL3dUraQdk=
X-Received: by 2002:a37:aa82:: with SMTP id t124mr3769549qke.3.1588690894009; 
 Tue, 05 May 2020 08:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200505141546.824573-1-arnd@arndb.de>
 <30d49e6d-570b-f6fd-3a6f-628abcc8b127@suse.com>
In-Reply-To: <30d49e6d-570b-f6fd-3a6f-628abcc8b127@suse.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 5 May 2020 17:01:18 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0mWH=Zcq180+cTRMpqOkGt05xDP1+kCTP6yc9grAg2VQ@mail.gmail.com>
Message-ID: <CAK8P3a0mWH=Zcq180+cTRMpqOkGt05xDP1+kCTP6yc9grAg2VQ@mail.gmail.com>
Subject: Re: [PATCH] xenbus: avoid stack overflow warning
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XAi3NAIG9q+S2wymV1p9JIzTW3zSz38g/JiAiisYkR6zwCP6Dna
 MHXv3KEcH2jfJns33Ph0LwCW3t18yc2Sq0kfyuYssjp2YzA8KFlqxwZ7pKC0ElUtdV8+Fe7
 iMVSBuXeJhRYF7rpBhCu/3io+8u3J/eZkVvljJDetdEyE14V60PtNTtoF04CXwYSejLuT/3
 qVR2yIso+CerZ2ruX0F2A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uEQeqHjKmH4=:BiP2CXFuxso7Gi1ciPJnG6
 sAjgeQnIDKr3oNyWo7Z6DzbOexPT2Hpk5PYE3cZ8SZzJ9PV719IzvJMSF/QaIWPChS/MlDDv1
 bedNneesIFiWfVGsy+6Hu+HNK4u37GZeskPsres6S8fczSg+q6Lah8FxKsNBbYYgkP6r2cmzJ
 A0/isdIGI+gOwKPIk5727Cl9oRR4dwo0ClFnZS7b7INe2JZcmOY+4uALZPYiSTXrZssiw+AJj
 h9Fe+sdL51ThHzhsPdTMH5c7JKcEBUNya1b+N50fJoFxY++etPP+WCS7T8Hman6oGBRDSwLae
 O+aQNZq3fq56JJzTQQ8QeMf819lDGfvx6Hf99nM3pxzsEU3cQVUD6yKicTX8vuHUEkEXPYd9X
 uiaPnZO39UVI/nUtdY85TX/7BrRmuW3+sT30qMDpU/IN+Sl0CWt1LuOpmnuBI/pwGkSTQdktv
 7afX798AtBhAQc6/Phrths6uMG2j+otmym98kcw9I9pm0SzE94Iw6u7h9DgaXXYiVAjWzMUBE
 3ht1VLgnVYA4kpXmruCaqCThRR9vJZ9bl5JaZqY0lrfeDpIRRIzZavzMJy5iALkAtmttzEdX/
 E5GN8Ovg0AnadvS6sR6hg9woklq1/mTCSH7ssorjhkHdiMZ6fvGzinDB+/y8hPmwujEFNY4Jj
 hEL03hweNS9w8zG16B8aOBPsBDqH5ISJoUEMBFsWPfnxVLDi/8BgetK40kaf9H4zGKDwN4605
 LOhEEbNStFFN/830ZP9j1TJcv3lie/wqTMYWv44ixHuZfnHf/GU7WlZv6O6jxRRAFZbQIFYlG
 wboHmiatJ4MWr2Chto1uHS1YHpLsWAnURE6b9jdB7DupSTzugU=
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

On Tue, May 5, 2020 at 4:34 PM J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wrot=
e:
> On 05.05.20 16:15, Arnd Bergmann wrote:
> > The __xenbus_map_ring() function has two large arrays, 'map' and
> > 'unmap' on its stack. When clang decides to inline it into its caller,
> > xenbus_map_ring_valloc_hvm(), the total stack usage exceeds the warning
> > limit for stack size on 32-bit architectures.
> >
> > drivers/xen/xenbus/xenbus_client.c:592:12: error: stack frame size of 1=
104 bytes in function 'xenbus_map_ring_valloc_hvm' [-Werror,-Wframe-larger-=
than=3D]
> >
> > As far as I can tell, other compilers don't inline it here, so we get
> > no warning, but the stack usage is actually the same. It is possible
> > for both arrays to use the same location on the stack, but the compiler
> > cannot prove that this is safe because they get passed to external
> > functions that may end up using them until they go out of scope.
> >
> > Move the two arrays into separate basic blocks to limit the scope
> > and force them to occupy less stack in total, regardless of the
> > inlining decision.
>
> Why don't you put both arrays into a union?

I considered that as well, and don't really mind either way. I think it doe=
s
get a bit ugly whatever we do. If you prefer the union, I can respin the
patch that way.

      Arnd

