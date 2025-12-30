Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E14BCE9D21
	for <lists+xen-devel@lfdr.de>; Tue, 30 Dec 2025 14:51:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194177.1512627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaa7p-0004lw-6M; Tue, 30 Dec 2025 13:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194177.1512627; Tue, 30 Dec 2025 13:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaa7p-0004jG-01; Tue, 30 Dec 2025 13:51:01 +0000
Received: by outflank-mailman (input) for mailman id 1194177;
 Tue, 30 Dec 2025 13:50:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owPK=7E=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vaa7n-0004Hp-2X
 for xen-devel@lists.xenproject.org; Tue, 30 Dec 2025 13:50:59 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91bc9c58-e586-11f0-b15c-2bf370ae4941;
 Tue, 30 Dec 2025 14:50:58 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so65504725e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Dec 2025 05:50:58 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d4f09sm609436115e9.12.2025.12.30.05.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 05:50:56 -0800 (PST)
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
X-Inumbo-ID: 91bc9c58-e586-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1767102657; x=1767707457; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nd20J3v7uhZuwD0WalGtR1GIlt9QmVuIoVXjLZvsMiU=;
        b=YKzEsi9AZ9awpWfhpN5LaKGr3wHEoS72QftTJYnIwliSfHBj/2cAsV1PDeuh5Dm5QE
         PGgrhRTzGE0775NU+qciVzBy8+sRfyKS84YfIFUHxsHLTw4zqOPiCx9IR5/Q/yj87J/C
         k46KWRaQuRQF4pqiqhG1bO+V+MczrmOZMkVVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767102657; x=1767707457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nd20J3v7uhZuwD0WalGtR1GIlt9QmVuIoVXjLZvsMiU=;
        b=gEq/t9BctY9K1wUjzYIy1WPbEKqJg69oVXe0NGYBHIJm+xxqz578TqdgceShxeLoc/
         NpfhRvInkrY/xSqO7Hd8cJrZBOyp+EKhG/NByUTpedhxz7oXJSrLv8ID/b2cUDtQzNyk
         qYs+CP/2Z7Map5boYRcJ3xIxgMgU+kcN/jvirKTvzRSeHsgyXu5uFwpP9M1BHqCtH4GG
         KdFztd4HA0EIP3K47jx6EjZ3mO/Ikn5Xr9F9JS9M3xK7smfM9Z4v5xrODwKgY7/y33nL
         sIDtWQAtBqgpin+LuksZiPs+xnTVp6YSaF6Pk9+KLJidJQHyqkKznppn/P/8DThqzGwa
         Eb9Q==
X-Gm-Message-State: AOJu0YyG6fOancUeHv72yhZo0Zkhxm9fWkWlCbg2WzsZ0CZwBCkFNEcD
	oyHIPmdpas4N0TRp5lR8hCrDzi2anA22irmX02KXwyopOKeg69T+iKrQfIxAINHbyHj1aEdnZWn
	6bPQZ
X-Gm-Gg: AY/fxX5eTVrooJToFBZCV6rD+C9XlJe0EmDWjYsOY6rfw8Q3DsYwOGI3qYK2TNdF7ed
	E4hd3PR9K4DIDHXSuai9CZHzsDUWX/AHtYbDiem28oSrv4cqt6O+tTKIvbdBvMYqrCAHGeBYYDL
	0t4fXe0E7+dSj+sgXwtGZkNQ3o2a840D0egbsyfeADCjUVYC3ylNX9Ggp+m4F08iNZ2QG/xa046
	oqsxsKu9k5uwProSVWN0zA+e3W4kLxuF6roln7ysmizDXi4MV/Hx7Zwdt/KNscFmZH9mbhDnEVY
	J20W8gW0XVpAc0YBD0b2HVKniBgYi2muUDuD7omnjPFDPt12oROPaRCkibH/8DZS7jBMu5ljYUr
	8Nke1i+Zs9W0/a2BmsIl77WIAfkGj4v+IGpOAcXD2nop5ZmHYfmQsGsaCg2Go+zE1GW/p6Oe4Hz
	UaXZ5i3a+K+EjIs9WGfOBV+OwJi8PifQf2fU0PW88YkOpx7GI1R8zr10Q4Bukptg==
