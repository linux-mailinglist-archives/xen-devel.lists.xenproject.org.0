Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A6A24B126
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 10:35:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8g20-0001Tc-2t; Thu, 20 Aug 2020 08:34:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WITm=B6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k8g1y-0001TX-Bc
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 08:34:42 +0000
X-Inumbo-ID: 9858c84f-e529-4c5c-a3ca-de0d8cde76af
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9858c84f-e529-4c5c-a3ca-de0d8cde76af;
 Thu, 20 Aug 2020 08:34:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 75F01B70F;
 Thu, 20 Aug 2020 08:35:06 +0000 (UTC)
Subject: Re: Xen 4.14.0 fails on Dell IoT Gateway without efi=no-rs
To: Roman Shaposhnik <roman@zededa.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <CAMmSBy9UUr0T0wT4gG_zAVTa6q=1yVL+js5ciOAnNZyvmAeaPA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8b0e088c-baa9-93db-02f8-369acb008b69@suse.com>
Date: Thu, 20 Aug 2020 10:34:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy9UUr0T0wT4gG_zAVTa6q=1yVL+js5ciOAnNZyvmAeaPA@mail.gmail.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.08.2020 00:50, Roman Shaposhnik wrote:
> below you can see a trace of Xen 4.14.0 failing on Dell IoT Gateway 3001
> without efi=no-rs. Please let me know if I can provide any additional
> information.

One of the usual firmware issues:

