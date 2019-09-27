Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D436C08B6
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 17:37:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDsHm-0005YI-2f; Fri, 27 Sep 2019 15:35:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=drc8=XW=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDsHk-0005YA-27
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 15:35:56 +0000
X-Inumbo-ID: 78ee2416-e13c-11e9-8628-bc764e2007e4
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by localhost (Halon) with ESMTPS
 id 78ee2416-e13c-11e9-8628-bc764e2007e4;
 Fri, 27 Sep 2019 15:35:53 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 27 Sep 2019 15:35:12 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 27 Sep 2019 15:34:43 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 27 Sep 2019 15:34:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=laIoIwbdYc2oBykLVJ+dSM4TrlM7TUfXd6A0Xz6CshC1zMaISZCeVOUY9iM55kVACRs+Ppmcl8/ZCXRS81XDymEBFKVZ1y7VHO6MQ86TJU6+S+vA3ULQAJDbYkxRcVax/4YID2Jw5rpzGKtUfJYGpNwgXBICwL656uHtfD1H1roBOSUdlMl5THRS2ZzSL13q67j50cvQzYOpLGRtL+RejyrQVeZSeyNxnHiCWnBxYHWCRiedtChjPJlZTAKvmm5oe5n4FnKQBE9Z4QWYRu5QYhghK0uAJ5Wk37grsfSffQ3mX8C6s9lzRxvxfApelCO7eo13BN4DcdKywYFWfdDPeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcbu0SCvP0rLn0iKDo9Ek4rMvKG+/FRBx35S77MGwuk=;
 b=oEcC7gFT7Kc5q8GHlRefwk0baSwt4j97x7Gv2qKYBCqy7DcV/IrwxG2DvGZIQXuG2WUljrD1VQrlXod4RcSczlu+kJPm04H6bddvxgMdXHqV2mlSM5fdfVfgHdc3kLDY5kGoRPd9Brd4H6wubBeIqjqWcRT69v1BnFtNXoQsw3ptAFn+yrDYebPvcEmmAoXOFiySOspTDFngXfa2t/y5o7/1zY6B6tX6x6rExUpcNxKv3iH9Db6VNpL5sQuAKigei5LackQDOvr7T+dC0TwcU+MrwBlsEmazK0hu9QUKDPjwIpXiQMYObkdTA/iulD1kXY4Vn+DUVDrKE6qWLTQqag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BYAPR18MB2613.namprd18.prod.outlook.com (20.179.94.142) by
 BYAPR18MB2695.namprd18.prod.outlook.com (20.179.58.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 27 Sep 2019 15:34:36 +0000
Received: from BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::24f0:71e8:38d1:4d8d]) by BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::24f0:71e8:38d1:4d8d%3]) with mapi id 15.20.2305.017; Fri, 27 Sep 2019
 15:34:36 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v4 40/46] xen/sched: split
 schedule_cpu_switch()
Thread-Index: AQHVdQFwBEFn6640QUSdWymfG5sXxKc/qByA
Date: Fri, 27 Sep 2019 15:34:36 +0000
Message-ID: <17753ad5563d20bdb60ea1f1ed10b3a0679ddd56.camel@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
 <20190927070050.12405-41-jgross@suse.com>
