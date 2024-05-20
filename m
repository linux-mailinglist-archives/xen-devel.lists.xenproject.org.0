Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2988C9A94
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 11:43:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.725947.1130250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8zXi-0004fK-8m; Mon, 20 May 2024 09:42:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 725947.1130250; Mon, 20 May 2024 09:42:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8zXi-0004dV-4f; Mon, 20 May 2024 09:42:54 +0000
Received: by outflank-mailman (input) for mailman id 725947;
 Mon, 20 May 2024 09:42:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nMKL=MX=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s8zXg-0004dN-5J
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 09:42:52 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 527abfc8-168d-11ef-909f-e314d9c70b13;
 Mon, 20 May 2024 11:42:51 +0200 (CEST)
Received: from SA1P222CA0188.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::16)
 by SA0PR12MB4416.namprd12.prod.outlook.com (2603:10b6:806:99::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Mon, 20 May
 2024 09:42:48 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:806:3c4:cafe::22) by SA1P222CA0188.outlook.office365.com
 (2603:10b6:806:3c4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Mon, 20 May 2024 09:42:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 09:42:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 04:42:47 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 04:42:46 -0500
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
X-Inumbo-ID: 527abfc8-168d-11ef-909f-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYZqGMdB1jVe/5Nn4thBiKsxaADMj1Jo5+dBo2+5zLAyo5MsOC+AkSehSJgDo/d7nw6sNP2neQ/UGjSUxz0zpVntneuHspBgne8pU8VWdTW6/GshkNMCHKuan0UMxA9tDaJ/GfIEzAdapSVOC0VFQ6cC2FLp3cW4GUbJKglQGwHjZ+xR7zwm0WOeQjA42iW98vU+1w/VkmHlGQJMO7mTvb262wslZQ8im4oM0x1xWdnp85q4ELi/feEVFN63wIg6RtuApl3KyKat91wmdCXxwTmW5IIQMK1SanP+RjDKvPmRlqn77vrjWtwzJKqAVU1zWHb54T6/+bp6Q9sn1U5Z6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPU8hD81Pm9J++nH/iyRK9mWmWSLUCEydeiBUSqW8qg=;
 b=mob5SFvSEO7Q8/QRUGkUgtTS5VNynRM7j+u1AJ/1YwRekgJvbVQwUrJw+2RaFKRAfRamGmWQ1Gi2GRaUNIcmgeh9HBDm1mmUStfV3RgGCpVp9q1QhnhsRzROg0mZNnx9oYh7ygLyTFAs3HN57qTyNFnCy+q+8Aw49aKXaeT+Arpyau/5YnmXVB0ohDZhokBVLH5tcKZz1TVgN4lvDu5GOsZkOHkzugZVLzaZVW36jPl22tYs3MSQCVZRc6N/2q7FMreV0ezerMpLIeBfuosQrRboIZQ0vCpF6b83Jmicet3IV0CyArfksWD4OVARbr8tirvvvUazzWZvbHkOQ+Mckw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPU8hD81Pm9J++nH/iyRK9mWmWSLUCEydeiBUSqW8qg=;
 b=Shv6rXXzKs4tsYyGBbPWsFyPsU44JUrYUaHJk0HFwsAjdK0R4HRRk1dkg8Fx766nDzyrNlifsSWSwrdyX0XEL6aBDHsRAz4MfhlIKUEXtQ8f0hulXNVap0xwFEOluu+qQM7VBykGAdI5O1k6xhDQxReuBvxty4EvDNvt7YN13dg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <67750577-4014-4815-b6e4-e88bf1f5b098@amd.com>
Date: Mon, 20 May 2024 11:42:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] xen/arm: Rework heap page allocation outside
 allocate_bank_memory
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240515142626.3480640-1-luca.fancellu@arm.com>
 <20240515142626.3480640-6-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240515142626.3480640-6-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|SA0PR12MB4416:EE_
