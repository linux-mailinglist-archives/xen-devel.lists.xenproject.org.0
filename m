Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A037A842721
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 15:49:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673486.1047828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpQ0-00049l-IZ; Tue, 30 Jan 2024 14:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673486.1047828; Tue, 30 Jan 2024 14:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpQ0-00047b-G2; Tue, 30 Jan 2024 14:48:56 +0000
Received: by outflank-mailman (input) for mailman id 673486;
 Tue, 30 Jan 2024 14:48:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Trk4=JI=citrix.com=prvs=75271d196=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rUpPy-0003zv-Jm
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 14:48:54 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae581324-bf7e-11ee-98f5-efadbce2ee36;
 Tue, 30 Jan 2024 15:48:52 +0100 (CET)
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
X-Inumbo-ID: ae581324-bf7e-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1706626131;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PE5mAhJYnlI3g+aj3+hmUQ3PXxetuYZDIFwjnEku6zA=;
  b=bkDOCrYt4rxX3HR85xA+SjnQxVeKNcS3gv2W3mvvDqOxpbitWFe1iKeO
   Mre5SnPuKok7nSLaB6vSqAu2/9XNs4NX4yiKKhd6A34jHe0QusD0f3Jw/
   pLLr0qb1ja+1mlHMcrzXYawgVLFAca7LS+5fOp9lX6FGVPgY9sCgNvSUn
   4=;
X-CSE-ConnectionGUID: M/SXR7M5QgGvx5/u1jjOpQ==
X-CSE-MsgGUID: 0J3Gdn1CRLCmi+r+SAeRXA==
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 128982911
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:tydG/q5mIuDBknvFX2cN1QxRtHXHchMFZxGqfqrLsTDasY5as4F+v
 jBKUW7UPfuCYGr9cowgYIux9UkP7MTUydMyTQU9ri1nHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU34ZwehBtC5gZiPakR7QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m0
 LsjGApSS026iM2o0O/8V7BuhOM7FZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmRJUIXUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxBbJ9
 jiXpj2R7hcybP7E5jaDq1mWosTKnGDhG7k7GYeI36s/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZebPQ2uclwQiYlv
 mJlhPuwW2Yp6ufMDyvAp/HL9VteJBT5M0cnIhQ0d1QgvuDsj58j01XSF9RhN7aM24id9S7L/
 9yakMQvr+xM1ZBVjvTqogyvvt66mnTeoucICuTrsoGNtFoRiHaNPdDA1LQixa8owHylZleAp
 mMYvMOV8foDC5qA/ATUH71TQezyu6vZYGyC6bKKI3XH327xk5JEVdkOiAyS2W8zappUEdMXS
 BG7VfxtCG97YyLxMP4fj3OZAMU216nwfenYugTvRoMWOPBZLVbXlByCkGbMhwgBZmBwy/BgU
 XpaGO7wZUsn5VNPlWDuF7pNjOF0mEjTBwr7HPjG8vhu6pLGDFb9dFvPGALXBgzlxMtoeDnoz
 us=
IronPort-HdrOrdr: A9a23:hX3n/qiLvUrX15STy1h7W7HC/3BQXtYji2hC6mlwRA09TySZ//
 rBoB19726StN9xYgBFpTnuAsm9qB/nmaKdgrNhWItKPjOW21dARbsKheCJrgEIcxeOkNK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-Talos-CUID: =?us-ascii?q?9a23=3AW/SzmGvlW7FfYPdEVoIKhsme6IsANUbt9ij1fna?=
 =?us-ascii?q?3Jnh5FfqIEF2S37tdxp8=3D?=
X-Talos-MUID: 9a23:94ORSwa7aiZFIOBT7x23qz1kbexSx4+rCQMX0q4vtvO0HHkl
X-IronPort-AV: E=Sophos;i="6.05,707,1701147600"; 
   d="scan'208";a="128982911"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/boot: Add braces in reloc.c
Date: Tue, 30 Jan 2024 14:48:38 +0000
Message-ID: <20240130144838.4119329-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

107 lines is an unreasonably large switch statement to live inside a
brace-less for loop.  Drop the comment that's clumsily trying to cover the
fact that this logic has wrong-looking indentation.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/boot/reloc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index 77fdb2be0573..4033557481e8 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -230,6 +230,7 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
     /* Put all needed data into mbi_out. */
     for ( tag = _p(ptr); (u32)tag - mbi_in < mbi_fix->total_size;
           tag = _p(ALIGN_UP((u32)tag + tag->size, MULTIBOOT2_TAG_ALIGN)) )
+    {
         switch ( tag->type )
         {
         case MULTIBOOT2_TAG_TYPE_BOOT_LOADER_NAME:
@@ -332,11 +333,12 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
 #endif /* CONFIG_VIDEO */
 
         case MULTIBOOT2_TAG_TYPE_END:
-            goto end; /* Cannot "break;" here. */
+            goto end;
 
         default:
             break;
         }
+    }
 
  end:
 

base-commit: 4a7e71aa085170f1a13976507c8e248f8715f116
-- 
2.30.2


