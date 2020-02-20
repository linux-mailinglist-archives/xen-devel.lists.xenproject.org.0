Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39838166125
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 16:40:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4nt4-0001y6-R1; Thu, 20 Feb 2020 15:37:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eGzm=4I=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j4nt3-0001y1-R5
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 15:37:13 +0000
X-Inumbo-ID: dd098576-53f6-11ea-aa99-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd098576-53f6-11ea-aa99-bc764e2007e4;
 Thu, 20 Feb 2020 15:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582213032;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=KgEgF/VNvfnD8W8uGVEV1ooOqVsPRQrW4Rm+bIgJ2Po=;
 b=Ys/2FBzs5KsT47tGM6cZIbTUHHHZUD+2bbSa74OlzSGamPtlbXCqv7p5
 7gCD8FxZN7mfHI6gFdT9onsrsj5qSZKzpMTMu/nrMKKanqVUlZaf19V6Y
 NHFG+uLAK7KCs3BwH0Ri3YEvUPN9BGa9F2YhP0zLjC6rz4lh7+iO7XwRX A=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JUnRGKssUZkzl/G060kX/hZFOXzTjAGqzeKhq7v0DSypGeic3bbNeQ7xs6YErqC9JGuaHoJLbG
 qL9NuZrAvx7XuVvSQ7lCxqY9nNHP5mPLjb4GYd9DX/mc9eTfjJhy87Iys4k++u2Y0Rlor4K/HT
 3nBgqvxWQYhuiJjVc5fJFpmFKPC+FEo4hPDpVjgxAQqubyVFVOT0a9z71qwBSP4+gIXRIIry2G
 LCV6uFkP5CZskqn3VwxPcbA7+bF5UXNjJ2fEsbu3tlJ/f75dIiMrEkrXKa22NqvvJ+gouHmonw
 TrA=
X-SBRS: 2.7
X-MesageID: 13384288
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,464,1574139600"; d="scan'208";a="13384288"
To: Jan Beulich <jbeulich@suse.com>
References: <1576877960-12767-1-git-send-email-igor.druzhinin@citrix.com>
 <98c80514-a3cc-9e4f-d84c-3a12b08feaf2@suse.com>
 <6d3b8fed-538f-9c9b-d33e-3ccb94935bf0@citrix.com>
 <86036433-0dd9-773c-3855-fb4b4697fc08@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <eb6156eb-6a6d-28f5-c8ec-081f81444b99@citrix.com>
