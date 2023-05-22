Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5DA70B58F
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 08:59:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537762.837251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0zVz-00079u-Ed; Mon, 22 May 2023 06:59:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537762.837251; Mon, 22 May 2023 06:59:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0zVz-00076Z-BD; Mon, 22 May 2023 06:59:31 +0000
Received: by outflank-mailman (input) for mailman id 537762;
 Mon, 22 May 2023 06:59:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q0zVy-00076T-29
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 06:59:30 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2053.outbound.protection.outlook.com [40.107.13.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3221de81-f86e-11ed-b22d-6b7b168915f2;
 Mon, 22 May 2023 08:59:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7809.eurprd04.prod.outlook.com (2603:10a6:20b:242::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 06:58:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.027; Mon, 22 May 2023
 06:58:58 +0000
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
X-Inumbo-ID: 3221de81-f86e-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlFlcSWZpVH8gFlWDqIZysr5w7STkODWVX9Q0M3N6ojFYvhVuFcWs8BgMvHixManraDc788IV14m+ADFX65VSPSe3MyUZoZ77DvD07GPPVBscai07gxRVg35Mzs9xL+c9P+SNdWZnRlnfABAolS2n0Gf5RUUKFBws/xu3vpuLGX/z08hiNNzZaqXQHh1MAOSUAWKCwrhbH8+pi9lvzsYnD1wslY0FzLi5z0hAA8UWI6VWcNsql1SnZn6VPKVK/TL5lRN3Sep3E16VgMiOtDW57Ruz1EoVSuhP4+3nGyS9BI7HUm8dFPVrf59/8dceuSZ/zD95VDW5RZyHC0p4QTB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xf4m/fNBysdnyou13rBh+lZCp7x9fWpPN7KawNdIYnw=;
 b=jd/TggqwFdCfNh60Yno3rJhG2/zMysRsvFt+POh3dbDG/JwqKsfn08v8sBJvZXTZ/vHXBvT/foHEVcM+0i6sMIuOOJz7ls3FKgJEbq6DbxtZ6VPFjbf0t04r0aHgLiOKG0g3kKnitXJbQSly8k6nHBe9zv9WiiuuMHVx6W/4vdo2SRqSUAw08jiuvyd8LoMnl/0WxB6XgmtH1YOEwz/XlcXxxMJVbZMJtsu1YBo2Ltzb0mHmv4gpQctCkjMnp+3ChGzLv7EITIhCA6jWNKUB0BciCMvQRAD2/u3/LDlPgv67vIGjVNDn7uXkyv4gQuSb264SadkQX59TcarfnmAfWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xf4m/fNBysdnyou13rBh+lZCp7x9fWpPN7KawNdIYnw=;
 b=Z86lSCwySldrtmUXUwiNqA3e4L3cG/gHIuOnsTcfNH+YhaecRObCw5cHfi6vZt+UV6cbafgS68Du25Hdx+Y5zfK4FFMpJgFA0GAWE9wcSiO9AtOy0ETn/7Lmh/cs3kb21LSB24wB7Lca+8+GNBa0yv/an7szxKOzBOuk9hBPtWz/1DN9GtCnUt903UFu0grmHjlj/5OrD2AkHgztQHOtzo/j80yFumZrKgiDsmry9OUxTHyFwIf60CtKW4MmBuKQe4mv8Y2gbnxbYSH+pqPiEUqTGHSMEi50MmLgZ6vfflBkPKBNGmw6QiOBdgIM0x2ZbQBnjPcLprMokejkZ0C2kQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <94ca471c-b12c-43bd-4f94-201756024b3e@suse.com>
Date: Mon, 22 May 2023 08:58:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/4] x86/cpufeature: Rework {boot_,}cpu_has()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230516145334.1271347-1-andrew.cooper3@citrix.com>
 <20230516145334.1271347-2-andrew.cooper3@citrix.com>
 <d5eb0703-63be-0c5c-3fee-37e74e11dcf8@suse.com>
 <9cd79b9a-2e9d-aa0b-3ea2-747a6840f5f1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9cd79b9a-2e9d-aa0b-3ea2-747a6840f5f1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7809:EE_
X-MS-Office365-Filtering-Correlation-Id: c872e349-b555-4852-5497-08db5a920421
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3qz2upgc17ercYsmnVsatERQTRmXoxeb1OdfKKyQ5UdzxOqdTkyaOqJGGPDW/LP+YK718P5Zw09ObF8SrZhJQHin/UOWR999L4jvNiatfJtVWUDty0alpiIBAdxy0a+ujz/9DmCVNsA0QGfir+IjXFZzpQpORygr8BxYWigEwQzvEVWlZ4M3IGu+0/mVoyC962Xtf2DS4TbLv1eWeaEOcgv/7vaJKMWa5Z6Y/EoJizf/5K16kOQxzj3HNdtyMClbVGiBofVUu+3oljFVPs/FL6Mc2GRTCMtBlENPDHGu3LTp1ohwYln3d8xc+239NjPYPbVH1CLfP7LLrSACiUtOqO0NpfMMezx60gki6EX8v8xZEwf2z+lqnltPkjH4YBWht0VsJPMiAOxjov06IyZlE5r15CKiyhSzw+3wTl1oq++jI19SFGvMif5dGqwzsAHm6xwFSpBWejNwniOJyOOIWZ46BG5fSmHATtUKa+pqajonNfwWHiSKW1xO2frTfpdePwTAOPFU5sB6c6tEU20p6Kha3UC6McWvmDIga5UYmn/47xolXdko62GcS/BnFuqBKjHJJPYhzXsDbPWd1HEq2WGPNbb7tyBRhx07X7DULryyDX256BX5QT2fXuJEWLujYTwEYGTlSmnAnnmscuzGjg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199021)(2906002)(38100700002)(2616005)(53546011)(6506007)(83380400001)(26005)(186003)(6512007)(8676002)(8936002)(36756003)(86362001)(316002)(4326008)(41300700001)(5660300002)(6916009)(6486002)(66476007)(66556008)(66946007)(54906003)(478600001)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzBWNDhsVDE5RTZpL29MTVczK1NsdE9yZUdCSWc5RnNlc2prR0pGaGgwVkN0?=
 =?utf-8?B?akdmRzQyMnltZXU0RUhIUnBzeXBjK2FTSDU0bCtGS3lqSDVWQ0JZOWsweHJO?=
 =?utf-8?B?Z2wzelFmUWR0emNsVElpUVRGVkhiVVJ0NXhKTzFNQytBdzlONUd3M3JSVU1o?=
 =?utf-8?B?cHd4ZXZBeWpYRngrL2QzTFJwS2NPdExzeE54ZG10U2x5ZVAzL2xpZjN0NUs2?=
 =?utf-8?B?engwTHh5TUlPV05tSy9LYkxWbzc0Ky9uRDNjQ1hSMVpPeis0R2I3SG52T2tm?=
 =?utf-8?B?Vy9SVjF5c1d1YW0zTmFqQnRGOTU1WVA0eTZ2bTNNMExnb1NjSlFtZWROd0FE?=
 =?utf-8?B?clc4ZE1yNkcrcDVDdHRNS3ZlZGNBNWFtNWxVOXRmUWgxZVVIMHV4NEJXbTVm?=
 =?utf-8?B?RGpvK3BYSG5IN1BsT1h0KzlSajJDN0dKTU1SWVVMM3d2c0tObkZUUWtUbUJS?=
 =?utf-8?B?UmoxV0xvRE5obEtxZFNnajlpL1N0aGI2Mk9TQmNJWU1ISE9zS0NGS040R2tt?=
 =?utf-8?B?Y29XWVc1ODBwU1FTMXJ3WXFJb3dxQWIxQVF2bmJweUN4bDF1OUtNUUh1UUZj?=
 =?utf-8?B?Tm85NjZiKzJaZjlBaWY2M041UHdjc3gwaTZ3UHJmUy9ZRmVzTXhKYjJCYnh2?=
 =?utf-8?B?ZkYzWTFiOU1iTnB1V3FwYTZzUVRXWUtkeEZia09jMDFSY2NIV04yRmNkV3Y5?=
 =?utf-8?B?elFxcWJhcDMvR1V0cFBlN3cvc0dWbGRTSW15UDYydjhxTkZNZ3E4cWwrR3NF?=
 =?utf-8?B?ZnVqaGRWOW52bktIRGpXd2JKZE90OTNKUVJuaS95Z3lTdGQ2UUVLZytHOXZa?=
 =?utf-8?B?cWI0eFFCZzBsNzI4UngxaUU0Q3RQRHM1VERFQ09MTE14clBpMkR6Q3ZtQVEx?=
 =?utf-8?B?YVErQ3dEeDhmT2FHWVJWZmVpN0dWNG9Gd2oxVHBIbmxQM09Jb3Y4U2YrZFhD?=
 =?utf-8?B?NzIyLzF6UTJqTVpDRmNGSmNTNjdHU2ZZaW4yUERUV05BeVRCcW52R0YvM01S?=
 =?utf-8?B?ZkR1Z051Q2Fpc3lCRlh3bzhPRmIyb2xaaXBVTnh3WEp2U2xPMWJHZGpqaU1r?=
 =?utf-8?B?SWZoM0pobllabXJpMjArVnErakdmeG1NM0xtaFRYWnN3VjMxRGlrRGFlUWJw?=
 =?utf-8?B?Qi9mdjFDajQ1OW4rb0pTSVcyLzVxaWJOMzN0cjlmVy9PQk1oa3o3Ti93bENS?=
 =?utf-8?B?SVlLbHZJMVNzN0xJYWtnWVBWRFp4eWdXMlBaUW4vQWtyTmRCZW44UHZPVmVo?=
 =?utf-8?B?SVJwK25LdVdvMnVKM2ZIQWpBS1JUK0pPM0x6K2R1Ny9EUytpaGVFZVQxWk01?=
 =?utf-8?B?dUlVY0ZlM1BrR21URkxJbTVON2JyQXdGQXVoTjhJeVlYeEFWVTJTalhtOG1G?=
 =?utf-8?B?bGtPVnZ5MWdjUWRJcHgyTkxDZTVJdHFkMTkzd0lNK2xIYXpHSElxcXYrNGxz?=
 =?utf-8?B?andpVCt6alFXZ3YzOWg5Y1VUMm1DOGtYWDU0dThOY0dJdkVLcFBNdDhic2JP?=
 =?utf-8?B?T1lCVVdaVjA0d21IMHJIR2dTSmY2RTB6aXhWM1ZZRTJZaFZuWWFyWUFFNUFj?=
 =?utf-8?B?Y29hUk5GUjRtSDh6OXJNVStObDJTVmhkMW9BdlF2M2RPRWNHb0JlakpqNFpS?=
 =?utf-8?B?RndDWHFBWWxZTnlpUVdLbHBvSDNaTkhvVWQyWFdKUDM3NUxLaDhYSENiM3kr?=
 =?utf-8?B?eEpneVRUL2d4Qmw5OHVtNDZxSTNGT3NETVFoK1l2L2h6UDZRc1V2NHh6ZFdj?=
 =?utf-8?B?Q2JRUThOaGpDOVRvempiT1RSUjEwYmRmNUh2NU5SUEl6dHpTMDZqbmdxN3E1?=
 =?utf-8?B?ek0vS2FRczd6cEU4YjFONjhZRHFpNDVrZmdTYkpTNDByaWNvRnlVdXRPQTU0?=
 =?utf-8?B?ZjlYU2VUYTVnc3hEK0d6Qy9rWVBFTkdhVEpMUDV1L0V6Z1JsamtLTWFYcmt4?=
 =?utf-8?B?N3dCTUhkREg1SWM2UEN2R0ZSajI2SCt6RDlEekJ4dDlqRjFWalFRRDlqWlMv?=
 =?utf-8?B?clhpcDUwMk9ad2xwdDJadSs0dWgxMDFZUHhDVjQ3YUdNS3ArdDVMeFFuVkk5?=
 =?utf-8?B?ZDNLWW5NMG5hU1JoVnNUcEROcGlOUVloeGtvQm42SFVDQnV3TmtrTEpzaWR0?=
 =?utf-8?Q?L8yAlWvgPYOr5lz8x4FSSi/tQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c872e349-b555-4852-5497-08db5a920421
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 06:58:58.5638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JOpqB5FU+kbgEtCI+4FebcNM6bObLJ0hSD/wenOPLkKhn9tGRlr0jW8MroMc5ylowl4N8Sm+0cVhT4NOCTIx+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7809

