Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD5F6226D9
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 10:26:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440747.694902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oshLV-0000Ef-Ah; Wed, 09 Nov 2022 09:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440747.694902; Wed, 09 Nov 2022 09:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oshLV-0000Cr-7v; Wed, 09 Nov 2022 09:26:09 +0000
Received: by outflank-mailman (input) for mailman id 440747;
 Wed, 09 Nov 2022 09:26:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mo2k=3J=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oshLT-0000Cl-Mf
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 09:26:07 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2075.outbound.protection.outlook.com [40.107.102.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 884bc925-6010-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 10:26:05 +0100 (CET)
Received: from DM6PR11CA0012.namprd11.prod.outlook.com (2603:10b6:5:190::25)
 by SA0PR12MB4447.namprd12.prod.outlook.com (2603:10b6:806:9b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Wed, 9 Nov
 2022 09:26:00 +0000
Received: from DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:190:cafe::1c) by DM6PR11CA0012.outlook.office365.com
 (2603:10b6:5:190::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26 via Frontend
 Transport; Wed, 9 Nov 2022 09:26:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT030.mail.protection.outlook.com (10.13.172.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Wed, 9 Nov 2022 09:26:00 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 9 Nov
 2022 03:25:57 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Wed, 9 Nov 2022 03:25:56 -0600
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
X-Inumbo-ID: 884bc925-6010-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edvRUrg3/jwmFrtYbZI7h327JwsO9ClXCpMa2aI/hPWLENkTp6bv9HiWmWD9fw6PvFwnOzo89yHAWgZrRCShnPbY5vxNfLVEp3eDs1Rti5vxBkGYgOX08jmR57t5icJaiYKk2wQHJOLz7QXZAXDEIEU4NISmmKoUWevVLy4dNM6A7vN4m492LaO1B9JZZHjXLOlPaAVeK7AZtOqUXV2pNHqSYTRdyo5pbZDGQ1/1kX70GDtmOnEMpaF154oQutQTjh/GHPNLEQmLsw2WeYpHCkWIWDL7jHRWiYNZylQelGyk3HCQQGOegI/E7vO55K+qqM9fGL+yPdAVBmy7VeGR4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1IgZXZ8vzh/ylSC0DwcCkflG0dKrWJQYwSG0rIHDXiQ=;
 b=hOhHIbpL88E+173NyazgAqYdntkRgi2arwtPsXSx++Yx8QqJHL2nMRKAQUjvKmpfgTLMBPOZ4M09lf77yGv2IRZC6WBNN3UB33ewcgiOeBDbq106JRTjDXlpAJXmlVsnprEg0VqxQtrR+zonIJ6whhVzxZ50uV2APqQJytT18Ye+EzyTFGjU+S3lCsycFwXnrYeXTZcJp9Uxri5J3bcHPjOy2g6kMaPwl8udwZgZq5aD2qmWIyMW4PezdjJ31Tu9oBSvnq93vYFdrRtUnxocTbsbXhbjFMqz4A/k3nGXlmsvMaUAkExcKCup2zFbw/sET/6IQq96Iyxk31tler9bbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1IgZXZ8vzh/ylSC0DwcCkflG0dKrWJQYwSG0rIHDXiQ=;
 b=YWBvDv2oJgSzX+j7qKLWpEimIeAyARzdTYIX6aByipOiG0O99EL9fUKTnCVHwIT7dAPlgk7st8wUmJr313k4r0+hghLTiMQjnAkmZFNcfNHY/WcPUfyzLG3xpvEwOT5JgI+Qj3BYWSnqUN6FCL9GJ7OCjUGurjZUPIq5dbl4ymA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f650683a-c2e6-e282-b32c-52151341ecfb@amd.com>
Date: Wed, 9 Nov 2022 10:25:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Xen Arm vpl011 UART will cause segmentation fault in Linux guest
Content-Language: en-US
To: Jiamei Xie <Jiamei.Xie@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
References: <AS8PR08MB76960AFEAA767A12368E83D9923E9@AS8PR08MB7696.eurprd08.prod.outlook.com>
 <00764fe2-f78a-e5db-cb16-903ad1a5ec03@amd.com>
 <AS8PR08MB7696950216E688E67644CBDB923E9@AS8PR08MB7696.eurprd08.prod.outlook.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <AS8PR08MB7696950216E688E67644CBDB923E9@AS8PR08MB7696.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT030:EE_|SA0PR12MB4447:EE_
X-MS-Office365-Filtering-Correlation-Id: b85539f4-f079-472c-1b9a-08dac2346a5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DmZfD9v1v9wdDZKKqh8/mlmDd3DK3O1NeEL406+xvFLyHuzosDdjiXmmcEsLBZhAxc4iTDzzFdH0O+U5PHwpvNz5YqRE8hYzgV4ruWgGpsZVGijbuLBMyC3rK+s2V3gLNTdpOCX2sziSaFZQwR77zThaNxzVa7JveVss9Z8hiMrm7uAWMNYjwgZfwoSo/uF31+/SFK8UxGZj/JxcNFQuPK8G07XG8MjSD56OPv0z6cShK2qOwOQB9tV4emk4HgKGjni+GJQFpvtPrLAl1nIFDcZHya+Nyuj3dmBHoj2VnMa8g2gIIy2u7YO4n00ku/pCq7bwSUmwe59EHL2WCb5sCjs4wOUM9K3/NjBu4SGcZNV0OGYhFY/nFgHxD3PK6N1VzM53rrueOuNOHG+89TGe/MKdKFs0ZMx8t70R8necGjBcK5UjbxItn0FnVavx/kB+/U/oHs8oHqw6uRGxbQb/gQTnTR19eLTbRT8IjiTXIv+f9TQ3Z+nsRLu15RBI1nj6TqpcZTq3Vc4AwFAOba8EWeHfuFxagQQiyS62K7NCNrFHIl/Huui+Cn9Qgon2l+zBLfZCfuTsIPm4D4JOXA0L9YjIvgpEP9EOQlpC6PXb+endnu2i5T8HpNZQnZ3Vt9FdGGATIAAbGqBtetqolFYJjI+VKaiX++2qX158a/N37EX1z7QtvRm+VTXeWZD0i8lJGE9oc8fZ6wysqb7Qt82OfJFWbzGn4T2GmtpeubUV6uMjJLfFzApEsw9oLGPBMNHUD3McYRmPPyCE+Yr/noPqMfULCZJQZf7bshAZ8ebubTGrWKnXl44YKD1cD+M0A2EVFyGfZLXtCNXp5h2WTN0LaA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(47076005)(83380400001)(2616005)(426003)(26005)(356005)(36860700001)(186003)(53546011)(336012)(8936002)(40460700003)(2906002)(40480700001)(82310400005)(41300700001)(16576012)(5660300002)(478600001)(54906003)(4326008)(8676002)(44832011)(70206006)(70586007)(316002)(110136005)(45080400002)(66899015)(36756003)(81166007)(31696002)(82740400003)(86362001)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 09:26:00.4205
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b85539f4-f079-472c-1b9a-08dac2346a5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4447

Hi Jiamei,

On 09/11/2022 09:25, Jiamei Xie wrote:
> 
> 
> Hi Michal，
> 
> Below log can be got when stating the linux guest. It says 9c09 is sbsa. And 9c09 is also output
>  in bootlogd error message:
> Serial: AMBA PL011 UART driver
> 9c0b0000.uart: ttyAMA0 at MMIO 0x9c0b0000 (irq = 12, base_baud = 0) is a PL011 rev2
> printk: console [ttyAMA0] enabled
> 9c090000.sbsa-uart: ttyAMA1 at MMIO 0x9c090000 (irq = 15, base_baud = 0) is a SBSA
> 

Xen behavior is correct and this would be Linux fault to try to write to DMACR for SBSA UART device.
DMACR is just an example. If you try to program e.g. the baudrate (through LCR) for VPL011 it will
also result in injecting abort into the guest. Should Xen support it? No. The reason why is that
it is not spec compliant operation. SBSA specification directly specifies what registers are exposed.
If Linux tries to write to some of the none-spec compliant registers - it is its fault.

> Best wishes
> Jiamei Xie
> 

~Michal

> 
> 
>> -----Original Message-----
>> From: Michal Orzel <michal.orzel@amd.com>
>> Sent: Wednesday, November 9, 2022 3:40 PM
>> To: Jiamei Xie <Jiamei.Xie@arm.com>; xen-devel@lists.xenproject.org
>> Cc: Wei Chen <Wei.Chen@arm.com>; Bertrand Marquis
>> <Bertrand.Marquis@arm.com>; julien@xen.org; sstabellini@kernel.org
>> Subject: Re: Xen Arm vpl011 UART will cause segmentation fault in Linux
>> guest
>>
>> Hi Jiamei,
>>
>> On 09/11/2022 08:20, Jiamei Xie wrote:
>>>
>>>
>>> Hi all,
>>>
>>> When the guest kernel enables DMA engine with
>> "CONFIG_DMA_ENGINE=y", Linux AMBA PL011 driver will access PL011
>> DMACR register. But this register have not been supported by vpl011 of Xen.
>> Xen will inject a data abort into guest, this will cause segmentation fault of
>> guest with the below message:
>> I am quite confused.
>> VPL011 implements SBSA UART which only implements some subset of PL011
>> operations (SBSA UART is not PL011).
>> According to spec (SBSA ver. 6.0), the SBSA_UART does not support DMA
>> features so Xen code is fine.
>> When Xen exposes vpl011 device to a guest, this device has "arm,sbsa-uart"
>> compatible and not "uart-pl011".
>> Linux driver "amba-pl011.c" should see this compatible and assign proper
>> operations (sbsa_uart_pops instead of amba_pl011_pops) that do not enable
>> DMA.
>> Maybe the issue is with your configuration?
>>
>> ~Michal
>>
>>> Unhandled fault at 0xffffffc00944d048
>>> Mem abort info:
>>> ESR = 0x96000000
>>> EC = 0x25: DABT (current EL), IL = 32 bits
>>> SET = 0, FnV = 0
>>> EA = 0, S1PTW = 0
>>> FSC = 0x00: ttbr address size fault
>>> Data abort info:
>>> ISV = 0, ISS = 0x00000000
>>> CM = 0, WnR = 0
>>> swapper pgtable: 4k pages, 39-bit VAs, pgdp=0000000020e2e000
>>> [ffffffc00944d048] pgd=100000003ffff803, p4d=100000003ffff803,
>> pud=100000003ffff803, pmd=100000003fffa803, pte=006800009c090f13
>>> Internal error: ttbr address size fault: 96000000 [#1] PREEMPT SMP
>>> Modules linked in:
>>> CPU: 0 PID: 132 Comm: bootlogd Not tainted 5.15.44-yocto-standard #1
>>> pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>> pc : pl011_stop_rx+0x70/0x80
>>> lr : uart_tty_port_shutdown+0x44/0x110
>>> sp : ffffffc00999bba0
>>> x29: ffffffc00999bba0 x28: ffffff80234ac380 x27: ffffff8022f5d000
>>> x26: 0000000000000000 x25: 0000000045585401 x24: 0000000000000000
>>> x23: ffffff8021ba4660 x22: 0000000000000001 x21: ffffff8021a0e2a0
>>> x20: ffffff802198f880 x19: ffffff8021a0e1a0 x18: 0000000000000000
>>> x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
>>> x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
>>> x11: 0000000000000000 x10: 0000000000000000 x9 : ffffffc00871ba14
>>> x8 : ffffffc0099de260 x7 : ffffff8021a0e318 x6 : 0000000000000003
>>> x5 : ffffffc009315f20 x4 : ffffffc00944d038 x3 : 0000000000000000
>>> x2 : ffffffc00944d048 x1 : 0000000000000000 x0 : 0000000000000048
>>> Call trace:
>>> pl011_stop_rx+0x70/0x80
>>> tty_port_shutdown+0x7c/0xb4
>>> tty_port_close+0x60/0xcc
>>> uart_close+0x34/0x8c
>>> tty_release+0x144/0x4c0
>>> __fput+0x78/0x220
>>> ____fput+0x1c/0x30
>>> task_work_run+0x88/0xc0
>>> do_notify_resume+0x8d0/0x123c
>>> el0_svc+0xa8/0xc0
>>> el0t_64_sync_handler+0xa4/0x130
>>> el0t_64_sync+0x1a0/0x1a4
>>> Code: b9000083 b901f001 794038a0 8b000042 (b9000041)
>>> ---[ end trace 83dd93df15c3216f ]---
>>> note: bootlogd[132] exited with preempt_count 1
>>> /etc/rcS.d/S07bootlogd: line 47: 132 Segmentation fault start-stop-
>> daemon
>>> In Xen, vpl011_mmio_write doesn't handle DMACR . And kernel doesn't
>> check if pl011_write executes sucessfully in pl011_dma_rx_stop . So such
>> segmentation fault occurs.
>>> static inline void pl011_dma_rx_stop(struct uart_amba_port *uap)
>>> {
>>>         /* FIXME.  Just disable the DMA enable */
>>>         uap->dmacr &= ~UART011_RXDMAE;
>>>         pl011_write(uap->dmacr, uap, REG_DMACR);
>>> }
>>>
>>> I think we should prevent such segmentation fault. We have checked the
>> PL011 spec, it seems there is not any register bit can indicate DMA support
>> status of PL011. We might have two options:
>>> 1. Option#1 is to add DMA support for vpl011, but this is not trivial.
>>> 2. Option#2 is to ignore the write to DMACR, and return 0 for DMACR read
>> in vpl011. But this option need co-work with kernel, because current Linux
>> PL011 driver assume the write operation will never be failed, and will not
>> fallback to no-DMA mode, when Xen return 0 for DMA enabled bit in DMACR.
>>>
>>> How do you think about it?  Any suggestion about it is welcome. Thanks.
>>>
>>> Best wishes
>>> Jiamei Xie
>>>

