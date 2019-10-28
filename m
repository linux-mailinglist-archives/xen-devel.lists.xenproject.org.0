Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09586E7746
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 18:06:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP8OG-00027z-0r; Mon, 28 Oct 2019 17:01:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=es4G=YV=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iP8OE-00027u-LK
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 17:01:10 +0000
X-Inumbo-ID: 89cfdb28-f9a4-11e9-94fb-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89cfdb28-f9a4-11e9-94fb-12813bfff9fa;
 Mon, 28 Oct 2019 17:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572282069;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xmZ7Ssrgo9262eIpMGUae64n4kRDR6a/KUzz+3aSUuE=;
 b=Oe80OJVU1r3w67Ony9P93R4Di+KM6n+O5jowhf45QWGFp2tH1aVKfEbD
 f6TqIfiXEToEBEpnAlItwbUvaJAFSvVZS14F/w2Qut/RS9Cnwe4w38Y9e
 soncDvn82s6lZXMNRsQxicgxRh6LbbAJytefwLTyl6I3EsQrZ1Uhv2/ag 0=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: utNrU3b6/KeVL9ZiXNuP661+9n0G4xfePWCRW8HSHSlup+WDMGtLr1vW5+myeMnjJV1Zu07Dce
 k2W3tk2wV27jcwg8KOnpvF5HyjZ2RUa0m+xzIFn9Ui4mISsT2vuBpLqYJmkMrTv1Qfjdl5QefS
 jjY17LbDS/Qc/kV9/6RVy/bH9thbQLMd91vjH5w3m20CihzOCUCoQBVmgT+TloSdFWVWYni8Os
 oNXnltatT+yptPdZCpq7q/sjid2atG8VgwKAFfxFf5gq63j96P0thbcOv8KHJo72bsV6VYwXmS
 CUE=
X-SBRS: 2.7
X-MesageID: 7975029
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,240,1569297600"; 
   d="scan'208";a="7975029"
