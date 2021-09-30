Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7830141D531
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 10:07:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199591.353748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVr67-00031Q-6z; Thu, 30 Sep 2021 08:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199591.353748; Thu, 30 Sep 2021 08:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVr67-0002yc-2z; Thu, 30 Sep 2021 08:07:19 +0000
Received: by outflank-mailman (input) for mailman id 199591;
 Thu, 30 Sep 2021 08:07:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lcZS=OU=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1mVr66-0002vo-BA
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 08:07:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1746c208-bbd2-499a-9eb5-c1e14ddf7d35;
 Thu, 30 Sep 2021 08:07:17 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-lW3pAXosO3qoBtYF2jZn6g-1; Thu, 30 Sep 2021 10:07:14 +0200
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com (2603:10a6:208:134::22)
 by AM4PR0401MB2307.eurprd04.prod.outlook.com (2603:10a6:200:50::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.19; Thu, 30 Sep
 2021 08:07:12 +0000
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::7dc7:c:77b6:ed95]) by AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::7dc7:c:77b6:ed95%7]) with mapi id 15.20.4544.023; Thu, 30 Sep 2021
 08:07:12 +0000
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
X-Inumbo-ID: 1746c208-bbd2-499a-9eb5-c1e14ddf7d35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632989236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kD/3FSSuo+0Qv8jCUpQXYHGDFD27mwPLJVLhJ2SwDvo=;
	b=W/LNsHRYeBhpynqX+WYHIvS2IlpE2sEsCKs+B3ybExgBNGOZ19+S0QpkL6numl/N/JEBV1
	PkaEWCkLnNA6M5EXKNUfaG6FaaJKqqT3MrsOz78N7M4M0glxEDOddF+QfgloYfOyjFKrI0
	DJB6RplwxPrfVM1hvB4S2JNtAUcd9XA=
X-MC-Unique: lW3pAXosO3qoBtYF2jZn6g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqHqtDjhbt02FQv3laidogZOGG96DBf1zOzjM/YeGVDH/7cNxOjIooPRI9WVDkfOAPkxFryeitKRDny6OvRh0esnotFmdBG9TNUoX9z5MVym/4to+unTcD7sYPK8Yo/YM+NT1rRdUHuU8JI8Au3HpKCoVgEkiQBA3mQV4sMtjsPQCQ6HlGEbtmr17zdcjpm8c0A1I7jvQqsyODq+1AOJVOON2AKHQlXChpbbzPy3KAaPiuSF2t7nmUR5ZMmpmRAnsKaun0+YqgiGZnRGj/y35tlENCS2kSq0sLMR3Z0XN9RVyST+q2eglAmO453EtG6v0gtKGHpVVHZS1r6D8jnySw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=kD/3FSSuo+0Qv8jCUpQXYHGDFD27mwPLJVLhJ2SwDvo=;
 b=b9jA8ENMX1dKkvS1h03kyY4tvZlkjJFGA4y6X4aush3wQtqPJwkEn0tUmsCY+7RHhKk2S7z6Bq6ETN4ypDK7CH65Mlou+c3Fk6mCx/0MI9JlkOoeXR2bHRtsSUzs4BZE44jCOzmNOfHkfWh1CCKmXY8KOMBGmc/wc5dm81MBghLoKtM1UbEMVqyicZRZF6tRV/ltm/b24D3IbZ737bkY0Ldh+GZjtwEIyWi57CjFWqjFHDo3n7C7oEqWf1g5fYctutlPVDQnAnpVPcb7EQCYf/tVBdvAKMP05L4s6+ZFJdskIYsO4FFoLPr33Vnf6a3+sMhjNzJ87fc1feCF7RaSQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <JBeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
	"iwj@xenproject.org" <iwj@xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "mengxu@cis.upenn.edu" <mengxu@cis.upenn.edu>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>
