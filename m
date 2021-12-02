Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E55FB4661A8
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 11:45:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236470.410203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msjZq-0002M3-VC; Thu, 02 Dec 2021 10:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236470.410203; Thu, 02 Dec 2021 10:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msjZq-0002J9-RM; Thu, 02 Dec 2021 10:44:34 +0000
Received: by outflank-mailman (input) for mailman id 236470;
 Thu, 02 Dec 2021 10:44:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nb5W=QT=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1msjZp-0002J3-7U
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 10:44:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4618bfb-535c-11ec-976b-d102b41d0961;
 Thu, 02 Dec 2021 11:44:31 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-M6UKHFy9NySXxD3c9OR7og-1; Thu, 02 Dec 2021 11:44:29 +0100
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com (2603:10a6:208:134::22)
 by AM8PR04MB7778.eurprd04.prod.outlook.com (2603:10a6:20b:24a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Thu, 2 Dec
 2021 10:44:28 +0000
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::fd58:46b6:86fc:8a94]) by AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::fd58:46b6:86fc:8a94%5]) with mapi id 15.20.4755.016; Thu, 2 Dec 2021
 10:44:28 +0000
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
X-Inumbo-ID: d4618bfb-535c-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638441870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=36ifU27pnG6qpA2pqL/qjSPu/dqrbRmcJXHUWpIz6Tw=;
	b=P18a9L9xVxNy86xb3zjZSqsmN592o+LBhPdknIDPE1tVZEenFMr+8KrmGWGPqjXTWHhzj0
	H4dfHSbLINwEq/5M57rbtH1MJUpvQZ8SCY3xynygy72gJI9p+NpTdMKZTDXPjQpQQWqaHl
	ASDSBkyY8OMJ2fNsN62RwZfxyvu4JlE=
X-MC-Unique: M6UKHFy9NySXxD3c9OR7og-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZn4tsaoz9cCaEjfxgPaNx+YvTsu60QP3ZO0AahvDfqtcvSt4km4sZ0lxkzA6K5n8KesRHpY4x9tOPcPYKAlCA6sHI4k2i0hSOupyK1/a/eNe6od0x+9J8V/JZ/DQBAeM9ME/c6qqA5Uiiw11KBCBsiPKlG9Eq0Rhogq6SYQhbVx9t2hbO2ezU6cWiXiXlwER65/JF9QaUZUQz9pOs/WEwDTHTyOWCfQRu2Wg+yFDWM800NxRw4Vq7X1S2HoSFy/UQSu02C5U/XlPlAybDf3b9+gMh/zjLSQG3eEWlvdktLZEU4J1Qejyawyx0DTR0qPUtr2nlpSw8bdUICQ2s6Mrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36ifU27pnG6qpA2pqL/qjSPu/dqrbRmcJXHUWpIz6Tw=;
 b=Vrdjofd2NLzPhYKDCljARnpFt+PXM6FDFpkHJSfSzl+wjZ8/P6t7NNxIIZrjdNj//pAfu71jzL/gFw2oV8hdlt44SDy3K4/zSp2AhADNHaMGYybweLZvSERjl3AiVvp1qwcXFo9ir71fKLJ4r71+jsoGrQuFtlR5Jm3TYratKSTtVXSQNiNk08hb0E6Q1Z5B40c1GEhRL+SCLiTKcpBJQYELOVhNNkMgRaLrP5ZakEAXZd9zJ5u3Gaq7KwxURz5SE0FM6+K7IMx3053Fp2Mt4Po1IWHh+0zRFAWmxdLcZlJ46jhLjD6WOowcfrNdqA0FoDA1gbIXhS9ea3B9/bAiqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: "osstest-admin@xenproject.org" <osstest-admin@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [xen-unstable test] 166960: regressions - FAIL
