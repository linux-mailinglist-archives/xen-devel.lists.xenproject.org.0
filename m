Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B81A82FB59B
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 12:16:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70271.126063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1ozv-0003MR-0e; Tue, 19 Jan 2021 11:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70271.126063; Tue, 19 Jan 2021 11:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1ozu-0003M0-Tc; Tue, 19 Jan 2021 11:16:30 +0000
Received: by outflank-mailman (input) for mailman id 70271;
 Tue, 19 Jan 2021 11:16:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d268=GW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l1ozt-0003Lr-Ly
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 11:16:29 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7121c042-db07-439e-94ee-747c825c6ed5;
 Tue, 19 Jan 2021 11:16:28 +0000 (UTC)
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
X-Inumbo-ID: 7121c042-db07-439e-94ee-747c825c6ed5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611054988;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Y2k96HYsqE2zAQaZ3kin56k07+HKkpXyr82OKsFzgNI=;
  b=G1xtcm9k0NQ0BsYflQ+rmrYIUuk0i7ZtYucV/P0iVoSJcyyGju8vBtng
   7OeoPMsq5iK/FFyKpgyl3/4lj4Pa2d9a6Q2LJmxGkYwmTOO1ClDM0tgjf
   0uWoSgimovMpnSi5hngEKtd//xY9VN8ijR0dQdVDFHbS0ik2WICyw4Ln9
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: m3b6varXolqI1iNWmWdvMnkX2EZ4MJpMKZT0tbvuOlaeNAO/JdfF4C0FIuMozk8OpBZEIzkKVl
 7k6JOk6bgMal2yMwg5IW8Kh0tIVIi+D8KHBxsUk3IkL2aoHKrZaLXBJjYgvdrD7TF4bdZHr8yb
 Fy0/qvoqWccn4gFnMEDhskT14QwB2EdylLayh/nalMD0wMN6OcH3MLh+fB+iNO0Ex1FMubOqmw
 URi0MVY4eg8QRtd/dJjVC88y9ko3Zq88Wli3hkdKg1ZYTjPctfKWAOEoLRpeFseHxilEI0+lH7
 +dQ=
X-SBRS: 5.2
X-MesageID: 36655324
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,358,1602561600"; 
   d="scan'208";a="36655324"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TeecZC/B98A1hFtEoFAmyldhfu/ppDll/Wj7MMiGslfQ51jNuN8u42XNulQFAnwJyxp/7toQCCJtEnAUF4oqRwH7s1RP2iak0WPPVaTobsIoIuA8FBS+6a5zE7hVftf/g7ghusnQ7w9m0DaTtBx3FoM2W6ps/5SSzIa+kdVDHZneC2N/9n+1dNtfg8cOqzwt8JHpz56zyi2yhi9RIeAqmwlLqxXO+3m4yME8558bpCjGsN48RFa57Wr7XW8GLnGZL/hcN/fj8+Ja8D6haeIRTIbLwoSxK1LdMZKjcE8fGasWX5tiirJXWG13P6P7ACeR9loUCifHKHpMv9+1Ffg/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5NGH41KdJcRsc7zPwSo5vMWCwAHnm2+xzCNgZvW4XY=;
 b=ZE+q92tUS1J8u77IBngRkNng8FQZ6lCvuoSWOmeTV4zkRNDKEd/UeW0LYNIk/jZeYkGoDmJMFgQv5YkMY9G7ZbQe8PFeL+5p5d3c6sMGpIAbZ8S0SCBjAjEM84sJtGYslkVmBOjA2dNwImyP9LR30+0q3QJlHu37mnG9Nn36WujhQfzm4rZc01p+MFXZ/BXxBgI+gSVbPiI7qFiovTCVhcP/uLAVp89hnZu8z2w/uHBTH67HKi0Z7VAni0bDjy7e82V9aR8ie18u3aIXyW7X5kqnUpH7ZQJMWPT0pZVF93JAdWv8grsux+sp7QUWOk2qJmQKKaYFU1CwFqs9FsFWkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5NGH41KdJcRsc7zPwSo5vMWCwAHnm2+xzCNgZvW4XY=;
 b=Gq6zpg4q66VmPRkaNQslJwyqUTIGpA35Wihcg53n4MnOTLfVDUWdfAUXrLT38nbpzVN4aiPHe1IPagFm4xXt2Av/5icH3CMi80NtNxzJbTseBTlkkB09XbLbiu6sXlq76kVbPH1a0QLcNLr9Cq/nFD5oHcC2RJNE/geZ4JJ4QFI=
Subject: Re: [PATCH] x86/CPUID: unconditionally set
 XEN_HVM_CPUID_IOMMU_MAPPINGS
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, <xen-devel@lists.xenproject.org>
References: <20210115150138.36087-1-roger.pau@citrix.com>
 <7535c962-bb3b-6bca-977a-9e8a3332a0f5@suse.com>
 <20210118155426.tnzw7kiceqyytqwa@Air-de-Roger>
 <f7b3c154-7557-ce1a-c8d8-560709f6cabc@suse.com>
 <20210118171040.6ube5htw5lk4hifc@Air-de-Roger>
 <071f8921-d0c4-6907-697f-25a4d905fe2e@citrix.com>
 <20210119111406.owyitwdwoat2obeq@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a247baba-3be0-75da-f581-67a362325eea@citrix.com>
