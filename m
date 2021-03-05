Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5098532F04D
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 17:47:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93907.177400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIDbi-0005vE-NZ; Fri, 05 Mar 2021 16:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93907.177400; Fri, 05 Mar 2021 16:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIDbi-0005uo-JE; Fri, 05 Mar 2021 16:47:18 +0000
Received: by outflank-mailman (input) for mailman id 93907;
 Fri, 05 Mar 2021 16:47:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4w+o=ID=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lIDbg-0005uj-NQ
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 16:47:16 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 261ca835-97e0-4573-b077-83ee50fbc291;
 Fri, 05 Mar 2021 16:47:15 +0000 (UTC)
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
X-Inumbo-ID: 261ca835-97e0-4573-b077-83ee50fbc291
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614962835;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=j8sTpc/5AIaapHa7TN4lGNhh1vWXCBF+qWQWQRTTlcM=;
  b=Ar+vOigKcze90plnwTkaxqwkqWwVn9WKWpSDCusO+GAUjWNq+PrX9zsL
   Muv4VVBqIvlfXiRA+OstUwgBIPZde8QQSOa5he4FD8DS/MB31YZgFO3xB
   MBWqng1JJtVemNBxAFWJRBGr7l5vRSRq46Um4wevU/k/iArsbwCWgoz8G
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VDqlEBfzRcO5ta8GCEO/cjTgjNjkcgdtEzjVlvsYfgK1i0uW0xs4mvpNY3AVgZ83I+/RTjy8+1
 G2B3N8L3SjNc/Wz8mFpj8r2FOFWoylKWz4OsulMfhIPRAc60rbgQv2/bpifDu77za2z5YbUuP5
 cSXOHYEOxPTAylbl5C4/VwqKdcWoXW7vrYY46HaRsWvX9NK3JRSGMXvIyQE6fl2l9GFMvPD5jQ
 eXHUoGlOsoZjxe0ScQ1Ft9AGbh5d7cRF+D6PU/+eJHh9yi+//LQC7RxGxwv8jE+SV+3DjyA4wV
 Ud8=
X-SBRS: 5.2
X-MesageID: 39018158
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,225,1610427600"; 
   d="scan'208";a="39018158"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=be+sUobR5F4g568HT7FcPuCnBco8umhAXzS5mHPc6cw9i7A5ijz9i6WngmBtMHFi7p0TvlmTpipYv4axbAvxXW4UEBNYC8GALyxq/U7ZNjodI3ZUjupwY3CmEYcsmlSFz08z1B229aZVw2dfPtLq7zj4GgX5Z8OeHA0cPUEb/9K6XBjUkDnxe+tOK14Y57uhWPiIdD/uvU+Q4jhe8q4H9wPFt1Md703ink6yq83rnmP3V0V5XX3zOAX3mPMarhmjV8rk7mcEKOrdqz2+gKLswsPnsyEDTtEjn/qyx+uoyVyj/jo1esZAFpU7Z7XNWsqBSuduFLflKIxuOSBymmPavw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtuSCxMsLt2tLA7f7eJArRAh9WaD27gFXiZjNLKjPH4=;
 b=oFCTAVH23bD+qrhij+ctcYQUymPHLAZIMiFsOAML8OFK2JG5PA4dFPaNU/x4fgykLTJSuCiUhNFBNF0JuAvBXFEfX3ScGxq0EDNW1lHe/7LdLUSZBRDHRHUFd6nJY73qnYP8UwQrub7DIzzAI/TO+UQe7EGR/+EWf5hRSlrqbyICfiauWTueDtbeqNNC4uvXPubyKB1f2T6LSf1QSZgGd9JflM3/xb4UysuPPulsatL+kQwIg5bsNVyBFN9O9BTdCJzZcnpDQv+8uy1DmsozvLBjSLicT2MtmnR3IOlDKQyFoXDlemu2ZVfUE9s2nb4H3W7doVaiRPpGwBxB6N1asQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtuSCxMsLt2tLA7f7eJArRAh9WaD27gFXiZjNLKjPH4=;
 b=QUcF6RUaajxAepu19Y7A/J7zzoQrdET4iVfdl/mTfz5MEv9N+aJHChuBr1jh6U0d5/1++xsg+mQtjd+cdd6W35ZG3XSLxiPOpmkiaFrGahpNGMP2pA5+cef9SKNFCVHsu8WMDyCKujx4u8C3RDuB8sVpj03ofJ2aqwR+LM3Ieas=
