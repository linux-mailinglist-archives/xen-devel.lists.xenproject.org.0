Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 646DFE6C09
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 06:40:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOxjH-0000jz-A9; Mon, 28 Oct 2019 05:38:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WadS=YV=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iOxjF-0000ju-Sa
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 05:38:09 +0000
X-Inumbo-ID: 0b4ef5a4-f945-11e9-94ef-12813bfff9fa
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b4ef5a4-f945-11e9-94ef-12813bfff9fa;
 Mon, 28 Oct 2019 05:38:06 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 28 Oct 2019 05:36:05 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 28 Oct 2019 05:36:00 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 28 Oct 2019 05:36:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWwSJZYEV/z6wlS/1P47GlluTrNh8ShOCtQJ1LN66qZVmEJ55wsQ68jqK4GxZGtG/Xj8tLeX4Cb6jeK6jFd4z/Egj5MMbSbmwsRC+0phUttBk0zZEelu9izdCHCaXFXADU85LifLFhpzTXRH5wk/Maiq0jks9v4drYmlY/QBmqNyl1kkGb5HRyoBgTJGl3dd2L2qOvzfv5HT6j2pzbTK2hUGTloDnyE/0vQ9HWvUaWjSsjSeIyO6uwyyeaAs+ppEGdBkztd5ro+cDMXyidp4SEkfvXHJW9xW+bZSEdhk2t6BOyHRuFFWncNaBKM9giUDglyLqWAdIQ3VI87hin7bHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2nD5MnP1gRG2t0GmCO67pO/q11DjYpW1CuO21418P8=;
 b=T6KknCH8BV3xaqRsxoCsuoQ/xpRT7XPGlWsRSR4XWJyvYBUpGRM/zvoo4hXazusZr0z1iu9lMytnVikRNleEQA3QN06IcaXHYU3uIZm6T9PyYRfA7m7uEj99HvGx7PKneMAyAV7FQTduD3H2udSpyg9RK5xwbyxpRiJdFz7rIDl8qAeL+M6ubhBMhGrpdzWFX+Ykwv6JeOyS6McmTRgCzviuagxGKnEt5WiHM23umRNlaX2wZZBhLq5pTW8AtBJ88wmiZOzTcKhhzRX2mgSykiAlw+7YwY/vPjKOhRpzaTwE9I7xLmhc+aNYk1SYm1QfgebxUHLwlcO6gqTocuf5TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BYAPR18MB2613.namprd18.prod.outlook.com (20.179.92.214) by
 BYAPR18MB2469.namprd18.prod.outlook.com (20.179.94.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Mon, 28 Oct 2019 05:35:52 +0000
Received: from BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::d899:e5aa:c9be:2161]) by BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::d899:e5aa:c9be:2161%6]) with mapi id 15.20.2387.021; Mon, 28 Oct 2019
 05:35:52 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "sstabellini@kernel.org" <sstabellini@kernel.org>
Thread-Topic: [Xen-devel] dom0less + sched=null => broken in staging
Thread-Index: AQHVTU0h+kfyo+Dyy0KGuLer1mUTwabzJpKlgAYWI4CAAGEIzYABQjycgA64sCOAZm/ZAA==
Date: Mon, 28 Oct 2019 05:35:52 +0000
Message-ID: <114c301a92c942208c63daa5046db4534b95da4a.camel@suse.com>
References: <alpine.DEB.2.21.1908071119470.2451@sstabellini-ThinkPad-T480s>
 <f986544f59e1b2e9fddba5090fc3c706c38e1ad3.camel@suse.com>
 <alpine.DEB.2.21.1908091127080.7788@sstabellini-ThinkPad-T480s>
 <6bc0e21d79c4f02ad89c94fa732a32a57bdc8521.camel@suse.com>
 <alpine.DEB.2.21.1908131413200.30179@sstabellini-ThinkPad-T480s>
 <71cbab87f4929766bf4293419e50425ab62e822a.camel@suse.com>
 <alpine.DEB.2.21.1908140927100.8737@sstabellini-ThinkPad-T480s>
 <78072866796e1dedd9068e4298a13c58a30e74e7.camel@suse.com>
 <197c435e78f47b0deb376493911abdc0922863b4.camel@suse.com>
 <alpine.DEB.2.21.1908231722430.26226@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1908231722430.26226@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [46.193.72.114]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 180c5b64-e166-45b7-d84f-08d75b68b2a3
