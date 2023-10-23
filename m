Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D84247D3049
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 12:45:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621339.967700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusQp-00062O-5Y; Mon, 23 Oct 2023 10:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621339.967700; Mon, 23 Oct 2023 10:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusQp-000606-1h; Mon, 23 Oct 2023 10:45:11 +0000
Received: by outflank-mailman (input) for mailman id 621339;
 Mon, 23 Oct 2023 10:45:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qusQn-000600-Lx
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 10:45:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0624.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3be21f98-7191-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 12:45:08 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB8034.eurprd04.prod.outlook.com (2603:10a6:20b:249::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 10:45:06 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 10:45:06 +0000
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
X-Inumbo-ID: 3be21f98-7191-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gr5HjlkXimy2NxfhTyNIpU2PqQJIyghEeVOkDMeNWpPmoOTNXzR075fEaisvlBuZbgklvw53up4oKlIVUVhbQoOYowa/ttcOIyC8Yqo8VVxBxvhmqGlyuz4AJ2yDB1NRGM4gkj5edctO6zLYhcVtHGbsdXUiDnA0RyHaL5QhlaSAjNn7AZMXKb8Q9G4GYxrKbE4+yY4+hVPIJhN8Cdj3aehSfF+ZHCum1zpm49aRHk8ZzA3sLLE8QYdWm4Rn6CT5i1BxVVYcSzNxe06z1S0ZSVsX8zEt6vmOt4CBfRS7Znat90lpUfBMEVtrP3UnJiR8NNpFl7iA1/Qr6FcXaGtkPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WrEJq6GHbceI60mOoVZ4AhSkq3MWIYPGNLx94MPG58=;
 b=IGVN8o5o7Zjy8j5gdzypSNezNEVEgeIx5GEMQDrqZxJVPGIv4ZaZSumgHXxJf7f4bp/q1FijQ6In+1P8E0mbQzGRwtpx8F0DR5iOY/DqRN5b0+J4Ut67PbGpaQwFo/OjEj3w8sQYC+TFjWexLDWRsxLLCd73inRS4bfc0RtjoRBtVoBLpg4wTUwT9pV00mrjQrDrD+V1riD7Fv2bmLO/2lAG/j36+LyHNRFgQ/nQPNNQtnzcT/lmPrFw1GqFvEiDbWkgj6MTtWCVwLDOLMfls8vgb9NTJQbgePWHR84d7r3IuGpVxUpRVeAXTCRrm02s6shJCL0HJ58m0qHbdAvpfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WrEJq6GHbceI60mOoVZ4AhSkq3MWIYPGNLx94MPG58=;
 b=wE3RYWahjCFDW2IqgMhDC7FaZHRHgowx/ZRMkrokDuBhcL03FMMT+vjbz0AZXkpHUf8C2Q5B7VlxFxviA/wW3QnSiqmskh474odOQEC6BmCn+CMPshgiQQZiXXlwFdLYC02o/uvUxOqJdLJEBFR4HGXfL9zR03xWc7XfAkWWbSn4jOQJXvfdRz8XEp/ghVV6PAS4klQGnXyvBDjr+XmO/bvqkPTHcMbWQx2kfGeYtKznyMwc6lBqalIt7FjASRudxnWNV6lIgQXO7nTXfQt++ZzeyHf/AO7Jns3rwVzrqRekmQH7MTlGA0YySpeCOg3nbr9MNjVwoKY2ED8qisdoIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7a497285-13f4-963e-0c48-d33cf32ff458@suse.com>
Date: Mon, 23 Oct 2023 12:45:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 06/29] xen/asm-generic: introduce stub header
 grant_table.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <f3efdfc93780b62be93fecec68860e12026fe66c.1694702259.git.oleksii.kurochko@gmail.com>
 <3e13d1ea-c242-46ac-c692-8f2237d2a23a@suse.com>
 <9bb801f1c45cac24f3e3ed3abbbbf3f260a549c8.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9bb801f1c45cac24f3e3ed3abbbbf3f260a549c8.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0346.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: c69d6d7b-9708-48e6-53c3-08dbd3b51f05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JYVvytBe8jN7pNeqPrK8v3eli55qCevurFoA1JEqthNm71Em4vmF0DRJVCUfFs8p7RPrAd1trHyJ/CF/H5rG8TmoE17/Hb5X7tgvyLzbqmw2IZpSraHp2iKC1PHOd+tusVUqE5Z7swps3rCKElBkKS9v05kLlq1DGLf9uPSqfgCm28vwyUY4ewqIwfnNCl/BRRsxZz0H/MuK7cJZe54JMuls8LgvmVSLPkpjC9voKh6YSrtlv560t1XUH2ZvSraViQ+YdmDMUJibekczByyJIG8R5nrmIwAlOnzS/+PzKZ64C67R26zSNkyPGVZ0mqk2Ta3gRyX3yTxF7VOQEDR8lb9q+b+e3TQjK8nBq9S9kkJpA/06jWO42Mk6zm4SJLsOMOG72RgDl5WIRPcccEZzlLTWt5FpwpG/a40XH0wcJx5mtZ+XBERDPIl9vW+yehqlWh0vugdFhEj32I6KUsaQPS9ze0LCXO4NXcJzN2gvi8LU9TQd+CB/3+AAJRbHOo9cBbjCQ5tE3Q/Ni7iUYd+82yv6/CqFdYShonRf9WwHM/PwyH1GgEWfl4KZd1oP4BlbS9R04FsxJ4MQo+REJEdOBBz0DaZ/AlWkoESUtBtuai4n1f/HE0FZzHRJD4FmRPBca3Mkf31OkJvr5bxkpds46Lz64ag3J6M9W0p1AS0YELQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(396003)(39860400002)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(478600001)(2616005)(26005)(6506007)(6512007)(53546011)(66946007)(316002)(6916009)(66476007)(6486002)(83380400001)(31686004)(66556008)(38100700002)(54906003)(36756003)(4001150100001)(4326008)(31696002)(2906002)(5660300002)(86362001)(41300700001)(8676002)(8936002)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDE1V2dGZGlOaXMrOVdGQXJWbFgvTlpscDhaUEtXOFVBQ1dmRE1rUnlCR2M4?=
 =?utf-8?B?Y1pYTGlmSnFXaVdoNzhnQUx3WXk0cEZvNXJzTUlLUWdNUnRxTkpOMDk0dVlI?=
 =?utf-8?B?dVNnU3p3QktMNXB3VTQyUUNPTnhqcU1NZ1BOU1lWRG84NGJlVmdPWU80WXVU?=
 =?utf-8?B?elB6bGFvSWFwNlBLS2xzNzhrS2RlanM2WEFMMlVjL3JET3hqQXIxZ054UW1I?=
 =?utf-8?B?SG92cVhBNmwrdkUySUh6NWZobXZLYWRGc3F5dGdIY05ZVEVoaFRoRC9TbjJN?=
 =?utf-8?B?b0h5ODh2cjNNVmR5bDcwaXEyaDdIeTg4ZWR6OG4rZCttM0ZKWGt1WC9KYjdJ?=
 =?utf-8?B?UXRmaUhYemJuekFWTUJUd1dtMWRHbGwzYk0yT1kyc2pTU1F6cDg0dXFOQnpv?=
 =?utf-8?B?eWhZYWczdjBDbHZmUVhFaEx2b2ZSZDZlbFk5NTNUUER5OFVjTFU2RVpyWnJm?=
 =?utf-8?B?WVN0SUFIeUpoNk5RMVNRM0FTdGFyclZiNnJuWjFPYUhrdlNyT0xxSm13NlNI?=
 =?utf-8?B?YXVaVVNVZlhTYVRQU1RSenVmaDlhR3A0SldSYXpEd2d6aityZE9BV2E2aW1p?=
 =?utf-8?B?bkdVMlA3QWtnY0E1NElmTlA4NHR6cWIxZ2JsRDJuZ3VEbExJamVROENrcFha?=
 =?utf-8?B?cHdqZE5DdVZpTlk4bitPODBTNmJtTVBDd2JoYWt1RlZwTElRVHRCVCtqSnAy?=
 =?utf-8?B?clkrVWY2alRUMEZRZGVidzJoQ01FSHMxYTkwaWR0cm91VXY1RnJhUlZKWWNB?=
 =?utf-8?B?TkVza3ExbHpSd3VhN293YW9MN2pOSkdJa1I1WVBSNHBFdVZ1bHJUdzJKTkJw?=
 =?utf-8?B?SHJWVEtKU2FWSlpUK0N2cWs2cTR4czVFVStHMFQrZ3FUWjZaYWlGQ2l3VlJE?=
 =?utf-8?B?dGdkcGlENG00TitlRjFQODA2YTdydTNCcVRLd1d3NkRCMXIyL2VyT2JnT2JN?=
 =?utf-8?B?UzN5WjRFNDJUaTJPTG81WkRQbFFUOEZ0bkJmcGlmVXlBd0NQQVN0eW1nNTNB?=
 =?utf-8?B?eWEwQ0VJdnhoWVJwRXczTDhYRlhZaGxhN3FpZUg1NDdubGJ3Zy8ybHlNMTR5?=
 =?utf-8?B?dlJHNC93Qk5EV2hsMmhnL3lCK3oxUm5aQUxWOWVjLzhvYkM5YjdjaFpXbXgr?=
 =?utf-8?B?UUNKQlJBL05LM0NxenJ2TFl1UlVZVVl3OG91TU44YkZUZU9HL0YrSVk2TTJV?=
 =?utf-8?B?c3NhZmZycWxHTGZmczl6Qk5sS0RzTXo0Zk5KRDVZTGNLT2lJZW5pbHY3YThH?=
 =?utf-8?B?N2Q4OG1Bak9RRldGTlJaSkFielZDZlN5Mm5qY3lXNGh1aS9MSll5WlgzZXAx?=
 =?utf-8?B?NkJlTkloMGJSL2hnbU1sN092eGNubXk3Q2Z0K1ZHVVI1VFc4a1R6QnpGdnN4?=
 =?utf-8?B?NVBaSnBYRG1kSE9DaDhORDMyVjY3dnpsQXRDenRyREdHVTY0VTQ1aFFtd3RL?=
 =?utf-8?B?NjBZRG42WkQzSTRtRXp2VHArdzdXTXd2bTVqelpNQXlwVXMxVzVXcThVTTgy?=
 =?utf-8?B?V1pxaXJFQjNpQXgzekliRVJza2N6ZEtXUFhXYWhOZU1ZUTNEclBLcy9Wckln?=
 =?utf-8?B?UmNST2NvNjFOQTk4STJEOEp2bm1ZeDhnV20xUVpRSTZZZ3U1Y0k2SFgyQ21u?=
 =?utf-8?B?QloycVRWRlFlR3Z0Mmg4OGtNWHpKd0tNZVhueGdUYUxvN1k3MkpHWVNKUFhz?=
 =?utf-8?B?NGRUVEZSRnhMVkdQaDRqclliSTZ6bUFCZ0hZeGZiVldiV0hnWmVmV1lXbDVo?=
 =?utf-8?B?cTREUEg5cGQwZ0puUDJaMXRLano4TmVrK1lFRFVHejRXVS9ERklTeFByZ0V5?=
 =?utf-8?B?RExhZ2lnMytBTm16Q3NLR3RWdHJtWHNPeGJpTWxwa1F3UHVhSDRvcnAxSnVV?=
 =?utf-8?B?Yng3S0ZlalRjNnVSS25tYXo2VSs2Y3RQcVVWNTlMNlpUWFBicWN2djRGbHYv?=
 =?utf-8?B?czRkU2pycXQ2TkRyMVpiNHhhcXNyTGF0UjFJaUVOQytwSmtEYW83VmNxTzFO?=
 =?utf-8?B?YmFvN3dRNzBEQWsxRmNrTWdqeEs5RThxWllxMHpCcHprenh3YU00SUpkbEFF?=
 =?utf-8?B?Z1dvOThMeW8yOVorM01ieE43azRHTjNhclB2c3pmc0J2QjhiTE1nZy9sMk0x?=
 =?utf-8?Q?oKU/TYM5KT9PKxCS1iApMThNz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c69d6d7b-9708-48e6-53c3-08dbd3b51f05
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 10:45:06.7096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/jgoP0i659tSVH0vSTsy/e2drzP718Mx/U5x9NvHpWlzsPNIIc7m2v1JbMwHpmPRll4QHmVZyO8nSn1cXDHRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8034

