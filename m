Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F9E9BEF05
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 14:28:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830979.1246142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8g5T-0006hC-34; Wed, 06 Nov 2024 13:28:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830979.1246142; Wed, 06 Nov 2024 13:28:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8g5S-0006dv-VT; Wed, 06 Nov 2024 13:28:42 +0000
Received: by outflank-mailman (input) for mailman id 830979;
 Wed, 06 Nov 2024 13:28:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DrBW=SB=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1t8g5R-0004n0-IY
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 13:28:41 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2084.outbound.protection.outlook.com [40.107.96.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b15995f6-9c42-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 14:28:11 +0100 (CET)
Received: from SJ0PR03CA0360.namprd03.prod.outlook.com (2603:10b6:a03:39c::35)
 by SA1PR12MB7443.namprd12.prod.outlook.com (2603:10b6:806:2b7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 13:01:50 +0000
Received: from MWH0EPF000971E6.namprd02.prod.outlook.com
 (2603:10b6:a03:39c:cafe::6b) by SJ0PR03CA0360.outlook.office365.com
 (2603:10b6:a03:39c::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18 via Frontend
 Transport; Wed, 6 Nov 2024 13:01:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E6.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 13:01:49 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 07:01:48 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 07:01:48 -0600
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 07:01:37 -0600
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
X-Inumbo-ID: b15995f6-9c42-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjQwLjEwNy45Ni44NCIsImhlbG8iOiJOQU0wMi1TTjEtb2JlLm91dGJvdW5kLnByb3RlY3Rpb24ub3V0bG9vay5jb20ifQ==
X-Custom-Transaction: eyJpZCI6ImIxNTk5NWY2LTljNDItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODk5NzExLjIyMTYzOSwic2VuZGVyIjoic3RlZmFuby5zdGFiZWxsaW5pQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DOkX/dGQ1d+xLr8P8IMY3/UMydE58Jvq9rUFKEQ1TCKxMfvzjuJXLC+D9UuFND6sgmyQjRWaaBnmG63DjqEOMV59EBNoAnKZCo5UH4SMn5ye3BBz7oUm9kxy3GgB9+aOm5aTXeMJ4vNXitYcejo75y/s3mAv8aVa+SmgovkAd+4+uo/yc5xnNRskenk4kREUf5Npzc3ve1DoClZOLxU2PBmCBf03QzjFAXmQfeO82ECAbx4piOevTlUeCqkG50bhXISZy2we39ui7GGGSBWXpazPxJcQAjVEwISxfNUV7yXVvVcaF1xU4G6ErMPEE/oYk+XVbedl+wwsnAlBzTZEew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XT11z8kAJY3Xk8WK3qUJgge4WxIHZoc7gqKAeAzEMX0=;
 b=e49fZlIOBrS2zOMAnq76/5zv12v0YziDP0CAtbiYGEkoyz/63zAwmqbXqrUaUfR/RaOQa+e5ZI35/kFuMGK7W9BBElIbEdrbQwwoOf8AYw1XRZrvkTbpaqyLyR1cMZiMAeYR2eDky4l8DXIUPF38D8HD0sHho1iffVLGzXd6ASUDtmUR84S2+1lVbAt6vnOE14CgCrCJeMkA4aXni6gWd7ggCImYQeRUO/aeAuMqR2m91Gyx/MDLdaYLfr6+fPxoZhuPxTnEN1Bw06cNZKByC5WVQYLSJTG8vy1D7clf+hicvozschTQDOyu9vNTXjNHAe/UaeL5HIxU/rQH7jYAUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XT11z8kAJY3Xk8WK3qUJgge4WxIHZoc7gqKAeAzEMX0=;
 b=xfc5haTJLPnzJLulq2yAQfY4lRsO/NHqDSAw4DnPbTK+djxE9OAQtlwImB3t4ZAJJBPPVLlYT2R91fUEjo4Ml3y6RhW4cYjoQPKXaKkFGC6mUsWsku4YsK8Mh/QHNN7fROWbl25RIM+x67FACmf+UZ9vc4/6H6mLgE/Bb51SwmY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Date: Wed, 6 Nov 2024 13:01:27 +0000
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] CI: Fix package installation for Coverity run
In-Reply-To: <20241105204603.3412857-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2411061301140.89051@ubuntu-linux-20-04-desktop>
References: <20241105204603.3412857-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="8323329-540673888-1730898107=:89051"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E6:EE_|SA1PR12MB7443:EE_
X-MS-Office365-Filtering-Correlation-Id: 5af805f0-100b-416c-1fce-08dcfe632d8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHlHcUhhYlJPSE45VHZJT2ZLcUhFd2xPSTltV0g3RkFIbVh1L0ZEMStxZUFh?=
 =?utf-8?B?TW1xNm1IMWRiWHRvaFJLZ25MZmNyZ3JDT2orM0pvRFBDbVQzSWk3ZnpzSGRU?=
 =?utf-8?B?OEZsYVpWQ0R2R0hFYzZkU1pnTW4zY2J0M3V2WmozdUFQWHU1SXNWeWJ1ZkhY?=
 =?utf-8?B?dkN5NzdyU0hycE8wR3NIYWRFVVc1ZW9Ca2ZUM25VMHNRMUVOay9EeUhyUTFs?=
 =?utf-8?B?S2NvVmZTZXhVWjZ5SkRNQ1BqRm81ZVV3dnVvcEFBNjNxY2RoNHVZbEU3bWEw?=
 =?utf-8?B?R0t0T2UxTWh5TTR1WVBLQ0tvb0Y2UHBReCs1bitTcU1TUjI5bFIrMjlac1hy?=
 =?utf-8?B?d1IyR0s0ZFdBbVBBcE0vc0tmaCtHUkFuQ3VFKzQzS1lpdGw3NTZkaEhxY0Vq?=
 =?utf-8?B?VmJJcHV4Q2lOS2hhK2NzMVFrMGhsK1g2c2N5Y2FyNEtxaDUrLzkwd20yU2Ir?=
 =?utf-8?B?TjVseERTb202bUVmOU9DK0J1emFIZFM2YnFSMWg2dVlWdnRCbmVzSVF0eVU1?=
 =?utf-8?B?YWNVRkJ1N1JyaUJPU1A0U0hiR1N2M3pPV0xhcnB3aHpUdlNmeDRyWklkOW1r?=
 =?utf-8?B?SGpCZ3FqQUVzOTZWUGR5YVpRUFlQMmJoS3FxNWliQTlyaG05UDNUSk1ydmZs?=
 =?utf-8?B?RHd0eHBLTVlLY01ycWtWdnkrYkozYjdEMUduM0U3MEpFREtsaTdoK1M4UWFG?=
 =?utf-8?B?Skd5UmlPa1NKeVdkejIvcDZPVXlZWFhDMTFsdlNnYU9lcEIrbWVKblRQaHBK?=
 =?utf-8?B?VDVMamZGOVJUQjZKSVdNKzd5YmZWcDcrVWZFZ1JTWCtMRkQycElZWU5hNldy?=
 =?utf-8?B?N2lUemNvNjNyS0V6NWYvYUFJTTVXWmZ2YTBpaGI4Z3MweWplcWhVdkdEU0dV?=
 =?utf-8?B?YUdtZE9NTjZuMHZ0M015WHJjdS9oY2dJSllHTlhFb05oc3RUclNaeEN3c3dK?=
 =?utf-8?B?c1crSW9oY3Z0MWd2Q29SSWVoRnpZZ0NyZUZyTG1FeWlNY0JmT1VtaC83Y2N5?=
 =?utf-8?B?UU5ZSGRZOHNubEhjT2VoZWZZR21ZN2h3S0pZeGdxRTF1eHM4b1RCRlZ2Rm41?=
 =?utf-8?B?bDR0WlpKRXhPQVBuSVhlMGoydElmcmhNNmwxR09rSGhROGlhbEg1bUxlTldR?=
 =?utf-8?B?NHp5YWNWVFoxV3ZsSG1CdUFLaWl4SWRlbTgwczdWcUUrdnE3cVhCcTZmcU9X?=
 =?utf-8?B?ZTBZRy9vVjdYaDlFTFkvaEg5bjgyRTUvUmJuNjFuL0tHNndxNmdvVkRRTHFQ?=
 =?utf-8?B?RjVaUkpKUnFJdU1zRnVCTS9XQzIyRWpRUk8xUk5tL2pDNGh1d2R6dDJhdGN5?=
 =?utf-8?B?eWtFMG9BSXJLY1RPZ2lzSis2VW42SVQ3SXUvZGtYZzFVeEpuVS9KNHZ6eVZO?=
 =?utf-8?B?M1NWMFFuc1J0SEZTQXBzVEJ3Zkx0NjdjWFRUbXc3UjJFbFVyTW9mRFRWMEF2?=
 =?utf-8?B?ZXZaaXRSM0hRaU0wYThYWllkd0Z6SWE2VWhMYWZBYVNTKzBMSHFQdVVhcSs0?=
 =?utf-8?B?Yzk5SVdzdFc1S3NhZUJDRFNzYVllSVBES1ZZRnFkV3phY1dTQ2lzcHE3eGJy?=
 =?utf-8?B?UjBEaUdYNDVQaU1QVVpUUE1mSmRXWElXM0ZINlU3SVUzRXpJblU0SzZtdUt5?=
 =?utf-8?B?bFhYTmlqZXRGblFJajYyUnRRb21WaHhIRmRSRzd3VkdwK1piSUNsaEFUSS9p?=
 =?utf-8?B?L0RJRHl2K1ZUMlpvbU9pdVcxWEM5YnZKcFB2ejQ4ZjgrTjZQb3JvZnhDUm9B?=
 =?utf-8?B?WXpGbW5oMEJXWXZlT0tmL2ptTEdxcWNnOEE1blE0WTZWSTJwRlI4STVDcU9j?=
 =?utf-8?Q?8rDx19Ebw+uafOeLqFnep61VRP3sqMMlqn4UU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 13:01:49.7293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af805f0-100b-416c-1fce-08dcfe632d8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7443

--8323329-540673888-1730898107=:89051
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT

On Tue, 5 Nov 2024, Andrew Cooper wrote:
> Something has changed recently in the Github Actions environment and the
> golang metapacakge resolves to something that no longer exists:
> 
>   https://github.com/xen-project/xen/actions/runs/11539340171/job/32120834909
> 
> Update metadata before installing, which fixes things.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> Example dry run with this fix:
> 
>   https://github.com/andyhhp/xen/actions/runs/11692180675/job/32560954258
> ---
>  .github/workflows/coverity.yml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.github/workflows/coverity.yml b/.github/workflows/coverity.yml
> index 984636eb4635..a6c2819b0a24 100644
> --- a/.github/workflows/coverity.yml
> +++ b/.github/workflows/coverity.yml
> @@ -12,6 +12,7 @@ jobs:
>      steps:
>      - name: Install build dependencies
>        run: |
> +        sudo apt-get update
>          sudo apt-get install -y \
>            build-essential \
>            git-core \
> -- 
> 2.39.5
> 
--8323329-540673888-1730898107=:89051--

