Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D084678F0F3
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 18:11:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594025.927197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbkGd-00036I-9b; Thu, 31 Aug 2023 16:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594025.927197; Thu, 31 Aug 2023 16:11:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbkGd-00033k-6g; Thu, 31 Aug 2023 16:11:35 +0000
Received: by outflank-mailman (input) for mailman id 594025;
 Thu, 31 Aug 2023 16:11:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xL7T=EQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbkGc-00033c-3P
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 16:11:34 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20603.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c6e178a-4819-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 18:11:31 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7347.eurprd04.prod.outlook.com (2603:10a6:20b:1d0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Thu, 31 Aug
 2023 16:11:29 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 16:11:28 +0000
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
X-Inumbo-ID: 0c6e178a-4819-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnnMsx+wpJhRkj3+ed6mYC0KeVvPmZlKkpbFptfg5htMFV5ki5Mqlmrk9+bMo9VEyJKJoqONYAQhVRcM2jSgvE0WUhuyeRSPNBnnqOLfgEESItlAWKuEO80+A2QY3UaxSU61sMqjaIYXamgBoD0TWPYokM1+P9xNEw0jzcVSsW4aQ5ZoDcrD9UDN6K5qE2UjhdAp8PATskm/gfr27RbW6SEs8BoQ9ljFy9yWLlRbarhT+cDTNyYWdQ9Bqyzzx8m/og4PsJ18hAxOILJbqYEnWBp49ILSBr19Ba1CTMFSmU4tB2I88UpLY4UWNewD2Q1qgWhSa6jxobv4xFJ495FQ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4secnyOR9xjOEmdLFhXnwxRHt1I72HTXMJCoq5dR7m0=;
 b=c5712NtdKIEb1NRuwSZuGubXdOwzZIGUJmmpYPB8ECh+kSLImiy+TDYpH6Ka3jP8+Z+xaRbLr7Vw+qxeKQ+9RVTKCqUFnWb4yxo+ErDGJUenEzz5vkePXPSmphfkrTGa2a0IpT3Wm6qNajiHh9X4fi7HL5F7htUNakFYX7HOaX+pTEh4Z4sdsOzrdbADJ0QnNMp9zmwqXYMj5/yrissbR56zkjnyffjR6ZArbCuAdarLFf8VKNrFBjntY0MEg++YyWrWVvxurXaaywl8sywFhS7X89JcY+CfhgZsJ7qTBVUPOtAYTElloxqusouhJRT6kt0hPEd1Qjolnr0XCW6JSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4secnyOR9xjOEmdLFhXnwxRHt1I72HTXMJCoq5dR7m0=;
 b=Tr8DrojFAIfy6X7yWqKfI2zMZyEsHpPtwQVsqwS5qT8t+XOCAdfgSmNZewoTRX208khDUzkQTdTmwXRlVqOT0CnkWv6bk/CYaeIf7Dd6gc89yHq1f4K/UgPipYQOaGspUbctnH6fRrCN0Rl82rhZtCaSBMmL0pj40oX1azJGsz4rKbgQjjg+5bPgdsYSkJl59H2pyXtdou+89OZJ8CYdAC8cQAmto41vogYKonTm9VSx0iCkAkbiN7dgJE+qI+Fpm2sza1S6My5lg0056rkLY7SdeAdWQ072/W3ypVW5BPHBH5QxVp2x7gLFbhWq1EgbmBgtZygnXZoA0hf9mAGfKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <926bf22d-de80-d19f-2b76-1a8eb7d9e26c@suse.com>
Date: Thu, 31 Aug 2023 18:11:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 2/2] xen: move arm/include/asm/vm_event.h to
 asm-generic
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1693414172.git.oleksii.kurochko@gmail.com>
 <ee7c3aa566dadd9350f39f5aedbfce3ae72ba663.1693414172.git.oleksii.kurochko@gmail.com>
 <3a165375-0dd2-9a3b-403d-2306acd60b92@suse.com>
 <03d68a602592d9f542936ec7b5fc3b33777720cf.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <03d68a602592d9f542936ec7b5fc3b33777720cf.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: a479f18c-6fba-480d-214a-08dbaa3ceefc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l7CaBIJEDk+MvqcCJc7HmpBzdwLPLuzY10s2zMcnqweBu5974OZWq+OF7CDqTwPdcttSrLV5WIBWDMv7IPu8jdGC2SeAJrpelFYwyFruvBw/4WtfDkis4SKXzhX3sNTFWUXRTISwulyOwW/B3vXMpt3xcxdMxYVAjysbGRjcYASb0+WzBbZlWqfFyO/mXdSvZ4g+aGf+4n7AlNRCcoXIPQ9WM8UAFYSp+WN32VM6PBxSv2RLYetvmVYJxOI1u8kNt18Lt59HQFddZ6fyU21m6YXTdVQHi67bIyJVR2daj+K0mrQ2tK50bGKyjmlMsAz4rumKt7gyMfVc8ogvBSdkveYhKod2myUA6SIB0Cw7PLVp7TIePXlSq2q3gyvHAGERcxsVGDAiJO7aRj8crqAh4Rr7EyGEq9gF2OKxrRVtS+bISOzXCXzdO0G7Q2EYr8aNAFOhM6UXxwQIJQfJCKiEZFGNI+7KFAr4jxCNRhwqJd0vwUBYUAdjnntIiSYqPShRYRsx9poVU1Z+xtcHzUMLpuR8y3565blu2MMT6/rccpL/9AwywYMhliwvR55xn4LmCdmc2qhGN00zEf72YJyv08l/LRhaXeHF9x0IdHjk2kAuVhwkWahJLuKc1Q/zpHgTVPkBx22VAe50+sYMYJKMafWih5RMH3QoHfQ3SDOrA7Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(186009)(1800799009)(451199024)(478600001)(83380400001)(26005)(31686004)(2616005)(6486002)(31696002)(53546011)(6512007)(6506007)(5660300002)(66556008)(8936002)(54906003)(6916009)(38100700002)(66476007)(2906002)(36756003)(8676002)(86362001)(41300700001)(4326008)(316002)(66946007)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bndqbkV4NGkxK1F3YThpMWkwcGM0SzZSN09obXUwOHU2TW9pTlBvVlNnbVBC?=
 =?utf-8?B?SllHdzhNN0s2R1lodjNHSndoYVRGNWgzYkJwd3RSUTlvR3BscXg4YnFtWWh0?=
 =?utf-8?B?NmtaSWh4MUV2SVR1U2UzZ2pVeDBEVG1heU85bVV1bERmclUxL2tSTktFMlFi?=
 =?utf-8?B?V2FYY2NLRDRsWlJ5c1hQb2dBTmhCMnJhd3NHaGUyeGZIQUhqd2YrTkJ3NTl6?=
 =?utf-8?B?OXZWN0xkeTA0Tnd1ZkFScE9yTWhYM0NHUDZvMjBjcEIwTWNBdnQ1N3hXZDlC?=
 =?utf-8?B?aVprNGw5MmdrcnhZc0FDbytSVUdQTFdaeDdaRVQrT1MwM0FtaUU2NFFKQk5m?=
 =?utf-8?B?V0ZoMDFrcHB0VlJQYUorWTZnQytTbUZBTGxJeGM3NWFYSThCem1qT1NqcFJz?=
 =?utf-8?B?T2dzVmhxZ2hVeFhZa2NOMllVTENpRWlVUExOUXdkZU1nTWdWb1RHaTc3THFY?=
 =?utf-8?B?WFJrU0VrOWN2aGEvaHRnN3RoNlIyMU1abzJjM1B3cG5mUkQzWXFvakpOcUpW?=
 =?utf-8?B?YXhrejlUQmtSWlk2ckF6VDcvTDNEdUZvQlRwUlRwUFNPQzhPbFhWU3JhNXFD?=
 =?utf-8?B?WCsxaTQyQXYxL0NZQUtkWWVxODdUNFpkTC9adTU4alZHTmN3L2FaSzMzUG1T?=
 =?utf-8?B?eTlkT1dpa2llZC8wUWxudWNEcmRNbzhJQm05eWVGWVdpT3BnWlQ1UGFMaWIz?=
 =?utf-8?B?eWlmVXVGT1M1U25IdGp3LzYwV1hYZkx6Q004QVQ1VlBoeHBVN0UzYlJncUVZ?=
 =?utf-8?B?NnRRSGpBaWQrb3pxY21udkRLM2pwODIzSjN4blh6ekdRa1BOa2J6NXIxd2pv?=
 =?utf-8?B?VjJ5UU1rVjBsLzgwcjJCSG1tNDd2MC9naWJGQ0E2dHVHdkR3d0RkNHFsa29j?=
 =?utf-8?B?dFJzaFUvU2t1OFRnb00xSVNBb3VMbEhBODBoL3VDWHdHS2hvQVVsNDgrYWtM?=
 =?utf-8?B?aUVabnhjMHNtWk9IaG1NSElGTWxFV0orTE4xaVUwUDkzKzE0dnFnZUxmUE9n?=
 =?utf-8?B?NStKdkE1MDVqRy9JVVdUQjRLVGphNDRUYTg1NVIzRFhqVmdLUTQrd1plbFdS?=
 =?utf-8?B?V2J0NUtobU1TNDlHSFFQUUtPaG52Q09FTGFQOEI5MGFVd2NUN1lTbEJJMmJ6?=
 =?utf-8?B?L2RMMjMwQ0ZqdkRGSGNBVGpsSVppRUR3UENMbTcvYXJNVzVVT1dmTVU3R244?=
 =?utf-8?B?MzNETUtMVUxKZ1o2dFRMdG1SQlp3b3hxbjZ5NEhqMHJCbDcvZGhMdUIrMm52?=
 =?utf-8?B?U2tlRElHS3NQNHUwemNVQko1QUJ4L0xBbHJtRHBMTVU2aW9zOVBBR3crbnJM?=
 =?utf-8?B?RXlPQTR5T1RZMnc1SEtWSkFKZGNLQlVSOEY3S1V5NWoxSTJ5QTVPbHN2ME9D?=
 =?utf-8?B?VnFPbmx0OXZTUGc5amNDWEJ5ME9OcURRQ0E0NUYxQWdER1lLVFdkTGhBdmEw?=
 =?utf-8?B?QkVyQnB3SUhhRjRGWVFlVXA5bGhSdGcwWVZ1d01uU1lCZTdMZTlCNlRWZGRN?=
 =?utf-8?B?RVcwU1Z2djk0bytoemh6RGxheXJjUzlhdDN5QVE5akRmcGFUZ09yL0JNK3Ri?=
 =?utf-8?B?ZlZncnJ0VklPNmI5cDZQN0ZTRVhyNW0yMENxQXllN2N2TFVFQXlzdXNMR1JX?=
 =?utf-8?B?SnFuSXNmbFgzL0JyK3djeFpxZFllR3hYZVc1N0h1SExlaVFTWXFXWmpRYktt?=
 =?utf-8?B?NFVFQm9QUTRGc1hhT2Mwekp6clBmd1RlUXQxWVB2b3Z6bld3YjFmbWEyNERU?=
 =?utf-8?B?Tkx3UEZPM0JDT0JUOHdvdFN5cnR0R1B3RXJSYnJyM2xKMDFMR3Rra0VBRFpk?=
 =?utf-8?B?d2ZVNythQk5rNlE1eGlqekMxQXBCcjNwWE14Sm5JWnJBNUE2aC9vQStYcEhx?=
 =?utf-8?B?cjRwcVpqQUhmUUlJcTBmWWJoZ0xqc0tTNUtDQ1BBc3J1MXp6MUFnNUZXdXg4?=
 =?utf-8?B?SFJJaGpUL2xkeUNxWnJDYm55elUzZ1M4RWFoU1RkZU94NTM0UXAvUHBRa3Iy?=
 =?utf-8?B?Ry9zTUo0Sno3Y3FDWjBlOTdDOHZQbUJoYWZva3pPbEx2MGtaUVc0RldxL0Y3?=
 =?utf-8?B?TGdDVEt2MStQdEpzbWFtL3Y4MkRFaEFxOGlZNHg4QkttUUN4VTl0c0VVRkNJ?=
 =?utf-8?Q?dbraeB3Z9uCfiqXZSSSnZdVE+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a479f18c-6fba-480d-214a-08dbaa3ceefc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 16:11:28.9355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5AjwpGY7wWJK+i6zDHsI2YIKdUr0KKMg1yMAW4jLISpwM0DwOY5JRijQVCtR7IbEeqJV83Iimj+IikZwDQUoYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7347

