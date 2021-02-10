Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D64DA316CE2
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 18:36:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83681.156387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9tPs-0006Ii-OU; Wed, 10 Feb 2021 17:36:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83681.156387; Wed, 10 Feb 2021 17:36:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9tPs-0006HM-Dc; Wed, 10 Feb 2021 17:36:40 +0000
Received: by outflank-mailman (input) for mailman id 83681;
 Wed, 10 Feb 2021 17:36:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9tPq-0006GD-Iq
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 17:36:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9tPq-0006Tz-IC
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 17:36:38 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9tPq-0007oe-GJ
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 17:36:38 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1l9tPo-0000Wv-Q6; Wed, 10 Feb 2021 17:36:36 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=juDKe/7rXRZzHIxGzUePnxmhOsyn4oXjFJ3RnY+L0k0=; b=tLauqod4iWRGCMawxk9/+EA9Rn
	Gc/7EiEFWNNvuDey7qVTn0nqwwVrhRkiDxlyfKIzNcfVmD5pNI0TmzZt5MBIeUXlqOdbyOnagdj44
	qa82U5fBHYubLweGDbVX9mEFJ7cxO362s4zZcKBMH8Ay4D3lzjG18H2zhLL+wz2lZ5iI=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 3/3] Disable updates for ssapshot.debian.org
Date: Wed, 10 Feb 2021 17:36:29 +0000
Message-Id: <20210210173629.4788-3-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210210173629.4788-1-iwj@xenproject.org>
References: <20210210173629.4788-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

security updates are a separate apt source.

The point of using snapshot is to avoid pulling in uncontrolled
updates, so we need to disable security updates.

The non-security SUITE-updates are disabled by this too.  But
everything is on fire and I don't want another iteration while I
figure out the proper syntax for disabling only the security updates.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/Debian.pm | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index d6e0b59d..ded7cdfc 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -972,12 +972,19 @@ END
     preseed_hook_command($ho, 'late_command', $sfx,
 			 debian_dhcp_rofs_fix($ho, '/target'));
 
+    my $disable_security_updates = 0;
+
     my $murl = debian_mirror_url($ho);
     if ($murl =~ m/$c{DebianMirrorAllowExpiredReleaseRegexp}/) {
 	# Inspired by
 	#  https://stackoverflow.com/questions/25039317/is-there-any-setting-in-the-preseed-file-to-ignore-the-release-valid-until-opt/51396935#51396935
 	# In some sense a workaround for the lack of a better way,
 	#  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=771699
+	$disable_security_updates = 1;
+	# ^ this disables normal -updates too.  That's not desirable
+	#   but I don't want to mess with this now.  Hopefully it can
+	#   be improved later.
+
 	preseed_hook_installscript($ho, $sfx,
             '/usr/lib/apt-setup/generators/', '02IgnoreValidUntil', <<'END');
 #!/bin/sh
@@ -1075,12 +1082,14 @@ END
 d-i mirror/suite string $suite
 END
 
+    $disable_security_updates = 1 if $suite =~ m/jessie/;
+    # security.d.o CDN seems unreliable right now
+    # and jessie-updates is no more, so disable both for jessie
+
     $preseed .= <<'END'
 d-i apt-setup/services-select multiselect
 END
-       if $suite =~ m/jessie/;
-    # security.d.o CDN seems unreliable right now
-    # and jessie-updates is no more
+       if $disable_security_updates;
 
     if (grep { $r{$_} } runvar_glob('*_dmrestrict') and
 	$suite =~ m/stretch/) {
-- 
2.20.1


