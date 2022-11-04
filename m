Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B59619237
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 08:52:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437375.691723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqrUZ-0002P0-KA; Fri, 04 Nov 2022 07:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437375.691723; Fri, 04 Nov 2022 07:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqrUZ-0002ML-HI; Fri, 04 Nov 2022 07:51:55 +0000
Received: by outflank-mailman (input) for mailman id 437375;
 Fri, 04 Nov 2022 07:51:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wCXw=3E=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1oqrUY-0002MD-91
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 07:51:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80044.outbound.protection.outlook.com [40.107.8.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c251c73-5c15-11ed-8fd0-01056ac49cbb;
 Fri, 04 Nov 2022 08:51:53 +0100 (CET)
Received: from PAXPR04MB8366.eurprd04.prod.outlook.com (2603:10a6:102:1be::12)
 by VI1PR04MB6848.eurprd04.prod.outlook.com (2603:10a6:803:13c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 07:51:51 +0000
Received: from PAXPR04MB8366.eurprd04.prod.outlook.com
 ([fe80::64e2:acbd:4d56:fcca]) by PAXPR04MB8366.eurprd04.prod.outlook.com
 ([fe80::64e2:acbd:4d56:fcca%5]) with mapi id 15.20.5769.026; Fri, 4 Nov 2022
 07:51:51 +0000
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
X-Inumbo-ID: 8c251c73-5c15-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZB4Hs5mNammhTG6w8IBNqzpCkVZS7N1VyTJZPtf+VSKBH+uhSFO1pjykQHEjPZeSs0qr1aWO96/ieNkoRAGHH/ObsK4W3KZgWPnM/6PQDzmZ+LXMyPDw3ARnxzTNeLnnZ9VKsYBDyWWuYnFIBIVxBV6PKpt3SFMycoKAtuYrzuHJeIir5MilDIsgTAJVd97Dk94xtheMd2PG71uDu2x3tbSPweK+eD9xfdUJaEOGlGa6N/chmWTtEmVu4JaoysL6rspwpysMwseSXWr99PQSEw7VgfwXoVfxeUNC11wuusDKeTGMYSQAkvvu+Cd2TARpWRcajJlJhXpErA6yDvNWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ftcIp3za+qGZukIz8xF3x6GnwAHmm1H+krAr9CGzxw=;
 b=K7D4D1FlbDQTqChe0ecghv4Dv11wmQSuefquQViF2f5klWYXocMzh+mj6fH/FijnMeFeo2CxAyqvYtOJmFHXG9hFXF7LpUI9wYGuXL1M1Vflkna9uIFp8mfnX2xM8Fl6XUKjDCrnI1kn5aGxc4sWe0arUhGE+NZz1qANtxJFypdSxW+ard9PjKuTyk1obeLhdz9HA4YNSqpBkVR/Ziv92HHObG4epPfqphzQTLTRoyfZDHVbx5/XE6Q0ECwKV0NRJj8QVjWF/um2OF7KYV12Zu1JtJfpdL3l46TgejYatvFgy64JkmCpVo96+W2r8lMDntYgEjz0LySypMGK6tXrYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ftcIp3za+qGZukIz8xF3x6GnwAHmm1H+krAr9CGzxw=;
 b=FgsgECDOT7kPBTgukcNTulDgYSe5Nea5021FGVYZaqyY5HRUH3EZfUIqd9CbxuJ90HiBfYkx7xo+6k2VMOTJMuuXJ5tgCyRtVC1XZRw720nM6kl7b6qRJYqsJLBq6ZmkMr12uZTc1KtwvsyqyVvPYqpldZlgLWwIyqiazE4hNOwfxuTmmfkXuneU3ULez2URa2+enaNQ9CEV+ZEhAw4Ygt0TF8NltNRUEiHVhGqDMEVD29Ai+8dzMre9Nw+Kf2igcvXZxgwQlbdjIiRlDi5tKXWkhMEBu3vPpLP9BcJ5MMkkqDoxdpW9MP41vKskmBlEC7drZEmmFV2TdGChSs/sKQ==
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
	"mengxu@cis.upenn.edu" <mengxu@cis.upenn.edu>
Subject: Re: [PATCH] xen/sched: try harder to find a runnable unit in
 rt_schedule()
Thread-Topic: [PATCH] xen/sched: try harder to find a runnable unit in
 rt_schedule()
Thread-Index: AQHY5TlxkxrNiKlOzkijH5MHuuXCiq4ueiOA
Date: Fri, 4 Nov 2022 07:51:50 +0000
Message-ID: <bb2a1d3e50f561f3db11e3367d80fdef0126fc24.camel@suse.com>
References: <20221021103945.4416-1-jgross@suse.com>
In-Reply-To: <20221021103945.4416-1-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.46.0 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8366:EE_|VI1PR04MB6848:EE_
x-ms-office365-filtering-correlation-id: 45f7bddf-cbee-46bb-392c-08dabe396ef0
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 F5WyhFxXjP1dh9BkW1HIKU9fKzhMfhckZh/cvTw5xco2zRe984qVI1+2fIhOTpO2XXD5a8SHoMZIr+tp1JDKRjmFi1IFc5aD/d3oDl7upTPnBCIeo58FMPA7MzrIjkLyHi6tKSWNLXb1Mh3KygjVI9p1GNjrkdJOslIodcb7Wz2LS78txwRh5NGFggKDFlh3G1VEjkTID/blTbfwKFLSYQ+bY5uuqqJPeHcl7xHqJVmTlbNIFw9W/z+QcqOGXPUvGx+M6+Mi0Dqk/wssZyvBxwzLqGvUIwKtfCbo7fu3AJPx2zUFMh+4FyCwuqgio1fidmL4CQTEYMOxf1f1bArB4YmdMI748BW4RBou0ZCQruYZnVuR24PbLs55p+GNO9ze6XjLIz0GlnyN6qxixHs+vwggOs8s9cCtdqW5azY0kfblTZdRHQH6jCnmfH3VeVc1qKj6CPdVeFBawSodFUwoHsw6wn8IWmEvVvhEToCe09iGYYLlxBUcOMHjINyCGMmAl4Pc8Ma7vQgpBv56gYQ9gxQJHEljNPDoT8YmlkA6SSW62kxx6ci5UqI1cwaEylNWOMetMHPweOoeeGuSC2+uv54r/jyoYMpfVwvo0tOV8wXa7KEonFHbhxRueXR8l/8GQcjrbJEa6p4wSHZ+JqbuKdcqglPQ9F8OFJ6MJrYyP0hjaJcWpIkbav5B0aNYBl8ic3XM7CWPfchHvXhBddIzBQKzs8QPCK8qF9vnirXb1jHZiEcisBKObfQqJRz1UpyiwZpTwhWd2Vh/LDtz7Fq86XD/FrIhhzFPP340MEoVSwWTBGlpQAE0HE2F7PkIKbiaVv8IsecUFxJRL+PpQ0GZZKdavnZpjVR00g1JzsMKDMEWGTDjc+Bzf1qCcRSAbtZIW/ScjbfWnY8SWHnXiVfv9Tk8Bbew4noZk7bFnhAb/Izz7TJS2Zw4f1aoFQC0O4Fq
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(39860400002)(136003)(396003)(376002)(451199015)(71200400001)(478600001)(316002)(6486002)(966005)(54906003)(110136005)(8676002)(6512007)(76116006)(66446008)(66476007)(64756008)(66556008)(6506007)(66946007)(91956017)(26005)(36756003)(8936002)(2616005)(5660300002)(4744005)(2906002)(4001150100001)(4326008)(186003)(86362001)(41300700001)(99936003)(38100700002)(122000001)(38070700005)(64163002)(34023003)(37363002)(148693002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SFNyZmZ6MUpRZysxengyVDRXcXYrajNDeTc2N2k4QlV4bzZ5SzIzU2RXQ3dj?=
 =?utf-8?B?U2lua1NTNTZIUDVQcDkreW1MRWZGaWxCMUx2WHBpamxRV3ZQZExaTXFteE9H?=
 =?utf-8?B?Ty9YRE80WmkzRnZrZ015MGFuYmIrNCtjTDQvQWZMM0NydURIeE81RXpWTDFG?=
 =?utf-8?B?WklmZ0xncTZidnljY1c0eWNrVWdCK2xmWUlLWHZrdzNMcjBRc0pHdko4ZktF?=
 =?utf-8?B?WW1OTlk2RGVUVXBrRlA1STQ3M2h6bTkwTk15ajdaRUVpdC96K3BLV3I5SXI1?=
 =?utf-8?B?clVEZkpnTkRzU3lId25RV1NqR3hPRDRIblg2ZlBnRVFjSm5sdHZzZ3RjdzNs?=
 =?utf-8?B?aGJXeFh6VlozVGdMMlZCTDFPZmNOSldEYzhBdGZ2a0ppNEQ5YjJMUFVWKzlF?=
 =?utf-8?B?NUFRa2xlakpXb1JzZ1ROSnlRUmtTdVFBR0dUMHhPaFdFeVBpb0N4ZGV4b3d5?=
 =?utf-8?B?cFdIQXJxblRoZWVRQlBKblVNSkVFclR2dDlTQlduemRaUlJiY3RUcHhScGJP?=
 =?utf-8?B?UXRCUUw5TkNhTEMvM2R0YnRKZmZVdzkwV3NkNk9mNjFqekwyRXRGd2l2ckJT?=
 =?utf-8?B?NXZ6bU9sWFlSUVcrcHg3MmdvVUhyRWF1MHp2Q3g3YldIT0xFdEF1TGZCbTBU?=
 =?utf-8?B?VnEwa0ZnRjlzUHozU2VWTThMYnJtbmgwbjhxZzBUVUZvcngyUnR5dTJCWFV6?=
 =?utf-8?B?bzcybTZidk82OW16Q1FzWklqazM3eDRNKzJlV2hQank0eks0TXQya0o1K2FU?=
 =?utf-8?B?bzFlV2t1NFUrekRKeElTMlpSK0I0NTR6V01Fd3JmelpXUzhTR1lLcnNsckFB?=
 =?utf-8?B?MWhUbHlFTkJrVVRvdGQxTzlnT0tHKzgzdFZtMEF0NXBmVDFkRGZRTmROQjJp?=
 =?utf-8?B?enh1Sm1qTUM0QWlpRHpkc24vOVI5V3hWTEVNSU5SRmFZc2NxT2pYMTFwUllk?=
 =?utf-8?B?NElJUnRFUkZEdXY5Q0RUUnl6VjlKMTg3SWdnOW1WdUpXa1E4MmU4TFBYbzk1?=
 =?utf-8?B?UTFnZHg0amdDZGZsZVVqNldPMzJZNlZsMkF1eHd5WUNTalE1OEJqbTZlbjhO?=
 =?utf-8?B?T3I5R1VhT3loemVzZ3lRaE5lYys5V1FSVG9iUVdpZzhUQXd3SHV1RkpaN1VZ?=
 =?utf-8?B?K2FGT3hLSjFuVi9iUEZCelQ4cGprcHhRL3dScElsSHZGRlpaeTZzT0c5TXpy?=
 =?utf-8?B?RE1YTk9vcThsQXBmbDB2cEVwTlNIZHM2dStieDhOS0Jka0l3NmdsdnR0TzU3?=
 =?utf-8?B?L0c5LytwOXM1M0JBUG00QlZZalptcnloYlZyMlFrbHVianJHdkxTbzUrNkRx?=
 =?utf-8?B?OEZVQkV1a0NncUFEeUw5dTEzYWYyNCtGWVhLbm5LaExoby9WZmtXeG4zMGN0?=
 =?utf-8?B?UnZEcFlqZVNVRld3YjJlc2t5b2NxNVpRK2Y0UUFxbUlqakxQYUxVMzVteVBk?=
 =?utf-8?B?UzNVQ2wrdnR4b1dncTV1L2RPcCs3SUFTa0FacDJhTzRLMHJCZUd4VlpYQ3FC?=
 =?utf-8?B?NXJONWk3Z3cxbXhGVnZlemttT08yNnpzemF5SFh5QU1xdUJxVU02MWJDTnFM?=
 =?utf-8?B?VDRiQjAyNkI0TE5vejR5SWk2YTlzOVVIb0NDcDBsS0M0NFI1SUt5eitCSC9k?=
 =?utf-8?B?UStvWStvcFlkVm5JZ1FCRW9sYjNROFdqaXVCQWUwekpmbkMxdjZ2WUltMjJp?=
 =?utf-8?B?aWRFUmpaZUhwaHg5WDNwbC9ZQ3FoZ01tekpTMjIvUzVwKzVTUm42bXlBU0JF?=
 =?utf-8?B?UGpvMjJmajQrb2JacTF3Y2xsdnp6am9BVjhvdkpNT0JKN1Z1UUoxUUhYMThi?=
 =?utf-8?B?dDRGUTBVUFVkemE0ZUM5RlF5Snd0TUJwSU5MUEwxTVZsOEl5VWNjMGFFekYy?=
 =?utf-8?B?V1l3eUJQSlBDSHBPdjZwSEtFZVFLRFcrT2txaUh0dVJvZkFhalZlUnQwK3JY?=
 =?utf-8?B?UUtMakFxL1RxSkdqQzRPcGwzaStiMkwybHQ1Ty9hTWhianliNFZnRy9NQlM1?=
 =?utf-8?B?bFJDaVgvOUJMUXBDbE05eDNNRVVaRXp5TGZHQjRNTFdid3F1eWVtOWRqNXZi?=
 =?utf-8?B?dVFQUGt4S0kyZWlncW9WWVlZU1FGT25EeGVsdTJUdEUwZDdLTGFkMFJkYUFM?=
 =?utf-8?Q?8sa5sOKv51xTh0RM2EViqgm2K?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-jXCJzZpyRkqPh1ZcSO+K"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f7bddf-cbee-46bb-392c-08dabe396ef0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2022 07:51:50.9371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XbnWTtQBjQ/zaHmaglX0mzv3KfW+BvygfusBksYqZuzLEp2AgXO51QpUnYQ3cO3mLvZSIrTmn7Gjp8HPUXcg9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6848

--=-jXCJzZpyRkqPh1ZcSO+K
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2022-10-21 at 12:39 +0200, Juergen Gross wrote:
> Instead of directly falling back to the idle unit in case the top
> unit from the run queue happened to be not runnable, consult the run
> queue again.
>=20
> Suggested-by: Dario Faggioli <dfaggioli@suse.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

And thanks for making the patch! :-)

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-jXCJzZpyRkqPh1ZcSO+K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmNkxJUACgkQFkJ4iaW4
c+4RNw/9H7XYXESiZffRrAgh8czjStHUgcjEY4MkGT2ZHo/VgVew16DpZCa+l++W
uLItVulxCxDLohCR6jCioL5/8VWvHecuf3pkwfb70VxXJyeDSkfORXEW3JxLqb+o
UdxNK5gMSZdpBYJEqzej4TbqpWdt/V6z3hiokNz8BDlQeF+AIt993QGfPJswhHh7
8CWSZk2VseSxyu6xLVUXH2Da86u/VaZnN4DVICwaqqy4kw5zvB3HSSe3Dtle2AWL
GWFikpQzNyzxcnSgY1KDwNaaj1YaFxmtVgSPRLpFU1KF/tWkRCVYPxTTdWFejQ3A
9ruzrlynGcwK8Q2MjqazcoS8y8YfynOabjJYaRX+0KtHgBHv/K+R8oUH7IM55K0z
K8x366b1Z1h0+8cZupjhgQagqBUf5x+tgOqT2T67KQ9a11rh/+yvAotTPnwDVhYN
84fgMXQo4BJAKJNtc8d/X2aUwq8mKBe53rteOpceHP1BugXfby82omqTIpueWHJF
P95iC+ycZE+vid4un5ZzL/WEihoErFOJMU3jjwM702NiWpD/tpLjaCEX7uXCd/Fs
wHbcvezW7YPCZaBpxyDSLozps8tb+X7Wl8dXuOptlC7qVX/FMSe/bY05k1zAFzVX
86nbqp61r2x9GrjLKdVUBqRZjfKtNw0s/a564+r9NhmrCyJ0MXI=
=oQwh
-----END PGP SIGNATURE-----

--=-jXCJzZpyRkqPh1ZcSO+K--

