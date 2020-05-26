Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A9E1E1B8E
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 08:51:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdTPW-0004j3-CB; Tue, 26 May 2020 06:50:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jdTPU-0004bY-TJ
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 06:50:00 +0000
X-Inumbo-ID: 1dc7f20c-9f1d-11ea-af76-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1dc7f20c-9f1d-11ea-af76-12813bfff9fa;
 Tue, 26 May 2020 06:49:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 27FA1AD4D;
 Tue, 26 May 2020 06:50:01 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: extend coverage of HLE "bad page" workaround
Message-ID: <b238f66d-37a9-3080-4f2b-90225ea17102@suse.com>
Date: Tue, 26 May 2020 08:49:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Respective Core Gen10 processor lines are affected, too.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6045,6 +6045,8 @@ const struct platform_bad_page *__init g
     case 0x000506e0: /* errata SKL167 / SKW159 */
     case 0x000806e0: /* erratum KBL??? */
     case 0x000906e0: /* errata KBL??? / KBW114 / CFW103 */
+    case 0x000a0650: /* erratum Core Gen10 U/H/S 101 */
+    case 0x000a0660: /* erratum Core Gen10 U/H/S 101 */
         *array_size = (cpuid_eax(0) >= 7 && !cpu_has_hypervisor &&
                        (cpuid_count_ebx(7, 0) & cpufeat_mask(X86_FEATURE_HLE)));
         return &hle_bad_page;

