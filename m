Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE00923D847
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 11:05:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3bpt-0008BA-I2; Thu, 06 Aug 2020 09:05:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gxiU=BQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3bps-0008B2-9j
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 09:05:16 +0000
X-Inumbo-ID: 30b871ee-f5b2-49bf-980a-550ffac0fff5
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30b871ee-f5b2-49bf-980a-550ffac0fff5;
 Thu, 06 Aug 2020 09:05:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 12D80AC50;
 Thu,  6 Aug 2020 09:05:32 +0000 (UTC)
Subject: [PATCH 2/4] build: correctly report non-empty section sizes upon .o
 -> .init.o conversion
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <305c2532-408a-9f78-61fe-c90a2e86eb8e@suse.com>
Message-ID: <5fcb47ec-4a0e-99a2-c548-f42ec1cc8030@suse.com>
Date: Thu, 6 Aug 2020 11:05:17 +0200
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
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The originally used sed expression converted not just multiple leading
zeroes (as intended), but also trailing ones, rendering the error
message somewhat confusing. Collapse zeroes in just the one place where
we need them collapsed, and leave objdump's output as is for all other
purposes.

Fixes: 48115d14743e ("Move more kernel decompression bits to .init.* sections")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -185,11 +185,11 @@ cmd_cc_o_S = $(CC) $(a_flags) -c $< -o $
 
 quiet_cmd_obj_init_o = INIT_O  $@
 define cmd_obj_init_o
-    $(OBJDUMP) -h $< | sed -n '/[0-9]/{s,00*,0,g;p;}' | while read idx name sz rest; do \
+    $(OBJDUMP) -h $< | while read idx name sz rest; do \
         case "$$name" in \
         .*.local) ;; \
         .text|.text.*|.data|.data.*|.bss) \
-            test $$sz != 0 || continue; \
+            test $$(echo $$sz | sed 's,00*,0,') != 0 || continue; \
             echo "Error: size of $<:$$name is 0x$$sz" >&2; \
             exit $$(expr $$idx + 1);; \
         esac; \

