Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 100624C8D7A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 15:15:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281499.479857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3HE-0002nA-O2; Tue, 01 Mar 2022 14:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281499.479857; Tue, 01 Mar 2022 14:14:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3HE-0002kG-Jc; Tue, 01 Mar 2022 14:14:56 +0000
Received: by outflank-mailman (input) for mailman id 281499;
 Tue, 01 Mar 2022 14:14:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nP3HC-0002kA-Kv
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 14:14:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6d56e0e-9969-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 15:14:53 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-4xnKMn17MF-dxSx8Aeu0pg-1; Tue, 01 Mar 2022 15:14:52 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB7528.eurprd04.prod.outlook.com (2603:10a6:20b:297::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13; Tue, 1 Mar
 2022 14:14:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 14:14:50 +0000
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
X-Inumbo-ID: f6d56e0e-9969-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646144093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oq1ZRAhU9Q4MkkXTsjrRi/7LpPuPDcvU8/trqhc2rPU=;
	b=WzcMoyehqfEbmuVzO7gNdf7IXzCHl2jIMqk+b4B82VOSLHsQja4axQcMWqYsWmfeWeZ9kU
	7LeYChGVHvphJDkaD9H+I8twodgGs/XV6Kqwheq1cyymv4sbl7aMMN0MFcpXW7ZqgY9tGA
	vQaMPPIiHAvMJaWPN9v8fRmDPVduAy8=
X-MC-Unique: 4xnKMn17MF-dxSx8Aeu0pg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j45khpdFn4pqgL/txI7zlEzW7ieekFMK7uP+Mps86VSAnZtiC2hXfmfX6p2qEzrUs0GMS8MyVG7L/xZ1b4x2VTxw5tTGav8F5JCvCZRG6CKEamFVrak/i1Z/MWkQonzXLU10LW1XmrbH87uI93C/XBY/wZWDxj87bPn2Z/9fpbGjJQrhCHkSBsOPQ4a3CxZKapjEMdv+BNBjw5W1Jdd3/ffJYf7e361f0jouuhcgHc7CBqol/TSWxIdfTo75mZwlLXXiCeXVYqh/c+lJGdKJIrEpRI1kIyNeL1TQ9JYLw7kbPX03QgihToPKCOBPAW3P+99SXueiRYEQnUzXdNPO5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4Wui87pS9Nc396SWhM/waAHPk+Jt68Fa+FaWuQHLg4=;
 b=Ff/BU23uoxlqx4p+t6xDmdR8WIyom7ssOHW3EBNVN9RvOX3/UjFmMjXACALBc8mzBsOWgrM081Dcb3n7kc4/lGZ/PPEuuiYsBvNw0jnHu/LQKOg5QapVhgQBsHfmn9diUSrBJDGzxcfhqz5Ew9WZGnBWITiBW9VWN5WhFnBoJXBHJbMjDS27BuRQvaKw4h08wiJmILYUmfqkZ22nEfYJS+PGwuUA/gF7TZh/iXGVO9CBvXXqND8/a91iAbslAaMfTPb9GgaIf46meRLPr8dr6nber3OJWVwsj7bzRgxqnEnlIptXOChFvtBnH5ftBAvEo5BdeB5GDoXgOIIFq6fEXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2c3bb06d-e4f4-33d8-7972-71dc7d61c554@suse.com>
Date: Tue, 1 Mar 2022 15:14:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 1/2] x86/time: use fake read_tsc()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <77675e7f-2a7e-f517-4aba-e20774c8bfe5@suse.com>
 <f4f0e92c-9586-e021-6ad5-718628f88fcd@suse.com>
 <d1c3822e-bec1-d8ca-8954-a4942f5bb23c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d1c3822e-bec1-d8ca-8954-a4942f5bb23c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0074.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fe9ec1c-fefb-47db-d550-08d9fb8dd8cf
