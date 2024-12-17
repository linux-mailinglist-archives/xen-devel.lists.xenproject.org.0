Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA1B9F4799
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 10:31:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858682.1270925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNTvR-0002kx-19; Tue, 17 Dec 2024 09:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858682.1270925; Tue, 17 Dec 2024 09:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNTvQ-0002iz-Uk; Tue, 17 Dec 2024 09:31:32 +0000
Received: by outflank-mailman (input) for mailman id 858682;
 Tue, 17 Dec 2024 09:31:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ppSV=TK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tNTvP-0002ir-Bv
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 09:31:31 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20617.outbound.protection.outlook.com
 [2a01:111:f403:2414::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1353277-bc59-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 10:31:29 +0100 (CET)
Received: from BL0PR0102CA0043.prod.exchangelabs.com (2603:10b6:208:25::20) by
 PH7PR12MB8121.namprd12.prod.outlook.com (2603:10b6:510:2b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Tue, 17 Dec
 2024 09:31:24 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:208:25:cafe::30) by BL0PR0102CA0043.outlook.office365.com
 (2603:10b6:208:25::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Tue,
 17 Dec 2024 09:31:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Tue, 17 Dec 2024 09:31:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Dec
 2024 03:31:23 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 17 Dec 2024 03:31:21 -0600
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
X-Inumbo-ID: b1353277-bc59-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QSldh6xWqpev9MOsFX18W5vG3cnjo3Uidzse+lsZjdK1W4MqCqBtu/BlqCj9GODmZbuep5YCgYuY4J/cKtlfucLYuR2rnD4lRxSplBrmH7giDUZD/+ahLamUAhC3WNRvdjqLRTZ8IoWcRs6P/d6NOk5bw3TUfizuEE+CAWdGA1vmz4vqQXatwVmam61Yca0Rij6T7FH+UeUe+j/Y0LJlqnNP7m0w6NI9TlXVz2guAvcbmb4uz05E1RxRmlBv7Zat0+Cp/9bVK9L9hbJsB/8uC+vLnQhtIoVxXovmUcvkfWwhj4rbtsYxMWVrNpkTLwtqIYv3fBrcuUHlqGlQT8edGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJRfT8BvLOk2erNy0m/3q3H1UEdmEsNq2KmBaYzdSTs=;
 b=Rsz5r3WKQcIPTAglrdiBZIzlfVNMT9pP4XvuLcmCVAw3hC+OExDZ3NB02qSIxEtBy/yxMGk4vKdj4QLKeXTAYcIxzFfv1kfBdS9KmvK/bR1vgt1ZNDYEJtHRKI71yWBtf19wRlNjdNeDCKCoQKzwYejcZdfqzrdCpfhDdIAPfUoJmuHyMOo77P0M7RztscbvycAo9We7OxhSLqmfWH5AkE4BDNre2Od2N+az1zBnH4Ot6w7AF3t3JV45izzb/k2KawP/DmRHpT+pX97VQUiGP3iICgrwjfNO1f23ZmhpF1Y1fYoGdAdbHjXiBnVa8YEUCFLX2A/ewyy0qQZauhk3Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJRfT8BvLOk2erNy0m/3q3H1UEdmEsNq2KmBaYzdSTs=;
 b=qIlu0+haGVlHloI06ymZHmA0glQKOUNlvQOC3mJucORvRI+Tpm+yuLE9hbCCoQktWK8dfZNGx4oxTFyqwviUfjc26HbWdi87Q+RmLFQWoKuDxAlQj9t7KNjHCLNM7N1NEx/t+W81VbGRLYvYzQStbQBmyQnlLoH9B1wbDwcDr0U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <869511b5-c61b-412e-80a9-bc5b66989530@amd.com>
Date: Tue, 17 Dec 2024 10:31:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] xen/arm: Check for Static Heap feature when freeing
 resources
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Chen
	<wei.chen@arm.com>
References: <20241213105047.3043403-1-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20241213105047.3043403-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|PH7PR12MB8121:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e0ddffa-ebe4-4ef2-b8e9-08dd1e7d9306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wjd1UUdQVU1va2ViQ29ITG1lN1JjV2U4NVZ3MUIyRlRKOWc2NlpsT1FCOXRW?=
 =?utf-8?B?NW9OQ0dYdmhMaTluYlBnYnRMTlZwSTc1TTNKR3lkYks1TjlwMHFIa240dG8v?=
 =?utf-8?B?aG9DcTZIc24zRVRBeFBIVjdpU1lMd1BPWktnUFJ0a3dnZjU0N2pyQUgybDBt?=
 =?utf-8?B?T082VHdJMXZ0Rm16b2lsVFpiU0ErUHR1UTg4eWxTUXBLS0dIMU14OC95MVBR?=
 =?utf-8?B?Qzd1UCswSXg0UUVHZW5PUGw5cHNhL056S1JLaEdDNS9hTEtwUDkxUHV2Njhi?=
 =?utf-8?B?MTExYkgwdDVOR1V0ZXVWRWU3ejJmU3lKclVBb0FXRHBNaWRXS0tKL0grSG5w?=
 =?utf-8?B?bmoxTVZYSzFFbDhYS25WL1p0TXV1bjRBLzg1eVNPYzJERGhPZ0Z4RUQyR3dY?=
 =?utf-8?B?bzk0SStzS1pOc2ttSGw5a3EvVDQzcXc4ZlBZQ3ZNOEtzUVdGS24zd29SaWll?=
 =?utf-8?B?REp6ZlBxZnNERjRuODAydTFuaitnR2R6cDFRMXpoUFR4Q0NMUGthSVhqZzZv?=
 =?utf-8?B?SE1rRXRuWGIxQ1NzajRucklIbngyZW5OMmM3S3Y3TmdkemFYV3pFWWZybkVq?=
 =?utf-8?B?UlhPOGl3NjFwUEJZaDhPMU1YR3pKeW9tSWIvRjZKeXJkOVpzbHdtWEtKcU1V?=
 =?utf-8?B?ekdMVmtKamR3ajc0NTM4SE84ckZYRWQ5QVFVUzlLNkJZOElKcjA0UENZOVVl?=
 =?utf-8?B?bnNpYUhZcko2NXV5aHhiZTBsWktnQ3F6RmxFNlJJYTBCazYrTTlEZHZuSFdD?=
 =?utf-8?B?OXJWWVQweWxOS00yQlAwTG5wM2RHcWJOSVkrdUFBMVFUaG5GeEhzOThsWUh6?=
 =?utf-8?B?ZDRITVZBNE9JN09CY0Q0SitHaCt2eWxzb3NpaXhXVmo4a2RJVGhIMGxCMDkr?=
 =?utf-8?B?eHk5THF2K2l0aVVkbTJXUHVJZSt6M1AvQmt3Qkpxd2lPTW5Hc0VudjQwYkRh?=
 =?utf-8?B?TkJVRjc4NWZjUW9WYmZoL2xGK2FUTnFHZE55QzNZakZVS1l0aW1QNHp2ek9a?=
 =?utf-8?B?TnFmTFRlMU9oWElsT0VkL0tQRHVRK0gxOEtGWVdqMW84TFdaclhyKy9JUEV6?=
 =?utf-8?B?ai9WaUwvbGtURnJZdzIrOE9SUDc2SDZlM2ZaUXZTNVdzZm5sVU0wc1dzaU5U?=
 =?utf-8?B?K1BVRGZ3MnovNGNzRGZZTTdINFJxQUFKeGR2ZHZSaGgzUGtTbGRkTGRkZktZ?=
 =?utf-8?B?SkhjSkRURnpVZWVmZi9BYVMraEQ1Y3RJSVRJdE5CenY0MGp6L0xoRTNNTGJ6?=
 =?utf-8?B?Z1lWTlYzZnFmOHZSbmJqRVJDRnBONWh0WTdpRENnOWhwMkhWSlBFbWxwRWpS?=
 =?utf-8?B?WVIvTXUxOWkyKytEZTdhbm50MlAzbnNrQ0Zpc1lUcm1iVmhzMXA4QkM0L2th?=
 =?utf-8?B?eXhtZzVRaWhIOE92a0RWM09JVWJVRE9obTR2S3ExTlhiclRSQ1FIVDBvNGgv?=
 =?utf-8?B?aWlDRVM5Ti9pVEduSFhVVWd1NlRXc3llcXN1S2gzalBVVkx2WnN5dzE2Vk8x?=
 =?utf-8?B?Vk94aWZCaXJrc0ZUZ0h2Q1RUOXRyb2d0QnhBVEZrQVcwTS9yK20rdUVOZWJa?=
 =?utf-8?B?R3NUQWtLdDVtVDVOWkg2ZERjdW02amVXVithTTNLZjdTTXpnUkpPK3BhSkxM?=
 =?utf-8?B?SUlpTnR1MndSVVJ5K0xMaG02U3B2K005UEhFemJHQTdTTnFIME1XbC9kUHJE?=
 =?utf-8?B?N1VpaldaeXdmcWU3WTF3ZzBwRXlnVzZ1MmZKVDFsMXppYW1qNHBnTVJQOSsw?=
 =?utf-8?B?M0tTblYrN2I2UmxEaUhoMkVlTDJjbVh0ZGZBRysxVnUxc3F5VVR3WjF6SVNZ?=
 =?utf-8?B?b3lRTHYxUWt6QVcvNHlEdng1T0FWSHc1VTZnNzFJajdHQ25Fc0xOaGN4STY0?=
 =?utf-8?B?OUgyemx5aGdKa0J0MXkrNlY0eHVkaFVGSjN0NG8wQldIbjZpbVI1ZlREZmMx?=
 =?utf-8?B?VXNOdFFBOFB2QkZudnZiVDFNWnVjSXZXRy9oVHUyT2xpc3U1SWxWQzFVRVo0?=
 =?utf-8?Q?ApqofNwDCIPr06sPQQLs2OAG5p9uxk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 09:31:24.2133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0ddffa-ebe4-4ef2-b8e9-08dd1e7d9306
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8121



On 13/12/2024 11:50, Luca Fancellu wrote:
> 
> 
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> If the Xen heap is statically configured in Device Tree, its size is
> definite, so only the defined memory shall be given to the boot
> allocator. Have a check where init_domheap_pages() is called
> which takes into account if static heap feature is used.
> 
> Extract static_heap flag from init data bootinfo, as it will be needed
> after destroying the init data section, rename it to using_static_heap
> and use it to tell whether the Xen static heap feature is enabled.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
I committed the patch. Thanks.

~Michal


