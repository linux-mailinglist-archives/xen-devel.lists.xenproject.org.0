Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0C96B7471
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 11:44:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509221.784567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbfeg-0003s5-1O; Mon, 13 Mar 2023 10:43:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509221.784567; Mon, 13 Mar 2023 10:43:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbfef-0003p4-Ub; Mon, 13 Mar 2023 10:43:49 +0000
Received: by outflank-mailman (input) for mailman id 509221;
 Mon, 13 Mar 2023 10:43:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddKj=7F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pbfee-0003oy-EY
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 10:43:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eea50965-c18b-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 11:43:47 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7062.eurprd04.prod.outlook.com (2603:10a6:20b:122::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 10:43:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 10:43:44 +0000
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
X-Inumbo-ID: eea50965-c18b-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6RxiQtilr87i9SQKPaoawl6tfcJNdC7EnPmz+6LtD75SPTV6ThXbraUCVC1rdiKmAG3Z8hd2qE++7fo8JOrBscHAcUrIpDEK1BJdq8MAagrWPgBSjeFAufrqgNiKN7w+km72975mwy2fa5k798r0oSYATIwKfQ8LtiKYOpBbdERHH+ehO+PaR1pfBH64miYjrPC+YwhMrhjd6iHfO8dv7atYZcQLYxueAFjonGZniPw/74UDXrHs+q83uGq9Dv+C/EwK2woOaihAFxPnhaPntZl8/C6ketwlA/i+J5YTTqymCPNXFSrOvU3ufpISd7+tj9RpDvbyHQEwfZbcSkG4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NLXTgMwnthRFiNAwvuXBd+cbVpr8O/8Brs17mpEtHQ=;
 b=jJHUWKh4fWASvrdSSyXflxSTH0094+eR8QnpmUPmJb3aQkEmtWyKMp68lJB69E22leSifOn+WKnGnYJET80Jg0Zllq8F16KVN3Tg8vE4JRIKN2sJ30UY+oUYyEIVaihJdY96l7JYVTsDTe+UOgerkprOhrmAbPnkBbFORfuiLkoroy1g87aP4LJ/1B7nunauY5hAl40Q+TXgtSKyn7HGR+lSg5CaQwsBWCBxkbJcUKamiTJcq7va78+x9NplngKLDG1ilan6hs9QBH1whfGPprS5JbCWh8ltymMm7BjPFU6lg9AN6Rq/Mm/co53YXGTC++rt1he/UOzc4oY/cfhg1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NLXTgMwnthRFiNAwvuXBd+cbVpr8O/8Brs17mpEtHQ=;
 b=pHBYHfiTT5D5ViAcSmJxVpHdRu5vpPuWykuef8SoKiaQ1iBVtrc4KPjG1hqtuG6GNSSnSc15j2strswdp7Psd/y7FS1z9GMq1E7uXYk9zqXBOPOYw+VPCu6xD9tkjRGe8YdSdxNi4GNgenAoyLDHRTWfM6Y4Hw9REClalQ7gOJ0B26/VrJZryeMXfj+++0Efl69dTJCrAsVWiyw3WQ6BzXMbrIWOqgJ6Jp/EEUNon712JB5SWQ9NpZ8zu2CAALZbeRoBrS3IPttxf4aJFX0ApugoAnoQk3Smuq8z+pkk8e0mPd7MwXfiakBpAa6YRL92Jrt5AlCqEJuXW0SGuxCTtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9833177f-9dbc-4f19-a892-14b63629a91c@suse.com>
Date: Mon, 13 Mar 2023 11:43:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] tests/vpci: install test
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: andrew.cooper3@citrix.com, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230309165812.33918-1-roger.pau@citrix.com>
 <f2c7a5db-80d3-a89b-dff5-250eb18bec14@suse.com>
 <ZAsyxw6VvQHYrksG@Air-de-Roger>
 <29c3e26e-e6b2-1b2f-b442-d468d8abb505@suse.com>
 <ZA77aJM7/6dhu5F1@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZA77aJM7/6dhu5F1@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7062:EE_
