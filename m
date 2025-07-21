Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E710B0CD22
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 00:03:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051738.1420151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udyaD-00057m-AZ; Mon, 21 Jul 2025 22:02:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051738.1420151; Mon, 21 Jul 2025 22:02:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udyaD-00054v-7a; Mon, 21 Jul 2025 22:02:05 +0000
Received: by outflank-mailman (input) for mailman id 1051738;
 Mon, 21 Jul 2025 22:02:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JXmZ=2C=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1udyaB-00054p-Qv
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 22:02:04 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2414::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 510f5580-667e-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 00:01:57 +0200 (CEST)
Received: from CH5PR03CA0012.namprd03.prod.outlook.com (2603:10b6:610:1f1::9)
 by CH3PR12MB9098.namprd12.prod.outlook.com (2603:10b6:610:19e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 22:01:53 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:1f1:cafe::92) by CH5PR03CA0012.outlook.office365.com
 (2603:10b6:610:1f1::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 22:01:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Mon, 21 Jul 2025 22:01:52 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 17:01:50 -0500
Received: from [172.18.231.84] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 21 Jul 2025 17:01:49 -0500
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
X-Inumbo-ID: 510f5580-667e-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6ZJEe8QSPy+s9bQdC7v268UZetTF0shaF2XLG97QyqTp+aVbS9nupk1Z/XSZipmoJ1TrTbcQJzSX0npFVTKu+euV7ctTde0o8C/6/cDUdZBRniA34mlPuM1aPYe5EYhIklFQj20NivFMxdxylqB3YwQhlgpYZvA0St8lRs+LscVz2KpP6dPXZH3un21rVJCYIK7z8C7rLtJ9ev3ouRN41mRMOxis9oSEu6+IXsXsyrfAKS6uMQJYsADczdjHqAeOh9NvM8l8+9YBxmbqoYmza4v3qoHQe1dd/P8RitUbWkZ6cvMQBGWnhPiI5HLSVegWXVEXa1VsX+DcTZLNzxvSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cCpAB8KvxNcnBmB77dLRJvswk7+9p04VmNkA/nZG2U=;
 b=GxXmDal8Q8+uvk4oqyQwRnfLWJ2+15Ckl3PoL4VkxF81f12/rh2qvLe7ueGz4so1i+9NTHpnCOBHE8maVNI9wLilH+yGqyGfBlrTNzXIQBA049dU1S1IPJvEDtotiL+OZY2xFuigYmRtBxypKbgwYOS1trNp63OfCIVZstze1Ak5BXUhG6+8NJRkC4Jyr2SCVgQ532rW7wePv+TsHzQ539+eAaSj/K1ppk+YNqyhsPlCivFD3v8SF51HAVDgEKEktW4xrEdu4JplqnK+MRTKH59rATKxEIdhWexK5Ow/TjFEBreHSz7rhV0VuakdcAQj6vheqhkmv8J9I6llqGavxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cCpAB8KvxNcnBmB77dLRJvswk7+9p04VmNkA/nZG2U=;
 b=szjM3NMF/hsUv4LiM6GzWufoE1QIUIVvXOWXASSPljPYJnnmyQZygleUXBG1VP36cw5qIpmjCUW/HWg3BVL56enQhCPgBGCN9cfwBTRrpXhIZ62A1w5W58wEeKW7CVvayk2Nbi5Jkfb/2qxdn5yPSYRJuXcTLQnGPnpXnnLDUfY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b18d800f-ac44-4748-b366-f2421e4e0a49@amd.com>
Date: Mon, 21 Jul 2025 18:00:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/17] xen: Introduce
 XEN_DOMCTL_CDF_not_hypercall_target
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	"David Scott" <dave@recoil.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-5-jason.andryuk@amd.com>
 <5c99a02b-a5f6-4dad-8d55-936697c70f2c@xen.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <5c99a02b-a5f6-4dad-8d55-936697c70f2c@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|CH3PR12MB9098:EE_
