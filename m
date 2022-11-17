Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1E362D516
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 09:35:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444799.699866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovaLy-0000hy-IQ; Thu, 17 Nov 2022 08:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444799.699866; Thu, 17 Nov 2022 08:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovaLy-0000f6-F4; Thu, 17 Nov 2022 08:34:34 +0000
Received: by outflank-mailman (input) for mailman id 444799;
 Thu, 17 Nov 2022 08:34:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N1RQ=3R=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ovaLw-0000f0-P8
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 08:34:32 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e88::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6aec699-6652-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 09:34:30 +0100 (CET)
Received: from DM6PR02CA0114.namprd02.prod.outlook.com (2603:10b6:5:1b4::16)
 by PH7PR12MB6812.namprd12.prod.outlook.com (2603:10b6:510:1b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Thu, 17 Nov
 2022 08:34:26 +0000
Received: from DM6NAM11FT114.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::b5) by DM6PR02CA0114.outlook.office365.com
 (2603:10b6:5:1b4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Thu, 17 Nov 2022 08:34:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT114.mail.protection.outlook.com (10.13.172.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Thu, 17 Nov 2022 08:34:25 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 17 Nov
 2022 02:34:21 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 17 Nov
 2022 00:34:06 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 17 Nov 2022 02:34:05 -0600
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
X-Inumbo-ID: a6aec699-6652-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdzCeQXWxTHV1nq7C9MhEMZRBKKnXxAOYd416t9DeVrfdpJF86odmNFfWBmUfqqPbqdJVLiC1trDX3n4sU17gLEG7MKojeQHHNOENQqauFUdScfayQGf3yV9w9Uq12oUODrGnnL3dxBXMSIcf2ze4NZ8ZAqpKvJD/uW/UKQoepXRI0CLacNJQqOE0cwX0iQ0snscJpIhSUturhzLmTrfmtmLBKt39tmOxLyeFRq+o4pzfjWjT4VxCYCLOrwz34j0a1NXQnghySx6Uf3NlFBoDz9T8/LPt7DXoZcsiJaS1VtbPAjuOZ5lxltO+1uokCbMP1+BZidbtB4++Yd4404QWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzOEbdn0xBg0ivQIQOKUgjDWPTyiibqvuwEaJmwY3Tg=;
 b=QyagpDsZXludAfYaukqLys4yyUhHqqw+krhxqa3tJSesGS7NFL8tnhO5rxvnx5rG6i46wpRJb1/+MrfLTudfpcCsfwcSBojns62XGJr1I8+hpYhUuk8fcIe6DJn5WDwpCetgRuyiI0vBcI62Pvopu6U5pBqnCnqW40EZB2G6HxU9QyNm5/E5Pt2iV/G7xmdC7AvbInGMlRWGj5Ka4LDBbvWkFZyKDwBmkDQ7eFb77WmTv8UQwT1gInRl45WkoK9dqbYKIAKB2Va+kQblrtNc238cV42xTJ5Vyj+ZGKU0OTditGkoaSn5Cp/8TPrUMnlLL7L20F8WBnoDZJ3MHgmvsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzOEbdn0xBg0ivQIQOKUgjDWPTyiibqvuwEaJmwY3Tg=;
 b=5ubRvRmAGccKuAmEiuXtQo1mSEEkpvtXCJ+z/3fOePIKAEy42xgXYH9eswmSyiP1s/hCV5b3NYYQQ5FTHewj9s+0oZtoWBzy2n607RXjxabKESCkahYoM/9CT/B5iegLikRDjQvwWetjyXVF/4wWVAxj7GbLoZjQ5I9paNrwUjk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <85f4f42b-b1ee-36bf-5ba9-21b1047351cf@amd.com>
Date: Thu, 17 Nov 2022 09:34:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] xen/arm: debug-pl011.inc: Use macros instead of hardcoded
 values
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
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <84710d96-c473-fa41-d847-2b109dfb49c9@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT114:EE_|PH7PR12MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: d4fdf15c-c5a3-49ab-85b2-08dac87688ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ur6BNWcCrtC7GIoVcINAnSBVnqoaNvlj04k+Rj4kFUJmfCtv57nc1NSC8f2cSPqgdPnTrK4kUW/tERhLrTqyywVF2SYGq7fvK96G+UCWuCYZsOcdt5Vz+Ymoy2pZpj2Gpq0yMifaRMSzlrZE6dsqVlWEIq9Q2tB+SYy/NWbR3Yjx+Q5wGebHnte2sk1XcdA+qU35naO3He2m9XnRoHhhWCcAjc2a1t6GTtoouHDr3oD7ALKjRrFVltbzt4WDSlFa6n/4M/KJLKvYn1p4rRMTdIzIbHBUHYir1e6cA0iy6eXLRHVbMSg50ThlwK1wYOhzTnKsdanYZL/NvhokhXXDf2A4OgAFwTavNjDC/9PUBG6vrlmkMqAEUunt5oQgOHwI4CwiX4FQjdXpQMw34oXofBqQQW3nBjFkvokWa/alEIsxOhz/3I04zjw7ZdG2oHWVLrqUJJhp2iEVr4uMnnVeEwWdf2lWvOqOOYJ0je6eJ75ZsNzgxOHA7bi0N2pmUtePCxaei1adpRxmfQidfb/uh+crYykadhQfXPr7AZS7dJ2L/8mNyNhvWFUPln1O7UXHXoOJw84D3xS+KLcd4FaOau/YcmojwvbV2YaGwgx+3k8NxZvuSNPuRGFi4A/T3sQAhYmRIh5fZ5K96muiG19FAzM13s5aoYU7d2svz4OYUwNJzqiUoPFd/EzgjYcMXugeHktPSr6BNXgqRw/jVDkL7bLhnx09y5R4igBtxiBC8fTHYmo7q96Z4i32nHVjeBO0rOupL23delBiHIkRvzpy1w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199015)(46966006)(40470700004)(36840700001)(36756003)(31686004)(31696002)(86362001)(81166007)(82740400003)(82310400005)(36860700001)(356005)(186003)(83380400001)(54906003)(2616005)(110136005)(426003)(47076005)(2906002)(26005)(44832011)(40460700003)(53546011)(478600001)(8936002)(5660300002)(336012)(70586007)(40480700001)(70206006)(16576012)(316002)(41300700001)(8676002)(4326008)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 08:34:25.4660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4fdf15c-c5a3-49ab-85b2-08dac87688ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT114.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6812

