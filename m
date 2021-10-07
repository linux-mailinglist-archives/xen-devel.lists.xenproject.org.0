Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EC442564D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 17:11:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203766.358908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYV3E-0008Io-56; Thu, 07 Oct 2021 15:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203766.358908; Thu, 07 Oct 2021 15:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYV3E-0008H1-24; Thu, 07 Oct 2021 15:11:16 +0000
Received: by outflank-mailman (input) for mailman id 203766;
 Thu, 07 Oct 2021 15:11:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J5vh=O3=gmail.com=charles.fg@srs-us1.protection.inumbo.net>)
 id 1mYV3C-0008Gv-T5
 for xen-devel@lists.xen.org; Thu, 07 Oct 2021 15:11:14 +0000
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e95d9915-1883-45f8-a578-7758b8477c49;
 Thu, 07 Oct 2021 15:11:14 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id s15so20171624wrv.11
 for <xen-devel@lists.xen.org>; Thu, 07 Oct 2021 08:11:14 -0700 (PDT)
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
X-Inumbo-ID: e95d9915-1883-45f8-a578-7758b8477c49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=/p8VgXlEZzMe5nz8rRAzEOyKQbLSVqLZnUlACqpxKM4=;
        b=d1oaFCPRKw/shezxWLPXRYnFh6NMMVJ9LVaQcMBWLmQIhIZsIjltEgHAh7dGdGY/kI
         r2Y5Gi496IkM37DXJINFTx/vov1NCBG5P0GQmiXiWEea78o//UhKzdWfeD/ubVbh7Q5L
         44f4WOSF3NvjS56SPBSxwHCzrq2g8KDHjay+ymCplcGhA+t1Q2n7ayVC6rwlQ4yUZFLh
         4WpmQcLIGA+v10XJyBDR2brAUJxi4ze1Gg/0MxhnzCgoFU+0THRPVWL+VDvTgED8QmdT
         52mSARLYmP3yhQ7rz8XfLuhgUCfTG3VMMR6tbTemPKRxngDlwUFbiNab7SnnuCO2fOBo
         +WHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=/p8VgXlEZzMe5nz8rRAzEOyKQbLSVqLZnUlACqpxKM4=;
        b=xPIt0xGZ8myiCKli0DlftEdcm9UrOurk4XMDk5k1vcyGLFiYlDYRoUgPD2Hdhlah+x
         9KuxoirLc2lJtDtuqneY7msLDhjAuwB08c/x6WydgsKIDmmp02MppnQfdvNYt5XbVAiI
         7tki/mDMWAXMLn4T3djYMiYz59g77faHUWurDH2OscR4CuaZulIjcffZPlI7zkV3oSBq
         nbTQ+lG9W+oMZzrhAGFa6RnSsl1L1womkSWI3kbUHrGDVUhNoUpnmXbsT21j6E2OVOLr
         kUqHsbUcIb+OHXjfNj5IXkzlJJP2TvpTK/LAIhuO/HTsVfTse96a6/H373fk0yc/0vy9
         EZVQ==
X-Gm-Message-State: AOAM53362PX3L84bydcL3uXYlJTvcPew/5JA2kV5KTek0N+NLOu22J7o
	LB2wlVf6n37bh40KCh5VOYaQCbAoaDQb+o8mMsenVQaqxEg87w==
X-Google-Smtp-Source: ABdhPJy5hMEIdP1aWv/bh6uICLcHPG+KEzPRzvWehxvz4x+nVSVllAQuJJq8jqgE4X5BiPMtL5yOBhUh3+vdHkGdTY0=
X-Received: by 2002:a5d:5250:: with SMTP id k16mr6312064wrc.82.1633619471840;
 Thu, 07 Oct 2021 08:11:11 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Charles_Gon=C3=A7alves?= <charles.fg@gmail.com>
Date: Thu, 7 Oct 2021 16:10:35 +0100
Message-ID: <CAAQRGoBQZ4mMWy2ibectwbN85oWvgcwus2rwO23u7BA7JWbf+A@mail.gmail.com>
Subject: PV - different behavior of pgd_offset in xen 4.6 and 4.13 for GUEST
 ACCESSIBLE memory area
To: xen-devel@lists.xen.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Guys,

During some experiments in my PhD I've tried to reused a code from
Jann Horn (https://bugs.chromium.org/p/project-zero/issues/detail?id=3D1184
) that used the mapping in

```
0xffff804000000000 - 0xffff807fffffffff [256GB, 2^38 bytes, PML4:256]
Reserved for future shared info with the guest OS (GUEST ACCESSIBLE)
```
to map some temporary page table data to be able to attack the system.

This used to work on Xen 4.6:

```
#define MY_SECOND_AREA 0xffff804000000000ULL
printk("PML4 entry: 0x%lx\n", (unsigned
long)pgd_val(*pgd_offset(current->mm, MY_SECOND_AREA)));
```

In xen 4.6 :

`[ 3632.620105] PML4 entry: 0x183d125067 `
Returns a valid PGD ( pgd_present(*pdg) =3D=3D true )

but has different behavior in Xen 4.13 (despite no change in the
asm-x86/config.h .

In xen 4.13:

`[70386.796119] PML4 entry: 0x800000021a445025`
Return a bad PGD ( pgd_bad(*pdg) =3D=3D true )

I could not find any reference on the branch RELEASE-4.13.0 of why
this happens this way.
Any hint of what is happening here?
Has Xen changed the way it handles memory from regions in range
0xffff804000000000 - 0xffff807fffffffff  across those versions?

I'm running on intel x64, on paravirtualization mode, the only
difference in the system is the xen version.


Atenciosamente,
Charles Ferreira Gon=C3=A7alves

