Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 423C069E1C1
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 14:54:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498945.769914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUT6G-0003RL-LX; Tue, 21 Feb 2023 13:54:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498945.769914; Tue, 21 Feb 2023 13:54:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUT6G-0003Ob-Il; Tue, 21 Feb 2023 13:54:32 +0000
Received: by outflank-mailman (input) for mailman id 498945;
 Tue, 21 Feb 2023 13:54:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUT6G-0003OV-09
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 13:54:32 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42d6edf3-b1ef-11ed-93b6-47a8fe42b414;
 Tue, 21 Feb 2023 14:54:30 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7937.eurprd04.prod.outlook.com (2603:10a6:20b:248::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 13:54:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 13:54:27 +0000
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
X-Inumbo-ID: 42d6edf3-b1ef-11ed-93b6-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQSCL0fT9wusFuybQlxVp7I0Rl0K8lKj0EyfabK9I8rYt238E83tcK0fX3IdSodDC6ei0faKWUGtg3X3VZl+j+kIMv0skxuulwd5higzHCFu7QvlVqG5Klhb5Cxt7hQfaNrkAmULOKIEk3PwuIHbJTpEpTYNskqD0vmt/QNN1XpHuLyTlJvBJCcvRqC/LUOan5M1dnwzfH37C/M6IGa5HjFQc0J68pyTQuWNyftCltN+0NF2W1FTg/0Amdh7gFkfL42F/6IgW4riHR4rV10FoCZ+pFKrJtwuUG7UK6hnr/5kpS4zcLqwcWVJWwGqaqqqYwInVu7kM7twvdKa3sLfvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVTJvYTKDnQXBucUhW3cMkKX3h61OEW67kbmqIYv/Js=;
 b=HSJKO2arEXReO2nkt6dSloHS/IzAZ7Fia+RAJCOmTUT30AEoXhr0ZVkhfO0bPWyGvzMyNpbWm0pN9xsvEANWaW8EVBOfS2UQvUUZbKpZ2h9awmesMWK5GKK0H6iQTk21O/xJ7E3nmrTFtLcruVJkNjhGszIXWHJWWuXAVGcChPySpl2keYvcwrTDABAk2aWoMqhrYhNZ1V2Lx1ovHKHPUdtv8e3yC3YsXGlgaO105So2fHkbZSCGO3xRwrnFO9i52PhL1W6q+rYUM3H2sCkm6dyW+EoRQ3xzxeBCfnumb7CjI9ytrnEm6oxQQJVlzNPFamFu3Eg8SIsmZLe/0lQFiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVTJvYTKDnQXBucUhW3cMkKX3h61OEW67kbmqIYv/Js=;
 b=Vj5dwczGGRtzl7iXvPKaJ7cEYjpmrTZo5SY7+be+U5xD8/nvxP/R5wBeQiylW/7ct/XFQJk75JVmOtccsi445SN2hCsGQBvLgtnTnxrvVIEytvu5/PUERpJWS8VSi81UjAyESDaBCZxJtYdWcN4J58RMiPT723kHppQq67huXE5f8FO6Q4LjsBoMla9MqjI7mN/U6BRfbe09SE4Aph6n7Mkp/geNeZXgk+w9kVmOH51g8JZSXu59Tm0J2HFZKHtYcQiPhO2kXNLmfb43WpvqNnxe3wo2u2viw1fAbM3o2f1IK559jMFhva7zMtEWf5dAE+cs4p23Km7puQoM6CNCCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2692e97d-b3d6-6512-bff7-c13941c10cd4@suse.com>
Date: Tue, 21 Feb 2023 14:54:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] x86: Perform mem_sharing teardown before paging
 teardown
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <a7df4a01d7b901eb7b43be08f6fd3dce82ebbcd0.1676480656.git.tamas@tklengyel.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a7df4a01d7b901eb7b43be08f6fd3dce82ebbcd0.1676480656.git.tamas@tklengyel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7937:EE_
X-MS-Office365-Filtering-Correlation-Id: 702276a7-c929-4a51-96d5-08db141325de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	33ES1B95OstajfYOuIWYWBTMgIJ2BBnOFJL5v0M+Z5Tbs/4Qp1LjvajRtGQ1ofhC7XjT/Iv1XI+qYNxsQlktt33h31h7JfyCM0zqpA2ICmgDDrtoZVJUDDFonQpu0yWauYB01bgKjeX3lIlJB0bPUNN05awwNpqhkkR0yh/tEkzX7ZJlH729NGkm1Y2RPPKTbSwiNs9bWtLXrTcAx3WQ9PZHvgNstiuNdIa6I64XsVZZomjFjjCalq8VTkldCQrsRi6SbTB4QOlNfv7RAQou2bnjJW/sfAdbhKmMB9mhtWgt3j46MuSaeEifyKuIhOOLF64qhhKTWpM4dFOyIbjErsJ+i5P9d8zjeGnxGyCLMHiSMLQPnFQ5Mm2+PSXn71GDEoCnR/CaoC/sBQDFUhrFShNtUKJusAAbxwuOXlTDQWa5kF1FkcUj2z0ARAWNpaXnM5lZNRPbmc0wsw+GssRqtfse2JnWSndFFLT0Ou9b7QxH1gYbK6ATiydN1PtffroU27+UTUbIBpzA4d50cQHzmHpmY5PX0ns7R7cx2TchIIbE2OaWjgYzHPpwmMFZPbabVkM1kg6Ero4GN1z4fblS9pKEiM5YayZsz0JtUiZ+UIzTBg6lG5LcUiMPrN4PZCHsi1JICqAVUPg3fdAdaLXyU+IhK8DeJvTfZozA35sXor7C0xGdffGSq6nzhWq6MZFEXSiCrsQc/2tieW9jlAvwRpqzx24tcp0NSblNALdxP9U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(136003)(39860400002)(396003)(346002)(366004)(451199018)(83380400001)(41300700001)(54906003)(186003)(6512007)(26005)(316002)(53546011)(86362001)(6486002)(6506007)(478600001)(31696002)(36756003)(6916009)(2616005)(66476007)(66556008)(8676002)(4326008)(66946007)(2906002)(38100700002)(31686004)(5660300002)(8936002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2pJYy8wVjdCVGtkT1VnSVk0UitzV0U2T0FQaE1Ua3N5YzFCb0NkT2FpVTdp?=
 =?utf-8?B?aFNneXAwQy8vOU56ckp5bFRvTWhzRVRYNG5UL2laaVJxd2RDMGdsRnppVnBP?=
 =?utf-8?B?dXZXTVpzR0VqZWo4a1l1R05HK2k5WTVDS3pnK2tJdnRuQzFTWW81RC92ZS9s?=
 =?utf-8?B?bnR1clVYdGFueXhoMGlXR0Jaa2I4akY3TDJPT0xkbFRmWWl1ZDhLUE1MRnQ5?=
 =?utf-8?B?WkRPZDdiNXdlMW95eGpNbzBNVGdTSjdtb3VVK2o4VjRGQmhSOHp5RzJkMCtS?=
 =?utf-8?B?ZGNLQUZrZDE2b3hLdW9MRGJWM2FETkk1TTNxSHFHazVkN3lEd3JrVmtHSTVz?=
 =?utf-8?B?Z09xY1A0SXphaTlORGFja3NRZ0VUSWtPM1VJMlF3WXpuOXl2a2s3RURPZE1q?=
 =?utf-8?B?cE9GUGdwS01VUENaclNTYkR1YVhPODZtZjJ6Qzg2dnRkK294MDNKT3JGNzc5?=
 =?utf-8?B?Qi9ubkw4ODUyaVpBWGdmMWsvdDFXajd0THgwWUw0UjBSTlI4M0FySWpBSzJy?=
 =?utf-8?B?TlIxQ1B4U0lLREQvMkVUdEh6cTlpOWQ4b1REZGx4LzhvcjUybG1xeTlrOUJ2?=
 =?utf-8?B?NHpacHBFMkdiZVg2ZkxLVmozUVI5SFNlMGo2cWhCcXVpQTZyZHRHbTNBbW5z?=
 =?utf-8?B?WDc2VE5ldkhJSS8wUVVDNjNuTmlqbUxEUDEralZCVkxwWjdJaXNYSUVtK1hH?=
 =?utf-8?B?ZkErR2FMaHFET2Z0Y2U3K2x1T1BaOEduMXQ4bk90K1VnZjF1MVkvTzduU1dN?=
 =?utf-8?B?eHVlRHdUalF0L0JxQlpmZlJ6VE56akEwUWRDcUMvVWJ4Y254OHgyeGUxeWQz?=
 =?utf-8?B?N1hJNTgwZjVoZWtiZ1VPS2V3WEJnbVVzM2h0TlFQWmMxeUkrUzFWSW0wSnYz?=
 =?utf-8?B?VXVndzE1azNieDZIV2FneGpiQ1pmZkMzS1RZVlpPK1ZGSGgrR0hhN05mVzRV?=
 =?utf-8?B?VEJKbDFLTTJUOGYxQkJsWGRlcHdMSkhVQmtnZ3dwenJoWlQzbjZ0dTI1TGF6?=
 =?utf-8?B?d0UvQTdzcnNkU3pjbStZOXVNaDQvMEw5b1dNTmVGYWpLdzZaRzNxWGkxUG5h?=
 =?utf-8?B?WXY0UzdjeVlNNDYvdmh2U25BZUVyb0g5cVFZS0owOEpzSzYzZXNBa2d6OUNC?=
 =?utf-8?B?MXpvZDBqYXc2VG1sekVlVnFFOEhMQ3doUDZMSnRKZUxpSE9aME8xUTd0d2l5?=
 =?utf-8?B?MXlJUTNjMFIxZFkyOVM5cDEyMDc5L2xPQjVSdzlYUktEbUx5SXVFK051bklj?=
 =?utf-8?B?cVE2bmhnQU9NRFFWcy9INzhtcFQ4KzgyWTFWdlN0T2YrVVg3djN0Wmp4eWor?=
 =?utf-8?B?dzRieHFVcHFkcWl4WEdENjJHYVVFTzNiSWY3UFFjNHFoOVR2R0JvRHFSaFRE?=
 =?utf-8?B?Vk9lbnJTRi96aVBPejVDbUxZOWFZT010ekpISkRXQzlnZUs2MmN1bkU5OGNF?=
 =?utf-8?B?QkhUalZob1pUQXFBWHQ3V2dSRTRsMSsySTg0cFc0clRodndMT2cwNW9CcXN0?=
 =?utf-8?B?a0JXa2p1dlplZytnS2RWWFpYQUt4Mm1ONG92cWtrWngyMkRrZGVxWjI4Slh5?=
 =?utf-8?B?eUEyVnFkYnQyVnk3NjhpdEZsODRqR1pDU2tUcmJFb3pqdUEwc0JOZnFYMU8y?=
 =?utf-8?B?SUhKU3o5Si9xWk9LNGNuT1JVWjZLMkFLT1dDYXJZNlFWNTlWM3NCMzMrNkM3?=
 =?utf-8?B?bEtsSVcyamRUcnU3UUZzWkp2SHFGZVFmTTdpaWhRUEhXQjZyNmVwc2oxdlRI?=
 =?utf-8?B?UnB2MDJwQXNtWnhOalBkQldBWTlieGdEUEw3RnhLT3BkZnVFKytFTDdMSGMw?=
 =?utf-8?B?ekRZeXNER0dNS3oyMXRibXZIRW9YaG9QaCtkTlB1VWNDTnZzRVRWVUk3MExB?=
 =?utf-8?B?dzJYRjNUZ0JkdVl5b0FJMmtGeC9Yb1VoTDZVZ2N0WDZtQ3NJcno0T1JhTmxF?=
 =?utf-8?B?VUpZSVNtQzRpZURNVDJZa01FbnV1THlwYzdtNFR0SVk1alRyWTdheTJaaW41?=
 =?utf-8?B?RVY1cWFvMVBsM1Vzb1RPMmRRWVZQTnlOS1VFWmNRVWJJQ0dwVSszZEtsQ2F6?=
 =?utf-8?B?OHlrRTdPbkNsSi9qTEN5djBRdHBJdTl5UVhIT1hKZjN2dTV2blNsZEVVcDdC?=
 =?utf-8?Q?Jcfk4J5Rs9KqesAoYNe/GOLeb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 702276a7-c929-4a51-96d5-08db141325de
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 13:54:27.6585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N43O8fo9iMaKl05plv1Sdf8PgYkicRIZPkx2yjsS9rksMuPQSg03wU4GYizkjvSVpjdP3/4koyqICYhK8zHz7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7937

On 15.02.2023 18:07, Tamas K Lengyel wrote:
> An assert failure has been observed in p2m_teardown when performing vm
> forking and then destroying the forked VM (p2m-basic.c:173). The assert
> checks whether the domain's shared pages counter is 0. According to the
> patch that originally added the assert (7bedbbb5c31) the p2m_teardown
> should only happen after mem_sharing already relinquished all shared pages.
> 
> In this patch we flip the order in which relinquish ops are called to avoid
> tripping the assert.
> 
> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> Fixes: e7aa55c0aab3 ("x86/p2m: free the paging memory pool preemptively")

Especially considering the backporting requirement I'm disappointed to
find that you haven't extended the description to explain why this
heavier code churn is to be preferred over an adjustment to the offending
assertion. As said in reply to v1 - I'm willing to accept arguments
towards this being better, but I need to know those arguments.

Jan

