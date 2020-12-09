Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0816A2D4486
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 15:41:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48332.85446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn0er-0000sk-0a; Wed, 09 Dec 2020 14:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48332.85446; Wed, 09 Dec 2020 14:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn0eq-0000sL-Tk; Wed, 09 Dec 2020 14:41:32 +0000
Received: by outflank-mailman (input) for mailman id 48332;
 Wed, 09 Dec 2020 14:41:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NJeK=FN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kn0ep-0000sF-Mt
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 14:41:31 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31a19d4a-58fe-4dd7-a546-9bb31528dd43;
 Wed, 09 Dec 2020 14:41:30 +0000 (UTC)
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
X-Inumbo-ID: 31a19d4a-58fe-4dd7-a546-9bb31528dd43
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607524890;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=D4r5jtqfdP/QbqUxHGzimSh5Yk7o/nEtyDgsKLy034A=;
  b=HMozLkZhaybUuJFWLOUfiVEJE7apO6apyuU5WDnWuiUbMo52GICTKvSN
   4W2FuGMK//IAUtTIEGkVNngMDV/9A2evOxzC3sfJOcLGWXRDiUjM5g+DW
   aEJxxvgog6oR2WfH3GTS039VdzOVyMQ+n8RNwCdbeOXpnkbSGuXB8Takb
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 0Lxv2UMDflCZOIIlxONC9qSC10t2Kwy1oSVPHgdj0UX+rVzC1RINk7E3AvCSsZ3wbsab3KtMOw
 poCO8PrIBBWlIQ6Zj7t8gvFncAHcrP9yg+xQWqMgpRXkoNCc6nQx5W+m36x5wnFIZWDSrLkNXE
 QD+JrVnzQl7bwVP1ImeVTSd8lU9Fcx8eWxhRJ9eGb5XA2hlb+FrbcS5XnDDi5h5wJsy9ODov3Q
 o2zlHONi4fgNr5d3GsTzULHVE9Rnc2+WEd35xFP+l2JereFadZdN/EeIhOdXBWYy4Pgj5ZJhDw
 /2U=
X-SBRS: 5.2
X-MesageID: 33197328
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:tp0BXaGNgAp2nsxXpLqFjZLXdLJzesId70hD6mlaY3VuHfCwvc
 aogfgdyFvQgDEeRHkvlbm7SdC9aFnb8oN45pRUAKyrWxPotHDtAIZp64bjxDOIIVyZysd206
 B8f69iTODhFFQSt7ec3CCUG8stqeP3k5yAqvzZyx5WLD1CS6Yl1AthDxbeL0sefngjObMcNL
 6xovVKvCChf3N/VLXfOlAgU/LYr9PG0LLKCCRnOzcd5AODjSyl5dfBenDytCs2aD9Bzawv9m
 LIiWXCiJmLiP2n1gTak1ba8pU+oqqY9vJ4GMeOhsIJQw+Ati+UYu1aN4GqgCo4u6WG5losjb
 D30nUdFvU2wXbQcmapmADqygnt3R0/gkWSs2OwsD/Eusz2RDUzFspHi8Z4S3LimjEdgPh42p
 RK0nPxirNcB3r78xjV7d7OSh1siw6wqX0tjeYcgxVkIPIjQbVWqpES+14QDYwJGzj05JtiHO
 5lCszd4/g+SyL9U1nSuG5zzNuwGmkiBxvueDlkhuWZ2yVb9UoJrHcwy9cYmh47la4VS54B/O
 jcN7QtibcmdL5zUYt4CP0aScW6TmzBKCitDEuXIVDqUL4KIGjMrZmf2sRR2MiwdJYFzIQ/lf
 36OTsy31IaYE7gBdaD25dG6Hn2LlmVRjjx1tpYo4Fwp7yUfsuSDQSYVFssn8G8ys9zPuTHXZ
 +IVK5+H+XuNi/nF4pPwmTFKvtvAGhbWsgUttEnQkmJs8LGJ4b739arCsr7Nf7qCjYrWmT2H3
 sFUnzyPax7nzuWZkM=
X-IronPort-AV: E=Sophos;i="5.78,405,1599537600"; 
   d="scan'208";a="33197328"
Subject: Re: dom0 PV looping on search_pre_exception_table()
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
References: <20201208175738.GA3390@antioche.eu.org>
 <e73cc71d-c1a6-87c8-1b82-5d70d4f52eaa@citrix.com>
 <20201209101512.GA1299@antioche.eu.org>
 <3f7e50bb-24ad-1e32-9ea1-ba87007d3796@citrix.com>
 <20201209135908.GA4269@antioche.eu.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c612616a-3fcd-be93-7594-20c0c3b71b7a@citrix.com>