Date: Tue, 19 Jan 2021 11:16:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210119111406.owyitwdwoat2obeq@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0416.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::7) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abdac68c-d284-408c-e7c6-08d8bc6ba1b8
X-MS-TrafficTypeDiagnostic: BYAPR03MB4150:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB415059F19D4776A5610C332CBAA30@BYAPR03MB4150.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OzNbvWKZmFXMyEDUK3uxoiPAFwz2LDTGqEJqmHoHxmkqbpj7bIPcLLp4cT7MGOZQT+VAbnZsgIr6EWzzb8lS4n3WrgvVdUilzsgioX9f9wMM5yslvceCku2H1zWrVyQNDAGkT+0oBULtxd/vLYx5B+ndh+T1JRpDhM44vVQ+irGVeS5ee4jp5usMprOmebM+qr4gCufDMsmo5tFeTuwQFsEDeEsBiE2g630MGKOUkINIzDQ0P2dIHS5HLBqFlXq/3FosAVbUZ/4hVKwQo9XjxnTR6svBDrvBVhi/nXwsLjK+THVY0ANK75KmDZtLq+QNPodtI423AjaiMmc5SeSgn+8QzLBXf195sbBVvJa04ytMmKtR1uoENxFrk+WM59oRvY54XhhD8msrBQEIOq8bnGQ58GlAgURmHfeR1Cqe7uSfNBfXclczNzkcoG6/xMJVl5fgUL8wx+vqz7WWjV6mHrc4lTpxqwKpZMHflo2aT9U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(83380400001)(956004)(2616005)(31696002)(31686004)(66946007)(86362001)(2906002)(6486002)(6666004)(4326008)(8676002)(36756003)(5660300002)(66476007)(66556008)(8936002)(110136005)(16576012)(316002)(53546011)(16526019)(478600001)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZUtrZ1l5V2tyUFVZSEdkRCt5Mkc2SERPSnh6dGVCQzRuV2J6ZGpWbHZJa05O?=
 =?utf-8?B?WEJ2YU83RkQ5OXovTFpyNk5ua25xcU9LTUgxaXVQV1hsdWIxRU9IZHRzNjU1?=
 =?utf-8?B?aldnMlRPR1lYekJGb2VkK2hCbFBPNG15K1ZpUldmdDVBdHlZOXlYVmVtS2hV?=
 =?utf-8?B?ZGFxdWtVQ2lNcXdSRnZLTWJFNkpFTnVZUHpQNnQ0QVFQTTBzSFlwWUc3b0ls?=
 =?utf-8?B?RjN6MkNqS3R6S0hvTGdEMEQxejNYNDY5a1FUaGNxRUFOWGUyRFZja3lqQmh1?=
 =?utf-8?B?UzZBSFNSc09NNDlrU1FER2FFVDdFZ3JGNXZMTTNsVWdsWFJ1NG9QU1dzS2xJ?=
 =?utf-8?B?eHcremRlWWVvOXJWMGdNb3hhK1MvOGpGZSsxQjExNkl1b0N5UUpDVm8zVVM4?=
 =?utf-8?B?ZWZGRmhjeGNHdkJobXhUNzVIdFRtM0dSNWRxRHVMd09QdXBLbk1mYWtJdlRn?=
 =?utf-8?B?K0poaWlwTGZrVTZ2SXJibldOZUtIc3dHZm9QY09vbVJIZ2FLbHNjL1dyOG9y?=
 =?utf-8?B?cVlzSk9CekdQdm4zU21nSmFmYXBJVlBtWVNLRU50L21GSW9NQTl3b200MnVP?=
 =?utf-8?B?Q2lNTWFaQ04vb2FUQ3ZHWk5HckU2czJoVkI4STlCUm5vY1hHTkd2NDhxQlQ5?=
 =?utf-8?B?UWlvWGc4OEhQbHJuaUZQei94cGRIdm92cTcwek5PZGhaQWVIaCsvTUw4b2pS?=
 =?utf-8?B?bFFPTFdOcHlYeWNsVEROTDJoZzRVVkVNSDlPeC9YMWJZSWhYWXU2WHNjUUtG?=
 =?utf-8?B?L1A0eHJDU21xQjMyQ3VwTkoyRXkxdnk2U3dxdWlPMzZWcnh5eXV6Smg4RE01?=
 =?utf-8?B?MXBCL3RFZVdRNTFKKy9pVHhFa2VvSUFFWHlMTDk0aVo1eFl2NDlRSEw0TzVV?=
 =?utf-8?B?VmhURUoxbEdQWEJYRjl4bENFbkI5WHBaRkNDT3pSTEVZTE0rZ0hhZVZUZVdv?=
 =?utf-8?B?NEFUelhSZHNDSVliVTI2K25wTDFoaDNRTlM2UkkyRzlLQ3lQQUNXeldYM00z?=
 =?utf-8?B?VElaTFhZTUZvUXdBTE14Zi9BMElyNHJKQkR5dnZmYXlBMlNrcERXRzNNRVZD?=
 =?utf-8?B?MnZOcVh3NTM3YmFXNzNaWG9iUlhoV1N2cDI2cDM0WFZJa09ScWdXa25HMWZ3?=
 =?utf-8?B?dHBFOC9FOFBGZzJxWTAvZ1hYMklWQXNOTG1FdkN2TWRGUFIvYm5CME9RWnF0?=
 =?utf-8?B?c0F3N1htWlJYZFZRMDhZMTFUeXlNeU5GYlNUK2V1ejBYRkUrZnZVd3VaYU5p?=
 =?utf-8?B?NzgwQUdsWGp6cDU2QnJEWldjRzJpays4NmdMNld1Y2lldE44c0hSMlQrNnpU?=
 =?utf-8?Q?XFBNygLPUFutRdQoLneVmFXTTf3kHsRRe8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: abdac68c-d284-408c-e7c6-08d8bc6ba1b8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 11:16:13.5536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oOeU2kfm/C4jq8yOsuC5Ksa7wdTnMhg5Yd8hJPYCPuRY/J7bT44hRsDmlfl76zT3CCWfHLBYihzkzR9aeSMWoFHm+Oo74yLovA5FBFYOBow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4150
