Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED01CE6685
	for <lists+xen-devel@lfdr.de>; Mon, 29 Dec 2025 11:51:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193962.1512469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaApk-0006Ry-3d; Mon, 29 Dec 2025 10:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193962.1512469; Mon, 29 Dec 2025 10:50:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaApj-0006Pc-WA; Mon, 29 Dec 2025 10:50:39 +0000
Received: by outflank-mailman (input) for mailman id 1193962;
 Mon, 29 Dec 2025 10:50:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rHFx=7D=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vaApi-0006PW-0z
 for xen-devel@lists.xenproject.org; Mon, 29 Dec 2025 10:50:38 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33d20d45-e4a4-11f0-9ccf-f158ae23cfc8;
 Mon, 29 Dec 2025 11:50:35 +0100 (CET)
Received: from CH0P221CA0042.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::26)
 by PH7PR12MB5595.namprd12.prod.outlook.com (2603:10b6:510:135::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 10:50:31 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::40) by CH0P221CA0042.outlook.office365.com
 (2603:10b6:610:11d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 29 Dec 2025 10:50:26 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Mon, 29 Dec 2025 10:50:30 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 29 Dec
 2025 04:50:30 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 29 Dec 2025 02:50:28 -0800
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
X-Inumbo-ID: 33d20d45-e4a4-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rLs/j8NvX8Ta+GX+gVbH4gAgRvmIl0YpDm/XwDWPbsF0OO6hbxVl/fOOMc3nq8EL/+Ev4DIh2Y/Pb4kjOVeDdOVJ4ARiKkhCSfIfmaWo/C5g5FkDe05wk0sgo4t4dOXdPo+ISYXcIHVeopJZHl/vJDPWMQL8qnDckp0z6MUDBfVXPLN0bibL+rwc8tMfm9YIOLTCDdXgwuoQxm8MDRzQWC+1+HmB3yLZuUUkke71Asnkmsi5AXcCJRWxKpJgxtnX1Aiz1VT/MqjpROb6UH+5nBrUiRC/hBcI4dT6bihuDBdbHjOl+iXrLypioIZV1PgnvSjnQYsWR8N3858BfdygUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxNag1C1nXyceWhu4QJM6GmgLPpj66DrvEE6xLUTqYo=;
 b=Ab0w7nyB3/T4hMd3K4dE0mNVrXVDCW1q59olc+sWShpKphot60GPutJ8wgUwUn0IxPaCQYlONbed21FAEDmYBh4Dupv7vlV42aoiELFgrFWkufkgT6mZh1jJX8Da7msnUXT20qo99/n3GDrRkIvyo0XMZ2x410Asn7yZvip7XUaDwxxzzWDGz/dp4BBCL8kzvPxL50zswKv0Jb0lmVTnWyJOr3ABt2leCXN4VXxd6cE8qTYuMndFrZBkV4AoXkz0FDA4LFrtbFl2T2sUioL5exVcxj7FBDY3Dkvrv368iEgbc7eqlwEP6w3XFuEWxAJ+gIN/BcL8ZLyp+Sylrkc/Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SxNag1C1nXyceWhu4QJM6GmgLPpj66DrvEE6xLUTqYo=;
 b=nQv/KB9suJV3a0a1WfN6WAyhb5LdNuiviiVdnHae2f47saifVS1iuEL0qLtVwvOWleo6VIcHFVwFOzk0WAlznUW4ME/KuvDbGUYrjUPkrU5J3cR2K3eSt9vjDnsfB73PA4mi+DvIMm1cyFvK7Omltju3AKCWO3mgSzmboX5uguY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <4c09cc87-307e-440d-9a1d-7ef2313ae466@amd.com>
Date: Mon, 29 Dec 2025 11:50:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] xen/arm: vcpu_vgic_free() updates
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
References: <cover.1766504313.git.oleksii.kurochko@gmail.com>
 <ca86bf36375d19555961225f214b9d23557b0d3a.1766504313.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <ca86bf36375d19555961225f214b9d23557b0d3a.1766504313.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|PH7PR12MB5595:EE_
