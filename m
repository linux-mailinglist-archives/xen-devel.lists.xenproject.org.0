Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E539BCB9EA3
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 23:21:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185896.1507835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUBVA-0004Qo-2o; Fri, 12 Dec 2025 22:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185896.1507835; Fri, 12 Dec 2025 22:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUBV9-0004OM-V6; Fri, 12 Dec 2025 22:20:39 +0000
Received: by outflank-mailman (input) for mailman id 1185896;
 Fri, 12 Dec 2025 22:20:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SbWK=6S=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vUBV8-0004B7-U8
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 22:20:38 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c88f7c69-d7a8-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 23:20:36 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so13255675e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Dec 2025 14:20:36 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fb38a977esm6314350f8f.12.2025.12.12.14.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 14:20:35 -0800 (PST)
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
X-Inumbo-ID: c88f7c69-d7a8-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765578036; x=1766182836; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lk1vumcas+/1y9PUhtuUtgDptTJz0Re2iVdDmKM7JLI=;
        b=IrjQIX+y9N6iCmPqQyOMBTsT+t+qkmIQDEGVrqdDOGXuCJzhEyz8TH/80dZh3lKwe2
         Foqt8maa90hqS54Yiq6B0/jiFnG6u3oCkC+3vYzTTa88WUUpfkTFi4KYTZP+Cw50puWw
         H4rs37U58dsqkchc3+durPA6Yrk/BbV7lmcTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765578036; x=1766182836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lk1vumcas+/1y9PUhtuUtgDptTJz0Re2iVdDmKM7JLI=;
        b=cwlpxCk02kdZiFySXDyU/W5AqxhWQufZ3GDE2dKk14mZ/e7O65V0W1u9Io+Oegm6C/
         Y2WIrRanxKThbEGMxWCz3tExfTOgCUj8FMXqwvT/w0BbCWvy3tko31XQA11g0HCKNVvr
         YawLMd03Obp3AUIxoGOQoI8g8t5wBkHAFTOf3vDZzIOcDhkJebgbfRd/Jx9ZWboOJ8UT
         1+zGmAaBUIoLVzow+PAH1WL9OBbcVbe3IvDhMYgVEFtfv3/GDypPIw9ZLRFj+kR0JvQN
         deDjURYZQHAPQv85MtMrX0Ngo+0waZyqQYdnSTLPcAJ6DNDVQPNlheMZJRr11SW+S5hd
         ElZg==
X-Gm-Message-State: AOJu0YzYR/NwO6/p7xA8F5oijrzEeUHaeINOn0+1fFtxTyJYtXtaMNcj
	GUBDCJYgd+e9Sh65h0r1zoFN++AosH/DqvmHBdbZfWluBVDCYz0c6cUCtcCgQjv3A0gRdhBBcGZ
	PfVBS
X-Gm-Gg: AY/fxX6wCt5c4dmFqLw6fKnyz1q8yAVbv/yhp1UTyao85fIBlODIl198QcaOovAjyKL
	FnJ5FFwCJw+908vHhg8RJZPhPoH2IbqRYallHqz1XzKfmlBmo148bCZSfDQR2y/1ITryFntN2nO
	V06/CTOfmcyezkUvnKPKLAkDq/UcMWi+Kqlx3NJZXffHh749vccz0Ld1icSqgXUM9VrnfteMD6r
	QBePYFdW+n8vRka2YrRbaVAuOWLLDDVoZzYHDMT74gFYjX5vygD5aESc4Cb5flHWDrU3TaouOc+
	Vr8OxRLA8N6Qw+DSdyiy0FGYkQKCl6wzII8JVBLQ4JBZ4EMQASdO1hfIN1SWz/VUVgAYCk6kAac
	0MyJ23b/VX5Q1/qZZgpn5shnWhWptzDfER3eOp58zurE1VabVlWPWycPIfIHx8zMmRyzgHOc50L
	OyuaTwKsfoAaxkjG47Y24E+ItMEdmdVi9AbcbaS89z6HZKtsHO+aOyCBYMWqEgFyP5APJ3BYpc
X-Google-Smtp-Source: AGHT+IHALu6Z7/VnodTlATGTGQ18GFcE3sMMz9/GJ9gae0SF9SorA1BzU5rp+fHqfAF+ylxPSIeSxA==
X-Received: by 2002:a05:600c:444a:b0:479:3876:22a8 with SMTP id 5b1f17b1804b1-47a8f8c2e5cmr41340905e9.16.1765578035380;
        Fri, 12 Dec 2025 14:20:35 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 1/5] x86/pv: Address MISRA C:2012 Rule 4.1
Date: Fri, 12 Dec 2025 22:20:28 +0000
Message-Id: <20251212222032.2640580-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251212222032.2640580-1-andrew.cooper3@citrix.com>
References: <20251212222032.2640580-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

MISRA doesn't like mixing hexadecimal escape sequences with ASCII text.  Use
the same workaround as in commit cd5048353725 ("xen: address MISRA C:2012 Rule
4.1").

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/pv/emul-inv-op.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/pv/emul-inv-op.c b/xen/arch/x86/pv/emul-inv-op.c
index 314ebd01cb34..346ac1124d7b 100644
--- a/xen/arch/x86/pv/emul-inv-op.c
+++ b/xen/arch/x86/pv/emul-inv-op.c
@@ -26,7 +26,7 @@ static int emulate_forced_invalid_op(struct cpu_user_regs *regs)
         pv_inject_page_fault(0, eip + sizeof(sig) - rc);
         return EXCRET_fault_fixed;
     }
-    if ( memcmp(sig, "\xf\xbxen", sizeof(sig)) )
+    if ( memcmp(sig, "\xf\xb" "xen", sizeof(sig)) )
         return 0;
     eip += sizeof(sig);
 
-- 
2.39.5


