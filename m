Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C93549E723
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 17:10:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261606.453134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD7La-0001ch-St; Thu, 27 Jan 2022 16:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261606.453134; Thu, 27 Jan 2022 16:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD7La-0001WU-Ln; Thu, 27 Jan 2022 16:10:06 +0000
Received: by outflank-mailman (input) for mailman id 261606;
 Thu, 27 Jan 2022 16:10:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P5DO=SL=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nD7LZ-0001H9-C4
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 16:10:05 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94841f7a-7f8b-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 17:10:03 +0100 (CET)
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
X-Inumbo-ID: 94841f7a-7f8b-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643299803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wmiJm/LpfNDm7MNdAZF82tB57Pb8mKGWOQBYXFHZYDs=;
  b=gnBgYRFwqSh4R+bf55akS7sHARfApZzo29YGUesZ4SzhZgx54Q7cDWJK
   y8/xST5wSdwu6czsgKIG7wWySSNI42fiEB3Ftn6InGq0/kMfqnTxKFjzv
   yG7nutdIoVLq0pD7RG82kH5qD+49fa0sW2zn3/4Udtp68FNDWkQ778Ui8
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: vzJ+nry1dja6wBVGQXCvWj4lZUshMfNS8cca9kr6KogLvgUCs9EZwzt1ebeJu1eLJyY/kk9RCV
 6eWAN/9loy8Xduzi18LSmntg29DSJuqK1m8mGK92/xSQx1sjZEdZVGwzpDB4+4Q8UYAI0Cagsl
 8hmZBMjgC4NL4F5+wD4drOo5Cu5HR8SiiYDePbt5iMrbt73zD2ze4lgnb3dSW+s1u5XsNOH9Ue
 vglwH1NXVsuZioLXsvAuChXoCDmpfO3ZMPb5UUgcNksRO0QUHxrFl6lbDT3YnryKKiWcjFu/8r
 xSHbOOxAGO0AopWe8KHQvmQs
X-SBRS: 5.2
X-MesageID: 62377197
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DUX+KqvJUBhDbsQECFySr7kdd+fnVIJZMUV32f8akzHdYApBsoF/q
 tZmKWyHOP2OZjfyKt9+YY+3oE4A75HTyNNjQFNq+CA8Qy8T+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYx24fhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplsZavDjx4ArPwl8c9SUJ+KAN7OrNa5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AP
 ZFGNmM+M3wsZTV0AGlUMLNupd6nvWjcahhipGO0hZo4tj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKhMQOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO+kw90a2m5bK3wm6JnJfaAVjbds4qNBjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtACzARVodt/xory9U
 J4swZX2AAcmVsnlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk1aZxfIWS3P
 ReO6Gu9AaO/2lPwM8ebhKrqU6wXIVXIT4y5Bpg4kPIQCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2lk3yPjOTPDFbIGeZtGAbfNYgRsfLbyDg5B
 v4CbaNmPT0FDr2nCsQWmKZORW03wY8TXMCv9JcPJ7fde2KL2ggJUpfs/F/oQKQ994w9qwsC1
 ijVtpZwxAWtiHvZBx+Nb3w/OrrjUYwm9SAwPDA2PEbu0H8mON794KAafpoxXL8m6O08kqIkE
 6hbI52NUqZVVzDK2zUBdp2h/oZsQwum2FCVNC2/bTlhI5M5H17V+sXpdxfE/TUVCnblrtM3p
 rCtj1uJQZcKSwl4ItzRbfajkwG4sXQHwbogVErUONhDPk7r9dEyeSD2i/Y2JeAKKAnCmWTGh
 1rHX09AqLCU8YEv8dTPiaSVlKuTErNzThhAAm3WzbeqLi2GrGCt9pBNDbSTdjfHWWKqpKj7P
 bdJz+vxOeEslUpRt9YuCK5iyK8z6oe9p7JeyQg4TnzHY07yV+FlK3iCm8JOqrdM1vlSvg7vA
 hCD/dxTOLOoPsL5EQFOeFp5P7rbjfxEyCPP6fkVIVnh4H4l9bWKZkxeIh2QhXEPN7ByKo4kn
 b8stcN+B9ZTUfb23gJqVhxpylk=
