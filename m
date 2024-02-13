Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 951AA8536AB
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 17:58:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680081.1057921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZw66-0005am-81; Tue, 13 Feb 2024 16:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680081.1057921; Tue, 13 Feb 2024 16:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZw66-0005Xt-4q; Tue, 13 Feb 2024 16:57:30 +0000
Received: by outflank-mailman (input) for mailman id 680081;
 Tue, 13 Feb 2024 16:57:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SLZZ=JW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rZw64-0005Xn-RK
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 16:57:29 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:240a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6433a8d-ca90-11ee-8a4d-1f161083a0e0;
 Tue, 13 Feb 2024 17:57:26 +0100 (CET)
Received: from BYAPR05CA0042.namprd05.prod.outlook.com (2603:10b6:a03:74::19)
 by DM6PR12MB4548.namprd12.prod.outlook.com (2603:10b6:5:2a1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Tue, 13 Feb
 2024 16:57:21 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:a03:74:cafe::34) by BYAPR05CA0042.outlook.office365.com
 (2603:10b6:a03:74::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Tue, 13 Feb 2024 16:57:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 16:57:20 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 10:57:18 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 10:57:18 -0600
Received: from [172.27.131.30] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 13 Feb 2024 10:57:16 -0600
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
X-Inumbo-ID: f6433a8d-ca90-11ee-8a4d-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EjikUuXkg8CEtizKiAHEG97sG4p+pQ/F5wIhzcFINQzn9t5PqQfM/Zkwi5xwN+cLcTLfHXpgEGm7n9FKpsxi99vd/1oDQ+ENg0atURzppSezVcFg0MrZrBtm1fZFiO2sFf6U4ZPcVshVEzKVoYTzFeBxVMvFHfNdoT9yYSim/nhVD7oPlXPYyTbhldjYv0zlJnZbCHlW3Y8l3xJZo3aMHgdNLAG4hfv60OUIupOfMKiCfLjx+MiI2aAJLMt/yAqOriZwcZCX8eXNlDkUaqJ+ROdVnF/uTRAxf1CIp5Miz6W3ogjQA/FH+muk7k8UDJRe74SBVJUQnxsrNzJYbQ3hDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZFUcy/BkWZSpm4tijbRMhFxw02Dw2CSWZd7dmO1ADQ=;
 b=OpEVc2WYKG7wVhX7YuxT8hPA2r9NBir/Gcf5hJiHwT+20Zl/X+EEyHXx3eRog9Sn7wtHx55KGEGZrdpMTVNEE6pZD3Gtbxe6ykLkaj05FfJ9y1GXJaLY3/EOFxprnZQD/yLsMSnfPF80aIEZQ4+aYDNyRF2Doize49jdZekDVGB55HLBacele6k0cNIMC7TmRZDHBmGpAgyTQYdW7fkXmBmzbYo9ZNQ9sZ2mNx9wGN7He/7sC1KIA/4tK4qp9tGZ1TJS2lvwoPkxneuuzRi0n0IC2/k1osAsC+zKpz4axALvJxkPYt4Aqc/Gia6f5f/1NIFNS63vH4xmB561sKNH+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZFUcy/BkWZSpm4tijbRMhFxw02Dw2CSWZd7dmO1ADQ=;
 b=o1/MS5zHrIHngsLygCAEBmyOTJQxVyxTv8kXjBxO2Z2609vCRLWH1RtRZ2CasFroFhdPXYECL+IrK7JNyPaa6EMuyf3PEJeMHs5hCftsbP+4aDD4Eit6tpKzLlRl6SweSIFkeNORRXOd+2uUILFbAiDsqUrmU3y+xkD+4vmP3K8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e5342d84-f527-4d50-81be-600b7aafbf4d@amd.com>
Date: Tue, 13 Feb 2024 11:57:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 01/14] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Paul Durrant <paul@xen.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
 <20240202213321.1920347-2-stewart.hildebrand@amd.com>
 <Zcsp15Aqve11Icjb@macbook>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <Zcsp15Aqve11Icjb@macbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|DM6PR12MB4548:EE_
