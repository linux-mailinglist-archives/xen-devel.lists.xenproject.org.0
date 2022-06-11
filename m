Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ACA547688
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jun 2022 18:44:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347300.573571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o04DG-0004gm-M3; Sat, 11 Jun 2022 16:43:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347300.573571; Sat, 11 Jun 2022 16:43:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o04DG-0004eN-In; Sat, 11 Jun 2022 16:43:50 +0000
Received: by outflank-mailman (input) for mailman id 347300;
 Sat, 11 Jun 2022 16:43:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lT1A=WS=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1o04DE-0004eH-Kt
 for xen-devel@lists.xenproject.org; Sat, 11 Jun 2022 16:43:49 +0000
Received: from sonic304-24.consmr.mail.gq1.yahoo.com
 (sonic304-24.consmr.mail.gq1.yahoo.com [98.137.68.205])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8656465-e9a5-11ec-bd2c-47488cf2e6aa;
 Sat, 11 Jun 2022 18:43:46 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.gq1.yahoo.com with HTTP; Sat, 11 Jun 2022 16:43:43 +0000
Received: by hermes--canary-production-bf1-856dbf94db-ld7kl (Yahoo Inc. Hermes
 SMTP Server) with ESMTPA ID 10a8310a1deef4c241e871970cd315d5; 
 Sat, 11 Jun 2022 16:43:39 +0000 (UTC)
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
X-Inumbo-ID: a8656465-e9a5-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1654965823; bh=uKipQ9GESCapGnwnZNCK+G59mD+JZ/aP2507Xtz69BU=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=rj3EKPf8cHONK1o3O/aL8eLuOd7jPEM5O7se7HquQi0H1Ar0Udg9WyciIQJ630X+hgudHPynMV+haJAl3umomxdUtOiCumbxuNY3Bi5C6fjMB7pOuTuHgZ+hKgIBK2i4JYcWNpSdDknwcxKOMqYgwq56hw/VSgyEr0+9e9xIxJGkkE4uuWcFzwgMDmIlc8dufD26cLbr0lCaD0HS81aOPQ33uAvjtmSuijLPNlcShceo8zntuboRhXfBMsOzF7LQPi88i+zT78NiEJdronIuh58zqeWXK4JDcR3Bp69UbkS1AZ9uRs5REvjtrNBBUZTcsXPIyC92gmeLN9bj3O7vyg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1654965823; bh=DA2vKnKf+zEJ+BS8cQu11up+Ie3P63di7K7wlyd/Bal=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=Fbgz+GJjm1oytjNO04YnchJYs1BpSV9dnHS5hE5XKg1rCbrfwBqU/GS+WJZFDDW6hHMhENR5VkyWZE6/uz/JOvLHUTC+kYzho3uhGov8Dshvz2sXwHjE6DzUkBDINbUT7l/jJxrdlGr8bqBgCzQNIrPpFgBbBa0FeR6zw70JHBltxqIK456RVBnfzLiirbWqrVZ5g1o/WzUAMJZAjyNQ3j4RznkY6q+lQdBoLHxlreUvVUNDhuXrPNaXLQl+Q0WvPi9MbEwjlrUOE0znssLT30pA30ING4RpFSjPZH/metJt5Izr5cYJ7zCaWQyhLlTMZumaoFKeMtG+D0knK5vWFg==
X-YMail-OSG: AWXn12oVM1k3G32cr49lu1hpWFcCdIsYTwluI2HkZElXlWe7QdEhcypMisJ6FQS
 AdSXl0fE6Sfs9J4xbP7_82mUhW6okyP9SUwtYPp64ltydNqMLcCKBV1s899BZdNW6R3V5sN6U3.1
 2bRRsK7iflyhEmurOCSiu4PRS87F.KpPtcVrFuoXaWJj03_frsyXavXprPEgGzuPgXVHwl6elgov
 6ViFiypp9HzuOoBqHXn5q2HQPnIjGLFef7njwHBU9e_4k3VXjtLIQ5p_sTAs62AtRrijoT2bPxtk
 PoHB0_ZPLkCdpP4FpR9RMXupNNcJDpiRCAYkuT8AxZKkI7q7EcI28nTVcoT6CMdtiFn8MljvXHe7
 j7S3KxpE68GwC7gdJSqcnoeZLJhRBmmaVeGERX6c14cHhoyDC6yCjY5fJ5mWYmTlFH9BBsnaFYEk
 8fBjhnwo7b6AJ4KlLGukcJLJPiytH.Djk0qpV9COJ9KYYl2wTI5w1HVed3VXyYRFYVS_q2r0udbj
 sEqLzzx2v77RlTrCGuZGI9MDt7jlSNqUtkQ4t8N6ZfMnDn3hKip9DoN5RoYPdEa2SGw6FgJpCISM
 PVk4iZx7g4PkWfh7wj7G152g1ahzk2fdSkQZpls1CKBNw4fCBzAI3kpd7fDqMNPJDJnx25Fkd68N
 HcecqmFdF1EI6qCUUdd3rmN1oQq7RSKCLJcQ7k3jR4wMhDavDho1UfwpOAoKawBWPki93k0XXvkx
 B5S0ttbVYCqyMnRpOkg0Wnn3TO36O4VA6qNuv1lUBBO477QXnCjSysaqUT98kkc0tUYMKdNjz377
 6I2r2_qtNWZ7_DHJERNeCYjaVbRA4P83ZfyChqyLD17xkZHWb0rz2U8uWgE_fCmmEh46RhmSifia
 G8XkWFq5LHdR7KCV062WCGcHzwdPZgSc62.0Ch2Jz3ZGI7t_D1ziBnbioTTMuCF2YGEFmvI.AAGd
 focsrp4yPPexGc5JKsrk1bSUbO1jgLdCF23vqwU1EKcsJP2R_hYYywp4kegorjU3PJJx_53.ft_U
 3jv4QREFycQJokXCioYh3fHXf2L185VE_vBs5OuiX4TQMVfvAFeRf6rK4.Ac1naVJF2YtpAwZ27B
 VqXvXZ08ahvOdH20A_cTH.9lJlZAVnbTxSCQzXbddkJNm_8klfIzQWsMu5SJRwJUY8mwGU8rWdX_
 qgkukAG3nj2MiYSdgVDVI.jApGRrg4s4mNqFwy_VjUWUnxbP8WxQr_9GG9MpL8KZ2np_YMAFAgKb
 yD0dQMdVYjW0u7rsMa6QcQyV3aWeiYNGy_tR2TQPwf86.DPr6FjfxUpvmg3ElaGM2uv94slr2LzS
 cJT690MraQcpIO5e7pi5jMlSi.uFDT61Fhj7iwRW57wnwLOoaKpphAkylEtWBwjVM9xHVDTVoDBJ
 De58T8MNWqMAjJqVY_Cn76B5TrgRlbkKZCJ3ysKI_pP576JEWkY6WIYqGy2fbUyGKldv0iFgBnnZ
 IQkwOp.0oe84ayCNA1En0QznZHc7NxeQIcmRE.DgSYghQxL49.T2ngZWVqlX9RnvgWTYp06_Fclr
 x1JPozstV7.Dt_3RL35DUdxqVBBayyzICxtWhCblv__YduvNV.iW9lv.Uxq8PsV4c6AHcxGmMw4W
 lfq7Km26b2u52WUGJO.uemorpxZa1h9.yV1I0bdMHvnnhSU7C6_cl7Qo_BSf7tiLMqVwgUj0B2NA
 IUzJJs0fN0VWhnYbdvKhfwfns4wrQCBgqhaBDZA1Bc2EAXce5zo5jGkRSMrG1Bg.ZuwOFca1k0nE
 6HQ9hhDRGyII8v1tejFKdmSPbU0zup7QZdiy6.LsqJASBW20PCVPXr1yrPZBRmVEg.EMj_BCOZtd
 N8Ev3dLHu2kwc1RbdIBjOUWHyUseFSk6QuwntoAOK0cKyRV3Asxqb2UeWcwSZtReE8tKnq6stP0z
 2PhOcmTQ.oNiAT35AE9tBr7USWIdhpQZrmY70BmJDr5cA3yx0JUssXePar4qj988aWn9GGWnftZd
 51uTNgKeNjVLb0CMrYyFSv4xJLOgwkBq4CxjQ_LOrert9sKtRRRVKD1YZyPVDQmSCo3JJKTJ6LCh
 uXAvH16Ou5_C0Rfs7Uqn.GXNfsR04_JPmjze4wQzbXxKlPjtyaTPZdcHi1PFepiUfCDs5f33toD1
 EQKbQ7OwlF.Ib6uiTpHBh4JJvJzFsri84545KQDcaj.lDRUZkSfWtaRKq3GPj_V4DNY7lFGD2gKl
 2nnkz8aiL8JNRIlQ-
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-trivial@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v2] xen/pass-through: merge emulated bits correctly
Date: Sat, 11 Jun 2022 12:43:29 -0400
Message-Id: <b6718a3512ec0a97c6ef4a5b5c1f3de72238c603.1654961918.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <b6718a3512ec0a97c6ef4a5b5c1f3de72238c603.1654961918.git.brchuckz.ref@aol.com>

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
---
v2: Edit the commit message to more accurately describe the cause
of the error.

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