Date: Mon, 28 Oct 2019 17:01:07 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20191028170107.GC1162@perard.uk.xensource.com>
References: <20191025170505.2834957-1-anthony.perard@citrix.com>
 <20191025170505.2834957-2-anthony.perard@citrix.com>
 <23990.53361.316758.473175@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23990.53361.316758.473175@mariner.uk.xensource.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [RFC XEN PATCH for-4.13 1/4] libxl: Introduce
 libxl__ev_child_kill
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMTE6MjY6NDFBTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gSGkuICBUaGFua3MuICBUaGUgY29kZSBoZXJlIGxvb2tzIGJ5IGFuZCBsYXJnZSBnb29k
IHRvIG1lIGJ1dCBJIHRoaW5rCj4gdGhlIGRvY3MgYW5kIG1heWJlIHRoZSBsb2cgbWVzc2FnZXMg
bmVlZCBpbXByb3ZlbWVudC4KPiAKPiBBbnRob255IFBFUkFSRCB3cml0ZXMgKCJbUkZDIFhFTiBQ
QVRDSCBmb3ItNC4xMyAxLzRdIGxpYnhsOiBJbnRyb2R1Y2UgbGlieGxfX2V2X2NoaWxkX2tpbGwi
KToKPiA+IEFsbG93IHRvIGtpbGwgYSBjaGlsZCBhbmQgZGVyZWdpc3RlciB0aGUgY2FsbGJhY2sg
YXNzb2NpYXRlZCB3aXRoIGl0Lgo+IAo+IERpZCB5b3UgcmVhZCB0aGUgZG9jIGNvbW1lbnQgYWJv
dmUgbGlieGxfX2V2X2NoaWxkX2ZvcmssIGluCj4gbGlieGxfaW50ZXJuYWwuaCBuZWFyIGxpbmUg
MTE2MCA/ICBUaGUgdXNlciBvZiBsaWJ4bF9fZXZfY2hpbGQgaXMKPiBhbHJlYWR5IHBlcm1pdHRl
ZCB0byBraWxsIHRoZSBjaGlsZC4KPiAKPiBJbiB0aGlzIHBhdGNoIGFyZSBhZGRpbmcgYSBsYXll
ciB0byBtYWtlIHRoaXMgbW9yZSBjb252ZW5pZW50LCBhbmQgaW4KPiBwYXJ0aWN1bGFyIHRvIGxl
dCBhIGxpYnhsX19ldl9jaGlsZCB1c2VyIHRyYW5zZmVyIHJlc3BvbnNpYmlsaXR5IGZvcgo+IHJl
YXBpbmcgdGhlIGNoaWxkIGZyb20gaXRzIG93biBhcHBsaWNhdGlvbiBsb2dpYyBpbnRvIHRoZSBh
byBzeXN0ZW0uCj4gCj4gU29tZSBtb3JlIEFQSSBkb2N1bWVudGF0aW9uIHRvIG1ha2UgdGhpcyBt
dWNoIG1vcmUgZXhwbGljaXQgd291bGQgYmUKPiBnb29kIC0gaWUgdGhlIG1haW4gZG9jIGNvbW1l
bnQgdGhlIGZhY2lsaXR5IG5lZWRzIHRvIGRpc2N1c3MgaXQ6Cj4gIHwgKiBJdCBpcyBub3QgcG9z
c2libGUgdG8gImRlcmVnaXN0ZXIiIHRoZSBjaGlsZCBkZWF0aCBldmVudCBzb3VyY2UKPiBeIHRo
aXMgaXMgbm8gbG9uZ2VyIHRydWUgYWZ0ZXIgeW91ciBwYXRjaDsgaW5kZWVkIHRoYXQncyB0aGUg
cG9pbnQuCj4gCj4gU28gcGVyaGFwcwo+IAo+ID4gK3ZvaWQgbGlieGxfX2V2X2NoaWxkX2tpbGwo
bGlieGxfX2FvICphbywgbGlieGxfX2V2X2NoaWxkICpjaCkKPiAKPiBzaG91bGQgYmUgY2FsbGVk
Cj4gICAgbGlieGxfX2V2X2NoaWxkX3JlYXR0YWNoX3RvX2FvCj4gb3IKPiAgICBsaWJ4bF9fZXZf
Y2hpbGRfa2lsbF9kZXJlZ2lzdGVyCj4gb3Igc29tZXRoaW5nLCBhbmQgbWF5YmUgaXQgc2hvdWxk
IHRha2UgYSBzaWduYWwgbnVtYmVyID8KCkknbGwgcmV3b3JrIHRoZSBkb2N1bWVudGF0aW9uIHRv
IGV4cGxhaW4gdGhhdCB0aGUgQU8gd29uJ3QgY29tcGxldGUKdW50aWwgdGhlIGNoaWxkIGhhcyBi
ZWVuIHJlYXBlZC4gQWRkaW5nIHRoZSBzaWduYWwgbnVtYmVyIHRvIHRoZQpwYXJhbWV0ZXIgYW5k
IHJlbmFtaW5nIHRoZSBmdW5jdGlvbiBfa2lsbF9kZXJpZ2lzdGVyIHNvdW5kIGdvb2QuCgo+ID4g
K3N0YXRpYyB2b2lkIGRlcmVnaXN0ZXJlZF9jaGlsZF9jYWxsYmFjayhsaWJ4bF9fZWdjICplZ2Ms
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX19ldl9j
aGlsZCAqY2gsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBp
ZF90IHBpZCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50
IHN0YXR1cykKPiA+ICt7Cj4gPiArICAgIGV2X2NoaWxkX2tpbGxlZCAqY2sgPSBDT05UQUlORVJf
T0YoY2gsICpjaywgY2gpOwo+ID4gKyAgICBFR0NfR0M7Cj4gPiArCj4gPiArICAgIGlmIChzdGF0
dXMpIHsKPiA+ICsgICAgICAgIGxpYnhsX3JlcG9ydF9jaGlsZF9leGl0c3RhdHVzKENUWCwgWFRM
X0VSUk9SLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImtpbGxl
ZCBmb3JrIChkeWluZyBhcyBleHBlY3RlZCkiLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGlkLCBzdGF0dXMpOwo+ID4gKyAgICB9IGVsc2Ugewo+ID4gKyAgICAg
ICAgTE9HKERFQlVHLCAia2lsbGVkIGNoaWxkIGV4aXQgY2xlYW5seSwgdW5leHBlY3RlZCIpOwo+
IAo+IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBlbnRpcmVseSB1bmV4cGVjdGVkLiAgTWF5YmUgdGhl
IGNoaWxkIHdhcyBqdXN0Cj4gZXhpdGluZyBhdCB0aGUgcG9pbnQgd2hlcmUgbGlieGxfX2V2X2No
aWxkX2tpbGwgd2FzIGNhbGxlZC4KPiAKPiBBbmQsIHBsZWFzZSBjaGVjayBsb2cgdGhlIGFjdHVh
bCB3aG9sZSBleGl0IHN0YXR1cy4gICJzdGF0dXMiIGlzIGEKPiB3YWl0IHN0YXR1cy4gIFdlIHdh
bnQgdG8ga25vdyB3aGF0IHNpZ25hbCBpdCBkaWVkIGZyb20sIHdoZXRoZXIgaXQKPiBjb3JlIGR1
bXBlZCwgdGhlIGV4aXQgc3RhdHVzLCBldGMuICBQcm9iYWJseSwgeW91IHNob3VsZCBjYWxsCj4g
bGlieGxfcmVwb3J0X2NoaWxkX2V4aXRzdGF0dXMuCgpJdCBkb2VzIDstKS4gQnV0IEkgZ3Vlc3Mg
SSBjb3VsZCBjYWxsIGxpYnhsX3JlcG9ydF9jaGlsZF9leGl0c3RhdHVzKCkKdW5jb25kaXRpb25h
bGx5LCBzbyBldmVuIGlmIHN0YXR1cz0wLgoKPiA+IEBAIC0xODkxLDcgKzE4OTEsOCBAQCBzdGF0
aWMgYm9vbCBhb193b3JrX291dHN0YW5kaW5nKGxpYnhsX19hbyAqYW8pCj4gPiAgICAgICAqIGRl
Y3JlbWVudCBwcm9ncmVzc19yZXBvcnRzX291dHN0YW5kaW5nLCBhbmQgY2FsbAo+ID4gICAgICAg
KiBsaWJ4bF9fYW9fY29tcGxldGVfY2hlY2tfcHJvZ3Jlc3NfcmVwb3J0cy4KPiA+ICAgICAgICov
Cj4gPiAtICAgIHJldHVybiAhYW8tPmNvbXBsZXRlIHx8IGFvLT5wcm9ncmVzc19yZXBvcnRzX291
dHN0YW5kaW5nOwo+ID4gKyAgICByZXR1cm4gIWFvLT5jb21wbGV0ZSB8fCBhby0+cHJvZ3Jlc3Nf
cmVwb3J0c19vdXRzdGFuZGluZwo+ID4gKyAgICAgICAgfHwgYW8tPm91dHN0YW5kaW5nX2tpbGxl
ZF9jaGlsZDsKPiA+ICB9Cj4gCj4gSSB3b25kZXIgaWYgdGhpcyBzaG91bGQgZ2FpbiBhIG5ldyBk
ZWJ1ZyBtZXNzYWdlLiAgSWYgdGhlIGNoaWxkIGdldHMKPiBsb3N0IG9yIHN0dWNrIGZvciBzb21l
IHJlYXNvbiwgaXQgd2lsbCBvdGhlcndpc2UgcmVxdWlyZSBzZWFyY2hpbmcgdGhlCj4gcGFzdCBs
b2cgdG8gZmluZCBvdXQgd2h5IHRoZSBhbyBkb2Vzbid0IHJldHVybi4KCkRvIHlvdSBtZWFuIGFk
ZGluZyBhIGRlYnVnIG1lc3NhZ2UgaW4gbGlieGxfX2V2X2NoaWxkX2tpbGxfZGVyZWdpc3Rlcigp
PwpJdCdzIHByb2JhYmx5IGEgZ29vZCBpZGVhLgoKSSdsbCBhZGQ6CiAgICBMT0coREVCVUcsICJh
byAlcDogV2lsbCB3YWl0IHByb2Nlc3MgWyVsZF0gZGVhdGgiLCBhbywgcGlkKTsKCk9yIHNob3Vs
ZCB3ZSBhbHNvIGFkZCBhIGRlYnVnIGxvZyBpbiBsaWJ4bF9fYW9fY29tcGxldGUoKSA/CgoKLS0g
CkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
