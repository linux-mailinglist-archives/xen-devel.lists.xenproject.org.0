Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CC2401E30
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 18:23:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180113.326619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNHOp-0007hD-3O; Mon, 06 Sep 2021 16:23:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180113.326619; Mon, 06 Sep 2021 16:23:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNHOo-0007fO-W9; Mon, 06 Sep 2021 16:23:10 +0000
Received: by outflank-mailman (input) for mailman id 180113;
 Mon, 06 Sep 2021 16:23:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4nFA=N4=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNHOn-0007fI-7T
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 16:23:09 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0a42d75-f702-48f0-996f-eb4c9c6b15d5;
 Mon, 06 Sep 2021 16:23:08 +0000 (UTC)
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
X-Inumbo-ID: d0a42d75-f702-48f0-996f-eb4c9c6b15d5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630945388;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=u1wCfwPEvija+X5nLmaV5L/jHHDMUlypZ4kYBWYJFLc=;
  b=UVeHqI3PbgBIWWRqVlPlJ31Wg2bNj4pUzJq9e51VR/Hxfp9Od9/ivGVF
   4M1vEyqsyEM4LtZJwCxRBplEki+J32prWw1y/d4ncHZEKCnM8WKnsHZdy
   keEY4DDPFFpe+4hWImhU9xfQlIfE3+xshbx1B9cXjaOBJbzzcsmaPurV0
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: aITdVDxBJwvPSCi6ug98L7fiFhUqZAEmE49LuZRb8tAR+VQHXlYJYu6vDfuMmiDcdZxk7S2VWY
 1l6zwaYvqJlHhUOb/8BX9AaRxvZHvSdlZWAyXaNGnTLP/59iSbaB6oQR04NbQJUkMX+g58peyN
 jIPD8T9zJLxCAjtgSqEPLKuK4lDj+wjb7e2DWVl0MrjATjWYMlXxT102P/DqGcPyNuk60xSGXJ
 TVGNBm73WHkwzeNY1KkrNreOGkmLc3BZ13QK2AaOhxoGQw/Tho1qzul7gpxLVllFtSZwL47sCm
 2ZuJWT1uuiWLInjdkfKuYXjY
X-SBRS: 5.1
X-MesageID: 52087671
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:zXrAXKx/Q+h0wKGZ1WfOKrPxu+skLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjkfZquz+8L3WB3B8bfYOCGghrUEGgG1+XfKlLbalXDH4JmpM
 Bdmu1FeafN5DtB/LbHCWuDYq8dKbC8mcjC74eurAYfcegpUdAF0+4QMHfrLqQcfnghOXNWLu
 v/2iMKnUvaRZxBBf7LeEXtEtKz6+HjpdbDW1orFhQn4A6BgXeB76P7KQGR2lM7XylUybkv3G
 DZm0ihj5/T/c2T+1v57Sv+/p5WkNzuxp9qA9GNsNEcLnHJhhyzbIpsdrWetHQeof2p6nwtjN
 7Qyi1QcPhb2jf0RCWYsBHt0w7v3HIH7GLj80aRhT/ZrcnwVFsBeoF8rLMcViGcx1srvdl63q
 4O9XmerYBrARTJmzm4z8TUVjlx/3DE4kYKoKo2tThyQIEeYLheocg050VOCqoNGyr89cQODP
 RuNsfB//xbGGnqL0wxhlMfheBEY05DWitvGiM5y4uoOnlt7TFEJnIjtY4idixqzuN6d3FGj9
 60epiA2os+F/P/wMpGdZA8qPCMexnwqCT3QSuvyGTcZdM60k322urKCZUOlauXkc8zvdYPcK
 qoaiIviYd1QTO3NfGz
