Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81600B07F0B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 22:37:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045748.1415928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8ru-0006x7-LE; Wed, 16 Jul 2025 20:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045748.1415928; Wed, 16 Jul 2025 20:36:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8ru-0006vf-ID; Wed, 16 Jul 2025 20:36:46 +0000
Received: by outflank-mailman (input) for mailman id 1045748;
 Wed, 16 Jul 2025 20:36:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc8rt-0006vZ-Is
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 20:36:45 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20611.outbound.protection.outlook.com
 [2a01:111:f403:200a::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95252887-6284-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 22:36:42 +0200 (CEST)
Received: from DS7PR06CA0051.namprd06.prod.outlook.com (2603:10b6:8:54::21) by
 IA0PR12MB8864.namprd12.prod.outlook.com (2603:10b6:208:485::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 16 Jul
 2025 20:36:38 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:8:54:cafe::31) by DS7PR06CA0051.outlook.office365.com
 (2603:10b6:8:54::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Wed,
 16 Jul 2025 20:36:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 20:36:38 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 15:36:37 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 15:36:37 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 15:36:36 -0500
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
X-Inumbo-ID: 95252887-6284-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fc1N1bOlJ+boXyG0FHgUt6HqC/1P/Ja9GUFucKaZ+PiSbn+sKA5Iz8G9nKVcwsmLM7DEMeMJ7+cHSB6DlMoHVyEQSXYLwA+wJFr+G8F55FkiXx7pZ53nuQnG9lgzc3vnURIGg1pReMuQ57jJefDtXFvln28ffNpclVQBQMn20RxcGxlVBHSvS9uLunUupRaoy651kz/M0pT9Ujw6mFV1ckiDJyxrPW7oJz7PWMqBVPKsB3LC1j8A/KOVCUukYQ+vvopOhq4dbglW/ufmOzUq8bCkm4w5pRYsYkKPmmeCBTnC4b1Mf4TnUyyqyAsHnAKmrlifyKqsCJU8i1i+iKIoww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSPe8FJWcIHnpkW/wUv7hV280eOF1VWftsQHHPt1CE4=;
 b=jTAR6ej0oVt1xgk16fKi9wXUIltUNcw97GbZ+3quBU4zlMlRZrsmIX7TYBJFYDXBbIIyYaj2BuoRL8XRS+RSqoToKhVL5ct58DxEBd4AtzRc1B0FZI2mEXmd2TlG/OP2+oDTZGkYVUKEzMcUdsGlaOcMUUIVUv16XsKiRtaYkgzQuizJXkY09kzZ4m4RTyzvs+JYVQHstdV/C2OvCspvbuKEDgLX0uELwn2yfFbuEvgFNChhb2cxeWvYYx6amt1vmpH7ttK9hlIOHxmodcrLaYSULu5/FKxSI+dy9GZNMAJ+Fpo4/QsCmcgohjBdHAAcU9qDtqlZRjRvikkh2/KXPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSPe8FJWcIHnpkW/wUv7hV280eOF1VWftsQHHPt1CE4=;
 b=jItxL9XVstItwF5nVC8z1LdCr9R7e+h9+FyaPX4ir6Stwl1LjLtXS6G3+1FKuJEo93/99zwVF+rSLHdFurGB/nEy5yq/gvVj5opExLuQ7qqtr3Tq8xgmTw0WFAMHy1qgYOyI1m9fikTAB7NuCY82H7/8pwgmucoJ2RDOlFvhKvc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <326f2edf-f291-42ea-9488-cb8c68bfaba8@amd.com>
Date: Wed, 16 Jul 2025 16:29:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] xenstored: don't use xenevtchn_fdopen() in stubdom
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250702081305.14440-1-jgross@suse.com>
 <20250702081305.14440-7-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250702081305.14440-7-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|IA0PR12MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: afae45c7-36ad-478c-fd39-08ddc4a876b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTQvQVRJZWpDQURhNlpFUk45LzZHQXcxTzRuMWllazNrL2tJWHJNcUlCREVp?=
 =?utf-8?B?aGtWZGoxYjVrUjExNkhKdUF3TDZCOUcyZHpjWXlWN09JSWtjNmt4TDlIRFQv?=
 =?utf-8?B?WXlJclAvYUdwUS9SSkcvYzFaM25lb2MvM1BtZVZ2dHF2TGRqaU95TmhDVFh3?=
 =?utf-8?B?cGEzVVFOdW9jcnc5ME9tZVNnYStIMWI3YWREZkxra25LV3l1Umd5aXhnREI5?=
 =?utf-8?B?VkR5c2dHWVhZV2hjby9LdTBNazVNY21rL0tBRXhiZHY4bFROQS9UclNaemF2?=
 =?utf-8?B?NG1ObUVQWHJGZm5NeDMxdHloUDdlamZuTlRDZDA4L2ZZUmUwc2doOHA1OFhi?=
 =?utf-8?B?OVdNVitSd0Q2TmFSU0IrYTQ1NXM4YStDWGd0OHhYMDYxM1Z5TmtQWWJPZVlu?=
 =?utf-8?B?V0V5SU1zSU5ldzViKzlCaW52MDZ5Wlc4U2RQdTQ1Q015dnlnYTVXb3BBL3Bi?=
 =?utf-8?B?ckQvb3MzdnorWlgyS2VudHhUMU1ldldiSVFEVlNZWlh5YitvQ0hDNkU4TjFH?=
 =?utf-8?B?cFBONDhtK0E1eG40TnkxYjQzS1M1YmxNY1d4QTF3bjFrRUF2ZEJYMEJ4cDVG?=
 =?utf-8?B?QTdVdFhzYzJMYi90SHVOcmg0YUFIckFXUTV4anBKNDZtWnlvak1UOEx1WjFr?=
 =?utf-8?B?cGxSNWcwbVUvME1TTGZndFJXRmg1dkZvS3ZUMnBrZGxSZEt1V3dRSi92dFBq?=
 =?utf-8?B?OFF2M1kvdDZtVDFEL1oxZzdmMG9kYlljNEtYSy9oTld6MDFBZDNsZlVLeTA0?=
 =?utf-8?B?ZWNDckcwRUJOS1RDUDFoSGZmOCs2V2drbm1mcStTNU5BbVZQU0VKNTI2cjU2?=
 =?utf-8?B?UTRUOERoV0lFMnVDZmZTOTRvdDRLTUh1QWVzc1pUMFpzN1h4akRGVU0yYm9z?=
 =?utf-8?B?V1ZqSkhLR0o0dXhwVGFKeCtBeC9SSXc3ZmpGQ2pQUkRhOVp1KysyeDRuL0oy?=
 =?utf-8?B?VEJaSURaOEpiUzhPS0R6azdxSnU0NkZrZ3VJWm51RGFSMDBVOFJRbGJ2SU5K?=
 =?utf-8?B?c2RLL1JDNEswWGVkN0pCVHdRZ3dTZk1wSTVDd25TN1VNWXZhOVV0andhUExn?=
 =?utf-8?B?VzFpS29keE9zcXVTU0VlTWNOUnVENGlDUTFXZ1lnQXJLMFFZcEdRNXJSczYz?=
 =?utf-8?B?UUpuUUVSZEhHMzgzNjI4TmNNVG4rREhiNW8rOThYV0o1UG4vR3BWZ25vUXJw?=
 =?utf-8?B?Y2c0NzdQOFlBMTh2a1RHWEN6MzNpQzdkanZ3SkI4VmRDT1NIMTI4S09YVFRX?=
 =?utf-8?B?OU1WcDhOUHR4eDJiZkUzRFAydEJ1MVZkWkhsbVM4NTBsLzVkUVhhT05RS0x1?=
 =?utf-8?B?bS9XRmRuZXY4c05HWTFhUk5kWDlkNVdaUlhWOTY1eUp1TTkva0hFQjR0bUtS?=
 =?utf-8?B?alI0TWFzbVlLR3dyZGNsYktpL2dVN1JGMGtySXpBOE1YMGxJN1FKb1lrNS9R?=
 =?utf-8?B?NVE0S3A5Z0ZESThYMjlVbUhBdTVRZlNWai9EaXRiWU5vMG9Qcm0yV1k3c3hH?=
 =?utf-8?B?Ti81TUhHdzNUZ1ZFcUxNdTFFRTdVM2tuNWh6YnpNYklJUFN4dXpxMjBmUzFx?=
 =?utf-8?B?c3BEK1p3L1d3U2JSMk91SVFIQnNuS096WVcxQmYrQmpOOXBSUlkwbmdRdk40?=
 =?utf-8?B?K0phMmVPUHpOTzlPdkhMc2cvNElNMkpFMlVISlFsQnZnQ3p2dWFGTW50QzVX?=
 =?utf-8?B?aExteFJMamFUalpkNHJaNUtSVW5VcXpWZVRROGJFRkRQWE9VbkJRVWlXb05L?=
 =?utf-8?B?T2VodHh6WFR1dnNWMjd6UjVZOHlrWEV6T0FreDl0NzRTZmYrWWJ1WFRvSHJO?=
 =?utf-8?B?cWc1Yy94aFZXZnRtY0xsbUkzUzFJOVo3dWNReERCaE1RS254cm1abEc5R3Bp?=
 =?utf-8?B?aXgwNkhSdUZLaXJBWCtTS1l0UnlvbHZoMFZDQXFiZW4raUFXUDJiN3liN2Fq?=
 =?utf-8?B?cXFFOG5mcGFqTmRkbHBmUGM2N1E0NkJBMUNaVDhJellHOVlrNjFtclV3cGwr?=
 =?utf-8?B?N2w3N2UwOGczY09GSUZvZURsb1dLRGlPTUpSdm80S3R5bHJxa2t6TFl1ZlZX?=
 =?utf-8?Q?u5bGsS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 20:36:38.0588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afae45c7-36ad-478c-fd39-08ddc4a876b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8864

On 2025-07-02 04:13, Juergen Gross wrote:
> When running in a stubdom environment xenevtchn_fdopen() won't work,
> as any file descriptor state is lost across kexec().
> 
> Use a wrapper to replace the call of xenevtchn_fdopen() with the
> really needed xenevtchn_open() when running on top of Mini-OS.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

