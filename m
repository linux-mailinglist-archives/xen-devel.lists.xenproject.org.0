Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 405DFADAD89
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 12:38:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017129.1394091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR7EF-0007vl-Uy; Mon, 16 Jun 2025 10:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017129.1394091; Mon, 16 Jun 2025 10:38:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR7EF-0007tl-S5; Mon, 16 Jun 2025 10:38:15 +0000
Received: by outflank-mailman (input) for mailman id 1017129;
 Mon, 16 Jun 2025 10:38:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6rkA=Y7=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uR7ED-0007tf-Mc
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 10:38:13 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2417::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe1a31c7-4a9d-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 12:38:09 +0200 (CEST)
Received: from MN2PR16CA0009.namprd16.prod.outlook.com (2603:10b6:208:134::22)
 by SN7PR12MB8789.namprd12.prod.outlook.com (2603:10b6:806:34b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 10:38:03 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:208:134:cafe::13) by MN2PR16CA0009.outlook.office365.com
 (2603:10b6:208:134::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Mon,
 16 Jun 2025 10:38:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 10:38:03 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 05:38:01 -0500
Received: from [172.26.5.4] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 16 Jun 2025 05:38:00 -0500
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
X-Inumbo-ID: fe1a31c7-4a9d-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VeYxcrcTqC4Afuxzj1xH+0eNLocxVikKvs52YVChTSsu2BP22umBs8Fz2AJcwcl/RK4zw3gTDKGY/1GO6nZi1Da59PjwvIv+IagW6sqW61Vuck6g7HglcEx9D8MDvetOkiXlC7SvjVPok//eeraSrlILexNxTpBktQf+I7zxMQX50AM9wvT6KmEcMvxZzKCt6m9Smy6cuhthwAwzofpn8Vs4BdpoXbORPYN5WO3G1+uTLtqkBnJlp/DznoQ7C2WGbcuu9e+UAtntOm0fVArzc0ZAoLbPg/A0268mbxafPJl5qLDkgStv/L12E5jKAQ/ayuaj9iATZN+S/N1hmSS2VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7EmsksXGREpSy7vy4sYjcDMmvpG7ntID6tOBSgLkHf8=;
 b=SUxaLuyqYMNL0Oa3trWjozDa1wtivzbmsmpl6YSHTDE+hKm5vJjhTAR+VK08xOk1kOCmQ1EGjaTnw43lIkwvABmYlJf0C051KkqaCsBhMP65jS7jSw+/hlzI3Z2/DV75ZBujcx8usJ/RfMJxthDZnR7cDPK6/LYibd5J2zQP5oBXnaxyPFRzc/y9zZHxIyirhUZ4jC1vD4j1mKi7pwu/ZXNMPZvw4Cari2OUsvqUlkJfIZb5Wc1O00DGJs+k5/A4gOGfrG0YvZI+MgV4B7gpIvfI8uR53xFLA3nYqDaaNlTZzl43aNvFG9bqkk15ob6wDNKl5t0qoMHVy6bu8d2t3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7EmsksXGREpSy7vy4sYjcDMmvpG7ntID6tOBSgLkHf8=;
 b=kyvR4LTuLgArwPtVj9rWgHlwnE3L7m/8O/qbVMzd0spjZHsGVC9mBd8qN8LeTL8aXMmIYifa2dWbyGuVhso/pMijP4Ht69Xl7yztq230ynEYnE0pvUDIxyRmD+rLVTYLxPAYzPz/NVacoUYkfA6c63v+LGzm23LnBBqJ6c0Pbpo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2e0627fa-35b8-4d3d-a3bc-338f9f7ed61b@amd.com>
Date: Mon, 16 Jun 2025 06:37:55 -0400
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
 <3ecf10e5-5df7-4348-85a1-b8eecb940bf8@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <3ecf10e5-5df7-4348-85a1-b8eecb940bf8@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|SN7PR12MB8789:EE_
X-MS-Office365-Filtering-Correlation-Id: 211d4e9a-3594-423d-c706-08ddacc1df47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UjlPMUV1Q0ZnQ2NnMEk4OXJUSDhkM0N3eTRWaWtVSmVhMHFTSDBsZnpqdkRZ?=
 =?utf-8?B?NjBhRzY2RFBoR25zTkVRSjcvdFRycWpHZDBpN0NVOXRMbkswSFdOZ3VpNVdN?=
 =?utf-8?B?WDQzckV1dTl5UHhRa3V3WVhoSWw4eTVKbENxNUVpQUZsSmxsM0phR2FsMEo1?=
 =?utf-8?B?eXliZUFVZjY5ZDJKRXZvNStURlcyUUNrY3BYcFBQdnJvaXFSL2pNdVAyaE0w?=
 =?utf-8?B?eFFFbHcvSHozdk1ndVJSdkNDK2RPUExvZUhVNnVNUlowNXcrSEtDcEVBYUlC?=
 =?utf-8?B?RUhSemZsL2gzSGVscVFJcW0wN05qSHZrbW1LTWNCVlpxdnZ5aEkraURxUWQ3?=
 =?utf-8?B?TlMzZDJkTEpHSUFQUDFNZGE2SDZhdVFsaXRqcktKMW5ybnFKVmRqRE8xTWFF?=
 =?utf-8?B?VXZHcFpBdlh5OUNtRnppQVRtOEJja3VTaTgvdXFsYUpobGcybndLVTBlK2hC?=
 =?utf-8?B?MGhwTmVkczNOOVVVbTNRY3NmV1BtbUxrSVR2aWZGWjFPSStTY3VGM0JMZ1A2?=
 =?utf-8?B?ekhBNTlLWklhb1gxNFZ5ME5sT3ZkSUltUU9WeGRFaXFQSW9jdG5lbEVqT3B0?=
 =?utf-8?B?TmNZdDRPL3RMYmdjdEpvNVFKVzZxeStkN1dQOFR0bDgyMUVPeXlhQ0JuVXJW?=
 =?utf-8?B?YWMvYTlJTHlQeG44Qmhpd1pIZExjSG5GeVBMVlNITGt3dnpTMUhvMHpHb0ZH?=
 =?utf-8?B?Y2hKcEFnL0N6UW5icWRrNFRDK3lOOERmaVhPUmZMakJNSFh3WW85SU1TN2c3?=
 =?utf-8?B?MEptVTBEd0lMNDVhaFhtd2VOcldETnRWOUd0cEJIdEhKMjkxK1U2YmdjM2Zn?=
 =?utf-8?B?T0dSN05lRnpKamdjaW56UkFFbGRJL3ZFdmV4clVzSkhRNnpXSnlFQzR4NVFY?=
 =?utf-8?B?a3hjVHArZG1obnY0VW9ZdVY2c0pPOXUyVkZ6d3JYSThHTFlDT0ZMcC9BS1l5?=
 =?utf-8?B?MjlWY2dzZjc3V05JckVYK2NhWU4zVk0vQ25qMkN2c1BRNnNqa2U4L1ZzL2ZC?=
 =?utf-8?B?QTFiclhOYlhzY0xlWXBzdnc0UktNVXNETU0ydkpTZzU4ZmZISFBpb0NOV3p6?=
 =?utf-8?B?eGd2d1p5ditaTisxVGFuSmxFSEVvcVQ2bmRLNEQrbm0wanFBOSs3Z1FtRmZn?=
 =?utf-8?B?cGF4YjZxMlZHdkhRdVA2TmplTHpSVm5iZmJqaU5jQzFPTzJPTXU2VW10V1I1?=
 =?utf-8?B?RjVyS1FwMnlIelNKOGl0UG1NM2hGSFJ0MGFKQ1gzdUVoWHpmT1BPdTluMnhB?=
 =?utf-8?B?QjhDbXRBclNSaHFRa0J2VU4wQnFzNzJadTlkTjNUSVJyd3NpOVlodTdCRFlm?=
 =?utf-8?B?N1U1L0NSUmxqcW53a016RXVXK1VpdVJwS0lTcVhITEVMUFU1TitZRjJHcFNk?=
 =?utf-8?B?TGgzTS9hSk1uWjNCV1owMWh0MFp5amFNQUdEdjJOajJVbERaSWtIRFRFeDFH?=
 =?utf-8?B?ME9MZVVFMEpQanpkZkNzTVlmaUhCYW01cW0zUVVlTzlSYUkzRzI0aW4rQWdj?=
 =?utf-8?B?S3dHWHA0UmwzZG9vN2piZ2lBdFYzaXBlWWRVajN1MmJjS1pyeUVsSWVrZlRX?=
 =?utf-8?B?YmZocUtINi84SFdVZnA4MTlhN0c2SDI1SHpCdnlxV205QlBYaUg1T3hZTUlF?=
 =?utf-8?B?Y0syOVlVREtZQVNseGJLb2Q5eHBKekdnRU9YSWliZjgyNk1ZaW1CVVZzd1M5?=
 =?utf-8?B?b0loN2JsaWdrdnUrTjJWa3BBSmdhVStldTlpM3pkZEJnMk5oTzlobVBOY0FP?=
 =?utf-8?B?bHhreExIKy9NQmJmVUlnVWwrUXVIbEpyMm5oZmhpVGxuREkyaXZMY2RUTnpW?=
 =?utf-8?B?UDk4L1hnamlSd1VEaUVOOVBuV3FmS0hlc3Y2aEdrdkN1aHN5ZkFjV0NtaE00?=
 =?utf-8?B?WXlVV1RvQnNPeTMrNXVKY1VTZDc3dkxmM254YXA1ZzcrUVA0QWRGK291Mmc2?=
 =?utf-8?B?cmFVZVVqWnBQYitvUkpURnViY1hCenl5VmNJcHIybXJkZkVaeHZYbkJLOHVv?=
 =?utf-8?B?TDBWSGU0ZnIycGFUVkMrQjNnWUJVa0pmTjNPVmdQT2VpdFdQUUllMFEzZ05P?=
 =?utf-8?Q?THAG7U?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 10:38:03.0732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 211d4e9a-3594-423d-c706-08ddacc1df47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8789

On 6/16/25 02:42, Jan Beulich wrote:
> On 13.06.2025 17:17, Stewart Hildebrand wrote:
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -8,6 +8,8 @@ config ARM_64
>>  	depends on !ARM_32
>>  	select 64BIT
>>  	select HAS_FAST_MULTIPLY
>> +	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
>> +	select HAS_PASSTHROUGH if PCI_PASSTHROUGH
> 
> Seeing this, I like this as little as I liked ...
> 
>> @@ -258,6 +260,12 @@ config PARTIAL_EMULATION
>>  
>>  source "arch/arm/firmware/Kconfig"
>>  
>> +config PCI_PASSTHROUGH
>> +	bool "PCI passthrough" if EXPERT
>> +	depends on ARM_64
> 
> ... the form with the select-s put here. I'll (obviously) leave it to the
> Arm maintainers to judge, but my recommendation would be to simply drop
> this patch. As per the description it's merely "make it easier ...",
> which imo doesn't warrant such an abuse of HAS_*.

"easier" was a poor choice of word. "possible" is more accurate. This
patch addresses a real issue: currently the PCI and vPCI bits can't be
built for Arm, allowing build issues to go unnoticed. E.g. see
4ce671963eb1 ("xen/arm: fix build with HAS_PCI").

