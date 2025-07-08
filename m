Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 189B2AFD7FD
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 22:13:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037257.1409912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZEga-0002pj-Fz; Tue, 08 Jul 2025 20:13:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037257.1409912; Tue, 08 Jul 2025 20:13:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZEga-0002mb-Cl; Tue, 08 Jul 2025 20:13:04 +0000
Received: by outflank-mailman (input) for mailman id 1037257;
 Tue, 08 Jul 2025 20:13:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1xvV=ZV=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uZEgY-0002lD-At
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 20:13:02 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060d.outbound.protection.outlook.com
 [2a01:111:f403:240a::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f10c564a-5c37-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 22:13:00 +0200 (CEST)
Received: from PH7P221CA0016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::20)
 by IA4PR12MB9836.namprd12.prod.outlook.com (2603:10b6:208:5d0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 20:12:55 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:510:32a:cafe::72) by PH7P221CA0016.outlook.office365.com
 (2603:10b6:510:32a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 20:12:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Tue, 8 Jul 2025 20:12:53 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 15:12:52 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 15:12:52 -0500
Received: from [172.21.62.237] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Jul 2025 15:12:51 -0500
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
X-Inumbo-ID: f10c564a-5c37-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKnMYXLBy/OWr2EyMQ5ljOZKkPRySOpVVlLF4BY9EtxPnB5uxDWEndYlskFovPE2JtF/NJx3PDqwdjdV4RxM36subJ/Efb2aaPhZqz/Q7uPqzKybIsJhRXMWRKnA9h44rRbsj1t4wV2xGlYw1qTHDxIcQvEn2DiYs3UzvghEDZYNDlEjNWYkBdcSZevHo9Q5qy5M3d1us3ppAERwvn1hdgO8LiHM7N2XDcS5VyfjK4sjgBQXuXhJ4uUymr47njU/iJCQA0ZgRO07JG0/X4IO1O01AjAlDQ1pu21Ek8292c1FYFybYFL2Dd5D2bhS98jI6y0lgBVafmVgVndGprxMUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uX0uj/rr18ImB51SrV/l+Uf2BT5C8tuCOWdl3w8qJI=;
 b=VIFZVyG39n5Ch6rs8ZiI7uuVWZt8HUeaWStBv0+2yLvEy6kuOEkOH6VeUmQ5ivbSSyDgI2Xqhx++NKZ0YrbkqQhfwpa3IEENVmBSXqsqT99ZQ0+DvUQ9xJDJNjPvEBZ+lGpIgFmGf1iAPzP67N9as9/rm6ZRRnKFVdHG0c3baw3XAcN8UAyJyWJCq4IbgmAxBI4y3xRjU3XBTZEC43ZWkPMdLC/8gWfJOkUybS823E5lXpK7HUV+uM5kU2HDFpu/Jae6T9qhQPfmBM7bk2kXky6O+RFJn6Fh170SiwrHY0YFI5lSJzj+PEZy6R15dVoaOpupUGP17E3HoR+X9ekSNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=valinux.co.jp smtp.mailfrom=amd.com;
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uX0uj/rr18ImB51SrV/l+Uf2BT5C8tuCOWdl3w8qJI=;
 b=lNjGcNfv7iCNFJjFFOr+ohCQ/8E3e+mifxqRs+4QTh1z49eeGwuKMEBThwU8vR3tlgNNoo4S5mCHpmBfAqFpTITU159MuK9a3pkch0Muv+aWFxWtANZsOnwapCq1gzenAa/DO7UAIr3NIBhGmLyG+1+7VfOOog1Tu73usnyC5Vw=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Message-ID: <ed706953-f6e3-4911-adfd-0e19290a85af@amd.com>
Date: Tue, 8 Jul 2025 16:12:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] xen/arm: Move make_resv_memory_node()
To: Koichiro Den <den@valinux.co.jp>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250705142703.2769819-1-den@valinux.co.jp>
 <20250705142703.2769819-4-den@valinux.co.jp>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20250705142703.2769819-4-den@valinux.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|IA4PR12MB9836:EE_
