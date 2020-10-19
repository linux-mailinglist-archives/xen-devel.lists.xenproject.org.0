Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DECF2922E6
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 09:21:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8599.23040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUPTn-0005VG-C7; Mon, 19 Oct 2020 07:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8599.23040; Mon, 19 Oct 2020 07:21:15 +0000
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
	id 1kUPTn-0005Ur-8i; Mon, 19 Oct 2020 07:21:15 +0000
Received: by outflank-mailman (input) for mailman id 8599;
 Mon, 19 Oct 2020 07:21:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUPTl-0005Um-95
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 07:21:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4da4b60-e98a-4069-ae32-3e024146e9c9;
 Mon, 19 Oct 2020 07:21:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6FF97AC2F;
 Mon, 19 Oct 2020 07:21:08 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUPTl-0005Um-95
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 07:21:13 +0000
X-Inumbo-ID: e4da4b60-e98a-4069-ae32-3e024146e9c9
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e4da4b60-e98a-4069-ae32-3e024146e9c9;
	Mon, 19 Oct 2020 07:21:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603092068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=teGLCrcUKZL1AHCBSXxSaZpkvLlDxc0tV0m8ZZiUxoA=;
	b=euWyR9e0hN7uo1YDG9zpjzrssDrV7zHfebwHXQYbo/+weTHYYclaWlqvVJPsBnGO6jAHdd
	GsNl2OBB8/kl1qhTH7uT330sic+iV/VUw9IbXoql2TNAcSe6lM0QsktDmhB7qq/rK/Mr7n
	eqm1IxE3Pw92Q6OJzi3MW7HQMsF5P84=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6FF97AC2F;
	Mon, 19 Oct 2020 07:21:08 +0000 (UTC)
Subject: [PATCH 1/2] tools/libs: fix header symlinking rule
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <2c9a0407-1bd1-6898-d1e3-9be4c869684b@suse.com>
Message-ID: <f4daea32-89bd-dafb-833f-1288882e58d8@suse.com>
Date: Mon, 19 Oct 2020 09:21:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <2c9a0407-1bd1-6898-d1e3-9be4c869684b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Unlike pattern rules, ordinary rules with multiple targets have their
commands executed once per target. Hence when $(LIBHEADERS) expands to
more than just one item, multiple identical commands would have been
issued, which have been observed to cause build failures relatively
frequently after libx{c,l} code was moved to tools/libs/{ctrl,light}/.
Use a static pattern rule instead.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm aware Jürgen has a series pending to entirely remove the rule in
question, but this being an isolated fix which ought to be easier to
review, I thought I'd still post it. Re-basing his series over this
change should be straightforward.
However, for the above reason I'm not bothering getting right the
theoretical case of headers in subdirs of the respective include/ being
mentioned in $(LIBHEADER).

--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -79,8 +79,8 @@ headers.chk: $(LIBHEADERSGLOB) $(AUTOINC
 libxen$(LIBNAME).map:
 	echo 'VERS_$(MAJOR).$(MINOR) { global: *; };' >$@
 
-$(LIBHEADERSGLOB): $(LIBHEADERS)
-	for i in $(realpath $(LIBHEADERS)); do ln -sf $$i $(XEN_ROOT)/tools/include; done
+$(LIBHEADERSGLOB): $(XEN_ROOT)/tools/include/%.h: include/%.h
+	ln -sf $(CURDIR)/$< $(XEN_ROOT)/tools/include/
 
 lib$(LIB_FILE_NAME).a: $(LIB_OBJS)
 	$(AR) rc $@ $^


