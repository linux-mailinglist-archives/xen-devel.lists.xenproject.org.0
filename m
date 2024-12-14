Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7F59F202C
	for <lists+xen-devel@lfdr.de>; Sat, 14 Dec 2024 18:54:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857415.1269710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMWK6-00015D-Kj; Sat, 14 Dec 2024 17:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857415.1269710; Sat, 14 Dec 2024 17:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMWK6-00013J-Hj; Sat, 14 Dec 2024 17:53:02 +0000
Received: by outflank-mailman (input) for mailman id 857415;
 Sat, 14 Dec 2024 17:53:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J3ag=TH=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tMWK4-00013D-Dz
 for xen-devel@lists.xenproject.org; Sat, 14 Dec 2024 17:53:00 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20623.outbound.protection.outlook.com
 [2a01:111:f403:240a::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 401a9a1d-ba44-11ef-a0d6-8be0dac302b0;
 Sat, 14 Dec 2024 18:52:58 +0100 (CET)
Received: from DS7PR03CA0190.namprd03.prod.outlook.com (2603:10b6:5:3b6::15)
 by DM6PR12MB4369.namprd12.prod.outlook.com (2603:10b6:5:2a1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Sat, 14 Dec
 2024 17:52:53 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:5:3b6:cafe::88) by DS7PR03CA0190.outlook.office365.com
 (2603:10b6:5:3b6::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.17 via Frontend Transport; Sat,
 14 Dec 2024 17:52:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Sat, 14 Dec 2024 17:52:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 14 Dec
 2024 11:52:53 -0600
Received: from [172.28.102.118] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 14 Dec 2024 11:52:51 -0600
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
X-Inumbo-ID: 401a9a1d-ba44-11ef-a0d6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NBGAog0ymk1ioMUUWeffVZr/aIe6ItSRtlAi+si4M8mBatp42UGNVYHvlOUIRER+HNR54mYPoMxDHHXKip1InKPbYs/J76av3Y9bAu2e+7AqpJMENGDe5eEe2FGibkRZupPSz0Vz1rBW/BGBhwRuy2kYvrXTyhoLjl4x1495EFg3Sfu9e27+z9k2ViDC4+0dN5Lm8KvSNiL52RfL1wbvd4QIC4yHra5oLcx/fr62qQ5QzJMVaXSf52g1qsk5OVxpcvICNdq7h6u+73j4/zBgmBh13I2xJco3ibFVpNoaaj9lJIyHARsu94R+9Xg7Nh0avrmqdVeJ5rWNQWTbaVSQtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2Tw8JOIgOMGYEnHFbaXyteUataF//cgg6h4wb7QKPk=;
 b=P7QF5nnrFRRfFxpr7UfiAMSPqNYg0JzS5jfbL1MopVhxUR1eNCD6MvjSFXCfMu2tOJxHRXQRBApdT8W4B+8f83tt4okDqGSM6yva2z+sv3Js/6QoSAhDT+zyUgsoXfSAEDvj3ajDHEtY92hVDp42JaujnYMirQ1QS2VItYX9XoCjJjVbOLdgGY5xdn3OCQrMIwlBy6Nw4yfpFGis+4wDqmGrodFBTDqEe1FBC8YXm5R9f+I45+vMg9Yiba10jCfCQoa9ZLAPVD4UuB8pAi3IBPM7jVU5efSAGJ0RwD+7Engwbf5Wk9NmEeN4tugqr/1I3Yx6lg0ySfcCkHYqTK2AOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2Tw8JOIgOMGYEnHFbaXyteUataF//cgg6h4wb7QKPk=;
 b=EoqwrK+aoq6u80MSUeqGYPET1Wk4reAT8UYyB0lruAGdJApx6N+f3CFcxf90/kqfhIoP5VBmWrGEqsG1iOAXKqqrb5naDAF1lhm0N60AERVuLhDoMldtt/z7lLIC+wsIiKWWheTFYh5jSQMs+pTcvMjT1upD4T3CLPuwIV3Ehbw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <0eab7b25-87a0-4e08-bf59-aea64136052f@amd.com>
Date: Sat, 14 Dec 2024 12:52:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/71] hw/block/xen-block: Unexport PropertyInfo
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Paul Durrant <paul@xen.org>, "Edgar E. Iglesias"
	<edgar.iglesias@gmail.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz
	<hreitz@redhat.com>, "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>, "open list:Block layer core"
	<qemu-block@nongnu.org>
References: <20241213190750.2513964-1-richard.henderson@linaro.org>
 <20241213190750.2513964-23-richard.henderson@linaro.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241213190750.2513964-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|DM6PR12MB4369:EE_
X-MS-Office365-Filtering-Correlation-Id: af7e0e21-2609-475d-84b2-08dd1c682287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWVOSXlYT1Z2QkEvZHVJN29XOU1YVVNyRVBUdGhlWnByRFpFTHJPM3laM2FC?=
 =?utf-8?B?T2x3bE5KdVk5bW1IN0p4QmtkRUoyNXNRL3o0Q3NzYjBhQks5RkErbWxOS0lI?=
 =?utf-8?B?am01OGVtOXFPTnZERVhvbWdjT1VERE00ZDJwUFRoYkxYa2pYcDBkZFZ2cDlT?=
 =?utf-8?B?ZGJRSmhPc0xDZkNNemU2YVFmQ0tTTnBvOTFlTWh6VHVYWndoTFJxOERJTCtz?=
 =?utf-8?B?b1ZzLzNGTHNXYVdCbmR1NG01V2gxRG1aMllnVG5VWDRFd2xLZFpUQzVvUjN5?=
 =?utf-8?B?blV2d3JpeWFDTk1HVFlnTUZRaXBOaXJqR2N1SHdLOER3amZNYVlIaWE4YkRo?=
 =?utf-8?B?WHJKdnQ4UFg2SHhZWTVwZkNVeUU2R3BxQytuSE9vY2VlSTdGU3grVjVLZmw0?=
 =?utf-8?B?aFAxMmxSa2ptQ1IyeHcxQkJyL2dxT2R3aFlxZDlVRS8rL3ZRUWtKMUtwR2hH?=
 =?utf-8?B?c1dCcVRURWc2RllvQVhUSDRsRC9Tc2NvektuQzR6ZXVCcHc4NXZBWFV0cGtS?=
 =?utf-8?B?VENjTUs2ZkE4Z2c2T1A4elFUSnpOa2trQVJtQU1LWnJjSGNESDR1R3ZuV2NQ?=
 =?utf-8?B?TERNQldLbE01YU1QdkRjVERlYWJFdzRwdng4bFgvS3FvTTVVWmFBaTl2MVRn?=
 =?utf-8?B?ZFpaQU4zS3JLMzJIcTVCVE51a205MEIycTBkellKdmhDRXZsNk5Ic3Nna0I3?=
 =?utf-8?B?cU9OcDZsZWM2UGRCVHJ4dkUvSUdWWHVjRm5ndEg0SlVEQ1BtSEFQYURrbUkv?=
 =?utf-8?B?WDlGSE5tRE9aYXlKdk1uVzE2bXNpUEIrakkzZDhlMVhjZ2VDMFBYeCtkS0RS?=
 =?utf-8?B?ZGdxWjY5NDN5VVN5c25LNjBmYjc0MnUwOUM4dDlLdXIxbzQzeUtEbkgxL1ov?=
 =?utf-8?B?Mlp6M0sra3NvdGExbTcyU3dnYU9rOE1EWXh6aXE1Ujl4Mkl5QWlJUWZQaFVN?=
 =?utf-8?B?SXRsMkliTmxIWXpsVENPc3BBOFBxcVdmZlQwSE9TMkovWGdJbUdLdEdCelFm?=
 =?utf-8?B?ZUsxN3dBRjkxUzIyVEpWZXo1NmNEdUQ4K0VtdE5CVWpET0xEK1RaMW84SGc3?=
 =?utf-8?B?QjgrZkVScjAwV2EyUGZtcW1rU203bmorVVhza0gvaFora1lhYjYzZm5sL2Nk?=
 =?utf-8?B?WUV5WFNNV2grVjFrdG42aUJYNDYrSGZQbEtwaVhhampleEZweHhWYmZadldz?=
 =?utf-8?B?ejhXRkFuSUo1SmtFdXZyZTJGNU9aTnJUTmxjcWoweFVPbDgrMHV5T0tpNTlO?=
 =?utf-8?B?c1o1dUxBRFFnUC9YU2puVEZhckJaUVYzRXJpYlZCdVQxbkdqU0FKckxhbElo?=
 =?utf-8?B?UzIyZVdza2xPajhrREU4ZHJaWTM2NEFZSHlxMTdqODJBb3F4cHpCdEp0YUk3?=
 =?utf-8?B?QmpIVjE3ZnVMWDN2STltR3htYWVhcGt0VGtNLzhMbmpVUW9SYmEyM01sZFRH?=
 =?utf-8?B?S3RDeTczTGx1c1lybmN6SjVtbm9CbHFjMWhVOW5xSFlEbm9MakM1R3FuMnlR?=
 =?utf-8?B?c2pXenIyMi94QWJFNDNiSjBMejNVcGVLL21CUDBOajAvVkhWelNEUVIwTWVy?=
 =?utf-8?B?WFlwU1IxOUlGMjlzMXlwSXNodW9kdjluN0drVGNlVlpabGlRTGVBSzlkQWV0?=
 =?utf-8?B?OFJmRGJiaXZXSFV2eDNadjhHQnhuZVJMdC9PQ1pDc0Q5WHROWHNWZkVRd3h4?=
 =?utf-8?B?QUJoSVpoNzFzU3YveGp6bDlVS1RUZk01T29sRGhJZVJRK3hGVTI4WTVHUThq?=
 =?utf-8?B?a0hkZnFXWUFma2N6NlZXSlBuVkhHbi8zM0VXaGVHUEVwWjhOWHpObjlWbjI0?=
 =?utf-8?B?RVQwQlVsNjRaWlJNempZYkM2NUtiNEt6UHorWmFkN0hmZGMxZGh1SUswd1Ey?=
 =?utf-8?B?SzdlU25PRGpYSlJCNU5mMGd4K2ltd1I3RG9UdXFRUG5oWVZwT0RqVGs1eTVC?=
 =?utf-8?B?KytJczBlWUpmckJ6TEI5NllJcm5Yb2RnTGsyTGFIb0loeGtyWXhSWFpVYkt1?=
 =?utf-8?Q?pac5Gsk3JmanAv4G/DZ3jjxBOpUKrU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2024 17:52:53.7024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af7e0e21-2609-475d-84b2-08dd1c682287
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4369

On 2024-12-13 14:06, Richard Henderson wrote:
> xen_block_prop_vdev is not used outside the file.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

