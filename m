Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E84B26BA692
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 06:14:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509893.786588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcJSc-0006K9-LA; Wed, 15 Mar 2023 05:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509893.786588; Wed, 15 Mar 2023 05:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcJSc-0006Gq-Hg; Wed, 15 Mar 2023 05:14:02 +0000
Received: by outflank-mailman (input) for mailman id 509893;
 Wed, 15 Mar 2023 05:14:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=unbF=7H=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pcJSa-00061o-Jm
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 05:14:00 +0000
Received: from sonic315-8.consmr.mail.gq1.yahoo.com
 (sonic315-8.consmr.mail.gq1.yahoo.com [98.137.65.32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f3cad0c-c2f0-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 06:13:58 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.gq1.yahoo.com with HTTP; Wed, 15 Mar 2023 05:13:55 +0000
Received: by hermes--production-ne1-759c9b8c64-f7wvp (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 96a4225277b909cacfff2106b7580bc2; 
 Wed, 15 Mar 2023 05:13:52 +0000 (UTC)
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
X-Inumbo-ID: 2f3cad0c-c2f0-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1678857235; bh=Dvm0+j349dR++2RKACkaePAlEc9RP8c6kRaeARHbS0c=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=KtugQMHpl1GDXmWLhvIeiXStzBNKV07gFILGczba8cpuySr9DStKduPMQbgtTgmYi0ad6HrKgoGg72PLwyj9C6gjyI1lA64+T6J8bJqhvOIFtCYPa2fnHz+Y/JH/uD92wxu4cqj1uTx4+HBE0B7j974ScdP4IHQrZlOoWZv4sVQEU9RNMVYJ+HADi5f7X4qDFGPwbJWyLD0wj2onDNqis5e8PSw9Cc4YhOAi0SuhJEPfKX2FXpeM1vAuqsN+CYrmXqk2SHYJbzqVXVR2a8eZ7r5hxNjGKsw4C4O6Gb64MZcIvud6kQ5Bm4G7+V+J6qbz04LM+pjTSfT2QGr2JsTz0g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1678857235; bh=lakcgKceV7+sNyPhB709BIs8Fpptwv2jTTrLYiIaQj5=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=aKjVtvuFNnC7dZnMBWajr7pbanadmpFwSFIDaYbehtxX2+JCG9kLoPlmUMHtEGA7dyjOG7Dzb8T3AovemZaOtkL5L1LnawXYiAYVigBdszuShkeyhwcCVVl3/AmEu8b/IgZcVS2c0RbzjOmhGYT+oZ5D+bWownR3yWR/vwsnKWTXucpLbQlPKiMxrFJqJ/5il/jmp2O9JoEchVys4TBPQ/emAdCRnaxbQFsKtGiSUpBYK3xjjnSnd5HJLhKu8Z4lHmK8qrTZUUUwOnrTVvHfqefBrgJLXLKWT9L5dGWQ8j2FEhOpJN4ZpgYPOzHlIWJMxSN9IhzbtY1q+oMWmmY1uw==
X-YMail-OSG: zVdoTbMVM1loPPhTgc_WHr6exeMAHqDEUoYbqb.M6GCMd3DRTDwgGi5Y5I8IjP.
 5QA.Le_Ccvq8dAfMSxbdnFsZiPaKd2BwF929F1vnSukbFNAXvDjTNuUjxFFlKTIs_W.AlieqSjD9
 zOK8ZlNATBzPrcd.DJKu8Z_Y7.sXAiPQBTjhCHKBGct4p.3fpcfHAd_HblgQIgI.PKmr8Wy0V6k7
 CfAmeuywKvDKjwRf2M8KKt62Qg.ZfY1JdAJZ_kS74QD1ulm64kXIIxEIWMER9y_z64bFzZFP765p
 pSJtwiv.3HWGmZPPGUGO45KkFdkjua18Y6yHcU9ZEXkIcqSRJp5aR4Z0LNul.eLEaoUlo2Wy7ji9
 vOXgV312R35Bo4jBtO6sOfiSmcFtU7E2oGWbcWm.S3eEQhPu_vDcgw7de7tB3J9bbtXrPf6LjnZ8
 nv1KFVCG6Qi_5bLNqPMZhzr4P.pUtRFPcTAq.Ep9XtJOM93S5X2NvsB2k8CEHKF_CtdnwmKL3FPn
 9sIY6gWcPDNH5wRj73urAenpaZMJfTLma7ULZYnXvZsKllp_wRdTADK591sUknJz3lKV5jyGrqd6
 PmVlplUJrqMoGy99yaJvb7lIlnqYZ7h4OH9703q.enIF7IzJlsrFBl84DEB2aAVHZaAWxr.PXhTF
 X2UlyU5yJ6e_qt9IVSdZ0wzFtSjLe9cFaMG4NS22O7iSyFxF0N46rCazNHx5ic7N.vOkmi5jDNr1
 VBhhsm.fvjvWN4SXRXXKEb6u.zishr5EUAu8a3lyYOOvux5yqUlFw0MLZJgj3yZEQ5tgNF15tbSb
 1uHssjc8Hi6f28B00H5QpgGm0KA63SB2.asp0L4YvMikcJMHTXvvUpISaS7HsrG6EcYVW2WPYFNg
 66rEf_agmMWH_O7SyQxlC6_bPFK2ZI1k_5hJfNXtTvEFqqGlyWGrRaXOhQ47CbDtZdC4T_stQ6uo
 QU29LlHpsXeqwAMWZ5LpVFT3JDp95CZKcF9GixxX.wXmgrR5.KvXU1kr._1G63mGSQ60_Xv.RMt_
 hcA4zlZOTNtPZtSWt3ksGkN_x2WE1oy5dYBwkWHWwsYvss0hTT8JnLuyrQ9q5qta3DF.UJaOfQtw
 Jq0wO6sCly83fTpyIMUYonB2B6T1SjQZWrfnAuNdn36S3hJhPRBb5BkFtdaSs6eMm5M75mvcyC4B
 YQylVQ4O92lqbUbWJGscHgb0C4gZ0eA6ebVmaDx71XhrSppwcbsYYIJJ8Fg63eW7vhUeBY30ou1y
 Mpan63GOJmHGAl7nb5n68YYVzQMHZDU7Y5G9p1FOLce_USarP8jrfvCoTouBO4_4uJqnS0FEQEGC
 BI1xwAcbcKlaihOWkzXsnpOCbI2DQdxIeKQsFMlEVrovSUnCdDYPElVtazqRwRXf4d73sCxG6cbH
 dkeloA5huRJmLwFG_HV04kqp5918fd7p0PKBeAg0ipjUG5EgB_grJ9E7LJNToSy0EpK63jSjN6oE
 eE2Ze7sOmsnBeBTBcEnGC7EbB_.22IFwv8pS35AX2OmTN_h4QdfVXUDo1hx3iyan3Nup9An9eMeg
 _ERLtFapsFyPCiDOBtUFkm7Lq4_Dh1oDn7z29tg5a7hAsIcgiv1_zhUcAGoWfvL.Fi8l3Z5ZS2x1
 hkvnOG2uXQnb7G2aBDnINzQCOvkcg0keyXGD5JrtVCkUauhoAFhDZjwR2pBOYa5pyhPaA4FQ5fv7
 kxTUrrp7TNMr07YycoayYs03vnFo8L.s.igcWl6fGoJkLHNaJsdZQejZubKO7mvID6vxu3bMf71e
 EN7.UHmi98AtB0i7Fgyt2YbWXVgrOVJebMY5kNd2y7T3Vv7vlsVN6gjZdiDPALkFPRjNBWCl3ND7
 SQlBaHygn6C3BBo00LXEsNSQ75p9OxWoF_n7sKAM0fHBNOzQSQZowF.BPb5.TY4X_UrssKP.qnXE
 7hqfV95ln_1tCSKmNXawyZaoZtqLZaC1jZ72NAKPP5HCMGMQ57YD6R0sHN2lmw7zMbNAhYTKYGx8
 ZhrTAQM.5z7okRMdGGL.DRiQ3J3AmCjTOqup7x5l8PPOi3Hws77SFlEtaQtZpZ1muTH0XMtQ4jLP
 oZuh4u55fHTtFkYk3K7M2nkDYBzOEPcV.ZFEYzxhCqls5hVj1eKyQR6_s4biSIkkc.1TWQQ.Zb9.
 DDQbWH65WD9JngH_nnTce2drPfhFG9ZK8dK1M3lU.oVmoVMlj6zykfT7W2Ec3F0v1p96nGvGumK6
 E_g--
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: 2256c2cf-d671-423c-bebb-9e20782933db
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 0/2] pci: slot_reserved_mask improvements
Date: Wed, 15 Mar 2023 01:13:40 -0400
Message-Id: <cover.1678851637.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <cover.1678851637.git.brchuckz.ref@aol.com>

This patch series consists of two patches. The first provides accessor
functions in pci.h to avoid direct access of slot_reserved_mask
according to the comment at the top of include/hw/pci/pci_bus.h. No
functional change is intended with this patch.

The second patch replaces slot_reserved_mask with two new masks,
slot_reserved_auto_mask and slot_reserved_manual_mask so the current
behavior of reserving slot 2 for the Intel IGD for the xenfv machine
will be ignored if an administrator manually configures a device to use
the reserved slot.

The current behavior of always reserving slots in the sun4u machine is
preserved by this patch series; the patch series only changes how
slot_reserved_mask works in the xenfv machine. Although the patch
series can affect xenfv machines configured for igd-passthru if an
administrator assigns some of the pci slot addresses manually, it
does not affect the libxl default configuration for igd-passthru because
libxl uses automatic slot assignment by default.

Testing:
   - Tested xenfv/igd with both manual and auto slot allocation - behaves as expected
   - Verified that qemu-system-sparc64 still compiles with the patches to sun4u.c
   - xen4u machine not tested -- Mark, can you do this?

Link: https://lore.kernel.org/qemu-devel/20230106064838-mutt-send-email-mst@kernel.org/

Chuck Zmudzinski (2):
  pci: avoid accessing slot_reserved_mask directly outside of pci.c
  pci: introduce slot_reserved_auto_mask and slot_reserved_manual_mask

Changelog

v3: Re-work second patch in response to comments/discussion of v2

v2: Add first patch and cover letter to make this a 2-patch series
    Make changes to the second patch (see second patch for changelog)

 hw/pci/pci.c             | 32 +++++++++++++++++++++++++++-----
 hw/sparc64/sun4u.c       |  7 +++----
 hw/xen/xen_pt.c          |  7 +++----
 include/hw/pci/pci.h     |  3 +++
 include/hw/pci/pci_bus.h |  3 ++-
 5 files changed, 38 insertions(+), 14 deletions(-)

-- 
2.39.2


