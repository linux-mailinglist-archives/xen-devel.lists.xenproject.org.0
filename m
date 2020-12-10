Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3279D2D6946
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 22:01:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49913.88265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knT3z-0002ds-2U; Thu, 10 Dec 2020 21:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49913.88265; Thu, 10 Dec 2020 21:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knT3y-0002dV-VW; Thu, 10 Dec 2020 21:01:22 +0000
Received: by outflank-mailman (input) for mailman id 49913;
 Thu, 10 Dec 2020 21:01:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=25P7=FO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1knT3x-0002dQ-KR
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 21:01:21 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1dc6ae6-6f3d-4744-956a-0d3463d620f8;
 Thu, 10 Dec 2020 21:01:20 +0000 (UTC)
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
X-Inumbo-ID: b1dc6ae6-6f3d-4744-956a-0d3463d620f8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607634080;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=cLVw+tb7nC6NuiIXKO+EthQbh7iwGUXQ/ATdbc6J608=;
  b=XYQUGpOnkggaaHRfIYKtwc8NgbcJ5HhFWOTa0f6IvpP7WucQXhOif24E
   OpKHtAiPgw4J4P/Tbj6LpdXLm+gWxscxu1PsVk9XOhjUYnZ8gSJnS7+iw
   dJo/ulj5HL9UOc5/ET8xKWOiVxOAEj0rATltCLYqDUkYnJuUuw3E16Mw/
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 4K10j6FlT6IOh5YXfmR3bcHRnofq0S/L5SWMAPthFppoYpY8xcEfFnuAaH53iFfcxE37hO7JiP
 HYn1ayBp/WnSc6fPJp4LW76tHqyrP+gj6J6GNvArj+3vnYBOGA7575DsgZWcsTKw8MDFrTt5Mh
 XlQI3Hcyg5pn9LscvJRIJfCniLMrdt2uCbDpE0dqiiggeb76Gm5PXP7MgdV51xSa9XkwDtnJqk
 wtkuITGyODWUFyy0gjnsj7gZU4zfdqC2Yk74p0SmJIAwjFveS0uLF1XaTdxQACrYT1G2HeF2ZG
 quQ=
X-SBRS: 5.2
X-MesageID: 34198816
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,409,1599537600"; 
   d="scan'208";a="34198816"
Subject: Re: dom0 PV looping on search_pre_exception_table()
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
References: <20201209154431.GA4913@antioche.eu.org>
 <52e1b10d-75d4-63ac-f91e-cb8f0dcca493@citrix.com>
 <20201209163049.GA6158@antioche.eu.org>
 <30a71c9d-3eff-3727-9c61-e387b5bccc95@citrix.com>
 <20201209185714.GS1469@antioche.eu.org>
 <6c06abf1-7efe-f02c-536a-337a2704e265@citrix.com>
 <20201210095139.GA455@antioche.eu.org>
 <4c3bff12-821b-83fb-e054-61b07b97fa70@citrix.com>
 <20201210170319.GG455@antioche.eu.org>
 <ed06a0f4-8468-addf-2797-be3ba3a2d607@citrix.com>
 <20201210173551.GJ455@antioche.eu.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b60639d9-5c27-ab86-eb97-f8627b3b32d2@citrix.com>
Date: Thu, 10 Dec 2020 21:01:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201210173551.GJ455@antioche.eu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 10/12/2020 17:35, Manuel Bouyer wrote:
> On Thu, Dec 10, 2020 at 05:18:39PM +0000, Andrew Cooper wrote:
>> However, Xen finds the mapping not-present when trying to demand-map it,
>> hence why the #PF is forwarded to the kernel.
>>
>> The way we pull guest virtual addresses was altered by XSA-286 (released
>> not too long ago despite its apparent age), but *should* have been no
>> functional change.  I wonder if we accidentally broke something there. 
>> What exactly are you running, Xen-wise, with the 4.13 version?
> It is 4.13.2, with the patch for XSA351

Thanks,

>> Given that this is init failing, presumably the issue would repro with
>> the net installer version too?
> Hopefully yes, maybe even as a domU. But I don't have a linux dom0 to test.
>
> If you have a Xen setup you can test with
> http://ftp.netbsd.org/pub/NetBSD/NetBSD-9.1/amd64/binary/kernel/netbsd-INSTALL_XEN3_DOMU.gz
>
> note that this won't boot as a dom0 kernel.

I've repro'd the problem.

When I modify Xen to explicitly demand-map the LDT in the MMUEXT_SET_LDT
hypercall, everything works fine.

Specifically, this delta:

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 723cc1070f..71a791d877 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3742,12 +3742,31 @@ long do_mmuext_op(
             else if ( (curr->arch.pv.ldt_ents != ents) ||
                       (curr->arch.pv.ldt_base != ptr) )
             {
+                unsigned int err = 0, tmp;
+
                 if ( pv_destroy_ldt(curr) )
                     flush_tlb_local();
 
                 curr->arch.pv.ldt_base = ptr;
                 curr->arch.pv.ldt_ents = ents;
                 load_LDT(curr);
+
+                printk("Probe new LDT\n");
+                asm volatile (
+                    "mov %%es, %[tmp];\n\t"
+                    "1: mov %[sel], %%es;\n\t"
+                    "mov %[tmp], %%es;\n\t"
+                    "2:\n\t"
+                    ".section .fixup,\"ax\"\n"
+                    "3: mov $1, %[err];\n\t"
+                    "jmp 2b\n\t"
+                    ".previous\n\t"
+                    _ASM_EXTABLE(1b, 3b)
+                    : [err] "+r" (err),
+                      [tmp] "=&r" (tmp)
+                    : [sel] "r" (0x3f)
+                    : "memory");
+                printk("  => err %u\n", err);
             }
             break;
         }

Which stashes %es, explicitly loads init's %ss selector to trigger the
#PF and Xen's lazy mapping, then restores %es.

(XEN) d1v0 Dropping PAT write of 0007010600070106
(XEN) Probe new LDT
(XEN) *** LDT Successful map, slot 0
(XEN)   => err 0
(XEN) d1 L1TF-vulnerable L4e 0000000801e88000 - Shadowing

And the domain is up and running:

# xl list
Name                                        ID   Mem VCPUs    State   
Time(s)
Domain-0                                     0  2656     8    
r-----      44.6
netbsd                                       1   256     1    
-b----       5.3

(Probably confused about the fact I gave it no disk...)

Now, in this case, we find that the virtual address provided for the LDT
is mapped, so we successfully copy the mapping into Xen's area, and init
runs happily.

So the mystery is why the LDT virtual address is not-present when Xen
tries to lazily map the LDT at the normal point...

Presumably you've got no Meltdown mitigations going on within the NetBSD
kernel?  (I suspect not, seeing as changing Xen changes the behaviour,
but it is worth asking).

~Andrew

