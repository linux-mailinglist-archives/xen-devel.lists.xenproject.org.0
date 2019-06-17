Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3501048B02
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 19:58:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcvr4-0004n5-7w; Mon, 17 Jun 2019 17:55:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ct8y=UQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hcvr3-0004n0-1U
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 17:55:41 +0000
X-Inumbo-ID: 1c9fa1c0-9129-11e9-8d81-670ca9ccfccc
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c9fa1c0-9129-11e9-8d81-670ca9ccfccc;
 Mon, 17 Jun 2019 17:55:37 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: M8zY47nogq3P97cDANn6/F4K+YCt7IZlM/pppHAceTdZE9pvbaP/UiILaihHVYRbk0TBnrPeYH
 byN+5J8+WAhVqKgIRVPty1UJ7NH9+v7Mn+Qyv/sg/cUqJ5EGbHDRGQbGHtW3LIE9xV7ooiDY0s
 Pf31O74msCZnfxtLaCTaH6HwzrXjhPVTW6q+KH+ycOlhgr4iLaEysSIyjK/9fdHeMHOt8p9Ua6
 gbJy2flGimX/lb99rjd8oQVtXftNyF2qrDDjLw+gfUE4ReWVVMXQlgQMjFVkiCyL1OooD3ppgp
 mI0=
X-SBRS: 2.7
X-MesageID: 1854738
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,386,1557201600"; d="scan'208,217";a="1854738"
To: <xen-devel@lists.xenproject.org>
References: <5CEE5C4D02000078002335A0@prv1-mh.provo.novell.com>
 <caa80cec-7b46-b31a-88e2-2554a495e159@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <5183a4f3-69ff-076a-c15d-817472a42ab1@citrix.com>
Date: Mon, 17 Jun 2019 18:55:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <caa80cec-7b46-b31a-88e2-2554a495e159@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/SMP: don't try to stop already stopped
 CPUs
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
Content-Type: multipart/mixed; boundary="===============5391057011022370714=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5391057011022370714==
Content-Type: multipart/alternative;
	boundary="------------2BF2B87DF463DDD9FD6C10BB"
Content-Language: en-GB

