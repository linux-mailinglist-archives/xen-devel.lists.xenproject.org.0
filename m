Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5AC82C514
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 18:56:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666949.1037921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOLkQ-000729-LS; Fri, 12 Jan 2024 17:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666949.1037921; Fri, 12 Jan 2024 17:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOLkQ-0006zv-HF; Fri, 12 Jan 2024 17:55:14 +0000
Received: by outflank-mailman (input) for mailman id 666949;
 Fri, 12 Jan 2024 17:55:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vfvq=IW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rOLkO-0006zp-7h
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 17:55:12 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2405::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b979e91f-b173-11ee-98f1-6d05b1d4d9a1;
 Fri, 12 Jan 2024 18:55:09 +0100 (CET)
Received: from MN2PR03CA0016.namprd03.prod.outlook.com (2603:10b6:208:23a::21)
 by DM4PR12MB6254.namprd12.prod.outlook.com (2603:10b6:8:a5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Fri, 12 Jan
 2024 17:55:05 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:208:23a:cafe::7b) by MN2PR03CA0016.outlook.office365.com
 (2603:10b6:208:23a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19 via Frontend
 Transport; Fri, 12 Jan 2024 17:55:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Fri, 12 Jan 2024 17:55:04 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 12 Jan
 2024 11:55:04 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 12 Jan
 2024 09:55:04 -0800
Received: from [172.23.76.218] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 12 Jan 2024 11:55:02 -0600
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
X-Inumbo-ID: b979e91f-b173-11ee-98f1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aftT+pufbJN18xFGmpn6GZG2wvkg914bQAVvvxiKujlx0JrAZGO7BPZO5jdrgt486MEd9Zq32CXRVJDJvkd5TpcwImZfvQN/r3EpVxKOzxlc4UxrRgUycC1jSNybLn0TUAnz2+LSwTPYiK0CKPVAr6R02MjnX92cc4NWSbU9loPDTcyjb6jnt+bFKXmwd1zG8Fz3wIEdYP/xp1/iL8KFtc6/66PVM18o94xgH6z/a9SS594Yuz01cCYwquOd5s6s+Y+M/IUZ7HSzATidEEqYTregUKmgaUTxjmGZM3EuqCzQQdgkund5Ggmw7NknSupSZ51IMTsUCHpCZ0y60NPP4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vg5eF91JrY0QGgVuEDVUEzxiWGv51OE1tc1RJ58P5c4=;
 b=gUJjOwR0n9t3un5rBrp54sn673wTBzyKv9rYwrZHrJBXL5CGqJa60z4tPO9DewpN8L85wmJtN20z2l83UoMXi5O0JOiSdnEZ0VD2g9K4QU683mJEuOKFFZk5pvjBya+AkrbpycCoy0KYjhk7/s5EsIhIJ+STopP24tiZVE/N8JIA6tQyQ2+7Iylh/o+XFXvUVj9ZyTa9namGb//ds5c+pegCJ9GsmqwerTQmn9tBU7+EB45Nk74aB905S+qw+/0Ym7ovVnKwqg3TgR7/cV1MQbx2AFLt+L3w8r2XmCe4a1UvQhJghW7AzhFRO1GVtpxwxjtA7jZqVyS0wTob6g+WKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vg5eF91JrY0QGgVuEDVUEzxiWGv51OE1tc1RJ58P5c4=;
 b=Xt3tUtLjh8i48xKNIkylZQd+lGD2jAgPbbg68XqAAJBqzzQpzcFMDrRUa+CBsDmRRkSyLz1XPUR+w52rPzIm1KIoncZLDz3APx/q/aE0GZXbhpRi2UT3Ehwprc5og1ohBpDpqe6q4ZdBWxBMy243T+8AlPBoQ1voKAWO/RbbXQM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <590a157a-b9d4-4d2d-8aff-6584da3045c3@amd.com>
Date: Fri, 12 Jan 2024 12:54:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 01/15] vpci: use per-domain PCI lock to protect vpci
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
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-2-stewart.hildebrand@amd.com>
 <ZaFDS7uZgW5l0eHG@macbook>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZaFDS7uZgW5l0eHG@macbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|DM4PR12MB6254:EE_
