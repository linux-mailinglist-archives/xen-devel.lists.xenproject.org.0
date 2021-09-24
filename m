Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13315417754
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 17:16:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195476.348203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTmvv-0002VY-VO; Fri, 24 Sep 2021 15:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195476.348203; Fri, 24 Sep 2021 15:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTmvv-0002Sc-RI; Fri, 24 Sep 2021 15:16:15 +0000
Received: by outflank-mailman (input) for mailman id 195476;
 Fri, 24 Sep 2021 15:16:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3weo=OO=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1mTmvu-0002SS-H0
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 15:16:14 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af7ea26f-acd1-4698-92f0-3e0ddb40643c;
 Fri, 24 Sep 2021 15:16:13 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-llJG86DGPoW3Jd4SZsxV4g-1; Fri, 24 Sep 2021 17:16:10 +0200
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com (2603:10a6:208:134::22)
 by AM8PR04MB7474.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 15:16:09 +0000
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::7dc7:c:77b6:ed95]) by AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::7dc7:c:77b6:ed95%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 15:16:09 +0000
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
X-Inumbo-ID: af7ea26f-acd1-4698-92f0-3e0ddb40643c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632496572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RWqq9mAcIYwMkvDTrO88ltRzUibHN1PcXj89F8puzRM=;
	b=g4tBmr/6RzQdA1T/nAGPfr34UReyVwTvBzFwnhbREwFRXsjR9cbHywCtBoU4A52X6KIwho
	krIz2M5s70kKKw580xFCXlCuVWm/gPRUdgCv41KQecSp+o2ZFYPU54oJbRoLxQvWbn/EoC
	5aakb0ri8jdRp/hs/y1I+h36zfrjYH0=
X-MC-Unique: llJG86DGPoW3Jd4SZsxV4g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNSZskXnU5WZu7dUDps60oM1rpbeo0ubPPkqu3+D7NMYQYAekP9qZW3xSNvAUl1gswXKGjYlnM3SyfzJLe9cKlw2E2qhfZ06H5uORXVqFFvpaQPJ9Ke2SeV0Hrvu68ks9YK3kqd1fdT84HpUjRQY1zbfHz09m1AgvNc1i7xNukWWryT6EhQhGURLCjl0NTNJQhzm4nBrMCGUANm8zNSb0QY/bihtRhGukbElIVup7wAlgJbUwkZhF3PQpY9QYOms/EAeqpFunEoTAHaEKE0MEEDIduqwV6vqhzbvz0ziUcNWWrII0hSOQVexIPPZ4u8fl73zq4AoSj0W+2JRthpfQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=RWqq9mAcIYwMkvDTrO88ltRzUibHN1PcXj89F8puzRM=;
 b=mrSRr78jtI/LLWJQhYqRJP/3+xDiteCsvOb5K51qg2eLmmNyNbZSB0zgzp8jSBUQ0CXB/Nmk/FrSCjibIYV9oaviYc+qNCoyhOi7In3LjnEKxwLXpsqlLVeGG2Vg9TixjKQghMBUvfS54tQoQBEeIXy8wyMgcO9CCRTZmJsG3YdI4ve7LnpilAznSVEVuAkmPfXFTgjMVybNwegSTqdKeSA9sBT+85XbTOm9xFWRTXnR+k6xCNlIId6dkZ7yBJpfwctqFc0j0IqVvhu4CqEp5ehB05VOKmT3LbFZk4gC5BjaZRJRIvgpDfgzScQ7WI8VLkdqjU04nTp/kvlBYvjAiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <JBeulich@suse.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>
CC: "julien@xen.org" <julien@xen.org>, "George.Dunlap@eu.citrix.com"
	<George.Dunlap@eu.citrix.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "iwj@xenproject.org" <iwj@xenproject.org>,
	"wl@xen.org" <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 09/12] xen/trace: Minor code cleanup
