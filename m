Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F7B707372
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 23:01:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536033.834183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzOFn-0002br-CL; Wed, 17 May 2023 21:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536033.834183; Wed, 17 May 2023 21:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzOFn-0002Zr-91; Wed, 17 May 2023 21:00:11 +0000
Received: by outflank-mailman (input) for mailman id 536033;
 Wed, 17 May 2023 21:00:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VO9T=BG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pzOFl-0002ZY-Hg
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 21:00:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccb07e24-f4f5-11ed-8611-37d641c3527e;
 Wed, 17 May 2023 23:00:06 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 326A264A23;
 Wed, 17 May 2023 21:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E350C433EF;
 Wed, 17 May 2023 21:00:03 +0000 (UTC)
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
X-Inumbo-ID: ccb07e24-f4f5-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684357204;
	bh=yZxdHCXbGtxH9gvDJ8pIKwDgo+h1oCo9Ngu/FosH7NU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nTh4qtbpQIlH5CaYp3IfQjRUOKyuD1/H2ms/+G0UtnkVfBhynLzkDgZs69/RbQKdZ
	 IAfRC9ZcBR1mjrQFwrbpPJgKRcoEMIiNTVUAriCCNKEVqH0I14K4NBorO2oRxoVCqL
	 2mCMuuHD7yv1qhsnuukc4gFL/hGeU97SrcOczZ2Qy2M9+/iN49FzG1iJSe3K7YZbKo
	 ZAsr72U4VzMZEEleVbG6TPiU96wYHwDhSJ4YbAsjIyHQOgWfIoP4gyDFDJEZWxN9Zg
	 3ucIsPQDap1+KWvxIt597enaFnSGpdzYAv/vk2jWG4q7bMbOI6T9WxBppp3KPmgGEZ
	 L9JKliFjApmIQ==
Date: Wed, 17 May 2023 14:00:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    jbeulich@suse.com, xen-devel@lists.xenproject.org, 
    Xenia.Ragiadakou@amd.com, Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH 2/2] xen/x86/pvh: copy ACPI tables to Dom0 instead of
 mapping
In-Reply-To: <ZGSTGIMh6qvCLZSr@Air-de-Roger>
Message-ID: <alpine.DEB.2.22.394.2305171354590.128889@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop> <20230513011720.3978354-2-sstabellini@kernel.org> <ZGH+5OKqnjTjUr/F@Air-de-Roger> <alpine.DEB.2.22.394.2305151656500.4125828@ubuntu-linux-20-04-desktop> <ZGNLArlA0Yei4Fr0@Air-de-Roger>
 <alpine.DEB.2.22.394.2305161522480.128889@ubuntu-linux-20-04-desktop> <ZGSTGIMh6qvCLZSr@Air-de-Roger>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1353024790-1684357126=:128889"
Content-ID: <alpine.DEB.2.22.394.2305171358480.128889@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1353024790-1684357126=:128889
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2305171358481.128889@ubuntu-linux-20-04-desktop>

