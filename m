Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C5C303987
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 10:53:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74763.134411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4L2J-0001sG-TE; Tue, 26 Jan 2021 09:53:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74763.134411; Tue, 26 Jan 2021 09:53:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4L2J-0001rp-PW; Tue, 26 Jan 2021 09:53:23 +0000
Received: by outflank-mailman (input) for mailman id 74763;
 Tue, 26 Jan 2021 09:53:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4L2I-0001rV-It
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 09:53:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ab18644-5c73-4252-9397-d0191bea755f;
 Tue, 26 Jan 2021 09:53:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 23552AC4F;
 Tue, 26 Jan 2021 09:53:21 +0000 (UTC)
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
X-Inumbo-ID: 9ab18644-5c73-4252-9397-d0191bea755f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611654801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LQlclHoS+nUGybmGYXjRPm/SPP0Rd+6eAGn+tH7nB2g=;
	b=PJ74bLu93lWq5+OIfl5PcZA8O9IDrhjfvoE3PrNS7nHvTCRPzmdEPHLH2n6WKzFpzcWoPB
	CLaS6DKQCHiDk5A5bq7BCqUYNTVmNChKIhWUCZlzFW/482kPiMlMZV/wAyZFBiWI6rNC2v
	VZtarnrhP9gv4/SSlT4YJIj5kFdTUkY=
Subject: [PATCH v3 14/15] xen/decompress: drop STATIC and INIT
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Message-ID: <b9410d49-8767-a6f2-ccbe-c94e451c60ba@suse.com>
Date: Tue, 26 Jan 2021 10:53:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

All users have been removed in earlier changes.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/arch/arm/efi/efi-dom0.c
+++ b/xen/arch/arm/efi/efi-dom0.c
@@ -28,7 +28,7 @@
 #include <asm/setup.h>
 #include <asm/acpi.h>
 #include "../../../common/decompress.h"
-#define XZ_EXTERN STATIC
+#define XZ_EXTERN static
 #include "../../../common/xz/crc32.c"
 
 /* Constant to indicate "Xen" in unicode u16 format */
--- a/xen/common/decompress.h
+++ b/xen/common/decompress.h
@@ -7,9 +7,6 @@
 #include <xen/types.h>
 #include <xen/xmalloc.h>
 
-#define STATIC static
-#define INIT __init
-
 #define malloc xmalloc_bytes
 #define free xfree
 
@@ -18,9 +15,6 @@
 
 #else
 
-#define STATIC static
-#define INIT
-
 #undef __init /* tools/libs/guest/xg_private.h has its own one */
 #define __init
 #define __initdata


