Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A5E5606FD
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 19:08:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357980.586901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6bA5-0002bJ-D4; Wed, 29 Jun 2022 17:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357980.586901; Wed, 29 Jun 2022 17:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6bA5-0002Z1-9q; Wed, 29 Jun 2022 17:07:33 +0000
Received: by outflank-mailman (input) for mailman id 357980;
 Wed, 29 Jun 2022 17:07:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=los1=XE=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1o6bA3-0002Yv-GP
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 17:07:32 +0000
Received: from sonic312-24.consmr.mail.gq1.yahoo.com
 (sonic312-24.consmr.mail.gq1.yahoo.com [98.137.69.205])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3d27184-f7cd-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 19:07:28 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.gq1.yahoo.com with HTTP; Wed, 29 Jun 2022 17:07:26 +0000
Received: by hermes--production-ne1-7864dcfd54-q4948 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID b6ab6cb55138359f47e14faeedf2220c; 
 Wed, 29 Jun 2022 17:07:21 +0000 (UTC)
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
X-Inumbo-ID: f3d27184-f7cd-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1656522446; bh=KGleZCrK1ory7vZwxUmrZsedjLqWV8c6qrWiB0U6mow=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=mr80KzqVqatPdlmBEV9f0VtMfWq45miGJA2WQ0/YScGHp0WLX/IsRongAc7X6/4dJiKxYsWXgMVeN84sK+Ok8qx4ORAroEVDYBObI4y7u6QLp8emcy/is0xcnocST6dFC26JbsG1s4OnYL0DnCy4xiuqzkW95rIekWcrrKI1ayaxt/ybV6aEC5Po0y3i7Ostl+hVuKP/WUc04py+PMOP2ddUvmQjGfu3ulMwtXl0T9yFHy4s1FxQgqFYoGj+p010zGJ9/her2PjCQ1+Q0o/qafIU7/kRqggl7dCrQ7zzH3P8tVyco/xeIjnkYZdntLmt74hemEva/nM/QdUsEEuNTA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1656522446; bh=vADSH42mt0SrfQIwqiqm56R6UvOcvPatZYtPdEu/k6D=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=D5V4w92Ebw+iFrzLrQn38NPfeAMwbCaSTip/5373qeg5aSoVrGsQPB2mWWzSoSngAmBKnAGDSPafqUpPGmPap+8ozN7nbSR1orUxuycow+zG/+tEk29BqCAe4hj2MzxXjnD3GPYphwOIEICM22CKEOKhOqBlLpj+IqAj7DM5wWJjcrHbiWRubhUk+8QCJLlI5vnPyjXkZUR2y0bfQ/ylSsAWsLPfiecDsHqTaTrKiTAuvPTCAKcoXmwMUZAbEHpziJ1QDkDUMXCPPSomiCHYYLjrlWm4cSUvI/+VYrY11LuoMpCxgMnPd/QW48aeWl5A+zy8sYy0jPiRRjmDpbfGJQ==
X-YMail-OSG: GbWx56UVM1kDP1w7PXqGFTZw8a8.Q5vCHL21ZWJMlsWuRDhGaiptXkInk7wrSDt
 WqjPVDDtKHzugx9w4kWGTrZ3L4oo8G_6oVwPvn52QxMqzpsPOSLM1oe5oDGkE9XC91PE0ZVB9A.9
 zuWpvh_MqscHNfethKiY5ud1XdPBi7rzkEbAKpDUR9BXVH0iAtgCYMSOKgTvzBrv3MZgefiUaxYb
 EAbaDk_9VPpqE50LYKI1hNW9ShAlkPfa9UIzcwmhc0JjTSZ7DVMG4iDsfaG1WjSBkHNtwgQLHDAq
 qd0IkT5MhxgbI.V8lDONULHbfamPzFdbrdjABZc9T7XZ29vYkpjh1lngLKYOBSr6i_AwM1eQajHw
 qxcsMRUoQFaSa43gmAsqj.UAdklSHIlSwN91Yj8UFfKW4S83YpMNnJ8pPSnT0hLLkQcvP1nuuz96
 bIt77kd2ahfl92RW5.LV7swi2EE5P1rlgEA66ZO75S3Bdu3IkZAavbqolA2LrnWL1393Xkk6sY0h
 4VB1GZdWkc9MHEWlIBG9dJGpGdhnPC42XMV5tRf.b5u1EsXGhEf2WteK2o6_1DJcbFygj5KK211C
 9ml2hfZW3GwzbZhsPocDBlBLnTvM2_vtByT2ICPi9SwntfNqlZoDnS2KxUc8xYYSbFwQz0Kc2yHj
 8O4BaQWIqm5381VXtTARTBGIykK6zsi9qrGFoExFTmR2FTSJGrS52A.SHXjjnCBsaqcJ.H.F71hO
 dLb9kpPtdq0lUoBFxRYdk7k9op6HHfuQYM1oA3NsEiigzC7lvVxC9lOL8Hw7LkdJduIObxWTq4t8
 UjRNs0imI3Pn_.FkNVIbUItb0gCfu2cqhRQP_PahIxalZWw.trnSjMqF2X9gYfDKtMjx1Gl4.R.s
 ZeZUIvuSLpnaEzQIezThSVsPMGOPgvMSBsTUacYTecP1Amq_aOzkf_Z.PO.TpXh6A6zlyY16uidE
 usL94ull_vzItEZefaS7_vhZXP2vXHWEGR3KZK7RSf2jfxXUs_wK9PTCtdxQh5BNDvBKKicfPqgW
 inXWQbY42JbLnfpGe7wXteNTV05qh13Yw0J3ON4K8h7VqtWsqCrEy0YPX0V.zGdXfqbaKFKQRXOA
 kgg5PX5yiMcA56BhTCzzqVZj2o53brTapquMZp.PgVf2TT5q5coSQ5bWIRtABpOWKzCECRr59Py_
 muhaJ7IBQ3VY4tiy4rqFY3BtL8HF9GSkygBhCplpSFfs_Kq47q39ZBmSIAqQUN3Ys9TU_gjipivm
 EteGqxxiz844dHP7lGR5tIrV1XJgUKfJEPLkwCvPQB_qktOxc7tHwn3eW5jQAexeqJfDOsnF5yzv
 VoW.74X2mxfskf6cWOS.MHgMTMQ7Q5WgX6zhPDXzLDknwZBStTJu4AT50Gn4U4SyNoROmhBiG8Ts
 4FzKWqUIGBefJkzH4WYRxV2I4KCyyCyuOUm36.17pILXJPXde.7ytSol31oc0LQ.OSU81k.30WW4
 hbh8v8moTaoK_h5Sdo82aiBj2A1J58dUgSfMTTF9Alf97l89tVJiciqwrXEQDMLHMN_pDdoKf1Ox
 e06_aew0t2sA1qijSZxnqZt9rT9A.PBfuwnkdT3V24xQMX0LILO.F5.R0IRtXrGFhjR8y6I.ZHYC
 kz6JXJx6gTFCDWi_zU3aRUawuI9QPWv._E86kq3sMjs4NHdVKwvnRfpuh7G.16UcuTHfe9kQcNle
 TP.LGr5p0yrnB6lNi7gykkWluTZ51o67FCZ8NDTTT.FtS7wvye1V7gpbm6kEcGHVgddsFsxiWWdb
 K03_bbYLpAcj.IPhtd4w7cH3hoL3GsVZcgFYcay2oN6mRO3twBPLyY.CyTPBF4kQrzoriOdHxUhi
 h1L4XN811tvB40ZD6vt9u6RW9eFygNVmfFo4XwYgjyNJIDnDORv3gsOnsIH4X4UpUhUiePeYRZ_i
 FqddYkVykq69N_6m0VWeDzEMHCHgXhFUufc9GU0AP8cGhoia9gMnjJMdAgpCY7ByIz1XdGwFNxEx
 HNOMG6LAVgAD48q0JHgFEn7WSF2rPL6eMkAUtMGA.W_BDH3J2AwRcg44TbtZM5jLk5daTXv1PWEB
 PEDt.MZh_I1WAhwrDOL21ukap9hVMw3YNJOrcMGL_A2QcWmSm2ZX0GCOnfw5RY.efllqYkFxWs1r
 .fAK4y1jBqwR8Me2GJp5tGvXs.V_bBkjmBWsQV_wgn1x6Gja6hJfiDhMUfhVIPS3bCrc7hifOPLq
 sXlY-
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-trivial@nongnu.org,
	qemu-stable@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v5] xen/pass-through: merge emulated bits correctly
