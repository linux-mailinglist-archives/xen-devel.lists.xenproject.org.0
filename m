Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B34093510D4
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 10:28:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104148.198850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRsgS-0003tL-BC; Thu, 01 Apr 2021 08:28:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104148.198850; Thu, 01 Apr 2021 08:28:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRsgS-0003sw-7r; Thu, 01 Apr 2021 08:28:08 +0000
Received: by outflank-mailman (input) for mailman id 104148;
 Thu, 01 Apr 2021 08:28:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRsgQ-0003sr-HL
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 08:28:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7c79b19-9747-4feb-9a33-9e1ea16f3f9e;
 Thu, 01 Apr 2021 08:28:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C85F7AE86;
 Thu,  1 Apr 2021 08:28:04 +0000 (UTC)
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
X-Inumbo-ID: d7c79b19-9747-4feb-9a33-9e1ea16f3f9e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617265684; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cWIQ6va35/HadgSZsBXIRMGX3zL3qfKRBRXkkpIfliA=;
	b=sDhUkmNTd5oIFSOkfnM/qYhVwfDqGgi6ca3UIvXBfw03d9pzwOogDm0nwsIJrXhHzEJ2qN
	JFk5Jw1KWP2e8S7DknCSqrPrPLbiiQP0grYWl+uy+QCVSXp1aePFXYaDiWeQu5WOj/pFhe
	7CGcpg3a1U1Ek0TqY689BwOfYExedaw=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/ucode: log blob date also for AMD
Message-ID: <a236ef77-e6ef-5cbe-60a0-49c8dcd9a208@suse.com>
Date: Thu, 1 Apr 2021 10:28:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Like Intel, AMD also records the date in their blobs. The field was
merely misnamed as "data_code" so far; this was perhaps meant to be
"date_code". Split it into individual fields, just like we did for Intel
some time ago, and extend the message logged after a successful update.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -33,7 +33,9 @@ struct equiv_cpu_entry {
 };
 
 struct microcode_patch {
-    uint32_t data_code;
+    uint16_t year;
+    uint8_t  day;
+    uint8_t  month;
     uint32_t patch_id;
     uint8_t  mc_patch_data_id[2];
     uint8_t  mc_patch_data_len;
@@ -251,8 +253,9 @@ static int apply_microcode(const struct
         return -EIO;
     }
 
-    printk(XENLOG_WARNING "microcode: CPU%u updated from revision %#x to %#x\n",
-           cpu, old_rev, rev);
+    printk(XENLOG_WARNING
+           "microcode: CPU%u updated from revision %#x to %#x, date = %04x-%02x-%02x\n",
+           cpu, old_rev, rev, patch->year, patch->month, patch->day);
 
     return 0;
 }

