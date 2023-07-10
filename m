Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFABD74CCBB
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 08:21:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560913.877078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIkHL-0006Eo-5T; Mon, 10 Jul 2023 06:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560913.877078; Mon, 10 Jul 2023 06:21:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIkHL-0006Bt-1j; Mon, 10 Jul 2023 06:21:47 +0000
Received: by outflank-mailman (input) for mailman id 560913;
 Mon, 10 Jul 2023 06:21:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qIkHJ-0006Bn-JJ
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 06:21:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a9cd083-1eea-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 08:21:44 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DB9PR04MB8464.eurprd04.prod.outlook.com (2603:10a6:10:2c1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 06:21:42 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 06:21:42 +0000
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
X-Inumbo-ID: 0a9cd083-1eea-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJDA/w2eGeYYDUzO55He5fPNfUxZPFh8nwH3R+mZiWVnChVc94NFXvwT5jwOmBOfe609thc8jzrjTaguJcBJS3wuhuDqmk/ybyFEYXj/2Rlhw+NsFm/QBple9gnmvYr2jEvyAluyECkdydVswA3z+plORc87lfEPYPHZUFaeR9qipMlYb8S7QNyEheo8Vo/5mNbGTc3jPr6/dyt+/euextyY0VZRsBCS71TnV84N8pay1QC8+JppVd8duoWycVEO4ob99hGVb89cwHnCPdJOt+nZT3mElJLOz2yWaaoeZYO7k1zoqgf25z67T+N7abgF68ERAjV8ee+UF1fsmaOJyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ozj+ldin6Zd4u8amLEQvs/aJ5J70foMberS7POJ0u1U=;
 b=R81ffrog/zoOKz36RoVDHJKkeOiNGomhMFt24V8g2lCctOlQuNHEZ6LKJautiWvUjItiu551hszVbYVvHrPxuBOSL6tyIuq1eGyWRXvmI9zsv2IB3N9mbopbNjbvrmw33lmToFpq+mjsA/ulYHugZ26K/z0nfGMka+xTxEqbTh9E2lCKj4wntMCExoUxnRd0aA3C9qgt2A+7GXLiJJijKD4IQXLB9u3RRD+sYtmTPmy8pf2P6mQMW+0bY3exoULwizlrogMUT/o+rI8BysVfJvI59iRCXjff/sEPsVEKdzkGGjW0TQPVk2QB5TYASFevQWlxKiGVY5JcySwIlG1egA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ozj+ldin6Zd4u8amLEQvs/aJ5J70foMberS7POJ0u1U=;
 b=fu6IA5Co8RbTQo9911/dHpvO76cNpLBKIYtAQ5/M2Wmb+u82o4pTlHkHjrRPELGmpKLwL+UKw7frJEQ1vTi3N+VQ2uYJyG8mj1MlqtJZ+puaUXnCG8xV5kGo9fwQLJGhlAgs2vVI+t6ycVx9wr5N2NicwcjQbbAdzVL3jbhFcT1vc1W8Nx3FEtCj0oeC517WE+ZlI9VtMaxDcsNn04ZGrJP26vDCcTnHuITWbaOgsvUkqHGoFV3Ksx9lqkJO9rGj+nIdSM90NatM7JWinPkN7qEK3RXkpVmowWmdy5+Rg1LkZyYKJ2jC0IgQkin+TKfKrGLJGG/4m69+J3jEBWqBNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b69c2133-c34c-62d7-f2d1-289432be50c3@suse.com>
Date: Mon, 10 Jul 2023 08:21:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] docs/misra: add Rule 7.4 and 9.4
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org,
 george.dunlap@citrix.com, bertrand.marquis@arm.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230706224619.1092613-1-sstabellini@kernel.org>
 <9f2fc7fc-cab6-e14e-6fd3-a2e75d4becfa@suse.com>
 <alpine.DEB.2.22.394.2307071406480.761183@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2307071406480.761183@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::11) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DB9PR04MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: 063e7402-0a6b-4d3c-a728-08db810ded85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sqeFgWAO09Xht3b9d3aHw9ZNFEbbD8KksVE2yKGITLuLNnTLgBQ11yg9FI177zzjyn5ldNaq+MA80zsrfmdgERDWsh/TLZfdjTV0c4t1vKybriG9nS2vCVN0u4H/Akg3fWeubPOk0W4f4/UzEqhYGE88mBN7Oo3pKvC3a+s/5ERm6AvAVeMPDwwP5BlP2shTUzUcjspltU6ZdpptgLqY21exhdSbZ+TT3lVintznbmDH91NKk+seSffyAB9lXIn28KquNhh/Ru4XADMahMP7i1D5NXuQLjna0k2RrWwzDszAaOzouIBMlZ3p3GyFO94K3Kfq4c6I3t2h13cKNRcStrwll0br+FHiCg1r16iR+oFnJLGb+BJKh9B/q6DU7wpoM4ES62Jm9gCoJV/shfgZqt33rQxHQNdTB4NNwr96hQMMSU2p/32XurkuWP5jNnzSyKf9+9Tp8+sEvaT2NWx1RBq/dsMvaFhGQJr2yJczViQhed95OS6upewykh4ZjuY8qWjwrEbsEMKchahQbfgguVGYo/HxXWqEIjJBk4cCJzpLzPej7LL26Q03MBahkaa/bDg7jTniJl0Un9DbEgsREq3N52VXYVrcNnEG/iv6DLfm7sTLoxxlJ16ocoFLIFIrdQLu6/Qysn2gjICuGxTZ1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199021)(86362001)(31696002)(38100700002)(31686004)(36756003)(6486002)(53546011)(26005)(6506007)(186003)(6512007)(2616005)(5660300002)(2906002)(66556008)(316002)(478600001)(66946007)(8936002)(66476007)(8676002)(83380400001)(4326008)(6916009)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3JnU1dRSlRvdHdMc3NFUDVCbzJUOUgydktrSS9jUFZxa2U5NXFtYlNUb1Vz?=
 =?utf-8?B?S1RrM05XYWhSSm1tNWg0Rm1ILy9xdnJKZDZOVkNCOTQ4eHI3VEdhNXJGSklu?=
 =?utf-8?B?OUlTbkFtRElsTmJIOU9kVlp4cDhpem9BVGFiT0NpUUpEWlZQZVVpQTJsVXB1?=
 =?utf-8?B?aS82SEdUMjJzRnpGQ3dLeEozSlF5Y0pSaHVXejd0K1FqZEtrclJZWVI2WkFN?=
 =?utf-8?B?RnV1ck9qRjlqcVVscUJtZ3diNE5lUWlMUzE5VmMxSjFHenVpV2xDZGZkWmZv?=
 =?utf-8?B?eVF6ZzVLVWg2L09hSDlJNFlmYUMxTVQ2bnZORWtLMEljOWIxdTBTeThRSC8x?=
 =?utf-8?B?WDVxVFY4dHpIcVhraXErVFA3ck9CVjF3bkVHaFoxUk9XV1dhaVk3VHFqYi9I?=
 =?utf-8?B?NUF2bklvMFFsbVkrdTV1WExqWEtqYU8rT2NkNWRpeVBuVUl4S2ExMnBFRHNs?=
 =?utf-8?B?SEJxT0JEeFBNamltQWVNYzROS3V4SkZNRzVDakpxME5BWVM1K2VlbFpKM0RQ?=
 =?utf-8?B?eTVrajJINWhHZnlVdVZFSVBzODFiQjRJaG5obDM1WEFYVHY1Tkhod1oxYnhT?=
 =?utf-8?B?OVQrSG4wSTVsOFJxRXgycXZBZlQ0VzQzd1NXL0NEQnAzYmxBZ0NnMGpEM05M?=
 =?utf-8?B?WklyQTNxSll3cWhld1ZiRytBZ0E3ZDh0bmlweVhZT1JWQzVKekhQa1p6elFz?=
 =?utf-8?B?UkMxRWp2WlZUUFFrMXlmR0swN3NrOWFhK1plMmNDVXp4UDJKalNWdklRNUdE?=
 =?utf-8?B?YmhHdUxBVGYrcVY1anVreWMwT0ExeDZ4NmdseVBPUit1NUJzYkI4YjFZOUlR?=
 =?utf-8?B?a05EUnQxdi9hMVJYMzdDWnkzRmsrZG9TSXE4MnBRUzRoQ0JFZTRTOFRJb3BG?=
 =?utf-8?B?T1piakJERkFUMm5XQW9GbytzOVFnWXlGeFlJTmZ3TlprYytDZGVHc2FsSXlp?=
 =?utf-8?B?cGF1OEExNVBwTkQrOXVJTkJDb3ZlRGdXREthTkM5N0FEOW9rRjlzVTMxNmpu?=
 =?utf-8?B?KzZ1ODFUZlk5bE03dXpSdzBBa3RhUXRMNjRpYmRDbitBM3RhampFRE53OE15?=
 =?utf-8?B?MEg1WFFIVWdIdXZuOEJtd3lDOEUyVUt6M0NZQjBSalJ4TW5VNkwyS3JicDJl?=
 =?utf-8?B?dFhlL2NNQXlTSGpOcTkwT3ZJR3FmaWsyQ3VsQ2tWTGlJQmoray82N3YvczUz?=
 =?utf-8?B?RG1IeU40SFl3MjhtK3dwakRLVi93V0kzS1Y0bFcyYmZ3QjRCdGlYMGpiOTY5?=
 =?utf-8?B?Z1RNS2FyK2Y2ejhPcVV2SDRLZmxHT1hSeHZRMm1XcElNZGlMZ2QzdUJyNDM1?=
 =?utf-8?B?T2cra1AxcDJSSkk3SWFHZ2FjNGI2R05SMytBVElmSEtiVkw1NDVCKytobERS?=
 =?utf-8?B?YmxDZEZxQUtiYVJKTzdOYzFBTzJTQjhYZFBHVXRlVVNpTnI4K29qUTE3b2tL?=
 =?utf-8?B?TDd3d2MvSWpPZXRhdkhRY1RjTmNGL1NaQWF4aVpMNGwrZHBwcm5qeC9hd2t5?=
 =?utf-8?B?eFM2d0tpNzlXN0FuOVFCbTFSVzVYOWYvYmpWb1VNL2ozVjgwNWlvUTlsclJI?=
 =?utf-8?B?NEQwQWRVR1VxK1VBSGp4Q00vS1A4d2krUG5BbkFaWlJic0ZVRnJYem9YNENW?=
 =?utf-8?B?YmxxWHl2QUNVZnJBZUxOSmFqVnlvSWVTc3lRT29XUzhnelJ5anVpa0VnR2Q3?=
 =?utf-8?B?RkMwRUhZWWhPS0o2VVdyNzl2dkVZWDRwYkdKcW9VQVYxR216MmZZek8wTnNp?=
 =?utf-8?B?anU3eGxrMXB6UXhmU2I2NVBIOTVINkE1ei9JSytJWE9pRUg3cGYwV0laSlVM?=
 =?utf-8?B?aERHNkVmL0tscUpPK3JjS2tuRVUvekk0NWF2NXh5cm5RSmwwNTE1eGQrYU1y?=
 =?utf-8?B?ZmF1RUJnVlo1UUlWa3VjcHJoUDhtS3FKaUlHSEt5TmY5N2VKWWZPZnJrclFL?=
 =?utf-8?B?Qk9SaUc3YXE1MFo1SzZ5d29EZDI0TjBmMTl1RjRVTHVlR3ltVGw0VnhRcGhx?=
 =?utf-8?B?bjFZb3M1L0NJekwycXhnYmFrNGl6UGY0YjN6OFNDN1Q4Nm9RK3ZmYkVTNEZO?=
 =?utf-8?B?R1ExQ1Q3Y1haQm9zNC9iRThsWXdQd1JKd2RPdlZxc3pZYjFDbTlDb0ZnRkNx?=
 =?utf-8?Q?FnwPMyyIDW/k2hwlpxC6GmESP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 063e7402-0a6b-4d3c-a728-08db810ded85
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 06:21:42.3578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CUhLrcSwOWlaJHu2zZSaxr4IOYXPGtQbH9jBUhJ581NFgpLgJu8qfafU2RNkaLgpEHyIq1gO5SRqnlVSmMfzKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8464

