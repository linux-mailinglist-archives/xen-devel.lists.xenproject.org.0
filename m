Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 513632D4333
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 14:29:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48255.85317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmzWm-0000ij-SJ; Wed, 09 Dec 2020 13:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48255.85317; Wed, 09 Dec 2020 13:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmzWm-0000iN-Oz; Wed, 09 Dec 2020 13:29:08 +0000
Received: by outflank-mailman (input) for mailman id 48255;
 Wed, 09 Dec 2020 13:29:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NJeK=FN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kmzWl-0000iH-2S
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 13:29:07 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d68dc93-435d-48bb-90bd-8d414bcd9998;
 Wed, 09 Dec 2020 13:29:05 +0000 (UTC)
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
X-Inumbo-ID: 8d68dc93-435d-48bb-90bd-8d414bcd9998
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607520545;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to;
  bh=m4hcXQ+GHB8KUEuJp6QdskPIyy0LMVtgcFhjUc8O588=;
  b=DckOXCbJxTITU2HPKD70mBngrmTWhoN5J/1/xy9PPlUGIgd6ehj4UA59
   3qgeZjPXjqgQYNbev9+9obfqMpm7DMZGUNXJSHRHFkf4KKrIR6hq8dRXy
   4+puK8XN48RgT+SHZildEArCL3D/y/FUm3qf3DkJzcOYb/YHcbR1tIUuh
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: OAq9Zg151lthr0GY17a0abyNpoE/3JWRV9aUlX+BOdYJjaIpfpqb9T/1n57qJqdMX1k+VKhVIF
 iduC4APXAgh26ynvLO1QCjcY4LXbclhYtRKLtFZAnwgtK6qh1pX3hA7+TDdf3nwrqvV/gma0L+
 aKNktzrcyC4fVclmEfZHA+EXNK6Y3o6srqKM77PoJVS9Ppm3N018m+4XldoX/CUOfBJwa8JyLv
 dS67OWKTT1d0IOenttv3esfOhjeEaX87N4WQf0BZn9n/BS7ynYy6wsmtuVsqZ/5c0gf6e8a66P
 8JI=
X-SBRS: 5.2
X-MesageID: 32825861
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:49WMsqnKKjpR4sHbKdZUgvgZ3JDpDfOLimdD5ilNYBxZY6Wkvu
 qF9c516TbfjjENVHY83fWJP6edSX3RnKQFh7U5F7GkQQXgpS+UPJhvhLGSpAHINiXi+odmpM
 RdWodkDtmYNzlHpOb8pDK1CtMxhOSAmZrY4dv261dIYUVUZ7p77wF/Yzzrd3FeYAVdH5I2GN
 69y6N8xwaIQngcYsSlCnRtZYGqzLf2vanrbhIcCxks5BPmt12VwYX3DgSC2VMmWy5PqI1SiF
 TtqRDz5amorpiApyP06mm71fhrsef6xsAGLMKBjdV9EESPti+YIK5lW7GEoQkvpvCu5FsAgL
 D30mwdFvU2zWjQcGGzqQbs3Ael8A9G0Q6b9WOwhHHUocHpLQ8SAcApv+1kWxHe7Fctu8w51a
 pN0X6QuZY/N2KnoA324d/UWxZ20leluHZKq591s1VTWZYTAYUhzrA381hSFP47fR7S6IdiC+
 V2CdGZ+fA+SyL/U1ncsnN0yNKhGnQ/dy3nfmEHusiYlydbh2p4yUxw/r17ol4a+JgwS4ZJ6o
 3/W8wC/o1mVcMYYblwA+0MW6KMZFDlWh7QLHmUZU3uCaBvAQO1l7fs/L436Ou2EaZk8LIunv
 36PG9wqXQ/YAbnB8GIwfRwg3LwaXT4VzHsxsZC/oN+q73xSbH6WBfzM2wGgo+nuPUQAsrSRv
 a1NtZXGpbYXBPTJbo=
X-IronPort-AV: E=Sophos;i="5.78,405,1599537600"; 
   d="scan'208,223";a="32825861"
Subject: Re: dom0 PV looping on search_pre_exception_table()
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
References: <20201208175738.GA3390@antioche.eu.org>
 <e73cc71d-c1a6-87c8-1b82-5d70d4f52eaa@citrix.com>
 <20201209101512.GA1299@antioche.eu.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3f7e50bb-24ad-1e32-9ea1-ba87007d3796@citrix.com>
Date: Wed, 9 Dec 2020 13:28:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201209101512.GA1299@antioche.eu.org>
Content-Type: multipart/mixed;
	boundary="------------9EAEEE9A3F71311E771CA46C"
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

