Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1B68379EC
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 01:47:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670228.1042821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rS4ve-0007QO-AE; Tue, 23 Jan 2024 00:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670228.1042821; Tue, 23 Jan 2024 00:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rS4ve-0007OQ-7H; Tue, 23 Jan 2024 00:46:14 +0000
Received: by outflank-mailman (input) for mailman id 670228;
 Tue, 23 Jan 2024 00:46:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1h7C=JB=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1rS4vb-0007OI-Tu
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 00:46:12 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbc95fa5-b988-11ee-9b0f-b553b5be7939;
 Tue, 23 Jan 2024 01:46:09 +0100 (CET)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2902b0e9524so1818034a91.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 16:46:09 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 oe11-20020a17090b394b00b00290d0459e3bsm120871pjb.47.2024.01.22.16.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 16:46:03 -0800 (PST)
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
X-Inumbo-ID: cbc95fa5-b988-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705970767; x=1706575567; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QL2EbelNfKplPRaLFa/5pxqZ1ShWs/qPJgvqE5R3xUI=;
        b=WbXDn9UWjxedW/+j5hkqtm8I5CTjihUPYIkPhipaM3LHHXbjIE7adHC6HrSv63VXyR
         WiG9xpiuqbGiFVDs0CUirniv3tJRjNkywjtjR5gQZ1y2JLSs7HWiJlPBAxxYMWF+nKRe
         Cw4px2CBQn9uvgJImW0IoQHTrSpYw2iM9MtdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705970767; x=1706575567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QL2EbelNfKplPRaLFa/5pxqZ1ShWs/qPJgvqE5R3xUI=;
        b=eec7VaQjvVQpne7PpIGGfNenAqCV6hJY3+c7zFy6pMKB13HF1tY6ltHGSyeFs6ndiY
         6Pz8QFhOn6o3z3I5pVXpn8zbXbNfLIl+4lAmQbldNMwsnw2ZAaRKpn7QmTMbhIMTUSth
         6ZN2ob3ssazdn9u182hfIcw1h5mNLp49CKw9xPaGJf0p+4ZO1XCYJZ2Bxi97mq4pq+4l
         WYMD+RM/4bY8a06qxzRj62CPZx34ZctEMnLCJNMCCh3GTTelwJUQHM/ir4Wmlfuz3iwV
         fwcQZm2o8o0hkncjFB3eU5Yu2jwjS7iXWGwoB028M5nDbreoUeP22XkjrGpUnmvSTXPH
         7lHw==
X-Gm-Message-State: AOJu0YxgAC3LQK2iTzz3RuQo4Mr6bWUVGSFvxBTulwZerD0z57hYYq8C
	FM7g7qlhargtDnM4246t0KiF3JPeLlX1/9gzhjXuk12a5fehm+rwoRPj0443Iw==
X-Google-Smtp-Source: AGHT+IGRFhkPzejcuLL4VRK+c8dRwaf1aYOd9GmP0Xdnbl6TsX/mwlLYTiaazDEJC80Uor5945a4rA==
X-Received: by 2002:a17:90a:d306:b0:290:5ccf:af0 with SMTP id p6-20020a17090ad30600b002905ccf0af0mr2174216pju.60.1705970767490;
        Mon, 22 Jan 2024 16:46:07 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 80/82] xen-netback: Refactor intentional wrap-around test
Date: Mon, 22 Jan 2024 16:27:55 -0800
Message-Id: <20240123002814.1396804-80-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122235208.work.748-kees@kernel.org>
References: <20240122235208.work.748-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2080; i=keescook@chromium.org;
 h=from:subject; bh=7EjHVZinq5vMXU1+hzn38DepLpa6iDayHYypzEUYJ8I=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlrwgMGbwjLdUBipRWV/86VXIdYYa28FnqDE8e3
 ji0sb3+qXmJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZa8IDAAKCRCJcvTf3G3A
 JsN6D/9/9pZCcQMxkCKVjCzbTzXOAQTMNmntEY/KiITUeK8EZC1n44hzsCtSDO9z3x4VtvUW53Y
 pRmydxh3JiySpsfiK4OxljXZ/xvSG+v1GEOgkMGo2iye6zXeVeadXsRCP2MY/IsaXKyM0TKUH5i
 g4+ChtKvF7D9haRMeRaLK4ST+SPfUX52+Z0xW6LUaGrz824SDJhB6Gq9j70+OoNvQaUNHrgZjdR
 a67Kgz/3+HnspC4bx9lGFxCUiPdmTZOz2mgatPghMoE1oX04GIjku1UTthsh6180c00i2Sk/LJI
 1bRchLyEexiVH65VHvz3Ge37s/qRJosLl2xW1ds7SHJKd3qfVFTBa++CN+0tvpd22m7lAAYF7cU
 Rkfs/ZXcyHX1COeG62Bsp15wHODlwmJxEzU00q1Rl6ynr8uVniiXT4RIR9ZRxO5c25/mmUzGvmW
 3rnZGTP9QuvpKRY6GaVrOWKPiaKo3XhsasnsuFP3f6lkYw/WdOVxY2UUWqvlpj3eah/klmSKi1a
 lDJR8pC8b50zoXsumq3xtz1lKSL3iETbnda7hCBHkYCfEhGJi2WPdHrfeEaXwDkde5gZEwPCzZ3
 EJ9TGrYsYcED0KeZFlmbguqSvBeanX+PMcLQckWAXPEbi1WgzcVvFGckq6ZyPuUJHl0C9DAM8Dk 2036V40Dg9GXNKw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

In an effort to separate intentional arithmetic wrap-around from
unexpected wrap-around, we need to refactor places that depend on this
kind of math. One of the most common code patterns of this is:

	VAR + value < VAR

Notably, this is considered "undefined behavior" for signed and pointer
types, which the kernel works around by using the -fno-strict-overflow
option in the build[1] (which used to just be -fwrapv). Regardless, we
want to get the kernel source to the position where we can meaningfully
instrument arithmetic wrap-around conditions and catch them when they
are unexpected, regardless of whether they are signed[2], unsigned[3],
or pointer[4] types.

Refactor open-coded wrap-around addition test to use add_would_overflow().
This paves the way to enabling the wrap-around sanitizers in the future.

Link: https://git.kernel.org/linus/68df3755e383e6fecf2354a67b08f92f18536594 [1]
Link: https://github.com/KSPP/linux/issues/26 [2]
Link: https://github.com/KSPP/linux/issues/27 [3]
Link: https://github.com/KSPP/linux/issues/344 [4]
Cc: Wei Liu <wei.liu@kernel.org>
Cc: Paul Durrant <paul@xen.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: xen-devel@lists.xenproject.org
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/xen-netback/hash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/xen-netback/hash.c b/drivers/net/xen-netback/hash.c
index ff96f22648ef..69b03b4feba9 100644
--- a/drivers/net/xen-netback/hash.c
+++ b/drivers/net/xen-netback/hash.c
@@ -345,7 +345,7 @@ u32 xenvif_set_hash_mapping(struct xenvif *vif, u32 gref, u32 len,
 		.flags = GNTCOPY_source_gref
 	}};
 
-	if ((off + len < off) || (off + len > vif->hash.size) ||
+	if ((add_would_overflow(off, len)) || (off + len > vif->hash.size) ||
 	    len > XEN_PAGE_SIZE / sizeof(*mapping))
 		return XEN_NETIF_CTRL_STATUS_INVALID_PARAMETER;
 
-- 
2.34.1


