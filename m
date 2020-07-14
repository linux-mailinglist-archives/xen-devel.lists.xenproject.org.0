Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 698D821EAF4
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2020 10:07:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvFxc-0003Tc-O4; Tue, 14 Jul 2020 08:06:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bg5W=AZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvFxb-0003TX-CG
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2020 08:06:43 +0000
X-Inumbo-ID: f365284c-c5a8-11ea-8496-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f365284c-c5a8-11ea-8496-bc764e2007e4;
 Tue, 14 Jul 2020 08:06:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9D98AD76;
 Tue, 14 Jul 2020 08:06:43 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86emul: avoid assembler warning about .type not taking
 effect in test harness
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <42875d48-10e4-cc88-70ac-8979fea2493c@suse.com>
Date: Tue, 14 Jul 2020 10:06:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

gcc re-orders top level blocks by default when optimizing. This
re-ordering results in all our .type directives to get emitted to the
assembly file first, followed by gcc's. The assembler warns about
attempts to change the type of a symbol when it was already set (and
when there's no intervening setting to "notype").

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Refine description to no longer claim a gcc change to be the reason.

--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -295,4 +295,9 @@ x86-emulate.o cpuid.o test_x86_emulator.
 x86-emulate.o: x86_emulate/x86_emulate.c
 x86-emulate.o: HOSTCFLAGS += -D__XEN_TOOLS__
 
+# In order for our custom .type assembler directives to reliably land after
+# gcc's, we need to keep it from re-ordering top-level constructs.
+$(call cc-option-add,HOSTCFLAGS-toplevel,HOSTCC,-fno-toplevel-reorder)
+test_x86_emulator.o: HOSTCFLAGS += $(HOSTCFLAGS-toplevel)
+
 test_x86_emulator.o: $(addsuffix .h,$(TESTCASES)) $(addsuffix -opmask.h,$(OPMASK))