X-MS-Office365-Filtering-Correlation-Id: ddcae1c9-9f10-42ae-5d26-08dc2cb4d7ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8d+jv+F0d6mM0IVw4/k/8XDY0uXi4+u5lwVlg08Mub7HRD4fKhzLZyQs/g+SaphmhkH6HF21omI6LqqXRFMiBE9fQm5mCaLLADENLfr4WeB87Bg1e7YD3fGjm9KggfxWLJXNAgNA71osF9Id6TpsImVWhI4d/Hju1fD6MQuIVRlUtQ4IEX4IrN7CVLqoGcEVtuG/PWp8zKVM1LuEvpJWeru7iCPPlR1aAx4WxU4n8511hV6Q8ovMhow4D2wd9Y7uqaTIxn2o/lfe6LsZIj+5wesT6u9EtGkSTz7Dek8pog4ctf+s8JaT6kBANn0kv4YVKOUiCodVV2sjImo02P4sVIJwu4boGd8TwvJt9C6yFteqdED6VDj4a52uikXBq0NNn3Xx+6Wj2XqFw1vrmYucv2KilhETBDiASNzGuw4Y8xuYjUChE0BCaGraTrfmnnLladBc0SzrTMJVawFjCjWLhE932ewE0v4XFp7vWsoGf+a9jqXZ6gBHxKATIcyf7d4tNnkTSZTtH68cLm5sjZnANriAkBVuKly68OfMrFWsBWYnmzZXuDKr3aU+cVOIFfT9Cf3iBdUwX0zRdzj7+9FGavxL2u12m1K8rL3n6JXUwx4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(82310400011)(36840700001)(46966006)(40470700004)(30864003)(44832011)(2906002)(8676002)(8936002)(7416002)(5660300002)(4326008)(336012)(426003)(2616005)(83380400001)(26005)(36756003)(82740400003)(81166007)(356005)(86362001)(31696002)(53546011)(54906003)(16576012)(70586007)(316002)(70206006)(6916009)(478600001)(31686004)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 16:57:20.2469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddcae1c9-9f10-42ae-5d26-08dc2cb4d7ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4548

On 2/13/24 03:35, Roger Pau Monné wrote:
> On Fri, Feb 02, 2024 at 04:33:05PM -0500, Stewart Hildebrand wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> Use the per-domain PCI read/write lock to protect the presence of the
>> pci device vpci field. This lock can be used (and in a few cases is used
>> right away) so that vpci removal can be performed while holding the lock
>> in write mode. Previously such removal could race with vpci_read for
>> example.
>>
>> When taking both d->pci_lock and pdev->vpci->lock, they should be
>> taken in this exact order: d->pci_lock then pdev->vpci->lock to avoid
>> possible deadlock situations.
>>
>> 1. Per-domain's pci_lock is used to protect pdev->vpci structure
>> from being removed.
>>
>> 2. Writing the command register and ROM BAR register may trigger
>> modify_bars to run, which in turn may access multiple pdevs while
>> checking for the existing BAR's overlap. The overlapping check, if
>> done under the read lock, requires vpci->lock to be acquired on both
>> devices being compared, which may produce a deadlock. It is not
>> possible to upgrade read lock to write lock in such a case. So, in
>> order to prevent the deadlock, use d->pci_lock in write mode instead.
>>
>> All other code, which doesn't lead to pdev->vpci destruction and does
>> not access multiple pdevs at the same time, can still use a
>> combination of the read lock and pdev->vpci->lock.
>>
>> 3. Drop const qualifier where the new rwlock is used and this is
>> appropriate.
>>
>> 4. Do not call process_pending_softirqs with any locks held. For that
>> unlock prior the call and re-acquire the locks after. After
>> re-acquiring the lock there is no need to check if pdev->vpci exists:
>>  - in apply_map because of the context it is called (no race condition
>>    possible)
>>  - for MSI/MSI-X debug code because it is called at the end of
>>    pdev->vpci access and no further access to pdev->vpci is made
>>
>> 5. Use d->pci_lock around for_each_pdev and pci_get_pdev()
>> while accessing pdevs in vpci code.
>>
>> 6. Switch vPCI functions to use per-domain pci_lock for ensuring pdevs
>> do not go away. The vPCI functions call several MSI-related functions
>> which already have existing non-vPCI callers. Change those MSI-related
>> functions to allow using either pcidevs_lock() or d->pci_lock for
>> ensuring pdevs do not go away. Holding d->pci_lock in read mode is
>> sufficient. Note that this pdev protection mechanism does not protect
>> other state or critical sections. These MSI-related functions already
>> have other race condition and state protection mechanims (e.g.
>> d->event_lock and msixtbl RCU), so we deduce that the use of the global
>> pcidevs_lock() is to ensure that pdevs do not go away. Existing non-vPCI
>> callers of these MSI-related functions will remain (ab)using the global
>> pcidevs_lock() to ensure pdevs do not go away so as to minimize changes
>> to existing non-vPCI call paths.
>>
>> 7. Introduce wrapper construct, pdev_list_is_read_locked(), for checking
>> that pdevs do not go away. The purpose of this wrapper is to aid
>> readability and document the intent of the pdev protection mechanism.
> 
> I would add that when possible, the existing callers haven't been
> switched to use the newly introduced per-domain pci_lock, and will
> continue to use the global pcidevs lock.  This is done to reduce the
> risk of the new locking scheme introducing regressions.  Those users
> will be adjusted in due time.

