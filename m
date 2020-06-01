Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0648D1EAC91
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 20:39:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfpKJ-0004rH-Jz; Mon, 01 Jun 2020 18:38:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dysJ=7O=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jfpKH-0004rB-Vn
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 18:38:22 +0000
X-Inumbo-ID: 1133df64-a437-11ea-81bc-bc764e2007e4
Received: from mail-ej1-x644.google.com (unknown [2a00:1450:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1133df64-a437-11ea-81bc-bc764e2007e4;
 Mon, 01 Jun 2020 18:38:21 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id n24so10191354ejd.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 11:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ov6fhPMmTH34xS76zlZ27NhyD4IBg5jtrp6M3BzaGrU=;
 b=JLdyvDW5kgg6gDJewwUSQmhaVi8jS75aUFKXMb1T2B6Nr4ZbhaCjmcJLaAkXhF6b8K
 35ceAfJGnuDJDbPKTR2+3iSEGqSE61uCRbybxeXR8w0e+q/rT9E3sOZxyXvclHNE/ty2
 K+MjuAsRbDD+AZaLNGMXVparwICKyvy0fZ5uvhBqVEWlsKKZ/So3Emo96sde3snPAy55
 aiSdOjS9trKCPbFiuguZlxteJdtoTVpskLQIjumHDhOqpPRbqmjkj5IakM8ADKBRJG87
 h7TLOxsxrLFpoF3JY53Qq8YmDo1/vQ9ZcEUTTMJEE85xeUR8miSJesyUFLmX4uTTkkDg
 h1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ov6fhPMmTH34xS76zlZ27NhyD4IBg5jtrp6M3BzaGrU=;
 b=GBIjFPflhMU0PXyGG/Tf7KoFZDeWVj5zJxt6yhDFteZAhNVLQCspwCWu9UiqBDTf+2
 8PyDEqGw/tsiZwQb4nU3dlnRyPhGIH7h1yPdZ+dGiY4Dc46dP4RCNpYre/ejJ8RlCbA3
 rDxaq1Lck0pJqp3nClUXjiL2R1izC0czXcm6t/4zIO+Rl9jz3wRyHz3Gm6O7WPufLCZV
 TxTBDhnza59H3t5TAF3BzXu6gw0oArsLyw2bFTcl9kdZqbuiOhT+tIq6LsC6WZLf4JNm
 UYt7ohZRiJobTc5UC9Ia7mzJUrCn9D4VHxTsYSADAwJSuTIbbTWMBnkf35DZaU3LiZgW
 KnGg==
X-Gm-Message-State: AOAM532TxCuJQJxaUhP9Qh+Gb0Xpp+mPVgXoAiVh/xIn5MLEidD+FTzC
 WOFi/LY4sT4aRclv9HonUrTQ+BY6GGU=
X-Google-Smtp-Source: ABdhPJy8pYOY6hYDlYOTEFeCLIfgKCrOAB6NhtEnRkQByc/D4C+bquZcvba9INRsLFRRDwVW4Ywlyg==
X-Received: by 2002:a17:906:f6d6:: with SMTP id
 jo22mr19773216ejb.310.1591036699942; 
 Mon, 01 Jun 2020 11:38:19 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48])
 by smtp.gmail.com with ESMTPSA id b21sm115905edt.15.2020.06.01.11.38.18
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 11:38:19 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id g10so474032wmh.4
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 11:38:18 -0700 (PDT)
X-Received: by 2002:a1c:23d2:: with SMTP id j201mr567836wmj.186.1591036698346; 
 Mon, 01 Jun 2020 11:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1591017086.git.tamas.lengyel@intel.com>
 <000c01d63826$6d125900$47370b00$@xen.org>
 <4017F2B3-BB9B-4E9F-813C-6FE68BA0D568@citrix.com>
In-Reply-To: <4017F2B3-BB9B-4E9F-813C-6FE68BA0D568@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 1 Jun 2020 12:37:42 -0600
X-Gmail-Original-Message-ID: <CABfawh=YHA9Lxbto5Qgf_wkSFAR+JxCdWB99iAhCmBgwSwvmVg@mail.gmail.com>
Message-ID: <CABfawh=YHA9Lxbto5Qgf_wkSFAR+JxCdWB99iAhCmBgwSwvmVg@mail.gmail.com>
Subject: Re: [PATCH v19 for-4.14 00/13] VM forking
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
Cc: Julien Grall <julien@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, "paul@xen.org" <paul@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 1, 2020 at 11:11 AM George Dunlap <George.Dunlap@citrix.com> wr=
ote:
>
>
>
> > On Jun 1, 2020, at 4:07 PM, Paul Durrant <xadimgnik@gmail.com> wrote:
> >
> >> -----Original Message-----
> >> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Tamas K Lengyel
> >> Sent: 01 June 2020 14:22
> >> To: xen-devel@lists.xenproject.org
> >> Cc: Kevin Tian <kevin.tian@intel.com>; Stefano Stabellini <sstabellini=
@kernel.org>; Tamas K Lengyel
> >> <tamas.lengyel@intel.com>; Jun Nakajima <jun.nakajima@intel.com>; Wei =
Liu <wl@xen.org>; Andrew Cooper
> >> <andrew.cooper3@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; =
George Dunlap
> >> <george.dunlap@citrix.com>; Tamas K Lengyel <tamas@tklengyel.com>; Jan=
 Beulich <jbeulich@suse.com>;
> >> Anthony PERARD <anthony.perard@citrix.com>; Julien Grall <julien@xen.o=
rg>; Roger Pau Monn=C3=A9
> >> <roger.pau@citrix.com>
> >> Subject: [PATCH v19 for-4.14 00/13] VM forking
> >
> > Hi,
> >
> >  This series looks to be largely un-acked so, since we are now past the=
 freeze date, I don't really think it can go into 4.14. Is there a particul=
ar reason that you think it should be considered?
>
> Tamas=E2=80=99 project itself mainly uses libxc and below, as I understan=
d; and so getting patches 1 and 2 in would be an important milestone; both =
have had R-b=E2=80=99s before the feature freeze.  Arguably patches 1 and 2=
 are a bug fix.  Patch 1 is missing VMX (or a general x86).

Correct. The first two patches going in would decide whether we will
be able to use the 4.14 release without having to carry out-of-tree
patches. Although as things stand at the moment regarding all the bugs
being discovered in 4.13 and 4.14 we will likely still have to
backport all of these patches to 4.12 by hand.

> The libxl/xl side hasn=E2=80=99t, as I understand it, had significant rev=
iew; I think that should probably wait until 4.15.

Correct. It has been sent 19 times so far over a period of 9 months
with no feedback from any of the maintainers other then that it's hard
to review. We had some good discussion with other community members
but evidently non of the toolstack maintainers care too much about it.
I made the last-ditch effort to make it easier to review but at this
point we started implementing our own toolstack to interact with VM
forks.

> What do you think, Tamas?

If it's not going into 4.14 then it's going to be dropped. It has been
made solely for the benefit of the community to make the new VM
forking more accessible and useful for others. Without it the only way
to use the feature is to implement your own toolstack. Initially we
were hoping that integrating support to xl/libxl would eliminate the
need for us to implement our own parallel toolstack but since we have
to do that now anyway there is no benefit for us in carrying these
patches any further. It's disheartening we had to resort to that and I
certainly will try to avoid contributing to xl/libxl in the future
since I personally consider it a waste of time.

Thanks,
Tamas

