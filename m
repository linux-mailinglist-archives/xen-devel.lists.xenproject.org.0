Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C00AFEE846
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 20:24:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRhvR-0001sZ-Jx; Mon, 04 Nov 2019 19:22:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kevs=Y4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iRhvP-0001s2-NJ
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 19:22:03 +0000
X-Inumbo-ID: 60c71e96-ff38-11e9-9631-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60c71e96-ff38-11e9-9631-bc764e2007e4;
 Mon, 04 Nov 2019 19:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572895322;
 h=subject:from:to:references:message-id:date:mime-version:
 in-reply-to; bh=mzmElqL1X1g1Zy/GDrs7XqFWitPsphQkyb3EP2EkriE=;
 b=aJ1rOCZr6Rfs4TwRFlt+oF2wpLs3+GtuP17Fchnmv8NbkFx9nIgoSixk
 BIrfZKFn0e98T8UBdtbJfMeDUCyfFJZZYaPjtw8cVVwtW4TTr/fAONcNz
 xBtWqU+5PkhjdO5oPYRBY3UpbbT4jhBsKnthLa/0uMfjEneWzUyU6uKh2 U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NjE1/s2bbhs18RoWXnWqjpuPdLSQe54oApCgHvUiy+oqsjLPxeCSvSF9lqbiWGBJLe5SalcGEv
 sBG7h7+/4+jx6mptu3LeG4CkaHtYsi2ZuCqy1tizRVfOJLEkmL37jDzQgkr6r0NmTjNYwHXzyx
 ET6LQl1ysC1EfR1qn9Im1k6dKZxzMerhZYh6xAov1lEAsYKpbsMoCTPY9GjHoxUf9/8AvT38j/
 s1n25z77BJY2sAUQiu4+xUt6zWXlhHYMwch1li5GK5AxXvxmPv0p7bivetmABlDwZS05nCXH11
 roY=
X-SBRS: 2.7
X-MesageID: 8211738
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,268,1569297600"; 
   d="scan'208";a="8211738"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: =?UTF-8?Q?H=c3=a5kon_Alstadheim?= <hakon@alstadheim.priv.no>,
 <xen-devel@lists.xenproject.org>
References: <19c16a0b-514d-8e2b-a2ea-ce35ab3c3952@alstadheim.priv.no>
 <bc0b45b1-be20-e1f2-81dc-cbfec71a6599@citrix.com>
 <b9aad1ea-fae3-047a-3c01-3d00a756aa2f@alstadheim.priv.no>
 <2e25eb60-7f59-d7bf-8f8c-4dc2790c0840@citrix.com>
 <25043c4e-c2ec-c47b-513f-2c0d93c23f26@alstadheim.priv.no>
 <099cb111-cc9b-59da-809a-17ddf896f16d@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <62c8abc6-5971-7978-b337-44392927a985@citrix.com>
