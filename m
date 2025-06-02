Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD3FACB470
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 16:52:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003566.1383146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM6Wg-0004AN-TM; Mon, 02 Jun 2025 14:52:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003566.1383146; Mon, 02 Jun 2025 14:52:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM6Wg-00048J-Q1; Mon, 02 Jun 2025 14:52:34 +0000
Received: by outflank-mailman (input) for mailman id 1003566;
 Mon, 02 Jun 2025 14:52:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xAfn=YR=tum.de=manuel.andreas@srs-se1.protection.inumbo.net>)
 id 1uM6Wf-0003VM-7q
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 14:52:33 +0000
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de [129.187.255.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 357f4757-3fc1-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 16:52:31 +0200 (CEST)
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
 by postout2.mail.lrz.de (Postfix) with ESMTP id 4b9xdp4v7gzyTy;
 Mon,  2 Jun 2025 16:52:30 +0200 (CEST)
Received: from postout2.mail.lrz.de ([127.0.0.1])
 by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavis, port 20024)
 with LMTP id 6Q7Bwaq5tZfE; Mon,  2 Jun 2025 16:52:29 +0200 (CEST)
Received: from [IPV6:2a02:2455:1858:e00:e0bb:e98d:8f46:dc66] (unknown
 [IPv6:2a02:2455:1858:e00:e0bb:e98d:8f46:dc66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4b9xdn1XCQzyT9;
 Mon,  2 Jun 2025 16:52:29 +0200 (CEST)
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
X-Inumbo-ID: 357f4757-3fc1-11f0-b894-0df219b8e170
Authentication-Results: postout.lrz.de (amavis); dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)" header.d=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tum.de; h=
	in-reply-to:from:from:content-language:references:subject
	:subject:user-agent:mime-version:date:date:message-id
	:content-type:content-type:received:received; s=tu-postout21; t=
	1748875949; bh=nMeEhx7L+DCZVZYlqJjaSDQXyy4Ot24sMO8x0OyCLf4=; b=M
	DYSntO7RZz3SI1zwHIIqt5RP7rrNiLqiql5ykA9rBKmLkJKBaBPO/RmCrxHqubyh
	DvgniG65t9NOQJy4pufMDccjvC7Erb7xcLcsFa2WLbNTuRYpocpyBdc+vKTPRWw/
	HJq4dGCTe4BcCu+j5zevRF5Hu3mjCVI1DQ49+852EChgbRWEq1kaP4LdjrQDgc6P
	DoXcS5TaoZQtQS3UNMMolp7uRoNWHC6bmp2R3d6nGWlti+++nMZWBXGRDUPUzsDo
	4M5KXRrlAqjPO+rbkihMJnYc+8NdbSLLs2zGMKVeYR+RHyiWH4vOt+lohuhoJfwj
	LsMg0f8L581T6OXXrSARg==
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.866
X-Spam-Level:
X-Spam-Status: No, score=-2.866 tagged_above=-999 required=5
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
 DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001, HTML_MESSAGE=0.001,
 LRZ_BND_ANU8=0.001, LRZ_BND_M12_AN24=0.001, LRZ_DMARC_FAIL=0.001,
 LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
 LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
 LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
 LRZ_FROM_ENVFROM_ALIGNED_STRICT=0.001, LRZ_FROM_HAS_A=0.001,
 LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
 LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
 LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
 LRZ_FROM_TUM_S=0.001, LRZ_HAS_BND=0.001, LRZ_HAS_CLANG=0.001,
 LRZ_HAS_CT=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_MIME_VERSION=0.001,
 LRZ_HAS_SPF=0.001, LRZ_MIME_BND_SPAM_184=0.001,
 LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001, LRZ_SUBJ_FW_RE=0.001,
 LRZ_UA_MOZ=0.001] autolearn=no autolearn_force=no
Content-Type: multipart/alternative;
 boundary="------------1EvWbjWPzA6lFP0fbfCwHvBg"
