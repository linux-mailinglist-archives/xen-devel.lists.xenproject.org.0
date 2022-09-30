Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C66F5F0960
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 12:57:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414126.658237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeDhv-0000wK-P4; Fri, 30 Sep 2022 10:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414126.658237; Fri, 30 Sep 2022 10:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeDhv-0000tY-Ln; Fri, 30 Sep 2022 10:57:27 +0000
Received: by outflank-mailman (input) for mailman id 414126;
 Fri, 30 Sep 2022 10:57:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bHGM=2B=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oeDhu-0000tQ-2s
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 10:57:26 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140084.outbound.protection.outlook.com [40.107.14.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa5950b4-40ae-11ed-964a-05401a9f4f97;
 Fri, 30 Sep 2022 12:57:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8775.eurprd04.prod.outlook.com (2603:10a6:10:2e2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 10:43:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 10:43:07 +0000
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
X-Inumbo-ID: aa5950b4-40ae-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbxmmxnJ89KUNEbarObmRdogoCx9pVe+cx+FvvvCTAvtSPw5JUzBtY5C6HvgmOr71StJ8d+ODK7BjKSDfEPWqQ9kBmDACPsJiqw6tvElQB9scYqX0OvdYCF/f2Mj6tiswMyQhDqQzxULevaCraWc0LXu//u32FZ8nF75WWosFmJfaO3V+MiY5PcgDUcg77qfg+5wO2GjNXYR1SOCk9RSNXjcW49r5jWWeiblmFb+pKPeXZlwTTMoC96w56axbvRlMxiZY8e+SHq1h6dDBluZDFeOopDt4TotudnSYdXHQ3J7bM8eh2nJx52VeFXV48n7PmsRv7OYwCEcSXcZVr847Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvSjxosn18P1pUVmH32IK52tnSDDCwqm+h+Rhh6OsdE=;
 b=XRCZr6yTnIUYeFa9jWbxbIUM2fQvaE3+aPRWnWZeln2AUdSV3Tmr4Gq+ba0QDhhm6XiEfxWNSAc2Srv1CBPXhHa4KFYYVwKog36qHJNneK3qgkh9WplsIAjG6wLxqzdBcvtCeh+n97vtHR9qUS7aVKLF0+K/pZpaE7tgRjGy5/1inEZIeBDJFeZnqrXp4Go9NnBGWuuXEm17eowXTQ+sUhxn7egntFkqtmbqxJGPzGtkdkwv2L9R1AeM898eoeHT3dKRx1ZmO0R5uaymGEX/B4ekGToFmxWI4CyLeOXi0Uc2sJcBDvjU3t7n5J92xBVwBU11tra9baSY5POA6EC4Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvSjxosn18P1pUVmH32IK52tnSDDCwqm+h+Rhh6OsdE=;
 b=YJ0jLuC689IG4KVCTCtvrM4Eq0GMOqwkZ2hDbWLMPCV0SYSfwhjXdY7A2SK5BLc+n+R7cHzOy2QZsGzH5/CBsskSIHwXqI33k36/+MdNaCF4Apk37T6VWiFyEg8yqXqs5NgvYUUfC/skDs8i9RhE//TQGiS58ZPFdQl/bxNpolM2a/xQi+Bb7QJhps2eZEavnKHcq/LkIAVP9HqO+/q6QJUMXTyqVV+LQhK2FA0/1zGlIPntYFfsFfCLbDdUbzLuOhSXk3xno8cZnoyqcBY+PU6l869dEWrmlVfMKsyqE1JKU5J/z0fYd6GqVp5Bl7c8nc2Sr8PnKJNbxvdWJKCidA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cd7b7622-273e-5662-8dc4-826ff9c4c331@suse.com>
Date: Fri, 30 Sep 2022 12:43:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [xen-unstable-smoke test] 173362: regressions - FAIL
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Andrew Cooper <amc96@srcf.net>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>
References: <osstest-173362-mainreport@xen.org>
 <200b2ad7-8cf9-4ca5-cb54-6e72ced7d7d9@srcf.net>
 <b3242791-3d30-ce72-010c-c31db05b175e@suse.com>
 <YzbDWSAiRBhnqKOF@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YzbDWSAiRBhnqKOF@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0390.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::35) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8775:EE_
X-MS-Office365-Filtering-Correlation-Id: 957188f1-26d5-4b07-88bd-08daa2d08f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tcbdhvV9JyuVTNEitjnVKDiiKg9c9yryOvKu/yGgPpU0ll8uCIqMw0BDZl0lUsa7ZmWMtj2vcVFDaoTX3NQHI4hGq/Xy79ZHUaBsBT5rFKOI6Ch9tQPeUWPciVtQtd9W05YSNL24ORp37mlOdzd6x6BpoCm1Ue6Vbal6wI6xFbC/+uMCHVOiqhj4o8Zg/sQ8WRwupcLy492hGrs+zxEF025obFZKgtMsfNYLjcuc3MZNdr3kL5mX8Q6WfrM/Cnm2I5ixDrXOaqPmvlU2a6c7eg5EUnUcAn06rePktzFLMVR+7ieNjqmCN+2dCnz83L7z9xVL32XFTwJvGiByKCh2GCCl7KQtOhY/fc+i71j+tm8USR845mFPbws7zgBcTBMr4mPlmCO+5tlJaA9qmBRc8okWmfc6fEEOz+qwOJexAC+6DDEmqgMLVKjsoPFyhmfNv3f3wd3XT6jIJ0vTYOe2U+GP+9pULdsvoB+z7u0F87C/vUFmDbviFRUh6iWakkiOI1JhfjwwwGqrLtzE9WTBzI7whhVde1dVjQ9A+KX6EM7/F6WtTyJQu3qzUXVckVvjcMdgUn9/e76RgEOe+ECWMcQF0RMnwmwf+KZE09xZW56+zDg2zK/r5DM7zdFqPjmcKUTFESeM8UcC6SGLynVr5Yg3rOnDOLLr+nnz4PykxCYaSdiPSgq6iaaAM5PrFwSAvJiq/ASO+zWIHO2sIQVvIHtpBDqXqvLRApVtQHt/vuprb53iiYjIblHpXHMghdd2dXCK5jc5o5fpWra178pcjBK6VHAgayzk8UAHvSUXdJs29vxngklBxZvKnw8FoXPH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199015)(478600001)(6512007)(26005)(6506007)(2616005)(83380400001)(186003)(5660300002)(2906002)(7416002)(54906003)(41300700001)(110136005)(316002)(966005)(6486002)(8936002)(4326008)(66946007)(8676002)(53546011)(66476007)(66556008)(31686004)(31696002)(36756003)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzBPT1FzblZRQkdIbkRldWFScGJzTGY4WWlWQjZJbi9lR1U0ZnVXY0N5N3l4?=
 =?utf-8?B?cThqcy9JQkYwYUZFMXUrSHdhRC9xekR3QXVrZFFxSGViZlk1bWJUKzk2d0Y4?=
 =?utf-8?B?SjZxdDgyZlNYbkhiajdld3FKdU9JWndnYVErakxXWVhOemdyTHdvRk5SRDlE?=
 =?utf-8?B?L2dTSnFLUmNGYTJIZEk2YkQ5YjlDR3BnY0xWY1BjZ01Ia2JIRnhSOW9sck1O?=
 =?utf-8?B?bnU2ZExEdThTNjJ2ZG14SkFJeVdIVFJjN1Y4ZTJ4QjVwWXpnQVJzMW94ckNH?=
 =?utf-8?B?ZUdNNEhzWitHSnN6bTAzTTBDcXl6Nm5ZdGM2ekR2TGxrdm92UGxiWkFzWkdS?=
 =?utf-8?B?eFp6ajFRZXU3Nng3VHZGWFRxTENhSWMvNXEzOWxlT0JobTYySmJTNVZCcTlQ?=
 =?utf-8?B?LzhpOTE5ZHVBd3lFRS81djNNK0FuS3NQaFVMMmVkcVhoSTh3M1lSUG9TZkJ2?=
 =?utf-8?B?TmxRdnRGdEIrR3FBVHR6cStkd2dwaTVFSXRSUEpFdGNFenpZc1J1Lzkxc3ds?=
 =?utf-8?B?WkRrL281YWlwWnp6MFNtUktqZFFvQUx3QmQvNlB3Zk82Y3FiUzlYK0UwTmsz?=
 =?utf-8?B?Vk5Gc1NZNFVoc3E3RXp1cFFWeVRXZEw2ZHVobjBYQ05Cd3RpbEdNTmpMR3dK?=
 =?utf-8?B?YjFIcUtnQUl0RTB0dkkxa2lxWXUvbVErV1VEVjJ2S3hZeVYways4WHZKZS9s?=
 =?utf-8?B?a1FkZmRLcXhBSjFLR0Z0TkgycjZmOURIdE1UblFKWENmVWptWTU0R3Z1ZmJ5?=
 =?utf-8?B?Mkx3a3VUV2pZUFd5L2lVbkM3d3ZsbkhmTEJZTGdSMStNMWJ2MmcwWnNGeVBR?=
 =?utf-8?B?Z1RHYkpTTWpIK2F6ZHIwVWRSRGc3Z3kwS3RmUi92QkNZN1pCUXMvVGNRaEJu?=
 =?utf-8?B?NzZYY2hnbXVGNTVwcWFXb2lLR3JlVm1Ga2FpYjdGVnF6eExNbkZ0aUc2dE5h?=
 =?utf-8?B?dUkvL0hEM3hMa2xSTDNOYlYwYXB3cHNjbnlhRGQ5cWlYNGJCeFRreUNvcGRz?=
 =?utf-8?B?WnBQZyttTFNmU2lJUExQYnZBaVdpYVhIeTlNOS9OVkF4U3NuRzhvRDljUzlH?=
 =?utf-8?B?ZUlYS0JKSjk0RzZMeTJCVk9yb1hvcTlieE8yVXM5bnNWNFJZL3F3WnRRWEx4?=
 =?utf-8?B?amw1YXhEYnhsMWJmeGxDeGdzcDNBc1RocWpFNjZYbXlUUlUvOENTa3BnM3I2?=
 =?utf-8?B?MnJpTVlFMjg3YVl0REtrMnRPNmQxYis3anRmV3NsT0ZZS2dsQ3h0dGp1Nkk1?=
 =?utf-8?B?TWNlVW9jK2tjTkxXSGpDYlJiWCt1S3RCUnFoRDBjZUZZdTZ2OVYxU2VqalpN?=
 =?utf-8?B?d0JKYm51cGFXSHBpVHpFVzJjTlVPbFdsN2dQcHFrdldkd2pyWC91VlZqMmZt?=
 =?utf-8?B?RHlZS01SSmU0ZjhMWW1PbE9FcU1TRnVUcm8rbXZDRzJHaUxubWVmTTZSbE1V?=
 =?utf-8?B?eXRoZXlCTWt3RWc0L0NOZ2w2azl3SkF3Ty9Gd3U2UXI0TlRoMFNzS1Mxd09p?=
 =?utf-8?B?dUhiVWF4VFZySzJNRmtQS0tydlY0SWh3QmpqcmRicmo3bDFuWnlOMEZhbmJi?=
 =?utf-8?B?NWN6MnZlaUR1WHY3RE9IM1A1eUgzanJiUXp3V01vTlRqZWxUNlJ3QTNvS3Ni?=
 =?utf-8?B?OHJReEswVHViOERodlFleVdqVVNGeUROY1AwWmMva2JvUUFLMkFzTUdoQWEw?=
 =?utf-8?B?cVljTDRSODMrMHhjbW0vWVBjMEdBVzdjK0hyTDd3ZzkrdHVQYXhDM01MVTV5?=
 =?utf-8?B?ZzlkZEhWaE9PTlJPRk0yZzY4Q3BuUDg4Tng0N082cktKcWdoRi93OUlUVUVK?=
 =?utf-8?B?Y0hWTElpT3UvZVVJSjhOYitaNlE5OEJOMlVFWDFyWHRVM2ZaenZ2dGFUNGJT?=
 =?utf-8?B?SE96aFNDMThjdytMbmtYWG9YREVtbGpmeVM3ODJLNXFBQlh1NmNJK3FSSDZO?=
 =?utf-8?B?REFVSkMvMkoyOHlScGM2ZXVJTXpBT0szZWpEYkRVOE8raDZPaG5PYlFRMmd0?=
 =?utf-8?B?MTYvSXNSM2hYL2ZUSktsNDBZMENaaVZGbEJCd1oyVmlmM0pORWZXTnR6Njcx?=
 =?utf-8?B?TlhPcDB5VElDbmVzRmsxT0c5cTVtVFRnY1dIZ0NnRTQ3Q3k3dEtDSWJhd0ZS?=
 =?utf-8?Q?byLRixynjh2uNqJvblDkBN3Gc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 957188f1-26d5-4b07-88bd-08daa2d08f9b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 10:43:07.3984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBX0KUkyqEn2p6WwG3jVXdWE9nZ6xuD9BhoCUW0BJIqKOLU4F8C6rEF8mYS6EDW3A9zTMuI7Rugw+lFTxTI8gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8775

