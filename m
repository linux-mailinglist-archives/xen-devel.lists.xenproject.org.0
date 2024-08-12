Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 733FB94E7A4
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 09:21:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775368.1185580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdPMR-0005rc-Su; Mon, 12 Aug 2024 07:20:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775368.1185580; Mon, 12 Aug 2024 07:20:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdPMR-0005ov-QF; Mon, 12 Aug 2024 07:20:59 +0000
Received: by outflank-mailman (input) for mailman id 775368;
 Mon, 12 Aug 2024 07:20:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dTGf=PL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sdPMQ-0005oo-N0
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 07:20:58 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e88::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a16fe15-587b-11ef-bc05-fd08da9f4363;
 Mon, 12 Aug 2024 09:20:56 +0200 (CEST)
Received: from BY3PR05CA0012.namprd05.prod.outlook.com (2603:10b6:a03:254::17)
 by CY8PR12MB7610.namprd12.prod.outlook.com (2603:10b6:930:9a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 07:20:52 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::a3) by BY3PR05CA0012.outlook.office365.com
 (2603:10b6:a03:254::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.13 via Frontend
 Transport; Mon, 12 Aug 2024 07:20:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 12 Aug 2024 07:20:52 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Aug
 2024 02:20:51 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Aug
 2024 02:20:51 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 12 Aug 2024 02:20:50 -0500
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
X-Inumbo-ID: 6a16fe15-587b-11ef-bc05-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LimKdPUhEV6uSspmgb2zCRfHOPakUbMibdp20t5nqSQA9dpXTL+0QHgd/Tn/E9ZeCl+gjc3R20KNxmnzgtWH2IooqFkMJyRVDUR7mqqjzd1Wi+M0B3fE77j48RPDxKxAAwggZkg5SMdsMogGEZVsV7f1n6btaEFS8gtXPGdvYRNQMrGFNFpw6auZWxcRfIufCHauZyN18w4oIygXDbI6eWtY/kjuJauRurFG0ZGaVmScph4Z/kfLvSTwKPCrEI6yZlWUrEGootB1hGZfYHOtGczhm//8y2TSTIi4WMwnRQOBjko8RAMJvYXHULX9FOFWrmhp8ZVLGtJWPOZ6boW23A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tx+A26PbBCwr/CSm5vc0HT5mhmd7zoOhVNSwpuhgSlk=;
 b=h0jK0bbvH/4+tlH2lAKKcsNEfksCtMALE78Az9CiTxg6pgBHlDTQ/bbo9/OogMYu1IDjuIcTVbMv5Z+4uHbICAfREAWEWHYXXc+k1NJUXJtaQ7vOt8mKPAkVSnXdYa/+QY1Zt+yK9a5ZnHdlHNTzrCAYn2zlng39VFSsM6Mylu0GKQxCwz0mcaezm+gq7MSk1j1HQ7tO6pVOQsIWu8td94W/Zpm3xdQzpCOpSRE+arPebwLWBfloFzXVE84oQG7YjJ6nIniQei/M4xRKMuAlA5hvgCxWKKYfyXJx029DApdsPtNjjjT30XzICf6AyhVkMhcxkGH6fkWexz/fS3RUGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tx+A26PbBCwr/CSm5vc0HT5mhmd7zoOhVNSwpuhgSlk=;
 b=T8RlMa0PesMIYJt4rBtux7z7MBb29PNyU6jrMeS+JdH/qTAO86OzA9JdvyrQDPAl/J4fEPUVG2mnduUPsIcRqIjBTI+A7BIt+Chvdy90MKi81x+LLqUM5JD1uIxNvBNbeEKb2LXWRaVEVciTDiYmO3SS9CY4cbIOfzgL6WeP/U4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <20340e59-2bbc-49e7-9827-b9b55fa3fb85@amd.com>
Date: Mon, 12 Aug 2024 09:20:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] automation: disable Yocto jobs
To: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <cardoe@cardoe.com>
References: <alpine.DEB.2.22.394.2408091700560.298534@ubuntu-linux-20-04-desktop>
 <20240810065920.415345-1-stefano.stabellini@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240810065920.415345-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|CY8PR12MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: 39e3193a-af1d-4196-866a-08dcba9f4c67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VXBvN0Z0QkFxdUVaRFR6b2xidytEdmJnRXBKajFUMUtBdWdIYVVzRWtuc0hr?=
 =?utf-8?B?R3dJeW94YlRaZG9pbWVzM0g2TDdnR2liaElGdmdkNzhjOE9PWE16U2ZiSlo0?=
 =?utf-8?B?NmEwZ0tRR1pmUG0vbzZGaGR5SlBzeEtVaEFaRkZOcjNMNVNtZkQ1UnJkb3hX?=
 =?utf-8?B?WG90TkxRZDNxVHRYdWJWb2I3UWFyclRvTjJyU2JZdHhaWGZEUXBkZ2FjZ2d1?=
 =?utf-8?B?QWNnTVR4bU5PbHFqamNVQ3IyYVBTdDB5OVhTNy8xbE5FNVJtVHovSkEwRFNV?=
 =?utf-8?B?S21PM2hIUmI5c00wanU2SmVBRWdGQWhrNE1XSlJOMjlKYXFMZVdZQVRoV3g3?=
 =?utf-8?B?SzVSRUkwandPM29uemRCdUgwakpaMFYrc2R3VEEyRFRMcUFGN2p5UXJvSEZn?=
 =?utf-8?B?ckZ3VTlSb3R0UFg1dlNKcFpicm1DZFlPNmV5ZEdDTXYxSWxKV0tXQis2Q2Qw?=
 =?utf-8?B?VXAwK1ZMWHZ3L3YxTW85MlozaTk0UmRuZUhaVmNZK1ZhTFA5SDVuSkk1VXFu?=
 =?utf-8?B?eUtLYVlLdXZmN3E0V1lMa0FhUmFoUDMxcjBPSXlSektDWXNtc2JWSjdXYUsx?=
 =?utf-8?B?aFB3dWo0UE5CSmdwSGdnRDhDcGRoZGZKc1ZYN01RWm1Dc0hzWmZGdHVKbU1r?=
 =?utf-8?B?cnFzbHkzZ01jQzA2c2pJQ0h1dlNsS2svV2JjTEZqbzhhZzYrTXhTQnJ2aVkw?=
 =?utf-8?B?UHRaem9CcUkrM0dOWDNXM2RqMVo0VHZDL1V5WkU0a09wQnJvRmVFYjMwdFNr?=
 =?utf-8?B?cHZGMFZNYkxGeVpvd0doWXg4OTl4MGZzeVlwRDBWZVQ2NE94bFRROXg1ZDJi?=
 =?utf-8?B?SzI0TWMwSUg5SnAvL2dyVi84MTh5RW5Xcm5qb25JV3hGeGJOWWVoMmlOeGo4?=
 =?utf-8?B?eXNZamxpWUF4Z0luYkl5Ly9RQnRaYjcwVXFhM2xzQVhMazMyUndjU0srSkZK?=
 =?utf-8?B?aVNpdWVIa2RGY09VUUd0a25kUmJic1FBcm1FWjZ2RWxnOGlEVHk3dk5MR0ZJ?=
 =?utf-8?B?aVZ4c3N2U2oyUVIrNGVTZHhHaStMWVdMZ1BSc3JHVnlwK09ha21IMHFDZkt0?=
 =?utf-8?B?Y1V0TldUTlhCZ09FWTRDMU50SFRFeGhVOHcwVXpEK3o2N2Q1a0xMeHRhQ0lZ?=
 =?utf-8?B?RGhhT0FpNzlkREt0TGJhVXlWZ1lUMW5UbFlEN05vUytUWU9JQ2dsaWY5MlhV?=
 =?utf-8?B?dFpvVmVjUE1hMFk2RUtIc2h0SW5sZnlPdHd0aFZsaFlGSmswcGVrWC9NRnFx?=
 =?utf-8?B?YUZrbnhNcWFFOEFqTHVoWnNDNkNUMk1GYUVmRG4vd01KVStFTlgzUTZrbVhH?=
 =?utf-8?B?WjFKMGgwQ2ptRmVRRjR1R0N6cmsvMjZGNEFWRHd4dDlVWWFUU2RHR2NKcW82?=
 =?utf-8?B?dDd5d1VrU3djWGw3cHEvSGFGbk9iSGNXdXJyOERKZlhrbUlzWUVhUGpxWTZB?=
 =?utf-8?B?QkZLV0kvMFh4ZEZXbWhWN2VzR0hKVUxRR2xjZXVjdXlMMkpHR2ZBb2FJNFN6?=
 =?utf-8?B?ZG5qbS9vUmlvS3RNTlczMWJ5VU1BNmFTdHhtVFRRQy9vZDVHLysxRnhQdm0x?=
 =?utf-8?B?dWtBWGlvUWQ1M0NrMnp3TlJPVHBLYXVJUVF1M29JOE00QWRQOUEyY1VuUmhx?=
 =?utf-8?B?ZEJYZlc5QkNuNUd3SVNPbHVBb0E1Y1Y1VXR4eDMwVFJyUUFGUjlSUm0zZ2pn?=
 =?utf-8?B?ZjNGZUJySU1PeXVGMnJNS211SmdFS3FrVDIySTFUcm9lbzMwTWJpOEhXVE5G?=
 =?utf-8?B?azlkcnBoRzM3VHZkQWRXeisxekdHNDBNM2twRStoanBkSlgwSWExSkdMY25u?=
 =?utf-8?B?M3IvbGFtM1pXUGFVOWtMc212K3BpSGlKS1lvYnJObWc3S2V0RUdpdk10K3pJ?=
 =?utf-8?B?dkw3eW5pN0I4K0dsOXVXaTdEWVBVclRaMm9rS2tXZ1pQaWxaWXFLR0Vjbm9m?=
 =?utf-8?Q?QuIxVvD48Cs9tp9vsa3ybbaBVETt4GXa?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 07:20:52.2780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e3193a-af1d-4196-866a-08dcba9f4c67
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7610

Hi Stefano,

On 10/08/2024 08:59, Stefano Stabellini wrote:
> The Yocto jobs take a long time to run. We are changing Gitlab ARM64
> runners and the new runners might not be able to finish the Yocto jobs
> in a reasonable time.
> 
> For now, disable the Yocto jobs by turning them into "manual" trigger
> (they need to be manually executed.)
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


