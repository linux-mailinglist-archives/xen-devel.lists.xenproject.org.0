Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4016B1A272
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 15:01:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069306.1433189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiuo9-0002zk-44; Mon, 04 Aug 2025 13:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069306.1433189; Mon, 04 Aug 2025 13:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiuo9-0002xm-0G; Mon, 04 Aug 2025 13:00:53 +0000
Received: by outflank-mailman (input) for mailman id 1069306;
 Mon, 04 Aug 2025 13:00:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dY6Z=2Q=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uiufw-0003gP-LZ
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 12:52:24 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20622.outbound.protection.outlook.com
 [2a01:111:f403:240a::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd0c7a92-7131-11f0-a321-13f23c93f187;
 Mon, 04 Aug 2025 14:52:23 +0200 (CEST)
Received: from SJ0PR03CA0044.namprd03.prod.outlook.com (2603:10b6:a03:33e::19)
 by IA0PR12MB8648.namprd12.prod.outlook.com (2603:10b6:208:486::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 12:52:20 +0000
Received: from MWH0EPF000989E9.namprd02.prod.outlook.com
 (2603:10b6:a03:33e:cafe::e1) by SJ0PR03CA0044.outlook.office365.com
 (2603:10b6:a03:33e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.16 via Frontend Transport; Mon,
 4 Aug 2025 12:52:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E9.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Mon, 4 Aug 2025 12:52:19 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Aug
 2025 07:52:19 -0500
Received: from [10.71.195.192] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 4 Aug 2025 07:52:17 -0500
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
X-Inumbo-ID: dd0c7a92-7131-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kjlkzf5lK5qpo/haG4LxK5IHsSHUBdlocKG2TvRKGQx0liZJc8ryaQq79uDg22MJMIY3VTw7GPOQp69+vT56qW/7ysvMA0ooQ3ICJi0u8CWqLTjYgIJUYfNGu7NM18iQ5STxBil4yp4lYoUPyugZKgHFOu1ioVYa5pdy5QtOHnRSAwq4muG02jvxujvikKNU+v/1BNAv8eDL3K1yMLK2Hmz9b69M2eYg0QnVTq05hdUYKhmfKe83bwDBFGdsIqkDa2Cs9tEFqEF25YJkMPGu3knsiatDnwTklVA/vak4J6sXAoNqT0Lk6laW8HIromaAxozMOjpWlZhNDptnVUU6+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGJp2Gz+KZrlL+Yrp2lXKbTfgXaOVfUOMZCh7zwC/X8=;
 b=PQoaXJ7ZtHIC5zmED01o44KWDVYQ4ebitb10Ndz7Qkn74d+ZHeso9baNDJ/weG3qnZnaTfuleAgnOrszF4gN5D3B80fv3OHTRP6PcwB/MqfqFzd8NWDW6ZJLXc2LSx0mIDWkgEc+fGaBeuI7OBySdWc50mWDxJmHzUPqHq/P/rvT/T4n1V00Dcyv9rvVxDhb0+IWSz8TDUYQtro3oT8lBWLMZ46XtGR79l2FZ9WqTJ3UNC54/fZ1ggDhPnhlYcnKcRdCMC487zABKCecoClnqI26musiZa4NIFqyEnJExPHq4XO1KFtOUREYt4XVdC7ttSi8sUcHQ1xbtS9NtwIt3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGJp2Gz+KZrlL+Yrp2lXKbTfgXaOVfUOMZCh7zwC/X8=;
 b=SZTjJF0otAXWL9fuEPZjeKX3pVMMebFMVFGFAKwtOkpm5ieNBnj1kUJAqp+Smpg3W4x/3Sd84ftJbMB4SMLRy3IxwUGY4ydLFXZxfTdDI+643MrtaHptNiK/22Uf2JgFw2UJOSybQAtgU1eMebFIYp4StWwgJLRmV19/ZrKsvuU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <7d416038-a867-4f80-8500-c0d6e1c6530b@amd.com>
Date: Mon, 4 Aug 2025 13:52:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm/mpu: Implement setup_mm for MPU systems
Content-Language: en-GB
To: Hari Limaye <hari.limaye@arm.com>, <xen-devel@lists.xenproject.org>
CC: <luca.fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <cover.1753864612.git.hari.limaye@arm.com>
 <d4dc1be6f581c0c090c0cecb6fd49049a46fefee.1753864612.git.hari.limaye@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <d4dc1be6f581c0c090c0cecb6fd49049a46fefee.1753864612.git.hari.limaye@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: ayankuma@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E9:EE_|IA0PR12MB8648:EE_
X-MS-Office365-Filtering-Correlation-Id: 97cd5dcf-0003-4eeb-6d1c-08ddd355bfa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TjRhOVpheHRCQUJwbktpTnc0VG9GNE5iTk9LUnNTNkFWZEdXa1pWT2FuT0w2?=
 =?utf-8?B?OTZsVjZIM0hEVEU3a1dyd0Z1UVpwSWRiY2Q2RkZYNlRkRlFpSlFwRU1UZXF1?=
 =?utf-8?B?VlZaNnZLL0ljb0FJdjdKM3J6VVVwVFRrK3NkcG01V1hBeVBIY2YzM2hqSEhF?=
 =?utf-8?B?UzJEMWtpck5WU2doc2lsOUhhc3VwQUdUSDFMN1ovRW80VktQS1A0RHE3ZnhK?=
 =?utf-8?B?WVBKekQ0R1N4TkRLWW92dkVQZGN0dE1ScEdGbTIxZ1MwNFVUUWRWUGNGQVhE?=
 =?utf-8?B?bCtoZXh2RWxXRnRmR2F6L082eHpXTzFOZkdISGlEK2F2MGpSVWx2OUZ6bjNS?=
 =?utf-8?B?U1hCMzNDYlloTnAvSXJEOEhLVHFjQnJuR055K1BJQnVveGs4TGZYRTVEZHlQ?=
 =?utf-8?B?VFAwRmxBK2R5dU5KOHVtK2lrUDRiUU1GOWFaRmIrTWI5M09ydlc3dnZHMkdC?=
 =?utf-8?B?YTY5UHFGd05yT3V3L09ZZWU3Z2NrY3o0Tm8reERabXFEQUNiZXlTMTd4ZjdP?=
 =?utf-8?B?NlZ4YTNaOVRRdVBTUndkTjJaMGptc05odHpKQTkxbmt3eHJOOWl4SHhnbkRr?=
 =?utf-8?B?S0VNS1JEVktGSjNNcWtZMTh2ci80WnREb2xLS0k2ZUlYOGxJRm5Yb01yOEN1?=
 =?utf-8?B?bHpIMGY4aDkyT0tpQ2wyVk9GTGZESFE3QTV0VVNxWUF4cjRCZ0duWGJlNFNn?=
 =?utf-8?B?eVF1UHE3K1RaMGc2cm05cUg1aVFKVVRNUEhBRkFQK1lsUUppSS9QSno1aEs0?=
 =?utf-8?B?VlBMVWdDU1FHVlRmTHdSNkgxWVlVUGQxQXlkM2dpWldaaXp3UUhrSHNldkw5?=
 =?utf-8?B?SlROL2JUcERFbzhZS1hKbG1iejRPWTFZaXk5T0JlNUJTVmw1OUx6TUQ2ZUNY?=
 =?utf-8?B?dnJybktZSTFyd2hTdGJ6dDN5eWlLbW5Sb3VMYk5SZjhqZU5Ba0tKbm9lTUxn?=
 =?utf-8?B?ZUFSalZ3OGdhenJYeVFod2RKNGJkaVRQY1NQWDR0Y2Faek1wMlJzUzdFR2xP?=
 =?utf-8?B?ejdEUUwzK0FQalk2VHEyN3BNVDhWam9jUEFiMmcxYm05VEZSMzB3T2dwc2Zm?=
 =?utf-8?B?S2p4MzBTemZxNkJlVVlYcEt6QkVKNTFybkJPcDFwTHRhREs4QlZJVVp4QkpM?=
 =?utf-8?B?MTVhOG5YSkFhQW5Wa3AvSjJNN2NoN2M0TVhqQlUyUzNVQmFGcUdZSkQrNjU2?=
 =?utf-8?B?U1c5NXBITlMwZS8vOTlWVGVMMWYybFlVZDY4UGlQQ2xPUitDNVhmVUEzdE9L?=
 =?utf-8?B?VXY5MmpXMGczT29kT0RuZXp6NWJEV3o0VHpSam9UUWY0SlM4QmROMTZyd3hJ?=
 =?utf-8?B?dFpRNjhiMnNqamtlSnBvMldUTDBBem1Hc21WaXdUT3FsczdGeUY3OEpvL0lU?=
 =?utf-8?B?U3oxcUc1RDd4amdaMDNZU2M2TUllTnlTQ3JHazBzT1hOVGhiaCtYODlMRTJO?=
 =?utf-8?B?U2p2eng2NnBUeHFyRU9vWTZadExjc2VKN3FkSzFqbnBoVXoyNXhzSnd2NDNj?=
 =?utf-8?B?Q3hjVW5PcjhCY3hHdjFrVitvZFRHdDgzN1hzcG1TUWJRYzN3ejFYRlhZKzNM?=
 =?utf-8?B?Qmt0R3M4d1F2YmNRQXhLZTJZOE11ZmpLQVExOHg0VTlSK3FwY2xaZUJqUDFU?=
 =?utf-8?B?Znd0bVMyUlpqYUFrd3Zic2xGNHdMT3IwVXhScnp4L25CMGEyYUp0c011ZXp5?=
 =?utf-8?B?d2pDQXlmSTNNOTVDTUQrTzhzamNGYjVmVlprVk9iTThReUVDdmp2NVBPMnFM?=
 =?utf-8?B?ZUpmK3dESzB4bk9DYUFhdzROWWNMWU5FOUZXV0R4cVJndzZNZHpQbi83cmp5?=
 =?utf-8?B?Tk9jdy9Td2xGTlViVU4yQjNmVnF2c3N6R1NFZ21MVjMyWXEvSWdOMVBHU1po?=
 =?utf-8?B?Qk83eGlidDhBbU1jQ0doTU91engvdXRCd0Q4ZzFYSHEzSmhvRTRpMC9jUkZo?=
 =?utf-8?B?RzNCS1lpSVU2Tm02RG50alNqNjd0bWJraCtLenNxd1BXdmo2cms3dzJLaU5a?=
 =?utf-8?B?Ynh5OXU3d3JqQlViZ2Y1M2U1aGloQ09DTFZFOHJIcm9tK0dkM1RpN1VCTDFZ?=
 =?utf-8?Q?KaIJ++?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 12:52:19.5834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97cd5dcf-0003-4eeb-6d1c-08ddd355bfa1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8648

Hi Hari,

On 30/07/2025 09:45, Hari Limaye wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> From: Luca Fancellu <luca.fancellu@arm.com>
>
> Implement `setup_mm` for MPU systems. This variant doesn't need to set
> up the direct map.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
Reviewed-by: Ayan Kumarb Halder <ayan.kumar.halder@amd.com>

Tested-by: Ayan Kumarb Halder <ayan.kumar.halder@amd.com>

(On R82 and R52 with some additional patches)

- Ayan

