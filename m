Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2299D7D7DAA
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 09:31:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623529.971442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvuq7-000700-OP; Thu, 26 Oct 2023 07:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623529.971442; Thu, 26 Oct 2023 07:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvuq7-0006wi-Lj; Thu, 26 Oct 2023 07:31:35 +0000
Received: by outflank-mailman (input) for mailman id 623529;
 Thu, 26 Oct 2023 07:31:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I5Mm=GI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qvuq6-0006wc-9u
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 07:31:34 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20618.outbound.protection.outlook.com
 [2a01:111:f400:fe59::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae3acb9d-73d1-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 09:31:31 +0200 (CEST)
Received: from BL1PR13CA0156.namprd13.prod.outlook.com (2603:10b6:208:2bd::11)
 by DS0PR12MB7928.namprd12.prod.outlook.com (2603:10b6:8:14c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Thu, 26 Oct
 2023 07:31:28 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:208:2bd:cafe::6) by BL1PR13CA0156.outlook.office365.com
 (2603:10b6:208:2bd::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.8 via Frontend
 Transport; Thu, 26 Oct 2023 07:31:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Thu, 26 Oct 2023 07:31:28 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 26 Oct
 2023 02:31:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 26 Oct
 2023 02:31:27 -0500
Received: from [10.71.193.58] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 26 Oct 2023 02:31:26 -0500
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
X-Inumbo-ID: ae3acb9d-73d1-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/S77rtLFdMuRIM/ZLpe2vUYrqPbvVl5evYPg77jXteAmiMOy1fwQXz+rfOfuVaQr2TIlaTkdtDrcD6IHkMho2ZcxsScZFhls9e97JEPx6SRwLEqJtor3eO1P10ovUcupuqOTERdEgSQDqsLwJ6i3H7EdRMhINVFBz+fMkx/pp/x671RGyp2DpgXlYfGScdDs2JtIunKN2QGtAJChiOv27CvUOUo1LDFLsAg3uL9ini/jJp4xyFsx4VpUhzQACVXLZalvYAFREvZ5hRtPSLM6+FcnEe9eegumY9mILkgMECJ3ZSajrxI2dTLRaTaB69vw/yrA+TbsUU4XRFg6ANbyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32/wV8hI7aUe9ruznn3O+K1HZPqB7SIA3WGQOaL7Yis=;
 b=M8NYoUvjiCssXi3yguD33yDiDSMZBSuL9vVbxFnY0xxMA3FJqd2cXSr8iapBowqjW14JeISOipL0BgCc+8ZFxJ1XysPrldQTEdDpYzHnQ7kEeKW19CS5UmoohlHu8NCr+IXJ8oI8EcjuUIrh47y13JYkL8OGRa+UmNZvVvLY4lJjFLNmmT9NT3UsAUpJeCOGM9Ux1Y5+AjgubjouAXDdDPLKtXWgnv1RTaQnFYmWu3LnjpZDTwFKw3dFIDEkbjd8RDnuj8j+xHM/h4KO9656U61EnOjgl0toHV/k5Y5BkRTXjYvs8Sy2b65cqxrFuAwLMPHc2exqqI+za4HfenSDHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32/wV8hI7aUe9ruznn3O+K1HZPqB7SIA3WGQOaL7Yis=;
 b=zpdyf4I7vOOg1y60DvpMynTk+SXj/ma4eFJcBXycR/IBIWRy5w1/eXHrWVmBuPtezz3mSDLcl1S9yLwjDAnFN3OVKVrhETG1ZBbUWLlGvc+QyfnvM5r4qWPY0kMc3iWFRHsMCgMGFfxa5HxA5GhN/PCKzL4O5SMK9rD0WrddA0o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <5a80b619-d768-46a2-bc9d-b02eb2fa4d72@amd.com>
Date: Thu, 26 Oct 2023 09:31:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Add Rockchip rk3399 early printk support
Content-Language: en-US
To: Jun Nie <jun.nie@linaro.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<Volodymyr_Babchuk@epam.com>, <xen-devel@lists.xenproject.org>
References: <20231026054634.2805035-1-jun.nie@linaro.org>
 <ae4342e4-0ee1-484c-b679-5e3c24e2ad68@amd.com>
 <CABymUCP66YRy7=LbCtqtUPcGc+8AG5SSjS1OL+0WbhqdK5ExpA@mail.gmail.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <CABymUCP66YRy7=LbCtqtUPcGc+8AG5SSjS1OL+0WbhqdK5ExpA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|DS0PR12MB7928:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a14df26-bd99-401a-ba5b-08dbd5f5912b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lnFHT+ZZhUJUXwY+kufdBsdJwty2hRgp1o/hyxyLppi7VfbV6BRY6yhv/wUNeG7YF3yIdOanjNyQzoIlf3k2WuH1C64wLvhqxem88T8MNApw6aowfSohkLHTwnV0YU1BVPs38prA+9GWH/pcpyVsa+Te8jUJ3ay82JPcFO8SKJngMaaOSF87EEinL0sNSN+8ZZhk3W+6D6YbfnYW+kquDZKZRojwLaXKknInGElKjcsPXXn6HM7w/BlGENsfIkQQx55dZ0LODsQnCjrFN36hvuGaKhWfKVMdlm/N+OobF9QGOXxzzXt6qS+Uuj1utHuT1VZd4llg9PtxQhlgI+hwalgHAlIJFtZtNqzGVsOoqWyj5H7rjGlUADF6zN9zXPIbp9JyEm8iPxWJAZ96PV20G/mVZIpxhJQx/ipenlqn7Cvsyu6LoSdFZVrXYqzYK4iE+vRLj+PO42PLubQxoXt0g8cwAPvqO17uG4H7QLVPiYgPMtEO5xdVyc1IJ36InoIGwce7oFtL/hatt/G63ELsA39IpCMZfCbvvufcywrWFt8r5/rO8DtrTj8JsB0basMVbafgrYvfQcaN4Izg5Nu5CqbzBuPbHq1IK9XnWSxqeMfJH5e87/iv1iWmhFC0N5uDUCqKyUYXLopgkP9Psoc8u50NlMVuzb6Wp1zLpiRqq6LP9ATGAWr+9mp12tpe9DPPc8h2fVJMQOtDm9jTg6YJu5o3DPj12FS5bBahxS0tfw6N6jEpdHY5v+mbFWX3JG+uy+xp3Co9tQKJucIzmgREIkQj4g1wez7kJ/TSClCGE0deiKeqayqXr94rnxh26Li9
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(39860400002)(136003)(346002)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799009)(46966006)(36840700001)(40470700004)(70586007)(40460700003)(426003)(6666004)(2906002)(36860700001)(336012)(83380400001)(2616005)(53546011)(478600001)(47076005)(8936002)(8676002)(5660300002)(4326008)(41300700001)(16576012)(44832011)(82740400003)(31696002)(86362001)(70206006)(6916009)(54906003)(316002)(356005)(81166007)(40480700001)(31686004)(36756003)(26005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 07:31:28.1854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a14df26-bd99-401a-ba5b-08dbd5f5912b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7928



On 26/10/2023 09:22, Jun Nie wrote:
> 
> 
> Michal Orzel <michal.orzel@amd.com> 于2023年10月26日周四 15:02写道：
>>
>> Hi,
>>
>> On 26/10/2023 07:46, Jun Nie wrote:
>>>
>>>
>>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
>>> ---
>>>  xen/arch/arm/Kconfig.debug | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
>>> index 842d768280..fefe8ac4df 100644
>>> --- a/xen/arch/arm/Kconfig.debug
>>> +++ b/xen/arch/arm/Kconfig.debug
>>> @@ -158,6 +158,9 @@ choice
>>>         config EARLY_PRINTK_RCAR3
>>>                 bool "Early printk with SCIF2 on Renesas R-Car Gen3 processors"
>>>                 select EARLY_UART_SCIF
>>> +       config EARLY_PRINTK_RK3399
>>> +               bool "Early printk with 8250 on Rockchip RK3399 processors"
>>> +               select EARLY_UART_8250
>> Platform specific options for early printk are deprecated. You can read it at the top of the file:
>> "
>> Deprecated: Alternatively, there are platform specific options
>> which will have default values for the various parameters. But
>> such option will soon be removed.
>> "
>>
>> ~Michal
> 
> 
> Thanks for the reminder! So only below 2 configs shall be configured
> when compiling the project, right?
> 
> EARLY_UART_BASE_ADDRESS
> EARLY_UART_8250_REG_SHIFT

Yes, that's correct

~Michal