--------------2BF2B87DF463DDD9FD6C10BB
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 17/06/2019 18:39, Andrew Cooper wrote:
> On 29/05/2019 11:17, Jan Beulich wrote:
>> In particular with an enabled IOMMU (but not really limited to this
>> case), trying to invoke fixup_irqs() after having already done
>> disable_IO_APIC() -> clear_IO_APIC() is a rather bad idea:
>>
>>  RIP:    e008:[<ffff82d08026a036>] amd_iommu_read_ioapic_from_ire+0xde/0x113
>>  RFLAGS: 0000000000010006   CONTEXT: hypervisor (d0v0)
>>  rax: ffff8320291de00c   rbx: 0000000000000003   rcx: ffff832035000000
>>  rdx: 0000000000000000   rsi: 0000000000000000   rdi: ffff82d0805ca840
>>  rbp: ffff83009e8a79c8   rsp: ffff83009e8a79a8   r8:  0000000000000000
>>  r9:  0000000000000004   r10: 000000000008b9f9   r11: 0000000000000006
>>  r12: 0000000000010000   r13: 0000000000000003   r14: 0000000000000000
>>  r15: 00000000fffeffff   cr0: 0000000080050033   cr4: 00000000003406e0
>>  cr3: 0000002035d59000   cr2: ffff88824ccb4ee0
>>  fsb: 00007f2143f08840   gsb: ffff888256a00000   gss: 0000000000000000
>>  ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
>>  Xen code around <ffff82d08026a036> (amd_iommu_read_ioapic_from_ire+0xde/0x113):
>>   ff 07 00 00 39 d3 74 02 <0f> 0b 41 81 e4 00 f8 ff ff 8b 10 89 d0 25 00 00
>>  Xen stack trace from rsp=ffff83009e8a79a8:
>>  ...
>>  Xen call trace:
>>     [<ffff82d08026a036>] amd_iommu_read_ioapic_from_ire+0xde/0x113
>>     [<ffff82d08026bf7b>] iommu_read_apic_from_ire+0x10/0x12
>>     [<ffff82d08027f718>] io_apic.c#modify_IO_APIC_irq+0x5e/0x126
>>     [<ffff82d08027f9c5>] io_apic.c#unmask_IO_APIC_irq+0x2d/0x41
>>     [<ffff82d080289bc7>] fixup_irqs+0x320/0x40b
>>     [<ffff82d0802a82c4>] smp_send_stop+0x4b/0xa8
>>     [<ffff82d0802a7b2f>] machine_restart+0x98/0x288
>>     [<ffff82d080252242>] console_suspend+0/0x28
>>     [<ffff82d0802b01da>] do_general_protection+0x204/0x24e
>>     [<ffff82d080385a3d>] x86_64/entry.S#handle_exception_saved+0x68/0x94
>>     [<00000000aa5b526b>] 00000000aa5b526b
>>     [<ffff82d0802a7c7d>] machine_restart+0x1e6/0x288
>>     [<ffff82d080240f75>] hwdom_shutdown+0xa2/0x11d
>>     [<ffff82d08020baa2>] domain_shutdown+0x4f/0xd8
>>     [<ffff82d08023fe98>] do_sched_op+0x12f/0x42a
>>     [<ffff82d08037e404>] pv_hypercall+0x1e4/0x564
>>     [<ffff82d080385432>] lstar_enter+0x112/0x120
>>
>> Don't call fixup_irqs() and don't send any IPI if there's only one
>> online CPU anyway, and don't call __stop_this_cpu() at all when the CPU
>> we're on was already marked offline (by a prior invocation of
>> __stop_this_cpu()).
>>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> It is probably worth noting that the above stack trace is a cascade
> fault, where we took a #GP fault in the middle of the EFI firmware, and
> then tried restarting a second time.
>
> For the change it is an improvement, so Acked-by: Andrew Cooper
> <andrew.cooper3@citrix.com>
>
> There are further fixes needing (which have been on my todo list for
> rather too long) to avoid any local_irq_enable() on the shutdown path,
> because during a crash (especially one in the middle of a vcpu context
> switch), its not safe to re-enable interrupts.
>
> The only solution I've got involves using NMI based IPIs/shootdowns.

/sigh and no sooner as I tried testing this, I found the next piece of
fallout:

