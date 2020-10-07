Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C0E2866CB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:19:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3644.10545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE1j-00077z-Qv; Wed, 07 Oct 2020 18:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3644.10545; Wed, 07 Oct 2020 18:18:59 +0000
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
	id 1kQE1j-00077U-NR; Wed, 07 Oct 2020 18:18:59 +0000
Received: by outflank-mailman (input) for mailman id 3644;
 Wed, 07 Oct 2020 18:18:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE1i-00072Q-FZ
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:18:58 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4107dd9a-78d9-4391-844b-8506c6bdd8d7;
 Wed, 07 Oct 2020 18:18:54 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDjz-0007CF-Mp; Wed, 07 Oct 2020 19:00:39 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE1i-00072Q-FZ
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:18:58 +0000
X-Inumbo-ID: 4107dd9a-78d9-4391-844b-8506c6bdd8d7
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4107dd9a-78d9-4391-844b-8506c6bdd8d7;
	Wed, 07 Oct 2020 18:18:54 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDjz-0007CF-Mp; Wed, 07 Oct 2020 19:00:39 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 26/82] host allocation: selecthost: allow sort-of-selection of prospective hosts
Date: Wed,  7 Oct 2020 18:59:28 +0100
Message-Id: <20201007180024.7932-27-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

If one passes a trueish value for $prospective, selecthost does not
worry about whether any host has actually been selected.  It does a
limited amount of prep work.

This will be useful if we want to know some of the non-host-specific
information selecthost computes - in particular, $ho->{Suite} etc.

No functional change with existing callers.

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 Osstest/TestSupport.pm | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index 7292a329..3d5f0be3 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -1170,9 +1170,9 @@ sub power_state ($$;$) {
 
 #---------- host selection and properties ----------
 
-sub selecthost ($;$);
-sub selecthost ($;$) {
-    my ($ident, $none_ok) = @_;
+sub selecthost ($;$$);
+sub selecthost ($;$$) {
+    my ($ident, $none_ok, $prospective) = @_;
     # must be run outside transaction
 
     # $ident is <identspec>
@@ -1199,7 +1199,7 @@ sub selecthost ($;$) {
         $r{$ident}= $name;
     } else {
         $name= $r{$ident};
-	if (!defined $name) {
+	if (!defined $name and !$prospective) {
 	    return undef if $none_ok;
 	    die "no specified $ident";
 	}
@@ -1220,6 +1220,8 @@ sub selecthost ($;$) {
         $ho->{OS} = target_var($ho, "os") // "debian";
     }
 
+    return $ho if $prospective;
+
     #----- handle hosts which are themselves guests (nested) -----
 
     if ($name =~ s/^(.*)://) {
-- 
2.20.1