Subject: Re: [PATCH v2 01/12] xen/trace: Don't over-read trace objects
Thread-Topic: [PATCH v2 01/12] xen/trace: Don't over-read trace objects
Thread-Index: AQHXrkSLbMGUvlBXkkK2FQ1vuFXyFauzSsKAgARBtICABLtYgA==
Date: Thu, 30 Sep 2021 08:07:12 +0000
Message-ID: <db0443d4fc414e17e0bba075043f8ae60b062860.camel@suse.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
	 <20210920172529.24932-2-andrew.cooper3@citrix.com>
	 <da06dfe42adad13650755650518a232dd41ac46e.camel@suse.com>
	 <8e3f7318-2fb4-0011-f582-268816ebb59c@suse.com>
In-Reply-To: <8e3f7318-2fb4-0011-f582-268816ebb59c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.42.0 (by Flathub.org) 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87d9c2b1-4fcb-4723-d80a-08d983e94f09
x-ms-traffictypediagnostic: AM4PR0401MB2307:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <AM4PR0401MB2307A045B7993C83823D0F03C5AA9@AM4PR0401MB2307.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6lH2Wb7BDUoSmy52XfQONPCDo+pHLzc818/XBnEzQZMA7onY+9FWyvijskESWO6aymTHzAzMpGmVnmQbVsUV3DI3IoA/SKzZGO3P7OfOKpfzrGGEtevEYnB+hmsSdcvxbfM/umo7c5AOUN1DuuyXRQ13bkmfM62hkwwJAM9OD6N9ZtFp7KIufqN8Q+Cxyfel3TNAGNc610dFLGiwIfGdfRt+/1s8S+4KZdm9vJzxCCilhXaKh0tdYiXEUdK759VUSBerqRv027Va9pb3wri1K37E3kpm0Sv/MRb2NXkhQmDxoXorfme2Q8CspWtcDXL1cetrjS5WU8b+KRq4a89wUXpyoYsok29iy/h9W/AmI8tSSujREPKt4hqlCOIE3dCPVJ93xjsEZ0AnO940j6hUSr+FizIXtM3vvYWu/Q558NflSshfGr8Sl46FiY+BCeVAULpAca8b/XG3fgQY8yPiReaASJePLJl5gOyLWcAnU6g0mdOuf+FbP2DwFRfrLFjrD5Ls7RbQ30mdLtrSQzFUIb35es86/vvtqBc0/bfK09miHlZoQOmo5D2SZf/8DGjBUpp8Mbf/iEAsiVcXsaUJEcn48pKdgkrP3BfazdccZ3Ax3BEblpmfDd59i+p7EVtmbTkkgyC3ZHp+us7q84vS2ISTPcM6b/8JVThSTa7YieMj0XGVMK6S3ktQAQVDDJursSEUI4MdAhAR7L2tCHvnrwSZTaPjXAazeGhmsaRHr8M45TDxqfgfVMfhDXazwT52lPmjv/ZnEm1+e92ArwnVC9zhTglaE05QesKvLqKBrmjqnjJLpl7fOnaEVkYyduuUGaaXzw0wcuczzUdGTuWBCA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5826.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(38070700005)(36756003)(966005)(2616005)(508600001)(83380400001)(99936003)(6636002)(71200400001)(5660300002)(66446008)(54906003)(2906002)(91956017)(76116006)(122000001)(8676002)(26005)(6862004)(8936002)(6512007)(53546011)(6506007)(64756008)(66556008)(66476007)(66616009)(86362001)(66946007)(4326008)(38100700002)(316002)(37006003)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZThFNUFJUFE2QmZZRkNVQ0x4NnhIMmhyWld5QVorMmV3dDFTL0tIR1JMeW8y?=
 =?utf-8?B?TmU2cEpzeDlpK3M4SlY5RjBjU0xVc01WZzBtMHJ5Qi9oZ1liL0lEbFJIMm11?=
 =?utf-8?B?dUdjc3ZGTmRBdzNqMHVBZGRXSzNkOFRic3hXYitNcnJjMzNwd25ZSlBtV05N?=
 =?utf-8?B?VFZ5QmxsWmxsRTViYVJiWng1SkoxZUNzTHFLSWtTMTZtRFJOUjlXSzJ4dVd2?=
 =?utf-8?B?Q1JBWkZRcVBvemhBYTJMdjZObTlxZ2FjM0FhcHIyT0taZDZFcnpmTVNWR2dT?=
 =?utf-8?B?cWxTTTVMNFBra1p3aWZzYWR1dWhFVDZZYXNsQUdFVEIvOW5uS2t2TGhYeU9P?=
 =?utf-8?B?TjBycDNNeU5RNGpRSndqdFd1UU1RYmNmUjJJdm9vbVcvM3RPQ05SSmtGSFYx?=
 =?utf-8?B?Q2lOSVdpaTdBdHhlK0ZXSXJzOWdwQW9rZ2VYbkZ2ZGU4bXAvai9SOGV3YWl5?=
 =?utf-8?B?VXdKM3U5dzRHcFJXL01pdFkvdy9ERHZRMWFlUTRzRTJDaC81R2hIZFdMbkM2?=
 =?utf-8?B?M2dkR25UTHUrWEc2UUF5bktHaWxLU0VaODlRdlNUSTZ5K3V2YmR6WHJLY3hT?=
 =?utf-8?B?MXUwQW54MkZkV0NyYXY1bEVReUh0YzFwWFVlK2RjMjliUk5RTVpuTTFMaTNL?=
 =?utf-8?B?dXFtZTcxTE5URlo5cnFhYkJGTGpXV1FTMDJqZDI2QTJtMCt2bnJ3VWIyam45?=
 =?utf-8?B?UGZqa29Eems3RGlRUEd4dHJUaHNoNDBuL3JwenRrdGNxVWhXVjlic0kydXQ4?=
 =?utf-8?B?VG02TTl1OUVDYncvTWRsMjBseXhyNVFaYTdUUnk1TEJ3bnJwMjhiZmpNVlZS?=
 =?utf-8?B?NmlQSXZEMnpSYzV2RG4ydHIxSUp4OWE1eHp0eEN6ZkFPdm5Jd0ZRbTk2Tlly?=
 =?utf-8?B?WUtRbEhpYnZ0ZWl4RnlhaHdkcEdyd2FPdFU5Y0NoMCtoNzBUS3FIZXNPcldC?=
 =?utf-8?B?UkRMdVZ1MlJ3V3dmRGJ5dDdIUXB1bHd1OUZUVE51YlgxSmR3VmhlRTd4YWdI?=
 =?utf-8?B?UlhwczN5dFVveEJzTXhWZCtHTGh4L2tBREVQVjMydzFZM0g0QmFVT3lwc3BS?=
 =?utf-8?B?UWVTZ095SHNDQmFVVVp0eHJDRmwrUjVySWZGZE9ORUtHby9uUTlZQXlJWWQy?=
 =?utf-8?B?dkE2bHM2Smx3Mm55ZkR6R1J4aHFUdDdOaHRPelM2QVpkVmFIZXBSNC9MZXNk?=
 =?utf-8?B?UkVvY2NsbzBkK3A2R0JxWm1nZXczVTFQUE5oSk9PMzB1cFJYOGp1RUZkcVlR?=
 =?utf-8?B?cUZWVGJDQWs3eHVRSnZxWjN5TlhBRGhFUDV6R2t1bzdwNXBjMTZDM1RnMUpn?=
 =?utf-8?B?R200ck96T2J1MXlFZ1JPL3R5VVd3VXQ1cWJRWVJaNUxJekdEVXlUUEVoaklZ?=
 =?utf-8?B?S0NHS2UxbzRLWENyaEEyZGdibVZESjZJU1VlYVpHSHppS01tRWVINjVrbG1y?=
 =?utf-8?B?ejNpelZ0THRER2dwenh0c0Erd2lmREJrUUxDdGFjbklwdnNKZ1JPcDBvdGkw?=
 =?utf-8?B?b2JRc0xvTXN0RDJ0KzFmSlBWSUZoNjJScXFZdHNNcXhnTEtMejRON3ZMdTEr?=
 =?utf-8?B?Q0lhVzJUTmF0Q3U4bG5uOURKWWVmNVE1cFBGN0djKzJsZVhSR0JnOGxqQWxo?=
 =?utf-8?B?Wm81ZEcxekVwYldPK2VUYWVyNkFXdDJVRFhna3ZsczJEVlNwNExvM051SURF?=
 =?utf-8?B?bWdWQXdTcStRQks5MkM4bFFwc0JzZzEzUmhPWWFhaWFVKzBXQ1dNbkNDYktE?=
 =?utf-8?Q?yC9BqEZfhE0q+ln5cbxlQc8CLzpkTSIrM0MtGbf?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-xGn5+hbfUoMJp9efajUb"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5826.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d9c2b1-4fcb-4723-d80a-08d983e94f09
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 08:07:12.5500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T9jii470oxAjM/ybhHjJi672gXTAjladPFOAV7r4Xs7M1cUDFsxQEJKxpC80IYm1YfmkQVLleKCAUdvEQyfgPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2307