X-OriginatorOrg: citrix.com

On 19/01/2021 11:14, Roger Pau Monné wrote:
> On Mon, Jan 18, 2021 at 05:48:37PM +0000, Andrew Cooper wrote:
>> On 18/01/2021 17:10, Roger Pau Monné wrote:
>>> On Mon, Jan 18, 2021 at 05:04:19PM +0100, Jan Beulich wrote:
>>>> On 18.01.2021 16:54, Roger Pau Monné wrote:
>>>>> On Mon, Jan 18, 2021 at 12:05:12PM +0100, Jan Beulich wrote:
>>>>>> On 15.01.2021 16:01, Roger Pau Monne wrote:
>>>>>>> --- a/xen/arch/x86/traps.c
>>>>>>> +++ b/xen/arch/x86/traps.c
>>>>>>> @@ -1049,11 +1049,10 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
>>>>>>>              res->a |= XEN_HVM_CPUID_X2APIC_VIRT;
>>>>>>>  
>>>>>>>          /*
>>>>>>> -         * Indicate that memory mapped from other domains (either grants or
>>>>>>> -         * foreign pages) has valid IOMMU entries.
>>>>>>> +         * Unconditionally set the flag to indicate this version of Xen has
>>>>>>> +         * been fixed to create IOMMU mappings for grant/foreign maps.
>>>>>>>           */
>>>>>>> -        if ( is_iommu_enabled(d) )
>>>>>>> -            res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
>>>>>>> +        res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
>>>>>> ... try to clarify the "Unconditionally" here?
>>>>> I guess Unconditionally doesn't make much sense, so would be better to
>>>>> start the sentence with 'Set ...' instead?
>>>> Hmm, this would further move us away from the goal of the comment
>>>> making sufficiently clear that a conditional shouldn't be (re-)
>>>> introduced here, I would think. Since I can't seem to think of a
>>>> good way to express this more briefly than in the description,
>>>> and if maybe you can't either, perhaps there's no choice then to
>>>> leave it as is, hoping that people would look at the commit before
>>>> proposing a further change here.
>>> /*
>>>  * Unconditionally set the flag to indicate this version of Xen has
>>>  * been fixed to create IOMMU mappings for grant/foreign maps.
>>>  *
>>>  * NB: this flag shouldn't be made conditional on IOMMU presence, as
>>>  * it could force guests to resort to using bounce buffers when using
>>>  * grant/foreign maps with devices.
>>>  */
>>>
>>> Would be better? (albeit too verbose maybe).
>> The comment should be rather more direct.
>>
>> 1) Xen 4.10 and older was broken WRT grant maps requesting a DMA
>> mapping, and forgot to honour the guest's request.
>> 2) 4.11 (and presumably backports) fixed the bug, so the map hypercall
>> actually did what the guest asked.
>> 3) To work around the bug, guests must bounce buffer all DMA, because it
>> doesn't know whether the DMA is originating from an emulated or a real
>> device.
>> 4) This flag tells guests it is safe not to bounce-buffer all DMA to
>> work around the bug.
> /*
>  * Old versions of Xen are broken when creating grant/foreign maps,
>  * and will never create IOMMU entries for such mappings. This was
>  * fixed in later versions of Xen, but guests wanting to work on
>  * unpatched versions will need to use a bounce buffer in order to
>  * avoid sending grant/foreign maps to devices. Whether such bounce
>  * buffer mechanism is not needed is indicated by the presence of the
>  * following CPUID flag.
>  */
>
> Does that seem better?

Better, but the key point is that all DMA, emulated or real, needs
bounce buffering because the guest kernel doesn't know the difference. 
*This* is why the flag needs to be always present, because otherwise a
guest will bounce buffer DMA for emulated devices.

~Andrew