Message-ID: <26f412e2-ba65-4e3f-8c5f-7e15f5f32491@tum.de>
Date: Mon, 2 Jun 2025 16:52:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Nullptr dereference in nested VMX when shadow VMCS support is
 available
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <5f258e25-a4ed-4f9a-8ca6-9ea3400e2369@tum.de>
 <6d28eb0c-caed-4c58-a6ac-cbf8da357d22@tum.de>
 <21dcca4d-1c51-42f1-b73b-65702451de13@suse.com>
Content-Language: en-US
From: Manuel Andreas <manuel.andreas@tum.de>
Autocrypt: addr=manuel.andreas@tum.de; keydata=
 xjMEY9Zx/RYJKwYBBAHaRw8BAQdALWzRzW9a74DX4l6i8VzXGvv72Vz0qfvj9s7bjBD905nN
 Jk1hbnVlbCBBbmRyZWFzIDxtYW51ZWwuYW5kcmVhc0B0dW0uZGU+wokEExYIADEWIQQuSfNX
 11QV6exAUmOqZGwY4LuingUCY9Zx/QIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEKpkbBjgu6Ke
 McQBAPyP530S365I50I5rM2XjH5Hr9YcUQATD5dusZJMDgejAP9T/wUurwQSuRfm1rK8cNcf
 w4wP3+PLvL+J+kuVku93CM44BGPWcf0SCisGAQQBl1UBBQEBB0AmCAf31tLBD5tvtdZ0XX1B
 yGLUAxhgmFskGyPhY8wOKQMBCAfCeAQYFggAIBYhBC5J81fXVBXp7EBSY6pkbBjgu6KeBQJj
 1nH9AhsMAAoJEKpkbBjgu6Kej6YA/RvJdXMjsD5csifolLw53KX0/ElM22SvaGym1+KiiVND
 AQDy+y+bCXI+J713/AwLBsDxTEXmP7Cp49ZqbAu83NnpBQ==
In-Reply-To: <21dcca4d-1c51-42f1-b73b-65702451de13@suse.com>

This is a multi-part message in MIME format.
--------------1EvWbjWPzA6lFP0fbfCwHvBg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/2/25 4:12 PM, Jan Beulich wrote:

> On 02.06.2025 15:39, Manuel Andreas wrote:
>> I've discovered an issue in the nested VMX implementation, where an
>> unprivileged domain is able to force Xen to dereference a NULL pointer,
>> resulting in a panic.
> Sadly you provide no details on this NULL deref.
Here's the respective dump:

