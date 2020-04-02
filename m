Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0536F19BEDA
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 11:46:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJwNf-0006Pj-8w; Thu, 02 Apr 2020 09:43:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ugol=5S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJwNd-0006Pe-UW
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 09:43:21 +0000
X-Inumbo-ID: 6316493e-74c6-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6316493e-74c6-11ea-9e09-bc764e2007e4;
 Thu, 02 Apr 2020 09:43:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 58B99AB8F;
 Thu,  2 Apr 2020 09:43:19 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: inherit HOSTCC when building 32-bit harness on
 64-bit host
Message-ID: <842a0920-60ed-cf51-7f6c-37af40173160@suse.com>
Date: Thu, 2 Apr 2020 11:43:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

We're deliberately bringing XEN_COMPILE_ARCH and XEN_TARGET_ARCH out of
sync in this case, and hence HOSTCC won't get set from CC. Therefore
without this addition HOSTCC would not match a possible make command
line override of CC, but default to "gcc", likely causing the build to
fail for test_x86_emulator.c on systems with too old a gcc.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -268,7 +268,7 @@ install uninstall:
 ifeq ($(XEN_COMPILE_ARCH),x86_64)
 run32: $(addsuffix .h,$(TESTCASES)) $(addsuffix -opmask.h,$(OPMASK))
 run32 clean32: %32:
-	$(MAKE) -C 32 $*
+	$(MAKE) -C 32 HOSTCC=$(HOSTCC) $*
 clean: clean32
 else
 run32 clean32: %32: %

