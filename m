Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C67F9478AF
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 11:47:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771948.1182380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sauJ3-0002pz-Qu; Mon, 05 Aug 2024 09:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771948.1182380; Mon, 05 Aug 2024 09:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sauJ3-0002no-Ng; Mon, 05 Aug 2024 09:47:09 +0000
Received: by outflank-mailman (input) for mailman id 771948;
 Mon, 05 Aug 2024 09:47:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPoy=PE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sauJ1-0002ni-Si
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 09:47:08 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abd949a2-530f-11ef-8776-851b0ebba9a2;
 Mon, 05 Aug 2024 11:47:05 +0200 (CEST)
Received: from BYAPR01CA0070.prod.exchangelabs.com (2603:10b6:a03:94::47) by
 SJ1PR12MB6291.namprd12.prod.outlook.com (2603:10b6:a03:456::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 09:47:01 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:94:cafe::e6) by BYAPR01CA0070.outlook.office365.com
 (2603:10b6:a03:94::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25 via Frontend
 Transport; Mon, 5 Aug 2024 09:47:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 5 Aug 2024 09:47:01 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 Aug
 2024 04:47:00 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 5 Aug 2024 04:46:58 -0500
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
X-Inumbo-ID: abd949a2-530f-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZOIqbavgocNcsvRUKgLRbHjSdisN2u5TYmUva+LThGskQN1KrWRkEAQTarN+0iSwURW45GXApLgw94RXM19ETpo52Eoq3vqZ0BbVcUvp+nuTC2Yqn3PAAaqE6IeOd1tkt2BlJwIuQU/+0BbwkPW/YRyARlOKYKKuXNbrGvjOE1f5tD09KG2ga1HojlvMfOuzbomxdHqbI6/aLslUOjSeKEb/GGhfgKec4UEF7LPXWzepLZgZdDZLGhuFxdSDqx9y/kQt6uMnKZTnqGwZ4AuIDJi4C2GOzg9DvssHBGq8x9sITc6Kwy5Puj3uMhcIkebzOstiakaqZLJowO7HPtcOqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E99LVFsQWeJISOVn+4uedavONNTPguCtZ0S6JTbRGIs=;
 b=cFWz0970H4STx8k+r7O8RFWFm3lgVEtbID2iWULNP9+x7uKF6yOliLM1MUuPPyU3jT23/r30zHKJqTSN29nvRiITQsH39fUr1EQLXdLQwEeo1w12xsB5FPgS0/8GilAkhZL8RNhlJrOS1M9nRvXBsybwfQBlyJdJeIXKRjp8mVcxdIp8uVqDXg4Ho7hF7vnYqbzKbz9riEqm/6HkS0+IB6LZW3SqPnFd/5PF9KjnBg+ozEbEyuv4PpZEZ3Atrmvd9aMi63w1kXABTovavvX9g3gCWXQQ6w+oGqIIMgffp0D3D7hxPG9eBIw4pzgnglaTqPmsEPJF9Io4yLimYcedNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E99LVFsQWeJISOVn+4uedavONNTPguCtZ0S6JTbRGIs=;
 b=mw55oU7GFtR5q/hr0bCM6wuhMDanyfRQBkvBJXxcQ5498yyR74fBZnsjlr96mWt95LZKFGK9dUJ1xdML9BMCcWHdXV1x9tbPY4/YDlOu+TW2zoi0/ttkRJ5OanVhu6I9tSSSsRglZIgXYcFxWagwxTykLOSt3Yq3tcjraNjYNz0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <15c5709f-a81c-4ca4-8851-89938a5a6141@amd.com>
Date: Mon, 5 Aug 2024 11:46:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] docs: Introduce Fusa Requirement and define
 maintainers
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, <artem_mygaiev@epam.com>, <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>
References: <20240802094614.1114227-1-ayan.kumar.halder@amd.com>
 <20240802094614.1114227-2-ayan.kumar.halder@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240802094614.1114227-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|SJ1PR12MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: ae6d3d39-29e9-490d-b1e8-08dcb5338e72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0MvTC80Skh3U1VaOU9HRDVpRUVReG5ZdVJudXkxeWp2NG9FYno0ajVBeWxx?=
 =?utf-8?B?M0VsbjIwU0Rja3lrR3RkWkZCT1hMcjZ5ckc2bUtXMTdIeWNzYngwNlpIRmRL?=
 =?utf-8?B?OExQUHZ1NVVjZEVyMEFHMUR5MXlvZnJEa1NpSVVPcnVQbWFvNW5oZ3lWV0w0?=
 =?utf-8?B?ckY4elNXQ0x6MW1aM1ZRT09WcTA3bWc0UGxzc2UrVnVLUElSL2RMS1oxTHBl?=
 =?utf-8?B?N1EzL0hQRE9xUjRudDFwVEYyeStuUWg4UU04ZE9BY1k4T2hSQ3ZLVzB2Y082?=
 =?utf-8?B?MDJPYkFjVGlTRjUvbTJEVDV6MkwxVUwxNFYyRmRyeElrZVJ2cCtubkRzK2dv?=
 =?utf-8?B?a2xqVU5SWkN5NjJ1RDFRZ0VMT2dLc3BRVUZPMi9qYzZIWTZ2c0JBWktSTEw0?=
 =?utf-8?B?a2JaeW5ZWVlZVStSdzFtLyt4Slc0VUVSOUhBV3lwUEt3SGxveUMzdkdYczdw?=
 =?utf-8?B?SnI4SmQ1ZnJWcUlyNVN3ZTRRRXAyYnJKYnpycEJUeEJvbkd0aHdjU3U0VUhm?=
 =?utf-8?B?cVp2THdBMm4zMWt1OElpRmpNd2R2Z05mRW9UZU9sYnlaZDhOVkNYWDZjdk9R?=
 =?utf-8?B?Sll3Z0NwekdOK05YcWRDUE5vVWRONUJUVFM5dmxENkJjdExXZk9mSFZYdTdm?=
 =?utf-8?B?anEvTTE5VUh4Q09pdGFyQzEzQk1Xb3pYSTM2S1U2SmVBM0xESkg1Wk1kWGww?=
 =?utf-8?B?QjgrVlJISTFmbzhmcWJPSG1CRmU4WnhlMFpsaU03eWdzQ1IyU0IzMTRBT2VV?=
 =?utf-8?B?QWJNaHVvQXliME5UR0RrbVhSTUozckV1Y3Bpb0ExZHBiZEd1SjBERWJoM0hN?=
 =?utf-8?B?NEhmSFZFNkRvbFFwdmp4LzdGaGFScXYxU1pVOWZTMXhKUWJHTnZINmZOZW9R?=
 =?utf-8?B?NCt0aVZWdjdwcDVEL1ZESys1dFo3VStWTXg0VDFUY0RwKzZUYTAxWEVyLzJn?=
 =?utf-8?B?TXBWSWYxL3ZqZmVWTkFCQ1Y2Y2VkeUhhd2d5K0RicnhZS0lhTXI0em9rWm5K?=
 =?utf-8?B?ZW9tRmdXZ1NGTWdkR04wZ1lZYVQ3elgzZ3FlN2FiZUg5S0U4VVhCaFordXNy?=
 =?utf-8?B?Sk1ERnM2Q28zT2dET3ZVYWZqMmE5ekhLUlRPSEQ3Q2JpdGFRMFB5Q044d3k1?=
 =?utf-8?B?Nkw3Y2tjTEYwMjhpK1pJVHhHWWJ1VFZsRDEwVnhKYWczSDBORzJHTHkvQzhH?=
 =?utf-8?B?Z21rWmlZTGxUTC9NWkQ1WExiRnhoZnUxQTJOYWdxa1RyaGJLZTJnYm9paldx?=
 =?utf-8?B?YjlyV1BwZ0FxL0NmR3dtOEttWEdqZ3Z2cTRaeFo5YUFJRFFLZE9tYXZVOCs3?=
 =?utf-8?B?NExnU1VvVlhDbUpxRGtHWFFBT1loalNWQlI1Zyt2cmxpNS9BWHBPR3hLa0Zp?=
 =?utf-8?B?ZlgrSldLWmx0RmpuUXF5NzlNNUtnNkh2dVQrc1RhOTQ2dGwwdFk1aXZIL0FF?=
 =?utf-8?B?bVFnMFVrNmZuaGpKRWR1UlQxMVBJQ1RLT1ZvNTJmMytsMVpMQTlDMEVPMnJw?=
 =?utf-8?B?aFVJcHNRQVlLVStTUElFaC9RS3Y5eWZRSmVrQU9TUWZxMUoxZFhxbjRQN0VG?=
 =?utf-8?B?SzEwZ1BPcFRHa1dwb1RwQ2gzWmoxYXN3VHZlNG5CQnFUcGI0MkExeGxXZ2Vr?=
 =?utf-8?B?K0lnUFJpRCs5WmpiQzJBUXhhSVdnZjlwb2dGMDFtd2dKcjBEa1BCQytoQU9v?=
 =?utf-8?B?WmFJOFE4SzZRRHlPVDZZSFg4Z1pHWnE0ZnN1cFBjWVRFRUovUGJQMXE1ZlpT?=
 =?utf-8?B?SXYrOHoza3FWMVhXRTZpaDNiSjdoR0hMeGcvd1ZrbFJ0RXJnMW1kdnN4VmIr?=
 =?utf-8?B?eFZpcUhyZkRFZFovQThMcG0wempHZC9BdmpUWkFMejR1a1ZhY1NCTUVoY1Fv?=
 =?utf-8?B?WkdBbDZNbDFXaUtud2plZVl3Y1pLd0poUjZqbXVvL3I4aTN5UnY2c1pwTlhN?=
 =?utf-8?Q?l0lGNf77141Nw4mkAquAhqkjkta3AP9C?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 09:47:01.6046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6d3d39-29e9-490d-b1e8-08dcb5338e72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6291

Hi Ayan,

On 02/08/2024 11:46, Ayan Kumar Halder wrote:
> The FUSA folder is expected to contain requirements and other documents
> to enable safety certification of Xen hypervisor.
> Added a README to explain how the requirements are categorized, written
> and their supported status.
> 
> Added maintainers for the same.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes from :-
> 
> v1 - 1. Added a comment from Stefano.
> 2. Added Ack.
> 
>  MAINTAINERS              |  9 +++++
>  docs/fusa/reqs/README.md | 78 ++++++++++++++++++++++++++++++++++++++++
I have 2 questions:
1) Most of our docs are written in RST, same will be true for requirements docs. Any specific reason for using markdown?
2) In the current form of this patch, docs/fusa won't be part of the generated Xen docs. Is this intended? Don't we want to
include it?

Apart from that:
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal

