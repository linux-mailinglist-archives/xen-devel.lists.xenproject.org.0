Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF23FA556DB
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 20:37:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903984.1311907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqH1Z-0003Ki-Ba; Thu, 06 Mar 2025 19:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903984.1311907; Thu, 06 Mar 2025 19:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqH1Z-0003Hc-7T; Thu, 06 Mar 2025 19:36:53 +0000
Received: by outflank-mailman (input) for mailman id 903984;
 Thu, 06 Mar 2025 19:36:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0m9W=VZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tqH1Y-0003HW-0I
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 19:36:52 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20603.outbound.protection.outlook.com
 [2a01:111:f403:2413::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57cb7291-fac2-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 20:36:48 +0100 (CET)
Received: from DS2PEPF00004553.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::51b) by CH3PR12MB7644.namprd12.prod.outlook.com
 (2603:10b6:610:14f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 19:36:44 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:2c:400:0:1007:0:9) by DS2PEPF00004553.outlook.office365.com
 (2603:10b6:f:fc00::51b) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.11 via Frontend Transport; Thu,
 6 Mar 2025 19:36:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 19:36:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 13:36:43 -0600
Received: from [172.19.192.96] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 13:36:41 -0600
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
X-Inumbo-ID: 57cb7291-fac2-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cH0haS5nMSDrJUkETLgvjaa6e1hBBnOpviXfQGZDHYc9phUBBzUfJMKSaFv8zrtVcCM3tZla1/8g5aAm94gE8eMw+zshYaTV4Ne9Z8wyQ8W1jKqABqhiDNFhDLqSa5e3LXgUEAEPEISGMZ324mQBPjSf3iqC/GzdYy8bNxN4Mw4UYsQfK+MzIhStpqyJmCpHNk/8LyigFEbiIWTzyarBj3lbFbaBZ6M6gRIgT9B87+uT83FjgX63RZa8Dw3bxLA5fGEvAW7Jh7xbvptPGxUQqLvU5886ayayifRX+64AP68HxFSjooa9Q05WlCe4upx7cTCUr3MCN6Lz18Rbt4cpGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQUcUdJ+tVCA1olgArmn/HGY8r7yEwijoPTA2B6vRtM=;
 b=F64yL1GfOcRVoa70HtEqRXo+miSGn7O37LcTswzuhA+BzARwFhUQluERylDSFdPOTmpn5yZsUZYQAiz1w/Mse78Wm1YosqTQARsBrGJuKxG86Td8G4y4EXBV840n+gl1Rm65bjZ3pgSHM742RdsQPCoQSNaRYGjXfTCDw4MbjL7i5HNy9VSJLSx96iSrNe1yHeC5V4ZUdwg5vfKzgojBJFfMd7Ow28TongQYz6ppV/pv2T9ZmcbfrQwj3lmvm4Mh4bs3bfusTXERcid0MdDZxDIK6vO3qYPRu0Ei4nRim0X37KnIxgZx4F5G8tEsDsYgbZpDgIXn9lN9+kiOo5JhPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQUcUdJ+tVCA1olgArmn/HGY8r7yEwijoPTA2B6vRtM=;
 b=XZqliYxLhe2hxNpp6lfPOryH3cljMr7HxKKsBX1VufqJLIAMI5VaY0L0jrholbWpcSdRNJqW78PvSOlVqq/1gdyJw5R5W1dsGLfP+aYpJ/hm9S2RdpsSEKJjenEXdYqyf3CKrTPQvxKDIevnB08ds9ODgyuZi5lM29ZrneEP1K0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <486c3f36-957c-482c-984d-5959406cf9a9@amd.com>
