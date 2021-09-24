Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 851224176EA
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 16:36:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195420.348106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTmIk-0001FA-R1; Fri, 24 Sep 2021 14:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195420.348106; Fri, 24 Sep 2021 14:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTmIk-0001Cl-Nr; Fri, 24 Sep 2021 14:35:46 +0000
Received: by outflank-mailman (input) for mailman id 195420;
 Fri, 24 Sep 2021 14:35:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3weo=OO=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1mTmIj-0001Cf-4H
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 14:35:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b22de1aa-1d44-11ec-bae2-12813bfff9fa;
 Fri, 24 Sep 2021 14:35:43 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-lqQHz9IiPIef5FUVpSO7Cg-1; Fri, 24 Sep 2021 16:35:40 +0200
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com (2603:10a6:208:134::22)
 by AM0PR04MB6930.eurprd04.prod.outlook.com (2603:10a6:208:186::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Fri, 24 Sep
 2021 14:35:37 +0000
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::7dc7:c:77b6:ed95]) by AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::7dc7:c:77b6:ed95%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 14:35:37 +0000
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
X-Inumbo-ID: b22de1aa-1d44-11ec-bae2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632494142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gwEnhWffpKikd6V7ogwpbryzoiQJzAI8CfaIrrWolWU=;
	b=loEd6vpuUwDhwdXx4WCFlZsGZKmbhzTpgnXAtWD7wKylmKrCsucXkOOetTp0apKZrx0BBX
	Ff+OTvt/G07onbfGHN4fopy4urE7GJ7ClQnaUNvRO1DPKM6cRW77Da7A3kNQq1EqdF64z+
	dBJqIpar3gy+kvEKIUBiQA4mJLXJHa8=
X-MC-Unique: lqQHz9IiPIef5FUVpSO7Cg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hCNqIGr6p6gL9osUJl95idQYvXMFMsb8M6mMnNPfNgWfNQIhOLPI1jglOREMximPWDi8dvseuWsLp11i8/fGg/8v+PwIgVq8piTw9etfoYl/XvDAoya+VtiUOm/Q8CzRpi4mb3rR/y0QZKqv5NwbMJCs/4IHAHpdomotuGU24mJmTtrBc/m19Rdueyu7MPs5ZzpRupLfrzOsbTRCG3PHInzXjNgcolYLPGH8buS+AqvPVDg+XARz78KbNs2m3Z9qFSm2iyJ0jvsHVKJ5tqmF5OU1/7uTOPEbnaQhWKibR/50v6sDX2xcZF+mLjVq0zn8q9aTjfRBVz4xtXPExLqUcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=gwEnhWffpKikd6V7ogwpbryzoiQJzAI8CfaIrrWolWU=;
 b=CEzyCVPsV1263893sqW8UUAznLGHTk819LJAXLM2sO6OwzdI8Lcdi+bOs0vCqYwH5Rk3IPKL+1WFS9D9rQyJJ/BV/pbP4NgNh1d8w5t2pOzPVajgZNfX52pIthKSxp/FItKhPsCa10L280af/oAOzCgsoS04U1jPHStDJUd7scrAjca/9y0l+vy/Ds8HQQrjYIRqViBHA8IUBH9plajixRi/WRseBy2uXjbeArj9bY1eIZ8cTomWXvPn0FiBpOfatZWlCUKH7JPd2YrW4wPaU6TI1meY+Bvt4tTW1X6V4NVQ2GXBSKfuc4OZTeqpGtuA7qctPvY9wze8E3ZisjLaXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <JBeulich@suse.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>
CC: "julien@xen.org" <julien@xen.org>, "George.Dunlap@eu.citrix.com"
	<George.Dunlap@eu.citrix.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "iwj@xenproject.org" <iwj@xenproject.org>,
	"wl@xen.org" <wl@xen.org>, "mengxu@cis.upenn.edu" <mengxu@cis.upenn.edu>
