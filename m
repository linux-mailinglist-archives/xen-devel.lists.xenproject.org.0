Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B541F78D3
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 15:39:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjjtC-0002N3-FM; Fri, 12 Jun 2020 13:38:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tzU/=7Z=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jjjtA-0002My-G9
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 13:38:32 +0000
X-Inumbo-ID: 011ad50a-acb2-11ea-bb8b-bc764e2007e4
Received: from mail-lf1-x133.google.com (unknown [2a00:1450:4864:20::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 011ad50a-acb2-11ea-bb8b-bc764e2007e4;
 Fri, 12 Jun 2020 13:38:31 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id z206so5501479lfc.6
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2020 06:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=r2efMH73jQtkX8/ee00G2Vfh+yT5y4lHRLBewPYzKcA=;
 b=FzbknQUscr1Fie0172QOMeFZofGDSzabpi1X2vGSCJQACjc3KSrlySrBMJYjmdyIYS
 5af/uNBRPt/KX8NSHMqaHBIfvoks6wECrSs7FGzNDXSCpwc43OMzcXWS8609rFaUXprP
 KY5bLaPq6hc5oinj3RB2vZx70zH1EaMsvq39B8NJ9vyrIUwWPUfNtBhZBx9L7mhyRuv7
 fMvHNjDjGI4bILvvFHJ8N3OCRi03kf41mBYT1nXPSgqq7J6g5O2t/zfc2DosW/NTH+rt
 /6qipFQUEYVamTxNc327Dq8v0CHtx9JrIV9cpTsPXKp/RGJi1qId0jWSUDJgHFkYYDkG
 /qSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=r2efMH73jQtkX8/ee00G2Vfh+yT5y4lHRLBewPYzKcA=;
 b=KJIRdnLS8UKHx3zypdv7DnJ1yQuapEXGdAgnPQ4qjARGJKz3oSuBbXtNti5H7UTqxl
 cGef9i9J454GT/Qc28t4dLk5n3h8W7PykVnUjKXUzLyrfTV7NH9yDr4zyMifk81/2Lzq
 qYhvxRvMJVrZIqNQBaQlZuSE42pBgzsNeQKT6GBbLNhPFWmhJDo8mjqR4lGftoWIINpy
 BDXW7iHklhUfnnz5yZRc9mN6iHDAt6VFn9gsb9JEMDFk2oNPd6bi9gWRWJpnPXW7Wd5F
 0899kn6FN7Zm4BjZBK7gS5M769dDreHvJ5YnFDII0vmGeSKpQaBmjjGxsl2Lh/bjXfYA
 gnlA==
X-Gm-Message-State: AOAM5322SVGRJ1TQ6ps2s+ypvgHBRrVMGNGfuEPLPAvi9k5WjW1CrTq+
 AILhMu0CYKPnJqrGCfvqIpOiZDMSni2jduLWbgXugjeH
X-Google-Smtp-Source: ABdhPJw3OreDDptJODf2oFgkx9Q0yHNSKaNPoKU72I0QThneXvrmNOGTh3k5tQCVqFqSxHU7G0LH116RMaZCMbfHWSk=
X-Received: by 2002:a05:6512:62:: with SMTP id
 i2mr6846563lfo.152.1591969110569; 
 Fri, 12 Jun 2020 06:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <ab679f8c-a09f-cbc6-c0fc-6285550ba3af@citrix.com>
 <A8F5EC16-53D8-40F4-863F-0862298193EA@citrix.com>
 <1b412370-3a8f-59af-f7cf-042ae45ea802@citrix.com>
In-Reply-To: <1b412370-3a8f-59af-f7cf-042ae45ea802@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Fri, 12 Jun 2020 09:38:18 -0400
Message-ID: <CAEBZRSe4ve862s7ZRarUG+OvuTw2+R9JCNPTYLn-uNrLx6kB3Q@mail.gmail.com>
Subject: Re: golang bindings dirty in tree after libxl build
To: Andrew Cooper <andrew.cooper3@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 12, 2020 at 8:15 AM Andrew Cooper <andrew.cooper3@citrix.com> w=
rote:
>
> On 12/06/2020 12:59, George Dunlap wrote:
> >
> >> On Jun 12, 2020, at 12:00 PM, Andrew Cooper <Andrew.Cooper3@citrix.com=
> wrote:
> >>
> >> Hello,
> >>
> >> I've just done a libxl build and got things such as:
> >>
> >> --- a/tools/golang/xenlight/helpers.gen.go
> >> +++ b/tools/golang/xenlight/helpers.gen.go
> >> @@ -431,14 +431,14 @@ x.Evtch =3D int(xc.evtch)
> >>  x.Rref =3D int(xc.rref)
> >>  x.Connection =3D ChannelConnection(xc.connection)
> >>  switch x.Connection{
> >> -case ChannelConnectionUnknown:
> >> -x.ConnectionUnion =3D nil
> >>  case ChannelConnectionPty:
> >>  var connectionPty ChannelinfoConnectionUnionPty
> >>  if err :=3D connectionPty.fromC(xc);err !=3D nil {
> >>   return fmt.Errorf("converting field connectionPty: %v", err)
> >>  }
> >>  x.ConnectionUnion =3D connectionPty
> >> +case ChannelConnectionUnknown:
> >> +x.ConnectionUnion =3D nil
> >>  case ChannelConnectionSocket:
> >>  x.ConnectionUnion =3D nil
> >>  default:
> >>
> >> dirty in tree.  They are all case labels, and only their order in the
> >> switch has changed.
> >>
> >> Does the current binding generation rely on the order of entries in a
> >> python dictionary by any chance?
> > Not explicitly, but obviously somewhat implicitly.
> >
> > Is this a python2/3 issue, or would different versions of python within=
 2/3 end up with different sort orders?
> >
> > If python3 will always put them in the same order, then we might consid=
er just switching the script to being explicitly python3.  Otherwise, we=E2=
=80=99ll probably have to add sorts.
>
> Python 3.6 now guarantees that the insert order of elements will be
> preserved.  Before that, there are no guarantees at all.
>
> It sounds like some sprinkling of sorted() will be needed.

George,

Unless you have a burning desire, I can take care of this patch today
or tomorrow.

-NR

