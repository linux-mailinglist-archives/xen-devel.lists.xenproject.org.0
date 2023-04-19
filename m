Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 920136E779C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 12:43:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523307.813232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp5GR-0003OF-QS; Wed, 19 Apr 2023 10:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523307.813232; Wed, 19 Apr 2023 10:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp5GR-0003MA-Mm; Wed, 19 Apr 2023 10:42:15 +0000
Received: by outflank-mailman (input) for mailman id 523307;
 Wed, 19 Apr 2023 10:42:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ifGd=AK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pp5GQ-0003M4-Kn
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 10:42:14 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe59::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d65371ff-de9e-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 12:42:11 +0200 (CEST)
Received: from BN9PR03CA0945.namprd03.prod.outlook.com (2603:10b6:408:108::20)
 by PH7PR12MB6442.namprd12.prod.outlook.com (2603:10b6:510:1fa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 10:42:08 +0000
Received: from BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::b5) by BN9PR03CA0945.outlook.office365.com
 (2603:10b6:408:108::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.47 via Frontend
 Transport; Wed, 19 Apr 2023 10:42:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT016.mail.protection.outlook.com (10.13.176.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.22 via Frontend Transport; Wed, 19 Apr 2023 10:42:07 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 19 Apr
 2023 05:42:05 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 19 Apr 2023 05:42:04 -0500
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
X-Inumbo-ID: d65371ff-de9e-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgG0TvtnBwceqs5F5UznJPn+A7thquiaZNcckfxW0JB/sWWqUmJyMmVW7+XtLov2hVo/n3BT3gXVDpn7c90Xb/zYZXE3phf6NE3G6arcMYGXsWlmVOQBlxVmlVHQE7eftbe5+3wgbbTI5GQItxBOmTdgEi9cMWrzCICYriTp8OLeNNMmCBmkEoohjBTqDVe36ulxJ6wBL5BK+ZICpq0I48OD2qG1Pwx/7VMpAdBgS0yE12sYo/0XjoRQI31IUUO9krLPrI6RBxS6juHObIIqNOn8DvOOBVoAmoVjOa1A4mE56VWYUEcYjN38fcITB0V4AgDC20ZzEmgoJRzRcdlviQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kw9zubjYP9j++8LYacicxoxGMx3WukjD4Ck2D2aP9ls=;
 b=g3u8FdkS0OA76apiF+boE1W6J6qJ7D/JybASddaHNWsFh6ZP/+H04OoQVoJq6fbw54N9oiIy6ejeuebaYZVr240CD1gLZPCTInUqzq6fXszEbriH8iezZqAftIvuyRMA+TXzk37VimFqNrAJh5GgPLLO++D0uxJ9AY9HuXKlytjaCb1eCbJiQRiRYJbNcivf23mpjeOU7ZvEtshnSOzJE/HJwx8XQDYJh/b8tP6+WsDTW9ArvSDDIpykDrPXSVfgG346j37x6dx3x/q0pDQoXsbAxXSXE1x8QOfTKZwkREjNbNRe+q01CZIcQLLQnmkcWu4GJ38CFRMbeUQVp552fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kw9zubjYP9j++8LYacicxoxGMx3WukjD4Ck2D2aP9ls=;
 b=ZCkz6414afzq3ao4zeuAlbqzibLkltIk8pYtz/u8HHLfpzJNhelAFZRJFK02oDtbHKh75zrfCPxMnZ8YrwWIMuy/O1zylqgb5w6t1kd5dyxrdS9FESAXhY9WkCFtDYLvErgLztcexKI0tItPP/1HVqjUL1SIRP47IW2zKgX036Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2941a6f0-6d4a-56af-648e-e5734362fce1@amd.com>
Date: Wed, 19 Apr 2023 12:42:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: xen cache colors in ARM
Content-Language: en-US
To: Oleg Nikitenko <oleshiiwood@gmail.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, "xen-devel@lists.xenproject.org"
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
 <58cae772-dd3b-31f4-9849-9c2597f6eae6@amd.com>
 <CA+SAi2vU0i9trrdgCusB0WYJmYLqjXRk9qSGALjMbKYvmPGcvw@mail.gmail.com>
 <CA+SAi2tc_3r3SAXVOmdbDJXvppaXkSdMH0iv-fG1zUwG3Ub_hQ@mail.gmail.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <CA+SAi2tc_3r3SAXVOmdbDJXvppaXkSdMH0iv-fG1zUwG3Ub_hQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT016:EE_|PH7PR12MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ac11610-ee8b-4346-ce91-08db40c2b908
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7XBnJWE1rBGrDHpUNNpyWDeaxLLtmuTzAgMYYwuP/BreClU4uEmp//YYBtck+X8eghJ67ASlNz5GN7L8opMbI6GuE34MiljhKWggVnPSLWaPq017bQxOJhn8fjWmwbzN1hevCN+v7jfDYkRf2vEnV+oQGK1e1ljnBZNngvzXbTD0ZutQyN/WyZmBcqGusq3fqjdkuSGW/N2a0mlIrV5ri8q65gVv05Vhln5mMuQUN4KtSZqBrXlwa7Ggbr8UIQnhhvPhiCib1iFH3ywWlcBk7eznxcjt4yjdp1xRLvqaJt4ENydbb9qcA9NYOu8rQpi7ukEFxQ7hmP+MhJ3kWsz27fa5xQVTkBf5X7HiW90Nkk0mmZ4jWxiJHlqrBl1oqot2kQTmv5T+aaHZQl5ZdDrDEi87+wJhzOm50I3JvcHjJGEgY6iBlGlrSe1fsMfhigyJErsQODZ0alppAGgi7iG1NWVNPT1eT9UVlqzTBJ6L4QzhfI43smhwLUUyu6cHffmZfiv5cKPHCAkjyLivLDiXOrwwazmhYZ5f9VYtzAJIKZPYDj9k1/Qzxu/Qynzo7qI0J9u4y00QO8WdnXunt3uznVFFpmtjJn5gFQyEIMcsHkToahP+NTVebHI0T+8SvXvMWPa7SQQ0Ucs0pkB/HFuP014XQyas16zzpvu1+pG5B2cylSRDcwneK6rfoTVpT+PLUjpaibEbR/7ILVswqhH4JULrLrjYzybrh7F3MpT6X7t4zvJQ9zHYua/sZiVoDmsG
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199021)(46966006)(36840700001)(40470700004)(8936002)(8676002)(41300700001)(47076005)(40480700001)(2906002)(44832011)(966005)(5660300002)(83380400001)(40460700003)(54906003)(86362001)(16576012)(36756003)(478600001)(82310400005)(356005)(26005)(2616005)(81166007)(53546011)(31696002)(336012)(426003)(186003)(31686004)(82740400003)(316002)(4326008)(6916009)(36860700001)(70586007)(70206006)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 10:42:07.4939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac11610-ee8b-4346-ce91-08db40c2b908
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6442


On 19/04/2023 11:36, Oleg Nikitenko wrote:
> 	
> 
> 
> Hi Michal,
> 
> I corrected xen's command line.
> Now it is
> xen,xen-bootargs = "console=dtuart dtuart=serial0 dom0_mem=1600M dom0_max_vcpus=2 dom0_vcpus_pin bootscrub=0 vwfi=native sched=null timer_slop=0 way_size=65536 xen_colors=0-3 dom0_colors=4-7";
> 
> Unfortunately the result was the same.
> 
> (XEN)  - Dom0 mode: Relaxed
> (XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
> (XEN) P2M: 3 levels with order-1 root, VTCR 0x0000000080023558
> (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
> (XEN) Coloring general information
> (XEN) Way size: 64kB
> (XEN) Max. number of colors available: 16
> (XEN) Xen color(s): [ 0 ]
> (XEN) alternatives: Patching with alt table 00000000002cc690 -> 00000000002ccc0c
> (XEN) Color array allocation failed for dom0
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Error creating domain 0
> (XEN) ****************************************
> (XEN)
> (XEN) Reboot in five seconds...
> 
> I am going to find out how command line arguments passed and parsed.
Best would be to cross-check the cmdline you provided with the one Xen sees.
For that you would need to enable early printk, so that Xen will print the cmdline (+ the boot modules).
Is yocto the only workflow to build Xen in your case?

Early printk for zynqMP can be enabled through menuconfig:
Debugging Options->Early printk->Early printk with Cadence UART for Xilinx ZynqMP SOCs
This will automatically set early UART address to serial0 which is at 0xff000000.

I think using Yocto, you could either do something like:
bitbake xen -c menuconfig
or provide the necessary Kconfig options in a config file added to SCR_URI (most likely you already have
such file with CONFIG_COLORING=y as it is not enabled by default).

~Michal

> 
> Regards,
> Oleg
> 
> ср, 19 апр. 2023 г. в 11:25, Oleg Nikitenko <oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>:
> 
>     Hi Michal,
> 
>     You put my nose into the problem. Thank you.
>     I am going to use your point.
>     Let's see what happens.
> 
>     Regards,
>     Oleg
> 
> 
>     ср, 19 апр. 2023 г. в 10:37, Michal Orzel <michal.orzel@amd.com <mailto:michal.orzel@amd.com>>:
> 
>         Hi Oleg,
> 
>         On 19/04/2023 09:03, Oleg Nikitenko wrote:
>         >       
>         >
>         >
>         > Hello Stefano,
>         >
>         > Thanks for the clarification.
>         > My company uses yocto for image generation.
>         > What kind of information do you need to consult me in this case ?
>         >
>         > Maybe modules sizes/addresses which were mentioned by @Julien Grall <mailto:julien@xen.org <mailto:julien@xen.org>> ?
> 
>         Sorry for jumping into discussion, but FWICS the Xen command line you provided seems to be not the one
>         Xen booted with. The error you are observing most likely is due to dom0 colors configuration not being
>         specified (i.e. lack of dom0_colors=<> parameter). Although in the command line you provided, this parameter
>         is set, I strongly doubt that this is the actual command line in use.
> 
>         You wrote:
>         xen,xen-bootargs = "console=dtuart dtuart=serial0 dom0_mem=1600M dom0_max_vcpus=2 dom0_vcpus_pin bootscrub=0 vwfi=native sched=null timer_slop=0 way_szize=65536 xen_colors=0-3 dom0_colors=4-7";
> 
>         but:
>         1) way_szize has a typo
>         2) you specified 4 colors (0-3) for Xen, but the boot log says that Xen has only one:
>         (XEN) Xen color(s): [ 0 ]
> 
>         This makes me believe that no colors configuration actually end up in command line that Xen booted with.
>         Single color for Xen is a "default if not specified" and way size was probably calculated by asking HW.
> 
>         So I would suggest to first cross-check the command line in use.
> 
>         ~Michal
> 
> 
>         >
>         > Regards,
>         > Oleg
>         >
>         > вт, 18 апр. 2023 г. в 20:44, Stefano Stabellini <sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>:
>         >
>         >     On Tue, 18 Apr 2023, Oleg Nikitenko wrote:
>         >     > Hi Julien,
>         >     >
>         >     > >> This feature has not been merged in Xen upstream yet
>         >     >
>         >     > > would assume that upstream + the series on the ML [1] work
>         >     >
>         >     > Please clarify this point.
>         >     > Because the two thoughts are controversial.
>         >
>         >     Hi Oleg,
>         >
>         >     As Julien wrote, there is nothing controversial. As you are aware,
>         >     Xilinx maintains a separate Xen tree specific for Xilinx here:
>         >     https://github.com/xilinx/xen <https://github.com/xilinx/xen> <https://github.com/xilinx/xen <https://github.com/xilinx/xen>>
>         >
>         >     and the branch you are using (xlnx_rebase_4.16) comes from there.
>         >
>         >
>         >     Instead, the upstream Xen tree lives here:
>         >     https://xenbits.xen.org/gitweb/?p=xen.git;a=summary <https://xenbits.xen.org/gitweb/?p=xen.git;a=summary> <https://xenbits.xen.org/gitweb/?p=xen.git;a=summary <https://xenbits.xen.org/gitweb/?p=xen.git;a=summary>>
>         >
>         >
>         >     The Cache Coloring feature that you are trying to configure is present
>         >     in xlnx_rebase_4.16, but not yet present upstream (there is an
>         >     outstanding patch series to add cache coloring to Xen upstream but it
>         >     hasn't been merged yet.)
>         >
>         >
>         >     Anyway, if you are using xlnx_rebase_4.16 it doesn't matter too much for
>         >     you as you already have Cache Coloring as a feature there.
>         >
>         >
>         >     I take you are using ImageBuilder to generate the boot configuration? If
>         >     so, please post the ImageBuilder config file that you are using.
>         >
>         >     But from the boot message, it looks like the colors configuration for
>         >     Dom0 is incorrect.
>         >
> 

