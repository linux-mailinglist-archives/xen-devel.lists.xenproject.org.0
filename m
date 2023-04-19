Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF806E741B
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 09:37:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523207.813046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp2NQ-0008On-EZ; Wed, 19 Apr 2023 07:37:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523207.813046; Wed, 19 Apr 2023 07:37:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp2NQ-0008LT-Bl; Wed, 19 Apr 2023 07:37:16 +0000
Received: by outflank-mailman (input) for mailman id 523207;
 Wed, 19 Apr 2023 07:37:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ifGd=AK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pp2NO-0008LN-JS
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 07:37:14 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe9282b0-de84-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 09:37:11 +0200 (CEST)
Received: from DM6PR21CA0015.namprd21.prod.outlook.com (2603:10b6:5:174::25)
 by SJ0PR12MB6989.namprd12.prod.outlook.com (2603:10b6:a03:448::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 19 Apr
 2023 07:37:08 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::d5) by DM6PR21CA0015.outlook.office365.com
 (2603:10b6:5:174::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.8 via Frontend
 Transport; Wed, 19 Apr 2023 07:37:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.22 via Frontend Transport; Wed, 19 Apr 2023 07:37:07 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 19 Apr
 2023 02:37:07 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 19 Apr
 2023 02:37:07 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 19 Apr 2023 02:37:05 -0500
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
X-Inumbo-ID: fe9282b0-de84-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtLUKTns89HL5C5JowSrge1qll5CjuWMtpSuM6iWO2piywwPF9DY145T4ht9eIArw3s5tbTXEpv0kfeyrbwA4SZ6YhyRqr9TkPSdYrAG1t9kszzyzoJtHUkVKlrFO8Px+NJlaWsoEaFNhsrivlLGoB6DnW71PSdKcoLmZP3jhu7qi9A5Kw1UdH+rEZ3tC5r/I4CG8G2yfXHHriHXxzmacTPrS8eDHX2ukS+/mMqoFwpgUmVWV3zPr9dk1EWjnSS3kbjZXyNE/bAfqusuUvKPD1yRImrVtEZJ54PzjfYQ0mBWCe8S22ZaPIhV2r/EgqZnHMRir/tlNigJ6tfXZYcfbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93SaySx2WRYEqqXGLGfz1BxIEOVaXJypyjYBnhWojm4=;
 b=fiNLa0KdKXJ2vIBWgK5JeFH4I3rV3ove7jEAKHAt60Dr1YMzbAnCTQW+JDuCXewn/wt7gaqxyj0ieKQdbQI+uEGCoKQ7R5xjcG5eJEAXZ1AnCrIFj9YRifAR32ahcSBSrM5pAAhDRxJDG9Wgqs/o3hvaj8xzYQrVgkb/TYn3AJrif7G/Hitz+fzpCdyfUJmURc/gsHhFhQ9MxfhbYPmCQEpOMtOdFa+4ABoKX1OARrJKr98ba6RoPz7TyXCFS+fbncWsbkEx1sN8y2/bcSrs6fxJJi612F8p3mppozM1Lv3NDSOV2CgvbHuOc18NlS4oksePsB24pVZojoqUb3b2AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93SaySx2WRYEqqXGLGfz1BxIEOVaXJypyjYBnhWojm4=;
 b=aNZUhqJBixLNg7YXMHLQ3b/Pou4T+RbMSlmteYIrnhMyAPmKi17UCiBTqwMkAxoZg60KPxgsOikREUVpwIXkg5PodxL/5SpHjcO4UjdxRShgVBDvkgo5gMR2ypzQKTejhOnDIyyrdgpyd8U+JO7q3rly5sNMall7QFJJrIqana4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <58cae772-dd3b-31f4-9849-9c2597f6eae6@amd.com>
Date: Wed, 19 Apr 2023 09:37:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: xen cache colors in ARM
To: Oleg Nikitenko <oleshiiwood@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Carlo Nonato <carlo.nonato@minervasys.tech>
References: <CA+SAi2uwrKFYN1tkYJ1_LVC-f+b-xb46RWTUv6wDOUO41yx8zg@mail.gmail.com>
 <bad09a6f-d41e-ab8e-2291-7fde3b646710@xen.org>
 <CA+SAi2uPZ=Dq1GxF9Kj1zCO=nbb55ruVG31kH-TgdpR6bLznvA@mail.gmail.com>
 <CA+SAi2s4WLiMEVa3u8rJRNZDpCpLTvnDygpObSUKxau-Q8dfyA@mail.gmail.com>
 <64326e46-096e-0f86-2aa9-31a72d3cd004@xen.org>
 <CA+SAi2u2=7h=Lo=bTC8YzmzidOErYaQGi=hpoG3w7tdM4LUzFw@mail.gmail.com>
 <alpine.DEB.2.22.394.2304181044080.15580@ubuntu-linux-20-04-desktop>
 <CA+SAi2srSq5Vwq8KL4TGc-GC3OjsFf=d-yKLVPw=C0KfBW67eA@mail.gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <CA+SAi2srSq5Vwq8KL4TGc-GC3OjsFf=d-yKLVPw=C0KfBW67eA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT054:EE_|SJ0PR12MB6989:EE_
X-MS-Office365-Filtering-Correlation-Id: 11755536-8380-427e-4f63-08db40a8e12f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WaoIr+daA0J1urrqBPIvUD+KgtlVxTLqnZ3cU4bS3aLS981uO5fa/yLQZNRdqe1bM1G36UevFwF0kLBIdDP/pM8c96xABEfozJDMl/pxE6CgplakckF9H47/dulVRWUawX77OSYjG2rowt0vrs8uJgDw3uv6tPvduQIGtD0bTgWVO1Cuom195Bmw1ulZakRinTDl1s1Dak1OyVfZNHcyBmmmU47l+LBABFkluTbU1A3pQQMTBli1gQx8rrgORfIGxrZarr3Skqps/MMwuDb7n9fY63Ok0TzayniZXDJgmj4I9JosOgVMWFJYy5W0LUplmNixVGc7QsrHLUThVv2pqIIfALkXzIjsW6uPR3XT5akNvSlb0kxCf7T5o8rJYmOv210jRqcM4A3T8CZKn/3ak5eRsrkM4YRWEopU19LPHmrr4yFUuxvhB7BYasu36GNttWttmsZqj1zpjM3/8JAJTdnXIzCKj6hblSHHhN6ZoucmlVV2+lAEFY7lOQ7/r47DNhlVcRK/BBheb60L1ZTIjFe+6C+8xSXOSwMTxFF59oF06dO4K3+AnkAKAzxBfYuvlPcG0xDVx6hn1FJe8JX5aE6gk4k6wKzOI1m2ynjiHtuq3eyZwxCJY0b9pW21UO1m30vR6Igs6AxcStH1f06NY2K3WJyulM2VIkMgCImtEBNr8MV1trc++ewBJIrRv14ImUlRhyNmtCBpqdD5B5vVThPqtPA4E9QT3rmYzitUxXKZMpUITdPolNPrEQMIkGPw
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199021)(46966006)(40470700004)(36840700001)(41300700001)(2906002)(82740400003)(356005)(70206006)(70586007)(81166007)(40480700001)(8676002)(8936002)(44832011)(40460700003)(4326008)(36756003)(316002)(53546011)(186003)(966005)(86362001)(47076005)(2616005)(426003)(5660300002)(83380400001)(336012)(82310400005)(26005)(31686004)(36860700001)(31696002)(478600001)(54906003)(16576012)(110136005)(6666004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 07:37:07.8933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11755536-8380-427e-4f63-08db40a8e12f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6989

Hi Oleg,

On 19/04/2023 09:03, Oleg Nikitenko wrote:
> 	
> 
> 
> Hello Stefano,
> 
> Thanks for the clarification.
> My company uses yocto for image generation.
> What kind of information do you need to consult me in this case ?
> 
> Maybe modules sizes/addresses which were mentioned by @Julien Grall <mailto:julien@xen.org> ?

Sorry for jumping into discussion, but FWICS the Xen command line you provided seems to be not the one
Xen booted with. The error you are observing most likely is due to dom0 colors configuration not being
specified (i.e. lack of dom0_colors=<> parameter). Although in the command line you provided, this parameter
is set, I strongly doubt that this is the actual command line in use.

You wrote:
xen,xen-bootargs = "console=dtuart dtuart=serial0 dom0_mem=1600M dom0_max_vcpus=2 dom0_vcpus_pin bootscrub=0 vwfi=native sched=null timer_slop=0 way_szize=65536 xen_colors=0-3 dom0_colors=4-7";

but:
1) way_szize has a typo
2) you specified 4 colors (0-3) for Xen, but the boot log says that Xen has only one:
(XEN) Xen color(s): [ 0 ]