Thread-Topic: [xen-unstable test] 166960: regressions - FAIL
Thread-Index: AQHX52mUfBd5D6xxFU2byl2OP4I40g==
Date: Thu, 2 Dec 2021 10:44:28 +0000
Message-ID: <ec11daf7a998ae63c9a34578ec4224bf900232e3.camel@suse.com>
References: <osstest-166960-mainreport@xen.org>
In-Reply-To: <osstest-166960-mainreport@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.42.1 (by Flathub.org) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82c180b1-c9ad-4df6-03c2-08d9b580b721
x-ms-traffictypediagnostic: AM8PR04MB7778:
x-microsoft-antispam-prvs:
 <AM8PR04MB7778253C9642DFFD8CB30D72C5699@AM8PR04MB7778.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 pxJmifdcYkgP+Oado0UGj3TVwRjvyIj6MHlxD8ur8+UswO09xWYEZp5EhjORWj8Ftk9RziMspZ0URe95dwEHK6zP023WMpovvBe0AvFbdzaU9b7tdBJH6SjFfuPU5DTwp7n703H+584PZrvagWPWiBhKwF/Tw423nEXUa7k472yPxgMi+6kKc7iyoxtQZ2UwY4LshtAFpSADhHdZ7Kw45Yd3ZaQ0CCZ03+n85gG5XJCbrHnvbxugoIqi4gzdLEVzt5a6uXPtCZnaa1upxtlv9hoKrac/rNcsoOviCcFDqF+bS2hgFJKd7x/kEXB4sV6B8Epb3F63LBHpC4VwE1yoIIN7dYAeCq6k/99Zq22aSPeUm6ngXFWS823Z4rHli+rkkHJPTLqh8h/xMVsSvvr/fLbZHi3d5gzCwDvqYl1+1djXCD5lV1iSUrEenAa+URkFdkfyV750yHJqu3uTtzsZ/93SAVcGXv/SJYlaBdbT+soDNr55CNYUCS3v3xDsK4CMqQ/HhzYQdcBkd637ZU2L5qgYm8ZbTcY1lyAJewMtfsxB5B8boqOi5z0xlW3xU4TW7egXHyMjoLBFUeCGLbEnprOUn7rHEosVlmIam2C4fPX6bQ35bAe8soSDxOUGMH4biZlpPPWrPA/QY/LvFo30PJwIEEFodQGyqi1rzaTCS2oj7mF5+Qd53O5PCD+36bfP9yrKDqfjMFYvroRq+m662Y5mKbmuXxtqRJzKVw8G8xvcxBRk1jd480UmA2UlY41tsx1+mFskUshs3LDGjKrN1nfOkVDM3E8yid9OZl13ym775nFHf1BGw8vu1aHy6yM/Y6gBHhbpoa77gQA2FBZzxw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5826.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(508600001)(66476007)(2906002)(26005)(38070700005)(6506007)(186003)(8676002)(71200400001)(122000001)(966005)(5660300002)(86362001)(83380400001)(110136005)(66446008)(66556008)(66946007)(99936003)(64756008)(6512007)(91956017)(76116006)(6486002)(8936002)(38100700002)(36756003)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R2g4Y2Y0V2tOQi9pWlBnZnUwZVlKUXdRU3A1Y2dYT0E0b2NrZVI0WlpYc0w1?=
 =?utf-8?B?YU91OVVaQjJjeFBBVytaNWFVclkxcGhRekdXZFJSWGdwbFNTVTdMeHppOTJr?=
 =?utf-8?B?NnFQbms0V0N5UUZtcVpWZ2VUOGgwU2J4c1dZbEI1cUNvK0wybFJxQURWYVN1?=
 =?utf-8?B?UElzOXczZWIzMWVjTXdwa2pENW5haHcvS3lrY3FsZzVVQUpiYUFaSlN3WXBt?=
 =?utf-8?B?SWh5Z2NqQ29FZFI2SUpVSXVhbVd0eGV1MFI4d0ZNZFRPRnM1TUtJamtWOCtR?=
 =?utf-8?B?WjIyOFgzTzBYZnJlZGYxKzI4N1czN2tVUk9jZ0luSzlkSWhEN0FCQWNKV1dZ?=
 =?utf-8?B?MDFRSDhwZERsRE05MC90V0ZsMWd4dmJ1UkQwYXVBdElpN2ZRekpybXJPYXk4?=
 =?utf-8?B?elR3Qk0vY1NEVWh1OTFiOHdHSENVL1pGbUFOZmRiL050anhJbTEwcUJNQTRM?=
 =?utf-8?B?YWp2L21tOW9WUW5kbzVUUllCZEJzRkFkOWtiWmtzRGo3QkR2bGVWVmVEM0sy?=
 =?utf-8?B?aTZVQ1VVY1ExTnA3dXNNa3A5dWE5WDI3amRQM1o3bU9sS3JDOGs4dXQ1MFcx?=
 =?utf-8?B?SnhnMzJwcC9lQ3V0SVphMU5XSVVVOUdaSGVld2FGZFJNV1NLaW1PUXVaVXds?=
 =?utf-8?B?TGpGWCtnb1Y2ZzB6Y0ZHdjNWTHNVZE9tNGVRRnZiRUM5bzhYT0RjdWxzV0NM?=
 =?utf-8?B?dEF4QmVGQlUwUTMwNWh3R1RKR21MTjVMNmNuZ1RocGZhQnBqRTh3TTBCa3lo?=
 =?utf-8?B?QjdqdWVpNDRKQWF2YndDQWRRS1hCMU82UXlWbjRTY0F4aXVMN296SDVKem10?=
 =?utf-8?B?ZVVXWWw0TVRNaFcyb2s1bmdOZDg0S0o2Y3VGZzNwOUhqYVNrempzWUlrdmsx?=
 =?utf-8?B?RndIR1hWa3dlZmZZT2ZZRXA5R1FOaXBSdzgxMGNXNnFoSTNEZXJVRHlPaFdN?=
 =?utf-8?B?Z3dlZlpndmxTaWFHUWswTTRkYXNWcWJ0L0ttZmY1Y2xlSkVKS3BaZTB6VU9D?=
 =?utf-8?B?MXVZOEdXSzdOVWpYMk8yMG55MFVjSjcvWTBVV3VhQUdzSW80UjlUOTVLTWV2?=
 =?utf-8?B?dVBhMjBXTTNpY00rSzNpQjdJUGU0NjNFNnY4WVBtUjBvTHdzSnNvMlR2a1I4?=
 =?utf-8?B?ZDRGbHNKMzJaSitiR21EZEQ0SUFNUk11VTA2Q09xVlFPSHFlNGVMU095SHl6?=
 =?utf-8?B?a0ZkSE9sSFk5ZFBBYk9HRHN2eHJzd3Y5cE1rVkZlL3RyTklsT0xGd3hJZ2Qy?=
 =?utf-8?B?ODdZWDZmMGJTQmZiajRvdG0vcGdVdFFyM0lLVElnQXIyeElmaldzZjVoc2Jl?=
 =?utf-8?B?bXVzOGdmSk02aE84ZXhKKzlHT1g2YVJDRmt1WCs3SlNhUTFPeU95T2xLNTRZ?=
 =?utf-8?B?UXdKRWlLL1g1V01iMzNrOW9QOThBZDRtK2orczJ3UWlES25VczVYSVZLQWxl?=
 =?utf-8?B?TEpUQUNjTkhNSE40SlVZb2xiczRmaEJ1dDVFbXExUlM4QkZETTdEVFlRRFBl?=
 =?utf-8?B?LzVWTXY5U0Qrb3h1R2M0UHVwSEVXcHc3NnErMEE3OWZrNUNmdWl5QWpFNENO?=
 =?utf-8?B?bDlOblQ4L212VDd1NzlyVE5lRjhiOXZtSXk4SlhUODFBZk5FSkR3V1l2Wkhn?=
 =?utf-8?B?c2pKU3ZCVyt3SkRLTnlYSHFYRTlTTVpMUDg3aWRoM1ZlVUVVQTVlWXBjYy8y?=
 =?utf-8?B?dWdUSDV1ZXA4c05kUjEwYlVLSTdyUi8vTUwvNjB4NzA5VXp6Y1RUL3lwTHdy?=
 =?utf-8?B?TUVjbWxtV2lIVTdiRE9rMUlIRXVxbTRBd3BCWnlMS2RtS01kTXgxQndEQkhF?=
 =?utf-8?B?SUgyUlpLSTVWSDFSdDBIbnkrV1VOdDV5S05mVHRNVDFyS2J3M2hpWjlhcUN1?=
 =?utf-8?B?V3JHNjZrdWk0Q0dNY1NIaVoyMkdsRG1Qd0NYYThJUGJaWTZTNEx6K25QeFZz?=
 =?utf-8?B?a2NvSmdtZ05ja0lzSTFiYUdudXBzNU05SXVZL1FJblpzYmlQbFkxM0tqa3VT?=
 =?utf-8?B?KzluRWVYbTJ0VW81OUJpT3RwK2N3cDZCdGRIT25tSVhHMVZicFBKbHI3aGZX?=
 =?utf-8?B?cWtkYkI1ZEhjWEZMWllScjdjNkU0aUJsd2dqT3ZQcUxlZ2djM2c2NHpqdUNS?=
 =?utf-8?B?UXZROHdRWDJyNWFsbTFoRjdrdktQNXNXSG9YQkxRQVEwN2xOR0pYa0Q0b01B?=
 =?utf-8?Q?jM89L8qmqxqovfxRwxHd8jk=3D?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-FYXkzCRXQcUKn0O8fuKJ"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5826.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c180b1-c9ad-4df6-03c2-08d9b580b721
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2021 10:44:28.1691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rmUx5HW1caEawcuv5cl93nG8jh0DoOWvTEgcIvL9CGy5UjSUw2iiqY2uvGCtD7C0oTK0EwFxDVXYbQ/J4gUuBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7778

