Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E117B6287
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 09:33:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612116.951943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZuR-0002gC-Vi; Tue, 03 Oct 2023 07:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612116.951943; Tue, 03 Oct 2023 07:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZuR-0002dD-SX; Tue, 03 Oct 2023 07:33:35 +0000
Received: by outflank-mailman (input) for mailman id 612116;
 Tue, 03 Oct 2023 07:33:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Pu2=FR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qnZuQ-0002bt-V7
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 07:33:34 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20610.outbound.protection.outlook.com
 [2a01:111:f400:fe59::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2715aabd-61bf-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 09:33:32 +0200 (CEST)
Received: from CH2PR14CA0054.namprd14.prod.outlook.com (2603:10b6:610:56::34)
 by PH7PR12MB7139.namprd12.prod.outlook.com (2603:10b6:510:1ef::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Tue, 3 Oct
 2023 07:33:27 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::5f) by CH2PR14CA0054.outlook.office365.com
 (2603:10b6:610:56::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31 via Frontend
 Transport; Tue, 3 Oct 2023 07:33:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Tue, 3 Oct 2023 07:33:27 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 3 Oct
 2023 02:33:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 3 Oct
 2023 02:33:25 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 3 Oct 2023 02:33:24 -0500
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
X-Inumbo-ID: 2715aabd-61bf-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YInhx24jq+Gt0Y3TvDTu691qGjqOhtlhf9HEw9WRae5iUM5Gaxm0MlAT6gSlxtBqywZ549JnertYlbxk9bgf1lwKBAE0assjSPOhDU21kwIJLr7wNIwhnPXlk/L1yp97ElJzbLG41auLk7wXWR+HPzPq5JEckkel29PhLdOCQLyoor5m0Lx8E6G5TcMfB8DnRZ/xAklZk9tLAS3MvbMm0yUUXJxMFkK2+s/rmOYWIGateYidjYPK7k/pLWMpDYwbrrGzgRzWVmI9tLQ55qwAEpO/2YjKuIi9sq5nae3fe0UwjhO9Mv35ihgHiGjlwFAkdZ9PVarIoWqOP3B41rhaGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMsU4w1WrpCjhRirRNlQekyGIQf9iPTA7g1Tze/la7M=;
 b=EFwCFnEp2SBL7Zzq1M7qhW4P+HabMyNm6EOitb/n/2DUR+RXQl81fNEFtW0scR/JxYPZETwAnBUORNirWx+7qcJ6kl0oiBDhguJOEn76lveHI4LkPAO4P4xaEmi7KN5cjvS22xoxwovdiP4t/t8SlAZX6ox1kop1z4U+lVpVAJhZ2R4+k7eqqnKMswcJjjgI158XF3/d3QCY6ya9XJPPwI/UcK5XpfMDb5mKmVNfq9LJbDSGD22okopmBRAwvBZx0Ser5aGn/UD3DuoArZZZCR5tpaEdvmJIP1gkjIO9kBG77vUP3D8m3oCSLEx+hP/aodNfYhm1vdClqP6lZyH3Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMsU4w1WrpCjhRirRNlQekyGIQf9iPTA7g1Tze/la7M=;
 b=Ia+eunqnKSMn8kqfHDyp3ptX9DVIm5bKFj1De6vniRHDTr677ssw6hwXPVvBIJBJ/LoO2IJ1lhD/hvR62d37e7VPI7owCmXMfHLTRvL7tayWfhdp0qAMEdWbuZBTWvAlu8o8OrjrO9qsX7xYUQl6ENpJ8G1HHKIZQFue9SrBnAI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <fe7c359e-60e0-41fb-7d39-93a8d6772073@amd.com>
Date: Tue, 3 Oct 2023 09:33:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Fwd: changing Dom0 data during smc call inside of xen during
 cache coloring
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
To: Stefano Stabellini <stefano.stabellini@amd.com>, Oleg Nikitenko
	<oleshiiwood@gmail.com>
CC: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>, "Carlo
 Nonato" <carlo.nonato@minervasys.tech>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	<Stewart.Hildebrand@amd.com>
References: <CA+SAi2tXMupikB2YgEXuq98KnOcqm6zWrk19rNvWTfzf2=ku-w@mail.gmail.com>
 <dba88398-3aef-4541-a8e8-8fd075c0d40e@xen.org>
 <CA+SAi2tHLVDj+q8KMD7OuhHoj0sSZ-39qs3Z94WGmL2OA3TM_g@mail.gmail.com>
 <alpine.DEB.2.22.394.2309281447180.1996340@ubuntu-linux-20-04-desktop>
 <CA+SAi2vZie+PcKgkAbLxcaimG7strkWot1z4LTpCGLeJxuaT2g@mail.gmail.com>
 <CA+SAi2u2auZgzQh_s+pFspH1YLN4biCf0K7-V7NGWPZQjGoH0g@mail.gmail.com>
 <alpine.DEB.2.22.394.2310021608180.2348112@ubuntu-linux-20-04-desktop>
 <c101624b-96a3-30a4-b3a9-344dad5e8fa5@amd.com>
In-Reply-To: <c101624b-96a3-30a4-b3a9-344dad5e8fa5@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|PH7PR12MB7139:EE_
X-MS-Office365-Filtering-Correlation-Id: 67d26098-e9a2-4476-24c7-08dbc3e308a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VTOv0a0KzaZOHQCYA3Ed7YSEM3XJbKwjqegd26z2DHxQtD1NlJoBcO/6DfjRrOLAo4PbWNf9VAD+UJC00b/tCnqO2EC48t2IBNoaWisVW6BWmG3PQvq0kHGqjfacosOkmxB2f0p5hl0Ks8q0U8aUGDCR7giBSeBEvQBK/Odc1Vu8KcvzVdPuNdN/CHg6zpOjMb8IAgFf1ujNkxKSbx2Pu8g4PanVriRxv4S1P2ICyTGRsIDjC/7n/iedYfYZSwM5Pla1G5q//xKjBZ/55HdlhPx0YS2ED+FaAMK0b5r4DWqjGNHEL42KekCirk3IyaOYWT9R7bFcbNja2r5GT//BLKFdThJW1D2OwOpGW9SWJUVE+U3K+K634SAPDLnoz+awMWAPYvqniMxm4CNBX3A3gIsySUle5nR2/PVuSpROyD5ga1IcQKljRuAlmgJCjWAPSEV2Gh+/nDsfOYmLDuYttd7sutBqXNIcn97mp7PblbbSRylwlfLGqhKq67hgEVWdr0JCXEIg4neci0ZBXlLq2a9y1GhhfKxyFZ2eufqmAvdqP2e7QItAfnrr4wLmVZbk2qiZNyIoSXqt/D4/DCbO4wcs5yj6es6wSTLRjh9Q28S7ch9afyTnCq85CgqW76mwMSt/AQvZbc2dC7JIi7EH9qJ8vg3sRUGcUG20HcQYZ23qY0KOsNVPVl/16QVE+mRKDjjwNbnFNOYBh9C7I0Sj9EQev4hSed+eGTM8RZ/S88X+4jZDM1HbMmJMgjWI5JzjQIkpQXNKDnJl1rimzPla3oc1MQKgac55gnLoIyR+CwooK9y8KavntVIC0CzL/aYYyp5qr42NvY8IgqQAGS8uDw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(39860400002)(136003)(230922051799003)(64100799003)(186009)(1800799009)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(6666004)(53546011)(478600001)(966005)(426003)(336012)(2616005)(26005)(2906002)(41300700001)(110136005)(70586007)(70206006)(16576012)(54906003)(44832011)(5660300002)(8676002)(8936002)(4326008)(316002)(36756003)(36860700001)(47076005)(31696002)(86362001)(81166007)(82740400003)(356005)(40480700001)(31686004)(40460700003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 07:33:27.2505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d26098-e9a2-4476-24c7-08dbc3e308a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7139



On 03/10/2023 09:28, Michal Orzel wrote:
> 
> 
> Hi Oleg, Stefano
> 
> On 03/10/2023 02:13, Stefano Stabellini wrote:
>> Hi Oleg,
>>
>> You are getting this output:
>>
>>> (XEN) d0v0 Forwarding AES operation: 3254779951 136bb00000000000 -> fffffffffffff000
>>
>> Which means that the guest physical address is 0x136bb00000000000 and
>> the translated physical address is 0xfffffffffffff000. It generates an
>> error so you are asking if 0xfffffffffffff000 is incorrect because the
>> translation is incorrect.
>>
>> This is possible. However, I think it is more likely that
>> 0x136bb000_00000000 is incorrect. This an extremely high address. Could
>> it be wrong?
> 
> I think the issue is due to a different way of forming the r1 register for this particular EEMI call:
> 
> Take a look at the PM AES function from Linux:
> https://github.com/Xilinx/linux-xlnx/blob/master/drivers/firmware/xilinx/zynqmp.c#L1975
> and EEMI call invocation:
> https://github.com/Xilinx/linux-xlnx/blob/master/drivers/firmware/xilinx/zynqmp.c#L390
> 
> The register passed as r1 is formed a bit differently than "normally". FWICS:
>  - the upper 32 bits of address are stored in the lower 32 bits of r1 register.
>  - the lower 32 bits of address are stored in the upper 32 bits of r1 register.
> 
> That is why you are getting a very high address in r1 0x136bb000_00000000.
> 
> Please, try to do the following (not tested):
> 
> case 0xC200002F:
> {
>     register_t gaddr, new_gaddr;
>     paddr_t maddr;
> 
>     gaddr = ((register_t)get_user_reg(regs, 1) << 32) | (get_user_reg(regs, 1) >> 32);
>     maddr = mfn_to_maddr(gfn_to_mfn(current->domain, gaddr_to_gfn(gaddr)));
> 
>     /* Most probably not needed given dma_alloc_coherent use */
>     maddr += gaddr &~ PAGE_MASK;
> 
>     /* Convert back to required format */
>     new_gaddr = ((register_t)maddr << 32) | (maddr >> 32);
> 
>     arm_smccc_1_1_smc(get_user_reg(regs, 0),
>             get_user_reg(regs, 1),
>             new_gaddr,
Wrong placement. This should be for register 1 and not 2, so:
    arm_smccc_1_1_smc(get_user_reg(regs, 0),
            new_gaddr,
            get_user_reg(regs, 2),
            get_user_reg(regs, 3),
            get_user_reg(regs, 4),
            get_user_reg(regs, 5),
            get_user_reg(regs, 6),
            get_user_reg(regs, 7),
            &res);

~Michal

