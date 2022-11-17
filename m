Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2862962DC03
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 13:54:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445184.700215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oveOK-0003mp-CD; Thu, 17 Nov 2022 12:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445184.700215; Thu, 17 Nov 2022 12:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oveOK-0003kw-9B; Thu, 17 Nov 2022 12:53:16 +0000
Received: by outflank-mailman (input) for mailman id 445184;
 Thu, 17 Nov 2022 12:53:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N1RQ=3R=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oveOI-0003kq-N5
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 12:53:15 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20611.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca923a79-6676-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 13:53:12 +0100 (CET)
Received: from MW4PR04CA0218.namprd04.prod.outlook.com (2603:10b6:303:87::13)
 by CH0PR12MB5091.namprd12.prod.outlook.com (2603:10b6:610:be::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Thu, 17 Nov
 2022 12:53:08 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::3f) by MW4PR04CA0218.outlook.office365.com
 (2603:10b6:303:87::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Thu, 17 Nov 2022 12:53:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Thu, 17 Nov 2022 12:53:07 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 17 Nov
 2022 06:53:05 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 17 Nov
 2022 04:53:05 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 17 Nov 2022 06:53:04 -0600
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
X-Inumbo-ID: ca923a79-6676-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7MIluPC2N1tEe/rw0xbwLePG+rGOF5EP+f9rVVxG+9IxET/w1FrMgbZ9FSv9hMyhfj/3bGdB8dJWPx2qyXicK+G41Tf2WYcYJ+fWHFb+Fl+KOD5REYjwbSbHPGvwx9qcD9lX309gL6ZX3AYjO7Lx8MEUPnGnY0YQqFpETSpBUpbamIr4DZxhTWUEslb47llGV/pq4S/UABc54dGxc8zzxJOtlEf2cdUzTyr+vaNr/TpIit1BMxiIoB2p9J+AQ6Kt1TKLtAUxWdAsC2eE36uE0qRd0+B21FOpG3Rau2B50fCpj6mLYdCrFpGsHTRk4S+cDz+1Q8kz4V3WB9dxRknkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxaueBbt+ug6bZg7jAtJPvJ/n/hUBpII6MXs3vj6wFk=;
 b=eV17p+JUk2j2uhpM3cnXL2j6/IwKwMgTRRiLN/ekm6qnblolJHODeEcPOnGX6aehfuKu91ys/b1bFNKtbxhlybQErm5AKuzlFdYkhEKNJ6yssqFHdyVZDADE0Z6j22dunUt65hn/HjkUrZnLMi+ThhXnHmbwVFLQQAJCZK28Dls2TJNe2mCH70LZqXbCj0IzyC4EZZ3NcgJY4j4gCBdwikGZIITA0KJB5GQIkktEndWGegYvhdvcMMK2dSRWZAPV4E0oiY7qVu1WqmXjRDnDxQYXcjgwLXP8MkWn45csdXr9f30YepWnexdvS3nesAMhVAL3iz+r6HZdqmre6heLGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxaueBbt+ug6bZg7jAtJPvJ/n/hUBpII6MXs3vj6wFk=;
 b=krAfZNhwMNITBz//Or3NPq665QDiv5SwwCuBszmvkqCm/Lz9/WmSgpDkrlTg+Pj3FImqkg2Y3MSJP8FDfFKD2GK+Epm96Lr76PPWoNXn8xHmHvIWsIMytAnf0WFxa/i0wiM7dbHkNzHdNh2hVwameXO5Bz5K09U9+Jeeadcrimw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f6de7a90-25aa-3b71-fd5a-67ef2a0f0e6e@amd.com>
Date: Thu, 17 Nov 2022 13:52:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] xen/arm: debug-pl011.inc: Use macros instead of hardcoded
 values
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
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
In-Reply-To: <c932c530-69c0-8c75-ff37-cb35d0ad5de3@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT011:EE_|CH0PR12MB5091:EE_
X-MS-Office365-Filtering-Correlation-Id: c0658657-9e4f-4de6-247c-08dac89aad1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iQNBLH9gES1TozQCR6A/uWPsPn/8TBq4H1gu/u6YvaAADUQV3Nno7womSyKCrXcQ0JP8OMWvAfrkWGQHwCMYsPHufO3Ew/xMr9zu/ByEqL3rpnSqnSuVcGqFodPuYVYmkiQho5LMAwGZR+LpGhwzc5iiLE7NLdI/hiCb6iVLabt3CDQjAPipKmgotKP75L2W9256gqLP9GNRZu2nYrxRaS0xs/hKnqoz59Bnr3lYYIpnfRwR3lMK1IAaOLj+qieWpHQgge3ixiigRYFBKLeD4oMWuDqB47qv2YhG5diHqaO+m5fzNIOn7KYQ9sEbg1BuIM6KpVXbFEU8KYQv7pFe6qXsdUUVN+GeD4xU1sG3pDQ/uFtphQgABLv8j6uuo1nDaKnVpEq4NVUM/wjufRsPDvgXAye3awttZ5tWdXHePw2pxsyg+ZUn6l14HJiiVimQXrmlCnefnTCGhFXl6ddFvfS4v9D5X5SEQB66Ak+I5pW8gHhpZ+63fnnOUMa3D0ukLTwy6dWGzvG9d01IdMuLDkx4DmShNjOtgKlfBs9F9DAMF/yR3wRe7gF1p2luaW7iSxmnYi+2kgom+yRwvJB8iYeUJbo0QMcMGtm2TpQew5zTAr0KhMx4xIzpLRWfwJ9GmD67RyguMOiHoo7bq0LwiS29HGw2qQv4c1YArm/usGAV4AValiFqAE+5ckTEttmcD9zK/AfTuaPS9BhrrmcoCVqccHbrYS/LWFiOcJzXA48NU24PUBgx02Zpg78SmoU7oKn6Hd6DemN7VrJ182sXj9XA59fzn1LwnZpumxl2jgU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199015)(46966006)(40470700004)(36840700001)(86362001)(31696002)(82310400005)(40460700003)(36756003)(40480700001)(356005)(41300700001)(2616005)(70206006)(70586007)(4326008)(8676002)(44832011)(426003)(186003)(8936002)(47076005)(336012)(5660300002)(45080400002)(6666004)(478600001)(966005)(316002)(16576012)(26005)(54906003)(110136005)(53546011)(82740400003)(81166007)(83380400001)(2906002)(36860700001)(66899015)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 12:53:07.9827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0658657-9e4f-4de6-247c-08dac89aad1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5091



