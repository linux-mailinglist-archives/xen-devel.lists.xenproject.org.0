Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C315109CB1
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 12:00:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZYWQ-0004QI-VC; Tue, 26 Nov 2019 10:56:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5kHA=ZS=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iZYWP-0004QD-0n
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 10:56:41 +0000
X-Inumbo-ID: 6c07f9d8-103b-11ea-a39d-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c07f9d8-103b-11ea-a39d-12813bfff9fa;
 Tue, 26 Nov 2019 10:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574765799;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ZyD5l6mxSG9c9sLekt34YmmQfL7c21gjEHh33zdB6Zg=;
 b=IhlduQWXAZQU1kAV4y36JynQXo2K1R24Cfz5jeW+mCdrpWSRPuhwkQvs
 r1lqSUlvRPpSqwkRVID/rBCeIYM3SlMuLjZmbmmMn4Mvq3lPokwMOAy7w
 T263let4RvA4nr7qJTBPCmCDMv4SUIkKNO9fsL5pyiD9Iuz2QABxxjFAL I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lKpBMo94t7s8tJxuHvH0UI/98hCTPT0nMRj9ZhCsb3dLsvzsLiQannNQU+lRM3Q8iu/9+7tvhH
 2SLrpqFd1BKnVuy2le9ykVquz3a1cis42jZqfIFx3DvL42vvu97bYwphcQzXYjKL+n4H1Q+y5C
 l5F8iztMpq0PUd5tdGpXUwJS8NhYaJ9TLaKZT+UR69DEKdSvov8nRkH8nHtiwxD3s5gldnV5WV
 fbFZlyEMTRi4axMzPSkgWQ1TeccSYNSXTyAWSxDc+VI5s6D9Lctqwn3bLUBp2fV/jf8Dzg1NHK
 cgw=
X-SBRS: 2.7
X-MesageID: 9199145
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,245,1571716800"; 
   d="scan'208";a="9199145"
To: Jan Beulich <jbeulich@suse.com>
References: <20191125123923.2000028-1-george.dunlap@citrix.com>
 <7b6f4664-7d59-a8f9-2c29-67edba04ac17@suse.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <a9ac5c61-642e-4398-6a2f-11f3fbc9f756@citrix.com>
Date: Tue, 26 Nov 2019 10:56:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7b6f4664-7d59-a8f9-2c29-67edba04ac17@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC] x86: Don't increase ApicIdCoreSize past
 7
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
Cc: Juergen Gross <jgross@suse.com>, Steven
 Haigh <netwiz@crc.id.au>, WeiLiu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Andreas Kinzler <hfp@posteo.de>,
 Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMjUvMTkgMTI6NDkgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI1LjExLjIwMTkg
