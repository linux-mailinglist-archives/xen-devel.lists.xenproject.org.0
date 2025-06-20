Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9CAAE241F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 23:37:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021264.1397266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSjPf-00031R-KS; Fri, 20 Jun 2025 21:36:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021264.1397266; Fri, 20 Jun 2025 21:36:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSjPf-0002zy-HE; Fri, 20 Jun 2025 21:36:43 +0000
Received: by outflank-mailman (input) for mailman id 1021264;
 Fri, 20 Jun 2025 21:36:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZSV=ZD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uSjPd-0002zn-CC
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 21:36:41 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20616.outbound.protection.outlook.com
 [2a01:111:f403:2415::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3944b38-4e1e-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 23:36:37 +0200 (CEST)
Received: from CH3P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::12)
 by DM6PR12MB4155.namprd12.prod.outlook.com (2603:10b6:5:221::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Fri, 20 Jun
 2025 21:36:29 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:1e8:cafe::18) by CH3P220CA0013.outlook.office365.com
 (2603:10b6:610:1e8::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.26 via Frontend Transport; Fri,
 20 Jun 2025 21:36:29 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Fri, 20 Jun 2025 21:36:29 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 16:36:29 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 16:36:28 -0500
Received: from [172.17.97.97] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 20 Jun 2025 16:36:28 -0500
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
X-Inumbo-ID: a3944b38-4e1e-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJXY3t4QEv96ozd69IHWVzWGSHNaHl033706gQVPDWekXEdq5rjXo4nCJHthyPgPw3gcIfBZTBvOzS6KfZFISItqZrrvu/3/sNLA7MbVwI0GQ6VIcBEW9KYp1iSbZ7ERlvkCee2pOySzB/71oIkltUCCDm4DJbY3mpiuT6p4STweSxrM0QBSAinSo3WPuHQUWRj5C+6v3B2JjhoJxyhO6E4FG+y9DYj5iC5nE3mf+9ropgn7xY3xLfWmTSntwEipqna9PvugDLjqPUPqrzOF8VGN3WF5gwcmSM3ZO21ul8u27owyVI4fvom57XuluktOQhyj4TIFjFJZzzHEQLuLdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CPsrEbMQLXOUUqeM2LQ9iP8HdATRM5wn0XASA4Dh1g=;
 b=CwLo2/Kexq8KZjIwOmTSKCcR842t7KrVSBVlNi4dwsnwQwtB8OdRF6mocswMW5lKjIPii2cKodqGu07zGhFpydgM+Q2J7CnQTUb0jDwQftBong20p3NM8UnRzVUJM/rb6mG3cS7pooX0yEYieax8kkee6fGKoCjJRkG1Oh10hkqOPs+LPPXN1ac7GEVCvI4XqaXUcRGoe8Jzqyhl3DvVMkJO+M7FulaKhvu/gJvFS4nmffKYpc7PWFGxZL8d6sQS6k3ZAcYnZfn+mYj6ApnxXV6Lqk5B+tghWM7nP5aD1hEwMus6GK/tS7hzGNq6upjSeywdf8OjSZYhnzjFnTDKlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CPsrEbMQLXOUUqeM2LQ9iP8HdATRM5wn0XASA4Dh1g=;
 b=YGTAKSeoLrlA7YMgG6bOGSM3CNCbmrWa1vp4edpOY57uJRRP9Zom19ybU/f8riycqKBL2upVehLewXN4gg9zSTWGeGYLG8OgvHL9vEXFtO68Y90khgRxVtVW8/2DrYKIUanZZZ44V4upPmS/4dtQcJXgEkzk4u/TFBjsq4yImWw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <5f1b32cf-73b1-4077-8bc6-f97b8ecd8082@amd.com>
Date: Fri, 20 Jun 2025 17:36:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 1/6] suspend: drop crazy pfn handling for PVH
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250619113804.32694-1-jgross@suse.com>
 <20250619113804.32694-2-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250619113804.32694-2-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|DM6PR12MB4155:EE_
