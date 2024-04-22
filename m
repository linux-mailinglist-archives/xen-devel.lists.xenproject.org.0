Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 403EA8AD3B6
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 20:15:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710193.1109315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryyBf-0000oS-28; Mon, 22 Apr 2024 18:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710193.1109315; Mon, 22 Apr 2024 18:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryyBe-0000g7-V2; Mon, 22 Apr 2024 18:14:42 +0000
Received: by outflank-mailman (input) for mailman id 710193;
 Mon, 22 Apr 2024 18:14:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/m7Q=L3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ryyBd-0000Oz-FA
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 18:14:41 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2eaaf11d-00d4-11ef-b4bb-af5377834399;
 Mon, 22 Apr 2024 20:14:38 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-56e136cbcecso6788378a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 11:14:38 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z15-20020a170906668f00b00a51d073da7esm5994224ejo.82.2024.04.22.11.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 11:14:37 -0700 (PDT)
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
X-Inumbo-ID: 2eaaf11d-00d4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713809678; x=1714414478; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RRljp8ilqBOCq7+riUQu2IxAcNGdCvaCKnCfHGbuws=;
        b=u73wAZeaC42onoCzpA2HsXTCOhDXT4Y7CH8on5ZJOI8H5KnR91YSaSgn0cO63+pCc8
         jL/8itLcWkrLbZvNjWphMaib1bQtDNmUfH4GmUiUPCUzryL90KpKuft+CxGDVaXjneWo
         2HUUrh5sErCC3FziPwUDMLMfP8O0PGIaGsK8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713809678; x=1714414478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6RRljp8ilqBOCq7+riUQu2IxAcNGdCvaCKnCfHGbuws=;
        b=RHJV3rB8EF5RXAKd3cKU1XgWmG82ie52JZqqRVOvuz2un+K0lD+T5vdkXjRU05CvDd
         hVhU2jdFCtNuPqXi5OtPE5EkjhkIDO0otbnSCy+yG7ZSb3smoxFcGksF3VmKVvyN9L4k
         76dBnjJUPZ+4ZCu+LiaJ72+exu8ShsWmM5pTLNC1+V8tTKiMqJWSlZ10Nub/ljiSNdXa
         2YPKEXs1yub8csebe7P/4k+gWjBIwBTWCS4ld4nJ9f5lYVA6CdLiTY+b7CitZPghyi28
         YXjYYzvzeKr0hA0B8n4jRDi2unDiee6ffRqtX5g0ec8i7ThXipHB01Nf5hB84ynZuNTw
         nxfQ==
X-Gm-Message-State: AOJu0Yw9NidK+KP2Q57ra+jcEv4PrqDfveRTI48HjHxnDVyZaLEcL763
	nawJjWanaRICJqZ3tPcSAoSX1mx2iuUTz0zI59J+AoCKLB0fr2yDDFK9qFTAjLQejjmI3adY+Mg
	9nnI=
X-Google-Smtp-Source: AGHT+IGXtcazIcbQnNsHc45oDqFJsnTRiN7QccNtav/aj2Lc2owoQkx7kwbiFs6TnAPwRJubHQtmzg==
X-Received: by 2002:a17:906:eb4f:b0:a58:725b:9fea with SMTP id mc15-20020a170906eb4f00b00a58725b9feamr846018ejb.21.1713809677900;
        Mon, 22 Apr 2024 11:14:37 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/6] x86: Introduce x86_decode_lite()
Date: Mon, 22 Apr 2024 19:14:29 +0100
Message-Id: <20240422181434.3463252-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240422181434.3463252-1-andrew.cooper3@citrix.com>
References: <20240422181434.3463252-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to relocate all IP-relative fields in an alternative replacement
block, we need to decode the instructions enough to obtain their length and
any relative fields.

Full x86_decode() is far too heavyweight, so introduce a minimal form which
can make several simplifying assumptions.

