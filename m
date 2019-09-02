Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E66F1A5A4E
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 17:16:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4o1p-0000uL-PT; Mon, 02 Sep 2019 15:14:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R1Xd=W5=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i4o1o-0000uG-Je
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 15:14:00 +0000
X-Inumbo-ID: 49b1d244-cd94-11e9-aea3-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49b1d244-cd94-11e9-aea3-12813bfff9fa;
 Mon, 02 Sep 2019 15:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567437239;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7jlIAZm7gUDRS/sIAAA6HE4X9uSwnhvr+ppqaRKDNFU=;
 b=IRuvPExC8hzEQnMg4j4VfVbWXX8M7P8E7L569u9lx5bWlXjVqcrkGYry
 83Q6T5GsNEUkdkSTUSRbC/6slNw5P5mdKqbFxVE1IbChfgXJMAthkl61S
 x9gr9fzWM7T6l+Rbv9w7EahaXdeBwHLF/ZvnC8hcfkKkcBQC+92Pf3Ibb 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: B/5X8TNKOreMjli9gh7ehgJBjNZke7divN2EgqwRlGLBfk2JDgWxCcfdqQgo1KHd4XoKp7Ro+Y
 JDSVtYz1UkCWn/GBcUaYi0lLQjx0b97JTz4tHjhBm4vQFFNqc727RWbl0g4lFBE4MNHwmZgp9X
 gcvB8htXkaNeOsb/jj7pwTFrqqvGsZvpmg4sVXDKvJ6GHj4T8dwMrNqxiAEP9vP0BwElMFXUjX
 FEg0mzEaEOIerNXQLSBZEODI2AaYUp0v7lrXb+VYJllRY9QEF6XAG791DYi0ddmG+pM62K48BL
 Dkw=
X-SBRS: 2.7
X-MesageID: 5243700
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,459,1559534400"; 
   d="scan'208";a="5243700"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [PATCH v7 1/6] x86/domain: remove the 'oos_off' flag
Thread-Index: AQHVXw0b+0WFjb3WC0C8fMKn7++tpqcYNaWAgAApv5D//+psAIAAJTyQ///h/4CAACPBEP//6AKAAATFenA=
Date: Mon, 2 Sep 2019 15:13:55 +0000
Message-ID: <80440d28316f4cc3921f869005f1b94c@AMSPEX02CL03.citrite.net>
References: <20190830082953.2192-1-paul.durrant@citrix.com>
 <20190830082953.2192-2-paul.durrant@citrix.com>
 <38900772-c8ce-bbfd-6d92-fbfe7abc7558@suse.com>
 <6178c787fecf4d8e80967e2681937b0d@AMSPEX02CL03.citrite.net>
 <0b37db94-2051-4ea0-e518-6222346a82c1@suse.com>
 <4dc00c06cae742fdaf13a2d62ed73877@AMSPEX02CL03.citrite.net>
 <f0aa7c7e-82a9-4b94-4c00-d9faa763d505@suse.com>
 <f8078a1de8d54ff5801a679182bfc03e@AMSPEX02CL03.citrite.net>
 <9519b0cf-8e00-f1f8-af41-f036a9132208@suse.com>
In-Reply-To: <9519b0cf-8e00-f1f8-af41-f036a9132208@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v7 1/6] x86/domain: remove the 'oos_off' flag
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
Cc: WeiLiu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAyIFNlcHRlbWJlciAyMDE5IDE1OjU0DQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogQW5kcmV3IENvb3BlciA8
QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBA
Y2l0cml4LmNvbT47IFJvZ2VyIFBhdQ0KPiBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyB4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3Jn
PjsgV2VpTGl1DQo+IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY3IDEvNl0g
eDg2L2RvbWFpbjogcmVtb3ZlIHRoZSAnb29zX29mZicgZmxhZw0KPiANCj4gT24gMDIuMDkuMjAx
OSAxNjoyMSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+IFllcywgdGhlIGhhcCBwYXJ0IHN0YXlz
IHB1dC4gVGhlICdvb3Nfb2ZmJyBwYXJ0IG1vdmVzIHRvIHg4NiBhbmQgYXJtIGNhbg0KPiA+IGJl
IGxlZnQgYWxvbmUgYmVjYXVzZSBpdCBhbHJlYWR5IHJlamVjdHMgZmxhZ3MgIT0gKGh2bSB8IGhh
cCkuDQo+IA0KPiBCdXQgaXQgbWF5IGJldHRlciByZWplY3QgdGhlIE9PUyBmbGFnIF9kZXNwaXRl
XyBoYXZpbmcgb25seSBIVk0gZ3Vlc3RzLA0KPiBhcyBsb25nIGFzIHRoZXJlJ3Mgbm8gc2hhZG93
IG1vZGUgdGhlcmUgaW4gdGhlIGZpcnN0IHBsYWNlLg0KPiANCg0KVGhlIGZsYWcgd2lsbCBiZSBy
ZWplY3RlZC4gQXMgSSBzYWlkIChpbiBhYmJyZXZpYXRlZCBmb3JtKSwgdGhlIHRlc3QgaW4gdGhl
IEFSTSBjb2RlIGlzOg0KDQppZiAoY29uZmlnLT5mbGFncyAhPSAoWEVOX0RPTUNUTF9DREZfaHZt
X2d1ZXN0IHwgWEVOX0RPTUNUTF9DREZfaGFwKSApDQoJZXJyb3IuLi4NCg0KU28sIGFueSBhdHRl
bXB0IHRvIHNldCBYRU5fRE9NQ1RMX0NERl9vb3Nfb2ZmIHdpbGwgYWxyZWFkeSBjYXVzZSBhbiBl
cnJvci4NCg0KICBQYXVsDQoNCj4gSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
