Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BD363EB60
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 09:43:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450272.707543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0fAW-0007Gp-7T; Thu, 01 Dec 2022 08:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450272.707543; Thu, 01 Dec 2022 08:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0fAW-0007Ew-4N; Thu, 01 Dec 2022 08:43:44 +0000
Received: by outflank-mailman (input) for mailman id 450272;
 Thu, 01 Dec 2022 08:43:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=66xT=37=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p0fAV-0007Eq-6U
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 08:43:43 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41991dec-7154-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 09:43:42 +0100 (CET)
Received: from DM6PR10CA0026.namprd10.prod.outlook.com (2603:10b6:5:60::39) by
 BL3PR12MB6524.namprd12.prod.outlook.com (2603:10b6:208:38c::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Thu, 1 Dec 2022 08:43:38 +0000
Received: from DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:60:cafe::62) by DM6PR10CA0026.outlook.office365.com
 (2603:10b6:5:60::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8 via Frontend
 Transport; Thu, 1 Dec 2022 08:43:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT065.mail.protection.outlook.com (10.13.172.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.17 via Frontend Transport; Thu, 1 Dec 2022 08:43:38 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 02:43:38 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 00:43:38 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Dec 2022 02:43:36 -0600
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
X-Inumbo-ID: 41991dec-7154-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amulr2g8Z/wgciMLa9w4DPc/DAV14hgr/CGLLWCFUi9HWZyzwiQwq22ZTZUXqClAF7DGhBTt6PT/dwsOXJRSNaQ1qemOsq8i3IyQO3obbXbN0/3X7EykYfGzE0Wa2rqY+SpXokwr7XdmQ+bTrD3B4iI6j9r6wDJ9EsQobvNN7KFJEWMdZpWNemXGBBh7mV6tGEuWlFjl7FzR2Ooh61Ozx1d5veKlyrEwh4ZndKP6FpyFt5eT/uwc8IGkHhQ6MmQR1NKah3wZr7p3uJ6MSTqZT0Yp/nuz8ueKQf4F2exfXPShh5+cxht8x3Vbbab8rt6ZDqCFNpS9uEmjpoMi9NNH1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bZvU/VoBgXGx28xmx6/Jwc2M4hF2mEtAXpXpo3dcnk=;
 b=F74gL6nVPJVygfMXxgMA4bVDrdGnewd3BIHCANSvQC/EwugPPIpi38JhSDU9ldyL9FXt6RbKh4+ckkIzMX97aVR0P9eToxjwU4MEdZ/Cp1ae1TrvrEqayeUcPgVt2QGq5yo4H6oIZhIxSUTZl9nM/l3fX2HIDw8xTbh1P0kOxO1HCS40gQUxT6KVametEXZ0ge/6iTrWPf3gii/jG1UEvKkbl45XMBpR/Sy5dDPiMYteBofIKCAxT18fz/0EbIN9MEfpdpAWK4RTHTBnGisRWZjZ1mihR721N9I3C4UcEenWGA3Gj3Rj9cub8Qu5tiqGnj4DtIA4fiac/p+8rC9GLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8bZvU/VoBgXGx28xmx6/Jwc2M4hF2mEtAXpXpo3dcnk=;
 b=DbnKZLzSEynoRi5LayduADqGNU81ukx+Ygo7JHubPCTECbJu1YTQYoVRamQiXszU6OZ6gOXPqypck9mf9Ga7j8ABdDcPXBRpKUHTrwIdOzkXmD8ObXLwKrb4ZyXK4aHrkjfvwDxQg2YDSOjZ3GezBMr8lwCkmo/f/08gaN0Oj6U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ab845fc1-1db8-e578-b621-6d79a8fbe2ea@amd.com>
Date: Thu, 1 Dec 2022 09:43:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 1/2] xen/arm: vpl011: emulate non-SBSA registers as
 WI/RAZ
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
To: Jiamei Xie <jiamei.xie@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221201080400.1842558-1-jiamei.xie@arm.com>
 <20221201080400.1842558-2-jiamei.xie@arm.com>
 <f51dbcc1-e7b3-c5c9-f603-73c9013d8b2f@amd.com>
In-Reply-To: <f51dbcc1-e7b3-c5c9-f603-73c9013d8b2f@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT065:EE_|BL3PR12MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: f7da1e13-f3ae-4cf1-8aea-08dad378247f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tjGq7plV1UvV84qUzfb0RNZdDqiOnvxuykKVV65x5Ly79m3BOERGfCoeExOCoCyyIhswlZXZ8lBc8PHo6uw0bmZgTSOKA/T2Jvroi8phb4vTf7/U8/cm9iFiAC2Z8Fys1v7m69tFLGhTs0W/whWxH7IIgxAFmCHByCm5+2M/fFUssbQ7d0PJHKQhqlTXZ/HltvZD165s1/wT8mveulFHkr3BJnubS4i9CIJpOvnOzNVXVIi9lYEzIUkTrabxIYitbqsjVCSE3eRudU6FECqVhhlM/wJWIfFikVGHObBfTlpIkIE+gZujFY8AOPOxwAj838Sbun38oCkkwSSwWaeXJpHcqo4yrj9CucI3Kh4+4Ggkgs+XiKYcYcle+2CrGzqkGU8ObdBNjOoHvFkCVYslwOPp/5CZPTAu7Jp27hmVSLshPT2MtwU2aUiPoaix1DdFYKT8NLbVkI8NnSZxyPcHwFCrWo2EUsdYiIeWA5Eeo6xO1ttiELA5cSD2N167prxTSAteB0tHLefxlmU9uA+GqNUKjFOSzMK/++sIAFDd9rDCp/PNTlACH7HLWPETgkg+iBT2D9QeqcTCkYHm8t5o48IUCqVTpk3pW+Q6Bvt3YT5caVTos3Wu2cs1ZHonYR/o6A433SaFJUNgW65Usj4fcABk1lRGA3T6s4gKjkRnZbQPCoOSs49cGOs6HSdHaNcBTN1am8PulCsyVXn1vRBhKcnZ/3DAPw6fVIkvTNLP1S/0ZYOabf41OjSBopwBo74kDOiHd42BshffvIhowtwxDaI87SO3OqXmAY9SM5h0eW3xPY2dPpvkAAB+uRaSzJskBeltChcdSLHFE8+b3cDq2w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199015)(36840700001)(40470700004)(46966006)(40460700003)(356005)(2906002)(2616005)(36756003)(40480700001)(86362001)(81166007)(31696002)(966005)(478600001)(26005)(316002)(44832011)(36860700001)(70586007)(5660300002)(45080400002)(41300700001)(70206006)(4326008)(8936002)(16576012)(54906003)(8676002)(110136005)(186003)(82740400003)(336012)(82310400005)(53546011)(83380400001)(426003)(47076005)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 08:43:38.7596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7da1e13-f3ae-4cf1-8aea-08dad378247f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6524



