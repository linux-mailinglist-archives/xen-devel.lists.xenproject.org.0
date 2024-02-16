Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 080F3857F97
	for <lists+xen-devel@lfdr.de>; Fri, 16 Feb 2024 15:42:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682263.1061374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1razPB-0004Il-Vw; Fri, 16 Feb 2024 14:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682263.1061374; Fri, 16 Feb 2024 14:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1razPB-0004Gw-S3; Fri, 16 Feb 2024 14:41:33 +0000
Received: by outflank-mailman (input) for mailman id 682263;
 Fri, 16 Feb 2024 14:41:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=noRu=JZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1razPA-0004Gq-GV
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2024 14:41:32 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77feb3ba-ccd9-11ee-8a4f-1f161083a0e0;
 Fri, 16 Feb 2024 15:41:29 +0100 (CET)
Received: from PR1P264CA0156.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:346::12)
 by SJ1PR12MB6123.namprd12.prod.outlook.com (2603:10b6:a03:45a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.28; Fri, 16 Feb
 2024 14:41:24 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10a6:102:346:cafe::ff) by PR1P264CA0156.outlook.office365.com
 (2603:10a6:102:346::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20 via Frontend
 Transport; Fri, 16 Feb 2024 14:41:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 14:41:22 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 16 Feb
 2024 08:41:22 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 16 Feb
 2024 08:41:21 -0600
Received: from [172.27.131.30] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 16 Feb 2024 08:41:19 -0600
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
X-Inumbo-ID: 77feb3ba-ccd9-11ee-8a4f-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQg5BSsMemhu6tbcT2LSqb5IouiXToJerTbdsDAuDa1QAy//5qG30r5aHsUFX6vC0HGW2ao7MrWDOmsZ/wsttDG4IdOLvgFqLuzp9xlFjhIGCy0LIDFDvJ20PfQ+p0Ca4qIyIWcIkYAWOdCKskJT0+S6/ZTgwQONzBHzbR2/D/AUUCSUm5TiXzRTM4i7lDfHni0mqsn1Sh+iNBU/WRHp3RNK05GnV/v4qioW5NsTBTfjRjurf0xswxxhlT2i2PEbSRI/fMZoaPKxVu09XmFQxXtyShe5RzltXJbi4x2fm8kp4N/ZRaw0iXWsWfELu1nkZNfcE6Ba0+Hy5PKpm+/u7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVpZ5CiPG75/pzA0IJfoQQfFkGBTRxHvZPoM3ewu2mo=;
 b=NbeFmJCAjBpFHOWduPtL00iO1ptykzeMCGom34quX1e/pAQ7f3HREsKBFWUcbOZzvwOZSHwjwIhepkCllgCLElbYV/GV77GGf070EA0OzUnYJCDAsdPFOdWrAepgysfNYNCtkFQOaL1eZPweUlmYH7vN9SZhIxSROZGu7C2lfrI5Ml7PEnGmLmtG4yhx65Bx0OzrIctUewv/ARajsM620ehFh+PmbvYrrPEXSzsEn6ENwP8Jo+qvoMa8/YyZBfgFYfcRvry0p+XFl6qFRKV2oTq6hu3OZSPeHcg3JdzyxT1+K20Z9wFdfc/LYO2pOIv33lyAPDvVRFTT1btxaIdbnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVpZ5CiPG75/pzA0IJfoQQfFkGBTRxHvZPoM3ewu2mo=;
 b=x0LxswawzpPNGvS0/GcIp3LfkGYZOtxzk3QDQv3MLoWHigik6VL8P3h3UgA8AVzKMZhBAfcOlj8RAVFAB7V3D1IsUIGRvJROoBrPMkXppAdsDk55wogcXsJBJWed8K8YcLX+jz74Rf3DnDrxMFKBKMBWS6N0bgCxuTT6R6faCzM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f1e43851-8a3d-423d-b0da-4d881f8ecf91@amd.com>
Date: Fri, 16 Feb 2024 09:41:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13.1 01/14] vpci: use per-domain PCI lock to protect vpci
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
 <20240215203001.1816811-1-stewart.hildebrand@amd.com>
 <Zc9KuCeoOciUdqTN@macbook>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <Zc9KuCeoOciUdqTN@macbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|SJ1PR12MB6123:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a60692f-6888-404c-d922-08dc2efd5894
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SNMgxq8W/y2N44kHvPDevAvS1m+PqkT5woaqTx+DiSI7wt/ychznzz49Ky6gedoq5aZIQr1VDxO0FTfJsIId3d1kIWVsL86/pTxCJcRGZp/xAM2pJkqfbPP+ywv7apCVBPbFwNbbEnwWwaTwkSMXWMyaiUFZYfAiyxvE2sANKRVagB2eBNWZ0QTJMuVfVN1PEHAsX5u37xvILPiwJNRlOpx/VMUVuYGXCTKJBFJhNzAICfBtJ+wgS2lhr5Yrsj6jh2oRgJRzjEwvRGSZv3lO5ZKqlUKn7CQEvJ9MYswHyvjiQYqqfJxr0gsC5NimPhatHPG99BeVIabY5QGXcRqdabSs/a+xOGNHg8RHzHG7uyGTi/7JS6s8X8HIb/U1wFu4NjoUT4fwQ1wzGEvoS11mFzjnh18E5Uh74aYFdRHeQwoCS9VbOt4izAbpn8LwIO+WwuqpKRvjMWUHXg2eOJeDNYJMWlE8OpY9zZoEulcYyzrzy93PHdpddEMCLLL4a0RjyKTKz3j63u0HaJLXralwKTVrQm6ZqhUK0UZfvmpoMjW1cLtCT5iKsZN44nNp6Wbg31T8pCVHFbq9zhIM7dWqEd0+DrwR4rKbBDUvP/yd3Ei3F0RkNa0D1jnfr6SRNU3o7mfeQAeavsPm9+XhZO5pUSNrUqBtxenCYSRH3Sd/zZo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(186009)(82310400011)(451199024)(1800799012)(64100799003)(36860700004)(40470700004)(46966006)(31686004)(53546011)(41300700001)(2616005)(478600001)(70206006)(7416002)(4326008)(5660300002)(44832011)(8676002)(8936002)(2906002)(6916009)(70586007)(86362001)(16576012)(316002)(83380400001)(26005)(31696002)(336012)(36756003)(54906003)(81166007)(426003)(82740400003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 14:41:22.6896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a60692f-6888-404c-d922-08dc2efd5894
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6123

On 2/16/24 06:44, Roger Pau Monné wrote:
> On Thu, Feb 15, 2024 at 03:30:00PM -0500, Stewart Hildebrand wrote:
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
>> pcidevs_lock() is to ensure that pdevs do not go away.
>>
>> 7. Introduce wrapper construct, pdev_list_is_read_locked(), for checking
>> that pdevs do not go away. The purpose of this wrapper is to aid
>> readability and document the intent of the pdev protection mechanism.
>>
>> 8. When possible, the existing non-vPCI callers of these MSI-related
>> functions haven't been switched to use the newly introduced per-domain
>> pci_lock, and will continue to use the global pcidevs_lock(). This is
>> done to reduce the risk of the new locking scheme introducing
>> regressions. Those users will be adjusted in due time. One exception
>> is where the pcidevs_lock() in allocate_and_map_msi_pirq() is moved to
>> the caller, physdev_map_pirq(): this instance is switched to
>> read_lock(&d->pci_lock) right away.
>>
>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> A couple of questions and the pdev_list_is_read_locked() needs a small
> adjustment.
> 
>> @@ -895,6 +891,14 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>>  {
>>      unsigned int i;
>>  
>> +    /*
>> +     * Assert that d->pdev_list doesn't change. pdev_list_is_read_locked() is
>> +     * not suitable here because we may read_unlock(&pdev->domain->pci_lock)
>> +     * before returning.
> 
> I'm confused by this comment, as I don't see why it matters that the
> lock might be lock before returning.  We need to ensure the lock is
> taken at the time of the assert, and hence pdev_list_is_read_locked()
> can be used.

pdev_list_is_read_locked() currently would allow either pcidevs_lock()
or d->pci_lock. If vpci_msix_arch_print() is entered with only
pcidevs_lock() held, we may end up unlocking d->pci_lock when it is
not locked, which would be wrong.

Perhaps the comment could be clarified as:

    /*
     * Assert that d->pdev_list doesn't change. ASSERT_PDEV_LIST_IS_READ_LOCKED
     * is not suitable here because it may allow either pcidevs_lock() or
     * d->pci_lock to be held, but here we rely on d->pci_lock being held, not
     * pcidevs_lock().
     */

> 
>> +     */
>> +    ASSERT(rw_is_locked(&msix->pdev->domain->pci_lock));
>> +    ASSERT(spin_is_locked(&msix->pdev->vpci->lock));
>> +
>>      for ( i = 0; i < msix->max_entries; i++ )
>>      {
>>          const struct vpci_msix_entry *entry = &msix->entries[i];
>> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
>> index aabc5465a7d3..9f31cb84c9f3 100644
>> --- a/xen/include/xen/pci.h
>> +++ b/xen/include/xen/pci.h
>> @@ -171,6 +171,20 @@ void pcidevs_lock(void);
>>  void pcidevs_unlock(void);
>>  bool __must_check pcidevs_locked(void);
>>  
>> +#ifndef NDEBUG
>> +/*
>> + * Check for use in ASSERTs to ensure there will be no changes to the entries
>> + * in d->pdev_list (but not the contents of each entry).
>> + * This check is not suitable for protecting other state or critical regions.
>> + */
>> +#define pdev_list_is_read_locked(d) ({                             \
>> +        /* NB: d may be evaluated multiple times, or not at all */ \
>> +        pcidevs_locked() || (d && rw_is_locked(&d->pci_lock));     \
> 
> 'd' is missing parentheses here, should be (d).

Thanks for spotting. I'll fix in v13.2.

> 
>> +    })
>> +#else
>> +bool pdev_list_is_read_locked(const struct domain *d);
>> +#endif
> 
> FWIW, if this is only intended to be used with ASSERT, it might as
> well be an ASSERT itself:
> 
> ASSERT_PDEV_LIST_IS_READ_LOCKED(d) ...
> 
> Don't have a strong opinion, so I'm fine with how it's used, just
> noting it might be clearer if it was an ASSERT_ right away.

This would also have the benefit of not relying on dead code elimination
in the #else case. I'll be sending v13.2 anyway, I may as well make the
change.

