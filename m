Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BD41661F9
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 17:12:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4oNK-0006Bo-76; Thu, 20 Feb 2020 16:08:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eGzm=4I=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j4oNI-0006Bj-CG
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 16:08:28 +0000
X-Inumbo-ID: 3a4cc578-53fb-11ea-ade5-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a4cc578-53fb-11ea-ade5-bc764e2007e4;
 Thu, 20 Feb 2020 16:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582214908;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=hon6ZcOHMm6UeryYWSx454XqB2jkgTNlT5drWFb5OpY=;
 b=YFVZPwv2vL4XCtWZT1EFklhc2u+9SwSrBff1fkFMCrN+2vx+qhMaZjyI
 Kaq0XUkruaakeSBBWu+uNDWALmD8Q97I844+9X4b2Qs7Fso8oAkniblCN
 Py9ytptWIC3KEuVgvyvBYJw8iV2/52cKfHDIc7lpg4ax5J31nBH1ROxXU E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SLdINB/kl+u/hoar0JCm9BXWfHlvVtIh/yvu08noaPXDYI0GORUJKVLEIprxHIlRRXX9oWEjkL
 5dZmrJa1qVm1fVsPhP6UuzzeHMcwLKeIr8ulOQnu62deRmuv2fc+1AFVWRiiCVvUgydLSTtmXe
 0OjcF5C1AydyF3If9ZznXnkUF41BN+2r9k0gbIaPvck+8zcNRMYNeJFJSrOuYQR6s5UD2UvJuo
 GmuoSv9Yw8j1PGm8pJDRa05TO3vaUByN9tyoRgOD2NsCZCuB9KAGCTAi3wZxJeh5/BSC1ryijl
 gTQ=
X-SBRS: 2.7
X-MesageID: 12747237
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,464,1574139600"; d="scan'208";a="12747237"
To: Jan Beulich <jbeulich@suse.com>
References: <1576877960-12767-1-git-send-email-igor.druzhinin@citrix.com>
 <98c80514-a3cc-9e4f-d84c-3a12b08feaf2@suse.com>
 <6d3b8fed-538f-9c9b-d33e-3ccb94935bf0@citrix.com>
 <86036433-0dd9-773c-3855-fb4b4697fc08@suse.com>
 <eb6156eb-6a6d-28f5-c8ec-081f81444b99@citrix.com>
 <177eafce-7f19-0792-eac2-62ac7b13feb0@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <64466194-9d8e-e689-24d0-902169d24339@citrix.com>
Date: Thu, 20 Feb 2020 16:08:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <177eafce-7f19-0792-eac2-62ac7b13feb0@suse.com>
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

