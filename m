Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBACFC11A75
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 23:17:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151821.1482374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDVWe-0001M1-Rh; Mon, 27 Oct 2025 22:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151821.1482374; Mon, 27 Oct 2025 22:17:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDVWe-0001Js-N0; Mon, 27 Oct 2025 22:17:16 +0000
Received: by outflank-mailman (input) for mailman id 1151821;
 Mon, 27 Oct 2025 22:17:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kuhB=5E=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vDVWc-0000qq-Qc
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 22:17:14 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0e3b099-b382-11f0-9d16-b5c5bf9af7f9;
 Mon, 27 Oct 2025 23:17:14 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4710022571cso54120065e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Oct 2025 15:17:14 -0700 (PDT)
Received: from localhost.localdomain (host-78-149-11-196.as13285.net.
 [78.149.11.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475de57b156sm148785595e9.13.2025.10.27.15.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 15:17:13 -0700 (PDT)
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
X-Inumbo-ID: b0e3b099-b382-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1761603434; x=1762208234; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRb3Jw+qFvvrwxz5YnrcR3ptz6rfonv1hlEmJw7OD20=;
        b=nuTGTm2pfO9ExTvps2BmYOGHlVs9pe4VDs7yZN+kZpgqUEZo3CyTJjKw/5CFMlpqLg
         XlcQNj3eaSFuVdQEeyotquUFTI1PG0YhecHg5yXOkTQopmq2YvIwgwPJWlXiMjzwoFRM
         FV3iBSAgAND5FRdZy504hDMi0rkPCjetmkOOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603434; x=1762208234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRb3Jw+qFvvrwxz5YnrcR3ptz6rfonv1hlEmJw7OD20=;
        b=SaXjwNPEg4lmf9H+73LUnBuytZ8Z23ntnwyeovn4it5fLPa9X8Nz6N4udc3CJ/oEbz
         Ul/EO8sWfcA6fxepArwwp0JjYIdk0tKCi9pQm2A4nZEWZQLVq7Lr117cF50DzU0Ghsco
         3GxZ9yx+oJHSQa0Y6LHon5ay6oyUSa6j9NVbnIgoQlAn7T3CBCyI9Kb1ocxPyyiAphmg
         2CqLGjOrH4Qq5dIRdvvxHaK32vIFKGvCiTkHRO/GF1uMcief7vrLZZ/SqRbSBGU2rftW
         HDVdZwQQjq5AtIrUPWIuYmL9jJK9/q/EiyvUM+bfIF4clLc5EYuL1ys3cEdMAv4yw0TQ
         fclw==
X-Gm-Message-State: AOJu0YyMh2uKBWa/5cIIs5y2GyPgENWngQy29tY4XW2Op7uYcGvgGemo
	icqU317qb7wBlxjlbJXqSlDnOeAlMmy3/OhmP6H/YKgkSItnlQuWfvV4fzWTsnS65SRMJfIaV/T
	OVy567T1xSQ==
X-Gm-Gg: ASbGnctWvLVmaqRN+3vAeeoBcpdPVC4mVDhDNgB1dCpR5z2AaSGrHOIZ1Tfv+ghv7tu
	xLM2KEUBt1Y8ZWmyZ29Ya1xba1nRqdfkf0x7Ug+f4MXfBgvgyl3hV2sIgajVZfBzLqjI7A5ROfB
	FgzmlmvxlPSbSBCKxrj/yh3PGaeBxaQT/punHFBnNy9P4qzMVNRgg8Ne88nST3tOCc+jn2U8dlS
	ivT7D2vxvBSQ18CF0uwQ2Ww1j1RDGILH//1FM4PqYcJwcaGRsp88vy2NZcWS8/vyIEDO+r+kA7q
	Qf09iUhlNtGY+OF2dQmIMQ9LD4ysEXOMTwTOOUBA3zepT9gtWufMDAuroIJ3g0XCu6Q6+DWEKzU
	Nb5+PkzGwUtg8hwXmEaTiaXNXATErCYbCw/rdkdIdoBM6cbPRqzleQ0VtSJ/stABmOahapH9sAv
	NhYMDN/RZkCp/kXFJxsuRRagMFr0tSXWvUMSHBYNagUzDkd/ojDQNBLo4xa2oK8aGF7yPNrpY2
X-Google-Smtp-Source: AGHT+IEGKjPrj7DutQQf+/r1Lsj1NVUMihfvhl9Xea7SWvs7akm5IzTg1SL40a1LjMr6ksS7B8G46w==
X-Received: by 2002:a05:600c:64cf:b0:477:19bc:1fe2 with SMTP id 5b1f17b1804b1-47719bc2044mr632735e9.6.1761603433663;
        Mon, 27 Oct 2025 15:17:13 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 4/5] x86/ucode: Refine the boundary checks for Entrysign
Date: Mon, 27 Oct 2025 22:17:01 +0000
Message-Id: <20251027221702.3362552-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251027221702.3362552-1-andrew.cooper3@citrix.com>
References: <20251027221702.3362552-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After initial publication, the SB-7033 / CVE-2024-36347 bulletin was updated
to list Zen5 CPUs as vulnerable.  Use Fam1ah as an upper bound, and adjust the
command line documentation.

When the Zen6 (also Fam1ah processors) model numbers are known, they'll want
excluding from the family ranges.

Fixes: 630e8875ab36 ("x86/ucode: Perform extra SHA2 checks on AMD Fam17h/19h microcode")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * New
---
 docs/misc/xen-command-line.pandoc | 7 ++++---
 xen/arch/x86/cpu/microcode/amd.c  | 9 +++++++--
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 28a98321c762..34004ce282be 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2826,9 +2826,10 @@ stop_machine context. In NMI handler, even NMIs are blocked, which is
 considered safer. The default value is `true`.
 
 The `digest-check=` option is active by default and controls whether to
-perform additional authenticity checks.  Collisions in the signature algorithm
-used by AMD Fam17h/19h processors have been found.  Xen contains a table of
-digests of microcode patches with known-good provenance, and will block
+perform additional authenticity checks.  The Entrysign vulnerability (AMD
+SB-7033, CVE-2024-36347) on Zen1-5 processors allows forging the signature on
+arbitrary microcode such that it is accepted by the CPU.  Xen contains a table
+of digests of microcode patches with known-good provenance, and will block
 loading of patches that do not match.
 
 ### unrestricted_guest (Intel)
diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index ba03401c24c5..f331d9dfee6e 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -125,7 +125,7 @@ static bool check_digest(const struct container_microcode *mc)
      * microcode updates.  Mitigate by checking the digest of the patch
      * against a list of known provenance.
      */
-    if ( boot_cpu_data.family < 0x17 ||
+    if ( boot_cpu_data.family < 0x17 || boot_cpu_data.family > 0x1a ||
          !opt_digest_check )
         return true;
 
@@ -571,7 +571,12 @@ static const struct microcode_ops __initconst_cf_clobber amd_ucode_ops = {
 
 void __init ucode_probe_amd(struct microcode_ops *ops)
 {
-    if ( !opt_digest_check && boot_cpu_data.family >= 0x17 )
+    /*
+     * The Entrysign vulnerability (SB-7033, CVE-2024-36347) affects Zen1-5
+     * CPUs.  Taint Xen if digest checking is turned off.
+     */
+    if ( boot_cpu_data.family >= 0x17 && boot_cpu_data.family <= 0x1a &&
+         !opt_digest_check )
     {
         printk(XENLOG_WARNING
                "Microcode patch additional digest checks disabled\n");
-- 
2.39.5


