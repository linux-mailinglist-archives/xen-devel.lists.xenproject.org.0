Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C87B432112
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 16:58:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212413.370275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcU5M-0006A7-NR; Mon, 18 Oct 2021 14:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212413.370275; Mon, 18 Oct 2021 14:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcU5M-000674-Iz; Mon, 18 Oct 2021 14:57:56 +0000
Received: by outflank-mailman (input) for mailman id 212413;
 Mon, 18 Oct 2021 14:57:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcU5L-00066y-Bq
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 14:57:55 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 961d76fd-5cad-458f-be7b-ccba4b38a5a6;
 Mon, 18 Oct 2021 14:57:54 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-2-ctkxHDk4OzODfcDHAUCHcw-1; Mon, 18 Oct 2021 16:57:52 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4191.eurprd04.prod.outlook.com (2603:10a6:803:45::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 14:57:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 14:57:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.10 via Frontend Transport; Mon, 18 Oct 2021 14:57:50 +0000
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
X-Inumbo-ID: 961d76fd-5cad-458f-be7b-ccba4b38a5a6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634569073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1m4TtRldkkRXons5yLf3aVmrTJjC3JveiTqS1h836Bw=;
	b=jkc5a0jaMOzjaEAgINMD33gMRKo9/dFFgr52PY0FDw/ExjVHrrlTDkLg3IjYUZHHycT6vH
	sMArXtnx3ydba5OMiyA2zH7uaXj+RtE74Bgqdq8Im8A6KK6KLp0SYFNThnegSbhIRn0OFc
	jKJcTZdUF+cNtY2aewHijcJ9b/BNRVQ=
X-MC-Unique: ctkxHDk4OzODfcDHAUCHcw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbYXCBJOI9KISs3Tu4BZW1jSFITlseZWsyZGhjiaqe6t5wfyHqfKasV59Vi4gVKwVt/f9bFt1kNy8Mg/MHxzIAb+YWNmvYUDHdlXQLvrL7FiTg8xteBpfIYFYLzVwdTJc9zZfmWkpBqvn6jbiREzHFKQLE7o8CFBcNIAncuHsTfxN8Ln0WfhNHYR6e1JnPrZhVcX32tt/zSm3XSDk9nQQyfQ3YrwfeL7FfXCuOWps/nikrUwrPYvGrTGFnFMadhQ565tzpZqjzxpGCd9FIrFqzoyOhRjNtUn6al2XHJ4QdfustijOqSWMudKGYJLs+7YStCdMGiXOMHZFgGO1JQ5SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8lDDQNRK3N89R4dW4qpZUfSavb1/N19lrDkKZSIOls=;
 b=YbS8izPVr0DKeGqqEEsu2dSqtZaQgL4MQjw351YgoygLo+rIx1PpUpNhZRBoHDQx2hP2k9MACVlQSzSfVlgAfNU8HZb4i4DkEXb6l4Cj2pIVX7E1djBc94NHtvjgZboJip4MFonLkla9dJ5gk5hyEsV26uu/J73j64RK0uEsn0TsJjGDGg5cLnVhOv9aBk5OyBktWl2MQLzVvg3F5qt8U/JXqEiNbp62CF/AsGShGLXVYCVGmFs/zrpaNuXMZ4lVS70vIUgJKQYqOHn7r5niJHB+sqE7oFZExAOyUNmGDI6rEdLmAlohDidimxxMqhb6BsZHydCyUjoBbAk2ewqYWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 3/3] x86/PV: drop "vcpu" local variable from
 show_guest_stack()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <2a14f2d0-2a53-287f-da36-dfb054c7f944@suse.com>
 <6dad4cfb-708d-027b-0fa1-77bb39319fe6@suse.com>
 <YW2GOBRJ9hV7O7AW@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2d2a08fc-8199-e356-e3bc-af1a5dfb5ffa@suse.com>
