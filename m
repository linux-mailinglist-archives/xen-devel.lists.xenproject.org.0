Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4584936C8
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 10:03:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258783.446090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA6rm-0005oU-0m; Wed, 19 Jan 2022 09:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258783.446090; Wed, 19 Jan 2022 09:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA6rl-0005kw-TP; Wed, 19 Jan 2022 09:02:53 +0000
Received: by outflank-mailman (input) for mailman id 258783;
 Wed, 19 Jan 2022 09:02:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skML=SD=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1nA6rk-0005kq-JT
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 09:02:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9493e363-7906-11ec-9bbc-9dff3e4ee8c5;
 Wed, 19 Jan 2022 10:02:51 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2059.outbound.protection.outlook.com [104.47.0.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-STav_W4eMW2KGUfOvBbJ6A-1; Wed, 19 Jan 2022 10:02:49 +0100
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com (2603:10a6:208:134::22)
 by VI1PR04MB5901.eurprd04.prod.outlook.com (2603:10a6:803:e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Wed, 19 Jan
 2022 09:02:46 +0000
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::89d1:c043:73b0:be06]) by AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::89d1:c043:73b0:be06%6]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 09:02:46 +0000
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
X-Inumbo-ID: 9493e363-7906-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642582971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q1nCisR+MpxMjCvUUdyHb0D1eVkTXqFbRGIji655TQI=;
	b=RUP+Wl6+SvDpSCPeSr1Cd/544sqcjL7QLFbPOJeu9JTvnguM8Jc5d9NcEwi4PPHQ6NVd7j
	97Djp8JXAWuGZ0NUZC/PMDb5eVZ6i4rmdg7d/RJ0uVm+B189L8WlO7xV7X3YPbT3VufWl7
	cQP7fniuvEXdIFdjNzwsbHNc+cwMkxU=
X-MC-Unique: STav_W4eMW2KGUfOvBbJ6A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOw6WYiUV2E2sgU6ibKwx4ZEJA1OxuxO8JfPSSlCQEYZxch3WU0QGdoUtqO5yeZiyldl3cLat9NDr7QCFfzvGgbh05N0gitoEVpjYS+WgRR0UE6yE9lSqcM0BF9KJlrQ0yThYeB08p573hG47Sxf3mz2moGbW7zCl9ArUwh/8AK06j6IcaVvPI5qJ6uPgC9M3AGDYly6Qsi4ZcXW7gzzSOW/TtRPyuaolE7slSIyXRiStyZddwPh1FlX5L/TyuZw1g35wvvclGyGPvZiOHh7j5A0s07p5pelh1i0KfDv8Niz9eUtwNMY14d3TYKQxAde9QjTkG62eHgBPCiZr3JypQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1nCisR+MpxMjCvUUdyHb0D1eVkTXqFbRGIji655TQI=;
 b=E3eHApyMsuWKb7e9L1qUygszpG15ipe0zPi5yMNrJfLYtnEuC92OOwVgeN6da6nqADxxQvIaW8yataZzS9eFsR6KVfLG7PPKqZo7A41+Y/pHwCncwKN8Id+Ha5X54w4iv0+gyxzNwbegk1djDzjA2wHrce9XShBWyhKAVwTpaES9lTiFzQ6IwKFhrlxsXAjVqRsW8FKzIlNeT3yhFyflkPn/8ewhvCfagMvRfAYW9Cx1zz//vieHp4Znku4RUqpqtlFt3/UXHvQRdqC3IJZPemhDj45Tnpc+sPjLiD60bTI1hzwGBGGD3dgHg87a+Jn/DqvyW5oMCtic1LbydpKCnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: "anthony.perard@citrix.com" <anthony.perard@citrix.com>
CC: Juergen Gross <JGross@suse.com>, Jim Fehlig <jfehlig@suse.com>,
	"wl@xen.org" <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] tools/libs/light: numa placement: don't try to free a
 NULL list of vcpus
Thread-Topic: [PATCH 1/2] tools/libs/light: numa placement: don't try to free
 a NULL list of vcpus
Thread-Index: AQHYCHXrUuOcqEMe8ki4TaQGMIKek6xjKiKAgAQ6pgCAArDxgA==
Date: Wed, 19 Jan 2022 09:02:46 +0000
Message-ID: <0e957283f60595cffdbbef2a8d72ea66b459cafa.camel@suse.com>
References: <164200566223.24755.262723784847161301.stgit@work>
	 <164200569629.24755.2980883411590685040.stgit@work>
	 <YeAVjpmuV9LIRFpa@perard>
	 <912014da2d821a14418e272f95c25e60be2b7a4e.camel@suse.com>
	 <YeWRyDGEFrOCeycP@perard>