I'll use this wording, thanks

> 
> IIRC Jan had concerns about why some existing use-cases are not
> switched straight to use the new per-domain pci_lock in this patch.

I hope the clarified commit description addresses this

> 
>>
>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> Changes in v13:
>>  - hold off adding Roger's R-b tag even though it was provided on v12.2
>>  - use a wrapper construct to ease readability of odd-looking ASSERTs
>>  - new placement of ASSERT in __pci_enable_msix(), __pci_enable_msi(),
>>    and pci_enable_msi(). Rearrange/add pdev NULL check.
>>  - expand commit description with details about using either
>>    pcidevs_lock() or d->pci_lock
>>
>> Changes in v12.2:
>>  - drop Roger's R-b
>>  - drop both locks on error paths in vpci_msix_arch_print()
>>  - add another ASSERT in vpci_msix_arch_print(), to enforce the
>>    expectation both locks are held before calling vpci_msix_arch_print()
>>  - move pdev_done label in vpci_dump_msi()
>>  - update comments in vpci_dump_msi() to say locks (plural)
>>
>> Changes in v12.1:
>>  - use read_trylock() in vpci_msix_arch_print()
>>  - fixup in-code comments (revert double space, use DomXEN) in
>>    vpci_{read,write}()
>>  - minor updates in commit message
>>  - add Roger's R-b
>>
>> Changes in v12:
>>  - s/pci_rwlock/pci_lock/ in commit message
>>  - expand comment about scope of pci_lock in sched.h
>>  - in vpci_{read,write}, if hwdom is trying to access a device assigned
>>    to dom_xen, holding hwdom->pci_lock is sufficient (no need to hold
>>    dom_xen->pci_lock)
>>  - reintroduce ASSERT in vmx_pi_update_irte()
>>  - reintroduce ASSERT in __pci_enable_msi{x}()
>>  - delete note 6. in commit message about removing ASSERTs since we have
>>    reintroduced them
>>
>> Changes in v11:
>>  - Fixed commit message regarding possible spinlocks
>>  - Removed parameter from allocate_and_map_msi_pirq(), which was added
>>  in the prev version. Now we are taking pcidevs_lock in
>>  physdev_map_pirq()
>>  - Returned ASSERT to pci_enable_msi
>>  - Fixed case when we took read lock instead of write one
>>  - Fixed label indentation
>>
>> Changes in v10:
>>  - Moved printk pas locked area
>>  - Returned back ASSERTs
>>  - Added new parameter to allocate_and_map_msi_pirq() so it knows if
>>  it should take the global pci lock
>>  - Added comment about possible improvement in vpci_write
>>  - Changed ASSERT(rw_is_locked()) to rw_is_write_locked() in
>>    appropriate places
>>  - Renamed release_domain_locks() to release_domain_write_locks()
>>  - moved domain_done label in vpci_dump_msi() to correct place
>> Changes in v9:
>>  - extended locked region to protect vpci_remove_device and
>>    vpci_add_handlers() calls
>>  - vpci_write() takes lock in the write mode to protect
>>    potential call to modify_bars()
>>  - renamed lock releasing function
>>  - removed ASSERT()s from msi code
>>  - added trylock in vpci_dump_msi
>>
>> Changes in v8:
>>  - changed d->vpci_lock to d->pci_lock
>>  - introducing d->pci_lock in a separate patch
>>  - extended locked region in vpci_process_pending
>>  - removed pcidevs_lockis vpci_dump_msi()
>>  - removed some changes as they are not needed with
>>    the new locking scheme
>>  - added handling for hwdom && dom_xen case
>> ---
>>  xen/arch/x86/hvm/vmsi.c       | 31 +++++++++++++--------
>>  xen/arch/x86/hvm/vmx/vmx.c    |  2 +-
>>  xen/arch/x86/irq.c            |  8 +++---
>>  xen/arch/x86/msi.c            | 20 +++++++++-----
>>  xen/arch/x86/physdev.c        |  2 ++
>>  xen/drivers/passthrough/pci.c |  9 +++---
>>  xen/drivers/vpci/header.c     | 18 ++++++++++++
>>  xen/drivers/vpci/msi.c        | 30 +++++++++++++++++---
>>  xen/drivers/vpci/msix.c       | 52 ++++++++++++++++++++++++++++++-----
>>  xen/drivers/vpci/vpci.c       | 24 ++++++++++++++--
>>  xen/include/xen/sched.h       | 15 +++++++++-
>>  11 files changed, 170 insertions(+), 41 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
>> index 128f23636279..f29089178a59 100644
>> --- a/xen/arch/x86/hvm/vmsi.c
>> +++ b/xen/arch/x86/hvm/vmsi.c
>> @@ -468,7 +468,7 @@ int msixtbl_pt_register(struct domain *d, struct pirq *pirq, uint64_t gtable)
>>      struct msixtbl_entry *entry, *new_entry;
>>      int r = -EINVAL;
>>  
>> -    ASSERT(pcidevs_locked());
>> +    ASSERT(pdev_list_is_read_locked(d));
>>      ASSERT(rw_is_write_locked(&d->event_lock));
>>  
>>      if ( !msixtbl_initialised(d) )
>> @@ -538,7 +538,7 @@ void msixtbl_pt_unregister(struct domain *d, struct pirq *pirq)
>>      struct pci_dev *pdev;
>>      struct msixtbl_entry *entry;
>>  
>> -    ASSERT(pcidevs_locked());
>> +    ASSERT(pdev_list_is_read_locked(d));
>>      ASSERT(rw_is_write_locked(&d->event_lock));
>>  
>>      if ( !msixtbl_initialised(d) )
>> @@ -684,7 +684,7 @@ static int vpci_msi_update(const struct pci_dev *pdev, uint32_t data,
>>  {
>>      unsigned int i;
>>  
>> -    ASSERT(pcidevs_locked());
>> +    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
> 
> Any reason to not use the newly introduced helper here?  I know the
> pcidevs will never be locked here given the new lock usage, but still
> it would be less confusing if the new helper was used consistently.

Nope. Agreed, it would help readability, I'll switch to the helper. In
addition to vpci_msi_update(), I assume this comment also applies to the
remaining occurrences:

xen/arch/x86/hvm/vmsi.c:vpci_msi_arch_update()
xen/arch/x86/hvm/vmsi.c:vpci_msi_arch_enable()
xen/arch/x86/hvm/vmsi.c:vpci_msi_disable()
xen/arch/x86/hvm/vmsi.c:vpci_msix_arch_enable_entry()
xen/drivers/vpci/msix.c:msix_find()

But not:

xen/arch/x86/hvm/vmsi.c:vpci_msix_arch_print()

I'll add a suitable comment to this one exception.

> 
> Otherwise we need a comment here as to why the helper can't be used,
> in order to avoid confusion in the future.
> 
>>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>> index 9da91e0e6244..c3adec1aca3c 100644
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -462,7 +462,8 @@ struct domain
>>  #ifdef CONFIG_HAS_PCI
>>      struct list_head pdev_list;
>>      /*
>> -     * pci_lock protects access to pdev_list.
>> +     * pci_lock protects access to pdev_list. pci_lock also protects pdev->vpci
>> +     * structure from being removed.
>>       *
>>       * Any user *reading* from pdev_list, or from devices stored in pdev_list,
>>       * should hold either pcidevs_lock() or pci_lock in read mode. Optionally,
>> @@ -628,6 +629,18 @@ struct domain
>>      unsigned int cdf;
>>  };
>>  
>> +/*
>> + * Check for use in ASSERTs to ensure that:
>> + *   1. we can *read* d->pdev_list
>> + *   2. pdevs (belonging to this domain) do not go away
>> + *   3. pdevs (belonging to this domain) do not get assigned to other domains
> 
> I think you can just state that this check ensures there will be no
> changes to the entries in d->pdev_list, but not the contents of each
> entry.  No changes to d->pdev_list already ensures not devices can be
> deassigned or removed from the system, and obviously makes the list
> safe to iterate against.

OK, I'll simplify the comment

> 
> I would also drop the explicitly mention this is intended for ASSERT
> usage: there's nothing specific in the code that prevents it from
> being used in other places (albeit I think that's unlikely).
> 
>> + * This check is not suitable for protecting other state or critical regions.
>> + */
>> +#define pdev_list_is_read_locked(d) ({                           \
> 
> I would be tempted to drop at least the '_read_' part from the name,
> the name is getting a bit too long for my taste.
> 
>> +        struct domain *d_ = (d);                                 \
> 
> Why do you need this local domain variable?  Can't you use the d
> parameter directly?
> 
> Such assign will prevent using a const 'd' parameter, and 'd_' itself
> should be const IMO (iff we really need this).
> 
> Also sched.h is not the best place, can't you just place it in
> pci.h?

Yes, I'll move it to xen/include/xen/pci.h

