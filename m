Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA8555F5FD
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 08:05:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357539.586150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6QpZ-0005cQ-9y; Wed, 29 Jun 2022 06:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357539.586150; Wed, 29 Jun 2022 06:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6QpZ-0005ZY-6p; Wed, 29 Jun 2022 06:05:41 +0000
Received: by outflank-mailman (input) for mailman id 357539;
 Wed, 29 Jun 2022 06:05:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=los1=XE=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1o6QpX-0005ZE-JU
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 06:05:39 +0000
Received: from sonic312-25.consmr.mail.gq1.yahoo.com
 (sonic312-25.consmr.mail.gq1.yahoo.com [98.137.69.206])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e6d6dfc-f771-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 08:05:38 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.gq1.yahoo.com with HTTP; Wed, 29 Jun 2022 06:05:35 +0000
Received: by hermes--production-bf1-58957fb66f-svnl5 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 16e4bc4b8b559d9c3d23f506152de31d; 
 Wed, 29 Jun 2022 06:05:30 +0000 (UTC)
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
X-Inumbo-ID: 7e6d6dfc-f771-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1656482735; bh=sQSX+TX/QbDZPGUjoGyYhLhqwOe1AyUdSWH+3ieV12M=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=svSFRLj1PPLi4urn5ja/BSs7/aB6Feg146nCTegsev1+nhQpkyWtPDGPIGhnoadzv7Cbgsv1Znt1Gn532veFPmEyxZz7wnKRG+Wm0OnsFiGqBBSj15gm2gnZ0hqAFfmQYGwhSmgRsUoJ0Zx5AiT728o3Bmq2sD2/D4PAOPEktWUh+FJ6kEasqfWjq31wOUtohWCnxwpAYrq/t4i+3rv7Le5EQ1EzjLjAjsL8VwHn/pQxZTOMFluVuhpBuXi4tgIsllV4bZhNYI1e3aEzP0Ki0eDuSnxrSSj6CAGC2VPRAfTZZtNmmjLv8EbvmcVYQVZ2PrgGdfqaouxC0oB8tCgWMA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1656482735; bh=238Ph/3RkYD0NY9cn2ZTq4/1RVhcYkzTiR8z9a1/vSX=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=bwu9wVEJNTFXRikFhfyNGp1khYOgNNaQswo9G35Nh/dxDp+qfw7C32gCyKfXKpOTNyUSHzffn1Nz4zummsFDl7JqGsq3OA1gMffuDAmh7magl/9QSNb5hzsTIzjBoEOuV86/lGan95hTzJN7QlSwuzEc14tbZ2aKmKDqmK9prdKosLyozHSiYHBIRYm5FytdpX/8GpmEULR8wIeh8+7XAyIN4SsBQXwy7snZ+z8PaRdoc3UQiiCxEyqmDo2YrROSBSl1sLuVLJSqkifO8GNKyj51BbbstHiODxW/5I/rMFvpfx/5nY9J/WXhbfoVqjejOULpJ+wPfl/txJPzfndgBw==
X-YMail-OSG: cH5_zLMVM1maR3svwhItRtiDA_O5NPOSlhMZF00jWo9jYdHPab577P5jLabzly.
 DIDRozQKl3JVxow8Thb8bZsIC0ZeETb_JRjrCqboZpLBSOEdYGGlZJDaWHN71.hlPiVw2eXfqtFf
 KcXNslUnHbndZtiOxDH1LF23qhcv_or90x801KIFEissVXkIp1tnCIr2qdMYYvVkxTbWFaeJnYn0
 mE6W4TSh2GdCTLn4FW8nsYJyarav7nfnd4p6Ll5T9cx355Fx3bE4QRFsEhdn0BiMaz3XxUDKaZRs
 JfrUesI5J1sVgddj2xurpSxiIna16ROnNF0nAYtplllY5Zvs9RR.6OKrsPljsB3NiWM7ws0muitO
 NpKePAnskgYwuo1RV4a_a7oPlVB7OE7HSQyzxEhX148blUcHatOFHL7ter8IHAw1pjwx4qcR9i_f
 SLE8YFjGaBR_NrTTvGgfxhksklsG3G3HCXYHsvBfZ6wJdWmxMIu0V4bKoOCZVFQh1hwgKLW14gsh
 15r5g0o2SZePP4bJMdoNUQZe5USeKGL9hbUzSAMnfaAmAnLJY.9p__Yqi5L6pMWYRKpPrCK1hCwC
 owqVXYLwQG0F_i.R5JRNjb7YDU6eo7LcfxnkEw7D4gTiRY7EFS7pdOxuCN97v1ugYr24ssmP94.J
 wbLvf._CAb1iWwrYHLTTgTgEzrBenZ1Rqo0tk0LGAYPLMgdModRQhqHNqi6MzIe8DKXne.DePmEr
 VnXwN7bZaysRr6a1jBjTNmZ0mqvGB4LIwqC7mChDM4sWm3OIW7.RsLMGepumBRA9eIiaC7d5Wdyv
 jAcwo0Q9dWnKLtpx48IFBlC0B9L559otp9lRB0.8qf6CGcnNWkKCi6Vr2687jrlD4zoi3HSELNlW
 e4XDfk3RrBjo3sKPF7CMbUp1d81JJDte.7ETO4j1zUGjRJTiycCpOW99DYGq6kyuN2O6Ad9T_rKs
 az2DMYczGEuzfRy0ahMz7lC.1LlfhXu5yVMV8rLYa0CIGv558qqzMXrZy_sbeKceh1hrjY6fu.kN
 sp31.I4SKhj5sBIdYms5bvKmapZKf0EH3H4WAPUaXil.FHsdUsrmL8r_o5yAykqk4cX195oOj3IG
 .dNXYoMbCZpbs.RONsQufOOs0oreoSsjP90ukMYVrZw5sj_p2gBWpsuuWAWjDKUqAV1IWCSRrJge
 6IZaySP95UUERVikk8EFlrH45k70pTedjT1BbngWpHd.YcVIxU5hvrd73jOkfW6EedGpCzalag7G
 U.t7TX.iCznJ41Q4ix8GzxmBts8IzK9rh6o3xrGr6vXHzEft_MRLH2.MRpuybOxxofcrWtzE1PQf
 EJGW44HjKIr8bVr4odqEo9XeZtRjnH3JpKECV9JjXNs0uFFLe6rxxAFP.HEtUrPbC1N814JNLbHP
 qnVPlfOoJeXp7qqiqFAgaepY_02nTRjCQDBQQuVH6E4F29rLXRdywjM9lz2H9qgtX7.frSGGSIwq
 XIs5US4uv92v4N_Sgg7NlonAktJlBgKUX97uEtgv_EJlAI4bZPkfIWVHOaUUEZeOCjFkybvhBjVL
 Ns3gmPSwjNfJArtx4g5hDbbOoh5A7pfAuJ1qD.a.U5i8nloCESfznx9tMVH2qwSZozzvl0q3eUf3
 Va2kutrs..B7mKOJ8fyRnnd0K8hR5knWSXWFv7xRTVngakgL1Yfb5KjkrrwL1B2w6vsis9pxfsTc
 HN1.5yhHX9pWswN74GJ6mOQEd5jLeldIyH2Op61lzx0g2wq7Slv6S8mKlh4K4vA4__sqXxXC5s2E
 EtkjDKMePmEqZOxbItfdp0Nzbm.kz1uInF4rJ5bYLIFH0SNr4N_tZ4Ibm6RKYibaza5.3jEoM6fM
 wc64GeSFQ6A8AnjhAxyO_dSc598mD8tWjBcUl7UzfYn6RlPF4WXHItaen4gKqzCj1Pozpwc_pB4I
 RhdEVTXPGL8rdtWWTiz5..K4UWAvvQdsZGu5efG9cAln5eK9Vc5r0ZHWM0VxWz0j1Ytm2t3KbkSn
 H3YuaAs4H_y9Qpgt37qlsmWsJR._AK4lRi1ZT2mvzkWdJAc.iM44sSa_K3VcKxEG_B9MVLrGsyBU
 IG7PTI54AKU9.lNgls9rFv_OudkObt1schFK0H3RTJj3edS2dCGnttoTjYcwwkJwr3pD5JZjYC8w
 clfsswAvpEyi4huHNoIxQ6mBeXl7I7ME28EV_gk5ZAZZtK8QfI8pWawtsP1kXXkkgctDGA6ERoc8
 -
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-trivial@nongnu.org,
	qemu-stable@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v3] xen/pass-through: merge emulated bits correctly
Date: Wed, 29 Jun 2022 02:05:23 -0400
Message-Id: <5cd07587898cac43bf4b7a52489c380a44cab652.1656480662.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <5cd07587898cac43bf4b7a52489c380a44cab652.1656480662.git.brchuckz.ref@aol.com>

In xen_pt_config_reg_init(), there is an error in the merging of the
emulated data with the host value. With the current Qemu, instead of
merging the emulated bits with the host bits as defined by emu_mask,
the emulated bits are merged with the host bits as defined by the
inverse of emu_mask. In some cases, depending on the data in the
registers on the host, the way the registers are setup, and the
initial values of the emulated bits, the end result will be that
the register is initialized with the wrong value.

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
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
v2: Edit the commit message to more accurately describe the cause
of the error.

v3: * Add Reviewed-By: Anthony Perard <anthony.perard@citrix.com>
    * Add qemu-stable@nongnu.org to recipients to indicate the patch
      may be suitable for backport to Qemu stable

Thank you, Anthony, for taking the time to review this patch.

 hw/xen/xen_pt_config_init.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index cad4aeba84..21839a3c98 100644
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