Date: Wed, 29 Jun 2022 13:07:12 -0400
Message-Id: <e4392535d8e5266063dc5461d0f1d301e3dd5951.1656522217.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <e4392535d8e5266063dc5461d0f1d301e3dd5951.1656522217.git.brchuckz.ref@aol.com>

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

Fixes: 2e87512eccf3 ("xen/pt: Sync up the dev.config and data values")
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

v4: * Add Fixed commit subject to Fixes: 2e87512eccf3

Sorry for the extra noise with v4 (I thought the Fixed commit subject
would be automatically added).

v5: * Coding style fix: move block comment leading /* and trailing */
      to separate lines

Again, sorry for the noise, but the style of the comment was wrong
before v5.

Thank you, Anthony, again, for taking the time to review this patch.

 hw/xen/xen_pt_config_init.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index cad4aeba84..4758514ddf 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -1965,11 +1965,12 @@ static void xen_pt_config_reg_init(XenPCIPassthroughState *s,
 
         if ((data & host_mask) != (val & host_mask)) {
             uint32_t new_val;
-
-            /* Mask out host (including past size). */
-            new_val = val & host_mask;
-            /* Merge emulated ones (excluding the non-emulated ones). */
-            new_val |= data & host_mask;
+            /*
+             * Merge the emulated bits (data) with the host bits (val)
+             * and mask out the bits past size to enable restoration
+             * of the proper value for logging below.
+             */
+            new_val = XEN_PT_MERGE_VALUE(val, data, host_mask) & size_mask;
             /* Leave intact host and emulated values past the size - even though
              * we do not care as we write per reg->size granularity, but for the
              * logging below lets have the proper value. */
-- 
2.36.1