Hi Julien,

On 16/11/2022 19:37, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 16/11/2022 18:05, Michal Orzel wrote:
>> On 16/11/2022 16:56, Julien Grall wrote:
>>>
>>>
>>> On 16/11/2022 14:45, Michal Orzel wrote:
>>>> Hi Julien,
>>>
>>> Hi Michal,
>>>
>>>>>
>>>>>> and use it in the pl011-debug files (+ there is a question whether we should define WLEN_7-5 for completeness).
>>>>>
>>>>> I would not define WLEN_7-5. That said, I wonder if we really need to
>>>>> set the baud rate & co here?
>>>>>
>>>>> AFAICT the runtime driver never touch them. The reasoning is the
>>>>> firmware is responsible to configure the serial. Therefore, I would
>>>>> consider to drop the code (setting UARTCR might still be necessary).
>>>> I do not really agree because the current behavior was done on purpose.
>>>
>>> EARLY_UART_PL011_BAUD_RATE is only used for very early debugging (this
>>> is protected by CONFIG_DEBUG and CONFIG_EXPERT). This is not a
>>> production ready code.
>> I am fully aware of it. I just found it useful but I understand the global reasoning.
>>
>>>
>>>> At the moment early_uart_init is called only if EARLY_UART_PL011_BAUD_RATE is set to a value != 0.
>>>> This is done in order to have flexibility to either stick to what firmware/bootloader configured or to change this
>>>> configuration by specifying the EARLY_UART_PL011_BAUD_RATE (useful when you do not know what
>>>> the firmware configured).
>>> The chances are that you want to use the baud rate that was configured
>>> by the firmware. Otherwise, you would need to change the configuration
>>> of minicom (or whatever you used) to get proper output for the firmware
>>> and then Xen.
>>>
>>> Furthermore, as I wrote before, the runtime driver doesn't configure the
>>> baud rate. This was removed in Xen 4.7 (see commit 2048e17ca9df
>>> "drivers/pl011: Don't configure baudrate") because it was buggy and this
>>> code is not simple.
>>>
>>> So it makes no sense to configure the baud rate when using early printk
>>> but not the runtime driver.
>> Ok, so we will get rid of EARLY_UART_PL011_BAUD_RATE config and setting the bd
>> in the early uart code. Now, what about setting "8n1"? The runtime driver sets them
>> as well as the early code. It can also be set to a different value from the firmware
>> (unlikely but it can happen I think). In any case, if we decide to do what the runtime driver
>> does, I reckon setting LCR_H should be kept in early code.
> 
> Good question. I think, you would end up with the same issue I mentioned
> above if the firmware and Xen have different line control registers
> (tools like minicom/screen would ask for it).
> 
> So I am on the fence here. In one way, it seems pointless keep it. But
> on the other hand, Xen has always set it. So I have no data to prove
> this will be fine everywhere.
If we are relying on the firmware[1] to configure the baud rate, it is not very wise
not to rely on it to configure the LCR. Looking at the other serial drivers in Xen,
we have a real mismatch in what is being configured. Some of the drivers (omap, imx),
apart from setting 8n1 also set the baud rate explicitly to 115200 and almost all of them
do set 8n1. In that case we will not benefit too much from fixing just pl011.

On the other hand, Xen follows the zImage/Image protocols for ARM [2] which do not
state that serial port initializing is something mandatory. This could indicate that
the firmware does not really need to configure the serial.

[1] It is not stated anywhere in our docs.

[2] BTW: our docs/misc/arm/booting contains invalid links to the kernel docs. I guess
this wants to be fixed.

> 
> Cheers,
> 
> --
> Julien Grall

~Michal