X-IronPort-AV: E=Sophos;i="5.85,272,1624334400"; 
   d="scan'208";a="52087671"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOO1SQlkNfM4CFHZATNIChtWTYk0nmSUW/JPaop/kFLLa3t8LA03ZmrL06/alYXUrmgoiOZlPgValUNeyagmNkDnLrzAd4pcxEerdJ7NGyj2oK6FrLBVUkiG9/4pIJJu3z+YZIar57IvP0009aBjOf7e+OqHOctWTW8hbSVhNnhzjTfHp1szmO3Yw7KkU1zkQOjWvCKghGcgElGfL3/EvhAYTaFwpML0KgDvtZUjUaUecQnGFvr5CD8sIsXNVqU4rYK2NblAKKr5nkcS94G3PC8dRvacbGSxJJ672c1GWBcxxDOJq8/FznaG+hgJ8X7UnMzfqcvEKVYVOQXIjQKtZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=NAWywoEhPXo8wkSkHOONStkbpBdXvcsyCBc2lneyBb8=;
 b=JY9L4atVHGv4TcCF0173og2a5Jt4HI92+8mWy+xYjUxC6tp5MH/2COBVn63AVApXqr49LmtG+UBjJMN7npXtIl08eoCLjnQ6CziWiubRy2kG7cIIMtvwsNCFGHm/7noK4v1VDK7Dz45qICgD4yoz07TmrqRJICc1hHz0e4lTTNvBKxqgi1KDvxnGFG8cf2VaprdTDRwlrfVJWtSAUczNBucP9JBbEeKdvxON0gh4XuZX63p/hgZ9fvBj3WAYcGabMMDx6jifPoRnGkC//uODfk4gMmdJCRgHy3GJwVQGG8Pb0RAS61tM1Y5lJS1P2txSZtiKgReLjEjmBCIQkFRpBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAWywoEhPXo8wkSkHOONStkbpBdXvcsyCBc2lneyBb8=;
 b=Lvk3Pn0XCfqaIefxTbHUGsKn+aUC3NsmIDeX5NOcNoubMPyZrkHYicQOAJ2CZ6rOoIgCOKNm2mXP/I1zcnLQOL0PqNsA1nQtyfo8dE6PnlwKdY+DZvLku7YMQXvW9do/LYFCh1UKokpbhnXKsjeniGxz0xX7LvZAbvs26wjhf/g=
To: Jan Beulich <jbeulich@suse.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
 <20210903190629.11917-2-dpsmith@apertussolutions.com>
 <3a91e4ad-50c4-205f-3d90-f23c996b2938@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 01/11] xen: Implement xen/alternative-call.h for use in
 common code