On 01/12/2022 09:42, Michal Orzel wrote:
> 
> 
> Hi Jiamei,
> 
> On 01/12/2022 09:03, Jiamei Xie wrote:
>>
>>
>> When the guest kernel enables DMA engine with "CONFIG_DMA_ENGINE=y",
>> Linux SBSA PL011 driver will access PL011 DMACR register in some
>> functions. As chapter "B Generic UART" in "ARM Server Base System
>> Architecture"[1] documentation describes, SBSA UART doesn't support
>> DMA. In current code, when the kernel tries to access DMACR register,
>> Xen will inject a data abort:
>> Unhandled fault at 0xffffffc00944d048
>> Mem abort info:
>>   ESR = 0x96000000
>>   EC = 0x25: DABT (current EL), IL = 32 bits
>>   SET = 0, FnV = 0
>>   EA = 0, S1PTW = 0
>>   FSC = 0x00: ttbr address size fault
>> Data abort info:
>>   ISV = 0, ISS = 0x00000000
>>   CM = 0, WnR = 0
>> swapper pgtable: 4k pages, 39-bit VAs, pgdp=0000000020e2e000
>> [ffffffc00944d048] pgd=100000003ffff803, p4d=100000003ffff803, pud=100000003ffff803, pmd=100000003fffa803, pte=006800009c090f13
>> Internal error: ttbr address size fault: 96000000 [#1] PREEMPT SMP
>> ...
>> Call trace:
>>  pl011_stop_rx+0x70/0x80
>>  tty_port_shutdown+0x7c/0xb4
>>  tty_port_close+0x60/0xcc
>>  uart_close+0x34/0x8c
>>  tty_release+0x144/0x4c0
>>  __fput+0x78/0x220
>>  ____fput+0x1c/0x30
>>  task_work_run+0x88/0xc0
>>  do_notify_resume+0x8d0/0x123c
>>  el0_svc+0xa8/0xc0
>>  el0t_64_sync_handler+0xa4/0x130
>>  el0t_64_sync+0x1a0/0x1a4
>> Code: b9000083 b901f001 794038a0 8b000042 (b9000041)
>> ---[ end trace 83dd93df15c3216f ]---
>> note: bootlogd[132] exited with preempt_count 1
>> /etc/rcS.d/S07bootlogd: line 47: 132 Segmentation fault start-stop-daemon
>>
>> As discussed in [2], this commit makes the access to non-SBSA registers
>> RAZ/WI as an improvement.
>>
>> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdeveloper.arm.com%2Fdocumentation%2Fden0094%2Fc%2F%3Flang%3Den&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C9345e5fe73c04ece2bbc08dad377f56e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638054809425877261%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=%2FTuXUhLO21PljT1o4tTEtyU0hXgDLEUjp3t0X1AnXXk%3D&amp;reserved=0
>> [2] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fxen-devel%2Falpine.DEB.2.22.394.2211161552420.4020%40ubuntu-linux-20-04-desktop%2F&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C9345e5fe73c04ece2bbc08dad377f56e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638054809425877261%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=c4qOLzf4w32%2BVkt49umv%2Bu3LVP3TVsQ8iBFLoLpRclg%3D&amp;reserved=0
>>
>> Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
> The patch looks good, so:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> However, because your series is about vpl011 refinement, I spotted two things
> (this does not necessarily needs to be done by you).
> 
>> ---
>> v3 -> v4
>> - remove the size check for unknown registers in the SBSA UART
>> - remove lock in read_as_zero
>> v2 -> v3
>> - emulate non-SBSA registers as WI/RAZ in default case
>> - update commit message
>> v1 -> v2
>> - print a message using XENLOG_G_DEBUG when it's write-ignore
>> ---
>>  xen/arch/arm/vpl011.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
>> index 43522d48fd..f4a5621fab 100644
>> --- a/xen/arch/arm/vpl011.c
>> +++ b/xen/arch/arm/vpl011.c
>> @@ -414,11 +414,15 @@ static int vpl011_mmio_read(struct vcpu *v,
>>      default:
>>          gprintk(XENLOG_ERR, "vpl011: unhandled read r%d offset %#08x\n",
> This is an emulated UART MMIO handler, so instead XENLOG_ERR, we should use XENLOG_G_ERR
> to indicate gust error and not Xen error.
> 
>>                  dabt.reg, vpl011_reg);
>> -        return 0;
>> +        goto read_as_zero;
>>      }
>>
>>      return 1;
> This return statement is unreachable.
Forget about this one. I can see you fixed that in the second patch.

~Michal


