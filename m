Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E82614001
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 22:36:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433214.686113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opcS7-0006Sg-7B; Mon, 31 Oct 2022 21:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433214.686113; Mon, 31 Oct 2022 21:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opcS7-0006PW-3a; Mon, 31 Oct 2022 21:36:15 +0000
Received: by outflank-mailman (input) for mailman id 433214;
 Mon, 31 Oct 2022 21:36:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2TDv=3A=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1opcS4-0006AC-Ta
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 21:36:13 +0000
Received: from sonic308-55.consmr.mail.gq1.yahoo.com
 (sonic308-55.consmr.mail.gq1.yahoo.com [98.137.68.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07bcad9e-5964-11ed-91b5-6bf2151ebd3b;
 Mon, 31 Oct 2022 22:36:09 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Mon, 31 Oct 2022 21:36:07 +0000
Received: by hermes--production-ne1-c47ffd5f5-2l5gs (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 1d450870d12d3f727fe97841ca3633d5; 
 Mon, 31 Oct 2022 21:36:05 +0000 (UTC)
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
X-Inumbo-ID: 07bcad9e-5964-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1667252167; bh=IGznKk12GJy9mx+cAyxhAXw1kam3mqzoP8wC6G/UoSU=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=VfBFhH/IiUAMeyrtK6L++FniV0n17rJw2PDlx9wTqxSzCGXqld/wx3ZCHuYv4EB3chl8DM2EfZ7lGLmWR7YsHxj8o4S9a5gyq4fqslyVgaMYhYqhbb+sbnhgaRw+CMmvZ84iwssmV3QGMnqFX6new1EdpJSDsSrIbIWgkaLi+hL3szsFILOh9fBnZ6yRIUgk4CpsPJ8Sm1s5p+/wW8oaqrZkQz2/+jcOSKSZDj3DfVuphHBDEJavXJ8qZAgAAxsJ3W3qmyajWdDYd+xF6UW4Ia6XionhUi06HMWV/2mkxIs6+6nAPf40q/1+gfEyS+efJHYupXOKCZD9LyJEBTZjkg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1667252167; bh=s1nJndFclxPJHpwkBlsE/zVpQGSKg5nGaHWBSiMCA8a=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=Cp5PvtCcXALvHl5fwKJQ/Y1ZWz5Q/k1wYOZTgsPKpNpUiSLQOfPqpsK3J8DIo+aMmJWWyXqp1LoOPlg2zbMpi0rmXo5HsWDnNMJYSQWtr2tsh6VYl21FlRYEFT04Et3TEMR6NezF5q33Kg3NPbtIff+o9vR1gPGm6Rr6sXPRnKVAlZg5lCzROfWEAWjzzRPX+kq2N+WzDYwBraZKj80boW1XzFsVw5uROvDG/S3FFnrxoh6HC6V69uBRVO8VHUJUMoCa2hkc5DHcN8iMnqAJUbv6CWxFq5A0h2WLd/RbN1aQP24YltoKhSEoOwA2CUPXwe0daZZxV9a7xLN10rlF0Q==
X-YMail-OSG: xoK7.TAVM1nXfkqSkAXJsWIxt6aE3NfKJZ3GktAXsLafXoHi2CeRa8MEJ7hPomh
 B2GFQ8hoEa7NTLB2L7O4ROJpJVG96s10Z4TilyZznGUVJloj_2wnrCk5CdEu9Q2i4IJYc8MWEi8s
 XwB.1OyC1.VsjXU_GMrQlSQhLQ8ucr6R645zSAS_Nmj5_2uMbo4vp4g_0k5CF4t_AIEDwwtcw7Ow
 AAqJLiWQ11f50O0P2EgiWGzJEm.oRM.z14bKd7qjmHLUjdKFl0LC3B1wPEDTYX7TulqwOZwYPPNY
 VCdsxsvy50KHwQvtEluHvTqBdphz4G2zw9jb9bLySx3N60o7PARz8qI4E6daqDFbwK3eCJMNP6Vp
 yzj32037kX8D5cMcYBP6i1CBOzOLnpIbxi.t2XqjNwnz5n6wE6Jhps3SWovEfTKxugATkyZXdXwM
 4cYaEcMUfOOGE5SD5uAB3aLBl4exJBbgBgxPC_e5eW0qMWXYaBTxWBtPX0x40ea.UcfsUoEIXheG
 9NK_w2oqBNdnUV_FcY.u3m9yJGcXK9wmGTjDgByCytjs0y2sItAyIfQlQnw_bjF1qyI1rZN3u7nv
 BE6ZQmmvX7pUX__63pSd1SegWPXCdzaksVBRrXaEhm1hlZsSSKK7cljdw3bw15Go4UPJkUYftZQ6
 lT0nEHQ2WPO0YenbOh6_BeBLR6MFIEAAKFDHuuaXJMTfEraHx8hogw77FT34fX3G7olC7FZKZEKI
 4pR_DbA8PDysJoRpC3vXBmTQUTEKZ6_OlblbfK4XX0CO67LxYtdZI7mueSSZBoaCwV8wWdKBPAdu
 86MvRQWywf956GlEPipGMS.qn1_N63OCygcow5E2HIMSujS9egilINlBwvio9GPU7If.ywSjd8vk
 LNr3hICQstkUkXvNAYSNEafjP5TfmR6fnRFQq14EVyQ_pDX3AloLOVRWjeQprA_D4G1FOqQ3NDt4
 e_jk.U12tiY2g.IqeusMGQESGUFoMYVSDFtJe9OtCgIpJG.TMAwOCF_gKcyJsOjKXBjKANaz7MuG
 bRVBnOCsC6Mtj4cIpbZgl9hoE5cSLOezlDELq0jvy2yZTYRNP.MZ93wETl.bys3yyXsOr2w.iOHw
 ZkOHt1OSPstlHnm.mmwyPM51e.s1n0cQ6N5kE7mHwwyQZWGAWvn6PD2fLfm.qPX7VEKnsMts386J
 OmDuhxRx4zYFXFQwQgGgZWwhn9IwUZJI6yKm6Z99mqtkkygh2RNB2hbDBbJOuBz4mMdf0nVdceFW
 9lk_5H_h15z0UmZq._iXMIuORsBkcxTIxKN4RohKfuMcigyLR2U3lku8nqYvE1T3WM6r3G.SQ2sc
 D2O_VSl53Ku_yxzS3Z5Wnn.4aF2xYwJtP_OJjRV2agK6IlPhQ2J6BoNAiEZj4MZTG09wvwdZbuoT
 LUB0QzzzhpiG05KMkj.dI5DN1U6OMCfWLSNTjqTDt4R1pXb8yNL6TImOFssdIYaqch4f1._QdnLv
 rRXfEpRCsvFzj0RRsz3AICtomHLvabL.p8JMSimJYOanZxLZwV4zXKUMiFuN09G_b3mcvol30Luk
 LjNBesKDlKs4P2PZBzv53N31x_RuOgiRhCIV7Ob9M8ClcimvGLw38Lhg_1Klw69Ld6W3fy3U9XZE
 2MZAS.Mpn7LA1d.2P06ZhwMt8PD3S9mjOTw43uZbola6anOtpwFDAata28Sxvq08t2ZkcR_kY6Al
 gLyqPeOuc1Z7xbKcQfeQ8aB8FN.JHsuSH7Mqj.wPl8nOC7oqo1mv8amKs3Sgtm7m5TnD0jo7ByNi
 3DciyiaGtKSp4O.rsVxe15KorsEDPqf96Bh5vlZFB9tELRhGGg8AkKzFD3BrZNbE.ydCMm7GKrO.
 GaTSzbrSsfEz1mm9xRmpbE_Ira4AawFfWwJi5ng6xKH.J7rlj871dLfmUGtPx0H3LgkHlJJDcxKI
 yKoMuqe3_o1EcI423JSfLJ_1rvhEcxZ9wlYZkySmcpv1.FKD2EWuaRy_a7sIT87fyvvHaVmDZ74X
 JqJnfuv2zIb22mkpX5RgTG8JfMMCDJqK6vGm5ywTDxBQXlZTOM6qvoggX163tXEbP1lSL2MVCUhY
 3cdi_kSxAYT9xjDUDKo_zD.OokNoaE12D42kt1Pp7ohapba5HtmfTqNbfKnlhdRaZ8CMhVHaYBzK
 M9a6I2E0oyvpRP5lGYDDsmvax9kxBto0g6ash5ejR0s_0LdWv1TmvEb.jmrwGf3eWS_eBxDeCy1E
 GPGd.a6uK
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 1/2] xen/pt: fix syntax error that causes FTBFS in some configurations
Date: Mon, 31 Oct 2022 17:35:52 -0400
Message-Id: <5f1342a13c09af77b1a7b0aeaba5955bcea89731.1667242033.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1667242033.git.brchuckz@aol.com>
References: <cover.1667242033.git.brchuckz@aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When Qemu is built with --enable-xen and --disable-xen-pci-passthrough
and the target os is linux, the build fails with:

meson.build:3477:2: ERROR: File xen_pt_stub.c does not exist.

Fixes: 582ea95f5f93 ("meson: convert hw/xen")

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
v2: Remove From: <email address> tag at top of commit message

v3: No change to this patch since v2

v4: Use brchuckz@aol.com instead of brchuckz@netscape.net for the author's
    email address to match the address used by the same author in commits
    be9c61da and c0e86b76

 hw/xen/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index 08dc1f6857..ae0ace3046 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -18,7 +18,7 @@ if have_xen_pci_passthrough
     'xen_pt_msi.c',
   ))
 else
-  xen_specific_ss.add('xen_pt_stub.c')
+  xen_specific_ss.add(files('xen_pt_stub.c'))
 endif
 
 specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
-- 
2.37.2


