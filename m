Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD8FA6575E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 17:07:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917340.1322279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuCzn-0006qc-W3; Mon, 17 Mar 2025 16:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917340.1322279; Mon, 17 Mar 2025 16:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuCzn-0006o9-SY; Mon, 17 Mar 2025 16:07:19 +0000
Received: by outflank-mailman (input) for mailman id 917340;
 Mon, 17 Mar 2025 16:07:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J4wc=WE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tuCzm-0006o3-0J
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 16:07:18 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2412::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3bf99b1-0349-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 17:07:14 +0100 (CET)
Received: from BL1PR13CA0207.namprd13.prod.outlook.com (2603:10b6:208:2be::32)
 by MN2PR12MB4157.namprd12.prod.outlook.com (2603:10b6:208:1db::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 16:07:07 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:2be:cafe::a7) by BL1PR13CA0207.outlook.office365.com
 (2603:10b6:208:2be::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Mon,
 17 Mar 2025 16:07:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 17 Mar 2025 16:07:07 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Mar
 2025 11:07:06 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Mar
 2025 11:07:06 -0500
Received: from [172.24.79.67] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 17 Mar 2025 11:07:05 -0500
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
X-Inumbo-ID: e3bf99b1-0349-11f0-9aba-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbsCJyEqWWsM+V9ifW01rPJxS2az0slZHKn/iVhM4SzxLRKVt7YhYg948Ys8EQgdqdrJVg2qKfitqDbbNc1klgsds5Puyx9nKlDbmDbpLSENVk0qd9l6eLHjdZhREWY2ycHndlh6OwyAhfOQQDfNS/6d7a5jepB6+dceppA916tSkGNVQHB4/Au/D7xj/fdSd5jGgWZhPVR+r1B+fj3q0twriZnNw1CqexcDIklTa5xMUCRbHesYQXCBVDlqFDKIlIPklMfMTvOt1LQYR7O++shGi891dP8COlPm/7f0PWvYC33FvNfXV3y2/yGfzmUPypsvVeP4MuskL3UJ6rMRrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mfl5aoO5MUWWaHA/WpdzJie469bPPnDkWWgRHC511HI=;
 b=ZMIpuXhvSAJMeqHK1EjYWdf4hh6X6zSTh0RfRI5laEPJTUwpAQT1dqe1pZ9Dhy1H3li5Pt0JPAGOQ1xdJFkrK5XBEyc8nM8JYQlD0+1J44Svqj3SwOuzl1X1ulZm91NZW9rrhPl8URbtlaC482ld38sNDsk2p46N+3Ze1P3ndIsbdGj968udtvM4ASbE0NBIrBmUYlvv9dslz+Iv+TxnA4aM9baWY25AqInGPOyaONOFZeehH7JRf3YUnQcS7EgPcwcyjb4UxWNpoqH65dZUXjeFHvkWeXuGk9Guab/AI6kcDkf5RTdPzmVeEklAfapF1Mf6cbW+z0PLs5vHw9I1NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mfl5aoO5MUWWaHA/WpdzJie469bPPnDkWWgRHC511HI=;
 b=bh7EeWzjPhytQtxhmQQLXo5uYqcKgkXWZLGiJFckZOFQm1gMlmt2VDQ4KAORBXazi1GUNqf8d1EufVSjBRweaH4Cgn45DfNHER7cG4xsz9dGuR7pkQYkV6z0niQCBr9+R3c+DWQsEuYLA1VMbgqbvjPrneHMNxxA7n6/i3SiFZE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <160d6195-3776-428e-a754-686edeb6f4a0@amd.com>
Date: Mon, 17 Mar 2025 12:07:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/23] xsm/dummy: Allow XS_PRIV to call get_hvm_param
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-15-jason.andryuk@amd.com>
 <6d6c2a2b-630c-404e-9257-e353464f2400@suse.com>
 <9c4e6e33-6381-47a8-a631-5ded21cf240c@amd.com>
 <ba2b9493-f794-497a-9f5c-1a714bdc79e5@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <ba2b9493-f794-497a-9f5c-1a714bdc79e5@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|MN2PR12MB4157:EE_
