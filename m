Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A6DCF9FF
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 14:37:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHohG-0006Rx-BL; Tue, 08 Oct 2019 12:34:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rCmb=YB=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iHohE-0006Rs-6P
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 12:34:32 +0000
X-Inumbo-ID: f92d4e8f-e9c7-11e9-97ce-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f92d4e8f-e9c7-11e9-97ce-12813bfff9fa;
 Tue, 08 Oct 2019 12:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570538071;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=m277fnZlYLRmP9kxxvmvQ2UBQn/YAzirT1HP1IepNWQ=;
 b=QMeVnjAiI1G4vHSPr8+OTiLkrVdKh/FZIBHKGLBw0Piuz1AS9jPbg9R6
 KJ9MxjmYCL1EjOY7399YODUf7arTqqwp9Db4bGA6VQBc08wa5q/fYL/WJ
 OduIuMrsRRU/8cXD/dvVyeTIrij6CI/0XBt+xxuUh7TOZJWeNooGsw/Y+ M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jok9qJgKF3UaRhC5JkidUj3zqog/mpYoN6257+AL7bzaadIUvdGHir4h4nksi3rOJTdRaoIhBt
 7DMfxNIu1hS5arCBSeAWDDNw5cJpZ1GB+3lCvCVL63/D9M8It0e78nt2qfnc5fiH8eCgsf/fKv
 kqXnnBBXGKANORdZ5Hk52q+9afcOMNbgGnXuagCDJGF8C/AYBBjRSTUkdRQcmAt5WiWnR7CrXW
 6VrLhepmBcKCkXS71275ytJIX07qEONfnAAu4V78QvkPber2RdPjLR7VgvUdCHq2tDXMRfnpUN
 WRo=
X-SBRS: 2.7
X-MesageID: 6676583
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,270,1566878400"; 
   d="scan'208";a="6676583"
From: Lars Kurth <lars.kurth@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 3/4] docs/sphinx: Introduction
Thread-Index: AQHVei2AC3s2yTrn1Um3lmpCLQNiO6dQpFIA
Date: Tue, 8 Oct 2019 12:34:26 +0000
Message-ID: <D8B53B1D-C43F-4B1C-AD19-5B92005E7286@citrix.com>
References: <20191003205948.21131-1-andrew.cooper3@citrix.com>
In-Reply-To: <20191003205948.21131-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.e.190909
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <ED25E3C89F64F44CAC6C4FE1AAF05E8B@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 3/4] docs/sphinx: Introduction
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDAzLzEwLzIwMTksIDIxOjU5LCAiQW5kcmV3IENvb3BlciIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KDQogICAgUHV0IHRvZ2V0aGVyIGFuIGludHJvZHVjdGlv
biBwYWdlIGZvciB0aGUgU3BoaW54L1JTVCBkb2NzLCBhbG9uZyB3aXRoIGENCiAgICBnbG9zc2Fy
eSB3aGljaCB3aWxsIGFjY3VtdWxhdGUgb3ZlciB0aW1lLg0KICAgIA0KICAgIFNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNClJldmlld2Vk
LWJ5OiBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoQGNpdHJpeC5jb20+DQoNClRoZXJlIHdlcmUgYSBm
ZXcgbWlub3IgaW1wcm92ZW1lbnRzIHdoaWNoIGNvdWxkIGJlIG1hZGUsIEkgYW0gbGlzdGluZyB0
aGVzZQ0KYmVsb3csIGJ1dCBub25lIGFyZSBzaG93LXN0b3BwZXJzLg0KDQogICAgK1hlbiBpcyBh
biBvcGVuIHNvdXJjZSwgYmFyZSBtZXRhbCBoeXBlcnZpc29yLiAgSXQgcnVucyBhcyB0aGUgbW9z
dCBwcml2aWxlZ2VkDQogICAgK3BpZWNlIG9mIHNvZnR3YXJlLCBhbmQgc2hhcmVzIHRoZSByZXNv
dXJjZXMgb2YgdGhlIGhhcmR3YXJlIGJldHdlZW4gdmlydHVhbA0KTWF5YmUgYmV0dGVyOiBzL3Nv
ZnR3YXJlL3NvZnR3YXJlIG9uIHRoZSBzeXN0ZW0vIG9yIHMvc29mdHdhcmUvc29mdHdhcmUgb24g
dGhlIGhvc3QvDQogICAgK21hY2hpbmVzLg0KDQogICAgKyAgIGhhcmR3YXJlIGRvbWFpbg0KICAg
ICsgICAgIEEgOnRlcm06YGRvbWFpbmAsIGNvbW1vbmx5IGRvbTAsIHdoaWNoIHNoYXJlcyByZXNw
b25zaWJpbGl0eSB3aXRoIFhlbg0KICAgICsgICAgIGFib3V0IHRoZSBzeXN0ZW0gYXMgYSB3aG9s
ZS4NCiAgICArDQogICAgKyAgICAgQnkgZGVmYXVsdCBpdCBnZXRzIGFsbCBkZXZpY2VzLCBpbmNs
dWRpbmcgYWxsIGRpc2tzIGFuZCBuZXR3b3JrIGNhcmRzLCBzbw0KICAgICsgICAgIGlzIHJlc3Bv
bnNpYmxlIGZvciBtdWx0aXBsZXhpbmcgZ3Vlc3QgSS9PDQoNClRoaXMgaXMgYSBsaXR0bGUgdW5j
bGVhcjogaW4gcGFydGljdWxhciB0aGUgMXN0IHBhcmFncmFwaC4gRWFybGllciB5b3UgdGFsayBh
Ym91dCBoYXJkd2FyZQ0KZG9tYWluPSJyZXNwb25zaWJsZSBmb3IgaGFyZHdhcmUgYW5kIG1hcnNo
YWxsaW5nIGd1ZXN0IEkvTyIsIHdoaWNoIGlzIGNsZWFyZXIuIA0KDQpNYXliZTogDQoNCkEgOnRl
cm06YGRvbWFpbmAsIGNvbW1vbmx5IGRvbTAsIHdoaWNoIGhvc3RzIGFsbCBkZXZpY2VzLCBpbmNs
dWRpbmcgZGlza3MNCmFuZCBuZXR3b3JrIGNhcmRzIGFuZCBpcyByZXNwb25zaWJsZSBmb3IgbXVs
dGlwbGV4aW5nIGd1ZXN0IEkvTw0KDQppcyBiZXR0ZXINCg0KUmVnYXJkcw0KTGFycw0KIA0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
