Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 214851F1A2F
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 15:35:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiHvl-0005Nv-FG; Mon, 08 Jun 2020 13:35:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UmkZ=7V=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jiHvk-0005Nq-5n
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 13:35:12 +0000
X-Inumbo-ID: df08c397-a98c-11ea-b275-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df08c397-a98c-11ea-b275-12813bfff9fa;
 Mon, 08 Jun 2020 13:35:10 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: lRPdGcQtw5arndInLSRzK97MBnanXN9L2aS9PQILo1QZZxDJ5pdM1bnMuhPCm7AzaKYCc5zW9m
 DDbrNOVZuNuGimqqJrqytR3TD6h2GS/i4NFDDXh3Mo0a3ZgGmSWgkq1jCTJYHrXoqQC/QDrEuA
 GXUueHrWj73DMPTd4UYzsGYaQruE6zbJylFa+i4up1iNYA+rGMM0JYGKci8d8YkqTCJB/z7vuN
 eCFdyU27aco4mt/KvgcFsl9M9DzaMK5caS1uof8W44nOke/pzLcVTsTD4r6q7rC/pJhb0GUSDD
 7ng=
X-SBRS: 2.7
X-MesageID: 20232980
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,487,1583211600"; d="scan'208";a="20232980"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 for-4.14] docs/support-matrix: unbreak docs rendering
Date: Mon, 8 Jun 2020 14:34:33 +0100
Message-ID: <20200608133433.23659-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Jan
 Beulich <JBeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The cronjob which renders https://xenbits.xen.org/docs/ has been broken for a
while.  commitish_version() pulls an old version of xen/Makefile out of
history, and uses the xenversion rule.

Currently, this fails with:

  tmp.support-matrix.xen.make:130: scripts/Kbuild.include: No such file or directory

which is because the Makefile legitimately references Kbuild.include with a
relative rather than absolute path.

Rework support-matrix-generate to use sed to extract the major/minor, rather
than expecting xen/Makefile to be usable in a different tree.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Paul Durrant <paul@xen.org>

v2:
 * Use sed rather than fixing up the makefile environment

This needs backporting to all trees with the support matrix logic, to unbreak
docs rendering
---
 docs/support-matrix-generate | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/docs/support-matrix-generate b/docs/support-matrix-generate
index a3d93321f1..b759d0440c 100755
--- a/docs/support-matrix-generate
+++ b/docs/support-matrix-generate
@@ -26,12 +26,9 @@
 # SUPPORT.md into json.
 #
 # Then we try to find the next previous revision.  This is done by
-# extracting the current version number from xen/Makefile.  (We make
-# some slight assumption about how xen/Makefile's xenversion target
-# works, because we want to be able to do this without checking out
-# the whole tree for the version in question.)  Then we use git log on
-# xen/Makefile to try to find a commit where the version changed.
-# This gives us the previous version number, NN.
+# extracting the current version number from xen/Makefile.  Then we
+# use git log on xen/Makefile to try to find a commit where the
+# version changed.  This gives us the previous version number, NN.
 #
 # That is substituted into the `refs/remotes/origin/stable-NN'
 # argument to get the tip of the relevant branch.  That in turns
@@ -102,12 +99,16 @@ commitish_version () {
     esac
 
     git cat-file blob "$commitish:$versionfile" >"$tmp_versionfile"
-    version=$(make --no-print-directory -C docs \
-                   -f "${tmp_versionfile#docs/}" xenversion)
-    case "$version" in
-        *.*.*) version="${version%.*}" ;;
-    esac
-    printf "%s\n" "${version%%-*}"
+
+    local maj=$(sed -n 's/.*XEN_VERSION.*= \([0-9]\+\)/\1/p' < "$tmp_versionfile")
+    local min=$(sed -n 's/.*XEN_SUBVERSION.*= \([0-9]\+\)/\1/p' < "$tmp_versionfile")
+
+    if [[ -z $maj || -z $min ]];
+    then
+        fail "Unable to identify Xen version for ${commitish}";
+    fi
+
+    printf "%d.%d\n" "${maj}" "${min}"
 }
 
 exec 4>"$tmp_revisions"
-- 
2.11.0