X-MS-Office365-Filtering-Correlation-Id: 21bc85da-eadc-47cd-0190-08ddc8a2337b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFc2SkxRZTVTRVBKQUJtUFFpSXZiZUQ3N1NtazJvWU1xTk40eEI0NVV3T0RV?=
 =?utf-8?B?a3NJVGdTT2hyUURFSzN4R0RTeFdWYUhyekFHYU5zWFpCVmRMUWxJWnQvdDRz?=
 =?utf-8?B?b3BmUVB2QzdhWnRZazMvMWovYWtsRERVZXlOa1JqbjhZR0hDdm5xbFRka1pN?=
 =?utf-8?B?cDVqVU5jUXZBemE5YXNjdWx4cE85RnJ5M0tTalhEUnpzR1ZkNnBQMHhqb3Nw?=
 =?utf-8?B?ckg0NCtrUlVDWVpYdFhFWTd1OFFMcHQ3dDBldzJycEh5VktxMkRLVTAwRjNR?=
 =?utf-8?B?clBJOGZyVXJLTnNGeFZHbk5KNS9YZnZ3aDV6SS8waWhYZ3pvZkF3Y212VEg0?=
 =?utf-8?B?dzU0c3hJb2RjZCtTdE43RTc0Ny9PdjVkVTJSUXREcUY2Z1RHaFJGQ29MVDgr?=
 =?utf-8?B?U1RwMXY0SW4rYzlLdkxUOXVHenh1WG5mMU1MNDdDWEthdW9wNUlhdjVSYWRL?=
 =?utf-8?B?VTBlSmxtUWNseExmSy9MaGU5Y1pFK3lzYWtJb1ZJaG9pbUE1SDgxcE42SVQ2?=
 =?utf-8?B?Tk1CWnc2STZEYUN5MzQzT09mV2NMSlRZbjBHMU5hTW5QT2RkSWtOVVlJN1or?=
 =?utf-8?B?bFF3R29oRiszZjdPVVI1SHN4ZlQ4aHdWMWJNL3ppVEdSL1JCREErYmQ0cGxS?=
 =?utf-8?B?M2lEcVUvVW1aK0lmK0JwVU8vUmtaMDI1UWdTcG12aXpFUWFaeEduYUc4VFFN?=
 =?utf-8?B?VnJ3NHhHWVhyOTlMMklsUkV6NWtRS0x3aG9FSzNQTlllZVowM2gvMW4zWm50?=
 =?utf-8?B?eHFualp2V0cyelNGa1c1OXhsOFp5TnVSTzhrMVFtYzdEdUxGSTVDaTdqWVlu?=
 =?utf-8?B?aTdpNE9Hci90YmpTT0NuVXRDNmZFNUZXbnVGRnZhcmVoYnFHQ2Q5UGRsL0li?=
 =?utf-8?B?QkhHTVNGRk9wR3dnTTh0dmRoTzI1czhTZGx0RHlqNUV0eSs2NzZHdll5bDZP?=
 =?utf-8?B?b3ZvUi91WmRKaS9obm5Yc1ZkYkNpWWZjSGx3SC9DSTZBVWFOSzl1ZVJ6amRH?=
 =?utf-8?B?ZzMrTnIrU1VKVGpLL29PTUZwOVp5djVDVk8yRURSRnRVQ0dvc25TS1M2S2dB?=
 =?utf-8?B?WmR5VkUwa2NLczV5NnZBUkQvRG5IT2Nud3dvZHExRmRIbjZXVVd1d1FkODZG?=
 =?utf-8?B?b3hyb3dXc1ZXSTROYytxeWVhWXNKckVQOXU1Rk5kTHJnamEwU3V2UnlPUEVi?=
 =?utf-8?B?UjB4OFN0WUE0ZjB1dTZZekdaOVloMHBYM2RvbjM2U1lmQmNuTGdZQk9NMFYy?=
 =?utf-8?B?OXloSWl6VWZ4YlZUclNmNjdvZ29YVjhQR050SnlKK3VMYkt1ZThDWFlBbVV4?=
 =?utf-8?B?ZytDT2ZQelB0cGhKcnN1aUdYakRDSHZIcWNpS2RKVDdXV1lRZ3JsNjhIbjdh?=
 =?utf-8?B?NjJObDY3cUJ5V2dZYzBKejl4bE9tS1c2a0pZVExJVnJPaDJ5OUo2SnBBZUlM?=
 =?utf-8?B?WFU1UWgrMW9ZeWtmT3lSKzdBcEJOZXdKZXBkVjQvU1dYRTBDY3hhZERVUlI2?=
 =?utf-8?B?a2NBRkRqYTR5NitidXRIRlpqZmpwcUxhdjM3NFVYcEVEb3VNclp5SytBMEd2?=
 =?utf-8?B?dFlwRnBGRnJkZXl6MEMzV3RPV3F1RWNpM1oyeTZnWW5Dc2xjVkl3T2FvUlNP?=
 =?utf-8?B?V0QxbWhaUmpRaUJuMWo3T2NDK3dCREVzMkpKNmk5VXc1NHBxN09tUS9JVWdt?=
 =?utf-8?B?Y0R1OFNET293eXM5MVRRRENRWlZ3WUhuTkl3aU5ZUjNFVEtDUlpvZ3BSeStq?=
 =?utf-8?B?emoxR0w4T2QwNnJhdjVuOEdxNUpXeHB5TlI2ZWRucERFZW1ERXlYWVczVVkw?=
 =?utf-8?B?Nk5XSEZtRjdIdm5lQ2czb0dyby81cXFEUDZjOHg3clh5SjhFSGhTbjFQNlNw?=
 =?utf-8?B?ZGwxUSthZUo1aVZjYU4zd0xrVkVzU2tnUDkvYmsyWmRnYVhTbXVWeGNEVjhy?=
 =?utf-8?B?N0pNT2VnblJmWnY2eUk0cEwvUEVuclBxMU5QWXNHelE1b1B6dCtUb01TSjJs?=
 =?utf-8?B?eW1taTNZMldJdm1rMERYWVBHZ2E0VVUrUGRrbENqbEJ0aUxMQi9hZGJpaXNV?=
 =?utf-8?Q?yur88o?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 22:01:52.9882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21bc85da-eadc-47cd-0190-08ddc8a2337b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9098