Date: Wed, 9 Dec 2020 14:41:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201209135908.GA4269@antioche.eu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 09/12/2020 13:59, Manuel Bouyer wrote:
> On Wed, Dec 09, 2020 at 01:28:54PM +0000, Andrew Cooper wrote:
>> Pagefaults on IRET come either from stack accesses for operands (not the
>> case here as Xen is otherwise working fine), or from segement selector
>> loads for %cs and %ss.
>>
>> In this example, %ss is in the LDT, which specifically does use
>> pagefaults to promote the frame to PGT_segdesc.
>>
>> I suspect that what is happening is that handle_ldt_mapping_fault() is
>> failing to promote the page (for some reason), and we're taking the "In
>> hypervisor mode? Leave it to the #PF handler to fix up." path due to the
>> confusion in context, and Xen's #PF handler is concluding "nothing else
>> to do".
>>
>> The older behaviour of escalating to the failsafe callback would have
>> broken this cycle by rewriting %ss and re-entering the kernel.
>>
>>
>> Please try the attached debugging patch, which is an extension of what I
>> gave you yesterday.  First, it ought to print %cr2, which I expect will
>> point to Xen's virtual mapping of the vcpu's LDT.  The logic ought to
>> loop a few times so we can inspect the hypervisor codepaths which are
>> effectively livelocked in this state, and I've also instrumented
>> check_descriptor() failures because I've got a gut feeling that is the
>> root cause of the problem.
> here's the output:
> (XEN) IRET fault: #PF[0000]                                            [23/1999]
> (XEN) %cr2 ffff820000010040                                                    
> (XEN) IRET fault: #PF[0000]                                                    
> (XEN) %cr2 ffff820000010040                                                 
> (XEN) IRET fault: #PF[0000]
> (XEN) %cr2 ffff820000010040
> (XEN) IRET fault: #PF[0000]
> (XEN) %cr2 ffff820000010040
> (XEN) domain_crash called from extable.c:216
> (XEN) Domain 0 (vcpu#0) crashed on cpu#0:
> (XEN) ----[ Xen-4.15-unstable  x86_64  debug=y   Tainted:   C   ]----
> (XEN) CPU:    0
> (XEN) RIP:    0047:[<00007f7ff60007d0>]
> (XEN) RFLAGS: 0000000000000202   EM: 0   CONTEXT: pv guest (d0v0)
> (XEN) rax: ffff82d04038c309   rbx: 0000000000000000   rcx: 000000000000e008
> (XEN) rdx: 0000000000010086   rsi: ffff83007fcb7f78   rdi: 000000000000e010
> (XEN) rbp: 0000000000000000   rsp: 00007f7fff4876c0   r8:  0000000e00000000
> (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
> (XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000000000
> (XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 0000000000002660
> (XEN) cr3: 0000000079cdb000   cr2: ffffa1000000a040
> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: ffffffff80cf2dc0
> (XEN) ds: 0023   es: 0023   fs: 0000   gs: 0000   ss: 003f   cs: 0047
> (XEN) Guest stack trace from rsp=00007f7fff4876c0:
> (XEN)    0000000000000001 00007f7fff487bd8 0000000000000000 0000000000000000
> (XEN)    0000000000000003 00000000aee00040 0000000000000004 0000000000000038
> (XEN)    0000000000000005 0000000000000008 0000000000000006 0000000000001000
> (XEN)    0000000000000007 00007f7ff6000000 0000000000000008 0000000000000000
> (XEN)    0000000000000009 00000000aee01cd0 00000000000007d0 0000000000000000
> (XEN)    00000000000007d1 0000000000000000 00000000000007d2 0000000000000000
> (XEN)    00000000000007d3 0000000000000000 000000000000000d 00007f7fff488000
> (XEN)    00000000000007de 00007f7fff4877c0 0000000000000000 0000000000000000
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

Huh, so it is the LDT, but we're not getting as far as inspecting the
target frame.

I wonder if the LDT is set up correctly.  How about this incremental delta?

~Andrew

diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
index 88b05bef38..be59a3e216 100644
--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -203,13 +203,16 @@ search_pre_exception_table(struct cpu_user_regs *regs)
         __start___pre_ex_table, __stop___pre_ex_table-1, addr);
     if ( fixup )
     {
+        struct vcpu *curr = current;
         static int count;
 
         printk(XENLOG_ERR "IRET fault: %s[%04x]\n",
                vec_name(regs->entry_vector), regs->error_code);
 
         if ( regs->entry_vector == X86_EXC_PF )
-            printk(XENLOG_ERR "%%cr2 %016lx\n", read_cr2());
+            printk(XENLOG_ERR "%%cr2 %016lx, LDT base %016lx, limit
%04x\n",
+                   read_cr2(), curr->arch.pv.ldt_base,
+                   (curr->arch.pv.ldt_ents << 3) | 7);
 
         if ( count++ > 2 )
         {
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 1059f3ce66..3ac07a84c3 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1233,6 +1233,8 @@ static int handle_ldt_mapping_fault(unsigned int
offset,
     }
     else
     {
+        printk(XENLOG_ERR "*** pv_map_ldt_shadow_page(%#x) failed\n",
offset);
+
         /* In hypervisor mode? Leave it to the #PF handler to fix up. */
         if ( !guest_mode(regs) )
             return 0;


