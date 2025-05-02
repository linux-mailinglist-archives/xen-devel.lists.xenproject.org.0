Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00157AA730B
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 15:13:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974687.1362482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAqCv-0002v4-M9; Fri, 02 May 2025 13:13:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974687.1362482; Fri, 02 May 2025 13:13:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAqCv-0002sq-J5; Fri, 02 May 2025 13:13:37 +0000
Received: by outflank-mailman (input) for mailman id 974687;
 Fri, 02 May 2025 13:13:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8+YV=XS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uAqCt-0002sH-Uf
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 13:13:35 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40945ed9-2757-11f0-9eb4-5ba50f476ded;
 Fri, 02 May 2025 15:13:34 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-39ee5ac4321so2088675f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 May 2025 06:13:34 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b8a31576sm43819915e9.37.2025.05.02.06.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 06:13:33 -0700 (PDT)
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
X-Inumbo-ID: 40945ed9-2757-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746191614; x=1746796414; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qoZI407B5Po4OSQsJUN8qnspeE+Spjgmrm6XxhEYtzs=;
        b=E1qJh5xW3OdeZLnDQyAg1GV9rHMIY12ZHPwoItRrv6OoEkjEfYCL872KmtRF1cpbyF
         AWG60mFI6xB8Oi8bFt8Qtu2psKip1AhImaj01O+N4XoeXmQX9S7z7IjVZaOz5wQimKGI
         vRUZdsXeLkzAWRo2UBcjLQa8jgl1ZbUnRJkIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746191614; x=1746796414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoZI407B5Po4OSQsJUN8qnspeE+Spjgmrm6XxhEYtzs=;
        b=A4+H7eFTaDUWzeMOOguXKP+fppXPDQJfmJRDW0EGzT3caCnWXInw9FDIYRYtEH3o1O
         h5lqgBNH2+Pyzty4HNiThuc/4lq9Tz099EmeWtWowUpOPYdGgXXEeGHIEC48kn7f0Nnd
         4l1TdWRa6EXPZmcPNuqEL9v0McYVOWOYSBbrK+e7cTObK+O/KLlRHTyQ+fgNfi+Qnmfq
         pfHKv4xCX7M6FWghimjnraNLqHqkxZVimzxdnw/HdxU2qjblwH92g+71lNz0sQqyj991
         T0yweIA/is2rfP1svs3zBWJh3ZZ74X2rrA23HifYjNmmqIURxt99/Ce2SYzxtFR4O327
         eF4g==
X-Gm-Message-State: AOJu0Yx27fIZEAmpU9feDjoHGO6cwVkXKOCmCtO2bOWNKzcuri1YvAHN
	2VMFqxI2HS2qqxpSmgPJtl19qA9qAkVX2yXMJpOeEQVEl4Vr00o8XR9iG6UEdGit2XCoNDn4e93
	6
X-Gm-Gg: ASbGncsrYEg7znsKW2GK+Kci2Me+2r0Aj7w8qHvEcjI5dBaurABskcjC4zGQYXW8f24
	Q34YqbvYuGVyqs2dBjcBFjTp5RpjJ12rpJhs9Ms/JL5iXIjuRxS3qVc9wZjjkq3JGl210uazg6A
	SfUlARUcgwprBv8Py60Fkil3SaB6ITQREsmTIFX5ts5FuRqGufaE13K0ts2qN3N+MEpgbZRWW1a
	shaEAxVQU+KugMun0b4sNjAvIFkwVw5nSETozz37iMUuN6sgZ49ozsLOWgU08uaI3cldfaiBlTJ
	IHKj9v7k/BX/1/JJ7bNTuIqafJvpJKx5dowgO7EhzoO4g+Amo/u+cMKcgLZtA2qnr5e9wiFY3yP
	Zxue5IhYRsXu00g==
X-Google-Smtp-Source: AGHT+IFgaP9xpJnef20Ys3/kvKj36XXf6xnVxR4I709P3qotG9L4L7lyXxltQ321U0NjrtSuBQEA/Q==
X-Received: by 2002:a5d:598b:0:b0:3a0:8495:d66f with SMTP id ffacd0b85a97d-3a099ad9a6cmr1801873f8f.23.1746191614098;
        Fri, 02 May 2025 06:13:34 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/mm: Improve bitops in vcpumask_to_pcpumask()
Date: Fri,  2 May 2025 14:13:31 +0100
Message-Id: <20250502131331.813701-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This loop is for_each_set_bit() in disguise.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

More detailed analysis:

  add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-46 (-46)
  Function                                     old     new   delta
  vcpumask_to_pcpumask                         519     473     -46

Re-shifting 1 just to clear it is horrible code generation.

While the ffsl() is abtracted away, it doesn't logically move in terms of the
loop position.  All that is happening is a (more efficient) clearing is moved
to the post condition, and 3/4 of a cacheline of logic disappears.
---
 xen/arch/x86/mm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 0b787ba55312..66c15a3c864f 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3411,7 +3411,7 @@ int new_guest_cr3(mfn_t mfn)
 static int vcpumask_to_pcpumask(
     struct domain *d, XEN_GUEST_HANDLE_PARAM(const_void) bmap, cpumask_t *pmask)
 {
-    unsigned int vcpu_id, vcpu_bias, offs;
+    unsigned int vcpu_bias, offs;
     unsigned long vmask;
     struct vcpu *v;
     bool is_native = !is_pv_32bit_domain(d);
@@ -3432,12 +3432,10 @@ static int vcpumask_to_pcpumask(
             return -EFAULT;
         }
 
-        while ( vmask )
+        for_each_set_bit ( vcpu_id, vmask )
         {
             unsigned int cpu;
 
-            vcpu_id = ffsl(vmask) - 1;
-            vmask &= ~(1UL << vcpu_id);
             vcpu_id += vcpu_bias;
             if ( (vcpu_id >= d->max_vcpus) )
                 return 0;
-- 
2.39.5


