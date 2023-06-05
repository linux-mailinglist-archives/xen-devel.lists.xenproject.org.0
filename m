Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BBB722264
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 11:41:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543595.848697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q66i4-0004II-9j; Mon, 05 Jun 2023 09:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543595.848697; Mon, 05 Jun 2023 09:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q66i4-0004Fd-6r; Mon, 05 Jun 2023 09:41:08 +0000
Received: by outflank-mailman (input) for mailman id 543595;
 Mon, 05 Jun 2023 09:41:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+s6H=BZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q66i2-0004FX-Sh
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 09:41:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15c1121b-0385-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 11:41:04 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7010.eurprd04.prod.outlook.com (2603:10a6:208:199::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.27; Mon, 5 Jun
 2023 09:40:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 09:40:59 +0000
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
X-Inumbo-ID: 15c1121b-0385-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UcTq2cD6Umt5gQG5XvtSFB2JeeWWUGpC3MywCsT7nSzZQFK4qxyibm6ZIuZ9X9P8yTagEvMika/qyQ6XwnzHRY04yJrtjALYjtLBKi2CdfwRdTtUplmIN40gDKzq+BHeJGGf4cnwlYVZ0PkQCksHmyuuemfEhr/n3B4fL85e5crS+jkSONiRE3pniyaHz5w0UToA0DE/RSN3quoLfrTM46ajGXxeKBpQcQCFvP+8XxKS/qUwUUQp5Dw/ra5bTbP2K5rk4lTyFMRdv8KPNP1K+F6Qt26RZ2o+UjHDU3QxhvyS6O7Jqd+uunKHoiuKyhoO4mQvBrwwKiAo/V8hgzC1DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qu/Q6PWnmkcVSQtna83LsHMYzG+EOd7kszTotD0akJY=;
 b=FYrsA836lwTBs07ZXlPNbCq7JbjY4Tdh2NSVMd8dYbVVqrv8J0xGupS1a6Y2E20zbKqF7yNIlJ/PtwNQ1lkgFNBhI8Hbo7BEs3bcgWx87nOlgJlJyQpMVRVOy+vlcj377P3ul3/c+EosAQTJhcfPywNBgejbtDOIvNu+NhU6dU94R3yniyNzzRMrxR/ep+fFfXQhVu2Dzn4oizmPJAz/5mA1C1INPxoruzNsiigArii3oROwnqj5t8Y7rI1vhxwvZVwnJSuWjHzPUv21EKZ6/KAoWkyROdACI/3lC6im/pGGzSEwasZhoXg8GK8I+TvEOzUlqDVLic9gwDHvRo7Lzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qu/Q6PWnmkcVSQtna83LsHMYzG+EOd7kszTotD0akJY=;
 b=wnmuZ4iim/JfP5d7ploRstUoNEZ3OZpZrQiL58fLihACrEMSK/b4j55eBhQzVxOh4uWsKrtmfamppcHyd1q9e5sLlBdA+mQOGiVqwSZYmS2HtjMAkCFkwh5nPr5A5R6Y460X0lC3c7d7Ocn++BX8SkZXBxhuRn6YAju5UfibiDTOeEFo/SzCgq4DXwGMkf0SFgRRL5fMlFAZAjT44YTzqs+GX0KRmgQqTTKnxftdcGN3DqDOgvJx/5xK3QdGxNNOGRhJLPho/T18GTg7xCVtm2roW9WZ0GDp8qcRJMxCBiBm+bmFAuglmwExJqOLTu94loLbHzZTRhngGVdRLvvO8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d06dba45-20fa-711f-f80e-7ad1d9fee32e@suse.com>
Date: Mon, 5 Jun 2023 11:40:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: Xen reliance on non-standard GCC features
Content-Language: en-US
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1cd359e7-5245-a621-3be2-9323ba5b327b@bugseng.com>
 <f5c112f1-a0ac-63a8-17b4-b42ab5fd2ad9@suse.com>
 <00f013e2-865f-4a7f-6dbb-e51ea6d05c2a@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <00f013e2-865f-4a7f-6dbb-e51ea6d05c2a@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7010:EE_
X-MS-Office365-Filtering-Correlation-Id: c1d4cd42-b0a9-413d-c3d3-08db65a8f817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5RzZ/1qU4cufgWcBOeB29Ep6YMsQ4EAlIIplkOBUhbhcebF3HETMLntVtNjeulIOspUsfseIHyKFFFPvwiW1yNi+aqNfG5VzxRDbkMFvvpcFKmxmK7Z1SHPQEfqK7r9Mt4vGzP8XcuCTnY1R85vJO5ZVg9uIgmlY11rfmva7UixU3/t+lg9YNStqpCq5pmBYsdPZ240Ugl392rc+oMq6746Gzd+YQSUhoJObx+Obku/lXzYFizm2N5t/BB0m/W4hhoTlKpSoen5FDVabyDFdLBAHppktOGa+CaUrgZ/2yL4uSvrxABHh3Y7yshOZp3mveHj80Bo5xV3Mt50jA1rEagW4DdM2Uz9jaX6gxOHB9BMAsebLYBw2uBs1hvkcg7MHVN3RZUz1Ap0DGjOsMQtPu8GOUcTJh/UwplfLS2ZD00Df0xvKL6GT9qb9YTa3k+QPSzqKw+7mUS/bnCLnHZ4yIHbombMsQV89kyATKwoESsQUHn4j2Nors+YMdtUhkGe9GBrVW0nBu46GTPyA2rdhiBue+FhaEkoiGw32cLzMKBXgOl8AUUlvCHda34OIiI8clhc/v6CdEpucDjCVfUgnXHFcIYgDcSeQvLfI/mxXp3i+WWR+N/0nrqVP2FUXzXIHBH7lLAPUdFnjp583YlIEAA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(39860400002)(396003)(136003)(376002)(451199021)(54906003)(8936002)(5660300002)(8676002)(41300700001)(6486002)(86362001)(6916009)(316002)(4326008)(478600001)(6512007)(53546011)(66899021)(26005)(6506007)(186003)(31686004)(66946007)(66476007)(66556008)(31696002)(2616005)(2906002)(83380400001)(36756003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkpWeHlsUER5VGFsSmlxbmNWc2NlTWtITGY2WUM4czBnei9CeExldTlWRnBv?=
 =?utf-8?B?dm5BcVJMRGM2T0kzQlRnallzTmRuM1hNY2wxVVcyVTJqWWpyL0pRRk1qVWdz?=
 =?utf-8?B?cE15WEhKclAyV24zbjJUaEY5eEhBZksrd281WEJPb3p3dVlrRyt0cWNoT0E5?=
 =?utf-8?B?TzBFWnlhUnpia3hJcHo5dGFaVFoyZW54Z05ZTnFrMnFXY0V6ZDErR1NaODVq?=
 =?utf-8?B?ci9vTHh1VzkzYmMzOURhTkp0QzY3ckVwcVNEaDBkSVdMY1dHM3ZsV3BkUWNi?=
 =?utf-8?B?OFQwdDYvT2FxOXI0KzNuR3hwSUlCdjVJRmNCODNqRzgyWkJiMGh2dHB5ZDF6?=
 =?utf-8?B?QnlxbWNPL3B3d2xWeHJ4aFJwbWt2Q2w3NDZQQm14cCt4UlllbDNyMVNSWXJB?=
 =?utf-8?B?ckh1MmEwc0p1WFNUWmU5bk5CVmtPcC9BY2xVL043SHJQdFRvRGNzRHk4VDQ3?=
 =?utf-8?B?UlZMUmNENmRDbEx6ZjNQUFliZWsvendKTVZuUFlSeEJRdW96ZC94M01LajFP?=
 =?utf-8?B?MzVnQmFHazBWbHJJSjlSM2FPMmNqYS9jdjVYK0FsQWdUaWNuOURNZUNoV0dR?=
 =?utf-8?B?M0FBckFIdzhVSU8wSmwrYUtLK2pJNGpuMEJ3RFp3Tzc5VWFuZnMzUG5tKy9n?=
 =?utf-8?B?RzhTUVRObm9Damx2RzNDQThRazA4QjlndXNnTlJQOXZ5TDczVUYzNE9RVXcx?=
 =?utf-8?B?NkFtNENzMEU2Yjc0NmJkbU5ZUnAyRml0RXhyS3Rabmk3NDhkUktldCszdmpo?=
 =?utf-8?B?QU1IMFB0UjlSeHZwR3RZL2FBRlRpMGN1bXRCTlZFcm8zbk0xNGFlcUVQbWZo?=
 =?utf-8?B?SHd1ZE5kUkd6RCtTNG1kVTBxY1plYkl3UEFhUFVaaEtDRFBTUUNFTXRKbURM?=
 =?utf-8?B?Zk9YaE1OTkxZZkVNZzU2VHpnblNUYzJWVlZwUWQvT2s4UnRKR0dRek5hcDVN?=
 =?utf-8?B?OUo4RDN1NXZ6QklkY3RqT1RiRTE1ei9NT3Z1NFl6V2NqYzYxdjFTeUJLc3NG?=
 =?utf-8?B?a0lJWjFucnZXV3MwU1JJTDRtMjBvV0liZmVIcTVpVGdlSUJBZHFwZDFCQ25t?=
 =?utf-8?B?NFkvMmZzbUxmNFllM0ZrbExCRW9IM2F5RWhsajNreU5OU2hZcEtUNVJTU2pO?=
 =?utf-8?B?ZXZiMFBoMnpMUGFiTDNLbkpiUVduWVh3N1UvRlpvV1NmeWV6U1R6OUlwQkk0?=
 =?utf-8?B?RENqeGdYTTJ5Y2xIcDEwVUR0ZDcweFJhZVhGclo3RmNNT1pWM3JDRXQyWVNE?=
 =?utf-8?B?Umo4R1ZFUndIMHZKY2lDSlphV21xMnpHMStBR1JxOGd6Y2xFeTFnVHhaemd3?=
 =?utf-8?B?WGdDTGF1TllYVExjZHlEVm5BS0JXM0d4d29kSFJVYnh3TDhsOHRwcXdLM3pW?=
 =?utf-8?B?YjZORzdtbkFzanMrR1Jic1kycFpxM3cwellLekdoMmxFZkdLWWttaWdxTFR2?=
 =?utf-8?B?VHVmbUV4ZmxQSXpwZ2Z2Yi8yVzF4dzJGb2dnYVIyQ2JOZEhyNlV4SXRwRDdV?=
 =?utf-8?B?M3A1cTZtWURGWjhpWXl3ZDNjSFIzQ1laZ0NxRzQwS0RqbXZJNnVLQU1hQmFx?=
 =?utf-8?B?RERIOHhnaGFIVnhaUXVjSzNZTEJ5L1FWM1JaVUwwQkZWNVg3eHpzb3dGTk8y?=
 =?utf-8?B?dHhpWWdTTThmRDdDMUc3NlBmZ29pOEJ6dFVja0ROTGYwNDUwaWVkcXQ4eDVt?=
 =?utf-8?B?ZG1nS0YrZUw1RUpQaTUxajU3QVZTdEpNeWN3WDhDUFN2NGpXdDYxcm9yOXRQ?=
 =?utf-8?B?SlpKTEcxSXZueXh4WG5WVzFSdWFiQnJWMzVKQXdKaUUvY1RYVVByMUVxMUJS?=
 =?utf-8?B?K29tbzVOZFQ4dHhZMGZmVzdYWVBmblR6cUtwYVNJaUR2TUNLS0xQd1VJNmVP?=
 =?utf-8?B?RUFIZTlNVGJOYWZsL2VCeEMyWjJ0SkFscUIzNVlEVTl1d2wwYk11dUp6cXIr?=
 =?utf-8?B?ODNQZ3FHd2NDbDhab1ZhcG41T1hjSUN4cE1TTWd1ZVkwMmNsUHJWSVZTV2Y4?=
 =?utf-8?B?SWFzbm92bFp3YStnVDVLSWFLbHRick9TdXRsSmJhZ1l2ZWZkcDhsaDFtNFp6?=
 =?utf-8?B?dWJweHJqM1p3WTVQOFZPK3d0WnEzR1c1MG9BZVBSQ2hnTUJXZ0lVWjBGWmVX?=
 =?utf-8?Q?smUpsxg3upvh2DS1ZCiMdVO3N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d4cd42-b0a9-413d-c3d3-08db65a8f817
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 09:40:59.5760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Otv0+BP/mwhy665QU8bJO6Pq+yEvfmOpNzqMt9Ddwchqm8KDT/6b4ljJ7nSv21L++/wzQwghbjJ2p90OsGd3zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7010

On 05.06.2023 11:19, Roberto Bagnara wrote:
> On 05/06/23 09:35, Jan Beulich wrote:
>> On 05.06.2023 07:28, Roberto Bagnara wrote:
>>> Finally, Xen seems to rely on explicitly undefined behavior, namely
>>> C99 UB 58: "A structure or union is defined as containing no named
>>> members (6.7.2.1)." All instances but one occur via macro BUILD_BUG_ON_ZERO,
>>> the remaining instance concerns struct
>>> `cpu_policy::<anonymous union>::<anonymous struct>::<anonymous union>::<anonymous struct>'.
>>> Reliance on undefined behavior might be hard to justify.
>>
>> For starters just a comment here: I'm pretty sure this case was discussed
>> before, and that it was agreed that if need be we'd simply add _ as the
>> name there. Yet then - how did you notice this? Code inspection? I would
>> expect no analysis tool would spot it because it's used for gcc < 4.6
>> only. And I doubt you run analysis tools in combination with this old a
>> gcc?
> 
> It is detected by ECLAIR, but the analysis is based on GCC 12,
> and the detection of implementation-defined behaviors (including
> predefined macros) is completely automatic, so I don't think there
> is any configuration error.
> 
> One of the instances arises from
> 
> xen/arch/arm/dm.c:50.19-50.37:
> all the members of struct `dm_op(const struct dmop_args*)::<anonymous struct>' are unnamed (undefined for the C99 standard, ISO/IEC 9899:1999 Annex J.2 item 58: "A structure or union is defined as containing no named members (6.7.2.1)." [STD.anonstct]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
> 
> and, in turn:
> 
> xen/include/xen/lib.h:54.12-54.17: expanded from macro `BUILD_BUG_ON_ZERO'

Oh, indeed:

#define BUILD_BUG_ON_ZERO(cond) \
    sizeof(struct { _Static_assert(!(cond), "!(" #cond ")"); })

uses a struct with no real member as well. I did overlook this earlier on.
Not sure though how to deal with this here.

Jan

> xen/include/xen/compiler.h:126.3-126.77: expanded from macro `__must_be_array'
> xen/include/xen/lib.h:77.53-77.70: expanded from macro `ARRAY_SIZE'
> 
> I apologize in advance if I have misunderstood something.
> Kind regards,
> 
>     Roberto


