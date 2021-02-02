Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 504F030BA02
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 09:35:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80406.147108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6r9P-0001Ze-2w; Tue, 02 Feb 2021 08:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80406.147108; Tue, 02 Feb 2021 08:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6r9O-0001ZI-Vi; Tue, 02 Feb 2021 08:35:06 +0000
Received: by outflank-mailman (input) for mailman id 80406;
 Tue, 02 Feb 2021 08:35:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XtUW=HE=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l6r9N-0001ZD-Bm
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 08:35:05 +0000
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9788af28-c41c-4b6c-83f7-3d9382faed3e;
 Tue, 02 Feb 2021 08:35:04 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d16so19445101wro.11
 for <xen-devel@lists.xenproject.org>; Tue, 02 Feb 2021 00:35:04 -0800 (PST)
Received: from CBGR90WXYV0 (host86-190-149-163.range86-190.btcentralplus.com.
 [86.190.149.163])
 by smtp.gmail.com with ESMTPSA id v4sm34648305wrw.42.2021.02.02.00.35.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Feb 2021 00:35:02 -0800 (PST)
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
X-Inumbo-ID: 9788af28-c41c-4b6c-83f7-3d9382faed3e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=fJhlXqWKKXV3CwRrJvNt4+y3ONiq0lXyBm2W2gSYULg=;
        b=VR7SBEc8+xr99XlM7/imame9l9moEJE80EHhYJZQ4KC4Ie3zM8ZK2a/zKiql8hw2Pm
         QQ/TiVixquDhxkAYVCglUZjL5OiDbshEWq2p/vmrOfk8hsxtFjqiQGHdOvSVAFOlLjNS
         EIDyNKkTGUVMl0lA2BN6yjlCqVNwkT4t94vA6SQOdygpaoG/VpLjkJc/9jKe2HKeZ8RM
         T5wZM9kbe59CkHzM3ALauexuLFgqCb+vkqW0pZcZCb04e6g/hHnQw5ieO01mVg+UmlAE
         n1n3EkHWOrYCS/uBpGxtliNLUpn4m6Tu/iLRzbIDEOAroTT7+sLiLOENHRZjbDVIQ9/Y
         rQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:references:in-reply-to:subject
         :date:message-id:mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=fJhlXqWKKXV3CwRrJvNt4+y3ONiq0lXyBm2W2gSYULg=;
        b=g90el+yPkFuDUIVWkqSsTNKRdUFtnPT6jHPN+XCAioAxwuDV1uhzB3syfVXiLBQ9jS
         RLVR0OuyfMdKYIxgYNNGWcF98fF/zG8jNglJiKhcT+y+xMy7+dZ4XDsmA60FnTHZ7IGK
         ghFpkQOJ8cBI7QuvhSVbw93AvzPnsC19dmMQeXYznxVyXbnKPajR3nYnz+w5vBEEx3+S
         nWhUvILGcg1v5bX26NfFpkWFSg7Jd68ciixnxScP9XoKgHXKLQR2Xgk57TBDhv56PQdK
         a70ZshfTUm1jJVZLOxAPxh1kx7rDOWMLUMWV4AyN7Q9gPB5TSuiQTI7mOZVfSQZsCMTe
         kU6g==
X-Gm-Message-State: AOAM533rZ20Hs/8HZ0lmeQFwG6HAmkUzmTmcyrdWHe/fo1LeRkzrvLi1
	AGe7/P1l9vmLY1457AaHlnY=
X-Google-Smtp-Source: ABdhPJySN61g56h7QmXQE1/nxJzAtj6MxUcF74FqO2cH8Armb+6ZbTWlHhby8apDPvI//le7Jy3gkA==
X-Received: by 2002:adf:f4c1:: with SMTP id h1mr22488665wrp.102.1612254903537;
        Tue, 02 Feb 2021 00:35:03 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Igor Druzhinin'" <igor.druzhinin@citrix.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'Tamas K Lengyel'" <tamas.k.lengyel@gmail.com>,
	"'Xen-devel'" <xen-devel@lists.xenproject.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Anthony PERARD'" <anthony.perard@citrix.com>
