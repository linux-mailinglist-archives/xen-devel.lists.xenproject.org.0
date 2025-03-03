Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD89EA4CB65
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 19:54:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900537.1308417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpAvP-0005ui-Vz; Mon, 03 Mar 2025 18:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900537.1308417; Mon, 03 Mar 2025 18:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpAvP-0005tO-T1; Mon, 03 Mar 2025 18:53:59 +0000
Received: by outflank-mailman (input) for mailman id 900537;
 Mon, 03 Mar 2025 18:53:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2B8f=VW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tpAvO-0005fK-26
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 18:53:58 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbd0f8f6-f860-11ef-9ab3-95dc52dad729;
 Mon, 03 Mar 2025 19:53:56 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-390fdaf2897so2064206f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 10:53:56 -0800 (PST)
Received: from andrew-laptop.. ([46.149.103.8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47965f3sm15140904f8f.9.2025.03.03.10.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 10:53:54 -0800 (PST)
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
X-Inumbo-ID: dbd0f8f6-f860-11ef-9ab3-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741028035; x=1741632835; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=no6lAPMGHz402ofAq/shrhBk1BheSrPpX1ujOntJ00M=;
        b=Zs2yL8aEGZ9q+iJk45wc8aQW/5w8zp4flvWqclW5zy3W3noHjCXPEH8eGqm/ORHzEf
         x5K7plZUbjKLnHoJC8t/mJMFenfVwa5FlDwU4v1O76sZ33+68F+O8enxeg6C9CbkWdDl
         eO9K1TpYywlOMfF3oEHvfnZRciyhr3YOAoPlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741028035; x=1741632835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=no6lAPMGHz402ofAq/shrhBk1BheSrPpX1ujOntJ00M=;
        b=swY7WrAsFZ91EpUUWsEkdj1/WhQpVMdkNscKuFX569QI+UVc3u1fBevLtI+9S7IGav
         fhXjUESUWOKrCmlAdJNF7IvK3T76fD6kbGVrrjZlVapMNGJ8K/QYKya2h6uXIQifmgPG
         27z4SIGMYMK5aMT7Pi9oZh3JfCKUHxqLiDezvNvvPGv/CZMM2p4s1tY5nUZuB/pS5nNo
         uSrp1EHHyOZ8vpBteFSB3bUwEMLSNqX6PF8GmlkDHUL/BPyGTFLau5ywbYGT3VSZ60gw
         noXQdft3xfrjWgTnxYceGgU9yvBatiTr8TEPNb6qI7c+rYs0BChxME7CIWs8p240BXWf
         5Yjg==
X-Gm-Message-State: AOJu0Yw7iLrAXWhaVWKNo9Wd61S0JSjp91RjxxWu1lMpUZA7GU+YMFqt
	Im44jMYrgf2VI4o9lzaBZvyOTrVi6gpije3rEM8Ld8LwKqQ5H3LsqXt2rjtDQzEllo9RFH413Ax
	T
X-Gm-Gg: ASbGncuGGwCC4gyScq1et9SkevxGOE1dHs3dyvWw5bVDDGsOegaYtQfR3nIfIJMazQS
	3GhY0ahI9mVSd30bdLGqWxuWMKxP9Yx7+eHsXKT4y16Y5YcZ88t0RPFvhzJbvxhyK0s98Z37jkE
	WmtbnfW+BX39PRaGBov2hXW7PKPisP+sq5VW+txNW9SdhZnEvISimbzq9FSr1S/GI82GSs3C5lW
	EYYnun2qOUM7YLc4Ne5trjJtPDzwHM/5SUyqSUNnfORqnYNDAk95Ynn0nfASeSPmjK1RUzuOTdi
	7e5XEvkc87end02SKSY/+5u1eWgLjOJgO9axtOvT4S9nuPmAU9NYwKo=
X-Google-Smtp-Source: AGHT+IHR7t4FswyUwAJ+kRY1KOki20axtaa+iN7CPZmtJECVfeYVjgv5ixylfJsnB781TvFE530uzA==
X-Received: by 2002:a05:6000:4c6:b0:38d:c44a:a64b with SMTP id ffacd0b85a97d-390eca2589amr11532871f8f.48.1741028035383;
        Mon, 03 Mar 2025 10:53:55 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/2] x86/vlapic: Fix handling of writes to APIC_ESR
Date: Mon,  3 Mar 2025 18:53:51 +0000
Message-Id: <20250303185352.86499-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303185352.86499-1-andrew.cooper3@citrix.com>
References: <20250303185352.86499-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Xen currently presents APIC_ESR to guests as a simple read/write register.

This is incorrect.  The SDM states:

  The ESR is a write/read register. Before attempt to read from the ESR,
  software should first write to it. (The value written does not affect the
  values read subsequently; only zero may be written in x2APIC mode.) This
  write clears any previously logged errors and updates the ESR with any
  errors detected since the last write to the ESR.

Introduce a new pending_esr field in hvm_hw_lapic.

Update vlapic_error() to accumulate errors here, and extend vlapic_reg_write()
to discard the written value and transfer pending_esr into APIC_ESR.  Reads
are still as before.

Importantly, this means that guests no longer destroys the ESR value it's
looking for in the LVTERR handler when following the SDM instructions.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Minor adjustment to the commit message
---
 xen/arch/x86/hvm/vlapic.c              | 17 +++++++++++++++--
 xen/include/public/arch-x86/hvm/save.h |  1 +
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 3363926b487b..98394ed26a52 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -108,7 +108,7 @@ static void vlapic_error(struct vlapic *vlapic, unsigned int errmask)
     uint32_t esr;
 
     spin_lock_irqsave(&vlapic->esr_lock, flags);
-    esr = vlapic_get_reg(vlapic, APIC_ESR);
+    esr = vlapic->hw.pending_esr;
     if ( (esr & errmask) != errmask )
     {
         uint32_t lvterr = vlapic_get_reg(vlapic, APIC_LVTERR);
@@ -127,7 +127,7 @@ static void vlapic_error(struct vlapic *vlapic, unsigned int errmask)
                  errmask |= APIC_ESR_RECVILL;
         }
 
-        vlapic_set_reg(vlapic, APIC_ESR, esr | errmask);
+        vlapic->hw.pending_esr |= errmask;
 
         if ( inj )
             vlapic_set_irq(vlapic, lvterr & APIC_VECTOR_MASK, 0);
@@ -802,6 +802,19 @@ void vlapic_reg_write(struct vcpu *v, unsigned int reg, uint32_t val)
         vlapic_set_reg(vlapic, APIC_ID, val);
         break;
 
+    case APIC_ESR:
+    {
+        unsigned long flags;
+
+        spin_lock_irqsave(&vlapic->esr_lock, flags);
+        val = vlapic->hw.pending_esr;
+        vlapic->hw.pending_esr = 0;
+        spin_unlock_irqrestore(&vlapic->esr_lock, flags);
+
+        vlapic_set_reg(vlapic, APIC_ESR, val);
+        break;
+    }
+
     case APIC_TASKPRI:
         vlapic_set_reg(vlapic, APIC_TASKPRI, val & 0xff);
         break;
diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
index 7ecacadde165..9c4bfc7ebdac 100644
--- a/xen/include/public/arch-x86/hvm/save.h
+++ b/xen/include/public/arch-x86/hvm/save.h
@@ -394,6 +394,7 @@ struct hvm_hw_lapic {
     uint32_t             disabled; /* VLAPIC_xx_DISABLED */
     uint32_t             timer_divisor;
     uint64_t             tdt_msr;
+    uint32_t             pending_esr;
 };
 
 DECLARE_HVM_SAVE_TYPE(LAPIC, 5, struct hvm_hw_lapic);
-- 
2.34.1


