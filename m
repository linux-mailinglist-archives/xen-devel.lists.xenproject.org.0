Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EA49D8BB7
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 18:55:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843060.1258718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFdJA-0004qN-31; Mon, 25 Nov 2024 17:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843060.1258718; Mon, 25 Nov 2024 17:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFdJA-0004oQ-06; Mon, 25 Nov 2024 17:55:36 +0000
Received: by outflank-mailman (input) for mailman id 843060;
 Mon, 25 Nov 2024 17:55:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=caTh=SU=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tFdJ8-0004oI-IQ
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 17:55:34 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20607.outbound.protection.outlook.com
 [2a01:111:f403:200a::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72e9dae1-ab56-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 18:55:29 +0100 (CET)
Received: from BL1PR13CA0447.namprd13.prod.outlook.com (2603:10b6:208:2c3::32)
 by BY5PR12MB4164.namprd12.prod.outlook.com (2603:10b6:a03:207::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Mon, 25 Nov
 2024 17:55:21 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:208:2c3:cafe::fc) by BL1PR13CA0447.outlook.office365.com
 (2603:10b6:208:2c3::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.11 via Frontend Transport; Mon,
 25 Nov 2024 17:55:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Mon, 25 Nov 2024 17:55:20 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 11:55:20 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 11:55:20 -0600
Received: from [172.23.96.146] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Nov 2024 11:55:18 -0600
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
X-Inumbo-ID: 72e9dae1-ab56-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjAwYTo6NjA3IiwiaGVsbyI6Ik5BTTEyLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjcyZTlkYWUxLWFiNTYtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTU3MzI5LjkyODg4MSwic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTzlyi2pnKdDR+pMVDVnUxVOXJACPwrGJJ/0pzoo7zEb7EypOomAkpSHBJI7Z95KfmcPvzErQ2EuNfxRRuVR+nX5wZRTKJC2fUGJ6otptaswSSmlQ4cgriSwXQcP7RWI6xwpgKI7w7FmYCgSIc8gvnGiem/lFx9Lee0XW5xDHHk3Rft0HpLH3vKCDnBj2xjhPADhzq81+8tLu7igXE6ZuYOYYE0gilWjbbp3aE6IKdQYVSiYRcGwEqm4f5uPkWSpsUgElFhn94LrdtQCRg9bkDf+CyhmAg9Qq1qRwogzFHyKwGmAxADUlhdNFXKsxe0J+qo/NEu80gIjoSxOM4MmDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ai7hpG1VukTCVVPk/93Qdiv7ymWV1QyORPiAMvXuHJ4=;
 b=Pzdl/99bgEUmSgl+d8k7D4/P4qbRhxGTH3F25eL7beB+j2SjWDwTZ4J9AKXMkutrOWHvIwr2XrA56b2dlejrHcnLrDrx4sgYe3DM6108TWFZ2GPsZBKw+Kdm3Q0Hj+8xb+Hiod4LHrqGz9bJEXhwVWMibXxKr0MGhEBIMXuPAPS95mm6mLZ8oHPF72iA6yVhMQdabARoEJvgBHBHJ+eoxJyWx5RPJ1U8HHAhKLbfzi79HpjNLufcTRaSl/pCRV788pe7weASiFSUFr7LfJhOG5PHwMEwWuOuFOclv4CPQXEkz1Ejgj8I/UE5kYTNHeLkvMuedF/lbw8F+eXN1gQwwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ai7hpG1VukTCVVPk/93Qdiv7ymWV1QyORPiAMvXuHJ4=;
 b=a72RErsvV+xQfHe/d5+TYk1mB1RK1gBxmncjEmg4g1A6l93VJsIwvE2kFipsSgzavb45XZVadO7SwawEf1jHahqNV6ZrpW5FlnGGa10xUuQDys7DIcV2z0rqb5yQNgyd9tKJzRuNZsvEgvkCuimqHUp3RWOj8RP1aUbX54BXrkQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <45787e79-87e3-4583-aecb-4155195ab230@amd.com>
Date: Mon, 25 Nov 2024 12:55:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/15] kconfig: introduce domain builder config option
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-6-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241123182044.30687-6-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|BY5PR12MB4164:EE_
X-MS-Office365-Filtering-Correlation-Id: dbeed52e-fd68-45c6-6ef4-08dd0d7a546e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b01uVlFHd1JKaGZ1Lzg5eURnSEl4MnBwSkxVZ0hCZVM1RVpSMFNJSkpsUjBn?=
 =?utf-8?B?SVRQbW95V05zMDJRc3o0NE1CZThBRGE5NXFKblNMTXpFZk5kbjBRMU1rZ3di?=
 =?utf-8?B?YUdWbVI4dXcrdzFKd2VveENQZHBZcGhaWHFVTUdnNnExcU5yNldNdkw0NTRB?=
 =?utf-8?B?S2xmc0tuSGM3Nkl6Zjl1S0RpRlRrUmFKOXF5VEU2OHZ4bVJFMXhoeFJNN2tJ?=
 =?utf-8?B?Q2o4SFo3WVRDclIrRGgxZ2VIQWR1VmJkdWw3Z080UFNCSFQ2VUNhbXM3NTEy?=
 =?utf-8?B?T1ViYWRTYjlha003Y3NTYWt4SjJ0TnZuMEdjVFNsbkdBb1IyNy9QWXQ3SDBq?=
 =?utf-8?B?Z280QmdWcjVBWFlydnF3SmxvZ3J2eEUxVmFXQ3BhcUt5alYzSVR5ai91eUpm?=
 =?utf-8?B?ZkxvcUJDdGxURForRzBOVy9XNXVxaG02RW5WNHBZSktrMXBWdXlMWVZmY3F6?=
 =?utf-8?B?NVF2b3ZWb3BSMStWRU5LdDB5WjkvRDNVSVhFbW5yVERMeml0c0RpTUtHNVQ0?=
 =?utf-8?B?aUhrekRaZE5JOXpqZ0tWaTVET0NZTXpFNW91Qmh4SXBVNEhIbXQzR3ZyMjVI?=
 =?utf-8?B?L2xzd2Jpb0M3RTFTM3dyRXlEbmJZa1ZxV1pTVkYvd0VhSkUrY0VXcm9SSEVW?=
 =?utf-8?B?eXN0bnE1MThRZnN3bW44UUNOajAzVk4xWXhxZTgxYlRzN2h6QUhXSWtKSlQv?=
 =?utf-8?B?ZlZxaEpYcCtIWmZZYU1TUFJhWkJNL0pZV203WnEyVnJ4cVVBMVpDc0NzanNJ?=
 =?utf-8?B?aDRlNnljQkVUdE9hQ1ZHbFBIM3RvSkRQUThjSEI0eHNldmZXR0RVWnVYTG5h?=
 =?utf-8?B?eVZrRzFkMVNXMlhsWlZOVmplVnRmUWYvTDVTamswdTN4S3krTGdUODNFZGM2?=
 =?utf-8?B?Tm9kU3lJeHZlN1VOeEI0ZXdxaFNMblEycmZuMDFjWXZ6L1YxRlgza0l2cHdZ?=
 =?utf-8?B?QkNRTkwxUDRCR3VvNmlNcU5kZEVneVQ2VU9QdW1EbHR4aHAyOHJqaEVJTVNV?=
 =?utf-8?B?MndueWZBK1VUajEzWkVLSGEwSXRKWE5aQjdsczdMeThBejg4elNvRnlJSGs0?=
 =?utf-8?B?S1ZqcUJpaVNVZlhQdTZmNWRkM3ZWbnZtcXFtanliTThrSXNGek1LUE04Lzg3?=
 =?utf-8?B?S1o5a0M3dG9vNjRYVXJWZHVBWWd5Y21JOEp2c0lFZVFFclJmeUxGU3B2NTkz?=
 =?utf-8?B?VVJQMzdodWNkak9yTWJmNUFncTY2U0JpLytLd0xzUlU0c2VJU2FrbzhyVkRm?=
 =?utf-8?B?elNBWUtDdmJ4ZUhPT1lWdVFEK1Jib1NjVVc0d0lsUVE0MjhEeWpEMDRha2Np?=
 =?utf-8?B?RmIwY2JOSG1GQjNKem1wK2NYbVh6bHdpS0VvdnFzUFBzRlQvamtweGgxNU54?=
 =?utf-8?B?blh2SmlyNWpnbFN1RDNmRHc5Q1ZsdlNZcnRlazNzbTlZMmRuUnBFK1J5S1hH?=
 =?utf-8?B?d0Z3Q00zU0NIUnQ5bnh2bUVQSGJzRFNvV1J3M3BWbWVxTHlPY1VpV1F6WkR6?=
 =?utf-8?B?QzYrZGs2UHdMSXhucUQ0ODRwYjBGaVRENWtMa1lwbnhoRFkwR2trSWRXdG8z?=
 =?utf-8?B?a3AyOEpUV29aRlFTd1k1cjgxWW14aVVmcmVPVmdkdy80SUR0bXJrY3lyMUFC?=
 =?utf-8?B?QWp3MlF2N29aT2JvSVVvb28rZTZGTm44NzZKNFVwd25tVTdjTG9TUk84SjNH?=
 =?utf-8?B?UXQyemhKQWpvM0NwR0RLanUxZGN1MUl3MC9hMnFnK000UWpRUDlpSmlUUG40?=
 =?utf-8?B?VXB4QnR3NEJLazVuc0Y2Q1JuMFhBY05tNFRBSGY5TmZpWE9MV0p3TU1QZ3VY?=
 =?utf-8?B?N3dwZktLWUV6WGkwR1ZHbHpPcVhFazd6Z1NTUGNTdmFyT1ROOU5iR0gySC8z?=
 =?utf-8?B?SlRTSldkZDRvZjJUcXlBakR0Q3lYaDJwNk9Fbnc3OHh0blZiSVNaT0ExZjVW?=
 =?utf-8?Q?Qz0T5oi/7T4cn7rqHlsgSMsdd+04fScn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 17:55:20.8923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbeed52e-fd68-45c6-6ef4-08dd0d7a546e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4164

On 2024-11-23 13:20, Daniel P. Smith wrote:
> Hyperlaunch domain builder will be the consolidated boot time domain building
> logic framework. Introduces the config option to enable this domain builder to
> and turn on the ability to load the domain configuration via a flattened device

"to and"?

> tree.

Maybe:
"Hyperlaunch is the boot time domain building framework where domain 
configuration is loaded via a flattened device tree.  Introduce a 
kconfig variable to control the feature."

> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

> diff --git a/xen/arch/x86/domain_builder/Kconfig b/xen/arch/x86/domain_builder/Kconfig
> new file mode 100644
> index 000000000000..7be2ec3ed00f
> --- /dev/null
> +++ b/xen/arch/x86/domain_builder/Kconfig
> @@ -0,0 +1,15 @@
> +
> +menu "Domain Builder Features"
> +
> +config DOMAIN_BUILDER
> +	bool "Domain builder (UNSUPPORTED)" if UNSUPPORTED
> +	select LIB_DEVICE_TREE
> +	help
> +      Enables the domain builder capability to configure boot domain

Indent is off.

> +	  construction using a flattened device tree.
> +
> +	  This feature is currently experimental.

Does this need to be unsupported and experimental?  What makes this more 
experimental and/or unsupported than any other new feature?

At least with the commit message and indent fixes:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

> +
> +	  If unsure, say N.
> +
> +endmenu