On 23.10.2023 12:32, Oleksii wrote:
> On Thu, 2023-10-19 at 11:19 +0200, Jan Beulich wrote:
>> On 14.09.2023 16:56, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/include/asm-generic/grant_table.h
>>> @@ -0,0 +1,14 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +#ifndef __ASM_GENERIC_GRANTTABLE_H__
>>> +#define __ASM_GENERIC_GRANTTABLE_H__
>>> +
>>> +#endif /* __ASM_GENERIC_GRANTTABLE_H__ */
>>
>> This isn't going to work with CONFIG_GRANT_TABLE=y, is it?
> Yes, it won't work with CONFIG_GRANT_TABLE=y. Missed that as
> CONFIG_GRANT_TABLE is disabled for RISC-V.
> 
> It looks like it should be moved to arch specific folder but as I
> mentioned before I don't see a lot of sense to introduce an empty
> header for new arch each time when it will be needed to enable full Xen
> build.

Here I'm okay with an almost empty header in asm-generic/, so long as
it properly rejects CONFIG_GRANT_TABLE=y (indicating in the diagnostic
that for this to build an arch needs to have its own header).

However, then the question again arises where it wouldn't be possible
to have xen/grant_table.h avoid including asm/grant_table.h when
!CONFIG_GRANT_TABLE, eliminating the question whether to have a fallback
header in asm-generic/. If that's not possible, the reason may be a good
thing to put in the description here.

Jan

