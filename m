Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B36592A12DB
	for <lists+xen-devel@lfdr.de>; Sat, 31 Oct 2020 03:35:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.16739.41538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYgj4-0007oe-Ic; Sat, 31 Oct 2020 02:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16739.41538; Sat, 31 Oct 2020 02:34:42 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYgj4-0007oM-Bn; Sat, 31 Oct 2020 02:34:42 +0000
Received: by outflank-mailman (input) for mailman id 16739;
 Sat, 31 Oct 2020 02:34:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0JK=EG=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kYgj2-0007oH-Ee
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 02:34:40 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [62.140.7.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91e24b1c-09a5-427a-b256-30af99d418b6;
 Sat, 31 Oct 2020 02:34:38 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-4-rJvLxhOiSzyqizTQO_dg-1; Sat, 31 Oct 2020 03:34:35 +0100
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com (2603:10a6:208:134::22)
 by AM0PR04MB5011.eurprd04.prod.outlook.com (2603:10a6:208:c9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Sat, 31 Oct
 2020 02:34:32 +0000
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::db0:41c3:aa05:d082]) by AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::db0:41c3:aa05:d082%6]) with mapi id 15.20.3499.028; Sat, 31 Oct 2020
 02:34:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Q0JK=EG=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
	id 1kYgj2-0007oH-Ee
	for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 02:34:40 +0000
X-Inumbo-ID: 91e24b1c-09a5-427a-b256-30af99d418b6
Received: from de-smtp-delivery-102.mimecast.com (unknown [62.140.7.102])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 91e24b1c-09a5-427a-b256-30af99d418b6;
	Sat, 31 Oct 2020 02:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1604111677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O8GQhi0UJ3LHYdAnrkP/toqkgeVbB7a547rgTaiTSe4=;
	b=bRR4khCvFv+hjSqCeOqFn+lKt1PSGIfHvP+GP4VzMbkOFJcjG+7rMk+b0/TCfxAg/m9GYw
	RFYmsCP2sWAWxRW3ZDUtylAKvKJjxagB1s2u08aTrTBG9OI5UR4kaiGc9qxFuXpwre8SrX
	8gd1zv4qI4w1Yj+xqNrjDCEyRoIA2/Q=
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-4-rJvLxhOiSzyqizTQO_dg-1; Sat, 31 Oct 2020 03:34:35 +0100
X-MC-Unique: 4-rJvLxhOiSzyqizTQO_dg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ey/S6+iz7PKSfPM7M9hB9To23tgGQayqNm2SFauW4X8FWKbYHGLFY8QdnzkZrAuULvRKVeYWB8xeaDHctG46pwTx4I3x5qt4fqLdumXz7D3c5qs7QxPe+rzxGFg12FDyHrtghmethJR5iwL+E3lavHa3UCtoZpDXCoZ4JjKDH5Adn0C9ef4pO9vUNfBJLbmW45db1N+wMNDcjuFWkWcDL1M0a2BQMoajd1L7SjFYzNyxGoouGfKyVBFCwuptw/9vuQFqDp7cGQTkLFtP1tesLDYNf5UKJGbqYBpR4kPqqtgeC5+xxZ0xG7D/aAR4o6wtyKJ+5eGWH7rCd3d4FjrCZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8GQhi0UJ3LHYdAnrkP/toqkgeVbB7a547rgTaiTSe4=;
 b=V3DtZL4IgV6tjefX4n9cnBKFXvbKHJfwTVYeGT4WVjjKQFck6/mplScKT1EhMWZHaagNUjssnLbegGJc+KlnyE3fnGbVRcwqnMgbjw4F52Hl58MQrP0uAVhjT3PhPtyGjWscve9+7q56XrGDYOSEuZCTthxdrjeHZr8iZZFSV2yElgC04xK8nofG7/hE/eLsJFNHyVouNGc0oGrwMNEW0Fv84tf8aRLXlrcIx0z+LrhEz6vzNCM2wjyzj6anYy122DadbVlfmEnorKzqQORtg0+wMzxhrGoBRGHX5H+PL740x//PdQotTaKdnJYTkQptcerTDNOqTM+RzFyqmICXJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com (2603:10a6:208:134::22)
 by AM0PR04MB5011.eurprd04.prod.outlook.com (2603:10a6:208:c9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Sat, 31 Oct
 2020 02:34:32 +0000
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::db0:41c3:aa05:d082]) by AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::db0:41c3:aa05:d082%6]) with mapi id 15.20.3499.028; Sat, 31 Oct 2020
 02:34:32 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "frederic.pierret@qubes-os.org"
	<frederic.pierret@qubes-os.org>, "George.Dunlap@citrix.com"
	<George.Dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Subject: Re: Recent upgrade of 4.13 -> 4.14 issue
