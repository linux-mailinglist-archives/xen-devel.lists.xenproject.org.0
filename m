Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7B29F511A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 17:33:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859435.1271567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaVI-0001NT-HO; Tue, 17 Dec 2024 16:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859435.1271567; Tue, 17 Dec 2024 16:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaVI-0001Kq-8U; Tue, 17 Dec 2024 16:33:00 +0000
Received: by outflank-mailman (input) for mailman id 859435;
 Tue, 17 Dec 2024 16:32:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BizT=TK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tNaVH-0001J8-4j
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 16:32:59 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92487daf-bc94-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 17:32:56 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-30229d5b229so53725561fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 08:32:56 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344175b51sm13179021fa.69.2024.12.17.08.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 08:32:55 -0800 (PST)
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
X-Inumbo-ID: 92487daf-bc94-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734453176; x=1735057976; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ja52G4IQuA2xu4VoTss+DEM7hw7d/dQyOCwy0WEPHU=;
        b=YdhCBKQqsFn1nHgOR8gIODSDin+T7iluk03TWdD0092m1qTCCSv1udOneSkJ/xVFCA
         RX7xef35skqW8tnaQVyZ7tsCz/qxhVSm+yQgDgppcD2g8ikEa0sSMm2dXqXLhKXc3CKQ
         YR1epD6tqJXzzeEH1LN8CkYyxHpAIcNTK/AymiCNH2Mbz6mvIotCd+CjvEwQDwqSdwsZ
         guDvsTpepgecVBY36NYQQfiRYBJ0YTJoy2jSdJFOQZPt1C3l/WRPxJTtiOcKMbyYffVb
         A+yLb6ztzq+ix+bbkXC85OSzNMCHA1Yvp7/fLb3vXzGw5WJ6NesgWGQHLurzo1hNNMY4
         fi3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734453176; x=1735057976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ja52G4IQuA2xu4VoTss+DEM7hw7d/dQyOCwy0WEPHU=;
        b=rDKNNTvl+/HuzPjOzJv8KD/5zgppgd+MJe2kZEgeGU0lhhfe8I3NKd2Dmfi+uB7R1G
         HmMG7Whd2VYaeS1l/vj10bFb6QnmmgRfNDRlqqUGzl7AqoBEnpUX5FR6Q24HR1AI6oJe
         FkBQIidqzYICnlV8JMu8vyRuqq7BCsHM6OZRDtWljk8aXlqDjCHjY1c6UaA0nwQnvgr6
         ccT8E/EEMqSt7rFwnjF4iHrze9y6PAXVM9LA0LEq3ZcFG3Rr4jUoH2cNk2tMXlht3cvk
         6XGyZgH9vldfeKJKJHxmZfdbbikHzvX8ylmtq0XP+zf8snxMOg9TJQUn/jqxCF1KUCO+
         9y8Q==
X-Gm-Message-State: AOJu0YxxznH4roI14Dr2ojQIGxnvXBXvYgoEdxzjYSP92+FVj2tnAk4l
	hOtUPH7jFhsSyBO+Uv9DKdXDa2hKZtOwWm8ooaa1FXx3dm3yMiMHO/ihsauP
X-Gm-Gg: ASbGncuXtHEvCze7FbLklGHpWNYZPIzdq6+OXIbyAd+q5HpCOoyjNXA0sDJefCr6CbV
	Z0fsrRmeN/2q3xg5l2GWI+2DSIK3aooIUkpLyeX+I/SEkWYdj0NtUi2Ylu50eRNNlzaTcMo/xmU
	Tjv93KxJGF0Fe4Ji+P9ZvO8oS4f6TCNceUpFHkqL2yAUitC4B0NphtNqSGMqnNIreATyaW+EV+r
	ZF9TP2NGa7JNZOwO9UDow/d7Tho8v0rPoNuXV8EZ//t/YkK+gMqC11plw==
X-Google-Smtp-Source: AGHT+IEgnG0nBK6Xz11aVTX4EQTfPpcm/ADBzlzfvN+UnBe64SwJYspZIQdu+3mLJg87eU8uKcOsFg==
X-Received: by 2002:a05:651c:19a4:b0:302:40ee:4c37 with SMTP id 38308e7fff4ca-3044cfeac6cmr648731fa.8.1734453175775;
        Tue, 17 Dec 2024 08:32:55 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 1/7] xen/riscv: update layout table in config.h
Date: Tue, 17 Dec 2024 17:32:45 +0100
Message-ID: <a5c8d62f7187fb54f6009306e1d2150a6d01f4fe.1734452721.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1734452721.git.oleksii.kurochko@gmail.com>
References: <cover.1734452721.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make all upper bounds (end addresses) for areas inclusive to align
with the corresponding definitions.

For the Direct map region, the upper bound was calculated incorrectly
in efadb18dd58aba ("xen/riscv: add VM space layout"). It should be
0x7f80000000 (considering that the value is exclusive, instead of
0x7f40000000). Therefore, the inclusive upper bound for that region
is 0x7f80000000 - 1.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - update the commit message: add explanation about direct map upper bound.
---
Changes in v2:
 - new patch
---
 xen/arch/riscv/include/asm/config.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 4954677aff..826e5c7172 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -41,17 +41,17 @@
  * Start addr          | End addr         | Slot       | area description
  * ============================================================================
  *                   .....                 L2 511          Unused
- *  0xffffffffc0a00000  0xffffffffc0c00000 L2 511          Fixmap
+ *  0xffffffffc0a00000  0xffffffffc0bfffff L2 511          Fixmap
  *                   ..... ( 2 MB gap )
- *  0xffffffffc0400000  0xffffffffc0800000 L2 511          FDT
+ *  0xffffffffc0400000  0xffffffffc07fffff L2 511          FDT
  *                   ..... ( 2 MB gap )
- *  0xffffffffc0000000  0xffffffffc0200000 L2 511          Xen
+ *  0xffffffffc0000000  0xffffffffc01fffff L2 511          Xen
  *                   .....                 L2 510          Unused
- *  0x3200000000        0x7f40000000       L2 200-509      Direct map
+ *  0x3200000000        0x7f7fffffff       L2 200-509      Direct map
  *                   .....                 L2 199          Unused
- *  0x30c0000000        0x31c0000000       L2 195-198      Frametable
+ *  0x30c0000000        0x31bfffffff       L2 195-198      Frametable
  *                   .....                 L2 194          Unused
- *  0x3040000000        0x3080000000       L2 193          VMAP
+ *  0x3040000000        0x307fffffff       L2 193          VMAP
  *                   .....                 L2 0-192        Unused
 #elif RV_STAGE1_MODE == SATP_MODE_SV48
  * Memory layout is the same as for SV39 in terms of slots, so only start and
-- 
2.47.1


