Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D39E3C6A98
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 08:29:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155017.286310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3BuT-0006Mi-Oa; Tue, 13 Jul 2021 06:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155017.286310; Tue, 13 Jul 2021 06:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3BuT-0006KG-L8; Tue, 13 Jul 2021 06:28:49 +0000
Received: by outflank-mailman (input) for mailman id 155017;
 Tue, 13 Jul 2021 06:28:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3BuS-0006KA-6y
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 06:28:48 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8792dea2-1874-4e82-a2bb-07d38347eeaf;
 Tue, 13 Jul 2021 06:28:46 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-TsgJPXppNbKl3VgTu-LKlQ-1; Tue, 13 Jul 2021 08:28:44 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2446.eurprd04.prod.outlook.com (2603:10a6:800:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Tue, 13 Jul
 2021 06:28:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 06:28:42 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0008.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 06:28:41 +0000
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
X-Inumbo-ID: 8792dea2-1874-4e82-a2bb-07d38347eeaf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626157725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7zd019r5dabsAbw9PEOYqJoOKhTQ9EnewFNJ+EinRTE=;
	b=Sn/WApGIB9sKf4vFLXF+/HUyaO8KRdMAGycXXK0DLN5qzQsIdRMn+2+9Nz2bVtvqH0toYD
	Rceg/Mbo4T6LuswD24qesH64eTltHXJ/27QNfTOx7J8kNEbizC7llAyQOs/hD3HG08Ull3
	bz9oWn4lrYBXf5nFmCvL3m6RgWWSJOk=
X-MC-Unique: TsgJPXppNbKl3VgTu-LKlQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxrO3ErhX1EjxGp7/GM77hGL9UZ239Lq7jyKNu3dRvWUHmTWGM7PnGqOq6PPQAVPQ/fEpB7zOJiwnw1BLuKhKaJEYT9R1jdFx7GB5/8Nd1DnK0AjRWOf7FALh1OCAeBWO1CsAO9CH+AXJL+zJDgDN/71PaV72KW7z/Db/+koJK233UgkYdxeh8IKeS7+/CiHpBLJ4qdz3sgvOUM47PyIAR+aSGvCC1Ssu7BXTFISn2qE3/kD+nWCACbBgUFF4z9j+D9T9d9fsWzCeSyOxEyXWQ3JSwS/Mz7dXxr11Gg2A/gWgtn7vaAvbhPhFQbCy25NowKCaeslbt3nK9felwlXqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zd019r5dabsAbw9PEOYqJoOKhTQ9EnewFNJ+EinRTE=;
 b=A1d2uMiXU7bLW5HWdGxOg4SI0eQKvgGnl0v6UZ5SaBL5XASnsKCnsX9dCI5BW9l3ts5q2SII+OzTu8iBcGS3svXtSQ82z1cfVyPOi8BtW9rGOD7UoW6yYP3cam8jDgdbO9SgUJ8O/t7ddx8etwfiQuHyrHFP2/O9GMfzaSK6g6fysSkyV+i4uQVeKNcxdpF5H9lvlsb+YqOqNkTBLY49pqFcGW8Tn2/h8EMXfVun0GuiaU0R9r3Z64Q9XffrVon1N2sP19F0iCxZzxGDrn/ftroPilO0MKDdOV3MoDV9vyhhrs+fB+iz0oKrZA3ZgahGGx+qS/qkrjMsEyKKw2HuDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 01/10] xen: Implement xen/alternative-call.h for use in
 common code
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-2-dpsmith@apertussolutions.com>
 <2a794038-f4f5-1525-5af8-d89b687a8043@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4a55dc14-5d02-2594-38e8-f732ead164a6@suse.com>