Thread-Topic: Recent upgrade of 4.13 -> 4.14 issue
Thread-Index: AQHWq6SD/uyafOnyXU2hV/eab0QUF6mq9TSAgADbCLP//87fAIAFZkwA
Date: Sat, 31 Oct 2020 02:34:32 +0000
Message-ID: <b1a18e6ed88db3c40a54c7ca15c3399bdc6f2b9c.camel@suse.com>
References: <a8e9113c-70ef-53fa-e340-be15eb3cba57@qubes-os.org>
	 <30452e9c-bf27-fce2-cc20-4ce91018a15a@citrix.com>
	 <deefd340-ec7a-bbb9-7471-d147da174f4a@suse.com>
	 <a333ea82c12086874f705fc9ea9baa991235edd4.camel@suse.com>
	 <533ce2f2-f268-a70b-fad7-d8f3f4033209@suse.com>
	 <182a90a89cc02beec9760559799e74572e18ce49.camel@suse.com>
	 <9632dc14-46d5-83c0-7e44-0c3bd4f5154a@qubes-os.org>
	 <ce07254a-0775-d35c-559b-7d9ab642accf@qubes-os.org>
In-Reply-To: <ce07254a-0775-d35c-559b-7d9ab642accf@qubes-os.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.38.1 (by Flathub.org) 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3952509-3d36-4a23-b1f9-08d87d45800e
x-ms-traffictypediagnostic: AM0PR04MB5011:
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <AM0PR04MB50113C4B489E58A8617E8E40C5120@AM0PR04MB5011.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 gUErc6qcZHWuzU9J+K4WqMtQPl7fHtvqv1Chl963zFLOoBdU2YFQhDv9GRh08BWuSxnKD1INfAtGsgPTjY3ufOeXEPpbjKeegfr/ooggsESispCbnVr0hfIXlp+v1sIZKvW5+Md9+0gKpSHQucrOXeQErs7uRA+5ZGH4RsR8qXfN1Q54I21+WZMwwrKzdNQmh+MGBpn8PvmvX+t4oLShMWx/iYr2g9esbBG4mPYeBTXoo2S1ep45WziqP4M888nkQIN3TaQz2le7goTE2hUochVqHvQEd4cLtCVaF/zcmEVzx/7HwuqiYvDUxjZEG5fZyDUPDg0eDQOjpaCybGh4DFWXlM6qYw6yFXofy0FTNzu70EuB7xeK3cny/0G77G3Fylg6/me6poIKOmwEB/y1Mg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5826.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(136003)(376002)(366004)(39860400002)(36756003)(8936002)(186003)(76116006)(66556008)(66446008)(66946007)(2906002)(66616009)(86362001)(6512007)(6486002)(71200400001)(2616005)(66476007)(54906003)(110136005)(26005)(478600001)(4326008)(5660300002)(6506007)(4001150100001)(8676002)(966005)(83380400001)(99936003)(316002)(66574015)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 OoDB68efjwDpz+1RqgA062yzLCj5z/agdnILyMZEnQpyKTfX1UHJiNZyrywGhVi+YV8/6Fga8mEKrNyrYW5WwsTjw62fItp/a+H6QuGf2hIHsvYbAWx+0raNrLbMukSNDJZNXizcodPlOVv7BS5oPJfRjAxuuXbT3xLy8Wccwd4IbflcDLk/uJpltkvKnV3Dl94ctYAWbYp2ONCK2YpslYQClr7d99xYf+mmvqqpaju7Y05ycQyYmfQNo6i8ESjzh1DWtaI/y3vb1D0J1foX7X4RCGhPvRRn7gKYTqzX461m316j38y8LjeP//m/6nMS/wapwUZkOiUbI17nxXbE9GOMja+nN4o4x41AbnxO/TJXxazo0GUJj6+b3Sr06NElw9EyXXVuOZ3qjC7hf8f+34L+c3ABjDryGUs9ap7bYtS+RbI7nimQFeC0hxVcAwCop9+Iv8x71S5Gfx/PxftsAd4IGQrUKT98AlSizXERUDO6HcQY3FuUUq+Cd8fF/q9A9rElp3XgsQ+oLCuxwHrpNwnO1hziSwHhuwABiq2yK5U75SnkTP5axzAdLrcqcOnVvoyIkrJOW5bNj5XnA3iZDC9cJt/TWGwv4kRdph+GVWKMDw0vPtUYyE2B0+9s3lVrMo/J6XMXxm4zlpDfbtKbGA==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ZpZ3yaX97+GVLY1v8Nbt"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5826.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3952509-3d36-4a23-b1f9-08d87d45800e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2020 02:34:32.5218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rh9z/uuTczZvSdLML+XA91tYbL0/mfLZaNdEecR5iWXcAg1ouhikf5J1SoYB+m7F/FTmUPeFZPf110/b/awp1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5011

