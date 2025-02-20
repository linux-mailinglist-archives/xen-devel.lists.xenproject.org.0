Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AA0A3E7DA
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 23:57:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894194.1302981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlFT1-0006TX-VR; Thu, 20 Feb 2025 22:56:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894194.1302981; Thu, 20 Feb 2025 22:56:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlFT1-0006Ri-Sj; Thu, 20 Feb 2025 22:56:27 +0000
Received: by outflank-mailman (input) for mailman id 894194;
 Thu, 20 Feb 2025 22:56:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/j1Y=VL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tlFSz-0006Rc-VN
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 22:56:25 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04::f03c:95ff:fe5e:7468])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e81935aa-efdd-11ef-9aa9-95dc52dad729;
 Thu, 20 Feb 2025 23:56:24 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F1C4868346;
 Thu, 20 Feb 2025 22:56:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC81BC4CED1;
 Thu, 20 Feb 2025 22:56:21 +0000 (UTC)
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
X-Inumbo-ID: e81935aa-efdd-11ef-9aa9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740092182;
	bh=+/wSeYkp0nLW+KL6XOZV1yOIEAfXYyczylaLKqXFa8M=;
	h=Date:From:To:cc:Subject:From;
	b=JS2jEowGo4h8K5GV7f8Y/QuloeN0JYegIH2EygegKrAaQk91zjwM/K2hdNf3+cbsW
	 Ng9lOSQCPtbC908b78OZjwbi3IZmUQpjnPB7jbmlLyKtsw7JqQqf+296HRqP6p1+IH
	 8uvlKYuTyOhK+Z3jo7eRqz7HpQsYPmp1XmBDnSHiD+WqdcKT4mbtGMMHb6LnodfeMs
	 H3FCaGYFBadCG0YwdZ1mmbPlhCllze9oCF+uegxiqc0JF6rIvQmp1mEfSSc8m9TE6F
	 ACgVazrFrJif7XWcmdSRJTS2qp8Plaq+8ORGm2KSGjICv3HjDtBf84GHsCkf7KqCZ/
	 LJWegBvTt6BwQ==
Date: Thu, 20 Feb 2025 14:56:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Doug Goldstein <cardoe@cardoe.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] automation: upgrade arm32 kernel from bullseye to bookworm
Message-ID: <alpine.DEB.2.22.394.2502201453560.1791669@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

automation: upgrade arm32 kernel from bullseye to bookworm

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
index 41f6e5d8e6..0c94e662aa 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -11,7 +11,7 @@ serial_log="$(pwd)/smoke.serial"
 
 cd binaries
 # Use the kernel from Debian
-curl --fail --silent --show-error --location --output vmlinuz https://deb.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
+curl --fail --silent --show-error --location --output vmlinuz https://deb.debian.org/debian/dists/bookworm/main/installer-armhf/current/images/netboot/vmlinuz
 # Use a tiny initrd based on busybox from Alpine Linux
 curl --fail --silent --show-error --location --output initrd.tar.gz https://dl-cdn.alpinelinux.org/alpine/v3.15/releases/armhf/alpine-minirootfs-3.15.1-armhf.tar.gz
 