X-MS-Office365-Filtering-Correlation-Id: 10ffc10f-8e3f-4664-94ba-08de46c815ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2NudVJReit6MWpTbmtuM2JlZmVmTHIwUFltRldzZ2tzK3RodG8yMy85TTNE?=
 =?utf-8?B?TmdLd2lsQmpRQUhONWg4T0kwWTRRS0RFOUZuZS81MmIrVW9JVkV6TlRSL0xJ?=
 =?utf-8?B?bzNZNm1nSkRnVWE5R2lSKzVzRU9MeElkUWF3REFlNk5ML0k5U1NoYVVGU29m?=
 =?utf-8?B?cWZkV1pNaVJLb2JFVHpadENGbFQ0eTdMcVhsNHNuazNrNy9LVzdmY0NaeFFU?=
 =?utf-8?B?S1RGelF0TUpRTmZxUllGcGV0UmVsRmhpWEdaSUpZc2hyOWNWQkFmUFkrQUpr?=
 =?utf-8?B?bGJkZE1NU0xYVnh6SUdBQnZEd1Y1ZGZ6Y1Fxa3RtTCtSMnNJM3oxTkJkbUtF?=
 =?utf-8?B?VVF4SGxUQkVSQUd6dU9vaEozdVVsZ2xxRThtZ2l0U3FNeCtGWW9BaWlydHhn?=
 =?utf-8?B?T3NaVjRqbU13MU5jaHNUNngwSjVyaGFqL0FuMW95MWF6V1hqdS9XelZtS1RD?=
 =?utf-8?B?VVdJTGo5RDlxWWhicTJHOUd6Z2dWenlOdzBrSkJPcDJHblBSY2RaOG0rZG9o?=
 =?utf-8?B?VUJVY1dkNFpEbmhVWUxsSTZVR0NOWVNtL0s2MGdpUFFabFRQMENUZ2V5bjFz?=
 =?utf-8?B?clNtUHNWWVRXV2V5bzc3dHpmZkdLTkcvaStNTnBkNTdUQmFzc0c5dURYMElB?=
 =?utf-8?B?YmNtaTlrZUpDS3hGQW1yTHJZRlB0Y1VTdEthT0g1S2JEV3ZnZUlFMXVDMWNN?=
 =?utf-8?B?dElwZjdwVFppY2pPNkg3OXVOQzIvekFIdng0a3kyUWNEUVZNVGpMWkR2NGx2?=
 =?utf-8?B?dU5TdTIrQ0lLc2crbWtYa0dQWGxwUEdXUU9SUmhGc25OelZoVWxiVG03Sy9G?=
 =?utf-8?B?NzhhS0grQUVzUW80eGN5eG9vVjVSbnV1aW5Fd0NvOTF6d0VtMmorQVY4UVV5?=
 =?utf-8?B?REo3dGZGUVlwUGdkSHJZeVJGR280L0xyd1lueVBoQW1JZ0lZcnR2bEk0N0Q1?=
 =?utf-8?B?THViK3l6bXo5T2JEdUhrSjM0N2Y1K1UxZk1sVXVPM1BieGZ1RWN4N1pJVlNL?=
 =?utf-8?B?cDJtV0tHajJXSEMrbnQ5K3ZEQWlGYitqUXJaMzhvMUVuL2o4T3F0N1h3NUxJ?=
 =?utf-8?B?VUNteUFqSHlneUFVMEdQN0FLK2NEbXo2Rk4wdVlLNkJVZVRtWUpMNkZLcTB6?=
 =?utf-8?B?cGVHTVFEMUdLRDlPK3R2YW54aDlQdXREUHdGU202bEtpcnBFc3lrSTFNdDVN?=
 =?utf-8?B?eElLQmd4K2NUa1MxZ2xPamJxUytJYUZWeitGK3BRNGVaQVZGNWNsSkJxWGc4?=
 =?utf-8?B?Si85VXRDdk9EV1RiZllvMjRiUXVJOTdNUVB3aC9wMGtJRUhoS1c5Tm5FZksy?=
 =?utf-8?B?Tk1jQmVnVHhRWDllTW9qZUlkTVFUQ2hYN0JzbnR3d2dyd2N6Zk1MUzJ2Ulkr?=
 =?utf-8?B?NFRhWS8xb2pUWXE2M3RZM3liWE5TSEcvaVRLQWR6VVE2azMxd2xXeUhNMDdW?=
 =?utf-8?B?V0lRdkQzODJXbW8wR2JIU3V1R3paUzI4MlNoQ010TnFSM3pCRE4rSUU4bTNt?=
 =?utf-8?B?M1JKZ1AxbXl5blQrNy9ibHBXVFVxL296N2FJQUxqSzkvSkhkd1hzQ1B6ZnpQ?=
 =?utf-8?B?WXR4RWpCaUZVUzlSLzRBUDlyNyt6QjFQa3RTZnRMNW9mU2hmMEoybm9GNE5h?=
 =?utf-8?B?NENuM1VBVTBKVGxiaXFnQzUwVU1DTE1kN3k0Y1M0cnN2STNiYmpBcWFEVHNw?=
 =?utf-8?B?SkVrb28yaDFaS203Ky83WkFvT1pKdzFtc2pzTS84SjhxajJmVzFnS2o2WFlW?=
 =?utf-8?B?OHhsaGhRQVF4dVREV3lYaldUQTd3ZE5ZbXFwNEFNYjdCbHV5cm5ibUJoVGlU?=
 =?utf-8?B?RzVMM2NlQWNJRVpCTEp3VzlGaFh1V3JhRngxSXA4WkNZNzY5eXlsbitPK3lX?=
 =?utf-8?B?OWZhTG83SStlaXZ1cndGV3NWc3lZWmRhY1JlZExJdHVqcjQzMnNNZEIyeDFW?=
 =?utf-8?B?cXp0UTRKQjdNeUQ5VXJJZDM0VmFHUjk4a2RPS0lWbVQ5dmNJQnFRdkxKTjha?=
 =?utf-8?B?WGx1SjNQVUxhL0g3L0pkdXNKb0Zydzcwak9hUWtYd1o5aVVuMVdmMHJQWTdE?=
 =?utf-8?B?ZkZ0MUpGRWR3Z2lweGtLOFBuQW44N3M1em5Ia0RydTROT1YzL0l2RjFCN2NX?=
 =?utf-8?Q?1s8Q=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 10:50:30.7476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10ffc10f-8e3f-4664-94ba-08de46c815ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5595



On 23/12/2025 18:01, Oleksii Kurochko wrote:
> Use XFREE() instead of xfree() so that vcpu_vgic_free() can be idempotent.
> With XFREE(), vgic_vcpu->private_irqs is set to NULL, so calling
> vcpu_vgic_free() a second time is not an issue.
Usually it would be beneficial to back such statement with an example of a
situation where this is or will be the issue.

> 
> Update the prototype of vcpu_vgic_free() to return void to satisfy MISRA
> Rule 17.7, since the return value of vcpu_vgic_free() is not used by any
> callers.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