--=-xGn5+hbfUoMJp9efajUb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-09-27 at 09:51 +0200, Jan Beulich wrote:
> On 24.09.2021 16:51, Dario Faggioli wrote:
> > On Mon, 2021-09-20 at 18:25 +0100, Andrew Cooper wrote:
> >=20
> > > There is one buggy race record, TRC_RTDS_BUDGET_BURN.=C2=A0 As it mus=
t
> > > remain
> > > __packed (as cur_budget is misaligned), change bool has_extratime
> > > to
> > > uint32_t
> > > to compensate.
> > >=20
> > Mmm... maybe my understanding of data alignment inside structs is a
> > bit
> > lacking, but what the actual issue here, and what would we need to
> > do
> > to fix it (where, by fix, I mean us being able to get rid of the
> > `__packed`)?
> >=20
> > If rearranging fields is not enough, we can think about making
> > priority_level and has_extratime smaller, or even combining them in
> > just one field and decode the information in xentrace.
>=20
> I guess Andrew has tried to avoid re-arranging field order so that
> the consumer side doesn't need to also change.
>=20
Right, but is it really worth it, in this case?

Aren't we (very very likely) in control, by having them here in the
tree, of all the consumers? And is is this a stable ABI?

Also, both xentrace_format and xenalyze are being modified in this
series anyway...

