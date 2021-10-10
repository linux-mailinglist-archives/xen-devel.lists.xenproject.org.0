Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1465B4282EA
	for <lists+xen-devel@lfdr.de>; Sun, 10 Oct 2021 20:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205343.360613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZdOQ-000208-7n; Sun, 10 Oct 2021 18:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205343.360613; Sun, 10 Oct 2021 18:17:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZdOQ-0001x6-3Y; Sun, 10 Oct 2021 18:17:50 +0000
Received: by outflank-mailman (input) for mailman id 205343;
 Sun, 10 Oct 2021 18:17:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVSO=O6=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1mZdOO-0001x0-O8
 for xen-devel@lists.xenproject.org; Sun, 10 Oct 2021 18:17:48 +0000
Received: from mail-qv1-xf34.google.com (unknown [2607:f8b0:4864:20::f34])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81855371-7551-479d-a8ef-29d5c1246ae8;
 Sun, 10 Oct 2021 18:17:47 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id z3so9667004qvl.9
 for <xen-devel@lists.xenproject.org>; Sun, 10 Oct 2021 11:17:47 -0700 (PDT)
Received: from walnut.ice.pyrology.org (mobile-166-176-186-91.mycingular.net.
 [166.176.186.91])
 by smtp.gmail.com with ESMTPSA id r16sm692286qtt.22.2021.10.10.11.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 11:17:46 -0700 (PDT)
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
X-Inumbo-ID: 81855371-7551-479d-a8ef-29d5c1246ae8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OmZr8tAhhlb5VfxHgLq6UvIYtYcKLerkW54Z59ojch0=;
        b=Ju7vt6ah2CfOUUYohH87jQs5MAN7RG87UenCPFV43wUac+dv1eRvSd51ulNvvvS6ZD
         ogkOcPRXGtHXZoMyPfBHHvdC8rqsXe5xtyqv9V6kG3nEM7tbQxXHHcckvF1zMO6kGYhq
         ky4H4w2uhzpkIne/GfMHwEHJZgRAlU1MCPUAYVBweWJTUe38Qjr4uUS+vVpyiI38KA/8
         d2/ifC0KmSGX30/JYn0CeQKugFQALvdMGa0kAMuh7gW9PV35NdzETfB2hAG7ZrAy1/9E
         RsjUeKQr0NgtO/DhEzIZ7IqdA6HQ1V1AcLYHKmLvw0ufxv7PK8HbfnyqQQb8yGgeW0T+
         e90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OmZr8tAhhlb5VfxHgLq6UvIYtYcKLerkW54Z59ojch0=;
        b=ZX6QZLmhfejkB4u9unKqaS/DRaYiBzY7UQy+lAoue7aEnmO2tiUEwIDfo6SJ+vq5ck
         8I4A/7mo/11ePqlus83ndh6WMLFvWl3ykO/1YVvhRS6vxJXo2VsTAw8bsQwHhO+9XnEp
         Jm8JWN6R7KsHuVwAwIrebbhDhK52EXAvM9UM1qg5cJUyLC6w51qyvKU6PYWXJKCiIwMZ
         gMgBzskG7cMgfdpTQvU7YgFhVtbsL0qv2voRSsu+UM3ANXgiVqDiaoQMngpF/6QpVUKe
         DjUf5LsPEpRGOjxo7g8WGc0RqRsO3cTBDbjNHi0Qwp1cwOabqVBZT315ri0NbjwKLK7C
         aXpA==
X-Gm-Message-State: AOAM532bSP3LzIOs/v8MtniE9fd7CC5B0zGh1LUEA7E5LVb0E/VB1qbJ
	Hg+dXi2K4hsm738FbQEnVwgzKmumZaJ1WA==
X-Google-Smtp-Source: ABdhPJzamKDvnK5v3fBmA/vptcF7bH1lazP7LR7YTe9gZZwyr++VfkbJy1KsU2kFn9Qf4uLkz7MEJA==
X-Received: by 2002:ad4:4e0b:: with SMTP id dl11mr2009527qvb.23.1633889866844;
        Sun, 10 Oct 2021 11:17:46 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Rich Persaud <persaur@gmail.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Eric Chanudet <chanudeter@gmail.com>,
	openxt@googlegroups.com
Subject: [PATCH v2] docs: add references to Argo Linux driver sources and information
Date: Sun, 10 Oct 2021 11:17:35 -0700
Message-Id: <20211010181735.406406-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a section to the Argo design document to supply guidance on how to
enable Argo in Xen and where to obtain source code and documentation
for Argo device drivers for guest OSes, primarily from OpenXT.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---

Changes in v2: added R-by and fixed the two nits found in review:
 - removed an incorrect extra 'in'
 - refer to command line documentation rather than document

 docs/designs/argo.pandoc | 45 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/docs/designs/argo.pandoc b/docs/designs/argo.pandoc
index 2ce253b654..e18aacea7c 100644
--- a/docs/designs/argo.pandoc
+++ b/docs/designs/argo.pandoc
@@ -439,6 +439,51 @@ that teardown of any domain will not interfere with any Argo hypercall
 operation. It enables introducing granular locking without complex or
 error-prone lock acquisition logic.
 
+# Related Material
+
+## Enabling Argo in Xen
+
+To enable Argo in a build of the Xen hypervisor, please ensure that
+CONFIG_ARGO is enabled in the Xen hypervisor build configuration file.
+
+To make Argo available for use at runtime on a Xen system, please see the
+Argo settings in the Xen command line documentation.
+
+## Linux Argo drivers
+
+A Linux kernel device driver for Argo and corresponding Linux userspace
+software, libargo, that utilizes it for interdomain communication between
+application level software is available and maintained by the OpenXT Project,
+at:
+
+https://github.com/OpenXT/linux-xen-argo
+
+The repository contains the primary Linux kernel Argo driver, which is derived
+from the original XenClient v4v driver. The document at the following link
+describes planning and design notes from OpenXT community discussion for
+improvements to the driver:
+
+https://openxt.atlassian.net/wiki/spaces/DC/pages/775389197/New+Linux+Driver+for+Argo
+
+An alternative Linux Argo driver is also available in the same repository,
+implemented to explore a different approach for Linux to use the Argo
+primitives under the Vsock address family to allow socket communication between
+Xen domains.
+
+## v4v drivers
+
+A Windows driver for v4v has previously been used in XenClient and OpenXT
+which could be ported to Argo. It may require update for compatibility with
+recent versions of Windows software.
+
+https://github.com/OpenXT/xc-windows/tree/master/xenv4v
+
+The Linux, Windows and OSX guest tools for the Open Source HP uxen hypervisor
+contain drivers for v4v which are relevant as code bases of interest for
+porting or developing new guest OS drivers for Argo.
+
+https://github.com/uxen-virt/uxen/tree/ascara/vm-support
+
 # Future Work
 
 - Performance measurement and optimization
-- 
2.25.1


