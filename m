Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F728C5F58
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 05:14:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721892.1125579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s754n-0007WL-8c; Wed, 15 May 2024 03:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721892.1125579; Wed, 15 May 2024 03:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s754n-0007Ts-5e; Wed, 15 May 2024 03:13:09 +0000
Received: by outflank-mailman (input) for mailman id 721892;
 Wed, 15 May 2024 03:13:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3gy8=MS=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s754m-0007Tm-6H
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 03:13:08 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:240a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b4b57cd-1269-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 05:13:05 +0200 (CEST)
Received: from BY3PR05CA0054.namprd05.prod.outlook.com (2603:10b6:a03:39b::29)
 by IA1PR12MB6089.namprd12.prod.outlook.com (2603:10b6:208:3ef::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 03:13:01 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::5b) by BY3PR05CA0054.outlook.office365.com
 (2603:10b6:a03:39b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26 via Frontend
 Transport; Wed, 15 May 2024 03:13:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Wed, 15 May 2024 03:13:01 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 14 May
 2024 22:13:00 -0500
Received: from [172.31.100.92] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 14 May 2024 22:12:59 -0500
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
X-Inumbo-ID: 0b4b57cd-1269-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HimJzIvFx+IWD8/WbgkKOvdMeIZVjNDq6HJALyxZJdegn1O6qH7PDxE27JRK48fxwOSi6xiyUrz6Pl6/qCTqQh32oM+5n7JIpvMuz0yJQ10eDlvjYAC3GlRrVi7e9ydPRRuvK5gG62soTFuZm12Evp+3T/QsCyVzoUWtUYj/HGOw0QtSKfjMo4BT4J43Cjsd8mK3YZBT9PaX7+kPUkvdMaNT8V7q0UZ3RKS+fU7TstY05YzUycRcFznap9/tceNxfJAyv/jKm3P5lUARJWRPLeyyc8ihwu/RPw7sPB5MEhHpB7iYnYWov1FUjrZna9v2eR0D1+1UidU8ibhgibpJfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EU9AFCOBovKvDEZHx/Rj/uksJtoh/0JsrUr2my3g+fc=;
 b=JQJsJGE6FTNFO2FkyQrjYfTxufxVT/vZpVFmxV9S8BuSHrOsQ8RnrlKiOaoKzoBL0iAu8u5KrlXdQnUPCgaeOdIJxJeraqlfh0riOR79Kmn7oqya1VRjy5sgaCxBXCl7HtdvlBuRzFfYdcDM8ldkYZLitunxGDXbqPqgZU/pMGkM+hczBD+Ua4pb2Vx34Y5Sp97GqgXu5UU+DvOU5icuFtfocjurKSPHO92G44+tHaITRFAMOczYZKeRZT5M0cYHiCHagoz0Yb+3dUPpd2AsCW1P+0ZqTbwyr5VzmPtVsfDZhkvo0Y6yNFw9EgBPUa7va707eGC4+b+TxjyinTo8rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EU9AFCOBovKvDEZHx/Rj/uksJtoh/0JsrUr2my3g+fc=;
 b=uzuiHsslRqy5njkw+Wf84pkoebtVPsq1PY7IFdRcHU79SXfSsA9vec1O+I2KEwsQFf/7zU1xkVVsXmqDP4kbg54HK63hw1khuxHoAImKcOyyMPArDxOuzE6URpWESAQYs9M4BXca/Vq7lkzmnB/i1CzrLQ5vZijxu78CA9kBCbU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <32f16048-c1ba-4ebb-a752-a77ed529a99c@amd.com>
Date: Wed, 15 May 2024 11:12:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Proposal to Extend Feature Freeze Deadline
To: Oleksii K. <oleksii.kurochko@gmail.com>, <xen-devel@lists.xenproject.org>
CC: <committers@xenproject.org>, <kelly.choi@cloud.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
References: <a72f75b9edc4255761ff676d6a09a966290a24df.camel@gmail.com>
 <bba91b8b-b1cc-4054-96e8-80a63a3b808a@citrix.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <bba91b8b-b1cc-4054-96e8-80a63a3b808a@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|IA1PR12MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: 1625f1b1-6503-4b49-9a6e-08dc748cede0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|36860700004|82310400017|3613699003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0pjUlNFUTlvOWt5ZW1HSUR5S0hybjg0Q1F3OHo2SGh1SEZ3bjB5SkI0eVVX?=
 =?utf-8?B?eEtzQnFZTDVhNUhIVU55QVlUb0Y3ZTBTcnR4MHorZ1hSUndodk9CZjZrK3pP?=
 =?utf-8?B?QndMRHo2cXRjeHo3RTVSa0QvaGlWNStBbUtCL21Xa09XOGlqaGxQNEp0djdi?=
 =?utf-8?B?MVZsODZ0SlArUTNYcUxib2hscTl1Wms5V2M2VXc2aHRORGtUaG1zanhIVzVs?=
 =?utf-8?B?Q29pZGg1RmxrekRob21oQjA5UDN1V0tEdDlVMDBQM2Yra1ZpUmpzdnlpWmY3?=
 =?utf-8?B?NExHMEttRE5BQlBuS2RuUGxqMWNZTnAxb2UyZXpRT2ZSM0JXMTFFMHczTXB0?=
 =?utf-8?B?WGhqOGZoUmNidktkV21mMFovVnZ2Z2xsditObmFwV3l4UGoxTkg5N1JuWGVt?=
 =?utf-8?B?eWx4WFFNVFhIdHFlR2VjVmxMemRLSkkraHlhMGFKdWF5QUQ1MWlZRndWVmxK?=
 =?utf-8?B?VTY4aE1FNFVNWUo5cVI3eUxQa3MvOEY3SFhJVEY2ODdRWnJVSXBHRXlncFFU?=
 =?utf-8?B?SUZHVnlRL2VTUWVhMFJuWlZVZmVEcjNrODFlMVZRamEyVm5oNmlNbjh4Um13?=
 =?utf-8?B?WVBPNFYvTGJUT0RuTDN3TmtBd2ordTc5QVAzeTI0ZWthY1ZudDZkaEpialJP?=
 =?utf-8?B?b3Uwd2hIVFhhd24rS2s0Z0FZMHJDMUc1UVdTUUEzMjUvRVRJa2JWMFJZUHVl?=
 =?utf-8?B?MFpkVkpQaCtrNHBOVmFDREpocXRaNGpPSjh0N2x0TDhVeU1CbXRDZWMzWkh2?=
 =?utf-8?B?RTBLNU9ZbVZUVGgyVS9KQkUwek1yYUJScGs1OElTYWt2alhpdmlZdk1OOWlG?=
 =?utf-8?B?ZkxSV2NuK05Ka2hwa3hQcVNJQjJxTzVNK1NhcXlkcmVGa056bWZMeWNVc2wy?=
 =?utf-8?B?em13YVBpcTN6Zm1FM0FuTEZUa0pLUEI2NHpKR3NHZEVqRlNFOC9ia2xleGVG?=
 =?utf-8?B?ZCs4V3cxbnFvWU9QVFVmajViQndxdlNmY3ZmWEJUNW5GbmorM1ZHVzY3SEx1?=
 =?utf-8?B?V1JYWndHdytoK3dzSVFENER1NytwZkdiZnVud2FvZTZHUk1aNTQ0WEhqWmI5?=
 =?utf-8?B?TWxSV2JSZWVZUThCenJVclF3MUtGeVlrSHdWeFZoajQ1bW8rbk5HQzBVM3dH?=
 =?utf-8?B?UW8xRkFib3RDRDBVUGdiSXlGUWFHckFBbFVzNXFjMXRIUnVXVnJYMlcralBE?=
 =?utf-8?B?Uk5DNmRKTGtCbStYYXoxRDZBMjR5bzdRdm1kMjB3TjdSTzhKZHJUa25mN3Ji?=
 =?utf-8?B?Zk5rZy95OWk4YmpMMy9MMitmdnhVZUVWR1lpN3Q3T3VWaVQxamNWTzBDTVNM?=
 =?utf-8?B?TVE2L0tTMDRJYkkwR0FTTDFzcDlGMThVZU5NaFg0cWJFeDlsOHJPT1B6Y2Mw?=
 =?utf-8?B?S05qUFluWDNUdXJNYllETXNaSWZOd3paUm5TSUdJUlRmZFNTUE1EeVRSeWxa?=
 =?utf-8?B?QmZkWURkQUVqYUtwWDdDL1hBMjUzT1FYL05ZbmpoRUNuLy9DN1N3cUxLM29Y?=
 =?utf-8?B?eW1iYVZVTWpBd0RzQmwxV3VOVFUrL1BUU3V4TDdsZnNQZjlkREkrNGYwVnlu?=
 =?utf-8?B?L20zclNkeTl3ZC84bWRya2oyVDExTmlXQXBQMit0ZHE4c3d4QVl2NVlzOFl6?=
 =?utf-8?B?ZUlXUFlQWndrc2NWQkJMQ3NyQ1R2dzg2TFp6SmhOc3UvOWV5b0xZSEtCaDZH?=
 =?utf-8?B?ODdHRm9yTjA4dXJKb2cxblFzcXE0SmQ0dnVBWVpzSUhyUXRqMEx1eU9KMFl4?=
 =?utf-8?B?a1ovWW5MM1h2R0REUTdIUVlDRFNCTzh3YTRTN0hCNDYzMHBjRE82b2lwZjND?=
 =?utf-8?Q?17vkkxpcu+NrXsXkMug9oFuj6CMFsEyUhKRic=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017)(3613699003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 03:13:01.3524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1625f1b1-6503-4b49-9a6e-08dc748cede0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6089

Hi Oleksii,

On 5/14/2024 11:43 PM, Andrew Cooper wrote:
> On 14/05/2024 4:40 pm, Oleksii K. wrote:
>> Hello everyone,
>>
>> We're observing fewer merged patches/series across several
>> architectures for the current 4.19 release in comparison to previous
>> release.
>>
>> For example:
>> 1. For Arm, significant features like Cache Coloring and PCI
>> Passthrough won't be fully merged. Thus, it would be beneficial to
>> commit at least the following two patch series:
>> [1]https://lore.kernel.org/xen-devel/20240511005611.83125-1-xin.wang2@amd.com/
>>    
>> [2]https://lore.kernel.org/xen-devel/20240424033449.168398-1-xin.wang2@amd.com/
>>
>> 2. For RISC-V, having the following patch series [3], mostly reviewed
>> with only one blocker [4], would be advantageous (As far as I know,
>> Andrew is planning to update his patch series):
>> [3]https://lore.kernel.org/xen-devel/cover.1713347222.git.oleksii.kurochko@gmail.com/
>> [4]
>> https://patchew.org/Xen/20240313172716.2325427-1-andrew.cooper3@citrix.com/
>>
>> 3. For PPC, it would be beneficial to have [5] merged:
>> [5]
>> https://lore.kernel.org/xen-devel/cover.1712893887.git.sanastasio@raptorengineering.com/
>>
>> Extending the feature freeze deadline by one week, until May 24th,
>> would provide additional time for merges mentioned above. This, in
>> turn, would create space for more features and fixes for x86 and other
>> common elements. If we agree to extend the feature freeze deadline,
>> please feel free to outline what you would like to see in the 4.19
>> release. This will make it easier to track our final goals and
>> determine if they are realistically achievable.
>>
>> I'd like to open the floor for discussion on this proposal. Does it
>> make sense, and would it be useful?
> Considering how many people are blocked on me, I'd welcome a little bit
> longer to get the outstanding series/fixes to land.

It would be great if we can extend the deadline for a week, thank you! I 
will try my best to make progress of the two above-mentioned Arm series.

Kind regards,
Henry

