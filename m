Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHOtFnNSsGmBiAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:18:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1188B255616
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:18:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250566.1548061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00j7-0005Sz-9q; Tue, 10 Mar 2026 17:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250566.1548061; Tue, 10 Mar 2026 17:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00j7-0005PW-4b; Tue, 10 Mar 2026 17:18:37 +0000
Received: by outflank-mailman (input) for mailman id 1250566;
 Tue, 10 Mar 2026 17:18:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00aK-0001QA-7F
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:32 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6f7f498-1ca3-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 18:09:30 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4853c3c2fe7so15292575e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:30 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:29 -0700 (PDT)
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
X-Inumbo-ID: e6f7f498-1ca3-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162570; x=1773767370; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGO25D+/JyzUb694KNoTgwesllMgu7ATeYdD4+csfDI=;
        b=I0lz8oGkbbdeJGgWF9PwMsPmHrpY0GCoFGgJDiD2sdYkbgaY0pSwBAtBYUYf+DGP+C
         K/3A+OLTqwP0hkmTMLF1Ffv3Wi6ZElGjtw0hQx+SW2Ba3p2iMXugH8vB18TNY+3JI7dm
         Z3OalrbQYz/z+xtylwSxOu2bp5cK7wvIgefKq3ffW3ocaCG5ppC6OY50O8nZV9vyEPGf
         Xa8Oxc/4fylJep3spoLUnIc7Or/hrVijt7UqHXGZAeJXOJ8uA8+hwFjvZBdtzyJjLpAy
         Mp95IJT4Jje6kfojOzAB8bHldDTskmrqw9j7G2JCxE4X3NBXYkExhhjEayfgP9ZMRlBc
         OBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162570; x=1773767370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PGO25D+/JyzUb694KNoTgwesllMgu7ATeYdD4+csfDI=;
        b=fmYgzj2kIrHOCJGG2/Ri5gsyFMqw7nYudkZhXZHPcTFoz7Q1vJ0TncRSDFhvKEorZX
         dWdX7flMheowGoUAMSqfLIW0BD6wNE19/gVNvtFJo60QHgsIEzYa8h0asWeM85EHFwH3
         ldU8EKXu+SD15qsqtNyDBMW3/heUYZlIm45Z1JzQzp/dxAIhxFIvYNR3GQ3RW2cBknm9
         6Slkh6HPzbD6+tx8P093QEyQ6ga0VFbZTze+Hgjw4T53IowHoBqkUxGuB6QrS/Lamxou
         5ZWIcFaumiq9G9fOKM3BT5l1IhW6dSfVoOSho2aZRKITFv8tVNOwv54BGnNB5WhVIIm2
         uxbg==
X-Gm-Message-State: AOJu0YxrsPJq9Z/i5TXKSrAK4hY3KMw5iIiTxbep+0FbdxWZ3cJri1t9
	YuiVcf6/1AJ7YP1c6swCHKXc3CeTZ+4Av8OtqiUy6wUn4b0M5eQXrROQmAcwv4EZ
X-Gm-Gg: ATEYQzwiwv45qjKiZv7EbveW/SoKohK2W45z9knRZfXknbLFItEyNJHGB3vTyF+3W72
	CpiVq3rO1dd+MbRcHnFz6Vnmj7qChUYYv4PYoi9+LROc/JYjmhUEGxBJCYzwJWHgzPY4e7RUsnl
	uKOLAlANTXREm+PWSAG0e4i9P3SwJ4h4VQP0gfr5KdewTNWH4Q0jRviEu6ThLiBDRpIiSo7nI0j
	HcBM45bGjB6SUWBkxDJytQLgixNakBYpfyZxjU3k/PjvpBcp8J2yORHrh0Z0AE704PwLDMn0EZR
	ytLUxSFM6PIn+VQvKlBKw7DxN7uN6lMMBerNDG2DrZztPqlVJjO68Iqo2ci3NbCnjdSjwsO9fa6
	fBghiTf+Gnu2RpA0y3YRoVwm0eq6fLkAtlEGbkU0D4iU5c71P+yvzSKIlIrNLD+JZy8JAn3Lb9C
	tThXcBUYEa8+/r8ECDPE9hU4fWsfysW570fV7vD1c9WjoRpPSkjkR1D9Z4nHOr9FjATA==
X-Received: by 2002:a05:600c:8b67:b0:485:4371:539a with SMTP id 5b1f17b1804b1-485437154e5mr59713625e9.31.1773162569788;
        Tue, 10 Mar 2026 10:09:29 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 17/27] xen/riscv: add missing APLIC register offsets, masks to asm/aplic.h.
Date: Tue, 10 Mar 2026 18:08:50 +0100
Message-ID: <2097fefb49fca36f641ddd7d7fb31e796a03619e.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773157782.git.oleksii.kurochko@gmail.com>
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1188B255616
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,microchip.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

These definitions are required for correct decoding of APLIC MMIO
accesses and target configuration, and will be used by both the
physical and virtual APLIC implementations.

No functional change is intended by this patch; it only centralises
hardware definitions that were previously missing.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/aplic.h | 35 ++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index 55cd4a128de7..7e9161d98ceb 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -17,6 +17,11 @@
 
 #define APLIC_NUM_REGS 32
 
+#define APLIC_REG_OFFSET_MASK   0x3FFF
+#define APLIC_TARGET_IPRIO_MASK 0xFF
+#define APLIC_TARGET_GUEST_IDX_SHIFT 12
+#define APLIC_TARGET_EIID_MASK  0x7FF
+
 #define APLIC_DOMAINCFG_IE      BIT(8, U)
 #define APLIC_DOMAINCFG_DM      BIT(2, U)
 
@@ -27,6 +32,36 @@
 #define APLIC_SOURCECFG_SM_LEVEL_HIGH   0x6
 #define APLIC_SOURCECFG_SM_LEVEL_LOW    0x7
 
+#define APLIC_DOMAINCFG         0x0000
+#define APLIC_SOURCECFG_BASE    0x0004
+#define APLIC_SOURCECFG_LAST    0x0FFC
+
+#define APLIC_SMSICFGADDR       0x1BC8
+#define APLIC_SMSICFGADDRH      0x1BCC
+
+#define APLIC_SETIP_BASE        0x1C00
+#define APLIC_SETIP_LAST        0x1C7C
+#define APLIC_SETIPNUM          0x1CDC
+
+#define APLIC_CLRIP_BASE        0x1D00
+#define APLIC_CLRIP_LAST        0x1D7C
+#define APLIC_CLRIPNUM          0x1DDC
+
+#define APLIC_SETIE_BASE        0x1E00
+#define APLIC_SETIE_LAST        0x1E7C
+#define APLIC_SETIENUM          0x1EDC
+
+#define APLIC_CLRIE_BASE        0x1F00
+#define APLIC_CLRIE_LAST        0x1F7C
+#define APLIC_CLRIENUM          0x1FDC
+
+#define APLIC_SETIPNUM_LE       0x2000
+
+#define APLIC_GENMSI            0x3000
+
+#define APLIC_TARGET_BASE       0x3004
+#define APLIC_TARGET_LAST       0x3FFC
+
 #define APLIC_TARGET_HART_IDX_SHIFT 18
 
 struct aplic_regs {
-- 
2.53.0


