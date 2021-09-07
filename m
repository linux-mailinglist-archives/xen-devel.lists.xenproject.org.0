Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB0640232D
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 08:00:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180387.327024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNU9Y-0000Pr-SH; Tue, 07 Sep 2021 06:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180387.327024; Tue, 07 Sep 2021 06:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNU9Y-0000Ns-P7; Tue, 07 Sep 2021 06:00:16 +0000
Received: by outflank-mailman (input) for mailman id 180387;
 Tue, 07 Sep 2021 06:00:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNU9T-0000Nm-Fk
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 06:00:11 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52529593-b699-4746-8d3d-60c68498e07e;
 Tue, 07 Sep 2021 06:00:08 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-_x-3ZE5wNjy6Jx3_XoJB2w-1; Tue, 07 Sep 2021 08:00:06 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB5905.eurprd04.prod.outlook.com (2603:10a6:208:125::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Tue, 7 Sep
 2021 06:00:04 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::ac:a0be:c26c:908b]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::ac:a0be:c26c:908b%5]) with mapi id 15.20.4478.026; Tue, 7 Sep 2021
 06:00:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0101CA0052.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Tue, 7 Sep 2021 06:00:04 +0000
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
X-Inumbo-ID: 52529593-b699-4746-8d3d-60c68498e07e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630994407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w83dYj+PDR5QgdknZkEX8CLqhAE+6ALYyEqWNgI6TFA=;
	b=hPm1l70O/RipXoriEuaSty5kILEoPs61WyX3P3HcEuYJeFuXliVMuEX07XlqP9PhjdfTLM
	AvbCfcgRl3P6eRS59+klkadfN88kPyV/iUHd2dukFCgnTNLkTZvbjiPE+ZSjZcKA7rmQSw
	q2J6871EMckI/Wwa34Y4GsqDzquJQVg=
X-MC-Unique: _x-3ZE5wNjy6Jx3_XoJB2w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lmsgw4LESNtND2ApvG38Km/fbF2zJCXhgiwJnvUBl5P4TbT4lEzJCD4tMl3j5bySPBXHrJpSDHX49l9MzgGb+MTPX1o4NMfQutgSFllTlH0GoroZVHoQBYD+6CcwDicSCUkrTbmh/hg3AuNgyFfaVfTFKT65/Xg6kRB9U1Q+5VdqgB2CGkj2YPgVr6u4TsfbIVD1ao+TI5z8xBnBn1lPTPHhIdv7PghiQUUFcdtuHMnMGjODr7W6ikDUXjWcW3hHklRF5OxcP91sXJCe9WPYyDDA6NVDDyTPlI1f4aQXje9HpFAf0t0KqoiJVKDASxwa6uVau6Pl9AvvpJwH1eicnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=wdBhc89sJrcmeLMeJkCx0mR3ZXIDHKOAM3UfkYNp9/0=;
 b=KbkZAH9+YVhOQBmnTvrJSjk+KaLrQZ03RXMP8rwCxnic11rb0VvCx0JNBCISGW/K5Y+35omo8fqPcY3ke9T1arYCwzfuixqa13miilNGqw+s/21s0uQBzEWpgqUTIdB2cmoi4FT/DLzb1KKmYlSYe6KsIu9MoB77D9hBuIVs0gaKLJq6poc3FHLAMcDkQvUE8CmG5zrcbGVAyWVwOdWerqE1KIM/mYpem92zBrrN9Ppo0MBdu6W3Zu2A15frNZySgW1HG/V9/XF2dh836LSlcSB6KDttTi2iVAy6hcr1SXnCzroQ4ldnq//gcbhNsC2cxtAg2khOk+G+QO1xgZEotA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v4 01/11] xen: Implement xen/alternative-call.h for use in
 common code
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
 <20210903190629.11917-2-dpsmith@apertussolutions.com>
 <3a91e4ad-50c4-205f-3d90-f23c996b2938@suse.com>
 <8c3dfbf5-5c98-c923-ca81-28af3d13c4a4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7e71ce74-dd81-21c3-db78-c37d95d5b239@suse.com>