On Wed, 17 May 2023, Roger Pau Monné wrote:
> On Tue, May 16, 2023 at 04:34:09PM -0700, Stefano Stabellini wrote:
> > On Tue, 16 May 2023, Roger Pau Monné wrote:
> > > On Mon, May 15, 2023 at 05:11:25PM -0700, Stefano Stabellini wrote:
> > > > On Mon, 15 May 2023, Roger Pau Monné wrote:
> > > > > On Fri, May 12, 2023 at 06:17:20PM -0700, Stefano Stabellini wrote:
> > > > > > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > > > > > 
> > > > > > Mapping the ACPI tables to Dom0 PVH 1:1 leads to memory corruptions of
> > > > > > the tables in the guest. Instead, copy the tables to Dom0.
> > > > > > 
> > > > > > This is a workaround.
> > > > > > 
> > > > > > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > > > > > ---
> > > > > > As mentioned in the cover letter, this is a RFC workaround as I don't
> > > > > > know the cause of the underlying problem. I do know that this patch
> > > > > > solves what would be otherwise a hang at boot when Dom0 PVH attempts to
> > > > > > parse ACPI tables.
> > > > > 
> > > > > I'm unsure how safe this is for native systems, as it's possible for
> > > > > firmware to modify the data in the tables, so copying them would
> > > > > break that functionality.
> > > > > 
> > > > > I think we need to get to the root cause that triggers this behavior
> > > > > on QEMU.  Is it the table checksum that fail, or something else?  Is
> > > > > there an error from Linux you could reference?
> > > > 
> > > > I agree with you but so far I haven't managed to find a way to the root
> > > > of the issue. Here is what I know. These are the logs of a successful
> > > > boot using this patch:
> > > > 
> > > > [   10.437488] ACPI: Early table checksum verification disabled
> > > > [   10.439345] ACPI: RSDP 0x000000004005F955 000024 (v02 BOCHS )
> > > > [   10.441033] ACPI: RSDT 0x000000004005F979 000034 (v01 BOCHS  BXPCRSDT 00000001 BXPC 00000001)
> > > > [   10.444045] ACPI: APIC 0x0000000040060F76 00008A (v01 BOCHS  BXPCAPIC 00000001 BXPC 00000001)
> > > > [   10.445984] ACPI: FACP 0x000000004005FA65 000074 (v01 BOCHS  BXPCFACP 00000001 BXPC 00000001)
> > > > [   10.447170] ACPI BIOS Warning (bug): Incorrect checksum in table [FACP] - 0x67, should be 0x30 (20220331/tbprint-174)
> > > > [   10.449522] ACPI: DSDT 0x000000004005FB19 00145D (v01 BOCHS  BXPCDSDT 00000001 BXPC 00000001)
> > > > [   10.451258] ACPI: FACS 0x000000004005FAD9 000040
> > > > [   10.452245] ACPI: Reserving APIC table memory at [mem 0x40060f76-0x40060fff]
> > > > [   10.452389] ACPI: Reserving FACP table memory at [mem 0x4005fa65-0x4005fad8]
> > > > [   10.452497] ACPI: Reserving DSDT table memory at [mem 0x4005fb19-0x40060f75]
> > > > [   10.452602] ACPI: Reserving FACS table memory at [mem 0x4005fad9-0x4005fb18]
> > > > 
> > > > 
> > > > And these are the logs of the same boot (unsuccessful) without this
> > > > patch:
> > > > 
> > > > [   10.516015] ACPI: Early table checksum verification disabled
> > > > [   10.517732] ACPI: RSDP 0x0000000040060F1E 000024 (v02 BOCHS )
> > > > [   10.519535] ACPI: RSDT 0x0000000040060F42 000034 (v01 BOCHS  BXPCRSDT 00000001 BXPC 00000001)
> > > > [   10.522523] ACPI: APIC 0x0000000040060F76 00008A (v01 BOCHS  BXPCAPIC 00000001 BXPC 00000001)
> > > > [   10.527453] ACPI: ���� 0x000000007FFE149D FFFFFFFF (v255 ������ �������� FFFFFFFF ���� FFFFFFFF)
> > > > [   10.528362] ACPI: Reserving APIC table memory at [mem 0x40060f76-0x40060fff]
> > > > [   10.528491] ACPI: Reserving ���� table memory at [mem 0x7ffe149d-0x17ffe149b]
> > > > 
> > > > It is clearly a memory corruption around FACS but I couldn't find the
> > > > reason for it. The mapping code looks correct. I hope you can suggest a
> > > > way to narrow down the problem. If I could, I would suggest to apply
> > > > this patch just for the QEMU PVH tests but we don't have the
> > > > infrastructure for that in gitlab-ci as there is a single Xen build for
> > > > all tests.
> > > 
> > > Would be helpful to see the memory map provided to Linux, just in case
> > > we messed up and there's some overlap.
> > 
> > Everything looks correct. Here are some more logs:
> > 
> > (XEN) Xen-e820 RAM map:
> > (XEN)  [0000000000000000, 000000000009fbff] (usable)
> > (XEN)  [000000000009fc00, 000000000009ffff] (reserved)
> > (XEN)  [00000000000f0000, 00000000000fffff] (reserved)
> > (XEN)  [0000000000100000, 000000007ffdffff] (usable)
> > (XEN)  [000000007ffe0000, 000000007fffffff] (reserved)
> > (XEN)  [00000000fffc0000, 00000000ffffffff] (reserved)
> > (XEN)  [000000fd00000000, 000000ffffffffff] (reserved)
> > (XEN) Microcode loading not available
> > (XEN) New Xen image base address: 0x7f600000
> > (XEN) System RAM: 2047MB (2096636kB)
> > (XEN) ACPI: RSDP 000F58D0, 0014 (r0 BOCHS )
> > (XEN) ACPI: RSDT 7FFE1B21, 0034 (r1 BOCHS  BXPC            1 BXPC        1)
> > (XEN) ACPI: FACP 7FFE19CD, 0074 (r1 BOCHS  BXPC            1 BXPC        1)
> > (XEN) ACPI: DSDT 7FFE0040, 198D (r1 BOCHS  BXPC            1 BXPC        1)
> > (XEN) ACPI: FACS 7FFE0000, 0040
> > (XEN) ACPI: APIC 7FFE1A41, 0080 (r1 BOCHS  BXPC            1 BXPC        1)
> > (XEN) ACPI: HPET 7FFE1AC1, 0038 (r1 BOCHS  BXPC            1 BXPC        1)
> > (XEN) ACPI: WAET 7FFE1AF9, 0028 (r1 BOCHS  BXPC            1 BXPC        1)
> > [...]
> > (XEN) Dom0 memory map:
> > (XEN)  [0000000000000000, 000000000009efff] (usable)
> > (XEN)  [000000000009fc00, 000000000009ffff] (reserved)
> > (XEN)  [00000000000f0000, 00000000000fffff] (reserved)
> > (XEN)  [0000000000100000, 0000000040060f1d] (usable)
> > (XEN)  [0000000040060f1e, 0000000040060fa7] (ACPI data)
> > (XEN)  [0000000040061000, 000000007ffdffff] (unusable)
> > (XEN)  [000000007ffe0000, 000000007fffffff] (reserved)
> > (XEN)  [00000000fffc0000, 00000000ffffffff] (reserved)
> > (XEN)  [000000fd00000000, 000000ffffffffff] (reserved)
> > [...]
> > [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009efff] usable
> > [    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x00000000000fffff] reserved
> > [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000040060f1d] usable
> > [    0.000000] BIOS-e820: [mem 0x0000000040060f1e-0x0000000040060fa7] ACPI data
> > [    0.000000] BIOS-e820: [mem 0x0000000040061000-0x000000007ffdffff] unusable
> > [    0.000000] BIOS-e820: [mem 0x000000007ffe0000-0x000000007fffffff] reserved
> > [    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
> > [    0.000000] BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff] reserved
> > [...]
> > [   10.102427] ACPI: Early table checksum verification disabled
> > [   10.104455] ACPI: RSDP 0x0000000040060F1E 000024 (v02 BOCHS )
> > [   10.106250] ACPI: RSDT 0x0000000040060F42 000034 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
> > [   10.109549] ACPI: APIC 0x0000000040060F76 00008A (v01 BOCHS  BXPC     00000001 BXPC 00000001)
> > [   10.115173] ACPI: ���� 0x000000007FFE19CD FFFFFFFF (v255 ������ �������� FFFFFFFF ���� FFFFFFFF)
> > [   10.116054] ACPI: Reserving APIC table memory at [mem 0x40060f76-0x40060fff]
> > [   10.116182] ACPI: Reserving ���� table memory at [mem 0x7ffe19cd-0x17ffe19cb]
> > 
> > 
> > 
> > > It seems like some of the XSDT entries (the FADT one) is corrupt?
> > > 
> > > Could you maybe add some debug to the Xen-crafted XSDT placement.
> > 
> > I added a printk just after:
> > 
> >   xsdt->table_offset_entry[j++] = tables[i].address;
> > 
> > And it printed only once:
> > 
> >   (XEN) DEBUG pvh_setup_acpi_xsdt 1000 name=FACP address=7ffe19cd
> > 
> > That actually matches the address read by Linux:
> > 
> >   [   10.175448] ACPI: ���� 0x000000007FFE19CD FFFFFFFF (v255 ������ �������� FFFFFFFF ���� FFFFFFFF)
> > 
> > So the address seems correct. It is the content of the FADT/FACP table
> > that is corrupted.
> > 
> > I wrote the following function in Xen:
> > 
> > static void check(void)
> > {
> >     unsigned long addr = 0x7ffe19cd;
> >     struct acpi_table_fadt *fadt;
> >     fadt = acpi_os_map_memory(addr, sizeof(*fadt));
> >     printk("DEBUG %s %d s=%s\n",__func__,__LINE__,fadt->header.signature);
> >     acpi_os_unmap_memory(fadt, sizeof(*fadt));
> > }
> > 
> > It prints the right table signature at the end of pvh_setup_acpi.
> > I also added a call at the top of xenmem_add_to_physmap_one, and the
> > signature is still correct. Then I added a call at the beginning of
> > __update_vcpu_system_time. Here is the surprise: from Xen point of view
> > the table never gets corrupted. Here are the logs:
> > 
> > [...]
> > (XEN) DEBUG fadt_check 1551 s=FACPt
> > (XEN) DEBUG fadt_check 1551 s=FACPt
> > (XEN) DEBUG fadt_check 1551 s=FACPt
> > (XEN) DEBUG fadt_check 1551 s=FACPt
> > (XEN) d0v0: upcall vector f3
> > [    0.000000] Linux version 6.1.19 (root@124de7fbba7f) (gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #1 SMP PREEMPT_3
> > [    0.000000] Command line: console=hvc0
> > [...]
> > [   10.371610] ACPI: Early table checksum verification disabled
> > [   10.373633] ACPI: RSDP 0x0000000040060F1E 000024 (v02 BOCHS )
> > [   10.375548] ACPI: RSDT 0x0000000040060F42 000034 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
> > [   10.378732] ACPI: APIC 0x0000000040060F76 00008A (v01 BOCHS  BXPC     00000001 BXPC 00000001)
> > [   10.384188] ACPI: ���� 0x000000007FFE19CD FFFFFFFF (v255 ������ �������� FFFFFFFF ���� FFFFFFFF)
> > [   10.385374] ACPI: Reserving APIC table memory at [mem 0x40060f76-0x40060fff]
> > [   10.385519] ACPI: Reserving ���� table memory at [mem 0x7ffe19cd-0x17ffe19cb]
> > [...]
> > (XEN) DEBUG fadt_check 1551 s=FACPt
> > (XEN) DEBUG fadt_check 1551 s=FACPt
> > (XEN) DEBUG fadt_check 1551 s=FACPt
> > (XEN) DEBUG fadt_check 1551 s=FACPt
> > 
> > 
> > So it looks like it is a problem with the mapping itself? Xen sees the
> > data correctly and Linux sees it corrupted?
> 
> It seems to me like the page is not correctly mapped, and so 1s are
> returned? (same behavior as a hole).  IOW: would seem to me like MMIO
> areas are not correctly handled by nested NPT? (I assume you are
> running this on AMD).
> 
> Does it make a difference if you try to boot with dom0=pvh,shadow?
> 
> A couple of wild ideas.  Maybe the nested virt support that you are
> using doesn't handle the UC bit in second stage page table entries?
> You could to remove this in p2m_type_to_flags() (see the
> p2m_mmio_direct case).
> 
> Another wild idea I have is that the emulated NPT code doesn't like
> having the bits 63:52 from the PTE set to anything different than 0,
> and hence only p2m_ram_rw works (p2m_mmio_direct is 5).

Many thanks to Xenia for figuring out the root cause of the bug. The
underlying memory region is already added as E820_RESERVED to the guest
(instead of E820_ACPI). When pvh_add_mem_range is called with E820_ACPI
as parameter for the interesting table, pvh_add_mem_range returns with
-EEXIST without doing anything.

The original fix by Xenia was to carve out the relevant subset of the
reserved region and mark it as E820_ACPI. Instead, I rewrote it as
changing the type of the entire region to E820_ACPI because it is
simpler and doesn't have to deal with the edge cases (partially
overlapping, overlapping 2 existing regions, etc.)

What do you think?


diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index e1043e40d2..6c1c73d853 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -241,6 +241,20 @@ static int __init pvh_add_mem_range(struct domain *d, uint64_t s, uint64_t e,
         if ( rs >= e )
             break;
 
+        if ( re >= e && rs <= s )
+        {
+            /*
+             * An existing overlapping memory range exists and it is
+             * marked as reserved. This happens on QEMU. Change the type
+             * to E820_ACPI.
+             */
+            if ( d->arch.e820[i].type == E820_RESERVED && type == E820_ACPI )
+            {
+                d->arch.e820[i].type = E820_ACPI;
+                break;
+            }
+        }
+
         if ( re > s )
             return -EEXIST;
     }
--8323329-1353024790-1684357126=:128889--

