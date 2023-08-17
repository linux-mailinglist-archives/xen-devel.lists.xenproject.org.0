Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4161177F77D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 15:15:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585434.916554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWcqg-0001Dh-6v; Thu, 17 Aug 2023 13:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585434.916554; Thu, 17 Aug 2023 13:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWcqg-0001BL-45; Thu, 17 Aug 2023 13:15:38 +0000
Received: by outflank-mailman (input) for mailman id 585434;
 Thu, 17 Aug 2023 13:15:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWcqe-0001BF-9M
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 13:15:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 263bf4fa-3d00-11ee-877b-cb3800f73035;
 Thu, 17 Aug 2023 15:15:35 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7252.eurprd04.prod.outlook.com (2603:10a6:20b:1da::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 13:15:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 13:15:32 +0000
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
X-Inumbo-ID: 263bf4fa-3d00-11ee-877b-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzxDgLer8ps0o9sJnu7D2XK3t7dmt/Z7bwcZF2JGOUUyDcu5QTvnUCKbIhXg6JTzVdBa7hXVccFjfod1hnPnouepjHvVhC8cdzhBbMJ0w7kxGMW/D1F00e/vWpBFuUp5Rgh9q+Nr6QpPNACUSP9+CNqZVIE2YB4H+qXiEmKEjd6PV91JynmIgB8bvWaSx1IRwWIt4CK1qVKLigZDtXZF9CBK86r7FCQLiepOJZ0Z/+a3Gn3+zbVdDwhegKLgV3QrJOXzaknGvQXIK5E5ONicZY8H2xfSwH8Ko3FAAVZyEWMnkH/IeBcMl3nV7LpM3z0bMvW4U5UyiTmxbdLychUjcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNW33ypy2BGVp6BXdLpDN94RzQIMtzX+Zmww4joZ3K8=;
 b=lXca1QSCoIEPRYjUNOHpPEs3Tpof0RDfx1k9Aq3XI+hoK4PDkt8YhT6yuS60NWtN7qDruUcuvoZrZFRt8xwmmiuQO8hPPqu4eLm9yQrU1Q0ndrf5ukDKyKEYmpeeJrMfr1qa6sLzeKAJiZbZ+h1jGr+5/k6xeqaxSqwH8CMm1mVFtyoH20feqQaAcmL8QGmVcMX2vI7xZ93XebZvVUJ/T+0OqpDAU1CLcwXLDZsDIkvKiEeim6a+6FHekvrR7u0iF/4ZoaYDgrm6/sAcDnI3G1ILLeaBCffj9SIoEq9b/XeZSJpWogabUAGFzN/Aj7kV+5r8f+/W7spesdxJYdAmlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNW33ypy2BGVp6BXdLpDN94RzQIMtzX+Zmww4joZ3K8=;
 b=KBD0Y71MiFqKJFT7rbCGP0+hroDV/p0ygV6irWXOA/t3p4CNk8rxSB8zq4UDjdZ0c67xg1GMZYXLd/+fCRufkHTDyDzvR5nTT0RQ0sZww86QDPurTJDl/YX0hYAvvh3Bp7sL6l+/fkmV9+HeOON6Pr/6GEP/4efTgfBpvekt1XfY/KZGaoewyfJ5sW2kCPzbGB4fMieXM7peI4ODjNhOBGT3cdIf1cOp7bhJEpI6Yk4pC3J03Jzv8TLcg8ZfCnPdrF7FEMLqxvl199yX86hbSD9cbl06fmCEqbnKq6wUDlXqIuUH+ACljo4MDvgNUkLzGHSzQgbe85Q9bGK38X71wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <60ee47f3-f424-6f4f-ae81-6322f0e0541e@suse.com>
Date: Thu, 17 Aug 2023 15:15:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] x86emul: rework wrapping of libc functions in test and
 fuzzing harnesses
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a67c2fa3-ba1c-3783-c3ee-250aff6903d5@suse.com>
 <defbf6e0-28ee-4276-7535-0ed2e23ededa@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <defbf6e0-28ee-4276-7535-0ed2e23ededa@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::22) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: 347e7f10-a900-4cb2-fef9-08db9f240951
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+lCwkMAxTyRbeD+Zz0cy8xA5KmcRIfGmhp2DdyhXMwD9Zswhkth+FmAArb1get6KSO3QhU2y0RsWnWVSRkQYsEyB6iVUTt/4A9ABGcgb4oWfJs/QFlE3/uu0Gly5JbD0ARXtbYdVmZAOU3eyZ+hK0Tu0QBKfwaQvQT9ti8Po+MMxHAUknawyi81tyApZDlUk6huil3zy7Rwdl5SlqbDBfUmWPS6UI5eRFZvjk+xRDp+1PcKr/PR5cQGd8ehalEHxpLLwcJV2ZBnwu/YoLoLXNamJLkHjT3Yx/HEemCCcQDwYXITd4RL/+bnnqB2cWKqQ88Dmo9K/aNeeWVtSqhTHaU3Y9CuMaK2Y83Ho+BPfzq7Cdkw5+5HFnF+6VDgOVtcZBjyWM37ks1afGKNAtd+GpuF9qmoBi+MN/8zTNeui2B7NvVmPdRWUZ00TVSLfRKCuJrzNWMF1tx4/pS3euRpeYcsBtrg+JeBsXQvPX/iQf2piIo5u3GIcUKg4sVDwC2r0MXO2fgo8BKnNUheyNIpmLYloNDbG/17FKVRsd2or6A+yjNi25kqXXXCRJUkTNU5R1mogDBTAkwWEqNo7L9B0ftbaHfFfIhverYuKY8Sx7p5uha+YOOr9McjR/T7kQfgf9WHXCwiHtVsTxFiALOA7Sw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199024)(1800799009)(186009)(31686004)(31696002)(86362001)(36756003)(38100700002)(5660300002)(2616005)(66946007)(66476007)(478600001)(66556008)(6916009)(316002)(53546011)(6506007)(54906003)(6486002)(26005)(6512007)(41300700001)(4326008)(8936002)(8676002)(83380400001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1p5RE0rOVFDU3ZPalRpS05KaEdycUJIcU1OS3UxN0QwbFpsbnlUMFZGMTQ3?=
 =?utf-8?B?WnArWW5wZTZzRXdqSXFCWFJ2eWRrVW1IMnRweWRmTlZZRzQ0T24vV3dPRlV2?=
 =?utf-8?B?akkzUmFqaDdCQTJjT3FEUXNrRldSbGwyT1Y2WFVoL1pmRXVqVkt2UkRyRFV4?=
 =?utf-8?B?THJCVktkMnZxQnhWUytzanpyYzFBbUE5bzQra3VCMXYxc2ZJaHgyWnErMXU2?=
 =?utf-8?B?USs4eU1WU0ZCellGblVObzhCQkZ6eE1aaFJhMDlGWnN6dG1xRittVlNTNkda?=
 =?utf-8?B?RloxQ2VNVDFnSXJ0U2JFUGdFL0czZm1jT2U5aWZ1QzVzNFVzaTJYZXA3Q0Z5?=
 =?utf-8?B?eUN3WlRXRURhZzlGQU9NMUVTSW1xS1RlYVVOUHluR3lGSWRyK2QvdVB4R09F?=
 =?utf-8?B?dHMza09KK3RaTUJ4UFR4bUZBMGlTNUFjZ2gvN05Xb2dhSmNGNWZBUnM1U2ta?=
 =?utf-8?B?TXhNSEU2ZlFFZkxRdnNXUVpoeVY1L21MMFQzWkVYT2NYZEFZbXVJK2JGU0di?=
 =?utf-8?B?ais5ZHpHdlprWG1HN1FZbDZZUlFzdnFMUzlQakVEb2tYVWxOSE1mQnRvak9V?=
 =?utf-8?B?NTU2cjhOSFYxVU00L1B0TzdUc2hVWWNkODFyU0xEZndETVFDQmJxcG1JTnR5?=
 =?utf-8?B?S3I3Sk5Qb0l5KzdEZHk0MXBrYnpVTHhLQ1kxU1dHcVRRbEh6RmdGSWNBRHVy?=
 =?utf-8?B?ZzlzYUl5VlA2TkhBdzc1d1psWXJJb1pUSWQ2VTV0UTcwc3VwOXdRT0tZc3Rm?=
 =?utf-8?B?UmZ0ZjVURysyMXRnMWxWTDVXOEJiY2FoOHNoOGxnL1RqZTZuZmtXL2IyZjJu?=
 =?utf-8?B?S1ZTZ3ltQkVYK3VBU09OVUFBTEtPMjVscGNNZTFncGd1c2V4c3B5bTdlVkZj?=
 =?utf-8?B?RXphbUxnVDF0enkwQzFUNmxQWk9GTHJqY29DNEVUYjNOemMyTkc4ZzByM1pv?=
 =?utf-8?B?T2JSZVJGVzdabm4vUFA4Sy8xRGFtemwrY29zaGdRVGkxaEczL3RKZGhzd2hG?=
 =?utf-8?B?QWJJQ2pNVG90RTN3MSsxc3JvU3FrRitEZXBneVBERkhRWjl0WXl6dUxXSm1Q?=
 =?utf-8?B?aGFpY2JVbjRGWXpmcUJKNk1uSGpSWU9mdDFGS0d6b25OQlp3N0xteThUSThE?=
 =?utf-8?B?WDc3TEdUeVdwQnh6c1VpQ2hNQkxMaWY5c2dESTEwcHI1MWl0Wkx0d1d5dlNn?=
 =?utf-8?B?TDdHdmFKSU1kN1ZaalRqM1lzTDdGM2doZElmbVZiL1dUK3BWN05GNGlJRGFh?=
 =?utf-8?B?NXdJMWJHSXJVR3FqMlVaY2tOMUpEVEhOaXZzdkMvRlNyR2lLUnNIc1cycDcx?=
 =?utf-8?B?ZHBSZ09wK1dDYVc5YWxKc1RZMFdrUUk2bkFaVFhnQy9leVAwMU5WVW0rdWZz?=
 =?utf-8?B?bzEwWnNucnRkUTErTENzSm52RnBkdzdJcnVydkMwZytTVjB5TUZmZTdaWjV4?=
 =?utf-8?B?a0lzY1ZUTWRIR0NTbjFxUnRLUnhvSFV5cm13SUczMi9zVlFuT3IxY213ZjA2?=
 =?utf-8?B?SDhkbEV3MnYwdE56NzNLTkZyZURYcmhvb293dGZaSlc5R1p5U0xWSzB4bWJI?=
 =?utf-8?B?YjBhSkVyZXhPdWVvcTJSd2FpbmlWZ1puUU9NcjJPckxkaDdWSXgwa1I3c08y?=
 =?utf-8?B?VWxLSGxaaTl6N3VTcWhZZnY3aEZsYzdlelJGcmN5UFVsd3IvVEo0NXRTQVcv?=
 =?utf-8?B?SjBmYXE4RWlSQmNrZ1BPWlF2WkVTK0x3M05ydlJEZkllSjVSM1BkcjAzWU8w?=
 =?utf-8?B?N09NZTlja014aXdmRWttN09yNm93YlpHczRja2IxZzQwK25LMWExRHovbWRy?=
 =?utf-8?B?dkpRTFJ3NFhZbmV2NXM4Z2hoaklHS1FyYmVneFdOZ3RZaEp6ajFYUlNRZVZ5?=
 =?utf-8?B?cHNrLzhBd2d0QmtUaTBlNVZlNE05NkxXbXMvVUYyWU0vWjE2dGF2WXM3SmFZ?=
 =?utf-8?B?Y3kvMkgyYTZQWHk5UHlBUk9VTHc4TU05QXVBRVZ1cWlrelZzSmxzQVFzK3BI?=
 =?utf-8?B?ZTBYaFB2N3l2SWpORVF2emJTRWkrWFNoR2l0VFBZS0pZakIzRkplTDkxa2x4?=
 =?utf-8?B?YStEbk9icmhLUU96Q0hhallseGZYdlFjcFRNUCtLVUVSWUF6Vjk3d2hlY0pq?=
 =?utf-8?Q?ev4gWhIxwruBKrK5eTpzJUsMp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 347e7f10-a900-4cb2-fef9-08db9f240951
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 13:15:32.8878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2ABpfDf/FIphcJnoBs67J2h92LsZJdE1z3HrFkLrAaqY7FUBwY5fvVH4ZgqxGNvS6B1UcMRGjqFRVg7r5ae8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7252

On 17.08.2023 14:58, Andrew Cooper wrote:
> On 17/08/2023 12:47 pm, Jan Beulich wrote:
>> Our present approach is working fully behind the compiler's back. This
>> was found to not work with LTO. Employ ld's --wrap= option instead. Note
>> that while this makes the build work at least with new enough gcc (it
>> doesn't with gcc7, for example, due to tool chain side issues afaict),
>> according to my testing things still won't work when building the
>> fuzzing harness with afl-cc: While with the gcc7 tool chain I see afl-as
>> getting invoked, this does not happen with gcc13. Yet without using that
>> assembler wrapper the resulting binary will look uninstrumented to
>> afl-fuzz.
>>
>> While checking the resulting binaries I noticed that we've gained uses
>> of snprintf() and strstr(), which only just so happen to not cause any
>> problems. Add a wrappers for them as well.
>>
>> Since we don't have any actual uses of v{,sn}printf(), no definitions of
>> their wrappers appear (just yet). But I think we want
>> __wrap_{,sn}printf() to properly use __real_v{,sn}printf() right away,
>> which means we need delarations of the latter.
>>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> This does resolve the build issue.  I do get a binary out of the end, so
> Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>.  I presume that
> you've smoke tested the resulting binary?

Oh, another question: Because of you asking it's not really clear whether
the T-b is kind of implying an A-b as well. Could you confirm one way or
the other, please?

Jan

