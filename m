Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 247933C6C17
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 10:38:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155155.286511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Dul-00032T-Tl; Tue, 13 Jul 2021 08:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155155.286511; Tue, 13 Jul 2021 08:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Dul-0002zE-PF; Tue, 13 Jul 2021 08:37:15 +0000
Received: by outflank-mailman (input) for mailman id 155155;
 Tue, 13 Jul 2021 08:37:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZRbA=MF=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m3Duk-0002z8-JV
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 08:37:14 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 482b1506-75a2-4f00-bcc0-5d3e1bc552ba;
 Tue, 13 Jul 2021 08:37:13 +0000 (UTC)
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
X-Inumbo-ID: 482b1506-75a2-4f00-bcc0-5d3e1bc552ba
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626165433;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DWTDIDsOJ+jJQltSfbd8k/oG42bvhthjSxkKwGx1Plk=;
  b=BJdzWgVz3zmjtBlcN+M7TPXQYKeE4eZrKwaE5x60cLXJdryw0WStCWJ3
   Kd0rWMXWVEdGk+y3EBRJOJWMPiljpaAHXAHIb6d5TEmTs4krCYSE/DW0R
   Hnu+KHbwoXcFYmSR/Vj/bHuj6zZltZGaaDjt6+xpW+2XUD/M4jX8Lr9/b
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DWBwoMmAMU7KUY1W6lkCoo5xleip9DSMbuvvxU//otzxrk9PBs12Ad2vBzJUO2ljgAkTsbp9BK
 Nwc80pb8ee03xSVGEQfpnfVF3TnX8rgG0Ae4O6il14Vw2CYPXKvyTn/SAOhcQr1rQ1EBqnJEey
 afdBQ8li5UNvoHbBK5t3U0QgFN1TG1WQJchLKGq/u5/5OgD4rJmTMhch9jj0jbAJNA/43aV7Sn
 sCnuFAHWR1nrDZ4FGninfJ9mPtEGTECQcnetgo25ET4qgIafPaHNl9ewGytwWoA5VOJIC5edy/
 WR8=
X-SBRS: 5.1
X-MesageID: 47833559
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:F/cZ1Kthop9uACUt0OlE5L5C7skCmIMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK5yXcH2/huAV7EZniYhILIFvAf0WKG+Vzd8kLFh5VgPM
 tbAs5D4ZjLfCVHZKXBkXqF+rQbsaG6GcmT7I+0pRodLnAJGtRdBkVCe2Gm+yVNNXl77PECZe
 OhD6R81l+dkDgsH76G7i5vZZmzmzSHruOoXTc2QzocrCWehzKh77D3VzCewxclSjtKhZMv63
 LMnQDV7riq96jT8G6c60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKBsQaeLsjwZqPymrHwqjN
 7PiRE9ONkb0QKeQkiF5T/WnyXw2jcn7HHvjXWCh2H4nMD/TDUmT+JcmINwaHLimggdleA59J
 gO83OStpJRAx+Ftj/6/cL0WxZjkVfxiWY+kNQUk2dUXeIlGfxsRLQkjQdo+ao7bWXHANhNKp
 gpMCic3ocXTbqiVQGdgoE1q+bcB0jad3y9Mzo/Us/86UkdoJk29TpB+CSz9k1wva7VcKM0kN
 gsBJ4Y342mfvVmGZ6VO91xN/dfKla9DC4kY1jibWgOKsk8SjrwQtjMke4I2N0=
