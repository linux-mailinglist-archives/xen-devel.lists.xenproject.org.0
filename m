Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A3C54720C
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jun 2022 06:42:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346665.572984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzswo-0001lw-MZ; Sat, 11 Jun 2022 04:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346665.572984; Sat, 11 Jun 2022 04:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzswo-0001dq-FV; Sat, 11 Jun 2022 04:42:06 +0000
Received: by outflank-mailman (input) for mailman id 346665;
 Fri, 10 Jun 2022 19:11:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z8as=WR=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1nzk2O-0005Fb-Qj
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 19:11:16 +0000
Received: from sonic313-20.consmr.mail.gq1.yahoo.com
 (sonic313-20.consmr.mail.gq1.yahoo.com [98.137.65.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 174cbca7-e8f1-11ec-8901-93a377f238d6;
 Fri, 10 Jun 2022 21:11:13 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.gq1.yahoo.com with HTTP; Fri, 10 Jun 2022 19:11:10 +0000
Received: by hermes--canary-production-bf1-856dbf94db-29hkj (Yahoo Inc. Hermes
 SMTP Server) with ESMTPA ID 9d6f995788e29b021bb644e07662bfe3; 
 Fri, 10 Jun 2022 19:11:06 +0000 (UTC)
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
X-Inumbo-ID: 174cbca7-e8f1-11ec-8901-93a377f238d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1654888270; bh=szQQXgwdpNsXgDZ8HmI7zcWajUugI4/mSs4RjBC4WHA=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=duqtH943Dlyju92svX3AFoc3OSDY/43X3Hgu2OgwUAV0o+1z0A5EukqnBjeacRY6CLlgAEetJn4gQc57vjpNXDdF4txnBu+EkAUFQw4Pg4DV4isbM+GXCTJGs1fwCLhOm7RpsZI2ZiJ12lkkmo9DP+hxl8PsE8hDoPBPCKFzsvRjCO4/nL5IwAy9DbGDVTwJdifKJY9hixEpLa/pf4gq73ZpU6XlDFQeoRUmUKMVecE+sQEgyMk/xIn/pK9ACj+FeuePV2YGFSImdBDnTXjekyDJvXDY6ab/rfWQthP6+vaw0xARRtXhR42JVuxK1hQJgfwjmfmOx2JaiKM6r9h2vA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1654888270; bh=58rsgOgWzfRp11yAmimyUtsHGChA3r+y5aL6LGS3EoG=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=aeh+IS/kWViQ2K5fNMH2tFb1Xsamjmi/unryJA+DqFktY+iS3OAfA3Bd7sDl5lS+ftuIdVDlZf0nwfzvooY5wRkBF3GO34wmyEyoR2usPoGPrxCPpaKpoEn+mIw2XEQuzGI98ELB7Cyday4ifW7Q9CEUzIXlFFZDTz0NGVrKTlAb5vhYc7l1Bi/JgsaoDUP3EzS1g7JynGmhbdXQ0hliH3ghi/u5/kl2uiW/G5XQzMlunK59RNHbsLw/nrsmYd7FN7j+5n12cH5Q9lTLtR9m9e9Jq9yZfIZUJwuyKD5TLlSfm/xDWSAmbo6K10qKm5gPNeCSG71TKbg4niuQcIIJfg==
X-YMail-OSG: EcVWYf0VM1kaBprv3wOo91pcd4NE_dHn3XGuYnQ..1kuU45apy5Yx23HAR0AzY4
 0T7DMF6i9Hm2C_mcD8O_MDD4NWhPEzl3i2ddvOIeiJaT3qLIS3q4y6TerHf1Rpa9V62vCf5NuMfa
 F115JdgVAKEaN37_LDTh_5QgSSpezwcE_PdynM0GT7kapehBh7pYiq5RkfQIALWHaCm03sIIXnhD
 oCGJrgRhbRiy57RoNAhXvKnQtXyeQMWURWuYKN9mGIqqcgr8vGGmvDDHLIRvR_xBBoXvT7khIW5p
 rjH7_.T85f.1VsL_M6eo15tibVK4qorxPNTD5Lf9X_4EXNY4w4dXA_KfG2sdUhrwurJ8wy8_8QLk
 zvXFcw4IjeU4iQudpeZJcXw1es2K5XD6Eph5fKjKyprZtU.lLefx8cZ0.5CspbP_FsPT71KG_GHq
 gY3RHGQWzlPPVFnukSxdV0SHSkPKnyD4sXMj9vZlBMNHUg6z9Y2_p6UzoCVK478QFEpX9uypFBSz
 q69j3aS_4MfAEVmqClfyViiQ2jDSj5XthjcO8_9nNDuDqmkjUXGsqXCDdJuq4x5R9YEeYOdvrmXg
 Jh1rkwUusOMyS6pwvvRvA2p_9q3FkVVHR1BvWARpN0cFkYdjgxWiJWkKJXWndN6Xwqpv7ppL2qka
 HfrXyV9BpTS5bzGLwqIXCVshdVw89zIqV4pMhj.JawjxOw6R0hmcstkUlkj88vqPaOS9LGwA7wlH
 OoL9fumSgHkeDAmFbiT47Ry841dSkcRNgrep_39R_oQm2FzYiugg.AyVqT2mlKfYJNCQ.Pt59Oal
 SrSjYjXCp24BqOfjTrDwkKfm6bQB163jeyWizp9mzr6Q.HC7RsZW18JHyMb9N9KW_of0nvmbdbPk
 nwm7i4HkQf69Sl7lg8UFab_KkWwFnWuC04lM9yHlnON1KpnXswFOCGwf.vuzda4pyXZTbU0KiE22
 LyJiJ2p91MJAoLQTtoQAenOJmMmn2j8CfbDfdLyT6zr0yF3VdWXtLGQpUilnWxn5B2Wwy0DOW_qi
 uA.PutkPF5GwM13dH4aE.gC99aZP7pxbKJs7YAkKaa9P1nleLFcewG0TN0qaoeHefSkZEKf7kWS8
 ihRVOtDVK77urFrAgS8RnOSBwGThlggi02WkL1hgbYd1OLz3LBPBhkaphEJrGzYFuOoo8qdu7dER
 tvwUYUHYJvdQJ_dYXS.NlyT2SExP3BoV0aD0BRqjhoSmRih0f9anAq8.wlxX0PRx.4_O_5yNiCPG
 7ttCfatci_w3JXsPISfqIaEuZYrHGn7iKPOuY04UeycF2dnCsGhBhbUguOiXXKEoGEw0pLK4f.1p
 ECGiJcN6oxvDOOPBBKNFa_q2p4G4miimjKaAHFgUhzRokzUTdGXpF9Vy3ruQ38rEILnm2YPCEH42
 bONsSEj9i0Zgn3nt7TjifWlsL6aS2pQH52G8EFY22nwvoJFsFURc6B.li1PKPNjUq_EX9e8Quy_O
 _d_yPnnX8dHL5svrLy1U..eGJZd8zCI51qSRzHFj_wXo2Ctl8O9NYSb0nXHf3gZ31xACtl6qMh.I
 jqVFpZzaBIWL9qMN5yC8yBNNHFIFOJRjbSWB7qNwHkD37acDf0h.6te18Y0M.8plWok4OBoAxfHY
 DB3N1x3SmjpVjcMD7WpJY4uecreA1JycUyVjViLhIG4Bj8ir6VIKXC.PxPiIa_Ca2hr.NvIpr8m_
 xox5itagkVz4J6DuRUhGdMh_6wtRG5IULyO1qDGUazlDcTjEnG9JYYuF.snlyPFi5Kl6GGvdZbEi
 08V49YJznU1A00.zbAlbIKufMrdqep42D4Z970sqHp21saXOU3iDUSLdLGCa9.G714UZWArDp8b2
 tFr1M6fWbhJWq8fNaJPjCtf5u8uzVJfPsrz8gGnKFCAzUvtIaa1HjFqRgR8dvgJq.WNVmcxAhMD5
 Hx8Q94hJBEdLkJtUNj5m5swa.rDxqRQD1ATPa5ZIXpyO_pDKEu2eSYidd_UkeeumRHBYilKJYnLp
 2_x_3Txkbjd7srUvW1WLeKlxERFb8ltEfKBeFh6Dt7e4kdiXQRZ0jKo.1SkAE4jJ1ryPeZFfSUTd
 avbEJf8z42bOiGp7EdmQXLevDoyIPVyH0n0H0zyef.3W.bRXoma5TJrhIgHdiUz_JRt.WG72rtuQ
 K24FJxKD6cOkXlTxESN2UTG3Xw2BQBoGwz1.2.1XHo2KgmT7yKlykGVeJ9vXEgDQE100yUo61rve
 Iy8jeSs4hwzLSoA--
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-trivial@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH] xen/pass-through: merge emulated bits correctly
Date: Fri, 10 Jun 2022 15:10:57 -0400
Message-Id: <b6718a3512ec0a97c6ef4a5b5c1f3de72238c603.1654887756.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <b6718a3512ec0a97c6ef4a5b5c1f3de72238c603.1654887756.git.brchuckz.ref@aol.com>

In xen_pt_config_reg_init(), there is an error in the merging of the
emulated data with the host value. With the current Qemu, instead of
merging the emulated bits with the host bits as defined by emu_mask,
the inverse of the emulated bits is merged with the host bits. In some
cases, depending on the data in the registers and the way the registers
are setup, the end result will be that the register is initialized with
the wrong value.

To correct this error, use the XEN_PT_MERGE_VALUE macro to help ensure
the merge is done correctly.

This correction is needed to resolve Qemu project issue #1061, which
describes the failure of Xen HVM Linux guests to boot in certain
configurations with passed through PCI devices, that is, when this error
disables instead of enables the PCI_STATUS_CAP_LIST bit of the
PCI_STATUS register of a passed through PCI device, which in turn
disables the MSI-X capability of the device in Linux guests with the end
result being that the Linux guest never completes the boot process.

Fixes: 2e87512eccf3
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1061
Buglink: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=988333

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
 hw/xen/xen_pt_config_init.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index ffd915654c..bc0383f7fb 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -1966,10 +1966,10 @@ static void xen_pt_config_reg_init(XenPCIPassthroughState *s,
         if ((data & host_mask) != (val & host_mask)) {
             uint32_t new_val;
 
-            /* Mask out host (including past size). */
-            new_val = val & host_mask;
-            /* Merge emulated ones (excluding the non-emulated ones). */
-            new_val |= data & host_mask;
+            /* Merge the emulated bits (data) with the host bits (val)
+             * and mask out the bits past size to enable restoration
+             * of the proper value for logging below. */
+            new_val = XEN_PT_MERGE_VALUE(val, data, host_mask) & size_mask;
             /* Leave intact host and emulated values past the size - even though
              * we do not care as we write per reg->size granularity, but for the
              * logging below lets have the proper value. */
-- 
2.36.1


