Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 586E823A0A2
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 10:07:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2VUT-00022x-4v; Mon, 03 Aug 2020 08:06:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k2VUR-00022s-O4
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 08:06:35 +0000
X-Inumbo-ID: 3f0b2488-d560-11ea-af03-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f0b2488-d560-11ea-af03-12813bfff9fa;
 Mon, 03 Aug 2020 08:06:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ADDD0ABA2;
 Mon,  3 Aug 2020 08:06:48 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libxl: avoid golang building without CONFIG_GOLANG=y
Message-ID: <e8dd70a7-bdde-e12a-3f4d-f52e58016234@suse.com>
Date: Mon, 3 Aug 2020 10:06:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

While this doesn't address the real problem I've run into (attempting to
update r/o source files), not recursing into tools/golang/xenlight/ is
enough to fix the build for me for the moment. I don't currently see why
60db5da62ac0 ("libxl: Generate golang bindings in libxl Makefile") found
it necessary to invoke this build step unconditionally.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm also having trouble to see why, besides the idl-gen target in
tools/golang/xenlight/Makefile, the commit also adds such a target to
(and mentions it in [only] a comment in) tools/libxl/Makefile.

--- a/tools/libxl/Makefile
+++ b/tools/libxl/Makefile
@@ -282,7 +282,9 @@ _libxl_type%.h _libxl_type%_json.h _libx
 # about races with tools/golang/xenlight/Makefile:all
 .PHONY: idl-external
 idl-external:
+ifeq ($(CONFIG_GOLANG),y)
 	$(MAKE) -C $(XEN_ROOT)/tools/golang/xenlight idl-gen
+endif
 
 LIBXL_IDLGEN_FILES = _libxl_types.h _libxl_types_json.h _libxl_types_private.h _libxl_types.c \
 	_libxl_types_internal.h _libxl_types_internal_json.h _libxl_types_internal_private.h _libxl_types_internal.c

