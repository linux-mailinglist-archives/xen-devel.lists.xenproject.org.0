Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A087D78E625
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 08:09:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593354.926353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbarZ-0005Hf-JD; Thu, 31 Aug 2023 06:09:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593354.926353; Thu, 31 Aug 2023 06:09:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbarZ-0005Fj-Ga; Thu, 31 Aug 2023 06:09:05 +0000
Received: by outflank-mailman (input) for mailman id 593354;
 Thu, 31 Aug 2023 06:09:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xL7T=EQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbarY-0005Fd-DF
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 06:09:04 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1f96448-47c4-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 08:09:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB7068.eurprd04.prod.outlook.com (2603:10a6:10:fe::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 31 Aug
 2023 06:08:59 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 06:08:59 +0000
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
X-Inumbo-ID: e1f96448-47c4-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eoBMFafAQB0SB0jEfPXKt2kVUn2X71KpbXcWibh+QysDETRIAxJSsWQndTcUv/gKDM2/DQDgTyPE0s7WMNojRAwct/wlGEuIX5okbjpXpHyK/bRbgbY6mqXRqhnN+nSJTnKsPI8N+fn9lXRYU8K5MtVRlOHlOSTg6N78IZzmFB10QQlKT68CCWUpVmz/jc3EWsBvSrPJvD0ndH/wrzUFpb9HR92c/SwmumZvGuJSCbCBLkw40Wgl63ZfRysFUze4/wzlehf2GpLVVH4cDNBuUgWL8LhXhjNH8wuAO3BafXLalp7jmZIWPXYxW0IybhVI5DM7v6q8bp9eE21ovicgyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCeNr25cj19+nciixEHxDcEEeADH/1FikE5At5HqopU=;
 b=NJreaXr13cLyfV4KXEgNHRO5UcVaKax7NUW16Dw3il0cnzSIo/bzPmw5KsmudEp8318XVU02pIFksoro7a1YLwmk6vTTdnKqadHfro9mqFMtiGU+luxxJ44YTqcOgQGMixcJHdeqnVzICWBqgNUWVER7qykmf3hfxCHF//DYO449M+8uTs5gZyCSRbFAlZDJ/lsgMtNiYXxPDDOFsZsSrPCMdOvODFW81GeMPoW3w/b1pj//t2ZBNyr83axoHDIKZQNgR7dItFysY/OHFZvQJ7E4CGJjT7WZ6K6K5ZmDWL/l7x/RsFZPKKe/GDlJOpgBRVJ68Thm8DOThgECc8R4cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCeNr25cj19+nciixEHxDcEEeADH/1FikE5At5HqopU=;
 b=aw4N6UNjW0keFAfGONTF6hYgdMj41GgKczS/LWVXqSMyKMCaZj4akOv9C44NDtNqMX6HuXS0NB/zzHq1tFORHSoph/k59O6VmgVXgNYOT+vM/tzjgZ2PBfELEZ+rw/QxEec1XSc4dYiyV7RyDKP2BrsDXNVfTQyS4I+LptMezqs0M0THXLt854e//y6pKi32ohJjxNzcTQf7Fksxk7nrrUMvnq+XzAdJzAaHBcrZxDnklEzGD4Az2a5U7nxtqyDCoJBS2bPc7vTr3Di66haQts5MwOz5UfFHipEOFJar+A1+o/kbMufDB2bL06ofkC96iyJOBsHoXcpE1Gx9aHfYYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <28dffe2c-e8e7-6d6a-0d4d-e6de8e31b429@suse.com>
Date: Thu, 31 Aug 2023 08:08:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/3] x86: Reject bad %dr6/%dr7 values when loading guest
 state
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230829134333.3551243-1-andrew.cooper3@citrix.com>
 <20230829134333.3551243-2-andrew.cooper3@citrix.com>
 <6217ca42-d5bb-40a0-53f0-ec543c8297a6@suse.com>
 <c86b8f1c-dffb-c850-3054-f31f584861c5@citrix.com>
 <0708d6fd-2672-a0f9-e782-83e6eb66dbeb@suse.com>
 <2ced7357-b8ec-e071-9ce5-c4d23b1a6a03@citrix.com>
 <57079660-acda-eca7-5a39-42463cbf64e8@suse.com>
 <3e83abfe-266a-7b14-b84c-03eef5459dce@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3e83abfe-266a-7b14-b84c-03eef5459dce@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB7068:EE_
