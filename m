Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8170B7CA564
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 12:31:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617437.959998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsKsd-0007XU-0x; Mon, 16 Oct 2023 10:31:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617437.959998; Mon, 16 Oct 2023 10:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsKsc-0007V6-Tp; Mon, 16 Oct 2023 10:31:22 +0000
Received: by outflank-mailman (input) for mailman id 617437;
 Mon, 16 Oct 2023 10:31:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsKsa-0007V0-No
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 10:31:20 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe12::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24e79c4e-6c0f-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 12:31:19 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8533.eurprd04.prod.outlook.com (2603:10a6:10:2d4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Mon, 16 Oct
 2023 10:31:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 10:31:17 +0000
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
X-Inumbo-ID: 24e79c4e-6c0f-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FL/QUoYMQX4npJs8LwS3qCC97MnB6Mh5IBkZzmy43GzOKnzy+WNHCpS89WJ15cCrYh1FkGyIaWR6YVE1Lpn+Vk7xya7t81L1Je4uU1gLCaNJrAwPl8kNFNpWFsQOlvV3ZVRqsKYvqAyZfd+b5Q6L9FLyYo6Z3S8G76hlmgUxZ6CJ4NCLd5PjWADAkZxD/UreIqGQdp/rc1eyVb5ofQmmy82v6Cj/bQOA2gs8+eprJcD6o7rpEhdxvL6f6PQ161yXDc/77JP2+lizmM20+P9IdDPGG/KiaKafW1NBQFen/a3Xnu9/zOjbxEf0HMZ4VqEkreh2zQvRAux7vrPeXe5O1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xL7NgskNlhPvjFU53Y4pH7PuxroT1j8KRsy7yCVCFs=;
 b=NWA7rwfbr0vTNpUBkNufLWxDf/Sq3oO5GIrj+r1WPp+C3KYj9hVpsosQTMitalDTPR8+bX5Woa7dP/7v0IzZns5FULAlHDPQbQL02mCuD8A8JBVmUUevQs+o3OlARBadv58VhAv1UxwnvR0RP9S6mN4kBdsPIydezU2RiOyTXwjzJ7feZ0fkGyhg3x6c7Hj330QaK3uaSGY2Iglv//DouDpjNXCv+6xU8fd7iWOQFlXYX6rWZ6I5i+aQ3OrpPfIV6t72nbI+SVICEN79HzJMdWHRsf4EC9mS1jNVv6fr5FLaRzC8UtuuczfWS2MVcDv7p/RnRhm17eYAsljD9h/igA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xL7NgskNlhPvjFU53Y4pH7PuxroT1j8KRsy7yCVCFs=;
 b=WrAjm9XEjPmEQY2LiqFfgTDVoh6hKDWxQlq03W80n2kmpoAcA+fFzdp4GOmTTNlUlgsqjagNV2/SmTzOG7UhgDFWv/lbzjrrD6tH2+Z//6sY61uJaEYPKN0ioSlcG7vQ+EYM2NlIeu8kUosEGIhafM5IgeI+ce3B02wGvEfgEdkmb28xEhVafVJzxwc/RW1StoM3NifwGrSGUSunxVow9aB+LSVe5duYVBaFcHMWvuxBCb/wwJDi29O0kaabs7cMQ6HKOpNhBtCUbzaXI1RyXJs20g658xV35fHeXyQoZ4tyXjGpBNrPEjp42I+ia18kUROj8HoaYQ1unlNFw2oYQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b9547bf1-2882-e470-b272-9a4a31a1ffce@suse.com>
Date: Mon, 16 Oct 2023 12:31:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH] xen/types: address Rule 10.1 for macro BITS_TO_LONGS
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <b3aaaf5265c7e7ce6228ba2146f57aaae09f55e6.1693899008.git.nicola.vetrini@bugseng.com>
 <6495ba58bda01eae1f4baa46096424eb@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6495ba58bda01eae1f4baa46096424eb@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8533:EE_
