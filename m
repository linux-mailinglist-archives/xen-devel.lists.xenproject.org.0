Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAE54052C1
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 14:49:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183222.331286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOJUl-0005BW-Mj; Thu, 09 Sep 2021 12:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183222.331286; Thu, 09 Sep 2021 12:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOJUl-000591-I1; Thu, 09 Sep 2021 12:49:35 +0000
Received: by outflank-mailman (input) for mailman id 183222;
 Thu, 09 Sep 2021 12:49:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vCZp=N7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mOJUk-0004iJ-4C
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 12:49:34 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf1dbd9c-3e4d-415e-b987-b6d84d2fc777;
 Thu, 09 Sep 2021 12:49:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C0AA320041;
 Thu,  9 Sep 2021 12:49:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 851A513C53;
 Thu,  9 Sep 2021 12:49:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4GAOH9cCOmEyAgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 09 Sep 2021 12:49:27 +0000
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
X-Inumbo-ID: bf1dbd9c-3e4d-415e-b987-b6d84d2fc777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631191767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VDnmS7PEHavwjTjDgrskPsWB2O0plcriin7YJuNthnc=;
	b=fDk4sR4I11DrMQkGj9VBRnyVivX+WpBqLZ2Wt8VK2Q8AMahd+4X8MeZ8cHUD29gqP8k4yt
	Aco/LHI7UwU4qX3Ij87PACYNREoJOT1KSZWA6obPmLcUexrpLM6ZiYje4bwuywen7eJ07k
	isdjQUvxfsYEavqhg6UUH8b+OzeVe3c=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Community Manager <community.manager@xenproject.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/3] stubdom: disable building pv-grub
Date: Thu,  9 Sep 2021 14:49:23 +0200
Message-Id: <20210909124924.1698-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210909124924.1698-1-jgross@suse.com>
References: <20210909124924.1698-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The stubdom based pv-grub is using a very outdated version of grub
(0.97) and should not be used any longer. Mainline grub has support for
PV guests for a long time now, so that should be used as a boot loader
of a PV domain.

So disable building pv-grub per default. In case someone really wants
to continue using it he/she can still use a pv-grub binary from an older
Xen version or manually enable building it via:

  configure --enable-pv-grub

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
V2:
- add CHANGELOG.md entry (Jan Beulich)
---
 CHANGELOG.md         | 2 ++
 stubdom/configure    | 8 ++------
 stubdom/configure.ac | 2 +-
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 22cfdb4298..e7107ac3de 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -16,6 +16,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    appearing in 4.12.2 and 4.11.4). Prior (4.13...4.15-like) behavior can be arranged for
    either by enabling the IOMMU_QUARANTINE_SCRATCH_PAGE setting at build (configuration) time
    or by passing "iommu=quarantine=scratch-page" on the hypervisor command line.
+ - pv-grub stubdoms will no longer be built per default. In order to be able to use pv-grub
+   configure needs to be called with "--enable-pv-grub" as parameter.
 
 ## [4.15.0 UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - TBD
 
diff --git a/stubdom/configure b/stubdom/configure
index aa48df986d..df31532abb 100755
--- a/stubdom/configure
+++ b/stubdom/configure
@@ -1342,7 +1342,7 @@ Optional Features:
   --enable-ioemu-stubdom  Build and install ioemu-stubdom
   --enable-c-stubdom      Build and install c-stubdom (default is DISABLED)
   --enable-caml-stubdom   Build and install caml-stubdom (default is DISABLED)
-  --disable-pv-grub       Build and install pv-grub (default is ENABLED)
+  --enable-pv-grub        Build and install pv-grub (default is DISABLED)
   --disable-xenstore-stubdom
                           Build and install xenstore-stubdom (default is
                           ENABLED)
@@ -2129,11 +2129,7 @@ fi
 else
 
 
-grub=y
-STUBDOM_TARGETS="$STUBDOM_TARGETS grub"
-STUBDOM_BUILD="$STUBDOM_BUILD pv-grub"
-STUBDOM_INSTALL="$STUBDOM_INSTALL install-grub"
-STUBDOM_UNINSTALL="$STUBDOM_UNINSTALL install-grub"
+grub=n
 
 
 fi
diff --git a/stubdom/configure.ac b/stubdom/configure.ac
index bd6f765929..a07a1edae5 100644
--- a/stubdom/configure.ac
+++ b/stubdom/configure.ac
@@ -21,7 +21,7 @@ m4_include([../m4/fetcher.m4])
 AX_STUBDOM_CONDITIONAL([ioemu-stubdom], [ioemu])
 AX_STUBDOM_DEFAULT_DISABLE([c-stubdom], [c])
 AX_STUBDOM_DEFAULT_DISABLE([caml-stubdom], [caml])
-AX_STUBDOM_DEFAULT_ENABLE([pv-grub], [grub])
+AX_STUBDOM_DEFAULT_DISABLE([pv-grub], [grub])
 AX_STUBDOM_DEFAULT_ENABLE([xenstore-stubdom], [xenstore])
 AX_STUBDOM_DEFAULT_ENABLE([xenstorepvh-stubdom], [xenstorepvh])
 AX_STUBDOM_CONDITIONAL([vtpm-stubdom], [vtpm])
-- 
2.26.2


