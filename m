Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D73216926
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 11:35:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsk0c-0007VL-NK; Tue, 07 Jul 2020 09:35:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kqME=AS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jsk0b-0007Uf-Dm
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 09:35:25 +0000
X-Inumbo-ID: 2ef7305e-c035-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ef7305e-c035-11ea-bb8b-bc764e2007e4;
 Tue, 07 Jul 2020 09:35:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4DDC3AFB8;
 Tue,  7 Jul 2020 09:35:24 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: avoid assembler warning about .type not taking
 effect in test harness
Message-ID: <4a0f9e7d-53f1-b77f-e8a9-a75483884a6f@suse.com>
Date: Tue, 7 Jul 2020 11:35:23 +0200
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

gcc 9.3 started to re-order top level blocks by default when optimizing.
This re-ordering results in all our .type directives to get emitted to
the assembly file first, followed by gcc's. The assembler warns about
attempts to change the type of a symbol when it was already set (and
when there's no intervening setting to "notype").

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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

