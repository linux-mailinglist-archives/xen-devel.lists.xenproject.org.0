Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAAA286710
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:28:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3723.11169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEAn-00052G-0t; Wed, 07 Oct 2020 18:28:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3723.11169; Wed, 07 Oct 2020 18:28:20 +0000
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
	id 1kQEAk-0004vb-7N; Wed, 07 Oct 2020 18:28:18 +0000
Received: by outflank-mailman (input) for mailman id 3723;
 Wed, 07 Oct 2020 18:28:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE51-00072Q-NB
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:22:23 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 646be300-5e0c-4374-a999-7afb671732f2;
 Wed, 07 Oct 2020 18:20:41 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDjx-0007CF-67; Wed, 07 Oct 2020 19:00:37 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE51-00072Q-NB
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:22:23 +0000
X-Inumbo-ID: 646be300-5e0c-4374-a999-7afb671732f2
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 646be300-5e0c-4374-a999-7afb671732f2;
	Wed, 07 Oct 2020 18:20:41 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDjx-0007CF-67; Wed, 07 Oct 2020 19:00:37 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Olivier Lambert <olivier.lambert@vates.fr>
Subject: [OSSTEST PATCH 16/82] abolish "kernkind"; desupport non-pvops kernels
Date: Wed,  7 Oct 2020 18:59:18 +0100
Message-Id: <20201007180024.7932-17-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

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
ends up in build jobs' names.  All our kernel build jobs now end in
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


