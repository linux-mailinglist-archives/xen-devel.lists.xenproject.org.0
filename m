Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B918524C647
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 21:33:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8qHw-00042g-Pa; Thu, 20 Aug 2020 19:31:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eCh+=B6=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1k8qHv-00042b-8Y
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 19:31:51 +0000
X-Inumbo-ID: 8af2bdea-000a-4736-a9d3-db45ee31db3d
Received: from mail-qv1-xf30.google.com (unknown [2607:f8b0:4864:20::f30])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8af2bdea-000a-4736-a9d3-db45ee31db3d;
 Thu, 20 Aug 2020 19:31:48 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id y11so1481775qvl.4
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2020 12:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CviYSUzZO4D9woJENp/SwpAB+fMBAuMlXneOkV2FgvM=;
 b=kWxG59siLnubARnW60GagHUsQrdIUqdTLdey339FOA6IoHDKGHbmfuUDLtdKwSWDbM
 P5W8nKoVqSuuWbqT3CcVIfkdvQK1pkcek3COnw9Xv29pI9KMSiREIJRlGa3R5WjYFvPQ
 kDvPkMt3ykM+qUnE+UzOxEQS1TuS8KLnwuHWw+OfCx1rqydfnb6pobAJGuoEnVGSCMUP
 LvlenAhlDuTChKzT2pRF1szIof/g35cY07KJuBoAe4IPh+Ql6MhWYzmXvE0+TaaYsucv
 D62yIWb/jA/MN81U2NJeTzNq5PWCrkomJ+cg0ygPSlRuc4U8s+JTgTok/Hyap/5APuJt
 EVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CviYSUzZO4D9woJENp/SwpAB+fMBAuMlXneOkV2FgvM=;
 b=Isa7mjY0hQcyQMc/aIElbNHPZHWvtXtRJsW09xE+fFhbho2pwY9VeywXJSLl7qViC5
 YANQfGFliYJ9y6gQujyLw1g/Y425KrpqD09TtJ1LVdZgLWTUtbhNPqgAZW91JZukZI7c
 nSq8UIkvURJpGrrZU2AFHGtefg6KaK4tumRhvQzdTGqcmpU4ljz0xOkg99MhTQ3GWdhZ
 7Lsl14Nj5B3rcyLTLDp8PKPz6UdjM+ojLVo1SlQ+V5bxf1XxeIlTEcJZ9YUHJ1yZSk0R
 HCVNEjCGWew8CU/Di2Bc92ImVeD+E2DvqnvvygZ//6Z2ynDbnUKdhORQCOWOLOx7g+Y3
 KaQg==
X-Gm-Message-State: AOAM532O0U88ArOEDg/UbpukjgRzf7WLP0IlmWuQZEQz5bgnUHyrjtik
 98E2tvxNNV8vqaQbBCwfDbQrmfJAmTvew61uxpLQuw==
X-Google-Smtp-Source: ABdhPJyVFq0Vyj1OpCrFegdZp5VlQ+A7bJcKdqK/IlnWDa3Iyd0Hb0HNcNlCUCyAyCxn/IPg2fvMvg2xdyQDIBWntAw=
X-Received: by 2002:ad4:4992:: with SMTP id t18mr344197qvx.193.1597951907437; 
 Thu, 20 Aug 2020 12:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy9UUr0T0wT4gG_zAVTa6q=1yVL+js5ciOAnNZyvmAeaPA@mail.gmail.com>
 <8b0e088c-baa9-93db-02f8-369acb008b69@suse.com>
In-Reply-To: <8b0e088c-baa9-93db-02f8-369acb008b69@suse.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Thu, 20 Aug 2020 12:31:35 -0700
Message-ID: <CAMmSBy-dfc4PsYvmK+-=gTVqZbCsNUM=T_DVUC+aFU=riDrkpg@mail.gmail.com>
Subject: Re: Xen 4.14.0 fails on Dell IoT Gateway without efi=no-rs
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
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