References: <CABfawhkxEKOha7RYpSvTaJEtxyBsio9Pcc=xtRD7DszHm2k2pw@mail.gmail.com> <12e17af4-3502-0047-36e2-3c1262602747@citrix.com> <7ea14fac-7832-fe68-529e-03a8f9812f88@citrix.com>
In-Reply-To: <7ea14fac-7832-fe68-529e-03a8f9812f88@citrix.com>
Subject: RE: staging: unable to restore HVM with Viridian param set
Date: Tue, 2 Feb 2021 08:35:01 -0000
Message-ID: <035301d6f93e$4d03c6b0$e70b5410$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ3Ltpo4mDg/loyO5st+hbbC6UbfgDvdyJ3AnP3zDOo6QKkoA==
Content-Language: en-gb

> -----Original Message-----
> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> Sent: 02 February 2021 00:20
> To: Andrew Cooper <andrew.cooper3@citrix.com>; Tamas K Lengyel =
<tamas.k.lengyel@gmail.com>; Xen-devel
> <xen-devel@lists.xenproject.org>; Wei Liu <wl@xen.org>; Ian Jackson =
<iwj@xenproject.org>; Anthony
> PERARD <anthony.perard@citrix.com>; Paul Durrant <paul@xen.org>
> Subject: Re: staging: unable to restore HVM with Viridian param set
>=20
> n 01/02/2021 22:57, Andrew Cooper wrote:
> > On 01/02/2021 22:51, Tamas K Lengyel wrote:
> >> Hi all,
> >> trying to restore a Windows VM saved on Xen 4.14 with Xen staging =
results in:
> >>
> >> # xl restore -p /shared/cfg/windows10.save
> >> Loading new save file /shared/cfg/windows10.save (new xl fmt info =
0x3/0x0/1475)
> >>  Savefile contains xl domain config in JSON format
> >> Parsing config from <saved>
> >> xc: info: Found x86 HVM domain from Xen 4.14
> >> xc: info: Restoring domain
> >> xc: error: set HVM param 9 =3D 0x0000000000000065 (17 =3D File =
exists):
> >> Internal error
> >> xc: error: Restore failed (17 =3D File exists): Internal error
> >> libxl: error: =
libxl_stream_read.c:850:libxl__xc_domain_restore_done:
> >> restoring domain: File exists
> >> libxl: error: libxl_create.c:1581:domcreate_rebuild_done: Domain
> >> 8:cannot (re-)build domain: -3
> >> libxl: error: libxl_domain.c:1182:libxl__destroy_domid: Domain
> >> 8:Non-existant domain
> >> libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain
> >> 8:Unable to destroy guest
> >> libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain
> >> 8:Destruction of domain failed
> >>
> >> Running on staging 419cd07895891c6642f29085aee07be72413f08c
> >
> > CC'ing maintainers and those who've edited the code recently.
> >
> > What is happening is xl/libxl is selecting some viridian settings,
> > applying them to the domain, and then the migrations stream has a
> > different set of viridian settings.
> >
> > For a migrating-in VM, nothing should be set during domain build.
> > Viridian state has been part of the migrate stream since before =
mig-v2,
> > so can be considered to be everywhere relevant now.
>=20
> The fallout is likely from my changes that modified default set of =
viridian
> settings. The relevant commits:
> 983524671031fcfdb24a6c0da988203ebb47aebe
> 7e5cffcd1e9300cab46a1816b5eb676caaeed2c1
>=20
> The same config from migrated domains now implies different set of =
viridian
> extensions then those set at the source side. That creates =
inconsistency in
> libxl. I don't really know how to address it properly in libxl other =
than
> don't extend the default set ever.
>=20

Surely it should be addressed properly in libxl by not messing with the =
viridian settings on migrate-in/resume, as Andrew says? TBH I thought =
this was already the case. There should be no problem with adding to the =
default set as this is just an xl/libxl concept; the param flags in Xen =
are always define the *exact* set of enabled enlightenments.

  Paul


> Igor