> Xen 4.14.0
> (XEN) Xen version 4.14.0 (@) (gcc (Alpine 6.4.0) 6.4.0) debug=n  Sat Jul 25
> 23:45:43 UTC 2020
> (XEN) Latest ChangeSet:
> (XEN) Bootloader: GRUB 2.03
> (XEN) Command line: com1=115200,8n1 console=com1 dom0_mem=1024M,max:1024M
> dom0_max_vcpus=1 dom0_vcpus_pin
> (XEN) Xen image load base address: 0x71000000
> (XEN) Video information:
> (XEN)  VGA is text mode 80x25, font 8x16
> (XEN) Disc information:
> (XEN)  Found 0 MBR signatures
> (XEN)  Found 1 EDD information structures
> (XEN) EFI RAM map:
> (XEN)  [0000000000000000, 000000000003efff] (usable)
> (XEN)  [000000000003f000, 000000000003ffff] (ACPI NVS)
> (XEN)  [0000000000040000, 000000000009ffff] (usable)
> (XEN)  [0000000000100000, 000000001fffffff] (usable)
> (XEN)  [0000000020000000, 00000000200fffff] (reserved)
> (XEN)  [0000000020100000, 0000000076ccafff] (usable)
> (XEN)  [0000000076ccb000, 0000000076d42fff] (reserved)
> (XEN)  [0000000076d43000, 0000000076d53fff] (ACPI data)
> (XEN)  [0000000076d54000, 00000000772ddfff] (ACPI NVS)
> (XEN)  [00000000772de000, 00000000775f4fff] (reserved)
> (XEN)  [00000000775f5000, 00000000775f5fff] (usable)
> (XEN)  [00000000775f6000, 0000000077637fff] (reserved)
> (XEN)  [0000000077638000, 00000000789e4fff] (usable)
> (XEN)  [00000000789e5000, 0000000078ff9fff] (reserved)
> (XEN)  [0000000078ffa000, 0000000078ffffff] (usable)
> (XEN)  [00000000e0000000, 00000000efffffff] (reserved)
> (XEN)  [00000000fec00000, 00000000fec00fff] (reserved)
> (XEN)  [00000000fed01000, 00000000fed01fff] (reserved)
> (XEN)  [00000000fed03000, 00000000fed03fff] (reserved)
> (XEN)  [00000000fed08000, 00000000fed08fff] (reserved)
> (XEN)  [00000000fed0c000, 00000000fed0ffff] (reserved)
> (XEN)  [00000000fed1c000, 00000000fed1cfff] (reserved)
> (XEN)  [00000000fee00000, 00000000fee00fff] (reserved)
> (XEN)  [00000000fef00000, 00000000feffffff] (reserved)
> (XEN)  [00000000ff900000, 00000000ffffffff] (reserved)
> (XEN) System RAM: 1919MB (1965176kB)
> (XEN) ACPI: RSDP 76D46000, 0024 (r2   DELL)
> (XEN) ACPI: XSDT 76D46088, 0094 (r1   DELL     AS09  1072009 AMI     10013)
> (XEN) ACPI: FACP 76D52560, 010C (r5   DELL     AS09  1072009 AMI     10013)
> (XEN) ACPI: DSDT 76D461B0, C3AF (r2   DELL     AS09  1072009 INTL 20120913)
> (XEN) ACPI: FACS 772DDE80, 0040
> (XEN) ACPI: APIC 76D52670, 0068 (r3   DELL     AS09  1072009 AMI     10013)
> (XEN) ACPI: FPDT 76D526D8, 0044 (r1   DELL     AS09  1072009 AMI     10013)
> (XEN) ACPI: FIDT 76D52720, 009C (r1   DELL     AS09  1072009 AMI     10013)
> (XEN) ACPI: MCFG 76D527C0, 003C (r1   DELL     AS09  1072009 MSFT       97)
> (XEN) ACPI: LPIT 76D52800, 0104 (r1   DELL     AS09        3 VLV2  100000D)
> (XEN) ACPI: HPET 76D52908, 0038 (r1   DELL     AS09  1072009 AMI.        5)
> (XEN) ACPI: SSDT 76D52940, 0763 (r1   DELL     AS09     3000 INTL 20061109)
> (XEN) ACPI: SSDT 76D530A8, 0290 (r1   DELL     AS09     3000 INTL 20061109)
> (XEN) ACPI: SSDT 76D53338, 017A (r1   DELL     AS09     3000 INTL 20061109)
> (XEN) ACPI: UEFI 76D534B8, 0042 (r1   DELL     AS09        0             0)
> (XEN) ACPI: CSRT 76D53500, 014C (r0   DELL     AS09        5 INTL 20120624)
> (XEN) ACPI: TPM2 76D53650, 0034 (r3        Tpm2Tabl        1 AMI         0)
> (XEN) ACPI: SSDT 76D53688, 00C9 (r1   MSFT  RHPROXY        1 INTL 20120913)
> (XEN) Domain heap initialised
> (XEN) ACPI: 32/64X FACS address mismatch in FADT -
> 772dde80/0000000000000000, using 32
> (XEN) IOAPIC[0]: apic_id 1, version 32, address 0xfec00000, GSI 0-86
> (XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs
> (XEN) CPU0: 400..1000 MHz
> (XEN) Speculative mitigation facilities:
> (XEN)   Hardware features:
> (XEN)   Compiled-in support: SHADOW_PAGING
> (XEN)   Xen settings: BTI-Thunk N/A, SPEC_CTRL: No, Other: BRANCH_HARDEN
> (XEN)   Support for HVM VMs: RSB
> (XEN)   Support for PV VMs: RSB
> (XEN)   XPTI (64-bit PV only): Dom0 enabled, DomU enabled (without PCID)
> (XEN)   PV L1TF shadowing: Dom0 disabled, DomU disabled
> (XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
> (XEN) Initializing Credit2 scheduler
> (XEN) Disabling HPET for being unreliable
> (XEN) Platform timer is 3.580MHz ACPI PM Timer
> (XEN) Detected 1333.397 MHz processor.
> (XEN) Unknown cachability for MFNs 0xff900-0xfffff

The fault address falling in this range suggests you can use a less
heavy workaround: "efi=attr=uc". (Quite possibly "efi=no-rs" or yet
some other workaround may still be needed for your subsequent reboot
hang.)

> (XEN) I/O virtualisation disabled
> (XEN) ENABLING IO-APIC IRQs
> (XEN)  -> Using new ACK method
> (XEN) ----[ Xen-4.14.0  x86_64  debug=n   Not tainted ]----

I general please try to repro issues with a "debug=y" build, such
that ...

> (XEN) CPU:    0
> (XEN) RIP:    e008:[<00000000775e0d21>] 00000000775e0d21
> (XEN) RFLAGS: 0000000000010046   CONTEXT: hypervisor
> (XEN) rax: 0000000088411fe8   rbx: ffff82d04047fb48   rcx: ffff82d04047fa60
> (XEN) rdx: 00000000ff900000   rsi: 00000000ff900000   rdi: 00000000775e4d58
> (XEN) rbp: ffff82d04047fc00   rsp: ffff82d04047fa38   r8:  ffff82d04047fb48
> (XEN) r9:  0000000000000000   r10: 00000000ff920000   r11: 0000000000020000
> (XEN) r12: ffff82d04047fc60   r13: 0000000000000040   r14: 00000000775ce2c0
> (XEN) r15: 00000000775cf9e8   cr0: 0000000080050033   cr4: 00000000001006e0
> (XEN) cr3: 00000000711d1000   cr2: 00000000ff900020
> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> (XEN) Xen code around <00000000775e0d21> (00000000775e0d21):
> (XEN)  8b 11 45 33 c9 49 8b d8 <4c> 39 5a 20 75 0b 0f b7 42 30 48 8d 4c 10
> 17 eb
> (XEN) Xen stack trace from rsp=ffff82d04047fa38:
> (XEN)    00000000775ddb8e 00000000775e4d58 0000000040470880 0000000000001698
> (XEN)    4630002800000001 00000000ff900000 0000000000020000 00000000ff91fff0
> (XEN)    00000000ff912057 00000000ff900060 0000000007f70020 0000000000000000
> (XEN)    0000000077739001 ffff82d0403be10a ffff82d040597760 ffff82d040597394
> (XEN)    ffff82d040377940 00000000ffffffff 0000000000000400 ffff82d04047fc60
> (XEN)    00000000775e2e73 00000000775da608 ffff82d04047fc70 0000000000000000
> (XEN)    0000000000000000 ffff82d04036e81f 00000000775e2ead ffff82d04036e81f
> (XEN)    ffff82d04036e82b 8000000000000003 0000000000000000 0000000000000000
> (XEN)    00000000775ddd88 00000000775da610 0000000000000000 ffff82d04047fc70
> (XEN)    ffff82d04036e82b ffff82d04047fc60 ffff82d04047fbf8 ffff82d04031eaca
> (XEN)    0000000000000000 ffff82d04047fd00 ffff82d040597360 0000000000000430
> (XEN)    ffff82d040462080 0000000000000200 ffff82d04058860c ffff82d04047fc70
> (XEN)    00000000775de841 00000000775cf9e8 00000000775d03b5 00000000775ce2c0
> (XEN)    0000000000000000 ffff82d04047fc60 0000000000000000 0000000000000000
> (XEN)    00000000775d0798 ffff82d04047fc90 0000000000000000 0000000000002022
> (XEN)    ffff82d04047fca8 ffff82d04047fc60 000000007146d000 0000000079000000
> (XEN)    0000000000000206 ffff82d0405886a0 ffff82d040471278 0000000000000000
> (XEN)    ffff82d0402014cb ffff82d04036e81f ffff82d04047fca0 0000000000000003
> (XEN)    ffff82d04047fcf0 0000000000000000 0000000000000000 ff001900010107dc
> (XEN)    0000000000000000 000000007146d000 0000000079000000 ffff82d040462080
> (XEN) Xen call trace:
> (XEN)    [<00000000775e0d21>] R 00000000775e0d21
> (XEN)    [<00000000775ddb8e>] S 00000000775ddb8e
> (XEN)    [<ffff82d04036e81f>] S common_interrupt+0x8f/0x120
> (XEN)    [<ffff82d04036e81f>] S common_interrupt+0x8f/0x120
> (XEN)    [<ffff82d04036e82b>] S common_interrupt+0x9b/0x120
> (XEN)    [<ffff82d04036e82b>] S common_interrupt+0x9b/0x120
> (XEN)    [<ffff82d04031eaca>] S do_IRQ+0x2da/0x6d0
> (XEN)    [<ffff82d0402014cb>] S efi_get_time+0x6b/0xb0

... the call stack above from here is more meaningful. Increasing
log level is also generally helpful - in the case here it would have
allowed us to see the full EFI memory map.

As far as making cases like this work by default, I'm afraid it'll
need to be proposed to replace me as the maintainer of EFI code in
Xen. I will remain on the position that it is not acceptable to
apply workarounds for firmware issues by default unless they're
entirely benign to spec-conforming systems. DMI data based enabling
of workarounds, for example, is acceptable in the common case, as
long as the matching pattern isn't unreasonably wide.

Jan

