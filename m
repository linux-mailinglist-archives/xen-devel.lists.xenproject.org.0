Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9CF77F6F6
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 14:59:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585416.916535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWcaS-0005ys-H6; Thu, 17 Aug 2023 12:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585416.916535; Thu, 17 Aug 2023 12:58:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWcaS-0005wk-DW; Thu, 17 Aug 2023 12:58:52 +0000
Received: by outflank-mailman (input) for mailman id 585416;
 Thu, 17 Aug 2023 12:58:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWcaR-0005wL-Mo
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 12:58:51 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfbbea16-3cfd-11ee-877b-cb3800f73035;
 Thu, 17 Aug 2023 14:58:50 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7334.eurprd04.prod.outlook.com (2603:10a6:10:1aa::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 12:58:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 12:58:49 +0000
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
X-Inumbo-ID: cfbbea16-3cfd-11ee-877b-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjGA7EVObMYIWyF9hx2S2rECp8ytDkJvjhDoTsS6DfnrVZxdjlOwR885b7ATOYzg681bykbSNFwJCE1NNC4xPMzO37mXdi/oyQGzSEDI8LM3ZIuoR2ocn0WlmN3NT3z/nY/y6b++HHNWQ0rqC/ZmWUBDSOuDGz40zzbv5Ui7Rc3gC1NnG+5gyUK30TfBv9w/OKENnLmdq8BaJ99WMBgeYInMg68yBVOGshnG9dI1JFIPhon3vbc3h3PtOo/PWHkNUcZhv6P0LG6SZV0WcBipuz4ao5Pb9gREILjGlk+uOAsBmzzL+E2lgi0Eq0TDD5CpEFZCSZ405fl/fpNr0zYG1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZVkbR5kIZLN0V9dYwxnTdHIbzBA+8a3U2HKYICrrGs=;
 b=LkYPg43ZwVhSXffo8tLc7ulcTY7E1m47xw0MWYA/ScSGqyG71NaNbY1N2Xpx4QUjSkJI53j6MVe3RaeF4PYEc9XknfLWrhtq+2Wj6G6a3qwycnptLQr03BNRqKXxspjeJRE3vhP1AsCse/UG8r0U1JeQ1D0ctJhipVJwvlfYjLBr9c8n132hRmgoIQ6SAdoHQyUR0zX6oyHSsjS2Tib7PczWmxK+WNtRjVI3HIREHFXO4nyabAA1MUvhTfUifNk0/gtZc6+yagneGd7gKwYlhCl52SHa5IhWzIJ8zAhe+nduSHwvrbhj4Pxgu5ot8IEaaZKChDf/5pO0ieLJvbvRCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZVkbR5kIZLN0V9dYwxnTdHIbzBA+8a3U2HKYICrrGs=;
 b=YQPtFj6lM8g15CyjcpNRylb1GSHBIy8uMAeSbhGq96dY4b+A0guTFH2Nrd0wlhKWlTNvODdHHUAnw2snzwnamrYo8pCAtLFMqfpGf9+x9XeDTUwXGKafHqB2kwz6VVc83sryY4LonaOXPb4B7k3cT2Kcu7Fih72comMCGSdMjt/5tIxCCUvXtEK+g2vpNVrV8qsMKetbXltx6vtpifZhLu6OlzH9STrTFOooxlFIo7gaslhoz7ROqwWsQdnrcHkW+UjgJBgWanqHxps3tS3e3iL1U5rF7ZpTCXxIYRC344prVcNsPL0qVEu8ycjMrunPtsKSqsQQdwRUF52GrGf/Wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <572523cd-2af7-40c3-b975-c2d144898fae@suse.com>
Date: Thu, 17 Aug 2023 14:58:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] xsm: removing inclusion of byteorder.h
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>
References: <20230816190425.8160-1-dpsmith@apertussolutions.com>
 <CAKf6xpvpHq5vBHm20snGr+fgu78Kviiwne2JVcxrESXStDs2Mw@mail.gmail.com>
 <958bfe58-200b-0ea5-22f8-fce393eb69b2@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <958bfe58-200b-0ea5-22f8-fce393eb69b2@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: 500419e2-14db-4526-7e41-08db9f21b344
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IqP+p2NLbeIwoCbO4QeBqGrdFqkMTgCEOP0ow6lbpYg22EDtazTFckImT0UO1zDpnVUeqWBUQJavFWeyka6kOlXsFXQuhxjsMGSvYtss7Ax9VL+qBBXJEFLDjf4PxL4VBgJMf2vAjPxcLGIgZvQCA7qkU1x7n2jT6yXGZGzfIb/IgNGz2+QOqRTq2fZi8B036dtgH1GmREkjzI+wUWlGftvCif46ryrywv1UPVZril3Og3klszioiZkixThor9cxbfj+eiVFxg/kPYqZ2lpvYYiunDHt4nbJua1Uu6u/hXD1kvv1ty962bHuLG2J8sW+lSlTnM1/TLcbyMyODBu3oMO9vi5uF1rpLOLhLmWJQxRSvxXXt5UwlC7EqmqtaC22I90ZSacZyF0KM3E3wgacbx/3Z9hDaQg/hvAFN9IYKBgTukQfusFNkOi4IQ4uX6ALQv3icvifRqjjWdSE3RvA2vlZL6UrrQMcXCuajHUyk3hiWN/wHXinRqfoXU2L9rwbDU0oBUyAYWra356Kw5ebK5xVrAJYaGWF5R9hcMBax7t2vBipzZVIgXoT6q2YSXDpWV5uIP9TA0r+CY79PyioeUzXGCML+4RvmfJimrreDm26xM+2pCJ3FbrPjkFYnZTiw3QiYMZ8GOuzX8iAm/OpoQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199024)(1800799009)(186009)(31686004)(31696002)(86362001)(36756003)(38100700002)(5660300002)(2616005)(66946007)(66476007)(478600001)(66556008)(6916009)(316002)(53546011)(6506007)(6486002)(26005)(6512007)(41300700001)(4326008)(8936002)(8676002)(83380400001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2VzSzF6QWk2QmxxckRpMGduaWpnSWp5Z2Zkd1kxdC8vRSt1VFJHMUtQVTFZ?=
 =?utf-8?B?RTlVY3RVaTRaaEs0eDhDcTY3dnY5Q3dTRFNSQTZ3WlFRSHgxekk3c2IwaGVp?=
 =?utf-8?B?UlIrMzFOUW5SSFRBZ2pZeWdkcEdSL09qK3pJUTdDSktzdHZsUE81ZGR1c0hs?=
 =?utf-8?B?WDVUZFdZMTBTbFE2WGY0QVNTS0xFbitLRGwxQWJzTldHV1p5WWNJS0duSHht?=
 =?utf-8?B?ZTBDSnhEWDd0ZDJObERHWldlS2E1UVFxclBOUURlcGh2MzNrdVFZRDNManBQ?=
 =?utf-8?B?QkZZdnZtYW56OXlFQzE5VitObEtTdW9YdE0yVjBOZE5pTEhDWTlxQ1JtMWZJ?=
 =?utf-8?B?NFJ5THkxV1JEeDc4dnpMcXc0RW1YR3FWRkxNSUxtUmJtZW9lMkZpd1JpcG1M?=
 =?utf-8?B?a3pKbkxuNlI0cVIxb1RVZks4MHZYRCtUK0JZS3I3dUZDMGVBTWVRWlVKa0FJ?=
 =?utf-8?B?USt0Q1pobVRTQWZ6WndUQzN3MEtQcXBUY2UyZHoxK2FIWXVHZTMyU1FqVFhP?=
 =?utf-8?B?R0MxQnoyYWRNcm11OW9odmlMR3BvTldFbi9pVFh2UXB2SVAwSHlBcWszQXlh?=
 =?utf-8?B?WXgwTTcvVURhVVJ6MjRFanlCN3J5MjFLc2p2MUptU2E2R3E3VStwV0RXMEM1?=
 =?utf-8?B?bnJ3SkhwUHphVDdPTkFRRnlBWnlVYUZOb2RSOGNGeVVpMitoTGE5KzhaZ3hI?=
 =?utf-8?B?ZE1MeWg4aVVzd0pQbnk0R045Q2hGWU1qMytaRW53MDhMTFdVRGtIcCt3Rk1r?=
 =?utf-8?B?dWIvaFNOaU5JczBnRUNaRm1HRWM3dGswTXZzR3RIdENjeGlzSXRsVzRPK09x?=
 =?utf-8?B?TnAwN0czbFF2NVdqL2ZtKzR1ZXE5aDVHd3ZzbmNJOGtLS09pNm15K1JWeDZa?=
 =?utf-8?B?R3ZlRmdHRTQrS1ZMSXVoZTY4TEdySW1STXBOOW1XSU0ydkxQMFRFZ2U0RFdT?=
 =?utf-8?B?VGFvM29MNWorcCtpTlJKWUkyQm9nR0ZNQlErMEh4NE9sTndsV0dHMFlIYisz?=
 =?utf-8?B?TGoya1lCYWhFNmdROEVrV3dJeXppdDdtSmI0ak43Z0VKZldKTHlJajc3ZGVZ?=
 =?utf-8?B?anhXTlFSSmsxWnF3RjBwL3FaeEp2ZGdMVHB0VkRwaFd1Lys2Q05nRnNnd1JW?=
 =?utf-8?B?cTFJMmFtMC9RV0Rvek95UVRVTXlHaWNNNS8zd0ZXbjZRZUZQclFhVmFVQVNR?=
 =?utf-8?B?bjBGRHJmbHdpT2lQejZUcjlNMmMrTE5JYWNHNytOczBzdTVYTjVLdm93L3I2?=
 =?utf-8?B?M0RKcC82MFVidlVMdmUxQWoxemlySjhvanJpOSt3ekxITi9QaFpqTDJMemxy?=
 =?utf-8?B?VllDbG1SWEs4c1VXZWtrazhUQXVNWHd1UFlaaG9Qa2U1dmdPWElOVDIxdGtI?=
 =?utf-8?B?WlpVSkFKWmtvWnpaWm0rOGlZL0NpbzhWQkFaa2U3ODlpYTFGd0VoQmRPdnU2?=
 =?utf-8?B?eVdoN3lJT0JQUWVaZmtxN2d4dzFnNTZKdDd3c0ZsVlY2NmJSOC9HbFBwVDV1?=
 =?utf-8?B?UmNybWs3RGdLZlE1SjZWM01RVk9QWWdoVkl2UXVqR3cvV21iWW1wbTNJR3Ay?=
 =?utf-8?B?MlluckF5VmZEMjgxMlZpb1QyZ3FveVg3MWtrd1ZLYXNtMEhxVHVZczArakxs?=
 =?utf-8?B?czE4L0FpcnZjL0lpKzRaNEZYVDJqTy8ybjVFUDh1UDB6QzNRc3d6VkpLTnZ5?=
 =?utf-8?B?aDFkclhRTlVMZHpLdHNlN2JHS29SZU9QOHdsK2g4OFVkSG4yWkVrRVgzeEli?=
 =?utf-8?B?VEFyWVJCbnBQWGtJTHZGS2hQZ0dJcWJITnR5V3NkdnVPdDd1Q2ZMK3NtUm5s?=
 =?utf-8?B?bmw2b28yOC9TYnFnUHoyQXNxZGJBSW1ZRjVOS29IWk9WenA3RWFtZWZZUUkx?=
 =?utf-8?B?R29JVHVXWlF1LzNlakd1TmhLYXRFTnRGditwVDA2VXZaeWQxczFtYW9JUHNa?=
 =?utf-8?B?OTBxcnVNRThWVnNQazZBMkVlVTZPNGUwNU5uSkZiWWZXYmc3V2lYNVVmMFdj?=
 =?utf-8?B?aTVsZjlHWXdvWEhYZnA0VjdBRnlTRDkzdk9GSTNaKzN5N0N4UllnaDF0MkxR?=
 =?utf-8?B?RG5SdC92ZW1rQitnaS9RaHZoa2hucnU4WExZSjRuaHRGWmR4QnV0ekh4c0g2?=
 =?utf-8?Q?2IN5gkgs+I6BbueDH7dUMcI/U?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 500419e2-14db-4526-7e41-08db9f21b344
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 12:58:49.5079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZxhSIMfVwNYtm7jg7BtRh6M6T2/OZyrcuTtaDg6tKcIA3tO7hhjXwViJ+Sadc9IOUIEhGAsPN6QQABz/cKTl/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7334

On 17.08.2023 14:49, Daniel P. Smith wrote:
> On 8/17/23 08:17, Jason Andryuk wrote:
>> On Wed, Aug 16, 2023 at 3:05 PM Daniel P. Smith
>> <dpsmith@apertussolutions.com> wrote:
>>>
>>> This is to complement patch 'common: move Linux-inherited fixed width type
>>> decls to common header' by removing the unnecessary include of
>>> 'asm/byteorder.h'. In the process of removing these includes, the ordering was
>>> corrected to comply with current coding style.
>>>
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>> ---
>>>   xen/xsm/flask/ss/avtab.c       | 3 +--
>>>   xen/xsm/flask/ss/conditional.c | 9 ++++-----
>>>   xen/xsm/flask/ss/ebitmap.c     | 8 ++++----
>>>   xen/xsm/flask/ss/policydb.c    | 9 ++++-----
>>>   4 files changed, 13 insertions(+), 16 deletions(-)
>>
>> These four files all call le32_to_cpu(), so AFAICT, you are trading an
>> explicit dependency for an implicit one.  Is that what you want?
> 
> In fact, no. You comment here caused me to go back and try to see why 
> Jan said they needed to move. I realized there was a misunderstanding 
> about his commit message. He was not saying later, at a point in the 
> future, they need to be moved, but that as a result of his change the 
> inclusion ordering had to be changed. The former is what I understood 
> and thus attempted a build without them to see if it would work. I was 
> not expecting that conversions would have been able to be implicitly 
> resolved.
> 
> Since I already rebased to latest stable, I can resubmit a v2 with 
> correcting the inclusion order but with byteoder.h inclusion remaining. 
> Though that would render this down to simply a style change patch. Would 
> that still be acceptable Jan?

Of course, after all you're the maintainer of this code.

Jan