In-Reply-To: <YeWRyDGEFrOCeycP@perard>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.42.3 (flatpak git) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ee0d671-a427-405c-929c-08d9db2a75dc
x-ms-traffictypediagnostic: VI1PR04MB5901:EE_
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-microsoft-antispam-prvs:
 <VI1PR04MB5901184E9DEEFB817835F459C5599@VI1PR04MB5901.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 hODPFfzAyZRN0XdrWObwcaBq3PgvOC6FJw/2xOffrL5Ov5786WCp3B9yOAGE3S9o7Im6GXxWv7Yyg/cok+bnjC7hATBwZ59/4sM9nhRYrjSzIaA7KFspM5JtRPX7LTurywWukp3kPq0jkfrRF0y+8Ie0TgcmhF9ohnTEAQ/mMK65TKrtL7hjxkfhKAAj867mqrqtX35999DZjrguZ6iUfMe9CMddXDrkhi4PSmUZVZ+9cQ1jNNRjE/0EijMqf8zv6fSLlogoR3l4iUTpAxubNKpjDQAM1Eh8EUVTbdlwVr/NyWgr5k41eDus7/L/fkh+8B9uiM0GAJzYLtvYlRkqsXz+eZopb8O/c0NiTtAsXcIhhwCPg6pwF8K0uXW3aHnk2+Bwn54vzD7VRQO6m1zIobHq8v0Ko2wdIYIhiCrTMjvp6EeT8sA6d0sRkadWT4xbwqzaQoStu9g+UbarT8IKqAx8GQtHmPBDcbdLEYPWeq7IdqeBMQHvsu+Ags4/jiqxFctPLfFMQCchjyoSz1AdL6uI9HHiyBua5IxHWXrZBD2ig5IaczJcrQCHjjDP2KvGlnnxHNs9ZW54UYG1j6aVwEZ1XC3129TFe4lDs9CEY2xmPpfUu7ugV+yHB0esocpu9oGPGKoR9PzpzR4Ozx521EE1dhZFCMme0wGCgbrpCeKSpF0WU2RrnntJ3P9XOX1NiQ/0LNscxlF47dvjgccI+HRZ1GlZivmGa9xAXzbo/ooYUMGrYJeq0AjKB/uu+w8kbu6TB7un0taaNRpFdKGNPnBKGcJZ6dYNPyqFB2HKwRpc828FSTvH9MDls5olGr+4
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5826.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(966005)(122000001)(8676002)(5660300002)(316002)(36756003)(54906003)(64756008)(2906002)(186003)(4326008)(6506007)(91956017)(66556008)(86362001)(8936002)(76116006)(508600001)(71200400001)(99936003)(26005)(66946007)(38070700005)(6916009)(2616005)(6512007)(66446008)(66476007)(6486002)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QWV4cHE3UGpvR21PZ3hXWG9PckRONG5SYzlVVHYvYi9ubFVoUVFxSm5CdTJ1?=
 =?utf-8?B?Y2lOSFNlbGhtdGFQMnJpOTJkNms2MjV1cEdkb3JocTVsODRIWXBVQ3dLOHlu?=
 =?utf-8?B?Q3BUbDdXMkVSSUxoeWlIek1abDBpV0V1YjNlV3dCMWlUdE9hanA5QkJaYzh3?=
 =?utf-8?B?WStZR2VXTkUycVozamt4bmlDZ2pqQkxuZXFiK1lVN3VNSVVqeW9yQzR3TUgz?=
 =?utf-8?B?Y25IbXhodW1IRUo1M0VxZzh3LzhKV3d4RHZuSWJrY2dCU0JyU043UEFBQUJ1?=
 =?utf-8?B?aUxzNkxFS1RXWmF6TWhDdndPVDVEcUFKQnF6L1NHM3pGTWdoVDZMeTN2eGJC?=
 =?utf-8?B?YWFkM2VMUWFoSFlvbHlwUzJvb0ZiSTZEQVFMZzNoa1JNUU56YjNYWDZTMDNT?=
 =?utf-8?B?K3ZWWGlBdFFzTCthZzR4UHgzdmt1NUpCeStLRVV6QVgvSFlwRHRQU1lVMTcr?=
 =?utf-8?B?OVArbjRWL0FJVWNxcUVwUXBnZlhxbk5nWjIwSWpWZWJLZmdHWWFkeERUMFpZ?=
 =?utf-8?B?K0VlZnUxeUZTdlhlOVA4N25meTRwSDZlWUZJcEhxVHBzNWh5NU85R1psb0Rp?=
 =?utf-8?B?ZnRMelJQNDFLZ1NRaitCS2NUTWdJd3VuZzFWbWpuSzBDUjU3ZS9IUVlMUjg4?=
 =?utf-8?B?WFpzVzM3RXNLMndiQVBQYjRmdWRKMXdOekhyN0xYeGJwMHNxb2tJVGJVVnRT?=
 =?utf-8?B?RjJhMDYxbjVyYjErMUJ6bWozQ1A4OU5NT2laQ295bFdSUHVaL1kzM29rQ21a?=
 =?utf-8?B?QTJpd0VIYnpOWFRnanFjZ1AxNHZXVTVEK21MSVhRZzNmRHJtdEZZYkM3Yll2?=
 =?utf-8?B?dVpSUVFhL2xTdEp6RkYvK1hBODJiQi9xYS9yNWhSbWlzc05uUHZnckpibVd6?=
 =?utf-8?B?YXV0MThNSTdpVXpLUDRubEpnRUdkb0JVUC9NU08yVGhiZVBMa1JmcFpVLzRs?=
 =?utf-8?B?SWxlZHkyd0s1WW8yanN3L2hySWdIRC9NT1RvLy9CcFI3T085T21qQ3c0b1JP?=
 =?utf-8?B?WlF4SklWTnByTTNnYnpkMnFOSFNhUThnU2syZDV3dkdPZjYzc1ZFWS83OHJP?=
 =?utf-8?B?VUxuZ2I5UzFLTCtoY29OQ3VmUHlsSDFud2lLMG40NFh4RHY0N1hmTVRXOU1s?=
 =?utf-8?B?eXc4REwvczM1U2JCWUM4MUlqTHFzcG1RamZkRjVScjYyQ1FodXZIZ2gvR3Q0?=
 =?utf-8?B?ejJ0cmdvbEJBZFpVY095NUJScTd5Skl6WnR1d2JKMC8zVDdmaWFHbitHVVpY?=
 =?utf-8?B?VkFaay9WNDVhbnVJbkV4SWtBZVNJcDNMR1lpVDVYcngrbkpHa1RiWHdDTlRi?=
 =?utf-8?B?Y21EdW85SnN3N2dhbkNxblJ5aURWMXp3TU00UUdVRmV1UE11MkRELzdGcFI4?=
 =?utf-8?B?N2JYVEtWMmg1RkRza0xYRGNPNG91QXRwVmhLMGNLbThVRVhiKzBwbDFHdlV1?=
 =?utf-8?B?SkNucnhrOHJGd0ZrRU9iY243em1GajRqdE5ETmlXQnhpSGF2SE5LdENhVUhS?=
 =?utf-8?B?TWsxQlBRZjd6SmRsNG80N09FYUNhQnRoTjI4SEFITDhmOXJHaXFMaVlWU0Iw?=
 =?utf-8?B?TGxrSU5CNGJ1a0h0dWlHeUllQzR2b1dyUDVxUy9rOFcxQjJQaFZZTSthNzli?=
 =?utf-8?B?MU50WllXQmJtaHV5NG11K29SQ1NySE1Fd0hVZnVOYnBaZkR6Z0dHUHJaRlVE?=
 =?utf-8?B?NTE1Njl0aXZ4VkpTSHVUZzViZTMwamVJTTBsV0pXNjdCUkVKaStlQ2RRWi9U?=
 =?utf-8?B?QU1VTEZha1R0cGYwaHUyWCtJYmNETHBGQWJlRWNPUWVLRFp2bjVRVVVEOVVa?=
 =?utf-8?B?WlhvVTFsU1BQVnlkZ0lOMTZ6cGJQYkhmNFltNkZTYWoxTkRmNk9WcFZtcXAz?=
 =?utf-8?B?QlFMZFR5S3U5U01UYmswZnQzRVZjcjUyY2hyZk5mbDFpUTVraEN5ZEttcHhu?=
 =?utf-8?B?V2p6bnhidWJoUFFRWmNuRWFQU1NVQm16Mm9Za2htajZVUkFGZFNoMjkxcVFL?=
 =?utf-8?B?U2t5VDJCQUNINmJacnlQV0wxOW4wUkk2bzA3NmxRMWNhVzN0bk5oM0x0MUFP?=
 =?utf-8?B?bTJ3d1QvZ0VrQXJOWWhjdW03MVpIK3BvWHVnV2luSi9TSVB3T2NEakQ1dk9y?=
 =?utf-8?B?VFE0VmFkT0tSS3lGaCtVM2haNVNLQkxXMUcrY0VrYVVJTkdoNVlqQWw0Q3RL?=
 =?utf-8?Q?aCStZCBOVR+L+9Y6QEiK3iE=3D?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-NhZT698sNnUSGCgTEgfH"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5826.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee0d671-a427-405c-929c-08d9db2a75dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2022 09:02:46.1197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I6nq78uIdNbGKogb5wdxwJFDbPnRTOsfr3+qlvnJfWbUKgb2LzfWM3S3cy2AOq6nCNymqcPJnH2A6YRqb0g7ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5901

