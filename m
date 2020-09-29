Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E61227C902
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 14:06:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122.253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNEOk-0004pM-3n; Tue, 29 Sep 2020 12:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122.253; Tue, 29 Sep 2020 12:06:22 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNEOk-0004ox-0U; Tue, 29 Sep 2020 12:06:22 +0000
Received: by outflank-mailman (input) for mailman id 122;
 Tue, 29 Sep 2020 12:06:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eNEo=DG=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1kNEOi-0004or-K0
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 12:06:20 +0000
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba611f92-a70e-4207-850a-5c8add7db88a;
 Tue, 29 Sep 2020 12:06:19 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k18so4520096wmj.5
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 05:06:19 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=eNEo=DG=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
	id 1kNEOi-0004or-K0
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 12:06:20 +0000
X-Inumbo-ID: ba611f92-a70e-4207-850a-5c8add7db88a
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ba611f92-a70e-4207-850a-5c8add7db88a;
	Tue, 29 Sep 2020 12:06:19 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k18so4520096wmj.5
        for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 05:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Q/xBLY0NP4qyieW+pXCTj+nWJcy0wQ/2cvDbEAJ+qrE=;
        b=uD3DBl3ZikDz0Qx378YkmXq5sEZWXr6iGtfVD46h9cB/Ddk8XhijIf4xCVcppV9T4D
         RbdI9X5aqUJCEJap5zlym9k+pIW8sBjMos0t9CKSuR8cpPgUhnPAxefhCJ6S94QZrvcL
         rZG8EaafEUlisH5ihGnuLRMUoRPcKMNjU5+5aJ/NAEjjFM2Iwl4abSu/rKsr+TKOD4dj
         dutHxBr3u/frhWgITI+JEhEkX7LNKU7GOnGCoBVOiBJmv4TfpK8oiOzUEWXNLGw6g9Jc
         szzp1bicBLReaYSJdrp5DCRKx0Q8A9ge3ckcNLN2LLRCcYR+iTqA0jVMKtFk0sX0kGq7
         1ZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Q/xBLY0NP4qyieW+pXCTj+nWJcy0wQ/2cvDbEAJ+qrE=;
        b=YSjS0QI51sEWCovs6GS1HTXEQshkmok4bwG+GK3BATITzjM3RSLnorKrBQ0QYSf8m4
         bUfQx5W/fDm+JgI44kpoyekfakd2JxPiIpxfsKX0xoGIBsLO+iixCNRePRCQPZfgj07G
         JA5oPdnc/iup87eYguPHj8xenkV8UqMBz3K9PVEV/2TUtBUBrNUxUO6ifJVIQG8AhZ6a
         soKL+tXsCDbnYg9XOFip3wtwL+MNa66XMuLaWgsvtsvZCBd5b8d3qzN3VQoKXE19zNTN
         u2n1zu6Jr8wNQ0WNMUFOCzvtkslaT4fp+OIQ+/mXqFJPfaeffgkpE+SCxL7da7Z+4pQO
         VpDg==
X-Gm-Message-State: AOAM5327a4GJgu4ixdX/dKNlkuHgswlRdxrNcY7tmcPJPYRrxZlomf/L
	Pps9r2KHTwPc8t8T9+OA4KUh07Zvd2kZ3VFlHMs=
X-Google-Smtp-Source: ABdhPJyVfTJ2xCZnd9/1kHDPxW6Pb7syN05jUZe8BEWrVajNNFOArf6ed3xd2Ci+MJEEjb1D7Xok2CNOq7pLa0+ie+o=
X-Received: by 2002:a05:600c:230f:: with SMTP id 15mr4213519wmo.186.1601381178822;
 Tue, 29 Sep 2020 05:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200924131030.1876-1-paul@xen.org> <CY4PR11MB0056034DE1EE8445CE816494FB390@CY4PR11MB0056.namprd11.prod.outlook.com>
 <001301d6933a$4409fda0$cc1df8e0$@xen.org> <CY4PR11MB005625159210BF9EBF024135FB350@CY4PR11MB0056.namprd11.prod.outlook.com>
 <95e044b74cd545d984ec92e1d385d336@EX13D32EUC003.ant.amazon.com>