To: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Tim Deegan <tim@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <d0190313-921f-7cbc-4659-9a79f6299fab@suse.com>
 <3bb90ab6-22c9-31d4-88a2-39bd3d81c2d7@suse.com>
 <2e09dfd0-5da4-bdcc-900b-d40a112d832b@citrix.com>
 <24642.24295.466588.233219@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2][4.15?] x86/shadow: suppress "fast fault path"
 optimization when running virtualized
Message-ID: <2983621d-c7bb-3cad-14bd-a26481be0109@citrix.com>
Date: Fri, 5 Mar 2021 16:47:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <24642.24295.466588.233219@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0057.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52a15b9a-2a21-416d-f396-08d8dff65392
X-MS-TrafficTypeDiagnostic: BY5PR03MB5078:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5078469ABC104816122FDEFCBA969@BY5PR03MB5078.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: earu7nZuraB6icTkFMOX6ZB5QhvRAQVZEwDfv6Gg/ILe/ktWFJP/3soCYgcNGSI5BVP0mWVOoKu8LEm//ru5hAVih9rqpC3su1sSuG4n57LDXrgCJW7rXSEINIbHKvUfKZ8j+KErOS3gEl39qj3SxBRC0J8O6nDWRMQli5ZZ2MCJDJVfxm5n0bc8Tfn9Ynwz8pO8Cn8ZWwtawiPafhKNdB7kotUdvmSbzD21tdpguDI6RXoLhBwnYfbe18TsTMchWAlO/ia9BE6sCixiDu/SlxOEr+pLrSeKNkUOwkX3a9QKIMQajdBQVXFwIZusqd2YFsgCu9ut4FWcH/AyFqQdVDps/BvWTX/6lfmB/4fJTvbkagDZEEP2E6ttxxh2x8Rf0jjnn6BjPsSbojYDtGJNujzDzTOev4T76ag+BrvMSJJTr/xHPq4LQs+NSpJaWskQV56ktFLRxBlaNbTqHyG/EO0RDDhJpyOGJcgC1YVeyXtmcrEUJEDIrEz9NGBrejkneajlXn7S7nPXrYNLHiXQtXpYKnqVF/FBLrkrhcHElodrzz3zvMruC1FcPREOlG5oSOk9YryTG7zWv2+cW9TIPBPXcN6asCW6T4uXVJql6qM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(4326008)(66946007)(6486002)(53546011)(316002)(66476007)(66556008)(6666004)(16576012)(186003)(54906003)(16526019)(107886003)(2906002)(26005)(83380400001)(31686004)(6916009)(2616005)(956004)(8676002)(5660300002)(8936002)(86362001)(31696002)(478600001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UmFoNDMwU3UyRW90Vm1sYXB4cnBldzdjZHpBT1dGZzNFUmU5bWNvL1VqNDlm?=
 =?utf-8?B?V1UyTlh2QXd4OTh1QzR5NHhPU3U5S0UwSjk4YllscTBxUDBjRUl4Zk5meUMv?=
 =?utf-8?B?Z25vNTFRcG5aNWRobktYYUpLMWxZTlZaZDhtQWg1TU9ZWWY1NHlxNWQ0UWty?=
 =?utf-8?B?WWRwKzJyUnBUdzhHMDBLZnl6eWJSZUZmZkQyNVdrNmxTMW1TNFdyV2R3ejE1?=
 =?utf-8?B?bHk0c0VwMW9IL0gzWVIrUXNFMzlpZjhDRGk5aEFFM1IwVEluM3VaZ0V0bDFz?=
 =?utf-8?B?a2tiRFJMM3kySGtHYlN0ZTVGbUM3bVVueDR0WnUxSHU0dURMMnl6dkxOdC9H?=
 =?utf-8?B?WERRY0RMZEdaTHNTNGlCaGxPNFZFZDJER1EzMWM1amJMWmI1bVpTWk9WTCs3?=
 =?utf-8?B?SnJwdUJjY052cmFxamFQRnllYlpPQ1JYVUIydXlUS0h6UWU2Y2NvSXNDc3d1?=
 =?utf-8?B?OUVId3MwQXQvUEhaaFZ3UjNndzA1VlAwdWhJcDhGWUU2ZXhxWHYyVml5TEQ0?=
 =?utf-8?B?QkhXQlMvY1ZjOE85UHVBSHpBSFFySVYvNGVCTjJHcVZnWUxHR1VtN0E1bkJr?=
 =?utf-8?B?N2N0VytWWG5weUQyZ1NRdkJjWTNYVGFtRVdOYkJJUFZZRVBsRmYvQVRCYStP?=
 =?utf-8?B?Q1NPajFvQTc3ZG5YTkRsL1BRMjJ0UUZrMmYxMTBNQ3lycmMzV0NVeU1SbC9N?=
 =?utf-8?B?Q1FuUGx6YUdVNjdPS0FTUEd1cUxDa2xOUDFCMXBvSUhzdjIrYzZuTVBLNFQ2?=
 =?utf-8?B?U0s4VytMNHQ1MzFuM1FFcGErRVR6ZkN1bE5sa3R6UG5hZWYwdGc3U2V5K0dV?=
 =?utf-8?B?QkIyMEFBV1lkTnJxWmFoVWY4STlpdTZkcE1yRHZnTkVoTHY4NjBwVWhsUUdl?=
 =?utf-8?B?TDZkRlROVVRKaDgvS3h2eVMvY3hHTjJ5OXlzZHMvNnUySTNKcS9NUVkydUg4?=
 =?utf-8?B?UnBpUUU5WWxXdG52enE5L202S1djSCtITVRGdmdTSmhlUUhDNldhbTBrWm5Q?=
 =?utf-8?B?b1N0blhWOG95dlpFQjdDbU8rWHhqOXZTdXA5enlNYVFIRUVEa1lSQ1VRc3hT?=
 =?utf-8?B?bURGNHZJZ3czeUhCd2RvTHZ6eEpMWGN3UHRLK2lmUHNXcFJQdXNlNEp5SUNR?=
 =?utf-8?B?alkybThUNlZhaHdmdDRCN2UybitjbVlxcHJlZVYxWEtCenAyYy9JRmtDcXFi?=
 =?utf-8?B?aVQ5Yy9QTXhDU3R2RlgwR3NGV2x0bmFZWVN4VGkvcG9TOWdYLzN3cmFHTTJY?=
 =?utf-8?B?SFprbktxcEMxUHkweVRLYnkwYWkzNFdFOVZZSzhSOEI3SVBkeGJjTXdGaVNQ?=
 =?utf-8?B?M1NWVkxITkk4L3lKZ25BY2xESE1oSTdLRXA5QTNGUHUwbU1EY28raEMyOEFM?=
 =?utf-8?B?ZDFhTHZpNnp4akJkeEdKM2JCSXRXdTY0Q243TVFzeDFkdzBZYkNLbnBKalNY?=
 =?utf-8?B?NmpSd3BuV1FIN2VuYkZJdndwRkxuY0JRaUlmSXY4dEYvL2ROdUhxdzBHSHoy?=
 =?utf-8?B?N0d2LzIzd2lBQWlPekhLSFVaL3Mvc1YwaFJiQXB0SW40T09VUEhKTVRpeHI5?=
 =?utf-8?B?ZUQyL09oSEFUdG1JY1ZPdUF1K0VKM1RTMTJlaHRzY2RiZ2dkM3RMalhseG54?=
 =?utf-8?B?NU9KbE5seTdmN00xNE8vWXRiL3dITjdmMTNIMjNSZUxUNU44ejk2NGhsd3V3?=
 =?utf-8?B?MkVxS2VONGFDUkd5c1JTT2oxYUp1YmF0MzVHZDdCWWZiRERkZDFML0pPYXNU?=
 =?utf-8?Q?fOWNTlOGaPNO3xwYMWuMep8sfNgmMsO6WqQWYEx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a15b9a-2a21-416d-f396-08d8dff65392
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 16:47:13.1363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6U7Ek25cLKJYNhhv+Jyv6ocmrn9T7RXrCMdQw6VAIrGcGuDCOCntqlfIy7J2gL/O+gyZaNTLeo4jFwZ/NoKJ1AP3KeRFylKsSjGrq9MKscM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5078
X-OriginatorOrg: citrix.com

On 05/03/2021 16:40, Ian Jackson wrote:
> Andrew Cooper writes ("Re: [PATCH 1/2][4.15?] x86/shadow: suppress "fast =
fault path" optimization when running virtualized"):
>> This wants backporting to stable releases, so I would recommend for 4.15
>> even at this point.
> Can someone explain to me the implications of not taking these patch,
> and the risks of taking them ?
>
> AFIACT the implications of not taking 1/ are that we would misbehave
> in a security relevant way, sometimes, when we are running under
> another hypervisor ?

Correct.=C2=A0 Specifically if you've got a migration pool containing an
IceLake server and something older.

> And the implications of not taking 2/ is a performance problem ?

Correct (I believe).

> As to the risks, 1/ looks obviously correct even to me.

I agree, although Tim has the deciding maintainer vote.

> 2/ seems complex.  What would go wrong if there were a misplaced ) or
> confused bit-twiddling or something ?

The bit twiddling can be independency checked by disassembling the binary.

However, I have some concerns with the patch as-is, in relation to L1TF
/ XSA-273.

~Andrew


