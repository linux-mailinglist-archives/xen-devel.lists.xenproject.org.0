Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E79E6BB33DE
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 10:42:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135394.1472530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4EtI-0000Q4-UH; Thu, 02 Oct 2025 08:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135394.1472530; Thu, 02 Oct 2025 08:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4EtI-0000OI-QJ; Thu, 02 Oct 2025 08:42:20 +0000
Received: by outflank-mailman (input) for mailman id 1135394;
 Thu, 02 Oct 2025 08:42:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9sj0=4L=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v4EtI-000821-4x
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 08:42:20 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b50027e4-9f6b-11f0-9d14-b5c5bf9af7f9;
 Thu, 02 Oct 2025 10:42:19 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-46e37d6c21eso4990735e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Oct 2025 01:42:19 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8abf0bsm2636723f8f.17.2025.10.02.01.42.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Oct 2025 01:42:18 -0700 (PDT)
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
X-Inumbo-ID: b50027e4-9f6b-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759394539; x=1759999339; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rvvp0krdvj9KI0seW+qea5ZtA/ftLNrinoYyViTKgNM=;
        b=Gdk0KsJiwZ8C00SypL+Y5E6t7SFCZXOTy3WPN126zkG66JuzyUYKPO6+MB1ZifYQKE
         1U2a7b06mSDLO3VYiwULdxqdMrSEmjVk/nnszrn7NKuQj/S2L7ee3rwOEFBN1ylFL48G
         s3GdSYpzolCUHtRcdUE9dbfBf///krf1JDpkquFJ21u3LSfzKis+Qbxlj6Z1DQMBkATm
         4A+rhAfV1IryIQ6+L57cbttq6scJO7F6948SR7emELGQJZ0pU3qb+ikUdaG/k6Ldu+OD
         QUnn1vlVAGjUqU4hctVP2vM5+wYcfSCS+GiVu8f5js4xeSO7erzlOABRx11r8x71crPp
         v6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759394539; x=1759999339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rvvp0krdvj9KI0seW+qea5ZtA/ftLNrinoYyViTKgNM=;
        b=kNRJncatOG6H8jkAcg1HdggL5yeUUakrz9Z624aqXSKM9s5Mkgu7tzX4jpUYh8pPfj
         d3QgJYE0hMP1kyucZEJadeJOxCTPsrxfH8JlLDs4dsRVAW1zudGH8+IJEf5K/qNuXVlz
         ivCUlzaW2yFbiSHgJ+9l/7SxENLHR8wfmvFut91ldC9vACQpL51vgfXgKJdUsl4oA3sk
         moBgCvjKsI/3aIaL5yn916mhVaYgIEHSQv7ViQOzY3FH53J5dAYxmUyyLRajB/eZwIgF
         7va0jSuUjM6RKBOqqA2fkukO95WrlFA9K9zUe6FvfPv9phFIRW6XdAf/3lrUcrot1f4l
         edUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB2ZQ66UR9cZiOqignUs7clu8IBAGJdXpZj7sMO5blOHpAeuqFgxzEA0fBGiXJDqyrOSrHZwvcQXI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyg3ZZ+eoy5yYziL35BvtNwcR2q2D0c5c0DyTB22LSJMyumslew
	cgv1rIvYkXkEeNGB3bpXdniGxge5MhaxL3qOlLoBlLY4KPJIps4J/9WCQ/wzXhTjLqc=
