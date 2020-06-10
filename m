Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAB61F5DDC
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 23:48:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jj8ZT-0002Py-JY; Wed, 10 Jun 2020 21:47:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onEK=7X=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jj8ZS-0002Ps-SL
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 21:47:42 +0000
X-Inumbo-ID: 02b03896-ab64-11ea-b7bb-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02b03896-ab64-11ea-b7bb-bc764e2007e4;
 Wed, 10 Jun 2020 21:47:42 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p5so3975876wrw.9
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2020 14:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CAp2rjehIvYjAHsjdSiddbXOkmRYOn32bN6XG12cOEs=;
 b=CXz9RFxjHFeAwkwkxSyWrq2kjUQAOxDaf+duRQvCuKmwljg9aKSqkeWeoiskENBSv7
 uK9Bg2cGI0n6MjwRLkR/MtLhMhBc97ANN8Wz9QA5pZfdJVbB946r3YD929n4ffTi3qKq
 noAXnE+g5/GuDHSyPw47yZgBiCjW818WcCnxaOwecpA4eZKGwL4ZYUzI/ktYGTPiLs1u
 5xPtUa6Eq4aUmHnWylWzHHWWXIDaeUcAa5lqLnPCMhRK9563rRcL6I1oy6wDzforcXKC
 MpCOhlrUWUA82dukpjzlOIUyBysBEFd1mzQXyTKs+TM4VCbWqaCfRuuGEYiQezyB4qK0
 Yh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CAp2rjehIvYjAHsjdSiddbXOkmRYOn32bN6XG12cOEs=;
 b=RDoi3QvOQF7PsfUQqiG8AioyPCJdfnGyL9cYsOKG4v/auX5lo1iUBaEm/B3mdLRvAT
 bi7Ee0ON3ORW2s99IxUoc4NhY9bDTUa64pHtVCgD6zURLJ/9TS2s1NmQHAT6hPZ243rV
 PhPOIsvsFeu3kUVFeLu9jn+m8gxFapaLUD1hzM1UzuufIdfunZydnn+oaBusNYCXRgA0
 pGsRfRBCBDTTcpGAuT4OI1nm0fDg5jua0DPStoFNUgHSycIzSMGVq31swwj/CteCEs5u
 EHP+FEBk+nJ/2NAhpdod6DKJCyz/6uLWH+1ZphbGmd8jKiZLQL3VX2GvAI4ALo+ZajD9
 azEA==
X-Gm-Message-State: AOAM531ktob3gxYl87YRsOlYiEIJ+AWcr4a2YH/Rh+Xeh2sU8xIjMH/n
 NO9yRXx6zJKcGXqqltEMuvKF9qydYCrvC3nYyLs=
X-Google-Smtp-Source: ABdhPJwOSYlSMcq2o/Cr7knWtshZaThoL7Hap9VXOIR/ZPH2fgi6Uj4Ht3F+xs6gTR30J2Z+rWBZ1GZ1ZdkH+LbXuuI=
X-Received: by 2002:a5d:4ec3:: with SMTP id s3mr6258092wrv.103.1591825661480; 
 Wed, 10 Jun 2020 14:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200609154546.4531-1-jgross@suse.com>
 <4a3c4e5e-1fbd-5017-1e3e-64052ae2410a@xen.org>
 <fa5aaa8c-f695-cd87-a837-7d41e4f64a82@suse.com>
In-Reply-To: <fa5aaa8c-f695-cd87-a837-7d41e4f64a82@suse.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Wed, 10 Jun 2020 22:47:30 +0100
Message-ID: <CAJ=z9a1QHY_4Ktg8jTfWeBwfrX6nsjoHhz4VT_ap-hiMvftoFg@mail.gmail.com>
Subject: Re: [PATCH for-4.14] xen/hypfs: fix loglvl parameter setting
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 10 Jun 2020 at 19:49, J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wrote=
:
>
> On 10.06.20 19:55, Julien Grall wrote:
> > Hi Juergen,
> >
> > On 09/06/2020 16:45, Juergen Gross wrote:
> >> Writing the runtime parameters loglvl or guest_loglvl omits setting th=
e
> >> new length of the resulting parameter value.
> >>
> >> Reported-by: George Dunlap <george.dunlap@citrix.com>
> >> Signed-off-by: Juergen Gross <jgross@suse.com>
> >
> > Reviewed-by: Julien Grall <jgrall@amazon.com>
> >
> > Although one unrelated comment below.
> >
> >> ---
> >>   xen/drivers/char/console.c | 19 +++++++++++++++----
> >>   1 file changed, 15 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> >> index 56e24821b2..861ad53a8f 100644
> >> --- a/xen/drivers/char/console.c
> >> +++ b/xen/drivers/char/console.c
> >> @@ -241,14 +241,25 @@ static int _parse_loglvl(const char *s, int
> >> *lower, int *upper, char *val)
> >>   static int parse_loglvl(const char *s)
> >>   {
> >> -    return _parse_loglvl(s, &xenlog_lower_thresh, &xenlog_upper_thres=
h,
> >> -                         xenlog_val);
> >> +    int ret;
> >> +
> >> +    ret =3D _parse_loglvl(s, &xenlog_lower_thresh, &xenlog_upper_thre=
sh,
> >> +                        xenlog_val);
> >> +    custom_runtime_set_var(param_2_parfs(parse_loglvl), xenlog_val);
> >
> > Mixing function and variable name is pretty confusing. It took me
> > sometimes to go through the macro maze to figure out what's happening.
> >
> > It might be worth thinking to document more the custom_runtime_* interf=
ace.
>
> I have already some streamlining ideas for 4.15.

Cool! I will commit it tomorrow morning.

Cheers,

