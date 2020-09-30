Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7982827E90C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 14:58:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.669.2233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNbgE-0007OG-MY; Wed, 30 Sep 2020 12:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669.2233; Wed, 30 Sep 2020 12:57:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNbgE-0007Nr-JG; Wed, 30 Sep 2020 12:57:58 +0000
Received: by outflank-mailman (input) for mailman id 669;
 Wed, 30 Sep 2020 12:57:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZKji=DH=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kNbgD-0007Nm-Fu
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 12:57:57 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 379c0c68-614a-4749-9aac-6000abee7bc5;
 Wed, 30 Sep 2020 12:57:56 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ZKji=DH=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
	id 1kNbgD-0007Nm-Fu
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 12:57:57 +0000
X-Inumbo-ID: 379c0c68-614a-4749-9aac-6000abee7bc5
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 379c0c68-614a-4749-9aac-6000abee7bc5;
	Wed, 30 Sep 2020 12:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601470676;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2Z1pyMD7Vv/8RG4QYjvMkKMoCNTeNFyh7YXRNLqsoQ8=;
  b=RWulltq8kxYRXzZbsI9W3YTKmUtGV0DaS+isZq0+WDiRSHszNaSSdyMj
   Uad3Kh5ATfPhnOMEecX4giADxifj9JWfM6tuPpu9hkW4kmf05ygHBxHaK
   hpf3le0YgHBrkoqufsBHbLz1D7GkaQYjS+FfDFuZtzVT9l8J7l+tR/vDO
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: slDMfEAbdZyl2R7EzdPseH/lSV/jhHe5m0WqUMchq2naXYZxmQ88/8A2JteUF+gIpT2hWOxAMh
 hPCjNl4/0oAnOWVIiJgmZncqduNqXHvEapFMpdP8kPUtC6nK84jaObRn7Z/jilOieexH8A9/2l
 hUaFENlL9CxJgwBBJE3+uM/Rrd7lKa25DSirxKrmDNrzdXGJc6WcsPz7tSDPSoM/M3Q161y//P
 qdJgGw8w+JP11LN+2520sJQxyAa7fNBfZmZpGdmacoayBtEwqtMBMlFtYlO8bvxUsGZdmdm5g4
 n48=
X-SBRS: None
X-MesageID: 28971804
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="28971804"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<ian.jackson@citrix.com>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, "Rich
 Persaud" <persaur@gmail.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: [PATCH RFC] docs: Add minimum version depencency policy document
Date: Wed, 30 Sep 2020 13:57:36 +0100
Message-ID: <20200930125736.95203-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Define a specific criteria for how we determine what tools and
libraries to be compatible with.  This will clarify issues such as,
"Should we continue to support Python 2.4" moving forward.

Note that CentOS 7 is set to stop receiving "normal" maintenance
updates in "Q4 2020"; assuming that 4.15 is released after that, we
only need to support CentOS / RHEL 8.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---

CC: Ian Jackson <ian.jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Rich Persaud <persaur@gmail.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
---
 docs/index.rst                        |  2 +
 docs/policies/dependency-versions.rst | 76 +++++++++++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 docs/policies/dependency-versions.rst

diff --git a/docs/index.rst b/docs/index.rst
index b75487a05d..ac175eacc8 100644
--- a/docs/index.rst
+++ b/docs/index.rst
@@ -57,5 +57,7 @@ Miscellanea
 -----------
 
 .. toctree::
+   :maxdepth: 1
 
+   policies/dependency-versions
    glossary
diff --git a/docs/policies/dependency-versions.rst b/docs/policies/dependency-versions.rst
new file mode 100644
index 0000000000..d5eeb848d8
--- /dev/null
+++ b/docs/policies/dependency-versions.rst
@@ -0,0 +1,76 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Build and runtime dependencies
+==============================
+
+Xen depends on other programs and libraries to build and to run.
+Chosing a minimum version of these tools to support requires a careful
+balance: Supporting older versions of these tools or libraries means
+that Xen can compile on a wider variety of systems; but means that Xen
+cannot take advantage of features available in newer versions.
+Conversely, requiring newer versions means that Xen can take advantage
+of newer features, but cannot work on as wide a variety of systems.
+
+Specific dependencies and versions for a given Xen release will be
+listed in the toplevel README, and/or specified by the ``configure``
+system.  This document lays out the principles by which those versions
+should be chosen.
+
+The general principle is this:
+
+    Xen should build on currently-supported versions of major distros
+    when released.
+
+"Currently-supported" means whatever that distro's version of "full
+support".  For instance, at the time of writing, CentOS 7 and 8 are
+listed as being given "Full Updates", but CentOS 6 is listed as
+"Maintenance updates"; under this criterium, we would try to ensure
+that Xen could build on CentOS 7 and 8, but not on CentOS 6.
+
+Exceptions for specific distros or tools may be made when appropriate.
+
+One exception to this is compiler versions for the hypervisor.
+Support for new instructions, and in particular support for new safety
+features, may require a newer compiler than many distros support.
+These will be specified in the README.
+
+Distros we consider when deciding minimum versions
+--------------------------------------------------
+
+We currently aim to support Xen building and running on the following distributions:
+Debian_,
+Ubuntu_,
+OpenSUSE_,
+Arch Linux,
+SLES_,
+Yocto_,
+CentOS_,
+and RHEL_.
+
+.. _Debian: https://www.debian.org/releases/
+.. _Ubuntu: https://wiki.ubuntu.com/Releases
+.. _OpenSUSE: https://en.opensuse.org/Lifetime
+.. _SLES: https://www.suse.com/lifecycle/
+.. _Yocto: https://wiki.yoctoproject.org/wiki/Releases
+.. _CentOS: https://wiki.centos.org/About/Product
+.. _RHEL: https://access.redhat.com/support/policy/updates/errata
+
+Specific distro versions supported in this release
+--------------------------------------------------
+
+======== ==================
+Distro   Supported releases
+======== ==================
+Debian   10 (Buster)
+Ubuntu   20.10 (Groovy Gorilla), 20.04 (Focal Fossa), 18.04 (Bionic Beaver), 16.04 (Xenial Xerus)
+OpenSUSE Leap 15.2
+SLES     SLES 11, 12, 15
+Yocto    3.1 (Dunfell)
+CentOS   8
+RHEL     8
+======== ==================
+
+.. note::
+
+   We also support Arch Linux, but as it's a rolling distribution, the
+   concept of "security supported releases" doesn't really apply.
-- 
2.25.1


