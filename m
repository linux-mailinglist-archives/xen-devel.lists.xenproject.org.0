Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7EA9C25F8
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 20:58:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832778.1248115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9V7u-0001Lr-Jz; Fri, 08 Nov 2024 19:58:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832778.1248115; Fri, 08 Nov 2024 19:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9V7u-0001Eq-Dp; Fri, 08 Nov 2024 19:58:38 +0000
Received: by outflank-mailman (input) for mailman id 832778;
 Fri, 08 Nov 2024 19:58:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALGw=SD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t9V7t-0008TS-8a
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 19:58:37 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d636ca00-9e0b-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 20:58:35 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c9c28c1ecbso3208806a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 11:58:34 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0dc5db6sm271523466b.119.2024.11.08.11.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 11:58:32 -0800 (PST)
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
X-Inumbo-ID: d636ca00-9e0b-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MjkiLCJoZWxvIjoibWFpbC1lZDEteDUyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQ2MzZjYTAwLTllMGItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDk1OTE1LjAwNTc5NCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731095913; x=1731700713; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APtwUM4/DSKoYZ87C5Z8DIqnxYFMBxhhyq2sJc0n8KM=;
        b=d3p9iY8ymr6tzxXtKXIiy75Ez0+Qhpda3v/s2kflRh4rc9/ClPlzGXMPOvBmQxXmy3
         NJ8T3nddltonGgH4lE4ritEBgVEl3GarWSdAEyx/VKVqFvsU90bglkowbk3TssYOSIaD
         aKk3n/N9ZnXz4DtX7PaKkEtxhF3K4VBLfaUgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731095913; x=1731700713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APtwUM4/DSKoYZ87C5Z8DIqnxYFMBxhhyq2sJc0n8KM=;
        b=QOkrhgyh1C/W3mtKdZoQwYCGT0TmgbWitVCJ89Horgb5DGvMQou9Dxrbme3kzF4tm7
         3cZD4SgmCVOJAffcxOZtVOmwuRlGVOk+nVXtwKZjtE39L6Q2BcR4MrujJ5nx+iw5jBfS
         b6n6rJ7cEkO9aLeeW7hM5lrQlbjzjWszM7lZwnI5som0Dg9ciko4L8vKberj41/9Ix9q
         rnRHd9NfLj8VuiqabSLPcxDPMEkNMmQ6TOxw+53BzkNn/nO+jFMTEatapfoWqdDq/74o
         ok05hhtx1QjGYlGin/t1T9fYS9j837kxb6TfiSv1wWWCCttdOlzTgIz8ZlV/5fJNA3Te
         7QXQ==
X-Gm-Message-State: AOJu0YwsEpSb/59nJHrWzE4pkh1+Dk2OhStVkwIf4fosEL7tOnmkkLoi
	PZA0kNmbZuTXCkewbp1ctwkR+MIFGJwDw7DCvovoXcQOUOP9ElwgvvaBwsd6wHNN1ruHClYuYDh
	D
X-Google-Smtp-Source: AGHT+IFKGQL0b0X7k0u5px8jrCXQAxW6XKp1V2s6lzp7Hb41YROrnFFRf3etEXpuEfdEahMpEYcdJA==
X-Received: by 2002:a17:907:6d1c:b0:a99:e67a:d12d with SMTP id a640c23a62f3a-a9eeffd93aamr380686466b.48.1731095913550;
        Fri, 08 Nov 2024 11:58:33 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 06/10] x86/mach-apic: Drop check_apicid_used()
Date: Fri,  8 Nov 2024 19:58:16 +0000
Message-Id: <20241108195820.789716-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108195820.789716-1-andrew.cooper3@citrix.com>
References: <20241108195820.789716-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's an unnecessary wrapper, and is longer than the operation it wraps.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/mach-generic/mach_apic.h | 5 -----
 xen/arch/x86/io_apic.c                            | 9 +++++----
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/include/asm/mach-generic/mach_apic.h b/xen/arch/x86/include/asm/mach-generic/mach_apic.h
index b3e9ea6600ef..c8e0637f4424 100644
--- a/xen/arch/x86/include/asm/mach-generic/mach_apic.h
+++ b/xen/arch/x86/include/asm/mach-generic/mach_apic.h
@@ -45,11 +45,6 @@ static inline int multi_timer_check(int apic, int irq)
  * really not sure why, since all local APICs should have distinct physical
  * IDs, and we need to know what they are.
  */
-static inline int check_apicid_used(const physid_mask_t *map, int apicid)
-{
-	return physid_isset(apicid, *map);
-}
-
 static inline int check_apicid_present(int apicid)
 {
 	return physid_isset(apicid, phys_cpu_present_map);
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 0123edab649b..5a4d8597e07a 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1520,8 +1520,8 @@ static void __init setup_ioapic_ids_from_mpc(void)
          * system must have a unique ID or we get lots of nice
          * 'stuck on smp_invalidate_needed IPI wait' messages.
          */
-        if (check_apicid_used(&phys_id_present_map,
-                              mp_ioapics[apic].mpc_apicid)) {
+        if ( physid_isset(mp_ioapics[apic].mpc_apicid, phys_id_present_map) )
+        {
             printk(KERN_ERR "BIOS bug, IO-APIC#%d ID %d is already used!...\n",
                    apic, mp_ioapics[apic].mpc_apicid);
             for (i = 0; i < get_physical_broadcast(); i++)
@@ -2253,10 +2253,11 @@ int __init io_apic_get_unique_id (int ioapic, int apic_id)
      * Every APIC in a system must have a unique ID or we get lots of nice 
      * 'stuck on smp_invalidate_needed IPI wait' messages.
      */
-    if (check_apicid_used(&apic_id_map, apic_id)) {
+    if ( physid_isset(apic_id, apic_id_map) )
+    {
 
         for (i = 0; i < get_physical_broadcast(); i++) {
-            if (!check_apicid_used(&apic_id_map, i))
+            if ( !physid_isset(i, apic_id_map) )
                 break;
         }
 
-- 
2.39.5


