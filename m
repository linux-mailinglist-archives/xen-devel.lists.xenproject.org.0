Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF647642A
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 13:09:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqy3T-0001Vh-JB; Fri, 26 Jul 2019 11:06:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V6Fd=VX=kpit.com=raushan.kumar@srs-us1.protection.inumbo.net>)
 id 1hqy3S-0001VI-F2
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 11:06:30 +0000
X-Inumbo-ID: 6974b65d-af95-11e9-8980-bc764e045a96
Received: from IND01-MA1-obe.outbound.protection.outlook.com (unknown
 [40.107.138.42]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6974b65d-af95-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 11:06:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qjn9+z72QT8tWPPqOHOLPp/hPWDHFJiDFtdW7ARQQn1rcGcE9No4lazfHxVcrRe8EqRrEgercibKYKxQ937nGS2snpkuOdiLFxa5CVWMeRaUcmE7VAPT/YuyZKxUGh48tkSa2bF2qyaIpMo8S+jhOIhoq6dz3788UTyC5wypHdqFfaVlakQpRMo/ZMuK3RqdunxPJZiysyMCg+nCHhVbiqsAHq3d7cnsoE/NNtDY2mcw4j9qGF/uo4bT2QfNyZzrIsdtsNaPz8bAUtr4oxC9aq4dBF8uK/SiLWkwGmcrdrrsat2VWqwDh30bb+E+mKTzAd1ZvYY0kNE4n2YHHGuf4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xFhezKNXCzLgCNHrVJoBurVu4hGsby/M9mMsKuN++s=;
 b=FY7d2qVBVIMlBPBo0SKnu/8Ief2/WsfxbCKvSs8q61GA45ATNhX+gdzqNO0qLCM/MA+w8JDytZ9GxkP0+BEECgreOmL3WiQgik3xnZzh8HxCYJsTogANDhsYJd5qDI+wvLOKmS7K0H4YBbmYhEtb/NwOh7LZVOdYDe+tbJ+XlFh4KtcVPsJhUS2qK2QBrXA4lTSIXQxIL37UWwIcaYEQnhOd5JDH4IO+z2Gmmk1b28eu6p9YsBji9VUtJOtH2p3Gmuzgqe8ZXFkFyONW0Q2nyY8VH4u0gcagw7X/mhJuW1Obf3Uy3ChCBdWIy4WoEWwQcOTZUsVlTU/Hd7T9FHTz0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=kpit.com;dmarc=pass action=none header.from=kpit.com;dkim=pass
 header.d=kpit.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xFhezKNXCzLgCNHrVJoBurVu4hGsby/M9mMsKuN++s=;
 b=U53o82/KKLgw+3FFTMSaewJuXeIPcVUxL1N3ksj1nwS2b5wSkzjTZC12RJtClyxWaQ+fPpskXTSJuVTxqNAOJiBoRDDiVSAjMezBWa6tr3CivqeJPAQaZ0S3jIAVUAS/i4HVs8qwzt2XeAyJS1i7sKDDmbBI/lqJ42HKJES3xFQ=
Received: from BMXPR01MB2775.INDPRD01.PROD.OUTLOOK.COM (20.178.170.143) by
 BMXPR01MB3302.INDPRD01.PROD.OUTLOOK.COM (20.179.241.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.11; Fri, 26 Jul 2019 11:06:21 +0000
Received: from BMXPR01MB2775.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7cb7:a3cd:3751:adc7]) by BMXPR01MB2775.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7cb7:a3cd:3751:adc7%4]) with mapi id 15.20.2094.013; Fri, 26 Jul 2019
 11:06:21 +0000
From: Raushan Kumar <Raushan.Kumar@kpit.com>
To: Andrii Anisov <andrii.anisov@gmail.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] Assign dedicated CPU to domain
Thread-Index: AdVDenbAEcdYgDmURkO34xNpwwLmTQAC33OAAAbZv4A=
Date: Fri, 26 Jul 2019 11:06:20 +0000
Message-ID: <BMXPR01MB2775CD9BD5687B896E6D658F8FC00@BMXPR01MB2775.INDPRD01.PROD.OUTLOOK.COM>
References: <BMXPR01MB27756A5FB61F20E8035AE7E58FC00@BMXPR01MB2775.INDPRD01.PROD.OUTLOOK.COM>
 <748a561c-6a59-58a9-0a65-4b8f37b09f68@gmail.com>