X-MS-Office365-Filtering-Correlation-Id: 580ad398-fdd4-4607-d75b-08ddbe5bd260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|7416014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDVuNmVhcFIyWTN2ZnIweHlnRnE3Ryt5MU5tWlYzTHZJREIyRGdIdytLMi9a?=
 =?utf-8?B?UDZBa08vb1krS0pIelhvUmsvemlsNzdlN3h0Z1BNcWRLQlR1ZEtEOXJHZCts?=
 =?utf-8?B?ekZVNFJYSVNxc1d0RDFFOFEzdGpJR2w5K1FpKzVzTEY5dm5Mb3pqMUl0U3I4?=
 =?utf-8?B?U000OWdjdUJXY0V6ZUFTQWY3WVdleHorNDlFU0JlV3NFK1ZibGJNbGJNNjJp?=
 =?utf-8?B?ZlhLS3hnbGl2cHhpbElORDE5aEFqSm5HeCtaUkFZaWRxSmtUMExoVGlsaWhB?=
 =?utf-8?B?YkxhMEEzZUxOMThMeCtmT2NBc1p2YkNQZUFnRzYyZTh4ck9CTWQ2V3MrRmw1?=
 =?utf-8?B?UC9JR2JOenZGVmZXMGw2VEh4d0N4ZUpEclZpN1NQOGovc0M0dFhrM255NnNB?=
 =?utf-8?B?RWcwT29aYytobXgxNVQweU1yNWhQa0prcGQxMXRtV01NZGZxVGhkYTBCK3pv?=
 =?utf-8?B?dlpFOHNiS2YrdGhQSDBzaVAxbkFQa2xNUTFwdnI3bkFrR3ZBR2V5eTNmMU5o?=
 =?utf-8?B?cit2akJ0bStuQWV0RUdwcytha2RZWXBReHhrRUYxUTg3T0hyeGxqNWdQOXdW?=
 =?utf-8?B?TFJSV25VNDkySmw3NkJoOHpUMUVhcnMrRTZsckloZFF6WDlHT09LUlhmZk1F?=
 =?utf-8?B?aUtlVTlPcklVQUtWMHhrd3VQYjI3NEE0RUpiN2hZMnRkdEtJKzA5bXhuZmtk?=
 =?utf-8?B?RTRBbE5HZmczV2F2VlIxNEIwKytXRm5jNk5YMW1FVm1La1RFbmFFc0xVSUJT?=
 =?utf-8?B?WkhxVmZycVR6aUFSNHNrWTVxUnBwRlBFMUxjc3pvWkQrYlo1VkZOYzg0U1RO?=
 =?utf-8?B?K21ZNGpWY3RTZGhlMXF3Nzh6QzM3SWZMc2toQlA0VkVJVTVTRzhJaWVmRi9U?=
 =?utf-8?B?dkZyVk9NNFZOVlY3aS82c2tGVHZoalJqTU1FbDFsd1p1dnJCblRuRm1abXJ0?=
 =?utf-8?B?N2c4a2FHcHplTlBrMmhPV1RDbnlHK0syNmNSUHRiOWE2WUMzbkV1VGs0ZUND?=
 =?utf-8?B?TnZUZWdLV25WdWtJWkFUdGZYVnNXWGN1NFZpNFZrbUJlMElDWTFtOW5oRm94?=
 =?utf-8?B?QjF0L3dpUFN1NGJ1QWx5MzdFMFFDOVlHaVVXdVQ4VWFISExSYVFHODRLSm15?=
 =?utf-8?B?RVFIRXU2MHFGU3NsVjJCYlUyd2RvVHpiZ2MrY0F4eVNaUTVvb1ZXaUYxMUg1?=
 =?utf-8?B?L004aVF6MlRTY2FQQnplaDlXajNnZUdQUUFLSUR4Q2VzMlBvVDhNcVNMY2Zl?=
 =?utf-8?B?UUhCbVh1N1lub1BuV1NVdmNYMzRCRmtaZ2p4UzV5TU1JRTRQUmNDaEQyY2ZL?=
 =?utf-8?B?SllTejV6YTVyS2k1ajN4WVNGWHlhQTRBcmZ2TnlMemNyM1VFRWVnUllWQ1Az?=
 =?utf-8?B?cWVBaXBPTjgvdVE0ZkQwbXZ6cHZIZmZJNWtPWS91azJhMlA2cUtpWWI1cVc3?=
 =?utf-8?B?a1NpTVp5OGxOZXVSV0ZSS2YwMmIvaXU2WFVlcy9tTFJKUW8rNjMzNVYvZmFh?=
 =?utf-8?B?cFZnTVA1V0dPL2RodzFrRjdudTI4WFNsdythQWVWOVpPNzVtUEdoOVhFcE83?=
 =?utf-8?B?MjluckJlZ2JkdnZUdW9pOU9oRjRvZjh4NmdibGlZdWZZNlJVbzAzRHJYVnJo?=
 =?utf-8?B?b1J2VG53L3plc21pZDNsOU9sSXAyM2ZpVDltcnhjWm1JQnNDK2NZZ1UyNnFB?=
 =?utf-8?B?a2pXYkRTQk1LdWVYU25KZjdHZzA1bkVsNzEwdUFlTkFYRXhUWUdUWTVXR3R5?=
 =?utf-8?B?UHR6eXpERW1tdkVhT2FzR3IvdGlGNzNkMXdnZmx6VVNwT1NESkM3L2hVSlpM?=
 =?utf-8?B?MGVUbjVUYlNaTFlXVHlpZ2Fza2tEY1VWamUxbzRkaDFxRnloK2VsNC9nNFhr?=
 =?utf-8?B?R1pyTVZpQUdXOEN3aE4wcnlibWVDbTdjRENRWHFuOVV1cm1YSHE0ZTd5dHlw?=
 =?utf-8?B?N0pkdkxkb0xUa3l2Y2hrVTBGNEN0UlNFRFF1ZlhFeDZLTjd5Rk04WVhKZzhD?=
 =?utf-8?B?R1F4T2dlYno1bkRXMFo0bVpYaWl0aFNRMUhPSjlRUm1TdkdYNjQxTFJjblZD?=
 =?utf-8?Q?OzPSVB?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(7416014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 20:12:53.6005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 580ad398-fdd4-4607-d75b-08ddbe5bd260
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9836

On 7/5/25 10:27, Koichiro Den wrote:
> The /reserved-memory node is inherently not specific to static-shmem.
> Move it to a more generic domain build context. While at it, add an
> empty kernel_info_get_shm_mem_const() for the CONFIG_STATIC_SHM=n case,
> as it can now be invoked in such case.
> 
> No functional change.
> 
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
>  xen/arch/arm/domain_build.c           | 40 +++++++++++++++++++++++++++
>  xen/common/device-tree/static-shmem.c | 40 ---------------------------
>  xen/include/xen/fdt-domain-build.h    |  2 ++
>  xen/include/xen/static-shmem.h        | 15 ++++------
>  4 files changed, 48 insertions(+), 49 deletions(-)

make_resv_memory_node() was recently moved from arch/arm to common in:

72c5fa220804 ("device-tree: Move Arm's static-shmem feature to common")

Is there any rationale for moving it back?