Date: Tue, 7 Sep 2021 08:00:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <8c3dfbf5-5c98-c923-ca81-28af3d13c4a4@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM4PR0101CA0052.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::20) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14001ceb-ff84-4416-7d5a-08d971c4bccc
X-MS-TrafficTypeDiagnostic: AM0PR04MB5905:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB590556E6E119ECBD8ADABE84B3D39@AM0PR04MB5905.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H7ttFfQ3qWqnMmw99mi5eUcYejrNwksYux9Ys8WEZdMAHfkpUftxRtrl1ijmFmOqgKsMaVLo23hDnqR2sVKYRGx5JqWvJL3hGZsEZJ7xXXvIdET3fIH+0PFdCXSNJSrN6OkCimuKAepqnUR7FVNjsAuKxTQS9Y5IRE2yuDRQOFDOwUJyw8YW9s9MxKMJnAr93LfCWtIUJxduzqvBxr5huJQrAJ9Ab8vNw0c40m26eAufr+pXaG9dRfEJ+HNYF8BFcYcUahRJxozWIH0b/RdsHkL9mnvVm9aP+d5oJIsnuF7bXArERm3r2ZAObEf10LQWwizRpaTk1GRosvcKv5nCu0rRLVJGsvrW5v8Y6G2T7UhC9SEZNuwhcb7ar64bynfp4kB4leFbs/N9qxJ3tOJtu5r3wMNLmZSwkEkloi78DmnpRWdoAK9DbvtivMSHSc4b+GUbYZr9M93GM3ox19Ilc/q+DweykZ9t2CPuQO5RXwgOaSSjVuNVkZgnTPf1H5EEvvvakwnp8UiXZjp24CzIf3sKoYfBi7iXg6aerB0zgjqgYYDqRv0UsCVdsxnRmEbYfsrQS64PyB7vd4mGMmGfv3xYY2q6OGnZYyFfNKtu28UKpG24DZwypha2Q1oOZQ8DqcY51ewq0O8QBjY7P5qzg2K17gb4L9RbqR36cvYQ82kP9C2ximGChMu5IVMbGZsWmS6bJ0uyFyPgSpN12iuE1w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(136003)(376002)(346002)(366004)(86362001)(8936002)(26005)(38100700002)(5660300002)(53546011)(316002)(110136005)(4326008)(54906003)(186003)(83380400001)(16576012)(31696002)(2906002)(956004)(2616005)(478600001)(7416002)(36756003)(66946007)(66556008)(31686004)(66476007)(6486002)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dzyN9tY8BYalUgFoqgWIGUxwOGT2FrB7VfTjX8O+hAXX6/aekdTj9KOGk67t?=
 =?us-ascii?Q?VAtLNTLvBXOvx9m0YnsHyDHH8gZk2xjymkEvGKLFP/uS9wSrOHkTJFywjRAa?=
 =?us-ascii?Q?ySNuTu0SSCK9R2uyELBG7jY30nOF2k7xkkTdkIFCGDA0dAPap8p9a2gp/eUd?=
 =?us-ascii?Q?4Sk5LGvriljUpAH016ikdtfvtA5HrbIXRVUMtZkrJVa/CJhGkIv1aHK6lo/4?=
 =?us-ascii?Q?Fwmcu9b/eGHAnL1HHz62O2aCRA+41oMTpurpYCkKE0jkhd0YOklG8bpF0yX0?=
 =?us-ascii?Q?G1nFpg20I60elkc2Ab+ElNFWkox0ej1JEtaIewhdvZxsPyipt+ITxuugnVSy?=
 =?us-ascii?Q?uVhQ3I1g3BWAii0zII1Bu+SDXkbTk1JC6gzmmcNBEdskIT/aikjgUh13fbsX?=
 =?us-ascii?Q?YmVFqEd4Kd3SDsYCdiTiEAzYT5gX3nNx//AZiYccKR07UDM8oOKA2ya8TO0u?=
 =?us-ascii?Q?lVFOuUbMaLEf2KWJRd3sx+1QDd8WTd3W3OltUSOCKtGvHl/LnZ6m+5p2hUqO?=
 =?us-ascii?Q?783l0UHSC6reoIJePsuqnO6wkv9Cd/9bYyy23upli1wA7no7verHoJUVEExZ?=
 =?us-ascii?Q?MUqlYmCku13Nfjr2dNHYJ86z+JMKU0/rtLDOh5Hm0Oi6LJgv8xArGXiw1oAH?=
 =?us-ascii?Q?62TSWorCVPn78xPR8xPgsaZrcSC3dy/e3rvFSV+oRfd26yWijX+MZZPFwHNr?=
 =?us-ascii?Q?tZKAk0w9kkIV2a8I5R/psS6t9N3PD3BsZWFbFHVlkCOiFM4c1iwaouocCOrL?=
 =?us-ascii?Q?WA70SsBH12BB5XbxnBqu1DgkGD5e3d5jCM3gSebaRglyOYJp9KJG7x5maoYL?=
 =?us-ascii?Q?7c9qivnuoyl9sDyPWJQNl60rfyiJTpokPPtTyT4vfDN8eTu3Bdg/BDCTRO1q?=
 =?us-ascii?Q?BIKlKVd5njTicuIYa/hCw0b2L7wkwzmUrownAcRtI68eehEnhl5ldPtyRuT+?=
 =?us-ascii?Q?M51GH2jSkaaMxhTW7JauWA32TuWt1BReWUkNVThhYBKGSFsD+vmYORynU6k4?=
 =?us-ascii?Q?A399oGrAy+57eyr0DwQtl4yT83lHfj28gYGDhlq0QuBRJypHdpro5o0+nDmQ?=
 =?us-ascii?Q?WtBa7y//F1WvBK3mOD21n9dwE9kvDbHNl51HwSS9sTkkOpEjbqPbt5jVuhjV?=
 =?us-ascii?Q?g59+5Qqr7NrFWHkgPWt9QQX+IMcNSK6Rterjf5sMRk1MsXJzOjtD2GLbN2NN?=
 =?us-ascii?Q?mUu/EdqOOG5RsuO1waWrWvN7MtbEsnVWrAPTj30qKfioHokN+UVMoAtgDYvX?=
 =?us-ascii?Q?oCfn4fYKYSl97LoHDfNlKu4YDaM0p2cMXGAIVv3BczdsvJBmgdWVvAjpsxTC?=
 =?us-ascii?Q?u9+hj8Ssyhmuhbv3xrYDokWV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14001ceb-ff84-4416-7d5a-08d971c4bccc
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 06:00:04.6501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNB7QpZ9odRRqHEJQQzmwZcymWzZdUI65i3gN3l2Ijwx2f6qPwS2A9HgJH8NXRwBM8U6XeJgDBsYCdFGXkdyjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5905

