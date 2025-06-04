Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4EDACDE6F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 15:03:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005539.1384993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMnlj-0005WJ-Mm; Wed, 04 Jun 2025 13:02:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005539.1384993; Wed, 04 Jun 2025 13:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMnlj-0005Uo-KE; Wed, 04 Jun 2025 13:02:59 +0000
Received: by outflank-mailman (input) for mailman id 1005539;
 Wed, 04 Jun 2025 13:02:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/urA=YT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uMnli-0005Ui-0f
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 13:02:58 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bf3507d-4144-11f0-a300-13f23c93f187;
 Wed, 04 Jun 2025 15:02:56 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-450ce671a08so43956845e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 06:02:56 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f00a02cdsm21890755f8f.94.2025.06.04.06.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 06:02:55 -0700 (PDT)
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
X-Inumbo-ID: 3bf3507d-4144-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749042176; x=1749646976; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W+k2cOatHut62eiVD86m0J41TDAOoAGZL4LtoHPLDVI=;
        b=Th2z/cC+344Bfgo/HWcL7PaB8cNNzDS9PO9Qj1PYih18meuX2Oulfdo7F7ZGo+hnSW
         091qelnZsUXsbQDVmQC9kq8HCtNkFBKSQj/vQf0Y0v4LsftckUDhZfw2OYM0ldGP1aEw
         mEOL8u9MQLWdG6nZFfDtv9zZXbJZidMX2kVqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749042176; x=1749646976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W+k2cOatHut62eiVD86m0J41TDAOoAGZL4LtoHPLDVI=;
        b=FWSRqyF/qeuSGcu4h/J0psEoTMgmLu6oAEKr2ZFklTJ1CP5gRVKMUy/0xvKpFeMGUR
         aq0JBZ+4SailAoepy39hbN9T2sent8noeRKzoDjHRtLDUKB7CxVG72FezVq6ZLmWmJ9e
         jbjjWbL+/jzdBAFE8x1myIyBYl6OMpqMB+PVxw55Cn46Eu0V3PI4NKPBI7xwCkz8Y3rX
         DYF8FgDUcE2aoTNOxzlpCeqGy9dwDWsXj8v4PxOqe6/ifhlc5I5e38CNc/UXyJ9xrfMU
         /4826MLrdH3wYj6YbjZDR9n1evpiDb5JdqyO2rfkGV/sHjIFZ3K4brY7i/mLdVwwUDF3
         yv3w==
X-Gm-Message-State: AOJu0YylqJrfslILYme2N3wZPtZ/+sxdyliHP05lWKwar66QeMaLTUHU
	IzXSe0YRZ1CactQW5KNRccMpXVJdKb6XPoir87dE5EmUdhl7otWPPW40cMZtXeFgFv1DSFALvi6
	vEXB1
X-Gm-Gg: ASbGncuX3obt7c6tIVBUMDzabOLAwKz0xtVMp8F4pFux4G+F5cS+bDVzDuCd0OgClJq
	uQWpf5un8EqXowD7rnyk+ztgrMWlcJzGvYVFhWDbfxVpbqYwsWfxxAJezV+e7c5gHTHDV84gxn8
	Hs/1qQPOPHzpqSjA9nw51C8cAEZtNIhAzui9o1034unhKXLPBeR85m39uEqh6qViSQHDE3G/p44
	Ydfbm99eS4kdidn68e//knBAIiuX8ukMELVCyVx7pKB0eHsygMWtVLTZrDlJNr3YvYngC+7Stoh
	zYBummn2QQarAKZCFvwFm1LrD83xODc9Uhg6xCLieBcIKZ3j6aq66zRS7wqYmTeTlh2xamU48F9
	tQzfddWRBpaldkHX+5orv4h93
X-Google-Smtp-Source: AGHT+IGxqKWgRu7Fty1BsVpcQl50CvKjUPbJmvS6U8jQOQI5ofW1ncRC47tjBdkrHdEe8gbrIVD7OA==
X-Received: by 2002:a05:600c:3151:b0:450:d586:25ad with SMTP id 5b1f17b1804b1-451f0a9a4b2mr23571995e9.15.1749042175862;
        Wed, 04 Jun 2025 06:02:55 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Aidan Allen <aidan.allen1@cloud.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/hvm: Process pending softirqs while dumping VMC[SB]s
Date: Wed,  4 Jun 2025 14:02:53 +0100
Message-Id: <20250604130253.2805053-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

24 guests with 8 vcpus each is sufficient to hit a 5 second watchdog.

Drop a piece of trailing whitespace while here.

Reported-by: Aidan Allen <aidan.allen1@cloud.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Aidan Allen <aidan.allen1@cloud.com>
---
 xen/arch/x86/hvm/svm/vmcb.c | 4 ++++
 xen/arch/x86/hvm/vmx/vmcs.c | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 4e1f61dbe038..839d3ff91b5a 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -12,6 +12,8 @@
 #include <xen/mm.h>
 #include <xen/rcupdate.h>
 #include <xen/sched.h>
+#include <xen/softirq.h>
+
 #include <asm/hvm/svm/vmcb.h>
 #include <asm/msr-index.h>
 #include <asm/p2m.h>
@@ -246,6 +248,8 @@ static void cf_check vmcb_dump(unsigned char ch)
             }
             printk("\tVCPU %d\n", v->vcpu_id);
             svm_vmcb_dump("key_handler", v->arch.hvm.svm.vmcb);
+
+            process_pending_softirqs();
         }
     }
 
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 57d49364db56..57bae6679dd5 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -2165,7 +2165,7 @@ static void cf_check vmcs_dump(unsigned char ch)
 {
     struct domain *d;
     struct vcpu *v;
-    
+
     printk("*********** VMCS Areas **************\n");
 
     rcu_read_lock(&domlist_read_lock);
@@ -2184,6 +2184,8 @@ static void cf_check vmcs_dump(unsigned char ch)
             }
             printk("\tVCPU %d\n", v->vcpu_id);
             vmcs_dump_vcpu(v);
+
+            process_pending_softirqs();
         }
     }
 

base-commit: eb57fe072232c9836d085020450ce1434b21a819
prerequisite-patch-id: 32a8746877e6b92075be2f022dca25c6bfa6f31e
prerequisite-patch-id: a048b84683314d3a731d79fb3cb11406afa29d7b
-- 
2.39.5


