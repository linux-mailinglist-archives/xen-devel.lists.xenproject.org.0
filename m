Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD5B671F24
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 15:14:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480683.745198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI9CK-0005FT-TS; Wed, 18 Jan 2023 14:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480683.745198; Wed, 18 Jan 2023 14:13:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI9CK-0005D9-Qf; Wed, 18 Jan 2023 14:13:52 +0000
Received: by outflank-mailman (input) for mailman id 480683;
 Wed, 18 Jan 2023 14:13:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QcrT=5P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pI9CJ-0005D3-2M
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 14:13:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5379573b-973a-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 15:13:48 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8560.eurprd04.prod.outlook.com (2603:10a6:102:217::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Wed, 18 Jan
 2023 14:13:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 14:13:46 +0000
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
X-Inumbo-ID: 5379573b-973a-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffNwAn3ZkYa+csEaJ9Qw+YvgacBgiysQMSfgLab/a2vDq7PY3BT2A+vcCb4Rgpg353iKvKgWg0Zo0UgPaOuvcxoqWLVEpXAqxSP1m9Lj/gyD0sTuTpXDZdb3BBwcyvNSp+gItrhfAVGu/z9eHvf0uchr5DDZpooa8I+aWdV8cqP3ffxuJfK0cOnKeSKPz44cHUKb5UItFKGCweCdWElJ9+coNpVqFaouCDtuAe2T15RZMUIByQFFF/MtUJT7zV8FAmSZYAw48n0c476gOq8kkfghVlw5QAI6crR9jsin5ItUgqWAKNoxNXlvVYlXz9SvHWXBv6LR7NUj1tYKAV4czA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2BD3I1J1B1A53Sw6NFpEzt0QkfOGaSkop18+jYiq3Q=;
 b=bVs6e+S4fsiy8X48gTexmYkS2fsU0b1Vy88ZXB7n1/eSW/QlDP1TyDlsHnhF1J/3QNTk4z0RAXrxvtt9+bSEu8bBNC4VGVZKqhxUSnXj8Mt9rwj3vyiWAAxFXnJH43QY9y5iDXPOSoBU7DWvRsd6f+Ya2HWYxR6t5SdIboLiVxD4dYNOgKOQBJaiLIB7Y8vwbmh1vb07Qo+S9xFFUE0vFUP5LKeoIYYGa7eGHMy0YnW/dHy0xaU/urTARR/IpMVG2L23a6GzNK3lSoDHKqD6Pcp4e/9DFCximJCG1Oc3+gry5+O+X9oA++yUPxOVIZGC2cX/WUHk6r+o2ndDGbJxMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2BD3I1J1B1A53Sw6NFpEzt0QkfOGaSkop18+jYiq3Q=;
 b=lF1PYYashFkkMYMYMm0OJPoWhimG90AVdcchEyJ5zJAsZMC1FdzmW+07Fy0CQzVfXo+jQHvZvIJ1RMLDHw9DxevjHTY1wfPwdqG856KrWQJ/NgjNvH2ET7QFSg1hcCiY/STRlLdQp90HUsnCCaO+xR+6Fs70Hw+VAOcLxCIkT6YfaSPpu7bInarDesSWzPJcsMTloxF3sXCDMOaEtfo4bkFdsrllJmME7mA3CXxlrI5RqVWz8Adqh9ii/uXAL0rohFIpsPigJPuI92cKAJsXABDQNBmb3auWFBBcH4ebDTGHr2e+cA0M5iiLBBBHo/gpdGlvkl7dZJ2hapqub2OvuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <58790f2f-ba46-df0c-2620-370e3994faea@suse.com>
Date: Wed, 18 Jan 2023 15:13:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 9/9] x86/shadow: harden shadow_size()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
 <9bea51eb-4fbd-b061-52d7-c6c234d060a1@suse.com>
 <c5d201ac-89ca-6baa-d685-5bef2497183f@citrix.com>
 <a438f16b-7d45-d7e4-2191-4ed7b2077785@suse.com>
 <71e7ba34-f1ea-16fd-ec01-bb2aa454270c@citrix.com>
 <b49793f8-55be-0746-815d-ab7b627d3baa@suse.com>
 <733edba4-6913-97a4-f949-4f8899a3bba9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <733edba4-6913-97a4-f949-4f8899a3bba9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8560:EE_
