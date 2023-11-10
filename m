Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 621CB7E7DC8
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:31:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630612.983660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPK-0006Ch-05; Fri, 10 Nov 2023 16:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630612.983660; Fri, 10 Nov 2023 16:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPJ-00065n-RQ; Fri, 10 Nov 2023 16:30:57 +0000
Received: by outflank-mailman (input) for mailman id 630612;
 Fri, 10 Nov 2023 16:30:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zww5=GX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r1UPI-0005EV-IY
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:30:56 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85e0f93d-7fe6-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 17:30:56 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9e28724ac88so367524366b.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Nov 2023 08:30:56 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 lv19-20020a170906bc9300b009a9fbeb15f5sm4128966ejb.46.2023.11.10.08.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 08:30:54 -0800 (PST)
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
X-Inumbo-ID: 85e0f93d-7fe6-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699633855; x=1700238655; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hJRqa7yLK42bSotxakvkrC+HiQbNTKnL5q5ovQX0sM=;
        b=CxtsHDl6A607ko/Jrep1lICo9V+h0FBQgmN+4gU1nrMOa94qLR/V08UKQfGWmgkOfZ
         EPLtWtH+HvOhrzjHFciVJOCUoxo7J6VCXF3bmUBSK2Iqt21FZCRDvUSaxOffO0930/DU
         cHjSt7VeXCJ1z47V7mhYfjkWJWXE1fWHok07WUimBVtQ8WLmEm8Kq6X3n0EAMzD6uBm3
         62DLmjd3F8j5UCd1FJdJy7U9wzzXSC0xXaqWCu7tObNMp5L0hNoT86kvtXaKk2hWVJ/3
         InNTsWmH4SSHtTZSjj2zL10c06YA/GzAfg3cgRe0F6yvg297+sb8Ry6LPXM8gFJHBSA0
         JztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699633855; x=1700238655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5hJRqa7yLK42bSotxakvkrC+HiQbNTKnL5q5ovQX0sM=;
        b=u0seJwMA3ymNni+FvuvVpq2r4voQ+X1g2Im6smVzyoOvKAHjA9IIIMK5QncJHVqXyk
         gmvvThyQJa8lkNfVQoqy1XKVhLK0FOcwqLlGKgua7ok5O2ae7/bjEovhp8S/48YsXDIz
         9skms5Ztk4e10LZLbqtm2pYm8EMJenJlkXT+fsIuiAduI1Pu9mofV8rnLKbLq78QjsWP
         I3B8HJQ43BqgzcGLYlOxmwW3F3E6i6EDAoOlKVIe0Dsb/dPVFcoWppc1CM8AYe/2ESqp
         BV1HPa3ZCAvzSowXM42XhiHxslRagzK3nPdAUsiR6q18BdfaKhwvET/xuHP3XespFg3S
         PFew==
X-Gm-Message-State: AOJu0YxDHwuM4KmwxQp+6kPNgsDdmvuXBsuLX/YaQ3ZqUCChNClTe2uu
	irFmJ2iUXnQ5u00Cpgoy3m8sqS7FeR8=
X-Google-Smtp-Source: AGHT+IEHECIOycoxADEPzUvyyr1StZ2GkJWLN+T7Abgq6LV4jZVsB7/ZRsu3USrz3cj10fNxwH9f4Q==
X-Received: by 2002:a17:907:9304:b0:9c3:cd12:1927 with SMTP id bu4-20020a170907930400b009c3cd121927mr6480458ejc.5.1699633854909;
        Fri, 10 Nov 2023 08:30:54 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 04/15] xen/asm-generic: introduce generic hypercall.h
Date: Fri, 10 Nov 2023 18:30:30 +0200
Message-ID: <87a6f7a2135361ad231bfc0cfc2d73ca78c357a3.1699633310.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699633310.git.oleksii.kurochko@gmail.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce an empty generic hypercall.h for archs which don't
implement it.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - add check that <asm/hypercall.h> isn't included directly.
---
 xen/include/asm-generic/hypercall.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 xen/include/asm-generic/hypercall.h

diff --git a/xen/include/asm-generic/hypercall.h b/xen/include/asm-generic/hypercall.h
new file mode 100644
index 0000000000..7743b35c0d
--- /dev/null
+++ b/xen/include/asm-generic/hypercall.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __XEN_HYPERCALL_H__
+#error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
+#endif
+
+#ifndef __ASM_GENERIC_HYPERCALL_H__
+#define __ASM_GENERIC_HYPERCALL_H__
+
+#endif /* __ASM_GENERIC_HYPERCALL_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.41.0