On 17/11/2022 10:53, Michal Orzel wrote:
> 
> 
> Hi Julien,
> 
> On 17/11/2022 10:29, Julien Grall wrote:
>>
>>
>> On 17/11/2022 08:34, Michal Orzel wrote:
>>> Hi Julien,
>>>
>>> On 16/11/2022 19:37, Julien Grall wrote:
>>>>
>>>>
>>>> Hi Michal,
>>>>
>>>> On 16/11/2022 18:05, Michal Orzel wrote:
>>>>> On 16/11/2022 16:56, Julien Grall wrote:
>>>>>>
>>>>>>
>>>>>> On 16/11/2022 14:45, Michal Orzel wrote:
>>>>>>> Hi Julien,
>>>>>>
>>>>>> Hi Michal,
>>>>>>
>>>>>>>>
>>>>>>>>> and use it in the pl011-debug files (+ there is a question whether we should define WLEN_7-5 for completeness).
>>>>>>>>
>>>>>>>> I would not define WLEN_7-5. That said, I wonder if we really need to
>>>>>>>> set the baud rate & co here?
>>>>>>>>
>>>>>>>> AFAICT the runtime driver never touch them. The reasoning is the
>>>>>>>> firmware is responsible to configure the serial. Therefore, I would
>>>>>>>> consider to drop the code (setting UARTCR might still be necessary).
>>>>>>> I do not really agree because the current behavior was done on purpose.
>>>>>>
>>>>>> EARLY_UART_PL011_BAUD_RATE is only used for very early debugging (this
>>>>>> is protected by CONFIG_DEBUG and CONFIG_EXPERT). This is not a
>>>>>> production ready code.
>>>>> I am fully aware of it. I just found it useful but I understand the global reasoning.
>>>>>
>>>>>>
>>>>>>> At the moment early_uart_init is called only if EARLY_UART_PL011_BAUD_RATE is set to a value != 0.
>>>>>>> This is done in order to have flexibility to either stick to what firmware/bootloader configured or to change this
>>>>>>> configuration by specifying the EARLY_UART_PL011_BAUD_RATE (useful when you do not know what
>>>>>>> the firmware configured).
>>>>>> The chances are that you want to use the baud rate that was configured
>>>>>> by the firmware. Otherwise, you would need to change the configuration
>>>>>> of minicom (or whatever you used) to get proper output for the firmware
>>>>>> and then Xen.
>>>>>>
>>>>>> Furthermore, as I wrote before, the runtime driver doesn't configure the
>>>>>> baud rate. This was removed in Xen 4.7 (see commit 2048e17ca9df
>>>>>> "drivers/pl011: Don't configure baudrate") because it was buggy and this
>>>>>> code is not simple.
>>>>>>
>>>>>> So it makes no sense to configure the baud rate when using early printk
>>>>>> but not the runtime driver.
>>>>> Ok, so we will get rid of EARLY_UART_PL011_BAUD_RATE config and setting the bd
>>>>> in the early uart code. Now, what about setting "8n1"? The runtime driver sets them
>>>>> as well as the early code. It can also be set to a different value from the firmware
>>>>> (unlikely but it can happen I think). In any case, if we decide to do what the runtime driver
>>>>> does, I reckon setting LCR_H should be kept in early code.
>>>>
>>>> Good question. I think, you would end up with the same issue I mentioned
>>>> above if the firmware and Xen have different line control registers
>>>> (tools like minicom/screen would ask for it).
>>>>
>>>> So I am on the fence here. In one way, it seems pointless keep it. But
>>>> on the other hand, Xen has always set it. So I have no data to prove
>>>> this will be fine everywhere.
>>> If we are relying on the firmware[1] to configure the baud rate, it is not very wise
>>> not to rely on it to configure the LCR. Looking at the other serial drivers in Xen,
>>> we have a real mismatch in what is being configured. Some of the drivers (omap, imx),
>>> apart from setting 8n1 also set the baud rate explicitly to 115200 and almost all of them
>>> do set 8n1. In that case we will not benefit too much from fixing just pl011.
>> It is not great that Xen hardcode the baud rate (I can't remember
>> whether there was a reason), but I don't think the consistency is
>> necessary here (see more below).
>>
>>>
>>> On the other hand, Xen follows the zImage/Image protocols for ARM [2] which do not
>>> state that serial port initializing is something mandatory. This could indicate that
>>> the firmware does not really need to configure the serial.
>>
>> The firmware doesn't need to configure the serial and yes in theory Xen
>> should configure the baud rate and parity based on the firmware table.
>>
>> However, this is a trade off between complexity and benefits. The patch
>> I mentioned earlier has been removed nearly 6 years ago and I haven't
>> seen anyone reporting any issues.
>>
>> Hence why I think for the PL011 it is not worth looking [3] at the baud
>> rate and instead removing it completely in the early PL011 code as well.
>>
>> That said, if you feel strongly adding support for baud rate then I will
>> be happy to review the patch.
> I'm not in favor of this approach either. That said, I will prepare patches to remove
> CONFIG_EARLY_UART_PL011_BAUD_RATE and its usage in early printk code as we agreed earlier.
> As for the LCR setting, I will keep it in early printk code to maintain the same behavior as
> runtime driver who sets them.
Actually, there is one more thing to consider.
early_uart_init, even though it also sets LCR apart from the baud rate, is called when CONFIG_EARLY_UART_INIT is set.
The latter depends on EARLY_UART_PL011 && EARLY_UART_PL011_BAUD_RATE != 0.
If we remove EARLY_UART_PL011_BAUD_RATE, we need to decide when do we want early_uart_init to be called. It is defined only for pl011
(it is also defined for meson but this is an unreachable code, as EARLY_UART_PL011 is 0 for meson), so we have the following options:
1. Redefine CONFIG_EARLY_UART_INIT to be CONFIG_EARLY_UART_PL011_INIT and mark it as n by default
2. Keep CONFIG_EARLY_UART_INIT so that future drivers can use it (?) and mark it as n by default
2. Completely remove early_uart_init

> 
>>
>>>
>>> [1] It is not stated anywhere in our docs.
>>
>> Our docs are not perfect. Patches are welcomed for improvement.
>> Although, I think the statement should only be for driver where we don't
>> set the baud rate. For the others, we should leave it as is unless you
>> can prove this is not necessary (we don't want to break existing setup).
>>
>>>
>>> [2] BTW: our docs/misc/arm/booting contains invalid links to the kernel docs. I guess
>>> this wants to be fixed.
>>
>> Patches are welcomed.
>>
>> [3] I do have a large list of more critical bugs that I will be happy to
>> share if you are looking for improving Xen.
> That is cool and such list would be great for everyone having some spare time (+ newcomers).
> Taking the opportunity of having a GitLab CI epics, I think it is worth adding such work items here:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2Fgroups%2Fxen-project%2F-%2Fepics%3Fstate%3Dopened%26page%3D1%26sort%3Dstart_date_desc&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7Ce2f65ddb895243bdb9cc08dac881acba%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638042756535884326%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=5Hf%2BXW3nogjzasoTQ821OPAjJLJVVofyGpb0LNxRAto%3D&amp;reserved=0
> 
>>
>> --
>> Julien Grall
> 
> ~Michal
> 

~Michal

