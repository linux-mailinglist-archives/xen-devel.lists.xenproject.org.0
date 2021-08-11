Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 333293E8DF4
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:00:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165587.302576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDl1g-0003a6-Cg; Wed, 11 Aug 2021 09:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165587.302576; Wed, 11 Aug 2021 09:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDl1g-0003XI-99; Wed, 11 Aug 2021 09:59:56 +0000
Received: by outflank-mailman (input) for mailman id 165587;
 Wed, 11 Aug 2021 09:59:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HJ1Z=NC=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1mDl1e-0003X8-55
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 09:59:54 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4504f3c-a044-4a3a-aeea-a9bf40eee195;
 Wed, 11 Aug 2021 09:59:52 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-JwZOkt_UMCWONx7_AQRMeg-1; Wed, 11 Aug 2021 11:59:50 +0200
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com (2603:10a6:208:134::22)
 by AM0PR04MB5985.eurprd04.prod.outlook.com (2603:10a6:208:11a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Wed, 11 Aug
 2021 09:59:48 +0000
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::addd:bf19:12ff:4ff2]) by AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::addd:bf19:12ff:4ff2%3]) with mapi id 15.20.4415.015; Wed, 11 Aug 2021
 09:59:48 +0000
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
X-Inumbo-ID: e4504f3c-a044-4a3a-aeea-a9bf40eee195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628675991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V1hOXW7Zw+mPvRHvhj/Z+RVRBDnwLK7Hro0eooYltls=;
	b=OlM7I77lwCbBtiWJqE8WGPhlIVXk1FiC3KeT3JSh3EH5ulCuBUj1kaoR6Rfee27xmVjeFb
	KxzCTpoid4BLLg90otJ9CsuUeSuf5P+aeFLmWEotpiN4FRgxF1N1Sme4KujWmSEXnofPhr
	JSd4XPyLsTraWrU981jHx/Gc0TyyPO8=
X-MC-Unique: JwZOkt_UMCWONx7_AQRMeg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NckpYN7/zwJPv3x/GWrbGczaQHJ6Gj6GmEfoFeCagCFW61LfZuno2FD8rEtcsAXlmA9VgRj0tvEjydW4zQSTeub+V77wKsC1tcZ3LKLNqGxh+X8nJE+kz6VBBTMwu1PB+g9+kNSzbs/ZvSEf7H9WOrGOlTyaetH1cXQRnq/Ap7KgWAXg2+rijgbxhZvPwCkCsaZcTzxPlsBwo84eXajuPuKrvg3p74Ry5GX9Lfbjj5s0FA0Y0BB3u1NvS8IpbImLBxIJTvRGSuCBxYS3ZnU25WnVf3dDMcSwG5ZbHWWwGl/k7pJBIcs5n2ABRZ5WxBy/nQq+J2UMzSAWucQRgYUsDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1hOXW7Zw+mPvRHvhj/Z+RVRBDnwLK7Hro0eooYltls=;
 b=TRbQIcm8WKNXN9WT4i131eOql1LtbgoXy7aMl5FWhznr2rnvWX8/9V2tKzOEkbHW7jNmZZgU37BfFz+2RRCpCZPmbV2tpnqKiUF5MA/LK6VLqhJG0goW8Exdjy2EHItjDGdAKGLCBCPw5ky5f8j1Kg+M8Dk7O6qejzwOAQurpu8VAahLqCR+LLpz0Y4FoONVUCdY5oy3AmHKOXLgurPA4PxYRjJ2yzQCW9IKruCrDOh8k0KC+u6mAHMakOXASInlVtSZ4hBcBUIP9eD899hWz7OAtF1VpXsl8VpzpfJsklnc+eNNIY1raZ359/SPvWJLf/hdgu9TKawMzTrPCmgODQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: "julien@xen.org" <julien@xen.org>, "ahmeddan@amazon.co.uk"
	<ahmeddan@amazon.co.uk>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>, "mpohlack@amazon.de"
	<mpohlack@amazon.de>, "jgrall@amazon.co.uk" <jgrall@amazon.co.uk>,
	"doebel@amazon.de" <doebel@amazon.de>
Subject: Re: NULL scheduler DoS
Thread-Topic: NULL scheduler DoS
Thread-Index: AQHXjTpOV/XWdF2YLUCIZdYgL03Tzatrb1sAgAKlbQA=
Date: Wed, 11 Aug 2021 09:59:48 +0000
Message-ID: <a354a8ebb5fd780177024f870807f9b9b7d02f42.camel@suse.com>
References: <ED25BE5E-D695-4763-B97A-78D6040E2341@amazon.com>
	 <8193a685-3ab1-9407-75f3-e335ea4406e4@xen.org>
