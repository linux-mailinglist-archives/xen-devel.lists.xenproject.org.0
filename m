Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BB958AB0A
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 14:50:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381194.615769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJwmS-0000No-Ui; Fri, 05 Aug 2022 12:50:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381194.615769; Fri, 05 Aug 2022 12:50:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJwmS-0000Kp-RM; Fri, 05 Aug 2022 12:50:20 +0000
Received: by outflank-mailman (input) for mailman id 381194;
 Fri, 05 Aug 2022 12:50:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s4Nu=YJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJwmR-0000Kj-65
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 12:50:19 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00076.outbound.protection.outlook.com [40.107.0.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 287715ce-14bd-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 14:50:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7576.eurprd04.prod.outlook.com (2603:10a6:20b:29b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Fri, 5 Aug
 2022 12:50:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Fri, 5 Aug 2022
 12:50:16 +0000
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
X-Inumbo-ID: 287715ce-14bd-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCaBPDKEgrohx+JX5BY8hpxXVpkg6potRRK6sXNu+effyIvYiTQtiPVW7UL5FREo3Q45pzbmppoIRbD0gdBZnXIbq1grW+JM4EAxOLobGCTmMfdSVginUupEeEhKQ46FXSqem42fFzZW0MOi8lde09auJMTI8TYS0ZwNfTADw/hKwjKpQlfQ8XN5g4WYyQ7kN5khge4IuxVNrVsvtf+jPKekJmfbUvvYHWqsG7QOoR0Fed2knmqh1llJgZiqpKR9mvBNS4Mg2pdozxbork9xwYw+wThre2AnUB0s1uNsDkwe7/jUK5inhUetBX4dDIxkX5KynrUo3mck5BAKIZgB+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBAYKGBQ4ZkaDkXTgIo3+RIjMC6njktJsE/xLLQtPVc=;
 b=VfjPDW8U0i10EJcw5DyGYqV/7Ee4x7ecEf/8a6VYBDKBDmtPqHfPJuCREX0H2Ecq12wD/mYKGlsaxwSfAj+PunRN3yZZBn1IyJJKZ0bl8fr+bZETiNe2dWOJuj2OdwbcUDBBEkLM7NCW+PRWHYnYr4OV5yNivuInpdiEO6x8OxV53JSFFRCs1VdK2tmJsvTIJyhZxGd/CQGu2d+nJdDLW8Ylx0aU/WJbphFSoPKpG8vbjG6w+AU2TFwcTqB5N8uZqqp23dRB51e4kp1jrORknUYVGreptIpG2rCLCvvIq7UOH9s7T1TT30Acngj9x/H4K+JEtrFw8MA/3IcRmwsjFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBAYKGBQ4ZkaDkXTgIo3+RIjMC6njktJsE/xLLQtPVc=;
 b=KjiK1UlWWhBw4bgbOSFkX2jHLkhhYqzWqXth/99nEpgpsZ6xekrCaFIULy5NEDjQQbTihX7m3XwH//4qcTIJkHMn0zNQZqBBWSQyRc+e8DPYgfQOmxVwzRKglQ5Y9gUuc7uRQmtHNmtrm9RytePr7MvNDhZMNq0+QxzneyEIGsSN0tL9o2wWz+g8emxhTDIIEvPSn+8MEzG+8Ai2lZDYRH1r7PkDQs2Z7LlZH+D1SqziOkgRPwed7CX/fCVntvZmU6AVmrhd8RY43o3B/M3YnlxIDgR9zttdJ93SK7mndcfMd6oAZHzeFwB7OF26qztcMUuYTsvxsOYSga2suJUypg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <67c9bf09-7639-bbb2-6942-9fce583bf700@suse.com>
Date: Fri, 5 Aug 2022 14:50:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/3] xen/cpu: Minor coding style fixes
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220805124442.1857692-1-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220805124442.1857692-1-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0068.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::45) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca21624c-8ab4-41f8-341f-08da76e10bb3
X-MS-TrafficTypeDiagnostic: AS8PR04MB7576:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ntp81R48ZtAAuH8nhJSIPe5r5zj2e5Z5welhAKzziVCaMGcmV2S23modDnLcmUiB8EijP4vvWEnOaf85gp8jlrVwSwrKxGMV0UlexrvQoRL5WyYQgL/rnBo6Oh0/w33jmx7mg48aE8PeDbwx8BC91G7CN1QRrtcBRpm4Qbdlr/A8oBGyC2WKj3gN8S2pEAIzgZXzJuxK/z+fjaQig94TAEnUVvzhCnWTh8S8aWmg+ZMBIJ8wJWRQ0HGKftn/88hJpOTgeEoTLyLPtENsgcRZh8ZgSXSVwG/Oxs9vJ9oqhq6mVEXs420YvYJwByJaMP78z/tynNGuzXzma7XtY0tiiawJ/Ci/z3kDWVfNZSKxlz9OU+oABySHLeOehFK1u/N9j7gmsvj8xHZEqFx8rvI4q7Ej7UMlTbTHFzZWQ39NPl4MMRC4yshWL1GNasXByS/S3iOFKqd+uxXi5fmrU4Qemxznnz0qRZ7l1bzU2NAPAo9E5+drrJbXvraNeZu/0QGYpWkJNtiGw82sGNTdN+0p+iQTFrH/I3qDCLnOsS6HYz6gdrHDAfcBMtnQ5vc31bwDyuKX1LsrzoOcQ6CRk5PxziRUMHENi3tSqLsgYgiggJJN2GgZkOExoAgvQMyCDty8qqhsYC2CptpPtBDkbXti/HUt8WP1vBB6t/mUKA6wpnHVc8/OHYyTJ9EMRUi0MbcZaSD2NiCSs5QGMbjRaZJinRoKXevPthn3oErzV+iyxZcyHtE/S3R2XCBqrGujia6Yd5cv7KSZjUVKUTujJlImrkMcALp40d+KG1NVYxGXdib0qDSPJnphs9IgHmtsvYZfQL8pstinkd+eMn/ntP4q5g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(39860400002)(396003)(376002)(136003)(66946007)(316002)(66476007)(6916009)(6486002)(54906003)(31696002)(66556008)(478600001)(2906002)(4326008)(41300700001)(6666004)(83380400001)(8936002)(8676002)(4744005)(36756003)(6512007)(26005)(2616005)(6506007)(186003)(86362001)(53546011)(5660300002)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3hDemcxRHZRN3ZXL2dBTG1aeDllTllUNnlJbHhzQmhScnFVSEF1cWF6SEJl?=
 =?utf-8?B?ZWNNZGg4RjhqY1hWQm96Rng1MXlHWlpnQk9lY3RGVjcyejRIWVh2YnQ0YWpl?=
 =?utf-8?B?NXZtL1Zzbldid0V3NmJOYTBtVEgzTlBENGhuUnNpSitFOGFwOFd6a1V1RjRT?=
 =?utf-8?B?dGV6ZktVTXNKeTJUMkNISEpsdGZkWFUyOEtvWHprWVFhTkV1KzFTRzFlVmpz?=
 =?utf-8?B?ejBiRjFJZmd3VkJwakswUkh6M2xzUFgzNDhLTXFobmtZaWZibDJxUS85Umdi?=
 =?utf-8?B?bkliRnpBNms2THFQWTlwY3pOeWFNQ3BXR04rN0dqQXppb05DTWxYV0lGME84?=
 =?utf-8?B?OUFtTnNDU0I5SDAxcG05M0RxNkpremlXeWhOS0VVNHVSbVpubncyamxQRTlG?=
 =?utf-8?B?TmVLakU5UWYvNjFsUis0WDc1eWFUdHJTYmNsUHEvYjczVGdmbHVGdHFMYTBw?=
 =?utf-8?B?TjhFdExha3pSRk1KUGJSSmdxN1pjZ1gvWENTMmE1clRUV1BqTTM4Yllhc2hC?=
 =?utf-8?B?Y1I2Z2dOdVc1MTdJbi9NV3phTE44ZWhzMERTN0V6NXRZaWo0NWgyOUFkaFFs?=
 =?utf-8?B?YVk5YWNZLzdWT0pPVGM2RGtvVzJxSUtDcmEvZStDSGJJMlE1ZXU1aU9YcGpK?=
 =?utf-8?B?UTQwakpjUGthNVpjN3dJT2NQZ1N0b0JWbW52Z1M5RjhFQUZIUTVwclFNczNs?=
 =?utf-8?B?dUhvY29EeGxIVlRVcUdmYUxnbjR5dU83cGNOLytDdmU0M2U3NVVjNlBjQWZY?=
 =?utf-8?B?N0VEOEVEaFUxQjJMZWU5cXJzNjl5a1lXZkJ3bHp1MzRrWHlGNTVvbStwT2FW?=
 =?utf-8?B?OGo3RGZsSlcrN1M4WTY4YVl1VDdBYjFDTWNzYmlKejhUZ0UybExFNFZBb0Nu?=
 =?utf-8?B?bmJVVGd0SVF5YkVMMFN4SzQxYkJ1VkhRQXpGcFhSMVBFY1VyNEw2VUlkNHF5?=
 =?utf-8?B?QjJNQ21DMmdLZCswVmlwc1ZOSkxQMkp0YkpVWElqZzJLR3JDY3ZrRTM0Rmow?=
 =?utf-8?B?N2tPTkkxb2hFdmNZWnEyS0trRW5VZjJoTVUyQlN1amlnZ1JzcjBvL2RWcm4v?=
 =?utf-8?B?N3lpWk01VlRyVTREd0t0d2pNM1FsT0EvaHljWjBXZUVwbnN5WWNHYnpRUXZK?=
 =?utf-8?B?NVhBMGtTYkE4N2kxRzFqUFlkNlVRdUFNMFFVMkZZRGFrTDN0Z29YcXB2R1hr?=
 =?utf-8?B?ZDVpcXRhQlVQbkxBZWpwRTdxaUpUbXM5MVl6U1o1R2hRcFIyUFhpLzlJaTRq?=
 =?utf-8?B?ZkUzalQ2UmZ5aG1XU3dYQWQ5UUxOMXBxeHZkYmJ1SDNmdk5tQWdBSzN2VE5u?=
 =?utf-8?B?NE1sb3ZHWUdaazJ6MjBaTG5zMnhsSGJadHlMSmZ1bUNwSnlwSXF4ZG13MzVS?=
 =?utf-8?B?TmZPL00rbUhVdFM1Q2pxNGpyODZZWDZ1Q1NMVmZFSnZKVXpFL3VPWFgreGtS?=
 =?utf-8?B?UmFySjBvMHpNcytLK3FtcWlKMjdLU1gxRGRUWUhiMjlETmxzR3FzTHVaY2Vo?=
 =?utf-8?B?b21tcFhsbzgrL2xrTzQ3ZWNBa2Y5VHRPSWtzaUp0dFdvaTlieGl6ZFg5NmUr?=
 =?utf-8?B?cGF2RE5WYlhoWEowV2FYY0xYT1MreFlRK0xNVkNEekZBemNxU0p3SFIwOWFN?=
 =?utf-8?B?MG8zSVdZcHUrdElkcnVoVFpIMXBOTmZLN1dxR2RET0FaN2RUeG9WTStNamY1?=
 =?utf-8?B?N0JTaDBpTUtaL1hVSmtzQnFGRTI3cmdyS2xNdytNTnM0MCtLeTNlOC93Q2pl?=
 =?utf-8?B?ZWhVSnJ6Z2pvTFhVUG1Fc2l6Ly9BWWhNK2N6RGNUbXlFVWhUVkJwamQ3N0Vi?=
 =?utf-8?B?NTd3MUQ0VzdiT0VrOGRxTGpGTW5qeGhiRU15Qi85dHNHYjlDTFNLUjBlVXZv?=
 =?utf-8?B?TUxMelVIdC8wSEs0Q1daN1dNaUxDdkxhOHNoeWNGU0ZjejR0eVBJcm4yMHhR?=
 =?utf-8?B?VWdYQWtCdzVrWUJpcTJLeWJJb1JPUTErOGRVcGxzWGJvbGtJb0FkaWdYbk41?=
 =?utf-8?B?czRRUE4za2VzdVd5dlp4YlByRVBiOGhSQjBuOVdtUTJTMjZ6cncrYWVTbEla?=
 =?utf-8?B?d1d5RUIrNWtobFNTbmtkRFdIa0pWdkpoZFAyK3pwVFhydGg4RGlGQ2ZNZUVQ?=
 =?utf-8?Q?4bP743TeJanDPiTOW3EA/zQzJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca21624c-8ab4-41f8-341f-08da76e10bb3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 12:50:16.3609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3IVahoV/jdEm4iDf/BE47x5l/WsZ0mx95ohonSKkqH4qRVtFoKX/rezhbwBWabb/yGA0T1U9uHZkAKoet5A3WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7576

On 05.08.2022 14:44, Xenia Ragiadakou wrote:
> Xenia Ragiadakou (3):
>   xen/cpu: Fix MISRA C 2012 Rule 20.7 violation
>   xen/cpu: Add missing white space around arithmetic operators
>   xen/cpu: Undefine MASK_DECLARE_ macros after their usage
> 
>  xen/common/cpu.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 

Acked-by: Jan Beulich <jbeulich@suse.com>

However,
- I don't see why patches 1 and 2 needed splitting, when patch 1 already
  touches all those lines. It is the usual thing for us to make cosmetic
  adjustments when touching a line anyway.
- Patch 3, while fine to be separate, wants a Requested-by: or
  Suggested-by: me (which I guess can be taken care of while committing).

Jan