--------------9EAEEE9A3F71311E771CA46C
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 09/12/2020 10:15, Manuel Bouyer wrote:
> On Tue, Dec 08, 2020 at 06:13:46PM +0000, Andrew Cooper wrote:
>> On 08/12/2020 17:57, Manuel Bouyer wrote:
>>> Hello,
>>> for the first time I tried to boot a xen kernel from devel with
>>> a NetBSD PV dom0. The kernel boots, but when the first userland prcess
>>> is launched, it seems to enter a loop involving search_pre_exception_table()
>>> (I see an endless stream from the dprintk() at arch/x86/extable.c:202)
>>>
>>> With xen 4.13 I see it, but exactly once:
>>> (XEN) extable.c:202: Pre-exception: ffff82d08038c304 -> ffff82d08038c8c8
>>>
>>> with devel:
>>> (XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
>>> (XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
>>> (XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
>>> (XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
>>> (XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
>>> [...]
>>>
>>> the dom0 kernel is the same.
>>>
>>> At first glance it looks like a fault in the guest is not handled at it should,
>>> and the userland process keeps faulting on the same address.
>>>
>>> Any idea what to look at ?
>> That is a reoccurring fault on IRET back to guest context, and is
>> probably caused by some unwise-in-hindsight cleanup which doesn't
>> escalate the failure to the failsafe callback.
>>
>> This ought to give something useful to debug with:
> thanks, I got:
> (XEN) IRET fault: #PF[0000]                                                 
> (XEN) domain_crash called from extable.c:209                                
> (XEN) Domain 0 (vcpu#0) crashed on cpu#0:                                   
> (XEN) ----[ Xen-4.15-unstable  x86_64  debug=y   Tainted:   C   ]----       
> (XEN) CPU:    0                                                             
> (XEN) RIP:    0047:[<00007f7e184007d0>]                                     
> (XEN) RFLAGS: 0000000000000202   EM: 0   CONTEXT: pv guest (d0v0)           
> (XEN) rax: ffff82d04038c309   rbx: 0000000000000000   rcx: 000000000000e008 
> (XEN) rdx: 0000000000010086   rsi: ffff83007fcb7f78   rdi: 000000000000e010 
> (XEN) rbp: 0000000000000000   rsp: 00007f7fff53e3e0   r8:  0000000e00000000 
> (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000 
> (XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000000000 
> (XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 0000000000002660 
> (XEN) cr3: 0000000079cdb000   cr2: 00007f7fff53e3e0                         
> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: ffffffff80cf2dc0    
> (XEN) ds: 0023   es: 0023   fs: 0000   gs: 0000   ss: 003f   cs: 0047       
> (XEN) Guest stack trace from rsp=00007f7fff53e3e0:          
> (XEN)    0000000000000001 00007f7fff53e8f8 0000000000000000 0000000000000000
> (XEN)    0000000000000003 000000004b600040 0000000000000004 0000000000000038
> (XEN)    0000000000000005 0000000000000008 0000000000000006 0000000000001000
> (XEN)    0000000000000007 00007f7e18400000 0000000000000008 0000000000000000
> (XEN)    0000000000000009 000000004b601cd0 00000000000007d0 0000000000000000
> (XEN)    00000000000007d1 0000000000000000 00000000000007d2 0000000000000000
> (XEN)    00000000000007d3 0000000000000000 000000000000000d 00007f7fff53f000
> (XEN)    00000000000007de 00007f7fff53e4e0 0000000000000000 0000000000000000
> (XEN)    6e692f6e6962732f 0000000000007469 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.

Pagefaults on IRET come either from stack accesses for operands (not the
case here as Xen is otherwise working fine), or from segement selector
loads for %cs and %ss.

In this example, %ss is in the LDT, which specifically does use
pagefaults to promote the frame to PGT_segdesc.

I suspect that what is happening is that handle_ldt_mapping_fault() is
failing to promote the page (for some reason), and we're taking the "In
hypervisor mode? Leave it to the #PF handler to fix up." path due to the
confusion in context, and Xen's #PF handler is concluding "nothing else
to do".

The older behaviour of escalating to the failsafe callback would have
broken this cycle by rewriting %ss and re-entering the kernel.


Please try the attached debugging patch, which is an extension of what I
gave you yesterday.  First, it ought to print %cr2, which I expect will
point to Xen's virtual mapping of the vcpu's LDT.  The logic ought to
loop a few times so we can inspect the hypervisor codepaths which are
effectively livelocked in this state, and I've also instrumented
check_descriptor() failures because I've got a gut feeling that is the
root cause of the problem.

~Andrew

--------------9EAEEE9A3F71311E771CA46C
Content-Type: text/x-patch; charset="UTF-8"; name="0001-extable-dbg.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-extable-dbg.patch"

From 841a6950fec5b43b370653e0c833a54fed64882e Mon Sep 17 00:00:00 2001
From: Andrew Cooper <andrew.cooper3@citrix.com>
Date: Wed, 9 Dec 2020 12:50:38 +0000
Subject: extable-dbg


diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
index 70972f1085..88b05bef38 100644
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
@@ -199,7 +203,21 @@ search_pre_exception_table(struct cpu_user_regs *regs)
         __start___pre_ex_table, __stop___pre_ex_table-1, addr);
     if ( fixup )
     {
-        dprintk(XENLOG_INFO, "Pre-exception: %p -> %p\n", _p(addr), _p(fixup));
+        static int count;
+
+        printk(XENLOG_ERR "IRET fault: %s[%04x]\n",
+               vec_name(regs->entry_vector), regs->error_code);
+
+        if ( regs->entry_vector == X86_EXC_PF )
+            printk(XENLOG_ERR "%%cr2 %016lx\n", read_cr2());
+
+        if ( count++ > 2 )
+        {
+            domain_crash(current->domain);
+            for ( ;; )
+                do_softirq();
+        }
+
         perfc_incr(exception_fixed);
     }
     return fixup;
diff --git a/xen/arch/x86/pv/descriptor-tables.c b/xen/arch/x86/pv/descriptor-tables.c
index 39c1a2311a..6bc58bba67 100644
--- a/xen/arch/x86/pv/descriptor-tables.c
+++ b/xen/arch/x86/pv/descriptor-tables.c
@@ -282,6 +282,10 @@ int validate_segdesc_page(struct page_info *page)
 
     unmap_domain_page(descs);
 
+    if ( i != 512 )
+        printk_once("Check Descriptor failed: idx %u, a: %08x, b: %08x\n",
+                    i, descs[i].a, descs[i].b);
+
     return i == 512 ? 0 : -EINVAL;
 }
 
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

--------------9EAEEE9A3F71311E771CA46C--

