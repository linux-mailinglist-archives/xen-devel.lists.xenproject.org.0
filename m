Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FDE1E3234
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 00:17:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdhsd-00084P-7t; Tue, 26 May 2020 22:17:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=52a6=7I=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jdhsb-00083n-J8
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 22:17:01 +0000
X-Inumbo-ID: 94daf39a-9f9e-11ea-a6c3-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94daf39a-9f9e-11ea-a6c3-12813bfff9fa;
 Tue, 26 May 2020 22:16:44 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: cu8UWhvEil7kDZD8zHi5/jSJQD0btiknIDvUtyRoaZOu5JTNQNJuhxwRU8GYWVJ9i698NuCL1I
 Mgu4pRtHmAIP88qZMM0ZJK63RxGG+g1CyXeVQHDQm9rEtnoXG5GKUIp40KJo0oXLZoehC86n6J
 h7gEWVSr34fKFia57eCXrCS4DF5r2PaqtwfikLD59jz9b6j3m4FcBMmfvRh+4OYuJOkip8HMNW
 KAwL/l2LPuXJ+G8kGyah9iXkbYsKo4Ce2h8M5TUg11rYR0O+jvIfzZa2TL1SETYvXyYjc0IAIa
 2W4=
X-SBRS: 2.7
X-MesageID: 18520581
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,439,1583211600"; d="scan'208";a="18520581"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 4/5] automation: Add golang packages to various dockerfiles
Date: Tue, 26 May 2020 23:16:11 +0100
Message-ID: <20200526221612.900922-5-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200526221612.900922-1-george.dunlap@citrix.com>
References: <20200526221612.900922-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Doug
 Goldstein <cardoe@cardoe.com>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Specifically, Fedora 29, Archlinux, and Debian unstable.  This will
cause the CI loop to detect golang build failures.

CentOS 6 and 7 don't have golang packages, and the packages in
stretch, jessie, xenial, and trusty are too old.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
v2:
- New

CC: Wei Liu <wl@xen.org>
CC: Doug Goldstein <cardoe@cardoe.com>
---
 automation/build/archlinux/current.dockerfile | 1 +
 automation/build/debian/unstable.dockerfile   | 1 +
 automation/build/fedora/29.dockerfile         | 1 +
 3 files changed, 3 insertions(+)

diff --git a/automation/build/archlinux/current.dockerfile b/automation/build/archlinux/current.dockerfile
index 5095de65b8..d8fbebaf79 100644
--- a/automation/build/archlinux/current.dockerfile
+++ b/automation/build/archlinux/current.dockerfile
@@ -16,6 +16,7 @@ RUN pacman -S --refresh --sysupgrade --noconfirm --noprogressbar --needed \
         ghostscript \
         git \
         gnutls \
+        go \
         iasl \
         inetutils \
         iproute \
diff --git a/automation/build/debian/unstable.dockerfile b/automation/build/debian/unstable.dockerfile
index d0aa5ad2bb..aeb4f3448b 100644
--- a/automation/build/debian/unstable.dockerfile
+++ b/automation/build/debian/unstable.dockerfile
@@ -45,6 +45,7 @@ RUN apt-get update && \
         nasm \
         gnupg \
         apt-transport-https \
+        golang \
         && \
         apt-get autoremove -y && \
         apt-get clean && \
diff --git a/automation/build/fedora/29.dockerfile b/automation/build/fedora/29.dockerfile
index 5be4a9e229..6a4e5b0413 100644
--- a/automation/build/fedora/29.dockerfile
+++ b/automation/build/fedora/29.dockerfile
@@ -40,5 +40,6 @@ RUN dnf -y install \
         nasm \
         ocaml \
         ocaml-findlib \
+        golang \
     && dnf clean all && \
     rm -rf /var/cache/dnf
-- 
2.25.1


