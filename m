Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2715B63EB52
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 09:42:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450264.707532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0f98-0006Xq-Tf; Thu, 01 Dec 2022 08:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450264.707532; Thu, 01 Dec 2022 08:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0f98-0006Vj-Q6; Thu, 01 Dec 2022 08:42:18 +0000
Received: by outflank-mailman (input) for mailman id 450264;
 Thu, 01 Dec 2022 08:42:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=66xT=37=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p0f97-0006OK-68
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 08:42:17 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060e.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e1406a9-7154-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 09:42:16 +0100 (CET)
Received: from DS7PR03CA0312.namprd03.prod.outlook.com (2603:10b6:8:2b::21) by
 MN0PR12MB6271.namprd12.prod.outlook.com (2603:10b6:208:3c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 08:42:12 +0000
Received: from DM6NAM11FT113.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2b:cafe::67) by DS7PR03CA0312.outlook.office365.com
 (2603:10b6:8:2b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8 via Frontend
 Transport; Thu, 1 Dec 2022 08:42:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT113.mail.protection.outlook.com (10.13.173.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.22 via Frontend Transport; Thu, 1 Dec 2022 08:42:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 02:42:11 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 02:42:11 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Dec 2022 02:42:10 -0600
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
X-Inumbo-ID: 0e1406a9-7154-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLpixjMYYcekPVi/pB91IHUpAho1LAXCHqJlh0Wa5EonVjMpyENeDS625CKUFywcxJYJwLIsjP2RIXiCYwTKa4QRJpEV37sJBtYkgmUAah6GV9ENoO9IMrZhYRLKSbEsyfp63E1stZ0YfcrcBDjZv0J1TGhgiZwLqsSVHQpw+/q5P4OmIp+cGY3f9NG87orPhdN6XeVB0QhQq1MJyhFFa8sNnvL7BZ/+cr4vfCpFjqyCkoHTJ7SHV+v59NPVmce7VVcWxAWhac4w0v4DwQBR/G7xczgMKJAlUwO13yQ3xU14llzp1SX/FoNiq9xk/dgfkn+8ELnucAaAN4LNmNNqNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yT8flKgaG3QhFPoIxIxLtRnyqdlpVvtAFPjoOsbnYAk=;
 b=N1Dza4v7bgSyP9XCSkEqwxJnQfHrppCgQ5LAavGjqCxIDYaU2cRQb2VrkZSUitQGTfYvlS0juM0Wp5jErcp2Z+KGpL+7JQxgJzReKEyeNpDJ6QecJnchg8OyPnTZVOAOivLo28ylODM1fU/hMw+ejEFdwwho4+BZJ7Izw3D6PXF48EUIikLkKK/1FRb+x8ZKQygkBLa/yQOYsuGkwkLkcYMTdlFYxkcvZKxrmiaUTCQlg69znSiOrnyDVzXrhINVLYeZo87VoH+GN3f+3b8Ha6MTBEz0OPxzyMsRFWoonOwvHtuSAtwRI2Lz+k1SivP8YrwI1+LwwesKIrLvzQtanQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yT8flKgaG3QhFPoIxIxLtRnyqdlpVvtAFPjoOsbnYAk=;
 b=M858RgTuHtoST+ZfRqlpzN87dKlOdDMa4JPAg6idKkmINGvcdNCRbXQm6pZlixm0Nl1B+zvt7I6ZMJbQh/N7UHHdrgBCmqZLhRYJdAWANecufMm9BwZ8sRcfK0EB/uaMZqB31lRCtUVaHrP1aw7CWFtd619c35RItijxT27Zz5U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f51dbcc1-e7b3-c5c9-f603-73c9013d8b2f@amd.com>
Date: Thu, 1 Dec 2022 09:42:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 1/2] xen/arm: vpl011: emulate non-SBSA registers as
 WI/RAZ
To: Jiamei Xie <jiamei.xie@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221201080400.1842558-1-jiamei.xie@arm.com>
 <20221201080400.1842558-2-jiamei.xie@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221201080400.1842558-2-jiamei.xie@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT113:EE_|MN0PR12MB6271:EE_
X-MS-Office365-Filtering-Correlation-Id: 192bb2d1-dd09-486e-5d68-08dad377f0e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sQ6nsF59pFvPsCYVHn7VKiUVMY4Ecl26lFl/0LJb4bhcG8Bisbybh6dj1NDVHQ/2FyAUlmlXvftGCldZQ+W4Zob+/OwdvXYvIatEy4cO4JU2JlV/AT/O69rX002WOZHm7+GOPR2AKPecktfdDVx+/yx5KOchuNHeHZKxjtZnNlDPentatQyqF0MoyV8QkCdVvo0Zv6h2wyG+OXs2iXfJ8Bn0U+NHMZueXPEkk5GahcHzyA0dBlESRkHinuZ6WfpVZtsorX+HeLifJYGEtOWEHha/fcX0DQ5HeNigv3RQmGK75dgiRNOU00oyvsx+97AiSgwSBM0Ii8uGgxN+P+zQJLOdJ6TB3iDENvuXbAVU5fGaaHzas/E9i4AtK1COlaWaIMSW11yQjk7hJT38djbivE7QSJmqCtMMgQ5pU2vSvWHTjWKuRGN8HZ3KZuA/GzADkQ/How1oDywaM2XXx3lic8IDGZOw2FR+PIJrgyP7Z0inxjw6moDY4LC3d8t9b1lfFWtSyMrV5ztNhCLphn9mHLvnkDWRHS3ChEc94SwhB0XybSicq4nFJdVvvepeTXCABeWU/gZ4sxLO52DyXKVPOzb2N3PQCEY/Jajes6EURva92ukcCi/2q3q01BKqXnEA53+7fmPY3HHbv9hHMIv4ow9fNRXd2A1hmG/0xNNF0EMH/Jy5QBZcjVKbGwV21RUZG0FQLBv4ySzPnzvxYeUyMsdW/6kCYlS/b+90HMXaH3xrGpD5XlLS8Qqc7ypGSWD9YOcndZMNJd6YZ4HL2CMHqm8ijGzdp3XC6tsjatU2siQp/SQnS40QQrqun4rERop+jlOC0iOtu+BT8UuxiE58cg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(83380400001)(82310400005)(36860700001)(81166007)(86362001)(31696002)(2906002)(44832011)(356005)(41300700001)(82740400003)(40460700003)(53546011)(5660300002)(4326008)(26005)(8936002)(40480700001)(336012)(186003)(966005)(316002)(426003)(16576012)(54906003)(110136005)(478600001)(70206006)(8676002)(47076005)(2616005)(36756003)(31686004)(70586007)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 08:42:12.1894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 192bb2d1-dd09-486e-5d68-08dad377f0e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT113.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6271

Hi Jiamei,

On 01/12/2022 09:03, Jiamei Xie wrote:
> 
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
> As discussed in [2], this commit makes the access to non-SBSA registers
> RAZ/WI as an improvement.
> 
> [1] https://developer.arm.com/documentation/den0094/c/?lang=en
> [2] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2211161552420.4020@ubuntu-linux-20-04-desktop/
> 
> Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
The patch looks good, so:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

However, because your series is about vpl011 refinement, I spotted two things
(this does not necessarily needs to be done by you).

> ---
> v3 -> v4
> - remove the size check for unknown registers in the SBSA UART
> - remove lock in read_as_zero
> v2 -> v3
> - emulate non-SBSA registers as WI/RAZ in default case
> - update commit message
> v1 -> v2
> - print a message using XENLOG_G_DEBUG when it's write-ignore
> ---
>  xen/arch/arm/vpl011.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> index 43522d48fd..f4a5621fab 100644
> --- a/xen/arch/arm/vpl011.c
> +++ b/xen/arch/arm/vpl011.c
> @@ -414,11 +414,15 @@ static int vpl011_mmio_read(struct vcpu *v,
>      default:
>          gprintk(XENLOG_ERR, "vpl011: unhandled read r%d offset %#08x\n",
This is an emulated UART MMIO handler, so instead XENLOG_ERR, we should use XENLOG_G_ERR
to indicate gust error and not Xen error.

>                  dabt.reg, vpl011_reg);
> -        return 0;
> +        goto read_as_zero;
>      }
> 
>      return 1;
This return statement is unreachable.

> 
> +read_as_zero:
> +    *r = 0;
> +    return 1;
> +
>  bad_width:
>      gprintk(XENLOG_ERR, "vpl011: bad read width %d r%d offset %#08x\n",
>              dabt.size, dabt.reg, vpl011_reg);
> @@ -486,7 +490,7 @@ static int vpl011_mmio_write(struct vcpu *v,
>      default:
>          gprintk(XENLOG_ERR, "vpl011: unhandled write r%d offset %#08x\n",
>                  dabt.reg, vpl011_reg);
> -        return 0;
> +        goto write_ignore;
>      }
> 
>  write_ignore:
> --
> 2.25.1
> 
> 
~Michal


