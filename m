Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C57360DB8E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 08:48:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430353.681945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onaCN-0000S9-9y; Wed, 26 Oct 2022 06:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430353.681945; Wed, 26 Oct 2022 06:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onaCN-0000Pj-6t; Wed, 26 Oct 2022 06:47:35 +0000
Received: by outflank-mailman (input) for mailman id 430353;
 Wed, 26 Oct 2022 06:47:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/gdy=23=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1onaCL-0000PY-Do
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 06:47:33 +0000
Received: from sonic312-25.consmr.mail.gq1.yahoo.com
 (sonic312-25.consmr.mail.gq1.yahoo.com [98.137.69.206])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fdfc98f-54fa-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 08:47:32 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.gq1.yahoo.com with HTTP; Wed, 26 Oct 2022 06:47:29 +0000
Received: by hermes--production-ne1-c47ffd5f5-kmjmv (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 636de0ff1881defd5f865b248e2c93fc; 
 Wed, 26 Oct 2022 06:47:28 +0000 (UTC)
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
X-Inumbo-ID: 0fdfc98f-54fa-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1666766849; bh=ny7owJa2RxbGuwayq4FQhxBsSVH0ukbtIh/FIB5CtGM=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=CL2obzNVzt/rKJmuzVYOGdQ8Kn1d1yMZrG2uHlQXtAz//NYIJwS5l0IDGrDPLTx9h7cXc85vg/xfb1BAqx5SE2wV+NMgY/SdFqEI5ibwr8MiouBKWY9Q8O4+gc9ONIPG6CALybaJmHbvT8GRtM4/8PuMvFoR7MgIAUfIiKYQO1RWykuIknzwIXnJ9rqWJepNXLyXTC6AeEHTN7eRCJ6BUW+JonaztqNCu1vw5T77TjWUvXixFJtkHnRZXs8k3sxwpNHo5dZC7N5njiYL0+xO6V4MChRtie10EAhnHyCja7DM96VKu8Vl0BZZi/OIbLUEWxPRr0b+8rkRF+MvZmJO0g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1666766849; bh=43KMNyXrtQtnI0ETe7rDIkw9N+CEwpTmRLuodKWNxiO=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=Fp8AkV4z9C8IcGLMaGd+26g3sZklbNV1CFNuR1EwQ71iqOxKyLDuvgCmiPrh9WQY5Y2LdtCNGEnE5wWYusZP00UaXQl2c4YpwY4KozTyNuazqgwSLeLMshowQlK+S1z/RVXYGfNg7zNa+JAl2BIHlXTk7zUExkOdTzCHjXs5XHW4dbzFErvmq4AJxsxa9sMOlaxL1RqwMeAd9c9sBOQWGok1duC9CiKOuLQX+7veiWik1yZdHdzPAjNUmpgMrdy4PIESGc0cPy+TP+EEoFULJ8Oas/xkODW494sFYDdO7uIizAuaugNWSnyjGtkthmXfaQLuyFakbjrvzSM5z6mHzg==
X-YMail-OSG: iaScSSYVM1kIj9HY.g9pZpp4a8.WVB4UO7BeqapWtqoUUNlj0tzP8eyPowJXjuj
 gSW634pCKGpiZ3lQGRitXX6j_rvSWUV5nRRGv18.0NZ4YayNhokTApBFi5HnLz5mdr94UTRIR8Wu
 I92JMO4fp06pU5AyVc7p8DYNvkv9ZPdb6oFTro0TIje33RAXHJUCuppa8FAL4w3H4Xq10w05ed7L
 GulyFR7keJQW5ZbjLUCFns6Sajf0nVHbyoN6LiLIxHNa382zzhyxMo0VODUe59Hih7i0BLgB7bkV
 l2K46tn1Gl6DZ30rsSTBtSSpRWsu9xY0Aoz8hHp3I1Vwrw9hmGSGfr3avGZrIx4Dx9xXjRhu_qqu
 B7mPHujqq9W2r3wO7rCEg0Ul61G28hjbPp48F0pVGRvOjmVndTCxsAJasFNvA.xXvKajkpwEFodf
 .RScefCAImBOzl21hfqfJglRmuqotJdqJ4ALkWBZcRWvEu4VePqWIor4rFBBThV9Zfs93XGgGmt3
 wc_DvYy1vWODup30urkwyrEjgBl8HREHGcUW2RJxa1yTNgu9LtSu_N37_0AUhfgVXlcwTfc0CJOm
 5zro._cw9jY2CNEXAEKdpdgtrbiiuA9mBBHxbMMrc.EDqitS9F75wvpCSjqEQ8VNxkkK6MmMRNbG
 fx9ere3c.Mfb8vlsh.sGwSRMXRrBsbHJPFCd9Tcbmz0bsucO6RsbhLR2J8LmaCiJRpp7z5Mixyt9
 yHUqrIHHFShoQ_m90rW4MVXCCorCEVggtub0IKcKC7Z_Yw9xf3j_hxjzUBFL6xcoegh3PTEd9fid
 1BKZ1bYRnsUiUBTEDlslPeGPugpSkkKz8AHeij84VNinIFJLHnsh9daHnvTPGWvlfPi4_SM0y3fo
 T0nlX2Cto3cTzPapvX5tzNqYIZ9UJcr4lbMiFeemT4TdlcjB1e7.bL_fr7S8uVjuOv3YCkL_VrKY
 2S1QGkkdzjfHuCsebe1X2LnoDWVJu9qIfkXyQYMIdqOI5Q1hs_um2lRCUeQ1ReISyy8ptqp6B0Wy
 Z4uSN1rUX95iheGPwl9XgwkLSNSoZGmYiTvDrvyA1WJ_T57vIyyJJVqPjj9I6q6QcejXSKpMWWxn
 IWTNe1gJu685Jtovleb043jVrav0Il4PmPGKW.tIUFuApk7HXUaimhX1lqW1kLOPKP5_xsEUz6Cm
 McRHzvbc680bd2jANqNnwwKZN7xp1favv0boreWT6u5U3ZcM1uE8S0JqI.EsRxfY9CBLXvIKfrYg
 wxqQ4YXy73dNxLR1w0Fs3GNQx34RDg0aMJcFYygRjiAS2hl7n_16esDOImR26ytm1DVRJSFXv_R1
 XJWqzvHMXRzK0lbYkJn9_tEDHni50tIeXk6TrPJTrJq09diVE1_fXMLitA3BGvnFs8f9_qZI_wz1
 vDrUYpxkcPJjorMJqnxSOgZH5K6a0ok3HZBbjz_dR9v4SNGAkG00MJ5hvxLBhOKqQM_QSnRU.s9z
 5ek._kO.1QqCYKAuS52H1E0a0RAZnTuqna.VDZW20kQXmh1BFy9_Nd8nYUBrGMeD99byuFON5_H7
 Y4woRpAZdOUQkKhYh8uSCFTkjqgfMUV.iDKkjjTuIVuMO3fdp.65_NB.DQLKK8aOJ9HeVtcqVc.o
 L3AVLfivBkTwUHB.mGg4aogWa2fZsnYlqBfDYywUpnkW2RBMYlsbJgcxS0uEnZj5KJPOje6n515U
 INAgydaz0gc9BAzJIaXj3qydUqt9f777kywlzIoIfG5hf1yJ0gIE.ZE1EjOy1WjShswL73xptf7X
 MbZA_TzWmeHioglNh6wCc8wxO265nIfrt3UQei7hrk_DiT1X50IDH36PQoDarGPJoTNimO.9yvTY
 xqq8D2eoWID_WV550HFMV4DvzSeTlh49bcqqgKFqOKEjpejmAN_q40.TE5yaZheq0rFzH8H2oSOe
 S3dd5TVYvwKT1u8i76rT3xrolID1XGbi6jE6Vc5B8DeMsQdVdRviUXl2L823kHgB5iqLSYxaI.4W
 h2L_C5FtvA2x3CchFZVv1eDgWdrrTGs_9cYvbjk_Wx.yokPjbYH.tEclhRo226IYnpOwCkWW9_cF
 vMbio0lJz5eUDoXCs7uZYAZPfIJbYLV3N..ZNO9Gb4yEgMEh5dByZ6anU6KqKGHQkB2JJ_SWvHR9
 2SlDHfvr0yHO96rzSUu3kCwm4QJkU79Dk0QV_EZ9OptjvX8CfdvKYjoJLfb6rfC5iHu9wesEp6lX
 naCtDNOA-
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: Chuck Zmudzinski <brchuckz@netscape.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/2] xen/pt: fix syntax error that causes FTBFS in some configurations
Date: Wed, 26 Oct 2022 02:47:07 -0400
Message-Id: <7a1fa15767e76155a4f78a1dd126c596bc24cd83.1666764146.git.brchuckz@netscape.net>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1666764146.git.brchuckz@netscape.net>
References: <cover.1666764146.git.brchuckz@netscape.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chuck Zmudzinski <brchuckz@netscape.net>

When Qemu is built with --enable-xen and --disable-xen-pci-passthrough
and the target os is linux, the build fails with:

meson.build:3477:2: ERROR: File xen_pt_stub.c does not exist.

Fixes: 582ea95f5f93 ("meson: convert hw/xen")

Signed-off-by: Chuck Zmudzinski <brchuckz@netscape.net>
---
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


