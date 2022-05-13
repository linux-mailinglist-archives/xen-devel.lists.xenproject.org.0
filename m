Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6395263F6
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 16:27:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328488.551512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npWFS-0004va-1z; Fri, 13 May 2022 14:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328488.551512; Fri, 13 May 2022 14:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npWFR-0004si-VO; Fri, 13 May 2022 14:26:29 +0000
Received: by outflank-mailman (input) for mailman id 328488;
 Fri, 13 May 2022 14:26:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oDqO=VV=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1npWFQ-0004sc-UP
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 14:26:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abf708a6-d2c8-11ec-b8b8-f95467ff1ed0;
 Fri, 13 May 2022 16:26:27 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B51AE62154;
 Fri, 13 May 2022 14:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49D0C34115;
 Fri, 13 May 2022 14:26:24 +0000 (UTC)
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
X-Inumbo-ID: abf708a6-d2c8-11ec-b8b8-f95467ff1ed0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1652451985;
	bh=LAW3oRY7WSoDZ6V/paLZpl/L6DCV49O7Hv7830ybxPM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GXyDhOiiJRccrS99PCIsAaKHP9Sfl/W3GtF8OHGZsFeNJgYw2vkdj9lmReCuZSkNW
	 25YoqfN66gr42evUIl7QNmeNuCH8IypHBLMZpk/+Qzxuxtc4VAsZSMj+3y3daylWvL
	 POShwnNedeIhzgznHSIRDIqrnyaAvDkMlZKy4y9k=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org,
	Masami Hiramatsu <mhiramat@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>,
	x86@kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Ingo Molnar <mingo@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Borislav Petkov <bp@alien8.de>,
	xen-devel@lists.xenproject.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Maximilian Heyne <mheyne@amazon.de>
Subject: [PATCH 5.4 10/18] x86/asm: Allow to pass macros to __ASM_FORM()
Date: Fri, 13 May 2022 16:23:36 +0200
Message-Id: <20220513142229.456082257@linuxfoundation.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513142229.153291230@linuxfoundation.org>
References: <20220513142229.153291230@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Masami Hiramatsu <mhiramat@kernel.org>

commit f7919fd943abf0c77aed4441ea9897a323d132f5 upstream.

Use __stringify() at __ASM_FORM() so that user can pass
code including macros to __ASM_FORM().

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: x86@kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Link: https://lkml.kernel.org/r/156777562873.25081.2288083344657460959.stgit@devnote2
Signed-off-by: Maximilian Heyne <mheyne@amazon.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/x86/include/asm/asm.h |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

--- a/arch/x86/include/asm/asm.h
+++ b/arch/x86/include/asm/asm.h
@@ -7,9 +7,11 @@
 # define __ASM_FORM_RAW(x)     x
 # define __ASM_FORM_COMMA(x) x,
 #else
-# define __ASM_FORM(x)	" " #x " "
-# define __ASM_FORM_RAW(x)     #x
-# define __ASM_FORM_COMMA(x) " " #x ","
+#include <linux/stringify.h>
+
+# define __ASM_FORM(x)	" " __stringify(x) " "
+# define __ASM_FORM_RAW(x)     __stringify(x)
+# define __ASM_FORM_COMMA(x) " " __stringify(x) ","
 #endif
 
 #ifndef __x86_64__



