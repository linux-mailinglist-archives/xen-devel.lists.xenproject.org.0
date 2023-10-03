Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 090CA7B5E05
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 02:15:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611849.951463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnT2Y-0007Q4-Vo; Tue, 03 Oct 2023 00:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611849.951463; Tue, 03 Oct 2023 00:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnT2Y-0007OD-SP; Tue, 03 Oct 2023 00:13:30 +0000
Received: by outflank-mailman (input) for mailman id 611849;
 Tue, 03 Oct 2023 00:13:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vfA/=FR=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1qnT2W-0007O7-He
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 00:13:28 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9d8f49d-6181-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 02:13:23 +0200 (CEST)
Received: from CYXPR03CA0065.namprd03.prod.outlook.com (2603:10b6:930:d1::7)
 by BY5PR12MB4902.namprd12.prod.outlook.com (2603:10b6:a03:1dd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31; Tue, 3 Oct
 2023 00:13:15 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:930:d1:cafe::5) by CYXPR03CA0065.outlook.office365.com
 (2603:10b6:930:d1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31 via Frontend
 Transport; Tue, 3 Oct 2023 00:13:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 3 Oct 2023 00:13:15 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 2 Oct
 2023 19:13:14 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 2 Oct
 2023 17:13:14 -0700
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 2 Oct 2023 19:13:13 -0500
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
X-Inumbo-ID: a9d8f49d-6181-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nq1/GqMx0W+nO/U2PoV4bP6LOfqEwjW67nGhokTE17j7IiMPHVOfJ5fVitCW8tIpW9ueeN1r5glsQmOG3Z+wNn2cqNVm93dXBDK5+HVsECIhzsj3+osx+0olce0jxf/3Z+ZhYf7n3pfD6jfpOWA34F3V39K9epQK0ZQEpUIjW5UXf3smJKFGZWKeLJXVxUff4wtY5pu3tn7a2B9r7FUnGGQ4Ge5avAgaEr+YWKxk+2JunECFL1J67h9dQF6IP1eoG0cvRwU0ZZXYan9zuXp3Bm8XExzap2zkEL9QjdxY4qxl3lNo1/ia1u1BWm7DGB2pgfKX9dbKbkGHKeSTlGNxCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QdLFeTxLo1Ul3ngYgX4cJ1iUENIMverQEqTwlc21QJM=;
 b=Tk8UUX2hp016yEHE5w2lx4T0XcsJvtu68C7fTFtmes8L1tE1OEPII6kiavJSM3Y75wdmtrk6As+bTwUVZvtA7FKoWq24q/HnKYD7l/BSfy6k8aT5WSw3HuwuSczuMLBwBTTSQWCmr1C9t0FG7iLy7HVLvF3bugW0HJuXnrhR7caYAUBC5wvGmfZr7K/Fj9gF0U2eV19Q2R5qgBNQcnQ3FCJKEVbV4oUYsrbvG+7/69cpb2lsZXDZbuWoTDrcXWs2wu3XH1Sz0LNRkEnvz0+Sv3DpyGtJWzvIXvTLguLqnjKNFkummrnI8PHIHcRYvUOYVVFlYqNZ1rTsIpcd4NtL3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdLFeTxLo1Ul3ngYgX4cJ1iUENIMverQEqTwlc21QJM=;
 b=rMbBGZKenwIHKpBDj4QOJ2PdYDJ7Y7eg9zZZstk1FLbY4FTd0vtLMqkooqkXglaSnegMZmpWYJO+I7WwseJn8scup8D4yYxGzHiKPH2hbk9NIiXXkb54Qjl000DZoS7P617ePp+bxUxThYkuinMt/YF2zbgQR1iFg083vm8bQRQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Mon, 2 Oct 2023 17:13:08 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleg Nikitenko <oleshiiwood@gmail.com>
CC: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>, "Carlo
 Nonato" <carlo.nonato@minervasys.tech>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>, <Stewart.Hildebrand@amd.com>
Subject: Re: Fwd: changing Dom0 data during smc call inside of xen during
 cache coloring
In-Reply-To: <CA+SAi2u2auZgzQh_s+pFspH1YLN4biCf0K7-V7NGWPZQjGoH0g@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2310021608180.2348112@ubuntu-linux-20-04-desktop>
References: <CA+SAi2tXMupikB2YgEXuq98KnOcqm6zWrk19rNvWTfzf2=ku-w@mail.gmail.com> <dba88398-3aef-4541-a8e8-8fd075c0d40e@xen.org> <CA+SAi2tHLVDj+q8KMD7OuhHoj0sSZ-39qs3Z94WGmL2OA3TM_g@mail.gmail.com> <alpine.DEB.2.22.394.2309281447180.1996340@ubuntu-linux-20-04-desktop>
 <CA+SAi2vZie+PcKgkAbLxcaimG7strkWot1z4LTpCGLeJxuaT2g@mail.gmail.com> <CA+SAi2u2auZgzQh_s+pFspH1YLN4biCf0K7-V7NGWPZQjGoH0g@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="8323329-1903153407-1696288286=:2348112"
Content-ID: <alpine.DEB.2.22.394.2310021709380.2348112@ubuntu-linux-20-04-desktop>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|BY5PR12MB4902:EE_
X-MS-Office365-Filtering-Correlation-Id: 1090cd55-9eee-4b13-5c7f-08dbc3a589d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mPySJLB0aXL0eWZSsfwIvxXJvHThGHHAR9KLbI0nlbH41eWLt5TcDa6ZjUzzPpdmLnecz3N3CuRroW+LV9fpm5bBZdi6LFe4TQmEy6Pis4ftZAxqINmp4fycoffEHoHVHbirLUKa8Lez9qqSCAuW9X4K6SMPikh3P0q+rMF+fKNjg72JLrl1g6fFn17gZrbsHtVjjdSHEOL9L9PBo39r/sHhWPevmkTRBP8gptHkNCcrqxmQqHYpFLZ7RUoTheX9Hrg3/fxXHaaXJKmXBSjWp3I7lyCoDCCkP6/Jgrrsf05QsIJb6ECBW9SN2+RAzYikWQACQ6SaE8UZNCo7b0cNRbcCMmJ5vINRWG5+AcZNXwAbMMBsum+wLhJdhmDxjDSmNcC4xjcZes8rbxKRMzJ8S8Z8jDqUvaSMNBC/Q6gIkLBBZY08sU7kQyTdRpIUkkkilQgTA+yVhRHN2mrUoEe/O1xRpIyjN4W7FYKYrtNVRbnH7Svf7mNiE9pm/QmxapYpunQexy+c1tesbpn75fUKjyicwBi3kC20mutpL/WuDrGrf/F80JFy4Rs+YVpa8V1omIFQ1pME0rDMnwg44eA9orYxVHagO3OWMSF72wvQwqLVahROk6zXpnbzUerOJ10YOpeZWOdBsteUsZg1hChm4+FqfgYG/JOpFc7pn47YhSQMLqi4/w8KvlUU6aua1P/10vjlh9EbEjcrVzP9GItAews0NWJG8oIW0m8u2gMqPD+XGm0bcy2TC21ZIDo6tBO2HnbpscEjXSWwLQ4S0yhXUw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(7916004)(4636009)(346002)(396003)(376002)(136003)(39860400002)(230922051799003)(82310400011)(451199024)(186009)(64100799003)(1800799009)(36840700001)(46966006)(40470700004)(6916009)(70586007)(70206006)(316002)(2906002)(54906003)(9686003)(5660300002)(478600001)(4326008)(44832011)(26005)(426003)(336012)(83380400001)(8676002)(6666004)(8936002)(33964004)(356005)(47076005)(36860700001)(41300700001)(82740400003)(86362001)(33716001)(40460700003)(81166007)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 00:13:15.1182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1090cd55-9eee-4b13-5c7f-08dbc3a589d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4902

--8323329-1903153407-1696288286=:2348112
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2310021709381.2348112@ubuntu-linux-20-04-desktop>

Hi Oleg,

You are getting this output:

> (XEN) d0v0 Forwarding AES operation: 3254779951 136bb00000000000 -> fffffffffffff000

Which means that the guest physical address is 0x136bb00000000000 and
the translated physical address is 0xfffffffffffff000. It generates an
error so you are asking if 0xfffffffffffff000 is incorrect because the
translation is incorrect.

This is possible. However, I think it is more likely that
0x136bb000_00000000 is incorrect. This an extremely high address. Could
it be wrong?

Can you check against your device tree that 0x136bb000_00000000
corresponds to memory? Or something valid?

Cheers,

Stefano


On Mon, 2 Oct 2023, Oleg Nikitenko wrote:
> Hello Stefano,
> Hello Julien,
> 
> > OK I see the question is about the Xilinx Xen tree. In the logs below we have:
> 
> I see. After the correction r2 to r1 CSU got aborted immediately.
> 
> (XEN) d0v0 Forwarding AES operation: 3254779951 136bb00000000000 -> fffffffffffff000
> Received exception
> MSR: 0x200, EAR: 0x2F, EDR: 0x0, ESR: 0x861
> 
> I printed the value which I got after the expression which I provided in the 1-st email executed.
> 
> So I may conclude that Xilinx's real physical address calculation scheme on the xen CC is incorrect.
> 
> Could you suggest a correct one ?
> 
> Regards,
> Oleg Nikitenko
> 
> пт, 29 сент. 2023 г. в 00:50, Stefano Stabellini <sstabellini@kernel.org>:
>       On Thu, 28 Sep 2023, Oleg Nikitenko wrote:
>       > Hello Julien,
>       >
>       > I am still fighting with xen Cache Coloring with aes.
>       > When I sent a request to hardware aes after xen with CC started I got the mistake in CSU.
>       > When I dumped structure contents on both sides I got the different data.
>       > Xilinx related contact wrote to me.
>       >
>       > When cache coloring is enabled, Dom0 is not 1:1 mapped (guest physical addresses in Dom0 != physical addresses). If the
>       Xilinx drivers in
>       > Linux (xcsudma.c) issue EEMI calls with a guest physical address (for instance the address of a memory buffer allocated by
>       Linux), then
>       > this address is no longer a physical address and would need to be translated. EEMI calls always get forwarded to Xen first,
>       then Xen issues
>       > a corresponding EEMI call to the firmware (see xen/arch/arm/platforms/xilinx-eemi.c:xilinx_eemi). But Xen is probably passing
>       the EEMI
>       > calls parameters unmodified. Then PMU tries to read the address but since this is not a physical address, it fails. Basically
>       we need to
>       > add code to Xen xen/arch/arm/platforms/xilinx-eemi.c:xilinx_eemi to translate any guest physical addresses passed as EEMI
>       calls arguments
>       > into physical addresses before making the EEMI call to firmware.
>       >
>       > This is an example patch, which is translating the parameter on register x2 for the EEMI call 0xC200002F. I haven't checked
>       the EEMI
>       > protocol for this call but this just an example to show you how to translate parameters.
>       >
>       > diff --git a/xen/arch/arm/platforms/xilinx-eemi.c b/xen/arch/arm/platforms/xilinx-eemi.c index 500c86dc69..bff1b71196 100644
>       ---
>       > a/xen/arch/arm/platforms/xilinx-eemi.c +++ b/xen/arch/arm/platforms/xilinx-eemi.c @@ -409,6 +409,30 @@ bool
>       xilinx_eemi(struct
>       > cpu_user_regs *regs, const uint32_t fid, } goto forward_to_fw;
>       >
>       >  *  case 0xC200002F:
>       >  *  {
>       >  *  uint64_t example_possible_address_param = get_user_reg(regs, 2);
>       >  *  uint64_t translated_address = mfn_to_maddr(gfn_to_mfn(current->domain,
>       >  *  gaddr_to_gfn(example_possible_address_param)));
>       >  *  translated_address += example_possible_address_param & ~PAGE_MASK; +
>       >  *  arm_smccc_1_1_smc(get_user_reg(regs, 0),
>       >  *  get_user_reg(regs, 1),
>       >  *  translated_address,
>       >  *  get_user_reg(regs, 3),
>       >  *  get_user_reg(regs, 4),
>       >  *  get_user_reg(regs, 5),
>       >  *  get_user_reg(regs, 6),
>       >  *  get_user_reg(regs, 7),
>       >  *  &res); +
>       >  *  set_user_reg(regs, 0, res.a0);
>       >  *  set_user_reg(regs, 1, res.a1);
>       >  *  set_user_reg(regs, 2, res.a2);
>       >  *  set_user_reg(regs, 3, res.a3);
>       >  *  return true;
>       >  *  }
>       >
>       > + default: if ( is_hardware_domain(current->domain) ) goto forward_to_fw;
>       >
>       > The aes request structure contains physical addresses of the source and destination.
>       > These addresses are obtained via two calls dma_alloc_coherent.
>       > The address of this structure is kept at x2 register.
> 
>       OK I see the question is about the Xilinx Xen tree. In the logs below we
>       have:
> 
>       > (XEN) d0v1 Forwarding AES operation: 3254779951 r2 0 -> 11432000                                                        log
>       from xen
> 
>       So it looks Linux passed 0 as address in x2, which cannot be right?
> 
> 
> 
>       > I applied the suggested scheme in xen for xilinx_eemi(...) function.
>       >
>       > case 0xC200002F:
>       > {
>       > uint64_t paramaddr = get_user_reg(regs, 2);
> 
>       It would seem that this is not read correctly? It should not be zero.
> 
> 
>       > uint64_t phyaddr = mfn_to_maddr(gfn_to_mfn(current->domain, gaddr_to_gfn(paramaddr)));
>       > phyaddr += (paramaddr & ~PAGE_MASK);
>       > gprintk(XENLOG_DEBUG, "Forwarding AES operation: %u r2 %lx -> %lx\n", fid, paramaddr, phyaddr);
>       > set_user_reg(regs, 2, phyaddr);
>       > }
>       > goto forward_to_fw;
>       >
>       > As a result I got the same issue as earlier.
>       >
>       > [   17.350086]
>       >
>       zynq_aes_gcm                                                                                                                       
>       user
>       > log
>       >
>       > [   17.350202] @ dma_alloc firmware:zynqmp-firmware:zynqmp-aes @                                                       kernel
>       log from Dom0
>       > [   17.353015] @@@ firmware:zynqmp-firmware:zynqmp-aes 0 @@@
>       > [   17.358515] zynqmp_aes [0] ffffffc00910d000 2806000 firmware:zynqmp-firmware:zynqmp-aes
>       > [   17.366546] @ dma_alloc firmware:zynqmp-firmware:zynqmp-aes @
>       > [   17.372347] @@@ firmware:zynqmp-firmware:zynqmp-aes 0 @@@
>       > [   17.377775] zynqmp_aes [1] ffffffc009115000 42a14000 keytype 1
>       > [   17.383660] zynqmp_aes [2] dump request align 1 ++
>       > [   17.388501] 00 60 80 02 00 00 00 00
>       > [   17.392032] 50 60 80 02 00 00 00 00
>       > [   17.395583] 00 00 00 00 00 00 00 00
>       > [   17.399117] 00 60 80 02 00 00 00 00
>       > [   17.402664] 40 00 00 00 00 00 00 00
>       > [   17.406226] 00 00 00 00 00 00 00 00
>       > [   17.409755] 01 00 00 00 00 00 00 00
>       > [   17.413311] zynqmp_aes [3] dump request --
>       >
>       > (XEN) d0v1 Forwarding AES operation: 3254779951 r2 0 -> 11432000                                                        log
>       from xen
> 
>       Here
> 
> 
>       > @ 000042A14000
>       >
>       @                                                                                                                                     
>       csu
>       > log from aes
>       > 04 E4 00 6F 05 E4 00 6F
>       > 06 E4 00 6F 07 E4 00 6F
>       > 10 E4 00 6F 11 E4 00 6F
>       > 12 E4 00 6F 13 E4 00 6F
>       > 14 E4 00 6F 15 E4 00 6F
>       > 16 E4 00 6F 17 E4 00 6F
>       > 18 E4 00 6F 19 E4 00 6F
>       >
>       > ERROR:   pm_aes_engine ### args 6 ret 0 addr 0 42a14000 ###                                                               
>       ATF log
>       >
>       > So the address of the structure was not changed.
>       > This is the question. 
>       > How can I map this address to xen and change physical addresses there ?
> 
> 
> 
--8323329-1903153407-1696288286=:2348112--

