Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DD548F006
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jan 2022 19:43:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257668.442915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8RWi-0006yK-5S; Fri, 14 Jan 2022 18:42:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257668.442915; Fri, 14 Jan 2022 18:42:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8RWi-0006vS-0I; Fri, 14 Jan 2022 18:42:16 +0000
Received: by outflank-mailman (input) for mailman id 257668;
 Fri, 14 Jan 2022 18:42:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/lXT=R6=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1n8RWg-0006vK-65
 for xen-devel@lists.xenproject.org; Fri, 14 Jan 2022 18:42:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af094d16-7569-11ec-a115-11989b9578b4;
 Fri, 14 Jan 2022 19:42:11 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-i621btsoMYSRknEGceWtng-1; Fri, 14 Jan 2022 19:42:09 +0100
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com (2603:10a6:208:134::22)
 by AM0PR04MB5987.eurprd04.prod.outlook.com (2603:10a6:208:117::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 18:42:06 +0000
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::89d1:c043:73b0:be06]) by AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::89d1:c043:73b0:be06%6]) with mapi id 15.20.4867.012; Fri, 14 Jan 2022
 18:42:06 +0000
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
X-Inumbo-ID: af094d16-7569-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642185730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SXAiKZrxUwHYDgc+8CtOmUZsCUkL+4OdmdmE7Pw3DKU=;
	b=k0BgDOGdZjkmNER9kCkW3hzSSVTksipixWO0uWTWG2mntY2bNfPtE35eX4qTyBmuwMxlVS
	bcT1JILpJe/V8ADcBTyYH18WGvoE9s46ygGhUU1Wow2Sl6+RyzgjIFfPYCWnyqauoRYteU
	gNBWzP5mg9fBVCR/pLEsriTJPCM/zSk=
X-MC-Unique: i621btsoMYSRknEGceWtng-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qkts9igTcr5kvNKmGQxWkvK3fqmMr8Y3QwiHjmPk6epAvIuGMel9uYYC6zY1T8sXidCqRaEF8jAvLn8CNivZQzcRpQLc/Icmvvv8Mofcfypm/VWB3mcpyiGaHCkFnI3Ilg9uQaeeJW1Hn9hI3uoClYsrkbhnnmzsvRNcUqqq4ml+iaic+yenQMaVRIwedaxu7cBq53A3Q2UHnN3ZPGQgwnLSkfe0wwyJK8ie/zgh9kS1C+qB9iy7rx6mgYRakkkHyLVMktXGN8HHA7PxyC6vV/emApKkv/0co0z2cYSzTwVg3apnwusnyaV/ezoBKlshgIDCeGSpmeygfEyBkUWAHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXAiKZrxUwHYDgc+8CtOmUZsCUkL+4OdmdmE7Pw3DKU=;
 b=PQhrmNLzrpB2/OumGrz4aE0weSXBvvwZDQelwzSUAS1/fMHd1Z4FfijcNefYDYHeDObvtWd2G+om5Rh/fNNN0QoxNy60gXsw0b3ay+tRl0/HsH/FG1IrWl1mLJvEZ7Pq7EbzJ2V2TbBQQ6YfHgpGF+grc6FjNsE51lz+6nmkVsGiV+aV2YDa8J5Ba40Sr++M2EUOUegM6/3Tm250A2OIckRXLRkr05tkTEoAFZj0A6V+s5/PRMBNhnHyokZNmvyuMzjhkLiV9n/sfNs/Au5iI8l/5Zbl69DqLNhv4kDrRfKkk2oAdmah8w7zFj6ZXriYzZAqTiddttlNyHCkyo38bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: "sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
CC: Jan Beulich <JBeulich@suse.com>, Juergen Gross <JGross@suse.com>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, "roger.pau@citrix.com"
	<roger.pau@citrix.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>
Subject: Re: sched=null vwfi=native and call_rcu()
Thread-Topic: sched=null vwfi=native and call_rcu()
Thread-Index: AQHYApYKuS+jUHjGSkKX+nXJsixuaaxVueAAgAETSYCADBqFgA==
Date: Fri, 14 Jan 2022 18:42:06 +0000
Message-ID: <0cb5a1ceff3afc6c6d4319c9f6dd06a06a93a294.camel@suse.com>
References:
 <alpine.DEB.2.22.394.2201051615060.2060010@ubuntu-linux-20-04-desktop>
	 <20fbb361-b416-6965-614d-a6283a7e7550@xen.org>
	 <alpine.DEB.2.22.394.2201061747140.2060010@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2201061747140.2060010@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.42.3 (flatpak git) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f78da9b4-3d9f-4d10-61a4-08d9d78d9085