Date: Thu, 6 Mar 2025 14:36:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 4/5] xen/arm: translate virtual PCI bus topology for
 guests
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
CC: <xen-devel@lists.xenproject.org>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240522225927.77398-1-stewart.hildebrand@amd.com>
 <20240522225927.77398-5-stewart.hildebrand@amd.com>
 <Zk70udmiriruMt0r@macbook>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <Zk70udmiriruMt0r@macbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|CH3PR12MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f3b7c3c-d211-470f-abcb-08dd5ce639e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFFNZ29qMFZzemVaK1dGd2lBNE12T0VBRmZlcU1USHR0SVo4aEVwWk5CVm5p?=
 =?utf-8?B?VHdUY3d4Si9FMllmbXYwa3ZNKzAwbW1Udm0wUjF1ZlNMU1Y2ell5Nmg4MGpq?=
 =?utf-8?B?RzF5TUZ1ZVBlNWYwbzkyQlFOL3dicWcrVEJVK1dDd1I0cy9iV01xSUpNWXBw?=
 =?utf-8?B?OEN1SUVaUVUzODhaWE5MZUpOS0QreGttQldWbnRlTlRTZEpoZjZVa0J2SGx5?=
 =?utf-8?B?RTQzeDVUUFFzakdiK04vNnI2MWpocVJoYXUvV093SHNvUlZyWmEvTTcyTW4v?=
 =?utf-8?B?N25pcWVnQWY3Y3NVbjJ3VS9LREZPTnBTdm5GZ3dCY2pncDdwSFIzZ1pZdUZl?=
 =?utf-8?B?RG1iS0k1c1BmVnFZb0E3UW1zYXhqMWRlY0JVa1hmWUUyY3RZdk1adjNHZVhF?=
 =?utf-8?B?R1V3SzRpL0FaK2E3em1UR0lwNS96V2xEekpsK1VaTng2ZnR6ajk2MVdjSW5i?=
 =?utf-8?B?cmNDSnZDUDRWL2N0dGtFb0tlM05JNHU5blgvYWhKSC9DcGtoVklFL1U5UlZG?=
 =?utf-8?B?ek12VXhzc2hTaXU4NUw5U2FLNWZnbjlKS294ZUo1RTB2U0FvNnJWbGhrbTNJ?=
 =?utf-8?B?VG5iWHhTZHRoQWRPMDdnWHhndTBRRHBVaVg4cVJyc1d1clFiRDRkRlMydmlQ?=
 =?utf-8?B?Q05WOU1UMGNVUnRSQnMwUzFOcEUyRGJIa1A4SS93dndqQXRqMmE1NVpkYndP?=
 =?utf-8?B?L21vTWVRSG1XME90eGhYNFNDWnU5RWpjWEZieDUyZFN5VEswbHEzYnE5R0RG?=
 =?utf-8?B?dlRCYTdMRkIrQVY4OHJkQTVVNzZLR2diNkZmczkzVXd6dkczSDdOZlhJK3Jv?=
 =?utf-8?B?T0xkMW9VK3VYcEJhOGZvNHFxK3BtaHJBUm1GNzRKOWEwUlZEYThiMmxFTlJ6?=
 =?utf-8?B?bGl1cFFJN3BQMGNNZGFPVlkzbzdJS0QvamtsSUJzRnlFMkVKQWpmN292YmdR?=
 =?utf-8?B?Vi9MOHZudTljNld5Wnl3TTRWYkhpQmV4R29zRFpKNHBRRy9lcTMvMjFadUFO?=
 =?utf-8?B?N2hEQ1RDVkE3MzBxQ3gxOUpPN0xVb1ZBUmhXOS9HemZrbFY1VU9VQ2ltL3oy?=
 =?utf-8?B?Sit2aHpJaTVobkVCc000YkMzRzlkNnFsVEZnQ3o2T1E1aWFMNU5hYnhsbHZK?=
 =?utf-8?B?ZllxL1JsaExyenIrL0FDSXFZWkxMREtWemk2bkduRXdaSGFQaTNXODFWNzda?=
 =?utf-8?B?UHJXNjd4SS9xUFcrb0xkWTlsNGRCaEJ0Z1p1ZEFpNkV3aWJVZjZQbXZ4VzRm?=
 =?utf-8?B?OGljaG5qTnM3UHpBNk02ejdnbTdLTFdDM29uRlRLd0RjUXNTeWl0YWJnT2JH?=
 =?utf-8?B?U1JFM1NDbUtSZndYYnpTelJyOHpFcXFmQmFNL1BNeSt6ZkxvamlVQkJxcTFD?=
 =?utf-8?B?MkVHUDdlSXZoUUttUks0T1dsaW1wdGVxdTMxcnlZZDBZUFlDYlRHQUVJMkxV?=
 =?utf-8?B?dE96WjlGWnFQT0czZmxnWWlLeml5aDViRW14b2FwdGJiMHYzVHo2OVVVNEpB?=
 =?utf-8?B?TG1XNTk0eUhONXlzNFRxcFl6Y2djSmlHcmNKdTBpTlFMTVBrVzA1eEF3VHR2?=
 =?utf-8?B?bGt3SkxQRHV3d2haNmhyaWZkYk5MSDF6cXRpQ0c1Q1RiTGlDaDMva1VRbUxP?=
 =?utf-8?B?Wk5yb2ZBaGpjdXZ3UFVwVmNGVVU2NU95N1hiWEhDa1dXSW5tNm9MZE5xTU5U?=
 =?utf-8?B?U0dBcTA3SjMvVml1ZkJWSjJyL05FZ25uUzhRaGI2MzNZWWovcm9wZS9hcDZv?=
 =?utf-8?B?ZGN1RTNQampncWRYREFaOTVJeEFDZ0o4U2xyT0czRnNwbWo3aFJ2dUhSc09D?=
 =?utf-8?B?YmtCZVRzYndjRjZ4bDMwby9mdnUwSmFyWmJqdFR2TSt2eVBkd2FsRWZQbTFz?=
 =?utf-8?B?SExRUWg2OUtaRit4NVU5N0ZiMG1nZmlYdWVrWUJ0cDdMZ3N0TG14MUpZb1pH?=
 =?utf-8?B?azlaU1Bzak95UjI4bjZjcG5PRENRZllHc0FNNXBtZXNPdWhDN2FyWXlnZG5M?=
 =?utf-8?Q?18Y0ba4BxMvXGCURTgHiQgE4yedmms=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 19:36:43.9389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f3b7c3c-d211-470f-abcb-08dd5ce639e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7644