x-ms-traffictypediagnostic: BYAPR18MB2469:
x-microsoft-antispam-prvs: <BYAPR18MB24699DD7FCDFE4791F140E58C5660@BYAPR18MB2469.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0204F0BDE2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(189003)(199004)(54534003)(66476007)(5660300002)(4326008)(316002)(8936002)(81156014)(8676002)(81166006)(2501003)(25786009)(76176011)(6506007)(476003)(6916009)(99936001)(486006)(186003)(14454004)(256004)(966005)(86362001)(478600001)(1730700003)(99286004)(11346002)(446003)(4744005)(5024004)(2616005)(102836004)(36756003)(6116002)(6486002)(6306002)(2351001)(6246003)(26005)(6512007)(229853002)(2906002)(66066001)(6436002)(91956017)(76116006)(71190400001)(66946007)(66446008)(64756008)(66556008)(71200400001)(66616009)(5640700003)(54906003)(305945005)(7736002)(3846002)(118296001)(32563001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR18MB2469;
 H:BYAPR18MB2613.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z/OIKr2hMJgHw3nbk0xcyPpDuyuJ9WN7Q7g0g8uqt25IZ6FF493U6vfcy5V8ku98wOpd+tgNuwqS1ErAifWFgYQZXEOpzwn64IDxQAay9D+hjEEwisYOUmFYRp4DPnRuxjySygHUL1PWXbGk27BC8z46BjxSh2HkUcmnqmeGQ5AR992i6xNd5hYgREnyZp8PoyyqW+zvav7BSG51ppBgy7wOMoQ5PHgUlfC/YlfqyYaWXFjo4WhUq+mUwNly2OwzvATAMlxp1uWz9XvRxbmofrtnfElUZxWeZPol3kpd03aw9LZCB0+5vdfmS7s4/NoJ1nI/Zei3rUuFBwrz68GhTcQZH+hcdBvpar2oXpE5khB0ghzX/YKHLxYjdLJKpDaLKrWwd9qc5022iua7EQv7OpIfBOKjtv/E0mZXPqJOGImFLM1814FVp/uDB3mQtZ/a
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 180c5b64-e166-45b7-d84f-08d75b68b2a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2019 05:35:52.6603 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GE/AeUoASIzN/ESw4EJSQIQb7twBG80oEfgWaXdavPcH2V6sC6be94q5hWpLjo5AsLoZ5s6K/lyR65AtuAAptg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2469
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] dom0less + sched=null => broken in staging
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
Cc: "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "jgross@suse.de" <jgross@suse.de>
Content-Type: multipart/mixed; boundary="===============7121106877244132513=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7121106877244132513==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-BX1j+CvVo/hOwX/xL4Lz"

--=-BX1j+CvVo/hOwX/xL4Lz
Content-Type: multipart/mixed; boundary="=-Y6WsFMsUBYYMOeisFRm/"


--=-Y6WsFMsUBYYMOeisFRm/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-08-23 at 18:16 -0700, Stefano Stabellini wrote:
> On Wed, 21 Aug 2019, Dario Faggioli wrote:
> > Hey, Stefano, Julien,
> >=20
> > Here's another patch.
> >=20
> > Rather than a debug patch, this is rather an actual "proposed
> > solution".
> >=20
> > Can you give it a go? If it works, I'll spin it as a proper patch.
>=20
> Yes, this seems to solve the problem, thank you!
>=20
Hey,

