Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B2A914810
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 13:08:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746504.1153576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLhYe-0001um-P9; Mon, 24 Jun 2024 11:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746504.1153576; Mon, 24 Jun 2024 11:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLhYe-0001sP-Lu; Mon, 24 Jun 2024 11:08:24 +0000
Received: by outflank-mailman (input) for mailman id 746504;
 Mon, 24 Jun 2024 11:08:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dlsF=N2=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sLhYd-0001sH-DE
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 11:08:23 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10d9b3e2-321a-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 13:08:21 +0200 (CEST)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-79776e3e351so324295985a.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 04:08:21 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b51ef32f9csm33060646d6.91.2024.06.24.04.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 04:08:19 -0700 (PDT)
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
X-Inumbo-ID: 10d9b3e2-321a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719227300; x=1719832100; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+5qC9sjfZW5xvtM27k2obmnqE9Kc0AqhK5r2h4CzQCk=;
        b=VUN715t7gpKRgp7oMyWUJwhMmfABgUccbNQ4B/OBwbNM+L8UIx8vS16fF+lUP9WReh
         8Evxjbj5gsnfqfS5DAZzKPxCzsWjAi/v1RdvHeD6dNiYsQATwFHlLdQuhHAg/mGkzi3P
         BB6ekJ5TlmRmTwoodHUMk0cSBI0nc95c0VPMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719227300; x=1719832100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+5qC9sjfZW5xvtM27k2obmnqE9Kc0AqhK5r2h4CzQCk=;
        b=vGrehJdSamZqEtimV7zojGLM6r4kbzt19uUNx9DnHdBl7zytRbmA57oeLUwiWJ0pJJ
         rQ/xUVs/HWXMTyWPzn4C+MLSQMhXMmQv0Fue2+n7heB1EDGgqtPdyijjH2S3z2+hN9IK
         NhvGW37r8dDdf9RiFp40kp7WHbQXQRxPEDTLphN+aEYoveoUXQdrRPmAEG+1tOuxWmE/
         jM5UybFkgyzPwt0ZuYaX7CBiDwMB8fbChDicYpm2G+gSsasjp8f+DUSrH0Dd7FY87kOa
         UAZ+NEjdK8EBrvZUWW+/lWX3y7rmjUdtwMhkFfVY5ABrU0ozBEOakTVkrT2Aj8t+ZOa0
         bnSw==
X-Gm-Message-State: AOJu0YxGUvfgmbLR7BV9wP0sovabAxeie19qcpoj+EC7fq3pYEoW5AKs
	TjQid7amUzow55pLW2+JpOlt46Hd5hFKGbxiruvJUjBKgvcv6zorNTA0tuHI8GhM7B/jDRb7hZb
	i
X-Google-Smtp-Source: AGHT+IG0B2zg5ewAzZld7SrzOhRA0mZZUneC/LOwnH2XbW/B2ZbTeoZBmXGyZnkDg7TXceUwal4guA==
X-Received: by 2002:ad4:50c8:0:b0:6b5:165:2f78 with SMTP id 6a1803df08f44-6b53635fd93mr54361946d6.13.1719227299753;
        Mon, 24 Jun 2024 04:08:19 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.19] tools/xenalyze: Remove argp_program_bug_address
Date: Mon, 24 Jun 2024 11:49:30 +0100
Message-Id: <20240624104930.1951521-1-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xenalyze sets argp_program_bug_address to my old Citrix address.  This
was done before xenalyze was in the xen.git tree; and it's the only
program in the tree which does so.

Now that xenalyze is part of the normal Xen distribution, it should be
obvious where to report bugs.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
Freeze exception justification: This is only a change in
documentation.

CC: Anthony PERARD <anthony@xenproject.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
---
 tools/xentrace/xenalyze.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index d95e52695f..adc96dd7e4 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -10920,9 +10920,6 @@ const struct argp parser_def = {
     .doc = "",
 };
 
-const char *argp_program_bug_address = "George Dunlap <george.dunlap@eu.citrix.com>";
-
-
 int main(int argc, char *argv[]) {
     /* Start with warn at stderr. */
     warn = stderr;
-- 
2.25.1