In-Reply-To: <8193a685-3ab1-9407-75f3-e335ea4406e4@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.40.3 (by Flathub.org) 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2457cfb1-f335-4d54-91ae-08d95caec15a
x-ms-traffictypediagnostic: AM0PR04MB5985:
x-microsoft-antispam-prvs:
 <AM0PR04MB5985FE6F8FB281F48A0CD09AC5F89@AM0PR04MB5985.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 vqQgl/ogeaCcBjDIKujwYlXzIRMbI4SiiAnD+48/SZawI/XaVglZaitw0DnXcgJ860kY0rHkSXyN96hB0Ap1cdkQH4qSkiRokF0H7254ERgZdL/s05/irkLvdhOiJC/orHYarN+3PTw1Wc+GH9Q+1CJ69/C7Xxvd/z/1V3GMjrVJV8Gkx4L1DDBoywra9xjyATjZ0RUWk0rpvMspC3P8oqkkZQulgtGNreJNiL5lJyzKkILUqL2wRaoAZlX78Lj3nV8b2KZX1CHwAQU5sRu+PMhXuvCqH6KYoQD6aD3LTLhduxeOfkl21dZHEdZlVhmLE5frkVuLCp+jqUJvdGkTiy8WgytDZT1g6aCqnrBlJzXv43tgdm12XOhlu9sTmCoH50KU27liQGLP+/miWq7SibLzxzHebjGry6zu7FxsZ56ABXBeMC+YY3yycTpLWpUqm4fgyZjBZGLt+B5EHXkI2leZZ7KLsjYz75O6l7PHlJBMpHXj5EKra3TbU6yDdSzs2Ig/KDcS3dA/iPKHpqs3eXh+9EeqXUxoMFnJUOjYlfvKW+9iEn0R6TwJusmOy22qsrTelsV14I1Hl3zC8zkfg2eVjakCcIjI0IvIKhAo7vgPQNiCTvN7px5qH0Ky79lva4kbohaB0XiBOwqgVwkrIdxJnGkxqKgPhFeQG0DgCBmsccXMaps1gLVyG1NIiPdVKNvkTCVa5jT9BsNbt0gFpKOWFPpRTzQs5uBM/T5s2tP8Of+VDVqAYFmHoc1qBRrh2SQ7hKfnEKLqCA6aZn6trafeNMiG7G5VG9hOSQex5lOp5tvqxRJ3Z/fnl8vBeZx1kCwhhD4cTDAjmR3aY7liLg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5826.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(376002)(396003)(39860400002)(346002)(53546011)(86362001)(6506007)(186003)(6512007)(36756003)(66946007)(2906002)(3480700007)(7116003)(4326008)(38100700002)(64756008)(54906003)(83380400001)(66476007)(122000001)(66446008)(110136005)(26005)(66556008)(2616005)(316002)(478600001)(8676002)(8936002)(6486002)(99936003)(66616009)(966005)(91956017)(38070700005)(71200400001)(5660300002)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Yi9sdXRVWUdYbGhGbHVLMGtQcGNEMU93ekRzMzFxYS9CaHdldklKUnhyZVpp?=
 =?utf-8?B?OGUwOEZrYWpwb1pSY0RWaWIwKzVmaVlFaDQ3UWF1MmFpMU5BdCt2U0x3c3Iy?=
 =?utf-8?B?Ulg0QWYyR215Y3lETUlGNERrUkM2T2VaNzVBSTIrWnhDdy9OaVhkNFJuNVZv?=
 =?utf-8?B?OEdFd3pHSitkNzdFclFHVWpXU29yTWRFRlo5NTgxMXhXMXk3VkVHYkxBd0Y1?=
 =?utf-8?B?a3VqTFN0aUxWNmtMR1lXSVpjYnREZ200Mk0rMDBvcWJYaWJHNnBPWW03Z05y?=
 =?utf-8?B?TDNENWdQd2xiOC8wTGpvOG1lcytldnhORFdzd1pFeDNCamtEa2xFUUpMWlYz?=
 =?utf-8?B?Z1NWUjg2ZnV6cW1WVE9oeFh6cUcxK0hKbzczbktlcVE5WnFPc1hxeEtQbTBK?=
 =?utf-8?B?UjlwZ1NzcC9zQ0VFbVFBcGorQ3VZVFY5TUJRNjBNSloxcHN3QUZ6N1VSK29w?=
 =?utf-8?B?b3JKWU9odkZkMk9VYkVqQlErMytPUUNhZGdNYU5DUHRhd1J1RlBRa0o3UVR3?=
 =?utf-8?B?ODdsM3FqUG1IaktGci8rSVc1ajg3NXVTMlY2K3RMMTVUTW1jNUY1ckdBM1l5?=
 =?utf-8?B?TTVubWs1Y1NVejZsZ3hhcTJiZXZpTE4za2dISDJ3dm5aeXJWZFhKMExuSkhI?=
 =?utf-8?B?eFBpMW5ITmJqQjJ0Q3VRUlNUbDI3WlJaQUszZ0hhbTY4SVl4SWZOYW9XTkdl?=
 =?utf-8?B?ZjhNUS8wLytNWVU4Uzd4OHRMaWZOZktCYlUwaXBhdFoxSS9STFMvN2lHRWR1?=
 =?utf-8?B?eU52c3NuY0hlcHZpOG5TVDZGL0o3dXdObU41TDZnSFZjaWpnYnRRYUs1cm9z?=
 =?utf-8?B?L0hFNDhWdlVpOVdRTXl3c0IyV2cwRjRBOWdDSGpFdGhteGM1dnpNc0RSWjRJ?=
 =?utf-8?B?MkxIek5XQzQ4ZEQyVWJGWWIrUGh5aVRudVoyVEFGMXh1aUorL0lqYVVWRVAy?=
 =?utf-8?B?aTVRUmlnUnVlL1ZmM0U0anFvQlFOMjhBQnJ2WGIvTmJ0b0xlSndoVzVWK2NL?=
 =?utf-8?B?NHdZVHoweGlLRTZ3aDRNTmgwbExkV01TSUZ1eFQzV0kyR0lGMmd2MlM5ak9F?=
 =?utf-8?B?RmFuMjMwYzRyV21rdkxWdUl3cVJJZU1xM0VhaEVNKzhhRXo1bVU2TUROOURK?=
 =?utf-8?B?MDhsbk0yUG9HaDBoakNRNmN0Q3NDek03eFRkZ0FubzhrMytPdGsrRmNGTlI1?=
 =?utf-8?B?THhNM2RJNTlFVExWd3kzMjRHbDZhZS9zTk9XbWtsR1dKamJXbWI3bzlVeldw?=
 =?utf-8?B?SVNCUmFoTngzU09XMWkrdU5LVUxXV3paVWRrb09iTEk4K1Z2WVJYV0tQeFhN?=
 =?utf-8?B?Zk50b2tacmhFMUdIV1kySiszb3JPMzVwS1M0Ymc1UDFSbzU0VGsxR1M1ZVQ4?=
 =?utf-8?B?L003NExYWVgzbTg0QUpDZ2dlL2doTWc4MmMvdTc5aUFvL3VRK2pOMWRjVjIy?=
 =?utf-8?B?aHZBcmpSaVVJQlVXeUsvaU9SdkZubTBwSTRYcVpIbHRHcGlKc0k3R1VtMzhL?=
 =?utf-8?B?UDFKRW5MdHJSUlRuL3puaDA5NDdqNzRSZHk3azhpZXRJRFpZamljU0RoS3cv?=
 =?utf-8?B?OEcxeFo3OEtTSVBQNnUySDVmZ0VhbWN4dkd4L1dWcE94WElKOG1yWFNnbmZN?=
 =?utf-8?B?bU5rR3dwZExRTmJHRmVMVEZyUENodGozVkdhdzFqdncvcWpIaTNFeC9zMm5J?=
 =?utf-8?B?aUZTTmdiRUl5dlc5YXY1ZGI5cGNraDFHT0FNUU43QitYTDU5RExqWlQ0NzZn?=
 =?utf-8?Q?lo849AbaL1qj46sLiclaM93fAIlmZ+2/FKhHQ/1?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-aKlXyJm4j3urG0uaTySr"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5826.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2457cfb1-f335-4d54-91ae-08d95caec15a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2021 09:59:48.6909
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rs9k/mdBI2LINN+AX+tVvc48eE7yWa2lYH1C60s/lQ5WZWgx3xPSa3nztSBx0W0OtlPrQ1Bh5+sjFr/qUI2meQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5985