X-MS-Office365-Filtering-Correlation-Id: 881f2d72-2e8e-4982-32aa-08dc13979b73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ORylSchM7sX4RKC2fdFs3NCfwjSlVHKI1AM2xS5X19d7d8S7IZOuH4vzh5KN+q73QGfYpxP5JagaPfTQKXGvt7YoJ3WZi0Bq5jDd2z8S18tjBOYLMWO0PCdCs8b0DdIEhUaeCin3iKpGRy8OXMGE87G/pKkOfFIgD7t1VmWZKPN5glFRmPUgXw2RnrX9RXwAEQX+n/SN8O8HltFx1H1Npmw9CMX3kk2KB2CfYOE/Ra7NwX2CndNwuLhShnZIBWBooYLlJ6vEYgfKvxGQMWyAtdSmAgTKvHZUX60tee58TFojlrI9g3+lEaIztMvK3JmierXRBvQNSRDpB9GUzt2XoVUNaM3oBzjgLOS/nQIXLwYJkAs2g8q0Qm630/gazuBJ+/JTOojopoNso0VFGeeGM6Yq4hFlAH1OxZ0bwEAv9dTGl+6ca5fL4feQzl30LIkFrYfbrJv75QH0SVtZGhzfTfyoxKlV3kuKLribPHeGXKbQPgk2mhyTVYumCAL+t5F5GtrML+Hp8qMfyR13I2PTudtG22DXEmbfF6PRsYGBwP7KCkVUZ3m7mqiGFHKnel4+yWcUurr0gbXF8xjMokyQRzvPHUsa7Ml9mOi+mD0lKoVJLC25s0NiRHBE3T5k01zme76Us8jtKsL+Dy36C5kOoIvOMPPBV4M5znYGG7QI8AcbqHNY7Sgxx9FHp3MQwKn6MEsPGGhc38X7wjhp2UOQWMu+zcLFhoK9gJ6DdujPU/THHXGzvZVOe/Xa+lbLB39t2fDVs3+p9dEsNVwPPtEbt8n6ExWFEWHtpxUCuWq79uSoVe7/huONbzQYTSU+6KQ3wdHrW+j50KucTRBjEC0+GQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(39860400002)(396003)(230922051799003)(186009)(1800799012)(451199024)(82310400011)(64100799003)(46966006)(40470700004)(36840700001)(6666004)(83380400001)(6916009)(16576012)(316002)(47076005)(70206006)(54906003)(70586007)(53546011)(31696002)(81166007)(26005)(336012)(2616005)(426003)(44832011)(8936002)(8676002)(40460700003)(40480700001)(82740400003)(5660300002)(356005)(4326008)(36756003)(86362001)(31686004)(36860700001)(7416002)(30864003)(41300700001)(478600001)(2906002)(36900700001)(43740500002)(309714004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 17:55:04.8462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 881f2d72-2e8e-4982-32aa-08dc13979b73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6254

On 1/12/24 08:48, Roger Pau Monné wrote:
> On Tue, Jan 09, 2024 at 04:51:16PM -0500, Stewart Hildebrand wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> Use a previously introduced per-domain read/write lock to check
>> whether vpci is present, so we are sure there are no accesses to the
>> contents of the vpci struct if not.
> 
> Nit: isn't this sentence kind of awkward?  I would word it as:
> 
> "Use the per-domain PCI read/write lock to protect the presence of the
> pci device vpci field."

I'll use your suggested wording.

> 
>> This lock can be used (and in a
>> few cases is used right away) so that vpci removal can be performed
>> while holding the lock in write mode. Previously such removal could
>> race with vpci_read for example.
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
>> order to prevent the deadlock, use d->pci_lock instead.
> 
> ... use d->pci_lock in write mode instead.

Will fix

> 
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
>> 5. Use d->pci_lock around for_each_pdev and pci_get_pdev_by_domain
>> while accessing pdevs in vpci code.
>>
>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Just one code fix regarding the usage of read_lock (instead of the
> trylock version) in vpci_msix_arch_print().. With that and the
> comments adjusted:
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks! I'll reply to this with a v12.1 patch so as to not unnessecarily resend the whole series.

> 
>> ---
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
>>  xen/arch/x86/hvm/vmsi.c       | 22 +++++++--------
>>  xen/arch/x86/hvm/vmx/vmx.c    |  2 +-
>>  xen/arch/x86/irq.c            |  8 +++---
>>  xen/arch/x86/msi.c            | 14 +++++-----
>>  xen/arch/x86/physdev.c        |  2 ++
>>  xen/drivers/passthrough/pci.c |  9 +++---
>>  xen/drivers/vpci/header.c     | 18 ++++++++++++
>>  xen/drivers/vpci/msi.c        | 28 +++++++++++++++++--
>>  xen/drivers/vpci/msix.c       | 52 ++++++++++++++++++++++++++++++-----
>>  xen/drivers/vpci/vpci.c       | 28 ++++++++++++++++---
>>  xen/include/xen/sched.h       |  3 +-
>>  11 files changed, 144 insertions(+), 42 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
>> index 128f23636279..03caf91beefc 100644
>> --- a/xen/arch/x86/hvm/vmsi.c
>> +++ b/xen/arch/x86/hvm/vmsi.c
>> @@ -468,7 +468,7 @@ int msixtbl_pt_register(struct domain *d, struct pirq *pirq, uint64_t gtable)
>>      struct msixtbl_entry *entry, *new_entry;
>>      int r = -EINVAL;
>>  
>> -    ASSERT(pcidevs_locked());
>> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
>>      ASSERT(rw_is_write_locked(&d->event_lock));
>>  
>>      if ( !msixtbl_initialised(d) )
>> @@ -538,7 +538,7 @@ void msixtbl_pt_unregister(struct domain *d, struct pirq *pirq)
>>      struct pci_dev *pdev;
>>      struct msixtbl_entry *entry;
>>  
>> -    ASSERT(pcidevs_locked());
>> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
>>      ASSERT(rw_is_write_locked(&d->event_lock));
>>  
>>      if ( !msixtbl_initialised(d) )
>> @@ -684,7 +684,7 @@ static int vpci_msi_update(const struct pci_dev *pdev, uint32_t data,
>>  {
>>      unsigned int i;
>>  
>> -    ASSERT(pcidevs_locked());
>> +    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
>>  
>>      if ( (address & MSI_ADDR_BASE_MASK) != MSI_ADDR_HEADER )
>>      {
>> @@ -725,8 +725,8 @@ void vpci_msi_arch_update(struct vpci_msi *msi, const struct pci_dev *pdev)
>>      int rc;
>>  
>>      ASSERT(msi->arch.pirq != INVALID_PIRQ);
>> +    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
>>  
>> -    pcidevs_lock();
>>      for ( i = 0; i < msi->vectors && msi->arch.bound; i++ )
>>      {
>>          struct xen_domctl_bind_pt_irq unbind = {
>> @@ -745,7 +745,6 @@ void vpci_msi_arch_update(struct vpci_msi *msi, const struct pci_dev *pdev)
>>  
>>      msi->arch.bound = !vpci_msi_update(pdev, msi->data, msi->address,
>>                                         msi->vectors, msi->arch.pirq, msi->mask);
>> -    pcidevs_unlock();
>>  }
>>  
>>  static int vpci_msi_enable(const struct pci_dev *pdev, unsigned int nr,
>> @@ -778,15 +777,14 @@ int vpci_msi_arch_enable(struct vpci_msi *msi, const struct pci_dev *pdev,
>>      int rc;
>>  
>>      ASSERT(msi->arch.pirq == INVALID_PIRQ);
>> +    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
>>      rc = vpci_msi_enable(pdev, vectors, 0);
>>      if ( rc < 0 )
>>          return rc;
>>      msi->arch.pirq = rc;
>>  
>> -    pcidevs_lock();
>>      msi->arch.bound = !vpci_msi_update(pdev, msi->data, msi->address, vectors,
>>                                         msi->arch.pirq, msi->mask);
>> -    pcidevs_unlock();
>>  
>>      return 0;
>>  }
>> @@ -797,8 +795,8 @@ static void vpci_msi_disable(const struct pci_dev *pdev, int pirq,
>>      unsigned int i;
>>  
>>      ASSERT(pirq != INVALID_PIRQ);
>> +    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
>>  
>> -    pcidevs_lock();
>>      for ( i = 0; i < nr && bound; i++ )
>>      {
>>          struct xen_domctl_bind_pt_irq bind = {
>> @@ -814,7 +812,6 @@ static void vpci_msi_disable(const struct pci_dev *pdev, int pirq,
>>      write_lock(&pdev->domain->event_lock);
>>      unmap_domain_pirq(pdev->domain, pirq);
>>      write_unlock(&pdev->domain->event_lock);
>> -    pcidevs_unlock();
>>  }
>>  
>>  void vpci_msi_arch_disable(struct vpci_msi *msi, const struct pci_dev *pdev)
>> @@ -854,6 +851,7 @@ int vpci_msix_arch_enable_entry(struct vpci_msix_entry *entry,
>>      int rc;
>>  
>>      ASSERT(entry->arch.pirq == INVALID_PIRQ);
>> +    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
>>      rc = vpci_msi_enable(pdev, vmsix_entry_nr(pdev->vpci->msix, entry),
>>                           table_base);
>>      if ( rc < 0 )
>> @@ -861,7 +859,6 @@ int vpci_msix_arch_enable_entry(struct vpci_msix_entry *entry,
>>  
>>      entry->arch.pirq = rc;
>>  
>> -    pcidevs_lock();
>>      rc = vpci_msi_update(pdev, entry->data, entry->addr, 1, entry->arch.pirq,
>>                           entry->masked);
>>      if ( rc )
>> @@ -869,7 +866,6 @@ int vpci_msix_arch_enable_entry(struct vpci_msix_entry *entry,
>>          vpci_msi_disable(pdev, entry->arch.pirq, 1, false);
>>          entry->arch.pirq = INVALID_PIRQ;
>>      }
>> -    pcidevs_unlock();
>>  
>>      return rc;
>>  }
>> @@ -895,6 +891,8 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>>  {
>>      unsigned int i;
>>  
>> +    ASSERT(rw_is_locked(&msix->pdev->domain->pci_lock));
>> +
>>      for ( i = 0; i < msix->max_entries; i++ )
>>      {
>>          const struct vpci_msix_entry *entry = &msix->entries[i];
>> @@ -913,7 +911,9 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>>              struct pci_dev *pdev = msix->pdev;
>>  
>>              spin_unlock(&msix->pdev->vpci->lock);
>> +            read_unlock(&pdev->domain->pci_lock);
>>              process_pending_softirqs();
>> +            read_lock(&pdev->domain->pci_lock);
> 
> This should be a trylock, like it's on the caller (vpci_dump_msi()).

I'll replace the read_lock with:

            if ( !read_trylock(&pdev->domain->pci_lock) )
                return -EBUSY;

> 
>>              /* NB: we assume that pdev cannot go away for an alive domain. */
>>              if ( !pdev->vpci || !spin_trylock(&pdev->vpci->lock) )
>>                  return -EBUSY;
>> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
>> index 8ff675883c2b..890faef48b82 100644
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -413,7 +413,7 @@ static int cf_check vmx_pi_update_irte(const struct vcpu *v,
>>  
>>      spin_unlock_irq(&desc->lock);
>>  
>> -    ASSERT(pcidevs_locked());
>> +    ASSERT(pcidevs_locked() || rw_is_locked(&msi_desc->dev->domain->pci_lock));
>>  
>>      return iommu_update_ire_from_msi(msi_desc, &msi_desc->msg);
>>  
>> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
>> index 50e49e1a4b6f..4d89d9af99fe 100644
>> --- a/xen/arch/x86/irq.c
>> +++ b/xen/arch/x86/irq.c
>> @@ -2166,7 +2166,7 @@ int map_domain_pirq(
>>          struct pci_dev *pdev;
>>          unsigned int nr = 0;
>>  
>> -        ASSERT(pcidevs_locked());
>> +        ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
>>  
>>          ret = -ENODEV;
>>          if ( !cpu_has_apic )
>> @@ -2323,7 +2323,7 @@ int unmap_domain_pirq(struct domain *d, int pirq)
>>      if ( (pirq < 0) || (pirq >= d->nr_pirqs) )
>>          return -EINVAL;
>>  
>> -    ASSERT(pcidevs_locked());
>> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
>>      ASSERT(rw_is_write_locked(&d->event_lock));
>>  
>>      info = pirq_info(d, pirq);
>> @@ -2888,6 +2888,8 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
>>  {
>>      int irq, pirq, ret;
>>  
>> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
>> +
>>      switch ( type )
>>      {
>>      case MAP_PIRQ_TYPE_MSI:
>> @@ -2917,7 +2919,6 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
>>  
>>      msi->irq = irq;
>>  
>> -    pcidevs_lock();
>>      /* Verify or get pirq. */
>>      write_lock(&d->event_lock);
>>      pirq = allocate_pirq(d, index, *pirq_p, irq, type, &msi->entry_nr);
>> @@ -2933,7 +2934,6 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
>>  
>>   done:
>>      write_unlock(&d->event_lock);
>> -    pcidevs_unlock();
>>      if ( ret )
>>      {
>>          switch ( type )
>> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
>> index 335c0868a225..7da2affa2e82 100644
>> --- a/xen/arch/x86/msi.c
>> +++ b/xen/arch/x86/msi.c
>> @@ -602,7 +602,7 @@ static int msi_capability_init(struct pci_dev *dev,
>>      unsigned int i, mpos;
>>      uint16_t control;
>>  
>> -    ASSERT(pcidevs_locked());
>> +    ASSERT(pcidevs_locked() || rw_is_locked(&dev->domain->pci_lock));
>>      pos = pci_find_cap_offset(dev->sbdf, PCI_CAP_ID_MSI);
>>      if ( !pos )
>>          return -ENODEV;
>> @@ -771,7 +771,7 @@ static int msix_capability_init(struct pci_dev *dev,
>>      if ( !pos )
>>          return -ENODEV;
>>  
>> -    ASSERT(pcidevs_locked());
>> +    ASSERT(pcidevs_locked() || rw_is_locked(&dev->domain->pci_lock));
>>  
>>      control = pci_conf_read16(dev->sbdf, msix_control_reg(pos));
>>      /*
>> @@ -988,11 +988,11 @@ static int __pci_enable_msi(struct pci_dev *pdev, struct msi_info *msi,
>>  {
>>      struct msi_desc *old_desc;
>>  
>> -    ASSERT(pcidevs_locked());
>> -
>>      if ( !pdev )
>>          return -ENODEV;
>>  
>> +    ASSERT(pcidevs_locked() || rw_is_locked(&pdev->domain->pci_lock));
>> +
>>      old_desc = find_msi_entry(pdev, msi->irq, PCI_CAP_ID_MSI);
>>      if ( old_desc )
>>      {
>> @@ -1043,11 +1043,11 @@ static int __pci_enable_msix(struct pci_dev *pdev, struct msi_info *msi,
>>  {
>>      struct msi_desc *old_desc;
>>  
>> -    ASSERT(pcidevs_locked());
>> -
>>      if ( !pdev || !pdev->msix )
>>          return -ENODEV;
>>  
>> +    ASSERT(pcidevs_locked() || rw_is_locked(&pdev->domain->pci_lock));
>> +
>>      if ( msi->entry_nr >= pdev->msix->nr_entries )
>>          return -EINVAL;
>>  
>> @@ -1154,7 +1154,7 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool off)
>>  int pci_enable_msi(struct pci_dev *pdev, struct msi_info *msi,
>>                     struct msi_desc **desc)
>>  {
>> -    ASSERT(pcidevs_locked());
>> +    ASSERT(pcidevs_locked() || rw_is_locked(&pdev->domain->pci_lock));
>>  
>>      if ( !use_msi )
>>          return -EPERM;
>> diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
>> index 47c4da0af7e1..369c9e788c1c 100644
>> --- a/xen/arch/x86/physdev.c
>> +++ b/xen/arch/x86/physdev.c
>> @@ -123,7 +123,9 @@ int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
>>  
>>      case MAP_PIRQ_TYPE_MSI:
>>      case MAP_PIRQ_TYPE_MULTI_MSI:
>> +        pcidevs_lock();
>>          ret = allocate_and_map_msi_pirq(d, *index, pirq_p, type, msi);
>> +        pcidevs_unlock();
>>          break;
>>  
>>      default:
>> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
>> index 1439d1ef2b26..3a973324bca1 100644
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -750,7 +750,6 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>          pdev->domain = hardware_domain;
>>          write_lock(&hardware_domain->pci_lock);
>>          list_add(&pdev->domain_list, &hardware_domain->pdev_list);
>> -        write_unlock(&hardware_domain->pci_lock);
>>  
>>          /*
>>           * For devices not discovered by Xen during boot, add vPCI handlers
>> @@ -759,18 +758,18 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>          ret = vpci_add_handlers(pdev);
>>          if ( ret )
>>          {
>> -            printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
>> -            write_lock(&hardware_domain->pci_lock);
>>              list_del(&pdev->domain_list);
>>              write_unlock(&hardware_domain->pci_lock);
>>              pdev->domain = NULL;
>> +            printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
>>              goto out;
>>          }
>> +        write_unlock(&hardware_domain->pci_lock);
>>          ret = iommu_add_device(pdev);
>>          if ( ret )
>>          {
>> -            vpci_remove_device(pdev);
>>              write_lock(&hardware_domain->pci_lock);
>> +            vpci_remove_device(pdev);
>>              list_del(&pdev->domain_list);
>>              write_unlock(&hardware_domain->pci_lock);
>>              pdev->domain = NULL;
>> @@ -1146,7 +1145,9 @@ static void __hwdom_init setup_one_hwdom_device(const struct setup_hwdom *ctxt,
>>      } while ( devfn != pdev->devfn &&
>>                PCI_SLOT(devfn) == PCI_SLOT(pdev->devfn) );
>>  
>> +    write_lock(&ctxt->d->pci_lock);
>>      err = vpci_add_handlers(pdev);
>> +    write_unlock(&ctxt->d->pci_lock);
>>      if ( err )
>>          printk(XENLOG_ERR "setup of vPCI for d%d failed: %d\n",
>>                 ctxt->d->domain_id, err);
>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>> index 58195549d50a..8f5850b8cf6d 100644
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -173,6 +173,7 @@ bool vpci_process_pending(struct vcpu *v)
>>          if ( rc == -ERESTART )
>>              return true;
>>  
>> +        write_lock(&v->domain->pci_lock);
>>          spin_lock(&v->vpci.pdev->vpci->lock);
>>          /* Disable memory decoding unconditionally on failure. */
>>          modify_decoding(v->vpci.pdev,
>> @@ -191,6 +192,7 @@ bool vpci_process_pending(struct vcpu *v)
>>               * failure.
>>               */
>>              vpci_remove_device(v->vpci.pdev);
>> +        write_unlock(&v->domain->pci_lock);
>>      }
>>  
>>      return false;
>> @@ -202,8 +204,20 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>>      struct map_data data = { .d = d, .map = true };
>>      int rc;
>>  
>> +    ASSERT(rw_is_write_locked(&d->pci_lock));
>> +
>>      while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) == -ERESTART )
>> +    {
>> +        /*
>> +         * It's safe to drop and reacquire the lock in this context
>> +         * without risking pdev disappearing because devices cannot be
>> +         * removed until the initial domain has been started.
>> +         */
>> +        write_unlock(&d->pci_lock);
>>          process_pending_softirqs();
>> +        write_lock(&d->pci_lock);
> 
> Hm, I should have noticed before, but we already call
> process_pending_softirqs() with the pdev->vpci->lock held here, so it
> would make sense to drop it also.

I don't quite understand this, maybe I'm missing something. I don't see where we acquire pdev->vpci->lock before calling process_pending_softirqs()?

Also, I tried adding

    ASSERT(!spin_is_locked(&pdev->vpci->lock));

both here in apply_map() and in vpci_process_pending(), and they haven't triggered in either dom0 or domU test cases, tested on both arm and x86.

> 
> Fix should be in a separate patch.

Agreed, I'll send v12.1 addressing the other feedback, and we can address this separately.

> 
>> +    }
>> +
>>      rangeset_destroy(mem);
>>      if ( !rc )
>>          modify_decoding(pdev, cmd, false);
>> @@ -244,6 +258,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>      unsigned int i;
>>      int rc;
>>  
>> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>> +
>>      if ( !mem )
>>          return -ENOMEM;
>>  
>> @@ -524,6 +540,8 @@ static int cf_check init_header(struct pci_dev *pdev)
>>      int rc;
>>      bool mask_cap_list = false;
>>  
>> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>> +
>>      switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
>>      {
>>      case PCI_HEADER_TYPE_NORMAL:
>> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
>> index a253ccbd7db7..6ff71e5f9ab7 100644
>> --- a/xen/drivers/vpci/msi.c
>> +++ b/xen/drivers/vpci/msi.c
>> @@ -263,7 +263,7 @@ REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
>>  
>>  void vpci_dump_msi(void)
>>  {
>> -    const struct domain *d;
>> +    struct domain *d;
>>  
>>      rcu_read_lock(&domlist_read_lock);
>>      for_each_domain ( d )
>> @@ -275,6 +275,9 @@ void vpci_dump_msi(void)
>>  
>>          printk("vPCI MSI/MSI-X d%d\n", d->domain_id);
>>  
>> +        if ( !read_trylock(&d->pci_lock) )
>> +            continue;
>> +
>>          for_each_pdev ( d, pdev )
>>          {
>>              const struct vpci_msi *msi;
>> @@ -316,14 +319,33 @@ void vpci_dump_msi(void)
>>                       * holding the lock.
>>                       */
>>                      printk("unable to print all MSI-X entries: %d\n", rc);
>> -                    process_pending_softirqs();
>> -                    continue;
>> +                    goto pdev_done;
>>                  }
>>              }
>>  
>>              spin_unlock(&pdev->vpci->lock);
>> +        pdev_done:
>> +            /*
>> +             * Unlock lock to process pending softirqs. This is
>> +             * potentially unsafe, as d->pdev_list can be changed in
>> +             * meantime.
>> +             */
>> +            read_unlock(&d->pci_lock);
>>              process_pending_softirqs();
>> +            if ( !read_trylock(&d->pci_lock) )
>> +            {
>> +                printk("unable to access other devices for the domain\n");
>> +                goto domain_done;
>> +            }
>>          }
>> +        read_unlock(&d->pci_lock);
>> +    domain_done:
>> +        /*
>> +         * We need this label at the end of the loop, but some
>> +         * compilers might not be happy about label at the end of the
>> +         * compound statement so we adding an empty statement here.
>> +         */
>> +        ;
>>      }
>>      rcu_read_unlock(&domlist_read_lock);
>>  }
>> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
>> index d1126a417da9..b6abab47efdd 100644
>> --- a/xen/drivers/vpci/msix.c
>> +++ b/xen/drivers/vpci/msix.c
>> @@ -147,6 +147,8 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
>>  {
>>      struct vpci_msix *msix;
>>  
>> +    ASSERT(rw_is_locked(&d->pci_lock));
>> +
>>      list_for_each_entry ( msix, &d->arch.hvm.msix_tables, next )
>>      {
>>          const struct vpci_bar *bars = msix->pdev->vpci->header.bars;
>> @@ -163,7 +165,13 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
>>  
>>  static int cf_check msix_accept(struct vcpu *v, unsigned long addr)
>>  {
>> -    return !!msix_find(v->domain, addr);
>> +    int rc;
>> +
>> +    read_lock(&v->domain->pci_lock);
>> +    rc = !!msix_find(v->domain, addr);
>> +    read_unlock(&v->domain->pci_lock);
>> +
>> +    return rc;
>>  }
>>  
>>  static bool access_allowed(const struct pci_dev *pdev, unsigned long addr,
>> @@ -358,21 +366,35 @@ static int adjacent_read(const struct domain *d, const struct vpci_msix *msix,
>>  static int cf_check msix_read(
>>      struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
>>  {
>> -    const struct domain *d = v->domain;
>> -    struct vpci_msix *msix = msix_find(d, addr);
>> +    struct domain *d = v->domain;
>> +    struct vpci_msix *msix;
>>      const struct vpci_msix_entry *entry;
>>      unsigned int offset;
>>  
>>      *data = ~0UL;
>>  
>> +    read_lock(&d->pci_lock);
>> +
>> +    msix = msix_find(d, addr);
>>      if ( !msix )
>> +    {
>> +        read_unlock(&d->pci_lock);
>>          return X86EMUL_RETRY;
>> +    }
>>  
>>      if ( adjacent_handle(msix, addr) )
>> -        return adjacent_read(d, msix, addr, len, data);
>> +    {
>> +        int rc = adjacent_read(d, msix, addr, len, data);
>> +
>> +        read_unlock(&d->pci_lock);
>> +        return rc;
>> +    }
>>  
>>      if ( !access_allowed(msix->pdev, addr, len) )
>> +    {
>> +        read_unlock(&d->pci_lock);
>>          return X86EMUL_OKAY;
>> +    }
>>  
>>      spin_lock(&msix->pdev->vpci->lock);
>>      entry = get_entry(msix, addr);
>> @@ -404,6 +426,7 @@ static int cf_check msix_read(
>>          break;
>>      }
>>      spin_unlock(&msix->pdev->vpci->lock);
>> +    read_unlock(&d->pci_lock);
>>  
>>      return X86EMUL_OKAY;
>>  }
>> @@ -491,19 +514,33 @@ static int adjacent_write(const struct domain *d, const struct vpci_msix *msix,
>>  static int cf_check msix_write(
>>      struct vcpu *v, unsigned long addr, unsigned int len, unsigned long data)
>>  {
>> -    const struct domain *d = v->domain;
>> -    struct vpci_msix *msix = msix_find(d, addr);
>> +    struct domain *d = v->domain;
>> +    struct vpci_msix *msix;
>>      struct vpci_msix_entry *entry;
>>      unsigned int offset;
>>  
>> +    read_lock(&d->pci_lock);
>> +
>> +    msix = msix_find(d, addr);
>>      if ( !msix )
>> +    {
>> +        read_unlock(&d->pci_lock);
>>          return X86EMUL_RETRY;
>> +    }
>>  
>>      if ( adjacent_handle(msix, addr) )
>> -        return adjacent_write(d, msix, addr, len, data);
>> +    {
>> +        int rc = adjacent_write(d, msix, addr, len, data);
>> +
>> +        read_unlock(&d->pci_lock);
>> +        return rc;
>> +    }
>>  
>>      if ( !access_allowed(msix->pdev, addr, len) )
>> +    {
>> +        read_unlock(&d->pci_lock);
>>          return X86EMUL_OKAY;
>> +    }
>>  
>>      spin_lock(&msix->pdev->vpci->lock);
>>      entry = get_entry(msix, addr);
>> @@ -579,6 +616,7 @@ static int cf_check msix_write(
>>          break;
>>      }
>>      spin_unlock(&msix->pdev->vpci->lock);
>> +    read_unlock(&d->pci_lock);
>>  
>>      return X86EMUL_OKAY;
>>  }
>> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
>> index 72ef277c4f8e..a1a004460491 100644
>> --- a/xen/drivers/vpci/vpci.c
>> +++ b/xen/drivers/vpci/vpci.c
>> @@ -42,6 +42,8 @@ extern vpci_register_init_t *const __end_vpci_array[];
>>  
>>  void vpci_remove_device(struct pci_dev *pdev)
>>  {
>> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>> +
>>      if ( !has_vpci(pdev->domain) || !pdev->vpci )
>>          return;
>>  
>> @@ -77,6 +79,8 @@ int vpci_add_handlers(struct pci_dev *pdev)
>>      const unsigned long *ro_map;
>>      int rc = 0;
>>  
>> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>> +
>>      if ( !has_vpci(pdev->domain) )
>>          return 0;
>>  
>> @@ -361,7 +365,7 @@ static uint32_t merge_result(uint32_t data, uint32_t new, unsigned int size,
>>  
>>  uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>>  {
>> -    const struct domain *d = current->domain;
>> +    struct domain *d = current->domain;
>>      const struct pci_dev *pdev;
>>      const struct vpci_register *r;
>>      unsigned int data_offset = 0;
>> @@ -375,13 +379,19 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>>  
>>      /*
>>       * Find the PCI dev matching the address, which for hwdom also requires
>> -     * consulting DomXEN.  Passthrough everything that's not trapped.
>> +     * consulting DomXEN. Passthrough everything that's not trapped.
> 
> The double space in the comment above was intentional.

Will fix

> 
>> +     * If this is hwdom and the device is assigned to dom_xen, acquiring hwdom's
> 
> For consistency with the above sentence, could you please use DomXEN
> here?

Yes

> 
>> +     * pci_lock is sufficient.
>>       */
>> +    read_lock(&d->pci_lock);
>>      pdev = pci_get_pdev(d, sbdf);
>>      if ( !pdev && is_hardware_domain(d) )
>>          pdev = pci_get_pdev(dom_xen, sbdf);
>>      if ( !pdev || !pdev->vpci )
>> +    {
>> +        read_unlock(&d->pci_lock);
>>          return vpci_read_hw(sbdf, reg, size);
>> +    }
>>  
>>      spin_lock(&pdev->vpci->lock);
>>  
>> @@ -428,6 +438,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>>          ASSERT(data_offset < size);
>>      }
>>      spin_unlock(&pdev->vpci->lock);
>> +    read_unlock(&d->pci_lock);
>>  
>>      if ( data_offset < size )
>>      {
>> @@ -470,7 +481,7 @@ static void vpci_write_helper(const struct pci_dev *pdev,
>>  void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>>                  uint32_t data)
>>  {
>> -    const struct domain *d = current->domain;
>> +    struct domain *d = current->domain;
>>      const struct pci_dev *pdev;
>>      const struct vpci_register *r;
>>      unsigned int data_offset = 0;
>> @@ -483,8 +494,14 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>>  
>>      /*
>>       * Find the PCI dev matching the address, which for hwdom also requires
>> -     * consulting DomXEN.  Passthrough everything that's not trapped.
>> +     * consulting DomXEN. Passthrough everything that's not trapped.
> 
> Same here re the double space removal and the usage of dom_xen below.

Will fix

> 
> Thanks, Roger.