----[ Xen-4.20.0  x86_64  debug=y Tainted:     H  ]----
(XEN) CPU:    1
(XEN) RIP:    e008:[<ffff82d0402ae2b8>] nvmx_handle_vmx_insn+0x7ab/0xccb
(XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d1v0)
(XEN) rax: 0000000000000000   rbx: 0000000000000000   rcx: 8000000000000002
(XEN) rdx: 0000000000000000   rsi: 01ffffffffffffff   rdi: ffff82e0020155e0
(XEN) rbp: ffff830179407e68   rsp: ffff830179407e00   r8: ffff82c00023b000
(XEN) r9:  ffff830179413c40   r10: 0000000000000000   r11: 0000000000000200
(XEN) r12: ffff83010483d000  r13: ffff830179407ef8   r14: 0000000000000000
(XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 00000000003526e0
(XEN) cr3: 000000010498f000   cr2: 0000000000000000
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d0402ae2b8> (nvmx_handle_vmx_insn+0x7ab/0xccb):
(XEN)  75 b0 0f 86 12 05 00 00 <81> 08 00 00 00 80 41 8b 84 24 f4 05 00 
00 80 cc
(XEN) Xen stack trace from rsp=ffff830179407e00:
(XEN)    ffff83010483d000 000000000011e000 0000000000000000 0000000000000000
(XEN)    ffff82d0402bfc4a 0000000100000000 0000000000119fa8 ffff82d000000008
(XEN)    ffff830100000006 ffff830179407ef8 0000000000000015 ffff83010483d000
(XEN)    0000000000000000 ffff830179407ee8 ffff82d0402a9a19 ffff82d04020361b
(XEN)    0000000000000000 0000000000000000 0000000000000000 ffff830100997000
(XEN)    ffff82d040203615 ffff82d04020361b ffff82d040203615 ffff82d04020361b
(XEN)    ffff83010483d000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 00007cfe86bf80e7 ffff82d040203673 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000001
(XEN)    0000000000000000 0000000000000000 0000000000000043 000000000000007b
(XEN)    0000000000000043 0000000000000000 0000000000000000 0000000011e57e00
(XEN)    0000000000000000 0000000000000000 0000beef0000beef 0000000000103fa2
(XEN)    000000bf0000beef 0000000000000046 0000000000119fa0 000000000000beef
(XEN)    000000000000beef 000000000000beef 000000000000beef 000000000000beef
(XEN)    0000e01000000001 ffff83010483d000 0000003136627000 00000000003526e0
(XEN)    0000000000000000 0000000000000000 0000000300000001 0000004e00000003
(XEN) Xen call trace:
(XEN)    [<ffff82d0402ae2b8>] R nvmx_handle_vmx_insn+0x7ab/0xccb
(XEN)    [<ffff82d0402a9a19>] F vmx_vmexit_handler+0xd97/0x1e14
(XEN)    [<ffff82d040203673>] F vmx_asm_vmexit_handler+0x103/0x220
(XEN)
(XEN) Pagetable walk from 0000000000000000:

(XEN)  L4[0x000] = 0000000000000000 ffffffffffffffff

Where nvmx_handle_vmx_insn+0x7ab/0xccb resolves to 
xen/arch/x86/hvm/vmx/vvmx.c:1169
Specifically, in nvmx_handle_vmptrld we have:

1830    if ( cpu_has_vmx_vmcs_shadowing )
1831        nvmx_set_vmcs_pointer(v, nvcpu->nv_vvmcx);

Which is reachable with nvcpu->nv_vvmcx untouched in the case of the p2m 
mapping for gpa not being writable (see lines 1793 - 1827) .
Therefore, nvcpu->nv_vvmcx will remain NULL (as initialized in 
nvmx_vcpu_initialize).
Further, inside nvmx_set_vmcs_pointer:

1164    static void nvmx_set_vmcs_pointer(struct vcpu *v, struct 
vmcs_struct *vvmcs)
1165    {
1166        paddr_t vvmcs_maddr = v->arch.hvm.vmx.vmcs_shadow_maddr;
1167
1168        __vmpclear(vvmcs_maddr);
1169        vvmcs->vmcs_revision_id |= VMCS_RID_TYPE_MASK;
1170        /* ... */

will then dereference vvmcs, which is NULL.

>> This is possible when:
>>
>>   1. The malicious domain has nested HVM capabilities.
>>   2. The CPU is running on top of VMX and supports shadow VMCS.
>>
>> To trigger the bug, the domain must first enable VMX operation for
>> itself, execute VMXON and then finally execute VMPTRLD on a guest
>> physical address that is backed by a non-writable p2m mapping.
>> In `nvmx_handle_vmptrld`, after attempting to map the nested VMCS, Xen
>> will check whether or not this mapping is suitable for writing and if
>> not immediately unmap the nested VMCS again and abort the setup of
>> `nvcpu->nv_vvmcx`. However, Xen at this point erroneously continues
>> emulation of the VMPTRLD. In particular, if VMCS shadowing is available,
>> Xen will nonetheless attempt to link up the nested VMCS to its own VMCS
>> in `nvmx_set_vmcs_pointer`. Importantly, Xen here attempts to
>> dereference the presumably mapped nested VMCS (which now is merely a
>> NULL pointer) in order to mark it as a shadow VMCS by applying the
>> `VMCS_RID_TYPE_MASK` to its revision identifier. Following, the page
>> fault handler will panic Xen.
>>
>> I've attached an XTF reproducer that triggers the bug. To setup such a
>> non-writable p2m mapping for the malicious VMCS, I first setup an
>> appropriate grant table entry. I've tested it on Xen version 4.20.0.
> I expect this to not work anymore on current staging or 4.20.1-pre.
> See a8325f981ce4 ("x86/P2M: synchronize fast and slow paths of
> p2m_get_page_from_gfn()").
On first glance I don't see how that would impact the type of the 
established p2m mapping.
If you want I can compile staging and test if the PoC does not work 
there anymore.
>
>> To fix the issue I believe the following patch should be suitable:
>>
>> --- a/xen/arch/x86/hvm/vmx/vvmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vvmx.c
>> @@ -1817,7 +1817,9 @@ static int nvmx_handle_vmptrld(struct
>> cpu_user_regs *regs)
>>                else
>>                {
>>                    hvm_unmap_guest_frame(vvmcx, 1);
>> -                vvmcx = NULL;
>> +                vmfail(regs, VMX_INSN_VMPTRLD_INVALID_PHYADDR);
>> +
>> +                return X86EMUL_OKAY;
>>                }
>>            }
>>            else
>>
>> The VMX error AFAICT does not strictly adhere to the Intel SDM, but
>> providing the guest some indication on what went wrong is likely more
>> sensible than silently failing.
> Giving the guest some indication is certainly right. If we want to follow
> the above route, I think the change would want doing a little differently,
> to take the path that presently is the "else" at the bottom of the hunk
> above. However, I can't presently see how invoking vmfail() would make a
> difference as to the subsequent NULL deref: The guest could continue the
> same irrespective of the failure. Hence why I'd like to understand what
> NULL deref you did observe. (We may hence need two patches - one along
> the above lines, and another one dealing with the NULL issue.)

The issue is really just in the latter part of nvmx_handle_vmptrld, 
which attempts to initialize its shadow VMCS even though establishing a 
mapping for the nested VMCS failed.
An early exit from that function (as my patch suggests) should be 
sufficient for that case.
Other parts of the nested VMX code already check for a valid nested VMCS 
via vvmcx_valid. There simply isn't such a check here presumably because 
the assumption was that any previous errors in mapping the nested VMCS 
were already handled by returning from the function or jumping to the 
out label.

Best,
Manuel

--------------1EvWbjWPzA6lFP0fbfCwHvBg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>On 6/2/25 4:12 PM, Jan Beulich wrote:</p>
    <blockquote type="cite"
      cite="mid:21dcca4d-1c51-42f1-b73b-65702451de13@suse.com">
      <pre wrap="" class="moz-quote-pre">On 02.06.2025 15:39, Manuel Andreas wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">I've discovered an issue in the nested VMX implementation, where an 
unprivileged domain is able to force Xen to dereference a NULL pointer, 
resulting in a panic.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Sadly you provide no details on this NULL deref.
</pre>
    </blockquote>
    Here's the respective dump:<br>
    <br>
    <font face="monospace">----[ Xen-4.20.0  x86_64  debug=y 
      Tainted:     H  ]----<br>
      (XEN) CPU:    1<br>
      (XEN) RIP:    e008:[&lt;ffff82d0402ae2b8&gt;]
      nvmx_handle_vmx_insn+0x7ab/0xccb<br>
      (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d1v0)<br>
      (XEN) rax: 0000000000000000   rbx: 0000000000000000   rcx:
      8000000000000002<br>
      (XEN) rdx: 0000000000000000   rsi: 01ffffffffffffff   rdi:
      ffff82e0020155e0<br>
      (XEN) rbp: ffff830179407e68   rsp: ffff830179407e00   r8: 
      ffff82c00023b000<br>
      (XEN) r9:  ffff830179413c40   r10: 0000000000000000   r11:
      0000000000000200<br>
      (XEN) r12: ffff83010483d000  r13: ffff830179407ef8   r14:
      0000000000000000<br>
      (XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4:
      00000000003526e0<br>
      (XEN) cr3: 000000010498f000   cr2: 0000000000000000<br>
      (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss:
      0000000000000000<br>
      (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs:
      e008<br>
      (XEN) Xen code around &lt;ffff82d0402ae2b8&gt;
      (nvmx_handle_vmx_insn+0x7ab/0xccb):<br>
      (XEN)  75 b0 0f 86 12 05 00 00 &lt;81&gt; 08 00 00 00 80 41 8b 84
      24 f4 05 00 00 80 cc<br>
      (XEN) Xen stack trace from rsp=ffff830179407e00:<br>
      (XEN)    ffff83010483d000 000000000011e000 0000000000000000
      0000000000000000<br>
      (XEN)    ffff82d0402bfc4a 0000000100000000 0000000000119fa8
      ffff82d000000008<br>
      (XEN)    ffff830100000006 ffff830179407ef8 0000000000000015
      ffff83010483d000<br>
      (XEN)    0000000000000000 ffff830179407ee8 ffff82d0402a9a19
      ffff82d04020361b<br>
      (XEN)    0000000000000000 0000000000000000 0000000000000000
      ffff830100997000<br>
      (XEN)    ffff82d040203615 ffff82d04020361b ffff82d040203615
      ffff82d04020361b<br>
      (XEN)    ffff83010483d000 0000000000000000 0000000000000000
      0000000000000000<br>
      (XEN)    0000000000000000 00007cfe86bf80e7 ffff82d040203673
      0000000000000000<br>
      (XEN)    0000000000000000 0000000000000000 0000000000000000
      0000000000000001<br>
      (XEN)    0000000000000000 0000000000000000 0000000000000043
      000000000000007b<br>
      (XEN)    0000000000000043 0000000000000000 0000000000000000
      0000000011e57e00<br>
      (XEN)    0000000000000000 0000000000000000 0000beef0000beef
      0000000000103fa2<br>
      (XEN)    000000bf0000beef 0000000000000046 0000000000119fa0
      000000000000beef<br>
      (XEN)    000000000000beef 000000000000beef 000000000000beef
      000000000000beef<br>
      (XEN)    0000e01000000001 ffff83010483d000 0000003136627000
      00000000003526e0<br>
      (XEN)    0000000000000000 0000000000000000 0000000300000001
      0000004e00000003<br>
      (XEN) Xen call trace:<br>
      (XEN)    [&lt;ffff82d0402ae2b8&gt;] R
      nvmx_handle_vmx_insn+0x7ab/0xccb<br>
      (XEN)    [&lt;ffff82d0402a9a19&gt;] F
      vmx_vmexit_handler+0xd97/0x1e14<br>
      (XEN)    [&lt;ffff82d040203673&gt;] F
      vmx_asm_vmexit_handler+0x103/0x220<br>
      (XEN)<br>
      (XEN) Pagetable walk from 0000000000000000:<br>
    </font>
    <p><font face="monospace">(XEN)  L4[0x000] = 0000000000000000
        ffffffffffffffff</font></p>
    <p>Where <font face="monospace">nvmx_handle_vmx_insn+0x7ab/0xccb </font>resolves
      to <font face="monospace">xen/arch/x86/hvm/vmx/vvmx.c:1169</font><br>
      Specifically, in <font face="monospace">nvmx_handle_vmptrld</font>
      we have:<font face="monospace"><br>
      </font></p>
    <pre>1830    if ( cpu_has_vmx_vmcs_shadowing )
1831        nvmx_set_vmcs_pointer(v, nvcpu-&gt;nv_vvmcx);</pre>
    <p>Which is reachable with <font face="monospace">nvcpu-&gt;nv_vvmcx</font>
      untouched in the case of the p2m mapping for <font
        face="monospace">gpa</font> not being writable (see lines 1793 -
      1827) .<br>
      Therefore, <font face="monospace">nvcpu-&gt;nv_vvmcx</font> will
      remain NULL (as initialized in <font face="monospace">nvmx_vcpu_initialize</font>).<br>
      Further, inside <font face="monospace">nvmx_set_vmcs_pointer</font>:</p>
    <p><font face="monospace">1164    static void
        nvmx_set_vmcs_pointer(struct vcpu *v, struct vmcs_struct *vvmcs)<br>
        1165    {<br>
        1166        paddr_t vvmcs_maddr =
        v-&gt;arch.hvm.vmx.vmcs_shadow_maddr;<br>
        1167<br>
        1168        __vmpclear(vvmcs_maddr);<br>
        1169        vvmcs-&gt;vmcs_revision_id |= VMCS_RID_TYPE_MASK;<br>
        1170        /* ... */</font></p>
    <p>will then dereference vvmcs, which is NULL.</p>
    <blockquote type="cite"
      cite="mid:21dcca4d-1c51-42f1-b73b-65702451de13@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">This is possible when:

 1. The malicious domain has nested HVM capabilities.
 2. The CPU is running on top of VMX and supports shadow VMCS.

To trigger the bug, the domain must first enable VMX operation for 
itself, execute VMXON and then finally execute VMPTRLD on a guest 
physical address that is backed by a non-writable p2m mapping.
In `nvmx_handle_vmptrld`, after attempting to map the nested VMCS, Xen 
will check whether or not this mapping is suitable for writing and if 
not immediately unmap the nested VMCS again and abort the setup of 
`nvcpu-&gt;nv_vvmcx`. However, Xen at this point erroneously continues 
emulation of the VMPTRLD. In particular, if VMCS shadowing is available, 
Xen will nonetheless attempt to link up the nested VMCS to its own VMCS 
in `nvmx_set_vmcs_pointer`. Importantly, Xen here attempts to 
dereference the presumably mapped nested VMCS (which now is merely a 
NULL pointer) in order to mark it as a shadow VMCS by applying the 
`VMCS_RID_TYPE_MASK` to its revision identifier. Following, the page 
fault handler will panic Xen.

I've attached an XTF reproducer that triggers the bug. To setup such a 
non-writable p2m mapping for the malicious VMCS, I first setup an 
appropriate grant table entry. I've tested it on Xen version 4.20.0.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I expect this to not work anymore on current staging or 4.20.1-pre.
See a8325f981ce4 ("x86/P2M: synchronize fast and slow paths of
p2m_get_page_from_gfn()").</pre>
    </blockquote>
    On first glance I don't see how that would impact the type of the
    established p2m mapping.<br>
    If you want I can compile staging and test if the PoC does not work
    there anymore.
    <blockquote type="cite"
      cite="mid:21dcca4d-1c51-42f1-b73b-65702451de13@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">To fix the issue I believe the following patch should be suitable:

--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1817,7 +1817,9 @@ static int nvmx_handle_vmptrld(struct 
cpu_user_regs *regs)
              else
              {
                  hvm_unmap_guest_frame(vvmcx, 1);
-                vvmcx = NULL;
+                vmfail(regs, VMX_INSN_VMPTRLD_INVALID_PHYADDR);
+
+                return X86EMUL_OKAY;
              }
          }
          else

The VMX error AFAICT does not strictly adhere to the Intel SDM, but 
providing the guest some indication on what went wrong is likely more 
sensible than silently failing.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Giving the guest some indication is certainly right. If we want to follow
the above route, I think the change would want doing a little differently,
to take the path that presently is the "else" at the bottom of the hunk
above. However, I can't presently see how invoking vmfail() would make a
difference as to the subsequent NULL deref: The guest could continue the
same irrespective of the failure. Hence why I'd like to understand what
NULL deref you did observe. (We may hence need two patches - one along
the above lines, and another one dealing with the NULL issue.)</pre>
    </blockquote>
    <span style="white-space: pre-wrap">
</span>
    <p><span style="white-space: pre-wrap">The issue is really just in the latter part of </span><font
        face="monospace">nvmx_handle_vmptrld</font>, which attempts to
      initialize its shadow VMCS even though establishing a mapping for
      the nested VMCS failed.<br>
      An early exit from that function (as my patch suggests) should be
      sufficient for that case.<br>
      Other parts of the nested VMX code already check for a valid
      nested VMCS via <font face="monospace">vvmcx_valid</font>. There
      simply isn't such a check here presumably because the assumption
      was that any previous errors in mapping the nested VMCS were
      already handled by returning from the function or jumping to the <font
        face="monospace">out</font> label.</p>
    <p>Best,<br>
      Manuel</p>
  </body>
</html>

--------------1EvWbjWPzA6lFP0fbfCwHvBg--