--=-ZpZ3yaX97+GVLY1v8Nbt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-10-27 at 17:06 +0100, Fr=C3=A9d=C3=A9ric Pierret wrote:
>=20
> Ok the server got frozen just few minutes after my mail and I got
> now:
> 'r': https://gist.github.com/fepitre/78541f555902275d906d627de2420571
>
=46rom the scheduler point of view, things seems fine:

(XEN) sched_smt_power_savings: disabled
(XEN) NOW=3D770188952085
(XEN) Online Cpus: 0-15
(XEN) Cpupool 0:
(XEN) Cpus: 0-15
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) Scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Active queues: 2
(XEN) 	default-weight     =3D 256
(XEN) Runqueue 0:
(XEN) 	ncpus              =3D 8
(XEN) 	cpus               =3D 0-7
(XEN) 	max_weight         =3D 256
(XEN) 	pick_bias          =3D 1
(XEN) 	instload           =3D 7
(XEN) 	aveload            =3D 2021119 (~770%)
(XEN) 	idlers: 00000000,00000000
(XEN) 	tickled: 00000000,00000000
(XEN) 	fully idle cores: 00000000,00000000
(XEN) Runqueue 1:
(XEN) 	ncpus              =3D 8
(XEN) 	cpus               =3D 8-15
(XEN) 	max_weight         =3D 256
(XEN) 	pick_bias          =3D 9
(XEN) 	instload           =3D 8
(XEN) 	aveload            =3D 2097259 (~800%)
(XEN) 	idlers: 00000000,00000000
(XEN) 	tickled: 00000000,00000200
(XEN) 	fully idle cores: 00000000,00000000

The system is pretty busy, but not in overload.

Below we see that CPU 3 is running the idle vCPU, but it's not marked
as neither idle nor tickled.

It may be running a tasklet (the one that dumps the debug key output, I
guess).

Credits are fine, I don't see any strange values that may indicate
anomalies or something.

All the CPUs are executing a vCPU, and there should be nothing that
prevent them making progresses.

There is one vCPU which apparetnly want to run at 100% in pretty much
all guests, and more than one in dom0.

And I think I saw some spin_lock() in the call stacks, in the partial
report of '*' debug-key?

Maybe they're stuck in the kernel, not in Xen? Thoughs ?


