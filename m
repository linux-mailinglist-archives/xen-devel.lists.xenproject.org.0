Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC5626034A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 19:47:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFLEG-0002Ys-8r; Mon, 07 Sep 2020 17:46:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGN5=CQ=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kFLEE-0002Ye-VE
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 17:46:54 +0000
X-Inumbo-ID: 5bc2ff02-f6fb-4809-a3bd-87236e372553
Received: from mail2.protonmail.ch (unknown [185.70.40.22])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5bc2ff02-f6fb-4809-a3bd-87236e372553;
 Mon, 07 Sep 2020 17:46:53 +0000 (UTC)
Date: Mon, 07 Sep 2020 17:46:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1599500811;
 bh=M8vjImy5Ow/dD+WsfLzC2ffSj0SnoqTopAklRr8u49M=;
 h=Date:To:From:Reply-To:Subject:From;
 b=AjKuYmwSAdcSa3f+vxrT0LhY3pRNGDHIZshLGUWHMl6wpASybXOX1oGmC+kSE6rAt
 cgfn6RNbHkJCbSy65KoaSFG28saVtGkb7PBOqJ5K6MXK1wnuprw+u6eKD7ZEyEjrf2
 K8KYTr8hnjZTHg49HCafudChNPL6dJ5p1UTrSYWA=
To: Xen-devel <xen-devel@lists.xenproject.org>
From: Trammell Hudson <hudson@trmm.net>
Subject: [PATCH v3 1/4] x86/xen.lds.S: Work around binutils build id alignment
 bug
Message-ID: <1maNbi9dxlGrwq08QJuuvznixBLaxtncQfen8KjdEVuQqbIGuqATOOXStaKY7MktWJ5H2tfslm0WIpv6w3SEL4D3uGKkn2hXhAw7TiShMCI=@trmm.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Trammell Hudson <hudson@trmm.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

binutils in most distrbutions have a bug in find_section_by_vma()
that causes objcopy round section addresses incorrectly and that
think the .buildid section overlaps with the .rodata.  Aligning the
sections allows these older verisons of the tools to work on the
xen.efi executable image.

Mailing list discussion: https://sourceware.org/pipermail/binutils/2020-Aug=
ust/112746.html

Fixed in: https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D6=
10ed3e08f13b3886fd7194fb7a248dee8724685

Signed-off-by: Trammell hudson <hudson@trmm.net>
---
 xen/arch/x86/xen.lds.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 0273f79152..ba691b1890 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -156,6 +156,7 @@ SECTIONS
        __note_gnu_build_id_end =3D .;
   } :note :text
 #elif defined(BUILD_ID_EFI)
+  . =3D ALIGN(32); /* workaround binutils section overlap bug */
   DECL_SECTION(.buildid) {
        __note_gnu_build_id_start =3D .;
        *(.buildid)
--
2.25.1