Sorry this is taking a little while. Can any of you please test the
attached, on top of current staging?

In fact, I rebased the patch in my last email on top of that, and I'd
like to know if it still works, even now that core-scheduling is in.

If it does, then a proper changelog is the only thing it'd be missing,
and I'll do it quickly, I promise :-)

Regards,
Dario
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-Y6WsFMsUBYYMOeisFRm/
Content-Disposition: attachment; filename="xen-sched-null-vcpu-onoff-coresched.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="xen-sched-null-vcpu-onoff-coresched.patch";
	charset="UTF-8"

Y29tbWl0IDQwMzMzOWUyZGE0OTg0OTE1NzNiOGRiNTM5ZmUwMzA3NjQzMjY0ZWUKQXV0aG9yOiBE
YXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgpEYXRlOiAgIFNhdCBPY3QgMjYgMDA6
MjE6MjkgMjAxOSArMDIwMAoKICAgIFRCRDogRml4IGZvciBvbmxpbmUgaXNzdWUKCmRpZmYgLS1n
aXQgYS94ZW4vY29tbW9uL3NjaGVkX251bGwuYyBiL3hlbi9jb21tb24vc2NoZWRfbnVsbC5jCmlu
ZGV4IDI1MjU0NjRhN2MuLmFmMWNmNWUzN2UgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWRf
bnVsbC5jCisrKyBiL3hlbi9jb21tb24vc2NoZWRfbnVsbC5jCkBAIC01NjgsNTAgKzU2OCw1MiBA
QCBzdGF0aWMgdm9pZCBudWxsX3VuaXRfd2FrZShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMs
CiAgICAgZWxzZQogICAgICAgICBTQ0hFRF9TVEFUX0NSQU5LKHVuaXRfd2FrZV9ub3RfcnVubmFi
bGUpOwogCisgICAgaWYgKCBsaWtlbHkocGVyX2NwdShucGMsIGNwdSkudW5pdCA9PSB1bml0KSAp
CisgICAgeworICAgICAgICBjcHVfcmFpc2Vfc29mdGlycShjcHUsIFNDSEVEVUxFX1NPRlRJUlEp
OworICAgICAgICByZXR1cm47CisgICAgfQorCiAgICAgLyoKICAgICAgKiBJZiBhIHVuaXQgaXMg
bmVpdGhlciBvbiBhIHBDUFUgbm9yIGluIHRoZSB3YWl0cXVldWUsIGl0IG1lYW5zIGl0IHdhcwot
ICAgICAqIG9mZmxpbmUsIGFuZCB0aGF0IGl0IGlzIG5vdyBjb21pbmcgYmFjayBiZWluZyBvbmxp
bmUuCisgICAgICogb2ZmbGluZSwgYW5kIHRoYXQgaXQgaXMgbm93IGNvbWluZyBiYWNrIGJlaW5n
IG9ubGluZS4gSWYgd2UncmUgbHVja3ksCisgICAgICogYW5kIGl0J3MgcHJldmlvdXMgcmVzb3Vy
Y2UgaXMgZnJlZSAoYW5kIGFmZmluaXRpZXMgbWF0Y2gpLCB3ZSBjYW4ganVzdAorICAgICAqIGFz
c2lnbiB0aGUgdW5pdCB0byBpdCAod2Ugb3duIHRoZSBwcm9wZXIgbG9jayBhbHJlYWR5KSBhbmQg
YmUgZG9uZS4KICAgICAgKi8KLSAgICBpZiAoIHVubGlrZWx5KHBlcl9jcHUobnBjLCBjcHUpLnVu
aXQgIT0gdW5pdCAmJiBsaXN0X2VtcHR5KCZudmMtPndhaXRxX2VsZW0pKSApCisgICAgaWYgKCBw
ZXJfY3B1KG5wYywgY3B1KS51bml0ID09IE5VTEwgJiYKKyAgICAgICAgIHVuaXRfY2hlY2tfYWZm
aW5pdHkodW5pdCwgY3B1LCBCQUxBTkNFX0hBUkRfQUZGSU5JVFkpICkKICAgICB7Ci0gICAgICAg
IHNwaW5fbG9jaygmcHJ2LT53YWl0cV9sb2NrKTsKLSAgICAgICAgbGlzdF9hZGRfdGFpbCgmbnZj
LT53YWl0cV9lbGVtLCAmcHJ2LT53YWl0cSk7Ci0gICAgICAgIHNwaW5fdW5sb2NrKCZwcnYtPndh
aXRxX2xvY2spOwotCi0gICAgICAgIGNwdW1hc2tfYW5kKGNwdW1hc2tfc2NyYXRjaF9jcHUoY3B1
KSwgdW5pdC0+Y3B1X2hhcmRfYWZmaW5pdHksCi0gICAgICAgICAgICAgICAgICAgIGNwdXBvb2xf
ZG9tYWluX21hc3Rlcl9jcHVtYXNrKHVuaXQtPmRvbWFpbikpOwotCi0gICAgICAgIGlmICggIWNw
dW1hc2tfaW50ZXJzZWN0cygmcHJ2LT5jcHVzX2ZyZWUsIGNwdW1hc2tfc2NyYXRjaF9jcHUoY3B1
KSkgKQorICAgICAgICBpZiAoICFoYXNfc29mdF9hZmZpbml0eSh1bml0KSB8fAorICAgICAgICAg
ICAgIHVuaXRfY2hlY2tfYWZmaW5pdHkodW5pdCwgY3B1LCBCQUxBTkNFX1NPRlRfQUZGSU5JVFkp
ICkKICAgICAgICAgewotICAgICAgICAgICAgZHByaW50ayhYRU5MT0dfR19XQVJOSU5HLCAiV0FS
TklORzogZCVkdiVkIG5vdCBhc3NpZ25lZCB0byBhbnkgQ1BVIVxuIiwKLSAgICAgICAgICAgICAg
ICAgICAgdW5pdC0+ZG9tYWluLT5kb21haW5faWQsIHVuaXQtPnVuaXRfaWQpOworICAgICAgICAg
ICAgdW5pdF9hc3NpZ24ocHJ2LCB1bml0LCBjcHUpOworICAgICAgICAgICAgY3B1X3JhaXNlX3Nv
ZnRpcnEoY3B1LCBTQ0hFRFVMRV9TT0ZUSVJRKTsKICAgICAgICAgICAgIHJldHVybjsKICAgICAg
ICAgfQorICAgIH0KIAotICAgICAgICAvKgotICAgICAgICAgKiBOb3cgd2Ugd291bGQgd2FudCB0
byBhc3NpZ24gdGhlIHVuaXQgdG8gY3B1LCBidXQgd2UgY2FuJ3QsIGJlY2F1c2UKLSAgICAgICAg
ICogd2UgZG9uJ3QgaGF2ZSB0aGUgbG9jay4gU28sIGxldCdzIGRvIHRoZSBmb2xsb3dpbmc6Ci0g
ICAgICAgICAqIC0gdHJ5IHRvIHJlbW92ZSBjcHUgZnJvbSB0aGUgbGlzdCBvZiBmcmVlIGNwdXMs
IHRvIGF2b2lkIHJhY2VzIHdpdGgKLSAgICAgICAgICogICBvdGhlciBvbmxpbmluZywgaW5zZXJ0
aW5nIG9yIG1pZ3JhdGluZyBvcGVyYXRpb25zOwotICAgICAgICAgKiAtIHRpY2tsZSB0aGUgY3B1
LCB3aGljaCB3aWxsIHBpY2t1cCB3b3JrIGZyb20gdGhlIHdhaXRxdWV1ZSwgYW5kCi0gICAgICAg
ICAqICAgYXNzaWduIGl0IHRvIGl0c2VsZjsKLSAgICAgICAgICogLSBpZiB3ZSdyZSByYWNpbmcg
YWxyZWFkeSwgYW5kIGlmIHRoZXJlIHN0aWxsIGFyZSBmcmVlIGNwdXMsIHRyeQotICAgICAgICAg
KiAgIGFnYWluLgotICAgICAgICAgKi8KLSAgICAgICAgd2hpbGUgKCBjcHVtYXNrX2ludGVyc2Vj
dHMoJnBydi0+Y3B1c19mcmVlLCBjcHVtYXNrX3NjcmF0Y2hfY3B1KGNwdSkpICkKLSAgICAgICAg
ewotICAgICAgICAgICAgdW5zaWduZWQgaW50IG5ld19jcHUgPSBwaWNrX3JlcyhwcnYsIHVuaXQp
LT5tYXN0ZXJfY3B1OworICAgIC8qCisgICAgICogSWYgdGhlIHJlc291cmNlIGlzIG5vdCBmcmVl
IChvciBhZmZpbml0aWVzIGRvIG5vdCBtYXRjaCkgd2UgbmVlZAorICAgICAqIHRvIGFzc2lnbiB1
bml0IHRvIHNvbWUgb3RoZXIgb25lLCBidXQgd2UgY2FuJ3QgZG8gaXQgaGVyZSwgYXM6CisgICAg
ICogLSB3ZSBkb24ndCBvd24gIHRoZSBwcm9wZXIgbG9jaywKKyAgICAgKiAtIHdlIGNhbid0IGNo
YW5nZSB2LT5wcm9jZXNzb3IgdW5kZXIgdmNwdV93YWtlKCkncyBmZWV0LgorICAgICAqIFNvIHdl
IGFkZCBpdCB0byB0aGUgd2FpdHF1ZXVlLCBhbmQgdGlja2xlIGFsbCB0aGUgZnJlZSBDUFVzIChp
ZiBhbnkpCisgICAgICogb24gd2hpY2ggdW5pdCBjYW4gcnVuLiBUaGUgZmlyc3Qgb25lIHRoYXQg
c2NoZWR1bGVzIHdpbGwgcGljayBpdCB1cC4KKyAgICAgKi8KKyAgICBzcGluX2xvY2soJnBydi0+
d2FpdHFfbG9jayk7CisgICAgbGlzdF9hZGRfdGFpbCgmbnZjLT53YWl0cV9lbGVtLCAmcHJ2LT53
YWl0cSk7CisgICAgc3Bpbl91bmxvY2soJnBydi0+d2FpdHFfbG9jayk7CiAKLSAgICAgICAgICAg
IGlmICggdGVzdF9hbmRfY2xlYXJfYml0KG5ld19jcHUsICZwcnYtPmNwdXNfZnJlZSkgKQotICAg
ICAgICAgICAgewotICAgICAgICAgICAgICAgIGNwdV9yYWlzZV9zb2Z0aXJxKG5ld19jcHUsIFND
SEVEVUxFX1NPRlRJUlEpOwotICAgICAgICAgICAgICAgIHJldHVybjsKLSAgICAgICAgICAgIH0K
LSAgICAgICAgfQotICAgIH0KKyAgICBjcHVtYXNrX2FuZChjcHVtYXNrX3NjcmF0Y2hfY3B1KGNw
dSksIHVuaXQtPmNwdV9oYXJkX2FmZmluaXR5LAorICAgICAgICAgICAgICAgIGNwdXBvb2xfZG9t
YWluX21hc3Rlcl9jcHVtYXNrKHVuaXQtPmRvbWFpbikpOworICAgIGNwdW1hc2tfYW5kKGNwdW1h
c2tfc2NyYXRjaF9jcHUoY3B1KSwgY3B1bWFza19zY3JhdGNoX2NwdShjcHUpLAorICAgICAgICAg
ICAgICAgICZwcnYtPmNwdXNfZnJlZSk7CiAKLSAgICAvKiBOb3RlIHRoYXQgd2UgZ2V0IGhlcmUg
b25seSBmb3IgdW5pdHMgYXNzaWduZWQgdG8gYSBwQ1BVICovCi0gICAgY3B1X3JhaXNlX3NvZnRp
cnEoc2NoZWRfdW5pdF9tYXN0ZXIodW5pdCksIFNDSEVEVUxFX1NPRlRJUlEpOworICAgIGlmICgg
Y3B1bWFza19lbXB0eShjcHVtYXNrX3NjcmF0Y2hfY3B1KGNwdSkpICkKKyAgICAgICAgZHByaW50
ayhYRU5MT0dfR19XQVJOSU5HLCAiV0FSTklORzogZCVkdiVkIG5vdCBhc3NpZ25lZCB0byBhbnkg
Q1BVIVxuIiwKKyAgICAgICAgICAgICAgICB1bml0LT5kb21haW4tPmRvbWFpbl9pZCwgdW5pdC0+
dW5pdF9pZCk7CisgICAgZWxzZQorICAgICAgICBjcHVtYXNrX3JhaXNlX3NvZnRpcnEoY3B1bWFz
a19zY3JhdGNoX2NwdShjcHUpLCBTQ0hFRFVMRV9TT0ZUSVJRKTsKIH0KIAogc3RhdGljIHZvaWQg
bnVsbF91bml0X3NsZWVwKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywKQEAgLTgyNyw2ICs4
MjksOCBAQCBzdGF0aWMgdm9pZCBudWxsX3NjaGVkdWxlKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIg
Km9wcywgc3RydWN0IHNjaGVkX3VuaXQgKnByZXYsCiAgICAgICovCiAgICAgaWYgKCB1bmxpa2Vs
eShwcmV2LT5uZXh0X3Rhc2sgPT0gTlVMTCkgKQogICAgIHsKKyAgICAgICAgYm9vbCB1bml0X2Zv
dW5kOworCiAgICAgICAgIHNwaW5fbG9jaygmcHJ2LT53YWl0cV9sb2NrKTsKIAogICAgICAgICBp
ZiAoIGxpc3RfZW1wdHkoJnBydi0+d2FpdHEpICkKQEAgLTgzOSw2ICs4NDMsNyBAQCBzdGF0aWMg
dm9pZCBudWxsX3NjaGVkdWxlKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IHNj
aGVkX3VuaXQgKnByZXYsCiAgICAgICAgICAqIGl0IG9ubHkgaW4gY2FzZXMgd2hlcmUgYSBwY3B1
IGhhcyBubyB1bml0IGFzc29jaWF0ZWQgKGUuZy4sIGFzCiAgICAgICAgICAqIHNhaWQgYWJvdmUs
IHRoZSBjcHUgaGFzIGp1c3Qgam9pbmVkIGEgY3B1cG9vbCkuCiAgICAgICAgICAqLworICAgICAg
ICB1bml0X2ZvdW5kID0gZmFsc2U7CiAgICAgICAgIGZvcl9lYWNoX2FmZmluaXR5X2JhbGFuY2Vf
c3RlcCggYnMgKQogICAgICAgICB7CiAgICAgICAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KCB3
dmMsICZwcnYtPndhaXRxLCB3YWl0cV9lbGVtICkKQEAgLTg0OSwxMyArODU0LDQ1IEBAIHN0YXRp
YyB2b2lkIG51bGxfc2NoZWR1bGUoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLCBzdHJ1Y3Qg
c2NoZWRfdW5pdCAqcHJldiwKIAogICAgICAgICAgICAgICAgIGlmICggdW5pdF9jaGVja19hZmZp
bml0eSh3dmMtPnVuaXQsIHNjaGVkX2NwdSwgYnMpICkKICAgICAgICAgICAgICAgICB7Ci0gICAg
ICAgICAgICAgICAgICAgIHVuaXRfYXNzaWduKHBydiwgd3ZjLT51bml0LCBzY2hlZF9jcHUpOwot
ICAgICAgICAgICAgICAgICAgICBsaXN0X2RlbF9pbml0KCZ3dmMtPndhaXRxX2VsZW0pOwotICAg
ICAgICAgICAgICAgICAgICBwcmV2LT5uZXh0X3Rhc2sgPSB3dmMtPnVuaXQ7Ci0gICAgICAgICAg
ICAgICAgICAgIGdvdG8gdW5sb2NrOworICAgICAgICAgICAgICAgICAgICBzcGlubG9ja190ICps
b2NrOworCisgICAgICAgICAgICAgICAgICAgIHVuaXRfZm91bmQgPSB0cnVlOworCisgICAgICAg
ICAgICAgICAgICAgIC8qCisgICAgICAgICAgICAgICAgICAgICAqIElmIHRoZSB1bml0IGluIHRo
ZSB3YWl0cXVldWUgaGFzIGp1c3QgY29tZSB1cCBvbmxpbmUsCisgICAgICAgICAgICAgICAgICAg
ICAqIHdlIHJpc2sgcmFjaW5nIHdpdGggdmNwdV93YWtlKCkuIFRvIGF2b2lkIHRoaXMsIHN5bmMK
KyAgICAgICAgICAgICAgICAgICAgICogb24gdGhlIHNwaW5sb2NrIHRoYXQgdmNwdV93YWtlKCkg
aG9sZHMsIGJ1dCBvbmx5IHdpdGgKKwkJICAgICAqIHRyeWxvY2ssIHRvIGF2b2lkIGRlYWRsb2Nr
KS4KKyAgICAgICAgICAgICAgICAgICAgICovCisgICAgICAgICAgICAgICAgICAgIGxvY2sgPSBw
Y3B1X3NjaGVkdWxlX3RyeWxvY2soc2NoZWRfdW5pdF9tYXN0ZXIod3ZjLT51bml0KSk7CisKKyAg
ICAgICAgICAgICAgICAgICAgLyoKKyAgICAgICAgICAgICAgICAgICAgICogV2Uga25vdyB0aGUg
dmNwdSdzIGxvY2sgaXMgbm90IHRoaXMgcmVzb3VyY2UncyBsb2NrLiBJbgorICAgICAgICAgICAg
ICAgICAgICAgKiBmYWN0LCBpZiBpdCB3ZXJlLCBzaW5jZSB0aGlzIGNwdSBpcyBmcmVlLCB2Y3B1
X3dha2UoKQorICAgICAgICAgICAgICAgICAgICAgKiB3b3VsZCBoYXZlIGFzc2lnbmVkIHRoZSB1
bml0IHRvIGhlcmUgZGlyZWN0bHkuCisgICAgICAgICAgICAgICAgICAgICAqLworICAgICAgICAg
ICAgICAgICAgICBBU1NFUlQobG9jayAhPSBnZXRfc2NoZWRfcmVzKHNjaGVkX2NwdSktPnNjaGVk
dWxlX2xvY2spOworCisgICAgICAgICAgICAgICAgICAgIGlmICggbG9jayApIHsKKyAgICAgICAg
ICAgICAgICAgICAgICAgIHVuaXRfYXNzaWduKHBydiwgd3ZjLT51bml0LCBzY2hlZF9jcHUpOwor
ICAgICAgICAgICAgICAgICAgICAgICAgbGlzdF9kZWxfaW5pdCgmd3ZjLT53YWl0cV9lbGVtKTsK
KyAgICAgICAgICAgICAgICAgICAgICAgIHByZXYtPm5leHRfdGFzayA9IHd2Yy0+dW5pdDsKKyAg
ICAgICAgICAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrKGxvY2spOworICAgICAgICAgICAgICAg
ICAgICAgICAgZ290byB1bmxvY2s7CisgICAgICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAg
ICAgICB9CiAgICAgICAgICAgICB9CiAgICAgICAgIH0KKyAgICAgICAgLyoKKyAgICAgICAgICog
SWYgd2UgZGlkIGZpbmQgYSB1bml0IHdpdGggc3VpdGFibGUgYWZmaW5pdHkgaW4gdGhlIHdhaXRx
dWV1ZSwgYnV0CisgICAgICAgICAqIHdlIGNvdWxkIG5vdCBwaWNrIGl0IHVwIChkdWUgdG8gbG9j
ayBjb250ZW50aW9uKSwgYW5kIGhlbmNlIHdlIGFyZQorICAgICAgICAgKiBzdGlsbCBmcmVlLCBw
bGFuIGZvciBhbm90aGVyIHRyeS4gSW4gZmFjdCwgd2UgZG9uJ3Qgd2FudCBzdWNoIHVuaXQKKyAg
ICAgICAgICogdG8gYmUgc3R1Y2sgaW4gdGhlIHdhaXRxdWV1ZSwgd2hlbiB0aGVyZSBhcmUgZnJl
ZSBjcHVzIHdoZXJlIGl0CisgICAgICAgICAqIGNvdWxkIHJ1bi4KKyAgICAgICAgICovCisgICAg
ICAgIGlmICggdW5saWtlbHkoIHVuaXRfZm91bmQgJiYgcHJldi0+bmV4dF90YXNrID09IE5VTEwg
JiYKKyAgICAgICAgICAgICAgICAgICAgICAgIWxpc3RfZW1wdHkoJnBydi0+d2FpdHEpKSApCisg
ICAgICAgICAgICBjcHVfcmFpc2Vfc29mdGlycShjdXJfY3B1LCBTQ0hFRFVMRV9TT0ZUSVJRKTsK
ICB1bmxvY2s6CiAgICAgICAgIHNwaW5fdW5sb2NrKCZwcnYtPndhaXRxX2xvY2spOwogCg==


