Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEC49C633E
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 22:19:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834936.1250738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAyIK-0002IX-D0; Tue, 12 Nov 2024 21:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834936.1250738; Tue, 12 Nov 2024 21:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAyIK-0002Gd-A1; Tue, 12 Nov 2024 21:19:28 +0000
Received: by outflank-mailman (input) for mailman id 834936;
 Tue, 12 Nov 2024 21:19:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qpNK=SH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tAyII-0002GE-Jy
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 21:19:26 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8326aed-a13b-11ef-99a3-01e77a169b0f;
 Tue, 12 Nov 2024 22:19:20 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aa1e51ce601so174359166b.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 13:19:20 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0defaefsm762049066b.164.2024.11.12.13.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 13:19:19 -0800 (PST)
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
X-Inumbo-ID: c8326aed-a13b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzAiLCJoZWxvIjoibWFpbC1lajEteDYzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM4MzI2YWVkLWExM2ItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDQ2MzYwLjcyMTg0LCJzZW5kZXIiOiJhbmRyZXcuY29vcGVyQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731446360; x=1732051160; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsa12gmbMNZ4JYTlfQsRQq4C/O5aUYd1O0nPblfp3iE=;
        b=Im5nBlCwWip2eFlaCHX4aY+OqjPY8wk+qhyyrWvQXO+6TmNsw2gi9fu1HVUqF3Xjq6
         Q6hs/eVpxVv+2H5CWv/vhCq3hxyOejrlWypwa3s9+nXJXlHdrlf7A5UcdBhIE9GGohIY
         xr4mY112BRi5Tko4fII7SrbQlS244r4meTUHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731446360; x=1732051160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jsa12gmbMNZ4JYTlfQsRQq4C/O5aUYd1O0nPblfp3iE=;
        b=BhYYcSDcTzj6y36KLV5MH/lVUDOTSPrSs0302jYi4/17e+qMCmKD7g3jCB8UBnDmDn
         5ispBdSP8vf2Q/CjNFi8L6brluJtt4tXlnxPo+fT2a8PIgNMGT74F2FjRlYu2Y03yPY5
         7cnWUb7T2dgOSxviQryccr0G6/eKzqguUekq/jPTqBsPNxhpAu0XebZ4XQXnRa4KI3i5
         K9jQqMo8wpq/QUnnQ2BfFPmwevxCbyx+Xsl1VcSFBcavFfCx8GVJwtsV3oapI5aWpraw
         mvJnduRy4kJ2NVMFiW/tSMVT6LqJdOVX13STehJx90wRabBeCU73Lq9HKH+j+p5Fg7ZJ
         lf5A==
X-Gm-Message-State: AOJu0YyjTFQBabnQxdmPPg8QM2srJRiZ4F9F+Gm7YOjJTdnZOFCNTlYL
	GUygjCl+Vm8r41zAOGbQDFxlKxFZJDTdl0VrrsXPvtkyUMpYbIrt2cOHM1B7QahVxeu5ygZMycb
	T
X-Google-Smtp-Source: AGHT+IEI+uILRhB7vfT10ROk8wzxcMHa3aAYpcdopfiCXVqktNFi+WzYOeKEVsFBdreGQMhTBDC9fA==
X-Received: by 2002:a17:907:9486:b0:a99:4f40:3e82 with SMTP id a640c23a62f3a-a9eefeb2bacmr1612502366b.7.1731446359564;
        Tue, 12 Nov 2024 13:19:19 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/3] x86/ucode: Remove the collect_cpu_info() call from parse_blob()
Date: Tue, 12 Nov 2024 21:19:13 +0000
Message-Id: <20241112211915.1473121-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241112211915.1473121-1-andrew.cooper3@citrix.com>
References: <20241112211915.1473121-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the tangle of logic starting to come under control, it is now plain to
see that parse_blob()'s side effect of re-gathering the signature/revision is
pointless.

The cpu_request_microcode() hooks need the signature only.  The BSP gathers
this in early_microcode_init(), the APs and S3 in microcode_update_cpu().  For
good measure, the apply_microcode() hooks also keep the revision correct as
load attempts are made.

This finally gets us down to a single call per CPU on boot / S3 resume, and no
calls during late-load hypercalls.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index fd4b08b45388..5897ec54032a 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -189,8 +189,6 @@ static struct patch_with_flags nmi_patch =
  */
 static struct microcode_patch *parse_blob(const char *buf, size_t len)
 {
-    alternative_vcall(ucode_ops.collect_cpu_info);
-
     return alternative_call(ucode_ops.cpu_request_microcode, buf, len, true);
 }
 
-- 
2.39.5