(XEN) Domain info:
(XEN) 	Domain: 0 w 256 c 0 v 16
(XEN) 	  1: [0.0] flags=3D0 cpu=3D5 credit=3D10553147 [w=3D256] load=3D1712=
2
(~6%)
(XEN) 	  2: [0.1] flags=3D0 cpu=3D4 credit=3D10570606 [w=3D256] load=3D1356=
9
(~5%)
(XEN) 	  3: [0.2] flags=3D0 cpu=3D7 credit=3D10605188 [w=3D256] load=3D1346=
5
(~5%)
(XEN) 	  4: [0.3] flags=3D2 cpu=3D11 credit=3D9998469 [w=3D256] load=3D2621=
44
(~100%)
(XEN) 	  5: [0.4] flags=3D0 cpu=3D0 credit=3D10533686 [w=3D256] load=3D1361=
9
(~5%)
(XEN) 	  6: [0.5] flags=3Da cpu=3D9 credit=3D1101 [w=3D256] load=3D0 (~0%)
(XEN) 	  7: [0.6] flags=3D2 cpu=3D2 credit=3D10621802 [w=3D256] load=3D1352=
6
(~5%)
(XEN) 	  8: [0.7] flags=3D2 cpu=3D1 credit=3D10670607 [w=3D256] load=3D1345=
3
(~5%)
(XEN) 	  9: [0.8] flags=3D2 cpu=3D7 credit=3D10649858 [w=3D256] load=3D1350=
2
(~5%)
(XEN) 	 10: [0.9] flags=3D0 cpu=3D3 credit=3D10550566 [w=3D256] load=3D1347=
7
(~5%)
(XEN) 	 11: [0.10] flags=3D2 cpu=3D4 credit=3D10644321 [w=3D256] load=3D135=
39
(~5%)
(XEN) 	 12: [0.11] flags=3D2 cpu=3D1 credit=3D10602374 [w=3D256] load=3D134=
71
(~5%)
(XEN) 	 13: [0.12] flags=3D0 cpu=3D6 credit=3D10617262 [w=3D256] load=3D138=
01
(~5%)
(XEN) 	 14: [0.13] flags=3D2 cpu=3D8 credit=3D9998664 [w=3D256] load=3D2621=
44
(~100%)
(XEN) 	 15: [0.14] flags=3D0 cpu=3D3 credit=3D10603305 [w=3D256] load=3D170=
20
(~6%)
(XEN) 	 16: [0.15] flags=3D0 cpu=3D5 credit=3D10591312 [w=3D256] load=3D135=
23
(~5%)
(XEN) 	Domain: 1 w 256 c 0 v 2
(XEN) 	 17: [1.0] flags=3D2 cpu=3D6 credit=3D4916769 [w=3D256] load=3D26214=
4
(~100%)
(XEN) 	 18: [1.1] flags=3D0 cpu=3D13 credit=3D10500000 [w=3D256] load=3D0 (=
~0%)
(XEN) 	Domain: 2 w 256 c 0 v 2
(XEN) 	 19: [2.0] flags=3D2 cpu=3D5 credit=3D4982064 [w=3D256] load=3D26214=
4
(~100%)
(XEN) 	 20: [2.1] flags=3D0 cpu=3D14 credit=3D10500000 [w=3D256] load=3D0 (=
~0%)
(XEN) 	Domain: 3 w 256 c 0 v 2
(XEN) 	 21: [3.0] flags=3D2 cpu=3D1 credit=3D5200781 [w=3D256] load=3D26214=
4
(~100%)
(XEN) 	 22: [3.1] flags=3D0 cpu=3D5 credit=3D10500000 [w=3D256] load=3D0 (~=
0%)
(XEN) 	Domain: 4 w 256 c 0 v 2
(XEN) 	 23: [4.0] flags=3D12 cpu=3D0 credit=3D5395149 [w=3D256] load=3D2621=
44
(~100%)
(XEN) 	 24: [4.1] flags=3D0 cpu=3D8 credit=3D10500000 [w=3D256] load=3D0 (~=
0%)
(XEN) 	Domain: 5 w 256 c 0 v 2
(XEN) 	 25: [5.0] flags=3D2 cpu=3D2 credit=3D5306461 [w=3D256] load=3D26214=
4
(~100%)
(XEN) 	 26: [5.1] flags=3D0 cpu=3D15 credit=3D10500000 [w=3D256] load=3D0 (=
~0%)
(XEN) 	Domain: 6 w 256 c 0 v 8
(XEN) 	 27: [6.0] flags=3D12 cpu=3D10 credit=3D7915602 [w=3D256] load=3D262=
144
(~100%)
(XEN) 	 28: [6.1] flags=3D0 cpu=3D10 credit=3D10500000 [w=3D256] load=3D0 (=
~0%)
(XEN) 	 29: [6.2] flags=3D0 cpu=3D15 credit=3D10500000 [w=3D256] load=3D0 (=
~0%)
(XEN) 	 30: [6.3] flags=3D0 cpu=3D8 credit=3D10500000 [w=3D256] load=3D0 (~=
0%)
(XEN) 	 31: [6.4] flags=3D0 cpu=3D0 credit=3D10500000 [w=3D256] load=3D0 (~=
0%)
(XEN) 	 32: [6.5] flags=3D0 cpu=3D6 credit=3D10500000 [w=3D256] load=3D0 (~=
0%)
(XEN) 	 33: [6.6] flags=3D0 cpu=3D11 credit=3D10500000 [w=3D256] load=3D0 (=
~0%)
(XEN) 	 34: [6.7] flags=3D0 cpu=3D9 credit=3D10500000 [w=3D256] load=3D0 (~=
0%)
(XEN) 	Domain: 7 w 256 c 0 v 2
(XEN) 	 35: [7.0] flags=3D2 cpu=3D4 credit=3D5297013 [w=3D256] load=3D26214=
4
(~100%)
(XEN) 	 36: [7.1] flags=3D0 cpu=3D11 credit=3D10500000 [w=3D256] load=3D0 (=
~0%)
(XEN) 	Domain: 8 w 256 c 0 v 4
(XEN) 	 37: [8.0] flags=3D0 cpu=3D14 credit=3D10500000 [w=3D256] load=3D0 (=
~0%)
(XEN) 	 38: [8.1] flags=3D2 cpu=3D7 credit=3D5240630 [w=3D256] load=3D26214=
4
(~100%)
(XEN) 	 39: [8.2] flags=3D0 cpu=3D13 credit=3D10500000 [w=3D256] load=3D0 (=
~0%)
(XEN) 	 40: [8.3] flags=3D0 cpu=3D8 credit=3D10500000 [w=3D256] load=3D0 (~=
0%)
(XEN) 	Domain: 9 w 256 c 0 v 2
(XEN) 	 41: [9.0] flags=3D0 cpu=3D0 credit=3D10500000 [w=3D256] load=3D0 (~=
0%)
(XEN) 	 42: [9.1] flags=3D12 cpu=3D13 credit=3D7910266 [w=3D256] load=3D262=
144
(~100%)
(XEN) 	Domain: 10 w 256 c 0 v 2
(XEN) 	 43: [10.0] flags=3D12 cpu=3D12 credit=3D8045458 [w=3D256] load=3D26=
2144
(~100%)
(XEN) 	 44: [10.1] flags=3D0 cpu=3D8 credit=3D10500000 [w=3D256] load=3D0 (=
~0%)
(XEN) 	Domain: 11 w 256 c 0 v 2
(XEN) 	 45: [11.0] flags=3D12 cpu=3D14 credit=3D7575284 [w=3D256] load=3D26=
2144
(~100%)
(XEN) 	 46: [11.1] flags=3D0 cpu=3D12 credit=3D10500000 [w=3D256] load=3D0
(~0%)
(XEN) 	Domain: 12 w 256 c 0 v 2
(XEN) 	 47: [12.0] flags=3D2 cpu=3D15 credit=3D8014099 [w=3D256] load=3D262=
144
(~100%)
(XEN) 	 48: [12.1] flags=3D0 cpu=3D6 credit=3D10500000 [w=3D256] load=3D0 (=
~0%)
(XEN) 	Domain: 13 w 256 c 0 v 2
(XEN) 	 49: [13.0] flags=3D0 cpu=3D7 credit=3D10500000 [w=3D256] load=3D0 (=
~0%)
(XEN) 	 50: [13.1] flags=3D0 cpu=3D15 credit=3D10500000 [w=3D256] load=3D0
(~0%)
(XEN) Runqueue 0:
(XEN) CPU[00] runq=3D0, sibling=3D{0}, core=3D{0-7}
(XEN) 	run: [4.0] flags=3D2 cpu=3D0 credit=3D5255200 [w=3D256] load=3D26214=
4
(~100%)
(XEN) CPU[01] runq=3D0, sibling=3D{1}, core=3D{0-7}
(XEN) 	run: [3.0] flags=3D2 cpu=3D1 credit=3D5057668 [w=3D256] load=3D26214=
4
(~100%)
(XEN) CPU[02] runq=3D0, sibling=3D{2}, core=3D{0-7}
(XEN) 	run: [5.0] flags=3D12 cpu=3D2 credit=3D5180785 [w=3D256] load=3D2621=
44
(~100%)
(XEN) CPU[03] runq=3D0, sibling=3D{3}, core=3D{0-7}
(XEN) CPU[04] runq=3D0, sibling=3D{4}, core=3D{0-7}
(XEN) 	run: [7.0] flags=3D2 cpu=3D4 credit=3D5215323 [w=3D256] load=3D26214=
4
(~100%)
(XEN) CPU[05] runq=3D0, sibling=3D{5}, core=3D{0-7}
(XEN) 	run: [2.0] flags=3D2 cpu=3D5 credit=3D4816142 [w=3D256] load=3D26214=
4
(~100%)
(XEN) CPU[06] runq=3D0, sibling=3D{6}, core=3D{0-7}
(XEN) 	run: [1.0] flags=3D2 cpu=3D6 credit=3D4755772 [w=3D256] load=3D26214=
4
(~100%)
(XEN) CPU[07] runq=3D0, sibling=3D{7}, core=3D{0-7}
(XEN) 	run: [8.1] flags=3D12 cpu=3D7 credit=3D5175342 [w=3D256] load=3D2621=
44
(~100%)
(XEN) RUNQ:
(XEN) Runqueue 1:
(XEN) CPU[08] runq=3D1, sibling=3D{8}, core=3D{8-15}
(XEN) 	run: [0.13] flags=3D2 cpu=3D8 credit=3D9998664 [w=3D256] load=3D2621=
44
(~100%)
(XEN) CPU[09] runq=3D1, sibling=3D{9}, core=3D{8-15}
(XEN) 	run: [0.5] flags=3Da cpu=3D9 credit=3D1101 [w=3D256] load=3D0 (~0%)
(XEN) CPU[10] runq=3D1, sibling=3D{10}, core=3D{8-15}
(XEN) 	run: [6.0] flags=3D2 cpu=3D10 credit=3D7764532 [w=3D256] load=3D2621=
44
(~100%)
(XEN) CPU[11] runq=3D1, sibling=3D{11}, core=3D{8-15}
(XEN) 	run: [0.3] flags=3D2 cpu=3D11 credit=3D9998469 [w=3D256] load=3D2621=
44
(~100%)
(XEN) CPU[12] runq=3D1, sibling=3D{12}, core=3D{8-15}
(XEN) 	run: [10.0] flags=3D2 cpu=3D12 credit=3D7967846 [w=3D256] load=3D262=
144
(~100%)
(XEN) CPU[13] runq=3D1, sibling=3D{13}, core=3D{8-15}
(XEN) 	run: [9.1] flags=3D12 cpu=3D13 credit=3D7832232 [w=3D256] load=3D262=
144
(~100%)
(XEN) CPU[14] runq=3D1, sibling=3D{14}, core=3D{8-15}
(XEN) 	run: [11.0] flags=3D2 cpu=3D14 credit=3D7509378 [w=3D256] load=3D262=
144
(~100%)
(XEN) CPU[15] runq=3D1, sibling=3D{15}, core=3D{8-15}
(XEN) 	run: [12.0] flags=3D2 cpu=3D15 credit=3D7971164 [w=3D256] load=3D262=
144
(~100%)
(XEN) RUNQ:
(XEN) CPUs info:
(XEN) CPU[00] current=3Dd4v0, curr=3Dd4v0, prev=3DNULL
(XEN) CPU[01] current=3Dd3v0, curr=3Dd3v0, prev=3DNULL
(XEN) CPU[02] current=3Dd5v0, curr=3Dd5v0, prev=3DNULL
(XEN) CPU[03] current=3Dd[IDLE]v3, curr=3Dd[IDLE]v3, prev=3DNULL
(XEN) CPU[04] current=3Dd7v0, curr=3Dd7v0, prev=3DNULL
(XEN) CPU[05] current=3Dd2v0, curr=3Dd2v0, prev=3DNULL
(XEN) CPU[06] current=3Dd1v0, curr=3Dd1v0, prev=3DNULL
(XEN) CPU[07] current=3Dd8v1, curr=3Dd8v1, prev=3DNULL
(XEN) CPU[08] current=3Dd0v13, curr=3Dd0v13, prev=3DNULL
(XEN) CPU[09] current=3Dd0v5, curr=3Dd0v5, prev=3DNULL
(XEN) CPU[10] current=3Dd6v0, curr=3Dd6v0, prev=3DNULL
(XEN) CPU[11] current=3Dd0v3, curr=3Dd0v3, prev=3DNULL
(XEN) CPU[12] current=3Dd10v0, curr=3Dd10v0, prev=3DNULL
(XEN) CPU[13] current=3Dd9v1, curr=3Dd9v1, prev=3DNULL
(XEN) CPU[14] current=3Dd11v0, curr=3Dd11v0, prev=3DNULL
(XEN) CPU[15] current=3Dd12v0, curr=3Dd12v0, prev=3DNULL