X-MS-Office365-Filtering-Correlation-Id: c931f501-c159-4e5f-7f7d-08ddb0428491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWNRNzFpU3FmOEMyNUxubFNhaGpHT21YWmZiY0c3eThqcndwU3R1OVRLWTFa?=
 =?utf-8?B?V3RlZlFFTkt1NXBoRnRzQlpUdis3L3pNT1czMVpIVzc4blJMVjFNeHFvY2Vp?=
 =?utf-8?B?MEh4MitwSTN6eTRqYXpVYzYxTnlGSStORDZiNjhPeHhZTXNKNit3blpMM3BI?=
 =?utf-8?B?Ujk2SDhZVnExeG96cllVVXRCZnNSZUVueTVnWVpha1lpbndJYngwMzIxZkRv?=
 =?utf-8?B?T2dSM2k5S2FiUEFXdU1SL1BBRjVoWFlLbmk4QUhWZzZodkxpTDBXZ0U4Nklv?=
 =?utf-8?B?aHRHWmJoWXdrNjgzR0xLaWdETXdOcmF5bW4yZVE5SzZUMURRZzYxTDVNWWto?=
 =?utf-8?B?cEdZWThNMkQ4Wi8zUU5IL1RkTlZDUWxxSDZCS1MxR010eDlMSUFFa245MzRw?=
 =?utf-8?B?SVF0eGQwTkpNUDZnQ0xnd2tXMFMvblRHQlNQbzUvd2xXWlFGUHdyTkg2SmlW?=
 =?utf-8?B?WVBQT0N5MDhxdFRNQURIVDd3Mm44R2Q5c0FUdXZaVUtyMklTNXV0aHcwUjZl?=
 =?utf-8?B?T2lsbXl4MHJWZVZnUHh5N2ZCbFRnaVhjcm1WNk5VdzQrRXFFZEtWSGpqLzI4?=
 =?utf-8?B?UlEzRjBmZlYzRHF1R1RpMTQrUHQ4emNpMEEvRmtTc0VZejNoUy93cU80V2I4?=
 =?utf-8?B?WE5Xcm5oUEtYS0J4UzFocEFWRFQ2Zy9IMU5PaE5lTVNuVnhjeFltc0trT0FV?=
 =?utf-8?B?cE5IUWFrY256QUJuaWVjTUpYV1E2UUNIVmZPYkpLVWhLWFRtdlJzZWhkWFVO?=
 =?utf-8?B?WTNQWTR3eG5aQmNFYXBGYWZvUUVRcHpvWUZ3UmdmdWtRRktvTXFLRnNHbHpR?=
 =?utf-8?B?cjJoWk5NanRDOGpIRGlXenNtaXR6akxEWEhUSHlFWHJScms5YUxab1k2VW9F?=
 =?utf-8?B?dGMvUlEzL2Rha2hMQlpsNlVwR0pxd3RLY3hkRXg5SllmS3V4WHNOaU1LWDly?=
 =?utf-8?B?ZzFiYy9nUVBFMzhoTDlOYitvWEhDRE16K0R6VnBUMEFjcXRQWEN1VE16K2hW?=
 =?utf-8?B?WjZ3RWNabXVOU0dlMThOSG83REJRZGJrTlFiQzVIc0N0ZGdsZU96NkhsMm9q?=
 =?utf-8?B?c3g2Z05aYUJjV1R1V3EwalQvQ0Yza1RFaUhnSHhWVFZBeWZRN2swU0NmbmdD?=
 =?utf-8?B?Y01DQWN6WWlVWlBKaUgwOWZmNXdKZGMxUEIzblhyVzdZcE1xVjNBZkJQeGhI?=
 =?utf-8?B?aXk1eEVMK0JuQkx0YVMxZ1VUdmo4OGtiZUd5MXJvRHNNNUVhOUppcTgzMzU4?=
 =?utf-8?B?Vlh0MTR4U2IvT29oYTJ0S2p5OGVpV1NyQml5SGVwS1c3QVFzTTIrbGJGNE5P?=
 =?utf-8?B?K1kzN3pvT3A5Q1NxMEE1d050VTEwNm9mZ1VGTGhtcmFJcEN6WS81MWtTa3ls?=
 =?utf-8?B?dHRHYk1DYWtsZG1RYkh5YnROeEdrOFI3b3VnNU45VVZmZDRjWENyeUhVSWFI?=
 =?utf-8?B?aGdlWFRnNUtHU01rdHFKUGhORjkxRk1rV3pQQTFhT04zRUE5RE1xbTVWVjlw?=
 =?utf-8?B?TU9SeTB2UndscEdsN0pDUmZxNEIxYVZmcUw1VzFLUUYzbXpWMTg0SW13WmxL?=
 =?utf-8?B?RWpPWUlpRVVkL3lKL3VrMi94aVVLbzhYMnRZb1FYdzdGbldlRHZ2cmdlZHZN?=
 =?utf-8?B?YVZDZ05KTDJvZmlCK0phOEZLNFc1WjB5VU5OVTNBOFBtY3owbmh6WjBmTlN1?=
 =?utf-8?B?MnhLaDY5TVlNT05IVDZVZC9TUURIR0F4YUdGalJvTlphSWtPOXorcExzVzVD?=
 =?utf-8?B?cm9vTXUxc0xVTkR4YXVqaTN2bWhCTDNBS3MyeXA0RFE3d1E1d0JlUXdXNzNL?=
 =?utf-8?B?SzhjeFl1Sm1qM1J4TU1tQmY2SHJYNldMNHhHUS95MndFeGc3TkFoODVjQlEy?=
 =?utf-8?B?LytkaHFGNHdsT1U1bzBkMWcrdmhyY09KSUltL1lKN1NOMTlHSDFEWHFpY1hC?=
 =?utf-8?B?RSt6OSs1dTV0REtOTTQ0TkJFclFMTmhZVTM3ak91TVB2MUdlTVFHS2NwdUFK?=
 =?utf-8?B?QkpGdHFvMlNPNkl0WXczeDBpYkZxV2dESzNaeU5UQmVxRjc5Y1p2RUF5MVg0?=
 =?utf-8?Q?ta4lCg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 21:36:29.4390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c931f501-c159-4e5f-7f7d-08ddb0428491
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4155

On 2025-06-19 07:37, Juergen Gross wrote:
> Suspend for PVH is doing some crazy stuff with the Xenstore and console
> PFNs:
> 
> - In arch_pre_suspend() the PFNs are "translated" to MFNs, even if that
>     translation is a nop.
> - The result is stored via start_info_ptr, which points to a struct
>    start_info only in case of PV mode.
> - After resuming or a cancelled suspend, the PFNs are retrieved again
>    and "translated".
> - The "MFNs" are stored again via start_info_ptr, which is still not
>    pointing at a struct start_info, and from where the data is never
>    read again after that.
> 
> Drop all of that completely.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

start_info_ptr points at an hvm_start_info.  Assuming I counted 
properly, accessing ->console/store is writing past the end of the struct.

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

