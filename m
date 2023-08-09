Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1337752E8
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 08:33:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580682.909061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTckL-0004vR-MT; Wed, 09 Aug 2023 06:32:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580682.909061; Wed, 09 Aug 2023 06:32:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTckL-0004tj-JX; Wed, 09 Aug 2023 06:32:41 +0000
Received: by outflank-mailman (input) for mailman id 580682;
 Wed, 09 Aug 2023 06:32:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTckJ-0004td-Mi
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 06:32:39 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88c6cb3e-367e-11ee-b280-6b7b168915f2;
 Wed, 09 Aug 2023 08:32:38 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7432.eurprd04.prod.outlook.com (2603:10a6:10:1a9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 06:32:36 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Wed, 9 Aug 2023
 06:32:36 +0000
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
X-Inumbo-ID: 88c6cb3e-367e-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMHlAQYnI2uMNs+y32FX25ir+y3qfwnab9iIpoVNOJEYMLqaib4maOX25C0Uuiz7h51gSW5j9ZbHsiu8Et0srl5Xyr8q2gukDQVNJuDssJilddHSC5Ll21EBt0KkYZhOpb+VBeKKUvrq4YB25D/xJSsc+CMwkj3zd4B1muxaPlMJfSuUnVgQ0E723SJt5j8OuiPPwB1CQ/n6WqXCH7NSdIwMsSFSASm4LETs3idgcV4nhbvy9EnEq7Csbkh87DIntD7N4QERyNshBylkUvorkZC3BHS3tLNdcZxEOQJdLNyzYl6eYmBGSlZPi597ObqB3vVjJI5hG4VbqoY3WJnzoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByodkMIVROhN2z9DAPf8Hsi6nxk9Y2/Zf7NQe4V6UoM=;
 b=iXDMFbIOU5ZA8alGKY09D9zKoQXb+aS49JwEQyYXBOFKDhq3vPSeZfv7df+6IdrIi68oPYt2zdlkdeJUMQCeRhFRQwGi8sqr5FfwQb8GJVUO0NEFylD8kiPd0nRTaRrosJ+cydBrT0e38bb3GerPAUc0XF89BNBEFRn9Gmca3YpgLo0aAHADUABuWjnCqE/5NVAnVSXjLMQr1suLFAxZ8igkwweo5Dycmkd2OzGGTItGWbcyrL6AZah/OTqhXdisaMfxrLSZuqj5h53+YL2Tjon0wxVs8ECUvPHlzJQ4NF177+tPBURu0tu2//2wAEfH+p1iis470xM9IZQosaKa1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByodkMIVROhN2z9DAPf8Hsi6nxk9Y2/Zf7NQe4V6UoM=;
 b=E+9I/f1kNjWn0rEjkD3kblyn1fN2v8naIj1Ne3qM9HDGj0jiSkV5aTWafNWf6IPrQetiQ30ySnt8/IwZ1fmunUiAyPjdcXjNNtjiD+FdQN4HnoXkfBG/aWP/Ptl0c2RDEaMSZnsCApbDGEjOzVjVF9iRc1PzMcE4wl1qbO9p0hXRKjPXvszhGmyzbEbmIZ+KyeYLdYH19Cf9FarrWsrs3/f1MUXDgjp6N602jN/S4wuVu16ALRje2jvDUG9EHZAd0kYOOYyN17Jmxg6soc69EpT9tHXDB6w5p3rmc2T0fAKY6yxog3cuEKH8J6IslgiSgprXEBYXK7yVnMYrbWhQDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dc05c9f5-756e-576a-bb89-6cfbf310e5ba@suse.com>
Date: Wed, 9 Aug 2023 08:32:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH] xen: change parameter name in monitor_domctl()
 declaration
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, federico.serafini@bugseng.com,
 tamas@tklengyel.com, george.dunlap@cloud.com
References: <6a25e9d729e85ba5712fd00f9c0514a459bb7631.1690471420.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2308041438170.2127516@ubuntu-linux-20-04-desktop>
 <4722cb01-2e0a-6a12-b398-0ddd024b50bd@suse.com>
 <alpine.DEB.2.22.394.2308081313100.2127516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308081313100.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7432:EE_