--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-ZpZ3yaX97+GVLY1v8Nbt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl+czMcACgkQFkJ4iaW4
c+5q2A//a3SnMnVgMY5mMMQAu7cjCVs2xOWLSb1VQWMSEPH8b9PnR8Gj2Cr6dDNm
NX4rllTqWpQ3fgV5fVJO9NuhGcuRCGN3XSdbWzd0yyEPG3brhivfDXTdzq363H1z
CagMwULf1Xo19ZeWPywn3x1utcLoCrWtppj4hoC8Q5HT7s9GtpZfuVnS4vmPp6Hs
zF0mrNUaYt7Q3vNfQEsIWt6RR0FUJKVQdr3WCMEOsPzsh8NxzlOOAnETniskNxNX
6oDPBTekQF2cAOq7lAqFCoAEACbOXKTB0zPZQL23w55NVJQROmvG6xmlhhlXrx/e
H8a5aEVzD4uhPqo7sLi9wbcdtIPTw760PcuWQSO8IG3qnS4wzf66wJPlbuFm6c44
cfEyeyTwv5eBjjWNRu7JrP5D6QqkdnL46u4j4hmxpGC0h1/GUjoOky8jLNCJ6ET2
dwFONkInJEaFYWcl4yjzS1G7DFwnFa638vgWIi1/X47H51vVIalGbKIXJsYYsYQ1
sVIEe3Yfu5kdsgcXFg9m+a2m181Gjci552f8ITbUi9GypdJbJ6w9gn3pJyxMJDK2
g30DxltvHz7WtMVZ+RI73bXIkzBMC9RR6YgaSZ1Hjo86BibmO6jVVlGnuIM35Hx4
z92iLGo/3ps5kxAGxq9f79+45tXPtzHU+BU+17GLFVbTH/6GCQE=
=IW0n
-----END PGP SIGNATURE-----

--=-ZpZ3yaX97+GVLY1v8Nbt--


