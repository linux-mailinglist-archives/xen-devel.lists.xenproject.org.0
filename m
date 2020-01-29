Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE4914CE97
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 17:43:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwqOT-0003R3-8f; Wed, 29 Jan 2020 16:40:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SEwJ=3S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iwqOS-0003Qx-4a
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 16:40:44 +0000
X-Inumbo-ID: 16e2ca2b-42b6-11ea-891d-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16e2ca2b-42b6-11ea-891d-12813bfff9fa;
 Wed, 29 Jan 2020 16:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580316044;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=BtC9LUEHfGa+QbGXDmG8I1TKvh7glmToTUaafyjcKa4=;
 b=HmKPdNpJ6+NW8BV82ECwVmsA/bqAedb4sJL+KM7fisJuSIluAcGk1FxI
 oPcOaf1t2kHKoffu+1RLgE71Uh6Rm6GJMF85jvOOA65fa7rb2ukszbr+J
 HWakcxdw+xXFYOll90hdHnY4yzcwd/YaLHERGSVPbp4qUAp+fqnlV8Ais Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xWWkzoubepsxQfz3yZ3dwruaRQDEno0ytlWKa75M5UJQQ7BOEWmn0KJTocyROnAJBtSNvDpzSp
 ZUr/dWGj/MoBGCBWnUOWNeoTcsQzgZYn18E2JqPB+ImNpJ3sZciH0Tw5KGb/DsD+BRP1uLaOVw
 MWlWCIgIXuJh/VZCS807QOLjym5lRNYu8banR4XiYj4QYYbj87ODbEyJgsM8TKCNh/mkceRz2P
 mU8ckekgnkNBmqWCZEq060+6psq5nXPNBNRfxsoDmnrb+9+CMgzFCc+1ZnM0DCRdmPMiKzdzCa
 8sQ=
X-SBRS: 2.7
X-MesageID: 11805181
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,378,1574139600"; d="scan'208";a="11805181"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <dc7ef061-25f9-6657-27ba-e6f2f51b8a64@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <9e4f3491-c17c-c079-6240-786ee8e4a2c5@citrix.com>
Date: Wed, 29 Jan 2020 16:40:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <dc7ef061-25f9-6657-27ba-e6f2f51b8a64@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] x86/HVM: relinquish resources also from
 hvm_domain_destroy()
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
Cc: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMDEvMjAyMCAxMjo1OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gRG9tYWluIGNyZWF0aW9u
IGZhaWx1cmUgcGF0aHMgZG9uJ3QgY2FsbCBkb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKSwK
PiB5ZXQgYWxsb2NhdGlvbnMgYW5kIGFsaWtlIGRvbmUgZnJvbSBodm1fZG9tYWluX2luaXRpYWxp
emUoKSBuZWVkIHRvIGJlCj4gdW5kb25lIG5ldmVydGhlbGVzcy4gQ2FsbCB0aGUgZnVuY3Rpb24g
YWxzbyBmcm9tIGh2bV9kb21haW5fZGVzdHJveSgpLAo+IGFmdGVyIG1ha2luZyBzdXJlIGFsbCBk
ZXNjZW5kYW50cyBhcmUgaWRlbXBvdGVudC4KPgo+IE5vdGUgdGhhdCB3aGlsZSB2aXJpZGlhbl97
ZG9tYWluLHZjcHV9X2RlaW5pdCgpIHdlcmUgYWxyZWFkeSB1c2VkIGluCj4gd2F5cyBzdWdnZXN0
aW5nIHRoZXkncmUgaWRlbXBvdGVudCwgdmlyaWRpYW5fdGltZV92Y3B1X2RlaW5pdCgpIGFjdHVh
bGx5Cj4gd2Fzbid0OiBPbmUgY2FuJ3Qga2lsbCBhIHRpbWVyIHRoYXQgd2FzIG5ldmVyIGluaXRp
YWxpemVkLgo+Cj4gRm9yIGh2bV9kZXN0cm95X2FsbF9pb3JlcV9zZXJ2ZXJzKCkncyBwdXJwb3Nl
cyBtYWtlCj4gcmVsb2NhdGVfcG9ydGlvX2hhbmRsZXIoKSByZXR1cm4gd2hldGhlciB0aGUgdG8g
YmUgcmVsb2NhdGVkIHBvcnQgcmFuZ2UKPiB3YXMgYWN0dWFsbHkgZm91bmQuIFRoaXMgc2VlbXMg
Y2hlYXBlciB0aGFuIGludHJvZHVjaW5nIGEgZmxhZyBpbnRvCj4gc3RydWN0IGh2bV9kb21haW4n
cyBpb3JlcV9zZXJ2ZXIgc3ViLXN0cnVjdHVyZS4KPgo+IEluIGh2bV9kb21haW5faW5pdGlhbGlz
ZSgpIGFkZGl0aW9uYWxseQo+IC0gdXNlIFhGUkVFKCkgYWxzbyB0byByZXBsYWNlIGFkamFjZW50
IHhmcmVlKCksCj4gLSB1c2UgaHZtX2RvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcygpIGFzIGJl
aW5nIGlkZW1wb3RlbnQgbm93Lgo+IFRoZXJlIGFzIHdlbGwgYXMgaW4gaHZtX2RvbWFpbl9kZXN0
cm95KCkgdGhlIGV4cGxpY2l0IGNhbGwgdG8KPiBydGNfZGVpbml0KCkgaXNuJ3QgbmVlZGVkIGFu
eW1vcmUuCj4KPiBJbiBodm1fZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKCkgYWRkaXRpb25h
bGx5IGRyb3AgYSBubyBsb25nZXIKPiByZWxldmFudCBpZigpLgo+Cj4gRml4ZXM6IGU3YTliNWU3
MmYyNiAoInZpcmlkaWFuOiBzZXBhcmF0ZWx5IGFsbG9jYXRlIGRvbWFpbiBhbmQgdmNwdSBzdHJ1
Y3R1cmVzIikKPiBGaXhlczogMjZmYmEzYzg1NTcxICgidmlyaWRpYW46IGFkZCBpbXBsZW1lbnRh
dGlvbiBvZiBzeW50aGV0aWMgdGltZXJzIikKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+CgpBbnkgaWRlbXBvdGVuY3kgaW1wcm92ZW1lbnRzIGluIHRoZSBkZXN0cm95
IHBhdGhzIGFyZSBhIGdvb2QgdGhpbmcuwqAKV2UnbGwgYmUgd2FudGluZyB0aGlzIHdvcmsgY29t
cGxldGUgZm9yIHRoZSBzdGFibGUgdG9vbHN0YWNrIGh5cGVyY2FsbAp3b3JrLCBzbyB3ZSBkb24n
dCBoYXZlIHRvIGluY2x1ZGUgYSBsb2dpY2FsbHkgYnJva2VuIGNhbGwgaW50byB0aGUgYnJhbmQK
bmV3IEFQSS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
