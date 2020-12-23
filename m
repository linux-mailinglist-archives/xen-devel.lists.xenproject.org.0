Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F642E226F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 23:32:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58605.103235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksCfT-0000Iy-BS; Wed, 23 Dec 2020 22:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58605.103235; Wed, 23 Dec 2020 22:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksCfT-0000IO-8S; Wed, 23 Dec 2020 22:31:39 +0000
Received: by outflank-mailman (input) for mailman id 58605;
 Wed, 23 Dec 2020 22:31:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ehhk=F3=protonmail.com=dylangerdaly@srs-us1.protection.inumbo.net>)
 id 1ksCfR-0000IJ-HX
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 22:31:38 +0000
Received: from mail-40134.protonmail.ch (unknown [185.70.40.134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4d70cbf-f8b9-42e9-a91e-acd12361d1c4;
 Wed, 23 Dec 2020 22:31:32 +0000 (UTC)
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
X-Inumbo-ID: f4d70cbf-f8b9-42e9-a91e-acd12361d1c4
Date: Wed, 23 Dec 2020 22:31:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail; t=1608762690;
	bh=f66g+qZIboOqSZhmi7qd5JGQeF+vAKCetIFSrUaG8AU=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=Ox6gZ1jepMc4rhl+bFqtZyAKjed6Z9Kr0JT3tR1TIAsB3SiF7Ts0XpNRs352pIpYl
	 6n/jlXAVEys46Uvwl18Cqk10uxn8Iqh9YsFSnpnkVRx6T7BxCD0Yz4exC0U7Qqy29j
	 5kkRHbNBjCgFmjTG3B3fetWaFGjewMta9yt/PoAw=
To: Dario Faggioli <dfaggioli@suse.com>
From: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Reply-To: Dylanger Daly <dylangerdaly@protonmail.com>
Subject: Re: Ryzen 4000 (Mobile) Softlocks/Micro-stutters
Message-ID: <YpdaXYxTuQqTe8UiFzMxsHQfY-cANXdoOaLH9_nrbz-mGgWcuCMSd-p1RWfnyva7zhn-CybnECNp5YAHhamjsehHJ6Roc7WUz6TYYh79INM=@protonmail.com>
In-Reply-To: <815f3bc3a28a165e8fa41c6954a6d00db656e3c3.camel@suse.com>
References: <9lQU_gCfRzGyyNb2j86pxTMi1IET1Iq7iK3994agUZPrTI5Xd-aCJAaRYuJlD3L5LT2WaV4N3-YF4xKl5ukialT0M_YD0ve6gmDFFfatpXw=@protonmail.com> <2cc5da3e-0ad0-4647-f1ca-190788c2910b@citrix.com> <3pKjdPYCiRimYjqHQP0xd_vqhoTOJqthTXOrY_rLeNvnQEpIF24gXDKgRhmr95JfARJzbVJVbfTrrJeiovGVHGbV0QBSZ2jez2Y_wt6db7g=@protonmail.com> <768d9dbb-4387-099f-b489-7952d7e883b0@suse.com> <T95F2Mi9RUUZ4w2wdeRqqM4uRyKgOFQNyooqEoTTDByK-0t9hZ1izG68lf90iExeYabEPSEv8puUeg0SEJtOmz8vYbVox2za28DXLd_h-_s=@protonmail.com> <eba12ea4-5dda-f112-0e33-714e859b9b03@suse.com> <815f3bc3a28a165e8fa41c6954a6d00db656e3c3.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	T_FILL_THIS_FORM_SHORT shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

Hi Dario,

Thank you for your reply

This issue is made much worse with: https://github.com/QubesOS/qubes-vmm-xe=
n/commit/c28754bdb458281a22e9a9779213c941531b6dff#diff-d98b01176d360f55f58c=
25d2dfbfadc115718806181ef40d1838d2efa6b2bea1

Reverting `xen: credit2: limit the max number of CPUs in a
 runqueue` results in stuttering even with dom0 pinned with 1vcpu, currentl=
y AMD Ryzen 4000 users are maintain a separate build without this change, I=
 think this commit has something to do with the issues we're experiencing.

Without pinning dom0 1 vcpu this is what the lockups look like: https://img=
ur.com/a/q7MQRez. Another weird artifact is the mouse (trackpad) will quick=
ly jerk when being moved.

The other interesting thing is appVMs can only use 2 vcpus, allocating more=
 results in that appVM exibiting stuttering/microlockups

So to get the device working, the following is required
1. Not revert `xen: credit2: limit the max number of CPUs in a
 runqueue`
2. Pin 1 vcpu for donm0
3. Limit 2 vcpus per appVM

> So, just to be sure I am understanding the symptoms correctly: here you
> say that Credit (and RTDS) "don't boot correctly". In another mail, I
> think you said that Credit boots, but is unusable due to lag and
> lockups... Which is which?

credit2 is the only scheduler that I can get working, other schedulers don'=
t boot at all

> Also, since this looks like it is SMT related, is Credit bootable
> and/or usable with SMT off? And with SMT on?

Qubes by default disables SMT, just after I sent my email yesterday I was a=
ctually able to boot with smt enabled as long as I had dom0 allocated 1 vcp=
u, without dom0 being allocated 1 vcpu the device won't boot at all.

> It'd be "wonderful" to see _how_ it does that, by seeing the
> stacktrace (preferrably of a debug build), if there is one. Or, if
> the system locks, e.g., knowing whether it is responsive at least
> to debug keys (and, if yest, how the output of the 'r' debug key
> looks like)

Because I'm compiling Xen myself, I should absolutely be able to enable deb=
ug/verbose logging, I'll try to capture more logging today

Here's what I can dig up currently

```
[chairman@dom0 ~]$ xl info
host                   : dom0
release                : 5.8.18-200.fc32.x86_64
version                : #1 SMP Mon Nov 2 19:49:11 UTC 2020
machine                : x86_64
nr_cpus                : 8
max_cpu_id             : 15
nr_nodes               : 1
cores_per_socket       : 8
threads_per_core       : 1
cpu_mhz                : 1696.837
hw_caps                : 178bf3ff:76d8320b:2e500800:244037ff:0000000f:219c9=
1a9:00400004:00000500
virt_caps              : pv hvm hvm_directio pv_directio hap
total_memory           : 30439
free_memory            : 6644
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 14
xen_extra              : .0
xen_version            : 4.14.0
xen_caps               : xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-=
3.0-x86_64
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=3D0xffff800000000000
xen_changeset          :
xen_commandline        : placeholder console=3Dnone dom0_mem=3Dmin:1024M do=
m0_mem=3Dmax:4096M dom0_max_vcpus=3D1 dom0_vcpus_pin ucode=3Dscan smt=3Doff=
 gnttab_max_frames=3D2048 gnttab_max_maptrack_frames=3D4096 ept=3Dexec-sp n=
o-real-mode edd=3Doff
cc_compiler            : gcc (GCC) 10.2.1 20201125 (Red Hat 10.2.1-9)
cc_compile_by          : user
cc_compile_domain      : [unknown]
cc_compile_date        : Wed Dec 16 00:00:00 UTC 2020
build_id               : 9eb1d06c8bbc4686c4a8a6c9ee46d91e106df81d
xend_config_format     : 4

[chairman@dom0 ~]$ xl vcpu-list
Name                                ID  VCPU   CPU State   Time(s) Affinity=
 (Hard / Soft)
Domain-0                             0     0    0   r--     367.3  0 / 0,2,=
4,6,8,10,12,14
sys-net                              1     0   12   -b-      59.9  all / al=
l
sys-net                              1     1   10   -b-      61.0  all / al=
l
sys-net-dm                           2     0   10   -b-      19.4  all / al=
l
sys-usb                              3     0    8   -b-      31.0  all / al=
l
sys-usb                              3     1   14   -b-      36.9  all / al=
l
sys-usb                              3     2   10   -b-      34.5  all / al=
l
sys-usb                              3     3   12   -b-      32.8  all / al=
l
sys-usb-dm                           4     0   12   -b-      20.8  all / al=
l
sys-firewall                         5     0   10   -b-       1.4  all / al=
l
sys-firewall                         5     1   14   -b-      11.0  all / al=
l
xxxxxxxxxxxxxx                       6     0   12   -b-       9.2  all / al=
l
xxxxxxxxxxxxxx                       6     1   12   -b-       8.0  all / al=
l
xxxxxxxxxxxxxxx                      7     0    8   -b-       8.9  all / al=
l
xxxxxxxxxxxxxxx                      7     1    8   -b-       6.1  all / al=
l
xxxxxxxxxxx                          8     0   14   -b-     399.2  all / al=
l
xxxxxxxxxxx                          8     1   12   -b-     454.6  all / al=
l
xxxxxxxxxxxxxxxx                     9     0   14   -b-      33.7  all / al=
l
xxxxxxxxxxxxxxxx                     9     1    8   -b-      54.1  all / al=
l
xxxxxxxxxxxxxxx                     10     0   10   -b-       4.2  all / al=
l
xxxxxxxxxxxxxxx                     10     1    8   -b-       7.3  all / al=
l
xxxxxxxxxxxx                        11     0    2   -b-      39.7  all / al=
l
xxxxxxxxxxxx                        11     1   12   -b-     121.9  all / al=
l
email                               12     0    8   -b-      29.2  all / al=
l
email                               12     1   14   -b-      84.2  all / al=
l


[2020-12-24 08:34:49] Logfile Opened
[2020-12-24 08:34:49] (XEN) Built-in command line: ept=3Dexec-sp
[2020-12-24 08:34:49] (XEN) parameter no-real-mode unknown!
[2020-12-24 08:34:49] (XEN) parameter edd unknown!
[2020-12-24 08:34:49]  Xen 4.14.0
[2020-12-24 08:34:49] (XEN) Xen version 4.14.0 (user@[unknown]) (gcc (GCC) =
10.2.1 20201125 (Red Hat 10.2.1-9)) debug=3Dn  Wed Dec 16 00:00:00 UTC 2020
[2020-12-24 08:34:49] (XEN) Latest ChangeSet:
[2020-12-24 08:34:49] (XEN) Bootloader: GRUB 2.04
[2020-12-24 08:34:49] (XEN) Command line: placeholder console=3Dnone dom0_m=
em=3Dmin:1024M dom0_mem=3Dmax:4096M dom0_max_vcpus=3D1 dom0_vcpus_pin ucode=
=3Dscan smt=3Doff gnttab_max_frames=3D2048 gnttab_max_maptrack_frames=3D409=
6 ept=3Dexec-sp no-real-mode edd=3Doff
[2020-12-24 08:34:49] (XEN) Xen image load base address: 0xb8e00000
[2020-12-24 08:34:49] (XEN) Video information:
[2020-12-24 08:34:49] (XEN)  VGA is graphics mode 1920x1080, 32 bpp
[2020-12-24 08:34:49] (XEN) Disc information:
[2020-12-24 08:34:49] (XEN)  Found 0 MBR signatures
[2020-12-24 08:34:49] (XEN)  Found 2 EDD information structures
[2020-12-24 08:34:49] (XEN) EFI RAM map:
[2020-12-24 08:34:49] (XEN)  [0000000000000000, 000000000009efff] (usable)
[2020-12-24 08:34:49] (XEN)  [000000000009f000, 000000000009ffff] (reserved=
)
[2020-12-24 08:34:49] (XEN)  [00000000000e0000, 00000000000fffff] (reserved=
)
[2020-12-24 08:34:49] (XEN)  [0000000000100000, 0000000009bfffff] (usable)
[2020-12-24 08:34:49] (XEN)  [0000000009c00000, 0000000009d00fff] (reserved=
)
[2020-12-24 08:34:49] (XEN)  [0000000009d01000, 0000000009efffff] (usable)
[2020-12-24 08:34:49] (XEN)  [0000000009f00000, 0000000009f0ffff] (ACPI NVS=
)
[2020-12-24 08:34:49] (XEN)  [0000000009f10000, 00000000bd9ddfff] (usable)
[2020-12-24 08:34:49] (XEN)  [00000000bd9de000, 00000000ca37dfff] (reserved=
)
[2020-12-24 08:34:49] (XEN)  [00000000ca37e000, 00000000cc37dfff] (ACPI NVS=
)
[2020-12-24 08:34:49] (XEN)  [00000000cc37e000, 00000000cc3fdfff] (ACPI dat=
a)
[2020-12-24 08:34:49] (XEN)  [00000000cc3fe000, 00000000cdffffff] (usable)
[2020-12-24 08:34:49] (XEN)  [00000000ce000000, 00000000cfffffff] (reserved=
)
[2020-12-24 08:34:49] (XEN)  [00000000f8000000, 00000000fbffffff] (reserved=
)
[2020-12-24 08:34:49] (XEN)  [00000000fde00000, 00000000fdefffff] (reserved=
)
[2020-12-24 08:34:49] (XEN)  [00000000fed80000, 00000000fed80fff] (reserved=
)
[2020-12-24 08:34:49] (XEN)  [0000000100000000, 00000007af33ffff] (usable)
[2020-12-24 08:34:49] (XEN)  [00000007af340000, 000000082fffffff] (reserved=
)
[2020-12-24 08:34:49] (XEN) ACPI: RSDP CC3FD014, 0024 (r2 LENOVO)
[2020-12-24 08:34:49] (XEN) ACPI: XSDT CC3FB188, 0104 (r1 LENOVO TP-R1C    =
   1290 PTEC        2)
[2020-12-24 08:34:49] (XEN) ACPI: FACP BE499000, 0114 (r6 LENOVO TP-R1C    =
   1290 PTEC        2)
[2020-12-24 08:34:49] (XEN) ACPI: DSDT BE484000, F08E (r1 LENOVO TP-R1C    =
   1290 INTL 20180313)
[2020-12-24 08:34:49] (XEN) ACPI: FACS CC218000, 0040
[2020-12-24 08:34:49] (XEN) ACPI: SSDT BF751000, 00A2 (r1 LENOVO PID0Ssdt  =
      1 INTL 20180313)
[2020-12-24 08:34:49] (XEN) ACPI: SSDT BF750000, 0CCC (r1 LENOVO UsbCTabl  =
      1 INTL 20180313)
[2020-12-24 08:34:49] (XEN) ACPI: SSDT BF743000, 7216 (r2 LENOVO TP-R1C    =
      2 MSFT  4000000)
[2020-12-24 08:34:49] (XEN) ACPI: IVRS BF742000, 01A4 (r2 LENOVO TP-R1C    =
   1290 PTEC        2)
[2020-12-24 08:34:49] (XEN) ACPI: SSDT BF704000, 0266 (r1 LENOVO     STD3  =
      1 INTL 20180313)
[2020-12-24 08:34:49] (XEN) ACPI: SSDT BF6F0000, 0632 (r2 LENOVO Tpm2Tabl  =
   1000 INTL 20180313)
[2020-12-24 08:34:49] (XEN) ACPI: TPM2 BF6EF000, 0034 (r3 LENOVO TP-R1C    =
   1290 PTEC        2)
[2020-12-24 08:34:49] (XEN) ACPI: SSDT BF6EE000, 0924 (r1 LENOVO WmiTable  =
      1 INTL 20180313)
[2020-12-24 08:34:49] (XEN) ACPI: MSDM BF6B5000, 0055 (r3 LENOVO TP-R1C    =
   1290 PTEC        2)
[2020-12-24 08:34:49] (XEN) ACPI: BATB BF6A0000, 004A (r2 LENOVO TP-R1C    =
   1290 PTEC        2)
[2020-12-24 08:34:49] (XEN) ACPI: HPET BE498000, 0038 (r1 LENOVO TP-R1C    =
   1290 PTEC        2)
[2020-12-24 08:34:49] (XEN) ACPI: APIC BE497000, 0138 (r2 LENOVO TP-R1C    =
   1290 PTEC        2)
[2020-12-24 08:34:49] (XEN) ACPI: MCFG BE496000, 003C (r1 LENOVO TP-R1C    =
   1290 PTEC        2)
[2020-12-24 08:34:49] (XEN) ACPI: SBST BE495000, 0030 (r1 LENOVO TP-R1C    =
   1290 PTEC        2)
[2020-12-24 08:34:49] (XEN) ACPI: WSMT BE494000, 0028 (r1 LENOVO TP-R1C    =
   1290 PTEC        2)
[2020-12-24 08:34:49] (XEN) ACPI: VFCT BE476000, D484 (r1 LENOVO TP-R1C    =
   1290 PTEC        2)
[2020-12-24 08:34:49] (XEN) ACPI: SSDT BE472000, 39F4 (r1 LENOVO TP-R1C    =
      1 AMD         1)
[2020-12-24 08:34:49] (XEN) ACPI: CRAT BE471000, 0F00 (r1 LENOVO TP-R1C    =
   1290 PTEC        2)
[2020-12-24 08:34:49] (XEN) ACPI: CDIT BE470000, 0029 (r1 LENOVO TP-R1C    =
   1290 PTEC        2)
[2020-12-24 08:34:49] (XEN) ACPI: FPDT BF6C7000, 0034 (r1 LENOVO TP-R1C    =
   1290 PTEC        2)
[2020-12-24 08:34:49] (XEN) ACPI: SSDT BE46E000, 13CF (r1 LENOVO TP-R1C    =
      1 INTL 20180313)
[2020-12-24 08:34:49] (XEN) ACPI: SSDT BE46C000, 1576 (r1 LENOVO TP-R1C    =
      1 INTL 20180313)
[2020-12-24 08:34:49] (XEN) ACPI: SSDT BE468000, 353C (r1 LENOVO TP-R1C    =
      1 INTL 20180313)
[2020-12-24 08:34:49] (XEN) ACPI: BGRT BE467000, 0038 (r1 LENOVO TP-R1C    =
   1290 PTEC        2)
[2020-12-24 08:34:49] (XEN) ACPI: UEFI CC217000, 013E (r1 LENOVO TP-R1C    =
   1290 PTEC        2)
[2020-12-24 08:34:49] (XEN) ACPI: SSDT BF74F000, 0090 (r1 LENOVO TP-R1C    =
      1 INTL 20180313)
[2020-12-24 08:34:49] (XEN) ACPI: SSDT BF74E000, 09AD (r1 LENOVO TP-R1C    =
      1 INTL 20180313)
[2020-12-24 08:34:49] (XEN) System RAM: 30439MB (31170232kB)
[2020-12-24 08:34:49] (XEN) Domain heap initialised
[2020-12-24 08:34:49] (XEN) ACPI: 32/64X FACS address mismatch in FADT - cc=
218000/0000000000000000, using 32
[2020-12-24 08:34:49] (XEN) IOAPIC[0]: apic_id 32, version 33, address 0xfe=
c00000, GSI 0-23
[2020-12-24 08:34:49] (XEN) IOAPIC[1]: apic_id 33, version 33, address 0xfe=
c01000, GSI 24-55
[2020-12-24 08:34:49] (XEN) Enabling APIC mode:  Phys.  Using 2 I/O APICs
[2020-12-24 08:34:49] (XEN) CPU0: 1400..1700 MHz
[2020-12-24 08:34:49] (XEN) xstate: size: 0x380 and states: 0x207
[2020-12-24 08:34:49] (XEN) Speculative mitigation facilities:
[2020-12-24 08:34:49] (XEN)   Hardware features: IBPB
[2020-12-24 08:34:49] (XEN)   Compiled-in support: INDIRECT_THUNK
[2020-12-24 08:34:49] (XEN)   Xen settings: BTI-Thunk LFENCE, SPEC_CTRL: No=
, Other: IBPB BRANCH_HARDEN
[2020-12-24 08:34:49] (XEN)   Support for HVM VMs: RSB
[2020-12-24 08:34:49] (XEN)   Support for PV VMs: RSB
[2020-12-24 08:34:49] (XEN)   XPTI (64-bit PV only): Dom0 disabled, DomU di=
sabled (without PCID)
[2020-12-24 08:34:49] (XEN)   PV L1TF shadowing: Dom0 disabled, DomU disabl=
ed
[2020-12-24 08:34:49] (XEN) Using scheduler: SMP Credit Scheduler rev2 (cre=
dit2)
[2020-12-24 08:34:49] (XEN) Initializing Credit2 scheduler
[2020-12-24 08:34:49] (XEN) Platform timer is 14.318MHz HPET
[2020-12-24 08:34:49] (XEN) Detected 1696.837 MHz processor.
[2020-12-24 08:34:49] (XEN) Unknown cachability for MFNs 0xe0-0xff
[2020-12-24 08:34:49] (XEN) AMD-Vi: IOMMU Extended Features:
[2020-12-24 08:34:49] (XEN) - Peripheral Page Service Request
[2020-12-24 08:34:49] (XEN) - x2APIC
[2020-12-24 08:34:49] (XEN) - NX bit
[2020-12-24 08:34:49] (XEN) - Invalidate All Command
[2020-12-24 08:34:49] (XEN) - Guest APIC
[2020-12-24 08:34:49] (XEN) - Performance Counters
[2020-12-24 08:34:49] (XEN) - Host Address Translation Size: 0x2
[2020-12-24 08:34:49] (XEN) - Guest Address Translation Size: 0
[2020-12-24 08:34:49] (XEN) - Guest CR3 Root Table Level: 0x1
[2020-12-24 08:34:49] (XEN) - Maximum PASID: 0xf
[2020-12-24 08:34:49] (XEN) - SMI Filter Register: 0x1
[2020-12-24 08:34:49] (XEN) - SMI Filter Register Count: 0x1
[2020-12-24 08:34:49] (XEN) - Guest Virtual APIC Modes: 0x1
[2020-12-24 08:34:49] (XEN) - Dual PPR Log: 0x2
[2020-12-24 08:34:49] (XEN) - Dual Event Log: 0x2
[2020-12-24 08:34:49] (XEN) - User / Supervisor Page Protection
[2020-12-24 08:34:49] (XEN) - Device Table Segmentation: 0x3
[2020-12-24 08:34:49] (XEN) - PPR Log Overflow Early Warning
[2020-12-24 08:34:49] (XEN) - PPR Automatic Response
[2020-12-24 08:34:49] (XEN) - Memory Access Routing and Control: 0
[2020-12-24 08:34:49] (XEN) - Block StopMark Message
[2020-12-24 08:34:49] (XEN) - Performance Optimization
[2020-12-24 08:34:49] (XEN) - MSI Capability MMIO Access
[2020-12-24 08:34:49] (XEN) - Guest I/O Protection
[2020-12-24 08:34:49] (XEN) - Enhanced PPR Handling
[2020-12-24 08:34:49] (XEN) - Attribute Forward
[2020-12-24 08:34:49] (XEN) - Invalidate IOTLB Type
[2020-12-24 08:34:49] (XEN) - VM Table Size: 0
[2020-12-24 08:34:49] (XEN) - Guest Access Bit Update Disable
[2020-12-24 08:34:49] (XEN) AMD-Vi: IOMMU 0 Enabled.
[2020-12-24 08:34:49] (XEN) I/O virtualisation enabled
[2020-12-24 08:34:49] (XEN)  - Dom0 mode: Relaxed
[2020-12-24 08:34:49] (XEN) Interrupt remapping enabled
[2020-12-24 08:34:49] (XEN) ENABLING IO-APIC IRQs
[2020-12-24 08:34:49] (XEN)  -> Using new ACK method
[2020-12-24 08:34:49] (XEN) Allocated console ring of 32 KiB.
[2020-12-24 08:34:49] (XEN) HVM: ASIDs enabled.
[2020-12-24 08:34:49] (XEN) SVM: Supported advanced features:
[2020-12-24 08:34:49] (XEN)  - Nested Page Tables (NPT)
[2020-12-24 08:34:49] (XEN)  - Last Branch Record (LBR) Virtualisation
[2020-12-24 08:34:49] (XEN)  - Next-RIP Saved on #VMEXIT
[2020-12-24 08:34:49] (XEN)  - VMCB Clean Bits
[2020-12-24 08:34:49] (XEN)  - DecodeAssists
[2020-12-24 08:34:49] (XEN)  - Virtual VMLOAD/VMSAVE
[2020-12-24 08:34:49] (XEN)  - Virtual GIF
[2020-12-24 08:34:49] (XEN)  - Pause-Intercept Filter
[2020-12-24 08:34:49] (XEN)  - Pause-Intercept Filter Threshold
[2020-12-24 08:34:49] (XEN)  - TSC Rate MSR
[2020-12-24 08:34:49] (XEN) HVM: SVM enabled
[2020-12-24 08:34:49] (XEN) HVM: Hardware Assisted Paging (HAP) detected
[2020-12-24 08:34:49] (XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB
[2020-12-24 08:34:49] (XEN) CPU 1 still not dead...
[2020-12-24 08:34:49] (XEN) CPU 1 still not dead...
[2020-12-24 08:34:49] (XEN) Brought up 8 CPUs
[2020-12-24 08:34:49] (XEN) Scheduling granularity: cpu, 1 CPU per sched-re=
source
[2020-12-24 08:34:49] (XEN) xenoprof: Initialization failed. AMD processor =
family 23 is not supported
[2020-12-24 08:34:49] (XEN) TSC warp detected, disabling TSC_RELIABLE
[2020-12-24 08:34:49] (XEN) Dom0 has maximum 264 PIRQs
[2020-12-24 08:34:49] (XEN)  Xen  kernel: 64-bit, lsb, compat32
[2020-12-24 08:34:49] (XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000=
 -> 0x3e00000
[2020-12-24 08:34:49] (XEN) PHYSICAL MEMORY ARRANGEMENT:
[2020-12-24 08:34:49] (XEN)  Dom0 alloc.:   000000078c000000->0000000790000=
000 (1022908 pages to be allocated)
[2020-12-24 08:34:49] (XEN)  Init. ramdisk: 00000007acdbc000->00000007af1ff=
5cd
[2020-12-24 08:34:49] (XEN) VIRTUAL MEMORY ARRANGEMENT:
[2020-12-24 08:34:49] (XEN)  Loaded kernel: ffffffff81000000->ffffffff83e00=
000
[2020-12-24 08:34:49] (XEN)  Init. ramdisk: 0000000000000000->0000000000000=
000
[2020-12-24 08:34:49] (XEN)  Phys-Mach map: 0000008000000000->0000008000800=
000
[2020-12-24 08:34:49] (XEN)  Start info:    ffffffff83e00000->ffffffff83e00=
4b8
[2020-12-24 08:34:49] (XEN)  Xenstore ring: 0000000000000000->0000000000000=
000
[2020-12-24 08:34:49] (XEN)  Console ring:  0000000000000000->0000000000000=
000
[2020-12-24 08:34:49] (XEN)  Page tables:   ffffffff83e01000->ffffffff83e24=
000
[2020-12-24 08:34:49] (XEN)  Boot stack:    ffffffff83e24000->ffffffff83e25=
000
[2020-12-24 08:34:49] (XEN)  TOTAL:         ffffffff80000000->ffffffff84000=
000
[2020-12-24 08:34:49] (XEN)  ENTRY ADDRESS: ffffffff83128180
[2020-12-24 08:34:49] (XEN) Dom0 has maximum 1 VCPUs
[2020-12-24 08:34:49] (XEN) Initial low memory virq threshold set at 0x4000=
 pages.
[2020-12-24 08:34:49] (XEN) Scrubbing Free RAM in background
[2020-12-24 08:34:49] (XEN) Std. Loglevel: Errors and warnings
[2020-12-24 08:34:49] (XEN) Guest Loglevel: Nothing (Rate-limited: Errors a=
nd warnings)
[2020-12-24 08:34:49] (XEN) *** Serial input to DOM0 (type 'CTRL-a' three t=
imes to switch input)
[2020-12-24 08:34:49] (XEN) Freed 536kB init memory
```

> In absence of that, I only have more questions. :-/ E.g., how are you
> enabling and disabling SMT, via the command line parameter, or via
> BIOS?

Currently via Xen's CMDLINE, the Lenovo X13 doesn't have an option to disab=
le SMT :(

> Also, can you perhaps try either upstream 4.14 Xen (from sources, I
> mean) or the packages for a distro different than QubesOS (perhaps
> installing such distro, temporarily, in an external HD or whatever).

I can give this a shot, I'll try and dump out as much logging as I can, the=
n I'll try build from the master branch of xen

> I can try Credit as well, later, but if this is something CPU arch/gen
> related, it seems to be a Ryzen rather than a Zen 2 thing...

Absolutely, I agree, this seems to be Ryzen 3000/4000 related, another Qube=
s user running a Ryzen 9 3900X CPU appears to be having the same issue: htt=
ps://imgur.com/a/EYOMmRe

