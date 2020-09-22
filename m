Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEFE273C68
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 09:47:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKd1I-0000tH-1W; Tue, 22 Sep 2020 07:47:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tL6=C7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kKd1F-0000tC-QX
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 07:47:21 +0000
X-Inumbo-ID: 5a1e98d6-b899-4298-a6dd-27acf54417bc
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a1e98d6-b899-4298-a6dd-27acf54417bc;
 Tue, 22 Sep 2020 07:47:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600760839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OnfcQuKerl4IvxbHw9VkWcq8AepYPm/fL7aAKlQXWY8=;
 b=W1rtxP60ZgU5v97DbgG5TeXhijt0yE6lx8zR/Qv6P9Dn6J9G7230Z3Bb/8vbT3holaEEaL
 s3VGB0mF5hKvWIY86juIL9nS8iGQM//Z3DNOD4A3kq5pQ/BagjpfcEWPVDAm4+M6a6NdiK
 JGdAWiUjUmYAcidxFnQ/QxxwcRW6Bjs=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 18093ACC2;
 Tue, 22 Sep 2020 07:47:56 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] common/Kconfig: sort HAS_*
Message-ID: <5b40fddf-3d43-a105-2528-a448b2df020a@suse.com>
Date: Tue, 22 Sep 2020 09:47:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Later additions look to have been put at the end, with MEM_ACCESS*
somewhere in the middle. Re-sort this part of the file, in the hope that
future additions will be made noticing the intentions here.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -34,16 +34,11 @@ config HAS_EX_TABLE
 config HAS_FAST_MULTIPLY
 	bool
 
-config MEM_ACCESS_ALWAYS_ON
+config HAS_IOPORTS
 	bool
 
-config MEM_ACCESS
-	def_bool MEM_ACCESS_ALWAYS_ON
-	prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
-	---help---
-
-	  Framework to configure memory access types for guests and receive
-	  related events in userspace.
+config HAS_KEXEC
+	bool
 
 config HAS_MEM_PAGING
 	bool
@@ -51,17 +46,22 @@ config HAS_MEM_PAGING
 config HAS_PDX
 	bool
 
-config HAS_UBSAN
+config HAS_SCHED_GRANULARITY
 	bool
 
-config HAS_KEXEC
+config HAS_UBSAN
 	bool
 
-config HAS_IOPORTS
+config MEM_ACCESS_ALWAYS_ON
 	bool
 
-config HAS_SCHED_GRANULARITY
-	bool
+config MEM_ACCESS
+	def_bool MEM_ACCESS_ALWAYS_ON
+	prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
+	---help---
+
+	  Framework to configure memory access types for guests and receive
+	  related events in userspace.
 
 config NEEDS_LIBELF
 	bool