In-Reply-To: <748a561c-6a59-58a9-0a65-4b8f37b09f68@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Raushan.Kumar@kpit.com; 
x-originating-ip: [115.110.69.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa18f089-ed2d-43bf-b2b3-08d711b94a60
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BMXPR01MB3302; 
x-ms-traffictypediagnostic: BMXPR01MB3302:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BMXPR01MB33023541709EBFA42C8BCF9B8FC00@BMXPR01MB3302.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(13464003)(189003)(199004)(5660300002)(229853002)(66574012)(66066001)(26005)(7696005)(102836004)(2501003)(2906002)(68736007)(6116002)(9686003)(86362001)(6306002)(14444005)(76176011)(256004)(33656002)(99286004)(478600001)(8936002)(966005)(8676002)(11346002)(25786009)(53936002)(53546011)(45080400002)(446003)(6506007)(66556008)(64756008)(66946007)(81156014)(81166006)(66446008)(76116006)(486006)(66476007)(6436002)(71190400001)(186003)(7736002)(476003)(52536014)(316002)(71200400001)(110136005)(74316002)(6246003)(305945005)(14454004)(3846002)(55016002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BMXPR01MB3302;
 H:BMXPR01MB2775.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: kpit.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PMNd2unhxmWL8XWj038dSs/cQ4ke7Bd6dI2GClp08OKCBC1DRKr3JKfzlUEMeZezqbfKjPp2ERbC9Z+E58D/QbW6wEZHSprtGzdcucNwRrSoMLmQMFvqFYKtCHMlasp8Yt4kov9sSbnBrTEnJ2Tn1JRS7egAy1d/QRmtHrpdaugkbjAuTfhPYbbFSvEXlcSFUb2FgDlKtzs2QjrTuge7ibttaGN+x67HNvQtaGsBz9HALde2Sho9sL88Ql133OWZwYYqB/bKu9C9hXKsp8C8tmowg+F4lzqjxet2j2qVBpQLoC93TnpF8dr6EbiEWDthgcqvBGm3mR9hPmGWIJ2SzTH8kH4ulMsGLGuHr8SQ/mVGqElg7lPojEF2lMdqVDD8MMmiIOZvNpHPVAfGfltSswjm33ZKwRqtaSlt7yvxcpk=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa18f089-ed2d-43bf-b2b3-08d711b94a60
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 11:06:20.7709 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: raushank@kpit.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB3302
Subject: Re: [Xen-devel] Assign dedicated CPU to domain
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgdGVhbSwKClRoYW5rIHlvdSBmb3IgcXVpY2sgcmVzcG9uc2UuIEhvd2V2ZXIsIHRoaXMgZXhw
bGFuYXRpb24gaXMgbm90IGZvciBteSBxdWVzdGlvbi4KCkkgd2FudCB0byBhc3NpZ24gZG9tMCB0
byBDb3J0ZXggQS01NyBhbmQgbXkgbWFjaGluZSBoYXMgMy00IENQVSBvZiBBUk0gYXJjaGl0ZWN0
dXJlICwgQ291bGQgeW91IHBsZWFzZSBhd2FyZSBtZSB3aGF0IGlzIHRoZSBwcm9jZWR1cmUgPwoK
SSBhbHJlYWR5IGdvbmUgdGhyb3VnaCB0aGUgeW91ciB3aWtpLCBidXQgZG8gbm90IGdldCByZWxl
dmFudCBhbnN3ZXIuCgpSZWdhcmRzLApSYXVzaGFuLgoKLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0KRnJvbTogQW5kcmlpIEFuaXNvdiBbbWFpbHRvOmFuZHJpaS5hbmlzb3ZAZ21haWwuY29tXQpT
ZW50OiBGcmlkYXksIEp1bHkgMjYsIDIwMTkgMToxNCBQTQpUbzogUmF1c2hhbiBLdW1hcjsgeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnClN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBBc3Np
Z24gZGVkaWNhdGVkIENQVSB0byBkb21haW4KCkhlbGxvIEt1bWFyLAoKT24gMjYuMDcuMTkgMDk6
MjYsIFJhdXNoYW4gS3VtYXIgd3JvdGU6Cj4gQ291bGQgeW91IHBsZWFzZSBwcm92aWRlIG1lIGFu
eSByZWxldmFudCBsaW5rIGZvciBzYW1lPyBJIGhhdmUgdHdvIENQVSBBUkNIIENvcnRleCAtQTU3
IGFuZCBDb3J0ZXggQS01MyAgYW5kIEkgd2FudCB0byBhc3NpZ24gZG9tMCB0byBDb3J0ZXggLUE1
NyBhbmQgY3Jvc3MgY2hlY2sgdGhhdCBJcyBpdCBhc3NpZ24gdG8gc2FtZSBvciBub3Q/CgpBcyBs
b25nIGFzIHlvdSBoYXZlIGJpZy5MSVRUTEUgb24geW91ciBzaXRlLCB5b3Ugc2hvdWxkIHJlYWQg
WzFdLiBJdCBhbHNvIHJlZmVycyB3YXlzIHRvIHBpbiBWQ1BVcyB0byBQQ1BVcy4KClsxXSBodHRw
czovL2FwYzAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0El
MkYlMkZ4ZW5iaXRzLnhlbi5vcmclMkZnaXR3ZWIlMkYlM0ZwJTNEeGVuLmdpdCUzQmElM0RibG9i
JTNCZiUzRGRvY3MlMkZtaXNjJTJGYXJtJTJGYmlnLkxJVFRMRS50eHQmYW1wO2RhdGE9MDIlN0Mw
MSU3Q1JhdXNoYW4uS3VtYXIlNDBrcGl0LmNvbSU3QzBkZTQyYjQ5MjkxMzRjMzk0MjliMDhkNzEx
OWQxOWM4JTdDMzUzOTQ1MWViNDZlNGEyNmEyNDJmZjYxNTAyODU1YzclN0MwJTdDMSU3QzYzNjk5
NzIzODc2NDMzMzA0MyZhbXA7c2RhdGE9cDE2QTJ4WGZmcjRBaGJxRXA1ZDFvUWFaRHBBRk41bGFX
Z0wwZDljSXNpSSUzRCZhbXA7cmVzZXJ2ZWQ9MAoKLS0KU2luY2VyZWx5LApBbmRyaWkgQW5pc292
LgpUaGlzIG1lc3NhZ2UgY29udGFpbnMgaW5mb3JtYXRpb24gdGhhdCBtYXkgYmUgcHJpdmlsZWdl
ZCBvciBjb25maWRlbnRpYWwgYW5kIGlzIHRoZSBwcm9wZXJ0eSBvZiB0aGUgS1BJVCBUZWNobm9s
b2dpZXMgTHRkLiBJdCBpcyBpbnRlbmRlZCBvbmx5IGZvciB0aGUgcGVyc29uIHRvIHdob20gaXQg
aXMgYWRkcmVzc2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCB5b3Ug
YXJlIG5vdCBhdXRob3JpemVkIHRvIHJlYWQsIHByaW50LCByZXRhaW4gY29weSwgZGlzc2VtaW5h
dGUsIGRpc3RyaWJ1dGUsIG9yIHVzZSB0aGlzIG1lc3NhZ2Ugb3IgYW55IHBhcnQgdGhlcmVvZi4g
SWYgeW91IHJlY2VpdmUgdGhpcyBtZXNzYWdlIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBz
ZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRlbGV0ZSBhbGwgY29waWVzIG9mIHRoaXMgbWVzc2FnZS4g
S1BJVCBUZWNobm9sb2dpZXMgTHRkLiBkb2VzIG5vdCBhY2NlcHQgYW55IGxpYWJpbGl0eSBmb3Ig
dmlydXMgaW5mZWN0ZWQgbWFpbHMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
