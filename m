Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDD2AE3D58
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 12:53:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022257.1398037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTemJ-00039W-7V; Mon, 23 Jun 2025 10:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022257.1398037; Mon, 23 Jun 2025 10:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTemJ-000371-4A; Mon, 23 Jun 2025 10:51:55 +0000
Received: by outflank-mailman (input) for mailman id 1022257;
 Mon, 23 Jun 2025 10:51:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KmUX=ZG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uTemH-00036v-E3
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 10:51:53 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1210dea6-5020-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 12:51:52 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-453749aef9eso3038785e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 03:51:52 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4536470826fsm105212285e9.36.2025.06.23.03.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 03:51:50 -0700 (PDT)
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
X-Inumbo-ID: 1210dea6-5020-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750675911; x=1751280711; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IlvYb91cgDr4GHwfAoyZqj6N5z7hr/Meexea8FojqKc=;
        b=LFSroIxKBGLUjJukOLJTycpsc/Y8jM2BkCfiT5N4pLmclIwBnk6bAB2qHgK7Ox3LzD
         lEP3MkolimRkFXwtFU2e2PeeuW3EkC4nW1n3Dy8uX5lIB3AHNfwyKNKdrzcCHf9Uu6oQ
         DW4/WS8uBeC9ldYHbj17KK1Qx+8H1HB7Q4jkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750675911; x=1751280711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IlvYb91cgDr4GHwfAoyZqj6N5z7hr/Meexea8FojqKc=;
        b=UeLJEKrn8t8YD35FctzQydJgq0qMax5UToMKaHGogZGYw9wkHwFvcJSB2Xr6eB+iJm
         ZSVRCQ9DRqY7oQ0OnL/T8E7sv05znAv0aceWe9JYLDGIMvZ9PjEGtVXh/hHye1hCWYL7
         tGpaVi7WuBU0F0GF7S7uMw/4yLijQrGg2UPPHMijdwXW+VgSfU5Y3KtztGmzuQFpRaQ3
         d4ZKGRyxT80Pv9Si4/digbYITyCxHucwctcpqVs/VDMqaGkyOTGjmtjls0PHKSHQVYQB
         waPh4ULUvWc/fZ24X6BtIvU6/67FB04mJO+s/MoYkq/3AQxfUhTgSEF5Z9EvmuibqNoG
         AAVw==
X-Gm-Message-State: AOJu0YzsApAqdZkFeH5iuI/P3APiNhm8volM0InObGo2ihwtGJ3h0k50
	JRVfNI1BO71n7iPEWSZHsgECroB6VwgUR9m+BO0LtylWH10hay++L/CiLsNpG4yucvefK5VzGOF
	pjBh9M0nq6A==
X-Gm-Gg: ASbGncvQqDf8LqV0CkN6mp29YK7seJrQbLQO2fdD7+WVtCh6MVwECGYcMv+gmUtsTMd
	U/V8khUW9ZNUpUq88hHvH4XtZwy44tad/o2iJ82xWLsjyBcMlEDrjxzDUvNyW1ddwozjDbYLDE4
	Ku1x6CBdXBYad4v3RAdYKX7PedDLv2WXTVKsTOAaJLVw1lKjR60qIE5UGm5F8DAykwv4qFc1sWT
	Hr5yrfpwNuOPmrpHRvtU7btdcW/J8Z77JYySt5TXIzc/4gstzrNAdo6UwPOCd0qHW0pqSP/ZpZ1
	+GFfi6tMr3eWk68StttKiqzq2P7zUfuqXYDl/q2rc5kJDC9oh2ES1WzN/tJ1RS4E5eY0VvuiV/I
	kDzYuEdd2Uk2LFGUdgn091lwCQp5DubLBFX0=
X-Google-Smtp-Source: AGHT+IGPRkwfpTQDvR8QsATLmwjtiTL68IFkiP/8w3mzHm4XpkLJQk0nGn4YGwGi5Pq3m9u3LsVY2w==
X-Received: by 2002:a05:600c:1d02:b0:445:49e:796b with SMTP id 5b1f17b1804b1-453658bac72mr107450615e9.17.1750675911360;
        Mon, 23 Jun 2025 03:51:51 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/svm: Revert 1->true conversion in svm_asid_handle_vmrun()
Date: Mon, 23 Jun 2025 11:51:48 +0100
Message-Id: <20250623105148.90321-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is literally ASID 1, not a boolean configuration.

Fixes: 2f09f797ba43 ("x86/svm: Drop the suffix _guest from vmcb bit")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/svm/asid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/svm/asid.c b/xen/arch/x86/hvm/svm/asid.c
index 7977a8e86b53..d5f70f8848be 100644
--- a/xen/arch/x86/hvm/svm/asid.c
+++ b/xen/arch/x86/hvm/svm/asid.c
@@ -37,7 +37,7 @@ void svm_asid_handle_vmrun(void)
     /* ASID 0 indicates that ASIDs are disabled. */
     if ( p_asid->asid == 0 )
     {
-        vmcb_set_asid(vmcb, true);
+        vmcb_set_asid(vmcb, 1);
         vmcb->tlb_control =
             cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID : TLB_CTRL_FLUSH_ALL;
         return;

base-commit: cc7394164633e75fb61d52565f75271e0b7f1236
-- 
2.39.5


