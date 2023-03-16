Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DCB6BD496
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 17:02:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510697.788879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcq3S-0000qM-O5; Thu, 16 Mar 2023 16:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510697.788879; Thu, 16 Mar 2023 16:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcq3S-0000od-KO; Thu, 16 Mar 2023 16:02:14 +0000
Received: by outflank-mailman (input) for mailman id 510697;
 Thu, 16 Mar 2023 16:02:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcq3R-0000oX-8G
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 16:02:13 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe12::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8d364ec-c413-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 17:02:11 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Thu, 16 Mar
 2023 16:02:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 16:02:09 +0000
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
X-Inumbo-ID: e8d364ec-c413-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QcML9wCty+SneC6QGjLrgocADXY4ZooD/4nmdamHXRtRAMKLhnlY+2nTCsKqOov2GjehaCKWibENkaGsDlYE1pb9s8U9pMKeaEGZ1ZjeTrgQt9bvNJRZnmiROJ/IxcUHZmWQ0Ow5CbFIUXnRPUjGY8Za26XCqrDFgU1zO5IvYK4TQBKJy9B59SOxC3AnTe1FrbVr6qdLXJT0UuiHjXZCdzjlQQl2pP5jV8NDij0vHSWD7XFRzrn2/+FYbRHa6P3cBV3fTxSQ0ZRD2hMzcpKSkmsS7LELJTw1FhdGS5H32jjl3aa1QmSgUjAbDsYSsFjyxP2MHs0lu5fb94ooqdF9XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJw+kdHW6nBpOkf32c4UzYbO+1SkkSt7A3sx7OmIXQ8=;
 b=Txa6o1/kqQvOX/LRhyxhVA5Dt6PHg/Mejo5YwJ/sYXtACN0uIYOQhoc5RPAi3nycxhtQVbMSpkBOzojpGeALJWZa4yIpdwBHR6f7a96U+yP1G6c/acxhgcvHakFgWIIosw7zeXswlnqXyXDmhro3htI5Hq+0zv5+oOSQ0Ltiz+scHQ88tAlRYZwBKjpdB1KvKx4r4Qfq2zJWrZn0rzps6is80C6qWMMUxwuh1dCAMFe5HLOJBuBRC+vmBZK91oqe/FkhWloLcM39bd2pgsSs77bb+Yf7dSMM1ze0etF9Kazdtvfnw417iLwIW/PZkGkbcaOgYYHBWvgw4RrDaMQRNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJw+kdHW6nBpOkf32c4UzYbO+1SkkSt7A3sx7OmIXQ8=;
 b=nO3Lp5pvJHeVfJ4+Jy5NYKDamy4LvVahu3BzwEakioTrdguk9ZWuKSBQ9GBSzQ152SXpn2bZ1uzdLZ0/rjQehX65Pbz/E/WeDr8hdsaRTsqBAPXIMcIQW5IU9PWhuyKrM+YwoxqGN2P6uEidZZEt90UacWMx8zVgVdqSD8xFZ2nUVysTlCPwmN0bLZIzK1zvQrtEs7QH+q5jmHAO7E0fQXusLurXAu9AgeTq3jnqj8Fr17jmT8FvXEVhvoFbe3EvINgADc+hjBuwT8XziKVhlshp0slpDlXeYEEywTZ5k10FNn9yyajsJKbfmAcYisr3Tfq/WaMJqea7uZqGa6kX0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0373ab35-d51a-83a8-e0fb-f8f5376bb983@suse.com>
Date: Thu, 16 Mar 2023 17:02:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] xen/console: Skip switching serial input to non
 existing domains
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230316102635.6497-1-michal.orzel@amd.com>
 <d9654392-ce4b-07b6-9be0-7a6d4230c287@suse.com>
 <2cfc0751-4360-5899-c93a-56ef952a6b2b@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2cfc0751-4360-5899-c93a-56ef952a6b2b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9642:EE_