On Thu, Aug 20, 2020 at 1:34 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 20.08.2020 00:50, Roman Shaposhnik wrote:
> > below you can see a trace of Xen 4.14.0 failing on Dell IoT Gateway 3001
> > without efi=no-rs. Please let me know if I can provide any additional
> > information.
>
> One of the usual firmware issues:
>
> > Xen 4.14.0
> > (XEN) Xen version 4.14.0 (@) (gcc (Alpine 6.4.0) 6.4.0) debug=n  Sat Jul 25
> > 23:45:43 UTC 2020
> > (XEN) Latest ChangeSet:
> > (XEN) Bootloader: GRUB 2.03
> > (XEN) Command line: com1=115200,8n1 console=com1 dom0_mem=1024M,max:1024M
> > dom0_max_vcpus=1 dom0_vcpus_pin
> > (XEN) Xen image load base address: 0x71000000
> > (XEN) Video information:
> > (XEN)  VGA is text mode 80x25, font 8x16
> > (XEN) Disc information:
> > (XEN)  Found 0 MBR signatures
> > (XEN)  Found 1 EDD information structures
> > (XEN) EFI RAM map:
> > (XEN)  [0000000000000000, 000000000003efff] (usable)
> > (XEN)  [000000000003f000, 000000000003ffff] (ACPI NVS)
> > (XEN)  [0000000000040000, 000000000009ffff] (usable)
> > (XEN)  [0000000000100000, 000000001fffffff] (usable)
> > (XEN)  [0000000020000000, 00000000200fffff] (reserved)
> > (XEN)  [0000000020100000, 0000000076ccafff] (usable)
> > (XEN)  [0000000076ccb000, 0000000076d42fff] (reserved)
> > (XEN)  [0000000076d43000, 0000000076d53fff] (ACPI data)
> > (XEN)  [0000000076d54000, 00000000772ddfff] (ACPI NVS)
> > (XEN)  [00000000772de000, 00000000775f4fff] (reserved)
> > (XEN)  [00000000775f5000, 00000000775f5fff] (usable)
> > (XEN)  [00000000775f6000, 0000000077637fff] (reserved)
> > (XEN)  [0000000077638000, 00000000789e4fff] (usable)
> > (XEN)  [00000000789e5000, 0000000078ff9fff] (reserved)
> > (XEN)  [0000000078ffa000, 0000000078ffffff] (usable)
> > (XEN)  [00000000e0000000, 00000000efffffff] (reserved)
> > (XEN)  [00000000fec00000, 00000000fec00fff] (reserved)
> > (XEN)  [00000000fed01000, 00000000fed01fff] (reserved)
> > (XEN)  [00000000fed03000, 00000000fed03fff] (reserved)
> > (XEN)  [00000000fed08000, 00000000fed08fff] (reserved)
> > (XEN)  [00000000fed0c000, 00000000fed0ffff] (reserved)
> > (XEN)  [00000000fed1c000, 00000000fed1cfff] (reserved)
> > (XEN)  [00000000fee00000, 00000000fee00fff] (reserved)
> > (XEN)  [00000000fef00000, 00000000feffffff] (reserved)
> > (XEN)  [00000000ff900000, 00000000ffffffff] (reserved)
> > (XEN) System RAM: 1919MB (1965176kB)
> > (XEN) ACPI: RSDP 76D46000, 0024 (r2   DELL)
> > (XEN) ACPI: XSDT 76D46088, 0094 (r1   DELL     AS09  1072009 AMI     10013)
> > (XEN) ACPI: FACP 76D52560, 010C (r5   DELL     AS09  1072009 AMI     10013)
> > (XEN) ACPI: DSDT 76D461B0, C3AF (r2   DELL     AS09  1072009 INTL 20120913)
> > (XEN) ACPI: FACS 772DDE80, 0040
> > (XEN) ACPI: APIC 76D52670, 0068 (r3   DELL     AS09  1072009 AMI     10013)
> > (XEN) ACPI: FPDT 76D526D8, 0044 (r1   DELL     AS09  1072009 AMI     10013)
> > (XEN) ACPI: FIDT 76D52720, 009C (r1   DELL     AS09  1072009 AMI     10013)
> > (XEN) ACPI: MCFG 76D527C0, 003C (r1   DELL     AS09  1072009 MSFT       97)
> > (XEN) ACPI: LPIT 76D52800, 0104 (r1   DELL     AS09        3 VLV2  100000D)
> > (XEN) ACPI: HPET 76D52908, 0038 (r1   DELL     AS09  1072009 AMI.        5)
> > (XEN) ACPI: SSDT 76D52940, 0763 (r1   DELL     AS09     3000 INTL 20061109)
> > (XEN) ACPI: SSDT 76D530A8, 0290 (r1   DELL     AS09     3000 INTL 20061109)
> > (XEN) ACPI: SSDT 76D53338, 017A (r1   DELL     AS09     3000 INTL 20061109)
> > (XEN) ACPI: UEFI 76D534B8, 0042 (r1   DELL     AS09        0             0)
> > (XEN) ACPI: CSRT 76D53500, 014C (r0   DELL     AS09        5 INTL 20120624)
> > (XEN) ACPI: TPM2 76D53650, 0034 (r3        Tpm2Tabl        1 AMI         0)
> > (XEN) ACPI: SSDT 76D53688, 00C9 (r1   MSFT  RHPROXY        1 INTL 20120913)
> > (XEN) Domain heap initialised
> > (XEN) ACPI: 32/64X FACS address mismatch in FADT -
> > 772dde80/0000000000000000, using 32
> > (XEN) IOAPIC[0]: apic_id 1, version 32, address 0xfec00000, GSI 0-86
> > (XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs
> > (XEN) CPU0: 400..1000 MHz
> > (XEN) Speculative mitigation facilities:
> > (XEN)   Hardware features:
> > (XEN)   Compiled-in support: SHADOW_PAGING
> > (XEN)   Xen settings: BTI-Thunk N/A, SPEC_CTRL: No, Other: BRANCH_HARDEN
> > (XEN)   Support for HVM VMs: RSB
> > (XEN)   Support for PV VMs: RSB
> > (XEN)   XPTI (64-bit PV only): Dom0 enabled, DomU enabled (without PCID)
> > (XEN)   PV L1TF shadowing: Dom0 disabled, DomU disabled
> > (XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
> > (XEN) Initializing Credit2 scheduler
> > (XEN) Disabling HPET for being unreliable
> > (XEN) Platform timer is 3.580MHz ACPI PM Timer
> > (XEN) Detected 1333.397 MHz processor.
> > (XEN) Unknown cachability for MFNs 0xff900-0xfffff
>
> The fault address falling in this range suggests you can use a less
> heavy workaround: "efi=attr=uc". (Quite possibly "efi=no-rs" or yet
> some other workaround may still be needed for your subsequent reboot
> hang.)

I just tried and efi=attr=uc and it is, indeed, a workaround. I can get to
Dom0 booting far enough (and then I hit the other issue).

However, since efi=attr=uc has always struck me as a bit of a hammer
still I tried the good ol':
     https://lists.archive.carbon60.com/xen/devel/408709

And then Xen crashed in an interesting way (see below). Now, this
is with CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP -- so not sure
if it is related.

> > (XEN) I/O virtualisation disabled
> > (XEN) ENABLING IO-APIC IRQs
> > (XEN)  -> Using new ACK method
> > (XEN) ----[ Xen-4.14.0  x86_64  debug=n   Not tainted ]----
>
> I general please try to repro issues with a "debug=y" build, such
> that ...

Sorry -- forgot about that. Fixed now.

> > (XEN) CPU:    0
> > (XEN) RIP:    e008:[<00000000775e0d21>] 00000000775e0d21
> > (XEN) RFLAGS: 0000000000010046   CONTEXT: hypervisor
> > (XEN) rax: 0000000088411fe8   rbx: ffff82d04047fb48   rcx: ffff82d04047fa60
> > (XEN) rdx: 00000000ff900000   rsi: 00000000ff900000   rdi: 00000000775e4d58
> > (XEN) rbp: ffff82d04047fc00   rsp: ffff82d04047fa38   r8:  ffff82d04047fb48
> > (XEN) r9:  0000000000000000   r10: 00000000ff920000   r11: 0000000000020000
> > (XEN) r12: ffff82d04047fc60   r13: 0000000000000040   r14: 00000000775ce2c0
> > (XEN) r15: 00000000775cf9e8   cr0: 0000000080050033   cr4: 00000000001006e0
> > (XEN) cr3: 00000000711d1000   cr2: 00000000ff900020
> > (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
> > (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> > (XEN) Xen code around <00000000775e0d21> (00000000775e0d21):
> > (XEN)  8b 11 45 33 c9 49 8b d8 <4c> 39 5a 20 75 0b 0f b7 42 30 48 8d 4c 10
> > 17 eb
> > (XEN) Xen stack trace from rsp=ffff82d04047fa38:
> > (XEN)    00000000775ddb8e 00000000775e4d58 0000000040470880 0000000000001698
> > (XEN)    4630002800000001 00000000ff900000 0000000000020000 00000000ff91fff0
> > (XEN)    00000000ff912057 00000000ff900060 0000000007f70020 0000000000000000
> > (XEN)    0000000077739001 ffff82d0403be10a ffff82d040597760 ffff82d040597394
> > (XEN)    ffff82d040377940 00000000ffffffff 0000000000000400 ffff82d04047fc60
> > (XEN)    00000000775e2e73 00000000775da608 ffff82d04047fc70 0000000000000000
> > (XEN)    0000000000000000 ffff82d04036e81f 00000000775e2ead ffff82d04036e81f
> > (XEN)    ffff82d04036e82b 8000000000000003 0000000000000000 0000000000000000
> > (XEN)    00000000775ddd88 00000000775da610 0000000000000000 ffff82d04047fc70
> > (XEN)    ffff82d04036e82b ffff82d04047fc60 ffff82d04047fbf8 ffff82d04031eaca
> > (XEN)    0000000000000000 ffff82d04047fd00 ffff82d040597360 0000000000000430
> > (XEN)    ffff82d040462080 0000000000000200 ffff82d04058860c ffff82d04047fc70
> > (XEN)    00000000775de841 00000000775cf9e8 00000000775d03b5 00000000775ce2c0
> > (XEN)    0000000000000000 ffff82d04047fc60 0000000000000000 0000000000000000
> > (XEN)    00000000775d0798 ffff82d04047fc90 0000000000000000 0000000000002022
> > (XEN)    ffff82d04047fca8 ffff82d04047fc60 000000007146d000 0000000079000000
> > (XEN)    0000000000000206 ffff82d0405886a0 ffff82d040471278 0000000000000000
> > (XEN)    ffff82d0402014cb ffff82d04036e81f ffff82d04047fca0 0000000000000003
> > (XEN)    ffff82d04047fcf0 0000000000000000 0000000000000000 ff001900010107dc
> > (XEN)    0000000000000000 000000007146d000 0000000079000000 ffff82d040462080
> > (XEN) Xen call trace:
> > (XEN)    [<00000000775e0d21>] R 00000000775e0d21
> > (XEN)    [<00000000775ddb8e>] S 00000000775ddb8e
> > (XEN)    [<ffff82d04036e81f>] S common_interrupt+0x8f/0x120
> > (XEN)    [<ffff82d04036e81f>] S common_interrupt+0x8f/0x120
> > (XEN)    [<ffff82d04036e82b>] S common_interrupt+0x9b/0x120
> > (XEN)    [<ffff82d04036e82b>] S common_interrupt+0x9b/0x120
> > (XEN)    [<ffff82d04031eaca>] S do_IRQ+0x2da/0x6d0
> > (XEN)    [<ffff82d0402014cb>] S efi_get_time+0x6b/0xb0
>
> ... the call stack above from here is more meaningful. Increasing
> log level is also generally helpful - in the case here it would have
> allowed us to see the full EFI memory map.
>
> As far as making cases like this work by default, I'm afraid it'll
> need to be proposed to replace me as the maintainer of EFI code in
> Xen. I will remain on the position that it is not acceptable to
> apply workarounds for firmware issues by default unless they're
> entirely benign to spec-conforming systems. DMI data based enabling
> of workarounds, for example, is acceptable in the common case, as
> long as the matching pattern isn't unreasonably wide.

Well, default is overloaded. What I would like to see (and consider it
a void of a small downstream/distro) is a community-agreed and
maintained way of working around these issues. Yes, I'd love to see
it working by default -- but if we can at least agree on an officially
supported knob that is less of a hammer than efi=attr=uc -- that'd
be a good first step.

Makes sense?

 Xen 4.14.0
(XEN) Xen version 4.14.0 (@) (gcc (Alpine 6.4.0) 6.4.0) debug=y  Thu
Aug 20 19:19:42 UTC 2020
(XEN) Latest ChangeSet:
(XEN) build-id: 5a480402ca155c3cd39662c2c0fd927606bb1305
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
(XEN) EFI RAM map:
(XEN)  [0000000000000000, 000000000003efff] (usable)
(XEN)  [000000000003f000, 000000000003ffff] (ACPI NVS)
(XEN)  [0000000000040000, 000000000009ffff] (usable)
(XEN)  [0000000000100000, 000000001fffffff] (usable)
(XEN)  [0000000020000000, 00000000200fffff] (reserved)
(XEN)  [0000000020100000, 0000000076ccafff] (usable)
(XEN)  [0000000076ccb000, 0000000076d42fff] (reserved)
(XEN)  [0000000076d43000, 0000000076d53fff] (ACPI data)
(XEN)  [0000000076d54000, 00000000772ddfff] (ACPI NVS)
(XEN)  [00000000772de000, 00000000775f4fff] (reserved)
(XEN)  [00000000775f5000, 00000000775f5fff] (usable)
(XEN)  [00000000775f6000, 0000000077637fff] (reserved)
(XEN)  [0000000077638000, 00000000789e4fff] (usable)
(XEN)  [00000000789e5000, 0000000078ff9fff] (reserved)
(XEN)  [0000000078ffa000, 0000000078ffffff] (usable)
(XEN)  [00000000e0000000, 00000000efffffff] (reserved)
(XEN)  [00000000fec00000, 00000000fec00fff] (reserved)
(XEN)  [00000000fed01000, 00000000fed01fff] (reserved)
(XEN)  [00000000fed03000, 00000000fed03fff] (reserved)
(XEN)  [00000000fed08000, 00000000fed08fff] (reserved)
(XEN)  [00000000fed0c000, 00000000fed0ffff] (reserved)
(XEN)  [00000000fed1c000, 00000000fed1cfff] (reserved)
(XEN)  [00000000fee00000, 00000000fee00fff] (reserved)
(XEN)  [00000000fef00000, 00000000feffffff] (reserved)
(XEN)  [00000000ff900000, 00000000ffffffff] (reserved)
(XEN) System RAM: 1919MB (1965176kB)
(XEN) ACPI: RSDP 76D46000, 0024 (r2   DELL)
(XEN) ACPI: XSDT 76D46088, 0094 (r1   DELL     AS09  1072009 AMI     10013)
(XEN) ACPI: FACP 76D52560, 010C (r5   DELL     AS09  1072009 AMI     10013)
(XEN) ACPI: DSDT 76D461B0, C3AF (r2   DELL     AS09  1072009 INTL 20120913)
(XEN) ACPI: FACS 772DDE80, 0040
(XEN) ACPI: APIC 76D52670, 0068 (r3   DELL     AS09  1072009 AMI     10013)
(XEN) ACPI: FPDT 76D526D8, 0044 (r1   DELL     AS09  1072009 AMI     10013)
(XEN) ACPI: FIDT 76D52720, 009C (r1   DELL     AS09  1072009 AMI     10013)
(XEN) ACPI: MCFG 76D527C0, 003C (r1   DELL     AS09  1072009 MSFT       97)
(XEN) ACPI: LPIT 76D52800, 0104 (r1   DELL     AS09        3 VLV2  100000D)
(XEN) ACPI: HPET 76D52908, 0038 (r1   DELL     AS09  1072009 AMI.        5)
(XEN) ACPI: SSDT 76D52940, 0763 (r1   DELL     AS09     3000 INTL 20061109)
(XEN) ACPI: SSDT 76D530A8, 0290 (r1   DELL     AS09     3000 INTL 20061109)
(XEN) ACPI: SSDT 76D53338, 017A (r1   DELL     AS09     3000 INTL 20061109)
(XEN) ACPI: UEFI 76D534B8, 0042 (r1   DELL     AS09        0             0)
(XEN) ACPI: CSRT 76D53500, 014C (r0   DELL     AS09        5 INTL 20120624)
(XEN) ACPI: TPM2 76D53650, 0034 (r3        Tpm2Tabl        1 AMI         0)
(XEN) ACPI: SSDT 76D53688, 00C9 (r1   MSFT  RHPROXY        1 INTL 20120913)
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
(XEN) Detected 1333.331 MHz processor.
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
(XEN) Allocated console ring of 16 KiB.
(XEN) mwait-idle: MWAIT substates: 0x3000020
(XEN) mwait-idle: v0.4.1 model 0x37
(XEN) mwait-idle: lapic_timer_reliable_states 0xffffffff
(XEN) VMX: Supported advanced features:
(XEN)  - APIC MMIO access virtualisation
(XEN)  - APIC TPR shadow
(XEN)  - Extended Page Tables (EPT)
(XEN)  - Virtual-Processor Identifiers (VPID)
(XEN)  - Virtual NMI
(XEN)  - MSR direct-access bitmap
(XEN)  - Unrestricted Guest
(XEN)  - VM Functions
(XEN) HVM: ASIDs enabled.
(XEN) HVM: VMX enabled
(XEN) HVM: Hardware Assisted Paging (HAP) detected
(XEN) HVM: HAP page sizes: 4kB, 2MB
(XEN) alt table ffff82d04060e4b0 -> ffff82d04061c408
(XEN) Brought up 2 CPUs
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) Adding cpu 0 to runqueue 0
(XEN)  First cpu on runqueue, activating
(XEN) Adding cpu 1 to runqueue 1
(XEN)  First cpu on runqueue, activating
(XEN) mcheck_poll: Machine check polling timer started.
(XEN) Running stub recovery selftests...
(XEN) Fixup #UD[0000]: ffff82d07fffe040 [ffff82d07fffe040] -> ffff82d0404f1a0a
(XEN) Fixup #GP[0000]: ffff82d07fffe041 [ffff82d07fffe041] -> ffff82d0404f1a0a
(XEN) Fixup #SS[0000]: ffff82d07fffe040 [ffff82d07fffe040] -> ffff82d0404f1a0a
(XEN) Fixup #BP[0000]: ffff82d07fffe041 [ffff82d07fffe041] -> ffff82d0404f1a0a
(XEN) NX (Execute Disable) protection active
(XEN) Dom0 has maximum 295 PIRQs
(XEN) *** Building a PV Dom0 ***
(XEN) ELF: phdr: paddr=0x1000000 memsz=0x1153000
(XEN) ELF: phdr: paddr=0x2200000 memsz=0x4de000
(XEN) ELF: phdr: paddr=0x26de000 memsz=0x23158
(XEN) ELF: phdr: paddr=0x2702000 memsz=0x32a000
(XEN) ELF: memory: 0x1000000 -> 0x2a2c000
(XEN) ELF: note: GUEST_OS = "linux"
(XEN) ELF: note: GUEST_VERSION = "2.6"
(XEN) ELF: note: XEN_VERSION = "xen-3.0"
(XEN) ELF: note: VIRT_BASE = 0xffffffff80000000
(XEN) ELF: note: INIT_P2M = 0x8000000000
(XEN) ELF: note: ENTRY = 0xffffffff82702180
(XEN) ELF: note: HYPERCALL_PAGE = 0xffffffff81001000
(XEN) ELF: note: FEATURES = "!writable_page_tables|pae_pgdir_above_4gb"
(XEN) ELF: note: SUPPORTED_FEATURES = 0x8801
(XEN) ELF: note: PAE_MODE = "yes"
(XEN) ELF: note: LOADER = "generic"
(XEN) ELF: note: unknown (0xd)
(XEN) ELF: note: SUSPEND_CANCEL = 0x1
(XEN) ELF: note: MOD_START_PFN = 0x1
(XEN) ELF: note: HV_START_LOW = 0xffff800000000000
(XEN) ELF: note: PADDR_OFFSET = 0
(XEN) ELF: note: PHYS32_ENTRY = 0x1000380
(XEN) ELF: Found PVH image
(XEN) ELF: addresses:
(XEN)     virt_base        = 0xffffffff80000000
(XEN)     elf_paddr_offset = 0x0
(XEN)     virt_offset      = 0xffffffff80000000
(XEN)     virt_kstart      = 0xffffffff81000000
(XEN)     virt_kend        = 0xffffffff82a2c000
(XEN)     virt_entry       = 0xffffffff82702180
(XEN)     p2m_base         = 0x8000000000
(XEN)  Xen  kernel: 64-bit, lsb, compat32
(XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x2a2c000
(XEN) PHYSICAL MEMORY ARRANGEMENT:
(XEN)  Dom0 alloc.:   000000006c000000->0000000070000000 (240976 pages
to be allocated)
(XEN)  Init. ramdisk: 0000000075950000->0000000076bffc5c
(XEN) VIRTUAL MEMORY ARRANGEMENT:
(XEN)  Loaded kernel: ffffffff81000000->ffffffff82a2c000
(XEN)  Init. ramdisk: 0000000000000000->0000000000000000
(XEN)  Phys-Mach map: 0000008000000000->0000008000200000
(XEN)  Start info:    ffffffff82a2c000->ffffffff82a2c4b8
(XEN)  Xenstore ring: 0000000000000000->0000000000000000
(XEN)  Console ring:  0000000000000000->0000000000000000
(XEN)  Page tables:   ffffffff82a2d000->ffffffff82a46000
(XEN)  Boot stack:    ffffffff82a46000->ffffffff82a47000
(XEN)  TOTAL:         ffffffff80000000->ffffffff82c00000
(XEN)  ENTRY ADDRESS: ffffffff82702180
(XEN) Dom0 has maximum 1 VCPUs
(XEN) ELF: phdr 0 at 0xffffffff81000000 -> 0xffffffff82153000
(XEN) ELF: phdr 1 at 0xffffffff82200000 -> 0xffffffff826de000
(XEN) ELF: phdr 2 at 0xffffffff826de000 -> 0xffffffff82701158
(XEN) ELF: phdr 3 at 0xffffffff82702000 -> 0xffffffff82884000
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 684kB init memory
mapping kernel into physical memory
about to get started...
(XEN) Debugging connection not set up.
(XEN) ----[ Xen-4.14.0  x86_64  debug=y   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<00000000775e0d21>] 00000000775e0d21
(XEN) RFLAGS: 0000000000010246   CONTEXT: hypervisor (d0v0)
(XEN) rax: 0000000088431fe8   rbx: ffff8300714afb78   rcx: ffff8300714afa90
(XEN) rdx: 00000000ff920000   rsi: 00000000ff920000   rdi: 00000000775e4d58
(XEN) rbp: ffff8300714afc00   rsp: ffff8300714afa68   r8:  ffff8300714afb78
(XEN) r9:  0000000000000000   r10: 00000000ff900000   r11: 0000000000020000
(XEN) r12: ffff830073389080   r13: 0000000000000040   r14: ffff8300714afda0
(XEN) r15: ffff830073389010   cr0: 0000000080050033   cr4: 0000000000102660
(XEN) cr3: 0000000070ddd000   cr2: 00000000ff920020
(XEN) fsb: 0000000000000000   gsb: ffffffff826de000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <00000000775e0d21> (00000000775e0d21):
(XEN)  8b 11 45 33 c9 49 8b d8 <4c> 39 5a 20 75 0b 0f b7 42 30 48 8d 4c 10 17 eb
(XEN) Xen stack trace from rsp=ffff8300714afa68:
(XEN)    00000000775ddb8e 00000000775e4d58 ffff8300714affff ffff830077670000
(XEN)    ffff8300714afad8 00000000ff920000 0000000000020000 00000000ff93fff0
(XEN)    00000000ff92da5f 00000000ff920060 0000000007f70021 0000000000000000
(XEN)    0000000077739001 0000000000000206 ffff8300714afb48 ffff82d0409b8e90
(XEN)    0000003a00000200 0000000000000206 000000000006ea30 ffff830073389080
(XEN)    00000000775e2e73 00000000775da608 ffff8300714afcb0 0000000000000000
(XEN)    ffff8300714afd7c 0000000000000000 00000000775e2ead ffff8300714afb80
(XEN)    ffff82d04025e164 8000000000000003 ffff8300714afd7c 0000000000000000
(XEN)    00000000775ddd88 00000000775da610 00000016bfe4c8b8 ffff8300714afcb0
(XEN)    ffff82d040498c0d ffff830073389080 0000000000000001 ffff8300714afc00
(XEN)    0000000000000206 ffff8300714afbc0 0000003b40499029 ffff830073389080
(XEN)    8000000000000013 ffff830073389010 ffff830077586e18 ffff8300714afcb0
(XEN)    00000000775de841 ffff830073389010 0000000000000000 ffff8300714afda0
(XEN)    ffff8300714afd7c ffff830073389080 ffff82d040627000 ffff8300714afce0
(XEN)    ffff82d040203001 ffff8300714afd78 ffff8300714afd10 ffff8300714afca0
(XEN)    ffff830073389080 ffff830073389080 ffff82d040202f7e ffff82d04025e164
(XEN)    ffff830000000000 ffff82d0409b96e0 0000000000000016 000000006e20c000
(XEN)    ffff8300714afcb8 ffff82d040498c0d 00000000775c8f0e ffff82d040868a60
(XEN)    ffff82d040663970 0000000000000001 ffff8300714afcc8 000000006e20c000
(XEN)    ffff8300714afcb8 ffff82d040498c0d 00000000775c8f0e 0000000000000001
(XEN) Xen call trace:
(XEN)    [<00000000775e0d21>] R 00000000775e0d21
(XEN)    [<00000000775ddb8e>] S 00000000775ddb8e
(XEN)    [<ffff8300714afd7c>] F ffff8300714afd7c
(XEN)    [<8c2b0398e0000daa>] F 8c2b0398e0000daa
(XEN)
(XEN) Pagetable walk from 00000000ff920020:
(XEN)  L4[0x000] = 0000000070ddc063 ffffffffffffffff
(XEN)  L3[0x003] = 000000007122e063 ffffffffffffffff
(XEN)  L2[0x1fc] = 0000000000000000 ffffffffffffffff
(XEN) Xen lock profile info SHOW  (now = 2778929873 total = 2778929873)
(XEN) Global lock rtc_lock: addr=ffff82d040665fb0, lockval=00010001, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock pit_lock: addr=ffff82d040665fa0, lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock platform_timer_lock: addr=ffff82d040665f90,
lockval=00040004, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock sync_lock: addr=ffff82d040665f50, lockval=58b258b2, not locked
(XEN)   lock:22706(8344376), block:22704(17368727)
(XEN) Global lock lock: addr=ffff82d040665f60, lockval=00010001, not locked
(XEN)   lock:1(20037186), block:0(0)
(XEN) Global lock flush_lock: addr=ffff82d040664780, lockval=00040004,
not locked
(XEN)   lock:4(18165), block:0(0)
(XEN) Global lock xenpf_lock: addr=ffff82d040663970, lockval=00070006, cpu=0
(XEN)   lock:6(11152), block:0(0)
(XEN) Global lock pci_config_lock: addr=ffff82d040663400,
lockval=00160016, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock lapic_nmi_owner_lock: addr=ffff82d040662b00,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock last_lock: addr=ffff82d040661f40, lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock map_pgdir_lock: addr=ffff82d040661f50,
lockval=00090009, not locked
(XEN)   lock:6(2752), block:0(0)
(XEN) Global lock vector_lock: addr=ffff82d040661720,
lockval=00210021, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock irq_ratelimit_lock: addr=ffff82d040661710,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock lock: addr=ffff82d0406616f0, lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock msix_fixmap_lock: addr=ffff82d040660eb0,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock ioapic_lock: addr=ffff82d040660970,
lockval=00240024, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock i8259A_lock: addr=ffff82d04065f600,
lockval=00190019, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock osvw_lock: addr=ffff82d040651140, lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock vpmu_lock: addr=ffff82d04064fd50, lockval=00010001, not locked
(XEN)   lock:1(345), block:0(0)
(XEN) Global lock mtrr_mutex: addr=ffff82d04064ecf0, lockval=00000000,
not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock set_atomicity_lock: addr=ffff82d04064ebf0,
lockval=00020002, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock microcode_mutex: addr=ffff82d04064e8b0,
lockval=00010001, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock cmci_discover_lock: addr=ffff82d04064e2a0,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock mce_logout_lock: addr=ffff82d04064dd30,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock processing_lock: addr=ffff82d04064d640,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock pm_lock: addr=ffff82d04064c940, lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock apei_iomaps_lock: addr=ffff82d04064b560,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock erst_lock: addr=ffff82d04064b2e0, lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock iommu_pt_cleanup_lock: addr=ffff82d04064a8b0,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock shared_intremap_lock: addr=ffff82d04064a3d0,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock console_lock: addr=ffff82d0406463b0,
lockval=01b901b9, not locked
(XEN)   lock:198(1808536), block:0(0)
(XEN) Global lock ratelimit_lock: addr=ffff82d0406463a0,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock lock: addr=ffff82d040646380, lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock report_lock: addr=ffff82d040646190,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock sched_free_cpu_lock: addr=ffff82d040645f00,
lockval=00020002, not locked
(XEN)   lock:2(28170), block:0(0)
(XEN) Global lock cpupool_lock: addr=ffff82d040640f20,
lockval=00030003, not locked
(XEN)   lock:3(50850), block:0(0)
(XEN) Global lock pool_list_lock: addr=ffff82d0406406a0,
lockval=00010001, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock xenoprof_lock: addr=ffff82d0406401e0,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock pmu_owner_lock: addr=ffff82d0406401d0,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock vm_lock: addr=ffff82d04063fc90, lockval=000d000d, not locked
(XEN)   lock:1(4950), block:0(0)
(XEN) Global lock virtual_region_lock: addr=ffff82d04063f460,
lockval=00010001, not locked
(XEN)   lock:1(690), block:0(0)
(XEN) Global lock lock: addr=ffff82d04063f1f0, lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock wc_lock: addr=ffff82d04063ea30, lockval=00020002, not locked
(XEN)   lock:1(2430), block:0(0)
(XEN) Global lock tasklet_lock: addr=ffff82d04063e940,
lockval=05db05db, not locked
(XEN)   lock:887(160470), block:0(0)
(XEN) Global lock sysctl_lock: addr=ffff82d04063e720,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock symbols_mutex: addr=ffff82d04063e5a0,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock stopmachine_lock: addr=ffff82d04063e450,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock call_lock: addr=ffff82d04063e150, lockval=00060006, not locked
(XEN)   lock:1(3413), block:0(0)
(XEN) Global lock lock: addr=ffff82d04063d770, lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock heap_lock: addr=ffff82d04063d1c0, lockval=84218421, not locked
(XEN)   lock:85097(15948395), block:6(3136310)
(XEN) Global lock payload_lock: addr=ffff82d04063ba80,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock crash_notes_lock: addr=ffff82d04063b160,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock lock: addr=ffff82d04063ad50, lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock global_virq_handlers_lock: addr=ffff82d0406377d0,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock domlist_update_lock: addr=ffff82d0406370f0,
lockval=00010001, not locked
(XEN)   lock:1(315), block:0(0)
(XEN) Global lock domctl_lock: addr=ffff82d040636e50,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock debugtrace_lock: addr=ffff82d040636c60,
lockval=00030003, not locked
(XEN)   lock:3(9436), block:0(0)
(XEN) Global lock accounting_lock: addr=ffff82d040636aa0,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Global lock efi_rs_lock: addr=ffff82d040636360, lockval=00010000, cpu=0
(XEN)   lock:0(0), block:0(0)
(XEN) Domain 0 event_lock: addr=ffff8300787a9108, lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Domain 0 page_alloc_lock: addr=ffff8300787a9028,
lockval=12c112c1, not locked
(XEN)   lock:4801(11067769), block:0(0)
(XEN) Domain 0 domain_lock: addr=ffff8300787a9018, lockval=00010001, not locked
(XEN)   lock:1(28710), block:0(0)
(XEN) Domain 32767 page_alloc_lock: addr=ffff8300788ad028,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Domain 32767 domain_lock: addr=ffff8300788ad018,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Domain 32753 page_alloc_lock: addr=ffff830070dfd028,
lockval=11811181, not locked
(XEN)   lock:4481(447637), block:0(0)
(XEN) Domain 32753 domain_lock: addr=ffff830070dfd018,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) Domain 32754 page_alloc_lock: addr=ffff830073388028,
lockval=06000600, not locked
(XEN)   lock:1536(153096), block:0(0)
(XEN) Domain 32754 domain_lock: addr=ffff830073388018,
lockval=00000000, not locked
(XEN)   lock:0(0), block:0(0)
(XEN) debugtrace_dump() global buffer starting
1 cpupool_create(pool=0,sched=0)
2 Created cpupool 0 with scheduler SMP Credit Scheduler rev2 (credit2)
3 cpupool_add_domain(dom=0,pool=0) n_dom 1 rc 0
(XEN) wrap: 0
(XEN) debugtrace_dump() global buffer finished
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) FATAL PAGE FAULT
(XEN) [error_code=0000]
(XEN) Faulting linear address: 00000000ff920020
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...
(XEN) Debugging connection not set up.

