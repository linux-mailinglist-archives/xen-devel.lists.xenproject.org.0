Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ACBB0FC9A
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 00:17:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054784.1423417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uehlj-0007NV-IV; Wed, 23 Jul 2025 22:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054784.1423417; Wed, 23 Jul 2025 22:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uehlj-0007L7-FS; Wed, 23 Jul 2025 22:16:59 +0000
Received: by outflank-mailman (input) for mailman id 1054784;
 Wed, 23 Jul 2025 22:16:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3I4v=2E=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uehli-0007L1-0k
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 22:16:58 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2406::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b800512e-6812-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 00:16:46 +0200 (CEST)
Received: from SJ0PR13CA0075.namprd13.prod.outlook.com (2603:10b6:a03:2c4::20)
 by SJ0PR12MB7033.namprd12.prod.outlook.com (2603:10b6:a03:448::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.30; Wed, 23 Jul
 2025 22:16:40 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::14) by SJ0PR13CA0075.outlook.office365.com
 (2603:10b6:a03:2c4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.5 via Frontend Transport; Wed,
 23 Jul 2025 22:16:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 22:16:40 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 17:16:39 -0500
Received: from [172.25.61.180] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Jul 2025 17:16:38 -0500
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
X-Inumbo-ID: b800512e-6812-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVAG/wvT82mGz+7fFcsrAdVfK1Ip5YsddgHmCCs7WfGUp17I3Ok7cWqdwQzL+sNKlwYVFoqcoItW2j7yN0iH1n6sTH2sjwRKmIWG9WC2pfa9Ug+CwYLVHwQE6SuIDTJiIFuRCG/j3MUJeoYskTwPaF8Bb4dZpF1EvYgf1mOana54EtrujaVEOk+y/XaP2cBqgEj8nBYe0GJLOXmCfG+vSSOWQWwGtuau8KXcvPxI/D5wm0y9AdCiK8cDjxLaxF3OQ2W2coeydh08Hee0fKZw06H9RytjrVxFdpisVdLmq+7bs1lcdcVEpt1qee4i5FoPq5ub33uVQZ0JeRAkMLWyIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnSzatGy3c4bqdlkhfTLJhHDYZsHuq7qqo/Yc7eQ3q0=;
 b=tcuk8omk62iwZZI+YXPynYRJOazk9OTBjTUukZ5+BQr3iZJCR8Ax7lFN9f9Txs0zoI0Uji2pTZhqSaHFbE8GE7Jmz21Llcbsv2gny09wTnBDszQBbukPGqgn8FkNzwnI+6cbUntF6wW9B1+Ya8ktegyYkQX2GkrE0SuEV2+hrftfE2gMud56Oi4i9a3D7mK1CPqutwj4/1W+Jg5cb6iyO8+MZpG4uHtTaxRTmgytSAqypZ6gDjhbsEL0fT/9S+hOp57bRj1OzzdHJBqU+JP2bMDnhhswf+VhB47Hce+UcYR/GOFX0b/DrlMaQ1qv5ofEaw5cRJvRATUUc0Go+kh+XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnSzatGy3c4bqdlkhfTLJhHDYZsHuq7qqo/Yc7eQ3q0=;
 b=yoRaNsT8IxqGGM4iylspUfXkvt/Q/Dha8UDOJK3I7lIh+zsfBBOtgajINrey/GHeDRX+1chIrI+iOcTyu19xkY9NShWnhQPzx9Gi307jE62No2Pp99UtxGpvIMnpIAFrjLLHPuLSdHZaujsYQA3+NyAN8c5TC2KllBFzZFusbt0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <256def05-4fcc-4c55-b409-d5ad63ac39d4@amd.com>
Date: Wed, 23 Jul 2025 18:16:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option
To: Jan Beulich <jbeulich@suse.com>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, <xen-devel@lists.xenproject.org>
References: <20250613154847.317979-1-stewart.hildebrand@amd.com>
 <1ab5d13e-f482-42e4-aae2-7276c6ea4654@suse.com>
 <3518a202-c664-4564-b59c-194f954b232e@amd.com>
 <c281035f-f347-4af9-a24e-6d0db6cb3ba0@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <c281035f-f347-4af9-a24e-6d0db6cb3ba0@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|SJ0PR12MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: 29ec9ecc-2db0-4640-d58a-08ddca369926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkVUQ0pHSCtpdEwvSTVaVG9pa1Vhd2d0eFFZWW5mY0E5bFVwaXBacjZrd1N4?=
 =?utf-8?B?bHJMMHNlSlRuK2p5ODJiUVJydFdvL08rcnQ3T2lVSENoT3d3R243cWNMekJi?=
 =?utf-8?B?QUw2dlBhY21RSUd5cE9JRlRwNGhHcit5cjB5eEp6SjdWSnVEeFZlbVREdS9F?=
 =?utf-8?B?ZG4xTStWRGNTT09YK3lML2lzeWhPaTIzdTZBd09KV01OM2h3cVNjaDlkamdT?=
 =?utf-8?B?RDB5cVJoeXVGTm0wOXdLR1FkeDdaNVdTa2Mra28zWXlrT1pwSlFQTy9qbWYz?=
 =?utf-8?B?NVpVWHZsR0JmNmVWd1lIMDJoeWlsRFlPa1BLM2FCNW5DR3paU2NINWlSZjZt?=
 =?utf-8?B?RTlMS2p5NW4xM1I2MFRpdkk1MnpPMlZQbFYrTkgwelFpZFhjV0VIazlDK3M3?=
 =?utf-8?B?anAzT3B4bWpvSk12T2RQSVBoWE1ZdEtsRFBCdlA3R3JpWkNSdUdpUU9CNk1Z?=
 =?utf-8?B?UUhZcTFZNHVjeWI3aFJMWkp0Z1Y5S1pRT29DaHVHamVmY3k0UFlPbzBLbFRQ?=
 =?utf-8?B?YXhDLzRrVUl2ekdKaTdjNCs1TjB0Z0kyaEduK0RQOVJoOE5rYmNYcDhIa3F3?=
 =?utf-8?B?TUNYZndiWXpsVG5ubUNsR2tBa2E1U3FtS21rcnBLNU1GM0FqanpRazl2eUgw?=
 =?utf-8?B?Nk5ydGxsME9mTjkvWm1PQnJDQ2VsbmZCWG9NYWlLTVpoOXRrZHV6Y2JUMEFw?=
 =?utf-8?B?U1RYSFd5WDdRMVlRL085T2l1SmtTVDVxTWR3Z0pja0t6M3B5VWc5cHJnV0ww?=
 =?utf-8?B?SjA2T0ZUMFU1WnQ3RDVkQWdyTDNDUmRHblZqM1prRmhSWklZWElWMm5abFhm?=
 =?utf-8?B?UnYrcUQzbVljRnd1bmNqN0VLVGVLVVgxVE1sRVJXb2pjbzlyeURDZHMycWht?=
 =?utf-8?B?a1NzUWJGWXRORUxSS05OemVVTW1uYXI4M0ZXak1ObUJ5eTc1WldVbzRPNVhP?=
 =?utf-8?B?VjdCd2NLVVd5S2hmck9UaFYzaEtXMmtFc3NQYmplYzlhYWFXeEVkMHRBWFZF?=
 =?utf-8?B?VGtUcDJJV0hIaEE1RmVCVFVSZDROVWMvWVhPZDZsRTFjMTFocGJpc0xQL0h6?=
 =?utf-8?B?T3EyeGY5WWJSVHl0d2psdXRKLzV0b0FSSGJFNjZzZkxHL2FUYytsY2I5bDFI?=
 =?utf-8?B?QzdMZjJkTmswWWNSNm5sQ0FhbDJ5c1FwUE10OEFPUW5NWk9PMXZPU1JKVFNW?=
 =?utf-8?B?OWlvaGlnSTNaSlJ2eHJpSGxNYnhNek5obGxTMTB2Rm5qcnEvekFjRmk4eUNn?=
 =?utf-8?B?Q2FnT2NmRFhKeHhSMkl3bGZTandFN21qMlRSaWJEWXNwT0hVTTByM1NPOXA4?=
 =?utf-8?B?N3c5VUxONm5lT3NJT3NNSGhMaExQNXBxSjN5OXBudjB0Y25iWHMzeEdhSkx6?=
 =?utf-8?B?TlJWNUFrQTR0b1VWeDNCNExsYU1vd2tLTGZLamtYNndVWHZHTmtKMEptZHFm?=
 =?utf-8?B?YzhIRWFKQjBuTVlVbEQ3c05SN1ROSDF2UmZ1VUp0WUNjc0ZHc3BIZm53ODkx?=
 =?utf-8?B?UTlpeEV0UUxSek5Sc3dpL1JyaHRRUWljdXdhOVJEUjF1MFNTSmpRczg2Tmdy?=
 =?utf-8?B?MWNEMGZZVWdZSUQ5NTVaSTdpdXluYng3VnUvemM0eWoweVZmN1FtMEt4YWs3?=
 =?utf-8?B?U1lVV1VNL2t1YkJlektaMkJuakVVb3dSUVk3SEF2OENzR2I3TjQzYURFK2V2?=
 =?utf-8?B?QUtoc2VkZlRVcWVIQVNGOHRDbVk3UktGUk5lQUpqYnB1UjcrZE9PbVhtQ0JQ?=
 =?utf-8?B?TEV4WDZnWW0xbjVtcWhRa2ZmbENKUmE3U2MxM3F4elRrVGpNUDRpZmV4NGNh?=
 =?utf-8?B?OGR4bXlqWWpia3QrSTRGK1RoY2tFV0NNMHMxTXhlbTJpUytOaUZSZ1h3RzU3?=
 =?utf-8?B?N3JvN2NGWGxpZHExV3lqV2k2bU5yTHhvZytpVDNKRGJIWndXWWsvUjBSbjNC?=
 =?utf-8?B?bDl5YzdMeVlteUtSeWtXSVhjaXI2a1BrcUU4Y0hiVGsySU9vMVVYZFlvR0do?=
 =?utf-8?B?REphalI1VWFOdzFobWdYOWZUUUJLdUQvYU1EQ0RxOWduWHEwb3JwZ1kwMlc2?=
 =?utf-8?Q?4+QJF4?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 22:16:40.1549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ec9ecc-2db0-4640-d58a-08ddca369926
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7033

On 7/23/25 10:59, Jan Beulich wrote:
> On 23.07.2025 16:26, Stewart Hildebrand wrote:
>> On 7/23/25 06:18, Jan Beulich wrote:
>>> On 13.06.2025 17:17, Stewart Hildebrand wrote:
>>>> --- a/xen/arch/arm/Kconfig
>>>> +++ b/xen/arch/arm/Kconfig
>>>> @@ -8,6 +8,8 @@ config ARM_64
>>>>  	depends on !ARM_32
>>>>  	select 64BIT
>>>>  	select HAS_FAST_MULTIPLY
>>>> +	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
>>>> +	select HAS_PASSTHROUGH if PCI_PASSTHROUGH
>>>
>>> As I just learned, this change (or maybe it was the "select HAS_PCI"
>>> further down) has exposed the quarantining Kconfig option prompt, which
>>> (aiui) is entirely meaningless on Arm. IOW I think further adjustments
>>> are necessary.
>>
>> Not entirely meaningless - the choice between "none" and "basic" still
>> seems relevant. Just "scratch page" quarantining hasn't been implemented
>> in any of the Arm iommu drivers.
> 
> Is there support for "basic"? For x86, most of the involved code lives
> in the vendor-specific drivers, and I can't find anything related in
> Arm's. Note in particular the hook iommu_quarantine_dev_init() calls,
> which isn't provided by any of the Arm drivers afaict.

Quoting xen/drivers/passthrough/Kconfig IOMMU_QUARANTINE_* help text:

"... basic form, all in-flight DMA will simply be forced to encounter
IOMMU faults."

My understanding of "basic" is that after destruction of a domU with a
PCI device assigned, the PCI device gets assigned to domIO. We have
special casing for ( d == dom_io ) in some instances, but otherwise it
has relatively little to do with the individual iommu drivers. I believe
assigning to domIO should be enough for the Arm iommus to generate
faults, since the iommu identifies the PCI device's DMA via sideband
information (AXI stream ID).

