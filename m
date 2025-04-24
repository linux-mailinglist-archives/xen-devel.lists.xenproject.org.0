Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF76A9AE22
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 14:58:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966275.1356539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7wA0-0003gQ-L0; Thu, 24 Apr 2025 12:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966275.1356539; Thu, 24 Apr 2025 12:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7wA0-0003dq-HY; Thu, 24 Apr 2025 12:58:36 +0000
Received: by outflank-mailman (input) for mailman id 966275;
 Thu, 24 Apr 2025 12:58:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnO2=XK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u7w9z-0003dk-Er
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 12:58:35 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d44f5755-210b-11f0-9eb2-5ba50f476ded;
 Thu, 24 Apr 2025 14:58:34 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ac7bd86f637so425586066b.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Apr 2025 05:58:34 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ace598980easm104290766b.40.2025.04.24.05.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 05:58:33 -0700 (PDT)
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
X-Inumbo-ID: d44f5755-210b-11f0-9eb2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745499513; x=1746104313; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=119RsW2VdvuSgxEMmpSbsigmTPfUKH34XNDUI28hQVc=;
        b=C2KYkty5LsOYhprjni6ZPoH7UvYTvIGSNkFdVSv0w+7AkIo1G1+iS0xqe+QxQ8MYex
         lh1D4cRYY5pH8wKkyTOUYrZRLREwQQp5S+fmsKHberB7+Vz9AEhiRl9ZovOmcdA6sUb+
         b67jofZFd6CLD1ssbgNrDNQM2K1aO81zWrDQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745499513; x=1746104313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=119RsW2VdvuSgxEMmpSbsigmTPfUKH34XNDUI28hQVc=;
        b=pichfSqmJtGL5ef9Ty4gpfld9vE2I3vAzPp5GkMxt2E2e61FoSuevKuO8suo4Aipjz
         wY3CX65JqWknyhruUjEp2434s2Ez1NgsJ+OppYbbH7dJA6f4MxNdMXmUNQng43lPjvt9
         dJLKrzdHHkibzF1I+YyoZ7tXtodIwfKlF92bVPOOjTSwyywupdXFS1LpvlKiU9tU+JAX
         SbTqgwQYYOh8o9MLhhRX3Hx0zfni5rfh5aBryXINNx3DIXdw4UuPmAsENmTeuNMvtpwi
         Xg/I00yQP7GUIB00BVnbt9kYCwAVO1KwR2tjEmbRjS/9y89WuYW/BXduEehkQ21BawdT
         /9+g==
X-Gm-Message-State: AOJu0Yyddx6NJyXbK6o5QMvvcG8HCyA9OXgWlTKPCo+XZaF94uyXiCnf
	tPiT1REwm2iAQIy+XigZzbVaj5H/d2/m6LjBV+6iuFORYXULt0psN5+axUazE7+q6cBAlNGQ8Yy
	P
X-Gm-Gg: ASbGncuGPy0+hQSA++QaqUNLQ8ikg9ItJiYNLhkV/KU6AOSuwESg9KNBTNvyaSkihYv
	2Ff4/+ESFsA51cTjMFPVzhZwqVuouixNY9o13gnO/erugoU0xjmja8Oy0Vpg+LGop8Exd81aPqU
	IJwpJ1Lpl/r8vhGHgMn0R4icjajqsDQEDkvD4GpuQfeCyLE6pDvcrRKOCVl2KI4f3cL84fqkpGL
	CYeBEws0r2c9IQBaFhaUIH0ZqaRacyMDyRkA3t3kY+EVPQ3bo2YVEgirqL4QacHjecp5nks/lgZ
	EpjgJtUW7elPLIUtdnL2HSPqhA1keVn+kLPrNvp5lUb+3nL+Ji3Z6/vR
X-Google-Smtp-Source: AGHT+IH5QqVUbfEwjoL4fZHy85eQ+kXbpn4RPlbocq4UhMqoJ1zZ2LxTVdCf5YigtSRTExHlMVX4WA==
X-Received: by 2002:a17:907:7d8e:b0:ac7:e6b5:d4ea with SMTP id a640c23a62f3a-ace5a40a5c4mr172632766b.26.1745499513398;
        Thu, 24 Apr 2025 05:58:33 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] x86/hvmloader: fix usage of NULL with cpuid_count()
Date: Thu, 24 Apr 2025 14:58:13 +0200
Message-ID: <20250424125813.96449-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The commit that added support for retrieving the APIC IDs from the APs
introduced several usages of cpuid() with NULL parameters, which is not
handled by the underlying implementation.  For GCC I expect this results in
writes to the physical address at 0, however for Clang the generated code
in smp.o is:

tools/firmware/hvmloader/smp.o: file format elf32-i386

Disassembly of section .text:

00000000 <smp_initialise>:
       0: 55                            pushl   %ebp
       1: 89 e5                         movl    %esp, %ebp
       3: 53                            pushl   %ebx
       4: 31 c0                         xorl    %eax, %eax
       6: 31 c9                         xorl    %ecx, %ecx
       8: 0f a2                         cpuid

Showing the usage of a NULL pointer results in undefined behavior, and
clang refusing to generate further code after it.

Fix by using a temporary variable in cpuid_count() in place for any NULL
parameter.

Fixes: 9ad0db58c7e2 ('tools/hvmloader: Retrieve APIC IDs from the APs themselves')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Could also be fixed by using the temporary variable in the call sites,
however that's more code in the call sites at the expense of less checking.
I don't think the extra NULL check logic in cpuid_count() is that bad.

Overall the solution proposed in this patch is safer going forward, as it
prevent issues like this from being introduced in the first place.
---
 tools/firmware/hvmloader/util.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
index 644450c51ceb..765a013ddd9e 100644
--- a/tools/firmware/hvmloader/util.h
+++ b/tools/firmware/hvmloader/util.h
@@ -190,6 +190,17 @@ static inline void cpuid_count(
     uint32_t *ecx,
     uint32_t *edx)
 {
+    uint32_t tmp;
+
+    if ( !eax )
+        eax = &tmp;
+    if ( !ebx )
+        ebx = &tmp;
+    if ( !ecx )
+        ecx = &tmp;
+    if ( !edx )
+        edx = &tmp;
+
     asm volatile ( "cpuid"
                    : "=a" (*eax), "=b" (*ebx), "=c" (*ecx), "=d" (*edx)
                    : "a" (leaf), "c" (subleaf) );
-- 
2.48.1


