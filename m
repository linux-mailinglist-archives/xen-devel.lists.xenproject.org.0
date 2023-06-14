Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B08C872F955
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 11:37:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548625.856641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Mvy-0003rV-GE; Wed, 14 Jun 2023 09:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548625.856641; Wed, 14 Jun 2023 09:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Mvy-0003oG-D4; Wed, 14 Jun 2023 09:36:58 +0000
Received: by outflank-mailman (input) for mailman id 548625;
 Wed, 14 Jun 2023 09:36:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9Mvw-0003oA-U6
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 09:36:57 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe02::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 004433d2-0a97-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 11:36:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8890.eurprd04.prod.outlook.com (2603:10a6:20b:409::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 09:36:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Wed, 14 Jun 2023
 09:36:53 +0000
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
X-Inumbo-ID: 004433d2-0a97-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTijVk/C/W5NBP8gb/Z+NqcnTzAE7xLGcKCkO022sBD8mb2gpxANvPcEdtAcRMspvB6b2+/mfHEx5AQ2cT2w0SYe1w4W2jXqRTA+sq/wrpa2A0sUm3N0urmGg3KEWntjVn1ATD7Ei5x9LmC6pbniGHZzjjJQPOVCcR+ba+YmofxE/WbqPQrLJtM8YfpU8eM89ugOVG1dS7qQCN61Gs7uaO9x9Dd7cxcYHB+VIoWRjtqWerqk6VdUyE1oW1xXtSvabnP9XVMdU/UANAvx6jULgtVSQWV6k3/BZm4Sfa4PFt+PNwiVEoo1BsdCHNWFmZ6N/m+BRDtGu0wNTOfIk71fkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUi/OHTpdEXbk/sOXVFrArakKFaFVknHrqKvnCzPPNc=;
 b=DLTAGs4oU9hwYk9P8E5f+KeMbWasnrMeGAOR9manTCzK3Gg7ehC/abjixFVPi6Ckoq/gyTBBU54UOm8KX8X27YnesJxc65qmotx5lzNtYFUcGRvYmuehq9D/ANIipRPyl64i692ou7KIFEG/37Cbc88tm2x2hJ5nSZukvANazKXEbWLpNejdS7aibwV0HlTLXeXe1CCO+TYYlEKY04Al8yUGhdwOhaybYbvwT7267XYYqERUoY/ztq2jnr/pDKnzZe1ilH3HHfqcGqvn90+5G0rJxJUi4uDI10JAe6ZVd3XfOMPd606R4cUJ2ZawGYFpbcS0AUEc1mhfr5T9rXP4Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUi/OHTpdEXbk/sOXVFrArakKFaFVknHrqKvnCzPPNc=;
 b=n6JqU0gguo+89LTi7iNIjB+K87YN3B+3ysXO7ImFtTfEN+wR0NgCSiHJ+4Yq/CAnl7wc4QjuUqpW96myLpDkMiTbnpaHOVI6v3BTMtAMBnfPys+2/d4h55er1o8lsEHi9qxxzTLtqVk/6koUqThD7Re/zvfHAkie94OsekuBJdQs1WkdUm22p+2XYhYp9jHORxwNvKrLPwmJEkate6iMKtZyjeZ+tcXXnzXjZi67ycHLGaLLFqXiofux26cwfnjvhx4/DUB5OMji7MC+H2mRffr1cTerKRgKVd6o+0uaBWWWI/HmDExSmMMn1ln4kXjDpYcHk3BhevrremnmUQHN7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9e7036be-4379-6ac1-bd71-d6d122f92966@suse.com>
Date: Wed, 14 Jun 2023 11:36:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] xen/evtchn: Purge ERROR_EXIT{,_DOM}()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Andrew Cooper <amc96@srcf.net>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230613162220.3052184-1-andrew.cooper3@citrix.com>
 <d3883a59-acff-198c-a688-ac2546de69a7@xen.org>
 <86f357da-2fe1-7fe4-c061-d30b8e5bcbd3@srcf.net>
 <fab38a04-20ac-c2bc-7e8f-9ae00524ba6b@bugseng.com>
 <5dbb751d-e8d7-fa26-81f8-5a3b1b12cd65@suse.com>
 <affb5dd6-26fa-71c7-5696-68aad00620dd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <affb5dd6-26fa-71c7-5696-68aad00620dd@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d904d4e-2705-45fb-cbce-08db6cbae354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k4OvjRcnO/iyLXSp/xT0q3g4o6TT6/RrG79ySDxkvR7FBwpuPVI3l6K54gIxFweQucdHQV75iBJaL2T5rnqGL4zydcLUPGlJRYUJHBEQxb1SanYUTk0a2o2xim9bkZ7UdbHzLP5v0cvvFFyflhcYAnJhgbCCGVRXIZK9ZrSRIvyPUzryliNlgdv0O96o82MlllL93QWrt9jZHC+9nTEIBxXBlF608OdOquKBBuYSS+/XbuKAQjslVNpCF5bw4kDs+WGi+m7rvGSsck4FrMOVZvmMJgCAwc+9Ewn7a2i4YXiydh6P+AENcm364e3rSJbzInCrFuZnJ5WAYYowdQ2tREJvqjmb71xlHCZZuTEqvqfGUShe3ZhGIVMEYR/wnX0WXTKn/ZNKEqDC3HKrrIfBw+8mg7W5ueAlGRyh5XJqvtSV5wlV3kLNGkICWNRWpmAVQhvK4F4jFuZpltDeJVuc8WOFTLwkamzfoCIRTFFZhAIs6twQDMRUCll1664tIYEHa+AA5+/1fr+nq0vaBnUA3BPazwQgH4g3Ke18s0kT8GDXt/QArvfwCVJt7j7Ykr8bo/wPGP8wc5Bok9a1uha5Ib1V58CsS3ADgN831YsPLKiQcBZuhh8xnKinr595M0S4jthIzGYxXH+sgaBBJHSObw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(366004)(376002)(346002)(136003)(451199021)(31686004)(66946007)(4326008)(36756003)(66556008)(186003)(54906003)(478600001)(110136005)(2616005)(2906002)(66476007)(8676002)(316002)(41300700001)(31696002)(86362001)(6486002)(7416002)(6506007)(53546011)(8936002)(26005)(5660300002)(38100700002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUVCSG9kM3V2ZC83UE56cktxdms3YlM1VWhNdTVuUEk1cmJ2aUdTQ2JXdnVT?=
 =?utf-8?B?cWNjSFZ4dnNwajVMK0xMcG8rNmQxczdXbjNNYUJ3aDFZMHBWY2JRM0hTOU4v?=
 =?utf-8?B?c1dWVFhjcXFhMEVFRzA0RnhjL3hudW1RWXhnaXBGaXJkRnhuR3F3R0NWczE1?=
 =?utf-8?B?TlhHTE9MWDlxVlJKaVg3UDlPL0JLcWgxZHVsT1dpNVNGcUwxY2xtMERoN2tz?=
 =?utf-8?B?eWRQMXV0YVlxeFVZUGhhZmdETWtBSW1sRjBacFlPNEczSzNrOXRIQlQrcWpK?=
 =?utf-8?B?TW1DM2dnbFZzN1lPRHkvZm5sT0h4L2NPYzBoMVM4L3h4cmNtUWFCWHJ1NnVr?=
 =?utf-8?B?U3IzRHdXWm8weFhpYXBRSnpybDFoSldqZkF3TlhxRStVbW96eTRnK0krV2R1?=
 =?utf-8?B?WHhDRnJuY2w2VmRMR3JWNUdWd3JEZGRocTlEcTFaRzNQSnVVcklKUXlJSGh2?=
 =?utf-8?B?OTJ3Z016akFuMy9GMnB6dFZBbzdsb3haL2RQN2xiUitkdVo2UjJUNXNUcWJG?=
 =?utf-8?B?cXdWZzdIQXByVHZSRVpPeVlnOXlJZllFeTZpVVAzWHZmM1pUUS9pTjZBVUdR?=
 =?utf-8?B?QTF5S1RhNWtCalYwT1BMK3hYTGEzNnVLMmc1TUYwT1o5OXg2MVRIdElEckMz?=
 =?utf-8?B?S3RJSUVtb3B5enN3V2t1OFYvT2dKaGFaUXF4M0ZVeXpHT2pTTE5OeUFNSklP?=
 =?utf-8?B?eWVNL2Rtc0ExeXJsSWRxQ283UHNGbUJVQ1RIUmY5eG5wNElBaGxab2lySGNo?=
 =?utf-8?B?S1cyeStTODFOemZ4MEg3ZTVWZVlJckdKUXp6M3l3VXd5UlV5OTBTSjVoVnF6?=
 =?utf-8?B?Y3pCN1V6NHo3d25UWU9YWFU2ZVNGdkxjaVUxMnJOLzI5TlJkKzM3Q29xUVBO?=
 =?utf-8?B?NTByMXJWT05IaldrVVNPc0dvSllxSTRsR0ZBRTZkVzZWb0ZubEQ5WGx3OWVk?=
 =?utf-8?B?aEI2Z0xyczJIeUgvM2VNRCs0UXpDOHNwSy9iTVVyVmNDYUFoRCtNSEMrUVpL?=
 =?utf-8?B?ZkJyY1prQUJXc1hUNmpCNEovcnpLay92YXZWVVRzUXN4NU9oWkJvL1FlK0pp?=
 =?utf-8?B?NEdLYVJWaFNUQk1ZaEZkVzM2Nm1tcFdKRFo4dURpS2dJMkdEeFZsU1Y4NFQx?=
 =?utf-8?B?K3JFMG14QW1leXh0Qnc3aW16UWFRbXhUY0JHQXhYVy9IMXowWU5jK2J6SURD?=
 =?utf-8?B?cjVXUTRTaHljY0ZXOFhna0ZyM2dLejhreGNoU3IzQytzajZZN2FiZWp3WjhW?=
 =?utf-8?B?VHAvcTJxVWpUaTVRRGNFZzNwVVVzU25GOTBpM2ltRHYydDI1NnhFWkgrYjdm?=
 =?utf-8?B?K0ltRXYwQnVZYW1RTEovSnhuTDl6MzY5a3M2RVpXWmZPTFdQUmFoRXFRNXZE?=
 =?utf-8?B?ZTNoUFJPdXZCUjdpVXV2RmVSNDlLcHE4aGRucmdIVlZ5eG9XcWx3Sldyb0V0?=
 =?utf-8?B?RXZGNGpDRnZxNzZEbW44R215eHdsbGo4STdoVXZCWTFpTUFtWXMwc3JSZG9a?=
 =?utf-8?B?bWhKQWpqVFNoVFpwVnphUFBIOWR6MVBpdFZSemhmYzFxVUNmaEkyWCt5WmVR?=
 =?utf-8?B?VDJRTnIyenUxeWk3Y3NhQ01SekJCaXlXWlphWWtrbUk4bFJlK0pZc1pRNmZx?=
 =?utf-8?B?U1J4M1ZaVGJYN2V0bVVDQlpOVFAwR3BseUVEZ2kzQnRZSG40dWI0REJpZXJT?=
 =?utf-8?B?Znp0dzFHQ2RHM3dTS0FQVG5lc3BobkVqc3pxcCtmNVhqK1JmSVJ6TVV3bjFm?=
 =?utf-8?B?akRSeWR5aHdyMTlxbEZaQlVmTkEvUFZXMEhEYWZIbGJLTncxYXFvRU05OHRx?=
 =?utf-8?B?UXdYTnpEVVZoZWlHSTUxZjNVOHF5OExkWmF0YkNTQXBZekZ2ckdHV28yVlFT?=
 =?utf-8?B?WGlmNS9WbmZKWWlGbXE2djMrY3k3WUNEZVZlSWlVTzRlb3lPRzBxdjdSTzZu?=
 =?utf-8?B?ZFdnT05tU0lnQkZ6V3BBS25jenhBdi9sMzhPaW5SNnViQTNWZy9DOHlPckRF?=
 =?utf-8?B?K0ZxVW9Lem5ubUlJZW1ZTngyVEorbGdBazFJVUFGRlVCS1dCMnJkeHA0Wkpu?=
 =?utf-8?B?SWRyckw1UUNGaEc0dUJtWi9KdjNOTDJIMjJuSlBtU05BemRtdlI5amx3Nkxs?=
 =?utf-8?Q?0FV7pw7U4hmcTXHedxomqyHUH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d904d4e-2705-45fb-cbce-08db6cbae354
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 09:36:53.8367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/zIsLlkaC4lzBgznrJJ6kFKO6+HtNNmSvX7euDg+B95zxqsXUP6C988fCVQU9Unm5InrN8i9Y7NIqdzHfz3sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8890

On 14.06.2023 11:21, Andrew Cooper wrote:
> On 14/06/2023 7:52 am, Jan Beulich wrote:
>> On 13.06.2023 21:47, Roberto Bagnara wrote:
>>> On 13/06/23 19:45, Andrew Cooper wrote:
>>>> On 13/06/2023 6:39 pm, Julien Grall wrote:
>>>>> Hi,
>>>>>
>>>>> On 13/06/2023 17:22, Andrew Cooper wrote:
>>>>>> These are disliked specifically by MISRA, but they also interfere
>>>>>> with code
>>>>> Please explicitly name the rule.
>>>> I can't remember it off the top of my head.
>>>>
>>>> Stefano/Bertrand?
>>> Rule 2.1
>> That's about unreachable code, but inside the constructs there's nothing
>> that's unreachable afaics. Plus expanding "manually" them wouldn't change
>> reachability, would it?
> 
> I bet it's complaining about the while() after the goto.
> 
> I can see why things end up caring - because this violation can only be
> spotted in the fully-preprocessed source where the macro-ness has gone
> away, and *then* applying blanket rules.

Hmm, perhaps.

> Which comes back to the original point I made on the call yesterday that
> do{}while(0) correctness for macros is far more important than some,
> honestly suspect, claim about the resulting code being somehow "better"
> without the macro safety.

Even further I would claim that the while(0) part of the construct isn't
unreachable code simply because it doesn't result in any code being
generated. But of course "code" here may mean "source code", not the
resulting binary representation.

Jan

