Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A1C55F5FA
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 08:04:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357534.586139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6QoT-00053c-VB; Wed, 29 Jun 2022 06:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357534.586139; Wed, 29 Jun 2022 06:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6QoT-00051Q-SQ; Wed, 29 Jun 2022 06:04:33 +0000
Received: by outflank-mailman (input) for mailman id 357534;
 Wed, 29 Jun 2022 06:04:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=los1=XE=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1o6QoS-00051I-K2
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 06:04:32 +0000
Received: from sonic314-21.consmr.mail.gq1.yahoo.com
 (sonic314-21.consmr.mail.gq1.yahoo.com [98.137.69.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 562eed8f-f771-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 08:04:30 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Wed, 29 Jun 2022 06:04:28 +0000
Received: by hermes--production-ne1-7864dcfd54-q4948 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 2814da2f277392d570820fdc55e6888d; 
 Wed, 29 Jun 2022 06:04:25 +0000 (UTC)
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
X-Inumbo-ID: 562eed8f-f771-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1656482668; bh=zXI8lOjk5jak20Wr8hBYS9pShh6LSGwvLeCNZDO/jUI=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=VDftd59DYcE9LQ5W+YhKifpwd9op51H4T/Uvvt6NlnIXT46SOIZ9vv6j7NbFcaBDWHWjcXRpPREm+Dn96WZWqs8ZzvbsZaViMvnW60snqFBdQj9T417tXWQheM+7u8I/HXWymBl9n3TP7FAoOsj2MO+rpIEc7IlocQRGLq/RBP4hAENrIHDUY1Eob2aRr8h/GDoILLOK3sFtvKUP5kFR1mZZfXeYQvjBMayccfcyTWR639HaFS6vEFszPV/IHzcVfLsbKAnBnMGf4mwwhvJRE/kHEju3XZBP5wzLhEuGTEVZCTsmiMFh+lnxgzMSvWzIgXRBYPzX6oqYB7Se7ITM3g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1656482668; bh=LkoGCfHrTahP0imugLWlseCDSzbQlQ262ug1rjpAhv0=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=ZiuGxlcj9Mmr1Su7jtfgyvesfzMIyg/H/UDS19SDoXnwURDVkERYIxCU3XA+DDkd8GwSv6BK4p1rujVWNJBHjhKbLjSjvZK/QghwAuloJuSGRgLJa7tMQuzLzoLITgdlC1kkUV8VwbHzlxRp7mPis5dhUYRXmpPlHM6O9wiExNnUnc137uBO0FhVf/4sWF7fU6TAic780M+bkQeK5KRbRlq8gYUaN2gyWi1nzPpANdP9ecr4QvZcLBS5vA8xNfPmmOqMXmouTY1HCn6FQ5Ry1WzsuBNtiXUHF4a7geckSjZXjw2FdNt9Rk8G3+cp5S5uURyZDaxlw6l7VuiVl6pmEQ==
X-YMail-OSG: IOMYgPEVM1nbZllUnd57vB752F9AROM_emUXMjv3mvYZOiS4728Z4TylVTWrq8h
 i.XKC7ut2cRilCwqGAjHk9eoDv.reJ5jySqIHio0O7zBvglQ4f4SKCCX_AOqdgpPDsGvu3D_2iOa
 VEOCPpIvFKlbfcwKXNdNMRdjWEJYgeJTs_R7iIsfRxWwhxxNyvsrIoG8q8SfGDZEysItTPyCqSLw
 IqX4mY410irWfToPt5aHDjzwEqmnYH0A_gHvJ22ft7471yrd4snoDrr3j782v8UbktfMlXnNVMQF
 J9BPKl_DEf_NGd5IIb_ZI_FrgmZCeauA59F_mF1BecFb0gKQWExiU.y_3gNyEMb6SaIVEHBnqv1z
 w2snb5VJgEoY00.8UwC5R2ZuaUr.ZwNrtumkgSFF9Lh3uaZ6DBmS.kB36ueXVHGwGjAnn65J_y92
 0OSzVK18COeNhlv37fgBURcTEHH1TPRKeN96qQ8mlepUxKW0mSBihyC2QXGCraJMwQL12ojkkJ7E
 VYkVaonSrDbRjtLcLJkoCuwFaA54iLVxogRYRzfZLRbUXQ_IEdXghYQNfHWNiqVX2VWVqqpmKvMx
 EJiQQdaCYTQ8RNunPPVabP8k9Qb4QQ7NgkK4UsabUZ4YYM9UmJBMhWqcUmyuGnr3symErenMnGth
 oSefk3QWMS7thC7z58ZzvSMkWRZj_1x2vH7NIOCFZQ7.8khryypzJTcbxyhMq7ZRv5e7lZviVtvl
 BwTUnMVVT5Xv91Xp_O.uqKrV.jw_kuNtjFOpcQmGyoyco783JVTRltvjOplBWNJXbqi5N8WBbIeZ
 ccPaOCXFppnxaR6W54wTbhP2Lt65GlDc.7.FFxBKEhqG.7uGaX6D8y606pXcTZlcMA9I4p1YYLFD
 xTIdBILPzJYqUZkm7zZYK9uYCgoHdVGbW.FfIRBzi1x6CzxG8TJfxMPgVkK024fSZkaCCppXiXTG
 XpUa4EbQNwEbeITGXuW1FIzJV4eRcsLh5f1owJU0aGah1pz3ssRrOSYR04QKr5_CoZazkbTDjk92
 DHdV3KCKVsXXo0hvAdfMqO.citeHlVvmDZto9Jvj2PVqBQx8XHzldBGBXd3ZSQ4yG0nFnfzeJUo.
 ha7d84AqKJ1wvRowgHzDWwGGwWAtmnwcxzUt.8r7YjTYm1keCTVKEJeyClF37QQv6U5OkO6IoR5q
 7yDcF83re2LfK35c85A.emg8Ng3qpWKSCIViW2GBqrzP5z6HH_NSwu.vPnyGUcVk6snjRozFkjG5
 TN43guIvR_RsJOP4wBJtYCUku_cdlYimyH8tVs_e.iHzWM7mrWT6sQwhiu2bSI5RW8G61KEygBue
 rZQG0J_dVUdrDByhaXkPE6y9fKLD038abIbRKiVTaqM1_CE47CKsmdr3mGGEIUAlWWyp8Oq3tThF
 nrcejJ62fbmDgWs_DMxaNb.GSD.3UCqFeP72YbERBxhVSWDd5RJ6dFwv4VPlhI.8gdZXPnHAT6VD
 yGX8QZi1OF3iFm4xBjcQydTi.Ac_rd2ZnKZvSxq6cP09hB6fzKtTXtHzViGJxgLluYR7u9E4Q9QS
 e9eBmQgO26QBDQxqA8It0ZRYEBSt2a3e2ts9.4ZYpv3i7bnwmVjAhGqBtmpdxjk.171zgWMqCzW4
 FXK6yITcPuxid9ESk.QV0MV2zQD_tdbGB77VrCB6Sn7exBwJCg7LPAK3NN5h8uAlQjl5LyauAeyT
 zk1fysr.7Z.eYrHgJ.LI3ZW.Ew2EYyFNJpTbcT.DGBv7p4B3ma7n3pbLYbtUdoLGpBnQ1o0qLMpe
 Nu.imlxP8Z_X2PImPWKH6bPt6Iwp.nupWkVJ0kYS2Kq73rA3jOjfr0NXRjvfPk7GnYEztUmiZDSo
 JP22UzKUrDE.qctdwUy.g3S6t81hcatRLPt2x1GZLKK7rAM5jCFpRwi4hDWZQE7tRZGSjiLIt8H2
 6MCF8CxZXnpLEgivV4RRw4gRWW_JPNHcp8Bhx7YivwJFbnBYmc2BUuITR1VBWo.1RBDCRma_.zgd
 3KIuTKpBZ3sZEwtD0qLGmVZk1eLNVDl_aPitugeI4qat_veRLH1eA4xQai8hNAkLMjqCI.buzHEY
 SfkTKyG1RRgj9Zw97mnM.gdTAZsFfCRi4gm5XvrE0G6.K7hcWmwKJ9j4VOCn6QoA6R.4EbvisqTz
 ra_p7oGmZ61PMzMWCWPtjHDwUh7oOjmevTI3DXE2JUKnMQbkL6a8eiLlyw_dagzemYuQuUJ8-
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-trivial@nongnu.org,
	qemu-stable@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v3] xen/pass-through: don't create needless register group
Date: Wed, 29 Jun 2022 02:04:05 -0400
Message-Id: <c76dff6369ccf2256bd9eed5141da1db767293d2.1656480662.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <c76dff6369ccf2256bd9eed5141da1db767293d2.1656480662.git.brchuckz.ref@aol.com>

Currently we are creating a register group for the Intel IGD OpRegion
for every device we pass through, but the XEN_PCI_INTEL_OPREGION
register group is only valid for an Intel IGD. Add a check to make
sure the device is an Intel IGD and a check that the administrator has
enabled gfx_passthru in the xl domain configuration. Require both checks
to be true before creating the register group. Use the existing
is_igd_vga_passthrough() function to check for a graphics device from
any vendor and that the administrator enabled gfx_passthru in the xl
domain configuration, but further require that the vendor be Intel,
because only Intel IGD devices have an Intel OpRegion. These are the
same checks hvmloader and libxl do to determine if the Intel OpRegion
needs to be mapped into the guest's memory. Also, move the comment
about trapping 0xfc for the Intel OpRegion where it belongs after
applying this patch.

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
v2: * Move the comment to an appropriate place after applying this patch
    * Mention that the comment is moved in the commit message

v2 addresses the comment by Anthony Perard on the original
version of this patch.

v3: * Add Reviewed-By: Anthony Perard <anthony.perard@citrix.com>
    * Add qemu-stable@nongnu.org to recipients to indicate the patch
      may be suitable for backport to Qemu stable

Thank you, Anthony, for taking the time to review this patch.

 hw/xen/xen_pt_config_init.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index c5c4e943a8..cad4aeba84 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -2031,12 +2031,16 @@ void xen_pt_config_init(XenPCIPassthroughState *s, Error **errp)
             }
         }
 
-        /*
-         * By default we will trap up to 0x40 in the cfg space.
-         * If an intel device is pass through we need to trap 0xfc,
-         * therefore the size should be 0xff.
-         */
         if (xen_pt_emu_reg_grps[i].grp_id == XEN_PCI_INTEL_OPREGION) {
+            if (!is_igd_vga_passthrough(&s->real_device) ||
+                s->real_device.vendor_id != PCI_VENDOR_ID_INTEL) {
+                continue;
+            }
+            /*
+             * By default we will trap up to 0x40 in the cfg space.
+             * If an intel device is pass through we need to trap 0xfc,
+             * therefore the size should be 0xff.
+             */
             reg_grp_offset = XEN_PCI_INTEL_OPREGION;
         }
 
-- 
2.36.1


