Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8685270DAC
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 01:53:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpi4H-0006Rz-2u; Mon, 22 Jul 2019 23:50:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SGOe=VT=cs.rochester.edu=ejohns48@srs-us1.protection.inumbo.net>)
 id 1hpi4G-0006Q5-5c
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 23:50:08 +0000
X-Inumbo-ID: 6c177296-acdb-11e9-bc21-9fb9ea9eda87
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (unknown
 [40.107.72.138]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c177296-acdb-11e9-bc21-9fb9ea9eda87;
 Mon, 22 Jul 2019 23:50:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WC+r4WKY2IkanpERt6b+O7CX7hGu3oYq4hhvXk4/MDdzZG5H8OCSLBTgtmV0O7vo2BFgYt7mn+FVwoc25KW+j9zuM/dl5QD1sdQIPOXi/jCoqOdBkBJHet8DtjIzSz2Uhg26IpK73TOyMDYFTfrGAVnuD2Q9TmUHnE6eP7GAR+37Ix5yEB1ahizYVjCW3fNqT+73uhf1MSZ4d/zEbZPPj14spwwHtoiEyySzPweayiwnNuw52VuTpE7kJi6YEDqKbv4hOmH5vWoofbyt1hynguzkKpFKNPvbHOdtRU2al8KydP4wIWo0CLupyCGMATny/3NNdK+wmv+oKYj2tVe++Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIcV1Gp1fMIpQuZGJAIBSVClSlkKuXfFDyJfVeyWI4I=;
 b=M/1myADaSFAMDZmEagdXioRvwnpjPZnjJOzicR046fjC358F9wK4hByH1H3B0pyI78RGCvnrb9gjg/V+s60eA05FWJS/zt3eXUXQZ2VhF977abafBFbrU011F6cPEQDCOqSEDK7pAzReBtl6xhpnsVu1JPepmz/boiqIuKRSIvKzxxN7j2aJoeTR1vJJt14Y+XTHfb6rDBqcIiKPXADXXSu1vcPd4sIV43PWhMmRlkW7nJirJvgV8qNIFOoKbOc1hJaYcybnoLmKam2vPnF5Vwbt19e4o9iKqQVHJJZzh0swBZwB3jZklSmaeNs4yLNjmua7TsOLZGf7KT3pXb9Ewg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=cs.rochester.edu;dmarc=pass action=none
 header.from=cs.rochester.edu;dkim=pass header.d=cs.rochester.edu;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uofr.onmicrosoft.com; 
 s=selector1-uofr-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIcV1Gp1fMIpQuZGJAIBSVClSlkKuXfFDyJfVeyWI4I=;
 b=zeaoi/FcLmSbogtxgqvYippfdVBkcz0jWHxAYbhTNkicBfIsNTjWKSf7XOZIRaZ72RdGstqPHa0Mom6PtO/LYew4+fXabvPgdNlAV/Pc8AjkuyRRwTRHXEckOK1+QhDe9Va3eJveaO9ENDlUOg6TlrOcDgD5KW6SvSRa/yChWiA=
Received: from DM6PR07MB6396.namprd07.prod.outlook.com (20.179.69.208) by
 DM6PR07MB5676.namprd07.prod.outlook.com (20.178.2.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Mon, 22 Jul 2019 23:50:00 +0000
Received: from DM6PR07MB6396.namprd07.prod.outlook.com
 ([fe80::5165:4092:7216:5c1c]) by DM6PR07MB6396.namprd07.prod.outlook.com
 ([fe80::5165:4092:7216:5c1c%5]) with mapi id 15.20.2094.013; Mon, 22 Jul 2019
 23:50:00 +0000
From: "Johnson, Ethan" <ejohns48@cs.rochester.edu>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: PVHv2/HVM memory layout and interface specification
Thread-Index: AdVA3wyWSHObj/sRQ/qradWRmZafIQ==
Date: Mon, 22 Jul 2019 23:50:00 +0000
Message-ID: <DM6PR07MB6396C207C800C667B61BB6E1E4C40@DM6PR07MB6396.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ejohns48@cs.rochester.edu; 
x-originating-ip: [50.48.148.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df7ade52-8c4c-43e8-4353-08d70eff4f5e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR07MB5676; 
x-ms-traffictypediagnostic: DM6PR07MB5676:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <DM6PR07MB5676E8E07F38633B21CDEF32E4C40@DM6PR07MB5676.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(42606007)(136003)(376002)(39860400002)(396003)(366004)(346002)(51874003)(53754006)(199004)(189003)(64756008)(66556008)(66446008)(66476007)(966005)(52536014)(5660300002)(25786009)(66946007)(486006)(86362001)(55016002)(5640700003)(76116006)(102836004)(26005)(6436002)(75432002)(81166006)(53936002)(81156014)(6306002)(9686003)(14444005)(8936002)(256004)(478600001)(186003)(786003)(33656002)(68736007)(71200400001)(71190400001)(316002)(6116002)(2351001)(8676002)(6916009)(14454004)(88552002)(2501003)(2906002)(66066001)(6506007)(476003)(3846002)(7736002)(7696005)(305945005)(74316002)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR07MB5676;
 H:DM6PR07MB6396.namprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: cs.rochester.edu does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WMYCk83NdPlGDwrVMd6UmH62w9YkUuNyhIjYRDvpbRaf9eijhVnFugm/T6XU29XWHJfxCUvwTcpO8jvw4zq0XI2JuBCKLErpZdag1vNNCHt2EXe4FQ0Hw3FwuHpucRhv1OvYErjdm4LX7ZCXbPONONInbEVABR34MxFaf1dPqJSvRwEeCs2h4IuZ1gMFGcKXVH0yiwdKj7xCRJYn63npCMCVrU55yuk1xwItiqRnawIeOm3rxlIKciyp0JooPL0hUP67/GIBcZedxpPxHypNB5tNkRGKrqmGTUpy+GtAyaIc030q6AnnzK87QHUXd2s2qrcqzT03Fhlv2CYiF803mAMSs9GyNCy285ZmBI8oVpPcr53vwtADoEKRGJgyEkus6ioo8Cahvh9Ef+aYKpQL1x6sXeIqn4qogbzDCfNUkIY=
MIME-Version: 1.0
X-OriginatorOrg: cs.rochester.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: df7ade52-8c4c-43e8-4353-08d70eff4f5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 23:50:00.5032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 374e17f4-cf11-4ce2-b3ef-5de76bf4ce41
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ejohns48@ur.rochester.edu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB5676
Subject: [Xen-devel] PVHv2/HVM memory layout and interface specification
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

SGkgYWxsLAoKSSdtIGludGVyZXN0ZWQgaW4gdXNpbmcgWGVuIGFzIGEgcmVzZWFyY2ggcGxhdGZv
cm0gZm9yIGVuZm9yY2luZyBub3ZlbCBtZW1vcnkgcHJvdGVjdGlvbiBzY2hlbWVzIG9uIGh5cGVy
dmlzb3JzIGFuZCBndWVzdHMuIFNwZWNpZmljYWxseSwgSSdtIGxvb2tpbmcgdG8gZG8gdGhpcyBp
biBhbiBlbnZpcm9ubWVudCBjb250YWluaW5nIFBWSCh2MikgYW5kIHBvdGVudGlhbGx5IEhWTSBn
dWVzdHMuCgpUbyBrbm93IHdoYXQgbXkgb3B0aW9ucyBhcmUgZm9yIHRoaXMsIEkgbmVlZCB0byBr
bm93IHdoZXJlIHRoZSBYZW4gaHlwZXJ2aXNvciAibGl2ZXMiIGluIHRoZSBzeXN0ZW0ncyBtZW1v
cnkgbGF5b3V0cyAoYm90aCB2aXJ0dWFsIGFuZCBwaHlzaWNhbCwgYW5kIHdpdGhpbiBndWVzdHMn
IHNwYWNlcyBhcyB2aXJ0dWFsaXplZCBieSBleHRlbmRlZCBwYWdpbmcpLiBJIGZvdW5kIGEgR29v
Z2xlIFByb2plY3QgWmVybyBhcnRpY2xlIGZyb20gMjAxNyAoaHR0cHM6Ly9nb29nbGVwcm9qZWN0
emVyby5ibG9nc3BvdC5jb20vMjAxNy8wNC9wYW5kYXZpcnR1YWxpemF0aW9uLWV4cGxvaXRpbmct
eGVuLmh0bWwpIHRoYXQgZXhwbGFpbnMgdGhlIG1lbW9yeSBsYXlvdXQgZm9yIGNsYXNzaWMgUFYg
bW9kZSwgYnV0IEkgY291bGRuJ3QgZmluZCBhbnl0aGluZyBmb3IgUFZIIG9yIEhWTSwgZWl0aGVy
IGluIHRoZSBYZW4gZG9jdW1lbnRhdGlvbiwgdGhlIHdpa2ksIG9yIGdlbmVyYWwgd2ViIHNlYXJj
aGVzLgoKU28sIEkgdGhvdWdodCBJJ2QgYXNrIGhlcmUuLi53aGF0J3MgdGhlIGdlbmVyYWwgbGF5
IG9mIHRoZSBsYW5kIGluIHRlcm1zIG9mIGhvdyBYZW4gbGF5cyBvdXQgbWVtb3J5IGZvciBpdHNl
bGYgYW5kIGd1ZXN0cyBpbiBQVkggYW5kIEhWTSBtb2Rlcz8gSXMgdGhpcyBkb2N1bWVudGVkIGFu
eXdoZXJlLCBlLmcuIGluIHNvbWUgc29ydCBvZiBzcGVjaWZpY2F0aW9uIGZvciB0aGUgUFZIdjIg
cGFyYXZpcnR1YWxpemF0aW9uIGludGVyZmFjZT8gSSBsb29rZWQgZm9yIHN1Y2ggYSBzcGVjaWZp
Y2F0aW9uIGRvY3VtZW50IGJ1dCBjb3VsZG4ndCBmaW5kIGFueXRoaW5nIHBhcnRpY3VsYXJseSBj
b21wbGV0ZTsgdGhlIGNsb3Nlc3QgSSBmb3VuZCB3YXMgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9k
b2NzLzQuMTItdGVzdGluZy9taXNjL3B2aC5odG1sLCB3aGljaCBkaWRuJ3QgaGF2ZSBhIGxvdCBv
ZiBkZXRhaWwuIChUaGUgWGVuIDQuNyB2ZXJzaW9uIG9mIHRoZSBkb2N1bWVudGF0aW9uIGhhZCBh
IGxpdHRsZSBiaXQgbW9yZSBkZXRhaWwgYXQgaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZG9jcy80
LjctdGVzdGluZy9taXNjL3B2aC5odG1sLCBidXQgaXQgc3RpbGwgZG9lc24ndCBoYXZlIHF1aXRl
IHdoYXQgSSdtIGxvb2tpbmcgZm9yLCBhbmQgSSdtIG5vdCBzdXJlIGlmIHRoYXQncyBmb3IgUFZI
djIgb3IgdGhlIG9sZGVyIFBWSHYxLikKClNwZWNpZmljYWxseSwgSSdtIHdvbmRlcmluZzoKCjEu
IFdoZXJlIGRvZXMgdGhlIFhlbiBoeXBlcnZpc29yIGl0c2VsZiBsaXZlIGluIHRoZSBob3N0J3Mg
KFZNWCByb290KSB2aXJ0dWFsIGFuZCBwaHlzaWNhbCBhZGRyZXNzIHNwYWNlcyB1bmRlciBQVkgg
YW5kIEhWTT8gSW4gY2xhc3NpYyBQViBpdCBzZWVtcyBpdCBsaXZlZCBqdXN0IGJlbG93IHRoZSBn
dWVzdCBrZXJuZWwsIGJ1dCB0aGF0IHdhcyB3aXRob3V0IGV4dGVuZGVkIHBhZ2luZyBzZXBhcmF0
aW5nIHRoZSBob3N0IGFuZCBndWVzdCdzIHZpZXdzIG9mIG1lbW9yeS4KCjIuIERvZXMgWGVuIGFs
c28gbGl2ZSBzb21ld2hlcmUgd2l0aGluIHRoZSBndWVzdCdzIChWTVggbm9uLXJvb3QpIHZpZXcg
b2YgcGh5c2ljYWwgbWVtb3J5IGFzIHByb3ZpZGVkIGJ5IGV4dGVuZGVkIHBhZ2luZywgaW4gUFZI
IG1vZGU/IChJJ20gZ3Vlc3NpbmcgaXQgd291bGRuJ3QgZm9yIEhWTSwgYnV0IEknbSB3b25kZXJp
bmcgYWJvdXQgUFZIIGJlY2F1c2UgaXQgZGlkIGZvciBjbGFzc2ljIFBWLikKCjMuIEhvdyBhcmUg
aHlwZXJjYWxscyBoYW5kbGVkIGluIFBWSC9IVk0gbW9kZT8gRG8gdGhleSB1c2UgdGhlIFZNQ0FM
TCBpbnN0cnVjdGlvbiAob3Igc29tZXRoaW5nIGNvbXBhcmFibGUpIHRvIGluaXRpYXRlIGEgVk0g
ZXhpdCwgb3IgYXJlIHRoZXkgc29tZXRpbWVzIGhhbmRsZWQgd2l0aGluIFZNWCBub24tcm9vdCBt
b2RlIHdpdGhvdXQgYSBWTSBleGl0LCBzaW1pbGFyIHRvIGNsYXNzaWMgUFY/Cgo0LiBIb3cgZG9l
cyBYZW4gYWNjZXNzIHRoZSBndWVzdCdzIG1lbW9yeSB3aGVuIGl0IG5lZWRzIHRvIGV4YW1pbmUg
b3IgbW9kaWZ5IGl0PyBEb2VzIGl0IGp1c3QgYWNjZXNzIHRoZSBwaHlzaWNhbCBmcmFtZXMgdGhy
b3VnaCBhIGRpcmVjdCBtYXAgaW4gVk1YIHJvb3QgbW9kZSwgb3IgYXJlIGd1ZXN0cycgdmlld3Mg
b2YgcGh5c2ljYWwgbWVtb3J5IHNvbWVob3cgcmVwcmVzZW50ZWQgc29tZXdoZXJlIGluIHRoZSBo
b3N0J3MgKGh5cGVydmlzb3IncykgdmlydHVhbCBhZGRyZXNzIHNwYWNlPwoKNS4gSG93IGRvIFBW
SCBndWVzdHMgbGVhcm4gd2hhdCB0aGVpciBwaHlzaWNhbCBtZW1vcnkgbGF5b3V0IGxvb2tzIGxp
a2U/IFdoaWNoIHJlZ2lvbnMgb2YgbWVtb3J5IGRvIHRoZXkgdXNlIHRvIGNvbW11bmljYXRlIHdp
dGggWGVuPyBIb3cgaXMgdGhpcyBwcm9jZXNzIGRpZmZlcmVudCBmb3IgSFZNIChub24tUFZIKSBn
dWVzdHM/Cgo2LiBIb3cgZG9lcyBkb20wIGZhY3RvciBpbnRvIGFsbCB0aGlzPyBEb2VzIGl0IGhh
dmUgYW55IGRpcmVjdCBhY2Nlc3MgdG8gZG9tVXMnIHBoeXNpY2FsIG1lbW9yeSBwYWdlcywgb3Ig
ZG9lcyBpdCBoYXZlIHRvIGFzayBYZW4gdG8gZG8gdGhhdCBvbiBpdHMgYmVoYWxmIHdpdGggYSBo
eXBlcmNhbGw/IAoKVGhhbmtzIGluIGFkdmFuY2UgZm9yIGFueSBoZWxwIGFueW9uZSBjYW4gb2Zm
ZXIuIElmIHRoZXJlIGFyZSBhbnkgZ29vZCByZXNvdXJjZXMgb3V0IHRoZXJlIChib29rcz8gYmxv
ZyBwb3N0cz8pIGZvciB1bmRlcnN0YW5kaW5nIHRoZSBiaWctcGljdHVyZSBzdHJ1Y3R1cmUgb2Yg
dGhlIFhlbiBhcmNoaXRlY3R1cmUgYW5kIGNvZGViYXNlIGFzIGl0IGV4aXN0cyBpbiBpdHMgbW9k
ZXJuIGZvcm0gKGkuZS4sIGluIHRoZSBQVkgvSFZNIGVyYSksIHRob3NlIHdvdWxkIGJlIGVzcGVj
aWFsbHkgYXBwcmVjaWF0ZWQuCgpTaW5jZXJlbHksCkV0aGFuIEpvaG5zb24KCi0tIApFdGhhbiBK
LiBKb2huc29uCkNvbXB1dGVyIFNjaWVuY2UgUGhEIHN0dWRlbnQsIFN5c3RlbXMgZ3JvdXAsIFVu
aXZlcnNpdHkgb2YgUm9jaGVzdGVyCmVqb2huczQ4QGNzLnJvY2hlc3Rlci5lZHUKZXRoYW5qb2hu
c29uQGFjbS5vcmcKUEdQIHB1YmxpYyBrZXkgYXZhaWxhYmxlIGZyb20gcHVibGljIGRpcmVjdG9y
eSBvciBvbiByZXF1ZXN0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