X-MS-Office365-Filtering-Correlation-Id: e822e7f1-6ea7-4e72-f91c-08dd656dc40b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bms5RUs5S0tialNhQjMyZTh6MWt5c2VFQlFFcEs3alhDOU5sc1htR2Y4Z0xz?=
 =?utf-8?B?cVNya3hEMEd6TDQ4TWwrRHEyTU5zVlZGQ1R2dXo5Vi90cWhYdS85L0UzMkhn?=
 =?utf-8?B?bXNJRWludVBKMkozaFZKMjJ5NDc0UmQ3RER5NGRuejFjKy9UbDNUOXNpYVlU?=
 =?utf-8?B?Uk5KWnpnSTZ0TFZYTlRUc2dEbGJVVEwvdnZ4MXU1eW1DZGVoTDlmekpTZ3I0?=
 =?utf-8?B?MGp4SElZT1IyR2pTc2laekxsR0puVnlqUHQ4c1dNVlFObE1vYXlXdUZRS3BN?=
 =?utf-8?B?UzV3Y0Y3SHpFU1FrbEpxSjh4MGtFR1huMUpSSXV2MlQwdTlzbWo2ZWcxVWk4?=
 =?utf-8?B?eXFDR3NUSFBzOGR2MGZYRldDaTl6cjhpSit1bEpjK3NIQnE5dG9iN1VWQ0pl?=
 =?utf-8?B?UVd4eTFIdXErZEsrbXR5TFg0djZiODRCd1BGTEltczBwR1lRbW84UHk1Q3Fu?=
 =?utf-8?B?dXE3b3VlVnhQRWU5b1U5TmtNdTFtNEsrWnlZZXJNNFZxSG85c0xMZ1ZiZW1S?=
 =?utf-8?B?QlhWbG5UNmNadnBoWE82SHhndmkwY1lBeWlRTllLY3U0R2VTN0gvZDZHRDh6?=
 =?utf-8?B?T2dIUWFEekNKQzdlRmdISElhcUl4bmFLTVBMN0pHTWk3Q3RIS3ByYUVhRHAw?=
 =?utf-8?B?aVc3dTBWZE4xWTdLQW1JMFV1cFZST1I4WjhmZWtpTW9SN25xLzBoNFllc3FT?=
 =?utf-8?B?YkhaUWJndDY5UzhlK3FQdkpLbmVWaHdTOXdyTkFObGtNa2VRaEI4aWMvVGtw?=
 =?utf-8?B?SUlDYzg5cWhSd2lCd2grRlhON0Q1ZEgvSXBCdnVZbzNHNmNaU3Y2a0haVWJz?=
 =?utf-8?B?LzB6TXV2K01IY2Roem1rNk4xQVZIVFFhblVSODBlV2RtcVltR0x1OFdmWGNO?=
 =?utf-8?B?QStDTE0vOG9oRmxid2FWMERhVTdzUlR6dnlneU00TTh1aEFGUzFwRTUxaEoy?=
 =?utf-8?B?dTBzN0VFMy9JKy93NnJUSHlnS2hwNFBSU2FHWXQyUXlKQmt6T2NVZlpldjRs?=
 =?utf-8?B?bFFTNHdINVVSb3plK3NCWWRlOVdoL1FRbjFRdzlQazJ4aXcvV21JZEMwUWV4?=
 =?utf-8?B?SUgveStJeWltNkVUUUROeG11RytYY0psUzBkYnZ5RUJWZ1hRNVN6SEdFQkFv?=
 =?utf-8?B?eFMzRmhDVjZqc2VwOUtIeVRIWGlhU29jcm9mTnNPSTUxYURmQ2QrdzVhUmpo?=
 =?utf-8?B?OGxrZzZ0TTdvL1FtNzNPS1EwMGF2cFY4M29ybmpsb1RKWXExdEVMUmdYYkVX?=
 =?utf-8?B?RUQyb1NnZUJRVDBFeWxFdGpqSTgvcFA4dDh5OFlUVkdjeUhtOEl4MmtIMFZp?=
 =?utf-8?B?RnFJSXh1QjQ2dmVqZFFlUUlIVHJYblFpcmlPR2NNSnRrZFB3M1VSQWRzcmlq?=
 =?utf-8?B?SUhUQ0ZtTWpJL3lySHVHOWdhaDRhd2JweDIwQ2NMQ3piZHczRE13dDdaNkw5?=
 =?utf-8?B?VkJFV2c2WUVIQThIbmdrWDB4WjM1d0x6eVZoam1MQXpKS2hHZVhUSTZLSm1H?=
 =?utf-8?B?N2ZHQ2Z6SGtCTHRGRzkzK2hsMk5nNTlzbVRzYTNNMWkzaGtaak94Mm85dE1E?=
 =?utf-8?B?bXVZTXYycjU4eHpQOEJiZTN3VzV1d3ZFOHVqK1FPd0ljbWxCZ0R1Mlk5QXkv?=
 =?utf-8?B?aUUvOG9rcmtHMkFOMjFOeWtiTnJuWWVMVlZUczN5NEROSnBOMmhuOGFpNEpX?=
 =?utf-8?B?d2llTVJnVGFSNVZxVVdkMlBXK05xRHJSUFA1c29BV3krRDJGRDBQOUo4alFy?=
 =?utf-8?B?NlFGaHlIUUJNenVvWitHR2IzVlU2VHZZRkVzcC9vZFZPQW9FWFQrL1ZCNERC?=
 =?utf-8?B?SW15WWI5RnI1dTk4TDl4OFhWd2pwMkJKQmNyWjd6MXduTWZRWHFsaXNLQklR?=
 =?utf-8?B?SUtraWdKZWUrMUJHdjU3L1ZwRmNicys5SklCY2Q4dzk3d3dPejA5aVdtTU50?=
 =?utf-8?B?OHdhcklvWUJVK0E4dEw0SXN2bjllSVd0Y1VzZ2ZTY0pRQWFNOW5HdVRDcU92?=
 =?utf-8?Q?B+CfTLTnjzk7cU2E4HboC/PqBAj5WM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 16:07:07.0344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e822e7f1-6ea7-4e72-f91c-08dd656dc40b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4157

