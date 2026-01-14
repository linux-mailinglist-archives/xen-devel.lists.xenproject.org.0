Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B1BD20327
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 17:24:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203466.1518662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg3fA-0001EW-OF; Wed, 14 Jan 2026 16:24:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203466.1518662; Wed, 14 Jan 2026 16:24:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg3fA-0001Cm-LE; Wed, 14 Jan 2026 16:24:04 +0000
Received: by outflank-mailman (input) for mailman id 1203466;
 Wed, 14 Jan 2026 16:24:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ToIK=7T=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1vg3f9-0001Am-Sc
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 16:24:03 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f91d723-f165-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 17:24:02 +0100 (CET)
Received: from CH2PR12CA0022.namprd12.prod.outlook.com (2603:10b6:610:57::32)
 by CH2PR12MB9541.namprd12.prod.outlook.com (2603:10b6:610:27e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 16:23:54 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::4a) by CH2PR12CA0022.outlook.office365.com
 (2603:10b6:610:57::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Wed,
 14 Jan 2026 16:23:54 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 16:23:54 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 14 Jan
 2026 10:23:54 -0600
Received: from [10.71.192.102] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 14 Jan 2026 10:23:52 -0600
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
X-Inumbo-ID: 6f91d723-f165-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOsQL8OyR77TMhIlHuNAwo4j3V67gXZ/I3EOnIJdQGBMa5AfUUWkT0aZmpEluZBmbilPCiG49wfA3vgt7OSrnwWx33EgrSdZ12C+R3xkkNF9FtZBP8nwhyxpo6SPCuLaEMRt9g3RwKritsq0FG95XzQqXm5I7TccfRQxG5vP/pmdy60GPLpE5HuJWLa4Nig+oM/XREBiul3RyJcNpLHvdBFM1kRwXR58WXfiEE82IQuNJtcezNqfx9speWmQPgtbIBuNHk1aXDXnoaSMwihvqZHkkICjWjVIVsZfS0xQLCsvYYQbfuP0VcnkA8CbFyYWkpvXdz0EDWjZixKTvgXuCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/i3OzvWdzADTxDJBn2pd8jIOa8e2UTJOLnq/8gtzmc=;
 b=iQcYyp//cF8C4IX5wjDDWT+J+Jc8PuImMxNpV+jYSayR04coldio+8L5P8MQRBUFB+BjcCcATzTeLxC1b766zQcqhbgNFySxpf5FgBaJ+aa7/6inNzovVOcjgyhEoLe94u/Us245d/obMHGIhOhDd4faUX565Kz4uSuiyhcl6OHFIbfKCPMy8y9e9eC0x5aDYVKBLF7mexwCdF9o5FDbgMoyNDGIWF5W5nIpm3kXwImu0jXoPckC039NAU8EVyE6p+Mz9lmSjeKp1Q4LZmNz1igB62nMf9Ulttd1du5xsh3RPsrHb/UeQfzCzoSUhGq/thBb5AqPR8A416gisZ+vRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/i3OzvWdzADTxDJBn2pd8jIOa8e2UTJOLnq/8gtzmc=;
 b=TohAPiJExcVyf71yz9a/HUkNPlF2yGdD8xlmVaHW9rxh2fD+QFu0pCQ6K1MDqfySuCjCbuXdWIGz3Ague88JXaMkNdMPiKMYnh4hUs1rXp07IYDTbxr9eTDiQV5lj6PoxaCOAoiXzq2SsvMCH370l/FZpW8sMY/vQ+NCaoPUKUg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <4aaa5eda-36b5-4a4a-85f3-b53fa33cbf3e@amd.com>
Date: Wed, 14 Jan 2026 16:23:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm/mpu: Map domain page in AArch64 MPU systems
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Harry Ramsey <Harry.Ramsey@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Penny Zheng <Penny.Zheng@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <Bertrand.Marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei
 Chen <Wei.Chen@arm.com>
References: <20260114142734.239197-1-harry.ramsey@arm.com>
 <20260114142734.239197-7-harry.ramsey@arm.com>
 <c9330c5d-1cbe-4277-b784-9be86b87f149@amd.com>
 <4EEAE5C4-59C7-4FA2-9B90-764C754420E1@arm.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <4EEAE5C4-59C7-4FA2-9B90-764C754420E1@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|CH2PR12MB9541:EE_
X-MS-Office365-Filtering-Correlation-Id: d17905e4-8d4c-4b33-730b-08de53894fac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzlWa20wb014YUZ4cTJBTUF5Z3UvelhmMlBMbDZhRXFxZnNyL2JBVmVnbGF6?=
 =?utf-8?B?MWg1Y0YxdE5IMVN0c3ROMXlUcUhQZjBERkdtZFFDZkMyUVdnVW4xK1BCWEhT?=
 =?utf-8?B?b3Z6cVUxcEJKVVgzLzEzM1l2OEw0L28zdTI2d1NlZnQrVjFRMFh3dGxmZFJy?=
 =?utf-8?B?VUxTZ2U3a2d1NkRKT3JuT1V3WjAvb0NvM0t4VC82Z2NMMlU2MlIwSmF2R1gx?=
 =?utf-8?B?dGEvWHE4QkNzNzcya1A0MDFwL21qeXF0NWhFSURxeHBvSFQxRzFMMlRIdHh4?=
 =?utf-8?B?MGNDSXd2UnRzMVI3bnJKYXcrcldRRFRpbWhKQWMvaHF3dGNMZWtTY0Jtbnd4?=
 =?utf-8?B?bVExQlVVdFRiVWFVNnkyZHBUY1JWVk5mbDRDNU1GRiszcnBPdzd2S3kzakR4?=
 =?utf-8?B?Vy9FVm52ZGpvSjJxZ0RhTWV3TzczalNVUHN2SWsvZEdzTFNwdzhZN2NoYUQz?=
 =?utf-8?B?c3pyckgrQmQ0K0c1ZzhUZmVIUWRTemp1NTQxMXZON1h6QTlVbHZ2MTZXSDFj?=
 =?utf-8?B?K0NVMDZSY0k2TjM5ajNuazJUNGNGTVU0M1FNWkw2ZmxKRHYwbGE2dUV2Nk5Y?=
 =?utf-8?B?b1JjTlRaN3FsMFA0Y0ZuYVdjZHVIbjJCb1hFMXlDZHYvbkpLV3Y5dzhJRHJV?=
 =?utf-8?B?MG5wVWZsZVQ0aGJQaWZEbWYwTC8zMDd0MnRvMURUZ1NINGM2WVI4S1JMbk1r?=
 =?utf-8?B?eG9ORG5xVjJ0aUxYZ1JidEtQdEVORlZ2QTVoaitQZkZFRUhpalc0U25Zc3NH?=
 =?utf-8?B?V3E0SzBWZDdSOCtWZ1Y3ZkNSWC91YVQzaGo2bUJTZkhTeUdPQzRLaXhSeG9h?=
 =?utf-8?B?U0tYaGd3YWkxS0lZVlhTRDMxY2NYdlVXR0FtcmIzRlg0UG02OHkrOVpWRjI0?=
 =?utf-8?B?MXRQelJpbnJ5angvbXZlakhCOXR4NnRrM2ZpWlp3WXRmOXdTN0w5NFlBYzZB?=
 =?utf-8?B?UitCR3ZkMElkZXVSU0NJU0lEQWhuNHdzNE94RFZLV3FmOFlodytaUjBUUXF2?=
 =?utf-8?B?ZGt4UzJQbVJDWU52NkxYbVo5Vm00UFcxdzhpelh0bEVXcG1rTG1zRHkyaEZo?=
 =?utf-8?B?UzdJSkJubTl0enJhVUxSbW9mSXRRcXROeXF1RFZsWVFrWmlLWlFpdWtTWjJY?=
 =?utf-8?B?Qno4UjdMVGp6RVpqZWFsS1VEaFdEWFZwc3Rka1J1SStNM2R6ZFNvcm9xQm9u?=
 =?utf-8?B?dXNmemJyS2M2MWhSVnFTMWZ4OTZhcGNyaWJjQlpzQWQ4ZzFRaTRxcjhnT1Qy?=
 =?utf-8?B?T0ZpSmEra2Z0ZVd6cUhabFcvL25haDJkb2RPdUhrdzduemR1NE1mK2dZekpv?=
 =?utf-8?B?V1VyZFNJWExYdHIzRU1sS09uOFJGcjJtZEpiSU81cUlJdCt3ZmZYTFM1ZU54?=
 =?utf-8?B?d0lLQXRQM1RqREFRTHlpcmlzMlowKzNYTFNNbml1eFJxRU1mR1hzRlFuMUJp?=
 =?utf-8?B?cjl6NmdsWnVVNHVIcWdTSlNRdGZXOTFLN2N1S2RpdGs1bGt1OCswWmNUeGRE?=
 =?utf-8?B?anZSZU00N1hISmp3S1FyZ0NIMWQ4d2xXc05kRlhILzhjejRSTmZCNmN0UjEy?=
 =?utf-8?B?Vkk5SUZwK2VQb2xTWVhnNnlVVDl4b3dsUmJzMVYzUmo2MzhkdXhOaTQ2NXpr?=
 =?utf-8?B?R2xJYTM3ZzU1WXRmL3BrL2U3Tmxyd3U1M25NMksxVnJFWjBQYjltTVVtVmpY?=
 =?utf-8?B?eHczVGwrSU82TUJsZ3gzcUNjS2tLc0Mvdi8xNjdUMXhNM3NldE1LeWV0QytM?=
 =?utf-8?B?SVZWM0dqMzBIcDJGVW44WFpDWGxqZy9NNWdtUXFOZlJWSzR3dVhIVDlGS3l3?=
 =?utf-8?B?Z3M1c2FLTndsQ1pLS09Oc01Rc2NVV1VqN3VlSjRPVTZkRThhbUNnYVFXaXov?=
 =?utf-8?B?ME1ES3RhM1JJWDdadlRYaFBHckpJZGlQcU5nYklkZ01OejZkS1NRU0syOVd0?=
 =?utf-8?B?b2FYdmZZbi9pUW5wZU1xOGc1OWswSldydlVYTGZnL0tWWmdQVDIycFRHdmJq?=
 =?utf-8?B?L0hqYWZjeHVZQXBKd0RjZEdhVGEzS0hVZEJjSHN3TjJLZkVmL2crN3BzMTdG?=
 =?utf-8?B?Y3VGRzYvY0M2U2xIaXJ3NzVJdm9rM3hsTUVkeEd6UzlyWjJWa1BZdG5rNXRT?=
 =?utf-8?B?amlnd1dBcmExYk95V0xmaEdrR2F5bWdwcTNhd0pOOHNDMm9MWUxiOWJ1MG53?=
 =?utf-8?B?S3krdUxPNmppTHZoekFJZHJvNDFlNHhZT2VIZEw4NlRDaWdFTm0yNVhpWEFy?=
 =?utf-8?B?Q0JsU09Qd05lY0doT0ZiUCtoU0NBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 16:23:54.4707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d17905e4-8d4c-4b33-730b-08de53894fac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9541

Hi Luca,

>
>> On 14 Jan 2026, at 15:55, Halder, Ayan Kumar <ayankuma@amd.com> wrote:
>>
>> Hi Harry,
>>
>> Can we expand this to cover Arm32 as well ? I did some test and both Arm32 and Arm64 get to the same point.
> The only problem is that we don’t have an Arm32 setup to test these, if the maintainer are ok we can do it,
> but then it should be you to test on arm32.

yes, I have the setup and can test the changes for arm32-v8r. You can 
test if it compiles or not.

It saves some time and effort to send another patch for removing 
Kconfig. :-)

- Ayan