T24gMjAvMDIvMjAyMCAxNTo0NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjAuMDIuMjAyMCAx
NjozNywgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IE9uIDIwLzAyLzIwMjAgMDg6MjcsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+Pj4gT24gMTkuMDIuMjAyMCAxOTo1MiwgSWdvciBEcnV6aGluaW4gd3Jv
dGU6Cj4+Pj4gT24gMTkvMDIvMjAyMCAwNzo0OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9u
IDIwLjEyLjIwMTkgMjI6MzksIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+Pj4+Pj4gQEAgLTM4LDI0
ICszNywyMiBAQCB2b2lkIGh2bV9pbml0X2d1ZXN0X3RpbWUoc3RydWN0IGRvbWFpbiAqZCkKPj4+
Pj4+ICB1aW50NjRfdCBodm1fZ2V0X2d1ZXN0X3RpbWVfZml4ZWQoY29uc3Qgc3RydWN0IHZjcHUg
KnYsIHVpbnQ2NF90IGF0X3RzYykKPj4+Pj4+ICB7Cj4+Pj4+PiAgICAgIHN0cnVjdCBwbF90aW1l
ICpwbCA9IHYtPmRvbWFpbi0+YXJjaC5odm0ucGxfdGltZTsKPj4+Pj4+IC0gICAgdTY0IG5vdzsK
Pj4+Pj4+ICsgICAgc190aW1lX3Qgb2xkLCBuZXcsIG5vdyA9IGdldF9zX3RpbWVfZml4ZWQoYXRf
dHNjKSArIHBsLT5zdGltZV9vZmZzZXQ7Cj4+Pj4+PiAgCj4+Pj4+PiAgICAgIC8qIENhbGxlZCBm
cm9tIGRldmljZSBtb2RlbHMgc2hhcmVkIHdpdGggUFYgZ3Vlc3RzLiBCZSBjYXJlZnVsLiAqLwo+
Pj4+Pj4gICAgICBBU1NFUlQoaXNfaHZtX3ZjcHUodikpOwo+Pj4+Pj4gIAo+Pj4+Pj4gLSAgICBz
cGluX2xvY2soJnBsLT5wbF90aW1lX2xvY2spOwo+Pj4+Pj4gLSAgICBub3cgPSBnZXRfc190aW1l
X2ZpeGVkKGF0X3RzYykgKyBwbC0+c3RpbWVfb2Zmc2V0Owo+Pj4+Pj4gLQo+Pj4+Pj4gICAgICBp
ZiAoICFhdF90c2MgKQo+Pj4+Pj4gICAgICB7Cj4+Pj4+PiAtICAgICAgICBpZiAoIChpbnQ2NF90
KShub3cgLSBwbC0+bGFzdF9ndWVzdF90aW1lKSA+IDAgKQo+Pj4+Pj4gLSAgICAgICAgICAgIHBs
LT5sYXN0X2d1ZXN0X3RpbWUgPSBub3c7Cj4+Pj4+PiAtICAgICAgICBlbHNlCj4+Pj4+PiAtICAg
ICAgICAgICAgbm93ID0gKytwbC0+bGFzdF9ndWVzdF90aW1lOwo+Pj4+Pj4gKyAgICAgICAgZG8g
ewo+Pj4+Pj4gKyAgICAgICAgICAgIG9sZCA9IHBsLT5sYXN0X2d1ZXN0X3RpbWU7Cj4+Pj4+PiAr
ICAgICAgICAgICAgbmV3ID0gbm93ID4gcGwtPmxhc3RfZ3Vlc3RfdGltZSA/IG5vdyA6IG9sZCAr
IDE7Cj4+Pj4+PiArICAgICAgICB9IHdoaWxlICggY21weGNoZygmcGwtPmxhc3RfZ3Vlc3RfdGlt
ZSwgb2xkLCBuZXcpICE9IG9sZCApOwo+Pj4+Pgo+Pj4+PiBJIHdvbmRlciB3aGV0aGVyIHlvdSB3
b3VsZG4ndCBiZXR0ZXIgcmUtaW52b2tlIGdldF9zX3RpbWUoKSBpbgo+Pj4+PiBjYXNlIHlvdSBu
ZWVkIHRvIHJldHJ5IGhlcmUuIFNlZSBob3cgdGhlIGZ1bmN0aW9uIHByZXZpb3VzbHkKPj4+Pj4g
d2FzIGNhbGxlZCBvbmx5IGFmdGVyIHRoZSBsb2NrIHdhcyBhbHJlYWR5IGFjcXVpcmVkLgo+Pj4+
Cj4+Pj4gSWYgdGhlcmUgaXMgYSBjb25jdXJyZW50IHdyaXRlciwgd291bGRuJ3QgaXQganVzdCB1
cGRhdGUgcGwtPmxhc3RfZ3Vlc3RfdGltZQo+Pj4+IHdpdGggdGhlIG5ldyBnZXRfc190aW1lKCkg
YW5kIHRoZW4gd2Ugc3Vic2VxdWVudGx5IHdvdWxkIGp1c3QgdXNlIHRoZSBuZXcKPj4+PiB0aW1l
IG9uIHJldHJ5Pwo+Pj4KPj4+IFllcywgaXQgd291bGQsIGJ1dCB0aGUgbGF0ZW5jeSB1bnRpbCB0
aGUgcmV0cnkgYWN0dWFsbHkgb2NjdXJzCj4+PiBpcyB1bmtub3duIChpbiBwYXJ0aWN1bGFyIGlm
IFhlbiBpdHNlbGYgcnVucyB2aXJ0dWFsaXplZCkuIEkuZS4KPj4+IGluIHRoZSBhdF90c2MgPT0g
MCBjYXNlIEkgdGhpbmsgdGhlIHZhbHVlIHdvdWxkIGJldHRlciBiZQo+Pj4gcmUtY2FsY3VsYXRl
ZCBvbiBldmVyeSBpdGVyYXRpb24uCj4+Cj4+IFdoeSBkb2VzIGl0IG5lZWQgdG8gYmUgcmVjYWxj
dWxhdGVkIGlmIGEgY29uY3VycmVudCB3cml0ZXIgZGlkIHRoaXMKPj4gZm9yIHVzIGFscmVhZHkg
YW55d2F5IGFuZCAoZ2V0X3NfdGltZV9maXhlZChhdF90c2MpICsgcGwtPnN0aW1lX29mZnNldCkK
Pj4gdmFsdWUgaXMgY29tbW9uIGZvciBhbGwgb2YgdkNQVXM/IFllcywgaXQgbWlnaHQgcmVkdWNl
IGppdHRlciBzbGlnaHRseQo+PiBidXQgb3ZlcmFsbCBsYXRlbmN5IGNvdWxkIGNvbWUgZnJvbSBh
bnkgcG9pbnQgKGVzcGVjaWFsbHkgaW4gY2FzZSBvZgo+PiByaW5uaW5nIHZpcnR1YWxpemVkKSBh
bmQgaXQncyBpbXBvcnRhbnQganVzdCB0byBwcmVzZXJ2ZSBpbnZhcmlhbnQgdGhhdAo+PiB0aGUg
dmFsdWUgaXMgbW9ub3RvbmljIGFjcm9zcyB2Q1BVcy4KPiAKPiBJJ20gYWZyYWlkIEkgZG9uJ3Qg
Zm9sbG93OiBJZiB3ZSByZWx5IG9uIHJlbW90ZSBDUFVzIHVwZGF0aW5nCj4gcGwtPmxhc3RfZ3Vl
c3RfdGltZSwgdGhlbiB3aGF0IHdlJ2QgcmV0dXJuIGlzIHdoYXRldmVyIHdhcyBwdXQKPiB0aGVy
ZSBwbHVzIG9uZS4gV2hlcmVhcyB0aGUgY29ycmVjdCB2YWx1ZSBtaWdodCBiZSBkb3plbnMgb2YK
PiBjbG9ja3MgZnVydGhlciBhaGVhZC4KCkknbSBtZXJlbHkgc3RhdGluZyB0aGF0IHRoZXJlIG1p
Z2h0IGJlIG90aGVyIHBsYWNlcyBjb250cmlidXRpbmcgdG8Kaml0dGVyIGFuZCBnZXR0aW5nIHJp
ZCBvZiBvbmUgb2YgdGhlbSB3b3VsZG4ndCBzb2x2ZSB0aGUgaXNzdWUgY29tcGxldGVseQooaWYg
dGhlcmUgaXMgb25lKS4gQnV0IGFnYWluLCBJJ2QgbGlrZSB0aGUgY29kZSB0byBiZSB1bmlmaWVk
IHdpdGgKcHZfc29mdF9yZHRzYygpIHNvIHdpbGwgaGF2ZSB0byBpbnRyb2R1Y2UgcmUtY2FsY3Vs
YXRpb24gdGhlcmUgYXMgd2VsbC4KCj4+PiBBbnRoZXIgdGhpbmcgSSBub3RpY2Ugb25seSBub3cg
YXJlIHRoZSBtdWx0aXBsZSByZWFkcyBvZgo+Pj4gcGwtPmxhc3RfZ3Vlc3RfdGltZS4gV291bGRu
J3QgeW91IGJldHRlciBkbwo+Pj4KPj4+ICAgICAgICAgZG8gewo+Pj4gICAgICAgICAgICAgb2xk
ID0gQUNDRVNTX09OQ0UocGwtPmxhc3RfZ3Vlc3RfdGltZSk7Cj4+PiAgICAgICAgICAgICBuZXcg
PSBub3cgPiBvbGQgPyBub3cgOiBvbGQgKyAxOwo+Pj4gICAgICAgICB9IHdoaWxlICggY21weGNo
ZygmcGwtPmxhc3RfZ3Vlc3RfdGltZSwgb2xkLCBuZXcpICE9IG9sZCApOwo+Pj4KPj4+ID8KPj4K
Pj4gRmFpciBlbm91Z2gsIGFsdGhvdWdoIGV2ZW4gcmVhZGluZyBpdCBtdWx0aXBsZSB0aW1lcyB3
b3VsZG4ndCBjYXVzZQo+PiBhbnkgaGFybSBhcyBhbnkgaW5jb25zaXN0ZW5jeSB3b3VsZCBiZSBy
ZXNvbHZlZCBieSBjbXB4Y2hnIG9wLgo+IAo+IEFmYWljcyAibmV3IiwgaWYgY2FsY3VsYXRlZCBm
cm9tIGEgdmFsdWUgbGF0Y2hlZCBfZWFybGllcl8KPiB0aGFuICJvbGQiLCBjb3VsZCBjYXVzZSB0
aW1lIHRvIGFjdHVhbGx5IG1vdmUgYmFja3dhcmRzLiBSZWFkcwo+IGNhbiBiZSByZS1vcmRlcmVk
LCBhZnRlciBhbGwuCgpJIGRvbid0IHRoaW5rIGl0J3MgcG9zc2libGUgZHVlIHRvIHg4NiBtZW1v
cnkgbW9kZWwgYW5kIHRoZSBmYWN0CnBsLT5sYXN0X2d1ZXN0X3RpbWUgb25seSBnb2VzIGZvcndh
cmQuIEJ1dCBJIHdpbGwgY2hhbmdlIGl0IHRvCm1ha2UgaXQgZXhwbGljaXQgYW5kIGltcHJvdmUg
cmVhZGFiaWxpdHkuCgo+PiBJJ2QKPj4gcHJlZmVyIHRvIG1ha2UgaXQgaW4gYSBzZXBhcmF0ZSBj
b21taXQgdG8gdW5pZnkgaXQgd2l0aCBwdl9zb2Z0X3JkdHNjKCkuCj4gCj4gSSdkIGJlIGZpbmUg
aWYgeW91IGNoYW5nZWQgcHZfc29mdF9yZHRzYygpIGZpcnN0LCBhbmQgdGhlbgo+IG1hZGUgdGhl
IGNvZGUgaGVyZSBtYXRjaC4gQnV0IEkgZG9uJ3QgdGhpbmsgdGhlIGNvZGUgc2hvdWxkIGJlCj4g
aW50cm9kdWNlZCBpbiBvdGhlciB0aGFuIGl0cyAoZm9yIHRoZSB0aW1lIGJlaW5nKSBmaW5hbCBz
aGFwZS4KCk9rLCBJJ2xsIHB1dCBwdl9zb2Z0X3JkdHNjKCkgY29tbWl0IGZpcnN0LgoKSWdvcgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
