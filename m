Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8AF4C2CD0
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 14:13:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278261.475440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNDvs-0004cv-BT; Thu, 24 Feb 2022 13:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278261.475440; Thu, 24 Feb 2022 13:13:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNDvs-0004aT-8V; Thu, 24 Feb 2022 13:13:20 +0000
Received: by outflank-mailman (input) for mailman id 278261;
 Thu, 24 Feb 2022 13:13:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNDvq-0004aL-KT
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 13:13:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87e2f18e-9573-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 14:13:17 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-WNhWgLYYPHGM4Sc2JWNt1A-1; Thu, 24 Feb 2022 14:13:16 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB3PR0402MB3801.eurprd04.prod.outlook.com (2603:10a6:8:3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Thu, 24 Feb
 2022 13:13:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 13:13:15 +0000
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
X-Inumbo-ID: 87e2f18e-9573-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645708397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ldNnLZxgDbRv3TQOK+PsRGVxo7aLgLet9MNUXPz8RY=;
	b=Z0cEW+FFnW/EDs/L4kCcknkrOqFHKdRTGVEk8y/Ukkv7S6QKNaPGRsuelyUAls8mFpes4X
	RMAYrHrN2jCX1UVqQccOQ3J7rgVMRPG3Gnnj9RKBEAZdnB7dOYlwPk9GzGBojMlzGLCFN8
	J25t+olG7fntbTlsTMW0hqrM+MC8q30=
X-MC-Unique: WNhWgLYYPHGM4Sc2JWNt1A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMTv47V+6nbgQAQUKubWsA5Pgo7HS+fivxoUIpbeFzSqCdbelCP5mifGLoNSKPQ9gjxY00c5vD3mg/cuyGZR9ZJakaxsiWnqhqa3H3h4tk8Cz9ZjOML8k/qayZMNmhRq8uNSbRwGhNJ+kzmQE417w0jfvYZZ19vLJy4GI4hXpND5bxjxuCg4UwAGA1AOgbRNfk7bDfj819oiOEpFofczA/J8BXVa6iMuX9mCE1rc0uDM9NdjNY8/ukjKxGUQJy8WO+Ch7tN/259cuAxqdu4UzdsVt5jKiVSFatj/VVcJVYsY5sFHC1v0tXNaDV78w9ftAAdUbGYQ+8vuCsTjyF5d1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBPxUrxJuBaqwevMOmg3j4INynDVpKuyOSxMiVUiCxs=;
 b=m40inwvQrQuOMiu23Xm5Ku0JyftveGzqXytapUjBR8zQKWxZ3Dpco+GFi0DUZ0JK8NQpSAJYeX8gy6ahkavDFUcu/4kMQSIb/y0zpu9tFFLD1WihBSRDDCbp9RUgvc3t2QGYMFHUM70GM+LDnEU3FqgXV1/X1f+3XE+0IM5dwktZ2kThzWckUtpTMP0KPZ5BpmEsLIXugDgafN7zsU+8X+UiCM+rqeBoQGwjU4QOH/b77QodZhK4kBzgkYWnRhLHjExZO27nFyCLznSei1eevUlYkiYzdxFQ4lYXo+AIGZaEE1vtZLW9PZwFftaq0Q2xcJ8vS4rGFR03lnouo8AEdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d4c11b46-4ce6-b3ea-3674-d306fa6cd0a2@suse.com>
Date: Thu, 24 Feb 2022 14:13:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: Ping: [PATCH v2] MAINTAINERS: update TXT section
Content-Language: en-US
To: "Mowka, Mateusz" <mateusz.mowka@intel.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Cooper, Andrew" <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <4f26b785-ae03-34a7-7dfc-d36121a44ac2@suse.com>
 <6270f203-c839-e54a-3f94-7db88759ed0d@suse.com>
 <PH0PR11MB51424E3A85B78876690C9D5AFF3D9@PH0PR11MB5142.namprd11.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PH0PR11MB51424E3A85B78876690C9D5AFF3D9@PH0PR11MB5142.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR05CA0035.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::48) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7aab71f0-235d-405b-2b8e-08d9f7976a92
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3801:EE_
X-Microsoft-Antispam-PRVS:
	<DB3PR0402MB38019DFA1AE4A1969764F480B33D9@DB3PR0402MB3801.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uwfRUMVNB1a7CbQz79adpB9wihAuxDZb6fukl/3xDWTjRhM3+IUltIZ447qHejFVjf9OyV4c7md65jRPCU9OnQsqijtJIGSYZ3Pvx9xaBiDn1wkx2B5V8ROQLH+iiVW762+W7TugMQ9/Y3VR2qDsAkd7YQt8qrzfD+fawNhWqROYiwtqHvrRlxVvhVIv8U4fCYQmFp6ZbqYjH/0UKyqV6RYuHMya39ymPKcJeELW2zb2Hcy2o06FlqulsI5LGopiyA3dtChGz4BgVtN5mgE98IdY5f5/sNARliSCCAqUBsz7pEr/kZAWuqmyBZca35AMfcu5pdjrEvHNO+2iJSHDHIZtEjR1NEOvAnpVGJmqIJ+ALiUTePRJ9KgWdWJncn2TR3Y4aHN1cCqinB7h3Q+2WSo2IibzvB/oMTSiH3rojjjE7i0QHWzETzFOFHD1VvbxVU1WTxWGGXDvgSmg9RyM8KjbqKin5vVflpQd/fU2E6OJacSyRZTcFKlpuyOivWJme4BMNkmcCg6UezxtTtWDw1/c+T4tcdKQ/DTpEXMy4NaW4lUsG78G2sjqGR8Xnu+5Oceuwviy+0npHboPHD7sF99OhbutQW77kOAVo2OjH37BnqZ7yp85pbaDIYfzirfbrWL0n7Rc4py7NTZyu1HoKyiFuf1YPlpKFLZzt+oeqRJN4hSH5vGsagpWPUIaHEEk7BZO/ERXakjkbFc5NWCkoHkf3l6RK8Ke+y5P0tYx5LSIYLRWkJWVwD4gE4UJxgi6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(6512007)(6506007)(8676002)(66476007)(53546011)(6916009)(31686004)(86362001)(8936002)(31696002)(6486002)(5660300002)(66946007)(316002)(508600001)(26005)(2906002)(4326008)(38100700002)(83380400001)(36756003)(66574015)(15650500001)(186003)(2616005)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x9b6d1hlfI80gS+5hHidIfJ3ba0xr+rSXmvCDStUlqwnxtJ3mJc5j5YJl9H9?=
 =?us-ascii?Q?gDZMkiepbzf2x4MhNmwvMZZmQVMF1HF8mzzsVjA99a8Ul/DqLVi7KO97aDzi?=
 =?us-ascii?Q?QD+iaZk8l+pLGmZhTCuhmYs9YSTkx1rnKuys+9rQYMGjmCC79eGxvwzv3ZCJ?=
 =?us-ascii?Q?1kcjfaXfNiR9zQ1Iy8qDdKGPvJGgK6VIMP0yUQvcxW9UMy7keeqTxgJEXlqy?=
 =?us-ascii?Q?u0czmGB6X4GUhv8kn5Cg85i9PbEzWz2nl2Jy+V65tGSARfo0FrG2uhZThBCS?=
 =?us-ascii?Q?lODrhop7AiuZZ7ykOIIINbMkjL/ved3vr8fh3oL6WKKFH/bVOVmPFoTor7Un?=
 =?us-ascii?Q?ab7EPYlHzsLiRi3GKNQzQWKWZ7sZlrDy2FcomBLy55s9kvGS5R6R307HpG+B?=
 =?us-ascii?Q?c5ctRb8vSXSLIgsfdzhJ1Lx7dVHtKiVVk3Li2Qq+DgpJLMHhWg0ehtsbEFI+?=
 =?us-ascii?Q?K6e3MYO0ViF5Gmnr8hin+8tgvIBjjN36xyeNun4ozyQLEBiljuMvr3fcy6Vm?=
 =?us-ascii?Q?IrFM8ZhsOZVE6vM5WzUf5UfXxVMQ0VgqTCYXw1Dd2LncHj36ZCPaYyDPGayW?=
 =?us-ascii?Q?g1MJbIvvSyC5TO07N7Kb2WLSK7r/Tt/0ktd2OySUT/G3TBS4qxX+jqcb8S41?=
 =?us-ascii?Q?9b34FvdzXlRIQPtLLGrHoCZKkPA0OAVBeMJIbnjR0zvNoiEN83Sn7rzoJ0UH?=
 =?us-ascii?Q?D8eIofduL0DMJ6nCGRhj0dxwfESECns1fUMtGOQfA7qNj6BigxD6FwGfqOhA?=
 =?us-ascii?Q?vG7S9GkEzNX9YfhaXsWmbgfkPF+VLZIoR2j2BYM1dllLbQrr6TS9vn1/9HMk?=
 =?us-ascii?Q?MKzoLqm2S1xYMhKvm/YFLWTZWsZ4gsFHAyXuz1TyR794rwRq6kTvi0P3bcw5?=
 =?us-ascii?Q?hZWouwTmsgEcZr5dk56nDfQOvtt/LAnGj8cd0r5q5f9pSo/ctY4UJUiXWdao?=
 =?us-ascii?Q?hXzldFi/sqI1jPso4p7cvCVUhoFN0LeF2y3Q5UiZo7J9JTeW4gDM3j1ZtHtF?=
 =?us-ascii?Q?Vi7KtuZSTebxyYhf279P2bcT6EgtEt0Ys7uYY/zNClkSGkW9l3xQQMgMBjYv?=
 =?us-ascii?Q?bMb837dUIfFM9CoHnoFBMaStN2eRvgn8E0lUcFIzEH3dJIvLxFk0dH594Fn4?=
 =?us-ascii?Q?m7zjNCJ1ipC2CxnbNtxDhc5AI5ni0e1CuHQnLKMysGgV/LAtjCebnhiQWeGB?=
 =?us-ascii?Q?L+p9lIADmlg+PSidb7Etc2urbPSsPH+Z3x0U++0nyy6kellDwioZfb20CxO/?=
 =?us-ascii?Q?mnVpBt2Te+nJaCkAxKgTlrmtSdHhDLywv6+jdoP5UN6sUooCsK6wr06ubaTk?=
 =?us-ascii?Q?rBmqSj4KGbrTfHP/71WtfqHzffVJOlPHpSfLaJCUx9tx7XRln/6Xv4iLgZ7i?=
 =?us-ascii?Q?SOjBrcgeEAk3yQJHaecewm6BZ17u1Jf2kntKGAKu+nS2cBcfMPW3t6YRYBUC?=
 =?us-ascii?Q?pRjMYDcAT5n4JiD87elaV0MnhzBhX+drMvBesqzU4V6Oad7Q7YDaNYGsB9J7?=
 =?us-ascii?Q?gp7jBX4NIBmLs3FFa8m5vgo+aOlAHCKYUwe9WZUdPiE1T3ijdQZzXxsYl8wV?=
 =?us-ascii?Q?y39qd1uDHFQltrL3fo2jxZB8PIj3bRwjUSTlxZ2Ic5mZ5wBTbvg/pr3AYcV0?=
 =?us-ascii?Q?5a0ia0PlMJnTxSr97HOBqDE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aab71f0-235d-405b-2b8e-08d9f7976a92
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 13:13:15.1128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YQTh4KilkKY2c0vd6dtRkbxN3y3Gx0tTQ6wEHDc4fHW2VxE7QFeNQ7/MoNXPiorSIoEhKtrDA4snb4ucpiocqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3801