X-MS-Office365-Filtering-Correlation-Id: 6481ef51-37c0-4308-1c5e-08dbce3307bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gxt2gMzFrcOwV/cvAEXQaXTLBGxsOs1n2ivucUHqxp3x0h/G4u9VtBATMV8e8Arkhi3WkV2ThmcbK9CLgVwNfpayGjcJJ95F36eHTenfGPlv7sgTdBvrqpTfsCDuIte+QMPAa8o+IJHSzXjIlKBycJl4IKE/cy8QXzh6uxjrdT0owo0u7su9L7/ByPmu1FJhinqMC0BZ0O100zrMV4KgR0vxA7nNwM+QhxxBTyYKEQdMcTgToWf8pxtWZZ80axftYkK7IWpSf7yVeQ20kmjBwh17icDka2admDvZ0dux0cynULHvbBBpjsvlH2aSGHIet1h8As0sCAT1vOntiPhJYaEUmnL3b6/aBQ3Lq3Dbvgyy3bNkC2hqwD7bLMNRbPlP4suXF/NdfiM5pZkvWtHOkFQpyaa7O6Z84YSFIXry/yqhTPzxn8lSNbU1aTXzBhVfb6tuz63v26CaYN7irFO0aXu3rWz7+YR7e34qzDcNBcF7RfiWRcbTd2qMGQ04rtVB0o2dP9jw6lC30JLx7ZG16TNiY4Z0kYNAMmGGkU3nIuTBSnsEZg3M7qfzQ7M0q1moPCXhLD6tsH82sQSp8sGtA28LDnvbxIHRkw8Ry9btGAG3ZSBWj2UJDVhcTBvcBNiMVLEM50yveETB7o8D7Cf9Ww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39850400004)(136003)(396003)(346002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(5660300002)(7416002)(478600001)(2906002)(6486002)(31696002)(41300700001)(4326008)(8676002)(8936002)(66476007)(6916009)(66946007)(54906003)(66556008)(83380400001)(36756003)(316002)(6506007)(2616005)(26005)(31686004)(6512007)(53546011)(38100700002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXRZZm10OVdNRDlSbTRBVDhkUUExMW90Q0NNSisvWjdNVmJ1NDFyZzdIN1Uz?=
 =?utf-8?B?RzlOZnBKL04rRU9ub3lFSUgycnoxSS8yVGtlZU1kRzdNR0IrZnVYZVVUOFFD?=
 =?utf-8?B?ZWt5SllIWUxZUGtZNnRUTk9MVTJqKzZwb3VVc20yU0RsM09WWEU1RmJSZWQr?=
 =?utf-8?B?SWViMmNreGowZVhKY0JVTGl2WUJ2amFuQlFQNUJiSmcyNitySGVuSFY0RERV?=
 =?utf-8?B?TnVsSGdNR1QxbWlSbWJIOU9WZ0JKeElMNzRiMmovUWdUVmNGR1QrUXRwblFQ?=
 =?utf-8?B?ajhSQytGdWVnSjBob3NZblFsVzVyZmZMN2ZLWUp2bU12K0JZMksyTVFST0pQ?=
 =?utf-8?B?UCtlcmxTa2tLbUZQQU5oY3ZGdE43OGhITFdQMWtVaEhRWkRqNHdKZDhnckRv?=
 =?utf-8?B?cGxhVnRLdDBZdTlTVW9LNzlLMWQxK1AwVi9zVzFWZU83TmQ5THR5TEtRK0FR?=
 =?utf-8?B?b2dxUlUyTllINlhrTEQ0dkhmYUlETWRJSkJCajg5STQ0RGRvU0JqTnQwbHRl?=
 =?utf-8?B?Nld5cFhHUTRGaDVPck53eXJZd0N3LzZvL3Bna3QrWWxjV0d2aTMvM1J0WDBC?=
 =?utf-8?B?MU5ndmFuL2pLVWlxKytSV3JNb3dRU1JNRTkxTFhyVzlSQVdzTndJRVFIdmlR?=
 =?utf-8?B?bmF1T2Fsd3RGTG5wY3UvRU4xR1pBby9ITDA5VmQ2UTQ2K3lpbCsydDA0SC84?=
 =?utf-8?B?Q3U0dlhUQ2tHUUxpZjBqcG51ZFVUTTdWTzN6WWZicER0SzhHWGJIT2c1SHo4?=
 =?utf-8?B?WlJERmE1VWVEdWxiNlI5ZVVaZExkeXZtUDMzZDdjY28xazBqRWE1c21CS1Nt?=
 =?utf-8?B?OXNXUi9ucCsxS2FiQi9GWm53aTVQNGQyOGxmcVpSTHF4Qy9FclJydWJSR3Rz?=
 =?utf-8?B?a3RQNVR0TmJueC8wSDByT0twcnBHMUQwcHR2RU1zQXBVc0k5T0FIczVzd0hw?=
 =?utf-8?B?aFh1bTZ2OE85TVlsS0NJK2UwRUs3RXdkTmlLRVIxdmZxdHd3d1dKUlo0V3k0?=
 =?utf-8?B?MkN5bGJtZ3BIdExlTUptdmRvMUJ2ZFpJYkQ5aGhHZUVmSVZzVkNXQkx4dDkx?=
 =?utf-8?B?TDBvZWNpUlJKUDFBcmd2bStUMHkvSTUyVktHK0J2cVhpTHJSdlJBbVJsSDJn?=
 =?utf-8?B?Nnh1R0EzenQ4OGs3Y0Y0dU8xR3lFcTNOV2dCWlJiR0l3QW9DQkdIYkpZVFAz?=
 =?utf-8?B?N0VwU2djLzM5Ri9xK2gzVkxpSTNNemx1cnZVamgvMXZiV29sZVZuaTc0dnh0?=
 =?utf-8?B?WHV4M0ZwTUZvMlBsbTdCVm9EcTdYOWUwQS8rMHFQbUJOcVNCMzRPdzM1S25R?=
 =?utf-8?B?RnJhQ3Q4eVROMklxZE5peXluNjNMN0doZ21FSE9jNC9tZ1JFYm81SUtSV1pR?=
 =?utf-8?B?cUZNSUNpK3poMTVvZHp0RVQvaDg2NEhSWnVrT010T1YwLzNFeG5yMDkxQXZq?=
 =?utf-8?B?cGxTS3FCcFVnamdib2RoZjlMb1kwUEg4Yk9WUkRVT3pWNEY0QWxSeWZtczlK?=
 =?utf-8?B?eUdUWFRqT3gvWmtveExnbHk3WWJKa2tqbVpNQUloZ0YvdlhFRmdxZUhwZk0w?=
 =?utf-8?B?eHdWcE9nc0dzc0ozeUlpdmpQSy9ESmlrMGhjTXNUSGxLTyttUHhlbCtDSXBp?=
 =?utf-8?B?Vy9xQ1A1SkdnN2hDTmp3SWtKSFVWRFlWclJaaUZkKytFcmJ5YU5kMTUxUGNQ?=
 =?utf-8?B?VU1LRGxIT0ExWlZzcWlyWmZ4K3U5Q1kxaElEU3JYTlhCUm5kVnk4VzBqOHFv?=
 =?utf-8?B?dXNoSWE3ckNLSGpzT3BYTVh4K1k5dC9oYmlHR3RIaGNkb1RTNTkxcVlTMUt4?=
 =?utf-8?B?cjVGU2hqb3VHTHhKUUxZWmtDSU9qU21BeG5iV0FVUGQxSG1hSGxzMG1tNlAw?=
 =?utf-8?B?aERBbnNUVGUyWGdxT2MyeHVtd3ZCUkI4d2Z1LzJ6RmFrTkN2d3d1UU9qKzkr?=
 =?utf-8?B?S0taUUFvWVhhYlFMSkVxYXdVTWFIMGY3L25LYjlDelFGbmp6NnYxbm1DbWdz?=
 =?utf-8?B?enJnRjJ1dUpwcFcra25BbUJmVU81aGV3L3ZRaWptMmdaeW5CKzhSUVNnUFl2?=
 =?utf-8?B?SU5YS0JTZFJsVzd3NUUxaEIvaURleUxtUko2Ry9NM2p6SWVOQVE5c212MEdQ?=
 =?utf-8?Q?59UpZbVZbVvPtRqymkyKacxmr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6481ef51-37c0-4308-1c5e-08dbce3307bc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 10:31:17.2475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 26lS+R+eSb7UijniK9pcZPItDZjQYZZUuYtajV6jHj538GnGkq/QelemAJYqvEGBGuCZfQtLC4ppDLqLmR+BYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8533

On 04.10.2023 15:23, Nicola Vetrini wrote:
> On 05/09/2023 09:31, Nicola Vetrini wrote:
>> Given its use in the declaration
>> 'DECLARE_BITMAP(features, IOMMU_FEAT_count)' the argument
>> 'bits' has essential type 'enum iommu_feature', which is not
>> allowed by the Rule as an operand to the addition operator.
>> Given that its value can be represented by a signed integer,
>> the explicit cast resolves the violation.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>  xen/include/xen/types.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
>> index aea259db1ef2..2ff8f243908d 100644
>> --- a/xen/include/xen/types.h
>> +++ b/xen/include/xen/types.h
>> @@ -23,7 +23,7 @@ typedef signed long ssize_t;
>>  typedef __PTRDIFF_TYPE__ ptrdiff_t;
>>
>>  #define BITS_TO_LONGS(bits) \
>> -    (((bits)+BITS_PER_LONG-1)/BITS_PER_LONG)
>> +    (((int)(bits)+BITS_PER_LONG-1)/BITS_PER_LONG)
>>  #define DECLARE_BITMAP(name,bits) \
>>      unsigned long name[BITS_TO_LONGS(bits)]
> 
> Revisiting this thread after a while: I did some digging and changing 
> the essential type of
> BITS_TO_LONGS to unsigned
> 
> #define BYTES_PER_LONG (_AC(1, U) << LONG_BYTEORDER)
> #define BITS_PER_LONG (BYTES_PER_LONG << 3)
> [...]
> #define BITS_TO_LONGS(bits) \
>      (((bits) + BITS_PER_LONG - 1U) / BITS_PER_LONG)
> #define DECLARE_BITMAP(name,bits) \
>      unsigned long name[BITS_TO_LONGS(bits)]
> 
> leads to a whole lot of issues due to the extensive usage of these 
> macros
> (BITS_TO_LONGS, BITS_PER_LONG) in comparisons with e.g. the macros 
> min/max.
> The comments made in this series to the patch do have value (e.g. 
> BITS_TO_LONGS should be
> expected to have only a positive argument), but ultimately the changes 
> required in order to
> do this and respect all other constraints (either in the form of MISRA 
> rules or gcc warnings)
> is far too broad to be tackled by a single patch.
> 
> Notable examples of such consequences:
> 
> There is a build error due to -Werror because of a pointer comparison at 
> line 469 of common/numa.c:
> i = min(PADDR_BITS, BITS_PER_LONG - 1);
> where
> #define PADDR_BITS              52
> 
> if x86's PADDR_BITS becomes unsigned, then other issues arise, such as:
> 
> xenheap_bits = min(flsl(mfn + 1) - 1 + PAGE_SHIFT, PADDR_BITS);
> 
> here the type of flsl is int, so either flsl should become unsigned too, 
> or the second
> argument should be suitably modified.

If PADDR_BITS was to gain a U suffix, I expect PAGE_SHIFT ought to as
well. Which would address the compiler complaint, but of course would
then still leave the left hand expression not aligned with Misra's
essential type system.

> In the end, the modification that solves a lot of violations (due to 
> this being inside an header, though it's a single place to be modified) 
> is this:
> 
> DECLARE_BITMAP(features, (int)IOMMU_FEAT_count)
> 
> If, as it has been argued, BITS_TO_LONGS really needs to become 
> unsigned, then a more general
> rethinking of the types involved needs to happen.

Well, yes, just that we'll need to find ways to make the changes gradually,
not all in one go. Even if not admitted to originally, I think it was
pretty clear that the Misra effort would lead to such.

Jan