Date: Tue, 13 Jul 2021 08:28:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <2a794038-f4f5-1525-5af8-d89b687a8043@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0008.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13dd9262-a8fc-456b-48db-08d945c77566
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2446:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2446D0E3269042B6C75BAA39B3149@VI1PR0401MB2446.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XzqrYtgma+aALz53p/ts9id9Od0DguyFzEKIUzRvw2Zawuf7b+5e4G7IItJ2o1gcen84q1JxUtXixk32QM+/9+pxj1qHXP9YekHJqilwVcQipsmbFseMhopF/1ZHJe56rCQUmqjM4GdT9ozNZF0cCpnEgpl4NcMCWT+a+2xO205taljIhISJhgNSgBmo8EUhjj7SMH7BGgky3iGAH1FWgsyRv7BbKd9R8Npv2EkCQB5M0DqCJHRyquzwUK1Ormeu6FlyGZdVRVZWIbDwvPm7mm1FM5S9yjsaic6O/X0DN5p2mHri/Q6x71/N1a1JqAmZ+sGX40glMeIwSwhVdHAK3Hj54XouJe1U8K1AsaocPAs9IzS5EaUrtlKXcYX4N7L1eJ8LY9epM1SeWGYBZJL1bfwKN7cQ6x415dtHR086//ZSiGBiJi+tdFbGjTGQisCYZZAR0oNgJWEeo8N8VqpVfJGjmw4j5y19tvZ4XeaRv6DMvT0vLi017006kJfVBm/CCHQ1rTzOFtMLRGFvxc0duevFmH1LPJiZwbKEpOfOGprxhcNyJIUlUx1zDTvixy4NwYPRL3i6FW8qOZlGhj9m682Bdtlx8wG5KeZlNxA8X4zZjjdFX1L2CEt/71hM7jtNn8Cx8Oho1++nJ/AqgxQ4wc0CZ8XKOmQ3jJaLJG5l+Hh6WbjK+hG+8uirAmAtq8WZYazUvcmKfQKzrLqBj8UXk/eg86YAaLcNtmznDJLRSrg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(39850400004)(396003)(376002)(956004)(66946007)(31696002)(86362001)(16576012)(316002)(26005)(2906002)(5660300002)(36756003)(66556008)(4326008)(2616005)(31686004)(54906003)(8676002)(6486002)(66476007)(110136005)(53546011)(8936002)(38100700002)(478600001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWdZa2ptSm81Q09Hb0hKNW9seVJNSmsyNHhMUG04dlIzbEtVcVE4QzF4Zldn?=
 =?utf-8?B?UlVEV1V4NFYwMEVJNGxVbTRadFZMRktnMTM1QlFkSmdUNWw3V1pHanJ4eXV4?=
 =?utf-8?B?eGFxSzNzekovWkVCMDhjVEpaOXNTbFVTdUQ5MDh3N3N1ZCtTOXRPN3FQMnZv?=
 =?utf-8?B?WHRGS0xCaXE1UlY1a29HQnRmY3BQTmRZTmZZaXVuYjBkVjZEMXlrZmtLYkV4?=
 =?utf-8?B?SzRDNitMOXZLQzRnTlAxUmxEU2JyS2kwVUZKTXJ2WURJYUkvcUh3SFFlYVVJ?=
 =?utf-8?B?UmZhMklxbENnbTdnRWh5MlcxamlqdXJ0RWJqVlpPUXYvUXUwbmIxYW5hcFVa?=
 =?utf-8?B?ZzZlOUtXOHhpMXphQk0xTkhON2lqbUx2WFZCbFdUUnk1elRWYlpHZ0xQTzdm?=
 =?utf-8?B?MVp4NzUyTTJiV0p4V2kwVGZjUVBVaC9tcnQxdHJvUktNVjRQQ0RYd3IxK1Np?=
 =?utf-8?B?VVZnM2dpNlpxb3VyeWV2RWVHUUJ6TFVFYmNmcE9wNUJsaTdGWlFHZlExSTg4?=
 =?utf-8?B?N0k4ZFpZdWRRYTl0czAvK0VrSG16bVltL21YbzZ2elNzMG13NEpHUW9ZTnJM?=
 =?utf-8?B?Vkl1K3ZDSmlmd2NVUkwvNHZpanhRcVNXd3pEZjd4cHhmWkVNNHlpYy96SVNt?=
 =?utf-8?B?VWs2NFFOQms5RUdZOUxEUTJPSTR5QU9OdmNtTTVRcmpVdmVmd3B6RG5IUHFk?=
 =?utf-8?B?VzZ6cEE4R1RXeGlkekVVdVpWK2tFTmlpU1RUY0Ywa1RzdVRoNis5ODlBUVRI?=
 =?utf-8?B?M1RtckFEb25paml2aU5STHlKSTB6TkNHcDg2a0VpU1lCd1k3a1c5cXl6ZW9H?=
 =?utf-8?B?dzJKMmh3NkxBRTFDVmlFL0R3b3NsejJGcUloWXhhZStFYTFjbmdzQVhjeFVv?=
 =?utf-8?B?UzBWZlYzUUJTd1RNYWcwbHRnd1VoVWdFOWx3TDBIWldCNy9NTHJwRVIyZnc5?=
 =?utf-8?B?YkJFdzgwUXN0bDBkRjVzUlZCdFFtaENnam9xczJDZTEwNGRrOXJMalFSZENh?=
 =?utf-8?B?YUt3c3lhVEtNVU1FQ2lDM3JveWY5ZU1mM2F3am1VVHhuRVdVdGZ0VXppeHRL?=
 =?utf-8?B?ZGcxN0F5Z0NMQ3J4cnZ2UHo5OGJGaGVhZVlRTkRVK3dZaEgzem5IL2I1a1JQ?=
 =?utf-8?B?SjJmY1JIYTE0WTZJZFhxSzFMQjIzd3RmMmlzazRNWVJyajhNTEkwUHlVOWdx?=
 =?utf-8?B?b3ZPSnQybUJlZHJhQ2hodmd0ZmhrK2IxallPNzhSWHdnemxBUEJ6S2FXeDE5?=
 =?utf-8?B?MVgyWTZTRk9uMWZ1T1JTTEtBZVdudE1sNXIrb2FISm9UdmxBQkZHSkZwM2pT?=
 =?utf-8?B?ZDcwd3gxbk9meVhqL1A3SlRpbkgzQ3ozalFpMUZndkFndnQ0SmpOV2FsdU5E?=
 =?utf-8?B?OFRvMmhYTGdqV3o4ZVNWa1ZSNEFxR0hSR1ExVC9ERVlTUG9NRlRtcXRZUE5T?=
 =?utf-8?B?WmtoRFFoa0dLM3hIOU0xazQwcjVicGdjNTdWZFlLZWRtZHp0T0JBNVE5b0Rv?=
 =?utf-8?B?bFRwZnl6NDFzU0Q4VjJMV2ZlYXI4bk8rdldqR0ErVkRZZytuck0wbnhIOFNT?=
 =?utf-8?B?eHdWd0EwUDE4R2dXbnRqZ2NiY3hibFJ6dDd0Njg2N3RWN3J1ZDBGTHl0ZzRl?=
 =?utf-8?B?YzBTdnZFcFBXTWFPQ080S2lCOVNTRGZxV2VEZlpteG5kdTVKUjRGVjFjS2oz?=
 =?utf-8?B?Y29MSHFxUFB0WFdyR2dERUNydzhCNGg1K2xDS1lSNjRkQVhPSEkvL1JWczd2?=
 =?utf-8?Q?tSKiIK7HoAcNGppCkDwLm0qEaofpHilPb7iQhoO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13dd9262-a8fc-456b-48db-08d945c77566
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 06:28:42.2920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ni7Y7b7Ci/Xj7Cg5fDJmmmsmPwAQ19SrIqjPutmSgZMW/wf/2t6GfBvLfrRnl2O2m9ZttAUQQoSWarF9jBi+jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2446

