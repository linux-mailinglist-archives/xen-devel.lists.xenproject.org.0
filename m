Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B55AE2446
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 23:43:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021334.1397340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSjWE-000792-Pq; Fri, 20 Jun 2025 21:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021334.1397340; Fri, 20 Jun 2025 21:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSjWE-000757-MG; Fri, 20 Jun 2025 21:43:30 +0000
Received: by outflank-mailman (input) for mailman id 1021334;
 Fri, 20 Jun 2025 21:43:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZSV=ZD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uSjWD-000746-Q2
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 21:43:29 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20625.outbound.protection.outlook.com
 [2a01:111:f403:2409::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 977061af-4e1f-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 23:43:25 +0200 (CEST)
Received: from PH7P221CA0007.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::10)
 by DS7PR12MB5720.namprd12.prod.outlook.com (2603:10b6:8:73::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 21:43:21 +0000
Received: from SJ1PEPF00002321.namprd03.prod.outlook.com
 (2603:10b6:510:32a:cafe::a1) by PH7P221CA0007.outlook.office365.com
 (2603:10b6:510:32a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.26 via Frontend Transport; Fri,
 20 Jun 2025 21:43:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00002321.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Fri, 20 Jun 2025 21:43:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 16:43:19 -0500
Received: from [172.17.97.97] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 20 Jun 2025 16:43:19 -0500
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
X-Inumbo-ID: 977061af-4e1f-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2ZokDvg9a1mpPHBlXMjXQkqPk2ZWcIGOHO7dLpm+CwRCmlQPGgjIGszXbNKAHtyi0TgnJGnN+QFSQCyBbPQIM/t9BHW1QUG0x2XAPcfkFSlhZiUbw2gYYC3MhtiKyyEuxeRN/SkSjEJoSPkPS5fWYDUz+J2pd5dIVpsnCz2VWMtXqJ/ddvjKPtbskFJpEd/lo90nEEiHfElwgXWDrO8kuL28S0zBl3B8V5c3JFmWCogBO9DFMyusj2A+bO+wIxnh4HaWHnZOQK2yIOy51XdJH0wOURzC1eWi5vrkUuoAk6zmKC2U49dy05KuXc4iCKRJdB89GMcLcUe3oGbLQt3sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQvmOxN6quxI4kKQL9VOnr5Rqa+cO8pgNIkGfJ9G88U=;
 b=vKZn4D4P2CDFvjTBeReQZyB1/9Dw6GB4TEfMFe1GMuNlSAOSIHNlRhDNoyIxNaCQEYRNJWOAe43PJYvQXeT9wYPH0i05nv8dxTaSt71EeMbMF5AtuXcIopKnRvYdug2y4ndGaH2UFG+L0oX4KH/shCDS6ERcZppc8mc8k+LVvOg5CnB2wNpTktBxn6SD/aC8TZXxAfqsH7HDc0U8K8/qcdH2xRpYfsILrmnpxuY8CXyIqWJoEfj1JvldkjUSIIJaFclZHL91HTDJGWgs0djizswQ1GX6YrAAGqVrbWpjiod0RUCu0ki2BrJQ9oY45j49d9jb0/ZVBwVSZKyX2X6n5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQvmOxN6quxI4kKQL9VOnr5Rqa+cO8pgNIkGfJ9G88U=;
 b=XqOsnzforKYaCOrf42UXxFok3WuuszREhzNDLxz1Z2c/1qB78l8aWKRev+QZWt1LrSUlrMk9+NpPasjBC5LrO/B84vm3wCog8rhULilBGYgCVzyv4ri/n3dAQB2/OXo1zj15Qmv4J4LSTwp3hQ7+oI6f4rgTiBplwzLur7T+6z4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c7a90ed4-f0d1-43f5-b30d-f9b90c91bf9d@amd.com>
Date: Fri, 20 Jun 2025 17:43:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 6/6] x86/pv: make start_info_ptr PV-only
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250619113804.32694-1-jgross@suse.com>
 <20250619113804.32694-7-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250619113804.32694-7-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002321:EE_|DS7PR12MB5720:EE_
X-MS-Office365-Filtering-Correlation-Id: f10dddd1-7ba3-491b-0d48-08ddb0437996
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHRXamtDRmkrQ3dhNllmaW1ZdklFM3B0VVdwRnJraEZkZnNFK3V0Mmo3RW9G?=
 =?utf-8?B?M0hEbmEyZjlndXhvazY4cURaVUl1NHVNYzNwSzJBcFhWN0hLbUVqZXczRXRv?=
 =?utf-8?B?Wmp0ZzZOeHNWTDhGeVcxRWYxTERMZG9lNUJTWGdCN1hkVmZuUk5Pc1ltd21U?=
 =?utf-8?B?dWNzUGVKd25BcU9YT2F5ZTMrTVZkNFN3aWUzRFpjRGZEMEpud1lQZ0RicG16?=
 =?utf-8?B?VENkWHpQMnBnNVFUWEpNMGc1MGVPRVBQRUlwKzNsY1NCSGFGTzhIVHdFMFNO?=
 =?utf-8?B?aGd1TUNTdEZRNGN6WE9Nd3RtRHZVc2lCMDVkdlRrNWRRS2lCMWw3N2N1Nm9l?=
 =?utf-8?B?eUNuLzFVOUR6VFZheHU3cXVCZytWa0t1NmVwSkJRREFMSW9qUjRvcm5Yd3Qr?=
 =?utf-8?B?MEFJUU42d1dpbEJWZnUweityUGdvR2ZIK3FtSkNCQ0VscDI3MHo0R01JRXoy?=
 =?utf-8?B?MGVORjFES01RRGFyYi9jZEF4VytSOVlCc0dHS2c1UElQcThUc24wRmYvQ1dw?=
 =?utf-8?B?U1RvOFVHa0VwRktPdkFsWUV2OGxyYnhYeVBXUVdGYzBlaTdxWXV1eXp5RE5B?=
 =?utf-8?B?dnBMVFp0Vkd6bXI2VGIzN2hNRDVjcW54YXRzMWhyWFNZeUlna2FGWHZKN3di?=
 =?utf-8?B?cnVKWWFYM2FTSkJHTTUvSys5bDR3SkkybTVhcjdjN3JISW9tR1JVWlFFZnZm?=
 =?utf-8?B?enBIemdvOFpNTE55bVRld3RSVzVkaXQvT3gvN0xmeXpJVGh5RDUzWVZ1R3lz?=
 =?utf-8?B?YmN6SzRzRjNvM0EyL0J0ajFIMDZCTXVxMGI4Z3N2WEhpQzI2ZXFxZVYxUVhI?=
 =?utf-8?B?SHpzMFF6NDdaOHU2SkdqcWRGVndXcUFmYTEyVVpXbS82bkxmdDJPbXFOSmRl?=
 =?utf-8?B?NXJkeFUyaUpwTEZZUmg4WldpMlA1bnhqS0crUUp5ZkNyclRBTVhRYURuN2pR?=
 =?utf-8?B?KzEzUjRHMEkwUnJtWi9TSTY0emlxVWp3N1poNzlvVkJ2WTc5d1V6dFBEMUcr?=
 =?utf-8?B?SjdTK0N2MEJzRlFNWUp4Y05FczFSWms5dXVDa3ZXU0RaMDZDREtmeTlxZUFM?=
 =?utf-8?B?K2JleXFSN3lpSmhVVk9ZeGp4MGY4SGNzVWU1dTJLcmlsTzIwcmZIck12Z1dm?=
 =?utf-8?B?b01UMzliRXVlaWMvVFo1ZlpTeE1BNlNYejIveEtnTWxSeEtndEFTRDdZY240?=
 =?utf-8?B?ZVVISkhaNjYwRXo5WGF5YS9kcHowQm8zakxCaUZYU2ROSjBaYkxWYU4zMG93?=
 =?utf-8?B?OEpUMmtBdm9zbzlPbmxQbTVITWhBa2FFMVhZZENUMkQ4TFhOTU5aTy9HTkF6?=
 =?utf-8?B?UWI4MllUb0daTG5naFBpUVdvWXZDRFgraDUxdzk1ZUZ3OVlMM1JIT3BudlFi?=
 =?utf-8?B?TUVoTG1MeHo2NTFmbjRvdUhHU3QzQlpqSWFvMzd2TVlBUC9wZWdmT21HM1pO?=
 =?utf-8?B?TmcwTTFQaitvTWNQVk93TW9BdEdEbE9vSVpNTEVMdzVFRlUyVEdJTEVrcW9j?=
 =?utf-8?B?QXpJOHJ4SlBvTXlTU1FDMVhTeUhQa2lFT20zcFhvb0hIallCU0JSMThlbnQ5?=
 =?utf-8?B?SlFpOTBMQVJIekZocWxXZEN0OFFUMmxHZ2ZEUjMrRjlReEk0ZStKdUtzQzJJ?=
 =?utf-8?B?dU5UNS9xNVlFVG1UanJqR0JHdGZxUVRxajk0RGFMM3RnMHI4OUwzQ2RLTXlO?=
 =?utf-8?B?SUdYOFAvL3FuYzlST2ltTnBycVpwWkJHSmg3UG1XNmVUYm83YTBZTWdQcEV3?=
 =?utf-8?B?Zkw4Rm1pcmZKc2d2a3d6NjZMNDBUdWN3OWk2TzZEQnVQWWxsTlU4a3BpaGhu?=
 =?utf-8?B?RVVUanovblZwQmtsSWxWTmlSb05iRlZjcjFGeW9qNkF5Vk9iN0F6clJNOTIv?=
 =?utf-8?B?MHg3bC9lYXNWSmJFdEkwemV0NXMxbTZ5MVZEZXBVZFJGZnZxdTNha0pqekJh?=
 =?utf-8?B?Smd4Vnpva1FIVER2RFQrbzlsZ3RBeDFlZTQ5Tm55UjF0VjhlKzVRVkR6cHdp?=
 =?utf-8?B?MHJ6akZJb20yeUVqOEI1MzFDZmRCem5mYlNIdjJPdGN4Z1Mwd1lBaU81TlJx?=
 =?utf-8?Q?EYMaye?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 21:43:20.4307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f10dddd1-7ba3-491b-0d48-08ddb0437996
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002321.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5720

On 2025-06-19 07:38, Juergen Gross wrote:
> Hide start_info_ptr via CONFIG_PARAVIRT in order to avoid accesses to
> it form not PV specific code.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

