Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 808882D31DC
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 19:14:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47643.84321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmhUr-0001MZ-5Q; Tue, 08 Dec 2020 18:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47643.84321; Tue, 08 Dec 2020 18:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmhUr-0001MA-22; Tue, 08 Dec 2020 18:13:57 +0000
Received: by outflank-mailman (input) for mailman id 47643;
 Tue, 08 Dec 2020 18:13:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PeDt=FM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kmhUo-0001M3-U3
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 18:13:55 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ac12206-8299-4f02-b026-7822e2f62b52;
 Tue, 08 Dec 2020 18:13:53 +0000 (UTC)
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
X-Inumbo-ID: 2ac12206-8299-4f02-b026-7822e2f62b52
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607451233;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=1UlGM2EOezoYIsIyrb55OTD5yfyLUv4TkoosVZ95/Ug=;
  b=J4XNme2qhHfnk9YUXZe30fUhT8jhUiTLu0i5DgDKcXfmhfI95ampBeJh
   ixjjKYFTMlV7gMICE9jOMsLPO5jmOxkXGNZRFkMUDG7tPt4zByvGfm/o/
   uYjO3E+mOXRWRycnsND+jc0saWxqLr4uc/YikZP1NTeWCTLOgqukLfuzi
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Byvv2QzLHlJxhCFcpxGzw5URdeBF5RrE7os7/Ao9YUw3cfEl4t+FeGVnn80G7eBefMtINbOfTI
 17cmhQO6geRiTPa6I/hrSWW0SmrTTkUTggsY276R69CyLg7uDIXCn9uCEegwo7IvsCh/pCRGaJ
 JZSqKH89QLDQZOn5VT9AaRUfRIdo+inXFE+BxQMrpTc/lH6VfDTgJS1gOoEvQFJBvkLUODcYXO
 5S7n7LyX2zDaRtZZkN0bcf+53bevav2mBTNwIkb6W2fUNtBKB5J9+qdun1w6GL0F0ppV+v+Yrk
 6xI=
X-SBRS: 5.1
X-MesageID: 33020474
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,403,1599537600"; 
   d="scan'208";a="33020474"
Subject: Re: dom0 PV looping on search_pre_exception_table()
To: Manuel Bouyer <bouyer@antioche.eu.org>, <xen-devel@lists.xenproject.org>
References: <20201208175738.GA3390@antioche.eu.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e73cc71d-c1a6-87c8-1b82-5d70d4f52eaa@citrix.com>
Date: Tue, 8 Dec 2020 18:13:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208175738.GA3390@antioche.eu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 08/12/2020 17:57, Manuel Bouyer wrote:
> Hello,
> for the first time I tried to boot a xen kernel from devel with
> a NetBSD PV dom0. The kernel boots, but when the first userland prcess
> is launched, it seems to enter a loop involving search_pre_exception_table()
> (I see an endless stream from the dprintk() at arch/x86/extable.c:202)
>
> With xen 4.13 I see it, but exactly once:
> (XEN) extable.c:202: Pre-exception: ffff82d08038c304 -> ffff82d08038c8c8
>
> with devel:
> (XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
> (XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
> (XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
> (XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
> (XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
> [...]
>
> the dom0 kernel is the same.
>
> At first glance it looks like a fault in the guest is not handled at it should,
> and the userland process keeps faulting on the same address.
>
> Any idea what to look at ?

That is a reoccurring fault on IRET back to guest context, and is
probably caused by some unwise-in-hindsight cleanup which doesn't
escalate the failure to the failsafe callback.

This ought to give something useful to debug with:

~Andrew

diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
index 70972f1085..62a7bcbe38 100644
--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -191,6 +191,10 @@ static int __init stub_selftest(void)
 __initcall(stub_selftest);
 #endif
 
+#include <xen/sched.h>
+#include <xen/softirq.h>
+const char *vec_name(unsigned int vec);
+
 unsigned long
 search_pre_exception_table(struct cpu_user_regs *regs)
 {
@@ -199,7 +203,13 @@ search_pre_exception_table(struct cpu_user_regs *regs)
         __start___pre_ex_table, __stop___pre_ex_table-1, addr);
     if ( fixup )
     {
-        dprintk(XENLOG_INFO, "Pre-exception: %p -> %p\n", _p(addr),
_p(fixup));
+        printk(XENLOG_ERR "IRET fault: %s[%04x]\n",
+               vec_name(regs->entry_vector), regs->error_code);
+
+        domain_crash(current->domain);
+        for ( ;; )
+            do_softirq();
+
         perfc_incr(exception_fixed);
     }
     return fixup;
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 0459cee9fb..1059f3ce66 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -687,7 +687,7 @@ const char *trapstr(unsigned int trapnr)
     return trapnr < ARRAY_SIZE(strings) ? strings[trapnr] : "???";
 }
 
-static const char *vec_name(unsigned int vec)
+const char *vec_name(unsigned int vec)
 {
     static const char names[][4] = {
 #define P(x) [X86_EXC_ ## x] = "#" #x