In-Reply-To: <95e044b74cd545d984ec92e1d385d336@EX13D32EUC003.ant.amazon.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 29 Sep 2020 08:05:42 -0400
Message-ID: <CABfawhm1prNdjAatv=kVvR=n=DqvJ=x85U_8bBdoW_CoL5w2CA@mail.gmail.com>
Subject: Re: [PATCH v9 0/8] domain context infrastructure
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Cc: "Lengyel, Tamas" <tamas.lengyel@intel.com>, "paul@xen.org" <paul@xen.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2020 at 7:54 AM Durrant, Paul <pdurrant@amazon.co.uk> wrote=
:
>
> > -----Original Message-----
> > From: Lengyel, Tamas <tamas.lengyel@intel.com>
> > Sent: 28 September 2020 15:17
> > To: paul@xen.org; xen-devel@lists.xenproject.org
> > Cc: Durrant, Paul <pdurrant@amazon.co.uk>; 'Andrew Cooper' <andrew.coop=
er3@citrix.com>; 'Daniel De
> > Graaf' <dgdegra@tycho.nsa.gov>; 'George Dunlap' <george.dunlap@citrix.c=
om>; 'Ian Jackson'
> > <ian.jackson@eu.citrix.com>; 'Jan Beulich' <jbeulich@suse.com>; 'Julien=
 Grall' <julien@xen.org>;
> > 'Marek Marczykowski-G=C3=B3recki' <marmarek@invisiblethingslab.com>; 'R=
oger Pau Monn=C3=A9'
> > <roger.pau@citrix.com>; 'Stefano Stabellini' <sstabellini@kernel.org>; =
'Volodymyr Babchuk'
> > <Volodymyr_Babchuk@epam.com>; 'Wei Liu' <wl@xen.org>
> > Subject: RE: [EXTERNAL] [PATCH v9 0/8] domain context infrastructure
> >
> > CAUTION: This email originated from outside of the organization. Do not=
 click links or open
> > attachments unless you can confirm the sender and know the content is s=
afe.
> >
> >
> >
> > > > Hi Paul,
> > > > Could you push a git branch somewhere for this series? I would like=
 to
> > > > see this being integrated with VM forking and if its not too much
> > > > effort just create the patch for that so that it could be appended =
to the
> > > series.
> > > >
> > >
> > > Hi Tamas,
> > >
> > >   Done. See
> > > https://xenbits.xen.org/gitweb/?p=3Dpeople/pauldu/xen.git;a=3Dshortlo=
g;h=3Drefs/h
> > > eads/domain-save14
> > >
> > >   Cheers,
> > >
> > >     Paul
> >
> > Hi Paul,
> > I added a small patch that would save & load the PV context from one do=
main to another that would be
> > called during VM forking. Please take a look at
> > https://xenbits.xen.org/gitweb/?p=3Dpeople/tklengyel/xen.git;a=3Dcommit=
diff;h=3D1843ca7302e415317fdb9a63b3a4
> > d29a385dc766;hp=3D8149296fdf80c73727e61cea6fe3251aecf8b333. I called th=
e function copy_pv_domaincontext
> > for now as that seemed like the most appropriate description for it. Pl=
ease let me know if this looks
> > good to you. I'm still testing it but if everything checks out it would=
 be nice to just append this
> > patch to your series.
>
> Hi Tamas,
>
>   The code structure appears to be ok... just some cosmetic tweaks:
>
> - I think you should call the function simply 'copy_domaincontext' as the=
 idea is that all state (including what is now in hvm context) will be cons=
olidated

Sure, I wasn't entirely clear about whether this will be limited to PV
context or if it will eventually add the hvm stuff too. Right now I
still would have to do that separately.

> - The prevailing style in domctl.c AFAICS is that assignments are mostly =
not done inside if statements. Personally I think this is a good thing.

I think it cuts down on function sizes when all that is being done
after an assigment is a NULL-check. No need for a separate line for it
but I also don't care that much. So if it's more important to whoever
maintains this to keep the style consistent in this regard I can
change it.

>
>   Once you have something ready to go then I'd be happy to tag it onto my=
 series if I need to do a v10... but I'm currently hoping that won't be nec=
essary.

I think I'll wait until HVM context is included in the framework as
well so that we can just switch over everything at once.

Tamas

