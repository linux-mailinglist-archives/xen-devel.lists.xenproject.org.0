Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F684F56B8
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 09:07:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299652.510697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbzky-0007jD-B6; Wed, 06 Apr 2022 07:07:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299652.510697; Wed, 06 Apr 2022 07:07:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbzky-0007hF-7m; Wed, 06 Apr 2022 07:07:08 +0000
Received: by outflank-mailman (input) for mailman id 299652;
 Wed, 06 Apr 2022 07:07:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nbzkw-0007h7-HM
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 07:07:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a372751-b578-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 09:07:05 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2054.outbound.protection.outlook.com [104.47.5.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-XuDH7ArcMBq9TY8JVt08jw-1; Wed, 06 Apr 2022 09:07:02 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB5877.eurprd04.prod.outlook.com (2603:10a6:20b:a7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 07:07:01 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 07:07:01 +0000
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
X-Inumbo-ID: 2a372751-b578-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649228825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dCc5MjGVuClMclOm/PARP1lH4sH4o1x+CK2Q9ashh1w=;
	b=NuNkAe9I5TaaE6ifWURwRwuRL3/ihl/Q6V6mI24Og/FsDun7FXjgG8rAlzl9CClcMnY5k2
	qYg/fRN0crE0ZgM9yoDWdieWNNAvH2r528Nm48VjwMGZYyXGNrLuh7Yz+J/fLq6GZVjY0o
	5w9+FCFEnEaoc9r1pU5aRFVtRlNJmpU=
X-MC-Unique: XuDH7ArcMBq9TY8JVt08jw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A900OXtgcGkG0FOs9hXsAz/yppGaYb7mm5vcXB7pdcdDtSgGLvkJwddMoZ/UW7JVyCKKLa4n5alhqK9SHl3Fe8xyV34rF8M+iqVGLlbwtTCkWFDpb1y13lTCPHcaqvpDjdRCFGpp++Z5o882bwjhwDzZ94T/NyOPiEBXzQ2YBwhXOPVnGNSkr2UKlFXQFUN+8jombXLS6QI8OM1z2FYazGGl7uGm2T9Qc2DjSvGrmRC0k62Uk2AIGZ+cPGBTScAxt8oEP82FrnNyo6HLggwpySzSm6AcZ3augJD3cvZAr2wKumPJeks3Nu8WYDhMtMn2e1XWaY22oPCczEIprl91kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCc5MjGVuClMclOm/PARP1lH4sH4o1x+CK2Q9ashh1w=;
 b=hUop2NrZz4W0ZG9s9QicSFfGmn/1D7rJLaCcFSFRQh+klIr4L3etAQP5pgC9Lc3M9ZSyF0NZ+ses3EQsFln5jvkfblMrRzFXdM1TujQS4TS/Y+gNSE6LbIdqvQnj4fIAgRVRnA6NaT+Ab1DkrlubN2PS1uC++XnwkgeqMGvJyTLrkbMaoMWhvxU2FOcdCu9oCHmJ2ematmYPkGToo70a0Kucw3xBfy1MXu25GJNYUAXrbeJZa0XD7UNLJZJanMb/wSe9sqdU1haC9eeFZCV4RP7JTpuopAWDtQSxbjoQHBerECzM0LZFqCveY4PqqNbvkKke29F72lQegEdz3Pm7xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a4759948-d45c-df06-3130-f95aba05b555@suse.com>
Date: Wed, 6 Apr 2022 09:06:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] xsm: add ability to elevate a domain to privileged
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Scott Davis <scott.davis@starlab.io>, Daniel De Graaf
 <dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-2-dpsmith@apertussolutions.com>
 <CAKf6xpuA4hQmPdBtmog1UFcSQQkXL2=+e5bmqeocesgNxqD27w@mail.gmail.com>
 <1eaf4555-5221-6cef-6c01-6aea3797e521@apertussolutions.com>
 <CAKf6xpv0LrmAa2A=dXXK2DSRh0j8ac9VM4aLBhTRK0MtnML0Aw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xpv0LrmAa2A=dXXK2DSRh0j8ac9VM4aLBhTRK0MtnML0Aw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0045.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::30) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2113e863-69ce-4f05-bee8-08da179c0c04
