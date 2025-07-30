Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DF3B16829
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 23:17:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064489.1430101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhEAG-0003Yf-90; Wed, 30 Jul 2025 21:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064489.1430101; Wed, 30 Jul 2025 21:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhEAG-0003X8-6A; Wed, 30 Jul 2025 21:16:44 +0000
Received: by outflank-mailman (input) for mailman id 1064489;
 Wed, 30 Jul 2025 21:16:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dkTI=2L=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uhEAE-0003X2-Uq
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 21:16:42 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20604.outbound.protection.outlook.com
 [2a01:111:f403:2409::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bc4c53f-6d8a-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 23:16:40 +0200 (CEST)
Received: from BN9PR03CA0327.namprd03.prod.outlook.com (2603:10b6:408:112::32)
 by MN0PR12MB5761.namprd12.prod.outlook.com (2603:10b6:208:374::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Wed, 30 Jul
 2025 21:16:37 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:408:112:cafe::6e) by BN9PR03CA0327.outlook.office365.com
 (2603:10b6:408:112::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.11 via Frontend Transport; Wed,
 30 Jul 2025 21:16:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.0 via Frontend Transport; Wed, 30 Jul 2025 21:16:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Jul
 2025 16:16:36 -0500
Received: from [192.168.18.248] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 30 Jul 2025 16:16:36 -0500
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
X-Inumbo-ID: 7bc4c53f-6d8a-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gkehDnYPbTxDQ9UFOWFU4FYw+r3mZvNrj47CXMqb0zXxXBRFIgw6S4W6L6fiT+avz2/YBmXv/aON5U2jz7h0RX5Zxi3wEEtvTtbGu5otkHrwMgH91s2QKIJVHk7K1UgXkWpUFP3ycU/HAR2hMGUoKla3UwZVNNcsOfuNH1zQnsfkiOOWBfgbNZ9K3lm1e6JMK2Jj0MWqm0qp64LWctgVpjze1ctZyoUE6CqIXyasebBWcfh5T0fvU9bZD5sCbmCx6rcwLM+F2DClfsl9EMUjRURe1yZKaTxI8cvs2JluORAuuN+AbB70p9/2Fa5gKYbka1tiBwdccq+y39i8gOBKTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQnoHP9IuN/X3JsDGX2vc23Pg9J3WfCD3RF88NSdH2w=;
 b=HNj+PmmgFpAnT+a/1RhZY1SQ4JzwpYnzP5yZc/kbTTwFKO28rEZjI9K0VWyTFYdmwTRLnOujoHk/yWl8U53ua5lvWI3jPgy4nzoGgR62CVyLSBk5wRdftB9lZ3VOrIOYWkD/ewQVyhsCFIo46NtrJAMCog30OkZ60OuUbvLYtQrlS7x9Onwjy9rxqo6D6Mej+Dtul+DxVLVYZ500L0jZ5GmariSidBHHaPYgGPL4Ait6aHwcpE57sXWdW8LmVlcI0qH6ADSIa2hKzstRC4sLgr6Zm0BFcFp85wX9n3vT3kuw2eHDK43BV1O/6YEsev145bh4WEuVmp8ygfGkS13TNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQnoHP9IuN/X3JsDGX2vc23Pg9J3WfCD3RF88NSdH2w=;
 b=ODff1DgMtmxkYSbRAYK24N4jbrciGFiB/PGr/mh1Pa5NJUa1qoQiBERAPTMSppS2YjJIk1yL01/jTelyQJXq3IA5/2UW2udzNHsriq9YJfK59432/1Vf6stdpadCht+OQ4n87BYlEdWIbtlRP92yEEeffrYqP0Dp5CpcW5VdJ6g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <7487ebd6-9163-46ef-b0d9-04805659c14d@amd.com>
Date: Wed, 30 Jul 2025 17:16:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/17] xsm/dummy: Allow HVMOP_get_param for control
 domain
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-8-jason.andryuk@amd.com>
 <47eaf3cc-3194-4ace-bf2f-a8e2b9be7d0e@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <47eaf3cc-3194-4ace-bf2f-a8e2b9be7d0e@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|MN0PR12MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: 6045d897-8828-468c-b800-08ddcfae5e5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGtEUDZYWnhDVytJb25HZ1lkclRFc0trQzFRMFh1YkQ1NHorVDhETncwYVBw?=
 =?utf-8?B?alFrOHR0cVJGRzN0MWd6NGxsTndxMjFoaGRSUjRrUDRQTGMyZ09PVWQxaEtF?=
 =?utf-8?B?OVpUeWQzTEdyd1ZHUTc5eWozZmw5TmhCck1wZE11MWNZbnRPTDl1QXBkaC9v?=
 =?utf-8?B?dHoxb2ltajZzdi9SMzgyV2hqc0dORktWbHo0N1Fud2FKMDlEdS9JOHJOWUxu?=
 =?utf-8?B?VkhBY25Pa2drU0wvMnBDNmxEalgwdkh4dXUvNXhpaVU3TWVzMUdmTTN0UnVu?=
 =?utf-8?B?YWxVNmNDZDYrWi9BcGd0ODBFL0xZdFhocnNNS2RWN3pDejR4ZXRaU2lDTVU2?=
 =?utf-8?B?dUNaYUwzWGMyRjJmMWJoZGp2RWJHYy96K2FhNzZ1aDlSZGhzVEJuRkNzYXA2?=
 =?utf-8?B?eFNWQXgwUmRVMDRuRXplK3Q3R3lDRGxieUIyVWFGemZkUDQyY05RbjljZU5X?=
 =?utf-8?B?aXdwWFJqZTNRVzZHZElXSU1ITjlIeS8wQXhQQW0yUk1lUDVHdGx3ZmRqRFBk?=
 =?utf-8?B?KytyWkdHZnpXMFBJM2ZvZFkwaEMzaXM4WFRiUUM2RWhlVWhGa3J5d0VrbDhj?=
 =?utf-8?B?STBVRjAyYjZWYTllcnpkYTlCK25yY3Z6UG9WMVljeXE4VGhmZll3YUd3TUNl?=
 =?utf-8?B?Z1NqZUUzelNWZm14K2ZiWlNkSFZwQ3cwZktlNnZUcFRkT01lWjlVSXVseHRP?=
 =?utf-8?B?ZUYzNkh3RjVuZWltRHppSG8vd0ZaNXJRL3EzMXZzQVNHNHdsczgvY2dmVCty?=
 =?utf-8?B?cUExUFMwY2p2aDI3d0djZ1ZLK29wSTFhd2JwQ2JUWk80TW9SaHVwYXRXY1RL?=
 =?utf-8?B?WGtVSjYwRldDdUpzbzh1SEVIL2FYTVU5OElVeFJyU0lsQjdsWmcwV0RWbVY1?=
 =?utf-8?B?dHNHc2pLWGttS0J5cUgxWFdTZmFXVFllM0wyTnNNczJxUVZmbkZRZXlERkcw?=
 =?utf-8?B?emlqNjE5R1ZxRzBMN3BwRG5wblBJTjNXcDZIbFltcU54S2J2MXFZb1VYZ3B3?=
 =?utf-8?B?OVorbjFBNmNhOXRESEd3ZytBcmJJdEdaWDh0NnRpVUdEc1JUekZOQ2Vpbi9V?=
 =?utf-8?B?NzRkc2NsM2p1ZHhPdUZaNXgvWG9PSXY4bFpMU1lNVzUwWktQZWNCK3UvNGg2?=
 =?utf-8?B?aFk4Q3BDek90azI4bTJHeWNJRkVib05rTHhIQjI1MXcvcDc4dzMzdFBJQkZh?=
 =?utf-8?B?bjFqRXVRV2E3ZGl6VWhqTTJ0S2t6N1ZCUitJeHpUZWJKUVVTSW1pTGxpYmNm?=
 =?utf-8?B?aWYzNFZUd3U1NlNrbnlDaHNvQ2p6MEFPZmlVSUVkMXdwWG9PQ1NXc2pQdm9W?=
 =?utf-8?B?cmxvK3dxdkdhTHJwUVJwMERsRXZ0bzAxUndwWWJxY1ZmVU5MR2k4UjFtSGJ3?=
 =?utf-8?B?bk9RRFhtQk9XS1V1M1V4dk9QNkhXd3FScGlwUHQxN1I4WGs0TEJmVU4xaHNR?=
 =?utf-8?B?QStKRlNpSzAwcG43Z0JRQllPVzhYNGJSVGNWZ1o4UlQyd3N6YnJNOWZaOHNF?=
 =?utf-8?B?OUVtUUN5SDBTTy91d2RlRnlRM1kzNDhOTDJUZWhCdVQyWjFOSVl5S2wvOVd6?=
 =?utf-8?B?cU1SRTdTVkk5SG1zY0tkZnZVaHpIVnQ0aUI3bW1hRHhMY2Q0bzJNZHdPQmUy?=
 =?utf-8?B?QjE4UDVsSlRkQlJEbnE1ZE1wcVVHQmxscFp3YXdDQ0xXQVd3bExaUFRKTTVH?=
 =?utf-8?B?Rm9pbjZUbUlreW1DOEdobjhUNldUbzU1VDdxNlB3cmQvay9uSitienJTU1E0?=
 =?utf-8?B?SEtaRndzTzJ4b2l5bmMxbTFNZ2E3R0lsMGdCREVuWFd6QXBDLzhTS3NsdXN0?=
 =?utf-8?B?ekhPSFRZQW93QzZ0QUtTdGdxc0JhY1llK1ZpdHVLMDRVb3ZCT0NVN0lpaHIx?=
 =?utf-8?B?dnMyUjR5amIza2tkb3E3SG5RR3FTdFc4aGZwRkg0R0preEo5Qlkyc1NzRmxt?=
 =?utf-8?B?Qm5UR1NRZ2V5WkVSMGpFblFWWFl3ZkRKSmRZdHM4NS9YOUc0TE1wbFJGZGY1?=
 =?utf-8?B?amlOVStIOEc5dW1KK0ZYV2N0Z3Z2SHBLMG81YWRZdy93WVpxQ29naWZKdS9n?=
 =?utf-8?Q?sNOxJ/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 21:16:37.0515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6045d897-8828-468c-b800-08ddcfae5e5d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5761

On 2025-07-30 11:21, Jan Beulich wrote:
> On 16.07.2025 23:14, Jason Andryuk wrote:
>> The Control domain is denied access to an untargetable domain.  However
>> init-dom0less wants to read the xenstore event channel HVM param to
>> determine if xenstore should be set up.
>>
>> This is a read operation, so it is not modifying the domain.  Special
>> case the HVMOP_get_param operation for is_control_domain().  It is done
>> in xsm_hvm_param() because xsm_default_action() is too complicated.
>> HVMOP_get_param should be allowed for a domain itself (XSM_TARGET) and
>> its device model - src->target or is_dm_domain().  It should otherwise
>> be denied for untargetable domains.  xsm_default_action() doesn't have
>> sufficient information to identify the particular operation, so put it
>> in xsm_hvm_param().
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>> It's messy, but I couldn't think of a better way.
> 
> Fits well with my remarks on earlier patches. The granularity you want
> simply can't be had this way, unless you use such undesirable "overrides".

Following Stefano's suggestion, this patch can be dropped.  With 
xenstored auto-introducing predefined domains, init-dom0less can use the 
introduced state to determine which domains to handle.

Regards,
Jason