Date: Mon, 4 Nov 2019 19:21:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <099cb111-cc9b-59da-809a-17ddf896f16d@citrix.com>
Content-Type: multipart/mixed; boundary="------------DFA3F3028E3AB43EAE714287"
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [BUG] Invalid guest state in Xen master,
 dom0 linux-5.3.6, domU windows 10
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--------------DFA3F3028E3AB43EAE714287
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 04/11/2019 15:40, Andrew Cooper wrote:
> On 04/11/2019 15:33, Håkon Alstadheim wrote:
>> Den 04.11.2019 14:31, skrev Andrew Cooper:
>>> On 03/11/2019 10:23, Håkon Alstadheim wrote:
>>>
>>>> (XEN) [2019-11-02 14:09:46] d2v0 vmentry failure (reason 0x80000021):
>>>> Invalid guest state (0)
>>>> (XEN) [2019-11-02 14:09:46] ************* VMCS Area **************
>>>> (XEN) [2019-11-02 14:09:46] *** Guest State ***
>>>> (XEN) [2019-11-02 14:09:46] CR0: actual=0x0000000080050031,
>>>> shadow=0x0000000080050031, gh_mask=ffffffffffffffff
>>>> (XEN) [2019-11-02 14:09:46] CR4: actual=0x0000000000172678,
>>>> shadow=0x0000000000170678, gh_mask=ffffffffffe8f860
>>>> (XEN) [2019-11-02 14:09:46] CR3 = 0x00000000001aa002
>>>> (XEN) [2019-11-02 14:09:46] RSP = 0xffff8c0f4dd71e98
>>>> (0xffff8c0f4dd71e98)  RIP = 0xffffd18a040bb75e (0xffffd18a040bb75e)
>>>> (XEN) [2019-11-02 14:09:46] RFLAGS=0x00000187 (0x00000187)  DR7 =
>>>> 0x0000000000000400
>>>> (XEN) [2019-11-02 14:09:46] Sysenter RSP=0000000000000000
>>>> CS:RIP=0000:0000000000000000
>>>> (XEN) [2019-11-02 14:09:46]        sel  attr  limit   base
>>>> (XEN) [2019-11-02 14:09:46]   CS: 0010 0209b 00000000 0000000000000000
>>>> (XEN) [2019-11-02 14:09:46]   DS: 002b 0c0f3 ffffffff 0000000000000000
>>>> (XEN) [2019-11-02 14:09:46]   SS: 0018 04093 00000000 0000000000000000
>>>> (XEN) [2019-11-02 14:09:46]   ES: 002b 0c0f3 ffffffff 0000000000000000
>>>> (XEN) [2019-11-02 14:09:46]   FS: 0053 040f3 00003c00 0000000000000000
>>>> (XEN) [2019-11-02 14:09:46]   GS: 002b 0c0f3 ffffffff fffff8044ff80000
>>>> (XEN) [2019-11-02 14:09:46] GDTR:            00000057 fffff80459c61fb0
>>>> (XEN) [2019-11-02 14:09:46] LDTR: 0000 1c000 ffffffff 0000000000000000
>>>> (XEN) [2019-11-02 14:09:46] IDTR:            0000012f ffffd18a014a0980
>>>> (XEN) [2019-11-02 14:09:46]   TR: 0040 0008b 00000067 fffff80459c60000
>>>> (XEN) [2019-11-02 14:09:46] EFER(VMCS) = 0x0000000000000d01  PAT =
>>>> 0x0007010600070106
>>>> (XEN) [2019-11-02 14:09:46] PreemptionTimer = 0x00000000  SM Base =
>>>> 0x00000000
>>>> (XEN) [2019-11-02 14:09:46] DebugCtl = 0x0000000000000000
>>>> DebugExceptions = 0x0000000000000000
>>>> (XEN) [2019-11-02 14:09:46] Interruptibility = 00000002  ActivityState
>>>> = 00000000
>>>> (XEN) [2019-11-02 14:09:46] InterruptStatus = 0000
>>>> (XEN) [2019-11-02 14:09:46] *** Host State ***
>>>> (XEN) [2019-11-02 14:09:46] RIP = 0xffff82d080341950
>>>> (vmx_asm_vmexit_handler)  RSP = 0xffff83083ff0ff70
>>>> (XEN) [2019-11-02 14:09:46] CS=e008 SS=0000 DS=0000 ES=0000 FS=0000
>>>> GS=0000 TR=e040
>>>> (XEN) [2019-11-02 14:09:46] FSBase=0000000000000000
>>>> GSBase=0000000000000000 TRBase=ffff83083ff14000
>>>> (XEN) [2019-11-02 14:09:46] GDTBase=ffff83083ff03000
>>>> IDTBase=ffff83083ff07000
>>>> (XEN) [2019-11-02 14:09:46] CR0=0000000080050033 CR3=000000054dbea000
>>>> CR4=00000000001526e0
>>>> (XEN) [2019-11-02 14:09:46] Sysenter RSP=ffff83083ff0ffa0
>>>> CS:RIP=e008:ffff82d080395440
>>>> (XEN) [2019-11-02 14:09:46] EFER = 0x0000000000000d01  PAT =
>>>> 0x0000050100070406
>>>> (XEN) [2019-11-02 14:09:46] *** Control State ***
>>>> (XEN) [2019-11-02 14:09:46] PinBased=000000bf CPUBased=b62065fa
>>>> SecondaryExec=000017eb
>>>> (XEN) [2019-11-02 14:09:46] EntryControls=0000d3ff
>>>> ExitControls=002fefff
>>>> (XEN) [2019-11-02 14:09:46] ExceptionBitmap=00060002 PFECmask=00000000
>>>> PFECmatch=00000000
>>>> (XEN) [2019-11-02 14:09:46] VMEntry: intr_info=80000501
>>>> errcode=00000000 ilen=00000001
>>>> (XEN) [2019-11-02 14:09:46] VMExit: intr_info=80000501
>>>> errcode=00000000 ilen=00000001
>>>> (XEN) [2019-11-02 14:09:46]         reason=80000021
>>>> qualification=0000000000000000
>>>> (XEN) [2019-11-02 14:09:46] IDTVectoring: info=00000000
>>>> errcode=00000000
>>>> (XEN) [2019-11-02 14:09:46] TSC Offset = 0xfffff45ded46dd57  TSC
>>>> Multiplier = 0x0000000000000000
>>>> (XEN) [2019-11-02 14:09:46] TPR Threshold = 0x00  PostedIntrVec = 0xf5
>>>> (XEN) [2019-11-02 14:09:46] EPT pointer = 0x000000054e3a701e  EPTP
>>>> index = 0x0000
>>>> (XEN) [2019-11-02 14:09:46] PLE Gap=00000080 Window=00001000
>>>> (XEN) [2019-11-02 14:09:46] Virtual processor ID = 0x5a02 VMfunc
>>>> controls = 0000000000000000
>>>> (XEN) [2019-11-02 14:09:46] **************************************
>>>> (XEN) [2019-11-02 14:09:46] domain_crash called from vmx.c:3335
>>>> (XEN) [2019-11-02 14:09:46] Domain 2 (vcpu#0) crashed on cpu#2:
>>> Interruptibility = 00000002 (Blocked by Mov SS) and VMEntry:
>>> intr_info=80000501 (ICEBP)
>>>
>>> Dare I ask what you're running in your windows guest?  Unless it is a
>>> vulnerability test suite, I'm rather concerned.
>> Because I have pulled out all stops ? Well no particular reason. I've
>> asked my kids nicely not to poke any /more/ holes in the security on
>> the system. Probably should tighten up the ship. I have some conflict
>> going on between the hardware pci USB cards in the machine, so I
>> thought I'd see what would happen if I gave ASUS and whatever no-name
>> Taiwanese I have in there free rein. Nothing gained as far as I can
>> see, so I'll see about closing some of the more gaping holes. At least
>> as far as getting rid of deprecation warnings go :-) .
>>
>> I hope "they" never get serious about requiring a license to own a
>> computer with Internet access. :-)
> Something in the VM is attempting to exploit XSA-260 / CVE-2018-8897
> against the guest kernel, using a variation of the attack.
>
> Xen should cope with the entry conditions correctly, and I think I've
> figured out a fairly non-invasive way of fixing this particular case
> without the full-blown #DB rework.

