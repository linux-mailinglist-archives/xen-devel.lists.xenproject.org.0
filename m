Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A75562EE9E
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 08:47:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445471.700652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovw62-0004rM-QT; Fri, 18 Nov 2022 07:47:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445471.700652; Fri, 18 Nov 2022 07:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovw62-0004oE-NP; Fri, 18 Nov 2022 07:47:34 +0000
Received: by outflank-mailman (input) for mailman id 445471;
 Fri, 18 Nov 2022 07:47:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jn0n=3S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ovw61-0004o8-IU
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 07:47:33 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20606.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4153ba51-6715-11ed-91b6-6bf2151ebd3b;
 Fri, 18 Nov 2022 08:47:32 +0100 (CET)
Received: from DM6PR07CA0101.namprd07.prod.outlook.com (2603:10b6:5:337::34)
 by CY5PR12MB6407.namprd12.prod.outlook.com (2603:10b6:930:3c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Fri, 18 Nov
 2022 07:47:28 +0000
Received: from DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:337:cafe::75) by DM6PR07CA0101.outlook.office365.com
 (2603:10b6:5:337::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Fri, 18 Nov 2022 07:47:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT040.mail.protection.outlook.com (10.13.173.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 07:47:28 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 01:47:23 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 01:47:12 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 18 Nov 2022 01:47:11 -0600
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
X-Inumbo-ID: 4153ba51-6715-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtOpJValP4sB6n2WAsPOKbpVDuknkScdWzIwuZ0WYkD5uml0ED0fc3du6NV068lZLV0MpUlqGPt99/ikIzioAiQOw3nDRPWXvKMxqI+W18zlZjcGcwSvhhfhO/evKF2/duEbn2tZjQT4EaxGIjb/prT6G9Wd4Jut9UWQo4xTiCX8kSQ9ryR1qUu9m5jAyq7LexU+qakZ37p9UQaavVAl7Z0C6nh3/6mc64T0C+a+3cXXdtEw4IuSndv0jbsltYA13N2LiOs15GItvE6cffyKnJnF770PZ9yT0FHLXD8/9oRcvuaWQuabudn1S6SWxS3juQkYEe419OJBW8SK2b8gQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpnl5HQqsYsQeVyDXJirh+n0BeNPRVw8yA0yyvu2868=;
 b=a8A/muahaWzIPY4FlWlwPH7sZPH1wkIKouGqOC3OgcoIeeOnFAW+mKU9c7oHuOnT8g6CRDM3tT5/uPRjlVnwCCbsFrTPvAFwxns2iUJmCW7T4Kiaso+rAX+I+RP1XDqtc2DLW6YkFCQlQttGOrxsGEGbMWPEDagadaNciMuKUyZdgcf7N4mgZ06kn2cbfE4EbM3SHcZ31A6BtKoU1Or2RrekxEbVARf51yWhFAbPXeVNeANOcDfNSjLJ4i9kzpmjyQDQdzB8yB98Hhsqae5+MONVg667E/I7D/JGdN/05Gd3IC7ZdRGCaO0y2YglG/MrCGyW9G7qWiMYL8s7pO25sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpnl5HQqsYsQeVyDXJirh+n0BeNPRVw8yA0yyvu2868=;
 b=c4lsy8i26Ob11gC2tLaLnwFfolOWiVsr4/tjwUXsFUhxDaGXoJddIPMXe/K6LrJlqfgXnQEt8c1CQqhJQHIfWSwVUF4shYvxb+d2Y1j/cWp/Q3VHzOrv+WXjjaIpXziVnaKWB/tZiou3PTtgbVH4gD69U9RK7A1+Y3xVamU0rRI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <647f254d-0af6-ea2c-f15e-bcab5a611a98@amd.com>
Date: Fri, 18 Nov 2022 08:47:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re:
Content-Language: en-US
To: Jiamei Xie <jiamei.xie@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20221118020013.125987-1-jiamei.xie@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221118020013.125987-1-jiamei.xie@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT040:EE_|CY5PR12MB6407:EE_
X-MS-Office365-Filtering-Correlation-Id: af107f6e-cfc6-4828-8d7a-08dac939245f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hx5DJWifNtFsLgYfl5fN+r2XIjg4YUwdStiHc5niu7GErfmmMwseMVGFOnHgqP58JxcpGTrQj+3gdEMDaSVw1EI83SySeqqTXBZDqQOllIs4Jen3IR5gXbc10xoshf4HE8m14fWDj50bmXNtEGi1Rr3l/18+lOmIHh++xU91SLNNT3cAApxxdRyrQ7c/Y4mLmTMCfRSdr0DCafRuoCKeZkKtNABVxUPHu6LkF3x8plpM2TsHDf5TIjMgE0EHoqpqmcf0mG2iS08Uh1W2R9gjQIMpBL5ne8jCvVL6LDHWJJZY8EtJ7tz44hNwKG7tozoEQLc0e3TrgyErAv7XE6kwb/sFpUOxZxI/7ltu0c0Fb3ZTdeyr+UfLR37ebsmOXE3o/YtXpUmrr6dUskbxAXpoIbbkZQ4RL2IXu7H9iuNZVrrPZOoxK7Ekdldd2mAQzxd52dx+P3Yx/MQoCQ1KxVfPV4/okeG8oZTbkwlzdEL941QuIl9+PEPig0FjfU5Q8HEslOPiwrAXeM9CQQPp4gOKEitKmF8Fzv6tiXEc3aUoFzLpfR9rnSy+/YKygIO+biMuNN4rpNZnsPYbwze3/ouWp5ANqaL5lt5RIHT6CRttPa/kuJrhise9ZEOUTxF9Y2akM37/ImEcCebsoTw2ewLoG3J0kFQl7B1yI7gteSrNMelwF/OJjdprhPIocf6JmvBFCckZ5EtDN20/scmyQQsWiVNGnn2Tzv1kWpe8OaalcCzsHanTwDGalN+DSP/goAC3vZK8l9OOlSnOSFPo5gn5+/m+u24o0h+Skfsf6MyNvstokfb3qNvy0YtQA6Yx6Gp10QDn70DrRorXOuQlh0gHdA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199015)(36840700001)(40470700004)(46966006)(31686004)(40460700003)(36756003)(82310400005)(31696002)(86362001)(3480700007)(81166007)(82740400003)(40480700001)(336012)(36860700001)(356005)(53546011)(47076005)(426003)(83380400001)(186003)(2616005)(26005)(316002)(8676002)(110136005)(478600001)(2906002)(41300700001)(7116003)(16576012)(54906003)(5660300002)(70586007)(966005)(4326008)(44832011)(8936002)(70206006)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 07:47:28.6126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af107f6e-cfc6-4828-8d7a-08dac939245f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6407

Hi Jimaei,

On 18/11/2022 03:00, Jiamei Xie wrote:
> 
> 
> Date: Thu, 17 Nov 2022 11:07:12 +0800
> Subject: [PATCH] xen/arm: vpl011: Make access to DMACR write-ignore
> 
> When the guest kernel enables DMA engine with "CONFIG_DMA_ENGINE=y",
> Linux SBSA PL011 driver will access PL011 DMACR register in some
> functions. As chapter "B Generic UART" in "ARM Server Base System
> Architecture"[1] documentation describes, SBSA UART doesn't support
> DMA. In current code, when the kernel tries to access DMACR register,
> Xen will inject a data abort:
> Unhandled fault at 0xffffffc00944d048
> Mem abort info:
>   ESR = 0x96000000
>   EC = 0x25: DABT (current EL), IL = 32 bits
>   SET = 0, FnV = 0
>   EA = 0, S1PTW = 0
>   FSC = 0x00: ttbr address size fault
> Data abort info:
>   ISV = 0, ISS = 0x00000000
>   CM = 0, WnR = 0
> swapper pgtable: 4k pages, 39-bit VAs, pgdp=0000000020e2e000
> [ffffffc00944d048] pgd=100000003ffff803, p4d=100000003ffff803, pud=100000003ffff803, pmd=100000003fffa803, pte=006800009c090f13
> Internal error: ttbr address size fault: 96000000 [#1] PREEMPT SMP
> ...
> Call trace:
>  pl011_stop_rx+0x70/0x80
>  tty_port_shutdown+0x7c/0xb4
>  tty_port_close+0x60/0xcc
>  uart_close+0x34/0x8c
>  tty_release+0x144/0x4c0
>  __fput+0x78/0x220
>  ____fput+0x1c/0x30
>  task_work_run+0x88/0xc0
>  do_notify_resume+0x8d0/0x123c
>  el0_svc+0xa8/0xc0
>  el0t_64_sync_handler+0xa4/0x130
>  el0t_64_sync+0x1a0/0x1a4
> Code: b9000083 b901f001 794038a0 8b000042 (b9000041)
> ---[ end trace 83dd93df15c3216f ]---
> note: bootlogd[132] exited with preempt_count 1
> /etc/rcS.d/S07bootlogd: line 47: 132 Segmentation fault start-stop-daemon
> 
> As discussed in [2], this commit makes the access to DMACR register
> write-ignore as an improvement.
As discussed earlier, if we decide to improve vpl011 (for now only Stefano shared his opinion),
then we need to mark *all* the PL011 registers that are not part of SBSA ar RAZ/WI. So handling
DMACR and only for writes is not beneficial (it is only fixing current Linux issue, but what we
really want is to improve the code in general).

> 
> [1] https://developer.arm.com/documentation/den0094/c/?lang=en
> [2] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2211161552420.4020@ubuntu-linux-20-04-desktop/
> 
> Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
> ---
>  xen/arch/arm/vpl011.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> index 43522d48fd..80d00b3052 100644
> --- a/xen/arch/arm/vpl011.c
> +++ b/xen/arch/arm/vpl011.c
> @@ -463,6 +463,7 @@ static int vpl011_mmio_write(struct vcpu *v,
>      case FR:
>      case RIS:
>      case MIS:
> +    case DMACR:
>          goto write_ignore;
> 
>      case IMSC:
> --
> 2.25.1
> 
> 

~Michal

