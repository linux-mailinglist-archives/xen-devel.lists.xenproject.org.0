Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF569147C5
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 12:43:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746488.1153555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLhAV-0005xC-Jk; Mon, 24 Jun 2024 10:43:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746488.1153555; Mon, 24 Jun 2024 10:43:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLhAV-0005ut-Fy; Mon, 24 Jun 2024 10:43:27 +0000
Received: by outflank-mailman (input) for mailman id 746488;
 Mon, 24 Jun 2024 10:43:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11f7=N2=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sLhAT-0005ul-LM
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 10:43:25 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93c035b3-3216-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 12:43:23 +0200 (CEST)
Received: from BN9PR03CA0433.namprd03.prod.outlook.com (2603:10b6:408:113::18)
 by MN2PR12MB4469.namprd12.prod.outlook.com (2603:10b6:208:268::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.26; Mon, 24 Jun
 2024 10:43:18 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:113:cafe::42) by BN9PR03CA0433.outlook.office365.com
 (2603:10b6:408:113::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.38 via Frontend
 Transport; Mon, 24 Jun 2024 10:43:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Mon, 24 Jun 2024 10:43:18 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Jun
 2024 05:43:17 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Jun
 2024 05:43:17 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 24 Jun 2024 05:43:16 -0500
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
X-Inumbo-ID: 93c035b3-3216-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKtVPJuuK57ClXBeFYLhdwtK3RKSi93zm6TG19OO4k6fR8l59bxVgFX1tlvvTb8h3RZpHMreX1ojenY+HmlDrCBnAMNs1R7ipHY13NCR23MROC83gx6mWlokJZ3bXi3IlD0Hql20bMlUiOj755ZKF2UerXa5RRLqKp/cAdHAQhiOcDI19XR0FCdl/tsqzFK7ReAcl9ivjCdGjWUBTJHo1cqy5DPfuJ2MdjvC5aaivUW9Ib+37u45XHm8ELCjTalxVwOyrGKsIqOCSZQydQInQKgIcBcXgecIYxEqIdWDejIvEyYlye7hnhvU30h/3lYyJ/VblPGTEH53rP7tuOn5Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vX/XPk4ZNl3GC0+OAmhrZeBaM3J8/ewr8h32CY/Guy0=;
 b=Q+ffqqvwZeuvOQD1fHGrraephcjgxHe5wKeY4v9gNxUJiacnbPhu3D0K8UNN1JkBNU7WjOslSMYLmoD9gubKs6Z3udjS4d9bQ8WsBRI1kNIkbxaxVQGcMoNBgv+xg9Jv3Kkvr1a1j3tklvGjmMz4mOPQ7kkD/GTw1t1zi85EfG+lckv5YRgn6HVarmg+DaItbkShgvUZTM6qijFUDiw+7f1hxA/G5WFiGhrrbAryc4HGipo/yWgVywm8ne7LewydW4x9p1AAVtTjMRyFcDO/rpdYgmhTwPLBPYmPa5Gn4ua5KgyWSYw9rbJYCSft2cpxBwi0K0jj5Y1psxAypEvq0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vX/XPk4ZNl3GC0+OAmhrZeBaM3J8/ewr8h32CY/Guy0=;
 b=wSj0iqcF8yTLogXPLMcyiSeH6w+mvtXpFMwU5Y7YLtGXZoNswMR59PdwRXbkFs+XbrNvzcoLe4cXoWhUuHIf0ywRo3fFpBEcjlXCa6fiqfbWOhLE7rwIt83SxaUvAFb+W/lzXS25Cni3mqB/kz9tuazrluSQgOlsecCxPpDE14g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d69b74ce-13b6-46f1-b2bd-051c913be43a@amd.com>
Date: Mon, 24 Jun 2024 12:43:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] xen/arm: static-shmem: request host address to
 be specified for 1:1 domains
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<oleksii.kurochko@gmail.com>
References: <20240621092205.30602-1-michal.orzel@amd.com>
 <86594fa0-a12d-42fc-ba6c-fe235becf768@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <86594fa0-a12d-42fc-ba6c-fe235becf768@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|MN2PR12MB4469:EE_
