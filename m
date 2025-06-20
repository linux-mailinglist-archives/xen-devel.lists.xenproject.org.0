Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBE4AE2437
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 23:41:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021295.1397298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSjTh-0005M3-JK; Fri, 20 Jun 2025 21:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021295.1397298; Fri, 20 Jun 2025 21:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSjTh-0005Kc-GR; Fri, 20 Jun 2025 21:40:53 +0000
Received: by outflank-mailman (input) for mailman id 1021295;
 Fri, 20 Jun 2025 21:40:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZSV=ZD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uSjTg-0005Ia-CO
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 21:40:52 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2412::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 399cec86-4e1f-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 23:40:48 +0200 (CEST)
Received: from BL1PR13CA0136.namprd13.prod.outlook.com (2603:10b6:208:2bb::21)
 by CH2PR12MB4152.namprd12.prod.outlook.com (2603:10b6:610:a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.35; Fri, 20 Jun
 2025 21:40:42 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:2bb:cafe::52) by BL1PR13CA0136.outlook.office365.com
 (2603:10b6:208:2bb::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.13 via Frontend Transport; Fri,
 20 Jun 2025 21:40:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Fri, 20 Jun 2025 21:40:42 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 16:40:42 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 16:40:41 -0500
Received: from [172.17.97.97] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 20 Jun 2025 16:40:41 -0500
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
X-Inumbo-ID: 399cec86-4e1f-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WRZxb++AfVxufMreH2idUjCte/y0EAVeGPTUfdtZ4xPsMLGmUxQqGDW5pvmiy2+UgTrAQ9JR+fRVniAIq+izHBBXwvcryR0sHPBp7ccsQBf/IkmWs++rp7ChRRGy62Lhc+fTBhd7U6jQ2eaQhBgbw3m8ezhZWCVrOOwBcF1y2UuS6hf7Y5U83mue9X8MpnH+29Fi61vgdLgSQrj/CRAWkBLiunxbBHhUbynOQf1eWzbXKrnRBfou9kcPR36Pw5O8nk4Ck4//XsT5ErSPwphyB26YF8MOEtBNhl8I6zjcm5ke2Eb9fycY2PxEkAV8gtRU0k1ydqttDVn0iVg8ZwomWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaOQMQM8R53Pq1SuAJVh1uVYlk0x0GL+r2bS6G96ydw=;
 b=BiRSubHFukJhMYzGxuocKxUgqPog+VF4/NHJD7zZLIVrGmzuN1kc0a6tvpNK1s6HN7wpLHmmhfAMamKmbVBSycuUZcPRnUNhcj/E6Rt45lFV6yu1SgWBtptUBQEvPVlRK2Qgh9Zq/YleBqEgUfMuc7fJqXLEuBRZVISRKOf7Ee/rG3OJ/BkBd+RO4C9PUw+5oU3ckqLOJqYGxeCidpbd/rvjI+C3DjQ+vwAycyWEhhh2UCHHAX2J/P4qZx0NhiBDUdy6hYaSPPDC/s38ILKvwAW8qFsYlccdvthwc+gitJOZucRBE4JNEwPOkPZnyJg/w9zpkiANr0j1TPysqysC5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HaOQMQM8R53Pq1SuAJVh1uVYlk0x0GL+r2bS6G96ydw=;
 b=MDuTSXXI/EQsSBadlC6Bpy9sVRhoiuqPvYmlg0eIebqtD8RkFH86ld6pe5C43hOz8P2Ld4xxnFBOjBwCnhSpZk7lZEGylv4rOD0n/N8VHzHB8cqUKHuqb8jdFYd02AMw5Xvw02V60xdBodO53yuljbhSmFZg/ubVGGte8SzozTo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <13137084-a62e-489e-9521-9092bd570bf0@amd.com>
Date: Fri, 20 Jun 2025 17:40:44 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 3/6] x86/pv: remove global start_info
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250619113804.32694-1-jgross@suse.com>
 <20250619113804.32694-4-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250619113804.32694-4-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|CH2PR12MB4152:EE_
