Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9045CAA6743
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 01:09:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974344.1362224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAd1J-0007Z3-CV; Thu, 01 May 2025 23:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974344.1362224; Thu, 01 May 2025 23:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAd1J-0007WT-9X; Thu, 01 May 2025 23:08:45 +0000
Received: by outflank-mailman (input) for mailman id 974344;
 Thu, 01 May 2025 23:08:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tswP=XR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uAd1I-0007WN-0q
 for xen-devel@lists.xenproject.org; Thu, 01 May 2025 23:08:44 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3691a278-26e1-11f0-9ffb-bf95429c2676;
 Fri, 02 May 2025 01:08:37 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso12914065e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 May 2025 16:08:37 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae0c48sm466533f8f.8.2025.05.01.16.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 16:08:36 -0700 (PDT)
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
X-Inumbo-ID: 3691a278-26e1-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746140917; x=1746745717; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IYljfMec41LNWU/JXV9Ofiirp0ccf7wpqklR3jPBOzQ=;
        b=Q4J/qg4gQTuIsA3Jm6tGrnsFpKokJI9Za8N8rtWh/T/AwDjolz8t0BfmvuYrVQQI4j
         jckCsMbfK1xHL6rr+dsVosVPAgVJ9fZy6l+FPo5cj4xV30Dshv16DXmRqod1/1rKScZ3
         35fcLygza0xQCl1hDUsmBKnNP+Kz/W+PQqMSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746140917; x=1746745717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYljfMec41LNWU/JXV9Ofiirp0ccf7wpqklR3jPBOzQ=;
        b=Qnqg6bLoa8SvRaX3Ky4MGIj4/8wUZLFgAN1ZwhQvU3Gn0XEUlZzGOMZVhGC0VTrptS
         6YMTL8mbf1Nd6IbN21FAW1HRcDcq+6ug1oH12VLBCkXVNFHcCSysv+pwa0KKgCE8itIX
         hIvlr3e6vGj/AAjwy179zFTXOT9bGJAYIh+nuOXH4ZDgOP2UekCK4M+wi9dK+brHIY5k
         8+pUuuQWmjBf1965D/tkxcDCSbstgVo17ReTcAWk/INk49jn4Yx6mQDfh6jrxQfiTLCd
         TP8s3OwFmyX4kKA/Vgnvjw/XUhckWEtNlm3B8zpULJHLvm486t11O3eRgkkohYsWRtdk
         P0EA==
X-Gm-Message-State: AOJu0YxYK/tRcjv1V8x0HZHiEUv8bhtNSft0R1rAc11szZUhkaEZ2SWd
	gsW8qs4Qdathintv18u3EqM1dQ88FLSbceqn6vpDS3ZuTEMJb3zBr5PN4WBTl1J+7SvjzHvrAxl
	0
X-Gm-Gg: ASbGnct18qBkHjxBqv9K7aXyQ/9gfZJC5isdjolPQSBhgMhFAmGAQszzjs8obNuSMyJ
	qtrbNjYAn1Nh8O95CCbneMu1AKHmpOTpZwQBeE2hM24pzBnOcgS4FGNgd/19pyEi4Ptpz+rsbz1
	6+yRpjDMXKseDb/nhVdtEgp9fX89FXFoMiZ9VJripc8xTAa+kX5ddf4fjvYuasUe0M30O3L4olk
	EaARZbkwDzChTqv5zKioiXfx0UCBt3TRdpKRJ+MAr1JtYGqXVriLrLdASHMcCvDd/Xss4T0M+t4
	hFnk6IaDov7ZXeXlrLpEf0L8ziZu2a1LlchOQSrBh0H4S1Fg1NIGWOJY5PDWi+WBC0rfv4jPlu6
	3FmmNFRE8tadXsGenJFefDTea
X-Google-Smtp-Source: AGHT+IG4miP4zSEd/AgAlb+nlwHm50Ty6QBb8XlvcUjFs92KdQrc7M2BbKNTGQoBn4jjwpx8IR8hZQ==
X-Received: by 2002:a05:6000:400b:b0:3a0:8098:b6c with SMTP id ffacd0b85a97d-3a099ad7c13mr400038f8f.14.1746140916722;
        Thu, 01 May 2025 16:08:36 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/vmx: Fix label name in vmwrite_safe()
Date: Fri,  2 May 2025 00:08:34 +0100
Message-Id: <20250501230834.759523-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This condition is called VMFail(valid) in the SDM.

No functional change.

Fixes: fc3db01db6fb ("x86/vmx: Rework VMX wrappers using `asm goto()`")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index cc8c53fab149..d85b52b9d522 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -382,17 +382,17 @@ static inline enum vmx_insn_errno vmwrite_safe(unsigned long field,
 {
     asm goto ( "vmwrite %[value], %[field]\n\t"
                "jc %l[vmfail_invalid]\n\t"
-               "jz %l[vmfail_error]"
+               "jz %l[vmfail_valid]"
                :
                : [field] "r" (field), [value] "rm" (value)
                :
-               : vmfail_invalid, vmfail_error );
+               : vmfail_invalid, vmfail_valid );
     return VMX_INSN_SUCCEED;
 
  vmfail_invalid:
     return VMX_INSN_FAIL_INVALID;
 
- vmfail_error:
+ vmfail_valid:
     return vmread(VM_INSTRUCTION_ERROR);
 }
 
-- 
2.39.5


