Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B8F2DFE2D
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 17:50:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57444.100486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krOO0-0000qD-9i; Mon, 21 Dec 2020 16:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57444.100486; Mon, 21 Dec 2020 16:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krOO0-0000po-6J; Mon, 21 Dec 2020 16:50:16 +0000
Received: by outflank-mailman (input) for mailman id 57444;
 Mon, 21 Dec 2020 16:50:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DEM5=FZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krONx-0000pj-RG
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 16:50:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a99d8327-aa16-49db-8bc6-dfbf70236ede;
 Mon, 21 Dec 2020 16:50:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 30411AD09;
 Mon, 21 Dec 2020 16:50:12 +0000 (UTC)
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
X-Inumbo-ID: a99d8327-aa16-49db-8bc6-dfbf70236ede
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608569412; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=enTm/9GB+OWX/0sqZW9UDys9X+JqSoosCB3Lsl9kzrE=;
	b=llGHLVyxl/6Q5QCXcoGyNxU78N36cEi2AZ3DFJhz0yipajQh7vB0jUGi9vBqdHo8G9k5Wl
	8CUwmEECclbQezMcuOUI2I218oRGcbQnAQojhhWdIStx1ncCzJySmQSh9IEs3NfIwJU/pC
	j3lYhcmyBPR0mItVp6Qs3WqKUR5GuxQ=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/Intel: insert Tiger Lake model numbers
Message-ID: <97963ff7-e37e-693b-5c02-a4f99669ccbe@suse.com>
Date: Mon, 21 Dec 2020 17:50:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Both match prior generation processors as far as LBR and C-state MSRs
go (SDM rev 073). The if_pschange_mc erratum, according to the spec
update, is not applicable.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -183,6 +183,9 @@ static void do_get_hw_residencies(void *
     /* Ice Lake */
     case 0x7D:
     case 0x7E:
+    /* Tiger Lake */
+    case 0x8C:
+    case 0x8D:
     /* Kaby Lake */
     case 0x8E:
     case 0x9E:
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2436,6 +2436,12 @@ static bool __init has_if_pschange_mc(vo
         return true;
 
         /*
+         * Newer Core processors are not vulnerable.
+         */
+    case 0x8c: /* Tiger Lake */
+    case 0x8d: /* Tiger Lake */
+
+        /*
          * Atom processors are not vulnerable.
          */
     case 0x1c: /* Pineview */
@@ -2776,6 +2782,8 @@ static const struct lbr_info *last_branc
         case 0x7a:
         /* Ice Lake */
         case 0x7d: case 0x7e:
+        /* Tiger Lake */
+        case 0x8c: case 0x8d:
         /* Tremont */
         case 0x86:
         /* Kaby Lake */

