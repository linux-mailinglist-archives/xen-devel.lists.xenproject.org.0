Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA7FCB853D
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 09:53:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185249.1507477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTysO-0005R5-BV; Fri, 12 Dec 2025 08:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185249.1507477; Fri, 12 Dec 2025 08:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTysO-0005OF-8Z; Fri, 12 Dec 2025 08:51:48 +0000
Received: by outflank-mailman (input) for mailman id 1185249;
 Fri, 12 Dec 2025 08:51:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lMNX=6S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vTysM-0005Nq-E4
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 08:51:46 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c90603ff-d737-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 09:51:44 +0100 (CET)
Received: from PH7PR17CA0023.namprd17.prod.outlook.com (2603:10b6:510:324::24)
 by BY5PR12MB4211.namprd12.prod.outlook.com (2603:10b6:a03:20f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.12; Fri, 12 Dec
 2025 08:51:39 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:510:324:cafe::b7) by PH7PR17CA0023.outlook.office365.com
 (2603:10b6:510:324::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.11 via Frontend Transport; Fri,
 12 Dec 2025 08:51:35 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 12 Dec 2025 08:51:38 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Dec
 2025 02:51:38 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 12 Dec 2025 00:51:36 -0800
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
X-Inumbo-ID: c90603ff-d737-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cbj3Aj6BHe9PF6DdBH6CjzwcBHTv3NgV8xHo2H2eIGNNFmSt1RRUJ278OXjw//Cj8T0C2RYnQF5OzYy2BS5qZaJB+qcLSd0x3/tkJ/ECczszIjpyEWW5ZNo/Z2RbZSfUuXxgyvLV2k+DRe1+WVN0k+79feOyNaeer0uLI/6VdHWowdBeg1xX6mCzpO1dbuE4s4uWyyn2KkkwGxbRllQYGtTZBNvP309Boapyx/dSZScYtaML8+dCOCSisRT/4f00fLRxNLraDOGGKzYgywoTI9uClkpFbhURhIKMUv/mytCTqsaMsUbMWyO4Q4wvOjcDv0gB0GMfXN0NQZmPJ0Ny+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5Gt2GpPwSuWo/dyEEr9k8WDRXQN5i2t44W7FjbTCDg=;
 b=bkVhard4anDccWMCd7tyqEQRzwFusSo2w8e3KX4o87XVPk/z4GSpqulDXd+zd7QZSzOPX7LBz6gmY9REMQ1ZhGVWIVaKuJeywW6WRHYnOSCzQOEsDw3EVHrvFQOViiwUWL9BavPLWsaKDo6EdrRU7zr9OIhPaK9qIXEJd6sRbLwQXV73ix3Bc4RDAQjs1aMg4b/PeiVnSL1i7l2vmSws1VatJimX/NDyRzYrYOaeukF+Bb0FDpbmqq1Dzp9E99NNSLryr/EEJdnr7gow5EDAHs71AE8/RG66p4AsjmrFSfIIfbtn6179fBKo4FXYamjSV0Nb16QIzQH01rIZDFp4Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5Gt2GpPwSuWo/dyEEr9k8WDRXQN5i2t44W7FjbTCDg=;
 b=a0PviNBxk4Zut/+4h6utRIo1IY7fbMxj4xVi3VF2kvwXL3eJosvUAB/OeePvcjHe2FfWV/jhdnSmU/qqnWqtF2Tsp52hMYab/Sdqr0M876k1Q3hjgq+1ZYsqX9NPtLGFVItX2VJvyPXoKifY+VKuAaR339DmhZGOERRzXvKJMt4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <ff935ee4-29f2-4f1c-835a-d821bcec79ed@amd.com>
Date: Fri, 12 Dec 2025 09:51:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Ping: [PATCH v5] xen/char: implement suspend/resume calls for
 SCIF driver
To: Mykola Kvach <xakep.amatop@gmail.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Mykola Kvach <mykola_kvach@epam.com>
References: <e57133182b9bcecb519911c8b3f0d871955d6fef.1754540991.git.mykola_kvach@epam.com>
 <CAGeoDV-j4nu1JhHyLpeDoqZ6evsExGvJSws-MK09M4HbUam1BA@mail.gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <CAGeoDV-j4nu1JhHyLpeDoqZ6evsExGvJSws-MK09M4HbUam1BA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|BY5PR12MB4211:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ae5d773-b35c-46a8-abc8-08de395ba9b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZHNodU1oc1B6cW9kcGQrbW9CSXp3QnA4dEpXbFhINnVIaHNFN0ZIaFBXdThW?=
 =?utf-8?B?TlA0bDdZMVV1Q3V4S3pmRXFJSDFNOUVKcWU1R1ozbTVNSnB0WkllbjVWZnM0?=
 =?utf-8?B?bW5saEI5L1pJTWFiMk1GQVBQSldDbmlPQ0kvaEpLWEF5R2FCMDV5QVM5Y0pw?=
 =?utf-8?B?RDhLVVNSVFlBYW16OWZDa0RabWZzdkVVbXVQMjh3OE85UVNmTUpwd1pkWDRv?=
 =?utf-8?B?blpMZVVTV2V6THZpTHRhK01KeGJNaU5ub0pEWmYyQWlVZ090TkVhanBiUkNF?=
 =?utf-8?B?Snl4SklVd3FhWVc5WlhTRWEya2F0WFFzc2JnTGhYSGR4V1FMVi9HdWFhR1JN?=
 =?utf-8?B?WWZ6bS9RYXpLblorMG1mQzZQWVRwaGZvNkZyNHR6dG9UNEJUZUhpOFJLZGVt?=
 =?utf-8?B?Q0lXbjc4UGVrMjVxWWJUR005VVJSeDJjN01zVmtSNlA5WUlqam9nNjZBUGYr?=
 =?utf-8?B?V1QwL0I0QmNJUHdpUEJoR3VhSFY5SjVUZTh2TTdQdlVUeTk3ZDdKeXFxb1Qz?=
 =?utf-8?B?MmpydERISUhOV0xLTGZlMURTd2hBYmNLbFNZQldzdkZ0WWNwTXNBQlh4Szdk?=
 =?utf-8?B?ejd0RDMwWERIMWhpSlcyZXZPSDlFczVYMWRvU0pvOVBtMHNac3NEd2JwYW5P?=
 =?utf-8?B?T1FidXJoMXBMWXZMSmNlbkVRT0FBMXFuSHp5L2x3Y2pLNzdkZkpEZHl0VklF?=
 =?utf-8?B?dTdxUUNBOFZ0Rk1nVjBkdE8xcU1XbnBqaXEraWlhT1ZBc0VUREVYYTBkUFFj?=
 =?utf-8?B?K0VmdktIaXJkSjRUTzVjS3NwL3Zyblg2c2ZLNFArdE5kOC93Sm5hZEpidURz?=
 =?utf-8?B?aGtKbDVyVUFSbEh4dDR1MGRybVg2NXh1SitRN3NkeDF5WWhqUWJhNHVOcmtq?=
 =?utf-8?B?TjUvR1ZTNVVMZ2VMc2NjbXlHbVRId2p3eVk4eGE5WnBvNEFHUDJCYmxUK2hH?=
 =?utf-8?B?YVkwRlYrbHlRZllTTkF4bzY5dGg2dE9naHhlMzNtTUJ3SXdVQ2V6NjFMbXdY?=
 =?utf-8?B?blJab2lENTVIZ3FIT01NV3ptYmQ0Q1E4TElpNkt6QmZUL2xCOHlCSVhGM1Rr?=
 =?utf-8?B?Z0dmbDIwLzl2NDArcmxIVDQ3WFU2Z2JNanJNd0Q5eWpiN1p6azlNRHo4UjZ2?=
 =?utf-8?B?NFVoaTFsZTNJOEdibW91anRxSTlnUXJPZGJYM3Fwa1c3aGFXeXBPSU9mdlZ0?=
 =?utf-8?B?TUhyZW5IOURMWWxNcFEwY3FqY01YZ0diMjV2Y3RlOFM5aU5GMXBXVkw5VlVa?=
 =?utf-8?B?c0pqdWVpalZMdkEvWFI1dXhIQlVWVEdGMlVhUTRRSzRYRmdtczNtUGxjOXJ6?=
 =?utf-8?B?WDh6SUM0enBjbm5ITUhmZ0h3alhFUkhHeDlIT01oN0ZxazZjdVQrZTJDa2VR?=
 =?utf-8?B?bHhMKzJIYldPbDNzTDRMVUZnV3U2VHQ1dnNKNGliNXplOUxKb1lwS1U1dUE5?=
 =?utf-8?B?dHN5a3hUMWdrYmxmQjZHay82V3U3YTF6VFRrTUJUWThUK1lGa3NLUFJzSEZY?=
 =?utf-8?B?RGlLUS9ya1FiSmVWVUVkMVBwVjRqV01Kdnl6M2JFbVJ1Tm83VVR6d0pieWpy?=
 =?utf-8?B?dlVhUjl6MDhDa3NHd2J5b1dtbHZaTEVmcmlydVFlWUI1ek0zcnM0SWliZSsr?=
 =?utf-8?B?Nzc1QVh3eXErc0lnQWhydnBaZzlmQVVwNmlOdlo5WFFLQ0hSWVdMdmJldStX?=
 =?utf-8?B?eXZRbmJzaTR3WTVjbHhoMW5yN04ybjNDVHZUdHVPMm9Wd3d5WlpQdWJ5M29T?=
 =?utf-8?B?c21naVNIdXdxZXlKWGh4aElCWjNuaG9MMkU0N1B0VkRYbDBYNm5ENzA3SE5M?=
 =?utf-8?B?Q0REUm9XTEdnd09acUZ4WjRqSWRtVmJBdk96ZkJheUlzaGRxY1JHbHVYNjND?=
 =?utf-8?B?SitZSEVkRUVIcmp5cGprTUd2WkpKYVFNYmlKK1dhTG0xanUvdUtzcmJvaHVS?=
 =?utf-8?B?ZTRJOGRiMmhRTUJXWEJXbmF1b0F2OWNIcnBCa01sRkVlOHkvRWtaNWdaWUZ5?=
 =?utf-8?B?WllPc0JJYjNlcmd3dDg1RWRnV0VFMjNqZGFiMUZMS2NxNWxUbGtsdHpPQTF6?=
 =?utf-8?B?c1JuYXp1VXJqTTVpQ0lLN0JHV3o2cm9pMEVKeEIxVERsZ3dzSk1aaC9wdGVn?=
 =?utf-8?Q?ZF0A=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 08:51:38.4228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae5d773-b35c-46a8-abc8-08de395ba9b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4211



On 11/12/2025 19:56, Mykola Kvach wrote:
> Gentle ping on this series.
> It has already received a few Acks/Reviews - could it be considered for merging,
> or is there anything else I should address?
I'll commit it shortly.

~Michal


