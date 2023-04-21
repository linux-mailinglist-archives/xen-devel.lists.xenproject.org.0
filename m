Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF816EA5A7
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 10:17:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524513.815513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pplwc-0001Uf-Cv; Fri, 21 Apr 2023 08:16:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524513.815513; Fri, 21 Apr 2023 08:16:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pplwc-0001SW-A4; Fri, 21 Apr 2023 08:16:38 +0000
Received: by outflank-mailman (input) for mailman id 524513;
 Fri, 21 Apr 2023 08:16:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v1kD=AM=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pplwa-0001SQ-QF
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 08:16:36 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d408a436-e01c-11ed-b220-6b7b168915f2;
 Fri, 21 Apr 2023 10:16:35 +0200 (CEST)
Received: from BL0PR02CA0031.namprd02.prod.outlook.com (2603:10b6:207:3c::44)
 by MN0PR12MB6174.namprd12.prod.outlook.com (2603:10b6:208:3c5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 08:16:31 +0000
Received: from BL02EPF000108E8.namprd05.prod.outlook.com
 (2603:10b6:207:3c:cafe::cf) by BL0PR02CA0031.outlook.office365.com
 (2603:10b6:207:3c::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.27 via Frontend
 Transport; Fri, 21 Apr 2023 08:16:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF000108E8.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.16 via Frontend Transport; Fri, 21 Apr 2023 08:16:30 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 21 Apr
 2023 03:16:29 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 21 Apr
 2023 03:16:29 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 21 Apr 2023 03:16:28 -0500
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
X-Inumbo-ID: d408a436-e01c-11ed-b220-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OssDkbCruEAOQJX/fbrtpZkqT9jK3D3JvrrKTwHknMjv1eqWZj6WWIrEkIT4zhjOU96S65UfiSHjVIJDJEXA42ClnCSbEnZ5WCtfY1JG0Qr5bDA8VfHRx7cBviVt36xx6ROXvTLhI2U9L9JdK6I7wv4X1D9VYRUH8O9WyAGB/Vsm5DVOmgZUePJApSKKtPbsywTuurx7O/o82Ym+t3KhyYo95pXhAfwW6r38qyXL8DgFCF117yNKdJb7vR8zE6wzO21EzlqvD37xSmtrxDXw3f6lhqzjwuiwyX4pHGPBYbqrOgSUDt43apDaFIMvOi8V9ok8hKoEf+Zygjt4ov7xfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcADbVQFVluqgFlVeU+YPDTVVdfuGOccSVtbWhIqDA4=;
 b=gUTcCfv708vorHTzltvHjbmv44Sgu5Mfz6RiufF+EC7lqjnUPNYMADhyTYfTcOiTHyBjnhIQkijBZJoTAk5+4vWflsADDQQfkAkpbgg0OoAVsyL2siSG5Gb4HZ5wjKCfbbsukQwCJg9l0G2kEa4zLm4BabLl2zUpxs5weoMsAPPbsnVYGro25t4ItHlQ2wFhVcFnSuScrYf4qrTqRVyUx6SLxmUf2aBr571wNp7irrnnJ+0mjIci2nnjHyzJj35xZjEVCmLrBA1YT5nnwQ/j6Fote896hq/QROEn/gKoifhVHI0Kz5XoLE3/o3R6Jof9d43Af+p5dxpOpKdHn7+40A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcADbVQFVluqgFlVeU+YPDTVVdfuGOccSVtbWhIqDA4=;
 b=bWOFSj94SgMbIoAfnoGUNfXb8u7T8+G+pQai3Im0cbgWS2dE9o/LhIP4id79jW5t8ND05IY7oxnxspd/Jw5op4eyk105xRbt+KTb3DHgpLN2LG9o/dtS+9BwRAh54j9OF8D1yY+6X0XCM1Yr1C1fmCxJwU8N2nDNAxnzz9AoKzc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <cc6380b9-b452-6492-75ab-fc0825b223d3@amd.com>
Date: Fri, 21 Apr 2023 10:16:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: xen cache colors in ARM
Content-Language: en-US
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
 <58cae772-dd3b-31f4-9849-9c2597f6eae6@amd.com>
 <CA+SAi2vU0i9trrdgCusB0WYJmYLqjXRk9qSGALjMbKYvmPGcvw@mail.gmail.com>
 <CA+SAi2tc_3r3SAXVOmdbDJXvppaXkSdMH0iv-fG1zUwG3Ub_hQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2304191304570.15580@ubuntu-linux-20-04-desktop>
 <CA+SAi2tEbV0Y=p=NhT_8H1SeBzqXxUTS5R9pZu3_UYn5zU952A@mail.gmail.com>
 <CA+SAi2s7jUf4ZB6WCDqEbG5jV1A5XV=bJDiGOseQBBG+Xt9_vQ@mail.gmail.com>
 <CA+SAi2uPnpwNowMWPdcbSkF=iNe9Xr5LQMtmtF-G7dKNswog_g@mail.gmail.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <CA+SAi2uPnpwNowMWPdcbSkF=iNe9Xr5LQMtmtF-G7dKNswog_g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108E8:EE_|MN0PR12MB6174:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d6c9ba6-9502-498a-df56-08db4240b5f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WTpfNzyrriM2Op4yJD3hp8ucwN6vRJMABgwkylMv73JRVT1LRzBc3lnlhQT+8f6tssNQKmaFM2ltFEsBpI1SUCqmyDlQ+VdaqnpxUBFEyDtCfnxsdHrTbIAQfKcwlUuQwTAzGIVw5KTalpyjddEp+NVmCtxvBQ2OsltO5h5a1kS6QTgQKhqkW9p8VjXFHGmLQzD8tZqd90fFJ1P1mm2zr+qp9sxjXS8cZOQEX3s4VnY65bUa52DxbK4UpugPlUCnjbVWqiyWTMc+808WYue76KIXKibwq4Ufwu4fXZEDHk8sQip1eO4KJ1AUh9HcMkPyitNUh3gUqGKXZpq6rCuzwhnQMje7cO8sXOs+CDE+UFM28dXFK8qYjAj3dqH1+UpiLeeT39Tt6tYTE851HbYkMFBFVj/dp4wf9ryf1rgz7mHQSqGIT64ruzZsQAfef7Ykc8lE2sF+Q6cO+SPygLE2HcfU3kBbO8E6iqr0a/ihbJUSvAsYxwwJcNk4ZeWOkLonoroJVxt8zkT+sRL2gsUQT0vo+rpzKcjNoejUCtXU6RRfGBq/uHGrLKZn88WIquhcWEzh11IHDYLJ4QQSup7rcArYypdaNrEgD6lbHQSRf8ZXJ63X2kz2Sd1MkZP16mlhsSpW8fmZhCVl93zv3UoksKSNXit3HNDiYAeihS0ALN0QDwG2mymeaCUeFWeGgmxF75b1VrI2wVUet6lJez8mf35lf9EUhgZt70rjIEPKgVd1F26CSZ5AZrJfcoW3cfQ9
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199021)(36840700001)(46966006)(40470700004)(82310400005)(36756003)(40480700001)(40460700003)(478600001)(54906003)(110136005)(356005)(41300700001)(81166007)(8936002)(8676002)(16576012)(70586007)(316002)(70206006)(4326008)(82740400003)(36860700001)(2616005)(47076005)(83380400001)(336012)(966005)(426003)(31686004)(186003)(26005)(53546011)(86362001)(44832011)(31696002)(2906002)(5660300002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 08:16:30.0849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d6c9ba6-9502-498a-df56-08db4240b5f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF000108E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6174


On 21/04/2023 10:04, Oleg Nikitenko wrote:
> 	
> 
> 
> Hello Michal,
> 
> Yes, I use yocto.
> 
> Yesterday all day long I tried to follow your suggestions.
> I faced a problem.
> Manually in the xen config build file I pasted the strings:
In the .config file or in some Yocto file (listing additional Kconfig options) added to SRC_URI?
You shouldn't really modify .config file but if you do, you should execute "make olddefconfig" afterwards.

> 
> CONFIG_EARLY_PRINTK
> CONFIG_EARLY_PRINTK_ZYNQMP
> CONFIG_EARLY_UART_CHOICE_CADENCE
I hope you added =y to them.

Anyway, you have at least the following solutions:
1) Run bitbake xen -c menuconfig to properly set early printk
2) Find out how you enable other Kconfig options in your project (e.g. CONFIG_COLORING=y that is not enabled by default)
3) Append the following to "xen/arch/arm/configs/arm64_defconfig":
CONFIG_EARLY_PRINTK_ZYNQMP=y