[   90.447906] reboot: Restarting system
(XEN) Hardware Dom0 shutdown: rebooting machine
(XEN) ----[ Xen-4.13-unstable  x86_64  debug=y   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<00000000aa5b526b>] 00000000aa5b526b
(XEN) RFLAGS: 0000000000010246   CONTEXT: hypervisor
(XEN) rax: 00000000aa985950   rbx: 0000000000000000   rcx: 00000000aa5b7010
(XEN) rdx: 0000000000000000   rsi: ffff83009e827fff   rdi: 00000000003506e0
(XEN) rbp: ffff83009e827c70   rsp: ffff83009e827bb0   r8:  00000000aa5b7048
(XEN) r9:  0000000000000000   r10: ffff83009e827c88   r11: 0f0f0f0f0f0f0f0f
(XEN) r12: 00000000fffffffe   r13: 0000000000000cf9   r14: 0000000000000000
(XEN) r15: 0000000000000065   cr0: 0000000080050033   cr4: 00000000003506e0
(XEN) cr3: 00000010f5218000   cr2: ffff88825990c800
(XEN) fsb: 0000000000000000   gsb: ffff888266a00000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <00000000aa5b526b> (00000000aa5b526b):
(XEN)  8d 0d a7 1d 00 00 33 d2 <ff> 90 40 01 00 00 48 8b 05 d0 1d 00 00 48 83 c4
(XEN) Xen stack trace from rsp=ffff83009e827bb0:
(XEN)    000000000000001f 00000000003506e0 ffff83009e827c00 0000000000000206
(XEN)    ffff82d08027d96a 00000000aa5b51f7 0000000000000286 ffff83009e827c40
(XEN)    000000009e817000 0000000000000cf9 ffff83009e827c30 ffff82d080201327
(XEN)    00000000ffffffff ffff82d08020162e 0000000000000000 00000000fffffffe
(XEN)    ffff83009e827c70 ffff82d0802015ff 000000009e817000 ffff83009e827c78
(XEN)    ffff82d0802a372a 0000000080000000 0000000000000000 ffff83009e827c88
(XEN)    ffff83009e827cd8 ffff82d0802a3045 ffff82d0802a3045 ffff83009e827c98
(XEN)    000000008028454c 000082d080387851 0000000000000000 ffff82d080387851
(XEN)    0000000000000000 ffff83009e827d98 00000000000000fb 0000000080000000
(XEN)    0000000000000000 ffff83009e827ce8 ffff82d0802a3105 ffff83009e827d08
(XEN)    ffff82d08023cdaa ffff82d080387851 0000000000000000 ffff83009e827d18
(XEN)    ffff82d0802a37da ffff83009e827d88 ffff82d080283fb4 ffff82d080387851
(XEN)    ffff82d080387845 0000000000000000 ffff82d080387845 ffff82d080387851
(XEN)    ffff82d080387845 ffff82d080387851 0000000000000000 0000000000000000
(XEN)    0000000000000000 ffff83009e827fff 0000000000000000 00007cff617d8247
(XEN)    ffff82d0803878ba ffff82d080933900 0000000000000000 000000204b161644
(XEN)    ffff8310f5206ef8 ffff83009e827e40 ffff8310f5206ea0 0000002065fe762e
(XEN)    000000204bbfce6e ffff82d08095c3e0 ffff83009e827ef8 0000000000000000
(XEN)    0000000000000048 0000000000000000 ffff83009e827fff ffff8310f5206ef8
(XEN)    000000fb00000000 ffff82d0802e1bc5 000000000000e008 0000000000000206
(XEN) Xen call trace:
(XEN)    [<00000000aa5b526b>] 00000000aa5b526b
(XEN)    [<ffff82d0802a3045>] machine_restart+0x1ef/0x2a4
(XEN)    [<ffff82d0802a3105>] send_IPI_mask+0/0xc
(XEN)    [<ffff82d08023cdaa>] smp_call_function_interrupt+0x95/0xb8
(XEN)    [<ffff82d0802a37da>] call_function_interrupt+0x35/0x37
(XEN)    [<ffff82d080283fb4>] do_IRQ+0xa7/0x697
(XEN)    [<ffff82d0803878ba>] common_interrupt+0x10a/0x120
(XEN)    [<ffff82d0802e1bc5>] cpu_idle.c#acpi_idle_do_entry+0xa4/0xb5
(XEN)    [<ffff82d0802e20ae>] cpu_idle.c#acpi_processor_idle+0x313/0x590
(XEN)    [<ffff82d080274f8c>] domain.c#idle_loop+0xa2/0xb1
(XEN) 
(XEN) 
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) GENERAL PROTECTION FAULT
(XEN) [error_code=0000]
(XEN) ****************************************
(XEN) 
(XEN) Reboot in five seconds...
(XEN) Executing kexec image on cpu0
(XEN) Shot down all CPUs
(XEN) Assertion 'offset == (val & (INTREMAP_ENTRIES - 1))' failed at iommu_intr.c:567
(XEN) ----[ Xen-4.13-unstable  x86_64  debug=y   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d080266844>] amd_iommu_read_ioapic_from_ire+0xd0/0x131
(XEN) RFLAGS: 0000000000010002   CONTEXT: hypervisor
(XEN) rax: 0000000000000000   rbx: 0000000000000014   rcx: ffff832005d68010
(XEN) rdx: ffff832005d68000   rsi: 0000000000000000   rdi: ffff82d080942a00
(XEN) rbp: ffff83009e827948   rsp: ffff83009e827928   r8:  ffff82d0808074c0
(XEN) r9:  ffff82d080942a08   r10: 0000000000000000   r11: 0000000000000001
(XEN) r12: 0000000000010000   r13: 0000000000000001   r14: 0000000000000000
(XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 00000000003506e0
(XEN) cr3: 00000010f5218000   cr2: ffff88825990c800
(XEN) fsb: 0000000000000000   gsb: ffff888266a00000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <ffff82d080266844> (amd_iommu_read_ioapic_from_ire+0xd0/0x131):
(XEN)  07 00 00 41 39 c5 74 02 <0f> 0b 41 81 e4 00 f8 ff ff 0f b6 11 c0 ea 02 83
(XEN) Xen stack trace from rsp=ffff83009e827928:
(XEN)    ffff82d08027c244 0000000000000014 ffff82d080806980 0000000000000000
(XEN)    ffff83009e827958 ffff82d0802687a7 ffff83009e827968 ffff82d08027c25b
(XEN)    ffff83009e827998 ffff82d08027cefb 0000000000000000 0000000000000002
(XEN)    ffff82d080806980 ffff82d080806980 ffff83009e8279c8 ffff82d08027d8c8
(XEN)    ffff83009e827fff 0000000000010000 0000000000000002 0000000000000000
(XEN)    ffff83009e8279f8 ffff82d08027d9ce 00000000000003e8 ffff82d080943b80
(XEN)    0000000000000000 ffff83009e827fff ffff83009e827a18 ffff82d08027dd30
(XEN)    ffff83009e827a18 ffff82d0802a3626 ffff83009e827a38 ffff82d080270a79
(XEN)    0000000000000003 ffff82d08043f858 ffff83009e827a58 ffff82d08021dd74
(XEN)    0000000000000206 0000000000000296 ffff83009e827ac8 ffff82d08024db40
(XEN)    ffff83009e827aa8 ffff82d000000010 ffff83009e827ad8 ffff83009e827a88
(XEN)    ffff83009e827aa8 0000000000000000 ffff83009e827fff 0000000000000000
(XEN)    ffff8310f3e00000 0000000000000002 ffff83009e827b08 0000000000000000
(XEN)    ffff83009e827af8 ffff82d0802ab1b8 ffff82d080387979 ffff82d08038796d
(XEN)    ffff8310f4c08000 0000000000000000 00007cff617d84d7 ffff82d080387a3d
(XEN)    0000000000000065 0000000000000000 0000000000000cf9 00000000fffffffe
(XEN)    ffff83009e827c70 0000000000000000 0f0f0f0f0f0f0f0f ffff83009e827c88
(XEN)    0000000000000000 00000000aa5b7048 00000000aa985950 00000000aa5b7010
(XEN)    0000000000000000 ffff83009e827fff 00000000003506e0 0000000d00000000
(XEN)    00000000aa5b526b 000000000000e008 0000000000010246 ffff83009e827bb0
(XEN) Xen call trace:
(XEN)    [<ffff82d080266844>] amd_iommu_read_ioapic_from_ire+0xd0/0x131
(XEN)    [<ffff82d0802687a7>] iommu_read_apic_from_ire+0x10/0x12
(XEN)    [<ffff82d08027c25b>] io_apic.c#io_apic_read+0x17/0x5f
(XEN)    [<ffff82d08027cefb>] __ioapic_read_entry+0x2f/0x55
(XEN)    [<ffff82d08027d8c8>] io_apic.c#clear_IO_APIC_pin+0x1a/0xf3
(XEN)    [<ffff82d08027d9ce>] io_apic.c#clear_IO_APIC+0x2d/0x60
(XEN)    [<ffff82d08027dd30>] disable_IO_APIC+0xd/0x7e
(XEN)    [<ffff82d080270a79>] machine_crash_shutdown+0x228/0x292
(XEN)    [<ffff82d08021dd74>] kexec_crash+0x3f/0x5b
(XEN)    [<ffff82d08024db40>] panic+0x117/0x12f
(XEN)    [<ffff82d0802ab1b8>] do_general_protection+0x22b/0x234
(XEN)    [<ffff82d080387a3d>] x86_64/entry.S#handle_exception_saved+0x68/0x94
(XEN)    [<00000000aa5b526b>] 00000000aa5b526b
(XEN)    [<ffff82d0802a3045>] machine_restart+0x1ef/0x2a4
(XEN)    [<ffff82d0802a3105>] send_IPI_mask+0/0xc
(XEN)    [<ffff82d08023cdaa>] smp_call_function_interrupt+0x95/0xb8
(XEN)    [<ffff82d0802a37da>] call_function_interrupt+0x35/0x37
(XEN)    [<ffff82d080283fb4>] do_IRQ+0xa7/0x697
(XEN)    [<ffff82d0803878ba>] common_interrupt+0x10a/0x120
(XEN)    [<ffff82d0802e1bc5>] cpu_idle.c#acpi_idle_do_entry+0xa4/0xb5
(XEN)    [<ffff82d0802e20ae>] cpu_idle.c#acpi_processor_idle+0x313/0x590
(XEN)    [<ffff82d080274f8c>] domain.c#idle_loop+0xa2/0xb1
(XEN) 
(XEN) 
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Assertion 'offset == (val & (INTREMAP_ENTRIES - 1))' failed at iommu_intr.c:567
(XEN) ****************************************
(XEN) 


I think we need a similar adjustment in nmi_shootdown_cpus()

~Andrew

--------------2BF2B87DF463DDD9FD6C10BB
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 17/06/2019 18:39, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:caa80cec-7b46-b31a-88e2-2554a495e159@citrix.com">
      <pre class="moz-quote-pre" wrap="">On 29/05/2019 11:17, Jan Beulich wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">In particular with an enabled IOMMU (but not really limited to this
case), trying to invoke fixup_irqs() after having already done
disable_IO_APIC() -&gt; clear_IO_APIC() is a rather bad idea:

 RIP:    e008:[&lt;ffff82d08026a036&gt;] amd_iommu_read_ioapic_from_ire+0xde/0x113
 RFLAGS: 0000000000010006   CONTEXT: hypervisor (d0v0)
 rax: ffff8320291de00c   rbx: 0000000000000003   rcx: ffff832035000000
 rdx: 0000000000000000   rsi: 0000000000000000   rdi: ffff82d0805ca840
 rbp: ffff83009e8a79c8   rsp: ffff83009e8a79a8   r8:  0000000000000000
 r9:  0000000000000004   r10: 000000000008b9f9   r11: 0000000000000006
 r12: 0000000000010000   r13: 0000000000000003   r14: 0000000000000000
 r15: 00000000fffeffff   cr0: 0000000080050033   cr4: 00000000003406e0
 cr3: 0000002035d59000   cr2: ffff88824ccb4ee0
 fsb: 00007f2143f08840   gsb: ffff888256a00000   gss: 0000000000000000
 ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
 Xen code around &lt;ffff82d08026a036&gt; (amd_iommu_read_ioapic_from_ire+0xde/0x113):
  ff 07 00 00 39 d3 74 02 &lt;0f&gt; 0b 41 81 e4 00 f8 ff ff 8b 10 89 d0 25 00 00
 Xen stack trace from rsp=ffff83009e8a79a8:
 ...
 Xen call trace:
    [&lt;ffff82d08026a036&gt;] amd_iommu_read_ioapic_from_ire+0xde/0x113
    [&lt;ffff82d08026bf7b&gt;] iommu_read_apic_from_ire+0x10/0x12
    [&lt;ffff82d08027f718&gt;] io_apic.c#modify_IO_APIC_irq+0x5e/0x126
    [&lt;ffff82d08027f9c5&gt;] io_apic.c#unmask_IO_APIC_irq+0x2d/0x41
    [&lt;ffff82d080289bc7&gt;] fixup_irqs+0x320/0x40b
    [&lt;ffff82d0802a82c4&gt;] smp_send_stop+0x4b/0xa8
    [&lt;ffff82d0802a7b2f&gt;] machine_restart+0x98/0x288
    [&lt;ffff82d080252242&gt;] console_suspend+0/0x28
    [&lt;ffff82d0802b01da&gt;] do_general_protection+0x204/0x24e
    [&lt;ffff82d080385a3d&gt;] x86_64/entry.S#handle_exception_saved+0x68/0x94
    [&lt;00000000aa5b526b&gt;] 00000000aa5b526b
    [&lt;ffff82d0802a7c7d&gt;] machine_restart+0x1e6/0x288
    [&lt;ffff82d080240f75&gt;] hwdom_shutdown+0xa2/0x11d
    [&lt;ffff82d08020baa2&gt;] domain_shutdown+0x4f/0xd8
    [&lt;ffff82d08023fe98&gt;] do_sched_op+0x12f/0x42a
    [&lt;ffff82d08037e404&gt;] pv_hypercall+0x1e4/0x564
    [&lt;ffff82d080385432&gt;] lstar_enter+0x112/0x120

