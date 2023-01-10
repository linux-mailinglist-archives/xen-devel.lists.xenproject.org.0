Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17540663A04
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 08:32:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474310.735420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF97Z-0005VA-UY; Tue, 10 Jan 2023 07:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474310.735420; Tue, 10 Jan 2023 07:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF97Z-0005PV-Ou; Tue, 10 Jan 2023 07:32:33 +0000
Received: by outflank-mailman (input) for mailman id 474310;
 Tue, 10 Jan 2023 07:32:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tiyo=5H=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pF97X-0005Lt-Rx
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 07:32:32 +0000
Received: from sonic314-21.consmr.mail.gq1.yahoo.com
 (sonic314-21.consmr.mail.gq1.yahoo.com [98.137.69.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eee044ef-90b8-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 08:32:29 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Tue, 10 Jan 2023 07:32:26 +0000
Received: by hermes--production-ne1-7b69748c4d-bxfkx (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 00995f78f0d4fd001b9b8f1699ee7ed7; 
 Tue, 10 Jan 2023 07:32:22 +0000 (UTC)
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
X-Inumbo-ID: eee044ef-90b8-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673335946; bh=MlYqfxn4vwPKUpewBFfsPqn045LoqxLP6nhibRvkmMQ=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=E/1qai2PiOIqbUTF+XBOHFQuXUBMbVzW1ho8Ij2gjZ27xRD1dwjXCtNrNQ4E0unkmGIUM3s8WmahRg0TmTsyf4yQMF2t1SpFRc3gh5fUOS6Mijgvqp4JcPgWC/3Uw/0puNm2BNIrF26KL/OwkwKFiwnWU29U9Or0WK1uj75QiHplwK8ho9cMZiFmmi5Jko0yavTTPJa3jHOY3KFr5sZoyLo2LY4CH4jllmRO0630p210u+u2NSTbj7atbAJAM0dseG9/9MGkWMRqwYhC37K4NB7tUvweCDC/cKsQ5Kif53rXB/aQIV5VV+B+iidUvyby/jUEV/l3ysCP3mMmsbaf3Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673335946; bh=LQMlvZQo4JgVkUeUOy2EtUHA3/Ts7yg0JQfMLc1ODBG=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=beDqLG/dZStPkhBKkGVBGhI6zDoDXQyqQKA8cmNBIWiB9Omm6MFO/BIE63xINC/+2lowa2lyXFhXBVaR9pvEm45TmpGaZJlgdonwD4LggH3kdzy+ji5+M+keoV0WS0ABPIX3YR79EUq4M+Y//skWtGKY+WDiaQfImZMkUhYE4/u9U+GJImKG+0gCm8RpdraoON62pKwrfgm9j/rf/roST/Z5BypVOR2kuzaxeIaMjglqaZyoHifWYf68zNB9bDvbSSI0I4wUVy3aWM6BFF6/TRRvbX7PlMQHDv/7KJRS90ZR1J8IaSW4k+ns0Qo6uTw9NqRDtQ+3rdYPTkZ3mQjQMA==
X-YMail-OSG: NoXoiVwVM1kCuc.PBP0ELv0IIHyBv1HK6yJ2Lb_Fz4clgpQN0YG76Zddmac7_wE
 gpkPS9B_wOnXL8pAzvaCN.zNUKJP8cB6x0aW9l1HF1isRiT8qqQnue2kFc_lRJ5mTteg.y48E9Aq
 GYBT29zIY7VV7kW1o32BWktJpw7WeCla6YHPvbgh.2Nn5ZM0GDr3ndaVJmE0vWlHLJrgfcuYv0.L
 HsU2SKoU400M5oJFNdlYhMHTyroMhWjsnYeHbM1sct8bahMzUkcyaYAZmUdYkwukPMo0svsgg6AS
 RUbq_sWRLmRSixhUP1MwuIzniBITSnImNcyCbtt_roM9ghP3bStEolgGKXTZvpztFPMo8UOaXM7Y
 E.5StQWhJzLDg8Oip0zZG6bH3XJ8j3ECh07NkVAjkuDxR72Nt4KkTXrd2YypaW4N5lzi5uMr5F3a
 OoZy7Qn.PZHHdPX_6vq6mnRz1tNe05lm8TBU.OcUCnonIpaztC8aXIHKgmIQA2Xiw8iVQLNtM9C2
 28zX41nMJXB.JNbPJ94Q6YGq.D_U5HyBArYs63x8M3FyIohVkSiAbWJrQ4jEzO.cb.UESZM5LfrX
 alBUsclrwrmJRV1LvSJwVyglIhmMrt04YUF0LOcdtGrvX9cdqGFO4QuTVjdBTcXn7RgstJjwVfSB
 kiJd7r6a2lWUDfgar6s7YVYwHJ0pk20R0zeVUnuwTcQsI7rSu4xS0VL2JI00vpPXsLpXoKGbKPVn
 q_1zKTpQfq9n3D1ES9HSQD_3XuEgI3Upj123ZaCRgV1mrpalLR9NBfsUPUYSfA.L8Cl_aGa8uGxc
 OMAPtIFDY9efAPC3Zp_HlHvWmW78HCxg4DK07Q7HvLS_BHcMm_ci3zhgXZrrle7XpagyMYLOtOsx
 m18kjlhJSRhPB30I8i8ENOKx7j9HoarE2vq_Xl_11S4LJObtjJhuoJpIa3k19BzJqLV9tLLHNsMx
 i_IPHj3oQzhW3Jf8xf0LNnk8JdIhEU5w07FRDDM_6VimJPwqo3E_HWpTk3yDvPQWQ.7lb0pLJlvt
 0sAjTrep.pQn.giv_Hmd89zC72hk_4hZ9af9oaVeyQ8dXuctLkcAQRR5x51dlSU2vPY2uPSZNt5.
 B2kDGecbM9epAIDdLDgrDAC8haTbZn4vyYW_zrhYDyCC3VwxmiX4Fi2V6PQ.l2gXDH5x80V7NM1P
 3hrsXFqUgFtu_cOYiQ3a3JbIIb59LZQydW0QQ4CwQ2umXq8.0.EsR4ij1mm.2hUR9I.cHSo.IOzF
 rOa.dFPnYnhStCVBnG1MLhouPMisnYTuBLcKcrTy0yzYRRaoBpq8dRwTOXze4njJm2wSiDxrzSfX
 r8qk_TyNN1kB6h.cdkIwMxzFbtQF7bKp4xNdk_ECLFwq2lUZETLfTO89K1Avi1TxVGPagXHkJKLv
 _UpNNamE48S7i58YRPeOdwCzxm831xnjrTsBF8xz5s0VSxx8NM5dV9TDI16131NsYBPY6RUeW4.b
 eRWDNK96BUZ1R5lYze7x2F3sG7OuzXCIWbuvmzbbHBOr9lbWbdrxugDIj08qoFbFdB_38mZvxhYz
 93vUjhUXEosfadOst79puBRaSOm0pTTNXe2myi.RbO2jIPfF9upgFPkSUQljgmNCEYBBFFsBTrtY
 so96vfCP71FeP5c6kevt0_FhRjUCRjGJEcU1rzxlI.jaCo6Oj6LiGF_c5s9647dm9PAVHWrePYH4
 oNTV98kNV1CsB76YWAI8bS1Q1oLiqZVPjxjX8aCm2yn4RXc82SqNJwe2n9Z.1F2EHQ.HCUcfQmNE
 fK5Bsw3_twAjydKfRgpHWCnCeA.eKLDwF9_KR1RP15av78qzqgq8rRZkFoTONYn6fEXJoMja8O4C
 ItrN.NM1y72uYwIwiHH84SGjP.V0kVyYPLIrnyOngIyX5Fe3gUIaZZ4XExVwQ2KcWLR4GHiXyicB
 TmvoTVH04sRXtrq3SXEjl4khM1tyz0xXpXONjoxQmD.JXsRgy01l8zLeowf32n7ACsGCn8nMc4LB
 cJlSgeKNgzjTtJbidSO5tuGBlp2qARmzPYLcVavbUL3noLUPDsdEuzAYzmkPcS37ANV0hAcFsRtH
 KJVt3WeZoDSM.MghiRdv01.NZRsLVtO148we1u6dT12SdC9QmMz8B0zza8ht383rutR9W2eY_WWK
 s2xAYRSQp7AciLUKiNHfO9Vpe6hXALoz5N3Kh2L51YNzKvGVUeZAsuTGjd5kHt7CSqyy4arVRclg
 -
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: anthony.perard@citrix.com
Cc: xen-devel@lists.xenproject.org,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	qemu-devel@nongnu.org
Subject: [XEN PATCH v2 1/3] libxl/dm: Use "pc" machine type for Intel IGD passthrough
Date: Tue, 10 Jan 2023 02:32:02 -0500
Message-Id: <a38db9a2b829add5612e1bce44ae54ecd96e96b7.1673300848.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1673300848.git.brchuckz@aol.com>
References: <cover.1673300848.git.brchuckz@aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The default qemu upstream "xenfv" machine type that is used when an HVM
guest is configured for Intel IGD passthrough assigns slot 2 to the
xen platform pci device. It is a requirement that slot 2 be assigned to
the Intel IGD when it is passed through as the primary graphics adapter.
Using the "pc" machine type instead of the "xenfv" machine type in that
case makes it possible for qemu upstream to assign slot 2 to the IGD.

Using the qemu "pc" machine and adding the xen platform device on the
qemu command line instead of using the qemu "xenfv" machine which
automatically adds the xen platform device earlier in the guest creation
process does come with some degredation of startup performance: startup
is slower and some vga drivers in use during early boot are unable to
display the screen at the native resolution of the monitor, but once
the guest operating system (Windows or Linux) is fully loaded, there
is no noticeable difference in the performance of the guest when using
the "pc" machine type instead of the "xenfv" machine type.

With this patch, libxl continues to use default "xenfv" machine type
with the default settings of xen_platform_pci enabled and igd
gfx_passthru disabled. The patch only affects machines configured with
gfx_passthru enabled.

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
Reviewers might find this patch easier to review by looking at the
resulting code in the patched file instead of looking at the diff because
it is hard to follow the logical flow of the resulting code in the diff
because the patch moves the check for igd gfx_passthru before the check
for disabling the xen platform device. That change was made because it
results in a more simplified logical flow in the resulting code.

v2: No changes to this patch since v1

 tools/libs/light/libxl_dm.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index fc264a3a13..2048815611 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1809,7 +1809,26 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
             flexarray_append(dm_args, b_info->extra_pv[i]);
         break;
     case LIBXL_DOMAIN_TYPE_HVM:
-        if (!libxl_defbool_val(b_info->u.hvm.xen_platform_pci)) {
+        if (libxl_defbool_val(b_info->u.hvm.gfx_passthru)) {
+            enum libxl_gfx_passthru_kind gfx_passthru_kind =
+                            libxl__detect_gfx_passthru_kind(gc, guest_config);
+            switch (gfx_passthru_kind) {
+            case LIBXL_GFX_PASSTHRU_KIND_IGD:
+                /*
+                 * Using the machine "pc" because with the default machine "xenfv"
+                 * the xen-platform device will be assigned to slot 2, but with
+                 * GFX_PASSTHRU_KIND_IGD, slot 2 needs to be reserved for the Intel IGD.
+                 */
+                machinearg = libxl__strdup(gc, "pc,accel=xen,suppress-vmdesc=on,igd-passthru=on");
+                break;
+            case LIBXL_GFX_PASSTHRU_KIND_DEFAULT:
+                LOGD(ERROR, guest_domid, "unable to detect required gfx_passthru_kind");
+                return ERROR_FAIL;
+            default:
+                LOGD(ERROR, guest_domid, "invalid value for gfx_passthru_kind");
+                return ERROR_INVAL;
+            }
+        } else if (!libxl_defbool_val(b_info->u.hvm.xen_platform_pci)) {
             /* Switching here to the machine "pc" which does not add
              * the xen-platform device instead of the default "xenfv" machine.
              */
@@ -1831,22 +1850,6 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
             }
         }
 
-        if (libxl_defbool_val(b_info->u.hvm.gfx_passthru)) {
-            enum libxl_gfx_passthru_kind gfx_passthru_kind =
-                            libxl__detect_gfx_passthru_kind(gc, guest_config);
-            switch (gfx_passthru_kind) {
-            case LIBXL_GFX_PASSTHRU_KIND_IGD:
-                machinearg = GCSPRINTF("%s,igd-passthru=on", machinearg);
-                break;
-            case LIBXL_GFX_PASSTHRU_KIND_DEFAULT:
-                LOGD(ERROR, guest_domid, "unable to detect required gfx_passthru_kind");
-                return ERROR_FAIL;
-            default:
-                LOGD(ERROR, guest_domid, "invalid value for gfx_passthru_kind");
-                return ERROR_INVAL;
-            }
-        }
-
         flexarray_append(dm_args, machinearg);
         for (i = 0; b_info->extra_hvm && b_info->extra_hvm[i] != NULL; i++)
             flexarray_append(dm_args, b_info->extra_hvm[i]);
-- 
2.39.0


