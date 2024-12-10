Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB12B9EB79C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 18:11:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852932.1266581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL3lH-0000N4-8x; Tue, 10 Dec 2024 17:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852932.1266581; Tue, 10 Dec 2024 17:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL3lH-0000Kb-6A; Tue, 10 Dec 2024 17:11:03 +0000
Received: by outflank-mailman (input) for mailman id 852932;
 Tue, 10 Dec 2024 17:11:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YcGJ=TD=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tL3lG-0000KU-Dz
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 17:11:02 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2409::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9935888-b719-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 18:11:00 +0100 (CET)
Received: from BN1PR14CA0028.namprd14.prod.outlook.com (2603:10b6:408:e3::33)
 by SN7PR12MB8601.namprd12.prod.outlook.com (2603:10b6:806:26e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 17:10:54 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:e3:cafe::83) by BN1PR14CA0028.outlook.office365.com
 (2603:10b6:408:e3::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.15 via Frontend Transport; Tue,
 10 Dec 2024 17:10:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8272.0 via Frontend Transport; Tue, 10 Dec 2024 17:10:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 11:10:52 -0600
Received: from [172.21.132.86] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Dec 2024 11:10:52 -0600
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
X-Inumbo-ID: b9935888-b719-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O1WLPk6NHYqlM5b2VqmA4xxiXY/QhTwTEjuAMvrBchAb8EyBIQhEXev3aBanNOo+YH9rNCKkKo3p8OpyPk6kCJjZ2LllGHHSUPe5hRscek5AxHUHcLEfg3oE1YANzIwxFT8Ph19qIreqrRn7jZ2umWNJ6gDLN3xFWgHX95M3d19XRWUa+i6JhN9PIaogrtSq/K98Xf1ZpnBiVG2kZzGUwEwyZAwJlQ4+1997KdIagndYr6Y4sj1EyHndWuGqSWY9BXqZbj711MDg1D688KlyAZe1wH57k5kjUJNCR/kvGdlIN3jAzUSFy4xh/XqsY/SFcS1uIqhH+Tc8P4jr2tTv1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gu6eYOa3khxPcVYL956PzomvkQ877K0g6poQ1WpNxyA=;
 b=plMC6o98c49jT8QGvGRBG8/Y3T6ow8sdLf9akz1LorglBukVfQy2Eo/3FSqnI3dW+LdmAEGmIcbPMw5RhflKfIapXhznfLxdrl56e0QBXW7JXESPdBNKV4P6M2CVzKh6rtmp0zwWuOBAJ4p85HTmES82+xvoVIKc6it/7+XXhDC+vii8uMDgc1WRtOxBFWJaldK5XZWqQO8hdMXoawC3TeSgJ1NFFxtPTG/WUb3HpVH5/8Co2XuE5pH2geF0Z6aw1azMe7n/XOqG/57qC1vUBNcj8On6JTLzP0vh4BK/9++pmLRjShplAShWEWa0ZjTc96iIewzmqQOX4aQHFJ8f8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gu6eYOa3khxPcVYL956PzomvkQ877K0g6poQ1WpNxyA=;
 b=LtOJgCU+CkKVBzT4Z0oPUH7/SimrxmWwiUZTWR+Fd4UfH0riINYkIyGGKMW4pRwkJyqivSmfsbB1Q2ZUTRN+0HMF8xvlyfLAPxkdCD9ZwkU8rLUQYECdVnpA7QXF3n/JCM2EIEfSwk2a8cX5nZRWQC3Gku2hgabKWQr00ws/o8A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e6c46bd9-0525-4b53-b4a8-21814d207626@amd.com>
Date: Tue, 10 Dec 2024 12:10:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/vpci: fix memory type in guest_mem_bar_read()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>
References: <20241210162546.403882-1-stewart.hildebrand@amd.com>
 <Z1huUDOTgJIB8qTE@macbook.local>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <Z1huUDOTgJIB8qTE@macbook.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|SN7PR12MB8601:EE_
X-MS-Office365-Filtering-Correlation-Id: 90bd10cc-9e4e-47a2-0d84-08dd193d9aaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UVIxcnpkdjBsSzdJV0FYNzdCc1R2R2pHWGV1WjgzbmFKZS93Q1lJdTVVQkdV?=
 =?utf-8?B?b05NRzBLY1BKWTd6QStHcDNtVHppaEJ0b1Y4cG9xMlB1K1NGUmdyOUdBSXJY?=
 =?utf-8?B?ZUlwSDRNS3dHTExRbzRmckl2ZkxnMHh3Y1ZTeHREMnBPZDVpbnNhVEt6NmVT?=
 =?utf-8?B?a0xWWmZoRjNRMG1RSzNqZkJsSkhTdlpiWUhEdWNBb1liZEZKUGpFN2UySVNV?=
 =?utf-8?B?S0xQSklHYS9ONlUxMGlpZm4zTEFuQ1RnT3VzL3h1dWZmeXRUVXI0R2tHbmcr?=
 =?utf-8?B?SVpKaEhmaHpQQ254MlBEa0oxUEd3MEtEcDNuUERvbXlPR040T3UwbWNueGVD?=
 =?utf-8?B?ODV1NDJTMk9OazhwUERXK3FHOWhUWkUxTURwR3UxSnArZUM5QVBzeVFsbyt3?=
 =?utf-8?B?cTQyK0dXaGhMVnpHb0doOHNqRlpXOWhpY0psYnE0R2t5a2QzYmpDSW5aWEJm?=
 =?utf-8?B?V2hVY2hJeDl1N1hKaHhVZWNMZHpPbURTRllaanVUdTBsck1ZY05KMDNjenE1?=
 =?utf-8?B?VFJNVUc0TDVXQkYrcXQ5dzdIZEU3YUJqZjRPUFpPaUIzQytieXJHeXBsNjJI?=
 =?utf-8?B?OERPVUxmVTdpZWdRS3dLZVk1ZlhrcDIycTZudmpXVG1TTFVGbk5KM3I1dEto?=
 =?utf-8?B?czA0MHdLNy9KVXMrbTJKR3R6MkJCby9WLzFxemNBUjcvSGRrakZqNjlQRHJz?=
 =?utf-8?B?UHZXalJsa2xWazJWNGJIaTROMGlrSTVucXk3dlBqeW9iOGdxbkhRWVdQZHEx?=
 =?utf-8?B?NHhJVkpnMUp1cUwrbGdmbTNQRFhjWWxtQVRsYnNVZzRwbWpjYmhzazQ4YUgx?=
 =?utf-8?B?N05reDNPVUNybGxKN2NSZHJEY2t1T2tLL1A0aWlmdEMvdFJwNTlad1Bqdndu?=
 =?utf-8?B?dE5MZlNnbjM1THpyamREdnFCQng3Y1N4dXJXRDNyZkxkKzExUXRPa25ITUIw?=
 =?utf-8?B?ZldZS05HL3lrRXpQYStqdUh1RVdqNFo2cDRsUFYwdE5TL2QwOVpldEhzRlBT?=
 =?utf-8?B?TjduTFNBZ0o4RWRpazZzL21PWFFFYi9tT3NieEJnaUl4SXFsSXg3dkJDdGYr?=
 =?utf-8?B?WkNuUS9QUm5vMC96NFk4bnliNzFIOHM5UFNzMHVCVk1MVXAvV1VrcG5ZREx3?=
 =?utf-8?B?Mm1PWWw1blU4dFRLalJrb1VCZC8yeHAyVmZSZzhhUTVzS0ZMUy95UU9TdytT?=
 =?utf-8?B?UzhnanVndGlYWGNLT1BwamU2V1RZNkQ1MGhQcDFKdVdVWlBzaUNKbnZybUpS?=
 =?utf-8?B?UkpYNUg4K2E5UzN6cnJLZDRJaEtuY3BjRm5ycW5NOEs1M3BkdTdnNXhvQ09H?=
 =?utf-8?B?YmsvcmpTaVRHckM2SE5ncmlRQWJCS3NWUFVvSGFFVllLTWxZMHZoQlZESldH?=
 =?utf-8?B?ZVFTMnBiTFFxZVZwekN3azZrRkhFeVh5R1hkN0wxVlE4VVIxbUt4a2NtQ1N5?=
 =?utf-8?B?ejZJVkJJcERYZ0tLZUlWTlNTbVVaeFNGN3BJME9kVE54NkErcTlWOERWeE9N?=
 =?utf-8?B?Z2c1eWw0bE8wOStaNkR4VWtHMHlsTFhxdmpBekExTUNrUFo1MFVtOHZEOGlu?=
 =?utf-8?B?NUJEbEJYNHpxMFFHTzU1aW9zQ2FxUk5CcGh4UWN1SFpTRUQ0TzdkTXBUSjUv?=
 =?utf-8?B?aWJNRDRGREdJZEZ5dm9YMFhVTVNWbTZGWndPOGd4MkY3TnFYYTMwUUwvME55?=
 =?utf-8?B?VnFtWU8yMU9CUjQ5Tkp4NFFSZWRDc0poVm1jUlJPVWdjNkl3LzZueml4ODVn?=
 =?utf-8?B?TXlhQ2ZwVFF4a0JkQzBJQThiSzM1cjZrTUg0L3U0NC8rakthdlgvTG0wYUJV?=
 =?utf-8?B?VmZIdTkxUEZWWXppdFZucjBWblg0c3JuMjlIU3dhS2xEazFIdHduejdSOTE3?=
 =?utf-8?B?UmlQdGZ0cStndzZuUFEwbDVUMVh4dFdDUGRjVHNoRUxFYlE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 17:10:53.4388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90bd10cc-9e4e-47a2-0d84-08dd193d9aaa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8601

On 12/10/24 11:37, Roger Pau Monné wrote:
> On Tue, Dec 10, 2024 at 11:25:44AM -0500, Stewart Hildebrand wrote:
>> Currently, if bar->type is anything other than VPCI_BAR_MEM32, the
>> memory type bits get set to PCI_BASE_ADDRESS_MEM_TYPE_64 in the returned
>> value. This leads to the wrong memory type for, e.g. VPCI_BAR_EMPTY.
>> Only set PCI_BASE_ADDRESS_MEM_TYPE_64 when the bar type is
>> VPCI_BAR_MEM64_LO.
> 
> I'm confused, VPCI_BAR_EMPTY shouldn't use guest_mem_bar_read() in the
> first place, as its read handler should be vpci_read_val() instead.
> 
> Is there something I'm missing from init_header()?
> 
>         if ( size == 0 )
>         {
>             bars[i].type = VPCI_BAR_EMPTY;
> 
>             if ( !is_hwdom )
>             {
>                 rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
>                                        reg, 4, (void *)0);
>                 if ( rc )
>                     goto fail;
>             }
> 
>             continue;
>         }
> 
> AFAICT guest_mem_bar_read() should only handle BAR types that are
> either VPCI_BAR_MEM32, VPCI_BAR_MEM64_HI or VPCI_BAR_MEM64_LO, and
> that seems to be correctly handled?

Ah, you're right, sorry. I pulled this patch out of another series that
I'm working on, but failed to realize that guest_mem_bar_read shouldn't
be used for VPCI_BAR_EMPTY. Please disregard.