X-MS-TrafficTypeDiagnostic: AM6PR04MB5877:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5877FDAD0992B3B44013CD23B3E79@AM6PR04MB5877.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jmiegvLgtLfzPz8SQya9oANtN0hSdlI31SLYMyORwy/4RSvKDBp5h7ervfnX6kwyWkG2s/bQ1mjEXbv+CelIUAp4/Pwh8QgsSUntXEvxZR2ri0AJbUZ77AbpWSoB7WwJBnTUqqHijuxcEGenn2edaoTTV5qBkitMmIiM+DoRP5v5mYWsVYS4umt7igq+npNVxVye5AO5MD9oPPRKK2B7Wj3/MFOOF2VNNjpgHSav5CYZrUKqvts2xje2bF1zQEgQzn0RN67EHyBbCOO6twdaqJXXp1ni8vGlWaTF4ZURSZH+ntAEloMvSYfaCVb1gDZhdKxW+mRGTK60szOUXFJ9dYHJl02PWI1CbPq8NotmTjjY5Qc4Tss7VVXEpjdVOeqmM7Lz3D1r7X4p2efDK/5cnXshuJLfY/6rbcwpo5p1i7Oz0+4zRTUGCbuWbxm5/YKAdXBXR08QWTcoZKWxoFfEM67Dj1uaxwQTPWF7iwoYBudP+J/BGhKp3nc9X6E0yPkY2iBsDvnyXZmalIOwI0g22JgUhqx0XNCNLDP2uCvohWK/L/eoNFujZjqJLKX3RC24KWR5bbSpsaSAAdAQf6ExFujfF2WTqBaCJqz61WWtnS91WyhKbncXoOrrYaZDARoBn8Yk6C7n7e1mVVgZ20BI98LCSZFiQqMadUKDg3rnuRYiEmFqhYG0XlT1oxjtP7mBTFPZQ0OWS7S/ZIqXQuw2Ke8yxQhDYl94tSl49KAgH+nf+lPkA7w8Zr6lHDBvF8zt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(53546011)(66556008)(2906002)(66476007)(6506007)(26005)(66946007)(4326008)(2616005)(31696002)(86362001)(8676002)(8936002)(186003)(6486002)(5660300002)(508600001)(54906003)(36756003)(316002)(38100700002)(83380400001)(31686004)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTM4cDZxQ2ZPWWc0MC9wUVg1aDg3WlpIZFpobytpTW8rYmVxWmdTdUJacTBp?=
 =?utf-8?B?WlYvN3p5RDd3SWE1VVFwVEU3MkppMHpka3YzVWlCVGJWMVpaRDMzcmh3ZThO?=
 =?utf-8?B?S0FjVWFBdDg3allFbmZ1c2c2Vml3VFk5bWc4OFdWcUlaOW9tdERhSWwxMG1E?=
 =?utf-8?B?Zm5ZaFptRjZJWGx3QU5zZ21jWk9lbnlSbEpnT3p6aEhmb2dOTlFFK0dPbzFL?=
 =?utf-8?B?ZG1jWGh3OXJST3FCQ1ZLbSt6a1o2OUhvT09XWWx3K1lReTFjenNTckNXNG5p?=
 =?utf-8?B?Y3YyVDV3enZIVGRYSUoxTzBuUHpWUHVLQnhDdjBRaWhncXJBQVgxTlhKQmMr?=
 =?utf-8?B?M0NKU1Rwa3MxMkJGQjBvZ2p1MXZrMDFyMkNUQjJrRUtBQ2RZSHorZWhoZUdQ?=
 =?utf-8?B?a290Mm12OEs0S2lURnRFWEF4akhZbUlRbWpYdGlEYlZSdUw3Q3N0WUVLSG9R?=
 =?utf-8?B?RmNTTWpoTExnTHFYQU05UmU1anlhdE0ySno0dG1GamtkTVdaUnFzbTBKajdv?=
 =?utf-8?B?Wk5iMHAwZnJQLzRoWkU2Q2tFM0t1UCt3T2N1WDc3S2Q4L1E4eDB1OGRXYmIv?=
 =?utf-8?B?d25VQ05sSzlwU3djbG5TcHBYbXNnLzAyWkdSYTZFQkFhWjdtVEZ0WU5NdjZB?=
 =?utf-8?B?V2RYZzJoVlNRanBmTWx4ZVhCVDdjR3AvUzJZNVZmMUV5TnhSQmVjWU51U1hL?=
 =?utf-8?B?UU96Rm9VOTFmT05zelVPc2tvTFIvNkMweEdVeVF4c3BrRHhiZk5GdDY4RjlX?=
 =?utf-8?B?aHk1SCtERHljWFUrZGNhTmRCTHZHS1BCanl4eWcxb2lsVk5jV3ZsWGJqK1pi?=
 =?utf-8?B?QjVBT3BqYVk3S0JMbEtaZy9lU0k4QWh6UkxEdFlNWnhKSS9pd3R6Y1ZSNlpw?=
 =?utf-8?B?dkJtQVpZaGFtSnlhaXNKU1FhMFh6eE1rSUxTblBvb2p3Z0Y5aWxnTzBmaHVu?=
 =?utf-8?B?WVZ5RzZsRndrYXF6NlJ3K05jaDRWRER2NUlPZUZIUTZ4c0l3alM1VVlqQ0VG?=
 =?utf-8?B?S2VVUjI2azVJcDY1SFF0dVRKYjVqNnlMamFDc2FGdm5KOWQ5NVJWN21oZnpY?=
 =?utf-8?B?UEVWVHE1NlE0Z2VKT1Z5a3diUFJzK3J1ZnJTdVFpRitrUGpnaG5DdlZUWWJT?=
 =?utf-8?B?WUp2ekNFSmlpaWNWQ3hwSzBjUlcxRXNFOHNPL2lXMWFkbHY1YXpNbjdvdVVl?=
 =?utf-8?B?bDh6bkhwSldoQmZWZm5ra1NDWUkwNndPdng1djFuQmxKTmJlMVRuZ21FRGtP?=
 =?utf-8?B?RXRHdlhKbytuVzdzbml3TzZjeGMrd3l1N0hSTFJpOHErQ0huTE5vNitGT2NG?=
 =?utf-8?B?WDJLU05PWTBidWk3ZFo2VWZCTDRXK2xQdVhhREFOeDA5VEJ3MlJFWHRrcFNP?=
 =?utf-8?B?Y3lDQmVTNUUybldET2Vzb04rVHVKOXl0MnZCOUxHK2lsVThtY2I5VHdaY0Rx?=
 =?utf-8?B?Rm91Z3dJWGhsRk5mb2FlSGlZSUlWaC84R2dzWkIwaDBSMlNEenYzUnB5SnlO?=
 =?utf-8?B?dSttcFlXUzVLYUxJZjBobi9udXdMT0V3T0tZdWdOck5WaFRKeCtGeE5yVFVj?=
 =?utf-8?B?eWlzYWNrNTFpbzhocG1ML2pGYTNLVEYxK3UxbGoybFhWaWxoV01BZzhtRzBK?=
 =?utf-8?B?cGVFYlpEYm1WZ3o2QjFzSFJhd1VVcWxpbDZrTGp3ayttaXczQzdEd2hDaXpo?=
 =?utf-8?B?aE5SY0p6N2FaSjJpWHR0TkhFaHY0S1pwL2Z6OFhlWlplMTF0ZTBWdkVvY0pB?=
 =?utf-8?B?UXF5RkpJM2JIYXhhQUlNNmhxRHhmM0VqOE1wY2NvRXA2ME91RlFUckYwQUx6?=
 =?utf-8?B?aU51MGlxanFCY01NZlU4eXJVUU9zTTQ2WG9WMEI3bXZyTTYzTVQxOVhoTXBa?=
 =?utf-8?B?TmJTQUFWRVd2S3FwY05VZXN0R0NqaXR3WEVZZitaQytCdStVdWw1am5ZODA1?=
 =?utf-8?B?bUdYeit5NUJSTG9LeEVIdzFMR2dKdVo4NE54a3lNM01ydHc0Y3p3eDJBWHZT?=
 =?utf-8?B?T0ltU2NzakorUzMwK0t1d250d2o4VVlMRGdFcE03aFhTcFlDYjVzSlNtVmdp?=
 =?utf-8?B?SWFQUjBGYmFzTFFOK2l2WkxwQ1hOSGhFeVRVV2RIcnpqTmhGVWlIV1VGS0tQ?=
 =?utf-8?B?eFRLZmd5cDc1dWFCRFAxOTJYSEFNZHJNR2poY2RkT1hHYXRBMDdZS1B6R21h?=
 =?utf-8?B?WmdLR1dvYlk2alo3bGdzKzNiZ2VCWmU4NFlNUm4xYUY0OHFRMkZzclFvckFS?=
 =?utf-8?B?R3NHWFl4akRLZEZrSkNUODE0aWRhOWRvWVpIZHBwa2dQK1pOVC9uOWZDVzZ2?=
 =?utf-8?B?cXN4cU1KdkhjMEZjVFIzWnhjQ0FINXhlYitmS25XVFBUcDJGaDhLdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2113e863-69ce-4f05-bee8-08da179c0c04
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 07:07:01.1414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6A/MbjI7NXcqRM2amuHjHY4a+HbRtpOnshFOCkWCgrXGmAzqnUl7xC5HcsOMjDXxoNb919ZNjwP15A9jRGfibg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5877