On 24.02.2022 14:12, Mowka, Mateusz wrote:
> Yes I will be acting as the contact point for tboot.
>=20
> Best regards,
> Mateusz

I'll take the liberty to translate this to an Acked-by: then.

Jan

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>=20
> Sent: Thursday, February 24, 2022 2:08 PM
> To: Cooper, Andrew <andrew.cooper3@citrix.com>; George Dunlap <george.dun=
lap@citrix.com>; Julien Grall <julien@xen.org>; Wei Liu <wl@xen.org>; Stefa=
no Stabellini <sstabellini@kernel.org>; Mowka, Mateusz <mateusz.mowka@intel=
.com>
> Cc: xen-devel@lists.xenproject.org
> Subject: Ping: [PATCH v2] MAINTAINERS: update TXT section
>=20
> On 17.02.2022 18:02, Jan Beulich wrote:
>> Since Lukasz has left Intel, they have suggested a replacement contact.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> May I ask for an ack here please?
>=20
> Mateusz, it would be good to have your ack too, considering it wasn't you=
 who proposed the addition.
>=20
> Jan
>=20
>> ---
>> v2: Only add Mateusz, and only as reviewer.
>>
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -318,6 +318,7 @@ F:	xen/common/hypfs.c
>>  INTEL(R) TRUSTED EXECUTION TECHNOLOGY (TXT)
>>  R:	Lukasz Hawrylko <lukasz@hawrylko.pl>
>>  R:	Daniel P. Smith <dpsmith@apertussolutions.com>
>> +R:	Mateusz M=C3=B3wka <mateusz.mowka@intel.com>
>>  S:	Odd Fixes
>>  F:	xen/arch/x86/include/asm/tboot.h
>>  F:	xen/arch/x86/tboot.c
>>
>>
>=20
> ---------------------------------------------------------------------
> Intel Technology Poland sp. z o.o.
> ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wy=
dzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-=
316 | Kapital zakladowy 200.000 PLN.
> Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresa=
ta i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej =
wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jaki=
ekolwiek przegladanie lub rozpowszechnianie jest zabronione.
> This e-mail and any attachments may contain confidential material for the=
 sole use of the intended recipient(s). If you are not the intended recipie=
nt, please contact the sender and delete all copies; any review or distribu=
tion by others is strictly prohibited.