Date: Thu, 20 Feb 2020 15:37:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <86036433-0dd9-773c-3855-fb4b4697fc08@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/vpt: update last_guest_time with
 cmpxchg and drop pl_time_lock
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
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com, wl@xen.org,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAvMDIvMjAyMCAwODoyNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTkuMDIuMjAyMCAx
OTo1MiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IE9uIDE5LzAyLzIwMjAgMDc6NDgsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+Pj4gT24gMjAuMTIuMjAxOSAyMjozOSwgSWdvciBEcnV6aGluaW4gd3Jv
dGU6Cj4+Pj4gQEAgLTM4LDI0ICszNywyMiBAQCB2b2lkIGh2bV9pbml0X2d1ZXN0X3RpbWUoc3Ry
dWN0IGRvbWFpbiAqZCkKPj4+PiAgdWludDY0X3QgaHZtX2dldF9ndWVzdF90aW1lX2ZpeGVkKGNv
bnN0IHN0cnVjdCB2Y3B1ICp2LCB1aW50NjRfdCBhdF90c2MpCj4+Pj4gIHsKPj4+PiAgICAgIHN0
cnVjdCBwbF90aW1lICpwbCA9IHYtPmRvbWFpbi0+YXJjaC5odm0ucGxfdGltZTsKPj4+PiAtICAg
IHU2NCBub3c7Cj4+Pj4gKyAgICBzX3RpbWVfdCBvbGQsIG5ldywgbm93ID0gZ2V0X3NfdGltZV9m
aXhlZChhdF90c2MpICsgcGwtPnN0aW1lX29mZnNldDsKPj4+PiAgCj4+Pj4gICAgICAvKiBDYWxs
ZWQgZnJvbSBkZXZpY2UgbW9kZWxzIHNoYXJlZCB3aXRoIFBWIGd1ZXN0cy4gQmUgY2FyZWZ1bC4g
Ki8KPj4+PiAgICAgIEFTU0VSVChpc19odm1fdmNwdSh2KSk7Cj4+Pj4gIAo+Pj4+IC0gICAgc3Bp
bl9sb2NrKCZwbC0+cGxfdGltZV9sb2NrKTsKPj4+PiAtICAgIG5vdyA9IGdldF9zX3RpbWVfZml4
ZWQoYXRfdHNjKSArIHBsLT5zdGltZV9vZmZzZXQ7Cj4+Pj4gLQo+Pj4+ICAgICAgaWYgKCAhYXRf
dHNjICkKPj4+PiAgICAgIHsKPj4+PiAtICAgICAgICBpZiAoIChpbnQ2NF90KShub3cgLSBwbC0+
bGFzdF9ndWVzdF90aW1lKSA+IDAgKQo+Pj4+IC0gICAgICAgICAgICBwbC0+bGFzdF9ndWVzdF90
aW1lID0gbm93Owo+Pj4+IC0gICAgICAgIGVsc2UKPj4+PiAtICAgICAgICAgICAgbm93ID0gKytw
bC0+bGFzdF9ndWVzdF90aW1lOwo+Pj4+ICsgICAgICAgIGRvIHsKPj4+PiArICAgICAgICAgICAg
b2xkID0gcGwtPmxhc3RfZ3Vlc3RfdGltZTsKPj4+PiArICAgICAgICAgICAgbmV3ID0gbm93ID4g
cGwtPmxhc3RfZ3Vlc3RfdGltZSA/IG5vdyA6IG9sZCArIDE7Cj4+Pj4gKyAgICAgICAgfSB3aGls
ZSAoIGNtcHhjaGcoJnBsLT5sYXN0X2d1ZXN0X3RpbWUsIG9sZCwgbmV3KSAhPSBvbGQgKTsKPj4+
Cj4+PiBJIHdvbmRlciB3aGV0aGVyIHlvdSB3b3VsZG4ndCBiZXR0ZXIgcmUtaW52b2tlIGdldF9z
X3RpbWUoKSBpbgo+Pj4gY2FzZSB5b3UgbmVlZCB0byByZXRyeSBoZXJlLiBTZWUgaG93IHRoZSBm
dW5jdGlvbiBwcmV2aW91c2x5Cj4+PiB3YXMgY2FsbGVkIG9ubHkgYWZ0ZXIgdGhlIGxvY2sgd2Fz
IGFscmVhZHkgYWNxdWlyZWQuCj4+Cj4+IElmIHRoZXJlIGlzIGEgY29uY3VycmVudCB3cml0ZXIs
IHdvdWxkbid0IGl0IGp1c3QgdXBkYXRlIHBsLT5sYXN0X2d1ZXN0X3RpbWUKPj4gd2l0aCB0aGUg
bmV3IGdldF9zX3RpbWUoKSBhbmQgdGhlbiB3ZSBzdWJzZXF1ZW50bHkgd291bGQganVzdCB1c2Ug
dGhlIG5ldwo+PiB0aW1lIG9uIHJldHJ5Pwo+IAo+IFllcywgaXQgd291bGQsIGJ1dCB0aGUgbGF0
ZW5jeSB1bnRpbCB0aGUgcmV0cnkgYWN0dWFsbHkgb2NjdXJzCj4gaXMgdW5rbm93biAoaW4gcGFy
dGljdWxhciBpZiBYZW4gaXRzZWxmIHJ1bnMgdmlydHVhbGl6ZWQpLiBJLmUuCj4gaW4gdGhlIGF0
X3RzYyA9PSAwIGNhc2UgSSB0aGluayB0aGUgdmFsdWUgd291bGQgYmV0dGVyIGJlCj4gcmUtY2Fs
Y3VsYXRlZCBvbiBldmVyeSBpdGVyYXRpb24uCgpXaHkgZG9lcyBpdCBuZWVkIHRvIGJlIHJlY2Fs
Y3VsYXRlZCBpZiBhIGNvbmN1cnJlbnQgd3JpdGVyIGRpZCB0aGlzCmZvciB1cyBhbHJlYWR5IGFu
eXdheSBhbmQgKGdldF9zX3RpbWVfZml4ZWQoYXRfdHNjKSArIHBsLT5zdGltZV9vZmZzZXQpCnZh
bHVlIGlzIGNvbW1vbiBmb3IgYWxsIG9mIHZDUFVzPyBZZXMsIGl0IG1pZ2h0IHJlZHVjZSBqaXR0
ZXIgc2xpZ2h0bHkKYnV0IG92ZXJhbGwgbGF0ZW5jeSBjb3VsZCBjb21lIGZyb20gYW55IHBvaW50
IChlc3BlY2lhbGx5IGluIGNhc2Ugb2YKcmlubmluZyB2aXJ0dWFsaXplZCkgYW5kIGl0J3MgaW1w
b3J0YW50IGp1c3QgdG8gcHJlc2VydmUgaW52YXJpYW50IHRoYXQKdGhlIHZhbHVlIGlzIG1vbm90
b25pYyBhY3Jvc3MgdkNQVXMuCgo+IEFudGhlciB0aGluZyBJIG5vdGljZSBvbmx5IG5vdyBhcmUg
dGhlIG11bHRpcGxlIHJlYWRzIG9mCj4gcGwtPmxhc3RfZ3Vlc3RfdGltZS4gV291bGRuJ3QgeW91
IGJldHRlciBkbwo+IAo+ICAgICAgICAgZG8gewo+ICAgICAgICAgICAgIG9sZCA9IEFDQ0VTU19P
TkNFKHBsLT5sYXN0X2d1ZXN0X3RpbWUpOwo+ICAgICAgICAgICAgIG5ldyA9IG5vdyA+IG9sZCA/
IG5vdyA6IG9sZCArIDE7Cj4gICAgICAgICB9IHdoaWxlICggY21weGNoZygmcGwtPmxhc3RfZ3Vl
c3RfdGltZSwgb2xkLCBuZXcpICE9IG9sZCApOwo+IAo+ID8KCkZhaXIgZW5vdWdoLCBhbHRob3Vn
aCBldmVuIHJlYWRpbmcgaXQgbXVsdGlwbGUgdGltZXMgd291bGRuJ3QgY2F1c2UKYW55IGhhcm0g
YXMgYW55IGluY29uc2lzdGVuY3kgd291bGQgYmUgcmVzb2x2ZWQgYnkgY21weGNoZyBvcC4gSSdk
CnByZWZlciB0byBtYWtlIGl0IGluIGEgc2VwYXJhdGUgY29tbWl0IHRvIHVuaWZ5IGl0IHdpdGgg
cHZfc29mdF9yZHRzYygpLgoKSWdvcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
