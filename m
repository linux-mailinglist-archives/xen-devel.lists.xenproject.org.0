Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F9A6218C2
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 16:49:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440220.694347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQqi-00041G-UX; Tue, 08 Nov 2022 15:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440220.694347; Tue, 08 Nov 2022 15:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQqi-0003zD-Rk; Tue, 08 Nov 2022 15:49:16 +0000
Received: by outflank-mailman (input) for mailman id 440220;
 Tue, 08 Nov 2022 15:49:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1osQqh-0003z7-4h
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 15:49:15 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2068.outbound.protection.outlook.com [40.107.104.68])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e417693b-5f7c-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 16:49:12 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8139.eurprd04.prod.outlook.com (2603:10a6:10:248::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Tue, 8 Nov
 2022 15:49:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Tue, 8 Nov 2022
 15:49:10 +0000
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
X-Inumbo-ID: e417693b-5f7c-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DY46gz8DX2mMIRJNyrKaS899kjP3Q3ARRXqn8dUMmVop6xVAaEG7ZCVhEx5ALEk8tDpXGWJKZnTgAAJodgdTJe06baAh71bdCvRnlO6Sy0tShGhXBJjT1AIvVJlTrj56q1RvqzBbpCgoXXYzzOGGzSSSC/uw2lzCafARIDAnHUTkb/pUFf3FBcEyWY3CnkM3LbnvJZwITyLFpqZx+1Vj9wyiXc2ijqMGQPwWD4wPM0enktyefjjpM8XPq3cXZ9cDO0Xo4C8s2D8dpuXhQZVp9Z2jU9A8i1uLcbmmqNtkxo3fyNvBATgeizSb4H0JMc5th6YfZbD+pUjN8mxC9xWp6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhpuosmhRGZWg6BeeYRe5UPWdws1fMxY02VhIW/DjzQ=;
 b=M50VnKTf8Ft+sBk2xjh8lhysJ5DUBqo4tfDYN3zH4Bsj/WPPmLFfAEu5SZodaKYmrufW5f50O7pBBTQigXvFE/2sCHmlLGANupYQ0i4u2O45tGh9uKHsyDtHv3kxvIptziyuI8YRvQ8JGa4T6BLkEXN6pTWdqZ8NXI67lF/CYY3Jet6trkoyeAAQ1y4TyCYCX/6qqgQ4xFDtiJ8mWtjgRwYcLy8MLH6zWohXbohcmOxiLGJn4FsGG53I2QWWn1eSHhP/KRe8vAdpdQaU1+byYgQAa5RGSYHyfxDeQ0S+St6u30W+cY6fKlSBMTQHjfYRduH+esr5Z2Gi17N5032PYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhpuosmhRGZWg6BeeYRe5UPWdws1fMxY02VhIW/DjzQ=;
 b=OYWKMWr8dAo6l9A3ZGN15svwCijeUKENWpGXqivRCNk/95flajmI3h0kf9yWln0w5Ohb6z14Ekyzb84kpwXNzJR3O+49MCz0SKx2+jIwQeqQ6iBC0jbygdRtNWjkjeUUuqxxTvLI7iSiPE7awTckH2dxzfNv3Sn+vkn80/Vn+rriobrcG/XNH/jNs3/6zdor+R2QusehS/BjotucyCF5ir+76YDFbDRBDrisyG/lMbFIrbMciohAllycz8Pv0PWH0/38G0UJuFv1xkrbiPSW7IWwybAzSdRcwrX02cR72svvaGdP0gTPePkRbLbzePhk4ftNmgr495z8w6D0CKzqJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7d56c33d-4b03-9aa1-6abc-45a8ad41caca@suse.com>
Date: Tue, 8 Nov 2022 16:49:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC PATCH 1/4] xen/Makefile: add analysis-coverity and
 analysis-eclair
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221107104739.10404-1-luca.fancellu@arm.com>
 <20221107104739.10404-2-luca.fancellu@arm.com>
 <aa989d27-45c2-6cb8-160a-b0368b1bb2a2@suse.com>
 <8632FA78-B316-4866-8E78-D4CD127C8602@arm.com>
 <d1d5ce85-0883-9217-ada9-71204e02239a@suse.com>
 <B26247E9-BD4A-4868-B977-CC451F7A095D@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <B26247E9-BD4A-4868-B977-CC451F7A095D@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8139:EE_
