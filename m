Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D493BA12928
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 17:49:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872894.1283889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY6aL-0004gc-9S; Wed, 15 Jan 2025 16:49:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872894.1283889; Wed, 15 Jan 2025 16:49:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY6aL-0004dv-6l; Wed, 15 Jan 2025 16:49:41 +0000
Received: by outflank-mailman (input) for mailman id 872894;
 Wed, 15 Jan 2025 16:49:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4o+i=UH=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1tY6aJ-0004dp-Lg
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 16:49:39 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4e9a9b8-d360-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 17:49:37 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5da135d3162so1277047a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 08:49:37 -0800 (PST)
Received: from localhost ([185.68.248.203]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d99008c523sm7695114a12.8.2025.01.15.08.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 08:49:35 -0800 (PST)
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
X-Inumbo-ID: b4e9a9b8-d360-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736959777; x=1737564577; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5pRNe8wbi9tZ0aom2g5sJEKlIHFZvI7gb4bs1jk9GL8=;
        b=Q+kl4iFOw4uVhiwa61N7mgIp9kG1X2qSS5JNxYMex32/0UO8+mUQjbEz6xyIScHoWv
         WGbfGPiWUA6QUV4c8VQhqJhvldbIsukQ46dbhDzMToYixi1hR11lFpkIOpT830Vz1tg+
         /9IwKvA7xwcCDgiHAYLPVN2lcF365Fd4rxI9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736959777; x=1737564577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pRNe8wbi9tZ0aom2g5sJEKlIHFZvI7gb4bs1jk9GL8=;
        b=FaYwwji+n2vRfiYiS6mEWq1MB9OpyBcXfePdI29IIFkdJ+UmBJX6Rkl4TN9Kcvw/NW
         3qdM7hBmqhkr2vPul2ljsKCsIZfZujJanruxl2IFgrGfaqOWKhKqychK8QYAz9SHJ/Yh
         fH0Z4SK6ZOmZOqf+Tsl77B3rWV1HqkDnEKvoIlFXvf2v/ICEZH+WEC6m3aE0uJ3rIfMb
         EPH7THU/9BiccZ5ZnI+dbRoMxLKDNahI4VKeXdNtOOAyk4vDvB1w/Wg6GNPXVNlTmVnW
         6SGmgutVwKf75vO0gvxThoZedxTWoVDsQG5tguCPpI+KwG+X91jQvsp63x0zde/tYwxH
         TUFw==
X-Gm-Message-State: AOJu0YwB5aY1NspS1RdzXDeWMN15j9wV+Bhkfor7n8DJWIYg9An0HEPg
	R4/X0cZF/9vm3RgHnFaDqP/QGQt8lqnkMl5ogLTtw/AEmNQzwQG/FWekJo98zPmrcOylzt7MuAI
	NK76aCA==
X-Gm-Gg: ASbGnctr4hr714tTbfI3uOT+xCfrybmq9JbzwmthAQ3t1d8jdUXba0kD7y/VtgpHrO4
	6sPhkLwPNotuDRrCZyTXBC5YUBhWashMnpXwk7eSG347VXOTW6iuq6QW64QDou8jMyKIQLioByi
	SaGlWlKZDtG5jwoJiNB9Tr3Zz05H5rhDhPUEPAgba//xUrpW28XLy6nE7/XvrwsbHIK7sOLfzhf
	wJae6jJtBbAoLsLGrMJIMOHNl724aPGRfpzYLDyy3u5kRXDdtm3zhX0HJQ67w==
X-Google-Smtp-Source: AGHT+IGFhYGLOGx+UEZg9b6vDmOlXgVAdHkfCiSIaunmxo/b1LC9C0Nj3yPvU3hrP2S1tiSZTo3qpQ==
X-Received: by 2002:a05:6402:3514:b0:5da:105b:86c2 with SMTP id 4fb4d7f45d1cf-5da105b87d5mr2107346a12.20.1736959777044;
        Wed, 15 Jan 2025 08:49:37 -0800 (PST)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] docs: Fix spaces and capitalisation of proper nouns and abbreviations
Date: Wed, 15 Jan 2025 17:49:32 +0100
Message-ID: <cf18d0a24e393191ec243bb67aecfd7631429576.1736959522.git.bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
---
 SUPPORT.md                       | 18 +++++++++---------
 docs/designs/qemu-deprivilege.md |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 2bc5bd81ee..9478b70b1b 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -258,7 +258,7 @@ Go (golang) bindings for libxl
 
 ### Linux device model stubdomains
 
-Support for running qemu-xen device model in a linux stubdomain.
+Support for running the qemu-xen device model in a Linux stubdomain.
 
     Status: Tech Preview
 
@@ -626,7 +626,7 @@ Guest-side driver capable of speaking the Xen 9pfs protocol
 
 ### PVCalls (frontend)
 
-Guest-side driver capable of making pv system calls
+Guest-side driver capable of making PV system calls
 
     Status, Linux: Tech Preview
 
@@ -1060,8 +1060,8 @@ This file contains prose, and machine-readable fragments.
 The data in a machine-readable fragment relate to
 the section and subsection in which it is found.
 
-The file is in markdown format.
-The machine-readable fragments are markdown literals
+The file is in Markdown format.
+The machine-readable fragments are Markdown literals
 containing RFC-822-like (deb822-like) data.
 
 In each case, descriptions which expand on the name of a feature as
@@ -1125,7 +1125,7 @@ in such a case this feature may be described as "Stable / Interface not stable".
 
 Does it behave like a fully functional feature?
 Does it work on all expected platforms,
-or does it only work for a very specific sub-case?
+or does it only work for a very specific subcase?
 Does it have a sensible UI,
 or do you have to have a deep understanding of the internals
 to get it to work properly?
@@ -1168,7 +1168,7 @@ will they still work when I upgrade to the next version?
 
   * **Stable**
 
-    We will try very hard to avoid breaking backwards  compatibility,
+    We will try very hard to avoid breaking backwards compatibility,
     and to fix any regressions that are reported.
 
 ### Security supported
@@ -1200,7 +1200,7 @@ are given the following labels:
   * **Supported, Security support external**
 
     This feature is security supported
-    by a different organization (not the XenProject).
+    by a different organization (not the Xen Project).
     The extent of support is defined by that organization.
     It might be limited, e.g. like described in **Supported, with caveats**
     below.
@@ -1221,8 +1221,8 @@ Some features are only for HVM guests; some don't work with migration, &c.
 
 ### External security support
 
-The XenProject security team
-provides security support for XenProject projects.
+The Xen Project security team
+provides security support for the various projects of the Xen Project.
 
 We also provide security support for Xen-related code in Linux,
 which is an external project but doesn't have its own security process.
diff --git a/docs/designs/qemu-deprivilege.md b/docs/designs/qemu-deprivilege.md
index 603491f24d..3be33adf6a 100644
--- a/docs/designs/qemu-deprivilege.md
+++ b/docs/designs/qemu-deprivilege.md
@@ -297,7 +297,7 @@ namespaces):
     unshare(CLONE_NEWNET);
 
 QEMU does actually use the network namespace as a Xen DM for two
-purposes: 1) To set up network tap devices 2) To open vnc connections.
+purposes: 1) To set up network tap devices 2) To open VNC connections.
 
 #### Network
 
-- 
2.43.0