--=-FYXkzCRXQcUKn0O8fuKJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey! So, I noticed this osstests report and got curious about one
thing, which looks weird to me... If I am missing something obvious,
sorry for the noise.

On Wed, 2021-12-01 at 05:43 +0000, osstest service owner wrote:
> =C2=A0test-armhf-armhf-xl-multivcpu 18 guest-start/debian.repeat fail REG=
R.
> vs. 166941
> =C2=A0test-armhf-armhf-xl-credit2 18 guest-start/debian.repeat fail REGR.
> vs. 166941
>
It's about these tests above.

In fact, from, e.g., [1], I see that we have 2 pCPUs:

nr_cpus                : 2
...
cpu_topology           :
cpu:    core    socket     node
  0:       0        0        0
  1:       0        0        0

At the same time, in [2] and [3], I see that we're trying to run a
guest with 4 vCPUs. E.g.:

Name                                        ID   Mem VCPUs	State	Time(s)
Domain-0                                     0   512     2     r-----     4=
68.5
debian.guest.osstest                         3   511     4     -b----      =
21.1

Isn't it the case that a guest that has more vCPUs than the host has
pCPUs is conceptually wrong and, even if it sometimes works, prone to
(heisen)bugs?

[1] http://logs.test-lab.xenproject.org/osstest/logs/166964/test-armhf-armh=
f-xl-credit2/arndale-lakeside-output-xl_info_-n
[2] http://logs.test-lab.xenproject.org/osstest/logs/166964/test-armhf-armh=
f-xl-credit2/arndale-lakeside-output-xl_list
[3] http://logs.test-lab.xenproject.org/osstest/logs/166964/test-armhf-armh=
f-xl-credit2/arndale-lakeside-output-xl_vcpu-list
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-FYXkzCRXQcUKn0O8fuKJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmGoo4oACgkQFkJ4iaW4
c+6vNg/9G5glysrF8qo4TNGWVYvs3QtRu8ob/rwm6XjX68ByXPHnwGgrSCbtivvF
RgzUQv3RsgcyNMTYBQhwDA31fOELR023YBPMoX8ijS8ADmy+wnwmgCjn43Z4HQz6
x/DSsD6aBTcGAsDQXCyHGD0LG4mo9cFYgXis7RZqV7jiE/jIj3iPGOjsKc4NzSl5
3l+TYkoa+BPO4Wk3qQLWl/CilnK7Cz7UQbUhB8YDbvvePFJS1hKw7NagWF2nPa9J
vYweqGGTPbrK+022B1FXnIrcBKjnD/CBXZKgJ3CHGlpR6yjHE6hKk+p19jHISoqc
XyT09FuP0iqVbdUsE8UYfzOE/yY194M+2I6HYfgFhPSMrICXQFIkNhM45J30B6b8
CpkKApcSS1ncQmOg5DOlBL/w65sq0x+aHjBUGcozSdoQXdoJoO+bfNxct2kYrq7A
uTH6bFIH4twce2GJBvq7hzCP3ikC53pR25xq5JEr5bWxhH6maAFA8/7cujkboekw
9VCHYzfWiWZr1l8vY2ZnHOATHG9ExnxXQXAZ6hzIioIpbYjxqTMtgTX4+cUfzoDa
oQrezJAsDjaMwlk+b27WLSi6FB2B4RBJ0whWRYQBT0U1HNHKdNzR4otQrC+GkpAI
vxPHEQDHX4Rzc81Tm5n5A8QyQK4bSPJP5BsJOBA9zsu+dAIhr6w=
=o/aX
-----END PGP SIGNATURE-----

--=-FYXkzCRXQcUKn0O8fuKJ--