Subject: Re: [PATCH v2 01/12] xen/trace: Don't over-read trace objects
Thread-Topic: [PATCH v2 01/12] xen/trace: Don't over-read trace objects
Thread-Index: AQHXrkSLbMGUvlBXkkK2FQ1vuFXyFauuDj2AgAC3ywCAANyhAIAAY+SAgAM/yQA=
Date: Fri, 24 Sep 2021 14:35:37 +0000
Message-ID: <aa5151723de33c6c871fc98432d720ae3317711e.camel@suse.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
	 <20210920172529.24932-2-andrew.cooper3@citrix.com>
	 <731e3474-77bc-b11b-41ca-5dff57831264@suse.com>
	 <171e6f01-63cc-e453-7268-1bf2ec6fe7cf@citrix.com>
	 <69770706-85f6-6509-b5c4-bda61dfdf994@suse.com>
	 <84b780c0-7177-d1ba-fabd-9a6258985f9d@citrix.com>
In-Reply-To: <84b780c0-7177-d1ba-fabd-9a6258985f9d@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.42.0 (by Flathub.org) 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4f7b562-f152-440e-61cc-08d97f689367
x-ms-traffictypediagnostic: AM0PR04MB6930:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <AM0PR04MB6930631A6C9DC97DA9973B75C5A49@AM0PR04MB6930.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Q7wL6fmPIyKetq7t6QqVLOobGmns2tsbNNw6URk1SPCwN3ZyiHSYyiKI/l+bYCIL0+wOhOMQooU+GMufv+VqP1WZj3L2vxBmclCKCY7YYovE16XiFX6Vg1IgJjLYKF119Msdyfr0429WhUHnSw97XEYeOjidN+2K6L7MIlkGpF7B2SX/zcf7HAVVoKTM0HvVnTGaxa1QG1Kyk9HfZm01ayECeeX9ugbwsWfsR8S3HFqlsDXbvPPt4IX3WF6m964KVlAZ/cdF01QSHnWMYgCpesLFxgw/9PKsFNfTNcI6uAJe8pWnZ7NleRg3I/KxnHJu+UT2krYSZP2nOCo+wASYo950ze2viYHyK1IWre3IdO55H7X1hK/1ldMlSF1moZuvxhuvs6VAP9JJZ2GsoJi9vtR4bgQ173o5EsZ22hu3OWf1b7+F0Rw15fmWb5aP4r0ptTfmqmRZ1uTo23NCKFD1xWGk8iokyx/Z0+KQu3U1H9QoBMmUMZvAe6Kh3IiFT2nSljq0YqrKTfJHw2xKG95dWSNOsYBeK0JkOlrT8xXE0jdK3/4qqPKHG1kaKpdRVKw3p2fMQF24akp3JsOrZAegtyfT//5ffUMtUuvafBXnctcAH1pRyvOhz9g0RISQmbsWUF+4HTCF25mO9QuR9NO2jKCTjHDWXAlMOt2Wslb2AQYfuBOLE0qUPNCT8N2DsWeQwSO1HztGZqREnbkgNqKTaS3phC7KGJWKIt8vaum5eyBraV8gW0sil8WWoJmP6nPOPlB6AIs2ZFqpDWZHVL2UUzcGjYjMi5YpwAW60wg47YFt9DbSprjpxBYYJ2/EWiie
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5826.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(86362001)(54906003)(38070700005)(2906002)(99936003)(8936002)(71200400001)(316002)(966005)(186003)(4744005)(8676002)(53546011)(6512007)(6506007)(122000001)(26005)(2616005)(110136005)(38100700002)(66446008)(4326008)(91956017)(66946007)(66556008)(64756008)(66476007)(76116006)(66616009)(5660300002)(6486002)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MElTcnIydG9PbG1GbERsOFAyeW9naVdqaEZIczF4UjgvOUljVTlRTlRnMW1h?=
 =?utf-8?B?WTN4bVhoOVZtQ0JqNEREN3RGSHh2ZU9hOXJzYkxudlJLSERzQnNzM2UwZ3F1?=
 =?utf-8?B?REZRYjNTVnUraWkyR3VkRFBIbHFHR3BkbkpDZXdjVEhGcWZxbXJBMFZ6VjUx?=
 =?utf-8?B?OFdMVHkxdmpaZklMYTRLLzlmSXFqbzZlZXBvYUdib1RBT1hhdm9scmhRbnlG?=
 =?utf-8?B?MVNic21zanhCblhBQmxyNGZDcS9mbkdUaHdxNTRaRGFxWFhRREVqdFZwWXFU?=
 =?utf-8?B?UWNZcVVacm00RkY4Q25QalBVRWNpUkFuOUp6RWJSK2dURE41UDZBbThjemZ5?=
 =?utf-8?B?ZG9qMisyc1dDOTRtajNMa1hsa1BZZzl6TEpMRkFDNnZBcFBYeVpha0tHeFBk?=
 =?utf-8?B?ZFUxNkJ0TVBqNis2KytUTFErQk03aGdleGJzSk9lSGwweGxsc2M4WnFtWnJX?=
 =?utf-8?B?Qngra01lNldUenUwMDNFc3BROXY5MmYza3phZHJlUFBjeVY5NTlyWlhWSkcx?=
 =?utf-8?B?Ym1Qemh5QXBjUitVZlNhOVNpU0xqdFdaaENhL0pLMTgyVm05UFU1K0M3R0hl?=
 =?utf-8?B?U1RDR3N4NnFheEJ3MGhNS3JyWENCa3FpZmFxcEorb0g2MWRvL1oxWmRkeHBL?=
 =?utf-8?B?OUM0akUyODROakZIQU1FODhXUGFDK24vTlZjbkRZUEl1eVlscVNVNUJkTk5K?=
 =?utf-8?B?cnN5WVE0T1FvS0dyTGxiVTNFOXBubE1VeS9JRXVYWWxXSTZHeDJhaGphQVY4?=
 =?utf-8?B?dHZ1WUx4blEwRnhCVTRIYWR5T1ZLRXhUR01oNnhSaytvMlM0MVpWM1NsWHNX?=
 =?utf-8?B?enRhN1dmWG9iY0ZTcmJLTVJTWmlSTlhtbmZpN3VjVDFNb1c5WUtVYjc0bHAw?=
 =?utf-8?B?ZWNSd3ZBeTBGVVh0MnFjbS9Gc3dYOWtua3NZMkhaWUlXUW9QRHFKYXpORlJK?=
 =?utf-8?B?RHIvajd3RUErSGUzcWlGSWd3MFV0N0MrNDVhMGxYNWJOVGVZR0JmaEszdnBq?=
 =?utf-8?B?MFVHdXp6em5QbkxoSkNiK3lUZnJmN0QyZlczclRNdTVBd0NnclhWLzNmcUdk?=
 =?utf-8?B?c2Z3NE1VK2p2djVWaTNRSFFxMWwxeDFjcVJqTjYvYmZlNXVESVdYR096RUYr?=
 =?utf-8?B?WXJTbVVNeFJ2bjl6RDRDQnAwMkhOVllDVjdFZk1aMzU4MnB3Umg2czVNcnRG?=
 =?utf-8?B?YS9HL1M1aHFmSUQ2eXYvYlZ0U21xdnVBajg1Z0o3Y1JOSGNrbm8vUGJBRlFQ?=
 =?utf-8?B?am1uL1B6elVucXVVUWNmbmJRQnZUSDFwbHl5Sy9WaDF6WW9sQkJpMERqODdZ?=
 =?utf-8?B?dEMyUWdaV01mM2ZRdWxxeEVFWEtNbW81R0dJUFV1bXlwbDZKeWdxNUlIYytF?=
 =?utf-8?B?ZEZCR0tGaUx5c0IzS0RLQThMQk9WdHYwZFoyU04rQzl0SE8yWUVNQ2REZk5R?=
 =?utf-8?B?bitIWHVpR1RBbGtWbTI4SVBiUUVVNWwvZzVHd0J3LzVpazBIMjVHYTNVUFFn?=
 =?utf-8?B?MDFWa2VFZGMvVlc3Zk5wdzdzbkprMklIZEd5Y0J5dHJXZHY4RkZyZDV6Sk1i?=
 =?utf-8?B?Q24rSE54cnBZazlMSC9pd3A4YU1VNEo5bElleGdOeGt6QWRoQ3RYUEFPdlV4?=
 =?utf-8?B?bENXOGFiYTdLZW8zaWMxRi8ra2RmNnVRVUVnekw1c3NMUmhHWDUvclJZWnFn?=
 =?utf-8?B?R1FHQzRYTE1ydW42dmVRMVYyRVpWcjVIbVl3T0tqVnlHMFdMUDNrRFNsZDJH?=
 =?utf-8?Q?B2bRUajTpwBdbsPOmyG2tatiViUUm5m4gMsre1Z?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-7oF2mRctqEMgy14sO+Rw"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5826.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f7b562-f152-440e-61cc-08d97f689367
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 14:35:37.5238
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ROv0vNOpTo38O7dTu52mg2p9tlMtVE8Qq8fiaAsJLbZd2tSZvEMvgjPi69eFIWYA2rCKbbt/L0YYOzYj0bnSkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6930