On 19.05.2023 17:24, Andrew Cooper wrote:
> On 17/05/2023 3:01 pm, Jan Beulich wrote:
>> On 16.05.2023 16:53, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/include/asm/cpufeature.h
>>> +++ b/xen/arch/x86/include/asm/cpufeature.h
>>> @@ -7,6 +7,7 @@
>>>  #define __ASM_I386_CPUFEATURE_H
>>>  
>>>  #include <xen/const.h>
>>> +#include <xen/stdbool.h>
>>>  #include <asm/cpuid.h>
>> This isn't needed up here, and ...
>>
>>> @@ -17,7 +18,6 @@
>>>  #define X86_FEATURE_ALWAYS      X86_FEATURE_LM
>>>  
>>>  #ifndef __ASSEMBLY__
>>> -#include <xen/bitops.h>
>> ... putting it here would (a) eliminate a header dependency for
>> assembly sources including this file (perhaps indirectly) and (b)
>> eliminate the risk of a build breakage if something was added to
>> that header which isn't valid assembly.
> 
> b) That's a weak argument for headers in general, but you're saying it
> about our copy of stdbool.h which probably the least likely header for
> that ever to be true.
> 
> a) Not really, because cpuid.h pulls in a reasonable chunk of the world,
> including types.h and therefore stdbool.h.  cpuid.h is necessary to make
> the X86_FEATURE_ALWAYS -> X86_FEATURE_LM, which is used by asm for
> alternatives.
> 
> I'm tempted to just omit it.  cpufeature.h has one of the most tangled
> set of headers we've got, and I can't find any reasonable way to make it
> less bad.

Yeah, omitting would certainly be fine with me.

Jan

