Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA8628EEB0
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 10:42:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7152.18759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSyqF-0003m7-KG; Thu, 15 Oct 2020 08:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7152.18759; Thu, 15 Oct 2020 08:42:31 +0000
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
	id 1kSyqF-0003li-Gt; Thu, 15 Oct 2020 08:42:31 +0000
Received: by outflank-mailman (input) for mailman id 7152;
 Thu, 15 Oct 2020 08:42:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MKI8=DW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSyqD-0003la-Sa
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 08:42:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c34ec67-a9ae-44f0-828d-68c1cc858919;
 Thu, 15 Oct 2020 08:42:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3E200ADA8;
 Thu, 15 Oct 2020 08:42:28 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MKI8=DW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSyqD-0003la-Sa
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 08:42:29 +0000
X-Inumbo-ID: 2c34ec67-a9ae-44f0-828d-68c1cc858919
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2c34ec67-a9ae-44f0-828d-68c1cc858919;
	Thu, 15 Oct 2020 08:42:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602751348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=a/afXgJ3BafDVXWwzXn01PQSSXilZ5CGddn4pqdyalw=;
	b=TbmAtZm1CKi9kz+eabFy74ONXhZdEYYlaGMLV+rfWAGjnAmU6yfdFoXfSmbAubl//NYcEX
	47J/NXcBXWUlOxlo3R41jALDRym6F15x1/NlFRHvmOvNwtLreZGjjZVJ0bWuv/nc955ETm
	/1uTQ6a30+JiFO6T1seADxCnojkW9nU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3E200ADA8;
	Thu, 15 Oct 2020 08:42:28 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] tools/gdbsx: drop stray recursion into tools/include/
Message-ID: <ece6c5c2-43f8-36d2-370c-37d988baeb87@suse.com>
Date: Thu, 15 Oct 2020 10:42:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Doing so isn't appropriate here - this gets done very early in the build
process. If the directory is mean to to be buildable on its own,
different arrangements would be needed.

The issue has become more pronounced by 47654a0d7320 ("tools/include:
fix (drop) dependencies of when to populate xen/"), but was there before
afaict.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/debugger/gdbsx/xg/Makefile
+++ b/tools/debugger/gdbsx/xg/Makefile
@@ -12,7 +12,7 @@ CFLAGS += $(CFLAGS_xeninclude)
 all: build
 
 .PHONY: build
-build: xen-headers xg_all.a $(XG_HDRS) $(XG_OBJS) Makefile
+build: xg_all.a $(XG_HDRS) $(XG_OBJS) Makefile
 # build: mk-symlinks xg_all.a $(XG_HDRS) $(XG_OBJS) Makefile
 # build: mk-symlinks xg_all.a
 
@@ -21,9 +21,6 @@ xg_all.a: $(XG_OBJS) Makefile $(XG_HDRS)
 #	$(LD) -b elf32-i386 $(LDFLAGS) -r -o $@ $^
 #	$(CC) -m32 -c -o $@ $^
 
-xen-headers:
-	$(MAKE) -C ../../../include
-
 # xg_main.o: xg_main.c Makefile $(XG_HDRS)
 #$(CC) -c $(CFLAGS) -o $@ $<
 