Date: Mon, 18 Oct 2021 16:57:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YW2GOBRJ9hV7O7AW@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a96de4ed-46f2-4374-6418-08d99247a7fc
X-MS-TrafficTypeDiagnostic: VI1PR04MB4191:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4191584A67559C7560E26D11B3BC9@VI1PR04MB4191.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	54OP4LUaG1YAdVqCYFxPsx+8U0l31mUFL/0XFoA6QVHibrWCTJ3hOUhVA7zvEg86w4aDJ/acQGvPGzEqbrc7MRdW7SQEvHcF71qsUWtWLHl57Hkj3zXCLSyPXjTfxSHd/tVolGH8BV9Z180mzz7uycE4PK0j/F2YSwVYBLIUmGttbkAZdGloxcaXKIX0UK0pkQNUjirwDIN7xl62KmpwV+hmQx48DlksD0HH58NFG5k1n1RUXZYLRMnuJT1EjmWTQfR/ErKwekrOQW8ci50hfh4OvZB2z2COuwo/NqWNu4sj/NhxiG0FFbqdQIDoMeP0Zq+vcldQTmxZdza8CMDM2u+B4nwACLPoFXkQawNlIFME89n+XBPgCI/xijfqaYwKmvJsiOaUCgMzvr7eAKojwMRFX9qeBQbV7dj09waU3rbS9ZwdlQSbFGUJhd5gOVYoWJXghA/5iqItCAqgMxLF6t5bMU/9Z4OilZARNCV5JtHNqnhXJB52yuQvgG99OC5s+bLZORX84Zrfz/p9NApwY72k5whZnchN0zdEtIrlRomLcLBuQlvJF8ID9aPm0rqgkWIXfosPwfsulfTYrLvcti5eP8gOeCZRY/RBd3o8LAsqL5SCRWnh0At1ee7byFcGwdnvbc1sZQLG+klqXPCl2ubbyyhPahA0OHHNLJjKsdJ4V5XeTHTeFtfHIOpizjSB2ino/+Y4xBOuq0V2PC5Dp4liBhV/HCbYl0Oh8MnyZ2YNCl+mTG1Ldmex1byCml2e
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(956004)(16576012)(54906003)(186003)(8936002)(2906002)(53546011)(6486002)(26005)(316002)(4326008)(66476007)(36756003)(5660300002)(38100700002)(83380400001)(86362001)(31686004)(66946007)(6916009)(31696002)(66556008)(508600001)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cESmklXrNfHPieFSs2iFmixr5NkcgVcby8UDxqK0+ZBikFwfRjwfNq5TEg2n?=
 =?us-ascii?Q?j+yXtdySkD9oUNLB/yTUV5YVcFrAIZ8ZgFef79YBdYYNXMUp6zxPvuLRf/OL?=
 =?us-ascii?Q?z7uLLkiTiv1sECfHtYJNz8Qy+cmzgWx3Y7HdOFlPxlUh02xQETgST2XE/qDx?=
 =?us-ascii?Q?73N7icRoEtghtClmcGE6P9ZQF6+p3JWMNTuGU04ggYph07ny0qfP6fI6U5qv?=
 =?us-ascii?Q?ejH0EAy/WIGeWocl95VYs32LCdzGWWEz4G1v20VG9CDm9ewkcEWyY4XqrFFP?=
 =?us-ascii?Q?fqLPeQ/3flkor97tWk52XRYhuBCGFF1TlsO2BKRFX4cteUsPU6rnaUt8vaDp?=
 =?us-ascii?Q?INlc6F8LLXadebcGMXrZ8d+IF0DeevQUNK5PD97Bdgh8OKmds3Lh8okznCJt?=
 =?us-ascii?Q?2nhO/ebn7f2BNqHwEvOP8fdQ6obRkpWNs6tIw5avY6mWZIAYGhSz/pQkm2cL?=
 =?us-ascii?Q?Wq4SnKnICwJBw58QJfdjkGFYbdx096uYZWFJh+xLv1dGlc/fNlzy4psAiF44?=
 =?us-ascii?Q?ux365Ln1tZU9gsVh3XYlN3W3RXDy17WmeIYbN6kwo+ZzTUyukFS3TTJ4wghS?=
 =?us-ascii?Q?0b7p8Wg7d3KAHaCeUE8e9C9ast/4Vt1Y6tT7IlvhZuj8ls9DZnvJtnw8114R?=
 =?us-ascii?Q?KX0suOyAJwH3YMAjqPy7JqVF1zXGe+UdidwIYkN04EITvdBeu3T3CnKHifeT?=
 =?us-ascii?Q?HCO5/vHWQSdmsAqgEBZw6tGsbvddpgBkcJT/EKAMMfHGGX1GB4qF+YvQvFe5?=
 =?us-ascii?Q?FbQko9ZiZvfCwCZ8/XVnIsZe1hJKVqAtKPo7dW8SAK2XJD2Xr8mtgU2y3j8c?=
 =?us-ascii?Q?gQKZEo3RrFNaTyqopPxcfYxJ8LA4Mt49JgKrN0z/iDULU0KE0/C9wLXNtzfa?=
 =?us-ascii?Q?5+pGJlG7TWrPE3MZvO1Lt9e+qr2uaCavl+A7+P4Cm/X39vvYtFqMAIOL2+s0?=
 =?us-ascii?Q?emRARpgWkZWast9t86NhEDEN+NwHizr7eo7AiPC9mGm1UeC1hRTtf+L6D50L?=
 =?us-ascii?Q?BNM0stoGSrtB4mgvEE8T2vbG+lS1Bg7UzjSHxkURhmBcpXXe3/qlw6q+ntqb?=
 =?us-ascii?Q?d/Z/w3fSUsBVizTiOAY/M/x8+SVQHnOSeKt4zzr+JzM93GARb1SKWWwIJ7jM?=
 =?us-ascii?Q?hDPyDC832/5aRXar2v+zBd1myKvJ9K3v59Y4ocBQ9A3f8S3jyc3f/Joae/uW?=
 =?us-ascii?Q?0ICaffNSxHxsHgclaX09+0oLZSohXZfHks2hn9M2JoCDhVyUkZdY5SHIYlRZ?=
 =?us-ascii?Q?HdPzczVF91ppd/gugeVWfOwcJKR3W8OKZg4gUXWJdrsfYLwqLh9pAEyH7KVR?=
 =?us-ascii?Q?QnL1jPotJeVvKOa9Ihcd5sTk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a96de4ed-46f2-4374-6418-08d99247a7fc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 14:57:50.9494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /U0go9IjIgU7rh+GFdTA+ZVpzFkoFgM0VwIuR3ojZqBLA1HruLepVQDk//E6Ga9xt2sUzsNbcw75bq0AK9jtkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4191

