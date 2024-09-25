Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E12985D33
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 15:04:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803936.1214788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stRg8-0003IP-NN; Wed, 25 Sep 2024 13:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803936.1214788; Wed, 25 Sep 2024 13:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stRg8-0003Fc-Jh; Wed, 25 Sep 2024 13:03:36 +0000
Received: by outflank-mailman (input) for mailman id 803936;
 Wed, 25 Sep 2024 13:03:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJO7=QX=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1stRg6-0003FW-Tn
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 13:03:35 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20626.outbound.protection.outlook.com
 [2a01:111:f403:2414::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90cd0138-7b3e-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 15:03:33 +0200 (CEST)
Received: from BN8PR16CA0035.namprd16.prod.outlook.com (2603:10b6:408:4c::48)
 by MW4PR12MB6731.namprd12.prod.outlook.com (2603:10b6:303:1eb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Wed, 25 Sep
 2024 13:03:26 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:408:4c:cafe::67) by BN8PR16CA0035.outlook.office365.com
 (2603:10b6:408:4c::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25 via Frontend
 Transport; Wed, 25 Sep 2024 13:03:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Wed, 25 Sep 2024 13:03:25 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Sep
 2024 08:03:25 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Sep
 2024 08:03:25 -0500
Received: from [172.30.194.120] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 25 Sep 2024 08:03:24 -0500
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
X-Inumbo-ID: 90cd0138-7b3e-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p5Zdyv6PRoRZPVVrKhblUqXOeME2s128i/4pp9aaGB492/587XpPbVfz6Mxn9KxlhWhoA73NNtjCzGLLhffIbsQzjlPzuOdq+cVuwE/ZSsdofrwnWajlHhtBUKilKqb8TmrQLp9IP0j//emcNML4UDe3Ul9uZZl7kxXUH3gxzH8XayHmhRN+OpcbYbkZQh3Y0SdqGSEmg3G9yUDHvx/bYPL5jdMgWvjC9TmfY+E1wCoCDTIdljsK2I7Nbpkbg8DXtojoITNfq2LkEhPWkAUhYevN1dazFUX/sVG8G2SZ8hNS/3vMX1AqKB69BwDivrxgCcLr3qdGGbTck3MN8dYvmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnSbTolLKan6/waZuI4pJKgVcVd8wtWAesmkfOsessY=;
 b=eSjEPFqiIU6djltvF/iTFDwVao5SKEtfWXNJlALNt6XU8dDKEgpqb/YcOdHb5+LLHX2MNWNRiO4YeFXvuWXTEkBpGYeaqxl5+ZWvSJ2CHth0mAYKAzmdAiP+CabNahxjQ52LqK5pr6pySPw1gZ50mCabTNVMZuBFpYjQftQQuMj3/ORFl2+BEmwkynfo+s/3BSr+ym1WeUHibaQU9dpoTYKxpsYoFoPJQAVh8hlyz3JsedCG81r4oRy1jSlomKUkl+8vdhwoa0w07PLz2fWJsrko6xW8bEgeIs1UD48SZPu4sd3LkG7U7FvMFNuBsOMLAmGofBDhU0I8JBkLhLsUgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnSbTolLKan6/waZuI4pJKgVcVd8wtWAesmkfOsessY=;
 b=sWtJoHd8JxNGumAwMm9kmQUbTD42JzUaDM93ftElVASVSL5Q219bmPWGtr6K+Fq+oCEEpouIF+nh8myhCfOrVL1oC7H8h7bG34h8FrAhEJu4VVoh9Pgo3spPmiAD1426ecn92K1G36dN+MNs4lxOSnN7JCK5fYbrDgB7GH1dXvM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e5a72684-851c-4d7c-a17a-76a26b802b84@amd.com>
Date: Wed, 25 Sep 2024 09:03:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] xen/arm: create dom0less virtio-pci DT node
To: Stefano Stabellini <sstabellini@kernel.org>, "Edgar E. Iglesias"
	<edgar.iglesias@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <dpsmith@apertussolutions.com>,
	<edgar.iglesias@amd.com>
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
 <20240924162359.1390487-4-edgar.iglesias@gmail.com>
 <alpine.DEB.2.22.394.2409241641250.1417852@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2409241641250.1417852@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|MW4PR12MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: a4df9dc3-ae2b-4d7c-06fa-08dcdd627180
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RU02Q2c5OVRIdWlBeUw1Q28vSTh6eDZYZ3AxMFJQSkp5ZTJEamxCcTVIaWs3?=
 =?utf-8?B?SHFCNGZXOVo4Z0M3cGQrWHpMWFRTM2pMeUNNcWZWdzgvVTdNeDEvR1pTeWZU?=
 =?utf-8?B?OXAyZE82Yy9jcFVlL3BFUnBvM01YYjM5YUhSbzk5aU9yS3BoMTRWM1hvUEJU?=
 =?utf-8?B?YWZhdjRmWjBFS0s4c2t2NUtGV2d1ZzJOYy93bk9vYzB3L0FTT3JBUTJVY3VC?=
 =?utf-8?B?RERrb0RhdDdrZFdyN0l4WFNER2cxOGFEY1pYK2lVOVFyWE9PeExCalEyd2do?=
 =?utf-8?B?T014MFdSTmxkeHM0NmRqM3phUk5SREliRXlFbUtrVGwyYlphR3h4NmNWVnBr?=
 =?utf-8?B?NGN5WEFCTmtNZVFmOVVrZEMzeEJTbDB4U2xGWElody9hR01QczBlMnFUTnVN?=
 =?utf-8?B?NHgzWi9aNXowN0NvWXFWNVFRa01ucDZ4UEQrWVpXT2hxTmtXYzZlM0hwSUVL?=
 =?utf-8?B?U080UE9mcnNIRTM2bEdraDFHaVVJMUwxZmNBZ0RCZFRqS1YzKzJtUEZQOEdj?=
 =?utf-8?B?Z3dMQmJHQkEwYlNBVWx6aUNjYTdBYlVsdS9yNXExUFVvSU1NNlpENjBPb29W?=
 =?utf-8?B?c1crTERMaDdDVUhpdVpLUmRRSGUwZXMxVkY2THNqNEQrbjBKYjFMd2djZmNk?=
 =?utf-8?B?YVNSeFRsZUdsSWx5R1pBRjhYQ0UxbmxOVlR6U080cWlCaWlBdHFVclBPK0to?=
 =?utf-8?B?WGJQRnpjVWowSGhTZkZ6bVdvcnVTYjhMbGxrb3R1Vmd6ek1DVWRhcGFnaEdD?=
 =?utf-8?B?MkhVZFBML090STVydnkwdjVCNXU1TVJkblg2aEpvTCs5REt2Y2FvMTRMZkdB?=
 =?utf-8?B?TjhteEgwSHhKRENlbU9RM2RRclNzSHJDUUZYZURRM0c2Tm1GeHNqN2tEdCtk?=
 =?utf-8?B?bWtiSGwyMmczMWVoN1VNTDRGZkRkaG1tdE51QVhNeFQ5QmhHZXdINTl5eWhk?=
 =?utf-8?B?NjhISURQeHV5RFh0NlNyLzd2QUpYeU03bW9lQ3hEOERqSXBQNzVvY2p0a3Bp?=
 =?utf-8?B?SW9xZk9KSEJGbzFsWktKWnV1UjdGenh0ZW5PZDJNVjhkdktmVTBDT3Zpcktp?=
 =?utf-8?B?MzdxU3gyK1JacmJQKy9CWjgxTnQ3OFIxcnlYYUN4VElKRVRsOExWZVRqWTBj?=
 =?utf-8?B?RHZmZTM4SVd2YmNuc0ZVcGl3a1UwS3o4cEszMmZtTkdBKzZBRFp3T0J2UE5n?=
 =?utf-8?B?YTJaSHlIQkk5S2lScmEvcHo0UFU5UlprRnVYclh2c1lTUlZnTHFnVFBuL1Vr?=
 =?utf-8?B?ZFdSOTFvb1dqODlNWmh0djJlU1dtQ21WSFVaamRjYXYyb2ttK0YvK0dXN2Jj?=
 =?utf-8?B?d2o4cFFHckphRk9nQk9GMGF3U0dSSnhEckF5cnVmVU1OSXlZQ3pBK2M0VWRC?=
 =?utf-8?B?V0J2VjlOcnMzaEkyNTVWSjlmaS9IVmlaNGxDTGhETXBiVEtpeEpaTHZWZ0xD?=
 =?utf-8?B?ODNCenNRYlUwRGdXbzhzcHRzNGFHTUxxaFYxM0FPZXVxYkNXeGt1bGFBeHhL?=
 =?utf-8?B?Q0dqTEJjRk9YNHZxQmRVVnhHeENFSHYzT242cjJtUVZpaGoybGF4Vm43UVdz?=
 =?utf-8?B?elBiUzdNbzI0SHZHd01jZGZTZDg0TW5Jd3BBUkQyWWJOaWlLd1lESHlFc1lV?=
 =?utf-8?B?a1oycjY3U3J4QVMwUDlXbnNseTRiVUxqQk1EcGVLd3E0OWxNUkwzMHBKZlRU?=
 =?utf-8?B?dklvakJva0ZTQnc2QnVnbkNyTk5sd2FpV0R6M3Rya1g5VHdCM1FPM09BSWlz?=
 =?utf-8?B?cG9oTVlIWEtXUVp6V05YcEtLSm85VTJSUURPenF1TjJQaTFtUEZLZnRuTkJB?=
 =?utf-8?B?Qmp1WDkvYmdYSnpwVGx6YnhjdXVkMGZaR2gvVzVyVGx0Z1dVcHh6aWthcDlm?=
 =?utf-8?B?NjVmclNzT296U1cvWlBudDMvRkhCbzlSMFYybW9oeUkySXFsVXpMaFhxamFw?=
 =?utf-8?Q?tdIdJVOFata1wosTAuWS9FtsRUnZLAfI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 13:03:25.9735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4df9dc3-ae2b-4d7c-06fa-08dcdd627180
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6731

On 9/24/24 19:55, Stefano Stabellini wrote:
> On Tue, 24 Sep 2024, Edgar E. Iglesias wrote:
>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
>> index 09b65e44ae..dab24fa9e2 100644
>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -744,11 +934,24 @@ static int __init alloc_xenstore_evtchn(struct domain *d)
>>      return 0;
>>  }
>>  
>> +static u64 combine_u64(u32 v[2])
> 
> Let's make this a static inline or a macro. I can't believe we don't
> have one already.

