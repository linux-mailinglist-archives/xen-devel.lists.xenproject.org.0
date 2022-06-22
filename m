Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFC45545D9
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 13:45:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353806.580792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3ynM-0003Sz-At; Wed, 22 Jun 2022 11:45:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353806.580792; Wed, 22 Jun 2022 11:45:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3ynM-0003Q7-7m; Wed, 22 Jun 2022 11:45:16 +0000
Received: by outflank-mailman (input) for mailman id 353806;
 Wed, 22 Jun 2022 11:45:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o3ynK-0003Q1-9I
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 11:45:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2068.outbound.protection.outlook.com [40.107.22.68])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6a258f4-f220-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 13:45:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0401MB2470.eurprd04.prod.outlook.com (2603:10a6:4:35::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Wed, 22 Jun
 2022 11:45:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 11:45:09 +0000
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
X-Inumbo-ID: c6a258f4-f220-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ve7+wSibFQnMqErN57DDewXrexvysNbPM/L4AGESjeuZPLSHsO7tQw1A//aKDkXQtlUo50mI/ZeWHv3xBKraY7D3bzyP9yuAHeoKHxmZJ7W0YHrerFtma3yLSAO+1zfuMmy9WsRhMtnabZyHpRqPd8OLeXh+J/rmC2kFhdiRsiF4nK76kLw9D8IIEvws1E/aLnj3xxSvSSXDbKYIlI4SxGXCC5waWJHi/ndDsNWvDcHNuY7lygJoc13ytWK4xIxS4Ow1mTx8EicdxpQ+v9+pRbAHcXvidliiYFJNKvrqs7ovqmdzZnIHDENyOD4eFHxE2mCDS65I7Knew13ZLtORLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ruDuU7s8jqWCHuZ9KyMVhPKXPTUir8i63pED/xwDmM=;
 b=CbQ6za2HneH2rwtw/rBCpzKNJUJTk0+3RoQoWODg+44j4o9xeY5c4Zg4t0D49fmkm0sfeINJVJuMqC4ZCYaPL+0xw1nyCENQUiL39JO1wkoRHj46NAMbsRi+FhCabkBuytaP6ccbq5UIdiwP5TuNbjJmKp6alhTnEd6hjUJBoYYL8mGt6Il5LW2V+4mwJw8U25d1TxAypafIxZuBddlFP8UqghO1JJgYRYu3w/DPlTHfboBfuqSnwnrWPXz9TQNNCZ+vY2gcXuIAAoLgAsLQegNyTGalBi3CKbI7DrIW0kJnSqN480Duny4Qw+n/KOOEoq6UALVoUgJ/oKgYgUXevQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ruDuU7s8jqWCHuZ9KyMVhPKXPTUir8i63pED/xwDmM=;
 b=2uulOCpMS3xP6nwunapSdbG62redbLiG07k3a3nLR68bkSVq2FqDNRrGiJy59VNubpWfAZtKuTKcDTKhkXT5vzWmUj74GgC94zQfXcSA1V8DRkrvsOhLI7FwUR5mElloC9c53A8VeavI9Dp8JBzaLTtYpdE5ql4Oh1WYvSLsbi//rNns/ixLaut2mXmPL4QDqaoDHVjmspUPMFnrRWSmPCc/Svx4eIhXFA9oieY36spfApAA8dDYFHKWq8hwmfsJv7cCd+FfBtNSmuRouoGvcc9vzdlc81BaUoiTU1xDHrytdc+xIXTCGi/hNw4usuOn1gyj6XPBVQWH+uhFyETBLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fab48596-2efe-a3e7-1531-11527bd72d38@suse.com>
Date: Wed, 22 Jun 2022 13:45:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 9/9] drivers/acpi: Use explicitly specified types
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: xen-devel@lists.xenproject.org
References: <20220620070245.77979-1-michal.orzel@arm.com>
 <20220620070245.77979-10-michal.orzel@arm.com>
 <155d8f62-aece-8fb8-8be2-6d21d20926d7@suse.com>
 <b8510774-f000-8b66-ebab-4286567f7747@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b8510774-f000-8b66-ebab-4286567f7747@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac586f8d-2667-4bca-1e58-08da5444a8fd
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2470:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB2470A8A9835FEE80D77C9D83B3B29@DB6PR0401MB2470.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dwc0XnTP93ulAtE6vj2qnRDJxWQ3BMacOX+gS0nw3am/NGTDSSgEkkrPVNL3QSZcT1DRl7TF0EWOHhIwbqbB2i+uK5zDzAP1+PPWiwEsRxltjSm7NAGwrVNjmmdJ+HmLs76e/8rsQ2teWatSSwnCfJpdCOFpNIzWx8BDR/N4vJVl26GoLn04L1BALaLN5yzDcRZLlnEiueeEvcJcmVjqjdkcRr/nIfOFpQF1WX1xMnPWEwUb/h5iWzk+cK+Y1koK3oM3p77uBz+RaqcP90imXTxWiAr2UojkulNxPwCd6VqV4nt5nne+/URVUVgHfu+iz/jYqryetb7Y4BbzT8E0px2mdEa4oUS1yEWsLr0ZCmHP45uoM4uFmMvdhCiSfLwoGQ6s6Uq85o5CQVFVDCCJfe6MT32QvMeLLbe1upX0PExGprwQIJKTbEUHtegFSU19b1DvSyNOji5uH9KddowfbnwpyhlKouEWJIH2YXlcetTcOKJBliqVbcBgTDBK6DPHhfEOL0Z4LtbT00DVZweAvc0RigWyI7pXlhxT2yeXNK2G1mhgSouZBWpQtzcGby6kst+SLeA/Q1oLopwtgOWfRaaefvgcOVJoFXahnb0yCrcsj8RWbrICKINGfFzRKNAATyadaUpzqpPfpP2TJPtF6GACz738UMfhpPzJWDDTay0LNzjf722jffS2ORs0GLquhlZz/CBio0Ihgt27JUFhNtywjXEkPYP2zJT1cFYpIarr8BcfDkQm7d10KqNxxvzxL2GajIbQfl8W6nLs/nADR08txNh8cYCMnf0xuS1E7vE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(346002)(396003)(366004)(39860400002)(26005)(2616005)(86362001)(31696002)(186003)(6512007)(41300700001)(53546011)(6506007)(38100700002)(8936002)(31686004)(6916009)(2906002)(316002)(5660300002)(66556008)(66476007)(66946007)(8676002)(36756003)(4744005)(6486002)(4326008)(83380400001)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MW9XcVVXYVF1U2NSMFo3RXZzUHFwOU42algzd2tjUHVZQnRwWDkvbWFpRWVM?=
 =?utf-8?B?NXFkUEptMm1BZmhSampoQ2FjUmUxU2pqWGJpcGZ0TEc2ZTVjYlR3dTBla3Nz?=
 =?utf-8?B?L2V2Sy9RQ0dzcmEveWF3d1BQejN4eFpvbTJJbmZYdXFFTzlLRVpOb084Yk9P?=
 =?utf-8?B?aWMwazdvNnk0eFZta0J0OUkzVEF0MGUydXZ3SWRUekxjMk1yWWg4OVkzbyt1?=
 =?utf-8?B?azFTclJ3TmQyejlCSUp1dTZ5bm9iUDF3TDVQNGMxbUZwMFIzMVFCSHRDVXVj?=
 =?utf-8?B?SEZ6bTRMWTRDYWRyNHcyOW9oYWFaeS94Q2NSVmdaRUc0QlNhR1VmcmdkaVdj?=
 =?utf-8?B?UzdFNmxaSzBhY0hKaTNlZVhQb0JiYW8ycjhjUG12YlkrNzRoM0xwNGpkVkR4?=
 =?utf-8?B?QTJDQTlQUnUrZVVFY280YTJtejJ0ckwyRDRMQ2lIUUYxWXo2amxrcjM3ZGNr?=
 =?utf-8?B?YXlvUlNWNFFXcXBoNFhWVFRlQi8xVlg2VGFpQkRTMkI3RFpPVy8vRllCWmg0?=
 =?utf-8?B?a3crSllkZEZVdU41amtlT2Q4NXM4NzdXNkxEVW9pTVpqdGZqcjZxM3ZiVjd3?=
 =?utf-8?B?NmxNNytCNVdoMTNsV1BpWU4wNHBNTEQrRHd6c25adi9ud0EzT0QyUHR5a09t?=
 =?utf-8?B?TURYR0c2TjFGRG53aWN2NGZTUlYrTlRXMTJCZnhWcFNPTnRUZmZKVVRQbFhM?=
 =?utf-8?B?SWtLTk1LZnk1YXpNRlR2ZVd2L0xtSjdMblRRMkg2UTVzS3BvRHJKL0xlQWZG?=
 =?utf-8?B?YlREN1doZzlWb28wUmlBdXhvb2x4YmRwTEdsbzNsRlJTcEVhNkdNMXdIeGVG?=
 =?utf-8?B?QTRSRS9DMGFnb01YNlBOZUJUZXNLYlM1ajMzRjdaZ3hCZFFkeVBhY3EzMWhs?=
 =?utf-8?B?ZXdkdU5YZjVIc3Q0RmU0d2l5bUdISG5LOFFUNHBiUjVMQndrNzI3eGhHaHN0?=
 =?utf-8?B?UHROK2FtMFB4NG15WW96Q2tCRmJFLy9kazMvblB6Q1l6WmlTSjZaRGxSajRD?=
 =?utf-8?B?bkdtUUhmYnAvSzA2MXNtS24vSWlZLzNWa3RIRnJQNERMT3dQcEk0aUU2cHA3?=
 =?utf-8?B?SXFrcmZ6QVY4ZDhpWFJYUjU4aG4zcktOeXhJNDM5Q29rOWRyUU5ja2ZNT25K?=
 =?utf-8?B?Q0NmVFQ5a1lFQThoTVBEWnordVIwNWZ0QWo1bVJJNlpPcHdneVROYmJ5Vk0x?=
 =?utf-8?B?b0UwdW00eit1NXFDQ1Z0T1puVWdDMVI4YVY4bjFOTTk4cDBmTmhFWCt1cnEv?=
 =?utf-8?B?L3FicHh4Q0FtdlV3UjZLdW9ndkU1UUpKdFN1OHI2TEhiTWVBcFJqOC9aNG1B?=
 =?utf-8?B?cnBZdE5ISTBCMVJiWmc0SzBINXByejNSMS9mU2daMHFueGIyMUVxZzVTR1JO?=
 =?utf-8?B?TGpZT05LNGRjZ0VSbUN3NldCL2s1bi9lQVg3c0w5VnNTUFhaRVQ1ejhoUlZP?=
 =?utf-8?B?eE9VeCs0RlhaS3U4dkZGRjhUZUtHcHNRRzRXMy9xZHpNb2w0d1cybTNvZU1J?=
 =?utf-8?B?ZjdnUjFjcUpFNEdyUnNyZ0JrbFA5OFlRTDAzdEt6MFNWUlhyYlgvSE5UNWhK?=
 =?utf-8?B?SFNFZzNNQXk2VHBTWFlzaGxJSHY5WWpRMTd0TktxcU1IQ1YvWVVIbmUzUzB4?=
 =?utf-8?B?ME5DRGRVNW1GWS9jWFNXTlA2MTkyZ2lkZjl1bHp6S0prTWJDQnVnYkpBVXpX?=
 =?utf-8?B?WVBwY3U4Z0xXYmZ3dy9qYW5xY2pVeTN0QU1XZjRvVkdrRFo4Q2N6N0oyUmYx?=
 =?utf-8?B?bHBrM1p4dm42NGM1VWVueHZHa3dNdzNUWXlPQ2Q0UlVmY2lTM3A3MTV2dmth?=
 =?utf-8?B?RHVuRS8zMWQwN0VnRjBVTUNPc2prNXhPejNmYWgybzBsT0s1a21HekFuNzRj?=
 =?utf-8?B?QkVuR1IrYXlKWjRUQjIwZ3FvK0w3cTlOZDZyMHJSdXZCYTZUUnd4aE81eFVv?=
 =?utf-8?B?VE1RK2I5R2NPaVhtWGRQMForWjB1WlVLTW0rV09LWjA1RUVKZFBpQTBmMzJl?=
 =?utf-8?B?VmFIYmhmVVBlUFFra0YvVm16ZFMvZVFLTmYyeC93UHB6bjBkd3pyZUIrU2Ji?=
 =?utf-8?B?WGpIQllpdXRNVFdUc2pOUFlMdDRaUVdlRW0yMHQvMUVOcHRRM2lKdWhpL1Rl?=
 =?utf-8?B?WFppYVZ3SWJpWFZDYVYwUTdHTGRwYWZzNVQ5aVN4M2FYV2NZQVVKVjNFVm9o?=
 =?utf-8?B?TjV1VENqM2hxa0NFOXBWY2cvV09pQnZPbld1Y2JodHpWR0ZmdTlDZjI2ajVz?=
 =?utf-8?B?SkV3VEhUSnVwaEUwQjhyQ0hxZnExdG96R2MvZ0FCZUdMcWdRYXBVVWh3Q3Fo?=
 =?utf-8?B?c1lxTFVsZ0FZTVZnMWxmbzRmamhtcFNraFVINFUxRXBOdGRWUFpyZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac586f8d-2667-4bca-1e58-08da5444a8fd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 11:45:09.7735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0NGTmWFe9OAfoMWYHUZeuc3RvzoJV/Hp3q7F7KN543u+Q2gmnFJnsOLw9xa2EX7/Ay2lnuDbPySHBsGHbzi7Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2470

On 22.06.2022 13:09, Michal Orzel wrote:
> On 22.06.2022 12:36, Jan Beulich wrote:
>> On 20.06.2022 09:02, Michal Orzel wrote:
>>> --- a/xen/drivers/acpi/tables/tbutils.c
>>> +++ b/xen/drivers/acpi/tables/tbutils.c
>>> @@ -481,7 +481,7 @@ acpi_tb_parse_root_table(acpi_physical_address rsdp_address, u8 flags)
>>>  			if (ACPI_FAILURE(status)) {
>>>  				ACPI_WARNING((AE_INFO,
>>>  					      "Truncating %u table entries!",
>>> -					      (unsigned)
>>> +					      (unsigned int)
>>>  					      (acpi_gbl_root_table_list.size -
>>>  					       acpi_gbl_root_table_list.
>>>  					       count)));
>>
>> Same here then, except PRIu32 wouldn't be correct to use in this case.
>>
> Why is it so given that both size and count are of type u32?

Because the promoted type (i.e. the type of the result of the subtraction)
isn't uint32_t (and will never be). It'll be "unsigned int" when
sizeof(int) == 4 (and in this case it'll happen to alias uint32_t) and
just "int" when sizeof(int) > 4 (not even aliasing int32_t).

Jan