On 13.07.2021 01:48, Andrew Cooper wrote:
> On 12/07/2021 21:32, Daniel P. Smith wrote:
>> diff --git a/xen/include/xen/alternative-call.h b/xen/include/xen/alternative-call.h
>> new file mode 100644
>> index 0000000000..11d1c26068
>> --- /dev/null
>> +++ b/xen/include/xen/alternative-call.h
>> @@ -0,0 +1,65 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef XEN_ALTERNATIVE_CALL
>> +#define XEN_ALTERNATIVE_CALL
>> +
>> +/*
>> + * Some subsystems in Xen may have multiple implementions, which can be
>> + * resolved to a single implementation at boot time.  By default, this will
>> + * result in the use of function pointers.
>> + *
>> + * Some architectures may have mechanisms for dynamically modifying .text.
>> + * Using this mechnaism, function pointers can be converted to direct calls
>> + * which are typically more efficient at runtime.
>> + *
>> + * For architectures to support:
>> + *
>> + * - Implement alternative_{,v}call() in asm/alternative.h.  Code generation
>> + *   requirements are to emit a function pointer call at build time, and stash
>> + *   enough metadata to simplify the call at boot once the implementation has
>> + *   been resolved.
>> + * - Select ALTERNATIVE_CALL in Kconfig.
>> + *
>> + * To use:
>> + *
>> + * Consider the following simplified example.
>> + *
>> + *  1) struct foo_ops __alt_call_maybe_initdata ops;
>> + *
>> + *  2) struct foo_ops __alt_call_maybe_initconst foo_a_ops = { ... };
>> + *     struct foo_ops __alt_call_maybe_initconst foo_b_ops = { ... };
> 
> It occurs to me after reviewing patch 2 that these want to be const
> struct foo_ops __initconst ...,

__initconstrel then, I suppose.

> and there is no need for
> __alt_call_maybe_initconst at all.
> 
> The only thing wanting a conditional annotation like this is the single
> ops object, and it needs to be initdata (or hopefully ro_after_init in
> the future).

ro_after_init and initdata can't be alternatives of one another; ops
(until be gain ro_after_init) need to remain in .bss (or .data).

Jan


