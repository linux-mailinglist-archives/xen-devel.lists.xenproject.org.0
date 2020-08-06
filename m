Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC98C23D844
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 11:04:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3bpN-00087P-8n; Thu, 06 Aug 2020 09:04:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gxiU=BQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3bpL-00087H-PO
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 09:04:43 +0000
X-Inumbo-ID: e331891c-c29d-4291-932e-303f8e4e7829
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e331891c-c29d-4291-932e-303f8e4e7829;
 Thu, 06 Aug 2020 09:04:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 577F1AD88;
 Thu,  6 Aug 2020 09:04:59 +0000 (UTC)
Subject: [PATCH 1/4] build: work around bash issue
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <305c2532-408a-9f78-61fe-c90a2e86eb8e@suse.com>
Message-ID: <b427e8e6-b9ff-65d2-074b-19439a2e3d02@suse.com>
Date: Thu, 6 Aug 2020 11:04:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <305c2532-408a-9f78-61fe-c90a2e86eb8e@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Older bash fails to honor "set -e" for certain built-in commands
("while" here), despite the command's status correctly bein non-zero.
The subsequent objcopy invocation now being separated by a semicolon
results in no failure. Insert an explicit "exit" (replacing ; by &&
ought to be another possible workaround).

Fixes: e321576f4047 ("xen/build: start using if_changed")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I've done a pretty light-weight audit of possible further instances of
this issue, but didn't find any.

--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -193,7 +193,7 @@ define cmd_obj_init_o
             echo "Error: size of $<:$$name is 0x$$sz" >&2; \
             exit $$(expr $$idx + 1);; \
         esac; \
-    done; \
+    done || exit $$?; \
     $(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=.init.$(s)) $< $@
 endef
 