Ok - something more complicated is going on here.  I can't reproduce the
corner case in the obvious way.

Can you apply this debugging patch and try to reproduce the issue?  I
want to confirm which instructions the guest is executing.

~Andrew

--------------DFA3F3028E3AB43EAE714287
Content-Type: text/x-patch; name="dbg.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="dbg.patch"

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index ed27e8def7..3ca3671a9e 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -2025,6 +2025,30 @@ void vmcs_dump_vcpu(struct vcpu *v)
         printk("Virtual processor ID = 0x%04x VMfunc controls = %016lx\n",
                vmr16(VIRTUAL_PROCESSOR_ID), vmr(VM_FUNCTION_CONTROL));
 
+    {
+        struct hvm_emulate_ctxt ctxt;
+        const struct segment_register *cs;
+
+        hvm_emulate_init_once(&ctxt, NULL, regs);
+
+        cs = &ctxt.seg_reg[x86_seg_cs];
+
+        {
+            uint32_t walk = ((ctxt.seg_reg[x86_seg_ss].dpl == 3)
+                             ? PFEC_user_mode : 0) | PFEC_insn_fetch;
+            unsigned long addr;
+            char bytes[32];
+
+            if ( hvm_virtual_to_linear_addr(x86_seg_cs, cs, regs->rip - 16,
+                                            sizeof(bytes), hvm_access_insn_fetch,
+                                            cs, &addr) &&
+                 (hvm_copy_from_guest_linear(bytes, addr, sizeof(bytes),
+                                             walk, NULL) == HVMTRANS_okay) )
+                printk("*** Insn bytes from %lx: %16ph <%02x> %15ph\n",
+                       addr, bytes, (unsigned int)bytes[16], &bytes[17]);
+        }
+    }
+
     vmx_vmcs_exit(v);
 }
 

--------------DFA3F3028E3AB43EAE714287
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------DFA3F3028E3AB43EAE714287--

