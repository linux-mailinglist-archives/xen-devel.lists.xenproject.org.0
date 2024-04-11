Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BAD8A0883
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 08:34:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703774.1099647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruo0k-00088M-Pt; Thu, 11 Apr 2024 06:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703774.1099647; Thu, 11 Apr 2024 06:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruo0k-000859-MK; Thu, 11 Apr 2024 06:34:14 +0000
Received: by outflank-mailman (input) for mailman id 703774;
 Thu, 11 Apr 2024 06:34:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1M6P=LQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ruo0j-00084z-32
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 06:34:13 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8096d45a-f7cd-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 08:34:10 +0200 (CEST)
Received: from MW3PR06CA0007.namprd06.prod.outlook.com (2603:10b6:303:2a::12)
 by MN2PR12MB4157.namprd12.prod.outlook.com (2603:10b6:208:1db::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 11 Apr
 2024 06:34:05 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:303:2a:cafe::7f) by MW3PR06CA0007.outlook.office365.com
 (2603:10b6:303:2a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Thu, 11 Apr 2024 06:34:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 11 Apr 2024 06:34:04 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 11 Apr
 2024 01:34:03 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 11 Apr
 2024 01:34:03 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 11 Apr 2024 01:34:01 -0500
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
X-Inumbo-ID: 8096d45a-f7cd-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7MgjRMPdV6jx6A5Ak458k+skxcv/N9+8Fd8Hk7/cK5y9rY0mVwjOEfmWj/O4vm4h1qJ8MiPIdb0K3UxiJ6IKzQRRM52oXeXfQGiO2Fr4qulSvxDSPIvBQlFSOAhb5YESzGa7xBEqhM/47/G3LoHkCa6p+d6L4qwlFHDD/nYclir/+IDx2DDok1uKOuqyrZ08un8q96PjI4aSyTlPrZmfZpCtpcf3/5hKlKEkZiAf/wUkXYIrvJjTLj0hnnY/eEb7s2yaTC+sqq0sgU7XxlmpIUc+dbTomZ7Y0P+q3SWZRGORogS0uvVjCxVa/FRkfkXx67yKkUwjB3NlGyTOUgGvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOI0AzJ5Cm3uEZRcOUEXrT/C+7DL70klYEtygp89xRc=;
 b=dh8ONskdGVNm1kv3cFQKaZjxbkdVTZ9X6tPDztwyI9Ad39ng6rsYf2d6HC2MBYzfMKH6qPEfcFQxaTITK1iQCd/OUHN2K4azVwyz/cOsZtd+MXmGqZbrxgqtyOtCPIHnycRDehGGbvsssBBcz0oP0DPebwl+RjBkxQS+2BY8ypq/hUq3YdtT26DsCWh9eVg8lstWH6JKrUsTA5gYkQS4ww1H6Zz11RyP9iuOSg70fa3Kkh3f0Bz+Qa6xKsyPzCZPwO/0ri/v2nZDB727lmASiVq1EG09eNL5OiiVoM0UYjrFIeOHGb/VfcZ80vGMkgWztA+81gdD216kWreoMs5TBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOI0AzJ5Cm3uEZRcOUEXrT/C+7DL70klYEtygp89xRc=;
 b=gOyZ3c5iQSk4z4I1CL5rutALR7b22V1Oy/uU8r7yojdW8KfMYhNkYUmrEfdvq3ZGFETfp6EMhJXYOxdwBwFc9wwaJ2OsvJVJyAgU8cuhNN5UBLDORoDQ4XrLnbX0nRcvqIJTVO5Ap19fxIcUWBtHjoBysnw6Qp0/P64ptPMn5Uk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <beb9bda6-43cd-458f-a952-66c6071104bb@amd.com>
Date: Thu, 11 Apr 2024 08:34:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen/virtual-region: Link the list build time
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20240410184217.1482366-1-andrew.cooper3@citrix.com>
 <20240410184217.1482366-4-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240410184217.1482366-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|MN2PR12MB4157:EE_
X-MS-Office365-Filtering-Correlation-Id: bbeaf35a-20a4-4c0f-6611-08dc59f1622e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NIi3K6GMvx1+v4eXqOhVALYMaeW0C7uO1jCzuv3pGdK5vZMgb5iM/sJU4I/jbeGWs324Lvf5LmZWYpBBhJi5IHee4pYp4n55nGePmtcxk4a0F/MivPBDJNuXlVlj4yAq1Tw2wj5gHdzrj1N2ZaviqYMrf1uZospjfDuYlTOowykKTf00bbXwYPNJ4nYFjxmfNqQhKcOpqHpcSZm1tz4rTNVoJoh988U8wkVbIbR9kHgPinPle6Uu2DQTiyX4zM02Huu6Ooe3mggGwSDN94mzsXkSwi7B8NWvggEjmgACnrPMycz9lVouo4ABEGoDSKEVoAjBZLpuPYXlO9d0c6EoAlwoI+oH1aB2bMKf/GmUu5FBwe305yPhU1VFxZEy3XdKCqmVoyEEXTs822Tcm83MrvEY3UX/r/wq1+ts/vm7rw3nWmlRINOkrpySW2zuVZ/pgHApuDqKIzwL+eanNgbPn03UkNnIVpKsBzqS0v/7x2WqtjBaMoCjfkvGN21/+z23LEFN60e87tdkyXSvXFyNQLW6GU3Z4cVjVvE4Dm550aEJnS4vLtp+y8orFg2yUr9hUpCh9k6Z+unCVTYzcupRH3zFleTQ35EnGoiBiFgGMlAXWxPrb3eJxlKo05XMtA1ZHyyLEAaMLm1mdgVTHIYDSuqrY7gE4cbSKmu04xpE6MSqa+fYB7VBbD3/eeWIUWTefxQj9EWw9QtIGiE1bfpyz2g8q81f+Cv0ojHvAh9Bt+CQP876rSVDDH9cMlRKfyM2
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(7416005)(376005)(82310400014)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 06:34:04.7247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbeaf35a-20a4-4c0f-6611-08dc59f1622e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4157

Hi Andrew,

On 10/04/2024 20:42, Andrew Cooper wrote:
> 
> 
> Given 3 statically initialised objects, its easy to link the list at build
> time.  There's no need to do it during runtime at boot (and with IRQs-off,
> even).
> 
> As a consequence, register_virtual_region() can now move inside ifdef
> CONFIG_LIVEPATCH like unregister_virtual_region().
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Maybe with ...
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> v2:
>  * Collect the initialisers togoether too.
> ---
>  xen/common/virtual_region.c | 37 ++++++++++++++++++++++---------------
>  1 file changed, 22 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
> index 7d8bdeb61282..db3e0dc9fe74 100644
> --- a/xen/common/virtual_region.c
> +++ b/xen/common/virtual_region.c
> @@ -15,8 +15,18 @@ extern const struct bug_frame
>      __start_bug_frames_2[], __stop_bug_frames_2[],
>      __start_bug_frames_3[], __stop_bug_frames_3[];
> 
> +/*
> + * For the built-in regions, the double linked list can be constructed at
> + * build time.  Forward-declare the elements and their initialisers.
> + */
> +static struct list_head virtual_region_list;
> +static struct virtual_region core, core_init;
... empty line here for better readability

> +#define LIST_ENTRY_HEAD() { .next = &core.list,           .prev = &core_init.list }
> +#define LIST_ENTRY_CORE() { .next = &core_init.list,      .prev = &virtual_region_list }
> +#define LIST_ENTRY_INIT() { .next = &virtual_region_list, .prev = &core.list }

~Michal

