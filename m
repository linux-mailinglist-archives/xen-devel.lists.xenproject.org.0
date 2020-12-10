Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 812CB2D6072
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 16:52:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49486.87527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knOEV-0006YT-BB; Thu, 10 Dec 2020 15:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49486.87527; Thu, 10 Dec 2020 15:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knOEV-0006Y4-7p; Thu, 10 Dec 2020 15:51:55 +0000
Received: by outflank-mailman (input) for mailman id 49486;
 Thu, 10 Dec 2020 15:51:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=25P7=FO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1knOET-0006Xy-Rp
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 15:51:53 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e906db7-7393-46a7-b4bb-e4e3b1551fa9;
 Thu, 10 Dec 2020 15:51:52 +0000 (UTC)
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
X-Inumbo-ID: 4e906db7-7393-46a7-b4bb-e4e3b1551fa9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607615512;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=ALbDrC7Mm1GrMzfB1WylaHcfB2cS8558iTIts2riVhk=;
  b=Ez1oAV7lFsB89aj9mLbd0tgN+zhtPBc79ZBD5f3V2FAo6x9ayfEHhceO
   U0048ttoe7SnaKx6pgW1B7LmFsTMk5lplPyXMymduvpp8CZGg4fe6pbIn
   rhqTwMpP2sK9hjyYm/rH0pn1ZVZ3SgKxLc44gcJoHg9+Y5WmGscFkAFpa
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: mWw8NNhDzR65AO5zwlAJMmTflC/7BP7swKtiNWBIeWtsmGXmcIv5KaaaZG37sxx+WGHagocYrF
 otAv/wAr56cWWIsRDQwM4cOwlc2p8GjEFbBjhP3ZTkKVAN11X0WXnpVwSTZXYpeVMGv0nSfoKH
 g0wPI0XQva1TQzDsZ1F7OCeVzAcKYLbs32PgsC60fSfTTn+amQ2+noyJOd817vbE1VbBiYfmEn
 w9uT04uTm2dQkcy+s4UsKyWW2jgt20dhOT99t41hjlwLxkA2+xq8bhndixPQiq5rYmfuo4A5AN
 fis=
X-SBRS: 5.2
X-MesageID: 34165577
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,408,1599537600"; 
   d="scan'208";a="34165577"
Subject: Re: dom0 PV looping on search_pre_exception_table()
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
References: <20201209101512.GA1299@antioche.eu.org>
 <3f7e50bb-24ad-1e32-9ea1-ba87007d3796@citrix.com>
 <20201209135908.GA4269@antioche.eu.org>
 <c612616a-3fcd-be93-7594-20c0c3b71b7a@citrix.com>
 <20201209154431.GA4913@antioche.eu.org>
 <52e1b10d-75d4-63ac-f91e-cb8f0dcca493@citrix.com>
 <20201209163049.GA6158@antioche.eu.org>
 <30a71c9d-3eff-3727-9c61-e387b5bccc95@citrix.com>
 <20201209185714.GS1469@antioche.eu.org>
 <6c06abf1-7efe-f02c-536a-337a2704e265@citrix.com>
 <20201210095139.GA455@antioche.eu.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4c3bff12-821b-83fb-e054-61b07b97fa70@citrix.com>
Date: Thu, 10 Dec 2020 15:51:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201210095139.GA455@antioche.eu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 10/12/2020 09:51, Manuel Bouyer wrote:
> On Wed, Dec 09, 2020 at 07:08:41PM +0000, Andrew Cooper wrote:
>> Oh of course - we don't follow the exit-to-guest path on the way out here.
>>
>> As a gross hack to check that we've at least diagnosed the issue
>> appropriately, could you modify NetBSD to explicitly load the %ss
>> selector into %es (or any other free segment) before first entering user
>> context?
> If I understood it properly, the user %ss is loaded by Xen from the
> trapframe when the guest swictes from kernel to user mode, isn't it ?

Yes.  The kernel involves HYPERCALL_iret, and Xen copies/audits the
provided trapframe, and uses it to actually enter userspace.

> So you mean setting %es to the same value in the trapframe ?

Yes - specifically I wanted to force the LDT reference to happen in a
context where demand-faulting should work, so all the mappings get set
up properly before we first encounter the LDT reference in Xen's IRET
instruction.

And to be clear, there is definitely a bug needing fixing here in Xen in
terms of handling IRET faults caused by guest state.  However, it looks
like this isn't the root of the problem - merely some very weird
collateral damage.

> Actually I used %fs because %es is set equal to %ds.
> Xen 4.13 boots fine with this change, but with 4.15 I get a loop of:
>
>
> (XEN) *** LDT: gl1e 0000000000000000 not present                               
> (XEN) *** pv_map_ldt_shadow_page(0x40) failed                                  
> [  12.3586540] Process (pid 1) got sig 11                                      
>
> which means that the dom0 gets the trap, and decides that the fault address
> is not mapped. Without the change the dom0 doesn't show the
> "Process (pid 1) got sig 11"
>
> I activated the NetBSD trap debug code, and this shows:
> [   6.7165877] kern.module.path=/stand/amd64-xen/9.1/modules
> (XEN) *** LDT: gl1e 0000000000000000 not present                                
> (XEN) *** pv_map_ldt_shadow_page(0x40) failed
> [   6.9462322] pid 1.1 (init): signal 11 code=1 (trap 0x6) @rip 0x7f7ef0c007d0 addr 0xffffbd800000a040 error=14
> [   7.0647896] trapframe 0xffffbd80381cff00
> [   7.1126288] rip 0x00007f7ef0c007d0  rsp 0x00007f7fff10aa30  rfl 0x0000000000000202
> [   7.2041518] rdi 000000000000000000  rsi 000000000000000000  rdx 000000000000000000
> [   7.2956758] rcx 000000000000000000  r8  000000000000000000  r9  000000000000000000
> [   7.3872013] r10 000000000000000000  r11 000000000000000000  r12 000000000000000000
> [   7.4787216] r13 000000000000000000  r14 000000000000000000  r15 000000000000000000
> [   7.5702439] rbp 000000000000000000  rbx 0x00007f7fff10afe0  rax 000000000000000000
> [   7.6617663] cs 0x47  ds 0x23  es 0x23  fs 0000  gs 0000  ss 0x3f
> [   7.7345663] fsbase 000000000000000000 gsbase 000000000000000000
>
> so it looks like something resets %fs to 0 ...
>
> Anyway the fault address 0xffffbd800000a040 is in the hypervisor's range,
> isn't it ?

No.  Its the kernel's LDT.  From previous debugging:
> (XEN) %cr2 ffff820000010040, LDT base ffffbd000000a000, limit 0057

LDT handling in Xen is a bit complicated.  To maintain host safety, we
must map it into Xen's range, and we explicitly support a PV guest doing
on-demand mapping of the LDT.  (This pertains to the experimental
Windows XP PV support which never made it beyond a prototype.  Windows
can page out the LDT.)  Either way, we lazily map the LDT frames on
first use.

So %cr2 is the real hardware faulting address, and is in the Xen range. 
We spot that it is an LDT access, and try to lazily map the frame (at
LDT base), but find that the kernel's virtual address mapping
0xffffbd000000a000 is not present (the gl1e printk).

Therefore, we pass #PF to the guest kernel, adjusting vCR2 to what would
have happened had Xen not mapped the real LDT elsewhere, which is
expected to cause the guest kernel to do whatever demand mapping is
necessary to pull the LDT back in.


I suppose it is worth taking a step back and ascertaining how exactly
NetBSD handles (or, should be handling) the LDT.

Do you mind elaborating on how it is supposed to work?

~Andrew

