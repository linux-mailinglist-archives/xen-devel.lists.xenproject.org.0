Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA4A1CF878
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 17:06:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYWU4-0005B3-So; Tue, 12 May 2020 15:06:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9uWS=62=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jYWU3-0005Ay-MD
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 15:06:15 +0000
X-Inumbo-ID: 1f4da0ec-9462-11ea-b07b-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f4da0ec-9462-11ea-b07b-bc764e2007e4;
 Tue, 12 May 2020 15:06:14 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id w10so3334491ljo.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2020 08:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F40EM8E52DER+n4TYSS96riz/1NrSyOfyA55JCJymHY=;
 b=r3hHsqNgOC8gC7wzF8+6K7mPNCPF/bltuC4+ioxglXDX2ovbEcAamXH5OWj9VHcqf4
 2Km/I+COpf7Y7zV7B8nHbV4cYzWeB5CGwy+DkKRho+5ZWoV34cjFVWdvNl6sPbJB9I1w
 7VLTbbwJl9yWcFJVRXfglLgO9CYoObA2OiWEQNmPwmFt20tAZSfAQqcQ+WUjkKU4LSoL
 Ef4sQIpNXYzRoHvJlIUu+cmnyvrGaeFwcrMF7FH2bXupDeQs/m3Fkg4Ua/QOM3TvopDL
 i3GVMtDAfa+JHdnP6STFDMgl9XHbc7XlbPDAbNUUVRV7Mn3d+2aSD2ufPYxgfuMsFMD3
 FAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F40EM8E52DER+n4TYSS96riz/1NrSyOfyA55JCJymHY=;
 b=FTn6BNGuL5oW2ISERUE6YgNT8TxrxqqAhMUMlA5YkxA1g06yztlDatFbXe23V6iJn9
 x4gFoQQLrII2w99/SYBdbo3t5OG7Iz/O8E3xtvfM46YKz6Gdt2QuBRFA7gKZ+gR0OaHz
 wlOz9GhFnm2vKNA6YtwChUGM0Ltxip6CcufzbWaPQk/mxRkl1xB97pEhahlPv+7Tk5Ad
 JrexakOXSb/PmOQrIe2GhAfzW1rIlvV/vHWbzNfP3hs0vYznkAceo7S72REWmeqwHReY
 hTFiYsHkwLJw/b3nDecru4AE90ly8eq4XB6cZJmOS4iHFysDr/6TQJX4SEQgMUsiMUJb
 XVrA==
X-Gm-Message-State: AOAM532q50Bmb+BhnGRQY0BDDlLXteXLmsG9Wy8/7m+qBeaNUJ0EMmlL
 dwVduaFf9qGN+gCRcxy4DZU/yM3OweV9MCPUjGw=
X-Google-Smtp-Source: ABdhPJyKYGH1JQvyO/Fis31DhghOlDD0/EhkBD+osrprtbtTvgqXQvrp9ewW87qhGek7YSERPTBEHpp3fSn05zqWkMQ=
X-Received: by 2002:a2e:8047:: with SMTP id p7mr13336451ljg.206.1589295973596; 
 Tue, 12 May 2020 08:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588282027.git.rosbrookn@ainfosec.com>
 <c38afab85d9fc005edade229896008a4ad5a1929.1588282027.git.rosbrookn@ainfosec.com>
 <3ED0B49D-123C-4925-B3A0-4FA0B44DF9F0@citrix.com>
In-Reply-To: <3ED0B49D-123C-4925-B3A0-4FA0B44DF9F0@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Tue, 12 May 2020 11:06:02 -0400
Message-ID: <CAEBZRSdWCJo9kBnNv6Jqt76E3fb8DDX6C4zndMtvrhngEzGHxg@mail.gmail.com>
Subject: Re: [PATCH 2/3] golang/xenlight: init xenlight go module
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 12, 2020 at 10:36 AM George Dunlap <George.Dunlap@citrix.com> w=
rote:
>
>
>
> > On Apr 30, 2020, at 10:39 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote=
:
> >
> > Initialize the xenlight Go module using the xenbits git-http URL,
> > xenbits.xen.org/git-http/xen.git/tools/golang/xenlight, and update the
> > XEN_GOCODE_URL variable in tools/Rules.mk accordingly.
> >
> > Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> > ---
> > tools/Rules.mk               | 2 +-
> > tools/golang/xenlight/go.mod | 1 +
> > 2 files changed, 2 insertions(+), 1 deletion(-)
> > create mode 100644 tools/golang/xenlight/go.mod
> >
> > diff --git a/tools/Rules.mk b/tools/Rules.mk
> > index 5b8cf748ad..ca33cc7b31 100644
> > --- a/tools/Rules.mk
> > +++ b/tools/Rules.mk
> > @@ -36,7 +36,7 @@ debug ?=3D y
> > debug_symbols ?=3D $(debug)
> >
> > XEN_GOPATH        =3D $(XEN_ROOT)/tools/golang
> > -XEN_GOCODE_URL    =3D golang.xenproject.org
> > +XEN_GOCODE_URL    =3D xenbits.xen.org/git-http/xen.git/tools/golang
>
> The primary effect of this will be to install the code in $PREFIX/share/g=
ocode/xenbits.xen.org/git-http/xen.git/tools/golang/xenlight when making de=
bballs or doing `make install`.
>
> I don=E2=80=99t immediately see the advantage of that, particularly if we=
=E2=80=99re still thinking about having a =E2=80=9Cprettier=E2=80=9D path a=
t some point in the future.  What was your thinking here?

With the module being defined as `xenbits.xen.org/...`, the `build`
Make target will fail as-is for a module-aware version of go (because
it cannot find a module named `golang.xenproject.org/xenlight`). So,
the reason for this change is to preserve the existing functionality
of that Make target. Changing XEN_GOCODE_URL seemed like the correct
change, but I'm open to suggestions.

>
> > ifeq ($(debug_symbols),y)
> > CFLAGS +=3D -g3
> > diff --git a/tools/golang/xenlight/go.mod b/tools/golang/xenlight/go.mo=
d
> > new file mode 100644
> > index 0000000000..232d102153
> > --- /dev/null
> > +++ b/tools/golang/xenlight/go.mod
> > @@ -0,0 +1 @@
> > +module xenbits.xen.org/git-http/xen.git/tools/golang/xenlight
>
> This should probably be s/xen/xenproject/;

AFAICT, that's the correct URL, e.g. [1] and [2]. Am I missing something?

Thanks,
-NR

[1] https://pkg.go.dev/mod/xenbits.xen.org/git-http/xen.git
[2] https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary

