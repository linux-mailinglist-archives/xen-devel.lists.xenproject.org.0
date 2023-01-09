Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 060696634D2
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 00:09:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474080.735004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF1Fu-0008I6-DO; Mon, 09 Jan 2023 23:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474080.735004; Mon, 09 Jan 2023 23:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF1Fu-0008En-8y; Mon, 09 Jan 2023 23:08:38 +0000
Received: by outflank-mailman (input) for mailman id 474080;
 Mon, 09 Jan 2023 23:08:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=szyx=5G=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pF1Fs-0008EZ-Aa
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 23:08:36 +0000
Received: from sonic313-20.consmr.mail.gq1.yahoo.com
 (sonic313-20.consmr.mail.gq1.yahoo.com [98.137.65.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 897301bb-9072-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 00:08:34 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.gq1.yahoo.com with HTTP; Mon, 9 Jan 2023 23:08:31 +0000
Received: by hermes--production-ne1-7b69748c4d-bgkrh (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 21a3ec8339abfccbadeaea4f5ef812e7; 
 Mon, 09 Jan 2023 23:08:29 +0000 (UTC)
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
X-Inumbo-ID: 897301bb-9072-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673305711; bh=PUsS/L6kSgEs9TSDYOSdibVZnoomFtUQ/2FTOn4ShZk=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=elXzfvBDLs+x3PQygRw4UOuVqtKHJNztSmeANXFZPKbkjXODD9HVpM6UngsfZNCsUNy2JDgYBHu+ln6Crtg2AcIwICBkBig4MOQJgkIIALddShN1H8ppOWXhxpZFtNqAuktS00wFZqfg6lJ6O7PfrQUbnQy0ZmqYChoK6Pm/JDcuDg8YuX85J6rdPWZxmc4dFbvcBTZ8lNd98XtbK9IBE9yBkNvF1HtzZ7S1SL46zDEXLUHwWJPNfgXiTkS5gbbxVINtGupzdxS50bsCoBeI//O5rV9YHJX+IKfI4jk4NELWBvL+SQWSxj+i/SA3aO3s1dV/gFfSo1b5xBUMVvwpEg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673305711; bh=Du1eQd5e3lE/n5cyxqbZF1SqsJq9/TIrud4RmL1t+rv=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=EqV1L9DzWBpmfjNT6DFmkvoslb9Tg0hh8943F8fvkbDYhCgCHBpJqoQVumBZeY08ibePhnHlkXpveZRSrdMUqytQo4u9kfYqyZ4+ckXTdRhBMZv7gbcYA4SVCYJzBsWUZrnkJqGHd6LaUdQljLqlh2ca1JDIcwOebu/Q4QCMXuclPnkF3S/gfpmaGRd47J7SkG26zqaQs1o0fFU4LOtcyjB+qFZU4ihv2pYSF+teGpMfou11wxdiAS3urJWtN5XJDa2ihQFKWPTaP7N/OnZLYjGVSxtdtH1+jBssGCcUyUE5/mA2qT3gnDHnEU2swYrLfP09hCiITR5uyu9QWabHzw==
X-YMail-OSG: PJkcDlwVM1lwBDfcA1m84Ixzd3yJi0Uf9wXfCxi14xWsP7d2Dz_7xD4xwfXISN0
 S4FRMFHbwmhIgyW8dmdIzZoWOsKWjLgoF26iGIv8uIDAfyJvT1rFijVrMyqxzUy5akZQJUkz9Fw0
 HCaX84s2BoEsxvktlpclY_yQ5h0JUyqRm4UCim69OvADBtF69i8Ab8cUEg6JUDTA6QqU_3JyEMWB
 Zs3v48oGLjN72Ais3RueIiHIVLjJZ3LYIE6Ekv_jUimru4MItuEzesvjXWCtFnHBTHS8QnXCa2Mt
 6MyniOP7xTFs6nrXWMdJBSOHjYKIIYlYI4iLRR7NwXDKQRq1MSLfDazgHluwHu1B.XrcdZTg6kbW
 nUVvV7KmS43Ut6hhA_pdqxx7O7HVOZU_8.On6FPb.sA4OpM1YPV.8LNMmvGKIIv25KGoPBTjOCw0
 Hhf5aAFSYxXr2.dLa6Ibdl5tCW4IRpnl.Wr_Uj69kG561wt_ZpuvMgwx.t4iz5kj9w8nY8lMB_sh
 7ehNLAskNXHSfN7.vbPVIP4Nf6P6xvoBHUkyY8RrmWOm8uZz0IXmTm5dk37fE.M8RMreIizdqhYA
 8wmnK.xMHeuQqWTp6fySym01Oi95JDpuRyGzB5sUVkV7CbFj.B_0oIkQuvyyvu714Gps1rPQ8ghE
 _Jp4XciK2Yd9LAkcBG2us9uscEWVU.dnKOnOIovxJjy.2RE4M5qKGqJY_owlS5Aov8Qn9gS2H_Gc
 6sMfwa1K0P_uIS00zid89Vz8EkSL_Pz9z84DQkGGaTxHIXTAWgdP10mprFJEedPpJK1klo4_ZOpq
 152jGan8ZavdZkAlnUSh8OcsU32EWsJZ3giSDVzIR9doWzfk1WG4Ds7poOWoYmYSwWPWqquP1p0u
 235z7EbNoLQNSoWKkcc9F1sbc9NwrQ9y.Z2Fl.FNKLi0tvy7gv70wEO10DBnxi5FIGjxFOVlwYuj
 U4m0kPQ5xMyxWJyIOk.SyXGqQZykyPO05HpBCe2qefOU.PC7hWAYIHUPesan24nndXEPjHrq7OSh
 5xq6bsijRSCjG3kUkBKvBrRwJslhnVQihmIO8Pf4M69MbR8qWYF0Oo6_v3SQdRym6nXSne0vcekx
 xn0DQFqdBWWNp1qY2zq5hJR33nq88w.xlyLsGeo95aw5Zmybm_BjKH8PF7kpbPcGP7LKEgJ44EZq
 vK06TfWuqMhOFc5C9vVQNgWF.6C2LP6Fx9ROsICTEwwNvbFedYHHfoUX1Fp_KWk0oWATok7Hi9wt
 TpCCR1WKnKZiFj.mdJ6V0EFtC7xuhySoRzISE3offXLCjfA3GUAyJz2kwaFi2_Ktx1QBDNqBM4OY
 LzSh40kEefxWiQKIeWgtJEIwlHHRtFVd3OQN8CAsKQNqzKrUo6iXweRhLtebWryw9SW72ZMDIZ0x
 qPQI80yamRENR5vvAbn9jc1ZB.2fT9pVrvkHekVkctLUnykNHZIK5zRzqn5t3KesTAAbagjFvGAj
 .sVXeSTT1p1CWJ_EaVxHi76Vu5.5SuD.QCMOHnZKhzYydG0QVA8hTMSzAv8.FrVFubj1zAsvzhc4
 Wv7evMcbCTkZVnQIKLUvfFiWUYcTATWbTYB72kTqwuiag34m9DTdF3TGv3usYpNCufF8L.PSXZbu
 YG7onspgwGcxqrBYJ72t_xZ07YyzgZX2ao1yl1U.dcUkbbHYPdtr.ThkapBpFfuTLoxxfqU70ug2
 cHmSgF9Ftgxb8tXIQsWjGJFt8F5pZJukq8h3ymGMywD35Ga1SFcxNLjwDmuZufEXJfsm4qlF_8gy
 FMZTnw80uNNLhAKM0XqaZpO2LuFC5JicviG0wilgsRH9kepIKWlwy3JqfUJtk2Ppsvqei0yumIhk
 ixUKrFiSOAEDyutmFkY6_VHIDLSoiC6CWmwyB5cYSPLLeL0oPpg0JBiU8lEi.PTkvvrndoMMkcNT
 FKNq3xtVB9mbkLGjx8sAacZ2EKKgW7CWr00ZiKJ4i1HAr07bBOr3_XHixAPdjvatOjV2v7gZx0Ck
 aZFUySehhNN1lNz5X8EswtAZFZq5T2lH9HLQ2S4i75t4Q2cNs7ODtY.g3jKIMDhqLn4A9_yKNiGJ
 XMeJayOJhqZPcG5XrpWz4z9UXG58tS9o_Ya_Dtfa.34.FheRV02vFB6U5PxAmgzQDh8uiUwNSxag
 oaut6Sy1dy9cuOPNcK6SsGMswTpB5v9zuBBiHSObxx9i.GtyqTuPLrMU5Jvv4un9CeKPy
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: anthony.perard@citrix.com
Cc: xen-devel@lists.xenproject.org,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	qemu-devel@nongnu.org
Subject: [XEN PATCH 1/3] libxl/dm: Use "pc" machine type for Intel IGD passthrough
Date: Mon,  9 Jan 2023 18:08:11 -0500
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


