Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1786B31A25E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 17:09:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84367.158224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAb0h-00054x-FH; Fri, 12 Feb 2021 16:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84367.158224; Fri, 12 Feb 2021 16:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAb0h-00054Y-Bp; Fri, 12 Feb 2021 16:09:35 +0000
Received: by outflank-mailman (input) for mailman id 84367;
 Fri, 12 Feb 2021 16:09:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o46S=HO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lAb0f-00054S-3i
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 16:09:33 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44edb0c5-7e48-4170-86ed-09c8a9e5de9b;
 Fri, 12 Feb 2021 16:09:32 +0000 (UTC)
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
X-Inumbo-ID: 44edb0c5-7e48-4170-86ed-09c8a9e5de9b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613146171;
  h=subject:to:references:from:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Y90NweLWeH8Wgrzk/VYq1vqvQimd/C0kTsKrLs0WwJA=;
  b=TwDcwyUPNaTSOEzCUvvIVlUXPCPbToGhKFFSwcHM+k7z0SPSro0QGm3D
   YRG8BFZ2sQYHol454AWq/ej2lo91paaKuP0NzBFduZ4Ac13oQBtmKCxdU
   WWq//aY6i+Py8KR96jLlTfr7F/RVysaU3T2W9E4n+W6y7GCxpiJpPibYg
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: IpiVNqxszCKcX/2LAt0UcCjkiwBHjtIqA27gnV8X8Ty03+05BICZcsZ4LM+xpFGTe0K0jNbBxY
 qt1RAW8XNzZ2ARsXFWJ0cObCe1RSMJd7iuvtNkIw+sK9Op0J2BgHAuD6utY8bD9wPNUy+Q7HtX
 ez5qnSTVG1LhYBH8VJHKjxsgWgEAAHQZiFkgzwBMkD5+UhFFfrQj9yConsBCHwMx4ezDuCKN5V
 FslUR50yVH8Z+dOJSUc1ng2U8Vs8PQ66KdfjbZbvngQgsyrljVNyQCAXETiU9AbnXsESTpH0Wq
 UXw=
X-SBRS: 5.2
X-MesageID: 37147148
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,174,1610427600"; 
   d="scan'208";a="37147148"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ja77gf+Xyshu94faMRdlkt0yqlcJLR7gMakyak69Ris2P9WUjXPzRkX5D19j0c994w2g/zaxKb9zTQqwiSrhsl63o9jHohRfrnL4cvWvwaLQi3YkFT1NxmIYQ2T+uYU5zCJEsxAP0aNsoKNDbrMTOF1ChCgidoMWfBOFTmm27oSmbxcdrtu1Yg9P7pC2hO7iA6BXH9P8zn8/VlgtrZ6TiQDNrnY1gxQjr/4JnPM4GWNItv0G9NyrMJvtddH5jdDh4bs3ViPMG+aZco90zADlz3MTakwxRF8JFtlCVBGVUNxCqFe0nPBKdxjI7NFAg6C2g2ZvhZKmt80hcDpvofBIjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+LRUSpwIrw8tx0aiADHj3ZAhtrgGCphqQrMBT1Pqwo=;
 b=R55pNphujnWw7rHZuIuWkL4JWZLgFS+c3HBZKZhQX5+AlXRZvIWbKuPP6uRVmHYJQCecANKCFRzl11+r/YO4J9Sr8xVYp3/qBzocOdz+6kMxyT45BRadh8xSGVgIyhuApXyqq5u4ZbRUWdM5NzS2Fek3mss1PQTJ3udXzkqDI3x85mTadkQpfv43GARBhRBwegXu8Z9Lj5vIgYifLvfUIHiScsQfzUgAOwbw2PU2te4fLMkQ+ID70T9wlJoY0Hycp4ZNMqUR8E+WxRSJPkoGD2y39gRkwcXaPCXWiVU5zErViuDw0jz/zbpVKrC5UP1+UQeeFIGsja718VU4kihhyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+LRUSpwIrw8tx0aiADHj3ZAhtrgGCphqQrMBT1Pqwo=;
 b=JqvDvt32Gx/ukIqV7vZ2k1lUXlAe06oIGs8PlLz9wLfN7N2WOEpk1tYLzi9t6gKfhfB8+RdktjWn9MhuGormlbSw/Zxg89VI72R2rgVJ08O520/i5w49aSE6DPHVGoMkobcziUZ1xldv49CYBS5SiADQV7vmUnJYLZ/3UPCMsh0=
Subject: Re: [PATCH 07/10] tools: Use -Og for debug builds when available
To: <xen-devel@lists.xenproject.org>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
 <20210212153953.4582-8-andrew.cooper3@citrix.com>
 <04c93a14-ee95-e4a6-33b9-f80fcd03a010@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3b02dfa7-923b-9bf7-a349-68bbba0590ad@citrix.com>