X-Gm-Gg: ASbGnctQQ10vUFk6WcSJrrhlpnKrZyx2K9e/CTyTCBmcUMvYOszzs4zrxFL/6MXGTfK
	IouJwP1VfrkOIg3jTmqhjlWTxUkZpNygNNNnS/fh9dp0SPZqJ/scf+0DlI3oCYXiVUYPh0tYmsV
	GijrKCNh0fiTtbeMN7IZfodpHVECyzljSBc9KA4wu+Y0HrsPGn6XfPw3pvW5tCU+Lveap79TamP
	79GyPHcoHxkMJ1+6hFev7WUSclZbeNW98awdN+ygDRYxGthoaTLxZV37KbPjnGPW8C3q0BBNLAE
	XGDr0rvEcDmM8PLyrLqTYa+Grd7JRmGbtfGWLurLFgR5ABbUyBsq0BtyPt4j5SQxH3bMRQBiS8Y
	SrUJgf2z641v/jamJJHkj29vjOb6Ypy1yxch5c3G+KXLaqb2638AcOYO9J1I7RFIeVzjy2p1Xhn
	8MmeyT01GlaS2E5OhADgUXctr3iAtpyQ==
X-Google-Smtp-Source: AGHT+IG82FlfkoxisOQbRYrohdopoSBAhOILCB0HaVdDr5q4Gy9SbJH0YmtL/0EDlkKLEQXXp8/WZQ==
X-Received: by 2002:a05:600c:4ec6:b0:46c:e3df:529e with SMTP id 5b1f17b1804b1-46e612ba9ecmr42260135e9.19.1759394539032;
        Thu, 02 Oct 2025 01:42:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v4 03/17] target/i386/arch_memory_mapping: Use address_space_memory_is_io()
Date: Thu,  2 Oct 2025 10:41:48 +0200
Message-ID: <20251002084203.63899-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002084203.63899-1-philmd@linaro.org>
References: <20251002084203.63899-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since all functions have an address space argument, it is
trivial to replace cpu_physical_memory_is_io() by
address_space_memory_is_io().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/arch_memory_mapping.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/arch_memory_mapping.c b/target/i386/arch_memory_mapping.c
index a2398c21732..560f4689abc 100644
--- a/target/i386/arch_memory_mapping.c
+++ b/target/i386/arch_memory_mapping.c
@@ -35,7 +35,7 @@ static void walk_pte(MemoryMappingList *list, AddressSpace *as,
         }
 
         start_paddr = (pte & ~0xfff) & ~(0x1ULL << 63);
-        if (cpu_physical_memory_is_io(start_paddr)) {
+        if (address_space_is_io(as, start_paddr)) {
             /* I/O region */
             continue;
         }
@@ -65,7 +65,7 @@ static void walk_pte2(MemoryMappingList *list, AddressSpace *as,
         }
 
         start_paddr = pte & ~0xfff;
-        if (cpu_physical_memory_is_io(start_paddr)) {
+        if (address_space_is_io(as, start_paddr)) {
             /* I/O region */
             continue;
         }
@@ -100,7 +100,7 @@ static void walk_pde(MemoryMappingList *list, AddressSpace *as,
         if (pde & PG_PSE_MASK) {
             /* 2 MB page */
             start_paddr = (pde & ~0x1fffff) & ~(0x1ULL << 63);
-            if (cpu_physical_memory_is_io(start_paddr)) {
+            if (address_space_is_io(as, start_paddr)) {
                 /* I/O region */
                 continue;
             }
@@ -142,7 +142,7 @@ static void walk_pde2(MemoryMappingList *list, AddressSpace *as,
              */
             high_paddr = ((hwaddr)(pde & 0x1fe000) << 19);
             start_paddr = (pde & ~0x3fffff) | high_paddr;
-            if (cpu_physical_memory_is_io(start_paddr)) {
+            if (address_space_is_io(as, start_paddr)) {
                 /* I/O region */
                 continue;
             }
@@ -203,7 +203,7 @@ static void walk_pdpe(MemoryMappingList *list, AddressSpace *as,
         if (pdpe & PG_PSE_MASK) {
             /* 1 GB page */
             start_paddr = (pdpe & ~0x3fffffff) & ~(0x1ULL << 63);
-            if (cpu_physical_memory_is_io(start_paddr)) {
+            if (address_space_is_io(as, start_paddr)) {
                 /* I/O region */
                 continue;
             }
-- 
2.51.0