X-MS-Office365-Filtering-Correlation-Id: 68d24b38-60cd-4c13-a91a-08db2637cc28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	btpWjcBenv29BxgHkKvb0KbKXx9Wd06p8XnH3nBA0LPIu5NkqaRljgaY6gWc61ZIsK84uv6nZjR2iGcz/v7ngFHGWTZcZ4jhrr5tlwclz8CLMsK74ToF6x2x53y9aPiOKnvddIyqH/t7tlGje9iQkVhUQ+04ZBtC2liT39078kOfekXhvWpWhFnQDT34uSKPFwvvofdcBVzephMYynRwY615hxMJNq9ZXvLcAeoyYMwfksXlVpFw+6IbbnYXuJj3zpYyWDMfaOj5CjPLkkNRHa/kaHB05D3OACNmmp4QIWWbJ9bg6GNsWWMkEeU4/YaEtEyXtWa4uik947HlzKu9/RTo9cYIu2jH0L52wbXicMFz+0d+duoY7sOAUCNL7ZjnIfoIzAbttYCfxwO4R6cvU6bN1R5izX9dVLF/UO9Fu9lwU8hKEbBL2kivMghbfxzapipV5EeAQB7wrE3Shg/DrksDymD/ybVOguT6UsfRKJ3TFmx4Uyve7EFBWVMgj5WJq65L6/XEYUUWD8Lbk+mBMqvYf68Nt9LbOjrYUkDH2gy+90tR9rGctrrj9VggSFFbXLqkzsP8BgTr5vIApZ8PlEewPN815WqdtIEXVnA+1Axq/zOtDPmb8B8EkQaf81eMx6BbxnuBFLtXOgF/odLO8qTmKrh6nkRvgUnw9EONmkf/FrDgyKEGFvHdVVfZAMo54b3VHIJFmnEKop3XF7ZHHDbfSmStp3cbMqEbjxRGjDQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199018)(31696002)(38100700002)(36756003)(54906003)(4326008)(41300700001)(86362001)(66556008)(8676002)(66946007)(8936002)(478600001)(66476007)(6916009)(316002)(2906002)(83380400001)(6512007)(2616005)(5660300002)(6486002)(186003)(6506007)(26005)(53546011)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnBmUVlGTGF4WWRyWENpa2Y5S2JoZWhGUUYvTHpodmw3bXhqSUtleGRrUEZz?=
 =?utf-8?B?bE10c25OZUpoNEVLbm85N1FoSzZwRVA1TURiMnU5TEJhdk9lSFhKZUIxT0d4?=
 =?utf-8?B?QnBNVGk1eFZHTTVSSTMwQWJlL21iU0lCZlI0emJ6R3FJaTNyTW1FVTdqK1M4?=
 =?utf-8?B?aTJOZTVPMWlMK2ZBb2FVODFMUHplTGkwekFPSDcwcVBLMHorZzB3WVF1amxZ?=
 =?utf-8?B?R1NYNmp2L3Y1dXpQYXFObXIydkFEZGVFSXIveWFienNEYTZmYjlhTjVJVlJG?=
 =?utf-8?B?dkJJVkN2MnhEb3JkeXRKRW9mWnlaUzh3QUVjS2RvYzBFUEhYaUtEcW0zNmEx?=
 =?utf-8?B?S3hacGgyU3JEWldwSS9JQzJFR2EwcTk5M2VZblJKZU5LeFkwUml5N1hnbmh0?=
 =?utf-8?B?Z3U4bWx2UWlQamJHdlQvUDVnUStqVzR2U2h3NDlvYVZwWXdwUFN2MVRYb3ZR?=
 =?utf-8?B?WHJTR295Q3RXeTRKbUd1OUorMUtoQUltcThWN2VqWjJVRUtERFpoYWp4MFVv?=
 =?utf-8?B?NUV3ME13MEQ4Zi9NZlJKeUhtMGdNWm12c290K1ZhQzRjUWNGcm8vYk5MSFNy?=
 =?utf-8?B?VGJELzJLSGZQaXB5Si92QmkvTnpKNnF6ZnFSMU1yRW5sS2lFLzJZaGxCOWRt?=
 =?utf-8?B?WXgzQ0VEckZBUHRSc09ZWDROb2RZcHZIQURUYkdsd3ZuMmlERkRjcjYvdEJs?=
 =?utf-8?B?QW0wUzgvMC9DdmtPOVBJdlJlYUNSdDNsclFIa3g0dE52MHNHbDB2amVob1g2?=
 =?utf-8?B?cDFCcThhMkI1VVkvQjhEVjYydkhHTEVUUzNxV1J1b2VYeHZXeWhPb2gzWW51?=
 =?utf-8?B?YlllUmtDZkNjK1EvQkd4Y1g3WndjRCtqeW5sMFFyMzE3czVoaklRbkhxRXhq?=
 =?utf-8?B?TXcyYlY3RUpBS2RMTGlQUVdhUE9NRGlPVkRUV0FQek5nRWVtRDhxZkM0MU5V?=
 =?utf-8?B?NTk3MlVJTGg0VzZCWGVUeHhqdlNheGJmZUhFODF4ejEvak1JYkphRDdxZElt?=
 =?utf-8?B?VkVqeERTOG1oMjN5SmlSb3IxY0tRWHFsZ1ZiWkZFa0Fhc0ovMDdqb0ZnMUZn?=
 =?utf-8?B?QjE4cFpoeXV4clIvQURhRTlMMUwyQTFpaWFLVVFrWjRvZE85WHJRSHdQRkhR?=
 =?utf-8?B?emdTdk52dzNHcElwNkdIWjV0WHo1bWErSDBmOGN6N1J2QjBaR25mMWIvMnlF?=
 =?utf-8?B?dXJmano2cmprYmJnakFWZ0NwZDRnaHg4TmY5NmJVYWFLZ2dOQ20xYWplNk42?=
 =?utf-8?B?Zi9nTG8yaGVzeEVRMXFUdGJyZ2N2NFJKMURsRm9MT0FaK2FvMzMrTTQzOHpZ?=
 =?utf-8?B?aWl5aVl6MnI0OWs2S0g1SWtqU1ZneEhLaGR1SkZuTlk3SWZ6ZFhZZnA5djhQ?=
 =?utf-8?B?SXFlM0ZJdmFpSkI3czdVcG0zdlpjWmFNTmJGQXBNdnNHVUNSeWFqVFdDQnJi?=
 =?utf-8?B?VHBFa1NieWNNNVY4YytoT0RxbENZdUhRdmxaaCtHY0xrNUowSEdranR1OTJF?=
 =?utf-8?B?TDdQaERwanh6VXkzaDZ0WGNUS01CdjFtVU13THJCUzhKb0c5RlJ4QnIzaFVq?=
 =?utf-8?B?QmxvN3RuRE5mQ0hBYnN2NWg0OVlQN3FCTldQczdYYU1VcnFtY2R0bmxmOGhz?=
 =?utf-8?B?OUZHZVFZRytDNHVyaGxpSUx4N1JsTWJBMWpzeEJEVlZqZ0tVaWpmcUVPZ01S?=
 =?utf-8?B?eXZIbEE3ekU1bmdWYTZxN3NKdldkQzY3amR4bFE4YUFYRFZLY0VZLzZudzZr?=
 =?utf-8?B?emo4c2NvY1d3TEpTZ3BQNmtBYkxsZzY4YmdQRnRzOE9seU1QZ3FvOXczdVpO?=
 =?utf-8?B?SWZkd1FDTGN4N1d5M04yRys5cmxib2w1SkFlbWtLNHBRU0QzYTB3aWhJcjJx?=
 =?utf-8?B?OWJLQTA1dkZ1RXhtNm44Z3RzZHArQ2RVcHhZUXFGMC9PVmVyMHAvb3FSaW5q?=
 =?utf-8?B?YWpRMndqNEVTbDE5VU10Qm8yS0tER2FEbytMV0RtVEFvTDFFUDgwMThDUzFa?=
 =?utf-8?B?Zndicnh5UUZkYktYeURhdXhQK3JFRlBWSUNZNTREcTJJTVhDUWFZMWI0dkNR?=
 =?utf-8?B?MzROWnpqYzI0RFo2VDlpV0VERytNK2RkUklFRHZ0L3V0TDNkV0xQeGVzMW9P?=
 =?utf-8?Q?P27sg8nt907end5bUsKpI0N5R?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d24b38-60cd-4c13-a91a-08db2637cc28
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 16:02:09.4736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZghTKQsUi7ewYdt/Bn+aBEC+MsOLnRjQJ2iTKigQMwJDqbEycCdlSZeaXDbvDeg2axDZZAviKkdCnZW2DHdww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9642