--=-NhZT698sNnUSGCgTEgfH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2022-01-17 at 15:56 +0000, Anthony PERARD wrote:
> On Fri, Jan 14, 2022 at 11:22:00PM +0000, Dario Faggioli wrote:
> >=20
> > Also, if we go that way, I guess we want to change
> > libxl_cputopology_list_free(), libxl_pcitopology_list_free(),
> > libxl_numainfo_list_free(), libxl_dominfo_list_free(),
> > libxl_vminfo_list_free() and libxl_cpupoolinfo_list_free(), don't
> > we?
>=20
> I actually don't know if that would be useful. Those functions do
> work
> as expected (I think) with the right parameters: they do nothing when
> called with (NULL, 0). free(NULL) does nothing.
>=20
Right.

> So checking for NULL before using `nr` would probably just be a
> workaround for programming mistake in the function allocating the
> object
> or some missing initialisation in the caller. So I don't think it is
> important anymore.
>=20
Agreed. That's why, as I said, I though about doing something like
that, but ended up deciding not to.

> > > Also I think it is better to keep the free in the exit path at
> > > the
> > > end
> > > of the loop.
> > >=20
> > Can I ask why as, as I was trying to say above, if we are sent
> > directly
> > to next by one of the goto, we do know that vinfo is NULL and
> > libxl_vcpuinfo_list_free() will be basically a NOP, however it is
> > implemented.
> >=20
> > Of course, you're the maintainer of this code, so I'll do like that
> > if
> > you ask... I'm just curious. :-)
>=20
> Freeing resources should always been attempted, even if that mean to
> check whether there's something to free before calling the associated
> free function. Imagine someone adding some code that could fail after
> the libxl_list_vcpu(), then when that new code fails it would `goto
> next;` and the allocated data from libxl_list_vcpu() would never be
> freed.
>=20
Yeah, sure, whoever adds code that does a 'goto next' with an allocated
list, should also realize that libxl_vcpuinfo_list_free() needs to be
moved after 'next' itself, as a consequence of the very change being
done, and this seems fair to me.

