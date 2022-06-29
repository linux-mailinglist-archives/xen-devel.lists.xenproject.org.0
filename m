Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6371B55F9D5
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 09:57:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357601.586255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6SZr-0005XZ-6A; Wed, 29 Jun 2022 07:57:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357601.586255; Wed, 29 Jun 2022 07:57:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6SZr-0005UC-3H; Wed, 29 Jun 2022 07:57:35 +0000
Received: by outflank-mailman (input) for mailman id 357601;
 Wed, 29 Jun 2022 07:57:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=los1=XE=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1o6SZo-0005U6-Cw
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 07:57:32 +0000
Received: from sonic316-8.consmr.mail.gq1.yahoo.com
 (sonic316-8.consmr.mail.gq1.yahoo.com [98.137.69.32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f06e91f-f781-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 09:57:30 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Wed, 29 Jun 2022 07:57:27 +0000
Received: by hermes--production-bf1-58957fb66f-xc7t4 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 54da85cd042d010097af8a7b4a3a105a; 
 Wed, 29 Jun 2022 07:57:22 +0000 (UTC)
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
X-Inumbo-ID: 1f06e91f-f781-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1656489447; bh=E/3phgmr2on8518X6t5OCFyE0KA8ET1fzccg5b4q+lc=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=JEoGeVX+4RCazZkzR7rbzC90ELap/QvDOSJaDl2MFhbEW19ax8xuZ/H4p1GSSuT3GYdOxmoMsMHGmF0t0Hjh3MjBKjz4zGSYqO3MYMUt75Fz5ET9MHO1QSgGpGESFGZaI9o6DmUmkG2EcU0rb65Q+rHqvEuUdJ8n3g3lV+Bnuphuh86CYSe18fVSdqGcAqdYUq7qkgJbeSwMsyLwm4ZtLVVH26WX27yOL6xsptT92FYslEoi5xzMqA1hjKFRfAi0VtbmTAIBXQHTP5O8FqBCGyA9EA7JeWbojkN2FK7VmwAzixgMbU/8FeCfrwCjPBWz1tI5ZIcHdiMbvzS+0oAHeQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1656489447; bh=9xmbxlEBcekFxb9avc6m12xqUTk4rsQ5ESiPwqvGtL6=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=fV+GZyF/loXcp4VCRrrzyWF9hT4TCpaa2/fqM5xGBCCfS7DFujrJj03v7ycTqIZ13ivycmuYkXu3snjBWK2cXCB7B1q4DNhBSbL8hzR9y4R0rjrMFktkIt5gmwnqdMmd+t/Uwg0mzSXaNrSW1BKq9CpBtZK8UF1A4p7j85ZS+nWXPJh9Kqt9SRrZ1pESNDzfsn23bQjAwUBQMBZWoOmC5XsUCGiZNIo4GGg/FwzFwHacjIf1ASuuL6mbB/DQLSdrJuM+QN8LuB319L7JzCnv6j+SK/5KVaCxmz1dTqM9ViNfOsRltHptuGs80dU7ChEo9Ai0wMrzgE0sBGDxfel++w==
X-YMail-OSG: P1ITJT8VM1kOD6BJFWPGuO3YiZ36oJ0J50fInCaW3vIscfhBkNSOciRrz7Tk0xn
 3jroEq0ouCQAm4aC6_5QA49v8nWBzwmv4f3XrNKBGKHsAFpvlYG8xteXLtaR4nX2s5b9AtZZygI7
 jZYmLeBnPOy22i7ngQScoqUYnwksqC7x1RfmL4Dt1owOJWMDqqzsYJc.48iO07k_pqmQJHi77ANk
 GIvnLhem_4BQoMwxiEIwNpjEaP6rKKbvfDsZ5aq0GGFJjzLuU9S5SAPw2L49Oq7fxQGnEu2ELp1Q
 LUSduyifKJO10_on9u9tsuidVKgWBtsFUymL3RI_c9q55EgwaCFDVAJqkMyHQRzsFhENVB2A3lL_
 MqUVgYiZGczimyj5YMlQgK_YtKVK1O6I8mKT6RFwjJCXWbYdkgPt7FUPJlYeM.wIUZJcaDaaJy8i
 w19lnxQVAu3jaUhNWESq8YvSSv.k0Uo5q4eX7FdJ84UBpJmlQ84gMrcsvsahodAtg735sga6.HpN
 JgWLCf31PZNHFNrlSctxsBNb3qw7hWYl_DTiv0N6jKGVks8iNvk9Lg0UCxytkdraK.sVwchh0qAP
 IoNE1qxplpvQCRPywPX_V3cOKbkPNe4MRmSq2qmTiIGjIt36c4LoH_FNkhW4rmCrTWEyiTdV8x63
 D_nuQkHoxq686h1TLaerv0PMex6.7iDEPtl4WSf9iuTs0XlZ5xECQd_BMgW_GLIPbwFQnqFghf9q
 CfmvA.VuDeTztfBYnBSAiD531Hs67.QV4KqLggUuRBXlh1V6llR0ahvlHWN8biuv_Ts46jfJ_UBO
 rHHvHhIOpoWI4Q7zeeWHIsHp6pgjuOIRKpch.hXG.w3l8HSUMGF2hVi.0z_8g.bU_oGbgCL6OTc9
 gSbW3nRwDyIvMl3ihMz_NAKCmGpIRC3.KjsKzcBdjaGz2Qo7rMayQ98GUGudkbGA_KSp6ldCZVa3
 dj.IwAeN6jyrhuSYIY7WBCZXzYQCsdA56fPUUYTcgOYIzwvmp2bpcb4aD7.8_QWSHG9d4.0FHh9n
 Vs3aaHfSsDvbqC5129NVdCkLIDfAXmR0xpbW2bU_3GKvmn6NP7PDX_82CzU2KWV6gsEIoxDcLWfX
 1ul9ipFQ.7w4HjNGk7icoWywsGhkBHETCjYgvhcN7GK_nM8.bMg.PWCMXIYsam2UaFFDjhfu4n3y
 uHwJvuMLLY0svWBO2vzGu2Vi6a3l8NLDSGdePThadoqr_EaR3aWF8mdat1Ta5rPn4iN2xY8HW2TV
 phk9S4MBWHDddb3lv_.TraN5r3esj9nV32BzYoPVe61D27LASBWS4JDHIvNQia9c4dOnpreLlKPF
 lgW_S90W411cJkVfo4M6kFDfc.PMBrx_FHy4vbwnpkT9_5YNrO_ulajYJi5D2W_6GtON3NRUyqhu
 vBdA2bqrORb6fFex4x4kuLwj7X.Ae3TLYzf6lp_efT5RLI.LHRLM0YINiG_l7X1o4bMuNUVNGhqv
 YYZe69dHQULRPoRlbosU.IAamY7m7sBfkMtcpy_LDHZjBa8wEmcG.zdZxrrAsZ_DFSwQByNemc.b
 M6VquFrZZ2jGUp2nC8QnZhoQKeLt19VH4GsLZjpwddBtB4H8rj8pjJb_i2qyoL0R97vC5fEtb3B1
 De0iwUdfLom8cOG7geMdxQBVK7cUUJNYhQR6ekHaRFFT7jO1PdWu0mExWzf7WO9AX1vtICrERUXL
 2HhKa7RZ.ak4nDPp17fQut8BNY9aQINAwwVamEGuEe1aYTKLFXkN.G0IOhTTUoKIwFRqoYAl8yZt
 5F0G1fOZKq9L5Nj1O96aFm5AfoXwxSWpJJ6i67DHF2TTCHfZJF1vfUx1AI8w2gf7rXKwBkIPe9fA
 pZSluNYFU6s5WX41RdIGM9zpRJ3lfdoEpBtEZvRGMjQhfHDeqPz7bVtOmgXyj5ba.dUQpuHJ0nOO
 hJp8qnyh4WGrdQS.ZpNiulwtfpdzWfapAJJJByWbejUArCRptwSiYQKnG4PVLkOC2Itic_vdf42C
 V_am5cD.lGFxCFgYUqFuRK1grhV51uljmr.4k0GsRfRhkvu2jjqG3fNe9gWiq3u3WchvvH2uWTDO
 UkUKp_iaYegSNv_WbAZjmlmWhA13oI5qUI56CSktIp_QmXy1ywbeNOkjelKYPl_tDukjDBGGOxT6
 e.eS7ucjefi_pI8E43hfJnDzcKxJzL8CUirVr9eZ4BxUxHzHXMgcAPYepTt4wi4VsyIvS6aBjELV
 PNdDK
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-trivial@nongnu.org,
	qemu-stable@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v4] xen/pass-through: merge emulated bits correctly
Date: Wed, 29 Jun 2022 03:57:12 -0400
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

Thank you, Anthony, for taking the time to review this patch.

Sorry for the extra noise with v4 (I thought the Fixed commit subject
would be automatically added).

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


