Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3843B2C0EB0
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 16:21:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34634.65786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khDeC-0006Ym-NM; Mon, 23 Nov 2020 15:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34634.65786; Mon, 23 Nov 2020 15:20:56 +0000
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
	id 1khDeC-0006YN-Jb; Mon, 23 Nov 2020 15:20:56 +0000
Received: by outflank-mailman (input) for mailman id 34634;
 Mon, 23 Nov 2020 15:20:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khDeB-0006YI-0G
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:20:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00327f36-3284-496e-a046-bd44e03cc72f;
 Mon, 23 Nov 2020 15:20:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0EE9BAFC1;
 Mon, 23 Nov 2020 15:20:53 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khDeB-0006YI-0G
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:20:55 +0000
X-Inumbo-ID: 00327f36-3284-496e-a046-bd44e03cc72f
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 00327f36-3284-496e-a046-bd44e03cc72f;
	Mon, 23 Nov 2020 15:20:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606144853; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jLxsRc45eh7UkRXObTXpepNvE2qyML0sy1x3+LOrMrU=;
	b=k16gwm0wi2qK6YZWAoiu+PkDnP8FvHs/UO62GKE0xjxPSoa5xAIb1+r0jCUN9MbAZeXnM2
	SxIq98z5NlP0LHrWdMs2WpMMTawp2zydAc8MY9kgDT6ubqqQEJB0apGraDjRGXbqu4b4kW
	ZaV8ZFz49CFhcc5hLEx8mVjtvejZfck=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0EE9BAFC1;
	Mon, 23 Nov 2020 15:20:53 +0000 (UTC)
Subject: [PATCH v3 1/8] xen: fix build when $(obj-y) consists of just blanks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
Message-ID: <511be84d-9a13-17ae-f3d9-d6daf9c02711@suse.com>
Date: Mon, 23 Nov 2020 16:20:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This case can occur when combining empty lists

obj-y :=
...
obj-y += $(empty)

or

obj-y := $(empty) $(empty)

where (only) blanks would accumulate. This was only a latent issue until
now, but would become an active issue for Arm once lib/ gets populated
with all respective objects going into the to be introduced lib.a.

Also address a related issue at this occasion: When an empty built_in.o
gets created, .built_in.o.d will have its dependencies recorded. If, on
a subsequent incremental build, an actual constituent of built_in.o
appeared, the $(filter-out ) would leave these recorded dependencies in
place. But of course the linker won't know what to do with C header
files. (The apparent alternative of avoiding to pass $(c_flags) or
$(a_flags) would not be reliable afaict, as among these flags there may
be some affecting information conveyed via the object file to the
linker. The linker, finding inconsistent flags across object files, may
then error out.) Using just $(obj-y) won't work either: It breaks when
the same object file is listed more than once.

Reported-by: Julien Grall <julien@xen.org>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
 xen/Rules.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 333e19bec343..d5e5eb33de39 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -130,13 +130,13 @@ c_flags += $(CFLAGS-y)
 a_flags += $(CFLAGS-y) $(AFLAGS-y)
 
 built_in.o: $(obj-y) $(extra-y)
-ifeq ($(obj-y),)
+ifeq ($(strip $(obj-y)),)
 	$(CC) $(c_flags) -c -x c /dev/null -o $@
 else
 ifeq ($(CONFIG_LTO),y)
-	$(LD_LTO) -r -o $@ $(filter-out $(extra-y),$^)
+	$(LD_LTO) -r -o $@ $(filter $(obj-y),$^)
 else
-	$(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out $(extra-y),$^)
+	$(LD) $(XEN_LDFLAGS) -r -o $@ $(filter $(obj-y),$^)
 endif
 endif
 
@@ -145,10 +145,10 @@ targets += $(filter-out $(subdir-obj-y), $(obj-y)) $(extra-y)
 targets += $(MAKECMDGOALS)
 
 built_in_bin.o: $(obj-bin-y) $(extra-y)
-ifeq ($(obj-bin-y),)
+ifeq ($(strip $(obj-bin-y)),)
 	$(CC) $(a_flags) -c -x assembler /dev/null -o $@
 else
-	$(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out $(extra-y),$^)
+	$(LD) $(XEN_LDFLAGS) -r -o $@ $(filter $(obj-bin-y),$^)
 endif
 
 # Force execution of pattern rules (for which PHONY cannot be directly used).
-- 
2.22.0



