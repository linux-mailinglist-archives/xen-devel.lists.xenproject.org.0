Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C22B39890
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 11:42:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098061.1452195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZ8q-0007E9-H4; Thu, 28 Aug 2025 09:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098061.1452195; Thu, 28 Aug 2025 09:42:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZ8q-0007Cf-DO; Thu, 28 Aug 2025 09:42:00 +0000
Received: by outflank-mailman (input) for mailman id 1098061;
 Thu, 28 Aug 2025 09:41:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V9g1=3I=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1urZ8p-0007CX-AQ
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 09:41:59 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2409::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cddc6ec-83f3-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 11:41:58 +0200 (CEST)
Received: from SJ0PR03CA0224.namprd03.prod.outlook.com (2603:10b6:a03:39f::19)
 by DM4PR12MB6592.namprd12.prod.outlook.com (2603:10b6:8:8a::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.20; Thu, 28 Aug 2025 09:41:50 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::db) by SJ0PR03CA0224.outlook.office365.com
 (2603:10b6:a03:39f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.17 via Frontend Transport; Thu,
 28 Aug 2025 09:41:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 09:41:49 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 04:41:49 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 28 Aug
 2025 02:41:49 -0700
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 28 Aug 2025 04:41:47 -0500
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
X-Inumbo-ID: 3cddc6ec-83f3-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B0UZuCteC4Xx42uxEAvuJnwAfht6CeUikq7BoLhyDwHTPJWfdU+PfDV6YI9kp5xuvr+awU0UWt4daG899i07bGUrWCYSIXoJhJULMUwD7CNwN0U+B1lUiv8JC92DWq713DAQ2aLrY/a5OS1uWFLpKtUqVO8kXa/FuKsbJCs66crPeL3m5OSSDkgyCO9zUGd1HjA0WjhZ+1Arhao4Dqj2Mq7aBVQjizCub6buUq+dgY3z0KzEco0lZfj/wGVaFNP63sJZmri9fMiz9XksTvCKjyPOZnfZcZHTwzk5N9NPfpQdMZsZJc5jv6kg1d2LmjdoRlP28at4Ez7IgofJ+p2E8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wtlJM1S8+cvOPbwuOh4GOQdJo1AYMqBzooFprWDJtE=;
 b=UfsUS6K0mB02HkZk6re6jrLhHioT8iAmd2OzLR7jHDd2YafMLBsYVIJBGXlh9m8Ai8l0vRLyIlHId2SDqbF/z1n0QXv1HRxtzKtzbusAya2SKqr9uRgV9wuQ9sXkHOSso7Eopt35NVyMvRC8/GQat+hnVC6ScBkqDo/ZN31GfRPlj492O7zJXhUKBAN77NT3dZ+vbELdE+sHGIspdsu8C7pUCeI7R/JcEqmkNOs3KTMtSqsk5wLd0a/2XY5b0nRGJEWlTpFQ+jcxUSifxgVIrYFAU+hOZZnU9deUbM/ppyQjfye3LSdAQ/qL81QCcE9YiNNowJqKZHZzIRU8dB85Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wtlJM1S8+cvOPbwuOh4GOQdJo1AYMqBzooFprWDJtE=;
 b=OaUC1ea2F190zP0V5xHTDMDl49ejvxNHDQkqT174/b4+bi0Z1cGBC3QDxK70xuHpT3Iq4tOFlUX2+osL7uvk8oY+R8AccCo9rRd3wZVjlgnUpub300s3F8xRbf68yCYbarhT5Vwr7jUlDgssuv3RVRYomCObXHo7MFF8Z1ff7uk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <212bf8b1-136e-4b96-80d0-c82d94b9845d@amd.com>
Date: Thu, 28 Aug 2025 11:41:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm/mpu: Implement ioremap_attr for MPU
To: Hari Limaye <Hari.Limaye@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Luca
 Fancellu" <Luca.Fancellu@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756312498.git.hari.limaye@arm.com>
 <d2287756e1cd2e7f1cf4ac1bc5de775840c0b0ce.1756312498.git.hari.limaye@arm.com>
 <3f59b4ff-31f0-4801-96ba-83df139af081@amd.com>
 <DD8D8334-6973-47BD-907F-D7E621A44E38@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <DD8D8334-6973-47BD-907F-D7E621A44E38@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|DM4PR12MB6592:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d3fca30-97e4-4069-5bf3-08dde6171cce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rlp2RkdVMFhIM1hqclExVVpqU1F1SU1jR2dab2VWZVFxTHRqb3pWbDg0ZW41?=
 =?utf-8?B?Qllwd0xmeVJSUll6UVFFcUtNclBtOFZnZU9VVWd0N0FUT0F4WXljUGxmUzAy?=
 =?utf-8?B?R1NjclBjdExmSkRWc0hNU0xOL1Jya0NmZitiTUcyK2s1eExQbTFaZWNGNFE4?=
 =?utf-8?B?NkFUT2JPSmpLUUc1MHdnb0F5M1ZkeExjWGdrQWdTSUdBaDJWdy9ZSWZ6ZHFu?=
 =?utf-8?B?ZzZqdGZmVTVUVlRLM0xpUEQ4RTU2dWN3QTlVYUx2eFBOSm50VXZGaU9Dclkr?=
 =?utf-8?B?WTlKUWlzMEFYNXM0SXB6NWdVRDZWYnlXSXBwdkZkb0luelVsYUw2b3JMSCsx?=
 =?utf-8?B?bHlLVTArNk5IT21XS0lZa2d0d0RNaGhpUnBCM0xjanRXMjBDMDlCVGlrQkJU?=
 =?utf-8?B?Rmo3ZzcxckdQdXhuZ1NJTzFrdjljNHZ4TkJmcmRUeEFxNWYyd045WDlMM0Jq?=
 =?utf-8?B?aUpYOUVHZm5vbUdxMzlMeUdNemxGdDJaajlJY0tid09nK3E3aU1qYWdYWEt4?=
 =?utf-8?B?eWppWTRDY2J3bmtFZmhLRk9jN2tsVTViYVVIajB1K2RqL2ViWDRJNHZCdVhk?=
 =?utf-8?B?NzMyMGRTMFFrR2hhbW05MU9GSWUzQWFTd3FmNlhUZG1OcDlNdTRiNCt2R0FR?=
 =?utf-8?B?Z2c1TW9RSXhXY05XNlRjREE0Q3JUeGJmY2Q5bGpTUmM5WDIwUUZKSDZZQ3ZH?=
 =?utf-8?B?cFVmb1YzUHJQbzlsSjNUdUdZK0VRT29FZy9EQmV1Z2Y5ME1XQTlZT2lHUzB3?=
 =?utf-8?B?MFhDUEUxTGN2K2xMaUdKZ0t2MDY5SUkrbndGRk9iaE9xemR5cWlFUGw1RUhQ?=
 =?utf-8?B?V1A0eFJneEZiMVZDMlM1UEY3SzRRUUNUcFFOMHB1NXR6UHZlYnRiVnI3dFZw?=
 =?utf-8?B?K2NULzRNbEg2bHJUMlNCazh4TlBpbStTSEtPWmxiWlRmNUN4N2RkbXJsZHZw?=
 =?utf-8?B?ZTBFSm11bXR3SWlaYVp6NXNieStvNnloc3hoMWxoVkZPZW9qdkNybThlSFRp?=
 =?utf-8?B?TjVJWk5QWWlCWDh1MTZ4bGQ1elpYWW55ckFBaFRsRnRrK045d1BCeEJHZmlS?=
 =?utf-8?B?NGI3bkJTT2ROazhDUEQxVEQyOFVxUGZ2RkIyWUlNU1BpZ3dzNkpmMDVFTTJx?=
 =?utf-8?B?RlZmMk9wRzN4MUlYTkdBWWR5WlVVeGxBWWMxZlluVHEyNVlHTGFmYVF5b3Z1?=
 =?utf-8?B?SGk4WExpTUQvVHBSc1kyUzdDSDBzT0FMYmdOSHh5b3Y3U0hjMktCZ00zQ2JF?=
 =?utf-8?B?aGJDaFFjeFNiV2RpU3VYWmdvYVBJclV0MzZ6MkZ0ZllwMS9xbDl0RlRXaktx?=
 =?utf-8?B?Y0IvcnZORkRtaWVCbzdNK0h1QnpnYlRReDVuODRYUW9MbHFUUUxhUThabHhZ?=
 =?utf-8?B?eC9ybFM2cDE5cHZsbmVQQnhjQ3lEOUdlOUFUZSswMjdQNGpXNVFSQnFxMzdG?=
 =?utf-8?B?QTZTdHVIbHVmT29wZHlMUGVnNk91MGx6cjdxcWNqRnF2WHRqT0l6U0s1SWVP?=
 =?utf-8?B?bHVGUHpSRkVLK29ScSs0Uk8zbXhycVVTejQxMHd5VWxEMXJmdTZFT203Zi9Q?=
 =?utf-8?B?VU5MRnVsTm1VY1F4WFI3bXNwTzVLQjIzK0VKeDgzdzVLU2xla2tVUmZoTWxO?=
 =?utf-8?B?dTFONllsVHNHTnV0NFV1aFdvRkZzcVJiS1NlNllwdFByaXI4UlF3S3J2bkd6?=
 =?utf-8?B?QTZmYUVPaElkemR0RFNnL0RyQ3dVblRBUk9PcVlpb2VMbXVwU05sLzFFdGFG?=
 =?utf-8?B?aXM0ckcrRmlqOG43bXNNNVNVa3FWNkxkZXN3eDF0L2tzRUlQR0Iwc1FyalVN?=
 =?utf-8?B?RkVWQWJWSm4wK3J4L3ZJQ3RwMDU4NUhwWXQ2QWtPUDdnT1RjcmEyZktHSE5p?=
 =?utf-8?B?WE00d3ArVzJnNTNtdTJvK0ttRUdIRUcvV1dEVHR5M0ZRQTZVd0J3cVMwRmN1?=
 =?utf-8?B?SHRnbGE5cTlBNFV5eWlWRmJjUStZTzdVVXpEZ1hlRXArcnQybnd0eWxuNTJ3?=
 =?utf-8?B?bVlmTERhQiswdzRtQkhKTTlhaG5aaEcvbGM1RjRPcEVNeEYydS93UjQzL3p0?=
 =?utf-8?Q?e5RPBP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 09:41:49.7525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d3fca30-97e4-4069-5bf3-08dde6171cce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6592



On 28/08/2025 11:37, Hari Limaye wrote:
> Hi Michal,
> 
>>>
>>> +    rc = mpumap_contains_region(xen_mpumap, max_mpu_regions, start, end, &idx);
>>> +    if ( rc < 0 )
>>> +         panic("Cannot handle overlapping MPU memory protection regions\n");
>> Why panic? This function is not used only at boot time and should propagate
>> error to the caller, it's also within a spin lock.
> 
> Good point - I will update this to propagate the error in the next version of the series.
> 
>>> +    /* This API is only meant to unmap transient regions */
>>> +    if ( !region_is_transient(&xen_mpumap[idx]) )
>> So is this the only purpose of the transient flag? To check that unmap_mm_range
>> is used on the range that was mapped with map_mm_range? What would happen
>> without introducing this flag? You already check for the matching attributes.
>>
>> ~Michal
>>
> 
> Yes this is the purpose of the transient flag - we want to ensure that a call to unmap_mm_range only destroys a mapping that was created by a matching call to map_mm_range. Due to the fact that map_mm_range may not create a mapping in the instance that one already exists - `/* Already mapped with same attributes */` - we need this check to ensure that unmap_mm_range will not destroy a pre-existing mapping.
Ok, understood.

~Michal


