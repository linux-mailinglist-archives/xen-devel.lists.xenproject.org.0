Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF349C9AD99
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 10:27:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176030.1500598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQMfl-0003f4-Pz; Tue, 02 Dec 2025 09:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176030.1500598; Tue, 02 Dec 2025 09:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQMfl-0003ck-Mx; Tue, 02 Dec 2025 09:27:49 +0000
Received: by outflank-mailman (input) for mailman id 1176030;
 Tue, 02 Dec 2025 09:27:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nxws=6I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vQMfj-0003c7-Q2
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 09:27:47 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29a0549a-cf61-11f0-9d1a-b5c5bf9af7f9;
 Tue, 02 Dec 2025 10:27:46 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4775ae5684fso24296675e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Dec 2025 01:27:46 -0800 (PST)
Received: from fedora (cust-east-par-46-193-78-210.cust.wifirst.net.
 [46.193.78.210]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790adc8bc7sm373122725e9.1.2025.12.02.01.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 01:27:45 -0800 (PST)
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
X-Inumbo-ID: 29a0549a-cf61-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764667666; x=1765272466; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OyxUbCI0eTZpVejGp6ZUvurQ8ce6r710+xVj+fha1TA=;
        b=M+MCzoZXV99CR2In7fy6ewFC96rDVzetnti9uA2YxfaM9c/Hvrwek0ZHti3CYEkkA0
         yBbLmVYB7Mbr1LTsv0oTJer4bHtKTuftJxZlOTE18htfqMDeIXD4Wio2EuRsPoM0LBA+
         jb5pP68AsXZ+ftMwQRqORn4wVaPtZMuiHQILey5OLL/IKV5kkLODfufCEV1hcaY21sb0
         vxIo8sm+UEc/uAYQ40xQHLEeJWuHDyuiRfGmnq5+a6YbrH7owFxmHtN6yY9+N8K+p6Fx
         BHuitZEdEmTntXnNRhLihNqwG/oGDi+3zighqdIjNT2NuOd6+dzCkdisKb+R6E0TfHvF
         hwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764667666; x=1765272466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyxUbCI0eTZpVejGp6ZUvurQ8ce6r710+xVj+fha1TA=;
        b=A+6d72XWzoXo6/LbQFXFCNj2nCaRngNG5tD87qtYYRw5Sl2ua/v8Q7W6hFhaCCwRsX
         /qb8TUOcDMWgG5tyxghQoMiQj/uP3vo688rRamERGeFn2/CY5o3hITfpRxg0UUSek9lu
         scZDO5jOseDoMoaexG3mfH9PDdYxtTEbeHDY0bsXbYr7lKrvdCe/VbugR79BY4a9hDZa
         YyJFvw7r2SO2Eex24rRIEo8ipfkCuFd5zvXhqZrlSmdUpysInTXrTFAc6WzXmBBNaKRt
         VXey03ydm+eWAsEKiD5AwTfpl0BcHLxPK2/gZFLEMbze2tFibZ8CL/MFEi1gUq3XYG54
         FPMQ==
X-Gm-Message-State: AOJu0YxiUCADx7zus7sBZKQe8tRiixdGgPKguFmnUxg+Z9MmeaXwEaxM
	AIDE71SbTgvJ/6fErFJW3ntHz7LpXEc2c3Eg+z1Exx4E2LhnB7BiHgqZ71zyK/pG4h0=
X-Gm-Gg: ASbGncv8yojS5op30eWMklxjgTVqxhSwBpxD7sTbP2NcWXSbrQyytxE9HhPajr6wXqc
	j0XDPSqJsxMkYyJf9IOW2IVBkTqKg8sy4jFMtApffs0nJ6lrfYtTO8pwQ4ik1EDciZ83JKCQaTm
	hJU+osqqFr34RMxBPNk7rP94JG+1gBZUeuGaJLsZ6oMbB4DWQg8brEDbz3Omn52MPZTNqLF3qhl
	wZAhQh1X3TPS6X5wGQ1jwK7ux7Z+E6XASp1Ar5aSCLx3tebd3mPxG7K+/fzDRRB8lf0GJHscKXN
	IM+7qQ8H/KfdyuThKq06FYC0WXCwNH3uO/rHASOLrn2ZF5D/T+dgMHcDLutndlpZySTQkeeKn50
	YR6QtRSZJkhqhiLuw+gEmNGvq3kmufjMNuRG1ZNT+HdqLMrSDPKxQ4rpxn9PQnRxUGVFGHhKHSs
	Iin3FGBAGqjxkkflY4mxL1OPXeAivOsk6//ZupWJZCic7ovYWySfDToVBJ5o4rzsgQnmE=
X-Google-Smtp-Source: AGHT+IF4l9VDQFWfOr+mBze3yfuVfduxFrMWYn6L8B3OTbOjR+3ZxCeXpl4Vp6jcU131tmGq50Hq1A==
X-Received: by 2002:a05:600c:3543:b0:46e:1a5e:211 with SMTP id 5b1f17b1804b1-477c1143046mr380000585e9.21.1764667665832;
        Tue, 02 Dec 2025 01:27:45 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Timothy Pearson <tpearson@raptorengineering.com>
Subject: [PATCH v3] xen: move vcpu_kick() declaration to common header
Date: Tue,  2 Dec 2025 10:27:34 +0100
Message-ID: <260f0884737c0d99afc392cf5b0eeb1ba7557437.1764586422.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vcpu_kick() declaration is duplicated across multiple
architecture-specific event.h headers (ARM, x86, PPC).

Remove the redundant declarations and move vcpu_kick() into
the common xen/include/xen/sched.h header.

Drop the definition of vcpu_kick() from ppc/include/asm/event.h,
as it is already provided in ppc/stubs.c.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
CI tests:
  https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2188785661
---
Changes in v3:
 - Drop inclusion of <xen/sched.h> from "x86/.../vmce.c" as it is already
   included in "mce.h" which is included in ".../vmce.c".
 - Drop inclusion of <xen/sched.h> from "x86/pv/traps.c" as it is already
   included in xen/event.h, which is included in ".../traps.c".
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - Move vcpu_kick() declaration to xen/sched.h instead of xen/event.h
 - Revert changes connected to switching asm/event.h to xen/event.h as vcpu_kick() 
   is now living in xen/sched.h.
 - Add inclusion of xen/sched.h because of moved vcpu_kick() declaration to
   xen/sched.h.
 - Update the commit message.
---
 xen/arch/arm/include/asm/event.h | 1 -
 xen/arch/ppc/include/asm/event.h | 1 -
 xen/arch/x86/include/asm/event.h | 1 -
 xen/include/xen/sched.h          | 1 +
 4 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/event.h b/xen/arch/arm/include/asm/event.h
index 509157b2b3..e036ab7fb8 100644
--- a/xen/arch/arm/include/asm/event.h
+++ b/xen/arch/arm/include/asm/event.h
@@ -3,7 +3,6 @@
 
 #include <asm/domain.h>
 
-void vcpu_kick(struct vcpu *v);
 void vcpu_mark_events_pending(struct vcpu *v);
 void vcpu_update_evtchn_irq(struct vcpu *v);
 void vcpu_block_unless_event_pending(struct vcpu *v);
diff --git a/xen/arch/ppc/include/asm/event.h b/xen/arch/ppc/include/asm/event.h
index 0f475c4b89..565eee1439 100644
--- a/xen/arch/ppc/include/asm/event.h
+++ b/xen/arch/ppc/include/asm/event.h
@@ -5,7 +5,6 @@
 #include <xen/lib.h>
 
 /* TODO: implement */
-static inline void vcpu_kick(struct vcpu *v) { BUG_ON("unimplemented"); }
 static inline void vcpu_mark_events_pending(struct vcpu *v) { BUG_ON("unimplemented"); }
 static inline void vcpu_update_evtchn_irq(struct vcpu *v) { BUG_ON("unimplemented"); }
 static inline void vcpu_block_unless_event_pending(struct vcpu *v) { BUG_ON("unimplemented"); }
diff --git a/xen/arch/x86/include/asm/event.h b/xen/arch/x86/include/asm/event.h
index 434f65007e..d13ce28167 100644
--- a/xen/arch/x86/include/asm/event.h
+++ b/xen/arch/x86/include/asm/event.h
@@ -11,7 +11,6 @@
 
 #include <xen/shared.h>
 
-void vcpu_kick(struct vcpu *v);
 void vcpu_mark_events_pending(struct vcpu *v);
 
 static inline int vcpu_event_delivery_is_enabled(struct vcpu *v)
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 52090b4f70..1f77e0869b 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -877,6 +877,7 @@ void vcpu_wake(struct vcpu *v);
 long vcpu_yield(void);
 void vcpu_sleep_nosync(struct vcpu *v);
 void vcpu_sleep_sync(struct vcpu *v);
+void vcpu_kick(struct vcpu *v);
 
 /*
  * Force synchronisation of given VCPU's state. If it is currently descheduled,
-- 
2.52.0


