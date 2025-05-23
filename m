Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 516B2AC1E8C
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 10:22:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995382.1377858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uINfi-0003wx-NH; Fri, 23 May 2025 08:22:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995382.1377858; Fri, 23 May 2025 08:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uINfi-0003tq-K8; Fri, 23 May 2025 08:22:30 +0000
Received: by outflank-mailman (input) for mailman id 995382;
 Fri, 23 May 2025 08:22:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GSxL=YH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uINfg-0003rz-MR
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 08:22:28 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d846f84-37af-11f0-b892-0df219b8e170;
 Fri, 23 May 2025 10:22:23 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a366843fa6so4070795f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 23 May 2025 01:22:23 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-447f1825457sm137419755e9.1.2025.05.23.01.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 01:22:22 -0700 (PDT)
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
X-Inumbo-ID: 0d846f84-37af-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747988543; x=1748593343; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GB5SoZGsyV9907UeSThTMXgLvSHWtuKbvETz0zUwdfc=;
        b=A14LvtI7DpPJJ60x2Ko40ABXp1hR0AVwigsqyAFNQh0u8iwam6En6EJMfiP9rraYXO
         5x4SKfX10CdJhZNGrQjpcPYt4NtcdQkLtP2WWfMomrpeA3QXzEwKkCZeB4F1tx+saHQC
         PVC9Mp52p6RausvSEPvjIBORjiGupRE744HHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747988543; x=1748593343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GB5SoZGsyV9907UeSThTMXgLvSHWtuKbvETz0zUwdfc=;
        b=jZYtxJ0zZoPLTY1+CJdi3WGCdbN+KnsM/8TFA8ecxLNR7lAwYXoYRGVwu+KLT7/Wkg
         cCQ3cy+EHuLYN/8kfvgJE0Hwh/vuxH83Si1/VXzN7BzNHyV49AghW5X2fqH3CbqQdICY
         Zfr3JMrfBLopd08zjfHf7ynS7XBpK31PR6fMKYSfZnU/DBmsm5uUS35KtXTHY4LcJhZV
         gXzWvmlvHwMj95jZzZHwZWCeGJsRU+ysmvmx0NHJECa5jtx5Q1RzTICS8akefWStBQaa
         69DYv8x714IzsIj78pGWSjhStWdEH2qGyJofxw/ZyBQYPLBMue/3BwGqGa3o+vbBZ5Nn
         HBjA==
X-Gm-Message-State: AOJu0Yx2yyZZRzFoQvUARXk8T0w+jVOfRmDbK6LbD+pn1IqrYJwA+3cc
	w3gLVKkBcqg9w5R5RlBkeHdN+ny/+cf2/pjfVI+4DPsv1K0XOX5zglC1cihWWkDbub+w8k4k463
	Itkxu
X-Gm-Gg: ASbGnctnrDxkUh/cFqW+VrxsRJRTj51FEl05M6pUfXXj1Wv7ygBMYpBg+mB/YovhYFW
	wGvqDt2Z93kGJhevhqWs0HX3R3Zv7CBWpDFqL9eushh62+0a+vZV5jlbL2frhb/b/j1IXOJvBmm
	N9Q5Jexbvcpnih+tFI5MkfwHv1gsSqCvCMasarne9HCaY//dHOqjwiw0hFMV478NSlAoDMOKq/+
	cBDRXYbtbaWPqU7ouNF3j5Lz8kxtXAFGXlNA4VbhPVqKrakHCzZS/FHoeODNc9z9LZDrJd44QRV
	wUyGLusAPH1Hn7OwtC8LSqBpt4zUffUTgAQWAnjmNx+cJdNOeNAk5fLDrS/Agz5dE05QW5ycvFF
	smiF3kt6vM6dV7uvomD1xftljg2gV6A==
X-Google-Smtp-Source: AGHT+IHZldEWad0nbpScWJrwcpZvfgjnSRtHv53NQ5qCJ1OYi5pr2d/nl8GnYpFZRAEmYzDiB3J/lQ==
X-Received: by 2002:a5d:5f46:0:b0:3a0:b816:5a44 with SMTP id ffacd0b85a97d-3a35fe964dcmr25515836f8f.35.1747988542734;
        Fri, 23 May 2025 01:22:22 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 1/3] x86/boot: print CPU and APIC ID in bring up failure
Date: Fri, 23 May 2025 10:21:33 +0200
Message-ID: <20250523082135.18088-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523082135.18088-1-roger.pau@citrix.com>
References: <20250523082135.18088-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Print the CPU and APIC ID that fails to respond to the init sequence, or
that didn't manage to reach the "callin" state.  Expand a bit the printed
error messages.  Otherwise the "Not responding." message is not easy to
understand by users.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Adjust format string.

Changes since v1:
 - Also print APIC ID.
---
 xen/arch/x86/smpboot.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 0189d6c332a4..b5dcc77bd574 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -618,10 +618,12 @@ static int do_boot_cpu(int apicid, int cpu)
             smp_mb();
             if ( bootsym(trampoline_cpu_started) == 0xA5 )
                 /* trampoline started but...? */
-                printk("Stuck ??\n");
+                printk("APIC ID %#x (CPU%u) didn't finish start sequence\n",
+                       apicid, cpu);
             else
                 /* trampoline code not run */
-                printk("Not responding.\n");
+                printk("APIC ID %#x (CPU%u) didn't respond to SIPI\n",
+                       apicid, cpu);
         }
     }
 
-- 
2.49.0


