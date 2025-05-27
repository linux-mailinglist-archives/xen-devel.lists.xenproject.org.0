Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3173AAC4ACC
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 10:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998098.1378918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq5f-0006BK-O3; Tue, 27 May 2025 08:55:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998098.1378918; Tue, 27 May 2025 08:55:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq5f-00068D-Km; Tue, 27 May 2025 08:55:19 +0000
Received: by outflank-mailman (input) for mailman id 998098;
 Tue, 27 May 2025 08:55:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0jbf=YL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uJq5e-000687-7N
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 08:55:18 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ae94275-3ad8-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 10:55:09 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a363d15c64so2183766f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 01:55:13 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a4e1fe9430sm1235287f8f.75.2025.05.27.01.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 01:55:11 -0700 (PDT)
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
X-Inumbo-ID: 4ae94275-3ad8-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748336112; x=1748940912; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NJRlsrbIftpUn3xrkDPhph5ZHApo2Tvm5YsE6Cw+Mkg=;
        b=C7q3COS6kPd4Y5xgPKM7b/QgBkltNK1btGLum2BfQ62hCIWIns245lLLiWS7mAqGs3
         b37wFcYfH7bdwTzwHUv9R4QEIrHYFYZmbRgUdvCwjwGCbhNABHN6CSnF2jXOBUGX3h1Y
         aR0a11aIjxoFACeCy95bu++QjqILfDgF6PYT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748336112; x=1748940912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJRlsrbIftpUn3xrkDPhph5ZHApo2Tvm5YsE6Cw+Mkg=;
        b=eYOuTE0Dr3iclE2jmYay+g7o+2WBE9P+s5XVn52FI178rhwNnn/KuattzsVmIfCled
         ktdGrTeLijJ4IECHv3xIGPWtivArn6Lgun5Rgx0WX/RUPkjE05gC+b18At7hYUX9mjmk
         Gct64W0d/J6wZL5qMhxNAhNx/Kl+t4/5fLRvNTXmvMonPB3xXv4HsM8ndmqQPPPHQP6l
         v6iApDKpKFyVfeHdpZ2xOjU/4OxGCpT2jApeoCpKvisllYjJfqTNmvy3GG6glQycySoX
         6PkuYZFXuiN1/KBQn8PsxD2gqxGZ+AVyb85cvf4S60zzaGb6ogQVSI01Jmbx827JDc1J
         yuHw==
X-Gm-Message-State: AOJu0YyLdPWCuCn6ruKlh0b2Vv+Dr4UoKxoa5n0r1MPR0tdAsbsNf9A0
	UlQb4aoh4B+EY47CNy9tkbTQiPJh292JoB9ns/V3xyhrI19V+ht47i5FlleqPjMC4Qa8J6vpMiw
	ZXQoN
X-Gm-Gg: ASbGncvvsNDIFC7q8FcvXyVTcPz2uO0VFa7oDSCmSTvXd+HqckiVJG8YGQh2PVv6HPB
	mvTZOpXThZoIi2lh15MUlcA7RgV2xxGIBZQab//aL38i0WLl0c6DxQUUzguL+W0TitDep6PzRDO
	AhId6cf2f2q+StvaXitgOYkXAuv4sgsIbRXjfr2lKSrN7QcrmxvmNZMZ6/lgqWa/0RiqSnq8gZc
	InWiE9pX9EmdG406vk4yTaQQXuyNtMXKns3gq/7QsopRMagqSTs5UUhZoSqShZ6P3oXgzVpEfFi
	ODyoNRKBu+nU0aIEAVKOljlYR7r+kUCLJu7zKWbj0etV/ATcNgAI4N4CjtC9ZIO0SI3MHbOaeAL
	8FAH/3IhZAUEnRM2vvtM=
X-Google-Smtp-Source: AGHT+IFtiEhpA67zYypSi6+yw6uitOWJdUGyd5D1vCU9xy9ipwh9IBLKHSFbWvQQB6l0LwJo+1zkoQ==
X-Received: by 2002:a5d:5848:0:b0:3a4:de27:e00f with SMTP id ffacd0b85a97d-3a4de27e06emr4372551f8f.7.1748336112077;
        Tue, 27 May 2025 01:55:12 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] x86/hvmloader: fix order of PCI vs MTRR initialization
Date: Tue, 27 May 2025 10:55:04 +0200
Message-ID: <20250527085504.77444-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After some recent change the order of MTRR vs PCI initialization is
inverted.  MTRR will get initialization ahead of PCI scanning and sizing of
MMIO regions.  As a result when setting up MTRRs the MMIO window below 4GB
will always have the same size, and there will be no window above 4GB.
This results in malformed and incomplete MTRRs being setup.

Fix by making sure PCI is initialized ahead of MTRR, also add a comment to
notice the ordering dependency.

Fixes: 2c3dffbaa324 ('tools/hvmloader: Replace LAPIC_ID() with cpu_to_apicid[]')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/firmware/hvmloader/hvmloader.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/firmware/hvmloader/hvmloader.c b/tools/firmware/hvmloader/hvmloader.c
index 4e330fc1e241..6d23150fc9fd 100644
--- a/tools/firmware/hvmloader/hvmloader.c
+++ b/tools/firmware/hvmloader/hvmloader.c
@@ -341,10 +341,16 @@ int main(void)
 
     printf("CPU speed is %u MHz\n", get_cpu_mhz());
 
+    /*
+     * PCI setup must be done before SMP initialization, as the later also does
+     * the MTRR setup and so the size of the PCI MMIO windows must be known at
+     * that point.
+     */
+    pci_setup();
+
     smp_initialise();
 
     apic_setup();
-    pci_setup();
 
     perform_tests();
 
-- 
2.49.0


