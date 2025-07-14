Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E91EB049A2
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 23:40:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043104.1413220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubQui-0000OE-1S; Mon, 14 Jul 2025 21:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043104.1413220; Mon, 14 Jul 2025 21:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubQuh-0000Mk-Ud; Mon, 14 Jul 2025 21:40:43 +0000
Received: by outflank-mailman (input) for mailman id 1043104;
 Mon, 14 Jul 2025 21:40:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jbYV=Z3=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ubQoB-0005Nd-93
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 21:33:59 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20618.outbound.protection.outlook.com
 [2a01:111:f403:2417::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f8aac11-60fa-11f0-a319-13f23c93f187;
 Mon, 14 Jul 2025 23:33:58 +0200 (CEST)
Received: from DM6PR02CA0044.namprd02.prod.outlook.com (2603:10b6:5:177::21)
 by SA0PR12MB4351.namprd12.prod.outlook.com (2603:10b6:806:71::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Mon, 14 Jul
 2025 21:33:53 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:5:177:cafe::ec) by DM6PR02CA0044.outlook.office365.com
 (2603:10b6:5:177::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.33 via Frontend Transport; Mon,
 14 Jul 2025 21:33:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Mon, 14 Jul 2025 21:33:52 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Jul
 2025 16:33:51 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 14 Jul 2025 16:33:51 -0500
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
X-Inumbo-ID: 3f8aac11-60fa-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPcIVCD1Rlcs7eR+/TENb4pZhCrY9jG63j6EoTKBSgW1VAXgD8IK1x9QIKQkCHlmKV6SCNoXtarjhM6qhZM1hBX/zvM5d3KgquLSvSAn2iIG14xKOSs2dwhmABdUntzt/WSX1kAd5MPyEGDDFBDxhOLze64sW1lkdv7BC/R4oquYDiGglQYX7QcAif9XUyLhqrpcx+Yf9sEvqzwvPgeVyDYNcrz6/Yu94zcE+md6kCjjKa2UOuujzEbDtDNVvpbzisKSxLppv8OcTn8lpvPDe5dIFAPgLgdxruIEa88etxrBeOepgM+Cv3pgdrAYV3fetJYfCu8j8NjNzlx58aMyFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fhb6jkA8a4GKeuPxLBtl8dfxDJjRrYC5eU7jrqxtD3g=;
 b=IX/T8o5R0FPbk7PaI6vojWIvogBfhCur7ClhiOZneIQQfbRnv/oGpSNjNSb2CseoUMfcYzUw/qt68b0zM0bpwtflyAu8nclEb4hLPjH3GN1ae5j4Flx1lCsrZiJryBoM7eFEO2brF8nyK+uNeR8Gg7S48Ypm2MYrvB4c92DIC6nycTXxMSGU1ycZJwF95jZe0iVLttCakPZ+1enyMQObZoirLqcstgukE86+fTZke1hiJY78CXsFfk/m0M46ehz5okX3b4DqgF0XPFHWveNobxXlugjcRfKxIqxdp6Nuh10fyWjQ+qkS/MNLbiwZXak2gryUSgZnmwUlGLOUvGViTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fhb6jkA8a4GKeuPxLBtl8dfxDJjRrYC5eU7jrqxtD3g=;
 b=yuxu/GlJrF8sXTe1H1vGjAYwJEOkOArKTSSLI3GNyhZU+wen32Ww8RQ0dPkR21xJeffA0L7jNklSplm4ydAghxwMlFTd8MLDtVSm8GBJvvSK4lCONJ69ch+7XUN4ooJafLiZZ0s8Buai7vwYEiJK6wlmsPnEUy+UpnmfB0INMIU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <130ed882-13da-4413-a5af-829d5d30d091@amd.com>
Date: Mon, 14 Jul 2025 17:23:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [MINI-OS PATCH 17/19] gnttab: add function to obtain memory
 address from grantref
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-18-jgross@suse.com>
Content-Language: en-US
In-Reply-To: <20250702081254.14383-18-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|SA0PR12MB4351:EE_
X-MS-Office365-Filtering-Correlation-Id: f2381622-dd6d-4743-130a-08ddc31e20f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWJtcU5BSHZnUlNmak9JYVBLMjRCR2Z4Zkt4d3JYUVhxOStEVk4zRDJnc1Q5?=
 =?utf-8?B?RWtiOUNkMmtPRDNNaUVLUGp0OFRudWNwNFZXbExMdWtSaWxMUGs5L0VOdkll?=
 =?utf-8?B?R0tHUGk0MTZMdEtROFcyU2FtODRybVFuY3pTYm9JVnUwL0R4WjRXeitJQjlt?=
 =?utf-8?B?dE96bEdpU3p4OEliYzhnYlFkY21KOUx5UXdQdE5taEFIclQ2aE5pVnZXMlYv?=
 =?utf-8?B?T0pIUUpodFFrTlJ2a05DSVNFV3Y0TUUycTBrc3o4Yngyam5hbFlYK0w4b1ZM?=
 =?utf-8?B?ZFZJN05GTkk1ZVFBMmloUFhGRjZPeWFvMjl5cUFDdEFzaHVaK05PYTFHYVlw?=
 =?utf-8?B?Q2NObjF4MFJPSVcrSkkrcHlzOUVyKzdGVlFxRk5rMk1vK1RFejdYbHppSjFF?=
 =?utf-8?B?VFJMTllXUmdhVks1RGNpQjRjcU9JakpzeTdueC9vcVZnYjZEVjJDUC9uV1M4?=
 =?utf-8?B?ZDFXVWk3ZE1kUTAxT282TGNTZWxZS0ZxdlVGVktoSVR3WWcraFYvZ1JxSmNW?=
 =?utf-8?B?QnNLcitOVUZxZWJOT29MY3laU2Z6WmFaNjRnamNIRU9McEtDQktPclNnQ0hn?=
 =?utf-8?B?VkZNMnhFbXZsRFVrdnZXTWFIa1pFMTZUYndkUnl2NDJ6enROM2dCZVluaEE5?=
 =?utf-8?B?OTJDazdtOEVhc1c5MjlnS2F1MUM4TGpOSWhmVEMxWjVkVnk4N01ic0F2b1J4?=
 =?utf-8?B?ZjRJVnBMT1B6KytVL3pGemU1L3ZibkZTbFhYK1ZUMW5oeW0zVFpZSEJhYmIy?=
 =?utf-8?B?THhtdnBQUTZNMk9GdytHZXBTZmR5cFJ2SDhkTjQyeTV0Nmt6YTFOTXRyM0Vu?=
 =?utf-8?B?a1dCR0JaQ3MvNHk2VVNuQlhZYkhld2hJMmVURWlVZWxFMkdFeTFoTk8vMTVC?=
 =?utf-8?B?cXhOL2g5RjRIYjdKMVdMdDBuUzErTlJDMHlYQkI0b0t3Yi94TjRVZmNTZThR?=
 =?utf-8?B?R0t4Smd3bWNOQTJaMm5WakpGa0pOWDU4dmlvL3poekQvTGFQeXlRbHd2TnFr?=
 =?utf-8?B?NWtLbUpmcVZERGFUYThEKzJxZ3VzUXhza0J6VWtJRFBIaHN4SlljUnFiVmEx?=
 =?utf-8?B?L0k5V29FMEhER0dCQjRtWk1peVlkekdSVUtqSStiTE5GVzVTbXRlOTZaQUR0?=
 =?utf-8?B?aDFEVkdpSWV1VWJGc3ZkYWRKN3BTeDdjU1dKWnMyMGRWVXEvUTRMK3F5NzJV?=
 =?utf-8?B?MFA1anowUXptMkNWNTZMODNjOUJPdFlNK1l0YVFRaEhSMERYVEF5MkpQei9w?=
 =?utf-8?B?cXlZR3RqK3hZdFdpUkl0S0ZxbS9IOWloUXlIdWwzcVJPTXBQWTRyTTVjR1F5?=
 =?utf-8?B?OHVveXpJY09sTFV4MU0zdjd5K3pCMUpUSUFxRDFoOHBCSjhTZEk1TDRua3RF?=
 =?utf-8?B?eU50aGFNYk92cEZaMy9qYnJ6SFU4T2NTRnVUYWNLbUZpenc0Nnc2VDZYVVNB?=
 =?utf-8?B?ekZUSTNDbS90elFwN1ROejFzcnUrTXoyWHNxYnhCMm9RSWg5V0xXWU52Z0ZT?=
 =?utf-8?B?dTFTakI5U0lENXlEYzBVYmdWM2NSRnBUNnBRSFV2UmovbCtQK09mNnlMc2w0?=
 =?utf-8?B?K1FTKy9WYUN3QTJONURRUmVlKzJQL0NkVEkvenBsUndBZUpMWldSNXpIRWtO?=
 =?utf-8?B?aU9aVFZCVTdNVEFlSWNnZWxqR1RHSjN1c214cTZlWlZMSTN2ZFV5VzRKTnNv?=
 =?utf-8?B?ejkydTd5U3lDUWo4amFRS2RYYy8vRVJYRWFBaDNWZzk5VTZzenBmZzZiZE1w?=
 =?utf-8?B?YVRUMnV3RnRLWC9Rb2p3UnNMa0FLRkNRcnJPK2xxd1dhNEtzK3NNRkRCc3lm?=
 =?utf-8?B?NDRadHZUUU5YeUg4YnBqbmtadzRVNW1BVCt5TGNmYUZRZ0xQVTVaNlJBRnUr?=
 =?utf-8?B?QW1lOHFTMzBkNmhCeHhjWkdCY2FGZHdrNFNCUklNZzRJcEdIOWZNNFVtOURH?=
 =?utf-8?B?ZTRkQ2RrVDFvcHc0V0ExbzdySjN1TnR5RkUrdEx0c2YrVzY1aXBqdHBWVUZ5?=
 =?utf-8?B?ZktFSTFZRDhGVm01NGh0V0RYblAzK3crdWx0WkFqQ1ZNYVc0cGQ1ZDczZjlp?=
 =?utf-8?Q?LUjz17?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 21:33:52.5293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2381622-dd6d-4743-130a-08ddc31e20f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4351

On 2025-07-02 04:12, Juergen Gross wrote:
> Add a new function gnttab_get_addr() to obtain a memory pointer for a
> given grant reference.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Maybe you want to name it gnttab_get_vaddr() to be a little more 
explicit in its return value?  Either way:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

