Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBF7D19268
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 14:48:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201710.1517289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfek2-0002Zn-5s; Tue, 13 Jan 2026 13:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201710.1517289; Tue, 13 Jan 2026 13:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfek2-0002X1-3G; Tue, 13 Jan 2026 13:47:26 +0000
Received: by outflank-mailman (input) for mailman id 1201710;
 Tue, 13 Jan 2026 13:47:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wVi9=7S=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vfek1-0002Wv-B7
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 13:47:25 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6309efba-f086-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 14:47:22 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-42fbc305882so4091402f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 05:47:22 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5ee5e3sm44058501f8f.35.2026.01.13.05.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 05:47:20 -0800 (PST)
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
X-Inumbo-ID: 6309efba-f086-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1768312042; x=1768916842; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YTxMpK8blmmBv4ftj07xwrXcPyB8EDLdkKosz0jgWTo=;
        b=e/LoCEa2nGUjgYIz6jANKDCmv1rErDu8lEl4ulWN90ECxH7VUjY53rlKVGJtnQcwZc
         BKdqQeZd9BgDZkfco0WLqBEFIWd1RBa5GQp2bFkmaM567GdtCVSIHwzMbhU/J54ZRPgW
         Pce8jJNTCQu/8wiAbc2J5qYhssHb8jYMb5enM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768312042; x=1768916842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTxMpK8blmmBv4ftj07xwrXcPyB8EDLdkKosz0jgWTo=;
        b=H8isO6aZheZGYP/L6bMtiR7YSuoEeq9v5JUsDeHW8bnVNP4ZGLj/MPaM68rWfionm8
         1aHDRCYod6MUQBD4utTOaf3b0nhLZJ6pMDbbcOAkX+Ei1c0IfamVKuI82jyJXkHj5uPY
         b3kqa5KiPJmVm/Tro9ly4jKBonU/rsvT3AkK7gxugN6yXM2WwzGuWVBtwZVq3GQfnBlZ
         /OqdG0Rjcti7xSgx+V8L1mRLr2+lyShAlhPvW6mHSkOmpK3YDjh4AKiZq1xdg7Nau714
         4Jify3wJqLZIoby1+NKRxlQhHoPhuof/EoPF4TF4r7R6Xr3LZMhKsA7WF/6U5wwgah/B
         ntkA==
X-Gm-Message-State: AOJu0YxxUQa6aWyflep1b3Ty5MaS2u3KbO5y/EQ0e2+7NTXpqc7VTXRS
	G4XU2KJp5ONJlTvWZI4NMIdVYS6BcKa84VJz2Sxo2gYlJ/bomrgwQoOY5MRqFpVoxp0C+DZJdQk
	omYJr
X-Gm-Gg: AY/fxX60x6Y58QPJvX91Knk/iWOC0lbS+RJcD+UPXaDkFzVkma////IIB/xMjcXWejw
	VJnflS3A8X4O+TQOPyv7k9+kI6lcutyj6+JkF6NKO7uREbaJU2arznnMOY1mhBDulq7XZ9Az4Ls
	/1DKE5uwEpQu1rIJRsRCqaV7/fq9oRSelWf1uQSORjh7tRaexzryBF8OoGtVAhhHpbVK5uFjFT4
	ZqHO/h69T403R9OvFy5zEBpdXxBHNvLZ6Cme8mvZZENAlKqyMPh84p9Xr4W5b9XR8QghhbNTJF6
	3lpRI1vdi+E4tSioKiNYCe2XIHIaaOGXyzgOoNHHcBqk7pGCV9/ZjSOJ/XZqSIGK/2LzryXJcCR
	pjUXNgnb4Q19ZloidMZY0wiu4iWvlZMo86ys5CWnfPB1riWFRzhz/E+5+LyFja4B+VrGcmGRRs0
	xvSgLet5aRcZyLPxtvAnL/lIP3eC0MTZWqB/4UvRnAwDQIE3f/wYah2vrS8IzH/mhqnb46nZeY
X-Google-Smtp-Source: AGHT+IHApcp1nxuWpmQGXYgRHTGzSofPbLDAbGRb2yHGwShyLvgxCXeyRnTfcU+5U64i5YXxvrIl7w==
X-Received: by 2002:a5d:64e6:0:b0:432:851d:3676 with SMTP id ffacd0b85a97d-432c3774267mr28006416f8f.57.1768312041503;
        Tue, 13 Jan 2026 05:47:21 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/cpu-policy: Filter out OS{XSAVE,PKE} in calculate_raw_cpu_policy()
Date: Tue, 13 Jan 2026 13:47:19 +0000
Message-Id: <20260113134719.1047476-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

They're dynamic too, and don't have named fields because no (other) logic in
Xen ought to operate on them.  In particular, OSPKE being visible depending on
whether we're in HVM or PV vCPU context when scanning.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

More fallout from XenServer's rescan capability, this time running with a PVH
dom0.  OSXSAVE was accounted for before by being force-enabled, and is wrong,
hence the adjustment here too.

The othe two fields Intel list as dynamic are AESKLE (which we don't have
infrsatructure for yet), and SYSCALL (based on %cs.l) which I have no interest
in treating like a generally variable bit.
---
 xen/arch/x86/cpu-policy.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 372d11f2ff20..5273fe0ae435 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -345,9 +345,13 @@ void calculate_raw_cpu_policy(void)
     ASSERT(p->x86_vendor == boot_cpu_data.vendor);
 
     /*
-     * Clear the truly dynamic fields.  These vary with the in-context XCR0
-     * and MSR_XSS, and aren't interesting fields in the raw policy.
+     * Clear the truly dynamic fields.
+     *
+     * - The OS* bits are forwards from CR4.
+     * - The xstate fields are calculated from XCR0 and MSR_XSS.
      */
+    p->basic.raw[1].c &= ~cpufeat_mask(X86_FEATURE_OSXSAVE);
+    p->feat.raw[0].c  &= ~cpufeat_mask(X86_FEATURE_OSPKE);
     p->xstate.raw[0].b = 0;
     p->xstate.raw[1].b = 0;
 

base-commit: 6d1180b1499145fcb8f3099c1ab4b7305aba2ed4
prerequisite-patch-id: c5070338424f36d973c1b0fb9f6419682c48ee03
-- 
2.39.5


