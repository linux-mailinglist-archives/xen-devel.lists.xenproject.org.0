Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C0784980A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 11:49:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675783.1051266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwXj-0000tA-32; Mon, 05 Feb 2024 10:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675783.1051266; Mon, 05 Feb 2024 10:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwXj-0000qp-0B; Mon, 05 Feb 2024 10:49:39 +0000
Received: by outflank-mailman (input) for mailman id 675783;
 Mon, 05 Feb 2024 10:49:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/8nl=JO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1rWwXh-0000qL-Fv
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 10:49:37 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fe642b0-c414-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 11:49:34 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a26ed1e05c7so591060266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 02:49:34 -0800 (PST)
Received: from localhost.localdomain ([185.25.64.249])
 by smtp.gmail.com with ESMTPSA id
 gw14-20020a170906f14e00b00a35200615d7sm4185891ejb.1.2024.02.05.02.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 02:49:33 -0800 (PST)
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
X-Inumbo-ID: 3fe642b0-c414-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707130174; x=1707734974; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mBomYnkbGBCYxlJkVuCw9TZfVRMHdHHWQ2aYnOe5VSg=;
        b=ZduG/EtDOdSskHflS5AKn3Gsdi5nr9ak+nM1EZnRN5gQ1XWKoanTHXbKky5PPv6GWI
         Y/HHrgncFKxowRdXwku3TDxCV3MlyNuprcLD4m4WEH5BLmI4y6peWiXUhOyralhSgH5+
         NM2ehKTCa7qP1keSXw0MR1cHhvNz7TS58V5w8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707130174; x=1707734974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mBomYnkbGBCYxlJkVuCw9TZfVRMHdHHWQ2aYnOe5VSg=;
        b=rl9NITtgicDjw0dkiSZiKG+UdyA36VtpqKkNdlHLnMQOksFiIebcOj24+uZ0QwCwCw
         oDiWlCsT2EJWhQHjY25j9EoHPHOLhBHGyRqhQ+zsBFGDU0XNw54jPyyBW+pZ7pv4H+Y6
         IWAWmTk2NYk2ZsLBM4wl3vjS9CXsWuGxcEnX7ZB6y99LfFdkXLPugF472SH9ME6TP9Lt
         RWRHm3fHVFzk2scMWO43OXfcXNNiR+dgj9z5ki131rw1rHiU1c51SIewLyxUAfvsq06+
         YHOzIVDFbLyboSVhYDXJ24w/9Tx/GeCd5/ikTH7DEgLErPXlVJxz7SXEA5dNuuS2ne4w
         zUwg==
X-Gm-Message-State: AOJu0YzzU0nT9gVoThxzlNlgO7+5kgPLQIfTtfGaJ0Xl0T4tdNhQ52nB
	+rFn3e7T+if6uKhM8kUL73ci13kRecjkZgXHD2HwxYkqCrusPExlrwcUCR+r5+0=
X-Google-Smtp-Source: AGHT+IFNsmFy2DMoBL9yJr/PSVQr8mahMXw42/lGkbmjRScCrA4JYifVpRvOfnB40FPJmbY7xHmwxQ==
X-Received: by 2002:a17:906:19b:b0:a36:fd11:984 with SMTP id 27-20020a170906019b00b00a36fd110984mr7367475ejb.5.1707130174197;
        Mon, 05 Feb 2024 02:49:34 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU+iuSb1rAJAXFuQGCIAm+fXUH1AlN8Iv0eaJtxcnaxhEdZBBLhd+y/NOcNxuUEefeRWFW9iDeQVWDFV/EAlB2c6x4RSGx1ItvJ+XdE1vpjFQhAe9k20MfR9D03mDipcc9CkV8FYMNgcvIx82Pozv3S7Rr8GBzOlXmh3mdThzD5g7K3vJnW0w==
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: [PATCH 5/5] Reduce assembly instruction size
Date: Mon,  5 Feb 2024 10:49:19 +0000
Message-Id: <20240205104919.14983-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use 32 bit versions in all cases, not only for registers till 8th.
This reduces the encoding from (example with r14):

     49 c7 c6 ff 7f 00 00    mov    $0x7fff,%r14

to

     41 be ff 7f 00 00       mov    $0x7fff,%r14d

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/include/asm/asm_defns.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
index 51bf1cf1e6..a9a6c21c76 100644
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -136,7 +136,7 @@ register unsigned long current_stack_pointer asm("rsp");
 #define STACK_CPUINFO_FIELD(field) (1 - CPUINFO_sizeof + CPUINFO_##field)
 #define GET_STACK_END(reg)                        \
         .if .Lr##reg >= 8;                        \
-        movq $STACK_SIZE-1, %r##reg;              \
+        movl $STACK_SIZE-1, %r##reg##d;           \
         .else;                                    \
         movl $STACK_SIZE-1, %e##reg;              \
         .endif;                                   \
-- 
2.34.1


