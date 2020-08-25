Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E2F2517EB
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 13:41:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAXKO-0003Ra-Vq; Tue, 25 Aug 2020 11:41:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=577d=CD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1kAXKN-00030Q-Oj
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 11:41:23 +0000
X-Inumbo-ID: a31bb248-9b3e-4317-986c-21dc4149b4ac
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a31bb248-9b3e-4317-986c-21dc4149b4ac;
 Tue, 25 Aug 2020 11:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598355655;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m89Gy/SwvYlwh9agO/GAobe4rWC2d8lDXSHoo3JP6AU=;
 b=FK1Tz2GtWY9oY4YrF9f020RwyaCynwgtIOi3zwNdaL9KUtvxefISNmAl
 jf0eNrcBzxTuI+Z+jRH9B/GKsKOL8S84lyrZ4DmB91uhE1ygdRs6ZVQTy
 +1ObXBX5eJ8oYe2WmA8avRP6wbEtD+6MGeL55ZTB8rmNbOFCOmS7AmVCI I=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Ux+WzGNr5lq4Mwo1Y3778+QhYc+hqjD3GDdlPw1zVkHFLP2x65oSkzb6c1KMxFu8hx0I8+do+2
 1lKOh73ObQIo0G+2jLrJt2OuS/cFc0jR76HWUL+aPiT5STxTWpn9CxsLMgNqlzSwwsb/AjcVXB
 YoRDUAGI5Pw9ykkSV6EqL43KKU4AO7YJJvba1tY/iCr5JXF6xkOE9ocsRpAVUTpFsriwZ6ENBV
 z1KmcADbJ6StdEvPH4vCQSVHsvZMhzWCzjDocMFhwB9QmEUC0IQYJTUAQXN6sgXEhIbx7CO0Tg
 bhw=
X-SBRS: 2.7
X-MesageID: 25223289
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,352,1592884800"; d="scan'208";a="25223289"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wei.liu@kernel.org>, Paul Durrant
 <paul@xen.org>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Olivier Lambert
 <olivier.lambert@vates.fr>
Subject: [OSSTEST PATCH 12/12] abolish "kernkind"; desupport non-pvops kernels
Date: Tue, 25 Aug 2020 12:40:41 +0100
Message-ID: <20200825114041.16290-13-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200825114041.16290-1-ian.jackson@eu.citrix.com>
References: <20200825114041.16290-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This was for distinguishing the old-style Xenolinux kernels from pvops
kernels.

We have not actually tested any non-pvops kernels for a very very long
time.  Delete this now because the runvar is slightly in the way of
test host reuse.

(Sorry for the wide CC but it seems better to make sure anyone who
might object can do so.)

All this machinery exists just to configure the guest console
device (Xenolinux used "xvc" rather than "hvc") and the guest root
block device (Xenolinux stole "hda"/"sda" rather than using "xvda").

Specifically, in this commit:
 * In what is now target_setup_rootdev_console_inittab, do not
   look at any kernkind runvar and simply do what we would if
   it were "pvops" or unset, as it is in all current jobs.
 * Remove the runvar from all jobs creation and example runes.
   (This has no functional change even for jobs running with
   the previous osstest code because we have defaulted to "pvops"
   for a very long time.)

We retain the setting of the shell variable "kernbuild", because that
ends up in build jobs names.  All our kernel build jobs now end in
-pvops and I intend to retain that name component since abolishing it
is nontrivial.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>
CC: Juergen Gross <jgross@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wei.liu@kernel.org>
CC: Paul Durrant <paul@xen.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Juergen Gross <jgross@suse.com>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Olivier Lambert <olivier.lambert@vates.fr>
---
 Osstest/TestSupport.pm | 9 ++-------
 README                 | 2 +-
 make-hosts-flight      | 1 -
 mfi-common             | 7 ++-----
 4 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index d9bb2585..99c7654d 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -2569,14 +2569,9 @@ sub target_setup_rootdev_console_inittab ($$$) {
     my ($ho, $gho, $root) = @_;
 
     my $pfx= target_var_prefix($gho);
-    my $kernkind= $r{$pfx."kernkind"} // 'pvops';
     my $isguest= exists $gho->{Guest};
-    if ($kernkind eq 'pvops') {
-        store_runvar($pfx."rootdev", 'xvda') if $isguest;
-        store_runvar($pfx."console", 'hvc0');
-    } elsif ($kernkind !~ m/2618/) {
-        store_runvar($pfx."console", 'xvc0') if $isguest;
-    }
+    store_runvar($pfx."rootdev", 'xvda') if $isguest;
+    store_runvar($pfx."console", 'hvc0');
 
     my $inittabpath= "$root/etc/inittab";
     my $console= target_var($gho,'console');
diff --git a/README b/README
index 2804ecf3..ba4bea1d 100644
--- a/README
+++ b/README
@@ -861,7 +861,7 @@ echo $flight
 job=play-amd64-amd64-xen-boot
 ./cs-job-create $flight $job play-xen-boot-x5 \
     all_hostflags=arch-amd64,arch-xen-amd64,suite-wheezy,purpose-test \
-    arch=amd64 toolstack=xl enable_xsm=false kernkind=pvops \
+    arch=amd64 toolstack=xl enable_xsm=false \
     host=$host
 
 # Reuse the binaries from the Xen template job for both the hypervisor
diff --git a/make-hosts-flight b/make-hosts-flight
index e2c3776a..63ac7b71 100755
--- a/make-hosts-flight
+++ b/make-hosts-flight
@@ -73,7 +73,6 @@ hosts_iterate () {
         local freebsd_runvars
         set_freebsd_runvars true
         runvars+=" 
-                   kernkind=pvops
                    all_host_di_version=$di_version
                    all_host_suite=$suite
                    $freebsd_runvars
diff --git a/mfi-common b/mfi-common
index e577449f..34b0c116 100644
--- a/mfi-common
+++ b/mfi-common
@@ -619,9 +619,8 @@ test_matrix_iterate () {
       case $kern in
       '')
                   kernbuild=pvops
-                  kernkind=pvops
                   ;;
-      *)          echo >&2 "kernkind ?  $kern"; exit 1 ;;
+      *)          echo >&2 "kernbuild ?  $kern"; exit 1 ;;
       esac
 
       for dom0arch in i386 amd64 armhf arm64; do
@@ -639,8 +638,7 @@ test_matrix_iterate () {
             arch_runvars=\"\$ARCH_RUNVARS_$dom0arch\"
         "
 
-        debian_runvars="debian_kernkind=$kernkind \
-                        debian_arch=$dom0arch \
+        debian_runvars="debian_arch=$dom0arch \
                         debian_suite=$guestsuite \
                         "
 
@@ -659,7 +657,6 @@ test_matrix_iterate () {
         most_runvars="
                   arch=$dom0arch                                  \
                   kernbuildjob=${bfi}build-$dom0arch-$kernbuild   \
-                  kernkind=$kernkind                              \
                   $arch_runvars $hostos_runvars
                   "
 
-- 
2.20.1