Message-ID: <8c3dfbf5-5c98-c923-ca81-28af3d13c4a4@citrix.com>
Date: Mon, 6 Sep 2021 17:22:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <3a91e4ad-50c4-205f-3d90-f23c996b2938@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0073.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ed4c017-7bdb-482c-0433-08d971529a9d
X-MS-TrafficTypeDiagnostic: BY5PR03MB4999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB4999EB93616B75F091DFFC13BAD29@BY5PR03MB4999.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S8M8Pzy2Km16DGbI2YEXgFY/yzi/jufCOAVbZw7CZi9T/6st6i5gCw0vTIRSsYEVsEr4RtoWiZqRPhGV63bRIi1QDDAHeuuunQ0d/hZ3NvHEm3hGmXHS0bN4OsVYmMJU4GQGboyljTX+lDF74Qe9ANpJTfttvABUbsT8GAy5k2dFhzfw4DWPxkypv1mRB2xqAlPrJVJCGYv9UADyiv+y/d+wITJES2DRePZPMF1KHmXD+cAUFTXPAiwutcmprWq2JSTSq2cO+Gqe3UjjXvtAJAaerITQ9tX106avc/Ij0XYmOZ3juBrZ+dECfSUS7X21tKTHSLyfPaBefaZuscrvKZDzayF60/Q+SjO0m9n/yRC0XXbaWUaOGO/YjtG7nhtKjQuVP8ymkDjhR3z5i3FqDB3bzIDf+gNU9pWfVZUns3VM4YwXUW9zPWpM17bwJG4JKQU8EeENNVfyFYq843EVg97z3UR5tSNE8BnhskIv8ttF8a4gU+pQXvm95HX88jQm+YW08SEO5K1V7ovvqm/htRw6S4NYjqXt43A4KpsfwCVItGnnqbV5xRZchQxAAisZNiBQOb1/2pFRoJfAvCItL4CymOo7emov9CQch4SBJDO/Qy1dF0PVhHBE0qhhfWDOCuqq+KgZIo0ov/v6uI353UR168YKGbYNgXUvSIPWfw40wXBIrq0BJaS9sWbqb8YKR8cbm73ZKd7MdFutNDk1vFbJfKOpnYLi1DG8oV8ga3rE2pM6+Png7Fe6OvWkiau2yQR+/AnqtKefyXkvzGpn/knDkQFjg2UqMjTxCmkchTtPHG4SaDJdqMm4SDAsySgk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(38100700002)(6666004)(8936002)(4326008)(53546011)(2906002)(6486002)(66946007)(5660300002)(26005)(956004)(966005)(186003)(478600001)(110136005)(66476007)(16576012)(66556008)(2616005)(316002)(36756003)(83380400001)(54906003)(31696002)(31686004)(86362001)(7416002)(55236004)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTJuOFNxbklqSzZMZ0Vjc2Q4cVlHNytDbGI2WTlmT0JJVURxVVBYUHBQRVdG?=
 =?utf-8?B?YTdsWkVtb21yVGdic0tqZ2IyV2M4eFFIL2I4QUs1KzQ1b0xOY1FVMVNsUFEy?=
 =?utf-8?B?K1hlUHJ2K1RBZmw3RTc3UFRIdWJUUG42SkkwdEN6Wk5raGRBTUFkSCt1OTh1?=
 =?utf-8?B?QUNub2pLR0VLNm5qcGtQRkpmK2I0aVM4SEZ0YnhDWHFBUUtuWTA3bDVmNGdQ?=
 =?utf-8?B?NXhXWERVVWZBNFNSQlU5bE1lN2NoMlpaNVBaZEh3c2lLODMyU0wwaS9NbHRL?=
 =?utf-8?B?bGVzTzVVNjJHTmc5OE5mK3VTVUJmejdrMDZYRE5COGxKWE1tbnNUZWhZQ1Ju?=
 =?utf-8?B?U2NmSFd0OEZxdG1PQ3Z3c2JyVUJFdi80UXpRSThQbTh4am1BQXZweXJhWE9x?=
 =?utf-8?B?Qk9saXRSZzFXN3F3NmdOUWlKR096SVVvTWhHS2poZFhMb1JRWldHSFpiREtp?=
 =?utf-8?B?R3JoV0NUQ1BNZDJ2czNqZDFLRmk3Snh0ZnRocXF1THlIL25iYmhMUXU5NHc2?=
 =?utf-8?B?TnNzUVhyRVpjOWpQdHNHRUNObFhtbVR6aHE1UEg0aGNCUFVXRVJOMG9wSGw2?=
 =?utf-8?B?T2RlRE4rM0k3bkRnVkFmRUZXQ3EzQTdMcTJtNEtpK0FCdmo4dzhjZVJmY1A2?=
 =?utf-8?B?eUs4QlF6L052YUk5dWRKRUZYNFNTbkZUdWZ1TlhEaDhBdjRsaFVTNHI5Yzl3?=
 =?utf-8?B?U1ZTVnJWZVkxa2Z6cDdqMi8rSjVnYm16TVFBQjA5Y2xzeFJpb1FjUzVUTEt5?=
 =?utf-8?B?Uk0zTGlnVVZWRHJyaVJFdkVQdmdZczYyY3NtVmlmaUdzeVBKWWs4akxoZk04?=
 =?utf-8?B?TmFkNDZWNzJlT0E4Z2Zwak9jQ1hZV0tVOUtSaXlxdlBLRHc2NURoV2JrekVI?=
 =?utf-8?B?b0RzRVVaV1pxZ1ZmMGE4bXgyQ2JDK1R0UzhHMHlVRFowMmdDaWExTERnc3dV?=
 =?utf-8?B?UTVNN09NeElyL3VZNmd3eXQ3R083dVdtVTJXR2JjZ3VWS3ZCNnJvM3BFVE5G?=
 =?utf-8?B?citGUkNKNzRaL0svdHN2RGNZQ1RmSm9wSjdIUHMvdElTdEYrSWhDaHZwYlU4?=
 =?utf-8?B?SGo1RkgwQ0VlaFc1REhTOERGdS9IV1Jrdmg4NitqVXRJY0dNQU5wSFJlUjVC?=
 =?utf-8?B?KzFDMHpiNFZ3cTlueFRnU3RGbjRzNG5nbjRMZXJqMW9kYnV4azVOR1Z4Yldy?=
 =?utf-8?B?aWNZc2x4Q2VEeVFhTGJYYm42WG5Xbmg5NU5IT09vYlZIR2hWbW9ibEVHU20v?=
 =?utf-8?B?VzR0VE5Uc0RSTjRDMFRxVm1FYVpyWi8xSlpISHFEWTVHVmZOemNPQ0RKd3VU?=
 =?utf-8?B?YzRya243V2VHd01JOE56aC9ZSFJjZzliZUlrckt2QnN2N2U3dGhTbEk2dGhU?=
 =?utf-8?B?bDcyTDdWcmJHYUZ6L0c4MmtLZUMvUENjNzFqYWdmTHVPMUlEaS9DZE5Vb0pX?=
 =?utf-8?B?Y0RkQmplWWFVeUF1U0xHMXlxU0xENFgxekUvKzRrL0xZMGJFcXg0RzNFUE5z?=
 =?utf-8?B?cjRIa2xPeVFNYlkxbit4ayswSVBhNURISXVRSTYyRkhKdXpXZkpybWhwSFVt?=
 =?utf-8?B?RHhHRzRSNDFEUnVyRUZjSHFaVmE5Y1JXa0w0dEpIN0NVY25GV2JVNmFMRW03?=
 =?utf-8?B?bWhYMWNwLzA0a1BJY3l6QnhLSkdFbFhwSWtudjRpa1h3ZDZ3bFNSZzZJZW1V?=
 =?utf-8?B?WldGWGhiNGN2WmZWbloxNFl0ZmFlNE9aQVQwR0EwSVhkYVlwWkJjbXBXOTdE?=
 =?utf-8?Q?pRr0iqgym/G0s25DznuxOH0eM61WXZ4kRCRwAYD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed4c017-7bdb-482c-0433-08d971529a9d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 16:23:04.6363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b8JpsDCd1aPMHBe6+AtHdoddaCrt7jQ8dqi19yI4P5bWk2gA/jBNHnMtBPPaN0pcQsI9BXBdrquNkL4ha5QVNHwCIm8k2LEqK+IiD7IQ+vM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4999
