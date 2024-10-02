Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC5198DF0D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 17:27:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808898.1220975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw1GL-0007lP-J4; Wed, 02 Oct 2024 15:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808898.1220975; Wed, 02 Oct 2024 15:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw1GL-0007j6-Fn; Wed, 02 Oct 2024 15:27:37 +0000
Received: by outflank-mailman (input) for mailman id 808898;
 Wed, 02 Oct 2024 15:27:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VgkK=Q6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sw1GK-00070n-KU
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 15:27:36 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9c8d053-80d2-11ef-a0ba-8be0dac302b0;
 Wed, 02 Oct 2024 17:27:35 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a8a6d1766a7so209487966b.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 08:27:35 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c299ac8esm880024566b.222.2024.10.02.08.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 08:27:33 -0700 (PDT)
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
X-Inumbo-ID: d9c8d053-80d2-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727882854; x=1728487654; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlmcJP5mMuj8YOO1ECpxCc4uELbVcUcDRHL7JcNsxfM=;
        b=ZFPUcU74VORnkol19GRXes2cxs8IQ63GX56evcdMmctNAjjU7ogZFjFcs8pN9b99Hz
         Ub6BwdXlVhyAAengU6yxljJ5jL/a26+lSt8eUVhkfiWc1hd+i5UswKje0Yu21J+w2KMb
         e8Xz/gbDBLN/9x/oMtLVkJBjtnxmhOT8vptqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727882854; x=1728487654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlmcJP5mMuj8YOO1ECpxCc4uELbVcUcDRHL7JcNsxfM=;
        b=noWsJtqarE4oUMBeF16yd/ij94Pnpn2MfQcTSdSSmX7Ob9b0PKxTDeTPoyKCgCZuew
         m7IH/drQ71U/4YcCFD+INKXznhh79LFfcPlphtUB8ObTKdEzX1gfiXeTrzY5LiFbZxT+
         LHqsqKYzxfW8LppzmGC6XmyF73fIEdeV+SaPTHJ9qxW/XgC+4EmhphJ6E32WNKlYjSCg
         NyuosxJGbmDuPxbn8M+kIgIhCmZU5y+KesGx7Q2mR9nCzocHQGGe0lNNavLRkOCP89co
         Tw4Hy50Iy8YEWy2txSnmrmS/KcJpvi5oCNsJ8YqMrnNvbfRN6V7xVGvzyFrqpZMb8/qI
         qFMw==
X-Gm-Message-State: AOJu0YzF0P8e7PNtSAOicm753r3vB6DzDebVLklqKoim7hVbWdd8+87P
	BP8JEA8JtSj3e3MRxifdSKmfVpP5KJ1I5q9r0jWa5pHUx2ZeweKnApNUWNB5Zhw9EetZBhUhZZr
	Plxo=
X-Google-Smtp-Source: AGHT+IHi8P0+vnqz5tpmJRAAFAvo+luLXAKjODyxsKPUmGnaXXk/W1w7BJkeS7/jdbD1VPXtF1hdeA==
X-Received: by 2002:a17:906:db08:b0:a8a:7e24:3230 with SMTP id a640c23a62f3a-a98f8264eddmr337887466b.28.1727882854198;
        Wed, 02 Oct 2024 08:27:34 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/7] x86: Introduce x86_decode_lite()
Date: Wed,  2 Oct 2024 16:27:19 +0100
Message-Id: <20241002152725.1841575-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241002152725.1841575-1-andrew.cooper3@citrix.com>
References: <20241002152725.1841575-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to relocate all IP-relative fields in an alternative replacement
block, we need to decode the instructions enough to obtain their length and
any relative fields.

Full x86_decode() is far too heavyweight, so introduce a minimal form which
can make several simplifying assumptions.

This a mostly-complete decoder for integer instruction in the onebyte and
twobyte maps.  Some instructions are intentionally unsupported, owing to being
unlikely to find in alternatives, and so as to reduce decode complexity.  See
the subsequent patch adding a userspace test harness for further details.

This logic can decode all alternative blocks that exist in Xen right now.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Switch to 0 on failure, rel_sz in bytes
 * Mostly complete the integer instructions; paird with userspace harness
 * Put in .init when !CONFIG_LIVEPATCH
