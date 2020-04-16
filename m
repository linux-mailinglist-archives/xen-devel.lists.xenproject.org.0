Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE8C1AC0DC
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 14:15:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP3Pe-0002NO-Mf; Thu, 16 Apr 2020 12:14:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jP3Pd-0002NJ-7O
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 12:14:33 +0000
X-Inumbo-ID: d324d632-7fdb-11ea-8b7c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d324d632-7fdb-11ea-8b7c-12813bfff9fa;
 Thu, 16 Apr 2020 12:14:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CF5BDAC6D;
 Thu, 16 Apr 2020 12:14:30 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: SYSRET must change CPL
Message-ID: <d193babc-9afa-7cff-13f4-532e62d5e3e6@suse.com>
Date: Thu, 16 Apr 2020 14:14:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
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

The special AMD behavior of leaving SS mostly alone wasn't really
complete: We need to adjust CPL aka SS.DPL.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6022,6 +6022,8 @@ x86_emulate(
 
             /* There's explicitly no RPL adjustment here. */
             sreg.sel = (msr_val >> 48) + 8;
+            /* But DPL needs adjustment, for the new CPL to be correct. */
+            sreg.dpl = 3;
         }
 
 #ifdef __x86_64__

