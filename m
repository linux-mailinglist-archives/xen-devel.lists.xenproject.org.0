Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A50C5B03D2
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 14:21:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401481.643336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVu3W-0003FU-IF; Wed, 07 Sep 2022 12:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401481.643336; Wed, 07 Sep 2022 12:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVu3W-0003D0-FL; Wed, 07 Sep 2022 12:21:22 +0000
Received: by outflank-mailman (input) for mailman id 401481;
 Wed, 07 Sep 2022 12:21:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9IxW=ZK=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1oVu3V-0002fR-CV
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 12:21:21 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70052.outbound.protection.outlook.com [40.107.7.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9474db0e-2ea7-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 14:21:20 +0200 (CEST)
Received: from PAXPR04MB8366.eurprd04.prod.outlook.com (2603:10a6:102:1be::12)
 by VI1PR04MB6814.eurprd04.prod.outlook.com (2603:10a6:803:138::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Wed, 7 Sep
 2022 12:21:12 +0000
Received: from PAXPR04MB8366.eurprd04.prod.outlook.com
 ([fe80::641c:ac6a:61d5:3fe7]) by PAXPR04MB8366.eurprd04.prod.outlook.com
 ([fe80::641c:ac6a:61d5:3fe7%9]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 12:21:12 +0000
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
X-Inumbo-ID: 9474db0e-2ea7-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F01Gxl0KU/hQa493OLt988GGKrWqEBUWcTEQaQkoSD1SOotHWfNree0robNa3BXQTByIuq5Vb3KayzQthPv6fuY4Emvk1PMEW20j+wutt1KpI1gh7OiOEJTlgwC3bF6+A6PYISieKnDuTK2x8L66q6622FuQ+NxY/0wUD0Aje36Qxq8Xjo7SukTtdeGt38YlY7Lr+5ib0xJSVeoer+zOY2lLYgra1Z/Qcy7EqSZnOCN0c4yTXz2hC3cxHrt8ecU4k/eRby9jf/iG7MeFsfW5j580ZVf+PfYdGs2AcIOUmz2r4Cn6+3s0mSBrhy8Sm9LZ4PVzAvhJTi3DRvx/a82A5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWddY4Q6qqsq/LH/mjnyD+YLS3YUR2OiGTxkBsj+yPk=;
 b=lK6MbSMt1ucovaUs2zYAFZfLk0JTarUiRW3EF/gWlm5GvQEso2xu2UPEkvhVe/wB5V3dxqnomL9cQ9JoVZ2rfE6CDBgeveMv33GlPHhGl7+tVb2cIcoqZgRv7c/ng9LHE0dyzGR4PdEreje9Rkrup8UtQlB+yLsvn59Tz55JrPGMQ1pMfjLfyJi9dp+/gmtNTL5ZOfsFt3AKQ/DYgPNdZUuU5L8/JpKx0Bls448UcY5IwqmZmN3rsog1GDe4pWMDSkA7QzL+NI/9GR0SUlfJcLFGsFbw0lpMQ53koMFOCaVoRx488VNN8+CYl2hkWeS/K7WXpxQdEuMoaxR+4g0XcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWddY4Q6qqsq/LH/mjnyD+YLS3YUR2OiGTxkBsj+yPk=;
 b=RbluK424aAwuJ5ulBgLa4nWxWLnfDlcV3jRpI5Tp3YMUQC+arYoVLADTWs5OC9p8g48EQ2/2FSVDc5muycDaKzaB7QdSu2ccnYo6SEAVr3T1uUf5oGVn6Q5nQm/FI5iFx1hzaKfLcQeeQgaXFSMZlqDLO3iP9LTj0EZyRAhb3lr5zmvr/ub/xBZOvj4uFe4uWFnE2x1KWECA/MFY7Etko2gmbAZMXn2/sqirO/FOWGzk08iGIKmo54t1b25O4qT91q6BwTqtavhkDL3T6jVoC8blq1zef36e7l6J/uHlpiz678eRDdZKLsxHLiDJDn3bfrCsNdDX8TndJkFeDafotQ==
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, "marmarek@invisiblethingslab.com"
	<marmarek@invisiblethingslab.com>
CC: "jgross@suse.de" <jgross@suse.de>, Jan Beulich <jbeulich@suse.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13 and newer
Thread-Topic: [Xen-devel] Xen crash after S3 suspend - Xen 4.13 and newer
Thread-Index:
 AQHW93b4k3weXeYNNEuLGR1VNLs/K6vMZmaAgfCc0ICAAYdDAIAXU1KAgAANeQCAAY5wAA==
Date: Wed, 7 Sep 2022 12:21:12 +0000
Message-ID: <d2ca7b0c127e91837d74446ce6f4d576e3bc83a7.camel@suse.com>
References: <20200323000946.GH18599@mail-itl>
	 <20200929142730.GA25731@mail-itl>
	 <d243c1b5-712d-a958-0b6c-b232eb4edc80@suse.com>
	 <20200929151627.GE1482@mail-itl>
	 <ea53b845-5edf-a61e-62ae-7ababc30b3e0@suse.com>
	 <20210131021526.GB6354@mail-itl> <YWHDIQC3K8J3LD8+@mail-itl>
	 <YwJZ3X0HpT9w6Veh@mail-itl> <31f99f6b-0781-795b-731b-d5a9f1105887@suse.com>
	 <919e328a-000e-0eeb-2253-6a4381b5ccaa@suse.com> <Yxc+fIlyKWU94/VM@mail-itl>
In-Reply-To: <Yxc+fIlyKWU94/VM@mail-itl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4 (by Flathub.org) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8366:EE_|VI1PR04MB6814:EE_
x-ms-office365-filtering-correlation-id: 64aeb0de-6795-4d0c-de93-08da90cb7430
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 j2mAGkKARt96g5GF867JznD2xRa8HQ81auclpQKRWMCk81UvMTcJQcvA0oV5Dx5qAy6qaFmNjFDzH10EcTbb3jcckO5KV/EqXVOCj5xUEDgOvd9w5cP0/0/sDtJgys2c1rgPAEZYvD+ofABOJEnKPJulncAgUZi3rSyhTVKsHVJ72ZkpoTRmOgQX8CuiSfIMacO1uK5OkigEhdDWDXFKS+sz45ghpBgrsex+eX0p7LTHjhRXKIb3WcXrgAWHfQ57UGYLyxEHHcDMXluo5uBLby9DxdUGKo4o/yBVcaFg9U3rRpjEElf0emnZbntcJq6AXOtXnyHyMuiSs+w++45oLQQSqdyuMoxQfTbJuqFav2ZyUGhPduHrNFs2agR9GhgPL0POjYsYtz6BHDyz2NtfmqYMVQDkprkKjEfuc6vPMOrpfeiKBUb6nj5HfWf+G6gqNS+78bBGzb5+QQMQYeNa0lOp/A3P6M5tAJS5lq+vLZrfhY3HL4sp66nv4zyn3NtNhr04RaMxudooMr7QbDRwnxFOyQ9TEYdblBhI/CpKREOC5ZRJd4Mj7A3dRuDigUXhL/ERFCTYG5PS7skUtritFZd/RFSVC8SswwtfoflCdwjintVwgV2GMdhGFc1bFpqA7NW40YgKN3HqXBcBUi5U1C23CiRqWo6yjoM90rRByP8IIl/4FXd/RPd9o4jkBLZi9osLDpKqhjwIj4QPIvF/r74fa1dvXYRkziQdkWzn6Ec6i7WzdWLKla+rFvHklIWNJfqvJIGvG2lu9MjlDCSrhc7kLICPh2e0xDylsqK/zyIIPApQlSvHIpQA+rJMdz5w+9lwm6PVAkJfVJ57fzFJDQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(366004)(39860400002)(396003)(376002)(110136005)(2906002)(316002)(186003)(66446008)(5660300002)(54906003)(8936002)(4744005)(4326008)(66476007)(8676002)(76116006)(64756008)(66946007)(91956017)(36756003)(66556008)(86362001)(6486002)(966005)(71200400001)(41300700001)(6506007)(478600001)(6512007)(26005)(2616005)(99936003)(38070700005)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UjhreU5LMU45UlpFSWY3Z3EybFM4bG1Qbkp5M0FZOGZ2TSttbW92RFo0dUF5?=
 =?utf-8?B?RklBQzdsRmtWNnpId2hPZllIUFMrNWZROWJ3TmM5U0VBMFdqeUlYYXppckg1?=
 =?utf-8?B?SzdpTm9hZ2l5MS9vaVd2bVBhOUR6NFQwT2NGVlZSSXpkeEc4RGtxekw1ZHpz?=
 =?utf-8?B?WVZWNXFCZWdoTjJZMC93SDRKUG9HeVhxOWRKMk1xR2VhYmFOVlpiMmQ2MTJs?=
 =?utf-8?B?WjM1V0hNNW56ZURsUlEwTnNORlZUR2MwMC9xeEtFOHlVd2pMSSsvNmIreXMz?=
 =?utf-8?B?WjkxNHhORm8xeWxKcThRdkk3c2hoNmdYd0NqR0tHaTQwK3JidUlrSUluVmts?=
 =?utf-8?B?Wkt5ODYxcGxGRHhlcmxkL1BjdXRZb0RlTkVwN1V4SVBzZUlHY1dNcllXYThG?=
 =?utf-8?B?NklDV3lFVG1kUmhrdGNnYnpvWERkNGx3UWpuVGVPMjJNYUhoMTA0amVSTHVW?=
 =?utf-8?B?WDdGMjZOR3MyVW9DVUEzemNMVC8wUTdYZHU0S0FiWi9xZkFSc05SSndEL2Vq?=
 =?utf-8?B?aUNvamJBOVpQMFo2ZDJKaWEyZDhtSmN5b2ZLTjFSNHdxMXBnU3FrcUNwd1J0?=
 =?utf-8?B?bm9Sc0I4V3VENkMrR0tiTkp3VWtlWFg3MGd6bXVJTmswVXRmaXVHZ1FTRDJM?=
 =?utf-8?B?enhZd0d0TWNtNVExMkpxS2Y5WjY3RDdQTHU4aFZHV0paQ1VsWmt0bjFwZXZX?=
 =?utf-8?B?T1lhMUc3MkZ5VFByWmtKQjJwZkNSUmUzbDlrdHdOc05mUkQvRkp6ZzlCRCtC?=
 =?utf-8?B?aTBraHdvM2orWkU1dnRBY1VqMWpaWElacXM2UVQrNzVTT0N1cDFURzJZK09v?=
 =?utf-8?B?WU5vU1dSRHNIYjljRC9YLzdreGRLT3dqUGFIaTJaUzkwMWRHUnVMTThVRmkw?=
 =?utf-8?B?THQzRjdNUDc2OGc5WHBoZ051OThzYk54UmQ4bDR5TzZBYjVxRnBpT0FXSTdO?=
 =?utf-8?B?WHVHQzhqSFFUTXh5SmFLZXFmZzF3UkdtclREU240TFI0UG5ibDNuWmNRTldC?=
 =?utf-8?B?SkV2UFRRZm1vMmxoYk9UaU1BSkovQTc1RjJuZnVscHI2TkR3TWFNRlhjbFUv?=
 =?utf-8?B?dTM2RUh3bC84ZVlwVFYrZ25POHdMdC9YQmhvbmFGcmFpckgyZDVsSGg1YVBT?=
 =?utf-8?B?QUlRcnJ4dHNZem16WFdqamJjQ0FkRkhoMFczQjRpOEFSVDNIWUZYOEtBN0xm?=
 =?utf-8?B?NDg2ZDRYWVlGeVJkYzV6dlF2SlA1MjcxWU1zMmROYkpEU09tTGltbmpCMkQ1?=
 =?utf-8?B?WjJxMFZyQlRRT1p1MTV2UG5UeXRhZkFHQ1l5WnJNQU1SNE5oNnhjR3d2dVZT?=
 =?utf-8?B?bHM0WndyczVEd2FPS3JlQUpFUVZpK2tqK0IxZ2FiOWNTRkdpNkVVa0sxTVpD?=
 =?utf-8?B?cmtnUmhtb1FIc1h0ZmZRTFk5YkszbXc1dGhnNG5uckY4QVNvYS90SWNRUFd6?=
 =?utf-8?B?a3dQTUFrTWlXbWI5WkVLSXRpR2RBV1ZnU1hzeEtkK09GZW5sblR0d0pwT2F2?=
 =?utf-8?B?aFlycDQwTm1UV1RJWFBYdjR5Rm1iQTlwWDJLSUJ4YkordG8wUFd1RDlqbVJv?=
 =?utf-8?B?UnN5dlBFVXYwYTJIeENTNjhhMzhNZXZDeGxQMGpORHJjeXhMWFkxalVZUEsr?=
 =?utf-8?B?QjdTQTdMNkxYK1h6cStnT1pZVWxGQnRmRlFoVW4yeU9UQ3ZzTzZaVkY1Tkky?=
 =?utf-8?B?MXMvNXhwSlZScFRPaDBBSUpjWHJlV2xtYW9JWEQybkdBUnFKVzdOODIvRU80?=
 =?utf-8?B?UkovMncrS2lCM2tWcHNxejMyNm9CYloydkFDV3ltRUw5VUtsbkVIbG56ekJ5?=
 =?utf-8?B?eWVEcXo2bjUxY3VPejJJem4zd1JGbGsxS3lJSXVaNjBrQ3hheW1ZSjdjalVP?=
 =?utf-8?B?Skd2Q1duMDA2ZHk2VWJXdnlSa0pCNXdEaUFFMGFpL2doSU44ZFk4TExFVVo4?=
 =?utf-8?B?SmhLRlgrVHAzTDJHYUVWbCt0YkN4b2NkVnMrdXNlSGVERXFRNmZRUlM1dEZN?=
 =?utf-8?B?QXdXMVZudW9haGVTTmpBOXcvQ0RjWE01M3pidTBKdFJZaXUrelFiNXc5Rkl6?=
 =?utf-8?B?SnlOQ2lDOEplYkF0cG4vU1Z2Uy9OMzZQZnN4elZtNCtUZWlQejU2Z0VoOFBi?=
 =?utf-8?Q?v9GVZ66OzA40YCJWmYjdoAf1k?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-iwByakttiUE7SAqSE2Fp"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64aeb0de-6795-4d0c-de93-08da90cb7430
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 12:21:12.7841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ygr+qBmmbamtwReA/6LtvX4N7Has4MuZTlEx+fbaSVlWpwee4UecP/EppDbdjWn54fAuzvj5BJNzApHVEIZvPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6814

--=-iwByakttiUE7SAqSE2Fp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2022-09-06 at 14:35 +0200, Marek Marczykowski-G=C3=B3recki wrote:
> On Tue, Sep 06, 2022 at 01:46:55PM +0200, Juergen Gross wrote:
> >=20
> > Could you test the attached patch, please?
>=20
> I did a test with only dom0 running, and it works now. It isn't a
> comprehensive test, but just dom0 was enough to crash it before, and
> it
> stays working now.
>
That's very cool to hear! Thanks for testing and reporting back.

Just to be sure, did you check both Credit1 and Credit2 and do they
both work, with Juergen's patch?

Thanks again and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-iwByakttiUE7SAqSE2Fp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmMYjLgACgkQFkJ4iaW4
c+7Rjg//UP/9DiA+iUvb3QE2QLKtgf8bzYBtlhNfRZY+Gf1DcIFXzeaXNddpdrpy
79Q2FtsD4FWTXZI6XC/fkhnbDTLzOoTobmMDUlcVZwSq+eVcgi6yO/MkwvfwrpAm
GhnheIywZtt84Xsr+s8H5jKGbtMln1tyBuH2GHGiu1rryc2KyNQs1DVfpnZg+FoK
3S7CMDCpRlubsYn5V74X+PQVsbaB96ifuDRsS3RUbkBjmCxm7PPnoTrX+6KO5pXS
2Vtfxp4PfySALSUt7VuYohelp//qC1n4lGsLXeKsKiteJGdCNmmUoYTRl0HAvvMS
yhGDKqaw1jdS8kbLhSun9odqHyy9+IciF7fCwj4ejpqOW13zD2GBBNyxNrJLZVEy
//XtUKltQbGsPIPICAJ9AmKakutj8jpVfPUOyXJdyOmual8BpTXb7pSk+c7wASSN
4NAeYyQNR7SiesYDvWcDBGkkhJmoxcrMqAk+ImewzQUpZK1+0sAcIXv5Sl50f7qe
yc6xiqguIrDXHW2aSILmmBjIQIa2EHoeJ4xFXNHXKMLy4xQeSNT/cS7qbIFHpCOx
xHJ3BaMyC8YK0s//iEUAKrAQIuJURNklfDrWMqOLJQfl86rNY0ZiJ0WLPbBUe2e2
oMB5miivt4bygLf+7WOwyUihCoAQnbFZajRjeVzON/MEuufaeIY=
=hKzN
-----END PGP SIGNATURE-----

--=-iwByakttiUE7SAqSE2Fp--