On 2025-03-17 11:19, Juergen Gross wrote:
> On 17.03.25 15:50, Jason Andryuk wrote:
>> On 2025-03-17 10:18, Jan Beulich wrote:
>>> On 06.03.2025 23:03, Jason Andryuk wrote:
>>>> This is useful for a combined hardware/xenstore domain that will run
>>>> init-dom0less and xenstored.  init-dom0less calls xc_hvm_param_get() to
>>>> retrieve the xenstore event channel and pfn to configure xenstore for a
>>>> guest.  With a hypervisor-allocated event channel and page, the
>>>> set_hvm_param is not needed, and the normal domid permissions will 
>>>> allow
>>>> xenstored to connect.
>>>>
>>>> Similarly, a hyperlaunch-ed xenstore stubdom needs to read a domain's
>>>> xenstore event channel out of hvm_param.
>>>>
>>>> This allows reading but not modifying the guest, so allow the 
>>>> permission.
>>>>
>>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>>
>>> Since this is exposing the entire param space to Xenstore, what I'm 
>>> missing
>>> is a security discussion for existing as well as potential future 
>>> params.
>>> There could well be some that better wouldn't be available for 
>>> Xenstrore to
>>> fetch.
>>
>> I can't speak for future parameters, but existing HVM_PARAMs didn't 
>> seem sensitive to me.  The safest choice is to just pass the index to 
>> xsm_hvm_param() and allow just HVM_PARAM_STORE_EVTCHN (and 
>> HVM_PARAM_STORE_PFN) for the xenstore domain.
>>
>> This works for ARM and x86 HVM/PVH.  PV doesn't have a way to 
>> determine a domain's event channel port, FWICT.
> 
> For what are you needing HVM_PARAM_STORE_PFN? The GNTTAB_RESERVED_XENSTORE
> grant id should be enough to map the guest's Xenstore page?

Indeed, HVM_PARAM_STORE_PFN is not needed and I expect only using 
GNTTAB_RESERVED_XENSTORE to map the grant.  I just listed it as a 
compliment to the event channel.

> And with that I'd rather suggest to expand struct xenstore_domain_interface
> with the event channel port and let the component doing the seeding of the
> grant table write the port into the struct.
> 
> This would enable Xenstore to just map the guest's Xenstore page and read
> the event channel port from it. No additional hypercall permission needed.
> And this would even work with PV domains. And as the Xenstore page is 
> zeroed
> initially, any event channel port != 0 could be regarded to be valid (a 
> guest
> choosing to write a bogus value there would just shoot itself in the 
> foot by
> harming its own Xenstore connection).

Yes, that is a good idea.  I had also considered defining a reserved 
event channel for xenstore, but wasn't sure how that would be received. 
I like this better.

Thanks,
Jason