---
 xen/arch/x86/x86_emulate/Makefile      |   6 +
 xen/arch/x86/x86_emulate/decode-lite.c | 311 +++++++++++++++++++++++++
 xen/arch/x86/x86_emulate/private.h     |   2 +
 xen/arch/x86/x86_emulate/x86_emulate.h |  14 ++
 4 files changed, 333 insertions(+)
 create mode 100644 xen/arch/x86/x86_emulate/decode-lite.c

diff --git a/xen/arch/x86/x86_emulate/Makefile b/xen/arch/x86/x86_emulate/Makefile
index 2e20d65d788a..7a56de877f25 100644
--- a/xen/arch/x86/x86_emulate/Makefile
+++ b/xen/arch/x86/x86_emulate/Makefile
@@ -6,3 +6,9 @@ obj-y += decode.o
 obj-$(CONFIG_HVM) += fpu.o
 obj-y += util.o
 obj-y += util-xen.o
+
+ifeq ($(CONFIG_LIVEPATCH),y)
+obj-y += decode-lite.o
+else
+obj-bin-y += decode-lite.init.o
+endif
diff --git a/xen/arch/x86/x86_emulate/decode-lite.c b/xen/arch/x86/x86_emulate/decode-lite.c
new file mode 100644
index 000000000000..6e2581eeab83
--- /dev/null
+++ b/xen/arch/x86/x86_emulate/decode-lite.c
@@ -0,0 +1,311 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include "private.h"
+
+#define Imm8   (1 << 0)
+#define Imm    (1 << 1)
+#define Moffs  (1 << 2)
+#define Branch (1 << 5) /* ... that we care about */
+/*      ModRM  (1 << 6) */
+#define Known  (1 << 7)
+
+#define ALU_OPS                                 \
+    (Known|ModRM),                              \
+    (Known|ModRM),                              \
+    (Known|ModRM),                              \
+    (Known|ModRM),                              \
+    (Known|Imm8),                               \
+    (Known|Imm)
+
+static const uint8_t init_or_livepatch_const onebyte[256] = {
+    [0x00] = ALU_OPS, /* ADD */ [0x08] = ALU_OPS, /* OR  */
+    [0x10] = ALU_OPS, /* ADC */ [0x18] = ALU_OPS, /* SBB */
+    [0x20] = ALU_OPS, /* AND */ [0x28] = ALU_OPS, /* SUB */
+    [0x30] = ALU_OPS, /* XOR */ [0x38] = ALU_OPS, /* CMP */
+/*  [0x40 ... 0x4f] = REX prefixes */
+    [0x50 ... 0x5f] = (Known),             /* PUSH/POP %reg */
+
+    [0x63]          = (Known|ModRM),       /* MOVSxd */
+
+    [0x68]          = (Known|Imm),         /* PUSH $imm */
+    [0x69]          = (Known|ModRM|Imm),   /* IMUL $imm/r/rm */
+    [0x6a]          = (Known|Imm8),        /* PUSH $imm8 */
+    [0x6b]          = (Known|ModRM|Imm8),  /* PUSH $imm8/r/rm */
+    [0x6c ... 0x6f] = (Known),             /* INS/OUTS */
+
+    [0x70 ... 0x7f] = (Known|Branch|Imm8), /* Jcc disp8 */
+    [0x80]          = (Known|ModRM|Imm8),  /* Grp1 */
+    [0x81]          = (Known|ModRM|Imm),   /* Grp1 */
+
+    [0x83]          = (Known|ModRM|Imm8),  /* Grp1 */
+    [0x84 ... 0x8e] = (Known|ModRM),       /* TEST/XCHG/MOV/MOV-SREG/LEA r/rm */
+
+    [0x90 ... 0x99] = (Known),             /* NOP/XCHG rAX/CLTQ/CQTO */
+
+    [0x9b ... 0x9f] = (Known),             /* FWAIT/PUSHF/POPF/SAHF/LAHF */
+
+    [0xa0 ... 0xa3] = (Known|Moffs),       /* MOVABS */
+    [0xa4 ... 0xa7] = (Known),             /* MOVS/CMPS */
+    [0xa8]          = (Known|Imm8),        /* TEST %al */
+    [0xa9]          = (Known|Imm),         /* TEST %al */
+    [0xaa ... 0xaf] = (Known),             /* STOS/LODS/SCAS */
+    [0xb0 ... 0xb7] = (Known|Imm8),        /* MOV $imm8, %reg */
+    [0xb8 ... 0xbf] = (Known|Imm),         /* MOV $imm{16,32,64}, %reg */
+    [0xc0 ... 0xc1] = (Known|ModRM|Imm8),  /* Grp2 (ROL..SAR $imm8, %reg) */
+
+    [0xc3]          = (Known),             /* RET */
+    [0xc6]          = (Known|ModRM|Imm8),  /* Grp11, Further ModRM decode */
+    [0xc7]          = (Known|ModRM|Imm),   /* Grp11, Further ModRM decode */
+
+    [0xcb ... 0xcc] = (Known),             /* LRET/INT3 */
+    [0xcd]          = (Known|Imm8),        /* INT $imm8 */
+
+    [0xd0 ... 0xd3] = (Known|ModRM),       /* Grp2 (ROL..SAR {$1,%cl}, %reg) */
+
+    [0xe4 ... 0xe7] = (Known|Imm8),        /* IN/OUT $imm8 */
+    [0xe8 ... 0xe9] = (Known|Branch|Imm),  /* CALL/JMP disp32 */
+    [0xeb]          = (Known|Branch|Imm8), /* JMP disp8 */
+    [0xec ... 0xef] = (Known),             /* IN/OUT %dx */
+
+    [0xf1]          = (Known),             /* ICEBP */
+    [0xf4]          = (Known),             /* HLT */
+    [0xf5]          = (Known),             /* CMC */
+    [0xf6 ... 0xf7] = (Known|ModRM),       /* Grp3, Further ModRM decode */
+    [0xf8 ... 0xfd] = (Known),             /* CLC ... STD */
+    [0xfe ... 0xff] = (Known|ModRM),       /* Grp4 */
+};
+static const uint8_t init_or_livepatch_const twobyte[256] = {
+    [0x00 ... 0x03] = (Known|ModRM),       /* Grp6/Grp7/LAR/LSL */
+    [0x06]          = (Known),             /* CLTS */
+    [0x09]          = (Known),             /* WBINVD */
+    [0x0b]          = (Known),             /* UD2 */
+
+    [0x18 ... 0x1f] = (Known|ModRM),       /* Grp16 (Hint Nop) */
+    [0x20 ... 0x23] = (Known|ModRM),       /* MOV %cr/%dr */
+
+    [0x30 ... 0x33] = (Known),             /* WRMSR/RDTSC/RDMSR/RDPMC */
+
+    [0x40 ... 0x4f] = (Known|ModRM),       /* CMOVcc */
+
+    [0x80 ... 0x8f] = (Known|Branch|Imm),  /* Jcc disp32 */
+    [0x90 ... 0x9f] = (Known|ModRM),       /* SETcc */
+
+    [0xa0 ... 0xa2] = (Known),             /* PUSH/POP %fs/CPUID */
+    [0xa3]          = (Known|ModRM),       /* BT r/rm */
+    [0xa4]          = (Known|ModRM|Imm8),  /* SHLD $imm8 */
+    [0xa5]          = (Known|ModRM),       /* SHLD %cl */
+
+    [0xa8 ... 0xa9] = (Known),             /* PUSH/POP %gs */
+
+    [0xab]          = (Known|ModRM),       /* BTS */
+    [0xac]          = (Known|ModRM|Imm8),  /* SHRD $imm8 */
+    [0xad ... 0xaf] = (Known|ModRM),       /* SHRD %cl/Grp15/IMUL */
+
+    [0xb0 ... 0xb9] = (Known|ModRM),       /* CMPXCHG/LSS/BTR/LFS/LGS/MOVZxx/POPCNT/Grp10 */
+    [0xba]          = (Known|ModRM|Imm8),  /* Grp8 */
+    [0xbb ... 0xbf] = (Known|ModRM),       /* BSR/BSF/BSR/MOVSX */
+    [0xc0 ... 0xc1] = (Known|ModRM),       /* XADD */
+    [0xc7]          = (Known|ModRM),       /* Grp9 */
+    [0xc8 ... 0xcf] = (Known),             /* BSWAP */
+};
+
+/*
+ * Bare minimum x86 instruction decoder to parse the alternative replacement
+ * instructions and locate the IP-relative references that may need updating.
+ *
+ * These are:
+ *  - disp8/32 from near branches
+ *  - RIP-relative memory references
+ *
+ * The following simplifications are used:
+ *  - All code is 64bit, and the instruction stream is safe to read.
+ *  - The 67 prefix is not implemented, so the address size is only 64bit.
+ *
+ * Inputs:
+ *  @ip  The position to start decoding from.
+ *  @end End of the replacement block.  Exceeding this is considered an error.
+ *
+ * Returns: x86_decode_lite_t
+ *  - On failure, length of 0.
+ *  - On success, length > 0.  For rel_sz > 0, rel points at the relative
+ *    field in the instruction stream.
+ */
+x86_decode_lite_t init_or_livepatch x86_decode_lite(void *ip, void *end)
+{
+    void *start = ip, *rel = NULL;
+    unsigned int opc, rel_sz = 0;
+    uint8_t b, d, rex = 0, osize = 4;
+
+#define OPC_TWOBYTE (1 << 8)
+
+    /* Mutates IP, uses END. */
+#define FETCH(ty)                                       \
+    ({                                                  \
+        ty _val;                                        \
+                                                        \
+        if ( (ip + sizeof(ty)) > end )                  \
+            goto overrun;                               \
+        _val = *(ty *)ip;                               \
+        ip += sizeof(ty);                               \
+        _val;                                           \
+    })
+
+    for ( ;; ) /* Prefixes */
+    {
+        switch ( b = FETCH(uint8_t) )
+        {
+        case 0x26: /* ES override */
+        case 0x2e: /* CS override */
+        case 0x36: /* DS override */
+        case 0x3e: /* SS override */
+        case 0x64: /* FS override */
+        case 0x65: /* GS override */
+        case 0xf0: /* LOCK */
+        case 0xf2: /* REPNE */
+        case 0xf3: /* REP */
+            break;
+
+        case 0x66: /* Operand size override */
+            osize = 2;
+            break;
+
+        /* case 0x67: Address size override, not implemented */
+
+        case 0x40 ... 0x4f: /* REX */
+            rex = b;
+            continue;
+
+        default:
+            goto prefixes_done;
+        }
+        rex = 0; /* REX cancelled by subsequent legacy prefix. */
+    }
+ prefixes_done:
+
+    if ( rex & 0x08 ) /* REX.W */
+        osize = 8;
+
+    /* Fetch the main opcode byte(s) */
+    if ( b == 0x0f )
+    {
+        b = FETCH(uint8_t);
+        opc = OPC_TWOBYTE | b;
+
+        d = twobyte[b];
+    }
+    else
+    {
+        opc = b;
+        d = onebyte[b];
+    }
+
+    if ( unlikely(!(d & Known)) )
+        goto unknown;
+
+    if ( d & ModRM )
+    {
+        uint8_t modrm = FETCH(uint8_t);
+        uint8_t mod = modrm >> 6;
+        uint8_t reg = (modrm >> 3) & 7;
+        uint8_t rm = modrm & 7;
+
+        /* ModRM/SIB decode */
+        if ( mod == 0 && rm == 5 ) /* RIP relative */
+        {
+            rel = ip;
+            rel_sz = 4;
+            FETCH(uint32_t);
+        }
+        else if ( mod != 3 && rm == 4 ) /* SIB */
+        {
+            uint8_t sib = FETCH(uint8_t);
+            uint8_t base = sib & 7;
+
+            if ( mod == 0 && base == 5 )
+                goto disp32;
+        }
+
+        if ( mod == 1 ) /* disp8 */
+            FETCH(uint8_t);
+        else if ( mod == 2 ) /* disp32 */
+        {
+        disp32:
+            FETCH(uint32_t);
+        }
+
+        /* ModRM based decode adjustements */
+        switch ( opc )
+        {
+        case 0xc7: /* Grp11 XBEGIN is a branch. */
+            if ( modrm == 0xf8 )
+                d |= Branch;
+            break;
+        case 0xf6: /* Grp3 TEST(s) have extra Imm8 */
+            if ( reg == 0 || reg == 1 )
+                d |= Imm8;
+            break;
+        case 0xf7: /* Grp3 TEST(s) have extra Imm */
+            if ( reg == 0 || reg == 1 )
+                d |= Imm;
+            break;
+        }
+    }
+
+    if ( d & Branch )
+    {
+        /*
+         * We don't tolerate 66-prefixed call/jmp in alternatives.  Some are
+         * genuinely decoded differently between Intel and AMD CPUs.
+         *
+         * We also don't support APX instructions, so don't have to cope with
+         * JMPABS which is the first branch to have an 8-byte immediate.
+         */
+        if ( osize < 4 )
+            goto bad_osize;
+
+        rel = ip;
+        rel_sz = (d & Imm8) ? 1 : 4;
+    }
+
+    if ( d & (Imm | Imm8 | Moffs) )
+    {
+        if ( d & Imm8 )
+            osize = 1;
+        else if ( d & Moffs )
+            osize = 8;
+        else if ( osize == 8 && !(opc >= 0xb8 && opc <= 0xbf) )
+            osize = 4;
+
+        switch ( osize )
+        {
+        case 1: FETCH(uint8_t);  break;
+        case 2: FETCH(uint16_t); break;
+        case 4: FETCH(uint32_t); break;
+        case 8: FETCH(uint64_t); break;
+        default: goto bad_osize;
+        }
+    }
+
+    return (x86_decode_lite_t){ ip - start, rel_sz, rel };
+
+ bad_osize:
+    printk(XENLOG_ERR "%s() Bad osize %u in %*ph\n",
+           __func__, osize,
+           (int)(unsigned long)(end - start), start);
+    return (x86_decode_lite_t){ 0, 0, NULL };
+
+ unknown:
+    printk(XENLOG_ERR "%s() Unknown opcode in %*ph <%02x> %*ph\n",
+           __func__,
+           (int)(unsigned long)(ip - 1 - start), start, b,
+           (int)(unsigned long)(end - ip), ip);
+    return (x86_decode_lite_t){ 0, 0, NULL };
+
+ overrun:
+    printk(XENLOG_ERR "%s() Decode overrun, got %*ph\n",
+           __func__,
+           (int)(unsigned long)(end - start), start);
+    return (x86_decode_lite_t){ 0, 0, NULL };
+
+#undef FETCH
+}
diff --git a/xen/arch/x86/x86_emulate/private.h b/xen/arch/x86/x86_emulate/private.h
index 172270a458bd..c5e0983948ce 100644
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -9,7 +9,9 @@
 #ifdef __XEN__
 
 # include <xen/bug.h>
+# include <xen/init.h>
 # include <xen/kernel.h>
+# include <xen/livepatch.h>
 # include <asm/endbr.h>
 # include <asm/msr-index.h>
 # include <asm/x86-vendors.h>
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index 3e819d41746e..01c371057626 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -846,4 +846,18 @@ static inline void x86_emul_reset_event(struct x86_emulate_ctxt *ctxt)
     ctxt->event = (struct x86_event){};
 }
 
+/*
+ * x86_decode_lite().  Very minimal decoder for managing alternatives.
+ *
+ * @len is 0 on error, or nonzero on success.  If the instruction has a
+ * relative field, @rel_sz is nonzero, and @rel points at the field.
+ */
+typedef struct {
+    uint8_t len;
+    uint8_t rel_sz; /* bytes: 0, 1 or 4 */
+    void *rel;
+} x86_decode_lite_t;
+
+x86_decode_lite_t x86_decode_lite(void *ip, void *end);
+
 #endif /* __X86_EMULATE_H__ */
-- 
2.39.5


