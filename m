Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E38B2249E
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 12:31:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078582.1439613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulmHG-0005df-V0; Tue, 12 Aug 2025 10:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078582.1439613; Tue, 12 Aug 2025 10:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulmHG-0005ab-Rt; Tue, 12 Aug 2025 10:30:46 +0000
Received: by outflank-mailman (input) for mailman id 1078582;
 Tue, 12 Aug 2025 10:30:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BkKW=2Y=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ulmHE-0005aV-JB
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 10:30:44 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66950107-7767-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 12:30:43 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b7920354f9so4338457f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 03:30:43 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c4534b3sm43735974f8f.47.2025.08.12.03.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 03:30:42 -0700 (PDT)
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
X-Inumbo-ID: 66950107-7767-11f0-a327-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754994643; x=1755599443; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1PopHgio0SL/ehJnffqnNfzmhuJu29XYUqP8klHTTEE=;
        b=J+BTWI0PEBngC1RsIyGnaVHfERXU2v0MVuVrpHqGvzmhrQVmc3V5I3z01aTkb0pl+y
         uI4KBgBr1pH3jtWYYCF7sS5UR5M8PUNZ7sRuhSyTymTeLjVO8bxglwsYqkpz/D1Oa4ih
         iN41LN3WT7nUaDXEv29UI2ccTcRjw/pbE6DIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754994643; x=1755599443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PopHgio0SL/ehJnffqnNfzmhuJu29XYUqP8klHTTEE=;
        b=wx15pDAjeO8GgYogJtaLpk3PQJhz5q1EIueB86KWZKic1Z7ARt3GVhy44EcXsQJXos
         bknRKan6QlZqko8cEDh3lN3+G5g4v6v00TsELTkv/a+h3uiaFE6uD1Rq+LUSdtP0eREs
         qfTZg/aoMFLwhOxZL6Q7zH31W+2v36EK4wLIPbG2CwvW3fDhgJqfrPAgl7kgiVWElX07
         INnunsOiCm7LxayO9l5F3uZoXNgIYI10QBTYOjt4Rh3HgDy7Bc49EjTC8BpHQo/TZWGv
         aMI1LpAWb+yBqsSXfemhcI9n25hSLM4tnw6fG/14KlqxBOYxA34jTjSpfkc7+5M+a1J7
         Dn0w==
X-Gm-Message-State: AOJu0YyGkqnoUe+o3ZSNCNF/MVgD6tbrMkqiKn1KLXp9mGY5DK1o1SYq
	KDGYEtEgyqwTqP5A4bDWh73EV44GJIw/Pxtomb/ZwLWaVOGud7hNUxMxgBviVxk3rGjezzAnqnd
	z7hlBxe4=
X-Gm-Gg: ASbGnct5EVbKmd8qut3Fk6mT3xJU4DYWK2ObvcFNVofMJtmOLRnlV0R8Wyu71M8Ps4B
	+RZ8rZ++YFAWCBXY3N4u/puzV38yzfl9ICoNmr7hiAv6O7q0DyWTaEgxzO27qeRriky521c9dxf
	n4A9PAU7D4td714N5IVyE5PXBJXDRWqZefn36hZfLPpM5v/URZzRRMUtVhhyiJe9V4+xCXN5iaa
	WyypGzs79hCuPLR5nURxPWy2a9kdvwvieQltQOE1YwQm/Nk4i0HoyZrzA7YTZR3i2mSH+mM76/z
	SlwXUgVTShv/vd2LfCfufeiLltOPG5sgHZZmqeWg2KIoPCsaNni/C+rMX+SpcRuV0wNVukgCMAD
	Rskj5Qp33hUo8j5+U6PIbJiQ4AsFJA5uTGtFyRz43PcRCmQu0iFY5kEsrdGU145YyF+gjAEZcWo
	eb
X-Google-Smtp-Source: AGHT+IFZYLFhnWjkLEhqdqm1cKGJ0BIF8RO8Y7c/JApShDgAXthXvzTp4X2qnGw3nlGEvCBr/27d5w==
X-Received: by 2002:a05:6000:41fb:b0:3b9:14f2:7eed with SMTP id ffacd0b85a97d-3b914f2843bmr817216f8f.56.1754994642714;
        Tue, 12 Aug 2025 03:30:42 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/current: Annotate get_cpu_info() as attr_const
Date: Tue, 12 Aug 2025 11:30:40 +0100
Message-Id: <20250812103040.1765666-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The result of this calculation will always be identical, even across context
switch in x86.  Tell the compiler.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

  add/remove: 0/0 grow/shrink: 0/15 up/down: 0/-300 (-300)
  Function                                     old     new   delta
  nsvm_vcpu_vmexit_event                       114     111      -3
  nsvm_vcpu_reset                              178     175      -3
  nestedsvm_vcpu_interrupt                     302     299      -3
  compat_memory_op.cold                        200     197      -3
  vcpu_block_enable_events                      30      26      -4
  nestedsvm_vmexit_defer                        90      86      -4
  dom0_construct                              8441    8435      -6
  svm_vmexit_do_clgi                           206     198      -8
  nsvm_vcpu_vmrun                             2530    2522      -8
  compat_multicall                            1194    1178     -16
  arch_do_domctl                              8621    8605     -16
  hvm_set_param.cold                            74      44     -30
  do_multicall                                1165    1133     -32
  ept_set_entry                               2023    1978     -45
  compat_memory_op                            7440    7321    -119
---
 xen/arch/x86/include/asm/current.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
index a7c9473428b2..fd30422707d9 100644
--- a/xen/arch/x86/include/asm/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -83,7 +83,7 @@ static inline struct cpu_info *get_cpu_info_from_stack(unsigned long sp)
     return (struct cpu_info *)((sp | (STACK_SIZE - 1)) + 1) - 1;
 }
 
-static inline struct cpu_info *get_cpu_info(void)
+static inline attr_const struct cpu_info *get_cpu_info(void)
 {
 #ifdef __clang__
     /* Clang complains that sp in the else case is not initialised. */
-- 
2.39.5