x-ms-traffictypediagnostic: AM0PR04MB5987:EE_
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-microsoft-antispam-prvs:
 <AM0PR04MB5987C355C7112A65892E845EC5549@AM0PR04MB5987.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 s1tb8Wv1XVVPEcJinLtK/yG4MniY/0E3lmk36096xR/77JpHYhICdiaEcONJcO1HBopD7NZlLsS5QT5VadAJra+Ly8bClgIimCiFwysNZRVMs4OnLjISUO5rZ+0+zuDLUzwHSL5fTpYi9lgj4Sq99/oIRsyWAOtdmOo67AbS/RPm8PocydsEbJTq6bP68B4E6S6ppMnjcbUo6VNTwDlBIPCn2LaROMOdGmOfY/p8t6JeQi2AGNKXSd8ERPY6/2VNpYnw+UiqTpeseN84bel8fZIGGVVs+LnT6Nw+zx6RilqL5+MrF0tUyFPnIGnxLIW7IcW1Wj6GIrfwyD8xKRCwXb/1RA9Uz9LlX3tptPglsl4TECsLnugHnPOx4gka0L6DYzX7e4AB4Pwi/B98HIA5lh8cEAW2fDtZ+TS17R0tnQcJK8VvDSTv1QTQTOg2RZwn1qfI+q+tXFz3G6odwPpx212aNlY8WnfIZPIGeApgClUD4AU8hJgPYlMlQtESHdJ9r1FQfIWyDtITFweX1FwCJa6Idiks+2tt36KcSM8dYMf4V9RwiEnRiQBqEQPWdlkBqEsoxmn9xloNEWm9EZbqycZm0sVZhne0pQVXqvzJar430rVxLgJsN8ZDoe8gach44rYJqVIpvqrDIrMwZbVpykKWC9eo9i4ApfqpvsDReDht829bAl4t0qxdTbhgyNwRtJxbPIMkeTm+3BF0BdHlb3e8aVV8OUyDxMKaLp+3w0a1SfCDHWnP9Ta0TGvMawmjplJmdrvILJJMctXQ/9JGXdsNn4oJh9WJEMcgxrnkaTdYkOiU9nbkhCf/IN//ig5pFvCBxUfMGceGuodUiH97RQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5826.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(8936002)(83380400001)(38070700005)(99936003)(86362001)(36756003)(6486002)(122000001)(2616005)(71200400001)(186003)(5660300002)(4326008)(66446008)(54906003)(64756008)(110136005)(38100700002)(76116006)(8676002)(66476007)(316002)(66556008)(6506007)(2906002)(66946007)(91956017)(966005)(26005)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UHl6UkdrM3Bua3YwcTJSdkRWL0N2QnA0TkNrVUlCbzYrYmVMZWk1WmVBek1v?=
 =?utf-8?B?b1hvTEhyZmhocitwVUV6cUg3Y29ma3pYSndxMklKSFE2TWRjdS9kMkkrT0F6?=
 =?utf-8?B?OG9CUk1nR3piRnU1VjRlRDlFeWVwaDU3alFhOTBYdEpnd2dzL3RwL3hFdXc5?=
 =?utf-8?B?cnR3aTNuR1M0dkUvL3VqNGR1RWlPRHBxY05jaEU0OGZLSlVGMllzVkZtT3or?=
 =?utf-8?B?a0hRNGtKa1U1VlVqcUpzb3RjYmJQU3VTS21yNzJPNDZlQytQLzAxOUZxVW5w?=
 =?utf-8?B?YkJ0Uy9nVHlzZUs4aHNnN09kdWllazA3WWQrNkhZdGt4U1oyT2MvTGlSeklz?=
 =?utf-8?B?TGlNOVFvWUFHUHR6VElQWHRzMWZINVk1WHpqTFdzbzZYdGZYeHloQ1RyWEJV?=
 =?utf-8?B?L1QzMlloTDlVc1l2Z05wRldBZVlFendDVmtjZFZKZ0tZZ3VJUS9ORE1zUFlT?=
 =?utf-8?B?aUd5MG5GZlFwdExFVytiS3hTc0I1TC9sUFBGMmxWdEx5NEJONUgyZ2l1cUNX?=
 =?utf-8?B?elArczhuS21QTC9XVGZrSDJzaWxiL2I0ZTJNTVRNc0NtNFcvaEl4RHVPSVJT?=
 =?utf-8?B?Sm1KTFBxUnlocm5BeTZhc0laNHprSUdhelB0Q0oyRzNxb0lIY3NJR3lxa011?=
 =?utf-8?B?TW84eWpmSUxtR3NFOFh5SW4yTElkdTRvZHJuS0RaVGVHeWhEODhyalZYNjh3?=
 =?utf-8?B?eWtMUTAxL0RVWDBwOWRQblVoM29GcmZYZTBBeml1cVNYUGZCZVd3ZkVxdGZN?=
 =?utf-8?B?L0Q0NDVzN0p2UlBsL1VIejhPR1A0S3dkWmFQUjB6NXJ0UzNXT0NWbnNpRGRE?=
 =?utf-8?B?Y1B2MDlvQ0VPMmtnTHVQV3RJbXZOeTRhRTQzTGdlUVJtWkhRQkFDejMzT2d5?=
 =?utf-8?B?NWlxRTVBRFM4Q0VBM2RWS3doZmNVdXpjTndMR2htQWtmaS9tRkQ0SG9xdWJ3?=
 =?utf-8?B?VzNiOGE0b0ZLSWRuWElaUDUyaWlCRThQUkQ3UjJ3ZUhheEpRMEpoMmU4bERB?=
 =?utf-8?B?ZG1BWGdWL3ViT09OSjZMTUhQOUluWEpFUU5QbXFxOVZQUlZkbGhEUmh6Wk5K?=
 =?utf-8?B?UEdtL3lmVUJIWVZzOWZlMExlakgwaS9oZlJMQjlhcEdmdmFBeE9JTlNjQ1RR?=
 =?utf-8?B?S1V5eWJTcXdBbEcvSjUwaXp3YUwzWVlVdVczL282RktNSTRFb1QzMyswYW9i?=
 =?utf-8?B?dTJZUFE5bVBtQlp1SFhIRzZzVFpLV2x6dG95aEROVk1LREJRdWpnTjhGL1dq?=
 =?utf-8?B?WG5tZVV6YlBLcjhobExEMStpVWoxY1lJN3Bkb2x6cDFUYWlBQklmQmVJTmVW?=
 =?utf-8?B?cnVUd0Zod3JzOTU4eDNoQVZDenVSUTQ5Z1JoWlE3YmY1RDlXNVlubWl2UFEv?=
 =?utf-8?B?UVUrc09NdWhqUS9kSTR1cHpaL2FGM0RZTnhaWk1XSXpSVHgxZUdTNXovWEVy?=
 =?utf-8?B?L1hFT2JhdzE5dm4vL1NtOEo0d0FwZVl1bkRRakNCUHNRZ2NYa2x4OVVkZ1NS?=
 =?utf-8?B?bVdPejFwczBrK1NvakRDcEVQMDNEZmJUV3N2a1p5c2Q5QjMyZ1hFSEhmclp6?=
 =?utf-8?B?SnFKZXRDSk5HbTRZNmFSR2lacWh0NHNkS0Z2WXdXWGcvaUNWeHl0Sk5TdTRx?=
 =?utf-8?B?QldGWkd4THRkTi9TWDVmYXBmNWZPV043aTlCVnlveHZCaC9ndnZsTzc4eW9T?=
 =?utf-8?B?SWVUR2ZKUzk1V3ExZkI1R3QvWFBJc3NFcnh3Um5xNXNkdzhWOGFnQTRTTjY4?=
 =?utf-8?B?ZEx0WVdnZHB1K2oydGxXMTR3bXV1RVFuQWZsQXZ3aTZ6S2s5dkJIak5xMFpN?=
 =?utf-8?B?WlFjZFJzekNSaXFoaytMRGFhWFkrdTl3aHl4WEZVYTJCaVVTUHJKUFJRVVdj?=
 =?utf-8?B?Y3daa3puMkZpVHpxV2xnWjhHZi9ZMUl4VDJiN2R2L1VPVVorWTM0Y2tFMGE0?=
 =?utf-8?B?Z0dPcW16R2tidVBQK2RWSmlyK29JUHovaWg1WHhvaVJJV1I2SGhQaDE4ZElS?=
 =?utf-8?B?ejE5cHFDYkIxNXZXSlZHSk1ZVkR1c29ud0RISlhNb3J3b3FMOVZpN1pDRHdx?=
 =?utf-8?B?VG9jd3dVZkFOOVRwZFErOUExdlk3Zi8xL0FqNnZaTXRybEh6QnkxTEVQdXEy?=
 =?utf-8?B?MWNjcTdSUmVKTTRpREpieUtuc0U4cXlmQWtUR3Y5M1p2alMxaEZHWWd5RmRQ?=
 =?utf-8?Q?uw3SbjfKzxUQgceJ1TTuSuc=3D?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-hhs6m2qhitU0p5JjOY5s"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5826.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f78da9b4-3d9f-4d10-61a4-08d9d78d9085
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2022 18:42:06.2938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ew2Fnw/yRA2ZyMS0jlBgtWPUt7jMIkTh6iJlXAWoFB2oe96o9N2rNJ/wI5zhQkcEZOKnaw5g7Uu99Wjy0WghWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5987

