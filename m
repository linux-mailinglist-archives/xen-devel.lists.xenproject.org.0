Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2456077CFEF
	for <lists+xen-devel@lfdr.de>; Tue, 15 Aug 2023 18:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584002.914380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVwds-0005cV-6m; Tue, 15 Aug 2023 16:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584002.914380; Tue, 15 Aug 2023 16:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVwds-0005Zg-3n; Tue, 15 Aug 2023 16:11:36 +0000
Received: by outflank-mailman (input) for mailman id 584002;
 Tue, 15 Aug 2023 16:11:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xxNk=EA=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qVwdp-0005Za-Sw
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 16:11:33 +0000
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [2607:f8b0:4864:20::729])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 662c5a77-3b86-11ee-8776-cb3800f73035;
 Tue, 15 Aug 2023 18:11:32 +0200 (CEST)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-76af2cb7404so374538185a.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Aug 2023 09:11:32 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 c10-20020a05620a164a00b0076d25b11b62sm3834875qko.38.2023.08.15.09.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 09:11:29 -0700 (PDT)
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
X-Inumbo-ID: 662c5a77-3b86-11ee-8776-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692115891; x=1692720691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5tEpQliJuw0E8dCl8jhTgd7+K12lgTffQuz0uRWbEvo=;
        b=g+X3AnqUDYfqDhZlplx/9OmTIi7Bf/SP+niv+mb5wixcEX4pZtDRW68Nzi+1Yju0YW
         4lvkrf5kaBzNe+9FjiU/AM4QoRJYoiuYlu7eaWsU2ucwKGOLOCGk56lfSSBfgts2K3+T
         oMw+rIhQpcrWTs0PKEazicFBisRfEj6l+zywvIBdKi4ZpSIbgJLBHRaf03for+lwkgFm
         JA3bmzOxuETNXSjA/g22Ns7l93QGufFHGrtYNJZc9q7eZvNXfLw/THJcQ7mWeuf6nMSc
         HfdMytZHGYGmXmQmqer8gaC6bpU3/+nZoasrn1T7eaX278txrQg7LTfmgEfcWBS4axcW
         zWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692115891; x=1692720691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5tEpQliJuw0E8dCl8jhTgd7+K12lgTffQuz0uRWbEvo=;
        b=BL3BEsd68VmeO16KgwgGR7eHPHCGt/nyPzLHW57i3TOchabOVSzFwDXVdWeczEXK6w
         K6lLGfmnhJ290vZzgfnCGrHUpqr93n+3t6cbiYCa3wPJXhiYN+ym4iM0QJ/CicVHOwz6
         T3iCdbsdywZSjzWdtufY46LJPWbJ7AU43n5zbPaaZp5g1HNRy0tcgkMx/OM6d/YegTbY
         jjFl2w+obkS2rC5Dko0gJnl+WmiZu0MFIoTIRcEWo1zOjzNJlk8h2Tk695X0Ib/OEdNS
         wHPzYEiwHGkgH6pRDJFBVIdo68p7KwuxYBDaRsk5R5ZbAT3V6GPGvj78lm3lNSoie1ij
         S2Iw==
X-Gm-Message-State: AOJu0Ywg/6wj+Ow8juFgyRYWClAdzhqV7Y/fxAu10r44TbqYdwaghCS8
	jRN99QKuE2F8cgEpBsp/5qfjTBwnicg=
X-Google-Smtp-Source: AGHT+IFI1vEhu7YfpeecBpfuaMuXRYD3llet8jJ7Kt0j0roJfW9zm7B2We7G3dINKoKXxs7RNEr7Ew==
X-Received: by 2002:a05:620a:bc8:b0:769:89c8:4fae with SMTP id s8-20020a05620a0bc800b0076989c84faemr15450752qki.52.1692115890947;
        Tue, 15 Aug 2023 09:11:30 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] tboot: Disable CET at shutdown
Date: Tue, 15 Aug 2023 12:11:20 -0400
Message-ID: <20230815161120.33007-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tboot_shutdown() calls into tboot to perform the actual system shutdown.
tboot isn't built with endbr annotations, and Xen has CET-IBT enabled on
newer hardware.  shutdown_entry isn't annotated with endbr and Xen
faults:

Panic on CPU 0:
CONTROL-FLOW PROTECTION FAULT: #CP[0003] endbranch

And Xen hangs at this point.

Disabling CET-IBT let Xen and tboot power off, but reboot was
perfoming a poweroff instead of a warm reboot.  Disabling all of CET,
i.e. shadow stacks as well, lets tboot reboot properly.

Fixes: cdbe2b0a1aec ("x86: Enable CET Indirect Branch Tracking")
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
Without this fix, Xen subsequently hangs:

Reboot in five seconds...
[VT-D] IOMMU1: QI wait descriptor taking too long
 IQA = 484897000
 IQH = 0
 IQT = 820

with no futher output.
---
 xen/arch/x86/tboot.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
index 90f6e805a9..86c4c22cac 100644
--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -353,6 +353,16 @@ void tboot_shutdown(uint32_t shutdown_type)
         tboot_gen_xenheap_integrity(g_tboot_shared->s3_key, &xenheap_mac);
     }
 
+    /*
+     * Disable CET - tboot may not be built with endbr, and it doesn't support
+     * shadow stacks.
+     */
+    if ( read_cr4() & X86_CR4_CET )
+    {
+        wrmsrl(MSR_S_CET, 0);
+        write_cr4(read_cr4() & ~X86_CR4_CET);
+    }
+
     /*
      * During early boot, we can be called by panic before idle_vcpu[0] is
      * setup, but in that case we don't need to change page tables.
-- 
2.41.0


