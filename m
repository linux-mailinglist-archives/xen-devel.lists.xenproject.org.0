Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C8F6224C4
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 08:40:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440684.694805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osfgh-00070F-2k; Wed, 09 Nov 2022 07:39:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440684.694805; Wed, 09 Nov 2022 07:39:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osfgg-0006wv-UX; Wed, 09 Nov 2022 07:39:54 +0000
Received: by outflank-mailman (input) for mailman id 440684;
 Wed, 09 Nov 2022 07:39:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mo2k=3J=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1osfge-0006wT-UR
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 07:39:53 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0e2ef83-6001-11ed-8fd1-01056ac49cbb;
 Wed, 09 Nov 2022 08:39:51 +0100 (CET)
Received: from BN0PR02CA0014.namprd02.prod.outlook.com (2603:10b6:408:e4::19)
 by BY5PR12MB4274.namprd12.prod.outlook.com (2603:10b6:a03:206::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Wed, 9 Nov
 2022 07:39:47 +0000
Received: from BN8NAM11FT107.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::57) by BN0PR02CA0014.outlook.office365.com
 (2603:10b6:408:e4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Wed, 9 Nov 2022 07:39:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT107.mail.protection.outlook.com (10.13.176.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Wed, 9 Nov 2022 07:39:47 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 9 Nov
 2022 01:39:47 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 8 Nov
 2022 23:39:46 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Wed, 9 Nov 2022 01:39:45 -0600
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
X-Inumbo-ID: b0e2ef83-6001-11ed-8fd1-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sk95a+d+CpsoQEzANfrPYdO8mLJjANRvBxdrOFb0aVWy+E+J/DQmBuGnHPL4Mt6gIHSDv6ibJQ74WF6I+2nKpCF02EYBIUf+mCCayqkmOfRoik9G9896Vu4YkhI5CPHvSUe8BqzZwwvOA1WRi+pDxtbSRJ7nApIhfSBS15esIyRv0c9BDb8Kz9pwL91nt5GO8T7/jTYs47OaWo4PgpJf6LPWWK54sc/ZfuyQO3V3eBUGPLmY6jXr0VpVbFhKrn5PWXbq6w0UyDqGosCqMNyQSVFdtzHyEzIyFbWRQE06GU5GeXOY62hVeaBeuHGrlHdQxYlcttEtzE5X2z8nG9SphQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dQMi26gSvPrEZIdgRLM3IVcrVDaYptKP3TpGSL2Nzg=;
 b=bAaIDsy44mbIoOqy7Txc9dLcaHDNEw6NiL1qsTt56NhGyw6Jb9AszLyQ/MehzMl+0kCJCPfPoYGWTb7eKFs9230ajCgK6Okikf8K0pK1EkqwsaH+f1+Z+GjNDWqF9tV4Nu5ZB+JBEtzrgfBM9wWH10G/Oh61a9Evuzg+VglvRjUYOEUOp5oHd7LYFMt+yhe3VYZegGgJR6hpYYwkXoNPal+WYiJUdQRpDbcREaz+pNTar7z+280Wa5Egk3fTd1AUarpAsOHMPazXTLrBGVFWig9y3gRGLdYFixsxLbf0+pLLIguFkVVV8C3A32wf5C2Fttwrp6xVnhEbhR2k8vWHXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dQMi26gSvPrEZIdgRLM3IVcrVDaYptKP3TpGSL2Nzg=;
 b=un2UQM3qQKm7KvrN45XMHk2woy5RFDDSUl0hNn6lIKTJdmXqDQP93JsyjyvZsjipIswjOFGmCDW8BeafQw6ErvJtCKjt5uSIJrv8aIbwwLuKJIiQ9xE5eTi4oyVyMeJBZ1hUapQ1xrHv3aQ960jOhCzK0u6vwEvJE2NrT+/Zn6g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <00764fe2-f78a-e5db-cb16-903ad1a5ec03@amd.com>
Date: Wed, 9 Nov 2022 08:39:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Xen Arm vpl011 UART will cause segmentation fault in Linux guest
To: Jiamei Xie <Jiamei.Xie@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
References: <AS8PR08MB76960AFEAA767A12368E83D9923E9@AS8PR08MB7696.eurprd08.prod.outlook.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <AS8PR08MB76960AFEAA767A12368E83D9923E9@AS8PR08MB7696.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT107:EE_|BY5PR12MB4274:EE_
X-MS-Office365-Filtering-Correlation-Id: dc54258c-9b0c-428b-b21d-08dac22593af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	barWOInO+niBwA9SFQfPXDvUGbk1pkyecS88TkGA/H6j18dcXZlwR4ZmickGnN0c9/APG8/ENraZpAiGPxpYt96d/ASa7UH7pfKX1zaHHJuNHRMJkMwAA6huJoppcvvqXFMJqI5UAKf4Ukhakp3oJ1DqSi6q3bXFN3QGY57W2NXIHxxH4k6KrwIFVH4kvsjSwMkPbmJCsa8RJgy5IYN2Me8nFX3+8GOSfA1jQuzMuVIoAolRVjTjzTETuf1iiKqt7X1PL5sawQjWBa+q6C7syZ0ubm7jAngqwhcsFmPpoRgrE4Sq8kui1MweD+CntAw5UMy/Pe/QuqWHldH683ARi4Gsxr0Kf2R5QxYaQlAOx4ccqDGBgqag13HTDpalkgrY/dY4j6QmrUALICiQJRILXcYYVBdojxGfvXT728W2HAFmffgynzV/lu5sp5VXjyG4dKtH+w62xjEIV84/liddrjMnwEQ/hWBRQ+ypSyQ/u6vFzaywj4Gx9b4yOA2jR5qR2JKs2NxA6y4I3hUbDdyzb3/U3d0wYVEmedh7Yuz/muvUsweJouuyoWytV1gmpe6B0wnlZFHn0YArWJRNWut2nv2Q52rAmW7UXRUQZE2EZ4BOQhTkVaMC8SXvJG6h2GY5ANYFl+xEvd48by/PDPlOcL7kVmdW0xx00IxFkZfKz4bShlqJMYvlS3PQ3cauJ1CZauUyhpoXul/wruoBFbfxqQV3BPb72ILIrDBKVnJ5CXwHk8AoYX80UZCBAdboAp8iMaPhZDFZE/i6osbtVNuJ/NMyF+5aG8YLTjcMdro3+XSK9FN60OLcpnWQEich2CMyHJAd8Bi497FjMf6uXz09dA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(36840700001)(46966006)(40470700004)(40480700001)(47076005)(41300700001)(186003)(8936002)(44832011)(2616005)(5660300002)(36756003)(4326008)(26005)(8676002)(70206006)(70586007)(53546011)(336012)(2906002)(426003)(81166007)(31696002)(86362001)(82740400003)(82310400005)(83380400001)(356005)(40460700003)(31686004)(110136005)(36860700001)(54906003)(45080400002)(6666004)(478600001)(316002)(16576012)(66899015)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 07:39:47.3221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc54258c-9b0c-428b-b21d-08dac22593af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4274

Hi Jiamei,

On 09/11/2022 08:20, Jiamei Xie wrote:
> 
> 
> Hi all,
> 
> When the guest kernel enables DMA engine with "CONFIG_DMA_ENGINE=y", Linux AMBA PL011 driver will access PL011 DMACR register. But this register have not been supported by vpl011 of Xen. Xen will inject a data abort into guest, this will cause segmentation fault of guest with the below message:
I am quite confused.
VPL011 implements SBSA UART which only implements some subset of PL011 operations (SBSA UART is not PL011).
According to spec (SBSA ver. 6.0), the SBSA_UART does not support DMA features so Xen code is fine.
When Xen exposes vpl011 device to a guest, this device has "arm,sbsa-uart" compatible and not "uart-pl011".
Linux driver "amba-pl011.c" should see this compatible and assign proper operations (sbsa_uart_pops instead of amba_pl011_pops) that do not enable DMA.
Maybe the issue is with your configuration?

~Michal

> Unhandled fault at 0xffffffc00944d048
> Mem abort info:
> ESR = 0x96000000
> EC = 0x25: DABT (current EL), IL = 32 bits
> SET = 0, FnV = 0
> EA = 0, S1PTW = 0
> FSC = 0x00: ttbr address size fault
> Data abort info:
> ISV = 0, ISS = 0x00000000
> CM = 0, WnR = 0
> swapper pgtable: 4k pages, 39-bit VAs, pgdp=0000000020e2e000
> [ffffffc00944d048] pgd=100000003ffff803, p4d=100000003ffff803, pud=100000003ffff803, pmd=100000003fffa803, pte=006800009c090f13
> Internal error: ttbr address size fault: 96000000 [#1] PREEMPT SMP
> Modules linked in:
> CPU: 0 PID: 132 Comm: bootlogd Not tainted 5.15.44-yocto-standard #1
> pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : pl011_stop_rx+0x70/0x80
> lr : uart_tty_port_shutdown+0x44/0x110
> sp : ffffffc00999bba0
> x29: ffffffc00999bba0 x28: ffffff80234ac380 x27: ffffff8022f5d000
> x26: 0000000000000000 x25: 0000000045585401 x24: 0000000000000000
> x23: ffffff8021ba4660 x22: 0000000000000001 x21: ffffff8021a0e2a0
> x20: ffffff802198f880 x19: ffffff8021a0e1a0 x18: 0000000000000000
> x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> x11: 0000000000000000 x10: 0000000000000000 x9 : ffffffc00871ba14
> x8 : ffffffc0099de260 x7 : ffffff8021a0e318 x6 : 0000000000000003
> x5 : ffffffc009315f20 x4 : ffffffc00944d038 x3 : 0000000000000000
> x2 : ffffffc00944d048 x1 : 0000000000000000 x0 : 0000000000000048
> Call trace:
> pl011_stop_rx+0x70/0x80
> tty_port_shutdown+0x7c/0xb4
> tty_port_close+0x60/0xcc
> uart_close+0x34/0x8c
> tty_release+0x144/0x4c0
> __fput+0x78/0x220
> ____fput+0x1c/0x30
> task_work_run+0x88/0xc0
> do_notify_resume+0x8d0/0x123c
> el0_svc+0xa8/0xc0
> el0t_64_sync_handler+0xa4/0x130
> el0t_64_sync+0x1a0/0x1a4
> Code: b9000083 b901f001 794038a0 8b000042 (b9000041)
> ---[ end trace 83dd93df15c3216f ]---
> note: bootlogd[132] exited with preempt_count 1
> /etc/rcS.d/S07bootlogd: line 47: 132 Segmentation fault start-stop-daemon
> In Xen, vpl011_mmio_write doesn't handle DMACR . And kernel doesn't check if pl011_write executes sucessfully in pl011_dma_rx_stop . So such segmentation fault occurs.
> static inline void pl011_dma_rx_stop(struct uart_amba_port *uap)
> {
>         /* FIXME.  Just disable the DMA enable */
>         uap->dmacr &= ~UART011_RXDMAE;
>         pl011_write(uap->dmacr, uap, REG_DMACR);
> }
> 
> I think we should prevent such segmentation fault. We have checked the PL011 spec, it seems there is not any register bit can indicate DMA support status of PL011. We might have two options:
> 1. Option#1 is to add DMA support for vpl011, but this is not trivial.
> 2. Option#2 is to ignore the write to DMACR, and return 0 for DMACR read in vpl011. But this option need co-work with kernel, because current Linux PL011 driver assume the write operation will never be failed, and will not fallback to no-DMA mode, when Xen return 0 for DMA enabled bit in DMACR.
> 
> How do you think about it?  Any suggestion about it is welcome. Thanks.
> 
> Best wishes
> Jiamei Xie
> 