On 30.09.2022 12:22, Anthony PERARD wrote:
> On Fri, Sep 30, 2022 at 08:31:20AM +0200, Jan Beulich wrote:
>> On 29.09.2022 18:25, Andrew Cooper wrote:
>>> On 29/09/2022 17:22, osstest service owner wrote:
>>>> flight 173362 xen-unstable-smoke real [real]
>>>> http://logs.test-lab.xenproject.org/osstest/logs/173362/
>>>>
>>>> Regressions :-(
>>>>
>>>> Tests which did not succeed and are blocking,
>>>> including tests which could not be run:
>>>>  build-arm64-xsm               6 xen-build                fail REGR. vs. 173347
>>>
>>> arch/arm/gic-v3-its.c: In function 'gicv3_its_deny_access':
>>> arch/arm/gic-v3-its.c:905:32: error: passing argument 1 of
>>> 'iomem_deny_access' discards 'const' qualifier from pointer target type
>>> [-Werror=discarded-qualifiers]
>>>          rc = iomem_deny_access(d, mfn, mfn + nr);
>>>                                 ^
>>> In file included from arch/arm/gic-v3-its.c:24:
>>> ./include/xen/iocap.h:32:52: note: expected 'struct domain *' but
>>> argument is of type 'const struct domain *'
>>>  static inline int iomem_deny_access(struct domain *d, unsigned long s,
>>>                                      ~~~~~~~~~~~~~~~^
>>> cc1: all warnings being treated as errors
>>
>> I've sent a patch, but this raises another question: Why does the smoke
>> test (try to) build an unsupported configuration? HAS_ITS (which is
>> necessary to be set for the issue to surface) has its prompt depend on
>> UNSUPPORTED, and (implicitly) defaults to N.
> 
> According to osstest sources:
>     # ITS driver is required to boot the Hardware Domain
>     # on Xen. For now (Xen 4.10/4.11 at at least),
>     # will be not built by default and gated by expert mode
>     echo >>xen/.config CONFIG_HAS_ITS=y

Hmm, that's been quite a number of revisions back, without things having
changed. Arm maintainers - what's the plan here? What use is it to test
an unsupported configuration (for years)?

But there's a more general aspect here: EXPERT is forced to Y here as
well, which is fine by itself. But it implies UNSUPPORTED also getting
enabled. That latter aspect is what I consider wrong for smoke flights
at least. Yet (as said) HAS_ITS depends on it (and its setting to Y by
the script would have no effect if UNSUPPORTED was off).

Jan