--=-hhs6m2qhitU0p5JjOY5s
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2022-01-06 at 17:52 -0800, Stefano Stabellini wrote:
> On Thu, 6 Jan 2022, Julien Grall wrote:
> >=20
> > This issue and solution were discussed numerous time on the ML. In
> > short, we
> > want to tell the RCU that CPU running in guest context are always
> > quiesced.
> > For more details, you can read the previous thread (which also
> > contains a link
> > to the one before):
> >=20
> > https://lore.kernel.org/xen-devel/fe3dd9f0-b035-01fe-3e01-ddf065f182ab@=
codiax.se/
>=20
> Thanks Julien for the pointer!
>=20
> Dario, I forward-ported your three patches to staging:
> https://gitlab.com/xen-project/people/sstabellini/xen/-/tree/rcu-quiet
>=20
Hi Stefano!

I definitely would like to see the end of this issue, so thanks a lot
for your interest and your help with the patches.

> I can confirm that they fix the bug. Note that I had to add a small
> change on top to remove the ASSERT at the beginning of
> rcu_quiet_enter:
> https://gitlab.com/xen-project/people/sstabellini/xen/-/commit/6fc02b9081=
4d3fe630715e353d16f397a5b280f9
>=20
Yeah, that should be fine.

> Would you be up for submitting them for upstreaming? I would prefer
> if
> you send out the patches because I cannot claim to understand them
> completely (except for the one doing renaming :-P )
>=20
Haha! So, I am up for properly submitting, but there's one problem. As
you've probably got, the idea here is to use transitions toward the
guest and inside the hypervisor as RCU quiescence and "activation"
points.

