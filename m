Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C9BA71A2C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 16:26:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927997.1330761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txSdu-00061P-P3; Wed, 26 Mar 2025 15:26:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927997.1330761; Wed, 26 Mar 2025 15:26:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txSdu-0005yc-Li; Wed, 26 Mar 2025 15:26:10 +0000
Received: by outflank-mailman (input) for mailman id 927997;
 Wed, 26 Mar 2025 15:26:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16MU=WN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1txSds-0005yW-LN
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 15:26:08 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fe8a387-0a56-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 16:26:01 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so52158675e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 08:26:01 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82e6a63esm5142935e9.11.2025.03.26.08.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 08:26:00 -0700 (PDT)
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
X-Inumbo-ID: 9fe8a387-0a56-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743002761; x=1743607561; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/8oC34c+nLZAaPtoZy2V78kLXk+qgqEAnnYNf7/Mbkk=;
        b=Zt4HiKkNrKnusPxyjuXThkv7voesSVCl5K4cZXP2hkaSEa3+LQL5Ek8IQLz0+2Lvrx
         /rp6zd6DiBcNOEkOEfIWgJuzwY7e9VBxi4pXpU/D+HVRHXQw2fiJdRKhumIzPpmAuxaU
         xjZ0BrAliUE+Xj4PcBk14mF3TE1gfqqx6/CII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743002761; x=1743607561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8oC34c+nLZAaPtoZy2V78kLXk+qgqEAnnYNf7/Mbkk=;
        b=S/ndJqsWOgOwei6VuvMUESunJJmPhRkX+qfWkxfeeJfY2jhIuTqRCMnNzvR6aJhCgA
         JYbEEOYCGvfQajMy7ivD4CX+MvWP9pdit24P0Ajmb0wxkaduvJ/VDSWjEJ4gnBaOSYjq
         zg12LXxQcD0WgJiwu/YUw/KAO224zwjdI+8PK255pOAVCDMP+ZQSlKlvU8/iX8NdvZOK
         jr1iKxdbEv/h1rVbDzNIz8+XE7/NrQ03tjhkPoHNK9TwsVpO6Mz+6RKm8n4XEUj7BsR+
         /V1QLz9RoeaMMcPHDaw62gMtvHArAZ0Q8+o7e/9o4aJN9FeCIfJDiIbbpYWKmLqMlLVP
         AxGg==
X-Gm-Message-State: AOJu0Yypd8/GKaxrXP0BZDKq+7ZFiaxPddPWnDgLnXHlfDtE1F9qiht4
	AwC33PzMZZRt28bpLTZlLaEEywjFz0q9HlXC6JxrtaShObDCUrBiHetpox03ugefTpl7iQYdE8l
	19RQ=
X-Gm-Gg: ASbGncvMjl+5ToKng56jgnZRulTpQDrbtq+iOK4lskuK2k7DhFicoQbDLP96/MaapiB
	YnuW+8dKy3qdEdsIIukEsWVfWZ1JXI7oclEnHN+xt//JtBrlPW7dWGpN80IKqoR1DEC6X1tAlwr
	rvXp/OMm9+bmNyBhPmkPOsi2ubQgoqkLxrYoVXVmzgdREgJWZsliI1gGeTk1qjfYY5cVDVgAnCV
	BOQGgXw7Sqpsk3QzKwmKsYrbIs+vj5EPLKDhngVR2X3iivTjJ/KPtksk2CRq6Y+57SBqXPgkPnR
	oQOrdA1MvD/tg6CpgVc9DxwgQwV70hpKUhjzn9t6XZj+0vTj7NSJ31Ggo7LWtrykb/tVGuYWAxJ
	7tfr7lNfC4SHLH5g6zg==
X-Google-Smtp-Source: AGHT+IH6MShYffuxbjDdUqB8RFBDhCxfbFg4CEsTMU0k1vseBE0QU1Z/fzvNrAzNW4zlVQ8MY3fZ1A==
X-Received: by 2002:a05:600c:3d19:b0:43d:209:21fd with SMTP id 5b1f17b1804b1-43d50a3ce66mr230876855e9.30.1743002760704;
        Wed, 26 Mar 2025 08:26:00 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/emul: Adjust handling of CR8_LEGACY
Date: Wed, 26 Mar 2025 15:25:58 +0000
Message-Id: <20250326152558.350103-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The CR8_LEGACY feature was introduced in the K8 Revision F.  It doesn't exist
in prior revisions of the K8.

Furthermore, from APM Vol2 3.1.5 CR8 (Task Priority Register, TPR):

  The AMD64 architecture introduces a new control register, CR8, defined as
  the task priority register (TPR).

Give CR8_LEGACY a dependency on LM, seeing as CR8 doesn't exist on pre-64bit
CPUs.

Additionally, from APM Vol3 4 System Instructions MOV CRn:

  CR8 can be read and written in 64-bit mode, using a REX prefix.  CR8 can be
  read and written in all modes using a LOCK prefix instead of a REX prefix to
  specify the additional opcode bit.

i.e. the LOCK prefix serves as an alternative encoding for REX.R.

Switch decode_twobyte() from += 8 to |= 8 to better match the description
given.  Other indications that the encoding isn't additive are that the CR
intercepts stop at 15, that LOCK MOV CR8 generates #UD rather than becoming a
CR0 access.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Also, designers never put an ADD into silicon if they can possibly avoid it,
because it's slow and large compared to the single OR gate needed in this
case.
---
 xen/arch/x86/x86_emulate/decode.c |  4 ++--
 xen/tools/gen-cpuid.py            | 10 ++++++----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/decode.c b/xen/arch/x86/x86_emulate/decode.c
index 7ce97c4726dc..e4a17ea2cd59 100644
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -777,10 +777,10 @@ decode_twobyte(struct x86_emulate_state *s,
     case 0x20: case 0x22: /* mov to/from cr */
         if ( s->lock_prefix && vcpu_has_cr8_legacy() )
         {
-            s->modrm_reg += 8;
+            s->modrm_reg |= 8;
             s->lock_prefix = false;
         }
-        /* fall through */
+        fallthrough;
     case 0x21: case 0x23: /* mov to/from dr */
         ASSERT(s->ea.type == OP_REG); /* Early operand adjustment ensures this. */
         generate_exception_if(s->lock_prefix, X86_EXC_UD);
diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index a77cb30bdb4f..bb7ac5291589 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -271,10 +271,12 @@ def crunch_numbers(state):
 
         # CX16 is only encodable in Long Mode.  LAHF_LM indicates that the
         # SAHF/LAHF instructions are reintroduced in Long Mode.  1GB
-        # superpages, PCID and PKU are only available in 4 level paging.
-        # NO_LMSL indicates the absense of Long Mode Segment Limits, which
-        # have been dropped in hardware.
-        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, AMX_TILE, CMPCCXADD],
+        # superpages, PCID and PKU are only available in 4 level paging.  The
+        # CR8 register only exists in the AMD64 architecture.  NO_LMSL
+        # indicates the absense of Long Mode Segment Limits, which have been
+        # dropped in hardware.
+        LM: [CX16, PCID, LAHF_LM, CR8_LEGACY, PAGE1GB, PKU, NO_LMSL,
+             AMX_TILE, CMPCCXADD],
 
         # AMD K6-2+ and K6-III processors shipped with 3DNow+, beyond the
         # standard 3DNow in the earlier K6 processors.

base-commit: 38adc2d7879c9a68b21a1dddb09d9c9f34d15ee4
-- 
2.39.5