On 16.03.2023 15:15, Michal Orzel wrote:
> 
> 
> On 16/03/2023 12:11, Jan Beulich wrote:
>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>
>>
>> On 16.03.2023 11:26, Michal Orzel wrote:
>>> --- a/xen/drivers/char/console.c
>>> +++ b/xen/drivers/char/console.c
>>> @@ -490,7 +490,24 @@ static void switch_serial_input(void)
>>>      }
>>>      else
>>>      {
>>> -        console_rx++;
>>> +        unsigned int next_rx = console_rx + 1;
>>> +
>>> +        /* Skip switching serial input to non existing domains */
>>> +        while ( next_rx < max_init_domid + 1 )
>>> +        {
>>> +            struct domain *d = rcu_lock_domain_by_id(next_rx - 1);
>>> +
>>> +            if ( d )
>>> +            {
>>> +                rcu_unlock_domain(d);
>>> +                break;
>>> +            }
>>> +
>>> +            next_rx++;
>>> +        }
>>> +
>>> +        console_rx = next_rx;
>>> +
>>>          printk("*** Serial input to DOM%d", console_rx - 1);
>>>      }
>>
>> While at the first glance (when you sent it in reply to v1) it looked okay,
>> I'm afraid it really isn't: Please consider what happens when the last of
>> the DomU-s doesn't exist anymore. (You don't really check whether it still
>> exists, because the range check comes ahead of the existence one.) In that
>> case you want to move from second-to-last to Xen. I expect the entire
>> if/else construct wants to be inside the loop.
> I did this deliberately because I do not think the situation you describe is possible
> (i.e. no domains at all - Xen still usable). With hardware domain in place, we can e.g. destroy the domain
> which would invoke domain_kill() -> domain_destroy() that would free domain struct.
> Without hwdom, the domain cannot kill/destroy itself. It can do the shutdown but it will not
> destroy it (at least this is what I tested). So I do not think there can be a scenario where
> there is not a single domain while Xen running and be usable.

I didn't talk about "no domain left at all", but about the case where the
domain with the highest domain ID is gone.

Jan

