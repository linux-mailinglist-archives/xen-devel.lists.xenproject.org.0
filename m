Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 832211B6C62
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 06:05:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRpa2-000716-8i; Fri, 24 Apr 2020 04:04:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6uIs=6I=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jRpa1-000711-0M
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 04:04:45 +0000
X-Inumbo-ID: ba1d8604-85e0-11ea-b58d-bc764e2007e4
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba1d8604-85e0-11ea-b58d-bc764e2007e4;
 Fri, 24 Apr 2020 04:04:43 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id 198so6545212lfo.7
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2020 21:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5fFwBR4pUDYgSJUcqyFG/qQ4dl45iprBz6LqchmxwrU=;
 b=a/AocphZKtyrRmlFCC3sKesidSDDu39p4Sz1IuhBAJ4/nnXABK7PNFtAJ4XVixU9O0
 IefaB1cV1tJL39JsxmNiH7MFhUj+jgABC6m5xFyzN+sK1hJDFXb2MKhNC2SlIAbuJ1pP
 p1DdITNYDYkeufUWFLRl0HgihQ9GupJXTB5n8tMdj3/Pfj5qFOKmMFyu+8pAYCM//Qwe
 XEWvngiYBBtVMFmPH73oLBLZIoQEn4Xd+YM/msXMNx35CzDTt8QH2d78DczHarakAXU1
 Hr6rGMsQCn5I44ZUvy9701xChOQrVKHHPvluvRdikefGWZOGIbq9IHosJbaTOnfJVOZs
 fzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5fFwBR4pUDYgSJUcqyFG/qQ4dl45iprBz6LqchmxwrU=;
 b=FSVGTxX2j9bhwD0eQi/DOlaRwabV0vEKLw9P/g8VqOFOknRQ+KHra5SIhvP6qw53q7
 gfH19MfVduOjW9h28Gws4HgS2yCDiRJR3fEHQ+lrXJuXcsgydNAUz6oD8fqszocF73MD
 XIpoF5QIRwqdSBEjLuvKJB4XdVqZ1Z6Y219K6XABcoXuhFxPRyJyL3ro5yM4fwYlcG6f
 WP8MaMurVnTyKreywidd9aH+Bj7+BNGCnJ0noLy5cldr/0m4zsBk2ifrpAbdLxwuyYN+
 T5f112wbia6djng3U+h19/T76v+D+gwJVOuKfaXzjeDkH4Ra3xA/MtG3R+V5cjgknKmQ
 DtBQ==
X-Gm-Message-State: AGi0PuYXyk2v4PpFXTLJdhUF76DMOAyCHG7e+C1J7xvcm0DKOWPXakYq
 Bw45e/zehxbA/VkTNtncvbBdYjSBGzDZuSaCzPQ=
X-Google-Smtp-Source: APiQypKrhDkBJ0vi2ONFv0E6S1ZmKi4PFfIZF+QSzmNh1WRmT4Sw47WoLwCKWusPwoAkgIsvOEF4nKaoMUAxJRdEbgo=
X-Received: by 2002:a05:6512:14a:: with SMTP id
 m10mr4662613lfo.152.1587701082464; 
 Thu, 23 Apr 2020 21:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <FC32A2FB-F339-4F3A-8237-0A4334ADF3D2@citrix.com>
 <24225.31493.220592.722565@mariner.uk.xensource.com>
 <24225.31669.536258.56822@mariner.uk.xensource.com>
 <4085F05B-ABEC-446A-8BB1-06DEE57D71A5@citrix.com>
 <C10E07AB-FDE8-4588-95E7-6109F0FDB5E2@citrix.com>
