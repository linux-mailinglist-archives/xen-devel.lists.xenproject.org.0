Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 811ECA5E24F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 18:10:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910586.1317266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsPb1-0007Ds-S1; Wed, 12 Mar 2025 17:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910586.1317266; Wed, 12 Mar 2025 17:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsPb1-0007C3-PM; Wed, 12 Mar 2025 17:10:19 +0000
Received: by outflank-mailman (input) for mailman id 910586;
 Wed, 12 Mar 2025 17:10:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sRiM=V7=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tsPb0-0007Bw-8G
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 17:10:18 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20623.outbound.protection.outlook.com
 [2a01:111:f403:2414::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dde549cd-ff64-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 18:10:15 +0100 (CET)
Received: from CH2PR17CA0025.namprd17.prod.outlook.com (2603:10b6:610:53::35)
 by LV8PR12MB9109.namprd12.prod.outlook.com (2603:10b6:408:18a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 17:10:08 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:53:cafe::96) by CH2PR17CA0025.outlook.office365.com
 (2603:10b6:610:53::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.21 via Frontend Transport; Wed,
 12 Mar 2025 17:10:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 17:10:08 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Mar
 2025 12:10:04 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Mar
 2025 12:10:04 -0500
Received: from [172.19.213.155] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 12 Mar 2025 12:10:03 -0500
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
X-Inumbo-ID: dde549cd-ff64-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vUKG5VHH8PWcon9QRJWIgIAEkzEf8Ak1CfiC6aPfJNf2aorUwB9NeBEBn5UivRZNj8cdWXgfE0eH/JgqsR3MF0WbKkiMGX1iOZF/4KSlBMq5fKTi+dDjiLBb8xp86ww7Is5PRDMiERg/73oBshbP0F4W/hQQcJVvjFwKDFI39qEKGAW2KDtRUqobDW4/BtP5bFE+/3hxbECGLXlX1Oee7iWfNgzADOwNOauc/zwfiQmcMS2qvodkAZAV4zbuJ1u/g3ak2XqihYvX+rsUMbGozik9/XcIaRl14FWDRDY0muSfNC2e5oRI22kvK22n7j3kW3g0o88mAb7oS0u8AZN7PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47KSxIKeQ5iuwdYiyO7quW7FI/Q18KIMai8zxo5hEng=;
 b=rOc8wD+jbeauJYS2rphXp2I5sYenaW2GMtngF4VzMZ3Lrvp/eT4jTDPPeF1P5cMnU2Im5WDttI70562/z28cG5A1p47jSPMyByNviLvLzvzjOq6hhJ44TD+L1UvYuYwNyJ+r0AccGCUOA+i7M6n2xzKfm+KFxBvYZFITBEra/Zvnaa0aZyxccJRjOP+uEJHqiAVHS/98XhGdT6WTICd6SrSYu2pj/rcJEt3d2r7XIJJcILepocGRnWVUsAqCzez5Qkt/52ZeoJf2cIsZfFm8WL3VKEaA+Fp6+QbVoj9E21jtlB6vL8Dm7rNSISWxBB/BIwHFgUr8oAgEfs8RNb7IDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47KSxIKeQ5iuwdYiyO7quW7FI/Q18KIMai8zxo5hEng=;
 b=0/EyrrbzFOT8+mYTm6sKnrHebqlX7+f7bjOrgguuM9lxPq0LUXWj+/9RzW82PoNGa57oukqah5BoudmuGSoy8sOPDXe8YXngXfERAgAL+WXkemOHjP8F54YgPuynC8SIlfG/m7U49E8JwrmmbOF59BPS20xw60CKZmh1Kog45xE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <739acb73-bbc0-48e4-bf43-76f727880eee@amd.com>
Date: Wed, 12 Mar 2025 13:09:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] tools/ctrl: Silence missing GSI in
 xc_pcidev_get_gsi()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
References: <20250308001711.18746-1-jason.andryuk@amd.com>
 <20250308001711.18746-2-jason.andryuk@amd.com>
 <0b037ed9-cacd-4dbf-9d2a-b7ebf9ac6283@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <0b037ed9-cacd-4dbf-9d2a-b7ebf9ac6283@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|LV8PR12MB9109:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de66eda-26e9-4c3e-7890-08dd6188bdc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZEZUV0lCb25VZ3BmZ00vRFdzOFhQM1BQV1JnUm9uOU5vd1hnemlMVnBhdDRN?=
 =?utf-8?B?YXdWbU5MZnQzSXRxL2x2MnFUSmZBMkhGcGtGMiszK0JYK2FGVitqbDcrbmRB?=
 =?utf-8?B?U0ZHcWRyMHZsajhLNkp1RUpNTFdCazl3RGxRRHRnWE5xVVAxU04yTWRVdTN3?=
 =?utf-8?B?Z0dNS3NOOHhNMTZVOVNsakdLSmtJSURJdW5HZzdqUERxYU1lcmNJTllPWFNz?=
 =?utf-8?B?eHpaSW1aU1U2WmVsb3RzYXlYNGt0THFDN2IzdEVGUytnc0g0Z0t5cU5OR2dx?=
 =?utf-8?B?RGNabFpxNWR5TGtwUkNiMG4vYTdkVytmdnZqTVJtMllsaVJLNkc3SmtCRTRw?=
 =?utf-8?B?eGlqRDRnSGswbitSSmRVQ1o0SG1SQi9EQmZlN2ZoT3EzN1B6cmpmK2VFejRR?=
 =?utf-8?B?MXk0WHlWUHZYekdkUC9xV0Qvd3JudE1oR2RIQ3phWThyKzFBR3d4aFhibEFK?=
 =?utf-8?B?ajdHOGx0bDlvbEUrMW1xdkRmYUhZN1o2d1VQWkV2cExUWmdTUTVxMGg2Y3p1?=
 =?utf-8?B?YkNWNENTaHJyb2d6aVg1WnBVd1R2MXFiWUF6bEdvLzY5ZitsTWo3NnVNU0pL?=
 =?utf-8?B?ZG9XNWRUekF3ajk1aUkxV1pBbTJDUUlJSWRDZWNJSW9teGdSWGwwdU5UOFV1?=
 =?utf-8?B?VmMyaHJlN2N0QjJiK2RQYTE4MFdLcHBaN1NpRmFMZzBkeDR6QXZ4NWhMTTZm?=
 =?utf-8?B?cnhlbjhvTGZOSVdwNituWmpqRzB1VEN1U0IxZ1RyOStaVUtoWDNCUUdpSWl2?=
 =?utf-8?B?bkYvVlZ6dGsvK1pXL1VNbmprRG5BVXBuLy9ZNW9zb25ydVd2VXJyZEcxT1hZ?=
 =?utf-8?B?OHNvV1dybStDZUdaV0FzLzlVRWhXOTJEZjR5clZWS1M5TlVSMDcvNURQcmpt?=
 =?utf-8?B?M1VCMzdIaHkyYUxmNTB5aG5jSjhLWlhZa2M2ZU83S3V0a0FGaHJhSEZXNUJO?=
 =?utf-8?B?LzZReGxLNCtiOXhTM0ZDaTVvVWJwdzdmbWlRamQ1cUUxZlNFdHdHL2llRWdo?=
 =?utf-8?B?OUx5WVhpclZOZ3VBVGVFb1lqLzYzVENnRXpRUWlVQUR0Uzlza3ozaWlrZ083?=
 =?utf-8?B?cWxBaXhCdmd4QlloQW90bHRRSEUybnNTV2pGQS9ySGt5UlpoL0xBM1dtN0lY?=
 =?utf-8?B?SjY2Y0wzb1FuekNFUTZ4SGl4ZXNJNUdlMERFVjBHN084MGt5VnhZQWxNaURP?=
 =?utf-8?B?UzcrNThXMGUzaTFPMlNJcUtpc0dZR256UXBjR2NrYzdwelhNeUl4WW5Yc01C?=
 =?utf-8?B?MW5hdno1ZmRFV05rK3J0WTFhZzMrWHNLVWUyV1l2SllSRFlsOFBiRWl6TWph?=
 =?utf-8?B?T2dvNDFjVDdoMmwyajMrSklOVGhodHE3Wld6OXNKYTFtdjhSUTByLzV0UFVo?=
 =?utf-8?B?c0lpMTFSWWZiRFovQ2I4QlhFRjRFME81SmFWRmdwdlNNa0swYzNYYloxKzd4?=
 =?utf-8?B?QkQ3Wnh2azc4MFZ1a3kyZU96VkNnRUI2QkVFV29BNWNCM0FWQkFOUEVhWWpV?=
 =?utf-8?B?MXkrWlJPeDJ0MHlJTE5sVzlqd1NjZGRzMDd2bm9iYlFOL2EyYkN0VFNjQVl5?=
 =?utf-8?B?SjUyMERiQ2hNSEpiczVyemllc3N6TDJuNTA5Qm5RWkJwVHBqdGdieEZoc3BX?=
 =?utf-8?B?ZExsdUVZbWlrSmtneWZwRkFQU2R2dUJEdGltRFlaTGVhbHVBS3dtTzlrL3lr?=
 =?utf-8?B?Rk9abnQyZFAraHRIMW1Xc3dhM2g1Tkl0dG5qL290aWk4R0xEVTRWSkdpNnVw?=
 =?utf-8?B?OUtOSXlMV3hHRTZVdlR2WVFLYmFkbm16VTF4dFhiYytGMllDdGhjbVRnWGtx?=
 =?utf-8?B?T1drZms4WTJuNy8vcUtpR2Y3YTZ2eW9paFcxU3dqMDBMeHl4Unk1RE9WOUJs?=
 =?utf-8?B?Y1UxUjlrR2RBRER5QzJ3cTVBRUdtVzBseDV1UlVxS3lQT0Z3RENTSXdRTlJ5?=
 =?utf-8?B?RkVsL05WenZuNGcxK0x1NEVtN2txUzY1WnBVWG1sSCtHQjZ1NFlwMEJxVloz?=
 =?utf-8?Q?cdJqsI2c/YCyQKjrc4rw482gp1AakA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 17:10:08.2963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de66eda-26e9-4c3e-7890-08dd6188bdc0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9109

On 2025-03-12 11:56, Andrew Cooper wrote:
> On 08/03/2025 12:17 am, Jason Andryuk wrote:
>> It is valid for a PCI device to not have a legacy IRQ.  In that case, do
>> not print an error to keep the lgs clean.
> 
> This logs looks a little too clean of o's.

Oops.  Can this be fixed on commit, please?

Thanks,
Jason

