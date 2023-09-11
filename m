Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9089679AA5F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 18:53:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599662.935194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfk9Y-0007NG-7C; Mon, 11 Sep 2023 16:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599662.935194; Mon, 11 Sep 2023 16:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfk9Y-0007LR-3w; Mon, 11 Sep 2023 16:52:48 +0000
Received: by outflank-mailman (input) for mailman id 599662;
 Mon, 11 Sep 2023 16:52:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zO6f=E3=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qfk9W-0005g0-Be
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 16:52:46 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1855e22-50c3-11ee-8785-cb3800f73035;
 Mon, 11 Sep 2023 18:52:45 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-31f6ddb3047so4536273f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 09:52:45 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a05600c11cd00b003fefcbe7fa8sm10578124wmi.28.2023.09.11.09.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 09:52:44 -0700 (PDT)
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
X-Inumbo-ID: a1855e22-50c3-11ee-8785-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1694451165; x=1695055965; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkRR/xJIMJPUUYAon5vdXYf6WC9lWsytp6TbHgmeAz8=;
        b=IyoCH9s8YEfQUzAGz8wS9Qz/nWObiViatHfdSjlAHrmytbpA1R/X4sxo9pptJOb0cL
         qB/kRaZbZoFZ7kmsvpD6hihcWmvQLHz4bUOK4MThpLL86VARIg2a3VtjeJ56c5yEUJBe
         JicXqFFGCeBkX/DrkVluOXmV+FSYCynK/eVR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694451165; x=1695055965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TkRR/xJIMJPUUYAon5vdXYf6WC9lWsytp6TbHgmeAz8=;
        b=QqtiRlvU0TqYcRslUju5zSyo9gwmwANdme6y5nUc4rz0EpAc3E0Z2KiD68gMvNmZqS
         /3Bq7ZeNvaopi3QUOCdYvVOZkjBUzMus1KHk/Tc8hCAtnRDYZwvEuOEfUmBb31FrISKh
         yu9KsUXWzdyP1ddr0wkRvovWGKySQ/aZozNtyhamuyC/Cm/lfVYMsg/M1W+owPVhEOqy
         1ih9SoKXi035qmVHRcVbmaVhAInXSXIAntQMIvFVIxbaUxGWO1aWArNZg5+ruDwrVnXp
         f9zcyp2dNJh0hqRSuze+UuadfHkW926kPoz9qmXbYc/H9utLdBg7KYp4BeOYzMdHGYu9
         QrwA==
X-Gm-Message-State: AOJu0YwJW/sTpymG4uWFso4OjlPnWhObV/CS0e6h8xmXUj2xRi9JkQmB
	T59FuzAisoncWDkxEtmtuAu7w7s7MnOPKaXIH98=
X-Google-Smtp-Source: AGHT+IF3jSa2/clS/+JfUHL/kl4y4efKdPkk1TJ7WgT8zAfnE7tpWz1wECAW/EuY0dd4wt60f3e8BA==
X-Received: by 2002:adf:fe8c:0:b0:317:c2a9:9b0c with SMTP id l12-20020adffe8c000000b00317c2a99b0cmr8688278wrr.50.1694451164673;
        Mon, 11 Sep 2023 09:52:44 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	George Dunlap <george.dunlap@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Javi Merino <javi.merino@cloud.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 5/5] README: update to remove old note about the build system's python expectation
Date: Mon, 11 Sep 2023 17:51:04 +0100
Message-ID: <2b98d4409f0220c5b24517c5b230344228717eb8.1694450145.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694450145.git.javi.merino@cloud.com>
References: <cover.1694450145.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The configure script tests for the availability of python3, python and
python2 in that order and sets PYTHON to the first one found in path.
You don't need to have a symlink to python.

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
 README | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/README b/README
index f8cc426f78..6212a3a9c5 100644
--- a/README
+++ b/README
@@ -184,13 +184,6 @@ Various tools, such as pygrub, have the following runtime dependencies:
           URL:    https://www.python.org/
           Debian: python
 
-Note that the build system expects `python` to be available. If your system
-only has `python2` or `python3` but not `python` (as in Linux From Scratch),
-you will need to create a symlink for it, or specify PYTHON= when invoking
-make, like (note the position of PYTHON= matters):
-
-    # make PYTHON=/usr/bin/python3
-
 Intel(R) Trusted Execution Technology Support
 =============================================
 
-- 
2.41.0