X-IronPort-AV: E=Sophos;i="5.84,236,1620705600"; 
   d="scan'208";a="47833559"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fuWH7WFs/PPlylsdGhB91LzFOS/TKUfWL6mze9kX1lBOD3ApC/KnFByH+QEWu24IRX88AMwfmJ0HlF9aTStAorFBtnmndxOnzIF+VKUr65sCk6ufpqjQUmtRnqqM6IE9BrLyEeWfAa8i0bFJt9pSYHwVT6B5VPQgxFYfV81ozDE92AGh4DkmN1bc1hwKHWjSAsT+117rpV24dlkwHMDO0W9+funbjTk4sJiBRlq0g1vHdqgWcaiN9ZYjJOwSafV7D6YODuDQK9fgC7HmUujXhAEtkM8e6lP0ML16F4Oxwos8PU5jt/gpWl9n98T1sCOSHh9+nfHaMwiDNeNxumBYUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyYacCnsEOtfBZL26rEsFEhjatanWjE22XhyJQZInP0=;
 b=ma8i2NNhEniBxk9iUme4VTaPPflWO73HH4/lnGNAGBcn8Ul7HlUXS9ZDPavNFLweNNWOGk8GYNR+9i58Vkm5trN5CRQjrkAHJ+E2qP3gK0EaNyBSbTz+rVmcNNcGNAIrZfRNKkQSwAARwUqUKFjoZDWHUhzwqYFtuoVil5P2vgeeVhv+7JTNw8UQ+DBVPbY78mJ7pxuyOzEceeTnmujOeRl3BtFPatqR9eZ4r9AO7//MJ/U9lCB6DqePXbnoqxxogwVvRym6ymt3AfJEi5xiAyegCBeeFUBnbJ9NdMD/uxqoNhc73wifggNQgF3Kk5VYWX5RmRakPPQdnMvtUoo6xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyYacCnsEOtfBZL26rEsFEhjatanWjE22XhyJQZInP0=;
 b=mtJKl8xmd5uIaNZpH9N3nqss5GAXGaEeqnGYuhPIYvPlrE+DdVOwG9yvOIfxhoDFUTp7QpNRuOGWRI4A/dj306sA+RkL7+iSVAAhBLbGxVOm5pbl8f5eUp6qjGPP1MD3685MT7plRo6WA50Iaxyn1sixmfdBLyOyZm64aus+FdI=
To: Jan Beulich <jbeulich@suse.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-2-dpsmith@apertussolutions.com>
 <2a794038-f4f5-1525-5af8-d89b687a8043@citrix.com>
 <4a55dc14-5d02-2594-38e8-f732ead164a6@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 01/10] xen: Implement xen/alternative-call.h for use in
 common code