X-MS-Office365-Filtering-Correlation-Id: 10f99de7-400e-4fd4-fcc9-08daf95e3614
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jMImaLOL1VxlsGw3FPkmHl7UKEQo6Jw73dQIgcxeLb1vBsvi41i6K3ZKRHW29Oyywhu7lZRvD/Ldo8nROHSadhsoyv87v1myhK2GdAKwnN/nUWFSX4Cjn2NI08/40fPmqEf5Ng84QK6E3qRzUzhUlUx9j+tO1B8Kdp0w4eDDGfRwHFh3/H3CW9JuFHVhc9YZCmpxu5U7bLIyisWJxSz/FySomkd12Jm5JVmODQlEQSHGZc+JzC3DNXse2vj2maUazrBmZof3EH+1WLI4gZo9y50gX5rJsBLCZfzvoUzUzEZFxh/sxq0aFLZC2+fEG/ljQN27yy/+bCvhBybWZGy/QbemlLQJZm6eFguE/KUmU9eNWnFakGMstYqYGRzBF1EP75qz85bzFzyYTjdGDwtQ7b+cd8/DsdKUy3l6OlSkz42Xdl1GlEI3hPoEz5MnIfkEYGODHstPNMMKxBIA4HtL6lz4jzJuC3OO0UFD045z9S3eCp6ty/8Y+UPSICq89UwWbpQUyiEeGNVkSd0HGySvJAjPfkyCztz3uA7+pyg3cbKeABnPejK/cwW0N5oaeloHk3AgfDwAMAJ3gnOIYjF/a6pqN6UR1aMGkvZ4rf4R2e+RU8RandchNuqD0kKq96WgWvp0VuCvGqAecQN43nML2vX/wIGxDHNzOG7wrKl3FEd0an7oWrRr4GksY70dlRJMWpcOiVbG4j+aVrn40jgY7YOAibGj9hWl3aKZfvqIQqA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(396003)(366004)(39860400002)(376002)(451199015)(6506007)(36756003)(5660300002)(2906002)(53546011)(8676002)(83380400001)(8936002)(31686004)(6916009)(4326008)(38100700002)(6512007)(6486002)(26005)(41300700001)(478600001)(66476007)(66946007)(66556008)(86362001)(31696002)(186003)(2616005)(54906003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmRpZ3Y3eDM4OUJzSm5uUGZCZWE3aTFCWjJVMGdEYWdGU3NjVkJCNFVnNzYz?=
 =?utf-8?B?ekhIUyt0OW1rZmZQazVsWjJqMk1oZ3VLd1J4WUpkeEFxNVAyblhEOGJNcHJz?=
 =?utf-8?B?Y3JabWF2VG84Q2tJKzVlN0VxVnNzSXdSTEp4TU5JdzJrWFAzYUVsRjVuQ28x?=
 =?utf-8?B?bEh0OTNQVlRtdnlOaTYrVnQ5ZmZOZ1orTElHM3lGUFBBWUwrczA4U3AvUXlz?=
 =?utf-8?B?a0x5ckJyTkx2eEJtcjh0a25vWVFTWEIxL2ZUcE5ac0RESTNSeHBhWVBBOEsv?=
 =?utf-8?B?WGhwOVpIY05rc2NzbnlWeGovU21KQVFHR1E1SXR1MGJEcWRmWmdkTVg2c2tM?=
 =?utf-8?B?ZndQYW9LNE1jejN2TWllVXBoZGpjRmdNK2lkb3d6T21yZXFBWUVZYThzSWlv?=
 =?utf-8?B?TkxCb2FmRi9UUndhMUNZdW0yZUNQVkNCakM3b2FwQ0dqK1BxVFFqQXQraTNC?=
 =?utf-8?B?dmhoY2VjaVRWcjkxZFBkQ3R2ZUQxeG9vS3N5ZWRubUNhQ1BLSUp4RHZIdWo0?=
 =?utf-8?B?S0ROOHBmTk1kRVQ3MTU2UHJYSDExMHBidTJTb1pDQXladXpoSGhzdWVhWVZp?=
 =?utf-8?B?OEFHNm52ckpPdHA3NFZlTlEzVCtCeXFQaWpzQXoxN0RjMVRnc1MydGJRTTNq?=
 =?utf-8?B?V0Q3TnUvY2NDT2ZQNzhWenFMS0p6dkNLVk83Z3cxdmxDNkl4a21hWVh4azkw?=
 =?utf-8?B?RXBOWjl2UnVOUjR3c2ZENDhVdyswSDBkbktKcWxjdm04UzhXQVNOR3Z0UFVN?=
 =?utf-8?B?a00zZ0plSThYNkRhTy9xOGY3em9sSWVzM1VhQW04LzZTY2RYcjczdmh1S0Ny?=
 =?utf-8?B?OU1scGQ3eUJSbDZqb3NLS28wZVJORGMwSmFnY2tqTGhvbWxrWG9IT05xaEda?=
 =?utf-8?B?VGQrRUpJWGhSOWxQN2huaG5RNUlFeW1WSS9xU3MxY1p5ZitaejJQTGJ6STlZ?=
 =?utf-8?B?TnFhbUEycS9EY3pJVFZ5cHdxM3lCamMxYjhJVk94M2dnL0NQOWJLaXhrNlM4?=
 =?utf-8?B?T1ljQThrU1BPSXBQRUVxTHVmWVVMc2NWOW1WRGdoaEc1STM5N0hKYithbWhG?=
 =?utf-8?B?Wk5ydXh4Ym5JNVlHNFIzTGl5LzNIQlVwdXNqQ1ZyVit5WnFSc2k1S1l4ZGkz?=
 =?utf-8?B?aURRZVRlK3h3Z3pJQXBlT1dUTkVhOVk5a1oxaW95ckRkMFZmSWdtZFh6UHVj?=
 =?utf-8?B?UTVqL1FzaHRiRWk1b0FjMEV1bFgxak1RZUg2VmtZTmxGOUQrWHgrMk40c3Uv?=
 =?utf-8?B?TldWZ1VuTjJnUlJaSy9FUGZPM1dzdFVPN1dEbjlFSU05Z2tXcUNQdnNoUVZn?=
 =?utf-8?B?SEpVeTNGcTRHRnV2eHZ2eUY1NkJtcjV6eVArTVp2VHhWQUdOSTRZSUttcUFI?=
 =?utf-8?B?aE1LZk85VGxqQzhzMGluZENtS2JxNjBOUGdLZVBzeG1UZ3VLT3NZOCt5REsx?=
 =?utf-8?B?NFJLVTNzMy9pZkMwT0lUTDgyRExLMG5haGlaenI0RFlZOWtNMVZLaDlteUsw?=
 =?utf-8?B?TnVJRG1CNWNnUE5FZ2graDYvb0pyU29INTF4cDRFWFRxWGhNbnQ2S3pQbFl2?=
 =?utf-8?B?ZUgrbXA2WHFwRVdjQTFETFVRaEZyTjZvUzJRendkY2tUQVRBTUR5ZGV3Vkcx?=
 =?utf-8?B?Zm5DS2VoVkxIbExBWVpJUXdnYStGaHp3Y3JTN1Q1N2NzNFRJUWFpUkRkMEtW?=
 =?utf-8?B?UTdqUUc4Y1pMZjUxcE41Ymw5UVc4NlRLQVZKSThpU1l0U01jMmUyVSthMmVx?=
 =?utf-8?B?dFp4Y1UvajJQZTdJUXVmaUdtTXFIYmRrUlF5bHdCbzVYUUplamJxcWpMWmtD?=
 =?utf-8?B?WVNWcDIraUVrMk5MSVdiZ0xqeEJOdFh6SUIxVU9ML3ZmeURUZU9UOVk0K1Bi?=
 =?utf-8?B?RHNlY1hvRm8xNTBXWHJDVEl4Y1U5WnhncTFNSUhVUzhSM0JvS0tSazV4bUtQ?=
 =?utf-8?B?bDRFZkt5RlFJZDh5ZlhPS2E4TmF4UkpodFM5Y05OVy9maW5QRUVrNDcreFQy?=
 =?utf-8?B?M0J2UE1rR0dYMXRueXFPdEFNQmZpN1JyUUZHR2laamJGQkVhUGY3RWNtMGhh?=
 =?utf-8?B?cUJGTjk5UjdPMytvemlsc1ZqOTNEWEE0UDFkeEljWGZsa0xaSG03cU1aaUNT?=
 =?utf-8?Q?v89B6TEg6KMVtiRJHmWcsbqWE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f99de7-400e-4fd4-fcc9-08daf95e3614
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 14:13:46.4526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1WSu00QBtzXmO2liKt8GDzx9M4RCMvwi0lrrmGSMXYc29IAnZ+caq3kw9GE/jQIaOq58cdTSdPWEbK58wEA0zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8560

On 17.01.2023 20:13, Andrew Cooper wrote:
> On 12/01/2023 10:42 am, Jan Beulich wrote:
>> On 12.01.2023 11:31, Andrew Cooper wrote:
>>> On 12/01/2023 9:47 am, Jan Beulich wrote:
>>>> On 12.01.2023 00:15, Andrew Cooper wrote:
>>>>> On 11/01/2023 1:57 pm, Jan Beulich wrote:
>>>>>> Make HVM=y release build behavior prone against array overrun, by
>>>>>> (ab)using array_access_nospec(). This is in particular to guard against
>>>>>> e.g. SH_type_unused making it here unintentionally.
>>>>>>
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>> ---
>>>>>> v2: New.
>>>>>>
>>>>>> --- a/xen/arch/x86/mm/shadow/private.h
>>>>>> +++ b/xen/arch/x86/mm/shadow/private.h
>>>>>> @@ -27,6 +27,7 @@
>>>>>>  // been included...
>>>>>>  #include <asm/page.h>
>>>>>>  #include <xen/domain_page.h>
>>>>>> +#include <xen/nospec.h>
>>>>>>  #include <asm/x86_emulate.h>
>>>>>>  #include <asm/hvm/support.h>
>>>>>>  #include <asm/atomic.h>
>>>>>> @@ -368,7 +369,7 @@ shadow_size(unsigned int shadow_type)
>>>>>>  {
>>>>>>  #ifdef CONFIG_HVM
>>>>>>      ASSERT(shadow_type < ARRAY_SIZE(sh_type_to_size));
>>>>>> -    return sh_type_to_size[shadow_type];
>>>>>> +    return array_access_nospec(sh_type_to_size, shadow_type);
>>>>> I don't think this is warranted.
>>>>>
>>>>> First, if the commit message were accurate, then it's a problem for all
>>>>> arrays of size SH_type_unused, yet you've only adjusted a single instance.
>>>> Because I think the risk is higher here than for other arrays. In
>>>> other cases we have suitable build-time checks (HASH_CALLBACKS_CHECK()
>>>> in particular) which would trip upon inappropriate use of one of the
>>>> types which are aliased to SH_type_unused when !HVM.
>>>>
>>>>> Secondly, if it were reliably 16 then we could do the basically-free
>>>>> "type &= 15;" modification.  (It appears my change to do this
>>>>> automatically hasn't been taken yet.), but we'll end up with lfence
>>>>> variation here.
>>>> How could anything be "reliably 16"? Such enums can change at any time:
>>>> They did when making HVM types conditional, and they will again when
>>>> adding types needed for 5-level paging.
>>>>
>>>>> But the value isn't attacker controlled.  shadow_type always comes from
>>>>> Xen's metadata about the guest, not the guest itself.  So I don't see
>>>>> how this can conceivably be a speculative issue even in principle.
>>>> I didn't say anything about there being a speculative issue here. It
>>>> is for this very reason that I wrote "(ab)using".
>>> Then it is entirely wrong to be using a nospec accessor.
>>>
>>> Speculation problems are subtle enough, without false uses of the safety
>>> helpers.
>>>
>>> If you want to "harden" against runtime architectural errors, you want
>>> to up the ASSERT() to a BUG(), which will execute faster than sticking
>>> an hiding an lfence in here, and not hide what is obviously a major
>>> malfunction in the shadow pagetable logic.
>> I should have commented on this earlier already: What lfence are you
>> talking about?
> 
> The one I thought was hiding under array_access_nospec(), but I forgot
> we'd done the sbb trick.
> 
>> As to BUG() - the goal here specifically is to avoid a
>> crash in release builds, by forcing the function to return zero (via
>> having it use array slot zero for out of range indexes).
> 
> I'm very uneasy about having something this deep inside a component,
> which ASSERT()s correctness doing something custom like this "just to
> avoid crashing".
> 
> There is either something important which makes this more likely than
> most to go wrong at runtime, or there is not.  And honestly, I can't see
> why it is more risky at runtime.

Well, okay. I did explain why I think there is an increased risk here.

> If we really do need to clamp it, then we need a brand new helper with a
> name that doesn't reference speculation at all.  It's fine for *_nospec
> to reuse this helper, stating the safety of doing so, but at a code
> level there need to be two appropriately named helpers for their two
> logically-unrelated purposes.

I don't think anything can sensibly be made for more general purpose
(not speculation related) use. Here I'm specifically utilizing that
array slot 0 is being picked as the fallback slot _and_ that slot is
actually suitable. This may not be the case for other arrays.

Anyway - taking things together I will then simply consider the patch
rejected, despite it being a seemingly easy step of hardening.

Jan

