Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0515124C632
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 21:13:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8pzi-0002GH-RV; Thu, 20 Aug 2020 19:13:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eCh+=B6=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1k8pzh-0002GC-Hp
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 19:13:01 +0000
X-Inumbo-ID: d7818133-8caf-449c-bc8d-84c023eb189e
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7818133-8caf-449c-bc8d-84c023eb189e;
 Thu, 20 Aug 2020 19:13:00 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id c12so2000932qtn.9
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2020 12:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wXjHgEeSw+hDSoG5C7lNdEX6se9EPtn0zqymm4w0fys=;
 b=hUaiGkIzJPH84AJsc5hJB5lMNKUTR4qYsGcDD7D/0EGUrZYguqbVK+mwqlvImNmUKO
 3ik7615A9P/rXw4rD1WWOh4Yxs87lwxOebUrvIJ7SSqrYwT4UjKTlO+GWXJfQcuzpbS1
 Jer9MXmTXzFLiyX8/9Wvr81NS6bl0kwno0/JjGCuWa14YbMo4FuYzKhtlNU43NhoPd25
 4BzVCNVv40iVCbzvZSCPjBs6NRdFTvaVSjog8Sg0HRgs0/autDeasYuwTKD9WfzGkXJb
 ytxWL7C3+6pwgwQUKmDnp//5UQ1oLLV2HJ4ZQBxdk1nxGe6Je3zIjRfkSsqFvhS+qG3R
 cJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wXjHgEeSw+hDSoG5C7lNdEX6se9EPtn0zqymm4w0fys=;
 b=WnC36M7oE6s2HjFXCgH6wV3+Dj4UUcoLFvhCYhnxeNvOgKWdNqgPrWLOJcQH7UegAs
 ZROrPeUOFIpaNZgHsINNFlW/d/s4/e0dl16tIhD5rklwSsT3TtLvDKTUUnKzaI0udv02
 sHVBr4uVUZokBYt7zhk8ETrUBRcbwfmCYd1QfJP28rhwG07yNKRYOIWFi41BHrtw1eJU
 GR35kZNfNWL/zWv0jr2vKwpdQXfUuCgOAbKTUYMIxptlJ+MNc91lp/5k5Ist4+PUDPQM
 LB4vhgSjbzqtngH3cDhlEh4FzGNz22Gh1IvFkJSLHKK+LVB3Fwgt6QWhBh5O4fSULNTv
 SW9g==
X-Gm-Message-State: AOAM531ROTPbnAXSsc2h65xdSL0z3pEiPqNMnG925rFnFnr+B9FyHwRs
 0kGnQLlf1ESN56OAXD5IPG+4aHETF6wPeC7/9O7+Fg==
X-Google-Smtp-Source: ABdhPJzYezwIC8C2pWKenaO1otkkOvwT2zU+fU1OId0CpdqBjczsoOBG5iR9tTIGjoFugo+AvVhpAvZRMhrgqD2aEV4=
X-Received: by 2002:aed:3b24:: with SMTP id p33mr4095333qte.365.1597950779755; 
 Thu, 20 Aug 2020 12:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy9UUr0T0wT4gG_zAVTa6q=1yVL+js5ciOAnNZyvmAeaPA@mail.gmail.com>
 <a439f9c6-2773-5f49-367b-fe3f3ff21ae9@citrix.com>
In-Reply-To: <a439f9c6-2773-5f49-367b-fe3f3ff21ae9@citrix.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Thu, 20 Aug 2020 12:12:48 -0700
Message-ID: <CAMmSBy8gupDuXEUGxucwZ0G6dG8xD-Edabv-ken0L_P1uyJgZA@mail.gmail.com>
Subject: Re: Xen 4.14.0 fails on Dell IoT Gateway without efi=no-rs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Aug 20, 2020 at 5:56 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 19/08/2020 23:50, Roman Shaposhnik wrote:
> >  Hi!
> >
> > below you can see a trace of Xen 4.14.0 failing on Dell IoT Gateway 3001
> > without efi=no-rs. Please let me know if I can provide any additional
> > information.
>
> Just to be able to get all datapoints, could you build Xen with
> CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP and see if the failure mode changes?

It does. I rebuilt with the above + debug=y and here's what I got:

 Xen 4.14.0
