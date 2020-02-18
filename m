Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C9E16272A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 14:32:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j42wu-0004Sj-JW; Tue, 18 Feb 2020 13:30:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9Xbw=4G=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j42wt-0004PP-9X
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 13:30:03 +0000
X-Inumbo-ID: c3659844-5252-11ea-ade5-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3659844-5252-11ea-ade5-bc764e2007e4;
 Tue, 18 Feb 2020 13:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582032602;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=mPeP+S9fkM+esBI/MRoV0nrRrqmU9PCFZa8p/r/SUgY=;
 b=eBKEkNJ7flV4vzdlazV+ijNYhtjevZY0X6eOATgc4geQCGOwguGIgH6q
 gjZBVV77LgLNrBBZigTOu8s8pPBIEIQopys/mZrraFAikZz4/38BXDpFD
 BnT6FxzkH1fnKqB6r2HBC+jEOWcIhWBw9i4vRPq+JdWzC+3+f6sU4pc89 c=;
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
IronPort-SDR: MwlJW4Mp3QgsE7inaK9R7Ev3ejOFE0NYQl5WVv8MRfwMOKl/PMpF695/0zDWtlWrzU8PrI3jfn
 HPOomTH/OoPC4152qTDlfqZbA/+N5QKOqrxfzL+QHgo+wrtZjBsfE3dlZJrVKslMq5lXbxFvOj
 7Dyf0qu/g88dPWRsAOu0yW0ZbTOw1QRJHYaMB07ANpBs1OXAj0yeLSlHlygu8EqcoT/B8K7Aso
 NAjdcBQ4AYsEkS1kYe7TodOIIw0KW7GNNjgq4Q41ikvG0Q9FjzYHiEO3uqukq6pdMTcJTbECP3
 GM4=
X-SBRS: 2.7
X-MesageID: 12791871
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,456,1574139600"; d="scan'208";a="12791871"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200217184324.73762-1-roger.pau@citrix.com>
 <20200217184324.73762-6-roger.pau@citrix.com>
 <8faffe76-2ab2-170a-4d42-228254fc57ed@citrix.com>
 <20200218111039.GS4679@Air-de-Roger>
 <1071be16-b929-a251-f2f9-a55d40ce2e53@citrix.com>
 <20200218112238.GT4679@Air-de-Roger>
 <301e4658-3dc2-de74-ae9d-3f13bc2f1502@citrix.com>
 <20200218114602.GU4679@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <4509c89d-78ea-18e1-843d-905c617b7bd6@citrix.com>
