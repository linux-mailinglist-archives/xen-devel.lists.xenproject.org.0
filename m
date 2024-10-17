Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 127A29A3121
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 01:04:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821407.1235212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1ZXd-0002F7-Gx; Thu, 17 Oct 2024 23:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821407.1235212; Thu, 17 Oct 2024 23:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1ZXd-0002Ce-DN; Thu, 17 Oct 2024 23:04:25 +0000
Received: by outflank-mailman (input) for mailman id 821407;
 Thu, 17 Oct 2024 23:04:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QiKY=RN=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1t1ZXc-0002BI-2C
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 23:04:24 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20613.outbound.protection.outlook.com
 [2a01:111:f403:2408::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 248ccf05-8cdc-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 01:04:21 +0200 (CEST)
Received: from BN0PR04CA0038.namprd04.prod.outlook.com (2603:10b6:408:e8::13)
 by IA1PR12MB7712.namprd12.prod.outlook.com (2603:10b6:208:420::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19; Thu, 17 Oct
 2024 23:04:16 +0000
Received: from BN2PEPF000044AB.namprd04.prod.outlook.com
 (2603:10b6:408:e8:cafe::6e) by BN0PR04CA0038.outlook.office365.com
 (2603:10b6:408:e8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21 via Frontend
 Transport; Thu, 17 Oct 2024 23:04:16 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044AB.mail.protection.outlook.com (10.167.243.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Thu, 17 Oct 2024 23:04:16 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 18:04:16 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 18:04:16 -0500
Received: from [172.21.242.153] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Oct 2024 18:04:15 -0500
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
X-Inumbo-ID: 248ccf05-8cdc-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HiMOZ5PTDxenXEEnYxRX7hwh84rs2O/L/EgJiiYgXiTo8EvYnQaOTJtzQIk8/PdMhZ5pjqirISXGEZWXG9S2ski6e94Tl9bdtnLidaYjZ/ybzd5HVUE2wnkwoxE2ft2+7hTp+kc42M0CNSclwcehyZFvwKDMHENuKK9Zv2zgbX1iy2vM9gETL9BxTkSxjyLlSxzTw47jgpHGhZjjeEypoAIHl/eKaql58bbJdF/2055PayzZmmxUV6crPEGQgeWTTbnD0rHejoF1iyCQjIRMM7KDpyF593ha8Pngq/8cgAX+tjy9+B8+AmzrRIf93f7kF1dhQ4PztBDQwZ59WOdbYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEBhXu7pwuYzL0GDWgLRLdHeHtaZlsYoaZNgcZ97nxs=;
 b=ZyfZ6kDiRL5ZsWZUINV+XOWQSAvngUr5ELqRDPgIs30qLYuE292CRNDUf/sbKX8F0Y8LKi279ZOEsuz2iSfx7ctjeXpokhZQ77c2t5FPdHvgpwoJl9h8Cg0Oi0gmsLm6tZkrnrf9FvfXedn03V1OI7R0gEBRcPMQ4jPgHv1xBs8BaU42tjhqCc3wd0eJupJ15iHy8AviUxTLAkF4JJ9RoNfcZYW/Uw3vkFXUO1p3v1dWsvVXZ0rXW+F6jItqqSeEojVqkv+ceGnKVMNCrR66fOQ2ZZj71rg/WyFrHhOHlEE1IBmYUUuh7KamdtG0zMEqpLr6qUXOxQn/RvwSXGkb8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEBhXu7pwuYzL0GDWgLRLdHeHtaZlsYoaZNgcZ97nxs=;
 b=RTyfC3C3PbaPg6JLppl1s7LaklKtmAziuKGrN4bR5DDLGl/9ICARyRconmraaXNqMM4iPE63ug5lQA8oBNe/dvi49VtGhERgq6e9Lq/paQ3yRMLYahYt/39h/WhEAc5g7j+hUMcHM1m5PIDseQDC2oKTiCCFm3s3Pg9QtmkReZw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3701ecb3-0694-4787-9190-ebb93bbaf2c6@amd.com>
Date: Thu, 17 Oct 2024 19:04:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/44] x86/boot: introduce boot module types
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-10-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241017170325.3842-10-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AB:EE_|IA1PR12MB7712:EE_
X-MS-Office365-Filtering-Correlation-Id: f6b86f00-055b-40b4-6941-08dcef000673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c1JwcnhWTzRpdkI0STlpaUQzelBsSkI2eUliY1VTV0M3NkZKTnF6V1VhQlBy?=
 =?utf-8?B?UjJkNWdJcjNWNlVKbmllQkFkeE1mQnJ1UVhtQWpoYS9JRmFJcnJHTFVCNzZD?=
 =?utf-8?B?NE1CUFFyU1FRUjBIUFRvS3c1WTNOLzhkS3hxMnBYaStuZFJiNThLUE4zK3d5?=
 =?utf-8?B?MEEyaHJ5dFh4WElpNzN5RzlJVXBwT0pPYWwvK1dTTnd0OWlFNzE5VVV2ZTlL?=
 =?utf-8?B?cUhjRDFNVzI1eTRacTVjQ1dqWCtyQS93Y1VIRXpjTWJCaW5zSkxjQkxjQ21o?=
 =?utf-8?B?NEs0Z0V5M013QWE0aUEyczRJS2ZkL3MvU0lOQUtJWmJVdlNRd0Q0TENrbHoy?=
 =?utf-8?B?NlExc2NoYlNvRnIydlZNVk9pOVBaQ1RYdHh3VTVSdDh3cktqb2tYK1RneTZI?=
 =?utf-8?B?VXFzNnZCc2JEcXE2V2hxNE83WFhPVW5KY2UxcHYxT3pTNkZ1cDlaVklmTDlU?=
 =?utf-8?B?TTkzS3Q3eFFqdWozUTU1WXRYZno4UWdYVmJqajRXM1FwZFBYZkhnZzRYeGYw?=
 =?utf-8?B?aFhCMzBNVGhZajJ6OGUvL0RUY1huQnRZcWxaL1NsTnVVU2RJclgyM0czWVRQ?=
 =?utf-8?B?UVFQUUU4RFU3cTVaWUNkb0ZaOWJYeFJLU2MwaFJwQW5PSml2TUVoWHdOVFlQ?=
 =?utf-8?B?bzU2Zjdkby9qSkgzSy9qWmYrbVJBTzc4d2hCNXI3WE9kSXcwQmlGTldMQnpQ?=
 =?utf-8?B?bjY2V2diUnY1Ti82ZVVOb2hvQmFTb0JCU1ZjbjVzN0h4aVR2S3Z2QlpXQ1pz?=
 =?utf-8?B?d1JBeE9NWmJuQkh4VFg4dm5SQ0hvVWFIWjBoa0REWTZHY2dleForZXJaUFFo?=
 =?utf-8?B?cWZ2ZlBWY0dRQnh2c0l3UjRxZFBrT0MraWdadmRTQyt3aDhPL29XbWU5QTBW?=
 =?utf-8?B?L3FjVHh6OFR0OVhLOUd0Yms5VjlCcFBJd0IyS0tncnBlTkJwWjltbEpkbFZN?=
 =?utf-8?B?OVJyNG1hOHJsQVhjNGtySHJUL2lEMWJTZDlzdmZJZXBTdWVVRTZoMnM1Rkcw?=
 =?utf-8?B?SjJqTmthbFlHTnRqdEFpOGNsdjRRTkltck1RUHlCampmWlZqWGtTY1NVTERZ?=
 =?utf-8?B?T2ppMzVTTm9SZWlibnVxYW1UZHJzUDE1WDVxNDhRQWhhV2tPYngxejFEVlc0?=
 =?utf-8?B?N2tsS0UvYk9OYm54QVorRFZFU2Yvam5CN3pqV0NtZTFOL2hIQ0ExRFhuMXVa?=
 =?utf-8?B?WnBNZ1lUUHU2UTdDUnJjQ0ZMa2dmaXFPT3NLMDdnODZaNXlKQk5xNy9Uck5D?=
 =?utf-8?B?b0U5S2lBTWlwN2xodlpNcFNZdG5QUjdZaUNCR25BTzZ4bkV1eTQyRXhHdUpM?=
 =?utf-8?B?TU0wMGFadVdJVURnSUhhdnUxeGtLbEh4cVZINGdKbmhQbTNWUkVnTVk5REdS?=
 =?utf-8?B?emlBK0Q3alV4SXppa2VqOHVtWkxCSTI2RUFYRWFRQUtISk1hdmhzYTUvVTcv?=
 =?utf-8?B?Unh6Yng5S3ZrSXBoSEJJV0tUc0NSbnNKQk1DV3RNcDRBdTk2dUtKZGtQeVpl?=
 =?utf-8?B?YUh6dzBham5NOWN5MG5PWjZRRE12VmNHM1JiMGMvU3hzd1pzL1E0Q2orenJw?=
 =?utf-8?B?NmRTWDhQT0hTblljdXptczdIczhCVUxZSzI5bkxsc0F0bWFyOUdXTGpMZzVO?=
 =?utf-8?B?S3VQUHZML3c5d1R1Mk1OVnUrTjhXYUI4aEhSd1RTMnFQVzIxMUNiWFJpWmk4?=
 =?utf-8?B?dXVNQlY2NFZiZnJpN1gxWnBpQ1pkSUE3OXl2M3hnTzF4dXdIV3BkY1dvK2FE?=
 =?utf-8?B?SXprV0ZpRmVueDBEbUM2VHp6YzVJNU1Qblh4c0J3OTV4QjZyUDRWK1NhcnM1?=
 =?utf-8?B?LzVReE5aVFpVTVppYkI5VXo5bVp4QUpRSEtuTWc1UDNQU1EveXpwZU9PekhI?=
 =?utf-8?B?b3B3Q0o3TlNFOEFyendEanp4V05aUSt1L25za3Y5N3l1Ync9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 23:04:16.6408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b86f00-055b-40b4-6941-08dcef000673
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7712

On 2024-10-17 13:02, Daniel P. Smith wrote:
> This commit introduces module types of xen, kernel, and ramdisk to allow boot
> module detect code to tag the purpose of a boot module. This reduces the need
> for hard coded order assumptions and global variables to be used by consumers
> of boot modules, such as domain construction.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

