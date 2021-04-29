Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CFB36EB2E
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 15:10:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119987.226864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc6Qk-00015a-R3; Thu, 29 Apr 2021 13:10:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119987.226864; Thu, 29 Apr 2021 13:10:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc6Qk-00015B-O9; Thu, 29 Apr 2021 13:10:10 +0000
Received: by outflank-mailman (input) for mailman id 119987;
 Thu, 29 Apr 2021 13:10:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfjL=J2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lc6Qj-000154-Hm
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 13:10:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57ebc86c-7861-4f11-baf3-d3c0bd0e841c;
 Thu, 29 Apr 2021 13:10:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 44ED5B12E;
 Thu, 29 Apr 2021 13:10:07 +0000 (UTC)
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
X-Inumbo-ID: 57ebc86c-7861-4f11-baf3-d3c0bd0e841c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619701807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3k+xAgvQZtJpxfl3IYt7nqtMgLjyZZ2LoR7FStHB82k=;
	b=Le3PWrken0cEVs2Q+FgPVAceMIZKGAfJutSJh62jPcpFRqw1p7HNreE7n9VVm9AXctIL83
	qTjsgFFIG85JrQDfasiLZyIpI6Kd061rNo9E2qQx284XO4bb0QuWOD3nWjOr3o2ne5DvIb
	ekpDDjz9GTg9jZx6G3L1ddDgkhYLACs=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Luca Fancellu <luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] public/gnttab: relax v2 recommendation
Message-ID: <dcd9ede1-9471-6866-4ba7-b6a7664b5e35@suse.com>
Date: Thu, 29 Apr 2021 15:10:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

With there being a way to disable v2 support, telling new guests to use
v2 exclusively is not a good suggestion.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/public/grant_table.h
+++ b/xen/include/public/grant_table.h
@@ -121,8 +121,10 @@ typedef uint32_t grant_ref_t;
  */
 
 /*
- * Version 1 of the grant table entry structure is maintained purely
- * for backwards compatibility.  New guests should use version 2.
+ * Version 1 of the grant table entry structure is maintained largely for
+ * backwards compatibility.  New guests are recommended to support using
+ * version 2 to overcome version 1 limitations, but to be able to fall back
+ * to version 1.
  */
 #if __XEN_INTERFACE_VERSION__ < 0x0003020a
 #define grant_entry_v1 grant_entry

