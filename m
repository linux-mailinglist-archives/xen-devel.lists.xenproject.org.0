Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE74D48C13B
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 10:45:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256418.439999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7aBw-0006yQ-6O; Wed, 12 Jan 2022 09:45:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256418.439999; Wed, 12 Jan 2022 09:45:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7aBw-0006vm-2q; Wed, 12 Jan 2022 09:45:16 +0000
Received: by outflank-mailman (input) for mailman id 256418;
 Wed, 12 Jan 2022 09:45:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=no1k=R4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7aBu-0006va-CH
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 09:45:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d494b09-738c-11ec-ab6a-e16a03e04220;
 Wed, 12 Jan 2022 10:45:02 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2058.outbound.protection.outlook.com [104.47.6.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-lXeFTaa1P2SK9yoYb_eUBA-1; Wed, 12 Jan 2022 10:29:03 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4190.eurprd04.prod.outlook.com (2603:10a6:803:4b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 12 Jan
 2022 09:29:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 09:29:02 +0000
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
X-Inumbo-ID: 4d494b09-738c-11ec-ab6a-e16a03e04220
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641980701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7fL0D4lOejs0n2qJccfMLDQxcPMp903sUEHZrWykPvA=;
	b=jak65RLGralwP6VUuCMYVMpBsSS97N2UFnnSkjQOIdKRMaI2oALmQZdBucw85vlsc6nK1S
	rG90HVMoKWqUzIxXZSZ6LAPOGfFbHMzhxp8zWbvWlEIszCNaiKn6Jlpm9gJZDNBAxTGqpF
	wPpJzKky3QtiHzIaTHOaQfOWTN35OqY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641980701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7fL0D4lOejs0n2qJccfMLDQxcPMp903sUEHZrWykPvA=;
	b=jak65RLGralwP6VUuCMYVMpBsSS97N2UFnnSkjQOIdKRMaI2oALmQZdBucw85vlsc6nK1S
	rG90HVMoKWqUzIxXZSZ6LAPOGfFbHMzhxp8zWbvWlEIszCNaiKn6Jlpm9gJZDNBAxTGqpF
	wPpJzKky3QtiHzIaTHOaQfOWTN35OqY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641980702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7fL0D4lOejs0n2qJccfMLDQxcPMp903sUEHZrWykPvA=;
	b=fDVlvv4Xxi/FiHkW5GiHvDEWADbDKIeISjpv6k24/8iLwwZUzOswxWhDAn7v4Cb25+tF92
	Xo4u2ZkkZVcnOs7pFrGCA6QPaWAxACOsojPyjqeao9J+cMAm0XQCIWGGtm54q1rXZCiT6j
	bKurRExowavJOES0cy7N8bpUYpf5W2A=
X-MC-Unique: lXeFTaa1P2SK9yoYb_eUBA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmRLLYv7ZakwgeuXT3mxcc6j8PMXs812Wa6MnoQCa5Fe/a5dWaLrBNz+asd4LYiHrt1W7pPct1ZG7hZO7kbjZtd+KiCoF5fGRkZ7YITzGNCp3OitbVPBboGqv2XHkEtak87fuL8YVDchCTFoZOXiW64u3Qlqn2cDQ4xj/k7uyMuWvs7zLFkOyZjziV/Z8ejs1nlL+iPg5ZIb89KQZ3CgCmbIkSc3ATyfQR2d2Be4pvODd02ptjK987sbTyJEk12KppBmxjLMvSx/iqMC1Ew9Zq5fnqT4Gw3lZxtHM3d8PhFacFZy2BzE6BT9KykRNoJgs9st3Kb6yTgMrpluk54H+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hK7jxMd8QWBPM4jkHaeNyWepghdlEvfCz7HrNcxjCcY=;
 b=PJZZbZmA1FDbS4Jrsd6Ashi8buFFC8+pzRmQrADoYcOXW/1MHoJg1tPrlYGHq2THfvTxA36zSrMk7dEo1O3D763U4nbyKLEJFdboPq+QQV2teBilSzG71OnudbbpaECtmgCD96ga5ZKZmBC0hsY7xYzCWl5cpkA2LTQ5T6sKwZTtFn0vFk54i4W0Rc29g1DtYYIhh7CaQ4SarQUHOTMFAr944hB/kAyRKcCxsywdsh7CwlaucBHY0L9OT+yPok3nBC5UGOPYmT3L7LN6DKlqrPJBD6J2Mpm2XvT+qrnNAToFIt6vFruuzCFL6nDzZTs0p7NYNPJa+CcUmAmM0G4rKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f4dd528a-d1e0-f516-bb7d-f1ec01abc3d5@suse.com>
Date: Wed, 12 Jan 2022 10:28:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] x86: replace a few do_div() uses
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <01baee92-9d7f-5a2c-d63f-1de390bc10e2@suse.com>
 <a5af3a6a-da51-2624-622e-2566c8db7dce@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a5af3a6a-da51-2624-622e-2566c8db7dce@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR0301CA0041.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91a49241-0b60-4e4d-bc66-08d9d5adf826
X-MS-TrafficTypeDiagnostic: VI1PR04MB4190:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4190E5833932C3E080303B84B3529@VI1PR04MB4190.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hfB5eDMDNqxG2ixynZUHP4XVRImypH0jOzyYOCY1WIiQbajn1oDGZ2rAgMvfi8nS+qK3k1/UPtLa4KupLUB+AIXaXZkupH4oJIzZycEIMjHQLxur5AAYP6x+z9WlYUBZmAVacNmxz3WoI/5wSa5+6rf6je6fwaQylBJskSiJr9AJra5uanpKNwoWpZditOV2+g2v8PjpSF7kpRvNweLi4/rUUfee+k9wPo89OrjTu1iZqvK+6nK6Z0JRcIIJ/rr/AzTH0en5ia6CDosGHUEhyd8o8Yh89qzMiDm0O0sPjgAwWsRSH5oYNlLW3TETMqh6ES/wB8ZhQShmkvSypcejz2Z/Rh7cY5G0GmqvSEndwBfxqOn+3PrXvBzV40X7d7Emv5Cq2kxt1jVcsWVHl7xZYBqPx6O6AOtqvH7luECagCzB9QR833+lYiXI+3B3favflmMyMk5R0BJUerevyP+bDhJfxy3gdNjlzG3bQ0bsJLO08FX0BtdxmuJ9pOBchLLAnl5xUdwcW94QEr8edW7DBSKScA+RkqFaWrWGSvAWU2maI/HJBujxDB9MJqyL/MHV6Y8KLWNhdBmXO63DG5WR71RXOfhg9O+c9HrM8I0Jte2fhA2vNhI4Jd7KzXF9svgIBQSGVWkhgJ9Ong1uvjmEorlYikPDiBW14BsNbWBOTR8tn18Ko1YHawrtb2jlasJKnW+EoxvxNnDPZ22arjg4d4DskOpgSVmab26OWeqrgtw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(8676002)(5660300002)(2616005)(8936002)(6512007)(6486002)(186003)(6916009)(31686004)(54906003)(86362001)(66556008)(508600001)(31696002)(38100700002)(316002)(26005)(2906002)(66946007)(53546011)(4326008)(66476007)(6666004)(83380400001)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2ppcRAtkC3rYxtvB9YxFhPqOHWqO6FOfddH3YguM7rnOH31SO6qnxp8ndYIx?=
 =?us-ascii?Q?S/jbsyADIlEJGO2AbxwQN36Ay57CerZ/E1Gl5xovy8mtnRMidJn4qGOG/fHx?=
 =?us-ascii?Q?U9HIATZ+XOYK5ZBilN1M0w6C0ggT1fO8nrth+xnKs5+rwgoWTWUYscELAZkl?=
 =?us-ascii?Q?5mZMVjYy14hk50J1inEU1/HoCXb5z7Mk/6gEo0r6uyYjCAVoOgxw/rLc8f24?=
 =?us-ascii?Q?DPeHIMK6n6D9N83/1zQvan97hJMF+NSn7ef2FGMgYnaW1BuNYaR6NjSA3Cg9?=
 =?us-ascii?Q?AlhToasbFxUuEkgFalqSWP6Gfbhqti60fNl6J3rbcjHipF2L1ir/HZEy9r72?=
 =?us-ascii?Q?/yLiX5PWAz0lEjEsEaEL3bOExuqpCNAHa+RmhzoeNgFf8tYnfhMIdsj8nlho?=
 =?us-ascii?Q?NMN2vuzC200sRLpbcMHRBGkn1p6NS7c10E7BJvxVhqMJNLV9vMOES714EfQ7?=
 =?us-ascii?Q?5v36uP/KXx9iyiE220qrjhLJ3i8QhY7OLafx2mvR3DLW7L3HX7tsteWAzoka?=
 =?us-ascii?Q?0VqLJJaP5Cqy4yV0ThEQLDSfygcozv7cs5BXu/sPDXust66xlUGGzoLHPTz1?=
 =?us-ascii?Q?d+JQDfadhiyny1lo/4QYeT+jXJ6A45/uk9cHE7BD/+yJb4EX8pNUVQUcTDro?=
 =?us-ascii?Q?dAcMZXm/4tHe3v3dFWTEUN9xNgBDr7NQ+JNsnhNQ7qId1xRrOoIyU9r5yQZM?=
 =?us-ascii?Q?KZifSzhskDrm5ZcycDNmHSl3GEz/dci+hfJbBCC9lQ26X05UenlmP1Uv4c5h?=
 =?us-ascii?Q?n4mKJrPEF+MB4K6qmLtWx3smwpHayy9mxOe61KGfPjwheYsecegbCgMW/lDi?=
 =?us-ascii?Q?KcLVzwgEeygU+TUFSQB9wBjp/mLjZiBAgw4uOUHpadYd7nO4/Fy7JXgtWxjo?=
 =?us-ascii?Q?2DyosCgfdCjgtVB0YqM1yzn1tbajopxVUeoE+R2TMP/vlBr00t05oHd2RBWM?=
 =?us-ascii?Q?E6QhqYwSvDFmBVOXOCKdt+cfrH1+V+0GCWRkIYT8v7idOZBY2y3TSlpLulyP?=
 =?us-ascii?Q?bzXfmsNrGOm+GFD6X2pyRMiUmDgKpwF1PeDbvoVWGI5JDI46EY9uxsTcgGXr?=
 =?us-ascii?Q?RtWWmU4g/kRsRBVfCIi0CWgBY+Z8qkILM723bR21qSVsuTswH18xpZ+1ZlEu?=
 =?us-ascii?Q?NC+zXRp74IDmTl7b96EYsLkUkWBQJxYWQa6eeDsJh7ILJH5C94zTKSxWdp0p?=
 =?us-ascii?Q?gMvIKFvyRpYd6l5Ytp7x12TpkowctnV4gs7blrT7NFNgnBKNbHWBQdZSh0JC?=
 =?us-ascii?Q?14GBF7qw5blvsQfFofXom9hf5JnrZp968K9pIblH0OtmHMcu1M57V+QDrKdN?=
 =?us-ascii?Q?uPgRVFoS0GfP/PMruZPdKDyiak7wbpvM4/fJhpOlfkd7AEEj7Fk1IaF4sOIK?=
 =?us-ascii?Q?V5n4gOp+/295GmVePicVdb1f4X46TPrYC50lcfXJvj/iRHjx+zGhz4VKJnYl?=
 =?us-ascii?Q?3RgZCKC0N3YY/zuxGJrrPEyaIvvzab9bAc0LSzXobuzRdBLaOB5fc6O3vv4T?=
 =?us-ascii?Q?H2VyCrZOlZzEX399/4oGbwg45AX74P2o7h9f3MuPYzHrqZYO30Qr7T+r8cRh?=
 =?us-ascii?Q?WkoIg+4rB+GHP+Ksxbakssm5O+hGSLqSka13n1/Yfn84ZsYSqC5QWUY6uSUY?=
 =?us-ascii?Q?MuuNjZqKHV5mEfZMnziRuB8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a49241-0b60-4e4d-bc66-08d9d5adf826
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 09:29:02.0371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N+2m+PdRRZYQagjUbL9we3xKyLMqGp8uM3C6xLFMiEpdWV8KYMInrlm/D+vavNY8EyS9rWLNwVLzmDesSyaXzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4190

On 12.01.2022 10:22, Andrew Cooper wrote:
> On 12/01/2022 09:00, Jan Beulich wrote:
>> When the macro's "return value" is not used, the macro use can be
>> replaced by a simply division, avoiding some obfuscation.
>>
>> According to my observations, no change to generated code.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> I like this change in principle, but see below.
>=20
> do_div() needs to be deleted, because it's far too easy screw up.=C2=A0 A=
t a
> bare minimum, it should be replaced with a static inline that takes it's
> first parameter by pointer, because then at least every callsite reads
> correctly in terms of the C language.

That ought to be a 2nd step, requiring agreement with Arm folks (and
adjustments to their code).

>> --- a/xen/arch/x86/time.c
>> +++ b/xen/arch/x86/time.c
>> @@ -610,8 +610,7 @@ static uint64_t xen_timer_cpu_frequency(
>>      struct vcpu_time_info *info =3D &this_cpu(vcpu_info)->time;
>>      uint64_t freq;
>> =20
>> -    freq =3D 1000000000ULL << 32;
>> -    do_div(freq, info->tsc_to_system_mul);
>> +    freq =3D (1000000000ULL << 32) / info->tsc_to_system_mul;
>>      if ( info->tsc_shift < 0 )
>>          freq <<=3D -info->tsc_shift;
>=20
> do_div()'s output is consumed here.=C2=A0 I don't think this hunk is safe=
 to
> convert.

If by "output" you mean its "return value", then it clearly isn't
consumed. And I continue to think that I did express correctly the
effect do_div() did have on "freq".

Jan


