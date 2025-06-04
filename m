Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D74ACE6FA
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 01:11:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006005.1385280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMxFF-0006CP-VK; Wed, 04 Jun 2025 23:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006005.1385280; Wed, 04 Jun 2025 23:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMxFF-00068M-SG; Wed, 04 Jun 2025 23:10:05 +0000
Received: by outflank-mailman (input) for mailman id 1006005;
 Wed, 04 Jun 2025 23:10:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Klp=YT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uMxFE-0005oG-12
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 23:10:04 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a761421-4199-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 01:10:01 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4D4B761139;
 Wed,  4 Jun 2025 23:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 008B8C4CEE4;
 Wed,  4 Jun 2025 23:09:58 +0000 (UTC)
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
X-Inumbo-ID: 0a761421-4199-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749078600;
	bh=9hPBLa6j3nmZiASL002dh5+4P4fO7fZUVLERjQNoOek=;
	h=Date:From:To:cc:Subject:From;
	b=RW9Lrgm9o3ErOnQzUfWj1aEmj547mXpmBm4/gXmZi3ny9trmzaWvBDvHet4aLC5is
	 3n5iw8VE2lEA9V6OBWwi1AwVOgZuz0MJWPBhzEH8ejFt+t19Zf7B7BCNrO1PaBxFQO
	 2jGuWB1tsTZp1fBf2qFOuZfVZDNt3m2hb779Yb2HrWA2BNPHBnVIIurxF0JybRWQZ9
	 6OJIMxnolgYX/Nx2K6nTGD0WEbzUEiH5HJ2MSqCLC7UCeCLXnUN9gO3zdzB3s1T1zF
	 jYib+gYSTDYoXYWnEOlPEVv2eV4jjlsS1mXyh4scBciP9kPa3jkWE7kCxn63aqlimF
	 2Foy237COEfGg==
Date: Wed, 4 Jun 2025 16:09:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, michal.orzel@amd.com, jbeulich@suse.com, 
    julien@xen.org, roger.pau@citrix.com
Subject: [PATCH] xen: add header guards to generated asm generic headers 
Message-ID: <alpine.DEB.2.22.394.2506041605090.2495561@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

MISRA D4.10 requires to have proper header guards in place in all header
files. Add header guards for generated asm generic headers as well.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/xen/scripts/Makefile.asm-generic b/xen/scripts/Makefile.asm-generic
index b0d356bfa3..a44844bed0 100644
--- a/xen/scripts/Makefile.asm-generic
+++ b/xen/scripts/Makefile.asm-generic
@@ -32,7 +32,12 @@ old-headers := $(wildcard $(obj)/*.h)
 unwanted    := $(filter-out $(generic-y) $(generated-y),$(old-headers))
 
 quiet_cmd_wrap = WRAP    $@
-      cmd_wrap = echo "\#include <asm-generic/$*.h>" > $@
+      cmd_wrap = \
+	upper=$$(echo $*.h | tr a-z A-Z | tr '/.' '__'); \
+	printf "\#ifndef ASM_GENERIC_$${upper}\n" > $@; \
+	printf "\#define ASM_GENERIC_$${upper}\n" >> $@; \
+	printf "\#include <asm-generic/$*.h>\n" >> $@; \
+	printf "\#endif /* ASM_GENERIC_$${upper} */\n" >> $@
 
 quiet_cmd_remove = REMOVE  $(unwanted)
       cmd_remove = rm -f $(unwanted)