X-MS-Office365-Filtering-Correlation-Id: cdf7ce16-560a-4982-6990-08dba9e8c463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ctg7ltFCrgvOboARbZwOy0TonQspMUlJSz6XFLVBi8wbDChyUZajlRKP7I3VD2nFtlUMMO4xKZzXD7CvqV82MOG4e4L81vPi3iGFW5gIuCrSkRd+VSqg22m/Mn+0K+/U4JdLZbqXqAYgs9JeX7uhrnCmyzd6OiuCsaBUZ4Yip5rguSFYOSJ7+zCJFPGLraCKTg/ok2cIr+0Qw7WSEEA4qQX0DGBCr2jN8kPNE9tnRyhHgf0Mv/VdzT8jFP/fykboE3A8xojUpLXF0lwioAJ+ZyNaviN0HL1JGVJ4T7iKe66HHgRgSuYOiWD8bfgSROjycMPLywgNedZh615xDFLWOmLwotdDnGFJhV7U/hEEyFtkQS9cfpaVSNTn0yMiH15r+87ukDrTSmD+AjnLcNikX04LPndoNstKQdOGXsXO7uEfe4l++SPNKhFyzLW+FFECr9FfXXEA6Vp6X1I7ZOBdCg3c2xe2gfvn1+7UNq8GygPYL3ZNmqWSTmcy/i2e5KHRnBvkJxaEUgZbn1Cs0kuGvh6DrLke6RVAt1Fb4jnu3FJVRui7dQUdvC3OAN7MsL9Pinab4VYC65f7kLie3kNvkqmZbuveDgjSX9uLpCbllBl9dEWgLOYo7AWMOhACgjM2fjaHbkdMtkHWZwCWLQXNZQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199024)(186009)(1800799009)(66556008)(316002)(66476007)(54906003)(66946007)(6506007)(6916009)(478600001)(26005)(6666004)(38100700002)(41300700001)(6512007)(31696002)(53546011)(86362001)(6486002)(2906002)(31686004)(4326008)(2616005)(8936002)(8676002)(5660300002)(83380400001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzU4UVlGMWdSKzh3emN4YThyaXVVTFQvV2d0Wk9KZ0RER3BHMmNzbVY4TEFU?=
 =?utf-8?B?Y1JNUC9YZE1Mc3pSYlN6ZFR3Nkw2VzhnbXdCQ2dPU2pVT0dhcnQ3MWk4T240?=
 =?utf-8?B?d0dVdnlOT1ZLNWZHa1dSRjY2c085RmN5RDVwN21Wa2hvM3Fqb2RxK09NcHgw?=
 =?utf-8?B?MEgyTndmdllWTitXbmcycW1DSkN4VTQ5U29HbHZEUmVEUFVLYm9Vcmg5V0Zj?=
 =?utf-8?B?MVBJWHFDam1OY2ZuT2IrQ2Jzc2hySEU3emw1YXo5ckpPTjh2b3FlZU9BMlY4?=
 =?utf-8?B?WTZlZkpsdFZvMEEzdzljQ3lFSFUxZU9UbWRkdVZWUWhMTlQyYjVmYzBETFlC?=
 =?utf-8?B?cDBqc2c3VEtZQmt2Q1duRWN3MlFwNXZzTFcvckZYWjlLM3UwR3JMNERTUUR6?=
 =?utf-8?B?N0w2VlUvSFFUaFlPbTBhS2Zmb0Jlc0cyTDhRQzA4em9Pa1JFS1RiVUhRc3VH?=
 =?utf-8?B?OTdVUkNDclFoV2FmY2pEQWNsYTFUb1pUVEROaWlVeEFWUEVjdmsyVm14Ynhq?=
 =?utf-8?B?c3dOQ2tJM0hDbHVDYXJITzlnUG93a01BWXoxSDM2TnVHRW9BZm83ZG5sR1Vq?=
 =?utf-8?B?Sm4yUkcyamQ4OUFoMUtYeG1rNTByd2Y4SXVlK0lKNTZFdTBDMWRwcVZ5Q3Bx?=
 =?utf-8?B?QTJMbm5teWlOSnNGWEJNbnNHTkFCWnJndUs3cHdINkVWVll4V1NYSVhlKzVh?=
 =?utf-8?B?L0F4ekE3ODlycWp5a3Ivby9ROTZzcUxyYmpjdXE1SFJrZG9DZ2ZOdUZtVXVB?=
 =?utf-8?B?WEVwSmMrOFUyZ0NWZlkwRnJwV0ZxWlhJQ1hiMU9NQ3JpYUtHRUZLaytVcyty?=
 =?utf-8?B?ZTFhVXJaVDFvaHkvVkRXcnVGdytoZFd1U0RxK0RtSmQ2S1dqb1B3OU05N00z?=
 =?utf-8?B?RW0xV3ZzUnJjNzlkcDgxQlg3d0pUdDg5YW0wdUo1eHEydHJDcTliY2FobDVE?=
 =?utf-8?B?b3UwOGFhSm0xZENQaVJYU1h5WGR1TWZJUTUyMEpqZUdkUlBUTERpRVhZY0ZL?=
 =?utf-8?B?c3h0Y29sSUhWWEhKZmVUM3B1YUM0dnZJWmNaVnFEbG53MTVnSGw3cFFKclJN?=
 =?utf-8?B?MEpBc2ZzekYwZm1CMEsyc2xWVlVKWE5yKzdNejJiWXR6VXpjMjhCVnBUREh1?=
 =?utf-8?B?M2pkVjNmbitJN3A1ci95R2RpUHVBK2srK1RmdmdSTjY5UmsxTG93Q3RSV2dE?=
 =?utf-8?B?TFZ5RUtMMVdDOEN1RW0wOGs1SUp4R1lCWXloN2dxRmFPTzFad0dOVlRWT0tt?=
 =?utf-8?B?SEpyT1RmeDEzeSs3TU9jTERzcEh2MTVRTXFvNVhPUnZiWXRNS0lDcXFlbzNz?=
 =?utf-8?B?blRaQTFHeTNGR0t4bElGTTYrUmhPRE1HWndTSlQ5UkJ6b05YZ0FJalBZRlda?=
 =?utf-8?B?VlFKby9odEloUTMrK1gxK056Mk5Qb2xEQ1VzdzNYZ0orbUNNL2NGOVIyRG0z?=
 =?utf-8?B?b1lRTS9XZmYwME95bXVWY1dyM0dURmZDZzZtTEQzVkhoanNOQ3lGNXdnOTdl?=
 =?utf-8?B?aENZRkdOMVN6eExtYlRERUtPTEQrU2hwd29oMnRVdmlsck9Xc29LRjhoNkQx?=
 =?utf-8?B?eHRjVnQ4SHZCb1JLTXo4aXdQQkNrclJ4b1dvSkpWVDB0bmtxV2VESitOdzNV?=
 =?utf-8?B?VFJMZ3dEYjVUbCtSOUFRWGx1Y0dmSEEybHFFbFhDelNWOHN6ck1vcTJsZ0ZZ?=
 =?utf-8?B?a1VWMkhhVS9pVGtzeG9tcW0zOFRRYU82Z1diZ2gxKzU4eXJRM0UwUmwxYlB0?=
 =?utf-8?B?K1R2dTNZQ0d5eTlWTW02ME50bnBhZ3pXYVkxa3Jkd0tvbEJ1d2hvWTNNSld2?=
 =?utf-8?B?MDhTVDNpL0RLdk8yZi9ZUVdGdjVIL2ppeXJiNjA3K21kM3FWN2dtRWRqVmln?=
 =?utf-8?B?WTlkdHpiV2xWUG9xZE9XWTFlM2FqNG1kcURkeHYwZnJMWitXY09VWTY5U2Rl?=
 =?utf-8?B?VzNrQzBzM3ZVRE9WZ1loR2grWmIwN2VHVDR1S2pMQ3JqZ1FFQ1RUbStsTFcr?=
 =?utf-8?B?dDdxNkRnR1ZMeWNFbElvcHVrRTh2WndRKzBXeUQrZzlKdlpacGg0aUxEbjFV?=
 =?utf-8?B?TWJmbWtpTWg2LzhoQ0czZGZYMmY1RXlwMDl3ZEg4MnNqRERBWGp1K1g0TW1o?=
 =?utf-8?Q?ObMPuG+vUj7YlGVar40IiVDmA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf7ce16-560a-4982-6990-08dba9e8c463
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 06:08:59.6944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ovMYqiv3WnYhyOTTO+4zFkh+I6HIaAV7F8ch7MqKZrA5IU80SliVFwI3dnMRGLnTNv9+1cY5zQu0Lff3/H80/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7068

On 30.08.2023 19:02, Andrew Cooper wrote:
> On 30/08/2023 5:13 pm, Jan Beulich wrote:
>> On 30.08.2023 17:28, Andrew Cooper wrote:
>>> On 30/08/2023 4:12 pm, Jan Beulich wrote:
>>>> On 30.08.2023 16:35, Andrew Cooper wrote:
>>>>> On 29/08/2023 3:08 pm, Jan Beulich wrote:
>>>>>> On 29.08.2023 15:43, Andrew Cooper wrote:
>>>>>>> --- a/xen/arch/x86/domain.c
>>>>>>> +++ b/xen/arch/x86/domain.c
>>>>>>> @@ -1074,8 +1074,27 @@ int arch_set_info_guest(
>>>>>>>  #endif
>>>>>>>      flags = c(flags);
>>>>>>>  
>>>>>>> +    if ( !compat )
>>>>>>> +    {
>>>>>>> +        if ( c(debugreg[6]) != (uint32_t)c(debugreg[6]) ||
>>>>>>> +             c(debugreg[7]) != (uint32_t)c(debugreg[7]) )
>>>>>>> +            return -EINVAL;
>>>>>>> +    }
>>>>>>> +
>>>>>>>      if ( is_pv_domain(d) )
>>>>>>>      {
>>>>>>> +        /*
>>>>>>> +         * Prior to Xen 4.11, dr5 was used to hold the emulated-only
>>>>>>> +         * subset of dr7, and dr4 was unused.
>>>>>>> +         *
>>>>>>> +         * In Xen 4.11 and later, dr4/5 are written as zero, ignored for
>>>>>>> +         * backwards compatibility, and dr7 emulation is handled
>>>>>>> +         * internally.
>>>>>>> +         */
>>>>>>> +        for ( i = 0; i < ARRAY_SIZE(v->arch.dr); i++ )
>>>>>>> +            if ( !access_ok(c(debugreg[i]), sizeof(long)) )
>>>>>> Don't you mean __addr_ok() here, i.e. not including the
>>>>>> is_compat_arg_xlat_range() check? (Else I would have asked why
>>>>>> sizeof(long), but that question resolves itself with using the other
>>>>>> macro.)
>>>>> For now, I'm simply moving a check from set_debugreg() earlier in
>>>>> arch_set_info_guest().
>>>>>
>>>>> I think it would be beneficial to keep that change independent.
>>>> Hmm, difficult. I'd be okay if you indeed moved the other check. But
>>>> you duplicate it here, and duplicating questionable code is, well,
>>>> questionable.
>>> It can't be removed in set_debugreg() because that's used in other paths
>>> too.
>> Sure, I understand that.
>>
>>> And the error from set_debugreg() can't fail arch_set_info_guest()
>>> because that introduces a failure after mutation of the vCPU state.
>>>
>>> This isn't a fastpath.  It's used approximately once per vCPU lifetime.
>> But fast or not isn't the point here.
> 
> No.  The point is no change from the existing code.

Having thought about it over night: It's not nice but okay to duplicate
the bogus check here, but then please say that and why you do so in the
description. With that suitably added
Acked-by: Jan Beulich <jbeulich@suse.com>

> If you think it's wrong, it in a separate change and don't block this fix.

I would like to ask you to think about the opposite case occurring: I'm
pretty sure you wouldn't let me get away. Either - like so often - you'd
simply not reply anymore at a certain point, or - like here - you'd
expect me to adjust to your expectations.

Jan