Thread-Topic: [PATCH v2 09/12] xen/trace: Minor code cleanup
Thread-Index: AQHXrkSNUXB03Bf2kEahk+mMoXgWnquuVDIAgAT9eAA=
Date: Fri, 24 Sep 2021 15:16:08 +0000
Message-ID: <8caf579ed621fa477038f7a7b7a5ce43c8b75abd.camel@suse.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
	 <20210920172529.24932-10-andrew.cooper3@citrix.com>
	 <c34d236d-d749-5d33-207a-94fef482577f@suse.com>
In-Reply-To: <c34d236d-d749-5d33-207a-94fef482577f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.42.0 (by Flathub.org) 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4e33af4-6d92-49dd-10b5-08d97f6e3cb0
x-ms-traffictypediagnostic: AM8PR04MB7474:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <AM8PR04MB74744498FD52629C169F180FC5A49@AM8PR04MB7474.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 pQatuKB8uutMIt+Egw2Kn7sNCjJODpmIBxIubEYyM6YR+WgVEsP7nKmI35qH+XItS1bjFUb0DJB7s8cd8WKCYtsOYEiUqWvzIjYsHnLuQjSJtUzjvZGBh6rufsMlk0bremM5RcppCCcyyhKCdDLikijRk3DPLVF01unaSVEhQTCYsmHChqtK6BxzdlL9TTMsMbOB1s5ZpnTm0GDK77Y5qU48N9EVuvMpKaJO4JGkikPxDiU7ClrgmaVXrPvFTiYNyh6RCFqIGZphywfIi/15t/7V1IUYJ1VfZl5Kox7yEXt9nKP9MQUw05xSxfNuIjsSeLxTqX3GxHvrmkIqDJOYo5M0wC1yDNQPhjYdtItdCa7w92q63m7ttYgAczGqosd024u7zW2mi2kM/nUizaOk0mRb0pdG+EAxztW9ERc/Gyf+WTiOyK/DjNL278J3ysjv0mVJpqFFkQHm6qtZbH7OGfUU9d+wTB8MbriJVOOVpC5qULxTxe6+goYWb4Z89g4hJatx+ABmCpTDEYD6vIeLcGRSWdfeaFDyOWP22B4epyi6xC0O0lH40/u8TgLhVf/XfWRafvU8UKPckc6BH++KrrHgIOD8u9wkus3sWRCt0n2b+uTQgbkHqBDpv0u93IkjyDUtZyDtStoqvJ7asquOcStunqUAa7aKnN3AnQNcRjbLW/zyfq0v7U4yo+5nvuheUM0pGuP94mpNWNtGrxY4phLQHBgnznkI3cIqNCNz4CB2sJJKkpP+0JUAAWyXJ2DOjd1Mmyp3dZMkEbFK2lx2bJhZQv718NkRk5JIybYww6uGuE4c8fwpqxOit3tVPCUPDnSwAVYBau8/hiav8sdRMA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5826.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(5660300002)(122000001)(38100700002)(66556008)(66616009)(76116006)(66446008)(2906002)(99936003)(36756003)(316002)(91956017)(64756008)(66476007)(66946007)(26005)(8936002)(54906003)(8676002)(86362001)(4326008)(110136005)(966005)(6512007)(186003)(53546011)(38070700005)(508600001)(71200400001)(83380400001)(2616005)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZlhTdkYwYnFzNTI1U0FlYlViTDFQTW4wclpJaUgzd2NXeTVRTHZNT2JvYm9u?=
 =?utf-8?B?S002T200U0QxTHNPL0w2V0pSM3FpRmpzeWJ0WVRGWDB5M2hXcVhMd1M3MG9B?=
 =?utf-8?B?aFp2N25iU25OcVN2cGNSWlhsYUcxRWtJQ09JWmxtNUd6VW40VC8wRENqL0lB?=
 =?utf-8?B?eks2aC84dEdJYit0ZVM1VmxZbTVGZEdoeStTUUk5QjdURXN1aFV5THRaazVB?=
 =?utf-8?B?NkdSS0FGZ2haaVBRUUhWR1AwSGZaZ0FVZ1B3R25aQ3FZRmIzTGVmM2plQ1Nr?=
 =?utf-8?B?ak1iTDBGUnZGb3FSc3VxeVVIeEVBditUYTZLWkhrL2Q3SnZVZEN2WlRJS2JT?=
 =?utf-8?B?ZkZQcnk1bVNUaW52ZjJNRjg0QjRUeDB3S3RhZlRKMWRuZUNlZURleUVYTW00?=
 =?utf-8?B?VUgyWXJqQ2VHK2hVV0M0YzVaWWdoVW05TWNtR0IvWFpHdW9oUlhvTHJqeVNW?=
 =?utf-8?B?UnZxNnhKZE1mUWJ1Y0w1bEFiaytXb3JXQzhpWTAvNHJ4WHQ3ellLa0dKbCtK?=
 =?utf-8?B?cmM2T09zWGRBTlRuemszS0YwQU5TWWNsZ011L20ycmVWV3dZcXZGSUtEeDFK?=
 =?utf-8?B?ckxrZ2lxSTdHZXRLTXNuSHVxemZhQWpPOTJodzJnWXdaeXVFRWx5VkR6UE5o?=
 =?utf-8?B?UThRWE1uQTltaUZ1eUtxZG43cVVQYWN0K0VsQnFJR3VoTnQyV1NqNG1aMDlk?=
 =?utf-8?B?U1ZHZnFCSjBxVEx6MTh1RTdCZWZtRkx0NWhuYjk1Vk9NaEt5NmtCb1lkTE5N?=
 =?utf-8?B?a0UvNytTTU5PdHZZWjhwZGNZbUJYNmQvdWJVL3pnV1lEVS9xUUx6NFRSTzZm?=
 =?utf-8?B?WUNOV3UxUUlDcHNhY1g4dlRoYXJXdHBHQ2UvVXpYRDFKbXlNSlNhQmpMbWFK?=
 =?utf-8?B?ZFBYUFJ0Z0dTcnk2ZzJLZlErenh2RTFhT3lHeWdnTHpPeFNjNUVaTTY3Y2JJ?=
 =?utf-8?B?aUpiNmovMmJQMk9oR05tNDIwWkxuRUh2RXhKMDVLZGFjTS9LSlkwUzVQRU5N?=
 =?utf-8?B?VlQ5SjVxd1BYQTZMRUVBczI3S1hxY09ucEo3Q2dCQlpHWjYwdU9JQjJNQlhv?=
 =?utf-8?B?NGRhZE5mQUE5a0ZJVmx1UEZvTGJjbmttdHRPVDVUVFZvcWpRTlVRS1lvL2VH?=
 =?utf-8?B?ZjBvSGMrZEJuUHRzbVVFMnc2OEFqeXFLbU51MTdUM3FleS8vWXUrTWpWc254?=
 =?utf-8?B?czR1ZitDYjd5Q0xKdytpZDlxTVZzNkZRL1c0aElnZHBWSUMrYm5KamN5czVZ?=
 =?utf-8?B?ZThjM3FwTjZiakdCam8xTUE3Sk1lbGFVTWphV2k5K09FakYzaG4zRlIzZ2Jv?=
 =?utf-8?B?aWVBalg1amJUajhMamphaUM0Y3Jxc0pHRU84Rys5eC9qZzNBNEJ6UkkxNU9p?=
 =?utf-8?B?SXF2c3d6dTBZZnZNZDJhQStaSVFTbmN6K20vV3UrcGJiaGRtQnJZNk5jdS90?=
 =?utf-8?B?Qnoxd1NhcWJqTEdqSk1SRlgyRTdHeTJ2OUlJeERsRko5MGIzVkhRYjFyTzU3?=
 =?utf-8?B?ZXBDejU1dWtYMlFFM0FOUnUvVkE0ZVBuK21ZUFdpUHdhUzB1U052blZSdmdv?=
 =?utf-8?B?cDZCRER0NGVqWVM3UE03Z2JQbzJ1NGU4QUI3Ky95Y2FTUVNkVC9vY0h6aHVs?=
 =?utf-8?B?SFkrczkvaHNzVC9tWFJubElWMjE3RVNBY2JxT2p5YUpNeFJ4MXlwMTV0b2w0?=
 =?utf-8?B?dXJObTBJRmtjbzh2bS80RGFlOE9yTktHWHJvNHQ2M0lodVQ5VkUweEYrYjZw?=
 =?utf-8?Q?s9JHLDOeXVbDJa3dm7x9Hvp89n2lUPtmxKHEPf0?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-zCOrHJAO1yPZS0GupZLf"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5826.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4e33af4-6d92-49dd-10b5-08d97f6e3cb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 15:16:08.9468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 44ip2EWx8OfJpjjrdNo1yZ3N/HKvgvepNzZrSPrlLnvbi7HA87fwYID6r2i8pDIcceYFtQ3z4CsNvGDvIDB7nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7474

