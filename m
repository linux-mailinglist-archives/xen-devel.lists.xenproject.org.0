Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7A4426395
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 06:13:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204319.359452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYhFt-00068S-2M; Fri, 08 Oct 2021 04:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204319.359452; Fri, 08 Oct 2021 04:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYhFs-000667-Uc; Fri, 08 Oct 2021 04:13:08 +0000
Received: by outflank-mailman (input) for mailman id 204319;
 Fri, 08 Oct 2021 04:13:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aW5g=O4=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1mYhFr-000661-Jc
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 04:13:07 +0000
Received: from mail-qk1-x729.google.com (unknown [2607:f8b0:4864:20::729])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93aba899-0bd5-4b70-8847-6d0490c11ff3;
 Fri, 08 Oct 2021 04:13:06 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id z40so6855093qko.7
 for <xen-devel@lists.xenproject.org>; Thu, 07 Oct 2021 21:13:06 -0700 (PDT)
Received: from walnut.ice.pyrology.org (mobile-166-176-184-109.mycingular.net.
 [166.176.184.109])
 by smtp.gmail.com with ESMTPSA id c76sm1167189qke.83.2021.10.07.21.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 21:13:05 -0700 (PDT)
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
X-Inumbo-ID: 93aba899-0bd5-4b70-8847-6d0490c11ff3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LtUo9sTo1YMnKekRV5cR43FFb2t/tyjbt+ypinT/AEg=;
        b=pfZXH4bGNQmJMUVBq+gFkS1ggD0yliL4hK6qLPNL/3OgUH8KcEyqzyjVRn39ZNctKv
         fTOwOJTcYN177yn7/+5Jecxs/0hhsEOjjNTIgWoBk/CIIBSOXk1Ax27Hf3GsWra7K0Up
         xDR5a1xwVFxl4o2crdVvimIfz/a89cEwgvm0KO7GFjJOjAtUGnE3g74kAYABkZGVTKcU
         H7NWGfKwxmTz6x8LUbT5FsgH5QYmIButVwYAS4wEL8PWy/qtiuX9uBqHMDf7QPt+glqP
         C4VpIHasRfaNPL1WHWzwhgGvtoe7tADFatyr2Z6SV+/fU6LoqUJnd968As8wIWGrS9RM
         /WvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LtUo9sTo1YMnKekRV5cR43FFb2t/tyjbt+ypinT/AEg=;
        b=tAwwkFdKJEs9w/q3l9a/vUmPG545JRmIElYeThZfnSDxotSHtBQwWsOU/aQX7QDx56
         oxMtiESgw5aSoPj4LcnpTSo+l45AriGubrM8h6MnNl6zhUN0XFaKsSHUEW2vkqTMXLVV
         Ingh/TSERjFNGD+lh3gtpTzptWpIEwPRU3JRPen4tou9wcs4qYB1+7vP4iCBdlmI6AGK
         xmqgqKhzhyPnrgu6pJi4PoPzw+o4K4d5QtvjTGc7K6aXocowMFrrV4s+T9PnvTJMHE+H
         cGD4NevAXNNCgcGj2liHwdL+NZ5Gziy6xTz56fYN/OIllbBvsg3VmEETk1uLjLwyCST3
         fMtA==
X-Gm-Message-State: AOAM533KMXWBfwwn9PubWo7QVs9M7zTSflIxr9FtGuQGZ7TtVf3rhQ4K
	FIKjQDnGoIkSZbL6nh+GTlGiAyLS50TQug==
X-Google-Smtp-Source: ABdhPJxOjATEY73JNlODHT98Df7cljPMZBUgJLILAvKA6BUO2HQRsSay1RcC/xRP+WIxGM6r+d5b6w==
X-Received: by 2002:a37:45c8:: with SMTP id s191mr1038033qka.355.1633666386158;
        Thu, 07 Oct 2021 21:13:06 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
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
Subject: [PATCH] docs: add references to Argo Linux driver sources and information
Date: Thu,  7 Oct 2021 21:12:41 -0700
Message-Id: <20211008041241.227823-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a section to the Argo design document to supply guidance on how to
enable Argo in Xen and where to obtain source code and documentation
for Argo device drivers for guest OSes, primarily from OpenXT.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 docs/designs/argo.pandoc | 45 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/docs/designs/argo.pandoc b/docs/designs/argo.pandoc
index 2ce253b654..74c8ae4ac7 100644
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
+Argo settings in the Xen command line document.
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
+An alternative Linux Argo driver is in also available in the same repository,
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