--=-Y6WsFMsUBYYMOeisFRm/--

--=-BX1j+CvVo/hOwX/xL4Lz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl22fjYACgkQFkJ4iaW4
c+5zwA//foZ2khJNWKwcq8mJ6LH+yaUdMl5hJFEJoqJsuoykHQP+e+3Y1lae986A
CIjx9jUe7/MLZpmaF5u79Xj84AVpYCOQQJuCAknhxY+WlGp2//r7me+C6Z8EUO9t
RXd+G774syb+auyx8KpzBlxxGlNnnDgGgxw3dP6ja/fHmMWHwa4B/qeHqnUY5dou
5LUa79C5/FWAU+d4inIhEMmH8OiXlCd9yrRcyJbD7vJH+fIVK9LCJRFFEa+9xvyK
7OSISbecOcjFgKBRhDtPxpuyZa10QaWhkFSUQ2H2ht5wwA+Kxj8zOc6toxHZpfQt
Fv4F+K4U36YpN5xiyG67QAH97b5fZ21d3c025p6e8fkghhRbDj4sYpXVBHRzBUWW
1272WigWO/TDvKpaQzWQBgtDrfnBVukj0oog9jTEHeuuXUtXJgVnLK43iMVI5hb3
9CC6fM/KdhIDYYPdK9O8Kh9R+BXUQkvIAffsFZjunweDTsJbt5YY0Vmj50o499Nh
Y9wT1ZqqdkQzaJ/a0Ej+DV3vb61b9zy64+jKv+VWTLSsB+SifQ+dcUFJRfdCKC0Q
ZLYz1n3Z52L2WPh28qJow0+2RTnuxhS2MTgQdwlV/XZV6rXhm0OUlEmAVzjxCtiQ
rBSWCcPwQp9qKJ6WC4nAG+AHN7tS/YyENXPMhNVCNoGUPBP/nVI=
=NW47
-----END PGP SIGNATURE-----

--=-BX1j+CvVo/hOwX/xL4Lz--


--===============7121106877244132513==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7121106877244132513==--