IronPort-HdrOrdr: A9a23:R/36Nqnhudg0ksFWlQBgOJkLp5TpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE8Qr5OUtQ/+xoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCBHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.88,321,1635220800"; 
   d="scan'208";a="62377197"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 2/3] x86/cpuid: Infrastructure for leaf 0x00000007:1.ebx
Date: Thu, 27 Jan 2022 16:09:39 +0000
Message-ID: <20220127160940.19469-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220127160940.19469-1-andrew.cooper3@citrix.com>
References: <20220127160940.19469-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Jan Beulich <jbeulich@suse.com>

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Split in two, rebase.
---
 tools/misc/xen-cpuid.c                      | 5 +++++
 xen/arch/x86/cpu/common.c                   | 3 ++-
 xen/include/public/arch-x86/cpufeatureset.h | 2 ++
 xen/include/xen/lib/x86/cpuid.h             | 7 +++++++
 4 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index a3003245f12a..17e67e379fa4 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -195,6 +195,10 @@ static const char *const str_e21a[32] =
     [ 6] = "nscb",
 };
 
+static const char *const str_7b1[32] =
+{
+};
+
 static const struct {
     const char *name;
     const char *abbr;
@@ -213,6 +217,7 @@ static const struct {
     { "0x00000007:0.edx", "7d0", str_7d0 },
     { "0x00000007:1.eax", "7a1", str_7a1 },
     { "0x80000021.eax",  "e21a", str_e21a },
+    { "0x00000007:1.ebx", "7b1", str_7b1 },
 };
 
 #define COL_ALIGN "18"
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index c6773c85fd3e..d4f5028fa2ec 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -445,7 +445,8 @@ static void generic_identify(struct cpuinfo_x86 *c)
 		if (max_subleaf >= 1)
 			cpuid_count(7, 1,
 				    &c->x86_capability[FEATURESET_7a1],
-				    &tmp, &tmp, &tmp);
+				    &c->x86_capability[FEATURESET_7b1],
+				    &tmp, &tmp);
 	}
 
 	if (c->cpuid_level >= 0xd)
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 0b399375566f..588f924de59e 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -299,6 +299,8 @@ XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */
 XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */
 XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base (and limit too) */
 
+/* Intel-defined CPU features, CPUID level 0x00000007:1.ebx, word 12 */
+
 #endif /* XEN_CPUFEATURE */
 
 /* Clean up from a default include.  Close the enum (for C). */
diff --git a/xen/include/xen/lib/x86/cpuid.h b/xen/include/xen/lib/x86/cpuid.h
index a4d254ea96e0..e87036b30380 100644
--- a/xen/include/xen/lib/x86/cpuid.h
+++ b/xen/include/xen/lib/x86/cpuid.h
@@ -16,6 +16,7 @@
 #define FEATURESET_7d0    9 /* 0x00000007:0.edx    */
 #define FEATURESET_7a1   10 /* 0x00000007:1.eax    */
 #define FEATURESET_e21a  11 /* 0x80000021.eax      */
+#define FEATURESET_7b1   12 /* 0x00000007:1.ebx    */
 
 struct cpuid_leaf
 {
@@ -188,6 +189,10 @@ struct cpuid_policy
                 uint32_t _7a1;
                 struct { DECL_BITFIELD(7a1); };
             };
+            union {
+                uint32_t _7b1;
+                struct { DECL_BITFIELD(7b1); };
+            };
         };
     } feat;
 
@@ -327,6 +332,7 @@ static inline void cpuid_policy_to_featureset(
     fs[FEATURESET_7d0] = p->feat._7d0;
     fs[FEATURESET_7a1] = p->feat._7a1;
     fs[FEATURESET_e21a] = p->extd.e21a;
+    fs[FEATURESET_7b1] = p->feat._7b1;
 }
 
 /* Fill in a CPUID policy from a featureset bitmap. */
@@ -345,6 +351,7 @@ static inline void cpuid_featureset_to_policy(
     p->feat._7d0  = fs[FEATURESET_7d0];
     p->feat._7a1  = fs[FEATURESET_7a1];
     p->extd.e21a  = fs[FEATURESET_e21a];
+    p->feat._7b1  = fs[FEATURESET_7b1];
 }
 
 static inline uint64_t cpuid_policy_xcr0_max(const struct cpuid_policy *p)
-- 
2.11.0


