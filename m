Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B64812BAA65
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 13:46:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32136.63075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg5n7-0004sP-7q; Fri, 20 Nov 2020 12:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32136.63075; Fri, 20 Nov 2020 12:45:29 +0000
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
	id 1kg5n7-0004rz-4D; Fri, 20 Nov 2020 12:45:29 +0000
Received: by outflank-mailman (input) for mailman id 32136;
 Fri, 20 Nov 2020 12:45:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kg5n5-0004rs-Hw
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 12:45:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e90de5e-eadb-499a-b01a-e402c7c062e9;
 Fri, 20 Nov 2020 12:45:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 12743ABD6;
 Fri, 20 Nov 2020 12:45:26 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kg5n5-0004rs-Hw
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 12:45:27 +0000
X-Inumbo-ID: 3e90de5e-eadb-499a-b01a-e402c7c062e9
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3e90de5e-eadb-499a-b01a-e402c7c062e9;
	Fri, 20 Nov 2020 12:45:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605876326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H7PHzkAOiCeSpzSd3mLSic9jVidXunJJhK7mu+ZIVNI=;
	b=aV4LmXmI3EUk38/E7y4qXGlwgF1Bh/heM1LyA3UhI2FtOrZW4XECD8f6f6Ab65RBwIOKrm
	uSmQ09kApC0mNZDetupLylvp2oRMmKuQtRSGJvIx3pFLprj1M6ZUE+sXl/UB+JBq4w+d2h
	YJbvUD0fVQpwhgjwhzUp+hcEOm96ZBk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 12743ABD6;
	Fri, 20 Nov 2020 12:45:26 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: E801 memory "map" use implies no ACPI
Message-ID: <18ca8671-1478-3dc8-7b91-041dbc18829f@suse.com>
Date: Fri, 20 Nov 2020 13:45:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

ACPI mandates use of E820 (or newer, e.g. EFI), and in fact firmware
has been observed to include E820_ACPI ranges in what E801 reports as
available (really "configured") memory.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: Alternatively we could drop all use of E801 (and older), since
     there shouldn't be any 64-bit systems not supporting the more
     modern E820.

--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -74,7 +74,7 @@ bool __read_mostly use_invpcid;
 unsigned long __read_mostly cr4_pv32_mask;
 
 /* **** Linux config option: propagated to domain0. */
-/* "acpi=off":    Sisables both ACPI table parsing and interpreter. */
+/* "acpi=off":    Disables both ACPI table parsing and interpreter. */
 /* "acpi=force":  Override the disable blacklist.                   */
 /* "acpi=ht":     Limit ACPI just to boot-time to enable HT.        */
 /* "acpi=noirq":  Disables ACPI interrupt routing.                  */
@@ -1069,6 +1069,7 @@ void __init noreturn __start_xen(unsigne
         e820_raw.map[1].size = bootsym(highmem_kb) << 10;
         e820_raw.map[1].type = E820_RAM;
         e820_raw.nr_map = 2;
+        disable_acpi();
     }
     else if ( mbi->flags & MBI_MEMLIMITS )
     {
@@ -1080,6 +1081,7 @@ void __init noreturn __start_xen(unsigne
         e820_raw.map[1].size = mbi->mem_upper << 10;
         e820_raw.map[1].type = E820_RAM;
         e820_raw.nr_map = 2;
+        disable_acpi();
     }
     else
         panic("Bootloader provided no memory information\n");