On 5/23/24 03:48, Roger Pau Monné wrote:
> On Wed, May 22, 2024 at 06:59:23PM -0400, Stewart Hildebrand wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> There are three  originators for the PCI configuration space access:
>> 1. The domain that owns physical host bridge: MMIO handlers are
>> there so we can update vPCI register handlers with the values
>> written by the hardware domain, e.g. physical view of the registers
>> vs guest's view on the configuration space.
>> 2. Guest access to the passed through PCI devices: we need to properly
>> map virtual bus topology to the physical one, e.g. pass the configuration
>> space access to the corresponding physical devices.
>> 3. Emulated host PCI bridge access. It doesn't exist in the physical
>> topology, e.g. it can't be mapped to some physical host bridge.
>> So, all access to the host bridge itself needs to be trapped and
>> emulated.
>>
>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> One unrelated question below.
> 
>> ---
>> In v15:
>> - base on top of ("arm/vpci: honor access size when returning an error")
>> In v11:
>> - Fixed format issues
>> - Added ASSERT_UNREACHABLE() to the dummy implementation of
>> vpci_translate_virtual_device()
>> - Moved variable in vpci_sbdf_from_gpa(), now it is easier to follow
>> the logic in the function
>> Since v9:
>> - Commend about required lock replaced with ASSERT()
>> - Style fixes
>> - call to vpci_translate_virtual_device folded into vpci_sbdf_from_gpa
>> Since v8:
>> - locks moved out of vpci_translate_virtual_device()
>> Since v6:
>> - add pcidevs locking to vpci_translate_virtual_device
>> - update wrt to the new locking scheme
>> Since v5:
>> - add vpci_translate_virtual_device for #ifndef CONFIG_HAS_VPCI_GUEST_SUPPORT
>>   case to simplify ifdefery
>> - add ASSERT(!is_hardware_domain(d)); to vpci_translate_virtual_device
>> - reset output register on failed virtual SBDF translation
>> Since v4:
>> - indentation fixes
>> - constify struct domain
>> - updated commit message
>> - updates to the new locking scheme (pdev->vpci_lock)
>> Since v3:
>> - revisit locking
>> - move code to vpci.c
>> Since v2:
>>  - pass struct domain instead of struct vcpu
>>  - constify arguments where possible
>>  - gate relevant code with CONFIG_HAS_VPCI_GUEST_SUPPORT
>> New in v2
>> ---
>>  xen/arch/arm/vpci.c     | 45 ++++++++++++++++++++++++++++++++---------
>>  xen/drivers/vpci/vpci.c | 24 ++++++++++++++++++++++
>>  xen/include/xen/vpci.h  | 12 +++++++++++
>>  3 files changed, 71 insertions(+), 10 deletions(-)
>>
>> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
>> index b63a356bb4a8..516933bebfb3 100644
>> --- a/xen/arch/arm/vpci.c
>> +++ b/xen/arch/arm/vpci.c
>> @@ -7,33 +7,53 @@
>>  
>>  #include <asm/mmio.h>
>>  
>> -static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_host_bridge *bridge,
>> -                                     paddr_t gpa)
>> +static bool vpci_sbdf_from_gpa(struct domain *d,
>> +                               const struct pci_host_bridge *bridge,
>> +                               paddr_t gpa, pci_sbdf_t *sbdf)
>>  {
>> -    pci_sbdf_t sbdf;
>> +    bool translated = true;
>> +
>> +    ASSERT(sbdf);
>>  
>>      if ( bridge )
>>      {
>> -        sbdf.sbdf = VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
>> -        sbdf.seg = bridge->segment;
>> -        sbdf.bus += bridge->cfg->busn_start;
>> +        sbdf->sbdf = VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
>> +        sbdf->seg = bridge->segment;
>> +        sbdf->bus += bridge->cfg->busn_start;
>>      }
>>      else
>> -        sbdf.sbdf = VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
>> +    {
>> +        /*
>> +         * For the passed through devices we need to map their virtual SBDF
>> +         * to the physical PCI device being passed through.
>> +         */
>> +        sbdf->sbdf = VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
>> +        read_lock(&d->pci_lock);
>> +        translated = vpci_translate_virtual_device(d, sbdf);
>> +        read_unlock(&d->pci_lock);
> 
> I would consider moving the read_{,un}lock() calls inside
> vpci_translate_virtual_device(), if that's the only caller of
> vpci_translate_virtual_device().

This is a good idea.

> Maybe further patches add other
> instances that call from an already locked context.

In a downstream, we're calling vpci_translate_virtual_device() to
enable PCI passthrough for PVH domUs on x86. In that case, moving the
lock would be equally beneficial.

