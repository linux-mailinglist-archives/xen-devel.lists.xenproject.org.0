Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54334421FBB
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 09:52:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202071.356741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXfFd-0000im-M3; Tue, 05 Oct 2021 07:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202071.356741; Tue, 05 Oct 2021 07:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXfFd-0000fc-Ik; Tue, 05 Oct 2021 07:52:37 +0000
Received: by outflank-mailman (input) for mailman id 202071;
 Tue, 05 Oct 2021 07:52:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J6Vb=OZ=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1mXfFc-0000fW-Ff
 for xen-devel@lists.xenproject.org; Tue, 05 Oct 2021 07:52:36 +0000
Received: from mail-ed1-x529.google.com (unknown [2a00:1450:4864:20::529])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2cb34cba-e621-496b-96fa-3fdb2e93c013;
 Tue, 05 Oct 2021 07:52:35 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id l7so51440021edq.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Oct 2021 00:52:35 -0700 (PDT)
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
X-Inumbo-ID: 2cb34cba-e621-496b-96fa-3fdb2e93c013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9z/uadWIJuyuNrxC/5DieTUNHRNyX/SWE9HTWrrUT24=;
        b=dl87hZ3pc4j/qlXozpKgiZpbVAUq3Wc11KPNqQQTOrNWMKAgRKr8ynLgka3NSMZAfF
         0+jzETdcTVZ+4s2fphPwY6rTFjXHC/IyWsSHAgOuaxUqw40E8ZIiCEpcQ8u/E6KiX9Ip
         u0iwzI9x8MJlv/ugOyw7V5Be9gjWd/kw7qjaaFqhlrl8P74oSnSFPHeK6sZrE5QGNzbD
         LQyAL3EiK44SKeEX0WP2ccQoPwkNbTAtHA3VvxHA8V/71tB/8zeItRFRmLfn9W729HOe
         aONiLSl38bvO2vbzyAORExFYwjJdDyz0YuQjKeqxOuR9bvCyuXejCMtNGNE5n2SViXzE
         k7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9z/uadWIJuyuNrxC/5DieTUNHRNyX/SWE9HTWrrUT24=;
        b=midTquHkSPDvAfzuaR7VrOrx/0LbIuZrVW0/mkwbI3WV5+/HFpaMgheyAjymQG2NEW
         VZ5vKYFnkarMnnSzOPUi3RyZ7U1pC32HhLWG4ZCqbb0+Kt0mHtxhSg8FCxy+4RAkJyfK
         LGy4Rr2UB4ncc/wGh9SNxRp0UpiOlMgUettZNlzNIAohG97F6nrWck6IQX+oieUVZYLt
         Vlh8OJwmbJsLRjIdWop50ZDvMvckHDS6l8sra5MpkI9Z9kKhh85+dhHDpVua/Lx38afP
         XWz8kaJt7wtWuv0X3NEi8Va21a5Bc348ogCUCVyt7vvGLpmZ0Jd5cpHWpsKDpsiYSJdm
         wPsQ==
X-Gm-Message-State: AOAM530pCTvzYyWF7R6nozmpQUivX9cpBR3dzxS+5PKilhbDWlmbiCLp
	UC46mwojkjjgUsx4qtCGCnbtQ9ee65fxDcAium0=
X-Google-Smtp-Source: ABdhPJyuEFcx6G3s/Wh+wjCMhZh7+33HtKMLru0ovRkNkp408Ue+EHr+6pOlu/WXyn9YrzHA8c4gVD3hxuvuHFdhTJI=
X-Received: by 2002:a50:cfcb:: with SMTP id i11mr24364572edk.347.1633420354742;
 Tue, 05 Oct 2021 00:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633340795.git.rahul.singh@arm.com> <99ee039a6cdd9ac7d54f1f01649d1dd3eeea3763.1633340795.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2110041639560.3209@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2110041639560.3209@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Tue, 5 Oct 2021 09:52:24 +0200
Message-ID: <CAJ=z9a1cTqx=wbQs6WR4NE03yUj80DRXPc67NMEuqvLVdcXsxw@mail.gmail.com>
Subject: Re: [PATCH v4 03/14] xen/arm: Add PHYSDEVOP_pci_device_(*add/remove)
 support for ARM
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Rahul Singh <rahul.singh@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000036b0d05cd9650b6"

--000000000000036b0d05cd9650b6
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 Oct 2021, 01:46 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

>
> Given that only ARM needs the !CONFIG_HAS_PCI stub, I would add it
> directly to xen/arch/arm/physdev.c. Or just add an #ifdef directly
> within do_physdev_op in xen/arch/arm/physdev.c.


If we want to keep the stub, then it should be the generic code so it can
be used by other arch in the future.

That said, I would also be happy with the #ifdef directly in do_physdev_op.

--000000000000036b0d05cd9650b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 5 Oct 2021, 01:46 Stefano Stabellini, &lt;<a h=
ref=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; wrote:=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
<br>
Given that only ARM needs the !CONFIG_HAS_PCI stub, I would add it<br>
directly to xen/arch/arm/physdev.c. Or just add an #ifdef directly<br>
within do_physdev_op in xen/arch/arm/physdev.c.</blockquote></div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto"></div><div dir=3D"auto">If we wa=
nt to keep the stub, then it should be the generic code so it can be used b=
y other arch in the future.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">That said, I would also be happy with the #ifdef directly in do_physdev=
_op.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000036b0d05cd9650b6--

