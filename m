Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08729A4C329
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 15:18:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900366.1308318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp6cN-0008BR-8O; Mon, 03 Mar 2025 14:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900366.1308318; Mon, 03 Mar 2025 14:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp6cN-000882-5X; Mon, 03 Mar 2025 14:18:03 +0000
Received: by outflank-mailman (input) for mailman id 900366;
 Mon, 03 Mar 2025 14:18:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2B8f=VW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tp6cL-0007eo-Qc
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 14:18:01 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 502341fc-f83a-11ef-9ab2-95dc52dad729;
 Mon, 03 Mar 2025 15:18:00 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-390df942558so3553339f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 06:18:00 -0800 (PST)
Received: from andrew-laptop.. ([46.149.103.9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47a5b96sm14550595f8f.29.2025.03.03.06.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 06:17:59 -0800 (PST)
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
X-Inumbo-ID: 502341fc-f83a-11ef-9ab2-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741011480; x=1741616280; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bUcVUIZPypWgBJW2ze5YB6YSFj9zIZA8sIIcx52hs4=;
        b=mJOq+Qc4FCuSyeNS6KYwTMKnjPl9qnMdnyXef5x8cHfQWhK4l9gLZ26u/lpvR3oG3j
         T5kxVaj+fXhMu71bNQjR261PrmCcjWibJ7WrBzvAg1SZ5O4c+7idGiyfsZy13d2aLRvY
         kCm/VTmHhfpTpywqf5DdYchW3A35gPzxA2UA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741011480; x=1741616280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6bUcVUIZPypWgBJW2ze5YB6YSFj9zIZA8sIIcx52hs4=;
        b=hp3JWamA+CpLR8ugfdHinGQT4a3JFRlZ/zXUdkJh1+GAFPP7ukLqQ5LnDcBXpVlEuo
         Kyehv+Yt7cn8795IWgW1upzcOejJJdRDOTWmcV7XALIw4ICcyCGAKkeFn8PqbXrc3Wwx
         fE4KhSnWOdQ1mSE7cxc4lTeLkndNWxpYhcqg23xsZtrJjwGFEPZncjb3xmSVnvvcUwHg
         3w88hFNDV1igdslgB5AYxjbnqWYYt/PCI0ndxQb/S/iL/a/bfL1Of97YIre100RDZNge
         XcWwvFm2NQu1MzMg/CQTK7FyEFP6ucCXvEs9mcnkjD45JZ/KeF69GxvPk3/3gNbwiAY3
         qdjQ==
X-Gm-Message-State: AOJu0YzCbeorBA6xRwg6y8SVQRU+KGhBI0yfjG0yxkwnK8Jz7XPgMi/E
	CmJupRNpq3GokQte85ffAOCpAR8r3jTWVVEEJGtEJyFfXYQCkHbda4o4SBeNwDCL7l5JiIRD0+K
	s
X-Gm-Gg: ASbGncsr7/Frv5QrBXfyunGhK4T1WTfCOe51O8e4XWZ/0od03XyI3Et2G8+SPC61fG+
	UlxZ1qGinLoUBcQJXCxmUmzZxJ7hbWCxUyb/zl4lrA9GRchikQWUJmc4fdIIf30Ri9DGCvUDLM1
	ceOkh+ykceYzrDnQAiVXYVWIBBe8F/Xqd5LD+L5/ha50C6epGSzLUCxTTwehpTkXThlefEHpY/v
	Dyc46nmkQ4dB1iPvtTsSq6L0FFsd56ZYSE9AZGE02b/lJR3R0XnToRvhx/mSxSIWowg6eK3/WVa
	7iJ7clMJ0iVNQPQrb23qj+e8GknnjNhyLildVu8Rui7Vv0PG515STbM=
X-Google-Smtp-Source: AGHT+IGOlVx31lQf7cBhOhbazTc/MgSK6oi161kfcrH+Z+/cEacfQJ4ZNfRqCNQdSppGdPDQ7bdBzA==
X-Received: by 2002:a5d:5889:0:b0:391:1222:b459 with SMTP id ffacd0b85a97d-3911222b5fdmr1741472f8f.49.1741011480090;
        Mon, 03 Mar 2025 06:18:00 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.20 2/2] SUPPORT.md: Define support lifetime
Date: Mon,  3 Mar 2025 14:17:54 +0000
Message-Id: <20250303141754.26452-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303141754.26452-1-andrew.cooper3@citrix.com>
References: <20250303141754.26452-1-andrew.cooper3@citrix.com>
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
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

4.20 only.
---
 SUPPORT.md | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 2bc5bd81ee39..a72798aeeae4 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -9,13 +9,13 @@ for the definitions of the support status levels etc.
 
 # Release Support
 
-    Xen-Version: 4.20-rc
-    Initial-Release: n/a
-    Supported-Until: TBD
-    Security-Support-Until: Unreleased - not yet security-supported
+    Xen-Version: 4.20
+    Initial-Release: 2025-03-05
+    Supported-Until: 2028-03-05
+    Security-Support-Until: 2026-09-05
 
 Release Notes
-: <a href="https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes">RN</a>
+: <a href="https://wiki.xenproject.org/wiki/Xen_Project_4.20_Release_Notes">RN</a>
 
 # Feature Support
 
-- 
2.34.1