Maybe there's still something I'm missing, but if we've getting rid of
those ugly bitfields and __packed attributes, it seems to me that doing
it completely --i.e., including in this case-- is worth the small
change in the tools.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-xGn5+hbfUoMJp9efajUb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmFVcC8ACgkQFkJ4iaW4
c+76cA/+JRV2UjRtn7u7diOwwzTvGcK2MueTlmEJ5eRUme77UK+fUORK8W70UGEf
T1Nbb6/7Hvsb5SyzFjptqplwLIKw1feu09tGOwEWT8uObZKALXy/LjH2PWdVYmlN
gmEOuX2snBohCEZpdzlUrEzsZ61I+hXgEyCD+dQjLUEe3rGdDjS3Bt54ZURWzoxA
4QQ2VDoZ219h7tP1ReIRnTMpTQ8qX+nY3vsTGWR/4jomrN2cAHPv+Geua3oXSmq3
W1QN6OgBbRXlLnKLbf0ElRegnUsWwfC3/xSP/B9dQOh5HtMK/qTw9DQJiPjy7Cxb
TVroR5abq451hRAaOIgj1iUeO1VW1FPyDlTqSeLZ7GcBUnM2B/M0i+FTDEnmPx1M
MjFmfkWajEonnGCWhy9YZ4DC/p+Rw/5Gmn61dZ78iL05Rlb7tbg4ZGlVXEXjVhGt
KfbAM9P8Ms+MVKqqtT8LH9K1XZSLkJqv+InhHpeb8Xcj68K0A5bml2CpFEytZpzy
buEbXNcRXrALJPJ1rtP45loMQKpv8O4avhsAiFbUW3uc7I+oWGIDBhTZ/1+cHyxV
ToI83k5eoWye3TuWz2lgR4QhZ8cCFYpsRScUtvnJsD41Y4f8+CT8Kr5KRtVf4IBU
ZN+hQfbCxm8dMfrFwq49qA/db86gj78pX27VRTTu/TKEa+bTZ0M=
=8dMA
-----END PGP SIGNATURE-----

--=-xGn5+hbfUoMJp9efajUb--


