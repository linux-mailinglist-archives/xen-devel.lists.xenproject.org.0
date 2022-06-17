Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E062B54FD7A
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 21:26:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351543.578204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2HaS-0000n0-R4; Fri, 17 Jun 2022 19:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351543.578204; Fri, 17 Jun 2022 19:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2HaS-0000jm-Nc; Fri, 17 Jun 2022 19:24:56 +0000
Received: by outflank-mailman (input) for mailman id 351543;
 Fri, 17 Jun 2022 19:24:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JiXX=WY=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1o2HaR-0000jg-1N
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 19:24:55 +0000
Received: from sonic305-20.consmr.mail.gq1.yahoo.com
 (sonic305-20.consmr.mail.gq1.yahoo.com [98.137.64.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28be5728-ee73-11ec-b725-ed86ccbb4733;
 Fri, 17 Jun 2022 21:24:53 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.gq1.yahoo.com with HTTP; Fri, 17 Jun 2022 19:24:50 +0000
Received: by hermes--canary-production-ne1-6b56569f5b-5gxzn (Yahoo Inc. Hermes
 SMTP Server) with ESMTPA ID ea48c22c787e8e2f80b2bf48244f4fa4; 
 Fri, 17 Jun 2022 19:13:45 +0000 (UTC)
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
X-Inumbo-ID: 28be5728-ee73-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1655493890; bh=WF5uiJ+8knZteM5nBC4zDmv2r5H6wr0fs8exKYDIyxI=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=TGvB3WDU0Y4d143FSsbQFa/GiFU//0FPjYlHdumE6Oj+RzdADTRRB6QiXbbdnSdMb39hMtdK+oQr1z2LVJjWRyFHbg/0+1Q9auPcfeVaDn2Yiqpg/u3UWTNLPJ/A3OWwQt9Q0JE7k6DlCyvonsqTzYV83cLxCYUaNSUwI6OmgkXm0JXdKZoxaNe4Tl/JyEl/dAlhC8ZsJQglGMg7V1Brqz+TLGoQl5zYd/w+jYa0wFVnn4M7i1LiB8zJPmRIEV2TxtPcyjOiiDedOKfepgXQznu7pIPNmrmHrxNwXMwGgQzkscz0UQzO/ZkG7EJtDbh7KneiKQgBbAGyuZjUarymyg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1655493890; bh=sF4XDapfaKBPJOHnorYO2fVJRm9eFqUYWkeVB5IWlAh=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=mAdqYzjK6WZgTfUO4EH+m4sb2a9MHPNUg7FeY8/Mu6mqwWST0iUNGekpZeTs1TcoDw8LwhUKWVm85Cf3bGJBbVnDR0Ss8sO0J0IMM7zr9LTkB9D0inY9CEOxAjUg/yu6faklLdsVCen0+Q85D3rJUr81rfhiXBN6D3rzuh7bq3GOyL9X9gi9e5CNVmoYU1ul8rMXmU5ZbTdQRpmkf9ZpGban0kH0kPK1+mnEpgXvIcJC96Za4xqro3s8w3FNO2uYGee64LHTsu2JJeems1RHP0YVf2jAYepj8/GXjQzBa0lHH9xOYV4pH8FMqkr5Af1FjWGQYcoBEzhKoffgS3FLxg==
X-YMail-OSG: wJz8EwAVM1k8OI7xhtX412g2HhPpI0kvnrWcFBT1CB1qD9oFuIl8uJOqoO1wvyx
 x.zCOpQhPIzD7i9cC23uf8F8omrVAO7WITc..PR6VvsWML_QL07ss1ENqn5OsQIp2zCXGCiMS8UM
 gCCv4_TWmrNR.CHirrNtj5hwNrbyYAAvksTLU8OFfwn.agJPg5ZDMiH3Y7LzTUCCmBw.s0YMH09G
 99FoQQwei9KdZ738OxdI.dnpBnwd4saDmJIFLH.L7zNDfsxp2tfVEYisyMjA3RScbDEPPJ4eo_pI
 oMf.Ijw7qFKUphSSgXpBepz8FdG8.SSmiFxhbL.d0ZEgkew9CYj9NogGDrl.rk0Wlu3C6UOpkEiy
 SeKSy.SR3usKGWungf0C96oUrGSKlVSkZsm02666EOmd9s1kcJXtZcDBHwR1xlR8WMZaixYMjWzD
 qlYjPLXDSTP7EK7EpUkFTNvO8qCpPRQ05Ic40gHw9kU17BPjz.EwjIE9Bf4ZmKuyTtpvfDUau5fL
 laTsDZJ7jSEvTmCw9Pe3MTKxKJoGadOAL7fhaKoNjxaRNB_GEow3tbvNWM0vz1sz2peHAAALebCp
 OnOfKZ0.4OoNoNu_Z3DzSlAl1FCWgZLlyknnbdQCFHWRQJBOymLKIbYirj.hJLgRQFnq.ziA9uJb
 p4kXcuun4VdY1qtuIR5cb6bYBujqdbgQACCLPC2_3Ii51sknS.B7GHwbuY735fe24eB6MtrCnp81
 2aA7J2Sq4OpHsndcXNAU7GMo2.0iaGrP6r.2EOYpqx2FhcP8sY.ikzbbBjnHfvNHDyNSh_fG5Cdm
 lNsaUyoNzPS2ObnAEqVgCSCV1CWPUUpURkkLJHjEufNTrhYqtMBG.GAjJFHCAR4z_FdVbEOS0uh_
 tNqaSJrfGPGTtY3T3.AlhLXrmjjNjzJ7mb_VvoDPce3naepL5FrsHdauBXt7kZ.cI1qaEvlVUGcu
 f99.Q.th80copPTMPCw7tpc7av5QtlZ01XKpoqsHEDP.E7M5SsDQcUbV0gsKJvmL6PnMyI73c1IE
 yj7Mc0AJpArdaFjJK3VLf19_XZLHFUAn88SEZGHp_IGGLJPu46eC6SDgDTGVrhfhHGmp6MDSAvwX
 A8l0knThJLvjyJG2VwzslvyPgTbGFdgN7AJvlmPsxFTNqRlgII0oxg3sHKHg31DUvPmO7lpTbyY0
 a2sc51ggCAFlbvUz1RRWEyEToZxcz_9YIlH20mdwQ5__bzewX0kcfGw9Uc6_jUIPzXq3S.DkAgKF
 rPoNbjMrzvTyPK642b2xjoGSe4rYQvargC0.oJSuTXakEAyWagX9qGQynx5IytiNP3AfbMwKgVdS
 BxAi8OS0XdjqBe6RfBXu2X13sgfWcl92H.q6qL7v7YICXEGkoaB1qbNWpberzLumTWnqqj45Ld2A
 K9_Qgpa2XGFL6VQB7UJcwfJeLGN3bDpXUEph4OQ06SG6J13T2CPSGKu08rPWzE0KJfolcVHLtfaN
 rTGUXDf..ka2.DCXF2ay7kdulGJaQaCDfiSdVVtXyFfL0Uy8064guVqy7lSV8vxZpt0M2KYJoW8I
 ZI8RntE9rhmiHHBm6xu5._DIUqV5xpXB83C0SjKuBKyEhWeojEujdcdRFipht1823GgcAF86Aar5
 bCZUR6UhqqJdaR0a6RXmvuTKTLH3OWPQKONjrg1urg..FzEFppC9DEoVD4QHkh8jIw8YwqsrujGD
 FbPc4Mm1wNBwTSKJDcfpZ1PTTMI8H.BV5Sce04DCtDawc4y3pUpzKpZLrzQIK5zBaJaniT.hMzdg
 5JEkRvE3aQ3WdLpv1z_CSUo0bAK4Z77ps5bfC1Zx4lV0fIk8FaDdniIOjzZd2u6G8o7zvsnaU.Nu
 S2gr1llaEBKTLMvtAcTZhwouvEZwM_YRwGAJdvFqB03pDDgTMvvwLUMQSHwQ3UkwAQCmL2OprHFv
 c65F_ahYyskMN5NbukbHFbYMYFIdBIKCO6oaJPPZCiWv7wILcv9VuhAaD3w7952.VRYBP4IcQ.0K
 71f3aNWpYQa18W1EFsrUUl06F5Y2hpmw0k0upuiDMgWOc1y32SdoljwmWcms4JoZw9XYct7XIBbF
 MCXsnvOtaGjTwRRhlBBmYJfiy.okodcQieDQT3aPwApCpivvNbQNZube1wXRyyLrxLJfOKgqS_O5
 hhyhmcFcEGl0dJC7YzjLlgga_9wgCyfuZLLIiQsAEx64wBRDFuXhggOowWLwisIh0Nmfwieej.fX
 Bfrwi
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-trivial@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v2] xen/pass-through: don't create needless register group
Date: Fri, 17 Jun 2022 15:13:33 -0400
Message-Id: <4d4b58473beb0565876687e9d8a53b76a7cf3fbb.1655490576.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <4d4b58473beb0565876687e9d8a53b76a7cf3fbb.1655490576.git.brchuckz.ref@aol.com>

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
---
v2: * Move the comment to an appropriate place after applying this patch
    * Mention that the comment is moved in the commit message

v2 addresses the comment by Anthony Perard on the original
version of this patch.

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


