Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E666C3DA4
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 23:20:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513049.793486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pekKp-000217-Br; Tue, 21 Mar 2023 22:20:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513049.793486; Tue, 21 Mar 2023 22:20:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pekKp-0001y4-8g; Tue, 21 Mar 2023 22:20:03 +0000
Received: by outflank-mailman (input) for mailman id 513049;
 Tue, 21 Mar 2023 22:20:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rDWK=7N=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1pekKn-0001kx-Tb
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 22:20:01 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82b05856-c836-11ed-85db-49a42c6b2330;
 Tue, 21 Mar 2023 23:19:59 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 32LMJjqo095927
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 21 Mar 2023 18:19:50 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 32LMJidg095926;
 Tue, 21 Mar 2023 15:19:44 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 82b05856-c836-11ed-85db-49a42c6b2330
Date: Tue, 21 Mar 2023 15:19:43 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Neowutran <xen@neowutran.ovh>
Subject: Re: [BUG] x2apic broken with current AMD hardware
Message-ID: <ZBotf4lkIog9HfJF@mattapan.m5p.com>
References: <21436010-8212-7b09-a577-09d3f57156bf@suse.com>
 <ZAvGvokloPf+ltr9@mattapan.m5p.com>
 <f33c9b8a-f25d-caab-659d-d34ba21ebc25@suse.com>
 <ZBOSKo+sT/FtWY9C@mattapan.m5p.com>
 <e5b28dae-3699-cb0d-ab7e-42fdd42d3222@suse.com>
 <ZBSi2KfoQXo7hr6z@mattapan.m5p.com>
 <b2eaeacc-de5f-ebe9-a330-fbf9e20626b1@suse.com>
 <a2de5d87-ada8-46b9-090b-00dc43309362@suse.com>
 <ZBkwboNcQu6ooSRC@mattapan.m5p.com>
 <1c019d72-93d5-f820-7079-2a9c3fee8822@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c019d72-93d5-f820-7079-2a9c3fee8822@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Tue, Mar 21, 2023 at 08:13:15AM +0100, Jan Beulich wrote:
> On 21.03.2023 05:19, Elliott Mitchell wrote:
> 
> > The above appears about twice for each core, then I start seeing
> > "(XEN) CPU#: No irq handler for vector ?? (IRQ -2147483648, LAPIC)"
> > 
> > The core doesn't vary too much with this, but the vector varies some.
> > 
> > Upon looking "(XEN) Using APIC driver x2apic_cluster".  Unfortunately
> > I didn't try booting with x2apic_phys forced with this setting.
> 
> My guess is that this would also help. But the system should still work
> correctly in clustered mode. As a first step I guess debug key 'i', 'z',
> and 'M' output may provide some insight. But the request for a full log
> at maximum verbosity also remains (ideally with a debug hypervisor).

Needs a secure channel (PGP most likely) for everything, since there is
too much information in there.  Serial numbers and MAC addresses are a
potential source of attack (or faking returns).  Smaller segments can be
had more readily:

(XEN) SMBIOS 3.5 present.
(XEN) x2APIC mode is already enabled by BIOS.
(XEN) Using APIC driver x2apic_cluster
(XEN) ACPI: PM-Timer IO Port: 0x808 (32 bits)
(XEN) ACPI: v5 SLEEP INFO: control[0:0], status[0:0]
(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:804,1:0], pm1x_evt[1:800,1:0]
(XEN) ACPI: 32/64X FACS address mismatch in FADT - 785a3000/0000000000000000, using 32
(XEN) ACPI:             wakeup_vec[785a300c], vec_size[20]
(XEN) ACPI: Local APIC address 0xfee00000
(XEN) ACPI: IOAPIC (id[0x20] address[0xfec00000] gsi_base[0])
(XEN) IOAPIC[0]: apic_id 32, version 33, address 0xfec00000, GSI 0-23
(XEN) ACPI: IOAPIC (id[0x21] address[0xfec01000] gsi_base[24])
(XEN) IOAPIC[1]: apic_id 33, version 33, address 0xfec01000, GSI 24-55
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
(XEN) ACPI: HPET id: 0x######## base: 0xfed00000
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) IRQ limits: 56 GSI, 6600 MSI/MSI-X
(XEN) AMD-Vi: IOMMU Extended Features:
(XEN) - Peripheral Page Service Request
(XEN) - x2APIC
(XEN) - NX bit
(XEN) - Guest APIC Physical Processor Interrupt
(XEN) - Invalidate All Command
(XEN) - Guest APIC
(XEN) - Performance Counters
(XEN) - Host Address Translation Size: 0x2
(XEN) - Guest Address Translation Size: 0
(XEN) - Guest CR3 Root Table Level: 0x1
(XEN) - Maximum PASID: 0xf
(XEN) - SMI Filter Register: 0x1
(XEN) - SMI Filter Register Count: 0x1
(XEN) - Guest Virtual APIC Modes: 0x1
(XEN) - Dual PPR Log: 0x2
(XEN) - Dual Event Log: 0x2
(XEN) - Secure ATS
(XEN) - User / Supervisor Page Protection
(XEN) - Device Table Segmentation: 0x3
(XEN) - PPR Log Overflow Early Warning
(XEN) - PPR Automatic Response
(XEN) - Memory Access Routing and Control: 0x1
(XEN) - Block StopMark Message
(XEN) - Performance Optimization
(XEN) - MSI Capability MMIO Access
(XEN) - Guest I/O Protection
(XEN) - Enhanced PPR Handling
(XEN) - Invalidate IOTLB Type
(XEN) - VM Table Size: 0x2
(XEN) - Guest Access Bit Update Disable
(XEN) AMD-Vi: Disabled HAP memory map sharing with IOMMU
(XEN) AMD-Vi: IOMMU 0 Enabled.

I'm a bit concerned how all the reports so far are ASUS motherboards.
This could mean people getting the latest, greatest and using Xen tend
towards ASUS motherboards.  This could also mean ASUS's engineering team
did something to their latest round.  Both are possible.

Could well be the latest round from AMD include more pieces from their
server processors, which trigger x2apic_cluster as default.  Yet didn't
bring some extra portion(s) which are required by x2apic_cluster.


> > So x2apic_cluster is looking like a <ahem> on recent AMD processors.
> > 
> > 
> > I'm unsure this qualifies as "Tested-by".  Certainly it IS an
> > improvement, but the problem certainly isn't 100% solved.
> 
> There simply are multiple problems; one looks to be solved now.

I agree with that assessment.  Just I'm unsure whether this step is
enough to include "Tested-by".  I'm concerned there could be a single
deeper problem which solves everything at once.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



