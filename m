Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 683497E9721
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 08:49:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631350.984605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2RhB-0006i8-KA; Mon, 13 Nov 2023 07:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631350.984605; Mon, 13 Nov 2023 07:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2RhB-0006g8-HW; Mon, 13 Nov 2023 07:49:21 +0000
Received: by outflank-mailman (input) for mailman id 631350;
 Mon, 13 Nov 2023 07:49:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OC0U=G2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2RhA-0006g2-8Q
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 07:49:20 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2674c018-81f9-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 08:49:19 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8229.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.15; Mon, 13 Nov
 2023 07:49:15 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Mon, 13 Nov 2023
 07:49:15 +0000
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
X-Inumbo-ID: 2674c018-81f9-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2zugJ0Ijrf2G/Ct3md7Xriuh67Ynt0qEGazpErXEYSTBEl0zMxEa6lRpJa+d3yx+4dRJIMiPyv3ct62icQ44JncBdh85/+2wfVNcS+ALrBf/9XpZlfuCPhqHTINcDLw+jYeLUoVHOG9gW/fo5SNbxgRKdkKJ13++oZrh41ovfp8kNIFidAnut8b67WxZxkYDomRP7UnASvUe1RGF+NXDxvkG21njrO4LhJ0WapMQ9FfglLgJ/ZadfBk3NIzqDc3EspAiFhLEp9jgO2XaGIaRSR8IiilzTNok5UB4534ZTkTGMaQm2iMrBFZWqR9k2z9IAp1nJLYlhyTnerUt4TrvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13evBTS3gLDxiaQDp6lh28J08Wm9BN39xCzkv5i+jEk=;
 b=oSQIhytHHMLjFsk2pSETOE6THztNyjvqIFCxWO4rJ410pTwQDMxfbWaC4/Nr7cvl1hrqzEf3Q7CGWBVBd7SzAYZZRxEQgkFdOfBJNc+COB02qT8SdgTwidEYgskispbBn6/vV0kVH7KDVasiUAmqjd0ey8AzvKbdva7WJ4P6cUrNLAT7q/gsRlDVJFvJeFy7/mFUFFQCCfLSrJLlzRWwefyRkmbepykpnWnvmyQt14Z/r8CNr4C0FZT5cOjRbICt6fcKGqj8P+crraMQXNsTg0PUlHCdb7R6taUjtgXdkF4gi5j+G5TexY8t27MOIdpsvIDv5wxCTUH6899iABYtvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13evBTS3gLDxiaQDp6lh28J08Wm9BN39xCzkv5i+jEk=;
 b=HFn2KIK3iAc9nr1AS4tnPxn8BdVfg6Fy6Rtz+/Cuy/4zWX2SWNYdFXEYDfNxBHICSZTSsNOU+LuXwDrGL11icwrwkEdLjXMOQJnngJkqrM/NYmGjPezQvv4KjIkRGjdLvznVtDpJIWQs/66CA6uQU+ppYqyqgdA31XHOUEcii5JqXptt0Xn77fzxIx+wok3SJ9ZafkuRvrqXSFE2iHDnzChg9s6rT/9MvhbDa2Xk9YazqqrmH6N0z+7NbNG/YTwMeGzuP5IdsRAzQ2FIgdoIO82QrKZ75Hf2ugoLo+jZXNDHK8N31ZuFiThsY5eUOw3RN6cEtcepCLcCWqa9ZMUmtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b0260269-a515-8fc1-12ec-f38e45451a45@suse.com>
