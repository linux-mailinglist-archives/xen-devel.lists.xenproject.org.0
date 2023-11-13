Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 765F57EA13E
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 17:28:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631788.985485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Zn9-000290-9D; Mon, 13 Nov 2023 16:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631788.985485; Mon, 13 Nov 2023 16:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Zn9-00026z-5P; Mon, 13 Nov 2023 16:28:03 +0000
Received: by outflank-mailman (input) for mailman id 631788;
 Mon, 13 Nov 2023 16:28:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OC0U=G2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2Zn7-00026t-EP
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 16:28:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b6071f7-8241-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 17:27:59 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB7058.eurprd04.prod.outlook.com (2603:10a6:208:195::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.15; Mon, 13 Nov
 2023 16:27:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Mon, 13 Nov 2023
 16:27:56 +0000
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
X-Inumbo-ID: 9b6071f7-8241-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQDzEXveT4oaJxEqaiH+DYQu9xqCHKSlud7H60gSuJnxlNnsJOMyGWlVJXFo1Q57kOaSUIR3TAzYw58WEl2q8E1KiQwNmSBQM+fX10EljyXPdFGVXqQUbt/6kt6U4eppCbJvY4imPHgNSfVvEPmejG1TMSSAgO3g79EyFvTipuC36yecdC5LKMJHGSGGAhu7bnimTYpJcSSoEZrzsarYUzLykck4ifmlWgioa8ftjpwlT1tlG0DxHi+eS0ihJwRin9qHtbRKyBMOJUzK6EFgzm9zC+wMyr2TOQK0bkNC5/TLOZBAsuBJ9gh14FH78hDkeLIbRiprf9t0BCQLHv3Kzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTfwVAAGNJbo80mRwH3YHpLQMH9zM6BdSYonh0KCeJQ=;
 b=Fi8U7ehD6GTTWMviM/RgLON9K0lwur4kcO+LWFUH91mYUhvuWOIlT27PbMRzMrhpFxvDbIflDIyVbUwmNSZDCTwXZYzDShlZXVcIaz+KYSHDXmvjKSqDBsGpaUEcenhgxP882uYdRJMYxGJY2Q3Q0hD0LXe7f8SKKAabSc2IX10Vz/hvUTO2GFTWlt5GZjOmHtLe1c48Bk8KRvmt7GqP3sAuZUIN6ovS16I/8ZZ9BiKl7PEkSP8cnSLLJo3WaxeWUxHi5KfKx3xfV2b9MDrmU750C4+VyDRk/hdJQuiu+9ihJT60MXI08JRgxtUuHW0LkSg9yr00lvQRANAKTmUQTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTfwVAAGNJbo80mRwH3YHpLQMH9zM6BdSYonh0KCeJQ=;
 b=d4drVZwE9GDrkYL5becA6C/DeOnGi8SQelWDxIP05nT72Mh11WHSV2BDbIw4RYvBqk4xkocQh8PcMPWWB0xh/eFyYJ9YlaIzHoYYUqQqWXFhch9SXaNbfml0M/EvTGXyb+5VpIjACKlnxPTu0pgYf/HpR3wd2I8K5PZjsIzfhSVoNh/M7pE5m6/ol1+P58cI2bvUnobfs7XwO40aa1pLJsJU7rXyVfg/DiRE0Gm/PzZYhKAO1Wt1IWn6IKFSmW8PL8XZtzAn6CRjGLhF345MFNZFchZl2QPinesh70MD9dXyNn/7bFVApHKz5Hf810JiIyJGLmwEAdGiDbl+Vhn53w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <30a94519-c622-6017-2cbf-35690114d49e@suse.com>
Date: Mon, 13 Nov 2023 17:27:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Clang-format configuration discussion - pt 1
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@amd.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <174FCBBC-3C2F-47E9-936A-F1399DD9AFFB@arm.com>
 <930d7aa7-7573-97d2-e146-ebe68214c0aa@suse.com>
 <7235E3F4-8387-49D7-A3B6-0EA93CAE408B@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7235E3F4-8387-49D7-A3B6-0EA93CAE408B@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB7058:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e968e81-c0ce-40c7-297e-08dbe4657e6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/fLrX1HUiFHm7PESsX1WROYwthojSwWiiZ37XCKj6bheRfXGvNhDToIWcZLtidnTQvXu4RiRqdAdze60ZrX7/NbiNWID9PrRoOmyKZorbeaePPaNh73Na9zl9eTwb0w/ngybOLHHiP87tIr8QatXhwOIchFlHBbZWpKUX52boYpCGwmXoa26ztAyhcqTwvOFnKHyYy2F3z+hsHH80533qKHdjK/FsKZptb8iFDE4Eoan4xLfgR2dJtXuVZ8IcDNyxiNpu4dDPK9lEpw26xFo5BNARregu14Uf5zZ6rrdAfzg/jsyGegeodbjdpWk+VNELyidFrlZ0YQ2b2jUunX04zTyKy9ZkOFsqLOhVe095IW+NAqKB1Wa1X39Q9HhyIgQ1rEa4KN7jJHIaAJT9ijHKpcct7W6JNJ60uugcHfznm55upgqSwffOtqqEVze5HpVwyWDwr5+0bSrCcrqs/kQcGDEFyzjR9ncplJFE+hlhXzfwrc7EffihwD1LPDM0MZcxIJkTOXxhHhl/TImwMsD2iQxdhfQ8zoNVfV7BsU/xm9Rycz+nDucOXaNUJyMog9ix6aHZ5onOSdtkKyHsUp07ZX59zBXprNEZWSUZc6yJI11iphAWRtpgRo78J4zyV+NItJcdLEp7LE/oUz5h0z0Kw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(31686004)(66476007)(54906003)(66946007)(6916009)(66556008)(38100700002)(36756003)(86362001)(31696002)(6512007)(26005)(2616005)(6506007)(53546011)(2906002)(478600001)(316002)(6486002)(5660300002)(41300700001)(4326008)(8936002)(8676002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHhGSjB5NHFVVlR3OGlnK0xnbFZjM0t3NlpWZkdtOUpPWXVTcGh1NXp3QnhO?=
 =?utf-8?B?OXBkb1hjRlNpM3JBL0hXSmFvMGJOWk5Yam5POWdkM0FFTk1pa3JGWDFhR3J6?=
 =?utf-8?B?Q3ZpR3dHT3R4N2dkaEw0U0w4Q1haZy9HKzltYW5IWTZScklFSjh2Wlg1ZUR5?=
 =?utf-8?B?THJhSEVlSEVXQVJJYnZzUDVnbmhzMm01dkRMK2tTVkFzZDRRRFpjakdtOElH?=
 =?utf-8?B?SDVGSDdhc000eUllWmtNMHRVMUtGeExKOHV0c2kxS3hsdE4xOUkvZzhleFh4?=
 =?utf-8?B?NnFnUHhxQ201OGZpWXU5bko1bEV1TFpLc0w1Z3VnNlJ1cUdSaEFFL3JjblFW?=
 =?utf-8?B?b09lSms5R3pGMTdGcW9jS3M1L2NIWm5jYTJ3VlNyS0JITlZjVjZZSk1oUENx?=
 =?utf-8?B?eW51eGpsaElVdVhGTTA5L3dIRzVFWDdSUThWazhUeHJ5NVoxa1BPV3JHNmFB?=
 =?utf-8?B?WDlTN0JvU21kUTBVL2VqRzMrU1VkZnlMVm82ZEp2T2VaM2VZVG1DRzJRR0FF?=
 =?utf-8?B?VDZuVHdrMmRMRm5SRkdHNXBDVldTYTJpeEhoU0lIVG16U1hFcWhkTzBrajN5?=
 =?utf-8?B?eU0razlReS9pMTd3WS9ycjBoQzFOWmNyakFaWE0rY3QrbkJsNC9Jcms2RDFX?=
 =?utf-8?B?eG5ZVGUyWDBzcVNEYitYL0ZYdklCbnZPTVZNdGRkTkpjTmtVZDhMWnp6US92?=
 =?utf-8?B?cmhleTRTdXp2VjNnaXJwNG51bXlKRDd6MlZmQ3ZLWmJWVHVwRUYyMVUwK3RL?=
 =?utf-8?B?TWJXMmxxVGRQMTFmS1F5endteEZieHpFeEJ2WnRQenlGak9XNGRRY0NweElV?=
 =?utf-8?B?VUpWWVRiNVZ2MDhsbUZ6clhvM3E0djhJL1o1VURtR3BqWW9jQ0QrVHJEalJy?=
 =?utf-8?B?aE5BVHhpR1dScHhTMWJXY25pbENpaCs5U3krL0dhakhLbmdkaXFHcTczaEI3?=
 =?utf-8?B?T2J6bHhKKzZxdHJkRldBaUIveHpXVzEzU003eVFLUEVpcDNTQm1uUW5LbE93?=
 =?utf-8?B?UmtFVHBQdndDVEYyVFEwcnNvOGFmclBpUjZreEJmVUx4M1JuYStKTk14MWtB?=
 =?utf-8?B?eEppMUpKNnBDRSt3eFlOTTY4cmpUQzhnb0ZybTVDSVQyT3pGMGEwczg0RGlv?=
 =?utf-8?B?UVExaVhNMnF3MGl5UDZNWTh3Z29DTGt3T3NNWWR1aTR5dnVGa0NEejU4NFNM?=
 =?utf-8?B?bTFNZUV2R0VJejB0TFIweXRkNkdLaExReUJTUXVRR01oZnJ2MEFkc2FEVzhj?=
 =?utf-8?B?RDhrTWtzckNrVWpSVzdsdkIrbERheENXb1dZRWJxbnNWMHBxQnlKWmJFZFNx?=
 =?utf-8?B?NUVtZklLM1N5eVlLLzlES0w3S3BZdlE3SWo1R052Z2sxUFpxR3hjT0c1eElR?=
 =?utf-8?B?RlhRcHZlYm9HSWdsUERSKzZJZk1KVGRGamxMRVpiQkdtU1VpRlErMDVmSncz?=
 =?utf-8?B?TFl6RWFPWXEzcXpwd1dxRWZzeHBNL3U5b29FekJPbEhXNUd2bm5LVUY2U0RW?=
 =?utf-8?B?UFpiTUZJWXd0YW44T1dWV1RsWWw4Sm4yT2NCcEFEQUNDVXdUMzFXMTNnZzVt?=
 =?utf-8?B?NllOc0R6REdLQnVySVdpck02Q1BZb3VvVVErbFFtQ0ZOY2ZkNUJTZU9FV3pQ?=
 =?utf-8?B?S1dGRUg4YnNPVmN6dmova3M2d3dyOWhwUHFOYUVGdFFKSTlWZU96Q3lYSXJL?=
 =?utf-8?B?YXBSNWtQN0pJRXRpaGpDayt0SWRMaDh0M0RpSVNsaHJaR2JiUHpPTWtlK0NJ?=
 =?utf-8?B?YmI5Q1pNUng1MmppZFVVSlpTdE9aa0pCQ2tsTXhzSVYvS2l2WjFJUG5pcXJi?=
 =?utf-8?B?MDhiMHUxcE9OZUVLcGswQXdteFhIWisrcHVXeVZhZ3RKYkZiOUhQTVFwZHJE?=
 =?utf-8?B?elhTU25zZ3hxRHRmZzV5SFNQODdpZzRDeFBwZ05FeFRZZEdYZTk4YVo4Zy8r?=
 =?utf-8?B?R3R6N0VndldsWks1TExxbUVEK0UvYURtUGhORnA2N201V1FSN2xwY0lvazNG?=
 =?utf-8?B?cWQrT3REd3JUbUg2QVhSVXJwcHJwK29tNW1QMDZyUk1qNWxNelZKQXl5K3B5?=
 =?utf-8?B?dFhKMnAzSmpPOUtMRk83WE1rM2FCT0doUnljMHNSeFFxVzRlZU9FbVE2aERm?=
 =?utf-8?Q?6EYqul5wY7aG+Ew/1/mrYxeep?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e968e81-c0ce-40c7-297e-08dbe4657e6b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 16:27:56.8010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XyZoGKA6rBUGvgmP6h5BtinObvUbMJfy2c3NQmnWdlFTyejU79KbdcbVRwUwfbH0WYvt4UWdC9dnfjzvWTF76A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7058

On 13.11.2023 16:20, Luca Fancellu wrote:
>> On 13 Nov 2023, at 11:31, Jan Beulich <jbeulich@suse.com> wrote:
>> On 08.11.2023 10:53, Luca Fancellu wrote:
>> --------------------------------------------------------------------------------------------------------------------------------------------------------------
>>>
>>> Standard: C++03
>>>
>>> ---
>>> From the documentation: Parse and format C++ constructs compatible with this standard.
>>
>> Since I continue to be puzzled - iirc you said this is because of lack
>> of availability of "C99" as a value here. What's entirely unclear to
>> me is: How does this matter to a tool checking coding style (which is
>> largely about formatting, not any lexical or syntactical aspects)?
>>
>>> This value is used also in Linux.
>>
>> Considering how different the two styles are, I don't think this is
>> overly relevant.
> 
> Ok, maybe I understand your point, you are looking for a reason to declare this configurable instead
> of not specifying it at all?

Not really, no. Here I was merely saying that with the styles being
sufficiently different, what Linux uses is probably not very significant
for our own decision.

> If it’s that, from what I understand clang-format will use the default value if we don’t specify anything
> for this one, so it will take ‘Latest’. I think we should put a value for this one to fix it and don’t have
> surprises if that behaviour changes and seeing that also in Linux that value is fixed increased my
> confidence.
> 
> However, if you feel that we should not specify it, I’ve done a test and not specifying it is not changing
> the current output. I can’t say that for a different clang-format version though or if changes happen in the
> future.

It's fine to set values. All I'm saying is that at least I would prefer
if it was also clear what exact effect the setting of a value has,
especially when that does not really match the language we use in the
project.

>> --------------------------------------------------------------------------------------------------------------------------------------------------------------
>>>
>>> AttributeMacros:
>>>  - '__init'
>>>  - '__exit'
>>>  - '__initdata'
>>>  - '__initconst'
>>>  - '__initconstrel'
>>>  - '__initdata_cf_clobber'
>>>  - '__initconst_cf_clobber'
>>>  - '__hwdom_init'
>>>  - '__hwdom_initdata'
>>>  - '__maybe_unused'
>>>  - '__packed'
>>>  - '__stdcall'
>>>  - '__vfp_aligned'
>>>  - '__alt_call_maybe_initdata'
>>>  - '__cacheline_aligned'
>>>  - '__ro_after_init'
>>>  - 'always_inline'
>>>  - 'noinline'
>>>  - 'noreturn'
>>>  - '__weak'
>>>  - '__inline__'
>>>  - '__attribute_const__'
>>>  - '__transparent__'
>>>  - '__used'
>>>  - '__must_check'
>>>  - '__kprobes'
>>>
>>> ---
>>> A vector of strings that should be interpreted as attributes/qualifiers instead of identifiers.
>>> I’ve tried to list all the attributes I’ve found.
>>
>> Like above, the significance of having this list and needing to keep it
>> up-to-date is unclear to me. I guess the same also applies to a few
>> further settings down from here.
> 
> From what I understand, we should give to the formatter tool all the hint possible to make it do a good
> job, for example here we should maintain a list of our attributes so that clang-format doesn’t think the function
> below is called __init instead of device_tree_node_matches.
> 
> static bool __init device_tree_node_matches(const void *fdt, int node, const char *match)
> { ... }

Well, perhaps they indeed need to do some level of syntax analysis, in
which case knowing which identifiers act as attributes is likely going
to help. Which is where the "needs keeping up-to-date" aspect comes into
play. The example above is simple enough that I wouldn't think a parser
needs to guess what this represents, but presumably there are cases
where ambiguities might arise. (I also wouldn't exclude that the more
involved syntax in C++ increases the desire to have apriori knowledge on
the purpose of certain identifiers. In the end, as per above, the tool
is being told to expect C++ code.)

Jan

