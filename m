Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A379C54058
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 19:55:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160445.1488582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJFyr-000149-9N; Wed, 12 Nov 2025 18:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160445.1488582; Wed, 12 Nov 2025 18:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJFyr-00011J-6i; Wed, 12 Nov 2025 18:54:09 +0000
Received: by outflank-mailman (input) for mailman id 1160445;
 Wed, 12 Nov 2025 18:54:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R8Yv=5U=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vJFyp-00011D-VJ
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 18:54:08 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6e754d3-bff8-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 19:54:06 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso137705e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 10:54:06 -0800 (PST)
Received: from localhost.localdomain (host-78-149-11-196.as13285.net.
 [78.149.11.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e3a63asm50059175e9.1.2025.11.12.10.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 10:54:04 -0800 (PST)
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
X-Inumbo-ID: f6e754d3-bff8-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1762973646; x=1763578446; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5k8Z21gLVTYm6B0Dso+ikwMCEQe44y5PQXbxI2nGMZ8=;
        b=HojHs3gGCLKeByheAJ4MhydMIb7RzEs+0cHTiznDIAG602Hd10Gxzfhx26Z/LBAjeS
         S1d3ihd7kbugTqEuSulJxxYp9IuUWNWb0I4EW/A3qlD6Rc3+0GoieV83LidBN2mk+6Do
         hr6/WncLvL9SlgVT5tL8MyT2vmkVv+IQYRsAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762973646; x=1763578446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5k8Z21gLVTYm6B0Dso+ikwMCEQe44y5PQXbxI2nGMZ8=;
        b=P4SAckpWg/cRWhO9MuNv5uA97J/i7YOfDvsGQ+A5pC1lWKsTZ4aBoMebZkc4+cTuNj
         h2P9pHnl2d0mdPRJ48+MMblcj7kpWwfkDPQhFbx4Fy267EGX9zCicfNURDJ+FFJbcCo5
         5yz43JV3Zk3cVsIp6L5bwJrgkhnjsDEw7VWFiki4Z2q2QgJ9XVsfQDZst8R7clxfRG9r
         PFTUuNgJfBbzN1HlTTI99oPrvYd9sUWBvNP4FyLiaaNfPqD7uDWlN0g7sEsDFCxI8ps8
         gRNRB/PfupmvDCRE7vgUWWEzl8mxrF25ZWWEBhAtXm/cNYB2oyIap9L6D29EgcgO1v1V
         tuLg==
X-Gm-Message-State: AOJu0Yx/AbpjZY/VDA9BKzbSr/yIDj9etSlQAdF6qOwa5KqpIN5eRpns
	EhtVOSQC4sXVo4TlZd3HcD17bYgHtaPU5c8lmmBFPF2IjffJRYxYWEthRNeirv0OmXRfa+2+7c6
	vetjN1Ok=
X-Gm-Gg: ASbGncvZdu4Ig8DahXYgfzZtMTiIgD1HqYMzh9b8txIWXugMqddTPcQ9DfUjI9gvLc9
	RGvPj/IS17aQfyHmCWu0vDLvWmYMA4Lpgpag5Nn9CCu3Yl7u8KtkpPsINrIsWh4idW5d8ARo2/0
	208H8YeS8u4EjlJNT6VU0D2TuMD+WFdEZu2mXbizwFMB6ymoMRNa1EUjm11Y2r5427V2t76NXTf
	+9atLex9Cv8npAbRtl4t77UivV7p0U9D+kRjcs5fjkfTW7dBdCjoXWEUCtgN5BywfxoatGkMd0v
	b33FkVYQ+IFOjGZSoXnq19i2jv3obvpX+u7CdQpZyzTeSFSfORfE0SFCNngP836llPgyzoyYkSV
	HKv6QWpN+oF2R7ZVawJq/n2RS9GlJ3nE6uIOSPwQOJtdRE6Ji11re/lnTgH+SWYrDGaIDXTLIM7
	oQn2wnxjYxBA/M7mRMeFHu8GlooPmL0NS6C7JNzakAg9qiG9cAX8s=
X-Google-Smtp-Source: AGHT+IFElUgNsYU/vgmDo87ZKRZvl5iBZKGXHPA7SDIMCOuW10l69/+cwQSxoZZuMwEmL2rTILPuNg==
X-Received: by 2002:a05:600c:154d:b0:477:4f97:cb31 with SMTP id 5b1f17b1804b1-4778bd2c40emr3920195e9.2.1762973645252;
        Wed, 12 Nov 2025 10:54:05 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] docs: Rewrite the Tagging and Branching checklist
Date: Wed, 12 Nov 2025 18:54:02 +0000
Message-Id: <20251112185402.209485-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There's a lot of stale information in the current checklists.  Merge the
documents and present the information in chronological order.  Provide real
examples from the tree rather than trying to be too prescriptive.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

A rendered version can be found here:

  https://andrewcoop-xen.readthedocs.io/en/docs-branching/process/tagging-branching.html

As I'm about to do the 4.21 release, I'm tempted to defer this patch until
after I've done so, so all the examples can be consistently 4.21.

I wanted to replace CVS with something more modern, but Git really sucks with
binary files and this repo in particular.  (For anyone interested, the VM is
so small that the Git server process OOM's when you try to clone it.)

This is (AFAICT) an accurate statement of what gets done.  It highlights some
inconsistences with how we branch and tag other trees, particularly QEMU which
is now the only tree that moves back to being master.
---
 docs/index.rst                                |   9 +
 docs/process/branching-checklist.txt          |  91 --------
 docs/process/index.rst                        |   9 +
 docs/process/release-technician-checklist.txt | 174 ----------------
 docs/process/tagging-branching.rst            | 194 ++++++++++++++++++
 5 files changed, 212 insertions(+), 265 deletions(-)
 delete mode 100644 docs/process/branching-checklist.txt
 create mode 100644 docs/process/index.rst
 delete mode 100644 docs/process/release-technician-checklist.txt
 create mode 100644 docs/process/tagging-branching.rst

diff --git a/docs/index.rst b/docs/index.rst
index bd87d736b9c3..3513d4b609d8 100644
--- a/docs/index.rst
+++ b/docs/index.rst
@@ -54,6 +54,15 @@ kind of development environment.
    misc/ci
 
 
+Process documentation
+---------------------
+
+.. toctree::
+   :maxdepth: 2
+
+   process/index
+
+
 Unsorted documents
 ------------------
 
diff --git a/docs/process/branching-checklist.txt b/docs/process/branching-checklist.txt
deleted file mode 100644
index 9632888a56e2..000000000000
--- a/docs/process/branching-checklist.txt
+++ /dev/null
@@ -1,91 +0,0 @@
-=== Before starting ===
-
-Access to the following accounts is necessary:
-    * xenbits.xen.org: xen, xendocs
-    * osstest.osstest-test-lab: osstest
-
-=== Check list ===
-
-v=4.1
-ov=4.0
-
-# make branches in xenbits.xen.org qemus
-    ssh xen@xenbits.xen.org
-    cd ~/git/qemu-xen.git
-    git branch staging-$v staging
-    git branch stable-$v master
-
-# make branch in libvirt
-    ssh xen@xenbits.xen.org
-    cd ~/git/libvirt.git/
-    git branch osstest/frozen/xen-$v-testing   xen-tested-master
-
-# make branches in xenbits.xen.org xen.git
-    ssh xen@xenbits.xen.org
-    cd ~/git/xen.git
-    git branch staging-$v staging
-    git branch stable-$v master
-
-# update xendocs@xenbits docs generator to generate new stable branch
-#  docs too. commit to git.
-* make 13:37 <ijc> https://xenbits.xen.org/docs/4.2-testing/ is now live true
-#14:17 <ijc> HOWTO: login to xenbits. become "xendocs" . cd cronjobs . edit
-#            xenbits-docs-all.sh in the obvious way. git commit
-    ssh xendocs@xenbits.xen.org
-    cd cronjobs
-    ed xenbits-docs-all.sh
-    /for branch
-    s/$/ 4.6-testing
-    # ^ OR SIMILAR
-    w
-    q
-    git add -p
-    git commit -m "Branch for $v"
-
-* make branches etc. in osstest
-    ssh osstest@osstest.test-lab
-    cd testing.git
-    OSSTEST_CONFIG=production-config ./mg-branch-setup xen-$v-testing bisect
-    OSSTEST_CONFIG=production-config ./mg-branch-setup qemu-upstream-$v-testing bisect
-
-* add branch to osstest
-    Add both qemu-upstream-$v-testing and xen-$v-testing to BRANCHES in cr-for-branches
-    git add -p
-    git commit -m "cr-for-branches: Add Xen and QEMU $v branch"
-
-* add to patchbot
-    ssh xen@xenbits.xen.org
-    cd ~/HG/patchbot/
-
-    cp xen--master.patchbot-reported-heads xen--stable-$v.patchbot-reported-heads
-    cp xen--staging.patchbot-reported-heads xen--staging-$v.patchbot-reported-heads
-    cp qemu-xen--master.patchbot-reported-heads  qemu-xen--stable-$v.patchbot-reported-heads
-    cp qemu-xen--staging.patchbot-reported-heads  qemu-xen--staging-$v.patchbot-reported-heads
-
-    #emacs versions
-    perl -i~ -pe 'next unless m/\b\Q'$ov'\E\b/; $x=$_; $x=~ s/\b\Q'$ov'\E\b/'$v'/g; print $x;' versions
-    git diff
-    git add versions
-    git commit -m "Branch for $v"
-
-Ensure references to qemu trees and Mini-OS in xen.git's Config.mk are updated.
-The variables and there content should be:
-  * QEMU_UPSTREAM_REVISION: qemu-xen-X.Y.0
-  * MINIOS_UPSTREAM_REVISION: xen-RELEASE-X.Y.0
-Where X.Y is the release version (e.g. 4.17).
-
-Update newly diverging staging (unstable) according to
-release-technician-checklist.txt section re README etc.
-
-Update newly diverging staging-$v according to
-release-technician-checklist.txt section re README etc.,
-including turning off debug.
-
-Set off a manual osstest run, since the osstest cr-for-branches change
-will take a while to take effect:
-    ssh osstest@osstest.test-lab
-    cd testing.git
-    screen -S $v
-    BRANCHES=xen-$v-testing ./cr-for-branches branches -w "./cr-daily-branch --real"
-
-Send message to committers and RM.  Use previous mail as a template.
diff --git a/docs/process/index.rst b/docs/process/index.rst
new file mode 100644
index 000000000000..d83d6ba9271d
--- /dev/null
+++ b/docs/process/index.rst
@@ -0,0 +1,9 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Process documentation
+=====================
+
+.. toctree::
+   :maxdepth: 2
+
+   tagging-branching
diff --git a/docs/process/release-technician-checklist.txt b/docs/process/release-technician-checklist.txt
deleted file mode 100644
index ae369c6dc5de..000000000000
--- a/docs/process/release-technician-checklist.txt
+++ /dev/null
@@ -1,174 +0,0 @@
-
-s=master
-#b=unstable
-v=$v-rc1
-
-OR
-
-x=4.1
-m=1
-rc=-rc2
-
-r=$x.$m
-s=$x-testing
-#b=$x-testing
-v=$r$rc
-
-t=$r$rc
-OR
-t=RELEASE-$r
-
-
-# FIRSTLY
-#  - check (for point releases, but not RCs) all XSAs have been applied (Lars)
-#
-* check, even for point releases
-*  http://logs.test-lab.xenproject.org/osstest/results/all-branch-statuses.txt
-
-
-# QEMU
-
-  git checkout $s
-  git show # should show appropriate intended commit
-  git-tag -u 'Xen.org Xen tree code signing' -m "Xen $v" xen-$v
-
-# consider making tag in minios, and updating xen.git Config.mk
-  git checkout SOMETHING
-  git show # should show appropriate intended commit
-  git-tag -u 'xen tree' -s -m "Xen $r$rc" xen-$t
-  git push xen@xenbits.xen.org:/home/xen/git/mini-os.git xen-$t
-
-* Also tag upstream qemu tree (Stefano)
-  git checkout SOMETHING
-  git show # should show appropriate intended commit
-  git tag -u 'xen tree' -s -m "Xen $r$rc" qemu-xen-$v 
-  git push osstest@xenbits.xen.org:/home/xen/git/qemu-xen.git qemu-xen-$v
-
-* consider bumping sonames of shlibs
-
-* change xen-unstable README. The banner (generated using figlet) should say:
-    - "Xen 4.5" in releases and on stable branches
-    - "Xen 4.5-unstable" on unstable
-    - "Xen 4.5-rc" for release candidate
-
-* for major releases, drop staging-only text from MAINTAINERS and add stable
-  maintainer(s) there
-
-* change xen-unstable Config.mk
-#   QEMU_UPSTREAM_REVISION,
-#   MINIOS_UPSTREAM_REVISION
-#     (drop any references to the specific commits, e.g. date or title)
-* change SUPPORT.md heading version number; -unstable or -rc tag
-*     (empty in stable branches after .0 release).
-* SUPPORT.md: insert correct version number in release-notes link
-* CHANGELOG.md: set section heading to delete UNRELEASED and add date;
-#               in unstable branches set to X.Y.0 and RELEASE-X.YY.0
-* change xen-unstable xen/Makefile XEN_EXTRAVERSION
-# if main version number has changed (eg 4.7 -> 4.8) rerun ./autogen.sh
-* rerun ./autogen.sh to update version number in configure
-#    - XEN_EXTRAVERSION should be as follows
-#      `.0-rc$(XEN_VENDORVERSION)'       during freeze, first rc onwards (including staging, before branching)
-#      `-unstable$(XEN_VENDORVERSION)'   unstable aka unfrozen staging (or unstable branch, after branching)
-#      `.0$(XEN_VENDORVERSION)'          actual release of Xen X.Y.0 (aka first actual release of Xen X.Y)
-#      `.Z$(XEN_VENDORVERSION)'          actual release of Xen X.Y.Z (stable point realase)
-#      `.Z-pre$(XEN_VENDORVERSION)'      stable branch, after release of Z-1
-#
-#    - turn off debug on stable branches, if not already done
-#           - tools/Rules.mk
-#                 debug ?= n
-#           - xen/Kconfig.debug
-#                 config DEBUG
-#                     default n
-
-* tag xen-unstable
-
-# In xen.git
-  git-fetch origin
-  git-checkout staging-$x
-  git-pull
-  git-show # should show commit updating version to right version
-  git-tag -u 'xen tree' -s -m "Xen $r$rc" $t
-  git-push origin $t
-  git-push origin staging-$x
-##  hg tag <tag_name> ; hg sign -k "Xen tree" <tag_name>
-
-
-
-HANDLING TAG GENERATED BY RELEASE MANAGER
-
-   fetch the tag into my tree
-   make the tarball (RELEASE TARBALL, below)
-   test build (see below)
-   website (see below)
-   merge tag into staging and push to staging
-   maybe force push into master
-   definitely push tag to xenbits
-        git-push origin $t
-
-
-
-
-RELEASE TARBALL
-
-   for 4.5 and later, use tarball target
-       git checkout $t
-       git clean -xdff
-       # export http_proxy=http://localhost:3128/
-       ./configure
-       make src-tarball-release   # must be used for actual releases
-       make src-tarball           # uses git-describe (best for RCs)
-        # ^find some way to add git-cache-proxy to this (done in ~iwj/.gitconfig)
-       mkdir /volatile/iwj/website-thing/xen.org/oss-xen/release/$v
-       mv dist/xen-$v.tar.[glx]z /volatile/iwj/website-thing/xen.org/oss-xen/release/$v/.
-
-       # website-thing/xen.org is cvs -d mail.xenproject.org:/home/downloads-cvs/cvs-repos co xen.org
-	cd /volatile/iwj/website-thing/xen.org
-
-# test build
-                cd /volatile/iwj/d
-                mkdir build
-                cd build
-                tar zxf /volatile/iwj/website-thing/xen.org/oss-xen/release/$v/xen-$v.tar.gz
-#                rsync -a --delete xen-$v build/
-                cd xen-$v
-                export http_proxy=http://localhost:3128/
-                (./configure && make -j4 KERNELS='' && echo ok.) 2>&1 | tee ../log.$v       # post 4.2
-
-# [[ test build amd64 ]]
-
-	cvs add -kb oss-xen/release/$v/
-
-        cd oss-xen/release/$v
-        for t in xen-$v.tar.[glx]z
-        do
-            gpg --digest-algo=SHA256 --detach-sign -u 'xen tree' $t
-            cvs add -kb $t
-            cvs add -kb $t.sig
-        done
-        cd ../../..
-
-	cvs ci -m $v
-
-        ssh downloads-cvs@mail.xenproject.org
-	cd /data/downloads.xenproject.org/xen.org
-	cvs -q up -d
-	# should show something like
-	#   U oss-xen/release/4.8.0-rc2/xen-4.8.0-rc2.tar.gz
-	#   U oss-xen/release/4.8.0-rc2/xen-4.8.0-rc2.tar.gz.sig
-	#   U oss-xen/release/4.8.0-rc2/xen-4.8.0-rc2.tar.lz
-	#   U oss-xen/release/4.8.0-rc2/xen-4.8.0-rc2.tar.lz.sig
-	#   U oss-xen/release/4.8.0-rc2/xen-4.8.0-rc2.tar.xz
-	#   U oss-xen/release/4.8.0-rc2/xen-4.8.0-rc2.tar.xz.sig
-
-After a .0 release, update XEN_EXTRAVERSION again (to .1-pre, see above).
-
-After a .0 release,
-Update new stable tree's MAINTAINERS to contain correct info for this
-stable branch: usually, copy text from previous
-staging-$ov:MAINTAINERS section "Stable Release Maintenance"
-into new staging-$v, deleting what's there.
-  git cat-file blob origin/staging-$ov:MAINTAINERS >MAINTAINERS
-and review the changes, commiting ONLY THE RELEVANT ONES
-
-Notify release manager of completion
-
diff --git a/docs/process/tagging-branching.rst b/docs/process/tagging-branching.rst
new file mode 100644
index 000000000000..b39dd2c248a1
--- /dev/null
+++ b/docs/process/tagging-branching.rst
@@ -0,0 +1,194 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+===============================
+Tagging and Branching Checklist
+===============================
+
+Before starting
+===============
+
+ * Review this checklist for changes during the development window.
+ * Access to the following necessary:
+
+   * The 'xen tree' signing key.
+   * The xen and xendocs users on xenbits.xen.org
+   * The downloads-cvs user on mail.xenproject.org
+   * A checkout of the xen.org CVS repository
+
+::
+
+  cvs -d downloads-cvs@mail.xenproject.org:/home/downloads-cvs/cvs-repos checkout xen.org
+
+
+For RC1
+=======
+
+ * Pin ``QEMU_UPSTREAM_REVISION`` to an exact SHA.  Commit.
+
+ * Update ``XEN_EXTRAVERSION`` from ``-unstable`` to ``.0-rc1``.  For
+   ``README`` and ``SUPPORT.md``, use the slightly more generic ``-rc`` so
+   they doesn't need to change during subsequent RCs.  Commit.
+
+ * Tag.  Produce tarballs.
+
+e.g. from Xen 4.21, ``ffd25d717a74^..d1478321eacb``::
+
+  * d1478321eacb - (tag: 4.21.0-rc1) Update Xen version to 4.21.0-rc1
+  * ffd25d717a74 - Config.mk: Pin QEMU_UPSTREAM_REVISION
+
+
+For subsequent RCs
+==================
+
+ * Update ``XEN_EXTRAVERSION`` to the next RC number.  Commit.  Tag.
+
+e.g. from Xen 4.21, ``eff32008be0d`` and ``9632ce6fe5b2``::
+
+  * 9632ce6fe5b2 - (tag: 4.21.0-rc3) Update Xen version to 4.21.0-rc3
+  * eff32008be0d - (tag: 4.21.0-rc2) Update Xen version to 4.21.0-rc2
+
+
+Branching
+=========
+
+On xenbits:
+
+ * Create new staging and stable branches in xen.git.
+
+ * Add the new branches to patchbot.  In ``~xen/HG/patchbot`` copy the exsting
+   master and staging reported heads, update the ``versions`` file, and commit
+   the result.
+
+ * Add the new stable branch to the docs cronjob.  In ``~xendocs/cronjobs``
+   edit ``xenbits-docs-all.sh`` and commit the result.  e.g.:
+
+::
+
+  ssh xenbits.xen.org
+
+  cd ~xen/git/xen.git
+  git branch staging-$v staging
+  git branch stable-$v master
+
+  cd ~xen/HG/patchbot
+  cp xen--master.patchbot-reported-heads xen--stable-$v.patchbot-reported-heads
+  cp xen--staging.patchbot-reported-heads xen--staging-$v.patchbot-reported-heads
+  $EDITOR versions
+  git commit -am "Branch for $v"
+
+  cd ~xendocs/cronjobs
+  $EDITOR xenbits-docs-all.sh
+  git commit -am "Branch for $v"
+
+
+On the new branch:
+
+ * Switch to release builds by default.  Commit.
+
+On staging:
+
+ * Update ``XEN_SUBVERSION`` to the next version.  Update
+   ``XEN_EXTRAVERSION``, ``README`` and ``SUPPORT.md`` back to ``-unstable``.
+   Commit.  Tag the start of the new development window.
+
+ * Rerun ``./autogen.sh`` to refresh the configure scripts.  Commit.
+
+ * Switch ``QEMU_UPSTREAM_REVISION`` back to ``master``.  Commit.
+
+ * Create a new section in ``CHANGELOG.md``.  Commit.
+
+e.g. from Xen 4.21, ``d510f9c1430c^..62d0a92057ca`` and ``d510f9c1430c^..b0255656d121``::
+
+  * 62d0a92057ca - CHANGELOG.md: Start a new 4.22 section
+  * 7b88e463f999 - Config.mk: Switch QEMU back to master
+  * d954e8c5c8de - Rerun ./autogen.sh for 4.22
+  * 85768c28b705 - (tag: 4.22-dev) Update Xen to 4.22
+  | * b0255656d121 - (staging-4.21) Switch to release builds by default
+  |/
+  * d510f9c1430c - doc/man: Align list of viridian default enlightenments with libxl
+
+
+Releasing
+=========
+
+ * Finalise the release dates in ``CHANGELOG.md`` (backported from staging)
+   and ``SUPPORT.md`` (only in the release branch).
+
+ * Tag the release in relevant external repos, and update ``Config.mk`` to
+   refer to the tag.
+
+ * Update ``XEN_EXTRAVERSION`` to drop the ``-rc`` suffix, and update
+   ``README`` to match.  Commit.
+
+ * Tag.  Produce tarballs.
+
+e.g. from Xen 4.20, ``5cd830509d38^..3ad5d648cda5``::
+
+  * 3ad5d648cda5 - (tag: RELEASE-4.20.0) Update to Xen 4.20
+  * 89fd1ba88403 - Config.mk: Bump tags to final
+  * 6bf05e086765 - SUPPORT.md: Define support lifetime
+  * 5cd830509d38 - CHANGELOG.md: Set release date for 4.20
+
+
+Tagging
+=======
+
+ * Confirm that HEAD is on the commit which adjusts ``XEN_EXTRAVERSION``
+   suitably.  i.e. ``git show`` shows the intended commit.  Check that all CIs
+   are happy with this commit.
+
+ * Tags are expected to be in one of following forms:
+
+   * ``RELEASE-$X.$Y.$Z`` for releases.
+   * ``$X.$Y.0-rc$N`` for release candidates.
+   * ``$X.$Y-dev`` for development windows.
+
+ * Tags need to be annotated and signed with the appropriate key.  e.g.:
+
+::
+
+  git tag -u 'xen tree' -s -m "Xen $VER.0-rc1" $VER.0-rc1
+
+
+Producing tarballs
+==================
+
+ * Confirm that HEAD is tagged.  i.e. ``git describe`` does not contain a SHA
+   on the end.
+
+ * In the root of Xen, run ``make src-tarball-release``.  This produces one or
+   more tarballs with different compression schemes.
+
+ * In the CVS repostiory, create a new directory and add it.  Copy the
+   tarballs in, sign them and add them.  Commit the result (pushes to the
+   server).
+
+ * On mail.xenproject.org, update the webroot.  e.g.:
+
+::
+
+   cd /path/to/xen.git
+   make src-tarball-release
+   ... # output in dist/
+
+   cd /path/to/xen.org.cvs
+
+   # Make and add new directory
+   mkdir oss-xen/release/$VER
+   cvs add -kb oss-xen/release/$VER
+
+   # Copy the tarballs, sign and add them
+   cp /path/to/xen.git/dist/xen-*.tar.* .
+   for t in xen-*.tar.*
+   do
+       gpg --digest-algo=SHA256 --detach-sign -u 'xen tree' $t
+       cvs add -kb $t
+       cvs add -kb $t.sig
+   done
+
+   # Commit the result (also pushes to the server)
+   cvs commit -m $VER
+
+   # SSH to the server and update the webroot
+   ssh downloads-cvs@mail.xenproject.org -- \
+       'cd /data/downloads.xenproject.org/xen.org/; cvs -q update -d'

base-commit: 781cf8affe407654fd5d216f3bcb148601f1a61f
-- 
2.39.5


