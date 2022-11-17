Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6175162D784
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 10:54:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444863.699982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovbay-0006W2-R9; Thu, 17 Nov 2022 09:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444863.699982; Thu, 17 Nov 2022 09:54:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovbay-0006SX-OK; Thu, 17 Nov 2022 09:54:08 +0000
Received: by outflank-mailman (input) for mailman id 444863;
 Thu, 17 Nov 2022 09:54:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N1RQ=3R=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ovbax-0006SM-7b
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 09:54:07 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4d0a866-665d-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 10:54:04 +0100 (CET)
Received: from BN0PR04CA0044.namprd04.prod.outlook.com (2603:10b6:408:e8::19)
 by DS7PR12MB6007.namprd12.prod.outlook.com (2603:10b6:8:7e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Thu, 17 Nov
 2022 09:54:02 +0000
Received: from BN8NAM11FT096.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::fb) by BN0PR04CA0044.outlook.office365.com
 (2603:10b6:408:e8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Thu, 17 Nov 2022 09:54:02 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT096.mail.protection.outlook.com (10.13.177.195) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Thu, 17 Nov 2022 09:54:01 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 17 Nov
 2022 03:54:01 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 17 Nov
 2022 01:53:51 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 17 Nov 2022 03:53:50 -0600
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
X-Inumbo-ID: c4d0a866-665d-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=daoI7dQuBBuFNJbvMkhAXX8uB0Ofj1dD2CwQPsOKRqzdV2nO0kTJAVszYQFtKjwiQhHG62+jhx81s0P5tQQE5ddza0rAQd4xM3+rxiegB//KCLFlVfIMOISesQk7HqIk114TuGtCzkCgB+Fuwvp6WLClvjb8NqLX9VOITrwrxpRspRGbshN7b/QMLR0F8CFBFY/Hf40NcxTQjVaV9yywPPyHTkPEhJKNG2LI10baOuy80HTJZDPLVfaYs4fVRCiuf6ItBD8pty+sN86pQjYCFnZnxAyFyHmLmKBXAitZ8GJb5kARLsg3B32mljXAs9htlBozsbpOA0V/3JRbwnQ2FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulrMRcfEuS4gXjhz1N7SHoZG+aLZM7wwvMdeJXbNHak=;
 b=LTh+QLHqYQd+SIM1L1nXItarfYemfAzzHOHLtR2nz1+AAvcle63H5KnNpwZ2eQbsTIWVpmbCX1o7R8CXvfxrJJOHOG1xucY6D4HlCNyXNYHo8pbJRdxrBJdZFyEXOkMv5oBIenfsHA0qQoYPO6iqIL3D1Ve8sFpQBxddgN0MS3ffJsIKl6vmTx/JQ681o9dcsRxjuyt+8xmmFpHOCRXEglraM8d6BhqmN99K8Z6sVC4MWf0DRPiaYG1mYN5AEOvFE2dh4mokeH1NJ68OcqyBlx9Duc+B9onrMNp1EzkCq8rwyejrKTEJgIlU5xIcoYV3tkhdGqXajwCnrTpE1m4gvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulrMRcfEuS4gXjhz1N7SHoZG+aLZM7wwvMdeJXbNHak=;
 b=c53J5jWcjPz+nwzbZ77yTyfhswoQOTkEbaJqiaozvbYEIKlM4zDHo7T6vW/Gwo81cv5WPSavFNo/XHsgedarX5yzvyxTlB4780Fg8eP7XZ3L6h856VfE+TjUgbwS6VwJZ4ufuL8p6VyN0g7Cwc+TvVLFXj3kltl6BtH8ZZ6p3PA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c932c530-69c0-8c75-ff37-cb35d0ad5de3@amd.com>
Date: Thu, 17 Nov 2022 10:53:49 +0100
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
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <7d3f9021-d608-9e8f-9593-1099d7bd2003@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT096:EE_|DS7PR12MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: 9daee2d9-dbaa-4fa0-8b96-08dac881a7cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	igzQorjBMLENfQYXN5o5pQxTfjz5fv02YQRNLiHVjn5zX8kuDTpg0UVM7cIu8RfVmxI2pAIJTK516eNFarmjqc7JvVNzZ2hkSV9vQKe4bcmXQ+zyLBrIekuW1XpsAgk+cPNDjnHTfkrAbTC/WoEHDYVIBxXRPpVyuPAPDhWe8olQLfH+j+lEDECnsTcNhvXwRSZYMrfZDyrLi9q0BaH7k9/eKi1SFCFaDAWeoXzDXPuSZlrydQXfFsWBUTUgMoii2NvvcH1liV675jDVTyji5MtL0wsu9bd+L38jzoIWSDODgHym82FAflQO8teM8rmnezAh+ayAQrvWIOlQYKn6j0ZfCIS+Ift9O8IF0z5p00zH8LUBaXpDY01xUDG5+EF8lH4/GOFpHq+N+4Wr84HMJYF6E1yubBm142ubSIhev6O+0czVgi/BgHuY8oEqUrFsFheaDSjA/H5UR13L3FAf6Wzs3IlD5+HeJwu6RThK10xJ7XFfkIbx/nXAx+juTRYclYepxmFKpc6azOw/si5JiM8yJJ3k9mkMwzzLhTzkOEJM4yAXlvKhCYi3XPaaywh0GfHBYTV0z5FPdYip7xw9PeudELhKAomKjZJGB2Isz3CkrpfwgB/l5mHT9NoJv/qL2bE92g0+jmVj/iaWMnnhT4vqLq/v5iAEv0Tnc1Rcr5uv67jLv+6MFJ02VKbSEbd+7qOMgTLHEzBGEFWQqgjKAd99BPd2458MV2S9IOr3J+HHHWCLHq0nJcjxvG95UTyI+iskOpLIi0TWfPfT2Eb9k2DvyTF+Wqk6oKYqpCqLct8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199015)(36840700001)(40470700004)(46966006)(36860700001)(82310400005)(40480700001)(36756003)(31696002)(86362001)(82740400003)(356005)(81166007)(54906003)(66899015)(31686004)(16576012)(53546011)(110136005)(316002)(966005)(478600001)(336012)(5660300002)(426003)(47076005)(44832011)(40460700003)(2616005)(186003)(8936002)(83380400001)(2906002)(70206006)(8676002)(4326008)(70586007)(26005)(41300700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 09:54:01.7610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9daee2d9-dbaa-4fa0-8b96-08dac881a7cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT096.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6007

Hi Julien,

On 17/11/2022 10:29, Julien Grall wrote:
> 
> 
> On 17/11/2022 08:34, Michal Orzel wrote:
>> Hi Julien,
>>
>> On 16/11/2022 19:37, Julien Grall wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>> On 16/11/2022 18:05, Michal Orzel wrote:
>>>> On 16/11/2022 16:56, Julien Grall wrote:
>>>>>
>>>>>
>>>>> On 16/11/2022 14:45, Michal Orzel wrote:
>>>>>> Hi Julien,
>>>>>
>>>>> Hi Michal,
>>>>>
>>>>>>>
>>>>>>>> and use it in the pl011-debug files (+ there is a question whether we should define WLEN_7-5 for completeness).
>>>>>>>
>>>>>>> I would not define WLEN_7-5. That said, I wonder if we really need to
>>>>>>> set the baud rate & co here?
>>>>>>>
>>>>>>> AFAICT the runtime driver never touch them. The reasoning is the
>>>>>>> firmware is responsible to configure the serial. Therefore, I would
>>>>>>> consider to drop the code (setting UARTCR might still be necessary).
>>>>>> I do not really agree because the current behavior was done on purpose.
>>>>>
>>>>> EARLY_UART_PL011_BAUD_RATE is only used for very early debugging (this
>>>>> is protected by CONFIG_DEBUG and CONFIG_EXPERT). This is not a
>>>>> production ready code.
>>>> I am fully aware of it. I just found it useful but I understand the global reasoning.
>>>>
>>>>>
>>>>>> At the moment early_uart_init is called only if EARLY_UART_PL011_BAUD_RATE is set to a value != 0.
>>>>>> This is done in order to have flexibility to either stick to what firmware/bootloader configured or to change this
>>>>>> configuration by specifying the EARLY_UART_PL011_BAUD_RATE (useful when you do not know what
>>>>>> the firmware configured).
>>>>> The chances are that you want to use the baud rate that was configured
>>>>> by the firmware. Otherwise, you would need to change the configuration
>>>>> of minicom (or whatever you used) to get proper output for the firmware
>>>>> and then Xen.
>>>>>
>>>>> Furthermore, as I wrote before, the runtime driver doesn't configure the
>>>>> baud rate. This was removed in Xen 4.7 (see commit 2048e17ca9df
>>>>> "drivers/pl011: Don't configure baudrate") because it was buggy and this
>>>>> code is not simple.
>>>>>
>>>>> So it makes no sense to configure the baud rate when using early printk
>>>>> but not the runtime driver.
>>>> Ok, so we will get rid of EARLY_UART_PL011_BAUD_RATE config and setting the bd
>>>> in the early uart code. Now, what about setting "8n1"? The runtime driver sets them
>>>> as well as the early code. It can also be set to a different value from the firmware
>>>> (unlikely but it can happen I think). In any case, if we decide to do what the runtime driver
>>>> does, I reckon setting LCR_H should be kept in early code.
>>>
>>> Good question. I think, you would end up with the same issue I mentioned
>>> above if the firmware and Xen have different line control registers
>>> (tools like minicom/screen would ask for it).
>>>
>>> So I am on the fence here. In one way, it seems pointless keep it. But
>>> on the other hand, Xen has always set it. So I have no data to prove
>>> this will be fine everywhere.
>> If we are relying on the firmware[1] to configure the baud rate, it is not very wise
>> not to rely on it to configure the LCR. Looking at the other serial drivers in Xen,
>> we have a real mismatch in what is being configured. Some of the drivers (omap, imx),
>> apart from setting 8n1 also set the baud rate explicitly to 115200 and almost all of them
>> do set 8n1. In that case we will not benefit too much from fixing just pl011.
> It is not great that Xen hardcode the baud rate (I can't remember
> whether there was a reason), but I don't think the consistency is
> necessary here (see more below).
> 
>>
>> On the other hand, Xen follows the zImage/Image protocols for ARM [2] which do not
>> state that serial port initializing is something mandatory. This could indicate that
>> the firmware does not really need to configure the serial.
> 
> The firmware doesn't need to configure the serial and yes in theory Xen
> should configure the baud rate and parity based on the firmware table.
> 
> However, this is a trade off between complexity and benefits. The patch
> I mentioned earlier has been removed nearly 6 years ago and I haven't
> seen anyone reporting any issues.
> 
> Hence why I think for the PL011 it is not worth looking [3] at the baud
> rate and instead removing it completely in the early PL011 code as well.
> 
> That said, if you feel strongly adding support for baud rate then I will
> be happy to review the patch.
I'm not in favor of this approach either. That said, I will prepare patches to remove
CONFIG_EARLY_UART_PL011_BAUD_RATE and its usage in early printk code as we agreed earlier.
As for the LCR setting, I will keep it in early printk code to maintain the same behavior as
runtime driver who sets them.

> 
>>
>> [1] It is not stated anywhere in our docs.
> 
> Our docs are not perfect. Patches are welcomed for improvement.
> Although, I think the statement should only be for driver where we don't
> set the baud rate. For the others, we should leave it as is unless you
> can prove this is not necessary (we don't want to break existing setup).
> 
>>
>> [2] BTW: our docs/misc/arm/booting contains invalid links to the kernel docs. I guess
>> this wants to be fixed.
> 
> Patches are welcomed.
> 
> [3] I do have a large list of more critical bugs that I will be happy to
> share if you are looking for improving Xen.
That is cool and such list would be great for everyone having some spare time (+ newcomers).
Taking the opportunity of having a GitLab CI epics, I think it is worth adding such work items here:
https://gitlab.com/groups/xen-project/-/epics?state=opened&page=1&sort=start_date_desc

> 
> --
> Julien Grall

~Michal

