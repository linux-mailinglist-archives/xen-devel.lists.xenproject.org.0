Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4F943CF66
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 19:03:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217120.376988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfmKd-0004jD-PY; Wed, 27 Oct 2021 17:03:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217120.376988; Wed, 27 Oct 2021 17:03:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfmKd-0004cK-KD; Wed, 27 Oct 2021 17:03:19 +0000
Received: by outflank-mailman (input) for mailman id 217120;
 Wed, 27 Oct 2021 17:03:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mfmKb-0004U9-Pz
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 17:03:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mfmKb-00007P-P9
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 17:03:17 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mfmKb-00008z-OU
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 17:03:17 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mfmKQ-0007y4-1y; Wed, 27 Oct 2021 18:03:06 +0100
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
	bh=CmW5peRN50Em71b3k175/7jXqoQ/j3qYsI/MZ7encfA=; b=Hw7bbjgBaL5JaLH2jWoVtU43fJ
	zzkGW9yChBzMMC8S3zNosyOqb47qLK5srXP73qL9bhQ0ExLdhTwdp87iE7/BBn7VB9HACZhEIU0/W
	UJ+bezMvuxmegwm2IIPkqkNNUsL5f+IHIra8SUE9MinGjeboGeyF7jQWIKaR7yfYxchY=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [OSSTEST PATCH 2/2] ts-xen-build: Pass --enable if --disable found in usage, and v.v.
Date: Wed, 27 Oct 2021 18:02:56 +0100
Message-Id: <20211027170256.18223-3-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027170256.18223-1-iwj@xenproject.org>
References: <20211027170256.18223-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing code works in practice if the usage message always lists
the non-default, since the unlisted-in-usage options that would be
supported, but are elided, are in any case the default.

But configure might *compute* its defaults.  In which case it will
list only one of them in the usage message.  If the computed default
is not the same as the usual default (the one implied by listing the
opposite in the usage message) we would wrongly not pass the option.

So grep for both enable and disable.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
CC: Juergen Gross <jgross@suse.com>
---
 ts-xen-build | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/ts-xen-build b/ts-xen-build
index d6f6bfacb..c294a51ea 100755
--- a/ts-xen-build
+++ b/ts-xen-build
@@ -142,12 +142,20 @@ END
 }
 
 sub build () {
+    # We want to explicitly enable and disable some things.  But not
+    # all versions of Xen support all configuration options.  We
+    # detect presence of an option by grepping configure.  That finds
+    # them in the usage message.  The usage message has only one of
+    # the two, depending on the usual default.  (Presence of --enable
+    # in the usage output means --disable is supported, and vice
+    # versa.)  So we search for both enable and disable, and if either
+    # is found, we use the one we want.
     my $enable_opts = ''; # shell script to set "enable_opts" shell var
     my $enable_disable = sub {
 	my ($subdir, $feat, $enable) = @_;
 	my $opt = "--".($enable ? 'enable' : 'disable')."-$feat";
 	$enable_opts .= <<END;
-                if grep -q -- $opt \\
+                if egrep -q -- '--disable-$feat|--enable-$feat' \\
                                ${subdir}configure ; then
 		    enable_opts="\$enable_opts $opt"
                 fi
-- 
2.20.1