On 06.09.2021 18:22, Andrew Cooper wrote:
> On 06/09/2021 16:52, Jan Beulich wrote:
>> On 03.09.2021 21:06, Daniel P. Smith wrote:
>>> --- /dev/null
>>> +++ b/xen/include/xen/alternative-call.h
>>> @@ -0,0 +1,63 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +#ifndef XEN_ALTERNATIVE_CALL
>>> +#define XEN_ALTERNATIVE_CALL
>>> +
>>> +/*
>>> + * Some subsystems in Xen may have multiple implementions, which can b=
e
>>> + * resolved to a single implementation at boot time.  By default, this=
 will
>>> + * result in the use of function pointers.
>>> + *
>>> + * Some architectures may have mechanisms for dynamically modifying .t=
ext.
>>> + * Using this mechnaism, function pointers can be converted to direct =
calls
>>> + * which are typically more efficient at runtime.
>>> + *
>>> + * For architectures to support:
>>> + *
>>> + * - Implement alternative_{,v}call() in asm/alternative.h.  Code gene=
ration
>>> + *   requirements are to emit a function pointer call at build time, a=
nd stash
>>> + *   enough metadata to simplify the call at boot once the implementat=
ion has
>>> + *   been resolved.
>>> + * - Select ALTERNATIVE_CALL in Kconfig.
>>> + *
>>> + * To use:
>>> + *
>>> + * Consider the following simplified example.
>>> + *
>>> + *  1) struct foo_ops __alt_call_maybe_initdata ops;
>>> + *
>>> + *  2) const struct foo_ops __initconst foo_a_ops =3D { ... };
>>> + *     const struct foo_ops __initconst foo_b_ops =3D { ... };
>>> + *
>>> + *     void foo_init(void)
>>> + *     {
>>> + *         ...
>>> + *         if ( use_impl_a )
>>> + *             ops =3D *foo_a_ops;
>>> + *         else if ( use_impl_b )
>>> + *             ops =3D *foo_b_ops;
>>> + *         ...
>>> + *     }
>>> + *
>>> + *  3) alternative_call(ops.bar, ...);
>>> + *
>>> + * There needs to a single ops object (1) which will eventually contai=
n the
>>> + * function pointers.  This should be populated in foo's init() functi=
on (2)
>>> + * by one of the available implementations.  To call functions, use
>>> + * alternative_{,v}call() referencing the main ops object (3).
>>> + */
>>> +
>>> +#ifdef CONFIG_ALTERNATIVE_CALL
>>> +
>>> +#include <asm/alternative.h>
>>> +
>>> +#define __alt_call_maybe_initdata __initdata
>> My v3 comment here was:
>>
>> "I think it wants (needs) clarifying that this may only be used if
>>  the ops object is used exclusively in alternative_{,v}call()
>>  instances (besides the original assignments to it, of course)."
>>
>> I realize this was slightly too strict, as other uses from .init.*
>> are of course also okay, but I continue to think that - in
>> particular with the example using it - there should be a warning
>> about this possible pitfall. Or am I merely unable to spot the
>> wording change somewhere in the comment?
>=20
> Such a comment is utterly pointless.=C2=A0 initdata has a well known mean=
ing,
> and a comment warning about the effects of it is just teaching
> developers to suck eggs[1]

Well, okay then - at least the definition of __alt_call_maybe_initdata
isn't far away from the comment. (What I'm not convinced of is that
people knowing __initdata's meaning necessarily need to correctly
infer __alt_call_maybe_initdata's.)

Two other observations about the comment though, which I'd like to be
taken care of (perhaps while committing):

- __initconst wants to become __initconstrel.
- foo_init(), seeing that there are section annotations elsewhere,
  wants to be marked __init.

Then
Acked-by: Jan Beulich <jbeulich@suse.com>

Daniel, you having made changes (even if just minor ones) imo requires
you S-o-b on the patch alongside Andrew's.

Jan


