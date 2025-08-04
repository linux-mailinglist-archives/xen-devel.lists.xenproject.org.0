Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 149FFB1A2B4
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 15:05:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069335.1433209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiusZ-0004a7-Pp; Mon, 04 Aug 2025 13:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069335.1433209; Mon, 04 Aug 2025 13:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiusZ-0004Xd-ML; Mon, 04 Aug 2025 13:05:27 +0000
Received: by outflank-mailman (input) for mailman id 1069335;
 Mon, 04 Aug 2025 13:05:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dY6Z=2Q=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uiusY-0004J4-9Y
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 13:05:26 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20607.outbound.protection.outlook.com
 [2a01:111:f403:2405::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af2f7ae2-7133-11f0-a321-13f23c93f187;
 Mon, 04 Aug 2025 15:05:25 +0200 (CEST)
Received: from BN0PR10CA0018.namprd10.prod.outlook.com (2603:10b6:408:143::29)
 by DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 13:05:20 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:408:143:cafe::cc) by BN0PR10CA0018.outlook.office365.com
 (2603:10b6:408:143::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Mon,
 4 Aug 2025 13:05:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Mon, 4 Aug 2025 13:05:19 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Aug
 2025 08:05:17 -0500
Received: from [10.71.195.192] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 4 Aug 2025 08:05:15 -0500
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
X-Inumbo-ID: af2f7ae2-7133-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jt/+4CkBqZq9PfAvX4KmEU8ADTPulrtVm9w4B60fXn+5SmMYFg+9py1iD3+NqolwWgb+FNdqS9hiu65LJDsuopT1Q9dGgnJmkaErlPnmWktsnmZ6/Y6xiaw6ZocZSB+N/ofac8x4GqLS3DF2YonL7HHES+2GadvLhCPTL6egXBPIY+ZSlw+QuYsCgOeXLAzO0kkvqbR6mfTXcm6JIdt/vTXAUnaNgaWV9R0nEdIL1WtjNBRmFlyzZPHXrNfMSWjiyFV4p2C7ZHpGecCwx6sqw6aOS63Fxy7Sc3Z1XuM8CJfzNDsyb/VSql+w2HyrTL8VwAkEvvtvAQlvjAh9LjHrdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AyqMbx6RF2QMM1kzIOwOrAYT/PCGV3nj+5TDqGDxkGU=;
 b=ZcQ5kiDc7Z4hsFXf4xy4WjcDOJ1aQLfs+hSq7DbiKfNKbv662s6BTZQC+fG7USPvqST0gOmjdP07l7b4DiLEo0WaHfKDkAUvlu3dVAdZYb8IIf98LnnG8P/u6XhoIv+NtNREyIVE1PCHmn/ZPJHRCyyDNYbrvu5Ug9LxFH0o5O4FbM/fldjypYxOMZ9P4c4FwhiiSXYSeCs5tuc4Y2JU3PzYDcrnKkraC/AnYwgFbNB+f3heYHcmRofggdHh+5EFAJlSRqQJP4Ts8UPKiRp1AWqobvv6aZiPcNT6rI1cl66J+v1rFaiHs64yaw3H431e4HQUqUpkguHVDYWoUzgUFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AyqMbx6RF2QMM1kzIOwOrAYT/PCGV3nj+5TDqGDxkGU=;
 b=fCSGto2YTvLMl0wN7uErGf2Io1wibYawYcTqxxTVrlmZCop6ZoiBQr0H5+fCkSIvdscGYsw2SS0tMLTWLpucqzFb8VLD9U0S+UhEcWOb0TQrI+aiZLOrEqdVyCjgkZOT9UJ+ekplQXPYf6xyO28VzRAq3XH1/61Hg8T/AMmYaCM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <4335b725-08fa-4a22-b79b-fb1e22aaa594@amd.com>
Date: Mon, 4 Aug 2025 14:05:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] xen/arm: map static memory on demand
Content-Language: en-GB
To: Hari Limaye <hari.limaye@arm.com>, <xen-devel@lists.xenproject.org>
CC: <luca.fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "Jan Beulich" <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Chen
	<wei.chen@arm.com>
