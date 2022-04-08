Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F1D4F953F
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 14:05:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301476.514498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncnMM-0006fg-Q8; Fri, 08 Apr 2022 12:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301476.514498; Fri, 08 Apr 2022 12:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncnMM-0006cp-Mz; Fri, 08 Apr 2022 12:05:02 +0000
Received: by outflank-mailman (input) for mailman id 301476;
 Fri, 08 Apr 2022 12:05:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncnMM-0006cj-1P
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 12:05:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d521b32-b734-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 14:05:00 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-Gfso_v97MjaXsFrXXfayAg-1; Fri, 08 Apr 2022 14:04:58 +0200
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 by AM8PR04MB7794.eurprd04.prod.outlook.com (2603:10a6:20b:247::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 12:04:58 +0000
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd]) by AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd%8]) with mapi id 15.20.5144.021; Fri, 8 Apr 2022
 12:04:58 +0000
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
X-Inumbo-ID: 1d521b32-b734-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649419500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a+Jz9vLoN0M4nIA6uRF69BNuGXwRqZlGMGPshin9uBE=;
	b=AB0OzPYiV6xGcKlBMHmrJjM8Xeh1o+rqaxUoN/oMp8pB0AekrZ/gHKKy2QBMiU0smkDw5b
	ISjAZjt+ECsrbSYI3XEAUGHzETeb8FTnPxdFoJCGj0uyFiDdBRdvNhRVf5XKjDlBFAyTA+
	h/IeS2mxnuU18/NBUVkqKeu3BqX0b+0=
X-MC-Unique: Gfso_v97MjaXsFrXXfayAg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hCjejnPeU0SX3ejVPBQ0b82WZA9oMnb801FHwneWDl0NtSpiDV8PtVTsSJDdsrdRFK0i9yTy5VXucpurIbrlutDdLznPI8hiLhRypbuVsuqOeAKL9/SMW/8s4Y45BQ1g0a6cL+QqfKWonK6RQpiN1lJk7EiCu4KTxI2dPGxksoPJfxr8fTj6LI4eAPv1agw/KWfinpe2Hj4Im3XsbRA9PColpG2P7nXt7x0KcNXKX8z/kQmGE/dfPuyKuic/DoOmyNt8XkkElGjLXcFyP6hag/sxm/twRt4xD5My2ZVrBlEChbyXQER1eX2O0vhW6aX72079yzasIJorad30ebaHyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yH5xe4LQ4xyMXtmT0Qwo490/x3HABlNRcuLEch+8eoI=;
 b=mWBLVmwUUQuzqQMx/0T4y2FooGbxCfYqx3ck2bjnwiiSsV44CYfAFUDTH5K+9QZzdBWhyquCunsX9jL1WTuVn7fWHMxLBLI5jJ9K8NeBWvBip8XTU2bEd5n+O7wd0LCXx2lY7qO33yByUBVwq5n02+TUHuov1NHPr1RMjN0KQNuSYnCRN5MyDMOKt1ILLRNcNM2ZpcLeZ9espOaOt3y8/+Ak9Ay432snmibVt2LfA/X/ePXOlRSaPzcmALeNqZEE7FazR3nrL4jqJWiVx/EGhzK1QrRKcA7BnP9YRf2hDFBIntfADomHNNhQRGf647IJRoa2WM7w7K81UWWJuia8kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b1478c94-3289-7fb9-5d92-84a2803388af@suse.com>
