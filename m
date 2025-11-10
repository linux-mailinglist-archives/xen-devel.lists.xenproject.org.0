Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E86C48119
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 17:44:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158606.1486937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIV0L-00008C-5K; Mon, 10 Nov 2025 16:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158606.1486937; Mon, 10 Nov 2025 16:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIV0L-00005b-1x; Mon, 10 Nov 2025 16:44:33 +0000
Received: by outflank-mailman (input) for mailman id 1158606;
 Mon, 10 Nov 2025 16:44:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8h32=5S=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vIV0J-000841-01
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 16:44:31 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 873d6c02-be54-11f0-9d18-b5c5bf9af7f9;
 Mon, 10 Nov 2025 17:44:30 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-42b387483bbso1114020f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Nov 2025 08:44:30 -0800 (PST)
Received: from localhost.localdomain (host-78-149-11-196.as13285.net.
 [78.149.11.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ac675caecsm23199456f8f.30.2025.11.10.08.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 08:44:29 -0800 (PST)
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
X-Inumbo-ID: 873d6c02-be54-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1762793070; x=1763397870; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ATYaMcg4FdVN2MNi5kBpKlRbqlIhW8GlJrzSP+D662c=;
        b=ASmVSa45tcRod+cRwWAGcms2CgzrUUc2AJfHUA8EDSF3tDikxyboXlTtkneBy06JZQ
         I+Cy10aGnkUyex33eW5gqPQ8pOpJgoIdyKFJYVGfB0Ux2imUSsTKhtCRjUr24nj+xXCO
         KnjjsbeiZA42zPoX01bDZRzFPNVZUc4jKCYnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762793070; x=1763397870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATYaMcg4FdVN2MNi5kBpKlRbqlIhW8GlJrzSP+D662c=;
        b=NgmBDRSONH0J/VsK8tav1LxQ4NAUq40K8+RikXhS70DhxLQc3ascTGlqy2UHxHGbo8
         CmFbd7Gm9OIzBfXpTpuXFvOkx2FwOf//0BcXXD3oziciyscF0LB0Gl5ogFArt66hOFTg
         JjJ2Oy8UJLMFb68eGAB3a5XltwbKteJkkb9xLaXobVoKqOZGS9CguP5mjfjg9rJpHBwK
         LziYLi/Uui/16JYxn0JzQsRKaVbJbaoStUkMBqYGdQrBln+okVfcPPkhVZsuiMfwxvhe
         ua004uZbHIbScf0b3cnlCaGZNPllytJPdhQL8Sa1uqwgx7MYOTmUEoM1SQkDHLL1/rjc
         v66A==
X-Gm-Message-State: AOJu0YzyvH+OHANncZOf731DGrOLHy0CeUnjWiPMmtX/+/m/DG/gxHg6
	BqISNLbroNE9qJHp6tgtddqZh5I7MSFQV4ldKlgh2HEPrYBnCE0skWeVTEbA5ekcERjB9+ZkIbE
	o8/RDJgQ=
X-Gm-Gg: ASbGnct1GH9B3tgrWcgu8/qTkghKung/2cqPUHhw+IHeIxQtvqBnywpTXn16qgs7iJS
	B6kvvuStgXsCdgjXGwoDrAMVlOg9iZ6eeVgeY3oWRs3VXcdqB/QCQfquPoPoyGR0JJ6x1FuhPdb
	yuc9TuWBvxSBGeeLUkn26f4EU0ApY/U6sPlzRXZnlAUdSh4/+5HU0EDopHgCMoh69W9L0PkC+wq
	Nh4hTyi5j61xmiHT2c0Uu/U6PYd1tRwzl5gTeGgnlBlilrbNLMyE+MWMK+yh3GgYdnqZ1jMOyzL
	EwYDm+JY7VqZptuhOjgn0CZewjsPTATy2aF2XjL6F6wLvcHQQaqpJUTI0U0cI9BFoQutiZX3L5+
	oCGHTc9ssZVKDqEwlL3QjXMB7C4+dr5dT8yGl6F6TcpRjbxHIR9w99WBh7phuP3AbELP2s9YzL4
	1L7mgrp0KRvCv/fCm7z0+UpzzPuBppvWGWlPflrANWlaVq+wGnedMhbYV7UDBLqw==
X-Google-Smtp-Source: AGHT+IG4NH9qxjkFD9F37q4SK7PLG3paAGuS/tDALl4u+nmg7eo0NhiViB40kuNY5TZBUrzFCUkzMQ==
X-Received: by 2002:a05:6000:2510:b0:427:9e6:3a64 with SMTP id ffacd0b85a97d-42b2dc9f65bmr6875751f8f.47.1762793069663;
        Mon, 10 Nov 2025 08:44:29 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Rob Hoes <Rob.Hoes@citrix.com>,
	Pau Ruiz Safont <pau.safont@vates.tech>,
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] CHANGELOG: Note about oxenstored being deprecated
Date: Mon, 10 Nov 2025 16:44:27 +0000
Message-Id: <20251110164427.54299-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Török <edwin.torok@cloud.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
CC: Pau Ruiz Safont <pau.safont@vates.tech>
CC: Andrii Sultanov <andriy.sultanov@vates.tech>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

I'd like to add a --with-system-oxenstored= but I don't have time.  That will
have to wait for 4.22.
---
 CHANGELOG.md | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index fc4f6d7c8a09..080305ef456f 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -53,6 +53,11 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
  - Support of qemu-traditional has been removed.
 
+ - The in-tree oxenstored is deprecated and will be removed in a future
+   version of Xen.  It is moving into the Xapi project
+   https://github.com/xapi-project/oxenstored so it can be maintained in line
+   with the other Ocaml projects in the Xen ecosystem.
+
 ## [4.20.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.20.0) - 2025-03-05
 
 ### Changed

base-commit: 343e01fd1d31dc6867473599c2c49039386bdf79
-- 
2.39.5