X-MS-TrafficTypeDiagnostic: AS8PR04MB7528:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB75286F427732CD12747FA75EB3029@AS8PR04MB7528.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e27I8fOwgIqifB9ZIaVr/eXv7H7HyN8E1/40EYtZPusSFWTX0PZJP5miT1XIeVqWOplGdlaj/ldzMfZsSKxNZCohNKiPOnZu9g+SQxClmzosOBB+QPTeFudyk1ajwqrfZZlElFLhcvYXfw4sU1se7zYdvBTUlAXFtXH3qZF5+j3UgP9teXhPegeqA0TjFwrXTT+Afcxr2KZiw0hDdznmoQr1wBlaTNeX40PC9qZjipAMPuEnk5OkmaaK8EbYf/8BxYCYb0MxfGFvKuZhm6QHTvWjVHpBjY5CZ9arr8DO+9ZJSrFEhhHjUloHdYVvR7xbosr8wetAFzgbAHYECRxYMZJvXRdoJopjZlwZoEBcDeevUjf7Vz17fx1W+I5HQUKul10Jd/PMW9/el7U7D9fbF4JbEf4AxsVz0cUYk6mMPY53vIrxAEYT8k5CdemRVM76ZTWnqP54aJtseTwQ7kOIe64zkBvxqBtGuw5bbGrQrZaOyWo2FUkcWlag5zc8P9sGzm3Kn1/nxQx07DM+ihpcMYHSb1XDp4BCCDo5ctWR8J08H9tQZ5/lOSQ7t0QG17FQ1dDjSV3+XezkulGM2w0WYd5Sqmj3p0kH1YAupKZTXDBTXHswuzN/wE6ybOoixKcF1plybq5nP5ItSKBV5hlkswFau7GFfJwpQYAKQUEW7FA7R2ONQtM93L7jJagAB3BXDXH4igLqt+ydv8gn78slKkwelGaYyT+L86y9wPc9RsLbrLJeXeq3ALipyJNasDZF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(38100700002)(6512007)(5660300002)(53546011)(186003)(83380400001)(2616005)(26005)(2906002)(6916009)(316002)(8936002)(54906003)(4326008)(8676002)(31686004)(6486002)(66476007)(66556008)(508600001)(36756003)(66946007)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jUb1hoNszGh839/Qmh399h883nJfIhbN8OeT+gXvtL/W2XGDaNQ+GNYwQ17r?=
 =?us-ascii?Q?gVcpIndhxaLGtJIlu+r1iE11Bo2+hNUIuq3nAB3ft6hzX6uWALsUEaJhVjHk?=
 =?us-ascii?Q?lkwBEHhdyc2FXT6CV9XK3ClYbkRyCujYZMDOhstD6HvZ4sm/+aUbDxLJKnxa?=
 =?us-ascii?Q?rhAgwWJIDm1Fus9rZy2tkbPC0L3Ptu/9dCCryPIPcl6YOSKUKpAR7ePObi4q?=
 =?us-ascii?Q?aNNxPH4OryuepZ+285mhc+KfaNBgB/sUfn0mnlRvskdJHUxIGjof6NvI95rq?=
 =?us-ascii?Q?s+wks9Jtu1zwOe/6jg9+8x4ZD2xQrT6CQ32bADsfu4b8Cz6imhEuFlv//Kr/?=
 =?us-ascii?Q?h96qQ20L5Kh3+dvQmTSfF9IkSAUFbwJ6/ViW+V/y7wPTRjc0Y5UYNm/cdO4P?=
 =?us-ascii?Q?4f1DNuITjTLDFODWw0w7W4ctYFFKopRTfc2CJu6kIYtU52DHLwydKYgwZnsM?=
 =?us-ascii?Q?FaVdp6JWUq0V2u9msL3UhR1B8ckpCogWKGjzdJE4drMY8HNsucbVcBRJT08/?=
 =?us-ascii?Q?5LXPlAmE+wZuqgR/EOH5PPgJIeddy4Zy0My1buZU8yspPzgbtMF9KRP3aWY9?=
 =?us-ascii?Q?ns1A+RyfNZB36EzVXt0LrfWYQ0cV6z3gmMaF1s6JN8XEy4WkXTk/8btLqCzY?=
 =?us-ascii?Q?jG3qL83Z1n3BEhXeQeBN5YI4qDQ4AxFe3NyMME1yglm5CVjEq+cx32P4tZvd?=
 =?us-ascii?Q?BmwdZVg4pkGi5Y6VAqM//HpXlTdRSNj9P+z/0aDJVGxe5sFv3/gM10rBIzhP?=
 =?us-ascii?Q?9/PJqWsGO6SsthpdXdpYwYgL8hQe2xpy7D0rC54/RYuNykjABOPYD2/qCzhg?=
 =?us-ascii?Q?aktppThtxXsGoG6JUo/ZWJDoKfjh5ggHnoeJKZX3KyeYkWm5JG35qCMO0i0d?=
 =?us-ascii?Q?zvWkqw2ZL0fTllqXybU0ua30BkKqYMWTbPjbOFpdw1IUCyooeW+gsfAsb+PR?=
 =?us-ascii?Q?NQtylRPgNcvWARfPvxwvFPlMJZtPfv3spR4v+lZSM5zS0u0Gg3g9tIkfq29C?=
 =?us-ascii?Q?h66fKXegG527gG1LY4+G4jjET9bYp3hP5zLfyXWsICtfF7kmxXI0XmJnYZxe?=
 =?us-ascii?Q?5GOHyMdQeu7LtNRLqK0CG3mW0Mm8pHvrwQjFSD6VQqatIgt9IVCnafpc3q5y?=
 =?us-ascii?Q?4ElpKOnss7qTW7/bLSRBDYh8WsTGZaHL99jl9WtF+uN7VurZAFIJUr5yArEV?=
 =?us-ascii?Q?YIqqJ7vM1+OYmgLe8PstFUR7gj/xkim+M8faXa30fj0BcV1NopZy/dOhO9qx?=
 =?us-ascii?Q?SGFyV72lD9PucF6W7PeKfgfWYLA/0bwxa91L04EpcEd0av9qqehhQ8tsyAoJ?=
 =?us-ascii?Q?igjvkZ/Q3c/fIyygbS28YuSnyEFiJABS7h9/gaFB0ST4zdICPtVyd4H/aLwE?=
 =?us-ascii?Q?FZ3+vjZ67gY36VS5aN9RAlMtjyPu2TtlZm4q84MM13/KMk6mfiNEvgfKWJ/k?=
 =?us-ascii?Q?JjG+ReWWDYLM2Ip5FngI9zh53aCDyzelteNvg8IkfDJPkf/sCcFKsROqz/Nj?=
 =?us-ascii?Q?5rZkDdz3Do23KJ4rOzhoqwBdpSK6/XtWzVSVnjWWij6vd48C1VNffVpzUBdI?=
 =?us-ascii?Q?52LdZiscIzmRqT9A40i2+OozrjKLIaC661XgfjvqyD9U6UDuIcnYSvjkbt2c?=
 =?us-ascii?Q?QDcxxP1cjHhm+pWuoj2aFas=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe9ec1c-fefb-47db-d550-08d9fb8dd8cf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 14:14:50.7813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aSs0FFMuvs1copZg1b8OHSy/5bdvJVRZSRjgb1+zxhwYRcSTtDiqBRjiRQrvb9m1Ici26aJocilpCu0Xu+FZGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7528