Date: Fri, 12 Feb 2021 16:09:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <04c93a14-ee95-e4a6-33b9-f80fcd03a010@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0063.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::27) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c64cff7-5528-4c84-f831-08d8cf709047
X-MS-TrafficTypeDiagnostic: BYAPR03MB3863:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3863E61689D9CE1C06CEFF9CBA8B9@BYAPR03MB3863.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PazBsET/vQrIhiK7HP28PF75hmjLS116RUPvhmUwB5z5UBAWHO1ZOjr6WOXLVnEydSfkZSC97XBErVMLkvIcaJcb023Hg8ckZCbOOx+gWiZIArTU0QcR4+V3LN190PCZ7bE2JBPHzWEL4EC7yJUoXOhWruiEaMqvEivuil5QU8A9nu2YOkY7fwktLxBTqkzdXbeGmVp2SwSmfkoZnn7M8TsVjJFE5ka67YxS0YxBDRZtM/fpVuVHSpb/G8JXQoUdNjUKnkEJSp8R4DYEUz3jgotZbcGGSJO4odLmNLubMSb4MxaxgCzQG0+jP0l3QZJ9kB2yJY4SlboEWojfcytlMBjZfUpmca00q+O6wgnV2/4SNkt7kfN/636TeuFHaVYJJisQc0BpYRvJ9VbsX/yMS9E9s8cP4lSoHu+l1iEamWDAAANLO5Y4OSnAi6bG16lzyODLdjRVGtv6vQgqPi0WcTbcPXP4TUvfwhaibmWA7TyI12BS+i6WiJo8bS/IUB/ITTBUZwIGBeO2q1r/JhjfIbR8y9U2LDQzs8+IExsQIBvxGVHKje4w9ByrnZN05X/IegvxzZZRvsB0s6IVN6tBUVTiLU+Jnnpaskn80b6IJ0o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(16526019)(186003)(86362001)(36756003)(83380400001)(26005)(6666004)(2616005)(6916009)(66476007)(66946007)(2906002)(478600001)(6486002)(16576012)(31686004)(53546011)(956004)(5660300002)(31696002)(8936002)(316002)(8676002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UklnTEoxeHd5SnV1RnlwR0pEODJHMHdyYUF2L3psKzhhcHFKc00yUTNHNGQx?=
 =?utf-8?B?eWN0bklVcXllVnBEdm9ycFRzQUgxdWk3dUZHOERZRWFaSTF6NEZESkhoN25i?=
 =?utf-8?B?WlFSbkR5TDYzSTRPTnNxejNON090QVV3YW1mYnpYY0IwRnBiN3VsSWo5dHVG?=
 =?utf-8?B?S3B4Qnc4c2RlS0JUbTVWUFJZSy80NU91TkJlQkY5OVJZY1ljZ0YxTmdFeEVS?=
 =?utf-8?B?bmE3Yk5nOW90Sk5rUkwyT2hzSDQyMXA3RThKQ0dmaDNNdU9RdnVyN0lCM0hN?=
 =?utf-8?B?TUtqZ2ZhdGZsN0YwNWNCQ1pjSDU4SER3MTJZSnpoaGxLVFdzQUhZZjB4d2FW?=
 =?utf-8?B?SHZrNXVzeFRMeFpZc2RuMk83MjhrTVk1RmxpZWF4SFQxSVA2NHVhQnh3dVU4?=
 =?utf-8?B?MzU3ZmF4U1VYTGdxQ3ZYM0FNYjYvL2NGN25pTVZHaE9EaXY3SFFhbW1rOXJq?=
 =?utf-8?B?TnZHUnZZUlkzNmtlWlhBWWdrbWgrZFdOcWk0elRVbGN2MlVzMGZrVUtjUTh0?=
 =?utf-8?B?UEIzQ0x4clplL0YzWVdONm1MbzNtSFBFT0tmVWh6SVN0cmxwWWMxMTNlNHhN?=
 =?utf-8?B?OURwQytpSGs3RUo2UkRZNDdTTCtqcHNjZ3J5dnlqNlpBN2FlNzFzdDRLdm1k?=
 =?utf-8?B?RVMyTGE2NlRXSWhsWVh1VlpQc1VxTjFWeHErMytRZ3h1MVI3L003RzEvTTFt?=
 =?utf-8?B?bGVvcW9wZC9BWkJOWlJGNVRpZG9oMW1RTFJjak9TNWtBS0FVU2ljWXp3czJR?=
 =?utf-8?B?WVAzaGI3N0pIbWtYMFhzbVl0WGxYTVR3dFY1QVFLWG9YMnBFbTBpQjhCMTB6?=
 =?utf-8?B?MVpOcTN4MzFpQ2JWTE5qK1phSCtvZ2d6aDFBMlAybTk2RlVkdkVEdWYyRm1x?=
 =?utf-8?B?dmtJcC9SNXY5TWFFVnk3Z3NuNmNyN3lZYnBRWHNLNnBjUjhnNWQ5RTJSazNm?=
 =?utf-8?B?V21RUEFkTE5jNFV4cmUvUUw3bGdzVUJYRWo2SnVETnFxMWRmRnh3L1FiZlVY?=
 =?utf-8?B?YnFZVEE3NXZmcWNDYUdXTm1rL3A5VVhqVk5DYWU1NjVGU0I3bFVEYWw0V0F2?=
 =?utf-8?B?SkFwbmxQNFhwVmRDR1oxOURTU3dYOUtGVlZGR2xKL3FtcVd1TCtOcFkvaWw5?=
 =?utf-8?B?UCtvM0hQMG5OVysrTmd3czR0TjVMZituWlJkWXBCL0s3cnhtS1QwSVVoRlU5?=
 =?utf-8?B?NzhPTlY5WGVwYjVVcS96cWRHYlVjWkxPcDZCdURHQjJCdEgrcVNpcHlyV3cv?=
 =?utf-8?B?QWZHcU5CMUFvSE1XYm4wV0FoUFkyUXN1YTE4UzBwaHVTMGo4ZmVlcmJUYmVu?=
 =?utf-8?B?dWQwOXUrQUxJRTUvQkVKL3FIQmJFTGlBMTYxUGFtUUNZTE1UMkw2MExBTUwr?=
 =?utf-8?B?dmxzMGhjb2owNGEza016SDVKUmEya1pxQW1YckRINWl3R3IvQXNFcm8wZng0?=
 =?utf-8?B?dzdBeWRNRVRnNlNmZDRMaDQ4MUtaNDVZOFJEY0t2dEY0MWNLem5jVUtmNW9w?=
 =?utf-8?B?aURVc1I2QnBFWFIvSDhDZzQ2d3VZWUZyaktpTkFnLzZpaWY3eDFuYndFZzdh?=
 =?utf-8?B?Sll3d0JvUk1hNGFTbVhLWlhsNU5YQzd3Y1R2dEpCVlEzWTdwc2g3TSt0SG8y?=
 =?utf-8?B?dkZPWEM1c3ZTS3BsbGpJbUhMcXNkenhUWTZsTEhmVDNrbkhzYU4xMnU1WkFm?=
 =?utf-8?B?L09haU1TM1ZXM2F5a1I2c201aW55RVVVcHBLUFo4Z1dTQ1JhTkY0TWZWMHVY?=
 =?utf-8?Q?Q/OGaOX1lih6rUxvowWbbgNLnmzdwkAk6dz+wsU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c64cff7-5528-4c84-f831-08d8cf709047
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 16:09:24.0295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gfPaTLc9E4/buRfoeVA1H/bEi3TRijUdacHSpOz8jOws22h2FAMvxUafe9SGbCb1QoKGIMexxvfaj5KLeKyRLMzxRma1CuKEECkbkP4iJnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3863
X-OriginatorOrg: citrix.com

On 12/02/2021 16:04, Jan Beulich wrote:
> On 12.02.2021 16:39, Andrew Cooper wrote:
>> The recommended optimisation level for debugging is -Og, and is what tools
>> such as gdb prefer.  In practice, it equates to -01 with a few specific
>> optimisations turned off.
>>
>> abi-dumper in particular wants the libraries it inspects in this form.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks,

>
>> --- a/tools/Rules.mk
>> +++ b/tools/Rules.mk
>> @@ -106,8 +106,9 @@ endif
>>  CFLAGS_libxenlight += $(CFLAGS_libxenctrl)
>>  
>>  ifeq ($(debug),y)
>> -# Disable optimizations
>> -CFLAGS += -O0 -fno-omit-frame-pointer
>> +# Use -Og if available, -O0 otherwise
>> +dbg_opt_level := $(call cc-option,$(CC),-Og,-O0)
>> +CFLAGS += $(dbg_opt_level) -fno-omit-frame-pointer
> I wonder if we shouldn't do something similar for the hypervisor,
> where we use -O1 for debug builds right now. At least when
> DEBUG_INFO is also enabled, -Og may be better.

I also made that work... its rather more invasive in terms of changes -
all for "maybe uninitialised" warnings.

$ git diff e2bab84984^ --stat
 xen/Makefile                    | 3 ++-
 xen/arch/arm/domain_build.c     | 2 +-
 xen/arch/x86/irq.c              | 2 +-
 xen/arch/x86/mm/shadow/common.c | 2 +-
 xen/arch/x86/pv/shim.c          | 6 +++---
 xen/arch/x86/sysctl.c           | 4 ++--
 xen/common/efi/boot.c           | 2 +-
 7 files changed, 11 insertions(+), 10 deletions(-)

is what is required to make Gitlab happy.  I was planning to defer it to
4.16 at this point.

~Andrew

