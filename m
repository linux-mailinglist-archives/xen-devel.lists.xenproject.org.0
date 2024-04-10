Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1918A0091
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 21:28:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703572.1099262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rudb9-0003Zs-VI; Wed, 10 Apr 2024 19:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703572.1099262; Wed, 10 Apr 2024 19:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rudb9-0003Xd-SM; Wed, 10 Apr 2024 19:27:07 +0000
Received: by outflank-mailman (input) for mailman id 703572;
 Wed, 10 Apr 2024 19:27:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wftW=LP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rudb8-0003XU-0T
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 19:27:06 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e7e1f93-f770-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 21:27:02 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-56e2b41187aso266512a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 12:27:02 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 x26-20020aa7d6da000000b0056e460eda12sm5449178edr.55.2024.04.10.12.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 12:27:00 -0700 (PDT)
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
X-Inumbo-ID: 4e7e1f93-f770-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712777221; x=1713382021; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P1XojucwcBoOj2YCVjGcUgrZ4dJuDGeY0F252K1EUEU=;
        b=B5BBMatvWycRsAk25E7Z3CX8jsECCn6QegPF91ti281cz9WyWmjAwuaKx1IrCY3wGN
         IywLNGz5J/wm7M/qKemae3u4oUjYnRzynQ2aPL0bG97uvU1mICz1kAkXeZzZBin8h3WX
         4lHuKiqWirZdeqiBGCTedgCmuPWmkdlPRVpNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712777221; x=1713382021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1XojucwcBoOj2YCVjGcUgrZ4dJuDGeY0F252K1EUEU=;
        b=XI+p3nbUmGc6HtSgHWt9XecYEtEVb+tCi/vflqPJE0lZ+XddjSi32DIomaYPlliwhC
         b81dr4d8QAU6DT+uqf7+6gBDNVX8B543iDd5X0cz/eTixkUd2AaUsZ7NkBqrSGcA+NXl
         NMkxoP75QRLVKmUyoQ0W7wcGMR7YjbE1QiJGRgc/0MhowRftNrOxLjiaulcZVTslG3N3
         k3rWsFsMutjyY9KMnlD/mNrbxMeaoYIvE/Kpq8+5bpBHi1l1TBJjMzM7eGcrafEImrnm
         k4XJKDT7H67m4YcdoH04Qz4iNCHHjcWGF9TAJmMuBE++/VkmFeBgp8IF5UHYNNdufGoi
         P85w==
X-Gm-Message-State: AOJu0Yzbj292RTqRESJBAcQS9yUfKOhLSns5iJ+AlI581dxQ5cT+Y1Lh
	vAK3xqx/25G5GzL/Rz8OqIrb+d6fdZ6vnzhjBXNkkbyIg3rD5VnVXwVnoNYwVI4auspxYY+ONaw
	lX6E=
X-Google-Smtp-Source: AGHT+IFKJnRqQNCPURbLiHRZvUssBKJtjoArog7gHJPsbHES3mvs4XWzpcKgk9CxKHQcxftplTlYnQ==
X-Received: by 2002:a50:a45a:0:b0:56e:1e47:c0b2 with SMTP id v26-20020a50a45a000000b0056e1e47c0b2mr480359edb.4.1712777221282;
        Wed, 10 Apr 2024 12:27:01 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH] xen/nospec: Remove unreachable code
Date: Wed, 10 Apr 2024 20:26:59 +0100
Message-Id: <20240410192659.1490271-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When CONFIG_SPECULATIVE_HARDEN_LOCK is active, this reads:

  static always_inline bool lock_evaluate_nospec(bool condition)
  {
      return arch_lock_evaluate_nospec(condition);
      return condition;
  }

Insert an #else to take out the second return.

Fixes: 7ef0084418e1 ("x86/spinlock: introduce support for blocking speculation into critical regions")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Federico Serafini <federico.serafini@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/include/xen/nospec.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/include/xen/nospec.h b/xen/include/xen/nospec.h
index 9fb15aa26aa9..828dbd4e0ad8 100644
--- a/xen/include/xen/nospec.h
+++ b/xen/include/xen/nospec.h
@@ -82,8 +82,9 @@ static always_inline bool lock_evaluate_nospec(bool condition)
 {
 #ifdef CONFIG_SPECULATIVE_HARDEN_LOCK
     return arch_lock_evaluate_nospec(condition);
-#endif
+#else
     return condition;
+#endif
 }
 
 #endif /* XEN_NOSPEC_H */

base-commit: 0e7ea8ca5fc9bce9248414f6aaf2dc861abd45d9
-- 
2.30.2


