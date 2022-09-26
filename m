Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C3E5EA80E
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 16:12:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411838.654922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocoq1-0003jK-Fd; Mon, 26 Sep 2022 14:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411838.654922; Mon, 26 Sep 2022 14:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocoq1-0003gB-Bt; Mon, 26 Sep 2022 14:12:01 +0000
Received: by outflank-mailman (input) for mailman id 411838;
 Mon, 26 Sep 2022 14:11:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zqb/=Z5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ocopz-0003g5-Qo
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 14:11:59 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2080.outbound.protection.outlook.com [40.107.95.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dfaaa0b-3da5-11ed-9648-05401a9f4f97;
 Mon, 26 Sep 2022 16:11:58 +0200 (CEST)
Received: from DS7PR05CA0093.namprd05.prod.outlook.com (2603:10b6:8:56::17) by
 PH7PR12MB6954.namprd12.prod.outlook.com (2603:10b6:510:1b7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 14:11:54 +0000
Received: from DM6NAM11FT096.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:56:cafe::17) by DS7PR05CA0093.outlook.office365.com
 (2603:10b6:8:56::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.14 via Frontend
 Transport; Mon, 26 Sep 2022 14:11:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT096.mail.protection.outlook.com (10.13.173.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 14:11:54 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 09:11:52 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 07:11:51 -0700
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Mon, 26 Sep 2022 09:11:50 -0500
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
X-Inumbo-ID: 2dfaaa0b-3da5-11ed-9648-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZfv5WvdUoEXBpw8fgb0AC5X0zcqnSIqupHIqvDp2qYPUkAqbQYTHmV+EObQ44EqmL5lj4qJVweo8vOdkJ7T6FYMRjXp2vRAJCPdQgWtqkp1DE5EVDaob9Aumz6uQzCltD6i8TAhVkWqyyN5SkrwOrCHBcnL074A14vuQT3CL0iZlNPOj98Sz2nsmynPB/MoRJkwS8srulIfYL6p4FATj0+UecZ6h6yw6r+qSFdMdRWO6CNJSIY+31vsJb4HB15kw/qDXNNElcQltLaym8z1EbUlCJ/R0KTJuYbo4BHehJuPNOm2j1FFq7idx1vp2xeaWz3xtt7XTK4y/j+PUKI/uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCa7RgRCiHaQKLpAtV0Bhm/P6jTdXlqnwn1Nce48kS8=;
 b=XJO/Mh5USe17wziN2c3ENSG8nIWhPYCfW5MM2MBxr0tzO54E5eMILfvnqXG4poWY0xcP0dnk8ZQNMiMnF+n1xae0fiZ6+MI6BYgtFK9Isigil5eyvKh+KcU/62hgoLGWiUr5mUdfiO99hRPCwiav/pCBSlPMsF84AZagPw6hDUJWEVO/LHfIUnKL9qDViKzwfSBdnVpPO2zk1Vk0SUc0BItT25sT1K/UiREBnNx66AYMRRAb6WR/FiYsRKFor/230t0iUJ35+A8VuDaJ23/jw8nYhjVSkvUev1insQ++Nbgo2q20WmFh0I1+Z9XegARBCQbZLYIZfZ58EZPKMM75Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCa7RgRCiHaQKLpAtV0Bhm/P6jTdXlqnwn1Nce48kS8=;
 b=MFevuEtc6ErQKfMSXU94uXH8sFbLtE55NFcAvLaeurgFtdPsz7lJu9S8nt1C9s1jCPpRlnq7gZ3y2wvl7mDFPrWstkvwJK0bvWoo3gLTQYh3vKCWl9DWA6o6ItdyJ7iknEu/JmFQoby+Io0Op4sgHME4v1ETCAoTyCOiGgWDKLw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1370699b-f625-7d73-3e4d-104567660599@amd.com>
Date: Mon, 26 Sep 2022 16:11:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [XEN PATCH] automation: Information about running containers for
 a different arch
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Henry Wang
	<Henry.Wang@arm.com>, Doug Goldstein <cardoe@cardoe.com>
References: <20220926135838.47330-1-anthony.perard@citrix.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20220926135838.47330-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT096:EE_|PH7PR12MB6954:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b472f28-e7c4-44fc-3bb1-08da9fc910d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o6WirtcHbgeEFtHIcExqjnpq/bl4Ugiol0qYWk9rZ7V/7xudVLTcv515yzGkedSL/V7i/9DVs8qZtoJtNPuKNtHEPi0MucYR6edLvEywJV+ZqBSNY6e0MqV528wlBSk0aHxt5tGee2s44Hy4sffnKeUp3xx+0fnVxN8FimYe989aRlPUGlDsNnzzezlbXq0dRQIcoHm9O1TFoi3zUm/gzf4k10D81zyzemD5IvpUIdjjLi+CR+5UAwUG1v1fwCcSgqtmvrRl8E658ER9D9mRJELABPfSVU3ye8pk4a09bJbV1kACOY/cZn5zCzP5frJxHOiHq3TvkxpC+DOhf/S76BLoZKqMoqg6SiKNQ6JZaE40NJEvJ0Hh5DVgikBw7P9LkGmKEH9gsXfUbhscrbGJ5LY4nHMSpgJqVQ4AKC6i3nz6d38yB6dHHtO7tVEVv2rlppsMz2cicKOEJyWjSrz6k9a+hJSX5nT18F4TUWrgOeiZNUOYqC99caREdpaZV/QM91K/8IuEUXMkiSAqqelIJRaj1lHwVJQZe+O5mFqC/m2wPcCmlOl6Fa9JCFRWsLNb2nK7IYYbOzHnuJCpvhK9F6jpQBoHFAfpKtaeoyxvKalNLU/VKqTKspx8xr7NlALm0xGWprc7WPoCAYXL+Idy42h7giU44al1kobpnw/Syaz+BsdeTr5Ne+oI0mFxMl/BiCLer+pPN8Rhu/ZKjq21AtuqEopX3vk+lC4bJocmDhW+9jTJQmU9ENCjoXL23st5dwBtjwCvQ/gDx+G17KuKv7cd0FLYoqtol7tTIC0ewXvU/kzgoK+9gW4nIC2l/pgN4Jn3f9H7fjVNiZKbhE1ioiFsax41XoVt7Pkh9ObXydzBeIhklYFDuBNyLXW5Yb5nOmUpmFi8e+LoUyytB1X93Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199015)(40470700004)(36840700001)(46966006)(26005)(2616005)(2906002)(5660300002)(44832011)(53546011)(47076005)(186003)(83380400001)(8936002)(426003)(81166007)(36756003)(31696002)(40480700001)(86362001)(36860700001)(40460700003)(966005)(70206006)(70586007)(82310400005)(356005)(336012)(31686004)(478600001)(54906003)(110136005)(16576012)(4326008)(316002)(8676002)(82740400003)(41300700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 14:11:54.4905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b472f28-e7c4-44fc-3bb1-08da9fc910d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT096.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6954

Hi Anthony,

On 26/09/2022 15:58, Anthony PERARD wrote:
> 
> 
> Adding pointer to 'qemu-user-static'.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  automation/build/README.md | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/automation/build/README.md b/automation/build/README.md
> index 00305eed03..5d4734bc77 100644
> --- a/automation/build/README.md
> +++ b/automation/build/README.md
> @@ -102,3 +102,14 @@ make -C automation/build suse/opensuse-tumbleweed PUSH=1
> 
>  [registry]: https://gitlab.com/xen-project/xen/container_registry
>  [registry help]: https://gitlab.com/help/user/project/container_registry
> +
> +
> +Running container for a different architecture

We need qemu-user-static also when building a container for a different architecture.
So this should be "Building/Running a container for a different architecture".

> +----------------------------------------------
> +
> +To run for example an Arm container on an x86 machine, simply install the
> +package `qemu-user-static`, and that it. Then you can start an Arm container on
s/that/that's/

> +x86 host like you would start an x86 container.
> +
> +If that doesn't work, you might find some information on
> +[multiarch/qemu-user-static](https://github.com/multiarch/qemu-user-static).

This is also missing quite important information that QEMU emulation using
qemu-user-static only works for x86_64 host machines. This means that you cannot
build/run e.g. x86 containers on an Arm host.

> --
> Anthony PERARD
> 

~Michal

