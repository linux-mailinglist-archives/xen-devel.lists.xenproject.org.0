Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E184469F242
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 10:53:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499323.770414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUloI-00056X-8R; Wed, 22 Feb 2023 09:53:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499323.770414; Wed, 22 Feb 2023 09:53:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUloI-00053K-5Y; Wed, 22 Feb 2023 09:53:14 +0000
Received: by outflank-mailman (input) for mailman id 499323;
 Wed, 22 Feb 2023 09:53:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUloG-00053E-E1
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 09:53:12 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20612.outbound.protection.outlook.com
 [2a01:111:f400:fe12::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b664ad3e-b296-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 10:53:10 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7678.eurprd04.prod.outlook.com (2603:10a6:102:ec::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 09:53:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 09:53:07 +0000
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
X-Inumbo-ID: b664ad3e-b296-11ed-93b6-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jyn3dqyMKr8kmQJxc9ujW+Qtx+91ecitkdIJKAQNDtu0QGPsX3Rtur6LBpkeNEFYcjBBD51G11TTzizr4RBqFU9FzfE9exa3UuPeE2pLgc7ve0+ke4SfGnblJQBYHLUKrfISeZDxuazMWdvAnhWrO+eFlys63s/vU1KvhhaY4kA/R27kNKLbM+KyJfrKN6AkGkdC4bUBbHZwxDhQspun3DiIYm3/14EfBzxgOT/VoaahKv9cMapBcSn160Sm7V6rJGtZRm4FIHKfJWen6KfzVMR8AaTyeGnQhbKqQrWpnIiASoolzyGSfsPaaeKUWJxm2UslWVDxSOJujJW9YL8Iwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4sVT6+6VZGaVE3SwUFqM7jDYqL5+aYTWCo/kbX1NcYs=;
 b=YwBAxOPmJtPHt3J9rixK+8NIzfIISAuyNqCh7yRumaWcewhxgFMxbIgdQsDD+LQqOJu3aRsOwxs8bQzhtQPZya2dWAsmnJ0g8PDzoUc3P5O2oHQj1wKVhhFtdRCQfuzR4Z2uBo9M23/6zXwwSMhnH1KgoDoDRbyNXuVuyn7Vr7pvf7rkQVvaR9H6sId42uF6f+FrgRHSq+gt/mvAGtcS89lbPKWhD7EVouNEoC2fOhisX+cuVI5dISHu94IPLuamPk4ST+3Px+Klxp+Ilguo9gPBBh6duLmca0UlDTIYIHowogqgjAUV/d0ewKAKujH51sVUrRG23aYxEp6HSLXrvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4sVT6+6VZGaVE3SwUFqM7jDYqL5+aYTWCo/kbX1NcYs=;
 b=h85Nxu+AARXvmlA6+qVMw6aqXvOxKgUGaAtIezCKC77jvkSoqQyqnnZW10bCGMgKRt4xQ5/wVHSITaoMZpQQ+Lrw5K16u4mbku3IZm4Q20mrhlKiLFFkbpiep+dZxgMIcr26yeO4rfHYy9NZdGrxU3yaVCrryv+T7rgurH6Vh7zWSMPsgtJ97NtNYZ3Pt8DOJMH0yvGPv8VLdGuHpGzUGsO1AEM12pcZRcnk0GZLiE34a8WKuYEA1dfMs+25Q0gmgTE6BvcUdw5kPvLnaCzT8UiHi/QHECWzLYngLzahxeO+tyvFBnY/Wb1XgqRzzn2X436W5HJm1+ouMsNdQ3Gb1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e2e4b7ad-bb41-4954-15a5-c62730c5def3@suse.com>
Date: Wed, 22 Feb 2023 10:53:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Debian randconfig failure, Was Re: [XEN PATCH v2 0/7] automation:
 Update containers to allow HTTPS access to xenbits
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230221165542.7642-1-anthony.perard@citrix.com>
 <19396277-127d-1127-cdad-341368f97e92@citrix.com>
 <621319f4-0924-9b5f-9f84-be275f878cb4@suse.com>
In-Reply-To: <621319f4-0924-9b5f-9f84-be275f878cb4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7678:EE_
X-MS-Office365-Filtering-Correlation-Id: 31a2a678-25cb-4735-1c55-08db14ba996f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qqv8Quj0NIAiGwxvo6n/1KyrYQgUiKSXu6yZa2EwwsNawI4i/FPvtnMMcCEyHqEBa53DwHJzFuLSwawDF6f0e07HOxjQgCIsptLhOyag+FXJWE6qcEvSgd6XnvjuYmZoUcrCzVdAqFwgdmGR/mN5oQnK6OPmbbif6slK3Lgof6pto/N/75n0B3H8G8lQ5jrQ0a9UORkdp9PnbwtrrssUxzuQiQEr8L2VkzlCkMU4pxZcG+uRf6XWDSGVkOHvlAp3kjOlab21i40D0QioKSwDkXiTPHiefbkF0h8OSJB/8so36B+ZscIN/Ydjk2pX9CU8HjLI6p+Qkgc8hh/yaekTB7Ga1tMjoAYFemAwzKVR6CQBiC82YbRKk4iEyoj7DK2AjdVhqkGlF5TqN30pVANcPoa59V1cfd5m4utJr39hs524ffpFNmh0SpFd5733l0/GIFmGoVcSMN0zrZ5eTnwwrRVTk2GWC86uNLtnHlsweuE3VlSqAs1enu7vAQkg3HQmSZysEkLCDvE7zFOpcDJY11Dtf6A2Y7Ox7DyHd4iKyaHgU5dcPphS4RjGJkZCDbhzc3RwsV7+lvnCZosognG86OAwFjGPpAntjDmFIJea4tNazmjVFd4Gnb/knztSoBwGZI5gBzfF0vEHA5QInVPXaB0wpzEHO2g/F/TitBxVinh2YOzX+4C18w5/vUoyTzDsy68zA0clyz5dUncBNNSOU8QLHGzglxRAMjiyLkQlHmY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(39860400002)(346002)(136003)(376002)(451199018)(36756003)(83380400001)(6506007)(186003)(6512007)(53546011)(26005)(966005)(6486002)(2616005)(478600001)(31696002)(41300700001)(4326008)(6916009)(8676002)(66556008)(86362001)(66946007)(66476007)(2906002)(5660300002)(8936002)(38100700002)(316002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0VQNkJZOVkyM2pTRFVyWFZYeERuYlZnaDg3NGNNbWtKbzZCV1RvbzROYkt5?=
 =?utf-8?B?aW14WWpwQmpYYi9pVEoxdnB4ako0UWh4SnI3cUFYSys4QlV4QTk1Tm5vTHFt?=
 =?utf-8?B?ZDd3NWxXNlIzYnpxUHo5QTlCODcrU2VlK3hENitoVHdiRFIvVlNxeURheG9w?=
 =?utf-8?B?d25pSEZCWlJPbVFxc2UxbnJ5QmhKaURQb3JsYUZ2bmx5ZWxyVVNwRTdvZGJP?=
 =?utf-8?B?THRMakRxY2FTZnN6NjFhOFBDajJkelZXTE1selpEYXg4eWVFT3g1T0JDZDdy?=
 =?utf-8?B?T21jM3dnWENDdmNUL3hpMFVQdXBCYU55NGxtVjhOVHIvcjVUNHRRRkRzSVhN?=
 =?utf-8?B?Y3MzUDlsQ3BnZTk4UWpuSkhGa2drQk1kZHlUNFRRNFpKMzh1S01aTThjWnJm?=
 =?utf-8?B?dFFaRGV3MUVFZ2lkZHZGQ0dkTGpodlVNQXRPT01ncjBCMktUbDFlUUhsczhl?=
 =?utf-8?B?UVVzVmY5c0hGT3QyZkdIZWRJOUtRSFR4K1UvL0Q3VGNwRVFTZkRKVnEwNk9h?=
 =?utf-8?B?MFQvL0N2c1pweWpGcUlrbWZZM2pBOGJ2aXFZWkhEZGhuME5rb2JpZHhxR01i?=
 =?utf-8?B?RTF1dmcxM3N0QnFEbnk2YTRXMjE1MXZmK1ljbVZzZisrQjZTNS8reUxFdm5Y?=
 =?utf-8?B?UkM2N3ZhQkhiZ3JWUVV2ZndUSEdwS2VUL3lXZWpaTitwUE1QeW9xaEJMdlJs?=
 =?utf-8?B?dnQ5TzhoY25QcjAra0xJR09CNi8xVmNLdWxlb3VVSWxsdDNMSDZYWUxNMG1o?=
 =?utf-8?B?SS9PNEk1K1k0RHhRZkZabHNQdVhGZ3lzbUlua3JQeEFoUEtnS1lYM1F5b2E4?=
 =?utf-8?B?YU9YcjBzemtJdVlRZllwc1E4ZTZtUTVONmJibmxiNU8vYzdEY0drcmo4Z0VD?=
 =?utf-8?B?RzZpd2pHQ1ZzQUJHOHlpT0RLWjNGTGw3K1pYdEtXaUlScGtPSUhVYU8xeWpE?=
 =?utf-8?B?QXZOTzJsYlpVZi9TcThEWTNRVDgyUjhJUDJVdXZFSmpoWGlXVUdjSi8xRGFs?=
 =?utf-8?B?em16N0NJMmZjanJlRjlnRndhNVlZalhRVkprZHRBbS9wSklqZFpSUzk3QzQx?=
 =?utf-8?B?c1NJRlZkY2N3SklDY0tJRGhCZTJ2RTl4dXFmcmJYdTc1QnVFblhhRWpEZFE1?=
 =?utf-8?B?bzJoRnNGK1ovMEdJc3ovT2x6SmwwQXZnMTluZ05LU05GNmhjV1lRVVRCWVly?=
 =?utf-8?B?cVVZQU5jMWlpVGE2QmtMdy9ncldwdkRKaUZ3Y3hrK3pJMVBySm04UDVOY1ZJ?=
 =?utf-8?B?TXVKWmxhY3dsa2FBRXNaanpJUzlJQmZIZHM4Sml3WkhidGdoL1J1ZlJKYzZ2?=
 =?utf-8?B?VTNuZkcrSkRkRzZUVWRSMGVYTmRHU1lLQTljSWYwZjl4Tmg4dGU5S3VGbmRD?=
 =?utf-8?B?RkFsRS92Nkg1QU5FRUxDaTQ5d2VjVGN0WDVxMDBRYit4T2o4eWVSaVM5ZGlR?=
 =?utf-8?B?ckZtY3RPOE9IQlppOFQvaks5NVVYdkFrN0tVcVBKNUoxdHNrTU1hQ081VDdm?=
 =?utf-8?B?QVBrRHdGOTNkNVRRMU5HMkFKL2NrQVJrOVRoN1lrWVA4T3d4QS92RVBKeFY1?=
 =?utf-8?B?TzVpbXRYVEpUUVBuWEFobEN5cjJkcVFZRkMxbFZwVURwRXV0R3BHeFlwT2dz?=
 =?utf-8?B?dmhjQ0pOYktWbk9FdFlrRzBSVEJyQTUrSnFOMGcxYkJhWWo0WEh2WWorMmNN?=
 =?utf-8?B?TXVJNm96UkY2UVROOVVSQkdGdHVXemhSY01VUnRhM1A4SnNVd0hzUTVRL2c4?=
 =?utf-8?B?WVRraU04Tml4Q3RuTFN2d3c2RUo2QnVHNkxnOUZnbFA0OGlzREYyY1UrN0p1?=
 =?utf-8?B?a1RVbXhOaFhwbWNxNDl0VnVseTFLTzJaeG0rR2crN3FvQVZZeHoxQ0o3cjdG?=
 =?utf-8?B?b091N1JWMzl1UU42QWl0T2JpUC9zSk9mU2g1TE85RGErRVViZHBqcW5IRVRL?=
 =?utf-8?B?ZHhZazhFSnV4VkV4MGhYU20xVGhUQ3gzNnRHOGd6b0VoU0tFMk1sQllGVW5l?=
 =?utf-8?B?U1AycmVyRStWVzRUV0g5RU45ZjZzZU1ENXVlajBmcklDTlhMRW9NU1ZwQWpT?=
 =?utf-8?B?bG8xenlvZzJvWnNxc1M2aUYydm9xWnR3cEdiRlNrbDREQVB0MHBIQzNZQlFa?=
 =?utf-8?Q?gbVIfaTOs9496BLeDGsltr88C?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a2a678-25cb-4735-1c55-08db14ba996f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 09:53:07.8100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0gQ0wvP7VLwRc/Be6X2DyJEMNLjOafsU/MH7qbf9FSSUOthshSt8sqDNAnno4Q3acmekg9/IurJhJ9ZkHJfR6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7678

On 22.02.2023 10:42, Jan Beulich wrote:
> On 21.02.2023 19:05, Andrew Cooper wrote:
>> On 21/02/2023 4:55 pm, Anthony PERARD wrote:
>>> Building randconfig on debian unstable seems to be an issue.
>>
>> You're talking about
>> https://gitlab.com/xen-project/people/anthonyper/xen/-/jobs/3769926509 ?
>>
>> + gcc --version
>> gcc (Debian 12.2.0-14) 12.2.0
>>
>> arch/x86/extable.c: In function 'search_pre_exception_table':
>> arch/x86/extable.c:200:27: error: array subscript -1 is outside array
>> bounds of 'struct exception_table_entry[1152921504606846975]'
>> [-Werror=array-bounds]
>>   200 |     unsigned long fixup = search_one_extable(
>>       |                           ^~~~~~~~~~~~~~~~~~~
>>   201 |         __start___pre_ex_table, __stop___pre_ex_table-1, addr);
>>       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> In file included from arch/x86/extable.c:8:
>> ./arch/x86/include/asm/uaccess.h:414:37: note: at offset -8 into object
>> '__stop___pre_ex_table' of size [0, 9223372036854775807]
>>   414 | extern struct exception_table_entry __stop___pre_ex_table[];
>>       |                                     ^~~~~~~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>> make[3]: *** [Rules.mk:246: arch/x86/extable.o] Error 1
>>
>> Jan: do we need some more gcc-wrap sprinkled around?
> 
> I think we can get away without, but first of all I'm curious why gcc12
> spots an issue there, but not in my (and perhaps also your) local builds.
> Being a randconfig failure, is this tied to a specific setting in .config?
> Off the top of my head I can't think of any which might affect this code.

Looks to be the combination of DEBUG=n and COVERAGE=y.

> To work around this, instead of adding gcc-wrap-ery, I'd favor simply
> changing search_one_extable()'s 2nd parameter's meaning from "last" to
> "end" (i.e. the range passed in from [,] to [,) in mathematical spelling).

I'll make a patch along these lines then, I guess. Should I credit Anthony,
you, or both of you as the reporter?

Jan