X-MS-Office365-Filtering-Correlation-Id: 801e72eb-314c-4d5a-eada-08db23afd163
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IVjlZFZjhQMH08p4FymsC/HoVixiMlu277zEKzGFvYOtPy0d5szcBvKygWdgVV9bCBmdn7whboBiq8Pgb8KiRcGptl8/RHWlsPP8xtv5NxZ9zIQzpFjgaGYNGngCsjTdBRAYuP3wKhei+z+Y3P9scuoEs1KHWDCSLlWS+X6g/P1IUMbo4lWwrEJOKhtacHrIx6uYfrk0RP22NdPRL4k76n2Pk26pCNsln2+qWomzlIro25xAcGhqnkjZ7/K5+WnPXIHbinrd7wAVkXb0JpmqyuoZK9HqnLzyjl9RUnCSIchpQA7OF1mbvAoCWbNYUbW6qPpQinrnT31epbC7CGAUMjiKmXbO+bQxYhlbHhlIqSmiT6qQb52Hlx4T2Vai4EjyBjFiSK6v3vpkosPL/kcKxIJkP4wU8RcUUCkWozPXNvvgKyc7aSSkx0vACzmeKrBHPdeSZC2V2MTS+OadXv2wjYeEz2hqHGOWhtu0tmYbE0O/2D+5dP3CeZmUhnfLOHSXXPrFxUdgxfv08objJtxfVc4bZKR0amkl/r3wjYr6AgtEblPmhpXObJwtX/9zZFUnup64VMy4NIyq5KHfjVoonTb7bWaQPvpOz5t+mwcFUokjLr1UKbLhVjJ34EEd3kWLXX44yKe4uYxyVrumJVzl90d+Y7WjZc8hR0DFRmqWoBt5/HOo2e/7fjr55PEMKBf/ShHWC+DiVnWyip+S0zr1VSMN8//WBaimDBvj4BtH898=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(39850400004)(346002)(136003)(396003)(451199018)(5660300002)(36756003)(83380400001)(186003)(478600001)(6512007)(26005)(6506007)(6486002)(2616005)(53546011)(8676002)(66476007)(66946007)(66556008)(4326008)(6916009)(41300700001)(8936002)(86362001)(31696002)(54906003)(316002)(38100700002)(66899018)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1VZcUxLdVdhaHFQYXgzeS95aTRCRWQyNGdGT3F2eHJFOVdFeUgxVm9xcDIz?=
 =?utf-8?B?V25DZHI2QzdtWGVVazhNMmU2WENSVXZKcnpVTnZ2UFpmNWp3MjZqSUdBcFAv?=
 =?utf-8?B?TG9iQzdNSW9rUWEvL01JMDFHY2hRckVXOW5kRkUwZTcrUlZqZE5VckhjdGVi?=
 =?utf-8?B?VlNZaEVaMERpUFV0M3pkR0JyRkVGYkt2eDlLVzV2dDRZTWp5TW50MVdwdHJF?=
 =?utf-8?B?QVRlQlhwV0kraWJEMlBaQmpSMmVvVkFjUXNtb2VFMHNaZWsxeDZPbVlCSFFC?=
 =?utf-8?B?TkF6Q2pabGpQa1Y1cW5Kb1NJR0ZOOVJVNEo3ZldlWTFqSkI3VXBqMEtKakx1?=
 =?utf-8?B?bWhYUzNXaWl6SmxYTWtXTmsxdDEvbnAzR1ZKdnR0d2JTT0ZDdFo5QUNhYmE2?=
 =?utf-8?B?M0o5UXBieXB1dEdMbnRzb2FUcGViMGM5UjFFejNudTJEd001c0Z1aVZ6bGgz?=
 =?utf-8?B?Tzl0NjNGYmplelVMbzI2U0dzeEczMURMeXl4UDNnbEdBQ01BRmlBcnZBblpM?=
 =?utf-8?B?SmlxVEFXNEdZazNGRGQ5SzBac2dvNllrb0taeUxaRkpTQkN0R0tsVGlnT1F1?=
 =?utf-8?B?YVhmMGtYR1dPZXordXhTOTZmUlJKUmpGSThaWmIvaUhaZDRSYkZUbEJ6SkUz?=
 =?utf-8?B?RmsyZkk0aFh1RjJWUUIxdDQzRTdBSlFaVDkydUtLSVNldS9JNXFxNmdIcmtE?=
 =?utf-8?B?SVQwbDBYUEZSS0x0NGJtYlJkT25HVi83WVVUVVFEVzZoVER1QkJ5b1p3b1l0?=
 =?utf-8?B?T2dhN1FYRVY3dHBsTE9mdFgzQkNiYlludGRoc1AwNXcrTnpHUGZabk1OV0p1?=
 =?utf-8?B?d3FpL2Q0aUg4MUozOWpWMEwrSVMvNVhNcDVhRUlUY0VEbHFnaEJqWG5IWkl3?=
 =?utf-8?B?NjVuTU9jL0FObnFNTm4wdW9ONzlXV2lkN3RBMGtTc3U2Q3hwTjIxMnJIeC9S?=
 =?utf-8?B?WVE5ZWlvTkFzN290bkN3OVI2cE9jbTJnRjZDQVMvaE1vdE40NkJVb2FTa05B?=
 =?utf-8?B?RHNNczYvcTB4M3BhRXJWdEorTW5IMzJKaFhHRXZSa1dWYmlCRS9qaXN1ZUIy?=
 =?utf-8?B?NC9HNjlkTUJraldSNzRuTlo0bFNWWjRyL0xHUGNpV0swbzlIN0RuaTg3bUNw?=
 =?utf-8?B?MlZNeGFnK3dTWTBjRXNJUzRiM2dMQWdUbHVkZUZhcUFWR0VtQ3V0cjdJUE0y?=
 =?utf-8?B?MXVSeFQyY1ppNWpHY0FHd2ZvWGd3K1htK0RvYUVEejU5Z0FRb0Y1aC91dTF1?=
 =?utf-8?B?Z0tIeTBja0pmUlpYcExDNHd5S1ZIUk5DYVgxTXNCcHIvRUFIaGo1UEM5SDFj?=
 =?utf-8?B?dUsrMVByeXVpaklMVUtyL2dsVHVRWGhNZTVGQ3BMSS82eExWL1E2eDQzZEtp?=
 =?utf-8?B?OWhDcVZ5KzZYNGlyWXZkbC9BVGlpTEZRMjVPemtmR2tBVnMxK1pzSlF6R2NO?=
 =?utf-8?B?SW5kTm9CZzdMYmY2WXlxdnR0MlpuYm8xTFBabnpHK1I2b005c29HWDJ4ZThw?=
 =?utf-8?B?bldOMlh0TzR2NmtiS29XbHFKMmVJa2dTYUZmZHdZYzdycmhpNjhrWjJ6TERM?=
 =?utf-8?B?WFF4ODQzejdER0YvRXVmbjN6eCtrbE5GaDBaVG9FajR5Rk4wQkFLZlBCR3hT?=
 =?utf-8?B?ZVdRVERRQTVId2hVUGdWU2RsbWl6K2F3OURZUjEvS2FVZmM3Q3FwWWNhT1lS?=
 =?utf-8?B?OVhCOUcrWE1ZUExQOFUrOGVRcEJ0YzJwK1VZeXBSNENjMVN0cnNNWWVEb2Rr?=
 =?utf-8?B?eWFVU01pNlhIai9BY0pUaTBGK05oSHZjVjBYbmk1anFUZ0VNOHI4RitHcDRF?=
 =?utf-8?B?dVNkNWRPMHdTcmVQMGQ0YnNsMEwzei9iTlVGeHM4UjJLKzY0RUZzckl5WDBp?=
 =?utf-8?B?L29pWkFjWFREblVUd3JkZ3l5V0RDekRLVTBXN0U3Rmphb3lHbVF0YWs3aDFM?=
 =?utf-8?B?cmZUWnVwWUJCay8vb1hjY09rZnQ0aFdSQXZFdEV2SFZRNUNmKytPNE9CM29o?=
 =?utf-8?B?OFBia1Rua3J6VlFxUHhIWnRRSFMzdTJsTkUzVm9wK0pZKzJjYnovTnhKUnc1?=
 =?utf-8?B?S21meVh5WE9HeCtyZEJwTE4zYUpKaDgvN0lXc1g0YTJJc0IvS3FySUVCcHFj?=
 =?utf-8?Q?44M8X5gcze9VAo5wRQbil3Jf3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 801e72eb-314c-4d5a-eada-08db23afd163
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 10:43:44.3854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMcE/fXz1Q5+FroCsTJ1HWNUsUIzavyi8228pHpBngw+CkM9r19f66m1xQNEvwRaW4dRvYVrAt8nWZh+aq+DdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7062

