Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D997B627B
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 09:29:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612105.951933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZpu-0005W3-ER; Tue, 03 Oct 2023 07:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612105.951933; Tue, 03 Oct 2023 07:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZpu-0005Tm-Ap; Tue, 03 Oct 2023 07:28:54 +0000
Received: by outflank-mailman (input) for mailman id 612105;
 Tue, 03 Oct 2023 07:28:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Pu2=FR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qnZps-0005R6-Nn
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 07:28:52 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e88::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e9a7cd5-61be-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 09:28:50 +0200 (CEST)
Received: from PA7P264CA0336.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:39a::16)
 by CH0PR12MB5387.namprd12.prod.outlook.com (2603:10b6:610:d6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Tue, 3 Oct
 2023 07:28:44 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10a6:102:39a:cafe::f) by PA7P264CA0336.outlook.office365.com
 (2603:10a6:102:39a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33 via Frontend
 Transport; Tue, 3 Oct 2023 07:28:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Tue, 3 Oct 2023 07:28:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 3 Oct
 2023 02:28:42 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 3 Oct 2023 02:28:41 -0500
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
X-Inumbo-ID: 7e9a7cd5-61be-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMnH2VuC5AGAHBZs4ruyeuMdcqO8ht486pjDtp03FA8AYVfhaTYHkH7uJSzDFaJq17/7i9MgI2rFIV/I6CJkRRaIl6fxAQUCYBXSOy0EKdVfTjJQxfH9uhdeSuG1xnK9+oVodx1mGINODqt2Y9Mc75SkXALFK0oWLVw2UeGp/1ox+yu8O6bzdLoBnVuctyxyqeOUQhuEzn1dVAyZ+fVP6DwblQF9NikXBdQmF1Z6yYZPQSEAdn9qIpqbsbaeXSmkShdBp0faieuIbHKEyGXrJnxLfPxZLGIV3iOFbH3Sex8mnMtGHO1D+TGq3Q5HRiOo4jPM+WGfBHzJ7iasZNB7PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzYn/sWTi8kNzsEGpoICXUY9FIypDLLDGt8fFR14bmc=;
 b=kg6oTrpF7eK/2+nFstdDIFbk+JR40+wwauN7CzUfV4pXP71ydjyGcMDvhL6IJZi6aCrYe4TJDU5Q6Mu5DjFfO+g1fE8r2v4x4dzE7LiBPyobZI87Qvuzza+4uTUz+XQKkelL4tnMXmCOXZlSzbe3ZpwtpDGglSTAAz4d+bbfBlwzCJVXIIkvaSVpxuhJ6lZRbUmt8xuozli7AaIHli+/GWuT/Zzhlk+21d/kWVytRKuuRYcF15XiVzmqm/LNQrMcFYV3l8fBz1bGH4IsmgKeF4xXTt6NVoBCR5gUERooEKs+BqDLZoKxny6CehGflmwTPMsEeBRwseKli4fx7t8mfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzYn/sWTi8kNzsEGpoICXUY9FIypDLLDGt8fFR14bmc=;
 b=k4LoiB7U7lOQUJzNTVur+RA+6hmced7lwHNPANNnGPnudfsE1Nx1yjoYLvH5XthPBSM4RsmpY8BCT/HVP/Fx9J++oLZ2CRxp8/DVgpJzxfmDcsjQ7iE3/FVUON7EWFczKOK1tVcH2XAuf33jfNYMLiZbkj76I2Ilr3KRO+B6K7g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c101624b-96a3-30a4-b3a9-344dad5e8fa5@amd.com>
Date: Tue, 3 Oct 2023 09:28:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Fwd: changing Dom0 data during smc call inside of xen during
 cache coloring
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
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2310021608180.2348112@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|CH0PR12MB5387:EE_
X-MS-Office365-Filtering-Correlation-Id: 79bb6750-e61a-4e06-14d1-08dbc3e25f62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IJd+wIsTppXJQVznR8FpsXiGgoHdcHPzd1oHxOSuuJHmO+apY/0GwEfz4QfE7b/0PRO746oMR8+azKoGAVZgryJm2uwC/SCsIxJi0RDOveZ6MwPu5nwpcDnVn69zNR58giYr7R1/1tqdpub7A15+pvruFCNkLFUKjY8FesnbVD7dLezRq+k+Vd7bj+TFG0ApGiXbxrrOO+m25XyReEeXcT68knO35St+9xA9YDI6I+h6oDVJmoU53OF9nXp0pHkqmpHn7BpPgxp3FvRVxeJtfm5ondwXgJhHCoB9oaqEWAMM6WHtoBhML23fsr0+JUZOV/yawiGCT5qvjm1ej12zj9ejALz45a/hU8/ZAw6BaBE2g+XytK73t6nAnfUmB1vf/Ki7ouTirBdyt4ZXucLEDHb0gljcbNPX5wlZMy6h7wUgRb4lMnfWHUQw5vbsB/3jzHNia9HSq3ZXg2RKbaFiRIXl/S9ULJXtgO6hwK5ZoIAxM/yrPt8XpuJkIMIVAijOqIqVvOPjzOMeIqqk/x9IrXgKckvFVv9Q98xdGNJdMl4fhJGvPNMwiaKjh8Gk/t4rvUFLQSiHMzphAlXYZA8LDl+Mh+iGaV13OfHoYMKxrqrtAytiM+K4sgnGCAsMpElJTn5rkCOJzFliFojp+oKAHnHSBy/Opo4dWw4X1fangZ7EIVsn9AzKv+ytywkpyRBw17fpiQaNuh+h7CU8l7QknEqIbaJWJ6ocO29Jz2gM8SDs+QhMw5Lr7cTzj9XvdvBAOAx4RLZa6/5AmI9D2gjJYe6mrey4oYOW3q9eGTvRrL6zvOpUW9b+dEU9iPqDYd1v1NL3xLNCUMMg4KRI0Vb9mA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(186009)(64100799003)(1800799009)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(47076005)(2906002)(40460700003)(86362001)(31696002)(36756003)(356005)(81166007)(82740400003)(40480700001)(36860700001)(53546011)(316002)(70586007)(16576012)(70206006)(54906003)(110136005)(41300700001)(966005)(2616005)(478600001)(6666004)(31686004)(336012)(426003)(4326008)(8676002)(44832011)(5660300002)(26005)(8936002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 07:28:43.2877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79bb6750-e61a-4e06-14d1-08dbc3e25f62
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5387

Hi Oleg, Stefano

On 03/10/2023 02:13, Stefano Stabellini wrote:
> Hi Oleg,
> 
> You are getting this output:
> 
>> (XEN) d0v0 Forwarding AES operation: 3254779951 136bb00000000000 -> fffffffffffff000
> 
> Which means that the guest physical address is 0x136bb00000000000 and
> the translated physical address is 0xfffffffffffff000. It generates an
> error so you are asking if 0xfffffffffffff000 is incorrect because the
> translation is incorrect.
> 
> This is possible. However, I think it is more likely that
> 0x136bb000_00000000 is incorrect. This an extremely high address. Could
> it be wrong?

I think the issue is due to a different way of forming the r1 register for this particular EEMI call:

Take a look at the PM AES function from Linux:
https://github.com/Xilinx/linux-xlnx/blob/master/drivers/firmware/xilinx/zynqmp.c#L1975
and EEMI call invocation:
https://github.com/Xilinx/linux-xlnx/blob/master/drivers/firmware/xilinx/zynqmp.c#L390

The register passed as r1 is formed a bit differently than "normally". FWICS:
 - the upper 32 bits of address are stored in the lower 32 bits of r1 register.
 - the lower 32 bits of address are stored in the upper 32 bits of r1 register.

That is why you are getting a very high address in r1 0x136bb000_00000000.

Please, try to do the following (not tested):

case 0xC200002F:
{
    register_t gaddr, new_gaddr;
    paddr_t maddr;

    gaddr = ((register_t)get_user_reg(regs, 1) << 32) | (get_user_reg(regs, 1) >> 32);
    maddr = mfn_to_maddr(gfn_to_mfn(current->domain, gaddr_to_gfn(gaddr)));

    /* Most probably not needed given dma_alloc_coherent use */ 
    maddr += gaddr &~ PAGE_MASK;

    /* Convert back to required format */
    new_gaddr = ((register_t)maddr << 32) | (maddr >> 32);

    arm_smccc_1_1_smc(get_user_reg(regs, 0),
            get_user_reg(regs, 1),
            new_gaddr,
            get_user_reg(regs, 3),
            get_user_reg(regs, 4),
            get_user_reg(regs, 5),
            get_user_reg(regs, 6),
            get_user_reg(regs, 7),
            &res);

    set_user_reg(regs, 0, res.a0);
    set_user_reg(regs, 1, res.a1);
    set_user_reg(regs, 2, res.a2);
    set_user_reg(regs, 3, res.a3);
    return true;
}

~Michal