(XEN) Xen version 4.14.0 (@) (gcc (Alpine 6.4.0) 6.4.0) debug=y  Thu
Aug 20 19:02:55 UTC 2020
(XEN) Latest ChangeSet:
(XEN) build-id: 035c23a8644576897a7380a0837505de8460d7e8
(XEN) Bootloader: GRUB 2.03
(XEN) Command line: com1=115200,8n1 console=com1
dom0_mem=1024M,max:1024M dom0_max_vcpus=1 dom0_vcpus_pin
(XEN) Xen image load base address: 0x70c00000
(XEN) Video information:
(XEN)  VGA is text mode 80x25, font 8x16
(XEN) Disc information:
(XEN)  Found 0 MBR signatures
(XEN)  Found 1 EDD information structures
(XEN) CPU Vendor: Intel, Family 6 (0x6), Model 55 (0x37), Stepping 9
(raw 00030679)
(XEN) No NUMA configuration found
(XEN) Faking a node at 0000000000000000-0000000079000000
(XEN) Domain heap initialised
(XEN) SMBIOS 3.0 present.
(XEN) DMI 3.0 present.
(XEN) Using APIC driver default
(XEN) ACPI: PM-Timer IO Port: 0x408 (24 bits)
(XEN) ACPI: v5 SLEEP INFO: control[0:0], status[0:0]
(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:404,1:0], pm1x_evt[1:400,1:0]
(XEN) ACPI: 32/64X FACS address mismatch in FADT -
772dde80/0000000000000000, using 32
(XEN) ACPI:             wakeup_vec[772dde8c], vec_size[20]
(XEN) ACPI: Local APIC address 0xfee00000
(XEN) ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x02] lapic_id[0x04] enabled)
(XEN) ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
(XEN) ACPI: IOAPIC (id[0x01] address[0xfec00000] gsi_base[0])
(XEN) IOAPIC[0]: apic_id 1, version 32, address 0xfec00000, GSI 0-86
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
(XEN) ACPI: IRQ0 used by override.
(XEN) ACPI: IRQ2 used by override.
(XEN) ACPI: IRQ9 used by override.
(XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs
(XEN) ACPI: HPET id: 0x8086a201 base: 0xfed00000
(XEN) PCI: MCFG configuration 0: base e0000000 segment 0000 buses 00 - ff
(XEN) PCI: MCFG area at e0000000 reserved in E820
(XEN) PCI: Using MCFG for segment 0000 bus 00-ff
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) SMP: Allowing 2 CPUs (0 hotplug CPUs)
(XEN) IRQ limits: 87 GSI, 609 MSI/MSI-X
(XEN) CPU0: 400..1000 MHz
(XEN) mce_intel.c:779: MCA Capability: firstbank 0, extended MCE MSR 0, BCAST
(XEN) Thermal monitoring handled by SMI
(XEN) CPU0: Intel machine check reporting enabled
(XEN) Fixup #GP[0000]: ffff82d0405c6b5f
[init_speculation_mitigations+0xee/0x1717] -> ffff82d0404f1b94
(XEN) Speculative mitigation facilities:
(XEN)   Hardware features:
(XEN)   Compiled-in support: SHADOW_PAGING
(XEN)   Xen settings: BTI-Thunk N/A, SPEC_CTRL: No, Other: BRANCH_HARDEN
(XEN)   Support for HVM VMs: RSB
(XEN)   Support for PV VMs: RSB
(XEN)   XPTI (64-bit PV only): Dom0 enabled, DomU enabled (without PCID)
(XEN)   PV L1TF shadowing: Dom0 disabled, DomU disabled
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Initializing Credit2 scheduler
(XEN)  load_precision_shift: 18
(XEN)  load_window_shift: 30
(XEN)  underload_balance_tolerance: 0
(XEN)  overload_balance_tolerance: -3
(XEN)  runqueues arrangement: socket
(XEN)  cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Disabling HPET for being unreliable
(XEN) Platform timer is 3.580MHz ACPI PM Timer
(XEN) Detected 1333.394 MHz processor.
(XEN) EFI memory map:
(XEN)  0000000000000-0000000007fff type=3 attr=000000000000000f
(XEN)  0000000008000-000000000bfff type=2 attr=000000000000000f
(XEN)  000000000c000-000000002efff type=7 attr=000000000000000f
(XEN)  000000002f000-000000003efff type=2 attr=000000000000000f
(XEN)  000000003f000-000000003ffff type=10 attr=000000000000000f
(XEN)  0000000040000-000000009ffff type=3 attr=000000000000000f
(XEN)  0000000100000-0000001c03fff type=2 attr=000000000000000f
(XEN)  0000001c04000-000001fffffff type=7 attr=000000000000000f
(XEN)  0000020000000-00000200fffff type=0 attr=000000000000000f
(XEN)  0000020100000-000003ca89fff type=7 attr=000000000000000f
(XEN)  000003ca8a000-0000058ffffff type=1 attr=000000000000000f
(XEN)  0000059000000-000005901ffff type=4 attr=000000000000000f
(XEN)  0000059020000-0000070dfffff type=7 attr=000000000000000f
(XEN)  0000070e00000-00000715eefff type=2 attr=000000000000000f
(XEN)  00000715ef000-000007167afff type=7 attr=000000000000000f
(XEN)  000007167b000-000007167bfff type=2 attr=000000000000000f
(XEN)  000007167c000-0000071681fff type=7 attr=000000000000000f
(XEN)  0000071682000-0000071776fff type=1 attr=000000000000000f
(XEN)  0000071777000-000007655dfff type=4 attr=000000000000000f
(XEN)  000007655e000-00000766dbfff type=7 attr=000000000000000f
(XEN)  00000766dc000-0000076ccafff type=3 attr=000000000000000f
(XEN)  0000076ccb000-0000076d42fff type=0 attr=000000000000000f
(XEN)  0000076d43000-0000076d53fff type=9 attr=000000000000000f
(XEN)  0000076d54000-00000772ddfff type=10 attr=000000000000000f
(XEN)  00000772de000-0000077586fff type=6 attr=800000000000000f
(XEN)  0000077587000-00000775f4fff type=5 attr=800000000000000f
(XEN)  00000775f5000-00000775f5fff type=4 attr=000000000000000f
(XEN)  00000775f6000-0000077637fff type=6 attr=800000000000000f
(XEN)  0000077638000-00000789e4fff type=4 attr=000000000000000f
(XEN)  00000789e5000-0000078ff9fff type=6 attr=800000000000000f
(XEN)  0000078ffa000-0000078ffffff type=4 attr=000000000000000f
(XEN)  00000e0000000-00000efffffff type=11 attr=8000000000000001
(XEN)  00000fec00000-00000fec00fff type=11 attr=8000000000000001
(XEN)  00000fed01000-00000fed01fff type=11 attr=8000000000000001
(XEN)  00000fed03000-00000fed03fff type=11 attr=8000000000000001
(XEN)  00000fed08000-00000fed08fff type=11 attr=8000000000000001
(XEN)  00000fed0c000-00000fed0ffff type=11 attr=8000000000000001
(XEN)  00000fed1c000-00000fed1cfff type=11 attr=8000000000000001
(XEN)  00000fee00000-00000fee00fff type=11 attr=8000000000000001
(XEN)  00000fef00000-00000feffffff type=11 attr=8000000000000001
(XEN)  00000ff900000-00000ffffffff type=11 attr=8000000000000000
(XEN) Unknown cachability for MFNs 0xff900-0xfffff
(XEN) alt table ffff82d04060e4b0 -> ffff82d04061c408
(XEN) I/O virtualisation disabled
(XEN) nr_sockets: 1
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using new ACK method
(XEN) ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=0 pin2=0
(XEN) TSC deadline timer enabled
(XEN) Debugging connection not set up.
(XEN) ----[ Xen-4.14.0  x86_64  debug=y   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<00000000775e0d21>] 00000000775e0d21
(XEN) RFLAGS: 0000000000010046   CONTEXT: hypervisor
(XEN) rax: 0000000088411fe8   rbx: ffff82d0408afb28   rcx: ffff82d0408afa40
(XEN) rdx: 00000000ff900000   rsi: 00000000ff900000   rdi: 00000000775e4d58
(XEN) rbp: ffff82d0408afc00   rsp: ffff82d0408afa18   r8:  ffff82d0408afb28
(XEN) r9:  0000000000000000   r10: 00000000ff920000   r11: 0000000000020000
(XEN) r12: ffff82d0408afc40   r13: 0000000000000040   r14: 00000000775ce2c0
(XEN) r15: 00000000775cf9e8   cr0: 0000000080050033   cr4: 00000000001006e0
(XEN) cr3: 0000000070ddd000   cr2: 00000000ff900020
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <00000000775e0d21> (00000000775e0d21):
(XEN)  8b 11 45 33 c9 49 8b d8 <4c> 39 5a 20 75 0b 0f b7 42 30 48 8d 4c 10 17 eb
(XEN) Xen stack trace from rsp=ffff82d0408afa18:
(XEN)    00000000775ddb8e 00000000775e4d58 0000000000072812 0000000000000001
(XEN)    ffff82d0408afaf8 00000000ff900000 0000000000020000 00000000ff91fff0
(XEN)    00000000ff90cecc 00000000ff900060 0000000007f70021 0000000000000000
(XEN)    0000000077739001 ffff82d0409cc3c0 0000000000000020 ffff82d0409cc3c0
(XEN)    0000000000000020 ffff82d040646ce0 ffff82d040620d20 ffff82d0408afc40
(XEN)    00000000775e2e73 00000000775da608 ffff82d0408afc50 0000000000000000
(XEN)    0000000000000000 ffff82d0409b8950 00000000775e2ead ffff82d0409b8950
(XEN)    ffff82d0408afb48 8000000000000003 0000000000000000 0000000000000000
(XEN)    00000000775ddd88 00000000775da610 000000000000000a ffff82d0408afc50
(XEN)    000000000000000a ffff82d0408afc40 ffff82d040620d20 ffff82d040721200
(XEN)    ffff82d0408afb78 ffff82d0409eed20 ffff82d0408afbb8 0000000000000430
(XEN)    0000000000000002 ffff82d0408aff00 000000000000020c ffff82d0408afc50
(XEN)    00000000775de841 00000000775cf9e8 00000000775d03b5 00000000775ce2c0
(XEN)    0000000000000000 ffff82d0408afc40 0000000000000082 0000000000000000
(XEN)    00000000775d0798 ffff82d0408afc90 0000000000000000 0000000000002022
(XEN)    ffff82d04025e164 ffff82d0408afc40 0000000000000282 0000000000000000
(XEN)    ffff82d0408affff 0000000000000282 ffff82d040665fb6 00000000001006e0
(XEN)    ffff82d040202033 0000000000000002 ffff830077586e18 0000000000000003
(XEN)    ffff82d0408afcd0 0000000071233000 00007d2fbf750367 ffff82d0404ef931
(XEN)    0000000031746960 0000000000001d4b 0000000000000200 00333114010107dc
(XEN) Xen call trace:
(XEN)    [<00000000775e0d21>] R 00000000775e0d21
(XEN)    [<00000000775ddb8e>] S 00000000775ddb8e
(XEN)    [<0000000000000282>] F 0000000000000282
(XEN)    [<ffff830077586e18>] F ffff830077586e18
(XEN)
(XEN) Pagetable walk from 00000000ff900020:
(XEN)  L4[0x000] = 0000000070ddc063 ffffffffffffffff
(XEN)  L3[0x003] = 000000007122e063 ffffffffffffffff
(XEN)  L2[0x1fc] = 0000000000000000 ffffffffffffffff
(XEN) Xen lock profile info SHOW  (now = 1756586213 total = 1756586213)
(XEN) Domain 32767 page_alloc_lock: addr=ffff8300788ad028,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Domain 32767 domain_lock: addr=ffff8300788ad018,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Domain 32753 page_alloc_lock: addr=ffff830070dfd028,
lockval=11811181, not locked
(XEN)   lock:4481(447393), block:0(0)
(XEN) Domain 32753 domain_lock: addr=ffff830070dfd018,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Domain 32754 page_alloc_lock: addr=ffff830073388028,
lockval=06000600, not locked
(XEN)   lock:1536(152799), block:0(0)
(XEN) Domain 32754 domain_lock: addr=ffff830073388018,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) FATAL PAGE FAULT
(XEN) [error_code=0000]
(XEN) Faulting linear address: 00000000ff900020
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...
(XEN) Debugging connection not set up.