On 05.04.2022 19:17, Jason Andryuk wrote:
> On Mon, Apr 4, 2022 at 11:34 AM Daniel P. Smith <dpsmith@apertussolutions.com> wrote:
>> On 3/31/22 09:16, Jason Andryuk wrote:
>>> For the default policy, you could start by creating the system domains
>>> as privileged and just have a single hook to drop privs.  Then you
>>> don't have to worry about the "elevate" hook existing.  The patch 2
>>> asserts could instead become the location of xsm_drop_privs calls to
>>> have a clear demarcation point.  That expands the window with
>>> privileges though.  It's a little simpler, but maybe you don't want
>>> that.  However, it seems like you can only depriv once for the Flask
>>> case since you want it to be one-way.
>>
>> This does simplify the solution and since today we cannot differentiate
>> between hypervisor setup and hypervisor initiated domain construction
>> contexts, it does not run counter to what I have proposed. As for flask,
>> again I do not believe codifying a domain transition bound to a new XSM
>> op is the appropriate approach.
> 
> This hard coded domain transition does feel a little weird.  But it
> seems like a natural consequence of trying to use Flask to
> deprivilege.  I guess the transition could be behind a
> dom0less/hyperlaunch Kconfig option.  I just don't see a way around it
> in some fashion with Flask enforcing.
> 
> Another idea: Flask could start in permissive and only transition to
> enforcing at the deprivilege point.  Kinda gross, but it works without
> needing a transition.

I don't think that would be right. Logically such behavior ought to be
mirrored to SILO, and I'll take that for the example for being the
simpler model: Suppose an admin wants to disallow communication
between DomU-s created by Xen. Such would want enforcing when creating
those DomU-s, despite the creator (Xen) being all powerful. If the
device tree information said something different (e.g. directing for
an event channel to be established between two such DomU-s), this
should be flagged as an error, not be silently permitted.

Jan