We have dt_read_number(). You'd need to use it with dt_get_property().
In this case, it might look something like:

__be32 *val = dt_get_property(node, "virtio-pci-ranges", &len);

/* TODO: check len */

...ecam.base = dt_read_number(&val[0], 2);
...mem.base = dt_read_number(&val[2], 2);
...pf_mem.base = dt_read_number(&val[4], 2);

>> +{
>> +    u64 v64;
>> +
>> +    v64 = v[0];
>> +    v64 <<= 32;
>> +    v64 |= v[1];
>> +    return v64;
>> +}
>> +
>>  static int __init construct_domU(struct domain *d,
>>                                   const struct dt_device_node *node)
>>  {
>>      struct kernel_info kinfo = KERNEL_INFO_INIT;
>>      const char *dom0less_enhanced;
>> +    const char *virtio_pci;
>> +    /* virtio-pci ECAM, MEM, PF-MEM each carrying 2 x Address cells.  */
>> +    u32 virtio_pci_ranges[3 * 2];
>>      int rc;
>>      u64 mem;
>>      u32 p2m_mem_mb;
>> @@ -779,6 +982,41 @@ static int __init construct_domU(struct domain *d,
>>  
>>      kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
>>  
>> +    rc = dt_property_read_string(node, "virtio-pci", &virtio_pci);
>> +    if ( !rc )
>> +    {
>> +        if ( !strcmp(virtio_pci, "enabled") )
>> +            kinfo.virtio_pci.mode = VIRTIO_PCI;
>> +        else if ( !strcmp(virtio_pci, "grants") )
>> +            kinfo.virtio_pci.mode = VIRTIO_PCI_GRANTS;
>> +        else
>> +        {
>> +            printk("Invalid \"virtio-pci\" property value (%s)\n", virtio_pci);
>> +            return -EINVAL;
>> +        }
>> +    }
>> +    else if ( rc == -ENODATA )
>> +    {
>> +        /* Handle missing property value */
>> +        kinfo.virtio_pci.mode = dt_property_read_bool(node, "virtio-pci");
>> +    }
>> +
>> +    if ( kinfo.virtio_pci.mode != VIRTIO_PCI_NONE )
>> +    {
>> +        rc = dt_property_read_u32_array(node, "virtio-pci-ranges",
>> +                                        virtio_pci_ranges,
>> +                                        ARRAY_SIZE(virtio_pci_ranges));
>> +        if ( rc == 0 ) {
>> +            kinfo.virtio_pci.ecam.base = combine_u64(&virtio_pci_ranges[0]);
>> +            kinfo.virtio_pci.mem.base = combine_u64(&virtio_pci_ranges[2]);
>> +            kinfo.virtio_pci.pf_mem.base = combine_u64(&virtio_pci_ranges[4]);
>> +        } else {
>> +            kinfo.virtio_pci.ecam.base = GUEST_VIRTIO_PCI_ECAM_BASE;
>> +            kinfo.virtio_pci.mem.base = GUEST_VIRTIO_PCI_MEM_BASE;
>> +            kinfo.virtio_pci.pf_mem.base = GUEST_VIRTIO_PCI_PREFETCH_MEM_BASE;
>> +        }
>> +    }
>> +
>>      rc = dt_property_read_string(node, "xen,enhanced", &dom0less_enhanced);
>>      if ( rc == -EILSEQ ||
>>           rc == -ENODATA ||