Don't call fixup_irqs() and don't send any IPI if there's only one
online CPU anyway, and don't call __stop_this_cpu() at all when the CPU
we're on was already marked offline (by a prior invocation of
__stop_this_cpu()).

Reported-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It is probably worth noting that the above stack trace is a cascade
fault, where we took a #GP fault in the middle of the EFI firmware, and
then tried restarting a second time.

For the change it is an improvement, so Acked-by: Andrew Cooper
<a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>

There are further fixes needing (which have been on my todo list for
rather too long) to avoid any local_irq_enable() on the shutdown path,
because during a crash (especially one in the middle of a vcpu context
switch), its not safe to re-enable interrupts.

The only solution I've got involves using NMI based IPIs/shootdowns.</pre>
    </blockquote>
    <br>
    /sigh and no sooner as I tried testing this, I found the next piece
    of fallout:<br>
    <br>
    <pre>[   90.447906] reboot: Restarting system
(XEN) Hardware Dom0 shutdown: rebooting machine
(XEN) ----[ Xen-4.13-unstable  x86_64  debug=y   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[&lt;00000000aa5b526b&gt;] 00000000aa5b526b
(XEN) RFLAGS: 0000000000010246   CONTEXT: hypervisor
(XEN) rax: 00000000aa985950   rbx: 0000000000000000   rcx: 00000000aa5b7010
(XEN) rdx: 0000000000000000   rsi: ffff83009e827fff   rdi: 00000000003506e0
(XEN) rbp: ffff83009e827c70   rsp: ffff83009e827bb0   r8:  00000000aa5b7048
(XEN) r9:  0000000000000000   r10: ffff83009e827c88   r11: 0f0f0f0f0f0f0f0f
(XEN) r12: 00000000fffffffe   r13: 0000000000000cf9   r14: 0000000000000000
(XEN) r15: 0000000000000065   cr0: 0000000080050033   cr4: 00000000003506e0
(XEN) cr3: 00000010f5218000   cr2: ffff88825990c800
(XEN) fsb: 0000000000000000   gsb: ffff888266a00000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around &lt;00000000aa5b526b&gt; (00000000aa5b526b):
(XEN)  8d 0d a7 1d 00 00 33 d2 &lt;ff&gt; 90 40 01 00 00 48 8b 05 d0 1d 00 00 48 83 c4
(XEN) Xen stack trace from rsp=ffff83009e827bb0:
(XEN)    000000000000001f 00000000003506e0 ffff83009e827c00 0000000000000206
(XEN)    ffff82d08027d96a 00000000aa5b51f7 0000000000000286 ffff83009e827c40
(XEN)    000000009e817000 0000000000000cf9 ffff83009e827c30 ffff82d080201327
(XEN)    00000000ffffffff ffff82d08020162e 0000000000000000 00000000fffffffe
(XEN)    ffff83009e827c70 ffff82d0802015ff 000000009e817000 ffff83009e827c78
(XEN)    ffff82d0802a372a 0000000080000000 0000000000000000 ffff83009e827c88
(XEN)    ffff83009e827cd8 ffff82d0802a3045 ffff82d0802a3045 ffff83009e827c98
(XEN)    000000008028454c 000082d080387851 0000000000000000 ffff82d080387851
(XEN)    0000000000000000 ffff83009e827d98 00000000000000fb 0000000080000000
(XEN)    0000000000000000 ffff83009e827ce8 ffff82d0802a3105 ffff83009e827d08
(XEN)    ffff82d08023cdaa ffff82d080387851 0000000000000000 ffff83009e827d18
(XEN)    ffff82d0802a37da ffff83009e827d88 ffff82d080283fb4 ffff82d080387851
(XEN)    ffff82d080387845 0000000000000000 ffff82d080387845 ffff82d080387851
(XEN)    ffff82d080387845 ffff82d080387851 0000000000000000 0000000000000000
(XEN)    0000000000000000 ffff83009e827fff 0000000000000000 00007cff617d8247
(XEN)    ffff82d0803878ba ffff82d080933900 0000000000000000 000000204b161644
(XEN)    ffff8310f5206ef8 ffff83009e827e40 ffff8310f5206ea0 0000002065fe762e
(XEN)    000000204bbfce6e ffff82d08095c3e0 ffff83009e827ef8 0000000000000000
(XEN)    0000000000000048 0000000000000000 ffff83009e827fff ffff8310f5206ef8
(XEN)    000000fb00000000 ffff82d0802e1bc5 000000000000e008 0000000000000206
(XEN) Xen call trace:
(XEN)    [&lt;00000000aa5b526b&gt;] 00000000aa5b526b
(XEN)    [&lt;ffff82d0802a3045&gt;] machine_restart+0x1ef/0x2a4
(XEN)    [&lt;ffff82d0802a3105&gt;] send_IPI_mask+0/0xc
(XEN)    [&lt;ffff82d08023cdaa&gt;] smp_call_function_interrupt+0x95/0xb8
(XEN)    [&lt;ffff82d0802a37da&gt;] call_function_interrupt+0x35/0x37
(XEN)    [&lt;ffff82d080283fb4&gt;] do_IRQ+0xa7/0x697
(XEN)    [&lt;ffff82d0803878ba&gt;] common_interrupt+0x10a/0x120
(XEN)    [&lt;ffff82d0802e1bc5&gt;] cpu_idle.c#acpi_idle_do_entry+0xa4/0xb5
(XEN)    [&lt;ffff82d0802e20ae&gt;] cpu_idle.c#acpi_processor_idle+0x313/0x590
(XEN)    [&lt;ffff82d080274f8c&gt;] domain.c#idle_loop+0xa2/0xb1
(XEN) 
(XEN) 
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) GENERAL PROTECTION FAULT
(XEN) [error_code=0000]
(XEN) ****************************************
(XEN) 
(XEN) Reboot in five seconds...
(XEN) Executing kexec image on cpu0
(XEN) Shot down all CPUs
(XEN) Assertion 'offset == (val &amp; (INTREMAP_ENTRIES - 1))' failed at iommu_intr.c:567
(XEN) ----[ Xen-4.13-unstable  x86_64  debug=y   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[&lt;ffff82d080266844&gt;] amd_iommu_read_ioapic_from_ire+0xd0/0x131
(XEN) RFLAGS: 0000000000010002   CONTEXT: hypervisor
(XEN) rax: 0000000000000000   rbx: 0000000000000014   rcx: ffff832005d68010
(XEN) rdx: ffff832005d68000   rsi: 0000000000000000   rdi: ffff82d080942a00
(XEN) rbp: ffff83009e827948   rsp: ffff83009e827928   r8:  ffff82d0808074c0
(XEN) r9:  ffff82d080942a08   r10: 0000000000000000   r11: 0000000000000001
(XEN) r12: 0000000000010000   r13: 0000000000000001   r14: 0000000000000000
(XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 00000000003506e0
(XEN) cr3: 00000010f5218000   cr2: ffff88825990c800
(XEN) fsb: 0000000000000000   gsb: ffff888266a00000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around &lt;ffff82d080266844&gt; (amd_iommu_read_ioapic_from_ire+0xd0/0x131):
(XEN)  07 00 00 41 39 c5 74 02 &lt;0f&gt; 0b 41 81 e4 00 f8 ff ff 0f b6 11 c0 ea 02 83
(XEN) Xen stack trace from rsp=ffff83009e827928:
(XEN)    ffff82d08027c244 0000000000000014 ffff82d080806980 0000000000000000
(XEN)    ffff83009e827958 ffff82d0802687a7 ffff83009e827968 ffff82d08027c25b
(XEN)    ffff83009e827998 ffff82d08027cefb 0000000000000000 0000000000000002
(XEN)    ffff82d080806980 ffff82d080806980 ffff83009e8279c8 ffff82d08027d8c8
(XEN)    ffff83009e827fff 0000000000010000 0000000000000002 0000000000000000
(XEN)    ffff83009e8279f8 ffff82d08027d9ce 00000000000003e8 ffff82d080943b80
(XEN)    0000000000000000 ffff83009e827fff ffff83009e827a18 ffff82d08027dd30
(XEN)    ffff83009e827a18 ffff82d0802a3626 ffff83009e827a38 ffff82d080270a79
(XEN)    0000000000000003 ffff82d08043f858 ffff83009e827a58 ffff82d08021dd74
(XEN)    0000000000000206 0000000000000296 ffff83009e827ac8 ffff82d08024db40
(XEN)    ffff83009e827aa8 ffff82d000000010 ffff83009e827ad8 ffff83009e827a88
(XEN)    ffff83009e827aa8 0000000000000000 ffff83009e827fff 0000000000000000
(XEN)    ffff8310f3e00000 0000000000000002 ffff83009e827b08 0000000000000000
(XEN)    ffff83009e827af8 ffff82d0802ab1b8 ffff82d080387979 ffff82d08038796d
(XEN)    ffff8310f4c08000 0000000000000000 00007cff617d84d7 ffff82d080387a3d
(XEN)    0000000000000065 0000000000000000 0000000000000cf9 00000000fffffffe
(XEN)    ffff83009e827c70 0000000000000000 0f0f0f0f0f0f0f0f ffff83009e827c88
(XEN)    0000000000000000 00000000aa5b7048 00000000aa985950 00000000aa5b7010
(XEN)    0000000000000000 ffff83009e827fff 00000000003506e0 0000000d00000000
(XEN)    00000000aa5b526b 000000000000e008 0000000000010246 ffff83009e827bb0
(XEN) Xen call trace:
(XEN)    [&lt;ffff82d080266844&gt;] amd_iommu_read_ioapic_from_ire+0xd0/0x131
(XEN)    [&lt;ffff82d0802687a7&gt;] iommu_read_apic_from_ire+0x10/0x12
(XEN)    [&lt;ffff82d08027c25b&gt;] io_apic.c#io_apic_read+0x17/0x5f
(XEN)    [&lt;ffff82d08027cefb&gt;] __ioapic_read_entry+0x2f/0x55
(XEN)    [&lt;ffff82d08027d8c8&gt;] io_apic.c#clear_IO_APIC_pin+0x1a/0xf3
(XEN)    [&lt;ffff82d08027d9ce&gt;] io_apic.c#clear_IO_APIC+0x2d/0x60
(XEN)    [&lt;ffff82d08027dd30&gt;] disable_IO_APIC+0xd/0x7e
(XEN)    [&lt;ffff82d080270a79&gt;] machine_crash_shutdown+0x228/0x292
(XEN)    [&lt;ffff82d08021dd74&gt;] kexec_crash+0x3f/0x5b
(XEN)    [&lt;ffff82d08024db40&gt;] panic+0x117/0x12f
(XEN)    [&lt;ffff82d0802ab1b8&gt;] do_general_protection+0x22b/0x234
(XEN)    [&lt;ffff82d080387a3d&gt;] x86_64/entry.S#handle_exception_saved+0x68/0x94
(XEN)    [&lt;00000000aa5b526b&gt;] 00000000aa5b526b
(XEN)    [&lt;ffff82d0802a3045&gt;] machine_restart+0x1ef/0x2a4
(XEN)    [&lt;ffff82d0802a3105&gt;] send_IPI_mask+0/0xc
(XEN)    [&lt;ffff82d08023cdaa&gt;] smp_call_function_interrupt+0x95/0xb8
(XEN)    [&lt;ffff82d0802a37da&gt;] call_function_interrupt+0x35/0x37
(XEN)    [&lt;ffff82d080283fb4&gt;] do_IRQ+0xa7/0x697
(XEN)    [&lt;ffff82d0803878ba&gt;] common_interrupt+0x10a/0x120
(XEN)    [&lt;ffff82d0802e1bc5&gt;] cpu_idle.c#acpi_idle_do_entry+0xa4/0xb5
(XEN)    [&lt;ffff82d0802e20ae&gt;] cpu_idle.c#acpi_processor_idle+0x313/0x590
(XEN)    [&lt;ffff82d080274f8c&gt;] domain.c#idle_loop+0xa2/0xb1
(XEN) 
(XEN) 
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Assertion 'offset == (val &amp; (INTREMAP_ENTRIES - 1))' failed at iommu_intr.c:567
(XEN) ****************************************
(XEN) 

</pre>
    <br>
    I think we need a similar adjustment in nmi_shootdown_cpus()<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------2BF2B87DF463DDD9FD6C10BB--


--===============5391057011022370714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5391057011022370714==--

