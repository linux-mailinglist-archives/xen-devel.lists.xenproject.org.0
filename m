Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC109317E3
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 17:51:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759042.1168581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTNyc-0005MU-BL; Mon, 15 Jul 2024 15:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759042.1168581; Mon, 15 Jul 2024 15:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTNyc-0005Jf-8X; Mon, 15 Jul 2024 15:50:58 +0000
Received: by outflank-mailman (input) for mailman id 759042;
 Mon, 15 Jul 2024 15:50:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kjrg=OP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sTNyb-0005JZ-JI
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 15:50:57 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0579e383-42c2-11ef-8776-851b0ebba9a2;
 Mon, 15 Jul 2024 17:50:55 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-58c2e5e8649so8174215a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 08:50:55 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59b26996c70sm3500774a12.68.2024.07.15.08.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 08:50:53 -0700 (PDT)
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
X-Inumbo-ID: 0579e383-42c2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721058654; x=1721663454; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wlcacq3D7/wDV3JkjIizADpuCLlI8wfhHrBspBZfTwo=;
        b=BWdz3Tlhesy15siLixP6I5PoHF+IKoxz/BSfcofCc9jbllh+DgIvFhebFcjiFzE6oq
         erGjP4/2kQnY0BNHkRyecn6z0Dv2hDHdwqR+HA40fC2TIDCf7z26HSbGyXLQKWNlGiqj
         FVU18HZeCISoWIa3Xb8GVTGCdYDgiiyP9YA4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721058654; x=1721663454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wlcacq3D7/wDV3JkjIizADpuCLlI8wfhHrBspBZfTwo=;
        b=wR0DALAICT8f5Xh6RKeybFUa1yPL37WyX3oZQoLKG5ePXYWyuXfsSr5FVHsJirBIJC
         WDDeXe6MAzPHChK8nO9QoKu49NsUyW5RpLiv03FBguebXVBIzSoKPBJM2tjRJhuSQLcK
         HYkxm0Hmgawuo3KfAIFEPOI96WIkVNoS91+vQILCV8RXNRa0Jc+PNLQ63HHL66QR7+Ms
         wX6a2cKfoytYIvw2ss2x9mv1+ZgdXJonNY5vMZNKh/qm6QhKYmp3bqnL3k2HUXm+efvu
         m0Ln7lY6hRfYsCBTBqWCzzgK2j5KBvOqfKrnGzI4OvkSZddIbIGmDjtqCuOJuHILSyyV
         mzuA==
X-Gm-Message-State: AOJu0Yw0bUx2ORX0UKKdAkRHGxJ59kh2P9OmRyLN780NRFHnVr4EHe6z
	Y1BBpacEeUbvbv5GSLYhAyZixxHtyc+6kdOHUC/XO/dkroihamJt6zvDWBeAa62zP7EMeDGsBE1
	u
X-Google-Smtp-Source: AGHT+IGWbkgRfzLrFTVpGixPDbkJVg3eIDBmsSZBeC831COv2XaQG4tAkCHxIorB4srxbPZHqbdhrw==
X-Received: by 2002:a05:6402:3592:b0:58c:36e:51bf with SMTP id 4fb4d7f45d1cf-59e96c865c9mr211118a12.3.1721058653857;
        Mon, 15 Jul 2024 08:50:53 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19] docs/checklist: Fix XEN_EXTRAVERSION inconsistency for release candidates
Date: Mon, 15 Jul 2024 16:50:51 +0100
Message-Id: <20240715155051.3375999-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An earlier part of the checklist states:

  * change xen-unstable README. The banner (generated using figlet) should say:
      - "Xen 4.5" in releases and on stable branches
      - "Xen 4.5-unstable" on unstable
      - "Xen 4.5-rc" for release candidate

Update the notes about XEN_EXTRAVERSION to match.

Fixes: 15241c92677a ("process/release-technician-checklist: Explain how the banner in README is generated")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 docs/process/release-technician-checklist.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/process/release-technician-checklist.txt b/docs/process/release-technician-checklist.txt
index 4b061bf5f20b..e6db02b87585 100644
--- a/docs/process/release-technician-checklist.txt
+++ b/docs/process/release-technician-checklist.txt
@@ -67,7 +67,7 @@ t=RELEASE-$r
 # if main version number has changed (eg 4.7 -> 4.8) rerun ./autogen.sh
 * rerun ./autogen.sh to update version number in configure
 #    - XEN_EXTRAVERSION should be as follows
-#      `.0-rc$(XEN_VENDORVERSION)'       during freeze, first rc onwards (including staging, before branching)
+#      `-rc$(XEN_VENDORVERSION)'         during freeze, first rc onwards (including staging, before branching)
 #      `-unstable$(XEN_VENDORVERSION)'   unstable aka unfrozen staging (or unstable branch, after branching)
 #      `.0$(XEN_VENDORVERSION)'          actual release of Xen X.Y.0 (aka first actual release of Xen X.Y)
 #      `.Z$(XEN_VENDORVERSION)'          actual release of Xen X.Y.Z (stable point realase)

base-commit: 1ddc8c1bad93aa6cbfe616dd72333460c47f96c9
-- 
2.39.2