~Michal

> 
> Host hangs in build time. 
> Maybe I did not set something in the config build file ?
> 
> Regards,
> Oleg
> 
> чт, 20 апр. 2023 г. в 11:57, Oleg Nikitenko <oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>:
> 
>     Thanks Michal,
> 
>     You gave me an idea.
>     I am going to try it today.
> 
>     Regards,
>     O.
> 
>     чт, 20 апр. 2023 г. в 11:56, Oleg Nikitenko <oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>:
> 
>         Thanks Stefano.
> 
>         I am going to do it today.
> 
>         Regards,
>         O.
> 
>         ср, 19 апр. 2023 г. в 23:05, Stefano Stabellini <sstabellini@kernel.org <mailto:sstabellini@kernel.org>>:
> 
>             On Wed, 19 Apr 2023, Oleg Nikitenko wrote:
>             > Hi Michal,
>             >
>             > I corrected xen's command line.
>             > Now it is
>             > xen,xen-bootargs = "console=dtuart dtuart=serial0 dom0_mem=1600M dom0_max_vcpus=2 dom0_vcpus_pin bootscrub=0 vwfi=native sched=null
>             > timer_slop=0 way_size=65536 xen_colors=0-3 dom0_colors=4-7";
> 
>             4 colors is way too many for xen, just do xen_colors=0-0. There is no
>             advantage in using more than 1 color for Xen.
> 
>             4 colors is too few for dom0, if you are giving 1600M of memory to Dom0.
>             Each color is 256M. For 1600M you should give at least 7 colors. Try:
> 
>             xen_colors=0-0 dom0_colors=1-8
> 
> 
> 
>             > Unfortunately the result was the same.
>             >
>             > (XEN)  - Dom0 mode: Relaxed
>             > (XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
>             > (XEN) P2M: 3 levels with order-1 root, VTCR 0x0000000080023558
>             > (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
>             > (XEN) Coloring general information
>             > (XEN) Way size: 64kB
>             > (XEN) Max. number of colors available: 16
>             > (XEN) Xen color(s): [ 0 ]
>             > (XEN) alternatives: Patching with alt table 00000000002cc690 -> 00000000002ccc0c
>             > (XEN) Color array allocation failed for dom0
>             > (XEN)
>             > (XEN) ****************************************
>             > (XEN) Panic on CPU 0:
>             > (XEN) Error creating domain 0
>             > (XEN) ****************************************
>             > (XEN)
>             > (XEN) Reboot in five seconds...
>             >
>             > I am going to find out how command line arguments passed and parsed.
>             >
>             > Regards,
>             > Oleg
>             >
>             > ср, 19 апр. 2023 г. в 11:25, Oleg Nikitenko <oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>:
>             >       Hi Michal,
>             >
>             > You put my nose into the problem. Thank you.
>             > I am going to use your point.
>             > Let's see what happens.
>             >
>             > Regards,
>             > Oleg
>             >
>             >
>             > ср, 19 апр. 2023 г. в 10:37, Michal Orzel <michal.orzel@amd.com <mailto:michal.orzel@amd.com>>:
>             >       Hi Oleg,
>             >
>             >       On 19/04/2023 09:03, Oleg Nikitenko wrote:
>             >       >       
>             >       >
>             >       >
>             >       > Hello Stefano,
>             >       >
>             >       > Thanks for the clarification.
>             >       > My company uses yocto for image generation.
>             >       > What kind of information do you need to consult me in this case ?
>             >       >
>             >       > Maybe modules sizes/addresses which were mentioned by @Julien Grall <mailto:julien@xen.org <mailto:julien@xen.org>> ?
>             >
>             >       Sorry for jumping into discussion, but FWICS the Xen command line you provided seems to be not the one
>             >       Xen booted with. The error you are observing most likely is due to dom0 colors configuration not being
>             >       specified (i.e. lack of dom0_colors=<> parameter). Although in the command line you provided, this parameter
>             >       is set, I strongly doubt that this is the actual command line in use.
>             >
>             >       You wrote:
>             >       xen,xen-bootargs = "console=dtuart dtuart=serial0 dom0_mem=1600M dom0_max_vcpus=2 dom0_vcpus_pin bootscrub=0 vwfi=native
>             >       sched=null timer_slop=0 way_szize=65536 xen_colors=0-3 dom0_colors=4-7";
>             >
>             >       but:
>             >       1) way_szize has a typo
>             >       2) you specified 4 colors (0-3) for Xen, but the boot log says that Xen has only one:
>             >       (XEN) Xen color(s): [ 0 ]
>             >
>             >       This makes me believe that no colors configuration actually end up in command line that Xen booted with.
>             >       Single color for Xen is a "default if not specified" and way size was probably calculated by asking HW.
>             >
>             >       So I would suggest to first cross-check the command line in use.
>             >
>             >       ~Michal
>             >
>             >
>             >       >
>             >       > Regards,
>             >       > Oleg
>             >       >
>             >       > вт, 18 апр. 2023 г. в 20:44, Stefano Stabellini <sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>:
>             >       >
>             >       >     On Tue, 18 Apr 2023, Oleg Nikitenko wrote:
>             >       >     > Hi Julien,
>             >       >     >
>             >       >     > >> This feature has not been merged in Xen upstream yet
>             >       >     >
>             >       >     > > would assume that upstream + the series on the ML [1] work
>             >       >     >
>             >       >     > Please clarify this point.
>             >       >     > Because the two thoughts are controversial.
>             >       >
>             >       >     Hi Oleg,
>             >       >
>             >       >     As Julien wrote, there is nothing controversial. As you are aware,
>             >       >     Xilinx maintains a separate Xen tree specific for Xilinx here:
>             >       >     https://github.com/xilinx/xen <https://github.com/xilinx/xen> <https://github.com/xilinx/xen <https://github.com/xilinx/xen>>
>             >       >
>             >       >     and the branch you are using (xlnx_rebase_4.16) comes from there.
>             >       >
>             >       >
>             >       >     Instead, the upstream Xen tree lives here:
>             >       >     https://xenbits.xen.org/gitweb/?p=xen.git;a=summary <https://xenbits.xen.org/gitweb/?p=xen.git;a=summary> <https://xenbits.xen.org/gitweb/?p=xen.git;a=summary <https://xenbits.xen.org/gitweb/?p=xen.git;a=summary>>
>             >       >
>             >       >
>             >       >     The Cache Coloring feature that you are trying to configure is present
>             >       >     in xlnx_rebase_4.16, but not yet present upstream (there is an
>             >       >     outstanding patch series to add cache coloring to Xen upstream but it
>             >       >     hasn't been merged yet.)
>             >       >
>             >       >
>             >       >     Anyway, if you are using xlnx_rebase_4.16 it doesn't matter too much for
>             >       >     you as you already have Cache Coloring as a feature there.
>             >       >
>             >       >
>             >       >     I take you are using ImageBuilder to generate the boot configuration? If
>             >       >     so, please post the ImageBuilder config file that you are using.
>             >       >
>             >       >     But from the boot message, it looks like the colors configuration for
>             >       >     Dom0 is incorrect.
>             >       >
>             >
>             >
>             > 
> 

