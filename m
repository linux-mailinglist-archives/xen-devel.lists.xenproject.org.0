Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 782D477388C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 09:22:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579312.907236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTH2W-00086z-9x; Tue, 08 Aug 2023 07:22:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579312.907236; Tue, 08 Aug 2023 07:22:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTH2W-00084D-6j; Tue, 08 Aug 2023 07:22:00 +0000
Received: by outflank-mailman (input) for mailman id 579312;
 Tue, 08 Aug 2023 07:21:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTH2V-000847-Eo
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 07:21:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2059.outbound.protection.outlook.com [40.107.7.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4291032c-35bc-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 09:21:58 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7970.eurprd04.prod.outlook.com (2603:10a6:20b:24f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 07:21:29 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 07:21:29 +0000
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
X-Inumbo-ID: 4291032c-35bc-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYcyGT6CiDUyxag7eSOL8Ie6m1wsdZKFjAIcOQSr0WZTUxGj5cTaMCvvy2hH4cFGdLC5HbYOxC60P/7VCrcLvX4JnMf+BzproeaH5xYU6Q8CeYqLlmjCAp4bphGJbBXG50tuWbw1PDQnAzBXutBqydHXaJdizbWQ6wBFB2CMHEeItDT7zALKFErVue6aoUQPTa/WBhxdprhW3VtM0v6phRAUOblyVs8rJv52yPTWuzsA+W5wssJeIxNscj+xB4ED/zsfaNT++9aBrYFn1VfYNs5zu3Yyaaj0Kk4dg1Xpc9S1LU1Q8Kctybd29NZoSUdFpvnhHcLB8mU+aRAV3Gel7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jpm7zzJKhEBlzZOTLSH5wysuwemJIRZ5GAovXG2lyus=;
 b=ZFyD1XTTEGKjwDY/bittyeSJq1J6xyRyQUgQA0/wva2qUTxLygNpZmannFVU2fMZg+UQcdmbpAF723Ff2k2Kywe/46Z0UsFzN0H9xnrmQiDIQOhi66NcUbM1HC/uSKFt5chMA8PoC+ups9+D7LOgEty0vQ1UvkFx78V6NTIqyITF96UR3rfu6wAzA/MC0vtwJH9jMPXb5/nF3wmcag/b8QrNzJ1K17UzrEXNlI+daFRfygZsllcgRLeCcjAcmafdklbzAMdWWoXCz9duMZ9fVGXP2k3b5mCs8ISPhLVrSXnxtcJ7QSqb7LImHXSNcmA0vxaBzzMx84NxDKhvFchOLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jpm7zzJKhEBlzZOTLSH5wysuwemJIRZ5GAovXG2lyus=;
 b=1EDCVz9h0Bxb7DlwN52N+DWu/EN6KTynmdNydG/tyNjGcmjnc0363c2gwSFnI9+RtcH4qwd1dkElXqDj1FkJFWanDDuuoX6RyL8NDdbdG2GXVkCehD7u+zp+HTnJjDiCL4g7gMKWfSaI/QR5rSHqKOrjKceoWN9JTcfWXt/bbLlXn2kXHEGWiZri9vvjPGSvCDzTv53RGc5+8c4zPdaahPuMqHr+wa98J2JeTBriw7qH7EDIN8RHI/iUAo8ZlOh4Gd7aAF++NrSCGCK3gL3iXucjpHVjltGTiNA9KNPhysT33ba/V2F1gMSHtZfV8oy8tzjR7jMa5HUz0aLtfY/y9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0164b934-cf15-9e45-28b7-b3c9ac2038da@suse.com>
Date: Tue, 8 Aug 2023 09:21:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 1/6] x86: rename variable 'e820' to address MISRA
 C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691162261.git.nicola.vetrini@bugseng.com>
 <896a2235560fd348f79eded33731609c5d2e74ab.1691162261.git.nicola.vetrini@bugseng.com>
 <9e2b0b7d-2c9c-b4db-fb91-1a43ba8e8294@suse.com>
 <838a53b9ef4a8d258feceabb4c811534@bugseng.com>
 <742f4a4a-5938-82f5-7e76-1189a2519063@suse.com>
 <55599ec7a1c6d07af6093920fe3f9125@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <55599ec7a1c6d07af6093920fe3f9125@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7970:EE_
X-MS-Office365-Filtering-Correlation-Id: b45fa1c7-73e7-4155-ea7b-08db97e01557
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iSc1aSeeSiTj7XtnIHcQiUiT4mHTxxee0Tyy4tkHx64NyOuMk/UgzsyDI+XFqf+kmwiGQVkY8HyyWllqsCVjTl26jWPvnsIjyOs8b8t5s4bUGxLrr3cd6NMDjT3l5BxDqrsk3X5pZqxskBRDzZ/j3HABrCgQWIVVrr1OgpV59Sg9TllEZa5LfzIH6lHlPumpULPLm3hEAzudqsttpEpO/9j4itzHrjZN+2Wxp+5a8kSOpAekr6WznEQwZXK2hHuOAtwVFS+ds2aRdr53pOtm15wiEDyxlZDPTp+QFYCR9T6pxKOAU0O6wKIP/v3Ee0bsMUiGCntKsZ4sf5kighX7JQfyZMAT+1cFNPWAlILZ33y3QHf3NEdkeXt+AU/5As1P9gD5nHBHbIL0AIbt47VunBMh/MtyIEYWsTDHb3goH8kFrEQVYaTg2RHh6SB6IUonmletxVuAUx03RAFPLMnyTgLnt1945Sb+FZjwAZ6cUBEKssUCbhHWZisjdoNdzazdTS038gDX8gOatWV9wfAVTqL98ToKhD8GzMJPaQCiLbgXIuFQMEJizTD3Eu+LI3DZKLyovTmwn1b5C2A03kEYzKv6KDplTF42yqz33a6x2IDXqjx3E/whrIpRfufinxCRCLNOFgz6RudOeXSZ2iU/eNzNSgeZhswz/i6lEAAwuwA7kogC12xjhczwTxxHO/283t+GOfEp+/BO7nUlAQ30uQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(366004)(136003)(396003)(376002)(1800799003)(186006)(90021799007)(451199021)(90011799007)(6486002)(478600001)(83380400001)(31686004)(2616005)(6512007)(26005)(53546011)(6506007)(8936002)(66476007)(66556008)(66946007)(316002)(41300700001)(4326008)(8676002)(31696002)(2906002)(6916009)(6666004)(36756003)(54906003)(38100700002)(86362001)(5660300002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWx4Z3VBNXdzV1pSaTZwNWl0cTJYMjU1bnhxRllEdytrQzVNdko3b25VanNL?=
 =?utf-8?B?cnN6bTlrWTBLZmZhSS9ZaEdyK3BhZkUzWHh1K1k0WUpPR3daaG4vemlnaE1U?=
 =?utf-8?B?eVhZeUlmL0JGLy9JOU1QaVhpczRZd0dLVnpDVXZhK1Y5eVRQNk1oTVZ2dUFP?=
 =?utf-8?B?bHd3alBUb0pTSXBzNlRaYkEzSkYwMW9aenc2eCtSNUM1WXptWGw1YjE2ZXBB?=
 =?utf-8?B?dTdLZTJDb01uTjFYYk1rMEtPR05ZSngwS1RIbkxreFBFR0RybHJpQXNqVU5H?=
 =?utf-8?B?MWFvVXozQ3RaMEhGZUNmbGc0WTFSNEpucDlOcEFwNU5tdjA5Zlc1Q29SYUdn?=
 =?utf-8?B?MjlxY21IbmVNVTkxOUNZdUxUQzAzRFB3V093eTRLeVlnTnhCZzVtZ3ZQZkZL?=
 =?utf-8?B?WkFONHM2cWVwWTJOMkxOM0pIclFGZG9rRm51U2VHb2VLc2pUakZuMnd6VjJv?=
 =?utf-8?B?RmtqTkNKMGQ0VUJ2VGRpck5IdTgrVnJDOUliUC95bzlOS0w5SnAvWE03clJs?=
 =?utf-8?B?Z1I0eGs5dDc0QUpkWDRhZVpQdnhkL2dqbFg0UGl0M1orZEQ2YzhYRFlKRXdH?=
 =?utf-8?B?WHR4TTdQVVlIV0NwSWplcm9xZWxCNHZCSUwrTUczRGs4dE9rdThkZkNzQU9H?=
 =?utf-8?B?UU1BR20ydHA3SUpPRGdmT2pFajl1TjVockpQQUFWNUR3bXE4U3N6alRGZUlo?=
 =?utf-8?B?RnlYSEFab2dRTU5Ebk9rZkVzQ25aTUFjSXM2ajcvcmFuMU9OVi9hQzZZdlAr?=
 =?utf-8?B?Tm1KdU1Ha1hvUlU4K01WdkV6NVZ2QlJXSWlxOUxGTkJzTmxmOFU2TG9IVnFk?=
 =?utf-8?B?NHZBc2E2ZHFsU1VzM3R4T1hpMCtIVWJzWTAyRndHaXc4T05ZWWNPS1ZHdkhn?=
 =?utf-8?B?L2tKcGgwa2NQYVlHZ0trcHloTHczL0M3UUFOc09MbmpXVUo1MHdLZUsrK1RM?=
 =?utf-8?B?K3o2ZkZPa0daK1BVZlJOaWdXUDY0eWlHdjAwbVN3eGdQYTBzcFNUYmRkNzNL?=
 =?utf-8?B?YVF3ek54UEI0cGhLZUtYalFnenZBNHgvZVhwbkpsSnpGWHQ3SHJ6Z25xdENH?=
 =?utf-8?B?YlhWUEZBcGxYZzBmRE9EUGpJbEI2WUlsaXM4T0c1UVJUR25rMnduQkRnNld5?=
 =?utf-8?B?dEt3MWQ0clFYTm9RMFhtNHAxQm5aRXNGTGZEUEV2amNjOGpZVjRxSy9GYzVC?=
 =?utf-8?B?LzVsMXExUDhJWjI4QnR1Tm9DQ2Z2SmQxQStGY3NBanNJQmtrd1RoZnRZbTU3?=
 =?utf-8?B?YklKMTRLRGdyMU5CV2JJWGtSa2ZiVXJ3TFJiYXJRYkh1SHJhTS9LQm81Tm9h?=
 =?utf-8?B?WWsxNlVHaS9hNm1QaUlRNjRtVzF3T1VyaFJ5cHFsdytObjI0TXVHSWtJL1Z3?=
 =?utf-8?B?d0N4U2lJZFhkNUUyTjlWYTM2bUtYUUVvOHFqcVFhNDgrVldnQjkzeGVYT2t5?=
 =?utf-8?B?NVdCVUQxUmtsN0xWY3R4eUFrcTFJTDg4bmxDcU1xVDlyb0NtdXZncXpmVlA5?=
 =?utf-8?B?QTRBUlBzYVFBNmxLVHF0eU5HTGdrNVg0a2wxWlNxaS9qRzEwRDR0dUxCWWZT?=
 =?utf-8?B?STU3YkJXMmxoQ1BUYVFSRndhWjFHQ0pmNER3N2FmSEJmZm1wYmE2ejloejJ2?=
 =?utf-8?B?bXhQa2QrS0lUemNtM2h2RzAwRzZRV2VZZjdGMW5SanhBQnM3THBYS040dHBa?=
 =?utf-8?B?ZkM4TEo1SEZWYXdKaHpjRGlVQk5WNGtOSGd6M2Q0NGpIczhMYWdaK3lvWXFz?=
 =?utf-8?B?Q2QweUpmZERuSUdKMkdwZDFFRU9OUkJScUxFQlN1ck5tRnM5amphUEMwWmN3?=
 =?utf-8?B?Ty9pTFdBbjQvQTRQcXZqZVpQNHhuT0h2TkYzTUV4bHYxUzhPeDlHMWlRRENt?=
 =?utf-8?B?S0FMbEk0SElpYTU3cTBVN2EzbHZKSm5IYy85ZkpEdmo4cVZhaUpYR0NFemdz?=
 =?utf-8?B?d3Y1cmtxeDRPN0tlS3Ixc25HQ3pMMytxM3QrUkpYa2Vsck9EZlNBUmZMcVlt?=
 =?utf-8?B?SCtiMk9NQnlxN05VR0grZzAyRU1KejhReTh5RXZBeStPTVJIcUF1bW9yeHVI?=
 =?utf-8?B?d0I2dW1FamNOdzVOcW51OU1ta1F6c3FMb3VoQUc2dm5kVjJGQzd5SWdKWHZt?=
 =?utf-8?Q?jErA4/a7gIag6jokxWhwNFo5a?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b45fa1c7-73e7-4155-ea7b-08db97e01557
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 07:21:29.0849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pet60bjFxa2vUOkXw5oVi+TpV6jOzvXSU3H2b/YBFXF++nGTtfWEfefOzmoPwsOWvmIT2JhX6VbRTXlXVB8Zhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7970

On 08.08.2023 09:08, Nicola Vetrini wrote:
> On 07/08/2023 11:10, Jan Beulich wrote:
>> On 07.08.2023 10:59, Nicola Vetrini wrote:
>>> On 07/08/2023 10:09, Jan Beulich wrote:
>>>> On 04.08.2023 17:27, Nicola Vetrini wrote:
>>>>> The variable declared in the header file
>>>>> 'xen/arch/x86/include/asm/e820.h'
>>>>> is shadowed by many function parameters, so it is renamed to avoid
>>>>> these
>>>>> violations.
>>>>>
>>>>> No functional changes.
>>>>>
>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>> ---
>>>>> This patch is similar to other renames done on previous patches, and
>>>>> the
>>>>> preferred strategy there was to rename the global variable. This one
>>>>> has more occurrences that are spread in various files, but
>>>>> the general pattern is the same.
>>>>
>>>> Still I think it would be better done the other way around, and 
>>>> perhaps
>>>> in
>>>> more than a single patch. It looks like "many == 3", i.e.
>>>> - e820_add_range(), which is only ever called with "e820" as its
>>>> argument,
>>>>   and hence the parameter could be dropped,
> 
> I see another downside with this approach (I should have spotted this 
> sooner):
> Since e820_add_range and the other functions expected e820 as a pointer, 
> they are
> written like this:
> 
> for ( i = 0; i < e820->nr_map; ++i )
>      {
>          uint64_t rs = e820->map[i].addr;
>          uint64_t re = rs + e820->map[i].size;
> 
>          if ( rs == e && e820->map[i].type == type )
>          {
>              e820->map[i].addr = s;
>              return 1;
>          }
> ...
> 
> Dropping the parameter would either mean
> 1. Use a local parameter that stores the address of e820, which kind of
>     nullifies the purpose of dropping the parameter imho;

This isn't an unusual thing to do; it is only the name being short which
may make it look "unnecessary" here. But especially if the local variable
was made of type struct e820entry * (and updated in the for()) I think
this could be useful overall.

> 2. Rewrite it so that it operates on a "struct e820map", which would 
> mean
>     substantial churn;
> 3. Make the global a pointer, which is reminiscent of (1)
> 
> All in all, I do like the global renaming approach more, because it 
> lessens
> the amount of code that needs to change to accomodate a case of 
> shadowing.

Well, to go that route you need to come up with a suitable new name (no
prior proposal was really meeting that requirement) and you'd need to
convince at least one of the x86 maintainers.

Jan

