Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EF660DCC5
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 10:07:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430377.682002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onbR0-00032w-L5; Wed, 26 Oct 2022 08:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430377.682002; Wed, 26 Oct 2022 08:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onbR0-0002yV-Fr; Wed, 26 Oct 2022 08:06:46 +0000
Received: by outflank-mailman (input) for mailman id 430377;
 Wed, 26 Oct 2022 08:06:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/gdy=23=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1onbQy-0002gT-Po
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 08:06:44 +0000
Received: from sonic312-23.consmr.mail.gq1.yahoo.com
 (sonic312-23.consmr.mail.gq1.yahoo.com [98.137.69.204])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fc0f98f-5505-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 10:06:42 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.gq1.yahoo.com with HTTP; Wed, 26 Oct 2022 08:06:40 +0000
Received: by hermes--production-ne1-c47ffd5f5-kmjmv (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 23da40615be2c6ee6a989747ca28211e; 
 Wed, 26 Oct 2022 08:06:35 +0000 (UTC)
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
X-Inumbo-ID: 1fc0f98f-5505-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1666771600; bh=u86QTm0cyxo38RdExErIu1L1spuQttzF9o1Vs1Vo7tg=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=ZR2T7Z41SlvXc+rN1mES7UY4Bb+Ycz65QSQGyKE3j2N9g9YvCoyDkX1lp/BczMULbtRqp3/m9Nzkhwo9CrqvMnML+T7P0LKZX879HeuuxS4ipo8Er1YP0gas6mJZypw89JBgo9yrZKGbj2tO9Ou1MWAwptJQ/SOZwI5SXHXX5Ckh4Ft2UwlA7QrLsSVtHUZ78/2i9RINnIwDke7vs4XUao1fSCUlywYDr7U/MQWPhyKngylsFOiXX/RDHwukASBhyDCfLx1sPgA3IVqJTnHRF5oosq4E+IiVu3XkUT40umiQD4h9mQhjkRKvK2Q6sqZqDSUc+PO6VeFeJt022pTgdQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1666771600; bh=1KYDCrNPU+/svpF5/W1oIG2nGvvX+6+8wbJ5ajoLPAa=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=CmMHkHepufn2Qll7JYXi01ukoER0p3TQJBYtcaEEOFoXdaNqIQR2FlmXg+V9V+MhMxVaz+Pf18Sy3AwPxhu3EUTc+tpfBeiBdFcUTMEI9mTBSmLWDPjIP+C4XYyltwJGOsfvSQQhx/I6CelrRiLTq4Q67imx6DjzFwJOuuN8mkCwUQurk979wEDbefGLqU4Gmsvjd9cduo/m+A00v6NBjMvrqPxW6wjs5qySlvUNzNAW/E7XLiE19NgQ15AHdrz27NntgHMtpCGd09yd63vvdIVWCALXewPEt1l91l//gIzWzNbr8vU5ci4SeZAb/7gFlmnjtaqR32Wkdtwkl/b58A==
X-YMail-OSG: FapNKEYVM1lv1c4logrdi4PSEeumlxN3GcGS6oPcjD4QNjayXQlSGXC0ABtI00R
 S8hAfLaiOZepETaAjHrZt5yZ0TZlhEsQSEtZN28JPchpaKZjo9KbHHhGKR5V6CCGjJyFu_RCtSjs
 JeLCGwB.QEvK5MZXpqVY3AKucf_JoGQ3Kkih8mW2O1iJJZvbY.479NrhuOfwpDmve7lcD1wUaG5a
 Ke0zSmxvlQ6myCrT2l_3fWCsJKHmAOmT0iXc4t2iq4ro4ephYNivT_Xlj_BlVVDexTtczgH6Lpq7
 gCln7XTnK97gwAINXgK8joOBTZGwBMSP1cS3xIawApqH9QWHhEdOnxyDZjyNIchJooPNfI9aFESV
 7hplrDlG76Y9p_oWVoNNvx2KPNkfVl2oZrrgpUpIcpCBdSYX6qhuo4gnuuKiKPwo86_KtDn7PZ3N
 eSPTEtlRV8lazRwgMi2bHo.ud8wfu9Bt.XFcDV_Ch5.xIiNEycB78igXsAJJa2xo0qYUbVXbsjkJ
 6z5o08OSXk4awNE28NVlg7f0AJrrpgIHElO6u7LdYyxYRllbIZunryZMGRXigUcmzjvS1_h10ZNd
 nrNcOlT_oEY2HQMn4NYJx3bwbqgXbv72br5nj2ZChrgZEp31LS10xD55rAWyVgsZRmjMiv8jl10u
 IRq3jgobevUxC75pvE69hwGmcuQSnwIHrLtntjRxbhNNQGxe6wJ27dNtswl5IzSJW_zX9xbId3tw
 VIPUbH40mejBfPHx4em.cG5ZB4oCsQTpXhopbR3XO6kjyh1GoVhfCDuVTob1Fm4VhyNFpjSoWE3D
 6PJqMfZwnpSiIO8EdjO5BVIrunOlGjDBLcW1g0mMWUGUzx0.5_wkE4lJJm534vtEyK8jcTh_mELj
 Jk5dm.NJ1isN8N5mxbtsl3sF9wJrsFho1.w.wKXjIwIHO14OQJUKHfgwgs1xwVRfohM9sxI3NnCi
 jWCSfe6PNPCHG7.SpivTZc0fOcpmW9yOIueW6Mh7HWVfd16HFdfBY7tsNtUGQNlIJOiLwBHIpUuV
 m3f.DrEeNctsM5ZeAhDYheii0xveqHRxgbi25Z7uC4QbWPn_7K3rbuOFe.XLsHCk0F.PNASiCII9
 vehpK7j1ZLxqa8uMxhyXPoJ.QObszDqXdboZ8ju7cvNuDrB1aahl1ga4MjtOfW2hUqTQ5mK2IMIN
 bY0JKypYhxbOZ.oSL_DtzGOMy6xlHH.qqopkqW3ZML7C85r4AkQzIobnnWzn8OXVEcA_AXRV9eiJ
 Bqawf.Vn04qAC0M2cy6MEhkRICBIZuXLd9lepKKlugQUXv6Mt9TCB_JnTQZA.7k_FZ_s319LKLbM
 4uSNxbaQunnYTaBg0mI_PJN5bdDgJQ1_Qi5egCd0k8M1NFxiT5jOPUwIbX0HCW4iwJD9bf5K6o93
 n.DqBkd9IaMozwg8BqUHCaYfd4DvHk7Ktq0lNcUyUtRtR5zxj_CY73kT6gcXxypGIZPYX_r9XSUv
 cun4Av0DfMyNtTlBRa8PnLupA2hDKLDUpicfLzJRnVfAwkujtCVUoNx87k28TkSjLaHmakXgTD_h
 vJl7nXv9f.zQd2T9osYa_zcTRLgL1a6FpS8SFxAay4Udpike.vWRW7g4BMVD6pV05Xr8BqckzM6w
 3rNFBvpK2sja8a_0QGqjk7jlhM2KE0kcPOTEp.Sjw68ZtUAb8Oy4ijw49o2gJbu2CfPBGuj4YNMq
 vokZZorvKJ.fUmSrakN1DwW8SkAoo9k6tJqa8bIEyjduUZutijxjo18TyBzVpfi7vBfFoADo.LGg
 DpSRb4W4TEysRf6e3QbB6RA8ggORrgIAw8cHdCacRsbebkE_acnJPYQqlKtHcgb2Un3RsTghntwO
 aXZK3D95b6Rb9xVbVil2u1S4XKcWrwU79R.7oe18j5nXP61hdzBGv.P33.DlVji4pCUkIrYr3K2a
 wWftXSkTI8JuELVzXrrbtF4CspjSfkYichlXgouH5IRfQL4vCT6lTyGqyyuYxUnNVC.hR.MkiAEB
 duUUH3Xzo.eiujjAsh4cZWFUfaKRly06C2zgrL2f5s.pNliplKDAVXza6ixehxvYRqIvrivGgrdM
 6ohOlEUIvzcugW96JoH0RyuCMl8qO_GA9cPazBdFs832Tn1xu4JBd_M_YzHikxNQGw9ysp8L27OZ
 fqYCrrCt2EZUyG1DA.jR9MiEgKsXeu.FWQf12i6uJiAcczytH4JLJsl1l6fKRlMKHo24oTEUDP6.
 p5B3Vfw--
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	Chuck Zmudzinski <brchuckz@netscape.net>
Subject: [PATCH v2 1/2] xen/pt: fix syntax error that causes FTBFS in some configurations
Date: Wed, 26 Oct 2022 04:06:05 -0400
Message-Id: <7a1fa15767e76155a4f78a1dd126c596bc24cd83.1666770888.git.brchuckz@netscape.net>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1666770887.git.brchuckz@netscape.net>
References: <cover.1666770887.git.brchuckz@netscape.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When Qemu is built with --enable-xen and --disable-xen-pci-passthrough
and the target os is linux, the build fails with:

meson.build:3477:2: ERROR: File xen_pt_stub.c does not exist.

Fixes: 582ea95f5f93 ("meson: convert hw/xen")

Signed-off-by: Chuck Zmudzinski <brchuckz@netscape.net>
---
v2: Remove From: <email address> tag at top of commit message

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