X-Google-Smtp-Source: AGHT+IEIrik/fSPnMFz32DPXSX6e7Ax0GK/XGex1e8Y/JwbScl0g+FWVTaUY/mmvFyW9YrfmzedVog==
X-Received: by 2002:a05:600c:1991:b0:479:3a86:dc1d with SMTP id 5b1f17b1804b1-47d195a63b0mr355075415e9.37.1767102657490;
        Tue, 30 Dec 2025 05:50:57 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 3/5] x86/time: Sort headers
Date: Tue, 30 Dec 2025 13:50:48 +0000
Message-Id: <20251230135050.188191-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251230135050.188191-1-andrew.cooper3@citrix.com>
References: <20251230135050.188191-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... in preparation for a logical change.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/x86/emul-i8254.c | 12 +++++------
 xen/arch/x86/time.c       | 42 ++++++++++++++++++++-------------------
 2 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/emul-i8254.c b/xen/arch/x86/emul-i8254.c
index 144aa168a3f0..c16ed0bead87 100644
--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -24,19 +24,19 @@
  * IN THE SOFTWARE.
  */
 
-#include <xen/types.h>
-#include <xen/mm.h>
-#include <xen/xmalloc.h>
-#include <xen/lib.h>
 #include <xen/errno.h>
+#include <xen/lib.h>
+#include <xen/mm.h>
 #include <xen/sched.h>
 #include <xen/trace.h>
-#include <asm/time.h>
+#include <xen/xmalloc.h>
+
+#include <asm/current.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/io.h>
 #include <asm/hvm/save.h>
 #include <asm/hvm/vpt.h>
-#include <asm/current.h>
+#include <asm/time.h>
 
 #define domain_vpit(x) (&(x)->arch.vpit)
 #define vcpu_vpit(x)   (domain_vpit((x)->domain))
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index ece9ae0b342e..1aeb144c837a 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -9,38 +9,40 @@
  * Copyright (c) 1991, 1992, 1995  Linus Torvalds
  */
 
+#include <xen/cpuidle.h>
+#include <xen/efi.h>
 #include <xen/errno.h>
 #include <xen/event.h>
-#include <xen/sched.h>
-#include <xen/lib.h>
+#include <xen/guest_access.h>
 #include <xen/init.h>
-#include <xen/param.h>
-#include <xen/time.h>
-#include <xen/timer.h>
-#include <xen/smp.h>
 #include <xen/irq.h>
+#include <xen/keyhandler.h>
+#include <xen/lib.h>
+#include <xen/param.h>
 #include <xen/pci_ids.h>
+#include <xen/sched.h>
+#include <xen/smp.h>
 #include <xen/softirq.h>
-#include <xen/efi.h>
-#include <xen/cpuidle.h>
 #include <xen/symbols.h>
-#include <xen/keyhandler.h>
-#include <xen/guest_access.h>
+#include <xen/time.h>
+#include <xen/timer.h>
+
+#include <asm/acpi.h>
 #include <asm/apic.h>
-#include <asm/io.h>
-#include <asm/iocap.h>
-#include <asm/msr.h>
-#include <asm/mpspec.h>
-#include <asm/processor.h>
+#include <asm/div64.h>
 #include <asm/fixmap.h>
 #include <asm/guest.h>
-#include <asm/mc146818rtc.h>
-#include <asm/mwait.h>
-#include <asm/div64.h>
-#include <asm/acpi.h>
 #include <asm/hpet.h>
 #include <asm/io-ports.h>
-#include <asm/setup.h> /* for early_time_init */
+#include <asm/io.h>
+#include <asm/iocap.h>
+#include <asm/mc146818rtc.h>
+#include <asm/mpspec.h>
+#include <asm/msr.h>
+#include <asm/mwait.h>
+#include <asm/processor.h>
+#include <asm/setup.h>
+
 #include <public/arch-x86/cpuid.h>
 
 /* opt_clocksource: Force clocksource to one of: pit, hpet, acpi. */
-- 
2.39.5