--=-zCOrHJAO1yPZS0GupZLf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-09-21 at 13:03 +0200, Jan Beulich wrote:
> On 20.09.2021 19:25, Andrew Cooper wrote:
> >=20
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> Like for v1: Largely
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

> One remark:
>=20
> > @@ -717,9 +713,6 @@ void __trace_var(u32 event, bool_t cycles,
> > unsigned int extra,
> > =C2=A0=C2=A0=C2=A0=C2=A0 if ( !cpumask_test_cpu(smp_processor_id(), &tb=
_cpu_mask) )
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0 /* Read tb_init_done /before/ t_bufs. */
> > -=C2=A0=C2=A0=C2=A0 smp_rmb();
> > -
> > =C2=A0=C2=A0=C2=A0=C2=A0 spin_lock_irqsave(&this_cpu(t_lock), flags);
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 buf =3D this_cpu(t_bufs);
>=20
> I wonder whether the comment wouldn't be helpful to move down here,
> in of course a slightly edited form (going from /before/ to /after/).
>=20
FWIW, I agree with this (but the R-o-b: stands no matter whether it's
done or not).

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-zCOrHJAO1yPZS0GupZLf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIyBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmFN67gACgkQFkJ4iaW4
c+7o9Q/3czW58sr7O1UMSQybVu2HK4m1H6Zd339rTRaEhS9+zSnTfr7NRoyFF1Wn
C9aFL1fFWeO7NohumUiqjOsTrWiIDQdQ4fl16jl+KzRmuz8dqS73IGSQL9MtXK1G
C9I0XiOyI2LIy2ripC9bnjWbZRi3kr8aZCEqV8vo+0gApqwR42X57b0/+pwqt0qf
yuny/uMpBHfsOK1mlfBZMPbuUTu+N1ijCUNjR0HADOm2u+zqCtt11zeYOVIntZeP
unwAWHepnJDfUehhXG0EDXfq9zHQ8LhfSm1cDzr021SyX+R4W1pAEhn4kXhLYsPj
pbDyQZbJN9ykfENacieNPOKfi383ALoJDVcBp2re42ZqqlVNj5nbWS0vR9CI0Kdo
CZx2CMZQ5uAL/lToISNDpsnqieahkErs1y60qh6FTz0ZT7IYSq8RGX8Cbt5U16ZB
1ajRPUhDZBYnov+wjDwcJYGCdAZyA28DOuQm7jhtOysvwUiGk3CODWMrtR5zorLx
TUJm3YPg7haGyff2TakYNtVJqY4Q1TamRbpdXQzu+fmd0q/LO/bPjSAcun+Df51Z
Y24b4oifc50Upnn01THPSI3BapHtigNCKPOBYBxRtxa++X89vITnOJvInQBYUO2u
5d9WdxMzMJcAu7ZsKID2dxR4ojmaerN4qtSwcMgmAjk1zUCJzg==
=R5xu
-----END PGP SIGNATURE-----

--=-zCOrHJAO1yPZS0GupZLf--


