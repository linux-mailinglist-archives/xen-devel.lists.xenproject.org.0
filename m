Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3851057C0
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 18:01:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXpna-0005HS-Cc; Thu, 21 Nov 2019 16:59:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXpnZ-0005HN-HB
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 16:59:17 +0000
X-Inumbo-ID: 3fead8c0-0c80-11ea-a33e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3fead8c0-0c80-11ea-a33e-12813bfff9fa;
 Thu, 21 Nov 2019 16:59:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4F3C9AF05;
 Thu, 21 Nov 2019 16:59:15 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20191021155718.28653-1-liuwe@microsoft.com>
 <20191021155718.28653-10-liuwe@microsoft.com>
 <b30133bd-1bf0-242a-fc92-851452806ce4@suse.com>
 <20191121162700.hpkrjcuebdylttjm@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a71f7987-751f-a13e-e73c-653a802ea30b@suse.com>
Date: Thu, 21 Nov 2019 17:59:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191121162700.hpkrjcuebdylttjm@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next v3 9/9] x86: introduce
 CONFIG_HYPERV and detection code
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Wei Liu <liuwe@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTEuMjAxOSAxNzoyNywgV2VpIExpdSB3cm90ZToKPiBPbiBGcmksIE5vdiAxNSwgMjAx
OSBhdCAwMzowNzoyOVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjEuMTAuMjAx
OSAxNzo1NywgV2VpIExpdSB3cm90ZToKPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9LY29uZmlnCj4+
PiArKysgYi94ZW4vYXJjaC94ODYvS2NvbmZpZwo+Pj4gQEAgLTE2NCw2ICsxNjQsMTUgQEAgZW5k
Y2hvaWNlCj4+PiAgY29uZmlnIEdVRVNUCj4+PiAgCWJvb2wKPj4+ICAKPj4+ICtjb25maWcgSFlQ
RVJWX0dVRVNUCj4+PiArCWRlZl9ib29sIG4KPj4+ICsJc2VsZWN0IEdVRVNUCj4+PiArCXByb21w
dCAiSHlwZXItViBHdWVzdCIKPj4KPj4gUGxlYXNlIGNhbiB5b3UgYXZvaWQgZm9sbG93aW5nIHRo
ZSBiYWQgZXhhbXBsZSBYRU5fR1VFU1QgZ2l2ZXMgKGFuZAo+PiBwZXJoYXBzIGV2ZW4gdGFrZSB0
aGUgb3Bwb3J0dW5pdHkgaGVyZSBvciBpbiB0aGUgZWFybGllciBwYXRjaAo+PiBhZGRpbmcgR1VF
U1QgdG8gY2hhbmdlIHRoYXQgb25lIGFzIHdlbGwpPyBXaGF0IHlvdSB3YW50IGlzCj4+Cj4+IGNv
bmZpZyBIWVBFUlZfR1VFU1QKPj4gCWJvb2wgIkh5cGVyLVYgR3Vlc3QiCj4+IAlzZWxlY3QgR1VF
U1QKPiAKPiBBY2suCj4gCj4+Cj4+PiAtLS0gL2Rldi9udWxsCj4+PiArKysgYi94ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4+PiBAQCAtMCwwICsxLDU0IEBACj4+PiArLyoqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKgo+Pj4gKyAqIGFyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+
Pj4gKyAqCj4+PiArICogU3VwcG9ydCBmb3IgZGV0ZWN0aW5nIGFuZCBydW5uaW5nIHVuZGVyIEh5
cGVyLVYuCj4+PiArICoKPj4+ICsgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91
IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQo+Pj4gKyAqIGl0IHVuZGVyIHRoZSB0
ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5Cj4+
PiArICogdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0
aGUgTGljZW5zZSwgb3IKPj4+ICsgKiAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9u
Lgo+Pj4gKyAqCj4+PiArICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3Bl
IHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCj4+PiArICogYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZ
OyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKPj4+ICsgKiBNRVJDSEFOVEFC
SUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCj4+PiAr
ICogR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KPj4+ICsgKgo+
Pj4gKyAqIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlCj4+PiArICogYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IElmIG5vdCwg
c2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KPj4+ICsgKgo+Pj4gKyAqIENvcHly
aWdodCAoYykgMjAxOSBNaWNyb3NvZnQuCj4+PiArICovCj4+PiArI2luY2x1ZGUgPHhlbi9pbml0
Lmg+Cj4+PiArCj4+PiArI2luY2x1ZGUgPGFzbS9ndWVzdC5oPgo+Pj4gKwo+Pj4gK2Jvb2wgX19p
bml0IGh5cGVydl9wcm9iZSh2b2lkKQo+Pj4gK3sKPj4+ICsgICAgdWludDMyX3QgZWF4LCBlYngs
IGVjeCwgZWR4Owo+Pj4gKwo+Pj4gKyAgICBjcHVpZCgweDQwMDAwMDAwLCAmZWF4LCAmZWJ4LCAm
ZWN4LCAmZWR4KTsKPj4+ICsgICAgaWYgKCAhKChlYnggPT0gMHg3MjYzNjk0ZCkgJiYgIC8qICJN
aWNyIiAqLwo+Pj4gKyAgICAgICAgICAgKGVjeCA9PSAweDY2NmY3MzZmKSAmJiAgLyogIm9zb2Yi
ICovCj4+PiArICAgICAgICAgICAoZWR4ID09IDB4NzY0ODIwNzQpKSApICAvKiAidCBIdiIgKi8K
Pj4+ICsgICAgICAgIHJldHVybiBmYWxzZTsKPj4+ICsKPj4+ICsgICAgY3B1aWQoMHg0MDAwMDAw
MSwgJmVheCwgJmVieCwgJmVjeCwgJmVkeCk7Cj4+PiArICAgIGlmICggZWF4ICE9IDB4MzEyMzc2
NDggKSAgICAvKiBIdiMxICovCj4+PiArICAgICAgICByZXR1cm4gZmFsc2U7Cj4+PiArCj4+PiAr
ICAgIHJldHVybiB0cnVlOwo+Pj4gK30KPj4+ICsKPj4+ICtzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMg
aHlwZXJ2X29wcyA9IHsKPj4KPj4gY29uc3QgYWdhaW4uCj4+Cj4+PiAtLS0gYS94ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2
aXNvci5jCj4+PiBAQCAtNDMsNiArNDMsMTQgQEAgYm9vbCBoeXBlcnZpc29yX3Byb2JlKHZvaWQp
Cj4+PiAgICAgIH0KPj4+ICAjZW5kaWYKPj4+ICAKPj4+ICsjaWZkZWYgQ09ORklHX0hZUEVSVl9H
VUVTVAo+Pj4gKyAgICBpZiAoIGh5cGVydl9wcm9iZSgpICkKPj4+ICsgICAgewo+Pj4gKyAgICAg
ICAgaG9wcyA9ICZoeXBlcnZfb3BzOwo+Pj4gKyAgICAgICAgcmV0dXJuIHRydWU7Cj4+PiArICAg
IH0KPj4+ICsjZW5kaWYKPj4KPj4gVGhpcyByZWN1cnJpbmcgI2lmZGVmIENPTkZJR18qX0dVRVNU
IGlzIGdvaW5nIHRvIHN0YXJ0IGxvb2tpbmcgdWdseQo+PiB0aGUgbGF0ZXN0IHdoZW4gb25lIG9y
IHR3byBtb3JlIGdldCBhZGRlZC4gUGVyaGFwcyBiZXR0ZXIgcHJvdmlkaW5nCj4+ICpfcHJvYmUo
KSBzdHVicyByZXR1cm5pbmcgZmFsc2UsIGFuZCAobGlrZSB3ZSBkbyBlbHNld2hlcmUpIHJlbHkg
b24KPj4gRENFIHRvIGdldCByaWQgb2YgdGhlICpfb3BzIHJlZmVyZW5jZT8gKEFuZCByZWFsbHkg
eW91IGFscmVhZHkgaGF2ZQo+PiBzdWNoIGEgc3R1YiAtIGFsbCB5b3UgbmVlZCB0byBkbyBpcyBw
dXQgdGhlIGh5cGVydl9vcHMgZGVjbGFyYXRpb24KPj4gb3V0c2lkZSB0aGUgI2lmZGVmIChidXQg
cmVhZCBvbikuCj4+Cj4+IEFsc28gaG93IGFib3V0IGhhdmluZyAqX3Byb2JlKCkgcmV0dXJuIHRo
ZSBhZGRyZXNzIG9mICpfb3BzLCBzdWNoCj4+IHRoYXQgdGhlIGxhdHRlciBjb3VsZCBhbGwgYmVj
b21lIHN0YXRpYz8KPiAKPiBQcmV2aW91c2x5IHlvdSBtYWRlIGEgc3VnZ2VzdGlvbiB0byBtYWtl
IHByb2JlIHJldHVybiB0aGUgbmFtZSBvZiB0aGUKPiBoeXBlcnZpc29yLiBIZXJlIHlvdSBhc2sg
Zm9yIGFkZHJlc3Mgb2Ygb3BzLiBJIGFjdHVhbGx5IHByZWZlciB0aGUKPiBtZXRob2Qgc3VnZ2Vz
dGVkIGhlcmUsIGJ1dCB0aGlzIG1lYW5zIEkgd2lsbCBuZWVkIHRvIGtlZXAKPiBoeXBlcnZpc29y
X25hbWUgYXJvdW5kLgoKSXMgdGhlcmUgYWN0dWFsbHkgYW55IHVzZXIgb2YgdGhlIG5hbWUgZmll
bGQgb3RoZXIgdGhhbiB0aGUgY2FsbGVyCm9mIHByb2JlPyBJZiBub3QsIHN1cmVseSB0aGF0IGNh
bGxlciBjb3VsZCBhY2Nlc3MgdGhlIG5hbWUgZmllbGQKd2l0aG91dCBhIGh5cGVydmlzb3JfbmFt
ZSgpIHdyYXBwZXIuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
