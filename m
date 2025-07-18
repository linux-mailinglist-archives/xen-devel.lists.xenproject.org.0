Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D30F9B0AB20
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 22:26:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1049201.1419228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucreU-0006M3-BL; Fri, 18 Jul 2025 20:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1049201.1419228; Fri, 18 Jul 2025 20:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucreU-0006JR-88; Fri, 18 Jul 2025 20:25:54 +0000
Received: by outflank-mailman (input) for mailman id 1049201;
 Fri, 18 Jul 2025 20:25:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00bL=Z7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ucreS-0006JK-9t
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 20:25:52 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65bec9ac-6415-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 22:25:51 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45617887276so17783205e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 13:25:51 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca48a23sm2750817f8f.54.2025.07.18.13.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 13:25:49 -0700 (PDT)
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
X-Inumbo-ID: 65bec9ac-6415-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752870350; x=1753475150; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LDcRHEFM13Fw0oaNQ6A4KMPhK2yYxdkuZF6CtQ9seEw=;
        b=gkdCVkJcdtS/MIOjzposxch4c+NT2gfbdeEOMq2TVIXqjr7INdyNNnk5ZV5XM7/ccY
         1n2Huupumy0WTPJ2J1+a+p01Ir1LPiKvT96jwXA0jptp5uABtu6j8oorEDlXBfkWLd5v
         j30NevVRPkBK6168HS8bv7p7V5v9/5akx/BI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752870350; x=1753475150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LDcRHEFM13Fw0oaNQ6A4KMPhK2yYxdkuZF6CtQ9seEw=;
        b=TNZhrmWnF8hZ4v0dAJrHNSVUTDn4X6IsitJQT7X9dy3vE8PzKcxflcagKVciJ11WaL
         bYiB1WDntL/YAdcMXj7qzNjhOj3WavlwcatiX98VCrVOWLgXfsBHXVe64UPUkOgKXMQF
         fd8pnYzZKOJwPvoPRzinubQEwDt7hrQWgZe8fyYT7L7H50e2enw+Ddl+nfrO99zqrcgR
         1y+ouXqP4uBfTrHRTbXaRRrDDmOBd3BCE73WtOlXUG05pq63Hql6OImn5IJr2gb24oem
         r5jbXmhdVBgISl+B5beRlGpq3CtIzes8NUQP0zpYjn3OJEH/jVCsp8Zrkg18MUgTShU9
         NBgA==
X-Gm-Message-State: AOJu0YyTOIV5OdFaHPNyHpQM6DQNdQE7qO2QxlmKk4rnQ6WhRRG9cT64
	N+adj3KnJWZYxiuN9eY32BnMHfodkiGJPmUY9pHZS0DzKLpZwu0Lw1k2OVPUj1S/HwJuUNNbLPe
	/pc9lTKD8pg==
X-Gm-Gg: ASbGncs9ehPMiNwL3BvXADzF5QB/TE1AW9emO2HkqeY4MX5r7+O19pMCSAg+2xIu3eV
	aoS2s4VxjG6zIRKBve1Y3XwpUllk3fU2PRm5ZcmazpHZZwnVU6iC7auwTl9jIgl61rQYYJthSKr
	O4yXyna2RIM3SBZXtjTsprSnTipj22+GbShv8QpPqKzfMSSWA0kC2PCDRLyFOLia2T/NQ9zGHuA
	FQf9lGnoISgN7Xi8eLRzerAktGhXeCv/DjjnZC3Y/furls7Ea+Jei7NkPhpGXIBES/5fJ90tCbG
	LDMlWjOyMfCqZkf4EnMZ30pA++6g0clGSdtNPfFdnPswphXGmpHHnUUb0R7q3XanqkALGgC4+RG
	ow97ATblhcyoPMkV3fuWoTiZrBABOQSagGbW1EDPTTrXx6obyFh5iHZ8xshOKtST1X+rMtuYGAh
	8j
X-Google-Smtp-Source: AGHT+IGPJTpwszaTsw/W5WzQ5MnFI+VgddkqgSkRwy1IEV3rffNgjyCeWHcHQsP/YrjbbiVzmUgphA==
X-Received: by 2002:a05:600c:8211:b0:450:d30e:ff96 with SMTP id 5b1f17b1804b1-4563609dcacmr85443035e9.0.1752870350359;
        Fri, 18 Jul 2025 13:25:50 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/pv: Rework TRY_LOAD_SEG() to use asm goto()
Date: Fri, 18 Jul 2025 21:25:48 +0100
Message-Id: <20250718202548.2834921-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This moves the exception path to being out-of-line within the function, rather
than in the .fixup section, which improves backtraces.

Because the macro is used multiple times, the fault label needs declaring as
local.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Slightly RFC.  I haven't checked if Eclair will be happy with __label__ yet.

It is disappointing that, unless we retain the xor/mov for the exception path,
GCC decides to emit worse code, notably duplicating the mov %ds success path
in mov %es's error path.

The "+r" constraint was actually wrong before; the asm only produces
all_segs_okay and does not consume it.  Given leeway, GCC decides to manifest
$1 in a different register on each error path and OR them together (inverted,
I'm guessing) to reconstitute all_segs_okay.

Still, we've got rid of the manual jmp...
---
 xen/arch/x86/domain.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 56c381618712..d795e5b968e2 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1738,17 +1738,22 @@ static void load_segments(struct vcpu *n)
      * @all_segs_okay in function scope, and load NUL into @sel.
      */
 #define TRY_LOAD_SEG(seg, val)                          \
-    asm_inline volatile (                               \
-        "1: mov %k[_val], %%" #seg "\n\t"               \
-        "2:\n\t"                                        \
-        ".section .fixup, \"ax\"\n\t"                   \
-        "3: xor %k[ok], %k[ok]\n\t"                     \
-        "   mov %k[ok], %%" #seg "\n\t"                 \
-        "   jmp 2b\n\t"                                 \
-        ".previous\n\t"                                 \
-        _ASM_EXTABLE(1b, 3b)                            \
-        : [ok] "+r" (all_segs_okay)                     \
-        : [_val] "rm" (val) )
+    ({                                                  \
+        __label__ fault;                                \
+        asm_inline volatile goto (                      \
+            "1: mov %k[_val], %%" #seg "\n\t"           \
+            _ASM_EXTABLE(1b, %l[fault])                 \
+            :: [_val] "rm" (val)                        \
+            :: fault );                                 \
+        if ( 0 )                                        \
+        {                                               \
+        fault: __attribute__((cold));                   \
+            asm_inline volatile (                       \
+                "xor %k[ok], %k[ok]\n\t"                \
+                "mov %k[ok], %%" #seg                   \
+                : [ok] "=r" (all_segs_okay) );          \
+        }                                               \
+    })
 
     if ( !compat )
     {
-- 
2.39.5


