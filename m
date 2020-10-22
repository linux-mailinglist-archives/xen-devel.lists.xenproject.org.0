Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EF329602E
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 15:39:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10448.27767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVao9-0003hO-Au; Thu, 22 Oct 2020 13:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10448.27767; Thu, 22 Oct 2020 13:39:09 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVao9-0003gy-6J; Thu, 22 Oct 2020 13:39:09 +0000
Received: by outflank-mailman (input) for mailman id 10448;
 Thu, 22 Oct 2020 13:39:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVao7-0003gm-Kp
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 13:39:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f973e6e-8983-43d6-8fe1-87ad82c7804e;
 Thu, 22 Oct 2020 13:39:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4280FB03F;
 Thu, 22 Oct 2020 13:39:06 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVao7-0003gm-Kp
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 13:39:07 +0000
X-Inumbo-ID: 0f973e6e-8983-43d6-8fe1-87ad82c7804e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0f973e6e-8983-43d6-8fe1-87ad82c7804e;
	Thu, 22 Oct 2020 13:39:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603373946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3rDg9DSkuthC0rT6ckEwlAGdxHgxfASCErG7/P8qjFw=;
	b=SY7znojBY9fgniVHDfLv79vUMhdPibcCvRv22SzYo0p+hvE3RxBOzEvVkbkCTyRRCB0MuQ
	CNnCXaqrUPnM8KpbDXhKRL/knUTIE26VqaH6TpZmrjmEj+dk6pyYKPsOh3gU7+QVNX2Q3+
	GLKiqojGUHzHjepj+t3LfYEvgCy4gQ0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4280FB03F;
	Thu, 22 Oct 2020 13:39:06 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: increase FPU save area in test harness/fuzzer
Message-ID: <adb5abbd-be50-82ba-c85d-c47024acc47c@suse.com>
Date: Thu, 22 Oct 2020 15:39:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Running them on a system (or emulator) with AMX support requires this
to be quite a bit larger than 8k, to avoid triggering the assert() in
emul_test_init(). Bump all the way up to 16k right away.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Intel's Software Development Emulator properly reports XSAVE-related AMX
CPUID data for Sapphire Rapids emulation as of 8.59.0.

--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -33,7 +33,7 @@
 uint32_t mxcsr_mask = 0x0000ffbf;
 struct cpuid_policy cp;
 
-static char fpu_save_area[4096] __attribute__((__aligned__((64))));
+static char fpu_save_area[0x4000] __attribute__((__aligned__((64))));
 static bool use_xsave;
 
 /*