Message-ID: <a95650ec-1bd0-d36d-8a76-43c315fb620e@citrix.com>
Date: Tue, 13 Jul 2021 09:36:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <4a55dc14-5d02-2594-38e8-f732ead164a6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO3P123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98a7a5b1-ef91-4a8f-f2e5-08d945d964bb
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5648:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB56481051FBBC87386C3498D8BA149@SJ0PR03MB5648.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 95Qd1hRcl5kxjf8JdkRAG5M+T57hY1Hp0VvS6ccjqnPSRtGLp8BCFapgHNl1oQgb7r3YKJNNkmd4rzBj+t4ob+Aa4RJliz9Gd5PyjuL0j5l/qhcv0qCoXGBcimuI0qVcTq82uQ/lNyQsEo7jNFJh189Y/jrCqfGgjnwXLbIPVTfllktgWFLZgLnj4UwoAlyAc39ZP2kYY2grtFDluOXZy5AnOeHUMWRGcVI/Ea1HmsMuJPpUCzvswpRyl043BNTq7EwAPldn0uuxt5wjgUi0lfQADi4EwV9qRTePX7DdMLssatUzCTwxrDGmFe8kIfQbCk2t+sE3cn1xRZpGsYfuJrmrIHq0pb8uhoUxqgcLxDqwxDm32QR+1Kw8PIENvx/wtmbY8VDoZG/ZpqPaaXA5SMBjkg+yxQGzIHxh4DbWr+5IJMhl000lzWIREwIPf1c1JTypZuAnlv12nsJBHTN5N+fVo/2PE3EGFo/2foUEBgh3Ex4rTor7DDTTk3F0Wa/XC+BIjN0Zd2A95stwWmGOU1iU8uGbTWVnZQGYfkfSt3KB994fciNsf5VOK7rtP/f9UZZS1xEe+SmGOIvC5Yxs3jZ0RXdEmr5IM/sXthzUcai1Tsl2BUMZ7GoZEz+x0TXdKiL5OX6EhY6ZvTbcOCsV5l934Gn9Sj9b7FY1BVvMoPT4r3zf9wbyG9vN1E0mJyh5l+zaOExNAhXKLuBv+7IgBelB0U6f0Kjrnpa02+tQVrc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(346002)(39850400004)(396003)(8676002)(31686004)(478600001)(6666004)(26005)(16576012)(8936002)(6486002)(86362001)(38100700002)(53546011)(4326008)(31696002)(5660300002)(66946007)(2906002)(36756003)(110136005)(66476007)(66556008)(54906003)(186003)(956004)(316002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWVGRWJvVmpYUkx0VWJxSTFxNmJoaWIrcGdiOFFBUWt5UEVMbXlVdnk4TURr?=
 =?utf-8?B?ZGFXdUdRQkpQVXNMdjlZSjdiQW4rSFVzS2JVc042SlQrVThKc0xTakQvRFcx?=
 =?utf-8?B?UHJmalI1d1A3WlRFZnRSOGpLVnpqVGZ0eW1CSUlmZHFManFxMVozSmhTS3lx?=
 =?utf-8?B?V0RwRGlEdVMrQnl0RHlqdWNDREJVck9MNkpEVE5wSDN5dkZQYlZJQzU3bStW?=
 =?utf-8?B?aEFUdm1hWnJhai95YW9pS0M5Rk9JKzhXRU5lb0RSdGc3OU0yS2NpRGpqMkxs?=
 =?utf-8?B?S1VCNDZldFVEclJqY25ndi9LWDlacUtwc1dMU0hlOGk4UnVWV0I5YjlHQS9n?=
 =?utf-8?B?d001TStMejBXTmJyRE5rWTFkNmFjZVRKeENtUU9ZcTlpdVlvdG5YR0pRakdG?=
 =?utf-8?B?eHBjQ2w0eGhLUDZKT2xCdW5PSjd5aVRnUkpNaG5yeW9VQzFNMGNGTWRvRGxl?=
 =?utf-8?B?TGNRbTR4UUNGV2U3MkpPN3Avc1V4aUQ4Um9FTEEzL1RMV05JcW1qbHlpanNO?=
 =?utf-8?B?Nyt4cVBzWGhxZUViUzJONWtDMG5ieTQvS2xCMlQwcG9RazVEUEIwVHZWZFpH?=
 =?utf-8?B?NmZNY0drVzJvL3F0c25zN09NbEF3SEhVb1kvZTV6ak9iZVladjVObENqZzl3?=
 =?utf-8?B?am1DRlhvdm9xeGxmTXBwMC9OVHZUODF4dVpacWxKUkNUVHJTZTFIUG1nM2Mv?=
 =?utf-8?B?d0hMV1FST2luR2FmSjJ2ZzAwU0pIVHgwSmFDSFgrL3VqQS8zamJvemtzcE9I?=
 =?utf-8?B?NXJpTUxIZW42MXNoRFdSWDJ4ZlNnei9PZnVvaTZSZW1OcHl6WnZkdXNKR0w4?=
 =?utf-8?B?VjczREN0bjJnT3p5WG9weWZLYWpKcW1ZNVN0aGZkVGtLeEFOMzcyMEhKQUtR?=
 =?utf-8?B?Ni9Jd3V0eWtEanM0MWJ0czUwL0hIVDVRV0pqdFBqTG1CRkpZSUl4ZnVpQncy?=
 =?utf-8?B?N1p3VmdCVmxEN1FFSi9OOVY0b2RscENIVis3a2VVSSt6WU5PQmRXVVpuT3dw?=
 =?utf-8?B?THJYcUl2dTBZeVhjZFRkN25NU0ZyazQ1SUF2d0lBa1R6UlJYVDl2TERUYmVO?=
 =?utf-8?B?SVh5dmlxVWFQbm1QVWtrYWZmZlBxWGVzUjFEeHh1STNMa2NIeCt3K1hFZlln?=
 =?utf-8?B?c25ERHA2TTNTdTNPOVJOOHcrUW4zS25GQmdDRzh0N0poalJteEE3NmF1U003?=
 =?utf-8?B?ZFk1aEhNbjhuNm1yV3hleUNaYjZtbzg2Nkk1SFJPYVhRS3h0QkJqWU8wUk9x?=
 =?utf-8?B?SUYvMG56eVVFc21BWWR4SVhSK2ppNzNKWlA1dSttVFVZQ3h0R2ozeEQ3UUVo?=
 =?utf-8?B?Z09sUkZWK3Zza1B5Sk1lb3FJZ1JyYko4ZXNNQUd5MlljdldyQzg4UWNoV3Zs?=
 =?utf-8?B?KzB3dWJRTVVuZ0liM0M3K0JEWjVma3pSUExYbEJ4c2h3V0VLdkljbElONlI2?=
 =?utf-8?B?TjQxTXQxTUViMXJwVWw3bjE3bFQvU2VabTJYVktJOEl2L09seU9KQXhuYzlp?=
 =?utf-8?B?Z2VRWFErZHdPd3FtNkg5MDduc1MvNlJGUzhNaXFOMExnRTZWWTNnakNRWHVW?=
 =?utf-8?B?R0kxakxObjBucFNtdW9GUlg1LyszNXRpVk51c21UbkNxTmxpazVXZUVQS1JT?=
 =?utf-8?B?Z0NEcEFyME1BQlA0V0t1Rjl6YmRpVDlyNlQwUjJEZ3VYNTdvSjEwa2tZcjlY?=
 =?utf-8?B?SmV2MFlYRkhRMXlIRFRLV2tuRklmQ3JlNkRrcjBsSGhEWCs2eElxRk5MZzV4?=
 =?utf-8?Q?ohaSnzoruCX9Inz1r/UVCbi9YjQS0buRbloPjRv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a7a5b1-ef91-4a8f-f2e5-08d945d964bb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 08:37:05.3122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zeEDOkII1aWk1zw+lqDuagt9PIsiB5qC2PZKPhJOZk7Snqcy+6ED4xyD8GFDqMV6cxCILILUChJ62X58bMRLn/dhDajtxGWZCfhWnrG/BI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5648
X-OriginatorOrg: citrix.com

On 13/07/2021 07:28, Jan Beulich wrote:
> On 13.07.2021 01:48, Andrew Cooper wrote:
>> On 12/07/2021 21:32, Daniel P. Smith wrote:
>>> diff --git a/xen/include/xen/alternative-call.h b/xen/include/xen/alter=
native-call.h
>>> new file mode 100644
>>> index 0000000000..11d1c26068
>>> --- /dev/null
>>> +++ b/xen/include/xen/alternative-call.h
>>> @@ -0,0 +1,65 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +#ifndef XEN_ALTERNATIVE_CALL
>>> +#define XEN_ALTERNATIVE_CALL
>>> +
>>> +/*
>>> + * Some subsystems in Xen may have multiple implementions, which can b=
e
>>> + * resolved to a single implementation at boot time.  By default, this=
 will
>>> + * result in the use of function pointers.
>>> + *
>>> + * Some architectures may have mechanisms for dynamically modifying .t=
ext.
>>> + * Using this mechnaism, function pointers can be converted to direct =
calls
>>> + * which are typically more efficient at runtime.
>>> + *
>>> + * For architectures to support:
>>> + *
>>> + * - Implement alternative_{,v}call() in asm/alternative.h.  Code gene=
ration
>>> + *   requirements are to emit a function pointer call at build time, a=
nd stash
>>> + *   enough metadata to simplify the call at boot once the implementat=
ion has
>>> + *   been resolved.
>>> + * - Select ALTERNATIVE_CALL in Kconfig.
>>> + *
>>> + * To use:
>>> + *
>>> + * Consider the following simplified example.
>>> + *
>>> + *  1) struct foo_ops __alt_call_maybe_initdata ops;
>>> + *
>>> + *  2) struct foo_ops __alt_call_maybe_initconst foo_a_ops =3D { ... }=
;
>>> + *     struct foo_ops __alt_call_maybe_initconst foo_b_ops =3D { ... }=
;
>> It occurs to me after reviewing patch 2 that these want to be const
>> struct foo_ops __initconst ...,
> __initconstrel then, I suppose.
>
>> and there is no need for
>> __alt_call_maybe_initconst at all.
>>
>> The only thing wanting a conditional annotation like this is the single
>> ops object, and it needs to be initdata (or hopefully ro_after_init in
>> the future).
> ro_after_init and initdata can't be alternatives of one another; ops
> (until be gain ro_after_init) need to remain in .bss (or .data).

Once alternatives have run, the ops structure is no longer referenced by
anything at runtime, and can be reclaimed.

All the x86 examples are weird because we've either got extra data
fields which are referenced at runtime, or we've not accelerated all
function pointers.

In neither case does modifying an accelerated function pointer after the
fact do what the programmer expected, and conditionally initdata makes
this far more obvious.

~Andrew


