Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8A176D00C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 16:28:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574963.900613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRCoh-00055R-29; Wed, 02 Aug 2023 14:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574963.900613; Wed, 02 Aug 2023 14:27:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRCog-00052q-VX; Wed, 02 Aug 2023 14:27:10 +0000
Received: by outflank-mailman (input) for mailman id 574963;
 Wed, 02 Aug 2023 14:27:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TXK3=DT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qRCof-00052k-6v
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 14:27:09 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e89::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7af8ce3-3140-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 16:27:07 +0200 (CEST)
Received: from MW4PR04CA0342.namprd04.prod.outlook.com (2603:10b6:303:8a::17)
 by SJ2PR12MB9244.namprd12.prod.outlook.com (2603:10b6:a03:574::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 14:27:02 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:303:8a:cafe::9e) by MW4PR04CA0342.outlook.office365.com
 (2603:10b6:303:8a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44 via Frontend
 Transport; Wed, 2 Aug 2023 14:27:02 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Wed, 2 Aug 2023 14:27:02 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 2 Aug
 2023 09:27:00 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 2 Aug
 2023 09:27:00 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 2 Aug 2023 09:26:59 -0500
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
X-Inumbo-ID: a7af8ce3-3140-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETz/y/5ay50DkvE2BIq4agIte2RKPTrnT0tov1tfnvICvtV7/I8Oz6HQy4aotq4xkDWWKPGPTNpNuYbV8xMJqYH/yvtVKpV0mSp29t7WAPxlwbXafMExUhoqsW3vlGBWFfgZEv5I+uCKi1OpEJVY6Z94TAsa+0vg9lr99jmjQnDj4t0UyYf0tVw0WWVkOqDXhd8AM3H1k3pmKF6bp9OjuO/oFcb6RxO7x3AYca/7yXQwVRffmNHn2ZiWG0Hf21bPnmWvf80FJkO73cvhkStFGfmHGJjOM8cKJnriRC1QmzJZ6WAlMNVWqvFfXarvip1/hZVhCBSTc5L0RDRdTthL0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nohBqLPQWx4dTuM4PWNJLXKTSyzFHK5QNQ1WRz6kULU=;
 b=Hq0z+OIyfGgsy8v0yk1xwcqZwAR7i/Xh/0rk8toGGRUSpDy7q0GxXIwcaY/CkpbOQerQpWwSW4uqO/1wk30BSnSPAj5yGM3Or3fiV0Qj5O+NAeB/k9/TGuLN6J5n6JLb+jdwISyGtVh/JIX+PloGQMNgQsDcTjCCliUzKtuKlOhKDdJhyefcR2zeiOvWpmw+I3urevcqyPyu56tYZx+RnpfPJYl/DlwxnEZpuZ4ya2IiOIu1JsoQ9wfjoBiaNUpzFj0bZcUafGOowCc2sHDHAtpW9dVxWkK1R4LX74pUcU/QIOjESWbLhL7g6gWcmgB5cs1I4wiO3FNbebtUFb+ToA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nohBqLPQWx4dTuM4PWNJLXKTSyzFHK5QNQ1WRz6kULU=;
 b=nm+tammUCSXaxSdG1yylCYhwRH8OVkq5Ws0lTXLKCqBjQss5iFAqTKzn4dBqDgC4PYN/+DCOf0yYeB6qVQHzXG37utn43HZeSxmPOlmazmbVvCc8lazz9xJbO44lwrBRZw91q80K6sPSyQW14J14ThiWR/nDgkGpp9wkRKAHOqU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <17bc595a-dc30-9e76-4d31-aad62f9c9672@amd.com>
Date: Wed, 2 Aug 2023 16:26:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20230802135350.745251-1-luca.fancellu@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230802135350.745251-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|SJ2PR12MB9244:EE_
X-MS-Office365-Filtering-Correlation-Id: 69a3f33b-c919-479e-5d5f-08db93648a12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ds0KnKK5gQ036SbIJ+2bJQuDItA0AH1STLo10vqy4T9JCeof/5DIvF2d+FBEZXOVuXXYVviDUdOvH0z1ab4T0i2BsQwh/am4POi5tvgX3jNIsKVCWrInV2tVmSk08JPs2cFL/HMhIQDdWUw+xrnjtwCmEcOTttr92UHAUt3l7F3i81CXoorNUxLty33JD8jZCgHlnJO/pC20r5YcyU5l9v9IJCLO6PVMO0m1sRKbZA2RmDWqdSy6EVjttzYEulDXgu6yB/ecNILiKjg9B2ZRIiBB0V4zg2EjNSM56lFeanAApAqFGgGWyfDkl+tmEgw0WtYCUNBkWaZ5q3dC6kt0mLeEnpTGAu3gfbKoJfe/r0cmGQka+Tb1xdBCCD14uETZJ8ru07CIbzVKOvJ16C6EP2z/jWnDMRzzPxCUpY36lLaFQjrC540msStJ6LoEyEorr+7ig3lY3kaYQYd18dZxz2VYFz79TK7K/N4LTKuaZdzFI0pfZIeXA/q08O++6ZbZkWU+MSy7YihKALIcGHlWMZdabb/zXRi8zlCEC9faLoP+MB2BdYpyQ7vVI93bPz8n637ZbEs31pQUtfuIlp7LMBgJZVycjyBc9HBubNGfK7NY4W0UgaCDgDlDEGAMB0kcBboqvkB/hLROmb48tynfZboTHRSxJBshuk9CsDu1W1uVWteqegfE0WrcH/UyN5SbKZ0F2ff8qZ0dxugs0LFGqOxHva1RUfZmvEdRACWoaq64hi6B/OwovvvLKhSbyRmHMqJDIoCqWp/cbi0Kp+egBJ1lVdTyU9RepG/aU04HUmVlSvlAEy9P2lmWEjU0mYyN
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(82310400008)(451199021)(46966006)(36840700001)(40470700004)(44832011)(4326008)(40460700003)(70586007)(70206006)(2906002)(426003)(2616005)(81166007)(82740400003)(356005)(53546011)(336012)(186003)(26005)(83380400001)(47076005)(36860700001)(110136005)(54906003)(40480700001)(86362001)(31696002)(36756003)(478600001)(41300700001)(8936002)(8676002)(5660300002)(31686004)(16576012)(316002)(66899021)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 14:27:02.3654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a3f33b-c919-479e-5d5f-08db93648a12
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9244

Hi Luca,

On 02/08/2023 15:53, Luca Fancellu wrote:
> 
> 
> Introduce Kconfig GICV2 to be able to compile the GICv2 driver only
> when needed, the option is active by default.
> 
> Introduce Kconfig VGICV2 that depends on GICV2 or GICV3 and compiles
> the GICv2 emulation for guests, it is required only when using GICV2
> driver, otherwise using GICV3 it is optional and can be deselected
> if the user doesn't want to offer the vGICv2 interface to guests or
> maybe its GICv3 hardware can't offer the GICv2 compatible mode.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/arch/arm/Kconfig        | 13 +++++++++++++
>  xen/arch/arm/Makefile       |  4 ++--
>  xen/arch/arm/domain_build.c |  4 ++++
>  xen/arch/arm/gic-v3.c       |  4 ++++
>  xen/arch/arm/vgic.c         |  2 ++
>  5 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index fd57a82dd284..dc702f08ace7 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -78,6 +78,14 @@ config ARM_EFI
>           UEFI firmware. A UEFI stub is provided to allow Xen to
>           be booted as an EFI application.
> 
> +config GICV2
So, now it would be possible to deselect both GIC drivers and Xen would not complain when building.
This means that Xen would fail on boot without any message as it happens before serial driver initialization.
Since having GIC driver built in is a must-have I think we need to make sure that at least one is enabled.

~Michal