--=-7oF2mRctqEMgy14sO+Rw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-09-22 at 13:58 +0100, Andrew Cooper wrote:
> On 22/09/2021 08:01, Jan Beulich wrote:
>=20
> >=20
> > Agreed. Whether the truncation is an issue in practice is
> > questionable,
> > as I wouldn't expect budget to be consumed in multiple-second
> > individual
> > steps. But I didn't check whether this scheduler might allow a vCPU
> > to
> > run for this long all in one go.
>=20
> I expect it's marginal too.=C2=A0=C2=A0
>
It is indeed.

> Honestly, its not a bug I care to fix right
> about now.=C2=A0 I could leave a /* TODO: truncation? */ in place so
> whomever
> encounters weird behaviour from this trace record has a bit more help
> of
> where to look?
>=20
Sure, that's fine for me.

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-7oF2mRctqEMgy14sO+Rw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmFN4jgACgkQFkJ4iaW4
c+5xHg//TWZKxoGYFy4Ile0SpjrjVtjS3wr27iEx0CeIbYcTS0+w0o2NsaQSc0dm
8tactDRsrXV4VI8zxbobHejgxGeTWnXMIX8imRewkS0GilRdDKDTBcsGqDi9e6V2
0LjfjSNSpCjZe2+ICgf8F/JvWuOwCbsrQ2bypIXgBrs7oJIb2tujkelyNXGmDPEu
NlrWO9nAfhc2rSeCWrNW91Bir30+ymz3EgFLnVMz3NJG8LLnwCzkacgCn+ABctf1
+2TdW9i5BfkbdzTs0ON9/cHy7rj9BYep2cTbDt+Y7YRsYc2RoJFNuMDtWwTCXwUg
9bn1WsS9EdQsQU3kW2jHN4pT1K/rC8F1PzcStF8yDVWXas3tNysgDvJVOMOuk1pV
19dJ7QINrLo5iy1/NHMuhl3gmiOzNJv1oRILrcxqhaCKm4XV7oKiL17q3Xdw8EZ3
uPJ4ttfTkmjaduzYuS+MO3Z2RzF6iDLNhPvLnoDknfQBNrguK8fDJ/HFEju7EC5n
oq/lYCfNfTHvVX/yl/NlAKBZdw/NoVwHWbxtA+/VvPaBJ2UMrT3h5Drhz9V6k0zy
WsMZS0byrrxwR3EYZER2UuY2zMQ9zHUQqngFtHfaUjp92nitMumgPt705UyJZ3wJ
G6BfKf3mKuH0CeUGxrEPYTxndpuBXqAltZSjPM9A538jOyD5hnA=
=l/Gi
-----END PGP SIGNATURE-----

--=-7oF2mRctqEMgy14sO+Rw--


