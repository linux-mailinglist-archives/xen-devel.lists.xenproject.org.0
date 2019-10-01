Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB0AC31BA
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 12:49:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFFfw-0005wC-Ul; Tue, 01 Oct 2019 10:46:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rvNq=X2=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iFFfv-0005w5-5i
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 10:46:35 +0000
X-Inumbo-ID: bc371544-e438-11e9-96f7-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id bc371544-e438-11e9-96f7-12813bfff9fa;
 Tue, 01 Oct 2019 10:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569926794;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Dfr7hshzxNdUiGaIagQjJpl12HCjZzEinobAXmHH12M=;
 b=erUkL1yKT0DE9f6RGE8sS9YC0Q4p001ohphFU/po+MfKTM6JRkhP87+Q
 oJRrwV3uuBWpolPtvwXwJZHzjE8PKdw9PiPFBXo14wnV5lNWNZCS+XJLl
 x5QoTQgLCrJhrtrVyccHmN3+vk2znuaWo+yGVUxNYGagOo24KBldjb95X s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: k90wuUzJWHuZVj8QoPcyviSebjsygF0FgtoyiFN0VAYgQP3yVsbQdjZg8PYcwqRh0emoLa3GeC
 YqeJ+ELOZXNRCRRvuljfhHr0uebpOMBIYJAEidlp/JjB8M1a+LQgorcE/jp2lhOHBca66XVERr
 qdFUYpdnxZtBde7pUCfDDOSKDhUXrSkfr5sVClG31OR6lcT1dDL0gJuGBvPwfG3eMRQapz0u0I
 XzjEGc1nN74UOPUriFQz4xYGQ/BZ2pXrwoU/n9+/D05yMHcqxGheF1MQ9Y+G5VaVU149cainp1
 C8I=
X-SBRS: 2.7
X-MesageID: 6369763
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,570,1559534400"; 
   d="scan'208";a="6369763"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
Thread-Topic: [PATCH-for-4.13] libxl: choose an appropriate default for
 passthrough...
Thread-Index: AQHVeDhTgL3pyHrnK0i7HT0UlmCZiKdFdvSAgAAiG/A=
Date: Tue, 1 Oct 2019 10:46:30 +0000
Message-ID: <045e191e8d1b4e9b9e131921dc865483@AMSPEX02CL03.citrite.net>
References: <20191001091214.3287-1-paul.durrant@citrix.com>
 <23955.11471.728957.434428@mariner.uk.xensource.com>