X-MS-Office365-Filtering-Correlation-Id: b6015a15-67b8-4b6c-b7d7-08db98a26b8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mTuWaqSCO0XI6Ghb0Dl0D5V7r6XKZ9/LnjmsCp/xa5u3KPkQuVbrkPlC/LIyjwQS96cvOuRoegMH5ExoNJHp9VAUrTH+IDXFeb9xC4eqLX+Eyu6cEPKayRDltpAeXdQX4OyKH8rGAdChnQ2Eu0l5BLobGi/XA1EGX2qD+DpzR5vt3IoNiDE9Brsk55M77OGS7/KVZB+T9I81DCRiUql34DnZWP9PCgRfewWMtfJ0lI75flZo9b38HIPF86mv7LiV8QcueTR811arIc/Tmg0HRw5RetLOUxjS1JHoHgt/uqFyqWG2/6SfyX9cKHjoPtNrEDeejFF+mgd+pctWMo9gYtm/Qa9nycCGQBn1hKGxiOrqS24qOXwIZAmchOdL0K2rEZyIaeYMm2sF+6kox2q4lI7sNOZlIiEQVqbmri185Vtyi4VN0JoasuXjdLqEb+565HiF+qB0/nKBSbAqd5UGuUP9QIFGfTo+EGH29nitA+eZ6UtCRxjJVdeFxdWA6dFewYx34/cNX7p0T3qyFohnDTcG/DbYxAN4TkIg7emAuAs+REIf3z6oMOXN+tNgk0ki6CJUsEYRIcHwhwnwqP+hjzBFOvDqHu0yyLNClc/M0iK+m1GT5Gy2RP6fLxbVRr9l3DuIxK98Qg5ka0HQGLUhng==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(366004)(39860400002)(136003)(1800799006)(451199021)(186006)(966005)(6512007)(26005)(6506007)(53546011)(54906003)(36756003)(38100700002)(5660300002)(86362001)(31696002)(4744005)(2906002)(4326008)(6916009)(66476007)(66556008)(66946007)(8936002)(8676002)(316002)(41300700001)(6666004)(6486002)(478600001)(31686004)(2616005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUxMd2Z5dzVqQ2p5ZEdSdTkrMEwyUk03WWpWQ3phdkhiMjNZamRta0NNMDRE?=
 =?utf-8?B?RmVjdEFIYkorVTlISTZTWlJOa0drUzdtU3I1NjdaZm5rSmIrQ0t3M25Ed096?=
 =?utf-8?B?bnVyWm5laTRFano2dEo2c2pLWFFYRURvYVhUQlFDZldsS1hBRkU1aDFrdENa?=
 =?utf-8?B?Q2NnaUdYSDJoL1psSmIwQjl0QTF0Nk5ZUkNwRlpPQW1nKzlpekpKdGVKWGJZ?=
 =?utf-8?B?VkNJZ0I4SXN1Uk5WL2RJYnkyZXU3WkEzRXk4bG8xUzR1bi9RNmVPazdKT05K?=
 =?utf-8?B?SmF0NTBxR0U2RVdHMVBvbVBkTHgvTzJkOWhkZ1FNWDNYckZuS3p1cjcrc0lH?=
 =?utf-8?B?ekJmcXRBMFJyZXRzSGVYV1NTSGlVM1JSb2hlUGVxU1E5dVRldno0cFRtZDZw?=
 =?utf-8?B?N0tYMi9sVHdSV25yRHp5d3VvaFV2VU56T3lYQ3JUald5UG5lcFcvSW5Cc0hp?=
 =?utf-8?B?QXBpT1pKd3lJQkJ6NGxFOEw2UUZ1MmYxdGh1RUdhcVp5aURMVmNlWlZDM09s?=
 =?utf-8?B?U0VlVFcybTdoK0RZQXI2U0V3UTV2RnVFejdPSy9UaWZZSmR3a0NzUU5ZcUV0?=
 =?utf-8?B?dWhuaTFDYndxVm9hcEh2UGJKaEhuVjZWMjRLVWNLT2t6SFpwZDMrWDR1S0pi?=
 =?utf-8?B?eW5YRXErZDI3YVlzUHJPdS96RU9xb1p5RGsrS2JYNWoxYTFrM2tHSDRqZzdD?=
 =?utf-8?B?bjlaS2x2NVdXWXFzcGoyYXVoZlhJekIyUDI1QUFjS1pSYlNVaW5kRWJ4VTFz?=
 =?utf-8?B?MnFqMHlVenhQV2h3MjkyN3U5RWh0YVNuZTU5Wk12bFJCd1JyeFR3SGdMYzJp?=
 =?utf-8?B?WnNJWHV0Z2FvNGM4RDhQTmtoVWNtRlB6UmtxRHErcUhCUkE0NHV5andaWEhn?=
 =?utf-8?B?OTFqeW5kTXVGbmpFTkJ2L3E3bHZrRTN1TVVLRWhKL2hJa05VbXFPckNOSDlu?=
 =?utf-8?B?OGVLdWRQS081ZEdHaFpnb2t4OEFCbE9mUTlvK0wvVzlHY3dDalBZeDhWTFJC?=
 =?utf-8?B?SzJhOU4zQ3FnRVlVeHRlZU1GVTRFVi92OEVDb09hTkdBd3pnc0ROd2xUYzdS?=
 =?utf-8?B?d3h6Rjd1K3hkVk0rMjVCNUYvUUdHbGZIR21TZ3JpbFovdHhjOUhjSXRCSjNl?=
 =?utf-8?B?b1ZpVVVEVnJMY3ZBRnpjSWVITzBPQ21FMGFKWmxYS3JaenhHTkNyT3Q4dGhC?=
 =?utf-8?B?cVJFTTVtT2llZTR4Q0M3Rm5ScVNTSXZEa0pxMWNaWG9VdkMvNEtPWEU2L3lT?=
 =?utf-8?B?VXF6Z1hkNURkV3V4R2tZd3ZlekxJT0lhWnc1K0xSRUt0SEwzVVRKY3pjQWpY?=
 =?utf-8?B?UXJZN3hmVWtHY2JsZk5yaDVvVHhLUnNla1FSNE5SODA5R1JlUVBoUWN2N250?=
 =?utf-8?B?VHcvWXpUa3czMlFiZldvd3lNWWg0MkkydmIyaFNjSEtNUlFTblpMdEtIODkx?=
 =?utf-8?B?bW95UlhmY3RNU2pNRi9ra0xLcStnSy9GNC9Ma0g3QSt4WHZ3NjFUcFNPellO?=
 =?utf-8?B?MTF2MUhod1dRZWRVdm85Um1jaU5UNjlYRDNqQ0NIYWRsbDdtOXlRZWloMEs5?=
 =?utf-8?B?Z3h4QnVUV3VEZ0pkMXVYTm9aOHViZTdDMFVoWE92UWRmcTNEZkpENTY1UnIr?=
 =?utf-8?B?WFo5cUlWZ1dFajM2dnYyKytjdDMwTCtnZVVjeFNNMG5kaHVQUU1IcUpZVnMy?=
 =?utf-8?B?RFVJa0lVUm5JMG56STVWK0dZMDRGRjgyaTB5NHNXMGwvbTF4bGtYZlRidGtw?=
 =?utf-8?B?YWxCT2QzeVZVa1VadSsrUUwyakJxcG5Sc0VsV0ZCSUdRYXg1OXZqYi9zTFlU?=
 =?utf-8?B?b3lkZTlHQjJkY1VuSzNHTko0bnVSTzhROENkbWdTL2tSWlp0SGVxampBWmN0?=
 =?utf-8?B?ajh2MXcwNDMxL3Z6VEV1eW9vSDVYVnN4aCtKbmtueHhocEIvdVFkMzk1aWFi?=
 =?utf-8?B?SDRGQU5OaDdxaHdoY1NVbS82aTlGbXJCTjRMVnNqQjVodFdOQ0xvQkZ3K0p0?=
 =?utf-8?B?bm9tcWNHY2FlTHFjaUNEaXFVZzZTSHNsRHZhZWxhaHZsUEFVZ1BuUWg5c3Zj?=
 =?utf-8?B?aFhkeUQ0NEVVdjhmWFRJanRSY3VwakNBZjBhV2Vub1g5aXJDNDN3WjhmUkNF?=
 =?utf-8?Q?w3aN3raJY/3hFH2ci0IpPzY1H?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6015a15-67b8-4b6c-b7d7-08db98a26b8b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 06:32:36.2370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KfFwdZjp627pAv+MF7V0GjDRmEeArBuGjaFxHQvIP5JYjMEyfpgoMq4Px9w+kXGvbGmpAbvC39QsFyDKsGmW4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7432

On 08.08.2023 22:15, Stefano Stabellini wrote:
> On Tue, 8 Aug 2023, Jan Beulich wrote:
>> On 04.08.2023 23:39, Stefano Stabellini wrote:
>>> Hi Tamas,
>>>
>>> May I have your ack on this change?
>>
>> I see you committed this, and there is an ack in the commit, but I can't
>> see any ack on list (incl when checking mail archives, to exclude an
>> issue with my mailbox).
> 
> That is strange! Something appears to be wrong with xen-devel. Adding
> George in CC and attaching Tamas' reply.

Yet more strange: The attachment (as it arrived here) is zero size. But
I can see it at
https://lists.xen.org/archives/html/xen-devel/2023-08/msg00959.html
Part of the reason may be that it looks to have been a HTML mail (which
it shouldn't have been).

Jan

