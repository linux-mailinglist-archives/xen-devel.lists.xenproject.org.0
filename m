Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF6FB1CA17
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 18:55:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072026.1435365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujhQa-000111-BL; Wed, 06 Aug 2025 16:55:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072026.1435365; Wed, 06 Aug 2025 16:55:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujhQa-0000yc-8m; Wed, 06 Aug 2025 16:55:48 +0000
Received: by outflank-mailman (input) for mailman id 1072026;
 Wed, 06 Aug 2025 16:55:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sNe+=2S=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ujhQY-0000jh-VT
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 16:55:46 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3271b7b4-72e6-11f0-a323-13f23c93f187;
 Wed, 06 Aug 2025 18:55:46 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b788feab29so10009f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 09:55:46 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c485444sm23908165f8f.66.2025.08.06.09.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 09:55:45 -0700 (PDT)
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
X-Inumbo-ID: 3271b7b4-72e6-11f0-a323-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754499346; x=1755104146; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wO9JfllS5FWCnVoHAuqpBc7KBOdxU641rFIfPFgpLTw=;
        b=pDwjE5/im67z7/dTU21wKE51j1wSoIaZV7apokNRI+pNdduDxE+LQsmz9sC9fPicph
         Sq1l7F3nWO7yA2v12angKQs4BSY0gyL5QQjsqQWQ8QupiWIQBw/FcsYIxNzhu2F0745G
         LHlf01Q6/OCnaFU1sxvJaJX8aza7OWvhQjfRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754499346; x=1755104146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wO9JfllS5FWCnVoHAuqpBc7KBOdxU641rFIfPFgpLTw=;
        b=CJMmZmO7Woux7eS0bsj0kVcOy/Rfyy1eTLgHuMrNIdvi7SeE0FezvsHEpS5FFkYaMl
         ZuXajzXh00pnzVpGvwL0mQmZEJXP8iHIP284vnZWdfmwJoAyJdC4gHbn1ECwXUyhs8lO
         7KJPw9TvwSjcRB569GQP/N5GySuGDvkAeiQrv9SpBm4uwKtoF9Rt9uLbPIsutLo/fLoY
         7uBzA956siPx2xqsaRO+UymwpiY/6dUPtQXDRh9FO3Tp0F2Yu7EhoGThVEIFmRSjO6Ca
         uFeY69SKT2qL/J4EeznvmD2h4PsqrZ9GVi2Qcpqcfh1zM7EO/AyahDAZn+ZxxAgZxvq4
         XSBA==
X-Gm-Message-State: AOJu0YxNRU8kwSiAUaqzwAU7pTAMG7kUhyF28zqrRcZkp2GD+09/pMOX
	MQjiJDOD2mlvY1a1VVO2QTZ1azGi5gAaJogaX6VaZcxs/InE9MVJEcOXkwP4AOfzmnCoBYHaNc/
	sHHA6sOQ=
X-Gm-Gg: ASbGncsAqe3daMf1PrqIjCg8CIR35icEAj2CPKI4Hi0v1kAf9IoSvSEWHA4HuvAr7cR
	tav80MJDy+KQOq6/KXOgE4uU7f3y7Swva5oFS7+/RcC4vslK5+uRVUoAfyHbZZwhDgQ9mKdReeB
	hNpfjcwOgivr8OE7a2K4FR+0LEMlt15wRBvosSR7TRhPXBlXKDH5mKgmrJD7v+bkdFh9yVY7cbd
	NCxZ6V1o6FXlts2EGUtYsHyFsQS6V+lYLMbUNtMwSwh9XY+zjh96IUOX0BrCu4aO3WKnhNUbKh3
	gWlqrsr+//myFzJchJsl0hFjLFIauB6UQNp/qBLj3az8sON1qcvTXC+sy6Lv8LTOfEwN8qt9hiy
	UjQ8KmBtQu1Odbf4AjTnnifdgtLIsJjNgMDwQAbKng/d4SsXuQmxEepm0KtpYoZQ9Gs4pPn7H58
	08
X-Google-Smtp-Source: AGHT+IEKw27/CH5tQ523u/T3Z2EEXzij0UN9NFs09fawluLr4FOsc/yxHA8IG/WkRQbgAA41opXegw==
X-Received: by 2002:a05:6000:258a:b0:3b7:9af4:9c93 with SMTP id ffacd0b85a97d-3b8f41c836cmr3450720f8f.35.1754499345637;
        Wed, 06 Aug 2025 09:55:45 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] x86/domctl: Reject XEN_DOMCTL_hypercall_init against oneself
Date: Wed,  6 Aug 2025 17:55:43 +0100
Message-Id: <20250806165543.169140-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A toolstack is expected to use XEN_DOMCTL_hypercall_init where applicable to
construct a new guest, but is absolutely not expected to use it against
itself.  Kernels have a stable ABI for accessing the same functionality, via
MSR 0x40000000.

Found when auditing hypercalls for Host UEFI-SecureBoot safety.

Reported-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/domctl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 3044f706de1c..bf1ee4ed51a0 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -372,6 +372,14 @@ long arch_do_domctl(
         struct page_info *page;
         void *hypercall_page;
 
+        /*
+         * Kernels should use the MSR method to get a hypercall page.  The
+         * toolstack should not be using the DOMCTL on itself.
+         */
+        ret = -EINVAL;
+        if ( d == currd )
+            break;
+
         page = get_page_from_gfn(d, gmfn, NULL, P2M_ALLOC);
 
         if ( !page || !get_page_type(page, PGT_writable_page) )

base-commit: 68797a710f4e91cc09fe5650ee14478316010f88
-- 
2.39.5


