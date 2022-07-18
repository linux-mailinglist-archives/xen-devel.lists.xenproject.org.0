Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B225784CC
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 16:07:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369840.601393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDROl-0006zC-Tj; Mon, 18 Jul 2022 14:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369840.601393; Mon, 18 Jul 2022 14:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDROl-0006vT-QN; Mon, 18 Jul 2022 14:06:59 +0000
Received: by outflank-mailman (input) for mailman id 369840;
 Mon, 18 Jul 2022 14:06:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDROk-0006uv-Sb
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 14:06:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70077.outbound.protection.outlook.com [40.107.7.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e27c47af-06a2-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 16:06:57 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DB6PR0401MB2326.eurprd04.prod.outlook.com (2603:10a6:4:47::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 14:06:55 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 14:06:55 +0000
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
X-Inumbo-ID: e27c47af-06a2-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAYwTbiMHJt4DV48YYr0VPYbreGvT1dh1HfzyDUCUSBhmUlIhcFkyxzROzR0FMvRHxJhFgd/nrHaDRti+FV+sxvvLFP8EiT794L8ML5/4Rrk2TzSUavWmocrx0bhNE8KbwQ9rMWU42exGSMmXtGT2lJZc6mUQLy971nheiKmFgEBNKvcRkGh/0vorc1P4dpfUggKHcZlcFFdLyqsZbTO4iCFnMKP2SkvAQMuVch6OOek6QeJ6RcIPY+hyHn1h35mCKO15V+XN6d5sZ+7LUfq/bkV8ZuntdT5XAKfASKxljN8r1U1Fqa6UnjuyV8qJo2csTDCrQPB2kTDcwLEsQHzmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvAbQAL036ySrfE+yIl7Bh0rtBusa2gvaDdFAA2XEBc=;
 b=JUPyUiOhSQRJ3bTX3Vgy6nppNQY08b0yJUBBteTQcM92gZ342weznjscJPT/n8U61hDQ56hb4LLSA/YPgFuiD6pobhSp4iXaUsyLZBMYVxNK9fw2/usK8ZjFTolFh9idX20e/XV8wy5GX7Ch06LKXDP33sJtnuC54V5YFI43mE6KNfbMY2WPvicyDmS+HeUoeHdnNJKFQR2kuO9fjyZy5KX5mZApl3SOw6GgN3uRGPmiQBEFJqCa5tWVkWMrxXE0/Z6vjfD11OKjeE04FUb+Qfa+xyCLVZN4t7VvkxUNn/6ksRgkFNk2mS78MZzWYnGYdrExGIUsferFlrrLbdx/nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvAbQAL036ySrfE+yIl7Bh0rtBusa2gvaDdFAA2XEBc=;
 b=KlMSr8f/k6xba0W0zaZld9XDWB0X5uiHj5O3wXxOOjAEVTqQniJ6mm4xEdor2DieYNHb5Yoa9RLO/Okz0NXaix1rykcoziNfmgjnOsQixlf6/wcLtkVGOEDSy5DYz4LN+vAiymas7FQO9wp4T0u6Y5fP2h/1vvfxg2K0y1iTMWwYpLagMgPjbOFeEPgM0kduCQ/7DpbhhHh4WcfmEmEobtyR9SpI+6FxJWZMlOKFwCIXbl5rD62oeEkiyA56DTZxcOnTJUFhYzWSR+PwqTaVmMAhmreqADAQwyBGlkXZ8RykEzVxwyZi9u6IYftuTkbX2XHuNz5uY7LtnyNnZlgPwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <62fca8cd-1434-10ae-ae89-41b9ba3b8cdf@suse.com>
Date: Mon, 18 Jul 2022 16:06:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/2] xen: Fix latent check-endbr.sh bug with 32bit
 build environments
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>,
 Mathieu Tarral <mathieu.tarral@protonmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220715132651.1093-1-andrew.cooper3@citrix.com>
 <20220715132651.1093-3-andrew.cooper3@citrix.com>
 <dc25adc2-7e99-0394-a446-56a1e5e804e4@suse.com>
 <aa786e6a-7db5-f719-c8d4-26adba96475a@citrix.com>
 <465e44a0-2005-99bc-3fca-241b8c510df5@suse.com>
 <18a3e8ec-4a64-7401-cbaa-98b00355914a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <18a3e8ec-4a64-7401-cbaa-98b00355914a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P194CA0009.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::22) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d15aa0f-fb48-4f3b-9594-08da68c6c56a
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2326:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mje0f82D39TrdoX1V7GyEN70M/EEzrikAHZY0dFY1ZGH0ND5J63CYuiH+2WYD7ZSvj247i8D8LQthUZCHGOdwCz7IZVvnOQpedawAAAmwPubIkCICxHEY6svg9r1jmn0pnFiA5OqeYnvmfC/5zQkbV1rSe2qpLProbpL6oIM+MZ/Zoovx/cfTIcQN/cLLedSSCZffuiK4fQc8xUp6EQ/+gYfyqNXlVDyEIqojWoXWfCvAr/DplPqnW+38Mz3sAxN+sb0qQNqvkEPRMChsQuJ8mphKyCqIiDwTF7h62KKvZ4fvYVoZwqlSQ4Y3+ilk2mOnwF38uxU7G5/q1Eoohsd+XdfzRRnMJcWuuGZbWIFnuiLHI8PgmG09NazIHxz/X3sHNuamQKrXonp6H6fyi3J01Vlr5H53KwbCNVqptAnF9hH3f3gxbfAiLWqipgzH76OnF86rzuKwq0xQsHxBeagQtQe6aXljV2qcBVH97HlUfDMW2cEyNsiMBzVwSA69UXysciGg1/yKwtDIbR5yGe5ebKV7yLU9d/o3CTfRhHmtwZAfcqKwY32nUw55JbZFdcp1y/LBzpabIY5M6z2f13GsXBJXs0W7lsHJkfLdGpST6L8xjZKRm13Mue1pgLzxdp2xb04G+d3lbfGwqxRj6Sirh7+0LVxYq9pKOvXecGWHEVyst4ZCSYkoB7OSC3lP9eBq1GYKgjfhO65txo7U/oxGfREVzxGWUbKHBZIqgj2y2iAvsl1297CpyzOeuET21yTwqE8YbDj75ipqR6SUuJlSnesb2U6qFe3TpY63iO6Wxvj3zRJsulZ9h80Qa5EQjzNOA0lM7hw1ok0ZkGEXC0iwApNYVCLCgxIYltuMeVAdq1D0PbMi9rNV1ylRUiY5mad
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(346002)(366004)(39860400002)(376002)(8936002)(5660300002)(7416002)(66946007)(66476007)(66556008)(8676002)(2906002)(4326008)(38100700002)(31686004)(86362001)(41300700001)(26005)(53546011)(6512007)(6506007)(478600001)(36756003)(31696002)(54906003)(6916009)(316002)(6486002)(2616005)(83380400001)(186003)(4290200001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzhlQW9qRTZWVUNBM25PK1NsS0VHQ04vMDdrUnRMbDJGejlvTnR0bFREZGF1?=
 =?utf-8?B?RHhMS3BhSERVOTQzYVJRN2xBWnJkYVN3bVdrWVFYUmpVSnlXazhjZHRPK05q?=
 =?utf-8?B?NFhpWlNlSGdNaTg2ZG1xbzIydjRxT3NENEZ1OXVMcFhqSE4xWnNsL0ZvVmJp?=
 =?utf-8?B?NWlEeUtQVVdGMUVDYURLTEZXNDAvc09CQ0p0Q0NEM1dEcVQ5ZFlNN09kaTNH?=
 =?utf-8?B?d3BodjhEMGxIdGg5dStyQnhqcCtheXNrdElYb01scTRxU1UyZFNjR05mT2cr?=
 =?utf-8?B?bDFGYlhkbGl5bjFDZkVWQ3BXemxlSVZ4dGd6R1dBRFNrOEJXOTJOK3JlYnJO?=
 =?utf-8?B?SXNZWERBNmtvZC91R05ybVRFKzRuRGc2Zkh5MlMxbVg0aWloeVlNMXJYRmpE?=
 =?utf-8?B?cXFKNzRYS3gyZUdXLzVHbXJmRHA5Z2dsOS9vOVltV0NtMzUvamFoVHdySjFG?=
 =?utf-8?B?L09GWTYrY25jWVg2ZkxFYzgxY1U4MExyWE5sM0FtSW9TOE01U1BicDZMMGpP?=
 =?utf-8?B?Q1U4L0k4ZXhqeTB5Q2RUTFRZMzUyaUh2UnZuWG9NS1JZYmRuYzJLUWVwNXgz?=
 =?utf-8?B?b2JTSkQycGtRZUMrTGpBVHBXZmtmWGl5NktLUVpDR0xOMHRrdlFUcDdrekhD?=
 =?utf-8?B?YXNYckprSXlTYittTXdEOEhBcVpoUDFoRitSNVVhTXgzUElrNm0vdFloL3Fa?=
 =?utf-8?B?T3FaSzVpOE0vTUJOaFBBVTRFMDB2ZXh3eG4yWncvdzFCNEh2dEozZ3BMaHJ2?=
 =?utf-8?B?RUlmVEJLU2Q4TTdWaS9yNURHR2lvdjN1N1VpUWIxYnVkQ005Vm91R2YrQ0tB?=
 =?utf-8?B?c0gzNGE4N0FwdDlianQ4RHI3dEM1cTdpSDhSNDNacGVVWmYwY1kzcGhSaHI1?=
 =?utf-8?B?eDJZWUhLdFZ0UVczSHNZSWhRVXRsMmZGalBRUElHZFNsU3RkZmRqTzduUGVp?=
 =?utf-8?B?cGRySkcwT2xpVVk1dEdibytsNGNNeklCTE9MT2p6Q2JhUWtQUUJBWit2TDly?=
 =?utf-8?B?K00vVEVxWXdIZkt5dVEvWHZkejhmei9iZzhkcmZBQkpCS0hDaGhwUDdzMklT?=
 =?utf-8?B?UGVOYndmS3QzRDQ1WTRLKzc5bXhpc0xkd2xmWGxzTzV0SE9RQkhjL0lNa01W?=
 =?utf-8?B?LzZsRU1LL3NiQTFPOG9TRWJFWnVRVHd0aEVYeGF1UkVkY0J6QitwbENrUHgz?=
 =?utf-8?B?OG1QSGtrSHN3SWE3VEM0ZXBIVlhjbk01d3pteHVQKy9NS25HQ1NVcU5RcHVl?=
 =?utf-8?B?czAzM1VYVWNlYmhXMTEwRTFlK2tLYWpzandMejJBYzJiN3hRQlFZT3FDRFpk?=
 =?utf-8?B?R1ZIeXdyaU9TRDFFVmRYWTh1MHE0Qk02dHZrZXFITFJKeERHK3Q4VWYram1U?=
 =?utf-8?B?ZHJUV2dYYks1WnVqbEhDejJreUROTVBzN1R5Mk1zRE1FZDh2WWU5aStuc2pJ?=
 =?utf-8?B?K2VFQVJPOWdKaG9PVWFlZVprQTZibmI3WTNjczdabVU1SDdvKy9Wek5OR3ov?=
 =?utf-8?B?NXB5YzQ3NjZkVTA2R3NnUWpDVjJlcG5qSEJzdlNjbmxYd2NnU1FxV1c4Nkgw?=
 =?utf-8?B?UzlHQXR1MFpaSGdYSVhQdjJrVDRBejdZdjcxc1ZEeTdabW1zUnVpVUFKV1ha?=
 =?utf-8?B?NjU2MGtnZU5DcHkyd1NZMG5iWkNFRlZ2Zm1Vd1VXdVJIM21reFR5NkkxSXBZ?=
 =?utf-8?B?Tmt6WU9kOHV1MmVWVGpvNEkvM21SSFBJcVFzeTdGdkNHK25uY2hBK3FJQ213?=
 =?utf-8?B?bGlYbmVBbkJpck55TXNpZE9ocG1lU0N3eDcxa2h0a0cyV2ZGNHkwZ2VRc3NX?=
 =?utf-8?B?SVE3TWZMTVpPVkl6S1VHbUZScUVBTDhkNU9CTGJvaGEyd2NkcklOMG9DQmFz?=
 =?utf-8?B?MWE0RUoxa3Y3R0tuam5SQ0gyd1hQZVEybktSUm1EbEFlOC9sVloxTXVHS0Zy?=
 =?utf-8?B?NUVndmFTZ0VKRHJmdFhWZ2VIRk1iN3lMRSswOVpoZDRxNUoxZmFjVlh1Mzh2?=
 =?utf-8?B?Vitpa2EvWHRkRVhyK1lseGk4ODRPQ2I3cnpyT2Q5emZiaktYdlZoblpaemV5?=
 =?utf-8?B?YmRQVHhLVUJvdDVIUExmNnR4RHVKbUZ1Y0JjdHJpd3h3RGxFZC9Uc0Y0VlRm?=
 =?utf-8?Q?v6MEbVteO5BSg+RxfIASqkTx2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d15aa0f-fb48-4f3b-9594-08da68c6c56a
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 14:06:55.2662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RK3gjZj+Bst+F868TKW/GlJxu391GPHVj+aAkWAIB3cnkBhw0EptPVS6Y34X6q43aZDk64n0IDAoFv2vcHlqEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2326

On 18.07.2022 14:07, Andrew Cooper wrote:
> On 18/07/2022 10:49, Jan Beulich wrote:
>> On 18.07.2022 11:31, Andrew Cooper wrote:
>>> On 18/07/2022 10:11, Jan Beulich wrote:
>>>> On 15.07.2022 15:26, Andrew Cooper wrote:
>>>>> --- a/xen/tools/check-endbr.sh
>>>>> +++ b/xen/tools/check-endbr.sh
>>>>> @@ -61,19 +61,36 @@ ${OBJDUMP} -j .text $1 -d -w | grep '	endbr64 *$' | cut -f 1 -d ':' > $VALID &
>>>>>  #    the lower bits, rounding integers to the nearest 4k.
>>>>>  #
>>>>>  #    Instead, use the fact that Xen's .text is within a 1G aligned region, and
>>>>> -#    split the VMA in half so AWK's numeric addition is only working on 32 bit
>>>>> -#    numbers, which don't lose precision.
>>>>> +#    split the VMA so AWK's numeric addition is only working on <32 bit
>>>>> +#    numbers, which don't lose precision.  (See point 5)
>>>>>  #
>>>>>  # 4) MAWK doesn't support plain hex constants (an optional part of the POSIX
>>>>>  #    spec), and GAWK and MAWK can't agree on how to work with hex constants in
>>>>>  #    a string.  Use the shell to convert $vma_lo to decimal before passing to
>>>>>  #    AWK.
>>>>>  #
>>>>> +# 5) Point 4 isn't fully portable.  POSIX only requires that $((0xN)) be
>>>>> +#    evaluated as long, which in 32bit shells turns negative if bit 31 of the
>>>>> +#    VMA is set.  AWK then interprets this negative number as a double before
>>>>> +#    adding the offsets from the binary grep.
>>>>> +#
>>>>> +#    Instead of doing an 8/8 split with vma_hi/lo, do a 9/7 split.
>>>>> +#
>>>>> +#    The consequence of this is that for all offsets, $vma_lo + offset needs
>>>>> +#    to be less that 256M (i.e. 7 nibbles) so as to be successfully recombined
>>>>> +#    with the 9 nibbles of $vma_hi.  This is fine; .text is at the start of a
>>>>> +#    1G aligned region, and Xen is far far smaller than 256M, but leave safety
>>>>> +#    check nevertheless.
>>>>> +#
>>>>>  eval $(${OBJDUMP} -j .text $1 -h |
>>>>> -    $AWK '$2 == ".text" {printf "vma_hi=%s\nvma_lo=%s\n", substr($4, 1, 8), substr($4, 9, 16)}')
>>>>> +    $AWK '$2 == ".text" {printf "vma_hi=%s\nvma_lo=%s\n", substr($4, 1, 9), substr($4, 10, 16)}')
>>>>>  
>>>>>  ${OBJCOPY} -j .text $1 -O binary $TEXT_BIN
>>>>>  
>>>>> +bin_sz=$(stat -c '%s' $TEXT_BIN)
>>>>> +[ "$bin_sz" -ge $(((1 << 28) - $vma_lo)) ] &&
>>>>> +    { echo "$MSG_PFX Error: .text offsets can exceed 256M" >&2; exit 1; }
>>>> ... s/can/cannot/ ?
>>> Why?  "Can" is correct here.  If the offsets can't exceed 256M, then
>>> everything is good.
>> Hmm, the wording then indeed is ambiguous.
> 
> I see your point.  In this case it's meant as "are able to", but this is
> still clearer than using "can't" because at least the text matches the
> check which triggered it.
> 
>>  I read "can" as "are allowed
>> to", when we mean "aren't allowed to". Maybe ".text is 256M or more in
>> size"? If you mention "offsets", then I think the check should be based
>> on actually observing an offset which is too large (which .text size
>> alone doesn't guarantee will happen).
> 
> It's not just .text on its own because the VMA of offset by 2M, hence
> the subtraction of $vma_lo in the main calculation.
> 
> There's no point searching for offsets.  There will be one near the end,
> so all searching for an offset would do is complicate the critical loop.
> 
> How about ".text offsets must not exceed 256M" ?
> 
> That should be unambiguous.

Yes, that reads fine. Thanks.

Jan

