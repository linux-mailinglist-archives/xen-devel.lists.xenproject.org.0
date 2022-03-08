Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F02E24D19EE
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 15:02:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286944.486666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRaPa-0004Yj-Jk; Tue, 08 Mar 2022 14:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286944.486666; Tue, 08 Mar 2022 14:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRaPa-0004WT-GF; Tue, 08 Mar 2022 14:02:02 +0000
Received: by outflank-mailman (input) for mailman id 286944;
 Tue, 08 Mar 2022 14:02:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LykH=TT=citrix.com=prvs=059d7c239=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nRaPY-0004W4-Ch
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 14:02:00 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51028d95-9ee8-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 15:01:58 +0100 (CET)
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
X-Inumbo-ID: 51028d95-9ee8-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646748119;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=58u414P6xR5hJNvUdcKD4U/dpwXfBAfsKY6bVSqnPnE=;
  b=K2n6vAoZhZwb6lh5cEnHNnq4IVzPsjLfAlFH16vpsEXVULjH98P4jNnY
   OgZ1N94I+r5rVIPifI0NSav5SrYf/Xueajx3sc0/4nu/hkElshny0P0bl
   /fVvSIMbYmcLCtmFNTp4YZOjTxF3KrhfGyvIDZoNWyyCrBvfknQ9/36oZ
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 66105469
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:IwBB96rExgM8arH0zo4ZIsHuZ5deBmIrZRIvgKrLsJaIsI4StFCzt
 garIBmHPf2JZTOmftt2PIq2/E8FusfSxtQ2TFY5rC4zFCIb8JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvW4
 YOq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBGb3FpcA5QkBkPGImH7Qf87LaE36mmJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI5DfVF/s5B7vERL3H/4Rw1zYsnMFeW/3ZY
 qL1bBIxMk2YPkERaz/7Dro6jsmTpkj2KgRz6xGY+YRnvlTc0S5Yhe2F3N39JYXRGJQ9clyjj
 m7B8m70BjkTMdWNzjzD/n/ErurMgAvyXYsAE7v++vMCqFiLwWwXARYVfVK+qOu+jAiyVrp3O
 0ESvyYjs6U23EiqVcXmGQ21pmaeuRwRUMYWFPc1gCmv4KfJ5weSBkAfUyVMLtchsaceWjgCx
 lKP2dTzClRSXKa9ECzHsO3O9HXrZHZTfTRqiTI4oRUtxMnqnaUXn0vzYZU7MrfshdDoKzfp6
 mXfxMQhvIk7gckO3qS92FnIhTOwu5TEJjIIChXrsnGNtV0gOtP8D2C8wR2CtKsbct7FJrWUl
 CVcw6CjAPYy4YZhfcBnaMEEB/mX6vmMK1UwanY/TsB6p1xBF5NOFL28AQ2Sxm80aq7omhezO
 Sc/XD+9ArcJZBNGioctP+qM5zwCl/SIKDgcfqm8giBySpZwbhSb2ypleFSd2Wvg+GB1z/1hZ
 8jLLJ31XStBYUiC8NZQb71GuVPM7npirV4/uLihl0j3uVZgTCT9pUg53KumMblisfLsTPT9+
 NdDLcqaoyizo8WlChQ7BbU7dAhQRVBiXMieg5UOKoarf1o3cEl8WqS56e5wJORYc1F9y76gE
 oeVARQDljISRBTvdG23V5yUQO+3DcYl8yNhZnBE0JTB8yFLXLtDJZw3L/MfFYTLPsQ/pRKoZ
 5Hpo/m9P8k=
IronPort-HdrOrdr: A9a23:ITb3X6MyuyoQj8BcThijsMiBIKoaSvp037By7TEJdfRUGvb4qy
 ncpoVi6faUskdsZJhOo6HkBEDtexzhHNtOkO8s1NSZLXbbUQmTXeVfBOLZqlWKcUCTygce79
 YGT0EUMr3N5C1B/KTHCX6DYrUdKbe8npxAzt2utEuFBTsaEZ2JYm1Ce3im+2NNNXR7OaY=
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="66105469"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Bjoern Doebel
	<doebel@amazon.de>, Michael Kurth <mku@amazon.de>, Martin Pohlack
	<mpohlack@amazon.de>
Subject: [PATCH] x86/cet: Use dedicated NOP4 for cf_clobber
Date: Tue, 8 Mar 2022 14:01:26 +0000
Message-ID: <20220308140126.8815-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

For livepatching, we need to look at a potentially clobbered function and
determine whether it used to have an ENDBR64 instruction.

Use a non-default 4-byte P6 long nop, not emitted by toolchains, and introduce
the was_endbr64() predicate.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Bjoern Doebel <doebel@amazon.de>
CC: Michael Kurth <mku@amazon.de>
CC: Martin Pohlack <mpohlack@amazon.de>

Bjoern: For the livepatching code, I think you want:

  if ( is_endbr64(...) || was_endbr64(...) )
      needed += ENDBR64_LEN;
---
 xen/arch/x86/alternative.c       | 10 +++++++++-
 xen/arch/x86/include/asm/endbr.h | 12 ++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index d41eeef1bcaf..ffb1b1d960c8 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -362,7 +362,15 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
             if ( !is_kernel_text(ptr) || !is_endbr64(ptr) )
                 continue;
 
-            add_nops(ptr, ENDBR64_LEN);
+            /*
+             * Can't use add_nops() here.  ENDBR64_POISON is specifically
+             * different to NOP4 so it can be spotted after the fact.
+             *
+             * All CET-capable hardware uses P6 NOPS (no need to plumb through
+             * ideal_nops), and doesn't require a branch to synchronise the
+             * instruction stream.
+             */
+            memcpy(ptr, ENDBR64_POISON, ENDBR64_LEN);
             clobbered++;
         }
 
diff --git a/xen/arch/x86/include/asm/endbr.h b/xen/arch/x86/include/asm/endbr.h
index 6090afeb0bd8..5e1e55cb467d 100644
--- a/xen/arch/x86/include/asm/endbr.h
+++ b/xen/arch/x86/include/asm/endbr.h
@@ -52,4 +52,16 @@ static inline void place_endbr64(void *ptr)
     *(uint32_t *)ptr = gen_endbr64();
 }
 
+/*
+ * After clobbering ENDBR64, we may need to confirm that the site used to
+ * contain an ENDBR64 instruction.  Use an encoding which isn't the default
+ * P6_NOP4.
+ */
+#define ENDBR64_POISON "\x66\x0f\x1f\x00" /* osp nopl (%rax) */
+
+static inline bool was_endbr64(const void *ptr)
+{
+    return *(const uint32_t *)ptr == 0x001f0f66;
+}
+
 #endif /* XEN_ASM_ENDBR_H */
-- 
2.11.0


