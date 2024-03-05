Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F20CB87119D
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 01:23:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688541.1072790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhIaC-0004GD-V8; Tue, 05 Mar 2024 00:23:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688541.1072790; Tue, 05 Mar 2024 00:23:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhIaC-0004De-S2; Tue, 05 Mar 2024 00:23:00 +0000
Received: by outflank-mailman (input) for mailman id 688541;
 Tue, 05 Mar 2024 00:22:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjwK=KL=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rhIaA-0004DY-LE
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 00:22:58 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8233a10d-da86-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 01:22:55 +0100 (CET)
Received: from BL0PR0102CA0049.prod.exchangelabs.com (2603:10b6:208:25::26) by
 IA1PR12MB8287.namprd12.prod.outlook.com (2603:10b6:208:3f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Tue, 5 Mar
 2024 00:22:47 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:25:cafe::4e) by BL0PR0102CA0049.outlook.office365.com
 (2603:10b6:208:25::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Tue, 5 Mar 2024 00:22:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Tue, 5 Mar 2024 00:22:47 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 4 Mar
 2024 18:22:46 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 4 Mar
 2024 18:22:46 -0600
Received: from [172.31.100.92] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 4 Mar 2024 18:22:43 -0600
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
X-Inumbo-ID: 8233a10d-da86-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egu4wk/Fhl2TijLCU14VAaP6o6cBlf8nhajMclwt5kY0l1cdqCwt9ziPrms3tm/cIs/WNj+EszX5BbT3PpnbHSkiyRopmBXYMIKfOtSGDTeE0NaF/03xWJIe5LfLUu9lOTf0QOZmzn9wF5KuxLBNGmeoFrFXj7pJ9E8hBAsIYNxjHdBJg2ls5v6iu+zBReyIK4JpDi3MiPoqjuXvXHxSLhdoapA7Am1GqYGDs6U/Vp5HIFTZagkH34exuO/ofHWD/Zz0gPonDNVflvyRGa4w+DwCZtwmwCpv/6pbTewDj1G+oiy++B6woOZV3FCYuE0PwXkN1EzbAwsJNPY56fLxyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lApumrg/oXAOwe7s9VGN/Qeh2+4LdAEF1nu3NW6D50I=;
 b=oRazjeh2lTp/ujPcCRKUVN4QIKtl21scKJZj7uzeY1J/h4mmUCRFj+VXnVaYqLooGKir9eICOVxjCES+SHvPIabNaT/J2jlo7pLFdcDB1PXKp5SlLpHEd5MR5RuM6LSwNi6T8+5CmgrrErzsxiWH2oTkugRNotlUxbj52NxYiCNeCANqvBJbvuqujpteqLKl+XKToeRMj17Fs1BDx2xNFBZruPtxXYcy1fYM7C9nllCGTOLVYrUEB0VXWOKjHMkKLluWp9J0ea+gykidRIuapWwl6eB+gdVvY35/TJLdvWJFtGHqDOsJywoPy3P2lBdGqp3nQjR1QkHct4FUaAulwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lApumrg/oXAOwe7s9VGN/Qeh2+4LdAEF1nu3NW6D50I=;
 b=tZD8VizC1aJp+nC49AD0EGJBgvE/o3KQULMGNQiwHjKHkjwH+iZrgsihIDrBgqXlTvK0bWWyMBqxBfpH4EWyjHV9BUJuKF5mX525HCBBcYsGsTFZO/ijJRwnZpYZHzbeW1wt0XO0y5E3rIfw4YIuPyeXsbDVy8Ogfl5wn4QD63I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e07afc82-1b73-4473-ab0c-2d8ea283e377@amd.com>
Date: Tue, 5 Mar 2024 08:22:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/common: Do not allocate magic pages 1:1 for direct
 mapped domains
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Alec Kwapis <alec.kwapis@medtronic.com>
References: <20240226011935.169462-1-xin.wang2@amd.com>
 <d1518124-483c-4409-9b36-6a3392378911@xen.org>
 <a84aeb87-17e8-4195-90cb-7b0123064106@amd.com>
 <3982ba47-6709-47e3-a9c2-e2d3b4a2d8e3@xen.org>
 <8e56b75d-10a2-4764-8244-3e596f9fc695@amd.com>
 <98739f8d-dc00-4db8-a0b2-07f054107acf@xen.org>
 <a8499d69-0300-490d-98a7-dcceb83781a3@amd.com>
 <8768d244-c52c-40da-8a99-0296cb9a8ca5@xen.org>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <8768d244-c52c-40da-8a99-0296cb9a8ca5@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|IA1PR12MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f1429d-5672-4620-f507-08dc3caa6261
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TWL3+0ma104Zc+65XriEgNgyl4whKr61s0F36kztRsdQ8YRsTbkMDNEwU+SUte9kVfUpKNTB/ZKN54/xJliuMhGVLDx4dyzLBmTGBUsPTEU7iR68QUwFwLE34PhFs1KgF60Ew08T29px/GPK9wDDjl90kNZAa4xwI+G03p/fvyVk7Po+IF3v+eifHYGjnmgqwi26eJpyjgvLT4kUF4NlbTwn2rTnjfQbTynFhcTLpAR65vV0ASQj3Q5dnTV7iK2dT5YrbeOb308Jjs7fRswQZiTudwXT5chLB86znEUzdvyRk5CzFAwWNwUFqwLF+rPwvt3dR64FYFB01fM8WqeKHINM1u3qZXdQf0onVTbqefFpFBXKqiR6SbFkKcWk9LMQW3EnQ9b/pPQ6IAH3QJtpnzDMA+M97YwUGs0Cp+xbF+8YJuTDAvxsPcOcW99lJFkn3e90BqDUsKgceWriF5uipK/N/4bW/QYUxnqaJUWMr3iIMsOqCY1sbfKsRFy08TWmawLEjEH4FIAAQCksSY/x6YcdH9DVwPu+I1f5owPGyJ3hYapFZ/J3PHb21oTtX43LgiMFaJbHhazKU7ruiSh99BnFz2pjgVg3qhWYKctQL9zd+qVSZLxDqI25Od4PR5LOx4fAxBUMV739ZcWPdd9sdQpLIw2aN7+/0/WBiohMBQ4mJqH5030KKGr6UJjCjQ95LQxzD9hk1wDYbXegGDEcQeQ+CAmrONo5+0gM/T5RsZ2n+JOdiZWMM0DGNTnQRupD
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 00:22:47.1992
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f1429d-5672-4620-f507-08dc3caa6261
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8287

Hi Julien,

On 3/5/2024 2:38 AM, Julien Grall wrote:
> On 01/03/2024 03:03, Henry Wang wrote:
>> Hi Julien,
> Hi Henry,
>> On 2/28/2024 8:27 PM, Julien Grall wrote:
>>> Hi Henry,
>>>> ...here basically means we want to do the finding of the unused 
>>>> region in toolstack. Since currently what we care about is only a 
>>>> couple of pages instead of the whole memory map, could it be 
>>>> possible that we do the opposite: in alloc_xs_page(), we issue a 
>>>> domctl hypercall to Xen and do the finding work in Xen and return 
>>>> with the found gfn? Then the page can be mapped by 
>>>> populate_physmap() from alloc_xs_page() and used for XenStore.
>>>
>>> I know that DOMCTL hypercalls are not stable. But I am not overly 
>>> happy with creating an hypercall which is just "fetch the magic 
>>> regions". I think it need to be a more general one that would expose 
>>> all the regions.
>>>
>>> Also, you can't really find the magic regions when the hypercall is 
>>> done as we don't have the guest memory layout. This will need to be 
>>> done in advance.
>>>
>>> Overall, I think it would be better if we provide an hypercall 
>>> listing the regions currently occupied (similar to e820). One will 
>>> have the type "magic pages".
>>
>> Would below design make sense to you:
>
> This looks good in principle. 

Great! Actually Michal helped a lot to come up with the proposal (Thanks 
Michal!). I am really sorry that I missed to mention this in my last 
email and didn't credit him properly.

> Some comments below.
>> (1) Similarly as the e820, we can firstly introduce some data 
>> structures in struct arch_domain:
>>
>> #define MEM_REGIONS_MAX 4
>>
>> // For now we only care the magic regions, but in the future this can 
>> be easily extended with other types such as RAM, MMIO etc.
>> enum mem_region_type {
>>      MEM_REGION_MAGIC,
>> };
>>
>> struct mem_region {
>>      paddr_t start;
>>      paddr_t size;
>>      enum mem_region_type type;
>> };
>>
>> struct domain_mem_map {
>>      unsigned int nr_mem_regions;
>>      struct mem_region region[MEM_REGIONS_MAX];
>> };
>
> If you plan to expose the same interface externally, then you will 
> need to replace paddr_t with uint64_t and avoid using an enum in the 
> structure.

Yes you are correct. Maybe we can also try using xen_pfn_t and the 
number of pages to describe the range as an alternative. I will use the 
one that makes the implementation easier.

> You will also want to expose a dynamic array (even if this is fixed in 
> the hypervisor).

Ok.

>> struct arch_domain {
>> ...
>>      struct domain_mem_map mem_map;
>> };
>>
>> (2) Then in domain creation time, for normal and static 
>> non-directmapped Dom0less DomU, set d->arch.mem_map.region[0].start = 
>> GUEST_MAGIC_BASE and the size to 4 pages. For static and directmapped 
>> Dom0less DomU, find a free region of 4 pages for magic pages. The 
>> finding of a free region can reuse the approach for extended region 
>> and be called before make_hypervisor_node(), and when 
>> make_hypervisor_node() is called. We carve the magic pages out from 
>> the actual extended region.
>>
>> (3) Add a new hypercall XENMEM_memory_map_domid (or a domctl). Input 
>> will be domid and output will be the memory map of the domain 
>> recorded in struct arch_domain.
>
> XENMEM_* are supposed to be stable interface. I am not aware of any 
> use in the guest yet, so I think it would be best to use a DOMCTL.

Sounds good to me. Thanks for the input!

Kind regards,
Henry

>>
>> (4) In alloc_xs_page() and alloc_magic_pages, replace the hardcoded 
>> base address with the new address found by the hypercall.
>
> Cheers,
>


