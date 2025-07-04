Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C522AF9869
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 18:34:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033540.1406888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXjMi-0005i9-Jg; Fri, 04 Jul 2025 16:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033540.1406888; Fri, 04 Jul 2025 16:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXjMi-0005gd-FU; Fri, 04 Jul 2025 16:34:20 +0000
Received: by outflank-mailman (input) for mailman id 1033540;
 Fri, 04 Jul 2025 16:34:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7FCR=ZR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uXjMg-0005Ex-Ax
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 16:34:18 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b939275f-58f4-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 18:34:15 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-451d54214adso7739415e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 09:34:15 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9989fcesm59199345e9.16.2025.07.04.09.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 09:34:14 -0700 (PDT)
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
X-Inumbo-ID: b939275f-58f4-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751646854; x=1752251654; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iU72UnrXReJr2MaFOqUFKlkLHLyzDHrUJMt+dtpUJU=;
        b=RCy3eAlDiA98DtwzwkpruuXBFdIyv7cM2gx9AaKoltWQa17/1WurFZmRVI+bVUlcOV
         M+pKrgZ0T/RyUCQh712GcFoBYa+9/nMgltUpHtSIIB+qz/L47U8BsiJ9HDlA2Am9a8n0
         LyKlfaSIpO1HRn9GYr6s1118AZGnstzjuFV5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751646854; x=1752251654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5iU72UnrXReJr2MaFOqUFKlkLHLyzDHrUJMt+dtpUJU=;
        b=SomP2lqCqhRCFXKIRDOPh5I6/aP6DKnweTmoZirfZKg9WO0HLVembGpUT/KSeA0chM
         7H6sCw+Nl79E7l9Q/6USpRjjuF/oAWmGFysLi4MQpcI3x/x/NNl3jFpo/H7swjOJDCDn
         zhOTi+bE8O2qKPxk4RslJYS2AJFMizhWT25EL91ZBjDYfKaXh8jWGIgaYP5nIrNttuPG
         LjCjP4JqnokafUJGbqzqhuVodnWFfS8krAqSTIV7DGUWxHLs3NEPq6OI1StSm/ewEI5r
         S2/fr6sKledrMWmk/ULBYjLKfnR9YK8dJqwXRB4lcorPh9ozMeer63By73FtgW9bfYx9
         TZHg==
X-Gm-Message-State: AOJu0Yy6KjG+TwTdm7yKg4JQkG8pLD01pH8/mNn5za/gR5a9BQSpJBMO
	jhisSLmmLVLhyLccuBTvRyW9CbUFFhMI1lKR60mKUR/GqpEndo7WdUm9lnGeA/esNDVKbnfzpo4
	p63enhHbJcQ==
X-Gm-Gg: ASbGncvNMe28SlafITG0JpDEx49CwMc04CWuZs7XoX+PXMwBILaI0CGleZOZiqMj6+n
	GL8TYUn+E+fdp5cpcJZh48K+C+5eRd0WNzs03tNaB+bcLN4xJds0/QhA1HhyQTGO3cx+x54LJZf
	xhR5Cfgoc0NyA0JlGhx1F8Sfliqc9uJ+XOpObIAdPktT715U7cBBmgp1wPhqeA/jr6cX8wq/bGM
	UVtZtF+P40qmYK1ro/gCOeXBOZFCGeWI/uQ7ejJnGCPZbx2+xULWIX9p4vuI6hEaIIsN0JBJNM7
	sFqwlY2FQXrBYMeOA7WJ3gGXVJUB0RXGAfQvX1Mn3gjPZ8eUsuCOHvmDxURxrNQrx5Vo4Wo/P7V
	VjPIBAj8o004G5OT2xkc78hY8ITxPSOk2Mja2nZ5FHYHXcQ==
X-Google-Smtp-Source: AGHT+IGYsipzvN5mN/Qg7mf5hscWFms+YgPJvylnuK0D3RGEYffewhqomHT4x19qpY3Ir/6ka3PTag==
X-Received: by 2002:a05:600c:474b:b0:453:8a62:df34 with SMTP id 5b1f17b1804b1-454b3161d07mr28883905e9.21.1751646854444;
        Fri, 04 Jul 2025 09:34:14 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/6] x86/idle: Drop incorrect smp_mb() in mwait_idle_with_hints()
Date: Fri,  4 Jul 2025 17:34:06 +0100
Message-Id: <20250704163410.1412367-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704163410.1412367-1-andrew.cooper3@citrix.com>
References: <20250704163410.1412367-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the recent simplifications, it becomes obvious that smp_mb() isn't the
right barrier.  Strictly speaking, MONITOR is ordered as a load, but smp_rmb()
isn't correct either, as this only pertains to local ordering.  All we need is
a compiler barrier().

Merge the barier() into the monitor() itself, along with an explantion.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>

v2:
 * Move earlier in the series, not that it matters IMO.
 * Expand the commit message.
---
 xen/arch/x86/acpi/cpu_idle.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 141f0f0facf6..68dd44be5bb0 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -66,8 +66,12 @@ static always_inline void monitor(
     alternative_input("", "clflush (%[addr])", X86_BUG_CLFLUSH_MONITOR,
                       [addr] "a" (addr));
 
+    /*
+     * The memory clobber is a compiler barrier.  Subseqeunt reads from the
+     * monitored cacheline must not be reordered over MONITOR.
+     */
     asm volatile ( "monitor"
-                   :: "a" (addr), "c" (ecx), "d" (edx) );
+                   :: "a" (addr), "c" (ecx), "d" (edx) : "memory" );
 }
 
 static always_inline void mwait(unsigned int eax, unsigned int ecx)
@@ -453,7 +457,6 @@ void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
     const unsigned int *this_softirq_pending = &softirq_pending(cpu);
 
     monitor(this_softirq_pending, 0, 0);
-    smp_mb();
 
     if ( !*this_softirq_pending )
     {
-- 
2.39.5