Date: Fri, 8 Apr 2022 14:04:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] x86/irq: Skip unmap_domain_pirq XSM during destruction
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20220407145150.18732-1-jandryuk@gmail.com>
 <YlAYMrirDQUz8u49@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YlAYMrirDQUz8u49@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5P194CA0006.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::16) To AS8PR04MB8609.eurprd04.prod.outlook.com
 (2603:10a6:20b:424::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 148c1124-5fd9-4223-38e0-08da19580050
X-MS-TrafficTypeDiagnostic: AM8PR04MB7794:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7794750B2501C625010C7CE1B3E99@AM8PR04MB7794.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3Lq/iIiqBgdy4x6xAGvwt+NPSARYHtgx8AbnJbcSxS4NNBSerziBJP/7aOySVqwJcVRD0zYkxOoA6+r8FwuMA2iqZ1CgegZOwen3PLDmXpAScTkJJaKZHZHgfNuXwoXSF9TvsgcziddD4O0JhkJMB8QkTF8SUWVnW+lsvlsYN0/czNttQISv2UUEDUbzGV1jd5tYQ4QSldAiCPLCoxeL98Bm3E7xh15vxKlW9FSKMsbJ6V9QLph5PLcMjbsWfgqlpU9QA18HdWeVRyT3tTHSJx3oH8JSUtEiSKR5CNwYIAYDAG6via0+TQj5u2vxodCYjn8TPjRg4u4YKPhfF3C3TKo+aR3v0yBWrlSuWZ7ATTE/P5Dp2I9zBNAuE/McvwC6gUiPNHdaw+9hABspwAxsVyK7jU6bI53M8Zhw4+JZJgN3rL2beT8y1C9wr7ZcVFk+l6iMvsIWtdI2//yuaKLMmzzGjoqRdlIj1TQJ/bOvxHRbn6nrD4s6UJt48yjVyaUsabJp0kbO+otyViSi5OYLB0BzSo11AUrFaBaH2FfoM6/8Y+FpouqCLSRToC1xLgRGbPxKyvnMh1nx8QNycTrz7owCEW1Yq2Z5CdOk2paw79ZNkp1cmS3aJFHqBiawNzRMWNYQWje4Lo6olVyTb9IP9OyuX+EH1zZ76qjd66drsLdCMtvOuppUdIkU4yl8XMaiUx7X9bj42C+PkkyJhmaC7vjlmg3OrfZDTcrLzJlqe47Rxj9M42ZnGSTYc/Ki199z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8609.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(31696002)(31686004)(36756003)(26005)(86362001)(6486002)(6916009)(54906003)(316002)(38100700002)(53546011)(6512007)(6506007)(186003)(83380400001)(2906002)(4326008)(5660300002)(8676002)(2616005)(66946007)(8936002)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tgL9daBVRBBjl7LthCLmVpa/RIpt5k7ZIpsdsxpP2ikZqsql2XvpzAQEsMz7?=
 =?us-ascii?Q?pyyYn6fh3LA4QeKc+vTbA8V91gSZq1OR5f6wIczndUVE1g4lKRD5dWN4fyH3?=
 =?us-ascii?Q?iz2pvGTBQPzqOQ5ZFzlTo4K2zw1Ktzdp6XHMJSGIy+IKTYUq/ZZW6q9JjnH4?=
 =?us-ascii?Q?RNr8bdS8hLEBfstKUthHM/Ur99dYZDsRojxu8V7aLNgsqQxMnEHSJH8/Td76?=
 =?us-ascii?Q?L+gMeE3+Zwchyhswhuh4Yxx5skABDGGXnU0jnyVNLvkAC4GkdBOlGOog0eWr?=
 =?us-ascii?Q?YEFbH2GWMtMrykgd2rYt0tODsI+Fp4tA7hzLEs/X1MUKpzP14y6+McJfn0uQ?=
 =?us-ascii?Q?o7O2ZKgwPmAWrChKMK/7YXVmXIFEgA3pEH6npT4xyHSL/MYZnIi9Dm2IPBSz?=
 =?us-ascii?Q?k0yCrCFmh02XTf9sTE6maR01lkYV0Km6mC7UQ0IvNqqys+l5PkvH0VXyGk0G?=
 =?us-ascii?Q?NKviwBLRpD9WMlyquIp105p6C+55xGKEGNO2R9Q7nHcDZfYPzIqkVBWOztg1?=
 =?us-ascii?Q?MUEcviiqrnZlySSU3kT9HuU1Vs6HJaVoQLU4Rw5yJAl3+k6lEOZxpktj5SBz?=
 =?us-ascii?Q?tCJlUi99dYrXIYCqwW/mSNqdQVUKsZG+q4Ie7vUjCNiX52NqBzbVaubOrHNX?=
 =?us-ascii?Q?4qsw0ErHgA7XSFgCkqGvTPwfhsePZyMLKsUjLgK7vde9uRXc+vnNpkrWZOcg?=
 =?us-ascii?Q?kXzc3EuHGQ0VsFiUTl7kuw1usMTi4mX3sQiZeaGPhf2zDv0GtyyYJw+zAwWV?=
 =?us-ascii?Q?Q8o34IyiSXCuYSsYu39EM2Q6a95q/h25hzQNPtONpai8rsyIy8R5iALqv582?=
 =?us-ascii?Q?AFk2uGWG/3kUAz+swgJScmUoVDOBrFauIjIBAPQIKyx1lPHWNeGUcDi39BOk?=
 =?us-ascii?Q?xyjfXHBadc9U05LI+w8v9B8i6i2EV3ZF14D0qKXVrqhM9+s+wrzGRUfLmmxd?=
 =?us-ascii?Q?67beLmv5tsCo1zA4pef3mqzZejL0NfqW2FWlFHujL7OB1YFY07WiaH5sdfOt?=
 =?us-ascii?Q?tP/dkjIX/amPIywuDeuZQQDUgxFuQJDZNctVRV50ECCogZzDcNt3VQLtGwgx?=
 =?us-ascii?Q?A7BsaOyi3ZTUxxQrTKA2nsalynDAUXG0GgwEArbSw1TETBLd6FGWOAc5dlk2?=
 =?us-ascii?Q?0VlXuBR6RtuopLJka0XOvpuAoMgNE2CgROaJaFcgoHONX6uKwW9I759Ofkh0?=
 =?us-ascii?Q?WJ08jRnVF4uN9mwN8UMFCi3r9lJ79aLhZRzwmlwHWBhdUHtu+u7JAL4R196b?=
 =?us-ascii?Q?kRVW3H9EwbG4X6MVagpDyniZdwpLEgmk9UbuHcqNH0DIrb41/ypdU+y9kL/W?=
 =?us-ascii?Q?8kWGrhX4GZDHNbsjoRgxeBXT0fojXQONHg38eG079aPuqQ+ZifIPFoo+8wKz?=
 =?us-ascii?Q?x49Ntr1wnfqIwsqAyGXM0vhQk2GFyFLcVarH8DsqWuF6OIzO10UeAFMZVxhg?=
 =?us-ascii?Q?WuKcNPrP75f3me4pM8yCwwtKSahBhwDGsZM+Y9S9OH53OgZLP+bhed7nD/x8?=
 =?us-ascii?Q?SXYyljJn5kB2Zdw4N1XTOO4Do4pXJmf2+GI7uRFWzWhx9kv9HWccYIyuSqWi?=
 =?us-ascii?Q?A/UDVvzuHgweQ3Xe1s1WBnVW3QQv6C2WP3k9mxtLCYPckMK4g9DpxF6UjZHT?=
 =?us-ascii?Q?GaiCQRUINlidXEVV59PlBDfiodBY8rg7sOiB1e+WrEv4YwU6Dh3qCIZvzhMD?=
 =?us-ascii?Q?VcqPPsyk/jJjLKk+SQ9QeiMrSpQpxARfzxP1aOJmuSuAMl4l27XTmrjMrVWw?=
 =?us-ascii?Q?Xq22SJ/0GQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 148c1124-5fd9-4223-38e0-08da19580050
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8609.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 12:04:58.0513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0WxhfLPnk6mrQf9QMSKnH/HZuWEVCGdtlnB1PhWkB2xvesF5KMACtWZ9GhUKTpZ/366m0gCUvczY1SabL10rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7794

On 08.04.2022 13:10, Roger Pau Monn=C3=A9 wrote:
> On Thu, Apr 07, 2022 at 10:51:50AM -0400, Jason Andryuk wrote:
>> xsm_unmap_domain_irq was seen denying unmap_domain_pirq when called from
>> complete_domain_destroy as an RCU callback.  The source context was an
>> unexpected, random domain.  Since this is a xen-internal operation,
>> going through the XSM hook is inapproriate.
>>
>> Check d->is_dying and skip the XSM hook when set since this is a cleanup
>> operation for a domain being destroyed.
>>
>> Suggested-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>> ---
>> v2:
>> Style fixes
>> Rely on ret=3D0 initialization
>>
>> ---
>>  xen/arch/x86/irq.c | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
>> index 285ac399fb..de30ee7779 100644
>> --- a/xen/arch/x86/irq.c
>> +++ b/xen/arch/x86/irq.c
>> @@ -2340,8 +2340,14 @@ int unmap_domain_pirq(struct domain *d, int pirq)
>>          nr =3D msi_desc->msi.nvec;
>>      }
>> =20
>> -    ret =3D xsm_unmap_domain_irq(XSM_HOOK, d, irq,
>> -                               msi_desc ? msi_desc->dev : NULL);
>> +    /*
>> +     * When called by complete_domain_destroy via RCU, current is a ran=
dom
>> +     * domain.  Skip the XSM check since this is a Xen-initiated action=
.
>> +     */
>> +    if ( !d->is_dying )
>> +        ret =3D xsm_unmap_domain_irq(XSM_HOOK, d, irq,
>> +                                   msi_desc ? msi_desc->dev : NULL);
>> +
>=20
> Nit: I would remove the extra space here, but that's a question of
> taste...

Which extra space are you referring to? The only candidate I can spot
are the two adjacent spaces in the comment, between the two sentences.
But that's several lines up. And I think we have examples of both
single and double spaces in the code base for such cases. I know I'm
not even consistent myself in this regard - the longer a comment gets,
the more likely I am to use two spaces between sentences.

> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> I wonder if long term we could make this cleaner, maybe by moving the
> unbind so it always happen in the context of the caller of the destroy
> hypercall instead of in the RCU context?

This would be nice, but when I looked at this long ago it didn't seem
straightforward to achieve.

Jan