X-MS-Office365-Filtering-Correlation-Id: 810fba36-be3b-4977-61c3-08dac1a0c6c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+Nw+hXgAi/033kNDwlm4g5Wk8lhFGnPrZ6CmIx0Iqgiw2GNBRWNqcDy1afdgeFzl5i/JPHtAPOTpIih8ZFFgYbh1KkkTM0vCWa7fG0L23H4wROoUwyzHzQ/MmVQEjNf07UkTKjB9Hh/Lx9yTBjIdDjmjUJLJcNv1wQv6tnatgfoGrp9gerQHiCJy4DhaFfBKJMBPc4XDwg5n6BNETaoXkRBB0InS599xYsICRDZqEguui86LVjIr8mErYlofoJRDYztBdVEoE6XEHr11h+366MfH7eaAmWHUsYwiA1j6QteykrhGdvH5eDvzVMpnfEH2yg7gB3aeQzj77RWE8JxhHFTghMLRY+7LxIaHmpg5lRUqhfhRGSO18ljK5K4lt4j2gEnznR4W0kfsz35FWS16BykkuH3h1YRjsPbJgBR8lRYvbqO+MI2v09MS/hI8UGpjG7fzlIdbCfASM9wJgiYuNNEkobWZPovV9rJ+ppvwOeoJXR9at9BbYUJ4uiMhYuFm3upKBH+0oFv7lIS3p7p2sL/srqLRkBCasclLusNyQDYAcBHR95oQnZZENK+VirBfk34wqxgve37UPRjk2qukjbg0usvk8qvxVcT1fnRmHvVep4ne7Yz9EszJWbykLKVzVXTnFuAPPTQ9DY5FbZOIguuGL0+3o2dGxgqqce/qzCkjxbLQm51GGf8eWuZpfqyeOqmwRvdjkju79tD+9fW900evWNMyJwPA+eUneqr9QSoo5NjMYQzdDGDZtfo8HI9YVVbe4PzB2/znHm7NQixUQlbPKABajT8e8somzbood8Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199015)(86362001)(31696002)(36756003)(2906002)(186003)(26005)(2616005)(53546011)(6506007)(6512007)(83380400001)(38100700002)(5660300002)(31686004)(66476007)(66946007)(316002)(66556008)(6486002)(6916009)(54906003)(8676002)(41300700001)(8936002)(478600001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3hsdmYrOXVHZmE5R0R4WnFVMG5BWmlZRUMzRnA0d0UxaEFrZFVrN1B2aGMx?=
 =?utf-8?B?R21HOUt6MGE2NTFrSSsvTUFycjdPaE55dGRkMGJid0lCTFRTNHFTdEpQVWlm?=
 =?utf-8?B?RmxNcXhYa2g0aUgwV2ZveUhkTXlJcXR4dkNvWDIxQ0FnV2ZFT2RNVGU2MWhW?=
 =?utf-8?B?NitZV0J1aWk5bzJud09ORFk4OXI4aG5YalBmaVdwOFZQYXhaUFNXbGtpNHl2?=
 =?utf-8?B?RWY5SGFRM0hMWERDTEdJVlA5WUt3WXlQaVNsdHRnK2FXLzBOV3Y0YWRNK25M?=
 =?utf-8?B?UE1hUURDckJ0Z2x3OGJkUlJsMlc3dzE4Q2JEMWZ0M21JVW1BbUFvbEowL01k?=
 =?utf-8?B?MSt4WStaVVY4Z1RXKzYraDVNcE1Uek02NE5POHJ2ZmVzT01JWCtUR2p0ZEg3?=
 =?utf-8?B?dVNDN1d6MkVLcjRBMk1Db3NaYWhDTDV5OVhBRms4aXhiejc4Z0tJcDNLYnZs?=
 =?utf-8?B?UVdGSEp0NFhFQ24yYXBOdUZDbHh6Sk14K2RhNnNRVEFQQTF4L3lkUDNxYjJR?=
 =?utf-8?B?VHBXTUVKNUh4dFp5bTZRT3prSG0xbXhsMDAzRlEzNWhKSk5VczhOelBWaVR1?=
 =?utf-8?B?YS8vTUZ3RU1RUHp1ZjhwVjZta2ZwRVpzbUdOZUNXOEdGWEN2bERRVVg0RmxL?=
 =?utf-8?B?TnhwNTcrRW0zQXVGQmJQYWVHSjFSMEcyOXh2YkZDNlluNVM5OEFtQ3dPV0cy?=
 =?utf-8?B?WFJQODh5Qmp6aUhhdjE4dk9wYTRKWmNtNkpNRW1FNjZ2bi9naGl6dnYwSURR?=
 =?utf-8?B?WUFoQml0K1pmNG1jZ3JrSWVwaEprb2xlcHZZQmd4RWR6VStZampqS2dyQzVD?=
 =?utf-8?B?MHNsRlZBRUZiWDNQem9Ec1dGaHVrVXdwc3pKSkp3ZU5BaXkwckpNYUZIOWVQ?=
 =?utf-8?B?QXRSMURRQjNqTHRVMFhVUEQ5NFprUmVGRjVGbnF6b2xUTUlRSHVrbmdGS0hQ?=
 =?utf-8?B?UGp1a0FaNnpZYkFYd1FwUVFkUFUyeStJcWd2Rm5IRmVSZWM1bHhoOWwxWGd0?=
 =?utf-8?B?dDNYOWR5OUhnNEU4bmZUM2VKdzdxWlZOMWI4elNzQXkwL25IcU54bEgybTRM?=
 =?utf-8?B?R1Y2ODF1SE5IdU8xYW4zOU9aQjhwYUxRd28zU1lOUjdwL1ZGRW8xNkk3eHl2?=
 =?utf-8?B?aFMyZmM2Z0VVdGFjQ25GRk1LMmlINDFHNkFzTWRLVW5TWkRyeHFKbjVUMHhT?=
 =?utf-8?B?UDNxOW5ud3NpcStXVjE2YWdJdFJ1RERvYVdBUXZGeGN5RFErS1dSTTczQlpL?=
 =?utf-8?B?cmR1L0xxNXN1L2JKeEdTQU1IZ3NwV0NDV2pDbFl0eCtsNnVkVXlXaWRyd2pl?=
 =?utf-8?B?R3VTQUJGR2tWeHczRlhUc0ZmbzJ3aW5XSWpkZW1FLy9jc3FxR21VWXdPdmRU?=
 =?utf-8?B?V2ZuVFdZUVJWNERoWEtjaG1qVVAwYjY4b3lCK2ZsY29VOGIxamVySTh3WDhS?=
 =?utf-8?B?ZWh2WFpvVFpHMlYxdmR1V2EvN0pZaWkrQVlYUG93RDV1NWpkZXMzSVMzRitu?=
 =?utf-8?B?TFUvZVIzL2VPNkFaYkkyVzMyamY0T29nY3RGZGlqeWUyNUpZSWFRMjA2cEtl?=
 =?utf-8?B?bXVBY0lCZUZ2NG9aSXpCYkZDa0Q4UUZ1Z004MGlUbUdINU5vRjV6VE1sWjJB?=
 =?utf-8?B?eFR3T0ZtUk1CV2xiR3BKK1l4dTd1K1huRTdhTHZhbWg0L3MzN25CeWVHc1M1?=
 =?utf-8?B?ejU4RkVBeEFCSEFzY2pjcG0yNko1dThlSm5DeU5TVmRsMXd0VkxTWWdMRGFU?=
 =?utf-8?B?WlBrbFdqYzJ0c09BWlZwL1RpYWZWME16elFWTnZhS3BSWDVDYXdOYU5TdzU3?=
 =?utf-8?B?RmdQMkE4TS91dGpYV0Q5Y3h0T3BuenYzYkZDeWcycE9SS2hYTU1MQkpZQzZn?=
 =?utf-8?B?d00zMG5FdDFyQW1CaERwei9Ucys0WE9HQ2ZIWDVBRDAzL1BQT3NmRFBIRXF2?=
 =?utf-8?B?K2hteXI1cUJwUERwTWR4Ti9tOS9aTkluQ01yQndFbjdXQy9hNmpyU005aUtk?=
 =?utf-8?B?am9CYktnUEpnTU1EdXJUNWtsR01UTGMzem1Va210UVVzN1lxcEpCOGxHdDNK?=
 =?utf-8?B?TWQwaS8wVEsxMkdweUpjN25oMWhPL1VnUlhIVUhaZUdsaVQvZVI0SDc4bm9k?=
 =?utf-8?Q?UPFvNEpg8empe4h3yoG7ELH2u?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 810fba36-be3b-4977-61c3-08dac1a0c6c8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 15:49:10.1389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jqip2UJWWNMc7InESr4c2gClL2R9tdxlhtC+zAS1XwJbUb5Ku5ebLtJjyUaJjmWXGAn+7x18MMInU1GUcd9qwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8139

On 08.11.2022 15:00, Luca Fancellu wrote:
>> On 8 Nov 2022, at 11:48, Jan Beulich <jbeulich@suse.com> wrote:
>> On 08.11.2022 11:59, Luca Fancellu wrote:
>>>> On 07.11.2022 11:47, Luca Fancellu wrote:
>>>>> @@ -757,6 +758,51 @@ cppcheck-version:
>>>>> $(objtree)/include/generated/compiler-def.h:
>>>>> 	$(Q)$(CC) -dM -E -o $@ - < /dev/null
>>>>>
>>>>> +JUSTIFICATION_FILES := $(XEN_ROOT)/docs/misra/safe.json \
>>>>> +                       $(XEN_ROOT)/docs/misra/false-positive-$$*.json
>>>>> +
>>>>> +# The following command is using grep to find all files that contains a comment
>>>>> +# containing "SAF-<anything>" on a single line.
>>>>> +# %.safparse will be the original files saved from the build system, these files
>>>>> +# will be restored at the end of the analysis step
>>>>> +PARSE_FILE_LIST := $(addsuffix .safparse,$(filter-out %.safparse,\
>>>>> +$(shell grep -ERl '^[[:blank:]]*\/\*[[:space:]]+SAF-.*\*\/$$' $(srctree))))
>>>>
>>>> Please indent such line continuations. And then isn't this going to risk
>>>> matching non-source files as well? Perhaps you want to restrict this to
>>>> *.c and *.h?
>>>
>>> Yes, how about this, it will filter out *.safparse files while keeping in only .h and .c:
>>>
>>> PARSE_FILE_LIST := $(addsuffix .safparse,$(filter %.c %.h,\
>>>    $(shell grep -ERl '^[[:blank:]]*\/\*[[:space:]]+SAF-.*\*\/$$' $(srctree))))
>>
>> That's better, but still means touching all files by grep despite now
>> only a subset really looked for. If I was to use the new goals on a
>> more or less regular basis, I'd expect that this enumeration of files
>> doesn't read _much_ more stuff from disk than is actually necessary.
> 
> Ok would it be ok?
> 
> PARSE_FILE_LIST := $(addsuffix .safparse,$(shell grep -ERl --include=\*.h \
>     --include=\*.c '^[[:blank:]]*\/\*[[:space:]]+SAF-.*\*\/$$' $(srctree)))

Hmm, not sure: --include isn't a standard option to grep, and we
generally try to be portable. Actually -R (or -r) isn't either. It
may still be okay that way if properly documented where the involved
goals will work and where not.

And then - why do you escape slashes in the ERE?

Talking of escaping - personally I find backslash escapes harder to
read / grok than quotation, so I'd like to recommend using quotes
around each of the two --include (if they remain in the first place)
instead of the \* construct.

>>>>> +	done
>>>>> +
>>>>> +analysis-build-%: analysis-parse-tags-%
>>>>> +	$(MAKE) O=$(abs_objtree) -f $(srctree)/Makefile build
>>>>
>>>> This rule doesn't use the stem, so I'm struggling to understand what
>>>> this is about.
>>>
>>> Yes, here my aim was to catch analysis-build-{eclair,coverity}, here I see that if the user has a typo
>>> the rule will run anyway, but it will be stopped by the dependency chain because at the end we have:
>>>
>>> JUSTIFICATION_FILES := $(XEN_ROOT)/docs/misra/safe.json \
>>>                       $(XEN_ROOT)/docs/misra/false-positive-$$*.json
>>>
>>> That will give an error because $(XEN_ROOT)/docs/misra/false-positive-<typo>.json does not exists.
>>>
>>> If you think it is not enough, what if I reduce the scope of the rule like this?
>>>
>>> _analysis-coverity _analysis-eclair: _analysis-%: analysis-build-%
>>
>> But then, without using the stem, how does it know whether to do an
>> Eclair or a Coverity run?
> 
> Sorry I think I’m a bit lost here, the makefile is working on both analysis-coverity and analysis-eclair
> because the % is solving in coverity or eclair depending on which the makefile has in input, it is not complaining
> so I guess it works.
> Do you see something not working? If so, are you able to provide a piece of code for that to make me understand?

Well, my problem is that I don't see how the distinction is conveyed
without the stem being used. With what you say I understand I'm
overlooking something, so I'd appreciate some explanation or at least
a pointer.

>>> Or, if you are still worried about “analysis-build-%: analysis-parse-tags-%”, then I can do something
>>> like this: 
>>>
>>> analysis-supported-coverity analysis-supported-eclair:
>>>    @echo > /dev/null
>>>
>>> analysis-supported-%:
>>>    @error Unsupported analysis tool @*
>>>
>>> analysis-build-%: analysis-parse-tags-% | analysis-supported-%
>>>    $(MAKE) O=$(abs_objtree) -f $(srctree)/Makefile build
>>
>> If I'm not mistaken support for | doesn't exist in make 3.80 (the
>> minimum version we require to be used).
> 
> IDK, we use order-only prerequisite already in the Makefile.

Hmm, yes, for $(objtree)/%.c.cppcheck: . Question is whether this was
simply overlooked before. As said above such may be okay for these
special goals, but this needs properly documenting then.

>>>>> +analysis-clean:
>>>>> +# Reverts the original file (-p preserves also timestamp)
>>>>> +	$(Q)find $(srctree) -type f -name "*.safparse" -print | \
>>>>> +	while IFS= read file; do \
>>>>> +		cp -p "$${file}" "$${file%.safparse}"; \
>>>>> +		rm -f "$${file}"; \
>>>>
>>>> Why not "mv"?
>>>>
>>>>> +	done
>>>>> +
>>>>> +_analysis-%: analysis-build-%
>>>>> +	$(Q)$(MAKE) O=$(abs_objtree) -f $(srctree)/Makefile analysis-clean
>>>>
>>>> Again no use of the stem, plus here I wonder if this may not lead to
>>>> people invoking "analysis-clean" without having said anything about
>>>> cleaning on their command line.
>>>
>>> In any case, the cleaning process is very safe and does not clean anything that was not dirty before,
>>> so in case of typos, it’s just like a nop.
>>
>> People may put transient files in their trees. Of course they need to be
>> aware that when they specify a "clean" target their files may be deleted.
>> But without any "clean" target specified nothing should be removed.
> 
> *.safparse files are not supposed to be used freely by user in their tree, those
> files will be removed only if the user calls the “analysis-clean” target or if the
> analysis-coverity or analysis-eclair reaches the end (a process that creates *.safparse).
> 
> There is no other way to trigger the “analysis-clean” unintentionally, so I’m not sure about
> the modification you would like to see there.

I guess I don't understand: You have _analysis-% as the target, which I'd
assume will handle _analysis-clean just as much as _analysis-abc. This may
be connected to my lack of understanding as expressed further up. Or maybe
I'm simply not understanding what the _analysis-% target is about in the
first place, because with the analysis-build-% dependency I don't see how
_analysis-clean would actually work (with the scope restriction you
suggested earlier a rule for analysis-build-clean would not be found
afaict).

Jan