But, at the end of the day, it's not a big deal at all. Thanks for
satisfying my curiosity and, since you also agree on...

> > Actually, if you really think that the call to
> > libxl_vcpuinfo_list_free() should stay where it is, I can just drop
> > this patch and go on with patch 2 only, which is enough for fixing
> > the
> > crash.
>=20
> This patch is just a workaround a bug in libxl_list_vcpu(), so I
> think
> it can be dropped.
>=20
...this, I'll just drop this patch and proceed with just what, in this
series, was patch 2.

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-NhZT698sNnUSGCgTEgfH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmHn07UACgkQFkJ4iaW4
c+4nIhAAlK1mmyQ8jN1DwUPVEH0UDxMM6aY9QUxd3XP1TziMyLvDtsx1e/UFl0C3
3goZPZ2vhcRbT9RU7BiOMco9UhPW1QanRMch+qQTYcB6Mn6r2qif+H6rymG8+3Wh
Z5Fs2SPP3jjDOcjgnSN8exVasr7cFIUkPmy8vPOdq9A0GFrFTEUXdGuKYkzC3Ig0
Vv7a1mG69UBvfcJl3NuCLF3WuynOQsdBdDeh2bT7gain+M2IeXG/KoPigmyoHp2t
JIlqHY/8jeJqqbzKox2Z0NVL7TWY270olp5hwo7mQU7qf6AlijdO2iYgldsZOIB7
7gAk4MwI0uzG8RyO1W/3mfPhVp94DdEXAoSdy/94SPJuKI7XBVkzJWx1iGHoMsfD
dqUodGxGo4IL2Iilb/gHKVLAnshla4KCe2YYoidchZqnyAFrQnPY6YvWsDPFX3GO
QAOPVj0GaFBF4rc1p+rmSM0H0g01D0TkenahxjCGIwF8EW5Lhqr8jL0Ns6SdCZ4y
o/sjkmYv0rDRIGSCFuU1N5qXsHPoj1hnngXS1r0BXwIChw7hskjNJQ9/QBTOH+RE
tK3fGONPD2n8RzfG4ennL/08wP704/bVfhdUJO1OFbUc0pucN0ItgKQ1uJXOhEe8
5szD9fWlDEFf98YGmIfJ3B+ITQL0iDPJUYP40LDZ1D7oO39H5lw=
=/whO
-----END PGP SIGNATURE-----

--=-NhZT698sNnUSGCgTEgfH--


