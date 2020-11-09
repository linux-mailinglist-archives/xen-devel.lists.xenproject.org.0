Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4204B2AB582
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 11:53:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22361.48647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc4np-00011y-J8; Mon, 09 Nov 2020 10:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22361.48647; Mon, 09 Nov 2020 10:53:37 +0000
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
	id 1kc4np-00011Z-Fq; Mon, 09 Nov 2020 10:53:37 +0000
Received: by outflank-mailman (input) for mailman id 22361;
 Mon, 09 Nov 2020 10:53:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kc4no-00011U-7P
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 10:53:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61f1e0b8-92dd-477f-babd-6d197ab52dc3;
 Mon, 09 Nov 2020 10:53:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DE761AD6D;
 Mon,  9 Nov 2020 10:53:33 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=a0OZ=EP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kc4no-00011U-7P
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 10:53:36 +0000
X-Inumbo-ID: 61f1e0b8-92dd-477f-babd-6d197ab52dc3
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 61f1e0b8-92dd-477f-babd-6d197ab52dc3;
	Mon, 09 Nov 2020 10:53:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604919214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dIi1qxwUZQ0BiQH3jv2IR7dBQoVEGhHSp8IsqYfVSKM=;
	b=fQfb6yJenalkGZ055BOtocobl1eskuM76KJd0zx+u3QDvnNu/oZNxGwfvYxTcK1LwT71db
	qDga/k39vGWF8dP53fODKKX9YNOSKrH9YKBL7ZIYSG38Mx2SoRx3W5tLcvQB5VQmXQK8Ay
	fQ3mbQ6HZibD2Tr+u6AuIArQVOL1Bhg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DE761AD6D;
	Mon,  9 Nov 2020 10:53:33 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/CPUID: don't use UB shift when library is built as 32-bit
Message-ID: <b579bde8-6cd2-0407-f098-c44e1c9ff814@suse.com>
Date: Mon, 9 Nov 2020 11:53:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

At least the insn emulator test harness will continue to be buildable
(and ought to continue to be usable) also as a 32-bit binary. (Right now
the CPU policy test harness is, too, but there it may be less relevant
to keep it functional, just like e.g. we don't support fuzzing the insn
emulator in 32-bit mode.) Hence the library code needs to cope with
this.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -165,7 +165,7 @@ void x86_cpuid_policy_fill_native(struct
         for ( i = 2; i < min_t(unsigned int, 63,
                                ARRAY_SIZE(p->xstate.raw)); ++i )
         {
-            if ( xstates & (1ul << i) )
+            if ( xstates & (1ull << i) )
                 cpuid_count_leaf(0xd, i, &p->xstate.raw[i]);
         }
     }