References: <cover.1753864612.git.hari.limaye@arm.com>
 <c85ac9d6da3c13dabd26627faac90ea95feb3f95.1753864612.git.hari.limaye@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <c85ac9d6da3c13dabd26627faac90ea95feb3f95.1753864612.git.hari.limaye@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: ayankuma@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: 58273b03-883f-4f68-2211-08ddd357909a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZityT3lXUmZOa09XeFZtVGZGMlYxS2xlMWNMSDl2T210UmxjWnJ3c0l5YU85?=
 =?utf-8?B?ZjIyOU5NcDNmdUNvb2VwTjNBVWZGZFVSL3RiVlBBSUdLZkYwV2kvZWh3YVFp?=
 =?utf-8?B?a0RlWklRU2MvK0NIVWhBVUg0M3Q3bkdYMU05Mzd1WVMyMFZXMkxKL3A3NmV3?=
 =?utf-8?B?d1AyaFpLYit1YTQ1QnJ4Z2RaSnhQcWFPRnlYMkN0WllZWk1LWW1kYWI5WXNT?=
 =?utf-8?B?cDY2QXJFN25rUDVrd2llcG1DMi9MTlc1WUFCSE94WktHNlh6NThpTGRxQi9x?=
 =?utf-8?B?eWFQMkVaRFRCWW10cFNPdy9RQXMraTNZakpZd0tBeHdwY1N6SFlUWm81ay9U?=
 =?utf-8?B?a1AzUXZUMUZEc1plbHBPZWF6ZVVOS0hjbWR1UmIvVG5SNi8rc0tGOWRxVWsy?=
 =?utf-8?B?K3dhRTU1TzRFREE4ellIdGwrWDRGbWVVbUdSekg1RFh2UXNXVkhvcGhuZXpE?=
 =?utf-8?B?dTFDUE8rMW5MNy9mZ3lWNnhZaWt5RGpRN0ViNndvdmZ4c2sxeGhoY1B6QUtu?=
 =?utf-8?B?Mzc2Y1ljQll3ay9tQXJmb0NIT0dkR0g4U3V0aWkxTDkxZXFmK1FWdHR2ZVBD?=
 =?utf-8?B?R3lpNzBPNXp2STdnQmszbXVsK0lFUkEyOUg5d0RpVHBLSW5WL2Q5UGZEMklX?=
 =?utf-8?B?OThGRzY0YU9XcUthOGh1S0FuNmZSNW1ZcW1vRzBYVlpoZmNwcDlhWHM3QWFt?=
 =?utf-8?B?ZnRDdmFmVWF5WlJ6RkFHbkNSK3ExN1g3MC9KcGlZRmZxeUdZaHY4bWgxY0p1?=
 =?utf-8?B?d2hzSWpEMUkvaXVoMTdtVFJFVUdTZTNnaUNMakpDcE1QRG15ZnRGaWtXbnZt?=
 =?utf-8?B?NGlYK0ZkOTVLOXozSEhKYldBVlpEajdlWWtjWHlERW1EUjB2bFNVZkhxdS9n?=
 =?utf-8?B?bmp1ZVNJNkd1c3pHU3lLbm44R29EN0kxcy9pZEQ4ZmpzbVNhUkFCUzZoc1Ja?=
 =?utf-8?B?VmMvbVRCN0gyMitrMnk5TGJQd21oNUVGT2lFYXNWMWkzMTJFKzVRbjJvT1E4?=
 =?utf-8?B?UjRJc1BCSWRxenZLbTNhYnUra0FrbGMxSlJsMXhBRVd2NDNVMSt3U1laQW5y?=
 =?utf-8?B?cWl2OFBlZkIrU25jdlNlZkZldW1ydnlzQ3VETXpqdVU4S0I0YWEwVDR5VTQ2?=
 =?utf-8?B?VWozMUxMTW54OXRZdTZ5SzJFcDJHek02RFJMdkd1eDlrWk40bklZRGt6MVZN?=
 =?utf-8?B?elVLbEh6cnRQSHVyODFoaDRnaFp4L2ZNYzd6SW83VTBnK29YY0M2cDY3aFFa?=
 =?utf-8?B?QmxKMmFnL2cyTEFXZzZ1V2Nnam1uaXhiY2RuZmI2a0tkYXdYZThLL0UxSW1u?=
 =?utf-8?B?dVhENDVBb2F1S2RXTVZoWEd4QjBSK1lMVHlaVnVDV2J5d2NkaUVOL1FJRTdn?=
 =?utf-8?B?QlhsdG1VVmx1V3d4VmlOM25JZlJxY1Q5N0QxMDVXZi9hQmZvRVl2NmFHMHJo?=
 =?utf-8?B?cDlYMTgwbkM0MXAya3Jka3BtaHg5UTN5d2lTRHMxbE1NU0xnd05PQWR5TWIy?=
 =?utf-8?B?QVorK2VxUk9Fc2Z4NGtFa3A3alV2aHlhQTZPWUc5TjVOMkhraGtmdkxpdzAy?=
 =?utf-8?B?OE8xUVBhL3daVythQksxT3FQMXdrTjJKMWNHMXpEZmR0bk1hcGdIV1hCVEJk?=
 =?utf-8?B?di9XYTFleWMrOVhUNGsxUzFSR2JzSktZTkg0aVZTL0x3YmpjZE53N01JU3Rk?=
 =?utf-8?B?S0lSWTE3bWE3SDk5TGJUWm9YNDBHN3V2UWl3ZG4zaGNWZjhhbnRFcnR6ejNi?=
 =?utf-8?B?Zks0dWJFZFRXMG1MQ0h2ekFMRDIrN2QvdWVKRGtxOW9VMFhHaGYrdU9COUFW?=
 =?utf-8?B?YlVhM0ZoVHN5OXduTEpHMHdXdlE0Zllmdjc5Mk5kMzFWUjVQQmlHaENXNmlX?=
 =?utf-8?B?dnZoOHp1RW93QWNMM1lOOVJYbmNyMTBoT3ptaGhON2JOV0VyQzRpaEsxdlI0?=
 =?utf-8?B?cnFISjJETGh5Y1VvVmNQTm51VHRXSVAyL3V3U2RuTlI3Qk1pdVMxTVdqZm9l?=
 =?utf-8?B?STYvRlVJSGJWdDZiNDNxK0ZsdkJmdFJrZlduZ1BFajFsSWZqS0czaldscXFv?=
 =?utf-8?Q?laz0uG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 13:05:19.7676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58273b03-883f-4f68-2211-08ddd357909a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204

Hi Hari,

On 30/07/2025 09:45, Hari Limaye wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> From: Penny Zheng <Penny.Zheng@arm.com>
>
> In the function `init_staticmem_pages` we need to have mapped static
> memory banks for initialization. Unlike on an MMU system, we cannot map
> the entire RAM on an MPU system as we have a limited number of MPU
> memory regions. To solve this, transiently map the static memory banks
> for initialization.
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Tested-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
(On R82 and R52 with some additional patches)

