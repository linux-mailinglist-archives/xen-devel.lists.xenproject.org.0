Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 283B3995521
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 18:58:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813380.1226300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syDWQ-0003SP-AN; Tue, 08 Oct 2024 16:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813380.1226300; Tue, 08 Oct 2024 16:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syDWQ-0003N4-72; Tue, 08 Oct 2024 16:57:18 +0000
Received: by outflank-mailman (input) for mailman id 813380;
 Tue, 08 Oct 2024 16:57:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syDWO-0003Ex-Ae
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 16:57:16 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20610.outbound.protection.outlook.com
 [2a01:111:f403:2414::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e567248-8596-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 18:57:14 +0200 (CEST)
Received: from BN0PR04CA0148.namprd04.prod.outlook.com (2603:10b6:408:ed::33)
 by CYXPR12MB9388.namprd12.prod.outlook.com (2603:10b6:930:e8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 16:57:07 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:408:ed:cafe::d) by BN0PR04CA0148.outlook.office365.com
 (2603:10b6:408:ed::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Tue, 8 Oct 2024 16:57:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 16:57:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 11:57:06 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 11:57:05 -0500
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
X-Inumbo-ID: 5e567248-8596-11ef-a0bc-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJvkllbSRB1F6gEd9zg1wunjgErZ/Vj7hfEOdtymSNGqVvHHoU+uUhAc4vLX7gT0tLcmLijDM7Qefi6NEK3eW9EYbw8iPr/TWxodP3GO0Tx3FGL/q+G7MBkOP6oVMhxZoDptCrNX3VhqBN4CLAejS+9saDSnmsMACGOg+LFm8jTlix4bBFxO18Y0WDePxGlfUNb9fGPkCAuhKFMDtMMH7spC4ArcURZRh0hbpmpA3qNuHPT1P0QZDQ3kte3hYI55B/AVXFMdWWh3pfE4UALvHB8ccLXejquWiHouSKiUki8kKNQPIyHGMryZuQ1E1rszJ57kQ2Vn5r9gNUmCnhq1xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLs1ZxxgChdgIqfhpynxvq6O8IYDEBTQLTIYpEGmkys=;
 b=c+LUpYV9eSG13FC5C1p+jCMdQ54hDvs6MgP+RzFUVPLYujn3QybcAZ4gPyjHV45YXLjKfbLFgvLlnps1I8ZhIgL/s/q2F5sviiQp6gH64B6UY7F75oNKxjenE9pYp2M48NllEopYcpRqyYgR64LHdy9eIMWIhfi+y+LJ8ikV3+UI5ziQdYHUQ8p3uG410yF2rp7cBMdfdiQwD4pv7KpOf+tjr6glCrATRShkEJ6VRqea430bRDCa9RhwOXsy2wMeN+IuyqFC0wpynysTJQwrbbPUD9jh6vVCXGnppkkXPlSorhk/VtmCzZogMgOIAGaX65NzwOm8jPPkkUIp7XemKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLs1ZxxgChdgIqfhpynxvq6O8IYDEBTQLTIYpEGmkys=;
 b=gojdK3b6G6KBx8nDlywfiBefDtvRvES9KDtdtM49HIjt5pEj/jB0QfIpU9buRAaXNT3kmSD1rzO/pWgS7GBRGI3dhYDOfJyss/UTMQLGW8PUpJVu+31bpg67vRKupYe1ByLvASYU++m2tgq2yA7958vJhMVp281dmOzPTxA4XIo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <79636d14-7aa4-431d-8da3-83afbeafdf85@amd.com>
Date: Tue, 8 Oct 2024 12:57:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 26/44] x86/boot: convert construct_dom0 to use struct
 boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-27-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-27-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|CYXPR12MB9388:EE_
X-MS-Office365-Filtering-Correlation-Id: f140c103-4de5-430d-f4e7-08dce7ba3dc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dFBWMDBxNlY0UU5PNnUyNTFuTExEcWwvbWNudWU5cDR3cjJMSnVLQ1dqWFp0?=
 =?utf-8?B?OFJQSHRyQWNiaitCbTBNdUhRUUhvNVZ3YTdEKys2b29yeTFLbUo3V2V6eXVN?=
 =?utf-8?B?SHJrN29RRlMxUlowemJidlBPZnZWekZHeVN4YlZiT0VGL1B6aWg2K3E1bVZ4?=
 =?utf-8?B?SHUzU3BhUTU0amYyb2NuSjMyKzJoY1BzRUFhZFkxMTRieTJjL081cjYzYzJS?=
 =?utf-8?B?THRyR3dESFdCcDNENHV6MnovTGZGMlNjeDlUeGtoSkNxOHBGSmN0eEYrTUpn?=
 =?utf-8?B?YVU2eUczZ0ZsZG5jODRldW1ETXpzTTBOKzdtQ3RKL0dmR25obHZuWUFqRzlk?=
 =?utf-8?B?RlpITmNBVFBsRjVzdVZ3OWJKMkZUcGZuRWt3RkpHcktpRThnemZBamdDM2dx?=
 =?utf-8?B?aTFRSWR2NVFJeHRLV1d6NTRzVDdyc0FLT3JqckNFZ1VsN3dHb2U5TDNyYzRh?=
 =?utf-8?B?K0FFRFBBY3NaNmZSQUxnNDBQN2VwWEV0dVo3WGhHTHhzcVg0ZEF5OW10Tk5l?=
 =?utf-8?B?SmxFMnZ4UEhhR1pMenA3UllWUzJnbER5VkdHYll1dmdaVXhRVDBjZmhKcUls?=
 =?utf-8?B?WXVKZ24wbGdydFhoS0xzODFFZm5odG01cFMwRXBXKzMvUHhBWmNLWVliYjhT?=
 =?utf-8?B?WVlEa05OMTA5OFdqOVNTdUlFcElEMnB1ZFhZWDFSakFhdmp3am5RVlZIVFY2?=
 =?utf-8?B?OGYreHJ0THJKbmdtcUdtVzc3NGpWZHVUbzlCL1pPdjFEaHZoQ25UdU00SzNu?=
 =?utf-8?B?UnpOWjBObFZFSng1QjRaMCt3ejJSdHIydFZEOWxqNUloWDI5ZmtseGpma0Zl?=
 =?utf-8?B?N21YcXlKbmxzd3pRQlF0VC9UMFBjQTNPTGQyM0N5MHdLM1gzMFk1RFE2OXBt?=
 =?utf-8?B?c1Ric0U5eDhwUmZOcXF2YVd5bHYxWEo2eWtnakpQMEMwSGVqTlA0UW01Mlc0?=
 =?utf-8?B?bHpJK1NmdTl4UXdBL1M3cjJ5RE5zT2ZVUHJTV3h6TW43TTVFM09IeGczaWxv?=
 =?utf-8?B?QlNBM2g4VWwxTUFhL1NIaWQvbXY1RllTelBVRktpWHFFalZWcjBodFZBWWh3?=
 =?utf-8?B?NHd4L0xPdzRCQUxYUVJqOXE2bEtiWGJSNlZkaWM5NVMvYXdnYWl6bVk1Mm9T?=
 =?utf-8?B?NllkdXRBWE9UaUJPRG9ZUmdZcC9oZVJqVy9BYm5RQWhlTHRSVkdrMys5dC8r?=
 =?utf-8?B?NWYrQ2VMd0w4QXVvcFhYVG1MZ3ZLbXBTZHRPV00yTHBpdFVxNnphQWRNNzNv?=
 =?utf-8?B?cEpNeXRLK2pWSUcyVk1VRGs5Wkd6bGY1VitCRDRNeTQwdUNaNytPTEw0anNt?=
 =?utf-8?B?NUpiWlVTL0ZLcC9TVjV5ZlJDanJHd0dKaU1MbFdlUmNBM09pSC9iRWd0MGRm?=
 =?utf-8?B?eWptb0F0VWR2VUJUSmZ0RlZDR3pxdG1BdHVDVnlpVjhTN3NXdklCdk5Rd2pq?=
 =?utf-8?B?a1lzeU05V1ZBeGtVbjRDSS9yNlUycnl5SnFJMTBjVGZQRklXVmQ3YTd6b2tw?=
 =?utf-8?B?K25uZ280MmdaNmVzYTFWM2o1U1FlaC9WbzJTeWNlU1VJODRBRklIbmo0aHNK?=
 =?utf-8?B?dCtManVMRjdlS2VrcHlJb1VYNzhtMFIvUUJJSWcvS21iKzVtdE1HQm5XLzFy?=
 =?utf-8?B?NE5OT0JkcjVuUTd6aXVkRmxRZ3dhZnRmYldONHB5ZHdiN2VSS1lVYXMxNDN2?=
 =?utf-8?B?REVJeGQzeElJaHBWZVlXL1Z3Qlc3RFU2MG0zQXhjQkVOT1k3MnFJRVYrWUFX?=
 =?utf-8?B?V05LWGZZUi9FUTdpN2dubEp3MVBzaEdNQ0tGV2JVUXhzUlV3ek9SdFgzVU5r?=
 =?utf-8?Q?QNYjqPlMV/k/3auyQ6lr5I/1KjUEB5xADN9ls=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 16:57:06.5656
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f140c103-4de5-430d-f4e7-08dce7ba3dc8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9388

On 2024-10-06 17:49, Daniel P. Smith wrote:
> The construct_dom0 function is converted to consume struct boot_module
> instances for the kernel and ramdisk. With this change, it is no longer
> necessary for the internal use of struct mod by create_dom0, so they are
> changed to struct boot_module.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

