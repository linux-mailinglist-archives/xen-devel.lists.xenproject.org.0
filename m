Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BA46AB72B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 08:39:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506705.779827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ5Qv-00035t-DG; Mon, 06 Mar 2023 07:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506705.779827; Mon, 06 Mar 2023 07:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ5Qv-00032y-AO; Mon, 06 Mar 2023 07:38:57 +0000
Received: by outflank-mailman (input) for mailman id 506705;
 Mon, 06 Mar 2023 07:38:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MPo4=66=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZ5Qu-00032k-FC
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 07:38:56 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2732098-bbf1-11ed-96b4-2f268f93b82a;
 Mon, 06 Mar 2023 08:38:55 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS5PR04MB9971.eurprd04.prod.outlook.com (2603:10a6:20b:67f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Mon, 6 Mar
 2023 07:38:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 07:38:53 +0000
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
X-Inumbo-ID: f2732098-bbf1-11ed-96b4-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7tGXTvWDhACkUpE68DUKlhyJ26ilkhMMJSHWwnIELrPp6xnGD+hJDPwiRj1P2UShYGjSFfrvpGw9TBigRAclG74oHQ4lLdystp1szHmlyt7ciNEjzuykJZ+lg+kV3fkIDaDRLfO1kreQg+A6PYykPzFJv6rvVatX6OXV9UOWdjDNSFEwlhd225RbPE5JdE+8FezwWkDSwFmyUm7LqDZA3NHarLNEy33kvD+f3dXfmj19VcLhwcLhnWoNlBW4+VpYFj8nAV5RoRy/xbd/0TwXwMWuFGukZQmLJ6yG5H0zF3aQMwRLg1zn4261ySHEKj4ORFCesbpVUVcodDwGz7Xbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSVXXmIaRInjRD19BeEx3RH4W72+sp6hVa1K0cRrOmA=;
 b=PUj905I6RZPYvGyAyUKdqNs/WUIogifxgbuVjhTT+6lbrDPYQpQc4PRKqyeZZhHag64z55Vtv9ZWX8FxpcEf/bg3HoyA3o9ag0LioE+esVF/Cg1ecgS7wrRFkzSFoYUwfu2qdWztX2cAJQZx1ylO2RQtTwUjAb645wrRb+ja90Pm/XOGET7twTpmSRiZ4EXzlB16xPfhK2aM3wixTyeEqb+AsTqsXkONlsiiFneXJFN0A45/ZpxbQEcdRVF2FgLHQtgIEc0IPQmtq9eD5dxl8AGixuvEz3NPr/NIVAGAPqWBhZnA6c5Rxf6cZAcokRzZBzNHBWLm8t3fWoXzA7QA9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSVXXmIaRInjRD19BeEx3RH4W72+sp6hVa1K0cRrOmA=;
 b=0drp3rEA4kdovYScSm9/1lU3R4JlzaMb1SPygQdUChy7lPvlGseLaEZvFfp4BWNs7IeS2F3qROuv4iMyhI5p7gJXRu6oeX3Qtuwcs2bDyGnIPX92GMCPdXE9/ruyggt/LXJvC8ykhKD3+aNccS0HpAK7kYaEsFh9/d4dYm8VptWBKadpVEqSKXvDk41vqUvDa7CSXjwt9VrpIYbS8q3CI0TCZTwfGS1vd1oalHXMfNYakdDKL0LuIDBNL1JeUjQ/WagTSNsmLk8oojA10QwQjG8tUrOvZewA+t6iC11/FJVNlUGhjTbNQh3Vtc7ozyoPkmcEiDZ1qXdUKCKWkgM00Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a3f0ccb5-3543-8daa-b37f-ca74af17afbe@suse.com>
Date: Mon, 6 Mar 2023 08:38:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [XEN PATCH backport for-4.15] tools: Drop gettext as a build
 dependency
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230303145535.23412-1-anthony.perard@citrix.com>
 <b8670d3a-704b-110a-8400-fabb0b1d1879@citrix.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b8670d3a-704b-110a-8400-fabb0b1d1879@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS5PR04MB9971:EE_
X-MS-Office365-Filtering-Correlation-Id: c75e87a9-e31b-4ab8-d5cf-08db1e15d5bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	waRFu0e1gNN2YB18eWzJqJcoTixdrnd0gklAp8kG+ysUTwyPJewDatbtvfbBjW8pmIC+bk3hZfQ3AFiowjWHG45t+3Fjx7tvW7fFRbo5OVGlqFZsgT/6VBLQoLrAwgarCbgkBtd/4HAo0h0IeD3HKjQKMF3urcFGy9M1XNg9SVc9rCPfl6aJTv216ZkbZ83E3QOwBCjbgYF57oe7Cv0SD6kvXj6z1blStuABttsAiS1uZwcxpjc1pY8Nyu3Lxo4pGEKFKikRv6xFMTRNYTj/3DkXq2BKA3UBtmFsL0ZNPYrun3cy0+sn+GYfIRzwRqdzfwO43yO3bLO5zLU1DfA/AzjcuKorbMGLRXAtpSqhnYyGUfHtuzMzipKUqFU1ncxwLpPTZGoYK47Bq9dvI/YxoF+GFBVOoPxgkiXOEbVbM9Mk/XHLEZmrkF22dJ3t+HE2O4LfW89k3tsigAQbuohW84aWPiL+e+GYwkYKJeeVqhdzbdeOcVwydhMLHlgQpD/tUJusp/D5pkfox8RjmxTVSk0Mc6sIXP4+P4a2wa0/wpcN/0oadN+XT+E7SDGNLRtALuIORl1N+iiS64YIsTZ/tPn3lop/3vP+xF/2swNJq+qQBJxrRkD+0P6UTMZ3H26mgwJFh8jG120WNzSiD/l8HRfM+s0vLX8+CFSZI/upD6NP5fHZPwTKAk4IpVsU6HznYwzdpnYUQJ9t+nXrblbxvTPZL9SkIuFI6TXQeyAR/aljJKTpnVzKSwjQ/3557frT0xvV3PppGW8Hfu8p2VaPlA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199018)(36756003)(83380400001)(478600001)(6486002)(966005)(26005)(2616005)(6512007)(31696002)(53546011)(6506007)(186003)(8936002)(41300700001)(8676002)(4326008)(66476007)(66946007)(2906002)(66556008)(5660300002)(86362001)(38100700002)(110136005)(316002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3lUdm1TWXFoWFFmWUhuZzZwa1N5WjdQMlVxdThIYWlUMjkveTJXb3lEemdR?=
 =?utf-8?B?S0V4T2MzSEM4Q1loZm9DcWt5TnBxM1NMZUdCcDNUekZ0d0xuSFd3MHZ2RUcw?=
 =?utf-8?B?bzVzb1lpTHpBZmJBbVlOYy8xMUN2aDVudW9GM1B6UGk2bGgyWklXR25LRzBm?=
 =?utf-8?B?OEhiRVhHeWNqNVhHcERZU3ZPcWl3SmIySDdmRTVJdncrcGpERXJVVk5DcG96?=
 =?utf-8?B?dG1iZDVMb2tHS20yYWUxRXBTSzFKdHd0UzdCUVRvaElVaTNQVGx4R3BhVDdQ?=
 =?utf-8?B?bHU5ODVpKzVrOXlKb3dZR21WaVNJVFYrNVBPM2xPOE14dENJa1N0OXBJck1N?=
 =?utf-8?B?Z2hVcElXK2JzSWRFNDlOWnc4Y3hrTlQyOC80NHNaWHE2emtkRVdoWWd0YWc1?=
 =?utf-8?B?SFh2c0JBa09taG1JS2ZveWZWeDFBVzR1UGMzVzJCRXpBNm1RbGpRVlBlT0d2?=
 =?utf-8?B?WEhsbUdUbW9hRlJZaVUrM0ZlNEZBVXFCaDREcXNoNFhhdUtiZDZkODdwajcy?=
 =?utf-8?B?WUZ2WFl6TGdaMUd3dExuMVM3bEJiRE1FQzluZGU0dmdzeGhVa0hKQnRBKzBj?=
 =?utf-8?B?aXlweUpCQzVkK1NiNDVKT3NwVVQzSjdQbjkycFRLKzdKa2JkMCtFajVLeWxJ?=
 =?utf-8?B?OE9ITmE0UXBTN2xlTm1kRUozMnM2T3laQkUwWnJQVzBKUnBRRWcyOExjT2pl?=
 =?utf-8?B?aStuWlA4MWZ4WGlEby85NDU0M3puK1ppM3dLMWdhdGxTRmpxUlZYME9HU3h5?=
 =?utf-8?B?c0dadTRhWWZ4L3BzUTZQSHp0MVlKY2paVWVxa3FWTjlQSVpibEdrR3NHNlJr?=
 =?utf-8?B?aC9HZXJyRmVGVHc1TUdsZ3dWQ29FZmhBNnJJYnhQYitYSVl0VTBFeCt0Nmwz?=
 =?utf-8?B?S201Vm1uYkJLZXd6UWFjcmN6M1daa1FBUEluUWlEY1VoVGtMbWRGZTZzUndN?=
 =?utf-8?B?Yzl6RlQ2Q1lWUDV4U0RXSEs5N1NZT2w5U1lJOE43WnN5VEtLSVZ1NnhzaU83?=
 =?utf-8?B?eXE4elBLL0xhVm01bmpKVWRsc1V1NU1haUhDbVEwK2owUDVrUG1GcEFqN2dC?=
 =?utf-8?B?SU9SUmxkODczTzYrTWFZNjkxTVg3SExsb3VISTBnS2dud00wMnJHQkFmMGVG?=
 =?utf-8?B?Y3ZIcVpESFBvRkVJdjNVc3VmZFF4UXZlN1pUdFdBdjFZY1RFUTRhNllXYnNa?=
 =?utf-8?B?UWl2RXR2TS9aY2QySVBrQW5QK0x6QjBzd1VHclA4TXpvR3I4bmNGZFcxTkd1?=
 =?utf-8?B?WWRGcmxmUzBONGp0V3MzU0I1LzVkL2FhWXdZZEUyY0JOU0IzU0JYWFE3aXJ0?=
 =?utf-8?B?MjdCNlRucWFiZjR4QVo4ak93OWdMdklxakVoZjZNL1lYeGtjNWpJZllHSkhV?=
 =?utf-8?B?R2dhN1VuSWk0L0pmdjhnd0RreHlLYTVZSllnaUJiN25WUVpoNG1McUtBb3Nx?=
 =?utf-8?B?bGs2Q3BvTVU1WWZjUm1od0tXNVJocjQ0dm5MOGJxaVFSazZtNFgyUG9Bazlz?=
 =?utf-8?B?d2U2YjVFSllDWXpEeUdGYTVTaUtQdlpKZ3J5K0pPQlo1ZWh1cXpXVkM3TWVh?=
 =?utf-8?B?ZG5nTVg1a3FsWDI4Sm5TbDNWWXcrdXJjNDF0SlRhWjFVSXAxbnduTGdaZzZt?=
 =?utf-8?B?aHB4WmdYcFpNY2U1ZGZybVRxSnhSMVNNMVc4U3AzaDh2dWhuOUdJVWlFRVRW?=
 =?utf-8?B?WGQ2ZjUzZVhGUStpOWcydGZaa09LYnc5ZXhmR1ZWVXp4YTgzVjdFRVI1VFc2?=
 =?utf-8?B?ZlpSd2RwdXR1eW11NzVtcjUrdjhNNUVMOWkxMEhCbktiemtSV3ZxMy9DVFBX?=
 =?utf-8?B?YVRxWTB6Ulc2K1FWcXlqcS9qdC83QkpnanJwQU1PUlFZMXhZT25rRFhHeUNs?=
 =?utf-8?B?ZlZwcjBRcE15Yi9IWWdYemVabno4OTlFVXRkNENndEJpbXZMaUJuK1ZiWlkr?=
 =?utf-8?B?VGdLWkx4eGZZdkJHKy9JQlhZKzdTY29zcHhob3AvSys0cHdBUDM1a01YT3BX?=
 =?utf-8?B?Tk5wYStMV2Z2WGp3OEhVRmg2RHhrcjZkYTd3UTVWVFJneVNBR1poTFA2UW81?=
 =?utf-8?B?WTNJYkdaVmh6M1ZhTTBCL3hVL1ZUWXh4SUtYdDBtS2R1cllzaWFBY0M4a3NX?=
 =?utf-8?Q?kn9DhIQtP9vf1O6x1CDOV4dFL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c75e87a9-e31b-4ab8-d5cf-08db1e15d5bc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 07:38:53.3063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xwU6q9Q8csTQNs1nCjSgcyITYX3m98W1isoJPRCkrsxZahwAenp9nrCuEEvLP2czNU+blIP+osU7DKTs+0WvHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9971

On 03.03.2023 16:27, Andrew Cooper wrote:
> On 03/03/2023 2:55 pm, Anthony PERARD wrote:
>> From: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> It has not been a dependency since at least 4.13.  Remove its mandatory check
>> from ./configure.
>>
>> Annotate the dependency in the CI dockerfiles, and drop them from CirrusCI and
>> TravisCI.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>> (cherry picked from commit e21a6a4f966a7e91cb0bb014dbe15d15cc0502ad)
>> ---
>>
>> Notes:
>>     As we dropped "gettext" from many containers, build on staging-4.15
>>     starts to fail due to unmet dependency. But that dependency isn't needed,
>>     but configure hasn't been updated.
>>     
>>     pipeline with many fail due to missing gettext:
>>         https://gitlab.com/xen-project/xen/-/pipelines/793302203
>>     
>>     pipeline with that patch backported:
>>         https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/794335026
>>     still several build failure, but less, and not due to configure step failing.
>>     
>>     Commit can be cherry-picked cleanly to staging-4.15.
>>     
>>     That commit would be needed as well on staging-4.14, but it doesn't
>>     apply cleanly due to change in configure, and missing dockerfiles.
> 
> Urgh - I'm sorry about this.  I'd completely forgotten about this mess.
> 
> We do need to get CI working reliably, even on all old branches, so we
> do need to backport this too.
> 
> But looking at the diffstat below, I think we also want to backport
> other things too (the change removing Travis), and I'm not sure we want
> to re-add the dockerfile comment seeing as we've already dropped it and
> rebuilt them all, and this patch is the one that stops it being mandatory.
> 
> That would simplify this patch a lot, and make it applicable to 4.14
> too, I think.
> 
> Jan - are you happy for Anthony and I to just go free reign on the older
> branches until we've got testing into a working state?

Sure, as long as it doesn't get really unwieldy.

Jan