Date: Tue, 18 Feb 2020 13:29:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200218114602.GU4679@Air-de-Roger>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 5/6] x86/smp: use a dedicated scratch
 cpumask in send_IPI_mask
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Sander Eikelenboom <linux@eikelenboom.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDIvMjAyMCAxMTo0NiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIEZl
YiAxOCwgMjAyMCBhdCAxMTozNTozN0FNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pgo+
PiBPbiAxOC8wMi8yMDIwIDExOjIyLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4gT24gVHVl
LCBGZWIgMTgsIDIwMjAgYXQgMTE6MjE6MTJBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToK
Pj4+PiBPbiAxOC8wMi8yMDIwIDExOjEwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4+PiBP
biBUdWUsIEZlYiAxOCwgMjAyMCBhdCAxMDo1Mzo0NUFNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdy
b3RlOgo+Pj4+Pj4gT24gMTcvMDIvMjAyMCAxODo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+
Pj4+Pj4+IEBAIC02Nyw3ICs2OCwyMCBAQCBzdGF0aWMgdm9pZCBzZW5kX0lQSV9zaG9ydGN1dCh1
bnNpZ25lZCBpbnQgc2hvcnRjdXQsIGludCB2ZWN0b3IsCj4+Pj4+Pj4gIHZvaWQgc2VuZF9JUElf
bWFzayhjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGludCB2ZWN0b3IpCj4+Pj4+Pj4gIHsKPj4+Pj4+
PiAgICAgIGJvb2wgY3B1c19sb2NrZWQgPSBmYWxzZTsKPj4+Pj4+PiAtICAgIGNwdW1hc2tfdCAq
c2NyYXRjaCA9IHRoaXNfY3B1KHNjcmF0Y2hfY3B1bWFzayk7Cj4+Pj4+Pj4gKyAgICBjcHVtYXNr
X3QgKnNjcmF0Y2ggPSB0aGlzX2NwdShzZW5kX2lwaV9jcHVtYXNrKTsKPj4+Pj4+PiArICAgIHVu
c2lnbmVkIGxvbmcgZmxhZ3M7Cj4+Pj4+Pj4gKwo+Pj4+Pj4+ICsgICAgaWYgKCBpbl9tYygpIHx8
IGluX25taSgpICkKPj4+Pj4+PiArICAgIHsKPj4+Pj4+PiArICAgICAgICAvKgo+Pj4+Pj4+ICsg
ICAgICAgICAqIFdoZW4gaW4gI01DIG9yICNNTkkgY29udGV4dCBYZW4gY2Fubm90IHVzZSB0aGUg
cGVyLUNQVSBzY3JhdGNoIG1hc2sKPj4+Pj4+PiArICAgICAgICAgKiBiZWNhdXNlIHdlIGhhdmUg
bm8gd2F5IHRvIGF2b2lkIHJlZW50cnksIHNvIGRvIG5vdCB1c2UgdGhlIEFQSUMKPj4+Pj4+PiAr
ICAgICAgICAgKiBzaG9ydGhhbmQuCj4+Pj4+Pj4gKyAgICAgICAgICovCj4+Pj4+Pj4gKyAgICAg
ICAgYWx0ZXJuYXRpdmVfdmNhbGwoZ2VuYXBpYy5zZW5kX0lQSV9tYXNrLCBtYXNrLCB2ZWN0b3Ip
Owo+Pj4+Pj4+ICsgICAgICAgIHJldHVybjsKPj4+Pj4+IFRoZSBzZXQgb2YgdGhpbmdzIHlvdSBj
YW4gc2FmZWx5IGRvIGluIGFuIE5NSS9NQ0UgaGFuZGxlciBpcyBzbWFsbCwgYW5kCj4+Pj4+PiBk
b2VzIG5vdCBpbmNsdWRlIHNlbmRpbmcgSVBJcy7CoCAoSW4gcmVhbGl0eSwgaWYgeW91J3JlIHVz
aW5nIHgyYXBpYywgaXQKPj4+Pj4+IGlzIHNhZmUgdG8gc2VuZCBhbiBJUEkgYmVjYXVzZSB0aGVy
ZSBpcyBubyByaXNrIG9mIGNsb2JiZXJpbmcgSUNSMgo+Pj4+Pj4gYmVoaW5kIHlvdXIgb3V0ZXIg
Y29udGV4dCdzIGJhY2spLgo+Pj4+Pj4KPj4+Pj4+IEhvd2V2ZXIsIGlmIHdlIGVzY2FsYXRlIGZy
b20gTk1JL01DRSBjb250ZXh0IGludG8gY3Jhc2ggY29udGV4dCwgdGhlbgo+Pj4+Pj4gYW55dGhp
bmcgZ29lcy7CoCBJbiByZWFsaXR5LCB3ZSBvbmx5IGV2ZXIgc2VuZCBOTUlzIGZyb20gdGhlIGNy
YXNoIHBhdGgsCj4+Pj4+PiBhbmQgdGhhdCBpcyBub3QgcGVybWl0dGVkIHRvIHVzZSBhIHNob3J0
aGFuZCwgbWFraW5nIHRoaXMgY29kZSBkZWFkLgo+Pj4+PiBUaGlzIHdhcyByZXF1ZXN0ZWQgYnkg
SmFuLCBhcyBzYWZldHkgbWVhc3VyZQo+Pj4+IFRoYXQgbWF5IGJlLCBidXQgaXQgZG9lc24ndCBt
ZWFuIGl0IGlzIGNvcnJlY3QuwqAgSWYgZXhlY3V0aW9uIGV2ZXIKPj4+PiBlbnRlcnMgdGhpcyBm
dW5jdGlvbiBpbiBOTUkvTUNFIGNvbnRleHQsIHRoZXJlIGlzIGEgcmVhbCwKPj4+PiBzdGF0ZS1j
b3JydXB0aW5nIGJ1ZywgaGlnaGVyIHVwIHRoZSBjYWxsIHN0YWNrLgo+Pj4gQWNrLCB0aGVuIEkg
Z3Vlc3Mgd2Ugc2hvdWxkIGp1c3QgQlVHKCkgaGVyZSBpZiBldmVyIGNhbGxlZCBmcm9tICNOTUkK
Pj4+IG9yICNNQyBjb250ZXh0Pwo+PiBXZWxsLsKgIFRoZXJlIGlzIGEgcmVhc29uIEkgc3VnZ2Vz
dGVkIHJlbW92aW5nIGl0LCBhbmQgbm90IHVzaW5nIEJVRygpLgo+Pgo+PiBJZiBOTUkvTUNFIGNv
bnRleHQgZXNjYWxhdGVzIHRvIGNyYXNoIGNvbnRleHQsIHdlIGRvIG5lZWQgdG8gc2VuZCBOTUlz
LsKgCj4+IEl0IHdvbid0IGJlIHRoaXMgZnVuY3Rpb24gc3BlY2lmaWNhbGx5LCBidXQgaXQgd2ls
bCBiZSBwYXJ0IG9mIHRoZQo+PiBnZW5lcmFsIElQSSBpbmZyYXN0cnVjdHVyZS4KPj4KPj4gV2Ug
ZGVmaW5pdGVseSBkb24ndCB3YW50IHRvIGdldCBpbnRvIHRoZSBnYW1lIG9mIHRyeWluZyB0byBj
bG9iYmVyIGVhY2gKPj4gb2YgdGhlIHN0YXRlIHZhcmlhYmxlcywgc28gdGhlIG9ubHkgdGhpbmcg
dGhyb3dpbmcgQlVHKCkncyBhcm91bmQgaW4KPj4gdGhpcyBhcmVhIHdpbGwgZG8gaXMgbWFrZSB0
aGUgY3Jhc2ggcGF0aCBtb3JlIGZyYWdpbGUuCj4gSSBzZWUsIHBhbmlja2luZyBpbiBzdWNoIGNv
bnRleHQgd2lsbCBqdXN0IGNsb2JiZXIgdGhlIHByZXZpb3VzIGNyYXNoCj4gaGFwcGVuZWQgaW4g
Tk1JL01DIGNvbnRleHQuCj4KPiBTbyB5b3Ugd291bGQgcmF0aGVyIGtlZXAgdGhlIGN1cnJlbnQg
dmVyc2lvbiBvZiBmYWxsaW5nIGJhY2sgdG8gdGhlCj4gdXNhZ2Ugb2YgdGhlIG5vbi1zaG9ydGhh
bmQgSVBJIHNlbmRpbmcgcm91dGluZSBpbnN0ZWFkIG9mIHBhbmlja2luZz8KPgo+IFdoYXQgYWJv
dXQ6Cj4KPiBpZiAoIGluX21jKCkgfHwgaW5fbm1pKCkgKQo+IHsKPiAgICAgLyoKPiAgICAgICog
V2hlbiBpbiAjTUMgb3IgI01OSSBjb250ZXh0IFhlbiBjYW5ub3QgdXNlIHRoZSBwZXItQ1BVIHNj
cmF0Y2ggbWFzawo+ICAgICAgKiBiZWNhdXNlIHdlIGhhdmUgbm8gd2F5IHRvIGF2b2lkIHJlZW50
cnksIHNvIGRvIG5vdCB1c2UgdGhlIEFQSUMKPiAgICAgICogc2hvcnRoYW5kLiBUaGUgb25seSBJ
UEkgdGhhdCBzaG91bGQgYmUgc2VudCBmcm9tIHN1Y2ggY29udGV4dAo+ICAgICAgKiBpcyBhICNO
TUkgdG8gc2h1dGRvd24gdGhlIHN5c3RlbSBpbiBjYXNlIG9mIGEgY3Jhc2guCj4gICAgICAqLwo+
ICAgICBpZiAoIHZlY3RvciA9PSBBUElDX0RNX05NSSApCj4gICAgIAlhbHRlcm5hdGl2ZV92Y2Fs
bChnZW5hcGljLnNlbmRfSVBJX21hc2ssIG1hc2ssIHZlY3Rvcik7Cj4gICAgIGVsc2UKPiAgICAg
ICAgIEJVRygpOwo+Cj4gICAgIHJldHVybjsKPiB9CgpIb3cgZG8geW91IGludGVudCB0byB0ZXN0
IGl0PwoKSXQgbWlnaHQgYmUgY29ycmVjdCBub3dbKl0gYnV0IGl0IGRvZXNuJ3QgcHJvdGVjdCBh
Z2FpbnN0IHNvbWVvbmUKbW9kaWZ5aW5nIGNvZGUsIHZpb2xhdGluZyB0aGUgY29uc3RyYWludCwg
YW5kIHRoaXMgZ29pbmcgdW5ub3RpY2VkCmJlY2F1c2UgdGhlIGFib3ZlIGNvZGVwYXRoIHdpbGwg
b25seSBiZSBlbnRlcmVkIGluIGV4Y2VwdGlvbmFsCmNpcmN1bXN0YW5jZXMuwqAgU29kcyBsYXcg
c2F5cyB0aGF0IGNvZGUgaW5zaWRlIHRoYXQgYmxvY2sgaXMgZmlyc3QgZ29pbmcKdG8gYmUgdGVz
dGVkIGluIGEgY3VzdG9tZXIgZW52aXJvbm1lbnQuCgpBU1NFUlQoKXMgd291bGQgYmUgbGVzcyBi
YWQsIGJ1dCBhbnkgdGVjaG5pY2FsIGNvdW50ZXJtZWFzdXJlcywgaG93ZXZlcgp3ZWxsIGludGVu
dGlvbmVkLCBnZXQgaW4gdGhlIHdheSBvZiB0aGUgY3Jhc2ggcGF0aCBmdW5jdGlvbmluZyB3aGVu
IGl0Cm1hdHRlcnMgbW9zdC4KCn5BbmRyZXcKClsqXSBUaGVyZSBpcyBhIGxvbmcgb3V0c3RhbmRp
bmcgYnVnIGluIG1hY2hpbmVfcmVzdGFydCgpIHdoaWNoIGJsaW5kbHkKZW5hYmxlcyBpbnRlcnJ1
cHRzIGFuZCBJUElzIENQVSAwLsKgIFlvdSBjYW4gZ2V0IGhlcmUgaW4gdGhlIG1pZGRsZSBvZiBh
CmNyYXNoLCBhbmQgdGhpcyBCVUcoKSB3aWxsIHRyaWdnZXIgaW4gYXQgbGVhc3Qgb25lIGNhc2Ug
SSd2ZSBzZWVuIGJlZm9yZS4KCkZpeGluZyB0aGlzIGlzbid0IGEgNSBtaW51dGUgam9iLCBhbmQg
aXQgaGFzbid0IGJ1YmJsZWQgc3VmZmljaWVudGx5IHVwCm15IFRPRE8gbGlzdCB5ZXQuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
