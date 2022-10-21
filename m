Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16374607432
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 11:37:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427494.676614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oloSv-00028w-DO; Fri, 21 Oct 2022 09:37:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427494.676614; Fri, 21 Oct 2022 09:37:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oloSv-00026a-Ak; Fri, 21 Oct 2022 09:37:21 +0000
Received: by outflank-mailman (input) for mailman id 427494;
 Fri, 21 Oct 2022 09:37:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VH1f=2W=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1oloSt-00020Y-QU
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 09:37:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2043.outbound.protection.outlook.com [40.107.20.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1112f99-5123-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 11:36:19 +0200 (CEST)
Received: from PAXPR04MB8366.eurprd04.prod.outlook.com (2603:10a6:102:1be::12)
 by PAXPR04MB8624.eurprd04.prod.outlook.com (2603:10a6:102:21b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 21 Oct
 2022 09:37:17 +0000
Received: from PAXPR04MB8366.eurprd04.prod.outlook.com
 ([fe80::64e2:acbd:4d56:fcca]) by PAXPR04MB8366.eurprd04.prod.outlook.com
 ([fe80::64e2:acbd:4d56:fcca%5]) with mapi id 15.20.5723.035; Fri, 21 Oct 2022
 09:37:17 +0000
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
X-Inumbo-ID: d1112f99-5123-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYMyHQE+sbMbRVy9yHWyE6/E4GfUggqrYo1pj+H9X39//V6uO3cs/tJNwZVlLeP5AoSuUu5qPg3dpulSqDZ63CCf59oe2LnsC4WydUr4U9k2rOwN1F0ORJT6Yyk0NXThT/mTgLnNthgPKTpIefigtbVlKYUMX3VGcNUD4vFiEQwD1oUk8OHeaX6s24iFD6hFe+QrOEK7+pwpEhFyq51X4/255Gn9GCaxBXJDlrQLNe7vreshMIhqhQnAtkXYXfs48iQyurzG2afSxd3juGQDCfdhTtAQienk5aGDSZoMFVmGYX1ZGFzLA+iZlYRLiga959GwopDRZku24XzInhnzHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lD/kD27MU97TTDhFYxcqdUuePGSrZO2yQ+QnXV941vk=;
 b=kOP4XkKrtjo2IG4Avagzipsy58yHsLLRfdqXaz5NbwMQDl0SbCyajBGjy+ZllV+QIOA07x/a2YNWZSBc103F/4JQ/TCEnmwGaOMYWNP0cmMJ01OV8YZDnorbFkcpkieVHuHQghDKKoHuBdGuQ0Q8wkkFhtFzmCANvTn2WhM5xGji+XETqmiaJWdGxD4Nj4yMAcYerD2XHtGvBoGOIfkI1q0fflZL1OCLNeX3I1G+9jlSFjtipHm61DZ9pLM7Bj+SoSaWhcLBTsdTZifZ6IRZfHfPJ/Janc+sp+4qlyAqIodsb3DKp7nwB1fMfmdFoKgPnkr+G81ZbjZJUYl6cIdnrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lD/kD27MU97TTDhFYxcqdUuePGSrZO2yQ+QnXV941vk=;
 b=hn+ohjoF+XUSkLUZIQ4L3V6huuNT2jpS7DxOk96Ky12qHbrBexR/EoT/VXLDCQ61kUy+2mR7c3pEQ7IN1FLD8pCRb/id0w/D9Mgmf1sYxGqoaTGdeRDn00pUbH9codYAclrq9Xi4+2e26IaSxChAoWyk34e5xdzd/3diuuDrhIXQ+OKwwxueJQZ8Yz73iPcXbSCzJJGeeuq7HRJev4cBAkM8fH80cegzAaNoJ/c0jFom4AWx6N1Su5gttFBg1JERBEzksTBwHgjzFLdtgiHAynMK6HGsJ52Y5RVRqT6xLPfdVHtLcDAoVYYdINGf+sszx3sIMUKUx7NX1gOouGTluA==
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Henry.Wang@arm.com" <Henry.Wang@arm.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "mengxu@cis.upenn.edu" <mengxu@cis.upenn.edu>
Subject: Re: [PATCH-for-4.17] xen/sched: fix race in RTDS scheduler
Thread-Topic: [PATCH-for-4.17] xen/sched: fix race in RTDS scheduler
Thread-Index: AQHY5RPdyv7HUa7jcEWPdT3S+dSn164Yl0EA
Date: Fri, 21 Oct 2022 09:37:17 +0000
Message-ID: <e661d49da44ff2f6d17ab7371f10bb38ae61369f.camel@suse.com>
References: <20221021061042.12083-1-jgross@suse.com>
In-Reply-To: <20221021061042.12083-1-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.46.0 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8366:EE_|PAXPR04MB8624:EE_
x-ms-office365-filtering-correlation-id: ab133433-55b4-4a3d-54a4-08dab347d7c9
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 QGm4+9VGgcDSor8PdAWylv93gRf1M0aeHe2K0b8QVwQ4r19qp3oQ4Vxmhk0gmyMoplnhMYwkiEgmdD+hYmdFem6Wd0NDL6M/pYsRbAmAc/UC6hkAC9kZetrL7A8DV611CJEj/yM5B4GF0f4h9Wu724Ka4T6PdW8R5Yg27HGF2F52nQ2VsjrPU5ItGKbbxPQuq6wlwZnz/QwdjeISd6l131t4+252Fw0M2g6LtBzc5Cvfa1Y9gWXG34DlGbUR0RAREYFOFdKOpZrvH1v4quKNqi7rGebo0uYOaPk+9+B2eSa+48yOHFnCxfhvC5iOmUe0RWdCwUVvvyqt6iV3t8H+faS0PK/jehc8Leuzvv36+Iyuqr0wXQK7hYZAZQce+si5/18U+7vjg+t0m0x9SkOhum2Nj2fC7Fhr3aekh7WwVhlMF4kOVtid0nRqWSx6++r6N99m/Hb23US8pFTE9mL/VxbiE7LY8qAUk/lHdyz0V6+N90aeWGZj3U89N6dRJesfwo5IvqvTQMj0yjoVGQd9pKJV1yQKfvVl+W/h3TQUkvBEJeplBWW+TPQketP9V4CzpV46NxU0H48X87FxXKf3iuP43TiqhrcEO7otDZ28mbJ2YUhyDgpI7ibdkvy0iXX69RhzMUukqLYrBhMngHcpQ0Lxw3Wq/0jK83Cj85gbnCqLqUTXdxBbp43bPzdWidFBrNIgDJyD2dV6xwhWcw7nf9DVmNPun9gkXi0TaKnDDWGRadXvKDD+CVQnn0tj1mCXx5p1XsdHC6PYj2Nz/WDBmsXSKHFXr2lTQdchyxYL3+zGFBCxSZb0MHgwY+vrKZPh3Zgsl7sUWgSDWZxglDSywQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199015)(6506007)(4001150100001)(478600001)(316002)(122000001)(86362001)(38100700002)(38070700005)(99936003)(91956017)(186003)(66946007)(66556008)(64756008)(71200400001)(6486002)(76116006)(41300700001)(8676002)(4326008)(110136005)(2616005)(66446008)(8936002)(966005)(66476007)(5660300002)(54906003)(2906002)(26005)(6512007)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MERmSVhKbEVlRlhwT0liMXBQZ1p6bHduRS9uRk9VbmdpU0hJOGZOMFMyUEhx?=
 =?utf-8?B?bVlhc0ppZkxvYUNQQW9jYWVjclA5eC9oOUZCVSs1NElQV295U3hpL3VJenM2?=
 =?utf-8?B?R1ZnZjZWMlc2azFhU0l2ZXpUZ2ZDL1djTHEyMjcwYW5WUXYyN1g3bDBON0ZY?=
 =?utf-8?B?TW5ld050N1dGTXhqQXdzSjVpMnN6am0zaFQvWEYvK2hQdU45UEI1b2Q0UzA4?=
 =?utf-8?B?R3JYUktYKzhPWVVuMENnSkxiaFJiS0xPbm8zcElZRnFNbWRtNlhjQzZTSzhi?=
 =?utf-8?B?MVJsMS9LMitRSVd6OWMyMVhBekVtdE5lNjFyeW9DL29EMnhtWTFsN3lkSmtr?=
 =?utf-8?B?SnliemJkMDI3QkY2S0xnTWZHRWJuKzRsaGViRFZMaFVlZHFGMSsrWjFJUTFU?=
 =?utf-8?B?bWs1cWpTYkE2U2o1R1VCRHozelprNGViNmdDL2JoZGxvaWF6SlNVZ0p2T2lH?=
 =?utf-8?B?OWJrYmNyK0t2Y2dSSlQ3ZEVGR2s1eWJYNGs5RlZ5dnlCb0RTa3crakJHWHdF?=
 =?utf-8?B?VC90VnZ6Vkx5RlErd1dzcEtqR2RFYWs1bTR5cW05Q3V3dkk3Sm9DRFVUaklu?=
 =?utf-8?B?ZFpzWjBYRUx0UjVWVnlBbXYzSUppb3VUSU91aXhqVGV1OTZQb1hOK2Q3SEZW?=
 =?utf-8?B?LzBVclNDYTdhOVM0UVRFOGZIb0tVY1diVTlqNFk4S2VLRkU1SExQRENvaVB1?=
 =?utf-8?B?YnpSaVhrVUtiUkt6bVlqQXJ6R2s4Q0h0SWFjV1cwcnF0QkZmQzFDZDExK0dI?=
 =?utf-8?B?K3Y3Tm03V2g5OU9QSk8vSjE3Q092bW9YNDlPMmg5NnE4b2dpVWhHRlNyY0Rv?=
 =?utf-8?B?Z1g0WS9lWFB2RDEzV0oydmxXSVJuNVRUeFBlYUVkQkpsZDA3V1RUMWRoTzR5?=
 =?utf-8?B?TUtGTHdrMURHVmpYUU5xTVplOG5VaGR2SkZQODlhREpXWTd3VkNXdzBNUmNB?=
 =?utf-8?B?amVNS1EzVTNzWXRPTkpKT3FpVnZsN2ROVFZxY2krQWdSb0VOK2c3OXBNZkZC?=
 =?utf-8?B?YjJTT21zYVBGbnR6NEF5Y2kyaFBpaU9VSGdNZnRlbnZPVTI5L0g5UFgzSzFP?=
 =?utf-8?B?bkJGWHhaMm9tVFJ1eWkxTDZSVnpDbjFDc1QyOWlyOExMNUk2cTU1bDZGTytT?=
 =?utf-8?B?Q1VUK09pODQzM3dWbHFqdWhaMVpqbFkzZkszWGZpNy9QQzF0ZzR5TUhRRkpL?=
 =?utf-8?B?d3F0eDI4bnpUVmFHajFhQk1yZlYvU3lSR3FmT0FoZENpcVBUM0hWVk1WSGp0?=
 =?utf-8?B?aXQxdU1sa01pMmlER3R0cjlXR3kxWkZVSk40L0hsWm9BVnF2MkhrQjhmK0cr?=
 =?utf-8?B?d3RPSDNoU0NzM1g2SzVyVjhCZXBWam5xbU8wK05scVNCREMwdjhKeU1aOWUr?=
 =?utf-8?B?OGJJN2lHUnVmR0ZxeGQxRXJWRyt2VjF6aVlDdC9ubmlCRXJQcmVsTkgwNm1W?=
 =?utf-8?B?M1poTk1hRThTUkZMMnh5RWhvMkNXN3pkSFA5b2FDbGt5OE1zeG82bnFlTzAz?=
 =?utf-8?B?a2hNVjdDN0VlRDFsRGM5cFF6TFFHNEU3UGFqUzVHbUs0YnJiOWs3NzQxQnNI?=
 =?utf-8?B?WUVBbjNuVjE4bHdEcGpvakpJbXhrRGY2cXZaOS9hTUpyTmNySDNJeWlTMTdG?=
 =?utf-8?B?c1BjUW9iZm9ueTFxZVJUY3R3aG1jNVJzZWNINzZVOGNMY3NrcFN1TmpobzVs?=
 =?utf-8?B?bklRS3ZnN3dsRmo2MHR2RUM0ZC9FWXc5Tk01SnRFL1IrV3RUYjFvYkFZM0ly?=
 =?utf-8?B?Qzlnc1ZucFVFM3NSYUtBM2plMjZodmQ5d0ZBNzNlYTh1dVdrcnRIRkdta0Mx?=
 =?utf-8?B?UmR0cGhuaHQ3MURBVEpOczJQQVZvMXRhdXB0NFNPc29xZExIcFpucUYySHVv?=
 =?utf-8?B?MC85TTBwY2R1a1pvQkhlU0h6QXFpaTZLZmZDREdUZXpGd1hRYU5RTXBNM25V?=
 =?utf-8?B?bDB2eERBMWFLRWFoUGxSaTEwTEZ2M0dvZUd3bXB6aE9tWW9GMUtCd2hVRjJo?=
 =?utf-8?B?U1dJOWxMMXp3djRmemd4STcyTGQ3VWpBdHd4ZE9QZXZub2tHaTNTM2JRRWha?=
 =?utf-8?B?bnVMZko4YlhDRytZakdqN1pHTWU3Tm1CNHU3b2Z3ZU9YcWlqQXorM3N1Vzdk?=
 =?utf-8?Q?oMYOat+JMgdMJVMgZ1B6mH8MV?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-2SM/KrvKGYYRkZ2NlYjP"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab133433-55b4-4a3d-54a4-08dab347d7c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 09:37:17.0379
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2xnvcpY9GFNq495mFrKiXI9cZ9DIj2Z+Xv8pOfyZhHc4QFbYZtUWV8/hABuRFxlFz8taC+duc+QvSupV5YmB/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624

--=-2SM/KrvKGYYRkZ2NlYjP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, and now, something not really related to the bug being fixed here,
but about the code that is being touched:

On Fri, 2022-10-21 at 08:10 +0200, Juergen Gross wrote:
> diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
> index d6de25531b..960a8033e2 100644
> --- a/xen/common/sched/rt.c
> +++ b/xen/common/sched/rt.c
> @@ -1087,6 +1087,7 @@ rt_schedule(const struct scheduler *ops, struct
> sched_unit *currunit,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if ( !unit_runnable=
_state(snext->unit) )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
q_remove(snext);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 replq=
_remove(ops, snext);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
snext =3D rt_unit(sched_idle_unit(sched_cpu));
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0
So, adding a few more context here, the code looks like this:

        snext =3D runq_pick(ops, cpumask_of(sched_cpu), cur_cpu);

        if ( snext =3D=3D NULL )
            snext =3D rt_unit(sched_idle_unit(sched_cpu));
        else if ( !unit_runnable_state(snext->unit) )
        {
            q_remove(snext);
            snext =3D rt_unit(sched_idle_unit(sched_cpu));
        }

Basically, we've tried to pick-up the highest priority task from the
runqueue. If snext is NULL, the runqueue was just empty, so we pick up
idle (and then, later, we'll check whether the currently running unit
is still runnable; and if it is, we'll continue to run it, of course).

However, it can happen that --e.g., due to core-scheduling-- we picked
up a unit that, despite being in the runqueue, is not runnable. At this
point what we do is removing it from the runqueue (to avoid picking it
up again) and we go for idle.

Now, I may be missing/misremembering something, but it looks to me that
it's possible that there are other runnable units in the runqueue. And
if that's the case, why do we just pick idle and move on, instead of
continuing trying?

Juergen... Am I missing or misremembering any fundamental reason why we
cannot continue to scan the runqueue until the first runnable unit (if
any) is found?

Of course, this is not really related with the bug this patch is
fixing, which is correct and should be applied, no matter what the
outcome of this subthread will be. :-)

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-2SM/KrvKGYYRkZ2NlYjP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmNSaEwACgkQFkJ4iaW4
c+5+Tg/+Jq2Z4SsUS1ODdpZY7TkgFdHnYhDrZrDf2B72R8nsKa6ZaX9vQJdCjPzQ
Hdgn6xl6KaJh1VXsfdnYnkysdyzR55W4L9AkUWm1E3akXR9BqV886zqj+k41yuva
yhJ2JJUqjRr0oHmDNj5Ay9xAqYp7XPab0opf/T/BfoTBdsvS7pVmD933QE1uh3dG
L0bj8x5WoFyR54V7xFPWP1f5Zpn2mSbEYE48UnnQ6rKozzmIDNdti8EtV9YERR35
jdHuYbXUJE9KhcA1CqXwmeXnf4Dw5QdLKRLAXudNMLTlSWLApSoi2D+bFnn9w46R
+ACY3nVGUBqoGqAbZ9zcgdorBZTJcQI983pJdRXyU9Vxp4T+47wTOBbYTxRAqVev
pUPh/Sr9ZLwnBjz+5jmdH+jJEyOKE+GQSm9/ILvJ6yfdlTE64KyCV0g34OkSXVkX
w7OcZJ+kE5t3/7kv8EeDnIcyo/W4Gje1VB7nVp+VDQxGpFgkZqKDz0zq1l6q67Bd
7JsZE97opULfP2uHh+w2Iw9oQF1KeiBtMLM7PRb/hulkVKg74U3k7EDt13pBa4TZ
q1D6vhQcIlhTl3OV6nq5x/i0dcwFLQ+36iUJXVENDt0ybMgMKVu0rQGvpw6qMF+i
8rAaFRyFI+xI2Us2/WEjYirrgvDckZQz69ZfDEXOFy5RcFni9vk=
=s3V8
-----END PGP SIGNATURE-----

--=-2SM/KrvKGYYRkZ2NlYjP--