In-Reply-To: <20190927070050.12405-41-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6acd2346-8a4f-4bc8-58ee-08d7436033de
x-ms-traffictypediagnostic: BYAPR18MB2695:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR18MB269549B45F950F1663A3C8DBC5810@BYAPR18MB2695.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(199004)(189003)(118296001)(6246003)(76176011)(36756003)(99286004)(66066001)(256004)(26005)(4744005)(186003)(25786009)(4326008)(71190400001)(71200400001)(6506007)(102836004)(5660300002)(6306002)(86362001)(3846002)(966005)(6116002)(2906002)(64756008)(6512007)(229853002)(66616009)(66476007)(66946007)(6436002)(66556008)(14454004)(66446008)(7736002)(305945005)(6486002)(8676002)(8936002)(2616005)(446003)(81166006)(81156014)(11346002)(54906003)(91956017)(76116006)(110136005)(476003)(99936001)(478600001)(2501003)(316002)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR18MB2695;
 H:BYAPR18MB2613.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rWjja4HLqHBq9DmjcS5CtdHkwwf97+WHv7gLAaxpbcPcmy0KxpCwtCrWfC34Sw1PqDLGcDaS9SJIXKvP+CkJ6eMHtOw0gp1xuIyq1ZM9ZL/idf40YTyOJZue62JVhU1kls/kz+GMaB+lW7hG9nKL4Q9pf9R30p23+xsk6nrwn61WjHYrU3LxEW+fCjeTQyyQsfc19QiyimyiL1Ksp8gCxgraMRmLmncRIEaR0YMIprJ34844KAxPGi3yAnj8IrnIaWO6r0SNc0mdcNW2GsxFZYUf5/pfphmpTdhbNOPZZb5HB+KZRPSrOuFWSdzhZntbvpXOWoEPVTS3IRYMTCBxidYRNsw2oRKTw5dk8cFbEOEa/GO53dB8/ZR7VcFBErTw6pm/PhjRCe+YhVWVCq7SQvtHllZxeqQJv/fskamq1jE=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6acd2346-8a4f-4bc8-58ee-08d7436033de
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 15:34:36.0546 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OoFANKc6TnBuM+ZDrsg9VFcTMLCmIuulJ0T/2z8EkCbBo1pGm5Gkz3unxxOu0U/tJEK8kFlHcMpwhVc29Wtshg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2695
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v4 40/46] xen/sched: split
 schedule_cpu_switch()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Type: multipart/mixed; boundary="===============8158532750639090710=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8158532750639090710==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-6EDwi8ds9xKpOtntbmZB"

--=-6EDwi8ds9xKpOtntbmZB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-27 at 09:00 +0200, Juergen Gross wrote:
> Instead of letting schedule_cpu_switch() handle moving cpus from and
> to cpupools, split it into schedule_cpu_add() and schedule_cpu_rm().
>=20
> This will allow us to drop allocating/freeing scheduler data for free
> cpus as the idle scheduler doesn't need such data.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-6EDwi8ds9xKpOtntbmZB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2OLAkACgkQFkJ4iaW4
c+4q3hAAiiT0ce50lixc5K2QAMKxUxHFfpvd9Bbfa9+0/z0JAnOrr4KI3T0yqDCv
f6/EunmXJ1Icx03jigSxojDrsjY3eR0YJkpcgQJQQquxNBf0/B4D9+VN37xOFFAT
5qrtWvHc0JUqqXqFul4NR3njlzSiRa0nl49iO/865eCx2Aacu/lAs3uoKjj/5qAX
kI6A7BjGVe1yjCz7y2vhAIL0KPZnEXVuAJbpN64ebzlKlFSiDesuBXtn5p5K8K6x
z4N8dwfMbIuc+o0tRVS9lk2McC/lcpfDfbXtIuyrOrJ4k9PGuFsOVTMV1xrUZUOK
WVY3HlPDlFhI2L0DwyvWqScbkjy71BMgmBdxv5knIDNo/lPZWIwNr5Xi80jqy1Y6
lp7garDqTBVYgA6bRRIb6ggxdZCtcePoBTA0HiOB0Yz4hRWaXedDBL61kYx7ckce
ECAvFsDcHvQD8dZwF3qu6BimUkxHX8CNI4a95zb12TBBhM0K1jYc8Lu+n78J7ZHn
zEv903XMTvPP61ePUHqKvQk+XwEl7J+2BG7zzVfH/nHGEEGJoBV0Ukiiwa71meLk
/nF2c1xhE5lMHDJbeNBr5trGVO0iYzgh07b7MQBz0dMwFuPUIySPQYepB+5WRG/d
OtEDenYJ+7gXl2/feUM1Vv2ZR1MliA7jRXkO5F1yGAOdiuZFDcc=
=lGRw
-----END PGP SIGNATURE-----

--=-6EDwi8ds9xKpOtntbmZB--


--===============8158532750639090710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8158532750639090710==--