MTM6MzksIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+IENoYW5nZXNldCBjYTJlZWU5MmRmNDQgKCJ4
ODYsIGh2bTogRXhwb3NlIGhvc3QgY29yZS9IVCB0b3BvbG9neSB0byBIVk0KPj4gZ3Vlc3RzIikg
YXR0ZW1wdGVkIHRvICJmYWtlIHVwIiBhIHRvcG9sb2d5IHdoaWNoIHdvdWxkIGluZHVjZSBndWVz
dAo+PiBvcGVyYXRpbmcgc3lzdGVtcyB0byBub3QgdHJlYXQgdmNwdXMgYXMgc2libGluZyBoeXBl
cnRocmVhZHMuICBUaGlzCj4+IGludm9sdmVkIGFjdHVhbGx5IHJlcG9ydGluZyBoeXBlcnRocmVh
ZGluZyBhcyBhdmFpbGFibGUsIGJ1dCBnaXZpbmcKPj4gdmNwdXMgZXZlcnkgb3RoZXIgQXBpY0lk
OyB3aGljaCBpbiB0dXJuIGxlZCB0byBkb3VibGluZyB0aGUgQXBpY0lkcwo+PiBwZXIgY29yZSBi
eSBidW1waW5nIHRoZSBBcGljSWRDb3JlU2l6ZSBieSBvbmUuICBJbiBwYXJ0aWN1bGFyLCBSeXpl
bgo+PiAzeHh4IHNlcmllcyBwcm9jZXNzb3JzLCBhbmQgcmVwb3J0ZWRseSBFUFlDICJSb21lIiBj
cHVzIC0tIGhhdmUgYW4KPj4gQXBpY0lkQ29yZVNpemUgb2YgNzsgdGhlICJmYWtlIiB0b3BvbG9n
eSBpbmNyZWFzZXMgdGhpcyB0byA4Lgo+Pgo+PiBVbmZvcnR1bmF0ZWx5LCBXaW5kb3dzIHJ1bm5p
bmcgb24gbW9kZXJuIEFNRCBoYXJkd2FyZSAtLSBpbmNsdWRpbmcKPj4gUnl6ZW4gM3h4eCBzZXJp
ZXMgcHJvY2Vzc29ycywgYW5kIHJlcG9ydGVkbHkgRVBZQyAiUm9tZSIgY3B1cyAtLQo+PiBkb2Vz
bid0IHNlZW0gdG8gY29wZSB3aXRoIHRoaXMgdmFsdWUgYmVpbmcgaGlnaGVyIHRoYW4gNy4gIChM
aW51eAo+PiBndWVzdHMgaGF2ZSBzbyBmYXIgY29udGludWVkIHRvIGNvcGUuKQo+Pgo+PiBBICJw
cm9wZXIiIGZpeCBpcyBjb21wbGljYXRlZCBhbmQgaXQncyB0b28gbGF0ZSB0byBmaXggaXQgZWl0
aGVyIGZvcgo+PiA0LjEzLCBvciB0byBiYWNrcG9ydCB0byBzdXBwb3J0ZWQgYnJhbmNoZXMuICBB
cyBhIHNob3J0LXRlcm0gZml4LAo+PiBsaW1pdCB0aGlzIHZhbHVlIHRvIDcuCj4+Cj4+IFRoaXMg
ZG9lcyBtZWFuIHRoYXQgYSBMaW51eCBndWVzdCwgYm9vdGVkIG9uIHN1Y2ggYSBzeXN0ZW0gd2l0
aG91dAo+PiB0aGlzIGNoYW5nZSwgYW5kIHRoZW4gbWlncmF0aW5nIHRvIGEgc3lzdGVtIHdpdGgg
dGhpcyBjaGFuZ2UsIHdpdGgKPj4gbW9yZSB0aGFuIDY0IHZjcHVzLCB3b3VsZCBzZWUgYW4gYXBw
YXJlbnQgdG9wb2xvZ3kgY2hhbmdlLiAgVGhpcyBpcyBhCj4+IGxvdyBlbm91Z2ggcmlzayBpbiBw
cmFjdGljZSB0aGF0IGVuYWJsaW5nIHRoaXMgbGltaXQgdW5pbGF0ZXJhbGx5LCB0bwo+PiBhbGxv
dyBvdGhlciBndWVzdHMgdG8gYm9vdCB3aXRob3V0IG1hbnVhbCBpbnRlcnZlbnRpb24sIGlzIHdv
cnRoIGl0Lgo+Pgo+PiBSZXBvcnRlZC1ieTogU3RldmVuIEhhaWdoIDxuZXR3aXpAY3JjLmlkLmF1
Pgo+PiBSZXBvcnRlZC1ieTogQW5kcmVhcyBLaW56bGVyIDxoZnBAcG9zdGVvLmRlPgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4gCj4g
QWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiB3aXRoIC4uLgo+IAo+
PiAtLS0gYS90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwo+PiArKysgYi90b29scy9saWJ4Yy94
Y19jcHVpZF94ODYuYwo+PiBAQCAtNjE2LDEwICs2MTYsMTUgQEAgaW50IHhjX2NwdWlkX2FwcGx5
X3BvbGljeSh4Y19pbnRlcmZhY2UgKnhjaCwgdWludDMyX3QgZG9taWQsCj4+ICAgICAgICAgICAg
ICAgKiAtIGdvaW5nIG91dCBvZiBzeW5jIHdpdGggbGVhZiAxIEVCWFsyMzoxNl0sCj4+ICAgICAg
ICAgICAgICAgKiAtIGluY3JlbWVudGluZyBBcGljSWRDb3JlU2l6ZSB3aGVuIGl0J3MgemVybyAo
d2hpY2ggY2hhbmdlcyB0aGUKPj4gICAgICAgICAgICAgICAqICAgbWVhbmluZyBvZiBiaXRzIDc6
MCkuCj4+ICsgICAgICAgICAgICAgKgo+PiArICAgICAgICAgICAgICogVVBEQVRFOiBJIGFkZGl0
aW9uIHRvIGF2b2lkaW5nIG92ZXJmbG93LCBzb21lCj4gCj4gLi4uIHRoaXMgYmVjb21pbmcgIlVQ
REFURTogSW4gLi4uIi4KCkdhaC4uLiBTb3JyeSwgbWVhbnQgdG8gYXBwbHkgdGhpcyBjaGFuZ2Ug
b24gY2hlY2staW4sIGJ1dCBzY3Jld2VkIGl0IHVwCihhY2NpZGVudGFsbHkgZWRpdGVkIHRoZSB3
cm9uZyBidWZmZXIpLiAgTGV0IG1lIGtub3cgaWYgeW91IHdhbnQgYQpmb2xsb3ctdXAgcGF0Y2gg
dG8gZml4IGl0LgoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