On 31.08.2023 16:02, Oleksii wrote:
> On Thu, 2023-08-31 at 11:46 +0200, Jan Beulich wrote:
>> On 30.08.2023 18:57, Oleksii Kurochko wrote:
>>> ---
>>>  xen/arch/arm/include/asm/vm_event.h    | 66 ----------------------
>>> ----
>>>  xen/include/asm-generic/asm/vm_event.h | 55 +++++++++++++++++++++
>>>  2 files changed, 55 insertions(+), 66 deletions(-)
>>>  delete mode 100644 xen/arch/arm/include/asm/vm_event.h
>>>  create mode 100644 xen/include/asm-generic/asm/vm_event.h
>>
>> While it's a comment on the first patch, it's really better making
>> here:
>> Did you look at Linux? They don't put an intermediate asm/ here.
>> Instead
>> see their scripts/Makefile.asm-generic. That way an arch still has
>> control which generic headers it gets access to, without duplicating
>> any
>> of them.
> 
> IIUC scripts/Makefile.asm-generic script is needed to generate a
> wrapper for a header which will contain:
> #include <asm-generic/some.h>
> if it is mentioned generic-y += some.h in
> arch/${ARCH}/include/asm/Kbuild.
> 
> But do we need this generated wrapper header?
> Do we need all the support of generic-y in Kbuild, etc.?

For a single header we could likely get away without. But vm_event.h is
only the first example.

> In the previous patch of this patch series, it was added inclusion of
> $(srctree)/include/asm-generic after the inclusion of
> $(srctree)/arch/$(SRCARCH)/include so it will first look if the arch-
> specific header exists, and if not then use generic one.
> 
> Probably I misunderstood you and your suggestion was to have
> scripts/Makefile.asm-generic which will generate folder asm/ with
> necessary headers in arch specific folder?

Yes.

> So basically it was just a
> question if asm/ folder should exist in $(srctree)/include/asm-generic
> or not?

Not really, no. For "#include <asm/...>" to work, you can't simply omit
asm/ under asm-generic/. That's where the generated wrapper headers
come into play.

> One more thing I would like to clarify is the duplicating of the
> headers you mentioned above.
> But if the architecture doesn't want to use a generic header, then it
> still needs to add the header to arch/${ARCH}/include/asm and remove
> mention of the header from arch/${ARCH}/include/asm/Kbuild.

But then it's using its own custom header, not a duplication of whatever
is the (in the case here) stub one.

Jan