This makes me believe that no colors configuration actually end up in command line that Xen booted with.
Single color for Xen is a "default if not specified" and way size was probably calculated by asking HW.

So I would suggest to first cross-check the command line in use.

~Michal


> 
> Regards,
> Oleg
> 
> вт, 18 апр. 2023 г. в 20:44, Stefano Stabellini <sstabellini@kernel.org <mailto:sstabellini@kernel.org>>:
> 
>     On Tue, 18 Apr 2023, Oleg Nikitenko wrote:
>     > Hi Julien,
>     >
>     > >> This feature has not been merged in Xen upstream yet
>     >
>     > > would assume that upstream + the series on the ML [1] work
>     >
>     > Please clarify this point.
>     > Because the two thoughts are controversial.
> 
>     Hi Oleg,
> 
>     As Julien wrote, there is nothing controversial. As you are aware,
>     Xilinx maintains a separate Xen tree specific for Xilinx here:
>     https://github.com/xilinx/xen <https://github.com/xilinx/xen>
> 
>     and the branch you are using (xlnx_rebase_4.16) comes from there.
> 
> 
>     Instead, the upstream Xen tree lives here:
>     https://xenbits.xen.org/gitweb/?p=xen.git;a=summary <https://xenbits.xen.org/gitweb/?p=xen.git;a=summary>
> 
> 
>     The Cache Coloring feature that you are trying to configure is present
>     in xlnx_rebase_4.16, but not yet present upstream (there is an
>     outstanding patch series to add cache coloring to Xen upstream but it
>     hasn't been merged yet.)
> 
> 
>     Anyway, if you are using xlnx_rebase_4.16 it doesn't matter too much for
>     you as you already have Cache Coloring as a feature there.
> 
> 
>     I take you are using ImageBuilder to generate the boot configuration? If
>     so, please post the ImageBuilder config file that you are using.
> 
>     But from the boot message, it looks like the colors configuration for
>     Dom0 is incorrect.
> 

