Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E54C8B096D4
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 00:09:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047575.1418029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucWmx-0007xr-T9; Thu, 17 Jul 2025 22:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047575.1418029; Thu, 17 Jul 2025 22:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucWmx-0007vn-PV; Thu, 17 Jul 2025 22:09:15 +0000
Received: by outflank-mailman (input) for mailman id 1047575;
 Thu, 17 Jul 2025 22:09:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gTIS=Z6=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ucWmw-0007vh-8F
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 22:09:14 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20606.outbound.protection.outlook.com
 [2a01:111:f403:2413::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aacd0360-635a-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 00:09:12 +0200 (CEST)
Received: from SN7PR18CA0001.namprd18.prod.outlook.com (2603:10b6:806:f3::15)
 by CY5PR12MB6478.namprd12.prod.outlook.com (2603:10b6:930:35::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Thu, 17 Jul
 2025 22:09:06 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:f3:cafe::7d) by SN7PR18CA0001.outlook.office365.com
 (2603:10b6:806:f3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Thu,
 17 Jul 2025 22:09:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 22:09:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 17:09:03 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Jul 2025 17:09:02 -0500
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
X-Inumbo-ID: aacd0360-635a-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CnuzmkK8dNWKk3J6vDnHMEVmL6WWhrL7a6tYNSfXhQgOCRs2PWDrhdVfdo+MVdlQ3bPzy65bJeZOKxg2Va5TWIThZF0SsUY0RGge/T9a1EXAAEVWfRgl4zvl7aJw/3/2P4tD2g5bQG35mBr9XOYkT+y9kq8FyDwhIf/gBpqrCEKOEOyt0zuxkyzrW6JbX05aXe2m37QPcjH9+LhgfvJiosciJezjiL9Vq+gD4/I2a3gjL3MWBPSkncuO5ui8S+/MTmlYu4iK++mRvhy//1ic+w6//7vWtaxKQMnR0JeJ501Hje++Cb7YiWMJeZIkT1Uf/XH6y11LQufgLIVrmNTmaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2mlEzrKF9Eqo/3p6UjKgH8ItSfhA0VzQRU99+DoLhQ=;
 b=aOubvMST+VF4rStfaLUhL8KOPkXs0LjFUBTtVLfsAHTvGu8uDiNvi6E+Hy3Ai8Z0Yt7MN5rM2re6CcxZM42VkkHFuHb512m3nGVtfDgQcnajD83pnXyqhzUmz/CfLOvpHBonvdA1e5p5+KlfeHN/w6jqq5EFJQKUcMNi5Gcqo0xIohjhUYLEkG1dBlQfW4RDEGLITPMh8etTX5g1Ac5RGQPvX07yJnEyXDnJtV0w/qcCzxgrz770hOSvMdRTp9Y//HB8Xn/J19moyxCXFDIWM0Ka4Bpg4Ppe9igP+loX9nhlf1G6lF2FYf8Db1vh0JBzkbt+Hvax9WKArET3SahCAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2mlEzrKF9Eqo/3p6UjKgH8ItSfhA0VzQRU99+DoLhQ=;
 b=ef7mQdkFUqiR9VhPNOjnhWvTNEEVzNvgpCIEoU5dIwzmAZfGhLU/6LB8rTHxvq0p57v/KW2uEbW8RsNms3vx9HynWumZg3nkgA7ansIdvJNe/jxWR2sqiVZ1Vkh/Yv/h60kYkwsMPvfnvZ2XiKwbwj6YywSQ69pFsgW4Z3udgNs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <62d11511-b856-41c6-a2f5-5625a5e3edbc@amd.com>
Date: Thu, 17 Jul 2025 18:09:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86: generalise vcpu0 creation for a domain
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>
References: <20250717175128.462996-1-alejandro.garciavallejo@amd.com>
 <20250717175128.462996-3-alejandro.garciavallejo@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250717175128.462996-3-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|CY5PR12MB6478:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f2339ed-d59a-4801-26f6-08ddc57e8bf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MW9KcVRRNzN4VnFUZEFZWFVYWHRuOHpFYjN0a2tjdnd2UlJHY2dTTGIzcDFE?=
 =?utf-8?B?S0xPdmVuWDJqb3dkZjcvaExwYXYxdEhJbmVmZmJ1QmtRZEltRnFvVy9WK2Fn?=
 =?utf-8?B?Zkl4L2FSdUhwNWR6ZCt6TUsvQkJ6aWE1VGt6RCt4NmZCbVk1V2wyS0F2Wm1q?=
 =?utf-8?B?OXdOc3IyY0dSTzRoRlU3dTNnamtqbGl1WXFYWFRaZmhoR1QzbkFrSm16eU85?=
 =?utf-8?B?WDlPUWpNK1d2RHRiNG1xZTcyTncvNHY1MFZtRDVoMG1MQ00yZENwaHBIWmcx?=
 =?utf-8?B?dVkvRzFyTXhwb1k4TDNxQi9IWDdzV01EWmppd29iVjV6bEJxRnF5Zms0ZzB3?=
 =?utf-8?B?TGVEZVNaaTBRNXgyV25QZ2ExRm1USFB5bVBTU0VaYjUxbW5xZVVaRWw2RUd3?=
 =?utf-8?B?QmtOTElFcEVIU3VLMTl2VTBGcmtMYnoySUVzZWh0TEpzTmJlVjNBKzVLcjZZ?=
 =?utf-8?B?SGMxVkp5SmE2L08wRzFkYUJrT3ZXMktidFFLK3RmUzIyUFlUSGNxdnE2c3F2?=
 =?utf-8?B?ZFFtbXljMzBVakNuNkpMOER4QlpJaUM2Yk92d29ZS0FGNCtGcGpUeXQwRjd4?=
 =?utf-8?B?R2pFeWhEQlQ4M1daci80L0FaRHlWSkxDbUFEM0hPVFBNR09FR3l1TmkzNWV3?=
 =?utf-8?B?Rmx0dmk3L0RHRmdTbThLV2FXWlNDRmgzRUR2UXpLSy9DOWJVdzE3RTFLcExo?=
 =?utf-8?B?elR0dnNHQ0t3bVZzOUw2YVdaL1lnV21yNzJQZS9pQUZ6UnVodmo0OHdiNmZ0?=
 =?utf-8?B?TFQ2Z0tnN2FweGdnT2FDc0F5S09KZThrNHJrYkFadEJ1S2dpQ3IvSGthZWUz?=
 =?utf-8?B?SW5tTjlBZW8vNENkUy9TeUl3UG9YbnBlL1N3MWlaNGc0WUdCd0NrQTlwT0JP?=
 =?utf-8?B?OVBuU2hUa25kd1NQNW40RytONnJWZ1ZvelQ5alp6YVQ0ZjB1dnA1YUNSc0Ni?=
 =?utf-8?B?VjRtTzFDU0pCZnpMd2hIa2d2REF3dTV5YzE3YUpkdUhEMStFUzk0eHl4NmFq?=
 =?utf-8?B?bGdWQlV6Q3VjVmVVNWloRWdCVS9jUDFNZHJ3UlF6VFNYcUwrMTVxWURVek9I?=
 =?utf-8?B?Z2taZnUveDFtVnEwL3NJWkw5aGhhL3oxcUlsNTFpT0dyVHhLeXhQbHgzbWdM?=
 =?utf-8?B?VExDZWFVRGNvUFowM0drZE43RFo3L2o4b0pDYWdSMkkraWkrS0xSRDNNcnpx?=
 =?utf-8?B?bEVKc1FuaHdXendsZXRiZU9WeTkrZ1VXYmEyeWJOVFNTc2JPQ084Rmk3dE85?=
 =?utf-8?B?ZjhiOUZ5a3RKdHVEejVCWG5kL1BRM3hUMmk4M0gyd1ZaOGovYkgxWCtyY0lp?=
 =?utf-8?B?aG9yMlBuYStUcEdRR3o1cUVpbkNVdUVoYndMNllDNzc2VXRpbzI0Z0w1SHo3?=
 =?utf-8?B?UnNzZzQyci9heS9hRFU2eDVpcFcrYWhkUHhoVElNc2o0K0tuc1dTZUJXbXQ2?=
 =?utf-8?B?cWtWNkhrM0F1RnF4OFVHRk1YTXZ6TUIzWjhsS21WMDFoMlU1ZXhHdVUwZnpy?=
 =?utf-8?B?QzdTVWs0b3lkcHlqNFpIdE0zUzFmTkl2MlFKaHVNdHpySnRYSU5ESWozMmI0?=
 =?utf-8?B?NzFOSzYxWkVtbWN5ZDlXbXRzbG1VQzR2a04rTzNLRlAybGdZWnNPNHB1cHBY?=
 =?utf-8?B?T2hZNnI5UG5iWTF2dFRteWlCekZEcGx0RzlnRlBrZUQ0K1BkNDRNMkpGUlZS?=
 =?utf-8?B?V1FlaWFtZDdnbWMrTjdlUk16RHFud3RMVithYnB5SzBkT2pXRFJ5YzJXNFVl?=
 =?utf-8?B?NTNRdk1UaTM0eVMvTTZlNjg4NUZ0SXk2cFpWS1dOcUtiNU9kMUZLV0FmQVRy?=
 =?utf-8?B?SGRLdUlzOFVZVDlRaHlCdDBYdUl6dkJuS2E4SzJGUWJFMENPYW9JdzZyVDl4?=
 =?utf-8?B?cFJQVmxrNnBZamdhSkRtK3NXN2NYZythS3dXUmgvd1poRDJtdStqMFJOaEww?=
 =?utf-8?B?TUFhWEE1TU54Y1RGdWxMdnlpRlRjMkdnVUNKS3FHWlEvdWVIakk2YThONC95?=
 =?utf-8?B?aGlSR1RJZ3VVTi8vUjRSU0VQWjdzY2Y0MFJEU0EzMExUd0VEUEduSVQ0eXFh?=
 =?utf-8?Q?Zx6F/E?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 22:09:06.0272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f2339ed-d59a-4801-26f6-08ddc57e8bf2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6478

On 2025-07-17 13:51, Alejandro Vallejo wrote:
> Make alloc_dom0_vcpu0() viable as a general vcpu0 allocator. Keep
> behaviour on any hwdom/ctldom identical to that dom0 used to have, and
> make non-dom0 have auto node affinity.
> 
> Rename the function to alloc_dom_vcpu0() to reflect this change in
> scope, and move the prototype to asm/domain.h from xen/domain.h as it's
> only used in x86.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
>   xen/arch/x86/dom0_build.c             | 12 ++++++++----
>   xen/arch/x86/include/asm/dom0_build.h |  5 +++++
>   xen/arch/x86/setup.c                  |  6 ++++--
>   xen/include/xen/domain.h              |  1 -
>   4 files changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index 0b467fd4a4..dfae7f888f 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -254,12 +254,16 @@ unsigned int __init dom0_max_vcpus(void)
>       return max_vcpus;
>   }
>   
> -struct vcpu *__init alloc_dom0_vcpu0(struct domain *dom0)
> +struct vcpu *__init alloc_dom_vcpu0(struct domain *d)
>   {
> -    dom0->node_affinity = dom0_nodes;
> -    dom0->auto_node_affinity = !dom0_nr_pxms;
> +    d->auto_node_affinity = true;
> +    if ( is_hardware_domain(d) || is_control_domain(d) )

Do we want dom0 options to apply to:
hardware or control
just hardware
just dom0 (hardware && control && xenstore)

?

I think "just dom0" may make the most sense.  My next preference is just 
hardware.  Control I think should be mostly a domU except for having 
is_privileged = true;

The rest of the patch looks good.

Regards,
Jason