Hi Julien,

Thanks for taking a look.

On 2025-07-21 13:58, Julien Grall wrote:
> Hi Jason,
> 
> On 16/07/2025 22:14, Jason Andryuk wrote:
>> Add a new create domain flag  to indicate if a domain can be the target
>> of hypercalls.  By default all domains can be targetted - subject to any
>> other permission checks.
>>
>> This property is useful in a safety environment to isolate domains for
>> freedom from interference.
> 
> I see the flag is exposed to the toolstack. However, I don't see how you 
> can successfully create a VM if you are not allowed to call hypercalls 
> (for instance to add some memory).

Yes, you are right.  With dom0less/Hyperlaunch, I'd not been considering 
the toolstack.

> I think, at minimum, you would want to allow hypercalls while the domain 
> is created. That said, I wonder if this setup would not be better to 
> describe with XSM?

Re-labeling with Flask would allow different permissions between 
building and running.  domain_unpause would need to be allowed, but that 
doesn't stop a domain.

At first glance, like you say, the untargetable property could be 
enabled when domain creation finishes.

> 
> [...]
> 
>> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
>> index 88a294c5be..f1f6f96bc2 100644
>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -70,9 +70,11 @@ struct xen_domctl_createdomain {
>>   #define XEN_DOMCTL_CDF_trap_unmapped_accesses  (1U << 8)
>>   /* Allow domain to provide device model for multiple other domains */
>>   #define XEN_DOMCTL_CDF_device_model   (1U << 9)
>> +/* Domain cannot be the target of hypercalls */
>> +#define XEN_DOMCTL_CDF_not_hypercall_target   (1U << 10)
>>   /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
>> -#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_device_model
>> +#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_not_hypercall_target
> 
> I am not sure where to comment. But aren't both flags mutually exclusive?

No, XEN_DOMCTL_CDF_device_model is *this* domain providing the device 
model to other domains:

+ * Device model capability allows the use of the dm_op hypercalls to 
provide
+ * the device model emulation (run QEMU) for other domains.  This is a
+ * subset of the Control capability which can be granted to the
+ * Hardware domain for running QEMU.

Whereas XEN_DOMCTL_CDF_not_hypercall_target removes targeting on *this* 
domain.  So the domain with XEN_DOMCTL_CDF_device_model cannot target 
the XEN_DOMCTL_CDF_not_hypercall_target domain.

Regards,
Jason