Date: Mon, 13 Nov 2023 08:49:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC 1/4] x86/ioemul: address MISRA C:2012 Rule 9.3
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <cover.1698155925.git.nicola.vetrini@bugseng.com>
 <76c9f78179a8bb5b4f99b34f163933394f79066c.1698155925.git.nicola.vetrini@bugseng.com>
 <60e26ad6-7366-2604-e9b2-ed401cee6e73@suse.com>
 <alpine.DEB.2.22.394.2310241317030.271731@ubuntu-linux-20-04-desktop>
 <41562c7a-6260-3104-b2d4-d6fd4df0cffc@suse.com>
 <4e88d7ab94b9fc73554eee5b78612b63@bugseng.com>
 <8cb336ca-41ed-8adc-957a-28b5585c84f1@suse.com>
 <alpine.DEB.2.22.394.2310271419260.271731@ubuntu-linux-20-04-desktop>
 <9888aa5c298584c22cf55b13befeaaa6@bugseng.com>
 <alpine.DEB.2.22.394.2311101719120.3478774@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2311101719120.3478774@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0357.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8229:EE_
X-MS-Office365-Filtering-Correlation-Id: 46cc21c3-335a-44c4-1cd8-08dbe41d08b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yDpdvU9qGTYm0KIy2sVN0vfbDwjjwbHGujXFI7HZbz6Uu2Up0YbENzERaSpn6fInWVZ9YaS3Va+YIYi+YBcceAy0TCSClv4zepubYBoSWUg0iIFmUgtICQYJlNyqQ4RjcwVDTCBMGOK3ALSu7cBPmh8cJLlmBqq/v3tHrEXfPxuZDE6Nu3uhkt777rV9GqfStcoMeySNkTMBmMqX9YsIUuTqPMrvgCfStA/vhCfEvI7zs9Ng7kaDGHLJPPlTqscXewzv++oiHAVazYEdveeOmba4gGbH0U+VkP0btrI3i6/CvXs/ZgiLkUEwUCoMz9QMO8Z59oR4Fqa4w6sxeQoPauLOr2VtBU3VAigwj00cveaeGGqN86mwi2EYHAp0lBtqipAReG1FlrQkJIJ32N6hvfJGgvkPpBCXQEUcP9B2WDSGhgZX8OkTanzTGJ8uI6lPOwIgTV/k/yEn6yBeDBC4UVjPOar/fSEsndWgroGew9bkD1rYuKutoQGSNSr1YK8Kqv4C09xqnLSzEyM45yHFi1W8I0H4u864wP8NrKqqyqEquVEON6OaON6kDcSgiCXAJ2Mwx6B1KkdD+ZGj6n0+IPtuHF+A1CdUwIzble0skuPJSzbe/lFe+/Ftiu+5zVtTEEiUZr2CmwxPuAU1iwF+J0XFeGe0RZiImf5xEneL6zA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(346002)(376002)(366004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(2906002)(6506007)(53546011)(478600001)(31696002)(86362001)(26005)(2616005)(6512007)(54906003)(6916009)(316002)(66476007)(66556008)(66946007)(6486002)(38100700002)(83380400001)(5660300002)(7416002)(8936002)(36756003)(8676002)(4326008)(41300700001)(31686004)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aG0vZkl0TEUxWnhjdEN1WTB0cnNjZXh5aEp0cU1YNjg4aVVyby9mc1Qrdm5C?=
 =?utf-8?B?K0wwOHQ3WXpSVmQ0eEdvNE1BTElCQ24rQ3BNV0M4WWdvd1MwQlQxM1ppem9y?=
 =?utf-8?B?dnZPWmc2bXI5ZGpTZE9JVUp3ZW5xQ3VuWlJyZzl4TDI4SHpDaFUzZDEycFZj?=
 =?utf-8?B?SnVXck5TQjBMemRvQU5tQXVXVHdWSWwvbGUzOGV5OTF4cWJycWRmc090eG1J?=
 =?utf-8?B?R1VRSHQyQStKTHRwZ3hBRjQxdUlMeEdQOFFBTTdUbkIxMVpLQitlT3pvYi9n?=
 =?utf-8?B?VTJIRW0yOEp1OWFYeXIrQW9rN2h4Zkw2dEh1TWluei9RRGRENURjRXdKYlpO?=
 =?utf-8?B?Z2tvZlROUG52c1p0bEtFZmhJT1FFR3duQ2NLRzhhSHVGNTh5NFpGRjVHdVM0?=
 =?utf-8?B?T0x3bkZkcGtHdmh2SEpKeXU0V2JvSUhjdENZVTBKRWRSd2pwOXRlWXl0RzB6?=
 =?utf-8?B?cGJFaXl6VndZRm9aSTJNZXNFcXZIV0lHVnVPM0c4LzR1RUhnR2pMekhLUGI4?=
 =?utf-8?B?K0x0a3htSW9FVjJTNmtnWGJUUVo5eGJmV2lRSzRrZk96MThlS1hJb0F0Vzl6?=
 =?utf-8?B?UjlFRkZTS1ZlbzNvUk5Fb01pYk1FS1piM1NQYXZzeFA4cTdpb0JUTWVmZkEz?=
 =?utf-8?B?dTFxU1ZqSUp0MVhFVzFsZG03OGFOZysyTEpSZjlka3oreVJxN09GSTJwTUpC?=
 =?utf-8?B?ckRPbko3a25WRkdMaVJqZWdZMWh0eGtTeG5wenIzZzdtNytrbEZPZ21yYkZ6?=
 =?utf-8?B?MjA1a1R0RW85blNwTklmbGxHcnVzMFBZRjE4NjlWU1ZLay80MUFrSFhQQVdD?=
 =?utf-8?B?WVY4b21Ga0pmK3Npa0FxbmVUekNnb3RNbTdYUnVVZm9QdmRJNFNKVlNSSk9h?=
 =?utf-8?B?R2lJWGpJNzhqODh4SUt2eDlVRDY1QWtMKzFRZnpjNk8xVm9TTHV1ME1pNkRS?=
 =?utf-8?B?OXB3aXVST0ZLbE03TGM5Tys1UVlKZXpFK2dLeThPb2ZTcFJIb0dLQk1mWjBR?=
 =?utf-8?B?TmdQcXh6WHdVVy9TVGF0VE5yNFk5OG9wZGJ6bytyRThVQW42dHhJT2dHbG8r?=
 =?utf-8?B?dy9qQkhIRTI4OWZ3QVIwOXlLN3YvaXNOZzJsbElqbm4yM01sM0FJS3F6Ty9k?=
 =?utf-8?B?MzB0c0V5QTdTUWswanB1amxDZXlENituNGlYZTFUcTFDQlJnbVNWS2NKczha?=
 =?utf-8?B?NlJWcWpGOXFVNitnODF1VnBXK1J6cVZqRVRaRGJFNW0vblFHdTFFRnIyTCty?=
 =?utf-8?B?cUtDOHUxL09HMjJCNUJJd0ExZU1KdXJvU3NjbTBSVFNyVUtEd0VaTjJkbTZj?=
 =?utf-8?B?cnJQUWdWYXoxNHFzS09NSEErSm1meUF1Y1ROMzgzVGZWcUk3RGx0ZkQ5bzI4?=
 =?utf-8?B?akZFWjZzTnArZmVwZzJJUnh3UVI0dFFaNWorK2FOOHFVNDcrYVo0OU5BajB2?=
 =?utf-8?B?eW5JWUF6RzBSM2pkVEVUTDlTbDFvbWkySnorMUNlVEJCQ0pvZytwV2ZzRTc3?=
 =?utf-8?B?alNQL0hsaEtCT1N0QnptTHhraWZYTzRJVXd2NGZXYTErSURFbmlKd2RIODFu?=
 =?utf-8?B?cG1qM0pIdGs1SG5aYk9ud2lOZWxuT1pIWXJhbitHMVJ3WTlKV0ludmIzNFlU?=
 =?utf-8?B?WjhVa01yNWhONnpCd3Q4bHdFaGwxQzAvVzJoL1ArdFFDNHJLSXg5RW4rbE5q?=
 =?utf-8?B?V2pEVGJ2QSt5VGZNQmY3a3RTSTZvaGJ6elI1VE5OU3d6cWxTbXI4cUF0UFdn?=
 =?utf-8?B?U2k4bjJzZTJMeUFqM0p1K0pMMWwvTWZFL1JNcFE2S0pxSTBjUitVZFJiNWNt?=
 =?utf-8?B?L3huSFZHY0ZneXhHVkQ1Y2xmYzRaZ2lYWG1FNDNXME4xSmpXdUMzMEhzbFFD?=
 =?utf-8?B?UVJRM2wzaUhvQitoL2x2a1BRbXBRRngvL1lPWm1kM0ltbi9KeE9VVFl4aWxR?=
 =?utf-8?B?aE9WTGhZanRSRS9NVUR6T2pNS0dFbG8vc3A3MXM4N3k5dmJJSk1ZUFRRYnpB?=
 =?utf-8?B?ZHk1QmdiVU5lK2NLT2hJMEZabEUyNDdVQU01NWJHZldad2xwVE5ENXhRbDBH?=
 =?utf-8?B?ZUdXdXA5Y2s3VjNyUVFrcm15Yjh0TVIvL2hESVcvSzd0ZXZwRFZqckpIa3hw?=
 =?utf-8?Q?VLiAasptUwnNd3VIzaBPcETnf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46cc21c3-335a-44c4-1cd8-08dbe41d08b4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 07:49:15.5450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xEQkeVSvdYpRTcE3pYjfv59ZS+CiSUwALE23NlwuN2Q/9n0nv3sKzQG24sTq6DzUhB7eeUW6aPJGmu28NjlS1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8229

On 11.11.2023 02:23, Stefano Stabellini wrote:
> On Mon, 6 Nov 2023, Nicola Vetrini wrote:
>>>>> There's also this functionally equivalent alternative, with or without
>>>>> the zeros, which
>>>>> doesn't incur in the risk of mistakenly attempting to initialize the
>>>>> same element twice,
>>>>> while also giving an explicit cue to the reader that all elements are
>>>>> truly zero-initialized.
>>>>>
>>>>>           .matches = {
>>>>>               DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
>>>>>               DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL5"),
>>>>> +            {0}, {0}
>>>>>           },
>>>>
>>>> Adding a dependency on the array actually having 4 elements (while iirc
>>>> we have seen already that we could in principle go down to 3). A change
>>>> of this number would then require touching all these sites, which is
>>>> what we'd like to avoid.
>>>
>>> How often the array needs to change though? Looking at the git history
>>> it doesn't seem the number of elements ever changed. So I think it is a
>>> good tradeoff, and I would go with this type of fix (maybe also at the
>>> other locations mechanically too although I haven't looked at them in
>>> details).
>>
>> Hi, any updates on this? Considering the opinions expressed above, what would
>> be the path preferred by the community?
> 
> Hi Jan, to bring this discussion to a conclusion, I think we have these
> options:
> 
> 1) fix these violations by adding {}, {}
> 2) fix these violations by adding [0]=xxx,[1]=xxx
> 3) deviate these violations by adding /* SAF-safe-xxx */
> 4) remove the MISRA rule 9.3 from docs/misra/rules.rst
> 
> Let's make a decision. My preference is 1) as we only have ~50
> violations.

Of these, to be honest, my preference would be 4. Just that that's
undesirable for other reasons. But have we thought of alternatives, say
a variadic macro that would supply the "missing" initializers? Imo such
decisions shouldn't be rushed; there are enough other issues to take
care of in the meantime. A sound solution is, I think, generally
preferable to a quick one. (Whether my new suggestion is "sound" I of
course can't tell, until it was tried out and the overall result /
effects can be inspected.)

Jan