In-Reply-To: <23955.11471.728957.434428@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH-for-4.13] libxl: choose an appropriate
 default for passthrough...
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBjaXRyaXguY29tPgo+IFNlbnQ6IDAxIE9jdG9iZXIgMjAxOSAxMTozOQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmc7IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbnRob255IFBlcmFyZCA8YW50
aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47Cj4gSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
Pgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gtZm9yLTQuMTNdIGxpYnhsOiBjaG9vc2UgYW4gYXBwcm9w
cmlhdGUgZGVmYXVsdCBmb3IgcGFzc3Rocm91Z2guLi4KPiAKPiBQYXVsIER1cnJhbnQgd3JpdGVz
ICgiW1BBVENILWZvci00LjEzXSBsaWJ4bDogY2hvb3NlIGFuIGFwcHJvcHJpYXRlIGRlZmF1bHQg
Zm9yIHBhc3N0aHJvdWdoLi4uIik6Cj4gPiAuLi5pZiB0aGVyZSBpcyBubyBJT01NVSBvciBpdCBp
cyBnbG9iYWxseSBkaXNhYmxlZC4KPiA+Cj4gPiBXaXRob3V0IHRoaXMgcGF0Y2gsIHRoZSBmb2xs
b3dpbmcgYXNzZXJ0aW9uIG1heSBiZSBoaXQ6Cj4gPgo+ID4geGw6IGxpYnhsX2NyZWF0ZS5jOjU4
OTogbGlieGxfX2RvbWFpbl9tYWtlOiBBc3NlcnRpb24gYGluZm8tPnBhc3N0aHJvdWdoICE9Cj4g
TElCWExfUEFTU1RIUk9VR0hfRU5BQkxFRCcgZmFpbGVkLgo+ID4KPiA+IFRoaXMgaXMgYmVjYXVz
ZSBsaWJ4bF9fZG9tYWluX2NyZWF0ZV9pbmZvX3NldGRlZmF1bHQoKSBjdXJyZW50bHkgb25seSBz
ZXRzCj4gPiBhbiBhcHByb3ByaWF0ZSB2YWx1ZSBmb3IgJ3Bhc3N0aHJvdWdoJyBpbiB0aGUgY2Fz
ZSB0aGF0ICdjYXBfaHZtX2RpcmVjdGlvJwo+ID4gaXMgdHJ1ZSwgd2hpY2ggaXMgbm90IHRoZSBj
YXNlIHVubGVzcyBhbiBJT01NVSBpcyBwcmVzZW50IGFuZCBlbmFibGVkIGluCj4gPiB0aGUgc3lz
dGVtLiBUaGlzIGlzIG5vcm1hbGx5IG1hc2tlZCBieSB4bCBjaG9vc2luZyBhIGRlZmF1bHQgdmFs
dWUsIGJ1dAo+ID4gdGhhdCB3aWxsIG5vdCBoYXBwZW4gaWYgeGwgaXMgbm90IHVzZWQgKGUuZy4g
d2hlbiB1c2luZyBsaWJ2aXJ0KSBvciB3aGVuCj4gPiBhIHN0dWIgZG9tYWluIGlzIGJlaW5nIGNy
ZWF0ZWQuCj4gCj4gSXQncyB3ZWlyZCB0aGF0IGFmdGVyIHRoaXMgcGF0Y2ggImVuYWJsZWQiIGNh
biBtZWFuIERJU0FCTEVELiBTdXJlbHkKPiBpZiB5b3Ugc2F5IGBwYXNzdGhyb3VnaD0iZW5hYmxl
ZCInIGFuZCB0aGUgaG9zdCBoYXMgbm8gUFQgc3VwcG9ydCAoZWcKPiBpdCdzIGRpc2FibGVkIGlu
IHRoZSBiaW9zKSBpdCBzaG91bGQgZmFpbCA/CgpJbmRlZWQsIGFuZCB4bCB3aWxsIGRvIGV4YWN0
bHkgdGhhdC4gCgo+IAo+IE5vcm1hbGx5IGxpYnhsIGNvbmZpZyBvcHRpb25zIGhhdmUgYW4gInVu
a25vd24iIG9yICJkZWZhdWx0IiBvcHRpb24uCj4gCj4gQWxzbyBpdCBpcyBhbm9tYWxvdXMgdGhh
dCB4bCBpcyBkb2luZyB0aGUgY29tcGxleCB3b3JrIG9mIGNob29zaW5nIGEKPiBkZWZhdWx0LiAg
SSB0aGluayBhbGwgdGhlIGNvbXBsZXggY29kZQo+IAo+ICsgICAgc3dpdGNoIChjX2luZm8tPnBh
c3N0aHJvdWdoKSB7Cj4gKyAgICBjYXNlIExJQlhMX1BBU1NUSFJPVUdIX0VOQUJMRUQ6Cj4gCj4g
aW4geGxfcGFyc2UuYyBzaG91bGQgYmUgaW4gbGlieGwuICAoU29tZSBvZiBpdCBpcyB0aGVyZSBh
bHJlYWR5LikKPiAKPiBJJ20gc29ycnkgdGhhdCBJIHdhc24ndCBkaWRuJ3QgcmV2aWV3IGJhYmRl
NDdhM2ZlZC4uLgo+IAoKU28sIHdvdWxkIHlvdSBhZHZvY2F0ZSBhbiAndW5rbm93bicgdmFsdWUg
dGhlbj8gVGhhdCdzIGVzc2VudGlhbGx5IGp1c3QgYSByZW5hbWUgb3BlcmF0aW9uIG9uICdlbmFi
bGVkJy4KClRoZSBjb2RlIGluIHhsX3BhcnNlLmMgaXMgdGhlcmUgZm9yIGEgcmVhc29uIHRob3Vn
aDsgdGhlIGFwcHJvcHJpYXRlIGFtb3VudCBvZiBleHRyYSBtZW1vcnkgZm9yIHRoZSBJT01NVSBw
YWdlIHRhYmxlcyBoYXMgdG8gYmUgZGV0ZXJtaW5lZCB0aGVyZSBiZWNhdXNlIHRoZSAnYnVpbGQn
IHBhcnRzIG9mIGxpYnhsIHNlZW0gdG8gYmUgbGFyZ2VseSBmaXJld2FsbGVkIGZyb20gdGhlICdj
cmVhdGUnIHBhcnRzIGFuZCB0aHVzIHRoZSByZWxldmFudCBpbmZvcm1hdGlvbiBpcyBub3QgYXZh
aWxhYmxlIHRvIGRlY2lkZSB0aGUgYXBwcm9wcmlhdGUgb3ZlcmhlYWQuCgogIFBhdWwKCj4gSWFu
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