On 07.07.2023 23:10, Stefano Stabellini wrote:
> On Fri, 7 Jul 2023, Jan Beulich wrote:
>> On 07.07.2023 00:46, Stefano Stabellini wrote:
>>> --- a/docs/misra/rules.rst
>>> +++ b/docs/misra/rules.rst
>>> @@ -203,6 +203,13 @@ maintainers if you want to suggest a change.
>>>       - The lowercase character l shall not be used in a literal suffix
>>>       -
>>>  
>>> +   * - `Rule 7.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_04.c>`_
>>> +     - Required
>>> +     - A string literal shall not be assigned to an object unless the
>>> +       objects type is pointer to const-qualified char
>>> +     - Assigning a string literal to any object with type
>>> +       "pointer to const-qualified void" is allowed
>>
>> I guess this is relevant also in a few other cases: Considering the
>> significant difference between title and actual text of the rule, and
>> further assuming people looking here won't always pull out the full
>> doc (they may not even have a copy of it), I think it is important to
>> also mention in a remark that despite the title all "character types"
>> are permitted, as long as string element type and character type match.
>> Since the compiler won't allow mismatches when the lhs type isn't void,
>> mandating no use of casts to "satisfy" the rule may be a way to express
>> our intentions.
> 
> What about:
> 
>    * - `Rule 7.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_04.c>`_
>      - Required
>      - A string literal shall not be assigned to an object unless the
>        objects type is pointer to const-qualified char
>      - All "character types" are permitted, as long as the string
>        element type and the character type match. (There should be no
>        casts.) Assigning a string literal to any object with type
>        "pointer to const-qualified void" is allowed.

SGTM.

Jan

