Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2C81BF550
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 12:25:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU6NJ-00060G-VM; Thu, 30 Apr 2020 10:25:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jU6NI-000604-3x
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 10:25:00 +0000
X-Inumbo-ID: d790ebd6-8acc-11ea-9a1c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d790ebd6-8acc-11ea-9a1c-12813bfff9fa;
 Thu, 30 Apr 2020 10:24:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0C697AC5B;
 Thu, 30 Apr 2020 10:24:56 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/EFI: correct section offsets in mkreloc diagnostics
Message-ID: <5708d246-694a-424f-0998-261f26ccd118@suse.com>
Date: Thu, 30 Apr 2020 12:24:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
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

These are more helpful if they point at the address where the relocated
value starts, rather than at the specific byte of the difference.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/efi/mkreloc.c
+++ b/xen/arch/x86/efi/mkreloc.c
@@ -238,7 +238,7 @@ static void diff_sections(const unsigned
             fprintf(stderr,
                     "Difference at %.8s:%08" PRIxFAST32 " is %#" PRIxFAST64
                     " (expected %#" PRIxFAST64 ")\n",
-                    sec->name, i, delta, diff);
+                    sec->name, i - disp, delta, diff);
             continue;
         }
         if ( width == 8 && (val1.u64 < base || val1.u64 > end) )
@@ -263,14 +263,14 @@ static void diff_sections(const unsigned
         {
             fprintf(stderr,
                     "Cannot handle decreasing RVA (at %.8s:%08" PRIxFAST32 ")\n",
-                    sec->name, i);
+                    sec->name, i - disp);
             exit(3);
         }
 
         if ( !(sec->flags & COFF_SECTION_WRITEABLE) )
             fprintf(stderr,
                     "Warning: relocation to r/o section %.8s:%08" PRIxFAST32 "\n",
-                    sec->name, i);
+                    sec->name, i - disp);
 
         printf("\t.word (%u << 12) | 0x%03" PRIxFAST32 "\n",
                reloc, sec->rva + i - disp - rva);

