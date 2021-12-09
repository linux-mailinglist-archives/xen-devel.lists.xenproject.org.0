Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D25CF46E765
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 12:17:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242945.420141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvHPm-0005uk-2p; Thu, 09 Dec 2021 11:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242945.420141; Thu, 09 Dec 2021 11:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvHPl-0005sK-UO; Thu, 09 Dec 2021 11:16:41 +0000
Received: by outflank-mailman (input) for mailman id 242945;
 Thu, 09 Dec 2021 11:16:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Con=Q2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvHPk-0005sE-J6
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 11:16:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a87567f-58e1-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 12:16:39 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2051.outbound.protection.outlook.com [104.47.6.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-XPS5heOTPyeU_nJIivvqGg-1; Thu, 09 Dec 2021 12:16:37 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5165.eurprd04.prod.outlook.com (2603:10a6:803:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Thu, 9 Dec
 2021 11:16:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 11:16:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR05CA0013.eurprd05.prod.outlook.com (2603:10a6:20b:488::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.20 via Frontend Transport; Thu, 9 Dec 2021 11:16:35 +0000
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
X-Inumbo-ID: 7a87567f-58e1-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639048598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BcEOLFgAyG+3D5ohtnijoJ1iOU8F97z6QoWePlLNKRw=;
	b=LdAHqMpC46US4IObBuvReRmwsa0/BF1T/k42DStp8RlvVX04TW/YsVvOOCyjyOqplSUE5J
	K/n5CdDo7XWVMNFev2QNHo/6UbiwKDx4QAFEvIL6LJgoe7YGrhk2GGVMX8UYvWhDVq8Ljp
	VWj6Sm+kdCskCFpENkkJkZ27vJwGq0U=
X-MC-Unique: XPS5heOTPyeU_nJIivvqGg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gUelqgg1d5d/PePmqDmJM2nVMDlM3C6dTq+F+sQwss8Pgz+NY/+7vkYT0rjog4Uk7DnghKuh6tBSsCpaiPol4VgWRCngpSYrhv+E1UV+vgUkOvUH70X/V1PPIZctcraB+Nx+5cldgJ7UV3VrEeWn2rOeh6Gq+juyVF1uzPVeXpZzyBWG/pItByz+WJMyrtgOLQz+Aj6tgQm7GCUHyQ2liUfNnM/8J273lkbgbpMCsOW36Xa/qEEnfd2SNK22T7roKMpo6QKRwMledMIHa6VJ+q/tpaE073sCewGAdOGraHHxizvgAyujKIEW8cTcN0t2dsIpysubYQzSn6sJDtFPlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BcEOLFgAyG+3D5ohtnijoJ1iOU8F97z6QoWePlLNKRw=;
 b=dKXZOD1pUGQcCA8M4SZdjw1e4zkXEgB+r4Wb51qSTJkTt7Goh5q3n66FFqgY3VP5HBuageXqUCsNBw9eqaOMUUQ5Y0bXHLYU7ZnAc+Q1C3A0+xHHYSMmMYlLkMhCvo2wL7pp63ep1GzmbKdytXsuy13O3WAzv4o8GmUmDR/oQLE8G0v3tCCF5fZCJHV0sxAibjSYH4AGxczfUT1FHzwKfF+Mit3Ap/6I+tm3jL8quI5c1bLsHCQmm7LbFgy7lxY364YCRIZQALdjjfDxAfkwwjUV/sx/5F6KtscecJQoV7N2Bjmkqs8L0+7cg7pArLtgdn6dr5G3YFd2ybzSq+aZlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f7c405e3-9bba-2741-b921-b30fe4164608@suse.com>
Date: Thu, 9 Dec 2021 12:16:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2] public: add RING_NR_UNCONSUMED_*() macros to ring.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 Manuel Bouyer <bouyer@antioche.eu.org>,
 Simon Kuenzer <simon.kuenzer@neclab.eu>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20211209070942.14469-1-jgross@suse.com>
 <5ce9cdf6-228e-b4e3-f0bd-f64fb89c03dc@suse.com>
 <22ac60e7-7e6c-aa96-f51f-8cfe08b8f62d@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <22ac60e7-7e6c-aa96-f51f-8cfe08b8f62d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0013.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30fd4e07-e2c0-401a-4cbd-08d9bb055cdb
X-MS-TrafficTypeDiagnostic: VI1PR04MB5165:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5165C00EC440FB872AA9630BB3709@VI1PR04MB5165.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	43FCE23v7XSUUoBl4E6NNuD2bTDIz8hfBA7CaWyRkwneq3zG6QTss7boEJVJLM2KV2VCzOeENC/DgNMmxfOQ+7vaHfbDFhHUFcm3PtC93R3lnxBtPOr+SwXELQXYJafIbyjDqW1WsQEAAh3NfdZ4OHPFK/XylfvLTssiGVsgejxVeUIw6WcbuUNMcX7Po4QT9Fp846dsdhE5qfQzgGzbs43IcMgDHtURKT0WLN5MFD6kIOrC4/cMm72N7+QR5+4maVfuywrAr0qgC8fPKO08T8iQ+aPQyEwQxmyhlLxV9kENnyBorKFMTfzuxQZXE4M/+OGQnlgUG7rpnjFivXcg3OyaC2VqKufkXyJnAGf00v0B3zAcMZELZeTrw9NV7bncnVBal4h1Afffx/IC9W0CLinBg3dRu8hrgL7EEHcodCqyjSxMA/jaCzisAIX7UIiyCCwYoSompHVrcQbGQSBZR5xlhqyMaYqtL0FGPf82UGMv79E1O0prNuv1CpLwhC//wOhlcacZnEObdzTW/6Ey1cFCsGvn0QbnsKKpDsO5gouvBIgoxIb9UAT6fV/TCXdYjQ+V10yhvRuavAHILmVy9qC8US8V7PZAdh+cnjoWyhmxZBhfIEjjvOhM0elTwxlN0qrawc6bVQoSEZe5j+zDH2D6vYM28x9AQB9ThC0x2bnLN6rUbvVmgXXbAFINXgiBqPhHjksnbKiiAPT8kBBqx5ZIJ/AmDgsdgHnzgGNCREJdi9vdeiR7v4/09qY0CN5M
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(6862004)(38100700002)(4326008)(66556008)(31696002)(83380400001)(26005)(66476007)(66946007)(53546011)(508600001)(956004)(8936002)(54906003)(2906002)(6636002)(37006003)(16576012)(316002)(36756003)(6486002)(31686004)(86362001)(6666004)(186003)(2616005)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2NtUmJzaDluNWtuRHlJTm9iZVV2Y2taUmlxb1I0OGJId0JrOHZUdXAzT1Za?=
 =?utf-8?B?cWFBc2NSWFhmQXdFbnUwVmFhQ3ZGMTd4bGhFcWlSRWlPTmFaWGFWMUd5MFNu?=
 =?utf-8?B?RndUQU5pSTZiODZ6QzJyME1KUUc1MlgvdU5RWUJFTjBxS1JTdlBrNklmbTZh?=
 =?utf-8?B?ODRteFh1SGg1enNvM0dnWnI1aWUzeThheURSbHFvZGVTNjB2ditMMFJYVzkx?=
 =?utf-8?B?OGxhKzNGeDNCbDdkeGMzcE8wR2pJenorb1Mzd3hEcjR2Lzl4cnhpMVBtUFhm?=
 =?utf-8?B?RGczSU5jNE5FSlhyVUVkTnkxcVNucDBrcE5YQlZMYk5xbGEwS2hIM3lZUUFJ?=
 =?utf-8?B?aFNJT2Y2ZFRNdEpBdHhWZmpnSGM1K3Z4WldpRE0xOEhRYjd3R1hNZXdEZ25Y?=
 =?utf-8?B?U1ViUk5CbnhoSHVGcGFFaEFBdnZ2NG5FeURNbG9nUnZXQkY4dlpQL1N4OHRX?=
 =?utf-8?B?bDJSWnZ3aUp2Szd3Q1RUYUMxL0Y3R1lpaGZhdjEycUlNWmcwWmNJa3dVeW5w?=
 =?utf-8?B?OFBVa1Q0Sjk3NnE5VWNMMXR6ZGV6aDQ2anhQcjhYKzlkVnNZQmZSU0huY2NV?=
 =?utf-8?B?MStibjFDbjZPWUwwdmxzQlpxd0xNbnIxS3IrYVlJd0JqM2dQenltNEZOWUk3?=
 =?utf-8?B?RnlDVVczSldiN24weUlEZkttRURkbU81bFl4MFl5bStFSERwNE9FbnFTNHUv?=
 =?utf-8?B?TjJESEZsd2xxTHJ6ZXNyU0Q1TVYxb0FBZTdTNGVHWEs0d1BOUGo2Wk9mWkVw?=
 =?utf-8?B?ZXVTOWV0cUtyZ2N1VFh5UXlKdE9iNVVBRzNXVGl1N3RpTnp6YUU4NVFMNmo2?=
 =?utf-8?B?WU4zM1BHTnBSYnFSd1RETmFxTVBnZmlWc3FsWmZaZloxOVlEWFc4N0lXRlZE?=
 =?utf-8?B?L3lZU0xXMGMyWEQ5Y2ZNS0tpdHBoRXc1akxOWFZuV3EvMWxGMWNxbEl6U0V0?=
 =?utf-8?B?TWJMWDFMQzhnNFhWbGVXNjBhK3dobTFKQ0J3Qjg4bHpldWRTSXFVMGlCZlQ0?=
 =?utf-8?B?MGdnU2RuYThqV0VZYnVvNnZSNFJORzhQR24wdTVYZFJWaGRXWndqODF3bnZY?=
 =?utf-8?B?WTlkM3kvZ0ZvZ052YlFSNVNqZkdWZWhLVjhCYXdTcm1tQ3MzZ3FuSWxSTkRv?=
 =?utf-8?B?L0VEeTZSZWFUaHNEL1gwTW94RmZ3MldFTS9EZi9SOWt4M20rTWhPK3d5VHpy?=
 =?utf-8?B?Z21Rb1d3THdMNDdMQVZkbytqaDVMVTJBUXRmNFc4dGhEQU41M2plZkRTL0x6?=
 =?utf-8?B?WEhvN2RYZnI5VGhObFp6alZhYldGNGwwR0MvSHBSQllCZlY3dUlsUU1LWFpK?=
 =?utf-8?B?bVhVMWFEeXFYSW1QTWhkb21lYm9xcnJXMmQ2Mm11VHM2VnV0aVhTTlhTUmhO?=
 =?utf-8?B?WHRZdExCYms3V0tGcFl0OWZiWmh4YVIrVmhZbTRiajZibys3eEVBUW9QdUJh?=
 =?utf-8?B?YnM3MG9SWWxkWmdaeHdWWmJVTk52NVhnb2NqaktGZTI4RUdnSS9oSkFOT2FM?=
 =?utf-8?B?OHdyeVFEbzF3YkIwMlYxZVJIZlV6TDlvQnN6bmsxYmdFT3dNaW1rMGtQVFM0?=
 =?utf-8?B?SndSRWFBblJsMUhYSHVSNXFXRytGSFZNMXRJZFIvSVFFY1BleU9OaUdVaTVn?=
 =?utf-8?B?KzUrVTNjb3ZvVzIyYkVtLzU2K3Q3LzZISnhDUTlIQUhJbG14aUg1azJCMFNM?=
 =?utf-8?B?QWRHYWpjRzhEYVowN3J5T0tNdHFaMk1nMEl1aDkvMXhTQjd2LzFyTmE1Nmd4?=
 =?utf-8?B?ZWR1WHpuRjdvWnhSSDUyRUI3b3RPSnR5VUtxOFpuME52L1FzUVY4K3grOXFy?=
 =?utf-8?B?Y0JXbW9zdGRWVXpOOE9uaHBqRXFJbnZIZDZJaXV5Z0lBODJwNlBDaE1nUTgr?=
 =?utf-8?B?cHpUWnp6c2h2QWdNY1FqcW5sNDlPcHRLeDhVbUlxVjR2TE1KVjNoN0IxRnlY?=
 =?utf-8?B?cUFIcGx2Y0JhTnRQNlI5UkQyQ2Zla0daaXU2RXN2Z3oxOFErMk1qUkc2dkhG?=
 =?utf-8?B?Q0VnSWF2bzU4QmpRTW1PcTJKZVRIVW0wYkl2RnFnYXcvcFBvUmt6czlYMS9P?=
 =?utf-8?B?Nkxuek5tNUh1R2JKS3h6Z2xyMWZhRTdMQys1elp1Nm0vMnAxczNXMGhtR0VW?=
 =?utf-8?B?elkrelljN1JoL2gyV2lCNmxZTjFBM09sRnRLcUNycUFROFpqK2k3UGlpdEVD?=
 =?utf-8?Q?eKngpiktTvnONf3P4QSaU/M=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30fd4e07-e2c0-401a-4cbd-08d9bb055cdb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 11:16:35.9400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EhxElYmubmN0UUobDoJ/MfHBJbK2Wnr/vez05zKmnncbcBc83k9qSGqFwecwXqC7uAF4fMqANIpTG/5LzNCTpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5165

On 09.12.2021 10:47, Juergen Gross wrote:
> On 09.12.21 09:48, Jan Beulich wrote:
>> On 09.12.2021 08:09, Juergen Gross wrote:
>>> Today RING_HAS_UNCONSUMED_*() macros are returning the number of
>>> unconsumed requests or responses instead of a boolean as the name of
>>> the macros would imply.
>>>
>>> As this "feature" is already being used, rename the macros to
>>> RING_NR_UNCONSUMED_*() and define the RING_HAS_UNCONSUMED_*() macros
>>> by using the new RING_NR_UNCONSUMED_*() macros. In order to avoid
>>> future misuse let RING_HAS_UNCONSUMED_*() optionally really return a
>>> boolean (can be activated by defining RING_HAS_UNCONSUMED_IS_BOOL).
>>>
>>> Note that the known misuses need to be switched to the new
>>> RING_NR_UNCONSUMED_*() macros when using this version of ring.h.
>>
>> Is this last statement stale with the introduction of
>> RING_HAS_UNCONSUMED_IS_BOOL?
> 
> It should rather be modified like:
> 
>    Note that the known misuses need to be switched to the new
>    RING_NR_UNCONSUMED_*() macros when using the RING_HAS_UNCONSUMED_*()
>    variants returning a boolean value.
> 
>>
>>> --- a/xen/include/public/io/ring.h
>>> +++ b/xen/include/public/io/ring.h
>>> @@ -208,11 +208,11 @@ typedef struct __name##_back_ring __name##_back_ring_t
>>>       (RING_FREE_REQUESTS(_r) == 0)
>>>   
>>>   /* Test if there are outstanding messages to be processed on a ring. */
>>> -#define RING_HAS_UNCONSUMED_RESPONSES(_r)                               \
>>> +#define RING_NR_UNCONSUMED_RESPONSES(_r)                                \
>>>       ((_r)->sring->rsp_prod - (_r)->rsp_cons)
>>>   
>>>   #ifdef __GNUC__
>>> -#define RING_HAS_UNCONSUMED_REQUESTS(_r) ({                             \
>>> +#define RING_NR_UNCONSUMED_REQUESTS(_r) ({                              \
>>>       unsigned int req = (_r)->sring->req_prod - (_r)->req_cons;          \
>>>       unsigned int rsp = RING_SIZE(_r) -                                  \
>>>           ((_r)->req_cons - (_r)->rsp_prod_pvt);                          \
>>
>> To answer the "whether" question this was likely good enough. I wonder
>> though whether the use of (_r)->sring->{rsp,req}_prod doesn't require
>> further sanitizing of the result as it's now intended to be used as a
>> count - afaict the returned values could easily be beyond the number of
>> ring elements when the other end is misbehaving. Or if not bounding
>> the values here, I would say the comment in context would need
>> updating / extending, to tell consumers that they may not blindly use
>> the returned values.
> 
> I'll modify the comment:
> 
> /*
>   * Test if there are outstanding messages to be processed on a ring.
>   * The answer is based on values writable by the other side, so further
>   * processing should fail gracefully in case the return value was wrong.
>   */

I'd recommend to avoid the word "fail" here. Maybe "... should deal
gracefully with the case ..."?

>> Also imo all new identifiers would better have a XEN_ prefix to avoid
>> further growing the risk of name space clashes. But I can see how this
>> would result in inconsistencies with existing names.
> 
> Yes, I do see the problem.
> 
> Would you support switching all the names to the XEN name space and
> adding a section like:
> 
> #ifndef XEN_RING_NAMESPACE
> /* Following for all macros etc. not in the XEN name space today */
> #define x XEN_x
> #endif

Well, as that's not very neat either, I wouldn't go as far as saying
"support", but I certainly wouldn't object, and I also wouldn't mind
ack-ing such a change.

Jan


