Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7875F2F1CB8
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:43:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65103.115229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1DB-0002bG-7e; Mon, 11 Jan 2021 17:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65103.115229; Mon, 11 Jan 2021 17:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1DB-0002ag-3T; Mon, 11 Jan 2021 17:42:37 +0000
Received: by outflank-mailman (input) for mailman id 65103;
 Mon, 11 Jan 2021 17:42:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1D9-0002aB-Sx
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:42:35 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.84])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3f9a1dc-bf43-402b-a2c2-b8ffc9fd3c48;
 Mon, 11 Jan 2021 17:42:34 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgTM3K
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:29 +0100 (CET)
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
X-Inumbo-ID: a3f9a1dc-bf43-402b-a2c2-b8ffc9fd3c48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386953;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=4DYp51Vc9ztkdEHMvY1HqDsmG8RHkVlIlHFvANw7/Sw=;
	b=W63+KYv3fQgdRWGN1Q9R3yNRpAuAEVQSsDY2B4EaVIcOZQCKBJYZSlddepDiFtE1Vg
	Rcwqh1xE+8W92jZMfjBB5d0l5EAKB2xqKdG+ZO7zDgm7hoxRCA+n1mtei0Mgla53OYzQ
	WjKE3dumX4Mx32UKuvmYQoQYu10jfyG3CByLO/tX/+T+yGYyB6etMxOwU4CGDnd5/m2U
	3/xqJQiqV3noCdJFU65tw3WqttRVDs49kcKFD5zT6+hW3HxGb67d8GmMdRpfJCqrm4jX
	qvt3vuipg3kgOs1+1BizoTVxa0mTQo0dBhpGLT/NvqV0+lCxK/abs/r0Lhd/vcjKUupN
	Mw1Q==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210111 05/39] tools: add with-xen-scriptdir configure option
Date: Mon, 11 Jan 2021 18:41:50 +0100
Message-Id: <20210111174224.24714-6-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the near future all fresh installations will have an empty /etc.
The content of this directory will not be controlled by the package
manager anymore. One of the reasons for this move is to make snapshots
more robust.

As a first step into this direction, add a knob to configure to allow
storing the hotplug scripts to libexec because they are not exactly
configuration. The current default is unchanged, which is
/etc/xen/scripts.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 m4/paths.m4 | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/m4/paths.m4 b/m4/paths.m4
index 89d3bb8312..0cec2bb190 100644
--- a/m4/paths.m4
+++ b/m4/paths.m4
@@ -70,6 +70,12 @@ AC_ARG_WITH([libexec-leaf-dir],
     [libexec_subdir=$withval],
     [libexec_subdir=$PACKAGE_TARNAME])
 
+AC_ARG_WITH([xen-scriptdir],
+    AS_HELP_STRING([--with-xen-scriptdir=DIR],
+    [Path to directory for dom0 hotplug scripts. [SYSCONFDIR/xen/scripts]]),
+    [xen_scriptdir_path=$withval],
+    [xen_scriptdir_path=$sysconfdir/xen/scripts])
+
 AC_ARG_WITH([xen-dumpdir],
     AS_HELP_STRING([--with-xen-dumpdir=DIR],
     [Path to directory for domU crash dumps. [LOCALSTATEDIR/lib/xen/dump]]),
@@ -137,7 +143,7 @@ AC_SUBST(INITD_DIR)
 XEN_CONFIG_DIR=$CONFIG_DIR/xen
 AC_SUBST(XEN_CONFIG_DIR)
 
-XEN_SCRIPT_DIR=$XEN_CONFIG_DIR/scripts
+XEN_SCRIPT_DIR=$xen_scriptdir_path
 AC_SUBST(XEN_SCRIPT_DIR)
 
 case "$host_os" in