X-MS-Office365-Filtering-Correlation-Id: dd7fce0d-68e5-4581-3d3a-08dc78b135aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|36860700004|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VUs1Q3dnL2tPWjRySjNYSWZ4bU9ZMlBBRHNoVW9xRzVpZi9OQ1QvRXZWeWMv?=
 =?utf-8?B?ZGpiQ0dmalY1dm9mVFN3WWRtVkRIVU1nV28zcXhiaGFKRUNWa3cvU1Ryb2NQ?=
 =?utf-8?B?bk9yZHhOb2NXeGtpcGp1WDZiRFl6dTRDOCt6T3VqMjNNTmhySWl1L3lLWEs3?=
 =?utf-8?B?NnMwbHduRVVoNnEyNnR6dStWcHZHcXZPNFhkellQUzhUeHdNWElVQkJDL2tS?=
 =?utf-8?B?K2NJdzNRQ0ltMThLV1AvU0tKa1Mwa2dMa0xEbFFWMktteUo0amJkT1QyZ3Rz?=
 =?utf-8?B?M0tIMVE2S0h1R3hpVHpDVlZOdElUNTBzOU5EYi81YTl4MFFRZEtYRm1mM05H?=
 =?utf-8?B?azQ0SXVjN05FaGYvY1gvMFBIWENNNFQ4QlkzZXV6dmQvUEV5TGtlbS92ZnVV?=
 =?utf-8?B?d0FFKy93ZzJYVmFLMUJxa1dBYVloQzAyYTB2VXlWRTB0MHhKdGd4a1hiZCt1?=
 =?utf-8?B?UmxZZFdSYWxxU05JUTRML2FuRWVaWlowR0ExYmxaSjBTN1h1S3ZTRndMMGlP?=
 =?utf-8?B?NXJZT2EzR1AzTDcrSWVZZEx3RytDRFZPYUlzS2JIT0lONTdiNG16WVR1YjNo?=
 =?utf-8?B?bVFFMEhpc3hZeXIxOXFqd3BubzlOL3AzRFJXUXNlU2FFcHh5bTE5dFdLSXhS?=
 =?utf-8?B?SXdwc1N1QkhYdWZtQVZhV0g4WWxlSWhYV0FOdXRGUlA5TTBLV2l0ZVRoK2ov?=
 =?utf-8?B?Q2NXTUJJc3RWWS9sam9OSEV0aGhDdUJwSU1uRjRNMFA5TjZ1cnB6T21LVk9R?=
 =?utf-8?B?ZEc1T1NscFd4bUdkcWxDdk5HSVRUbVdtaGZQNWZLb0dPdUxFZnNMQzJyaG85?=
 =?utf-8?B?TmR6YWJDZGlkTUtBSHNBbitsU3VENkFvMExyaENmQUJJUHhJSUlFc1JkTmdP?=
 =?utf-8?B?LzgyY2xNRVhqMzBYYjFZdkEzL0hLa0RCVGhMQWlyTDFhbmprQnNaa1lBWXVp?=
 =?utf-8?B?R1Z5UlpNSCtZV3k3UituL3JKRjBBZjQ3WktaZDdrZ1oxU2thSEZuNkxnQ1dk?=
 =?utf-8?B?Vmw2S2dsWmN6VlZicVE5dGNQd0hTb1E1Y0pLUlQxZHR1N2wwbW9lUWdoU0t0?=
 =?utf-8?B?WkluYllzN295Wjg1MS9yeDh3VUx2WnQ4SE1NTTRHRkFDc082bHpVM2w5eWR0?=
 =?utf-8?B?ZDVCOG90N29GTzJOUk91S0g4a0FOREZQMW9kZEhzaVovOWY0UmdoMU5MaWx4?=
 =?utf-8?B?RDk5K0lrd3RIYW55WkJjaVJMeXQxVVhDSmtXUjZRaWFVODRWRHcvNzlJWDdX?=
 =?utf-8?B?bkFXREpWRHM4NFpGR3oxZlk0N25CRngzc2svY2xFWmRCbUxxNHhrQ0JublJJ?=
 =?utf-8?B?c294V1hKWHM0bS9jaDRHV2NpV29EdXJvd3F6L21XbmRxOGd4aWhhNHo0NzZr?=
 =?utf-8?B?WXVKYWhGOTAyWmJNTWhsNStZSjltR25pOWdUUGdyekJYaUphL0Q3MVRkOXN3?=
 =?utf-8?B?b3VKVmY0U1dQalBLUGhnWlhWcDhWbU1JUkR6Tis2OVJUWjdtRmE3dEVPQ0Rq?=
 =?utf-8?B?S3hBY204T0JMT1RsbXdVV3NmdExZVnEyWHVOaDB4WXJUVjM3NTFYaWxYV1Nj?=
 =?utf-8?B?VlVJOTMrbmVHVE9ORjh4M0lnWVE4Vm5YQi9sT2lEUVJnMVpVRjFFZmFNSWdv?=
 =?utf-8?B?dDc5bW9hMXBHVjBrMnQxQUsrR3lOZWhQMUxzNzkybnZ3bzZxdmE1TGF2RWNN?=
 =?utf-8?B?M1cyOElwK1dQcVkzaUc3dzZMOUliOFpLZTg1ZTJ6c1F3aDA5Um81YUVKREF6?=
 =?utf-8?B?S01tSnhJNG42S1NDR0xPR0tNSzNMcUwvMlNTYjVSeXMvWitCVkVlVDVsWmtZ?=
 =?utf-8?B?UXB0UzhWRThzREpUVTBSb0NRN1A5ZVZGb09aWlNkY0NlenNWTzNZSHYxRWMr?=
 =?utf-8?Q?Pz2Y5CuADxXA5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 09:42:48.3880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7fce0d-68e5-4581-3d3a-08dc78b135aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4416

Hi Luca,

On 15/05/2024 16:26, Luca Fancellu wrote:
> 
> 
> The function allocate_bank_memory allocates pages from the heap and
> maps them to the guest using guest_physmap_add_page.
> 
> As a preparation work to support static shared memory bank when the
> host physical address is not provided, Xen needs to allocate memory
> from the heap, so rework allocate_bank_memory moving out the page
> allocation in a new function called allocate_domheap_memory.
> 
> The function allocate_domheap_memory takes a callback function and
> a pointer to some extra information passed to the callback and this
> function will be called for every region, until a defined size is
> reached.
> 
> In order to keep allocate_bank_memory functionality, the callback
> passed to allocate_domheap_memory is a wrapper for
> guest_physmap_add_page.
> 
> Let allocate_domheap_memory be externally visible, in order to use
> it in the future from the static shared memory module.
> 
> Take the opportunity to change the signature of allocate_bank_memory
> and remove the 'struct domain' parameter, which can be retrieved from
> 'struct kernel_info'.
> 
> No functional changes is intended.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