X-MS-Office365-Filtering-Correlation-Id: 3175ba24-1800-4ca4-a070-08dc943a75ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|376011|1800799021|36860700010|82310400023;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGNIMkI4YnpYRC9qaVc0d1FTMldHd05wZGdOa0QvdjJFcklZaEhRSy9sUjdY?=
 =?utf-8?B?UE1uY1BqYW5ERHdRRERSeWpxOUZDazBEYmJ4N1A4eGVkVmRQaGVTakZHR09G?=
 =?utf-8?B?b1c3ZmZCQ09GOUlvaklDQjNBbkE2VVpWOXpSQ0hOdVhsNFNRK2MxdVRZTWdL?=
 =?utf-8?B?REx2VEVsc3BteStieE1vdEE2UmpudGZrVk5uT0tWWm5meE9FbGN6VCtvdTcx?=
 =?utf-8?B?S1dLSWt6bTBTWWhJVEhQQ25HUTlQOFlCN1RVWWVqUm9aWmZEZE9xTWVtTU9i?=
 =?utf-8?B?WHlpWHg1Yndrb002dmV3L0swa2VDWUo4d2dqU3NOVXZlcE9sclBRV1pwd1l6?=
 =?utf-8?B?cFVBNlBHaitUR2swOFZUWlRBejFZL2N1OFZvYnpyUzNpSERycnlqaUVpNDRH?=
 =?utf-8?B?WFdPcFV6TVNKSDNpRE5nSnlvSkxLL0gybzNUTjlhazB1TnFWdDRmYzZsYi9t?=
 =?utf-8?B?MlJiK2o2WU1ZWWdGY2pQVHBIMmxVN0x3a3JTRGZaMFBuekNqNUtaTkZBR0FP?=
 =?utf-8?B?NERKVndaVGYrZEk2ZmRXMnQzdnJxYkxZbHdGejRzeGVZTzYxR0t6U0x4K3VD?=
 =?utf-8?B?UW8zRkd1eHdiYUZMV3pTZjhweUNvS0lQNFRoNkJFWGVkZkV5cGNJNVJYS1lD?=
 =?utf-8?B?Vmh4c1pOL3NpUE42YTdKQk1LaGxaWkNQRVRiVmtIOG12ZXBkKzc4Vnhnb3BY?=
 =?utf-8?B?dW9iSTRPK0lWcHhLWnFlRzZyb0cyRW1SK0tXc2lmc3hZNllMdXZjMmZqY2RW?=
 =?utf-8?B?SkRiaGVWRjdWWkluSHJsRGlCSVQyRmI5blNoSlFoeGFzbCtIakprT0dndFlG?=
 =?utf-8?B?cHVUVldzSFgvYmJKcW45MXB0VFh1cVI4MWQwSjVZbG9TOHFMcEhQcEdoeU1W?=
 =?utf-8?B?ME9JeC9UOU9iTDFiMGNhQTdBYTlHN2p0ZlBmQ2owYTRuTis4dkcwZGI2TlZ5?=
 =?utf-8?B?Ymc0aDhZa3dqV0lza3hRYkNIdlBnMWJjbFhHYStQUG9ZaThJMUFIY0ZyTW5Q?=
 =?utf-8?B?Ukw3eDUvUkFtYkp6Q3J3NStkQVZnOG90RnhiRkpXRS92YXlHWWJTdGRPSW9z?=
 =?utf-8?B?OG5CR25Cc2luYTRLSUc0dXVSQmVFUjZzVU9hdmZqcC9Jblhad0pDMk84dkgx?=
 =?utf-8?B?ZFQ0em5WQUxKY2ZhQXpKT2U1cU9BMjNyN0w2UlV5Y0lkU0tpRzZSdnhwbUc2?=
 =?utf-8?B?RlVBMVBkVjRYWXNTT21vRUszWVRtZGVMSXpTTVQyRmhmRnRleEpub01kV0t3?=
 =?utf-8?B?c0NvZS85SEpJcDNPUWtLUEF6a1I2MjZhOEM5dW4yZFY2TWFLQXRWN0k0SU5O?=
 =?utf-8?B?aTFQL0R5Y3pMNTR3WCszRFBVMFJubVoxby9JaGxHQlFzcVNwN3NFM1lIQ2Vx?=
 =?utf-8?B?U2M0M2FqYXp1VTZRRDFiaUlPL09ZMEZtMkMzbUZOUzBlMkJHWkN2RkNLanN6?=
 =?utf-8?B?dVJNaDBqOWlOZHQxV0dLY1QvWi9qdUhlZm1XTkErMFY4RGtrSldlcS8xZGRZ?=
 =?utf-8?B?OGFWVnNYU3BBRU1lMytELzhqZ3VjeG5wWGtKN2tjSDlmTHd5ZmhacXpZdmdX?=
 =?utf-8?B?UzBvVUYxQmszY09hNnVRN2ZrbVBjUTF5cllQL1NYK0MwM2ZJRnpVa1pKTDA0?=
 =?utf-8?B?Y3UzeERwSFpOYlBSUFByZVc5OWZPeXp3RUxnTkVQc0tHSVpZREJwYzNGVHVO?=
 =?utf-8?B?VUFKRnY5VG1BN0FTaFpnQUNLck02UjA4bzFHY3M2cjZSN2hKT0pEdU5GMFZm?=
 =?utf-8?B?WU9rQ2M5T2p2dy9Cc3ZTOVI2V0d6RUZxL1hnOXQ1UEhFTXhtR0M0V0hNOHJi?=
 =?utf-8?B?ajBXZzRzUktIeS9yY3FLbVBJdjhBd2s4TFRHTkJHZExocGR2Y3IyNmludVdT?=
 =?utf-8?B?MExDRldxTmJiRGFoSFNKeWRRbUNxZzllQmRuMHQ0bjlCUmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(376011)(1800799021)(36860700010)(82310400023);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 10:43:18.2469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3175ba24-1800-4ca4-a070-08dc943a75ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4469

Hi Julien,

On 24/06/2024 12:22, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 21/06/2024 10:22, Michal Orzel wrote:
>> As a follow up to commit cb1ddafdc573 ("xen/arm/static-shmem: Static-shmem
>> should be direct-mapped for direct-mapped domains") add a check to
>> request that both host and guest physical address must be supplied for
>> direct mapped domains. Otherwise return an error to prevent unwanted
>> behavior.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> I would argue that it should be have a fixes tag:
> 
> Fixes: 988f1c7e1f40 ("xen/arm: static-shmem: fix "gbase/pbase used
> uninitialized" build failure")
> 
> Mainly because while you fixed the build, it was missing the check in
> the "else" part.
> 
> I am happy to update it on commit if you are ok with the change.Yes, I'm fine with it.

> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>
> 
> Cheers,
> 
> --
> Julien Grall

~Michal