--=-aKlXyJm4j3urG0uaTySr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-08-09 at 18:35 +0100, Julien Grall wrote:
> On 09/08/2021 17:19, Ahmed, Daniele wrote:
> > Hi all,
>=20
> Hi Daniele,
>=20
Hello everyone from me as well,

> Thank you for the report!
>=20
Indeed. :-)

>=20
> The ASSERT() is triggered because the pCPU was already assigned to
> one=20
> of the dom0 vCPU. This problem is happening regardless whether there
> is=20
> free pCPU.
>=20
Right. Can we raise the appropriate log level, so that we can see these
messages:

dprintk(XENLOG_G_INFO, "%d <-- %pdv%d\n", cpu, unit->domain, unit->unit_id)=
;

(and then see a full `xl dmesg`, or even better, a serial console dump,
since we crash! :-P)

> I have added some debugging in sched_set_res():
>=20
> diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
> index a870320146ef..2355f531dc13 100644
> --- a/xen/common/sched/private.h
> +++ b/xen/common/sched/private.h
> @@ -150,6 +150,10 @@ static inline void sched_set_res(struct
> sched_unit=20
> *unit,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int cpu =3D cpumask_first(res->cp=
us);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vcpu *v;
>=20
> +=C2=A0=C2=A0=C2=A0 printk("%s: res->master_cpu %u unit %p %pd %pv\n", __=
func__,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 res->master=
_cpu, unit, unit->domain, unit->vcpu_list);
> +=C2=A0=C2=A0=C2=A0 WARN();
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_sched_unit_vcpu ( unit, v )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(cpu < nr_cp=
u_ids);
>=20
> This traced the problem to null_unit_migrate():
>=20
> (XEN) sched_set_res: res->master_cpu 0 unit ffff830200887f00 d1 d1v0
> (XEN) Xen WARN at private.h:155
> (XEN) ----[ Xen-4.16-unstable=C2=A0 x86_64=C2=A0 debug=3Dy=C2=A0 Tainted:=
=C2=A0=C2=A0 C=C2=A0=C2=A0 ]----
> (XEN) CPU:=C2=A0=C2=A0=C2=A0 1
> (XEN) RIP:=C2=A0=C2=A0=C2=A0 e008:[<ffff82d04023fd9f>]
> core.c#sched_set_res+0x5b/0xc6
> [...]
> (XEN) Xen call trace:
> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d04023fd9f>] R core.c#sched_set_res+0x5b/=
0xc6
> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d040241614>] F sched_init_vcpu+0x3dc/0x5d=
7
> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d04020527d>] F vcpu_create+0xfb/0x37a
> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d040238dd9>] F do_domctl+0xac0/0x184a
> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d04030d8bc>] F pv_hypercall+0x10d/0x2b8
> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d04038829d>] F lstar_enter+0x12d/0x140
> (XEN)
>=20
So, it's entirely possible that I'm missing something obvious here, but
what it is that is making you think that we're in null_unit_migrate() ?

