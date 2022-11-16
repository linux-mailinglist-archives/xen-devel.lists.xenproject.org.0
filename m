Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4315E62C142
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 15:46:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444318.699392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovJg6-0007Wf-O3; Wed, 16 Nov 2022 14:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444318.699392; Wed, 16 Nov 2022 14:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovJg6-0007UD-Ks; Wed, 16 Nov 2022 14:46:14 +0000
Received: by outflank-mailman (input) for mailman id 444318;
 Wed, 16 Nov 2022 14:46:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ql+j=3Q=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ovJg4-0007U5-Sz
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 14:46:13 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69164726-65bd-11ed-91b6-6bf2151ebd3b;
 Wed, 16 Nov 2022 15:46:11 +0100 (CET)
Received: from DS7PR03CA0127.namprd03.prod.outlook.com (2603:10b6:5:3b4::12)
 by BY5PR12MB4918.namprd12.prod.outlook.com (2603:10b6:a03:1df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 14:46:07 +0000
Received: from DM6NAM11FT074.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b4:cafe::17) by DS7PR03CA0127.outlook.office365.com
 (2603:10b6:5:3b4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19 via Frontend
 Transport; Wed, 16 Nov 2022 14:46:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT074.mail.protection.outlook.com (10.13.173.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Wed, 16 Nov 2022 14:46:06 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 16 Nov
 2022 08:46:05 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 16 Nov
 2022 06:45:59 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 16 Nov 2022 08:45:58 -0600
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
X-Inumbo-ID: 69164726-65bd-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDtHfUQbc+TD7SK9VigXUsFa/69dQS0wM2UulAklN21dHHRVue0+q3BgTrlj8Zf2JAQ2MFeX3VIaaQcNvDUoqW40f3pwPe/W1UBEa6JmdXdFPUWZXQqLsDwXSkKy1c6n9m0er4rgWFk6jjd31KglZw1n6mV/HCNkmjI9j82lHuVAOM34V8PAZFRGqG8/wpB2169oJAhGHuM2vqw+PK2eHtmML4vReKU2yTPxca+FX8hU8aBToNrVWH8q2PD+orxwfwgS1umpEAdxAoUmUWNAylw39KX+oTtmbBqK2hb5+yDT9pQZKVGbF6woyiQkn84T6g1z3u5jGJXqznKv0aK8Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2kg0mYJ/BV+np7FuvaiEUyqoTrcgnnJ+v1rzQy5YkI=;
 b=BqHOOtRh2GRBCr9ye11/t+csNfuHj6hmgaHEYqDx0SgqW2pPNRQykpQB9IpZRkUJ2WCtNU4O4hoQllw+kqgmndqjgycnnh8Y0Z8CHNIr7EgYew2uMsXVJ6G6pJBT2dFu+K+i2yqJSsAxbq2dScwlyufTCwHhdqZB7N8VTL4uFZDDqnzL/SlBR4NyNVtzrozSK6TsSo+nb5qRRnNhYIKifsYXcXZJjF9w4ECSRkNFZN1bz5KgSXPcs1MqxsiQCngzqmWyywHUpkr0q1rbs3oHUSVleOtD+/QqRhfvp8Lmq6ZHCLDUOR49y00Rd8Sm9+JT1r+EQaQ6gBT04gJc3hlRKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2kg0mYJ/BV+np7FuvaiEUyqoTrcgnnJ+v1rzQy5YkI=;
 b=i5JzYDQXiKbBmmGal4CS2/3lMgSBhMM6GFkDze5iuDRhBhAdIlWPMsmnZvl7Y4A4wiTaPGEz1RIg3tOiDIYPQWp94JLmfz/L8fCbsQV2HSEC8chjlDSzFJRc8884/ahbRwveFRJp8TjhKe9oBk2skoCloUaEjnce9NCgdPqGFLg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <60cf8d8e-e4d6-2c8b-50ba-ab6c3fe7d84c@amd.com>
Date: Wed, 16 Nov 2022 15:45:58 +0100
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
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <653bdfb0-2926-531b-bb56-d0797fbf3877@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT074:EE_|BY5PR12MB4918:EE_
X-MS-Office365-Filtering-Correlation-Id: ae339b5f-9eac-447e-ad59-08dac7e14afd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iLRg+BCT1RsJ+Ckf05ErhH2NddKCh0UXa6aguoOzfZ36y4DK9TeabpRo09AvDztqrvM5uaDO2ZH2B76ETPv/2HM7EWGUZXlgiFQ2u1NRVq28pT8DoHq5pQrcUdvAM/4efBVPgsq49eCiM9uVxmCp+lDBNusoAahUVwSKHzViS8W6SaNR7pBAeQ4CX62GYv0DqYD9KBennpY8EVXa1OmSxpX4XuAHe0+YfVDtBGeIY6+7lJaAGcKaGOoOLMe34wSVXSQ/zG9+4m5qS/l0fgGpIcIt712inNVbkjPrCuIsuQqYBQD31NDGtOGXjMr3RTpHd1GX9uSei0inVdoUgs0ZkTKbe+AhplmM1OWoIdVdabilPaKi5+IuwzQN1CeGg1qz1UAHRpG3Ef1lYIyt/6cUGDwTF5c6G6sD1gC2ZwVkDvgEG8EwPyALJGKrQpr6Er0qVXr9S9D3FsNdJdG20QdOZYn4n1J0vaMwJeS2TqXx2E7jowvemMDrBmk5wFGTNLexxsKZwZ0wm6o4FCxCc8WKIwYV+96m+z78DznPOqjqk4qVg3wSlPhTskNQr54JgdcVZObTMDec+A6iRr1i5a3Z6PyJUtSwv2/VM1zaNN/jr2M5Vsd3ToizXgz5bZ8ocOeJLS5aLeQkMAlfnSNQU4mxEsVuJgxDqta4LF5S3TL3Zj5umXvT89XdwoMIbyzs6d4FQcYZvju0rerBwlnsHRgEZL/ih80zm30KVLOyzDS1+iZ4hLGcpncUUSkgYNebHcjvNkRJMk2mE6iEteSA4Cp1zmhHzwpX1fOPRuq1VC2+MooD/cdqUYkTs2m8gcpPmSzqwOXsTBjyTYkFnWOrW6WdoQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(39860400002)(136003)(451199015)(40470700004)(46966006)(36840700001)(53546011)(40460700003)(4326008)(44832011)(8676002)(356005)(426003)(26005)(186003)(336012)(2616005)(81166007)(70586007)(70206006)(47076005)(54906003)(86362001)(83380400001)(82740400003)(316002)(36756003)(16576012)(110136005)(82310400005)(2906002)(8936002)(31696002)(478600001)(31686004)(40480700001)(41300700001)(36860700001)(5660300002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 14:46:06.5273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae339b5f-9eac-447e-ad59-08dac7e14afd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT074.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4918

Hi Julien,

On 16/11/2022 14:41, Julien Grall wrote:
> 
> 
> On 16/11/2022 08:05, Michal Orzel wrote:
>> On 16/11/2022 00:10, Julien Grall wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>> On 24/10/2022 11:05, Michal Orzel wrote:
>>>> Make use of the macros defined in asm/pl011-uart.h instead of hardcoding
>>>> the values. Also, take the opportunity to fix the file extension in a
>>>> top-level comment.
>>>>
>>>> No functional change intended.
>>>>
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>
>>> With one comment below:
>>>
>>> Acked-by: Julien Grall <jgrall@amazon.com>
>>>
>>>> ---
>>>>    xen/arch/arm/arm64/debug-pl011.inc | 20 +++++++++++---------
>>>>    1 file changed, 11 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/arm64/debug-pl011.inc b/xen/arch/arm/arm64/debug-pl011.inc
>>>> index 1928a2e3ffbb..d82f2f1de197 100644
>>>> --- a/xen/arch/arm/arm64/debug-pl011.inc
>>>> +++ b/xen/arch/arm/arm64/debug-pl011.inc
>>>> @@ -1,5 +1,5 @@
>>>>    /*
>>>> - * xen/arch/arm/arm64/debug-pl011.S
>>>> + * xen/arch/arm/arm64/debug-pl011.inc
>>>>     *
>>>>     * PL011 specific debug code
>>>>     *
>>>> @@ -16,6 +16,8 @@
>>>>     * GNU General Public License for more details.
>>>>     */
>>>>
>>>> + #include <asm/pl011-uart.h>
>>>> +
>>>>    /*
>>>>     * PL011 UART initialization
>>>>     * xb: register which containts the UART base address
>>>> @@ -23,13 +25,13 @@
>>>>     */
>>>>    .macro early_uart_init xb, c
>>>>            mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)
>>>> -        strh  w\c, [\xb, #0x28]      /* -> UARTFBRD (Baud divisor fraction) */
>>>> +        strh  w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fraction) */
>>>>            mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
>>>> -        strh  w\c, [\xb, #0x24]      /* -> UARTIBRD (Baud divisor integer) */
>>>> +        strh  w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor integer) */
>>>>            mov   x\c, #0x60             /* 8n1 */
>>>
>>> Can we introduce macro/define for 0x60?
>> We could but I think this should not be part of this patch.
>> The reason being, the arm32 code also uses hardcoded 0x60 so it should be changed as well.
>> I can create a prerequisite patch introducing the macro and changing the arm32 code first unless you prefer to have everything in a single patch.
> 
> I am fine with either prerequisite or a follow-up to define a macro and
> use it in both arm32/arm64.
I would then prefer to add a follow-up patch as this one is already acked
and created for a different reason.

> 
>>
>> As for the macro itself, because 8n1 only requires setting bits for WLEN (1 stop bit and no parity are 0 by default), we can do
>> the following in pl011-uart.h:
>> #define WLEN_8 0x60
> 
> I think it would be clearer and easier to check the spec if the value is
> (_AC(0x3, U) << 5).
sounds good.

> 
>> and use it in the pl011-debug files (+ there is a question whether we should define WLEN_7-5 for completeness).
> 
> I would not define WLEN_7-5. That said, I wonder if we really need to
> set the baud rate & co here?
> 
> AFAICT the runtime driver never touch them. The reasoning is the
> firmware is responsible to configure the serial. Therefore, I would
> consider to drop the code (setting UARTCR might still be necessary).
I do not really agree because the current behavior was done on purpose.
At the moment early_uart_init is called only if EARLY_UART_PL011_BAUD_RATE is set to a value != 0.
This is done in order to have flexibility to either stick to what firmware/bootloader configured or to change this
configuration by specifying the EARLY_UART_PL011_BAUD_RATE (useful when you do not know what
the firmware configured).

> 
> Cheers,
> 
> --
> Julien Grall

~Michal


