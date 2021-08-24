Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6C23F5804
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 08:15:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170687.311557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIPhx-0000vp-W9; Tue, 24 Aug 2021 06:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170687.311557; Tue, 24 Aug 2021 06:14:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIPhx-0000sO-SE; Tue, 24 Aug 2021 06:14:49 +0000
Received: by outflank-mailman (input) for mailman id 170687;
 Tue, 24 Aug 2021 06:14:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIPhw-0000sI-Df
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 06:14:48 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 949b9064-04a2-11ec-a8ab-12813bfff9fa;
 Tue, 24 Aug 2021 06:14:47 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2054.outbound.protection.outlook.com [104.47.4.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25--_Tb8paVMyeJct6Gv7N9qg-1; Tue, 24 Aug 2021 08:14:45 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB5218.eurprd04.prod.outlook.com (2603:10a6:208:c4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 06:14:44 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 06:14:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0101CA0057.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 06:14:43 +0000
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
X-Inumbo-ID: 949b9064-04a2-11ec-a8ab-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629785686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SedVO7fKHJffm8XxMC1S+DrN/iYMpNZxWPJq3WwUt4k=;
	b=hQPIUKzfIixaSmu4kqsBm5mUtrMOS2R3wxOhKgojnNtf/79/MKKGTw2afE9+KIWn3F9W5I
	nFo6hBCTLYK2HszSuKN/Q72JRVSeamr3h7NvkHgaoua+kSOpR09TKa/7HAW7MTH8NRaWHL
	tCADqsmsJViU40aIyOSZ0F2jVOUBclI=
X-MC-Unique: -_Tb8paVMyeJct6Gv7N9qg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUa1Be5BEtNPhmWcSUwQBY1f5yd3vCk13v6PUZRsko82fJ63h8OpCJUHcU+s7lanJhfztbyTrHHXEN0ztksHGifTHi31jFzvJSeVTFiJytepOdz1LX9CSualVOnNqiCOxfEE0escXs/y6iOjkA8ukGTB1qBiCeZKX3jEGcKk07hyJKApLSw6g6JK2rAKcs6Bc/gOgjrszbwGh6NGQiYIFcquzylq7wgJh7EIsH8v4rITMIXhc+MOJqZ7uE/tJnd5vGnoUpqmMrQd0WIUOkX2vmVI1yvA9x64YYoSxAy3+EJRCpIoYuaR8T15ZXhSb9Lkb/2rl05LSDn4GZgwLrFTMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SedVO7fKHJffm8XxMC1S+DrN/iYMpNZxWPJq3WwUt4k=;
 b=ISBKKIzOfPoJk/3FiHqBEmRMys5HJLH4C8U/YbjGY7KAOxKZvvisD16RKc6em7OCXYUiDREpcOERgySZ7pFnIclmXLYzveGR7M+zSwmSRgz2b2UPAPXHvLp4MJEZ+myeX3p4lhjIl7pk+/VJ7UaUFYnx5rm4LLQW9prsWlElHkLkgMyWG/1UPLNBFh3aMvHvmOC/5ThyENhtod7JZN9pPlcWR9tV9yin6Ak/7Ck+TKvi43u+i2CE6Eg73CJovDU0QuqTDgeGPtqno6y1DF+lp/NHpANAvNAZLl2jBqOMcRXt06AHNsMDtpW7XBLcIejC7Hq+BfLYe8azwA6lZIvHDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: Xen C-state Issues
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org
References: <YSEo9Box2AFnmdLZ@mattapan.m5p.com>
 <dea9cf97-9332-b1c9-2cff-d87564832529@suse.com>
 <YSSFffDK5/5MUAdj@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <09fc5490-5b14-474c-dbe0-864952f19a33@suse.com>
Date: Tue, 24 Aug 2021 08:14:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YSSFffDK5/5MUAdj@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0101CA0057.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::25) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a56e025a-fe31-4ff1-e3ee-08d966c67716
X-MS-TrafficTypeDiagnostic: AM0PR04MB5218:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB52180F7D3D065B52650E4C33B3C59@AM0PR04MB5218.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q9PtgqMlvHadx15e5b2ZuLsszzJfTnnt6uUCOFKAj8+M7W6siFTFD0Jxj6WE8OiOOxMCojLvExS2jxdfhNpOgl8OdKYXFSgy6WctwSZ6NCUhrf/4lZnX/h7WuxYRQxW+J9dJ6Yc7i+K4M2YcnfxixCJ+T1jNjLTU8MI5mkrr7tLxJpuaQryMSMPwo1Q3To0DbKAgKp+BJ+oNHRmlJswvviAHjv9uBArSDgplnFIhrHiUjc5CatCuh7/hS/uNWNZNIogJPHtaFUBrndUMNdQniADcGGeMLBVISQftARM2JUumYyXAKhsOT5oD2refM1O8Qt4or198O7+44aevX3Cnl/0rJgcJHsysSYQah2DincNukBglaPLhYJHYSZIeqwsxtbMTftSBy4W3I/jKSHgAk/6sKkamnc7rPXgyFzc3HUKeJNzBg2PMRIMpIiPL/d0B/o/AhstXWlkVlP8tUS6jTqdowH8GR5Nrb4muM0x4VkUujp7eYMeA/ci/cx96wuBL8I+lpA5waTxYXZ86sL/3XsqRpDtQW5vNBY232oEzvkzKnBATPzBC9HfdBTYfMMstpzXkdlAZnMz3AAOrHvt3H0y11NKWSTrLInnFNGhVHHCyjGo4KVgyfzMPfxvX8HkhMwidjxqNAZ4rAem+AveWea1KCWf+WWxZyO9vsRcBRgQylu3CMX86RnrOLIwljAag6ddi3HKVsD24MPqy9b+vXQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(346002)(396003)(39850400004)(136003)(2906002)(86362001)(6486002)(53546011)(66476007)(31696002)(186003)(38100700002)(956004)(2616005)(8936002)(31686004)(66556008)(4326008)(26005)(316002)(5660300002)(3480700007)(478600001)(66946007)(8676002)(36756003)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDYzdHhYRTRkc0huU3AzMlNaYkNZZ3dnejllOERuRUFsSEE0UXliQlBQZDdR?=
 =?utf-8?B?cjM0TWNnQ1V6bWhONDRuZEpIa3ZNMXEwalZVY1ZXbjdKTkVTRzUrYVpZSDQ2?=
 =?utf-8?B?b2ZRNU83VEhnQWFmQUhWUEcvY0RYZ0FuNFROQmdFbnVIbGZmb1dEWHFRUFll?=
 =?utf-8?B?djJJKzZ0UWQxQVdTdlN2TExLUXlybi8zZmtiZDVaZy8vWnRlR1Q2MVp1N0ov?=
 =?utf-8?B?QnUvMU14Z3hNWStSM0hxa0NNYncvTWxHRlVpT2tTRG5idUcvVFdVS2xpdXB0?=
 =?utf-8?B?ZmUvcDBnUTNmaHFPQ3dxNng0VkhjYXcrbG9DM200bld4MzltOWN2MXQ2eU9w?=
 =?utf-8?B?ZkNlTTZUT29qZU9BcC9TYnpRelVnZUNUNWh1UFlKbHI3R2N5S00yVG52ZnJT?=
 =?utf-8?B?OFVrcjliY2VaOHJYeUV2ZXM0TFQrVWRxNmRTNmI2WFVJb1Vvd0RubEZQa1Iv?=
 =?utf-8?B?UER2cVFaWmNJdWhRdnVDL0VCbmIxcWowV0dGSG9DenA3L1BrbzVyaEt2T1Mv?=
 =?utf-8?B?U3lXYVR1ZE9KS1pybHMrS1hnSDJtZzJidHhjWlBLcnpiL2N0MDZyZEFQN2h2?=
 =?utf-8?B?dWIzTXRaWU5Xd1E1djM0VWtzaDY5dkFiRElQYjFkZnNPY3NqT0ZVYnJIZHJX?=
 =?utf-8?B?djY0MG4zWkZXcjdDQzZWaGJkRER4VE56V0F5QjJJQ2lOQnBFdmtrbXB6R0NW?=
 =?utf-8?B?eWQwUXBSbDQzcVhyMXcybGhYZWNUelJhTXMzK0JiUytkaktPRjFEbUFETGI3?=
 =?utf-8?B?MXdZZ2FCZjZrb2JuSkF6NWVxZzFjWFRqU1lzUTFXdUhTdXczS2NWTWdON1Bk?=
 =?utf-8?B?d21ja0pxdFhLUXN2dTNCNkkvQjlNNG9CVlRIOGl0dU9MWEZ4NVFQOG1JdmlR?=
 =?utf-8?B?NHNCRDhabzdBSFpWQTVvMjNjc2JYRkJ1SVFWM2tVT2kyRzVpWnFrZFc4YkRU?=
 =?utf-8?B?RkFmK1IvM0FIMHZrT05GSkFuZGlhSkxYVXpSbzd0WnpGMko5VkdsTEtkSzBF?=
 =?utf-8?B?Y1dxbWhDOEJ2ei9uVm5IeGJMWUpBRUVOR01uYWNuZ3ZIQ3I4c0xhekhCbkpQ?=
 =?utf-8?B?SjYxSDMyUmVsQkNHd3NGcjdvUDNwZENzcXZLcU05MmFhQlFEYjI5dTI2bmpT?=
 =?utf-8?B?dmVuRlM0YWJvUHpWY3ljem9aTndCbWFtZUlST0pyc3VwVEZob3pZN2ZJWEJl?=
 =?utf-8?B?ZWFsZC9rd3BJNUhDbDZXOGZ3ZTZHVCs1WTA3MldxYWN1cVY0NFhtTEVCVGE0?=
 =?utf-8?B?WDdnbzF2a2ZHaU5GV2JYcUdlQmFaZ01jUnJGTlh6QlpsNXozclhIcS9jdi8v?=
 =?utf-8?B?anJ5TWM1eENTcEFKQzZ1R3BZdlZucit0Q3p1SWx0MGdHUHFQQVZ5bTVGWXJk?=
 =?utf-8?B?aDNHUzd4V1RETEtxVmVLRnZNRUZWZkJCUEZGYlVacDMrbWhwWmhyS0hWbDhP?=
 =?utf-8?B?bGkyTXRJVk0xam1EcW0zU0ZBUVYzWGNrTUVDcDRra212ZE1TelFDa1pQK1l4?=
 =?utf-8?B?VUxjRWh3akVNbUdBSUVFdExvZnFnYTNvV2VvV0FaTVR2NWVvSGNxNmltUXpY?=
 =?utf-8?B?T1J0akVSd3ZxNjNWNExVMytwMVY5TEVWWmdZT0xLSHhVWFlxN2pIemxmSGJ0?=
 =?utf-8?B?a1Yyd044bGtJYWJWeVIzSEcvTjdEcHVoSlFlYXZGVzU0MjlrSHNOWFMzUjRP?=
 =?utf-8?B?bVlLMzg1YlVMdjRZVVFtdWkzSmxNVnh0Q1dBWDErbGZzMHdwQjZMbkdyai9K?=
 =?utf-8?Q?KGhrEw8ZDBOCYO0aMwb9X7chh93qx661bpy9y7O?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a56e025a-fe31-4ff1-e3ee-08d966c67716
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 06:14:43.8721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJ/Lx2IH0K0nLMKBJcO8YU8ISvAQR2rktmw4u2W6BDFxC2ObFUmM0Av5gRXavO6U6xllgaevoZCMI0kBNYNmmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5218

On 24.08.2021 07:37, Elliott Mitchell wrote:
> On Mon, Aug 23, 2021 at 09:12:52AM +0200, Jan Beulich wrote:
>> On 21.08.2021 18:25, Elliott Mitchell wrote:
>>> ACPI C-state support might not see too much use, but it does see some.
>>>
>>> With Xen 4.11 and Linux kernel 4.19, I found higher C-states only got
>>> enabled for physical cores for which Domain 0 had a corresponding vCPU.
>>> On a machine where Domain 0 has 5 vCPUs, but 8 reported cores, the
>>> additional C-states would only be enabled on cores 0-4.
>>>
>>> This can be worked around by giving Domain 0 vCPUs equal to cores, but
>>> then offlining the extra vCPUs.  I'm guessing this is a bug with the
>>> Linux 4.19 xen_acpi_processor module.
>>>
>>>
>>>
>>> Appears Xen 4.14 doesn't work at all with Linux kernel 4.19's ACPI
>>> C-state support.  This combination is unable to enable higher C-states
>>> on any core.  Since Xen 4.14 and Linux 4.19 are *both* *presently*
>>> supported it seems patch(es) are needed somewhere for this combination.
>>
>> Hmm, having had observed the same quite some time ago, I thought I had
>> dealt with these problems. Albeit surely not in Xen 4.11 or Linux 4.19.
>> Any chance you could check up-to-date versions of both Xen and Linux
>> (together)?
> 
> I can believe you got this fixed, but the Linux fixes never got
> backported.
> 
> Of the two, higher C-states working with Linux 4.19 and Xen 4.11, but
> not Linux 4.19 and Xen 4.14 is more concerning to me.

I'm afraid without you providing detail (full verbosity logs) and
ideally checking with 4.15 or yet better -unstable it's going to be
hard to judge whether that's a bug, and if so where it might sit.

Jan