On 18.10.2021 16:35, Roger Pau Monn=C3=A9 wrote:
> On Wed, Sep 29, 2021 at 11:43:32AM +0200, Jan Beulich wrote:
>> It's not really needed and has been misleading me more than once to try
>> and spot its "actual" use(s). It should really have been dropped when
>> the 32-bit specific logic was purged from here.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

> As it makes the current code clearer. I have one question/concern
> below.
>=20
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -327,16 +327,13 @@ static void show_guest_stack(struct vcpu
>> =20
>>      if ( v !=3D current )
>>      {
>> -        struct vcpu *vcpu;
>> -
>>          if ( !guest_kernel_mode(v, regs) )
>>          {
>>              printk("User mode stack\n");
>>              return;
>>          }
>> =20
>> -        vcpu =3D maddr_get_owner(read_cr3()) =3D=3D v->domain ? v : NUL=
L;
>> -        if ( !vcpu )
>> +        if ( maddr_get_owner(read_cr3()) !=3D v->domain )
>=20
> Wouldn't it be more accurate to check that the current loaded cr3
> matches the one used by v?
>=20
> AFAICT we don't load the cr3 from v, so it's still possible to have
> diverging per-vcpu page tables and thus end up dumping wrong data?

I think truly per-CPU page tables in a PV guest would be quite
cumbersome to have. And iirc (it's been over 12 years since introducing
that logic) the check also isn't about the CR3 we're on being the one
associated with the present vCPU, but merely whether we can expect that
page to be mapped. This would also fall apart when a remote vCPU's
stack isn't accessible on the current CPU for whichever other reason.
I'd be inclined to further tighten this (and force more cases through
do_page_walk()) when we see evidence that we need doing so.

Jan