This logic is sufficient to decode all alternative blocks that exist in Xen
right now.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/x86_emulate/Makefile      |   1 +
 xen/arch/x86/x86_emulate/decode-lite.c | 245 +++++++++++++++++++++++++
 xen/arch/x86/x86_emulate/private.h     |   2 +
 xen/arch/x86/x86_emulate/x86_emulate.h |  17 ++
 4 files changed, 265 insertions(+)
 create mode 100644 xen/arch/x86/x86_emulate/decode-lite.c

diff --git a/xen/arch/x86/x86_emulate/Makefile b/xen/arch/x86/x86_emulate/Makefile
index 2e20d65d788a..f06731913d67 100644
--- a/xen/arch/x86/x86_emulate/Makefile
+++ b/xen/arch/x86/x86_emulate/Makefile
@@ -3,6 +3,7 @@ obj-y += 0fae.o
 obj-y += 0fc7.o
 obj-y += blk.o
 obj-y += decode.o
+obj-y += decode-lite.o
 obj-$(CONFIG_HVM) += fpu.o
 obj-y += util.o
 obj-y += util-xen.o
diff --git a/xen/arch/x86/x86_emulate/decode-lite.c b/xen/arch/x86/x86_emulate/decode-lite.c
new file mode 100644
index 000000000000..050b0d8cf4a8
--- /dev/null
+++ b/xen/arch/x86/x86_emulate/decode-lite.c
@@ -0,0 +1,245 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include "private.h"
+
+#define Imm8   (1 << 0)
+#define Imm    (1 << 1)
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
+
+    [0x50 ... 0x5f] = (Known),             /* PUSH/POP %reg */
+
+    [0x70 ... 0x7f] = (Known|Branch|Imm8), /* Jcc disp8 */
+    [0x80]          = (Known|ModRM|Imm8),
+    [0x81]          = (Known|ModRM|Imm),
+
+    [0x83]          = (Known|ModRM|Imm8),
+    [0x84 ... 0x8e] = (Known|ModRM),       /* TEST/XCHG/MOV/MOV-SREG/LEA r/rm */
+
+    [0xb0 ... 0xb7] = (Known|Imm8),        /* MOV $imm8, %reg */
+    [0xb8 ... 0xbf] = (Known|Imm),         /* MOV $imm32, %reg */
+
+    [0xcc]          = (Known),             /* INT3 */
+    [0xcd]          = (Known|Imm8),        /* INT $imm8 */
+
+    [0xe8 ... 0xe9] = (Known|Branch|Imm),  /* CALL/JMP disp32 */
+    [0xeb]          = (Known|Branch|Imm8), /* JMP disp8 */
+
+    [0xf1]          = (Known),             /* ICEBP */
+    [0xf4]          = (Known),             /* HLT */
+    [0xf5]          = (Known),             /* CMC */
+    [0xf6 ... 0xf7] = (Known|ModRM),       /* Grp3 */
+    [0xf8 ... 0xfd] = (Known),             /* CLC ... STD */
+    [0xfe ... 0xff] = (Known|ModRM),       /* Grp4 */
+};
+static const uint8_t init_or_livepatch_const twobyte[256] = {
+    [0x00 ... 0x01] = (Known|ModRM),       /* Grp6/Grp7 */
+
+    [0x18 ... 0x1f] = (Known|ModRM),       /* Grp16 (Hint Nop) */
+
+    [0x20 ... 0x23] = (Known|ModRM),       /* MOV CR/DR */
+
+    [0x30 ... 0x34] = (Known),             /* WRMSR ... RDPMC */
+    [0x40 ... 0x4f] = (Known|ModRM),       /* CMOVcc */
+
+    [0x80 ... 0x8f] = (Known|Branch|Imm),  /* Jcc disp32 */
+    [0x90 ... 0x9f] = (Known|ModRM),       /* SETcc */
+
+    [0xab]          = (Known|ModRM),       /* BTS */
+    [0xac]          = (Known|ModRM|Imm8),  /* SHRD $imm8 */
+    [0xad ... 0xaf] = (Known|ModRM),       /* SHRD %cl / Grp15 / IMUL */
+
+    [0xb8 ... 0xb9] = (Known|ModRM),       /* POPCNT/Grp10 (UD1) */
+    [0xba]          = (Known|ModRM|Imm8),  /* Grp8 */
+    [0xbb ... 0xbf] = (Known|ModRM),       /* BSR/BSF/BSR/MOVSX */
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
+ *  - On failure, length of -1.
+ *  - On success, length > 0 and REL_TYPE_*.  For REL_TYPE != NONE, rel points
+ *    at the relative field in the instruction stream.
+ */
+x86_decode_lite_t init_or_livepatch x86_decode_lite(void *ip, void *end)
+{
+    void *start = ip, *rel = NULL;
+    unsigned int opc, type = REL_TYPE_NONE;
+    uint8_t b, d, osize = 4;
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
+        case 0xf0: /* Lock */
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
+            continue;
+
+        default:
+            goto prefixes_done;
+        }
+    }
+ prefixes_done:
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
+            type = REL_TYPE_d32;
+            FETCH(uint32_t);
+        }
+        else if ( mod != 3 && rm == 4 ) /* SIB */
+            FETCH(uint8_t);
+
+        if ( mod == 1 ) /* disp8 */
+            FETCH(uint8_t);
+        else if ( mod == 2 ) /* disp32 */
+            FETCH(uint32_t);
+
+        /* ModRM based decode adjustements */
+        switch ( opc )
+        {
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
+         * Don't tolerate 66-prefixed call/jmp in alternatives.  Some are
+         * genuinely decoded differently between Intel and AMD CPUs.
+         */
+        if ( osize != 4 )
+            goto bad_osize;
+
+        rel = ip;
+        type = (d & Imm8) ? REL_TYPE_d8 : REL_TYPE_d32;
+    }
+
+    if ( d & (Imm|Imm8) )
+    {
+        if ( d & Imm8 )
+            osize = 1;
+
+        switch ( osize )
+        {
+        case 1: FETCH(uint8_t);  break;
+        case 2: FETCH(uint16_t); break;
+        case 4: FETCH(uint32_t); break;
+        default: goto bad_osize;
+        }
+    }
+
+    return (x86_decode_lite_t){ ip - start, type, rel };
+
+ bad_osize:
+    printk(XENLOG_ERR "%s() Bad osize %u in %*ph\n",
+           __func__, osize,
+           (int)(unsigned long)(end - start), start);
+    return (x86_decode_lite_t){ -1, REL_TYPE_NONE, NULL };
+
+ unknown:
+    printk(XENLOG_ERR "%s() Unknown opcode in %*ph <%02x> %*ph\n",
+           __func__,
+           (int)(unsigned long)(ip - 1 - start), start, b,
+           (int)(unsigned long)(end - ip), ip);
+    return (x86_decode_lite_t){ -1, REL_TYPE_NONE, NULL };
+
+ overrun:
+    printk(XENLOG_ERR "%s() Decode overrun, got %*ph\n",
+           __func__,
+           (int)(unsigned long)(end - start), start);
+    return (x86_decode_lite_t){ -1, REL_TYPE_NONE, NULL };
+
+#undef FETCH
+}
diff --git a/xen/arch/x86/x86_emulate/private.h b/xen/arch/x86/x86_emulate/private.h
index 0fa26ba00aa5..792b04889ce6 100644
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
index d92be69d84d9..b7cbcd8b70ba 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -842,4 +842,21 @@ static inline void x86_emul_reset_event(struct x86_emulate_ctxt *ctxt)
     ctxt->event = (struct x86_event){};
 }
 
+/*
+ * x86_decode_lite().  Very minimal decoder for managing alternatives.
+ *
+ * @len is -1 on error, or positive on success.  If the instruction has a
+ * relative field, REL_TYPE_* gives the size, and @rel points at the field.
+ */
+typedef struct {
+    int8_t len;
+    uint8_t rel_type;
+#define REL_TYPE_NONE 0
+#define REL_TYPE_d8   1
+#define REL_TYPE_d32  2
+    void *rel;
+} x86_decode_lite_t;
+
+x86_decode_lite_t x86_decode_lite(void *ip, void *end);
+
 #endif /* __X86_EMULATE_H__ */
-- 
2.30.2