Now, on ARM, that just meant calling rcu_quiet_exit() in
enter_hypervisor_from_guest() and calling rcu_quiet_enter() in
leave_hypervisor_to_guest(). Nice and easy, and even myself --and I'm
definitely not an ARM person-- cloud understand it (although with some
help from Julien) and put the patches together.

However, the problem is really arch independent and, despite not
surfacing equally frequently, it affects x86 as well. And for x86 the
situation is by far not equally nice, when it comes to identifying all
the places from where to call rcu_quiet_{enter,exit}().

And finding out where to put them, among the various functions that we
have in the various entry.S variants is where I stopped. The plan was
to get back to it, but as shamefully as it sounds, I could not do that
yet.

So, if anyone wants to help with this, handing over suggestions for
potential good spots, that would help a lot.

Alternatively, we can submit the series as ARM-only... But I fear that
the x86 side of things would then be easily forgotten. :-(

Thanks again and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-hhs6m2qhitU0p5JjOY5s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmHhw/0ACgkQFkJ4iaW4
c+62mxAAvPc0AxSG7MsZ68LhgyJCjI93/RcLyJvtgAIaHe5CFja6TQrFxb3rTmeL
yTHFkLfnzgwBrOvmFNLJcF01sxSvs/smjMTAnn+FlrHZbPssF0FhF94pEcV/x2Fo
E3/AJRIxLZuvdO3m/WjqDNGWXm4mISS3+ix2tJ8VuqcnWDmLX3uP3hB+WSR8gxbD
2iTFpIGULMlhEvwSJDhdsSQz03g4hqJsM+tZBwIHexAZL00aSFzYo2sD/yi5CSJw
JtF6R2GWISE3ByitjAkdMnF6edXb0hJ7HP6+n1NXQeiJwelcG++/L14RvJ4uKrqM
yOPIrPC1MxvMz9XoIgeP0PEhjIkXK5wNWEtIMCg9cgNX9O2oqCmSBU+tep8f7oi8
69rxhbUkfvPV7qaF+LsPFvH9T5OkBxOw6XgYAhwxBHJaDo/qZ36sjLPEKhpovHdp
BEQ0re8JqBOJrzNdGYi3CmUSaU9/fIZc8tGxH0100sOP2ZYcJpZEmtTUmwd4VKY5
oRA+WGrwRlaC1OAhpePWiRtLaRUSRfGVwdvAz/S8FXFDXrm0mQzZ/8zF6SMq5uRO
iEI7DSLHaVjaBJriLEPeoNqQDI4tapOKyLsXc6KqPGrIAausojZBHDcCYMmutAld
OpZJIYjvb++jlHIDwmOXQF3thkBu5rZqPjZTL6DtIAJuX3BQABI=
=3SJT
-----END PGP SIGNATURE-----

--=-hhs6m2qhitU0p5JjOY5s--