X-MS-Office365-Filtering-Correlation-Id: c1100c64-8b26-46aa-3766-08ddb0431b51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFpoSFoxOWxiSG9VRk9kYk50WEhUc0NrdWxKWi83L3ROOHZuWVpMWENEMXpI?=
 =?utf-8?B?ZGR0S2JkS2UvL2dTKy8vNnljTDJMU3FnVUdUeEROR1cwaUNMNGJrOWhhTXFW?=
 =?utf-8?B?SzFSblAxNlNqbGh6cVNmRHVTN05ENjVmK1F1R3FYdVp4Wm9PdnhUaUNOK1ZG?=
 =?utf-8?B?Q1ZqOWxDMGV5ZGhKTUR5VGh6TlpJclorajJPMG1IWnVCNXF0aFk1eS91OHIv?=
 =?utf-8?B?MjlUaW1CdGxDcXp4cGNCRzVRM3hYS25mTVpoMS9KOXJzYU1DbVRMWjAvL3pE?=
 =?utf-8?B?eklES0l5bTVaU0lhN0x3bkhnVWZuZm1iV0N2MjRXYko4dEhlbUd2bUpKSjhj?=
 =?utf-8?B?a2YwM1ozUjYwOUVSNEFRbzlMMURQekZsb21iZjVJZXV5VWlGODNpRU9wVisr?=
 =?utf-8?B?SlI5ODBwQ2hyTU01dTNyZXZXOVBhRndWdmFCYTI2RnlhZXMwSFQxT2VZWWFD?=
 =?utf-8?B?SDhzMVhtMkpNK2F5SHBzdHZRdldGN1NtMVRRc09MODZUOVVmQjZibklNSjZw?=
 =?utf-8?B?aTZzNGxIZTdvandUajN5bk9DaFlJNkl1bitPdkszQUF2TFBKNGtibDJ5RzR6?=
 =?utf-8?B?Q0xOUEQra25abDRVNDhpOFl5cHo2amJnZG5vL3dISEdPSkdwYnhZc2piWmpi?=
 =?utf-8?B?dUVKUkZsNHhDRTIyM3NkVit6dXljaGxuRllvR2pEMHp2cDNGMDRhamxJaito?=
 =?utf-8?B?ZERibG1hQndwR2pjLzdiMHcwMWZBNTdxZkRkYnlVL0xRcElkemRpUmgwWmha?=
 =?utf-8?B?M2FKOGVuM3o1QTVuU2cya1VydnhTMXk4WkJ5VjJ0L1RWWmE1aTFRSVlSRVVy?=
 =?utf-8?B?b0xtZ3E1MVlIY3VnOTJhd25CSHo3SU54SlFwSzNoYTdUS2VLNTZDVkVvcktY?=
 =?utf-8?B?YWNuODlPVWw2NkFkZjFEclBmVDRaamNjcW5aNmFJK0U5b2hhaTlhSzNpQnQ5?=
 =?utf-8?B?YzNjSXdMTFBOY0MwQXc1bDNtRVI3ajNNeHpMa2tkbUdmZnQxWStrRldDbTQ3?=
 =?utf-8?B?UnFBbWZ5Y3FNdk1CT0IwTjhCRDN6MjV4KzFFYzgwWC9ONlFFUnFlK3p1K0Vr?=
 =?utf-8?B?M1Z0Q0NwaWU5dWxpNk43ZzJUUjZ6b1o5b3VBeXVhVFdETkJjSzBEbUFsVkNh?=
 =?utf-8?B?LzZPcytqbVNxdUFlYWtaVmszRjM0Q1ZQNEc0dzNpVGREM1V1K04rYi9NbmVW?=
 =?utf-8?B?SkpQdXpSdHZmcnQ5VGIvVU16OVN1MWVvZkJudGtGVzZzMnl4OHB0Mk91UUVR?=
 =?utf-8?B?dnJxSGFjT3orNWNsc0RUcm5OdzFjZDU3YWRuOHpjSnB2b0xSY0lic3FaMzlr?=
 =?utf-8?B?ak9EUXl2THE3aiswOFRHUFN5VUxqTFYzclk2bXBmd1pxdFFKcXFMWDcwNTVH?=
 =?utf-8?B?NG0xUG1TZnY0YkhLZi9heGgvYlZqekp3MDA0RUdwTUVkMGN4bDNLUytERzBa?=
 =?utf-8?B?ditJMDVsTXZvR3ZaQTloVisxVkU3a1dkVW9SSDcwKzdIUDljMnJNV2tPRU03?=
 =?utf-8?B?eHVxOHE3SmNlcHVFQWNseDRzZ1NIWkpUZUpjOTcwbGFwN0VzZU5UY2padDFF?=
 =?utf-8?B?cFhOWHh4V2YybWE5cjVmaVpoS3hMVXJ5WUdxbzB4ZVJ1RjZOVXlRZFlNRUtv?=
 =?utf-8?B?TVZNOGwrQXc3MHVJVGRud1I3bXdoM3I5VjMySlZWT2R1MXBmWDU1aXMyUlVP?=
 =?utf-8?B?NFJHZFFtZHZZM0EydW00Qkw4bmxxNVRPeSt1dnVBR1lUT0dvMFhxYUh4MC9w?=
 =?utf-8?B?VWpiY1VvVXNaOC92Rmw1VlhWemNrUnR4Yi9NREhCZHZvV0JDYkxKY0dPVWxl?=
 =?utf-8?B?TFVmUFE3NTdQaFNqZ1d6V3BuaDM2MUdWS0hsWjVqRVpOR3JjdnZncVFkdTRl?=
 =?utf-8?B?MTJYYVBZNkNPbU1TUXlhTytFVzMyN1Y0YkpxU29FLzFpSHVWYU44OXkxSEdQ?=
 =?utf-8?B?OCtmYW5mVys4dytxMEVxZzJGczRNbk9kYzZpcHFzUncyRkNkWVpUV3kwaDJH?=
 =?utf-8?B?WlM3ZWpKaE43MG5DaXdnMU5WMGtWNjlJWXNLN0xRTnc1WWR4ZXFJYnhrTGQy?=
 =?utf-8?Q?VPgEVx?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 21:40:42.3656
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1100c64-8b26-46aa-3766-08ddb0431b51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4152

On 2025-06-19 07:38, Juergen Gross wrote:
> Add an extern declaration for start_info_ptr when running in PV mode
> and use that instead of the copy held in start_info. This allows to
> drop start_info.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

