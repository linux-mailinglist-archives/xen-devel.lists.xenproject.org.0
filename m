Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD7C6634D3
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 00:09:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474083.735036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF1Fz-0000e3-HF; Mon, 09 Jan 2023 23:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474083.735036; Mon, 09 Jan 2023 23:08:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF1Fz-0000bd-Dn; Mon, 09 Jan 2023 23:08:43 +0000
Received: by outflank-mailman (input) for mailman id 474083;
 Mon, 09 Jan 2023 23:08:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=szyx=5G=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pF1Fx-0000Gp-O1
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 23:08:41 +0000
Received: from sonic308-8.consmr.mail.gq1.yahoo.com
 (sonic308-8.consmr.mail.gq1.yahoo.com [98.137.68.32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8be2d2cc-9072-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 00:08:37 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Mon, 9 Jan 2023 23:08:35 +0000
Received: by hermes--production-ne1-7b69748c4d-bgkrh (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 21a3ec8339abfccbadeaea4f5ef812e7; 
 Mon, 09 Jan 2023 23:08:32 +0000 (UTC)
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
X-Inumbo-ID: 8be2d2cc-9072-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673305715; bh=ywgbO8lubWpnCassvIu6bBFzCJ/Z2sgLUfL80HdpzLE=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=pxzV/H1HM06MpAMRVFL0ssYCJXP59bXc5GrKUx/QcQJz7S71dqm4BINX2rzahxX81MtJ3y6CVWoFA+Z+Yvgmo6ZVoj16k+n0jLXlMLmUGbVqJE84JQ4p85+kGNkvkZ+CV3G3IVhDqZXv8Dr2rU0tVBF9iP1z0HwzRVp6x8KAHGEMS7q2ZCfeFIysV2I3RHAkuX8M4I5xj4vKnkI7rl/dsIfHsF+8921Wr5K1wPt2gMyHI+eTg8B2Lwfenjxuz9UX2sw8CglGE+K7lJLFfjSPx6RSsEPaGgY5LceZhom1Eg4fk0O1PK2D4Q/HnAm9NnGscRgslm01AHt6AiaU1UA4ZQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673305715; bh=keMjmw88+NB73GNZ0YN7HfypUkwkByV4+3fnszfn8CF=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=o5oc++gedcFxnVQru4ndLDTH+4PHQV48uZlZYgPEpbc9FMkTUtRJaY8ZIkTBLQ9efm7MNUoNRoYQnfOqkxARaYxTn/ztbDwwrODbc224H2IWyAX+TBSF1kLYjVlyGY6omgdm0a7VCaxl0USk+DiuFfy7uCVCauu1/xE9QsAb+cGlcbD+60pewrrq1aKWcKGuCZ2nPcelXtbFD9hyDybbZ/tCH1FtccsiuUBwWONs0gVITU8DORaBTRcDW9rQNQ5RCGYm5So2t35HzP30oAv5CjIuBFRrupoQ9UF26cgAB8YIBmCnsldzZZipBmKZq9RxiDZGaXsJ9YEBnZ0/lwvPCQ==
X-YMail-OSG: vQZpqCcVM1mUk8i0Yg6trsInc6cIWbw5_m7__7CkDb5NTL8YxNrrPG2YebLlzam
 cbBzvm1Qfug0CdK_EKzy9o7NDqNQ.oDx1dGzXpsW1UizBPvq8F5GwcOBS.9eepfelo2Hc068dSZg
 PFRNQRvtTcgxfA9dR.lOLBFOP25MpPq4pTWjtTC5DdLdlcdEDFg14WJHM_ruSYuLeOJMwtm8r6c9
 t0_IxRGikpcmywJ8l0GYmNert7SRfUAh_TwQKxpjYgoh0C5DBiJs.sXBqpZqmoCfw98iOO8F0B1v
 BDe8VwfbQ9LyLe6R9qNFsHW_4CylMgaDyfi6F1L6YUuHVzkGTL.zvCPjrPxZo1JhUkI9pbrlEjVq
 QZ07JAl9zztA3m_F9mdSrNIShZML8F7D8biOje2C.zDIdxp.wOwCMXbp5TAahcygh2q9AmJfItAd
 w3krBHXcXWT5UrE00TTFA_MVSoqQhqomFTu3x5VWZUSJGjXc4BEXiMxf.K_yT7uX4jtA.k0rAdHX
 jWw1b7zXKomaPLHmV3Hjg576CP0BeS.v2Owvv1ymlnWXvQNeWFVj10av1tH_9FXoT5BkGhNtGaxK
 q6aRWbSlcpT6lACd8EXQjUig6HuYvzGGYDIpm_L8R3wA_XKdCuzSxpFfHJ9oqaNyp0F_mNPQ7xfY
 H_OMYWsTwp0wIRtnUE3epufHf_ZwrqgVz7E.CVtvi_lQWBBMCO6zQsaaRWzver3NRHhDqJKzdllU
 Ki9Q6ypU1sKtHeCDN6uQivu0LUl3m3kXOLrDa8fIz4Hx23rrvtZ2y5feJ7mvXxEEqBRLjxBrSqBH
 usd0r_3usqyCBDIXyEU6yCm4G9lr8R1bhjdcdGEVxYbnGcQ22yqgQkisyrCjJhk2wlm1BnXFibeM
 bVIm6sis5av5BHgjo6FZkg02DT34K56H725bfkaGTGSm6hIsHYSTKa5TLoD3uLUtj.tObqcSdYuT
 mI4qH.3ADGN8fWZHaSnbmWl.S_5JucXWDsQrX.6eXSFhBX_anNtCFkCbUkihkXZV1Sva8EmqHs3R
 DBHRUidj68bGpq6rC6HGpakt55ONoI1_iiQGSAklpsBEaXB8GTqrBWQyEgy8mKdMHQn9.cDBkhn4
 YQQ8GIjjyzmbNWkNkTZmUw7F6lZ8Rsi8P4_RX1Cmg0h3AZ2o3DldWH8NUIIjzxVSAydONH8cYVCi
 _KCuEbj6K9MtQJtiAi8mWVIAHZMtngEcXb4vetP6QXoa3bscDARG8c3DrlrKeV0xWJh9IsPn_fO6
 lCKp7_j6NqmTG3oNlVhfZCpwNXDsWWmkw0zCBwxMxX_C0kDjoHK42ePacU4DtKyU5ggLQzPjoBZR
 8MIjGW9HtAzBnQyXoNK5iHTMx6hk8mDXEGvucUmkG6bSOk5iHb4bZuaDyibxfjnn1gu2vErd._91
 k8GmjuSozC_fApfkJ.yolqbPpOWW2dKb2vtwl3q78PlTqTbFzMGVVg.p_Zx8kt1ePl7x97FNTy1L
 YU5t77MmDasd5dfcapCgontTo.7eKb6EtANIjKOZF.IGxD0FSSPTKtRJiraMZrW1xThL3pjzBXy_
 idlDgeBz4V_.RbOd1GpUGTiZkTKP34mpwQ8aLNPXsEFSuX7yz4gPbrVSsRowIaus2sJxQnvbkQlf
 hG7JcMfmePc.u4hu7clkU23J3HU3KRyV8Zc3nJZLYXG8LFtWGYqdAdBDgjm0LV_KByE36kM3YgCW
 vrrmyF3IateQLwYucxGimj5zcjl8t9bAYDcEtIsZSg8DPWjty1LbAmJdxoj2WPbquYvnktxGBfdg
 0QznWRWZGIrkjLNC2QloR.OOMnb09ahDk9nJ9q9xtJ4voF05Q8c2Jvzg0FvkezRWl8LK2VhYpFs9
 W4M631i9xLc6yU5aZnWRrsB7joBr4FEDvkSxCzU_cBhRAjHfUTyoByUkBxTxMb9yt6ZM2ghZoX7M
 4X44tPVu604f.o9ZuWAJy7zhT2IAzwp1aYlqfKywOZ8iwK89zwurgxNux8odcJGe8wTK_NaFL1kI
 4UFtlTJ3XYeRL6fjGS6415Z5PVgwMpQ9qwVDnoW7fmctSGop.iWJO6ImljqeBecgMRDO0UFB.hbn
 rpzFDd3it6GvDxcNBoCdQDUkXIw_RwrNeqgzjAP2cKVqLBVt7Ft1u.ciEP9bWBj0_nhtGG.lPkDG
 y9c_Poj1g_5DWY9FwycTRu2KCaslyzwI2.DyIuP23TmQA0qm41xKWUkKkiK6wucoCyxzfS8lCYQ-
 -
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: anthony.perard@citrix.com
Cc: xen-devel@lists.xenproject.org,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	qemu-devel@nongnu.org
Subject: [XEN PATCH 3/3] libxl/dm: Assign slot 2 by default for Intel IGD passthrough
Date: Mon,  9 Jan 2023 18:08:13 -0500
Message-Id: <27bb3979f234c8de6b51be7bb8195e3cacb5181c.1673300848.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1673300848.git.brchuckz@aol.com>
References: <cover.1673300848.git.brchuckz@aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is possible for the administrator to manually specify the virtual
slot addresses of passed through pci devices on the guest's pci bus
using the @VSLOT parameter in xl.cfg. With this patch, libxl will by
default assign the Intel IGD to slot 2 when gfx_passthru is configured
for the Intel IGD so it will no longer be necessary to use the @VSLOT
setting to configure the IGD correctly. Also, with this patch, libxl
will not override explicit @VSLOT settings by the administrator so
in that case the patch will have no effect on guest behavior.

The default behavior of letting qemu manage the slot addresses of passed
through pci devices when gfx_passthru is disabled and the administrator
does not set @VSLOT for passed through pci devices is also preserved.

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
 tools/libs/light/libxl_dm.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 2720b5d4d0..b51ebae643 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1207,6 +1207,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
     int rc;
     int next_slot;
     bool configure_pci_for_igd = false;
+    const int igd_slot = 2;
     /*
      * next_slot is only used when we need to configure the pci
      * slots for the Intel IGD. Slot 2 will be for the Intel IGD.
@@ -2173,6 +2174,27 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
     flexarray_append(dm_envs, NULL);
     if (envs)
         *envs = (char **) flexarray_contents(dm_envs);
+    if (configure_pci_for_igd) {
+        libxl_device_pci *pci = NULL;
+        for (i = 0; i < guest_config->num_pcidevs; i++) {
+            pci = &guest_config->pcidevs[i];
+            if (!pci->vdevfn) {
+                /*
+                 * Find the Intel IGD and configure it for slot 2.
+                 * Configure any other devices for slot next_slot.
+                 * Since the guest is configured for IGD passthrough,
+                 * assume the device on the host at slot 2 is the IGD.
+                 */
+                if (pci->domain == 0 && pci->bus == 0 &&
+                    pci->dev == igd_slot && pci->func == 0) {
+                    pci->vdevfn = PCI_DEVFN(igd_slot, 0);
+                } else {
+                    pci->vdevfn = PCI_DEVFN(next_slot, 0);
+                    next_slot++;
+                }
+            }
+        }
+    }
     return 0;
 }
 
-- 
2.39.0


