Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7842866D0
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:19:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3649.10608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE28-0007Zt-SN; Wed, 07 Oct 2020 18:19:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3649.10608; Wed, 07 Oct 2020 18:19:24 +0000
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
	id 1kQE28-0007Yv-Mv; Wed, 07 Oct 2020 18:19:24 +0000
Received: by outflank-mailman (input) for mailman id 3649;
 Wed, 07 Oct 2020 18:19:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE27-00072Q-GZ
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:19:23 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3a47a31-db37-454f-a28e-22d0be966e38;
 Wed, 07 Oct 2020 18:19:09 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk4-0007CF-3A; Wed, 07 Oct 2020 19:00:44 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE27-00072Q-GZ
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:19:23 +0000
X-Inumbo-ID: b3a47a31-db37-454f-a28e-22d0be966e38
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b3a47a31-db37-454f-a28e-22d0be966e38;
	Wed, 07 Oct 2020 18:19:09 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk4-0007CF-3A; Wed, 07 Oct 2020 19:00:44 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 42/82] host allocation: selecthost(): Support @IDENT for reuse
Date: Wed,  7 Oct 2020 18:59:44 +0100
Message-Id: <20201007180024.7932-43-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

This is the first part of a central way to control host reuse, rather
than having to write code in each ts-* script to check Shared etc.

No functional change with existing callers.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/TestSupport.pm | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index 3d5f0be3..be6b7119 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -1175,7 +1175,7 @@ sub selecthost ($;$$) {
     my ($ident, $none_ok, $prospective) = @_;
     # must be run outside transaction
 
-    # $ident is <identspec>
+    # $ident is [@]<identspec>
     #
     # <identspec> can be <ident>, typically "host" or "xxx_host"
     # which means look up the runvar $r{$ident} which
@@ -1191,8 +1191,16 @@ sub selecthost ($;$$) {
     # <hostspec> can be <parent_identspec>:<domname> meaning use the
     # Xen domain name <domname> on the host specified by
     # <parent_identspec>, which is an <identspec> as above.
+    #
+    # The leading @, if present, specifies that this script should be
+    # skipped if the host is being reused or shared.  Specifically:
+    # if the host is shared and in sharing state `ready'.  And, it is
+    # wrong to specify @ when multiple hosts are being selected.
 
     my $name;
+
+    my $isprep = $ident =~ s/^\@//;
+
     if ($ident =~ m/=/) {
         $ident= $`;
         $name= $'; #'
@@ -1352,13 +1360,27 @@ sub selecthost ($;$$) {
 
     $mjobdb->host_check_allocated($ho);
 
-    logm("host $ho->{Ident}: selected $ho->{Name} ".
+    logm("host $ho->{Ident}".
+	 ($isprep ? " (prep)" : "").
+	 ": selected $ho->{Name} ".
 	 (defined $ho->{Ether} ? $ho->{Ether} : '<unknown-ether>').
 	 " $ho->{Ip}".
          (!$ho->{Shared} ? '' :
           sprintf(" - shared %s %s %d", $ho->{Shared}{Type},
                   $ho->{Shared}{State}, $ho->{Shared}{Others}+1)));
 
+    if ($isprep && $ho->{Shared}) {
+	my $st = $ho->{Shared}{State};
+	if ($st eq 'ready') {
+	    logm("host is ready, skipping step");
+	    exit 0;
+	} elsif ($st eq 'prep') {
+	    # ok, we need to do it
+	} else {
+	    die "host sharestate is $st but isprep (@ in ident)";
+	}
+    }
+
     return $ho;
 }
 
-- 
2.20.1