X-OriginatorOrg: citrix.com

On 06/09/2021 16:52, Jan Beulich wrote:
> On 03.09.2021 21:06, Daniel P. Smith wrote:
>> --- /dev/null
>> +++ b/xen/include/xen/alternative-call.h
>> @@ -0,0 +1,63 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef XEN_ALTERNATIVE_CALL
>> +#define XEN_ALTERNATIVE_CALL
>> +
>> +/*
>> + * Some subsystems in Xen may have multiple implementions, which can be
>> + * resolved to a single implementation at boot time.  By default, this =
will
>> + * result in the use of function pointers.
>> + *
>> + * Some architectures may have mechanisms for dynamically modifying .te=
xt.
>> + * Using this mechnaism, function pointers can be converted to direct c=
alls
>> + * which are typically more efficient at runtime.
>> + *
>> + * For architectures to support:
>> + *
>> + * - Implement alternative_{,v}call() in asm/alternative.h.  Code gener=
ation
>> + *   requirements are to emit a function pointer call at build time, an=
d stash
>> + *   enough metadata to simplify the call at boot once the implementati=
on has
>> + *   been resolved.
>> + * - Select ALTERNATIVE_CALL in Kconfig.
>> + *
>> + * To use:
>> + *
>> + * Consider the following simplified example.
>> + *
>> + *  1) struct foo_ops __alt_call_maybe_initdata ops;
>> + *
>> + *  2) const struct foo_ops __initconst foo_a_ops =3D { ... };
>> + *     const struct foo_ops __initconst foo_b_ops =3D { ... };
>> + *
>> + *     void foo_init(void)
>> + *     {
>> + *         ...
>> + *         if ( use_impl_a )
>> + *             ops =3D *foo_a_ops;
>> + *         else if ( use_impl_b )
>> + *             ops =3D *foo_b_ops;
>> + *         ...
>> + *     }
>> + *
>> + *  3) alternative_call(ops.bar, ...);
>> + *
>> + * There needs to a single ops object (1) which will eventually contain=
 the
>> + * function pointers.  This should be populated in foo's init() functio=
n (2)
>> + * by one of the available implementations.  To call functions, use
>> + * alternative_{,v}call() referencing the main ops object (3).
>> + */
>> +
>> +#ifdef CONFIG_ALTERNATIVE_CALL
>> +
>> +#include <asm/alternative.h>
>> +
>> +#define __alt_call_maybe_initdata __initdata
> My v3 comment here was:
>
> "I think it wants (needs) clarifying that this may only be used if
>  the ops object is used exclusively in alternative_{,v}call()
>  instances (besides the original assignments to it, of course)."
>
> I realize this was slightly too strict, as other uses from .init.*
> are of course also okay, but I continue to think that - in
> particular with the example using it - there should be a warning
> about this possible pitfall. Or am I merely unable to spot the
> wording change somewhere in the comment?

Such a comment is utterly pointless.=C2=A0 initdata has a well known meanin=
g,
and a comment warning about the effects of it is just teaching
developers to suck eggs[1]

~Andrew

[1] For the non-english speakers,
https://en.wikipedia.org/wiki/Teaching_grandmother_to_suck_eggs


