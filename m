Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 810BC62F287
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 11:27:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445548.700755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovyac-000339-PH; Fri, 18 Nov 2022 10:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445548.700755; Fri, 18 Nov 2022 10:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovyac-00030H-LC; Fri, 18 Nov 2022 10:27:18 +0000
Received: by outflank-mailman (input) for mailman id 445548;
 Fri, 18 Nov 2022 10:27:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jn0n=3S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ovyab-00030B-Fa
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 10:27:17 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20618.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91c7d655-672b-11ed-91b6-6bf2151ebd3b;
 Fri, 18 Nov 2022 11:27:15 +0100 (CET)
Received: from MW4PR03CA0303.namprd03.prod.outlook.com (2603:10b6:303:dd::8)
 by DM4PR12MB6085.namprd12.prod.outlook.com (2603:10b6:8:b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Fri, 18 Nov
 2022 10:27:10 +0000
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::d4) by MW4PR03CA0303.outlook.office365.com
 (2603:10b6:303:dd::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Fri, 18 Nov 2022 10:27:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT027.mail.protection.outlook.com (10.13.174.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 10:27:10 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 04:27:06 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 02:26:33 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 18 Nov 2022 04:26:32 -0600
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
X-Inumbo-ID: 91c7d655-672b-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSiiMhEaU8BsonlGFjv12lhi6+JpqneamrVoFHj6qD4xntaub8vguIdV5FM27avIZW/qeKZNWD4ClzDeeDtIsB8wZad081Sa+J/7wyNavmhsnX9d6OWEnGJ8WATfrQ+wj6ut+JGgq5aSiBjlgLOPzcRw2BQJfxxhgjuZOM3BcnJIeDNRtUvgIPmL97NJ5AoUF0I2xhF3DTQGDWdHaZXnjQ//uk+ail8wyePqJEUYpbpaFPOQ5BYmKsFdzAkHWKAihDHwf2uos5mOJxbQxpHIn90sUPRm7W9AdYp9TiCYnYtf0w5Ru57tNY8AnjaR+nvtMs4kqnCb4CcL/DGv+zdJeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJjmWiEow2PR6f/vKo4vBn5MG8D2eskjhTFiIWhpN4g=;
 b=Gntpj9L6TFKwU7CqsUBOiTlIy3HaApQHNGYNDJNEM42cVcWK+J0rETUCskYrCNmFwUIU7rMF2FBANj+Tt9ft/2CFip4KmAxGxEvaBO6IlHxlS7eGCX0bSbVIcmsi4R/r24U6/4rjrD4Bql+seVat3Nk04/ijXUU7ueXRi0wFDvbApm/llmwmcafk+qZT9I4+UxWKCfcI0FnaKOoZvJTQ9qUZatuZFY3+9+M4kPIY/5i26tRkWC7NJ5txP31SvUjZO9CubAQgJ1eMtOYLvv3wJC/Eud1G+WzRVVcqNXpttetkRHd4Bt1q0hHGtORZSY2BB/9aYOqF2Y5osLN6VLQyig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJjmWiEow2PR6f/vKo4vBn5MG8D2eskjhTFiIWhpN4g=;
 b=JGmstStLeKJO7BzFCxuygH0qI40rG0/Ul8NHy6MVyQMzU3hEUNZgyFmF5zEsUArPt7ANWlkRqNTRAOleWQwQJuxPMgVxMAWhmn9iAbkzxl+anKueKKNMeofZuOhvQl9VrFqlxWF9xY/q6TjFcqhL6U5WYP0DsOw2zw9nrH3W2fA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2e7659bd-d2ee-3484-3f17-fb62d51cdaaf@amd.com>
Date: Fri, 18 Nov 2022 11:26:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] xen/arm: debug-pl011.inc: Use macros instead of hardcoded
 values
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221024100536.12874-1-michal.orzel@amd.com>
 <fd7bd57d-b7a2-8be6-cead-2903a6115f40@xen.org>
 <d472516a-6ba4-167d-6eed-e9a4a43f65b2@amd.com>
 <653bdfb0-2926-531b-bb56-d0797fbf3877@xen.org>
 <60cf8d8e-e4d6-2c8b-50ba-ab6c3fe7d84c@amd.com>
 <0400b2d8-6f2c-6406-d966-64ed5720688c@xen.org>
 <350afafd-821c-1a05-13cb-1704d3a61bfc@amd.com>
 <84710d96-c473-fa41-d847-2b109dfb49c9@xen.org>
 <85f4f42b-b1ee-36bf-5ba9-21b1047351cf@amd.com>
 <7d3f9021-d608-9e8f-9593-1099d7bd2003@xen.org>
 <c932c530-69c0-8c75-ff37-cb35d0ad5de3@amd.com>
 <f6de7a90-25aa-3b71-fd5a-67ef2a0f0e6e@amd.com>
 <6404753f-e349-747e-3f4a-5401021e05ce@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <6404753f-e349-747e-3f4a-5401021e05ce@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT027:EE_|DM4PR12MB6085:EE_
X-MS-Office365-Filtering-Correlation-Id: b98cf8c4-ea40-4be7-b79a-08dac94f7370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7xMBkZaNdY3/GsqhL6tGahYz0kITe4YtvMFWLkP2cFMu97I+HmkZaRS7CdODZUqiIE50TwZnG2xalkUpL5U9E6wEhsVbJsIVccUdpxjujr55VDUesN/MuqBcg7BRXv6EJ3Yxw0KZpYmMGpQiN82+OgmQHZl+W954LjDotQqPw50Af8HWs7a/sxuPni+XdZlKM2N3uJTXlBGU/DdW1kVM/pFLcPefyNuVR0hnOOLNVUkshQvnsDsRQ8Nu4rwFBlvDi2qk4SCqBumtwVgscnSMqyoJWz0Ed1B2PuNWiyuAmE3+5R0CB+qLjQmvMVbtBdUqcyVmxJenGTXg9J2i0WdMDDHMXJ4Yb535n0C9YASU/iynYdIBTryEhQlntZ4kOY3+wcjUDNYTyOVoL8xUjASKQZErIxTj0wz+oF1u9gPdKttSgBITYhMojNA66xMiNxorxczMqwePzuGjWYFG3XT7pGT/bdFiNeY4MuFuZEpRyfEZkbXNeOGlR7qXuLeQf3y0Bv39dOWPIr4kSN4YE33lgIDAxX23zSAosxYqCV31L8fYD/eg8KjLIMUP5hHfmoWgc9PjDo2X6PcbsZblGCyKKdSTEcj+e0tSKIo7fHYkgalRFjTdjxaPI+iesIABVIGmHKDRIVyabOJzXqNdb0flj0gecNsNz29GGWoyK7ztROcEKyxJas4HRXEZ8S0DJBQhDDJQ+NwmPEGbu0Mnnq6FlPJbYFoKWrh/EYf6qV7Bearxon22u2P3qrDfaheLv4W1BCYU0si7C9nNWTDtuTYjc41gGtuTto8rjfd5VS/RzVSuVAAt48UHn42xA5sJzA11
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199015)(40470700004)(36840700001)(46966006)(82310400005)(31696002)(86362001)(36756003)(40460700003)(70586007)(186003)(41300700001)(2616005)(70206006)(44832011)(47076005)(8676002)(336012)(5660300002)(426003)(4326008)(8936002)(6666004)(478600001)(316002)(40480700001)(16576012)(356005)(54906003)(110136005)(53546011)(82740400003)(26005)(81166007)(2906002)(36860700001)(31686004)(83380400001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 10:27:10.0994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b98cf8c4-ea40-4be7-b79a-08dac94f7370
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6085

Hi Julien,

On 18/11/2022 10:58, Julien Grall wrote:
> 
> 
> On 17/11/2022 12:52, Michal Orzel wrote:
>>
>>
>> On 17/11/2022 10:53, Michal Orzel wrote:
>>>
>>>
>>> Hi Julien,
>>>
>>> On 17/11/2022 10:29, Julien Grall wrote:
>>>>
>>>>
>>>> On 17/11/2022 08:34, Michal Orzel wrote:
>>>>> Hi Julien,
>>>>>
>>>>> On 16/11/2022 19:37, Julien Grall wrote:
>>>>>>
>>>>>>
>>>>>> Hi Michal,
>>>>>>
>>>>>> On 16/11/2022 18:05, Michal Orzel wrote:
>>>>>>> On 16/11/2022 16:56, Julien Grall wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 16/11/2022 14:45, Michal Orzel wrote:
>>>>>>>>> Hi Julien,
>>>>>>>>
>>>>>>>> Hi Michal,
>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>> and use it in the pl011-debug files (+ there is a question whether we should define WLEN_7-5 for completeness).
>>>>>>>>>>
>>>>>>>>>> I would not define WLEN_7-5. That said, I wonder if we really need to
>>>>>>>>>> set the baud rate & co here?
>>>>>>>>>>
>>>>>>>>>> AFAICT the runtime driver never touch them. The reasoning is the
>>>>>>>>>> firmware is responsible to configure the serial. Therefore, I would
>>>>>>>>>> consider to drop the code (setting UARTCR might still be necessary).
>>>>>>>>> I do not really agree because the current behavior was done on purpose.
>>>>>>>>
>>>>>>>> EARLY_UART_PL011_BAUD_RATE is only used for very early debugging (this
>>>>>>>> is protected by CONFIG_DEBUG and CONFIG_EXPERT). This is not a
>>>>>>>> production ready code.
>>>>>>> I am fully aware of it. I just found it useful but I understand the global reasoning.
>>>>>>>
>>>>>>>>
>>>>>>>>> At the moment early_uart_init is called only if EARLY_UART_PL011_BAUD_RATE is set to a value != 0.
>>>>>>>>> This is done in order to have flexibility to either stick to what firmware/bootloader configured or to change this
>>>>>>>>> configuration by specifying the EARLY_UART_PL011_BAUD_RATE (useful when you do not know what
>>>>>>>>> the firmware configured).
>>>>>>>> The chances are that you want to use the baud rate that was configured
>>>>>>>> by the firmware. Otherwise, you would need to change the configuration
>>>>>>>> of minicom (or whatever you used) to get proper output for the firmware
>>>>>>>> and then Xen.
>>>>>>>>
>>>>>>>> Furthermore, as I wrote before, the runtime driver doesn't configure the
>>>>>>>> baud rate. This was removed in Xen 4.7 (see commit 2048e17ca9df
>>>>>>>> "drivers/pl011: Don't configure baudrate") because it was buggy and this
>>>>>>>> code is not simple.
>>>>>>>>
>>>>>>>> So it makes no sense to configure the baud rate when using early printk
>>>>>>>> but not the runtime driver.
>>>>>>> Ok, so we will get rid of EARLY_UART_PL011_BAUD_RATE config and setting the bd
>>>>>>> in the early uart code. Now, what about setting "8n1"? The runtime driver sets them
>>>>>>> as well as the early code. It can also be set to a different value from the firmware
>>>>>>> (unlikely but it can happen I think). In any case, if we decide to do what the runtime driver
>>>>>>> does, I reckon setting LCR_H should be kept in early code.
>>>>>>
>>>>>> Good question. I think, you would end up with the same issue I mentioned
>>>>>> above if the firmware and Xen have different line control registers
>>>>>> (tools like minicom/screen would ask for it).
>>>>>>
>>>>>> So I am on the fence here. In one way, it seems pointless keep it. But
>>>>>> on the other hand, Xen has always set it. So I have no data to prove
>>>>>> this will be fine everywhere.
>>>>> If we are relying on the firmware[1] to configure the baud rate, it is not very wise
>>>>> not to rely on it to configure the LCR. Looking at the other serial drivers in Xen,
>>>>> we have a real mismatch in what is being configured. Some of the drivers (omap, imx),
>>>>> apart from setting 8n1 also set the baud rate explicitly to 115200 and almost all of them
>>>>> do set 8n1. In that case we will not benefit too much from fixing just pl011.
>>>> It is not great that Xen hardcode the baud rate (I can't remember
>>>> whether there was a reason), but I don't think the consistency is
>>>> necessary here (see more below).
>>>>
>>>>>
>>>>> On the other hand, Xen follows the zImage/Image protocols for ARM [2] which do not
>>>>> state that serial port initializing is something mandatory. This could indicate that
>>>>> the firmware does not really need to configure the serial.
>>>>
>>>> The firmware doesn't need to configure the serial and yes in theory Xen
>>>> should configure the baud rate and parity based on the firmware table.
>>>>
>>>> However, this is a trade off between complexity and benefits. The patch
>>>> I mentioned earlier has been removed nearly 6 years ago and I haven't
>>>> seen anyone reporting any issues.
>>>>
>>>> Hence why I think for the PL011 it is not worth looking [3] at the baud
>>>> rate and instead removing it completely in the early PL011 code as well.
>>>>
>>>> That said, if you feel strongly adding support for baud rate then I will
>>>> be happy to review the patch.
>>> I'm not in favor of this approach either. That said, I will prepare patches to remove
>>> CONFIG_EARLY_UART_PL011_BAUD_RATE and its usage in early printk code as we agreed earlier.
>>> As for the LCR setting, I will keep it in early printk code to maintain the same behavior as
>>> runtime driver who sets them.
>> Actually, there is one more thing to consider.
>> early_uart_init, even though it also sets LCR apart from the baud rate, is called when CONFIG_EARLY_UART_INIT is set.
>> The latter depends on EARLY_UART_PL011 && EARLY_UART_PL011_BAUD_RATE != 0.
>> If we remove EARLY_UART_PL011_BAUD_RATE, we need to decide when do we want early_uart_init to be called. It is defined only for pl011
>> (it is also defined for meson but this is an unreachable code, as EARLY_UART_PL011 is 0 for meson), so we have the following options:
> 
> Good spot. I am not sure why the function was defined for Meson if it
> does nothing. I would drop it but keep the comment explaining why we
> don't have the helper.
Hmm, other drivers do not have such a comment but I can leave it there if you want.
Although, it should then be slightly modified to avoid ambiguity after removing macro:
/*
 * No need for early_uart_init, as UART has already been initialized
 * by Firmware, for instance by TF-A.
 */

> 
>> 2. Keep CONFIG_EARLY_UART_INIT so that future drivers can use it (?) and mark it as n by default
> 
> Based on the discussion with Bertrand, I would keep
> CONFIG_EARLY_UART_INIT in case someone wants to use a different UART for
> Xen and the firmware output.
> 
> Also, I would like to revise my opinion from earlier. I now think we
> should keep the baud rate part in early PL011 code even this means
> inconsistency between the early and runtime driver.
Ok, in this case I will just create a series containing this patch without any modifications,
the meson fix + macro for 8n1 to be used in early code as agreed earlier.

> 
> Cheers,
> 
> --
> Julien Grall

~Michal