On 01.03.2022 14:07, Andrew Cooper wrote:
> On 01/03/2022 11:05, Jan Beulich wrote:
>> Go a step further than bed9ae54df44 ("x86/time: switch platform timer
>> hooks to altcall") did and eliminate the "real" read_tsc() altogether:
>> It's not used except in pointer comparisons, and hence it looks overall
>> more safe to simply poison plt_tsc's read_counter hook.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I wasn't really sure whether it would be better to use simply void * for
>> the type of the expression, resulting in an undesirable data -> function
>> pointer conversion, but making it impossible to mistakenly try and call
>> the (fake) function directly.
>>
>> --- a/xen/arch/x86/time.c
>> +++ b/xen/arch/x86/time.c
>> @@ -585,10 +585,12 @@ static s64 __init cf_check init_tsc(stru
>>      return ret;
>>  }
>> =20
>> -static uint64_t __init cf_check read_tsc(void)
>> -{
>> -    return rdtsc_ordered();
>> -}
>> +/*
>> + * plt_tsc's read_counter hook is (and should not be) invoked via the s=
truct
>=20
> Either "is not (and should not be)" or "is (and should) not be".

Oh, of course.

>> + * field. To avoid carrying an unused, indirectly reachable function, p=
oison
>> + * the field with an easily identifiable non-canonical pointer.
>> + */
>> +#define read_tsc ((uint64_t(*)(void))0x75C75C75C75C75C0ul)
>=20
> How about using ZERO_BLOCK_PTR?=C2=A0 The hex constant 0xBAD0... is more
> easily recognisable, and any poisoned pointer will do.

Well, I specifically wanted to _not_ re-use any of the constants we
already use.

> That said... what's wrong a plain NULL?=C2=A0 I can't see any need for a
> magic constant here.

Are you fancying an XSA for a call through NULL in PV guest context?

> Overall, I think this patch should be merged with the subsequent one,
> because in isolation it is slightly dubious.=C2=A0 read_tsc() is one of t=
he
> few functions which is of no interest to an attacker, architecturally
> (because it's just rdtsc) or speculatively (because it is dispatch
> serialising).

What code would appear to live at read_tsc()'s address at the time an
attacker can come into play is unknown, given it's __init.

> This change is only (AFAICT) to allow the use of cf_clobber later.

Not exactly. The subsequent patch specifically does not touch plt_tsc.
And if it did, it would have no effect with read_tsc() living in
.init.text.

Jan