Does that come from a different instance of this WARN() ?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-aKlXyJm4j3urG0uaTySr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmETn5QACgkQFkJ4iaW4
c+58vA//ZUwYfUByyUgmS1QTPC6qMt8UcR1GMGfFbBcxayOZtmLsphIKULwzuYiS
+FflUsJv1ppsJUfR585szTZ3VfJnh9KVX6gTDcNUXL2A8Ebrtvdm8xAi/6HUQ1qH
CUOtvXhS2Ms0rnuiUZ4vRdlHe0diTOi5l7TR7hxHjRwA3XOBKkFWsu05hFzp8tj/
OkYNzrdzj0Kqx6ZhRQJM3Phja1geMVAoigP3OQuIYhbu9wU28H281ASQbsbUbps6
CdQE+LyYxaQRsmJl3wP4jbzVpc8CtW2VsWjXzEMNByFbPA5LSNVGKh7YFD+Fqweh
1OoVk3WcxeLL4O74z+aXdFBOi5OtTeDdVHHInEAOkOj2yb2OfBAY7/JMta43RAI3
C0pgmwLGQ9M9D4L8snbchA9FdwW4gt59h2noePicONGfCAEo4KwIOKfy8D360L+O
BqOWpJzwoY4PPr1J9p6mjiMbnk62s1h5YP2tRKqzQw0oIojnCXjvVIOPUyFYBBFd
vGXwPC4HxXXPvhLsa53jCjm5bM2r9tTcej9Y8YDAk4S+k0R//hYXJI0DiXWVRtbX
mMKRClGkl0BNbACbdcqQNe7WUY4WRrZWptVJXjrOupjDcygLxUoL/haBdWhzcDQ+
ZrHV5HHg+R1e8A7ft308K3lI6k64CyNid2RP9L1hXeXHaUuF6rY=
=ts9y
-----END PGP SIGNATURE-----

--=-aKlXyJm4j3urG0uaTySr--