On 13.03.2023 11:31, Roger Pau Monné wrote:
> On Fri, Mar 10, 2023 at 03:32:41PM +0100, Jan Beulich wrote:
>> On 10.03.2023 14:38, Roger Pau Monné wrote:
>>> On Fri, Mar 10, 2023 at 12:06:29PM +0100, Jan Beulich wrote:
>>>> On 09.03.2023 17:58, Roger Pau Monne wrote:
>>>>> Introduce an install target, like it's used by other tests.  This
>>>>> allows running the test on the installed systems, which is easier than
>>>>> running it during the build phase when dealing with automated testing.
>>>>> Strictly speaking the vpci test doesn't require to be run on a Xen
>>>>> host currently, but that allows easier integration with logic that
>>>>> runs the rest of the tests.
>>>>
>>>> I accept that as a possible way of looking at things, but personally I
>>>> remain unconvinced of this model. To me what is installed should be of
>>>> value to users. If there was a properly separated directory where all
>>>> (and only) tests were put, I might agree with installing. (Nevertheless
>>>> this isn't an objection, merely a remark.)
>>>>
>>>>> While there also adjust the makefile to use $(RM), and rename the
>>>>> resulting binary to use a dash instead of an underscore (again to
>>>>> match the rest of the tests).
>>>>>
>>>>> Since the resulting test binary is now part of the distribution CC
>>>>> must be used instead of HOSTCC.
>>>>
>>>> This breaks the run: goal, doesn't it? If the new mode is wanted, I
>>>> think the two kinds of binaries (and rules) need separating (maybe a
>>>> way can be found to avoid duplicating the rules, which would seem
>>>> desirable).
>>>
>>> The run rule is not hooked up in any of the upper level makefile logic,
>>
>> What about the run-tests-% goal in the top level Makefile?
> 
> Urg, I wasn't aware of that target.  I assume just removing the `run`
> target from the vpci makefile would be an acceptable solution then.

I'm afraid I wouldn't view this as acceptable. I would very much like
to retain these run: goals, as I view it as important that such tests
be possible to run easily and right from the build area. What might be
acceptable to me is if ...

> It's still the user that needs to explicitly call run-tests-vpci, so
> it would better know that HOSTCC == CC before attempting that.

... the run: rune would be enclosed in "ifeq ($(CC),$(HOSTCC))". Yet
even that is fragile. For tests like this I view it as secondary to
be runnable on the destination architecture, and hence I continue to
think that if installing such tests is really wanted, binaries for
host and target should be properly separated.

Jan