In-Reply-To: <C10E07AB-FDE8-4588-95E7-6109F0FDB5E2@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Fri, 24 Apr 2020 00:04:31 -0400
Message-ID: <CAEBZRSfUysyGhnsXDEAJiVDBeX-Kb836V-uT6Qrtomte1LKgsA@mail.gmail.com>
Subject: Re: Golang Xen packages and the golang packaging system
To: George Dunlap <George.Dunlap@citrix.com>
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 23, 2020 at 1:22 PM George Dunlap <George.Dunlap@citrix.com> wr=
ote:
>
>
> > On Apr 23, 2020, at 12:49 PM, George Dunlap <george.dunlap@citrix.com> =
wrote:
> >
> >
> >
> >> On Apr 23, 2020, at 12:27 PM, Ian Jackson <ian.jackson@citrix.com> wro=
te:
> >>
> >> Ian Jackson writes ("Re: Golang Xen packages and the golang packaging =
 system"):
> >>> This is quite unpleasant.  In particular, it makes a git tree out of
> >>> output files.  What will we do when someone sends us patches to the
> >>> bindings ?
> >>
> >> Also, anyone who redistributes your proposed golang package is
> >> violating our licence unless they ship a copy of xen.git[1] too, since
> >> the golang package is not source code.
> >>
> >> [1] Technically, a copy of the relevant parts will do.
> >
> > The =E2=80=9Crelevant parts=E2=80=9D would primarily be gengotypes.py, =
right?  Oh, and I guess libxl_test.idl and friends.  libxl_test.idl isn=E2=
=80=99t included in the distribution either.
> >
> > I=E2=80=99m not an expert in the golang build system, but they generall=
y seem to be trying to keep the functionality simple (which of course, mean=
s if you want to do anything non-basic, it=E2=80=99s incredibly complicated=
 or completely impossible).
> >
> > There=E2=80=99s a command, `go generate`, which we could use to run gen=
gotypes.py to generate the appropriate files.  But I=E2=80=99m not sure how=
 to use that in a practical way for this sort of package: it might end up t=
hat people wanting to use the package would need to manually clone it, then=
 manually run `go generate` before manually building the package.
> >
> > Checking in the generated files means that someone can simply add `gola=
ng.xenproject.org/xenlight` as a dependency (perhaps with a specific versio=
n tag, like v4.14), and everything Just Works.
> >
> > Nick may have some ideas on how to use the golang build system more eff=
ectively.
>
> So, the following seems to work quite well actually:
>
> mkdir vendor
> ln -s vendor/golang.xenproject.org /usr/share/gocode/src/golang.xenprojec=
t.org
> echo =E2=80=9Cgolang.xenproject.org/xenlight=E2=80=9D >> vendor/modules.t=
xt
> go build -mod=3Dvendor
>
> Using the above method, (say) redctl.git would build exactly the same on =
Xen 4.14 as on Xen 4.15 (assuming redctl wasn=E2=80=99t using anything not =
available in 4.14).
>
> I=E2=80=99m inclined to say we should start with just telling people to d=
o that, and look at doing something else if we discover that=E2=80=99s not =
suitable for some reason.

If it's not viable to create another repo for the xenlight package, I
think we should should just initialize the go module, i.e. go.mod, at
xen.git/tools/golang. The downside is that tags cannot be independent
from the rest of xen.git, so users need to have `require <module
path>/xenlight@RELEASE-4.14.0` in their go.mod, but at least its `go
get`-able. And, this does not fetch the entire git tree.

This would also mean that we actually track the generated code (which
isn't really a big deal IMO, it's expected that people track their
generated gRPC code, for example).

I spent some time today trying to get `go get <vanity URL>/xenlight`
to work, after defining the go.mod (with <vanity URL>/xenlight as the
import path) in tools/golang. I *think* it's do-able with a meta-tag
like: `<meta name=3D"go-import" content=3D"<vanity URL>/xenlight mod
https://proxy.golang.org">`, but I was having a hard time getting the
package to show up on pkg.go.dev or proxy.golang.org. I'm not totally
familiar with the module proxies yet, but it seems like it could be a
way to detach ourselves from the "package is defined at the root of a
git repo" problem.

-NR

