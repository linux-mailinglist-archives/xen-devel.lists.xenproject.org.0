Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0CB16C10C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 13:39:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6ZSy-0003Dk-K6; Tue, 25 Feb 2020 12:37:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nHfT=4N=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j6ZSw-0003DW-Qb
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 12:37:34 +0000
X-Inumbo-ID: 9840e6cc-57cb-11ea-aba8-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9840e6cc-57cb-11ea-aba8-bc764e2007e4;
 Tue, 25 Feb 2020 12:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582634254;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=zN7pNCyS1s3s6jryOkARGkqV/e/SfrPYGgjOvJpMwQI=;
 b=LaN10zWUn4BiM+ZKO7mzP4vCEJDkmhf2y5bM1mxzuaTCjuh8bAKvS0s3
 lb1ktapTP9HAIx0mM+Gdtb3cyNU0DaBWhJgWXy5u8Kt2IVzZzZEZ1C6vt
 R2kOZUfIPYBwTxX4RNJ+N62+Jtfq86batZrGxXML5cV2Fr1CLIoifMcJt 0=;
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
IronPort-SDR: ASf2kJLvb9lkiWhlWJLgAtRYSEVL6Z7F6ILdjoc+M2fISVjptosYHR8Ho1gQyPAGSItZz2K/tv
 v6BwPyQ4m5UFja3iEnBjT8acNGbxhdRlIaGuNHXkvZqTXMsEPuD6kFtNpxBXl06l7wQ6XhBQY3
 HhYiHLP6+WNa1iv2oqaKRPLQe7renrhHg7I22R9UblKrvE52pxxF84bN+/oiZrs3zAkMvjy94P
 X4MKXPCtlSuF+OUiQlSYg2SVNRN9irnRMIk1nQ+LfdQ4cjII2fKNasBJHgrWv51imU3tMMAXkK
 CsI=
X-SBRS: 2.7
X-MesageID: 12946019
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,484,1574139600"; d="scan'208";a="12946019"
To: Jan Beulich <jbeulich@suse.com>
References: <1582133128-25638-1-git-send-email-igor.druzhinin@citrix.com>
 <1d138bf8-0cec-b66d-c852-fd7d6392e69d@suse.com>
 <5f27be3d-263b-42b6-7489-8fbc1079c38b@citrix.com>
 <7f0c343c-96f1-b11c-324d-c301d08d40d5@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <cff24d62-e797-ab4a-a6a2-d16e7aff621e@citrix.com>
Date: Tue, 25 Feb 2020 12:37:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7f0c343c-96f1-b11c-324d-c301d08d40d5@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/cpu: Sync any remaining RCU
 callbacks after CPU up/down
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, roger.pau@citrix.com,
 wl@xen.org, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUvMDIvMjAyMCAxMjoyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjEuMDIuMjAyMCAy
MDoyNiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IE9uIDIxLzAyLzIwMjAgMTY6MjksIEphbiBC
ZXVsaWNoIHdyb3RlOgo+Pj4gT24gMTkuMDIuMjAyMCAxODoyNSwgSWdvciBEcnV6aGluaW4gd3Jv
dGU6Cj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L3N5c2N0bC5jCj4+Pj4gKysrIGIveGVuL2FyY2gv
eDg2L3N5c2N0bC5jCj4+Pj4gQEAgLTc4LDggKzc4LDExIEBAIHN0YXRpYyB2b2lkIGwzX2NhY2hl
X2dldCh2b2lkICphcmcpCj4+Pj4gIGxvbmcgY3B1X3VwX2hlbHBlcih2b2lkICpkYXRhKQo+Pj4+
ICB7Cj4+Pj4gICAgICB1bnNpZ25lZCBpbnQgY3B1ID0gKHVuc2lnbmVkIGxvbmcpZGF0YTsKPj4+
PiAtICAgIGludCByZXQgPSBjcHVfdXAoY3B1KTsKPj4+PiArICAgIGludCByZXQ7Cj4+Pj4gIAo+
Pj4+ICsgICAgLyogRmx1c2ggcG90ZW50aWFsbHkgc2NoZWR1bGVkIFJDVSB3b3JrIGZyb20gcHJl
Y2VkaW5nIENQVSBvZmZsaW5lICovCj4+Pj4gKyAgICByY3VfYmFycmllcigpOwo+Pj4+ICsgICAg
cmV0ID0gY3B1X3VwKGNwdSk7Cj4+Pj4gICAgICBpZiAoIHJldCA9PSAtRUJVU1kgKQo+Pj4+ICAg
ICAgewo+Pj4+ICAgICAgICAgIC8qIE9uIEVCVVNZLCBmbHVzaCBSQ1Ugd29yayBhbmQgaGF2ZSBv
bmUgbW9yZSBnby4gKi8KPj4+PiBAQCAtMTA0LDcgKzEwNywxMSBAQCBsb25nIGNwdV91cF9oZWxw
ZXIodm9pZCAqZGF0YSkKPj4+PiAgbG9uZyBjcHVfZG93bl9oZWxwZXIodm9pZCAqZGF0YSkKPj4+
PiAgewo+Pj4+ICAgICAgaW50IGNwdSA9ICh1bnNpZ25lZCBsb25nKWRhdGE7Cj4+Pj4gLSAgICBp
bnQgcmV0ID0gY3B1X2Rvd24oY3B1KTsKPj4+PiArICAgIGludCByZXQ7Cj4+Pj4gKwo+Pj4+ICsg
ICAgLyogRmx1c2ggcG90ZW50aWFsbHkgc2NoZWR1bGVkIFJDVSB3b3JrIGZyb20gcHJlY2VkaW5n
IENQVSBvbmxpbmUgKi8KPj4+PiArICAgIHJjdV9iYXJyaWVyKCk7Cj4+Pj4gKyAgICByZXQgPSBj
cHVfZG93bihjcHUpOwo+Pj4+ICAgICAgaWYgKCByZXQgPT0gLUVCVVNZICkKPj4+PiAgICAgIHsK
Pj4+PiAgICAgICAgICAvKiBPbiBFQlVTWSwgZmx1c2ggUkNVIHdvcmsgYW5kIGhhdmUgb25lIG1v
cmUgZ28uICovCj4+Pj4KPj4+Cj4+PiBUaGVyZSBhcmUgbW9yZSBjYWxscyB0byBjcHVfdXAoKSAv
IGNwdV9kb3duKCksIG1vc3Qgbm90YWJseSBpbgo+Pj4gY29yZV9wYXJraW5nLmMuIFdvdWxkbid0
IGl0IGJlIGJldHRlciB0byBtYWtlIHRoZSBiYXJyaWVyIHBhcnQKPj4+IG9mIHRoZSB0d28gZnVu
Y3Rpb25zPyBUaGlzIHdvdWxkIHRoZSBhbHNvIGNvdmVyIG5vbi14ODYgaW4KPj4+IGNhc2UgYW4g
YXJjaCB3YW50cyB0byBzdXBwb3J0IG9mZmxpbmluZy9vbmxpbmluZyBvZiBDUFVzLgo+Pgo+PiBU
aG9zZSBmdW5jdGlvbnMgYXJlIGNhbGxlZCBmcm9tIGVhcmx5IGluaXQgY29kZSBhbmQgcmN1X2Jh
cnJpZXIoKSBpcwo+PiBhbiBleHBlbnNpdmUgb3BlcmF0aW9uLiBJIHRoaW5rIGl0J3MgYmV0dGVy
IGlmIGNhbGxlciBpcyByZXNwb25zaWJsZQo+PiBmb3Igc3luY2luZyB0aGUgc3RhdGUuIFRoaXMg
aXMgdGhlIHJlYXNvbiBJIG1vdmVkIHJjdV9iYXJyaWVyKCkgaW4gZnJvbnQKPj4gb2YgY3B1X3Vw
L2Rvd24uCj4gCj4gV2VsbCwgdGhlcmUgYXJlIHR3byBhc3BlY3RzIGhlcmU6IE9uZSBpcyB0byBh
dm9pZCB0aGUgb3ZlcmhlYWQgd2hlcmUKPiBpdCdzIG5vdCBuZWVkZWQuIFRoZSBvdGhlciBpcywg
YXMgb2JzZXJ2ZWQgb24gdGhpcyBwYXRjaCwgdGhhdCBieQo+IHRoZSBjaG9zZW4gYXBwcm9hY2gg
Y2FsbGVycyB3aGljaCBpbiBmYWN0IG5lZWQgYW1lbmRpbmcgbWF5IGJlCj4gZm9yZ290dGVuLiBU
byBmaW5kIG1pZGRsZSBncm91bmRzLCBwZXJoYXBzIHRoZSBzb2x1dGlvbiBpcyB0byBoYXZlCj4g
dmFyaWFudHMgb2YgY3B1X3t1cCxkb3dufSgpIHdoaWNoIGludm9rZSB0aGUgYmFycmllciwgYW5k
IHdoaWNoCj4gd291bGQgYmUgdXNlZCBieSBhbGwgcnVudGltZSBpbnZvY2F0aW9ucz8KPiAKPiBU
aGUgb3RoZXIgcXVlc3Rpb24gb2YgY291cnNlIGlzIHdoeSBlYXJseSBpbml0IGNvZGUgaXMgc3Bl
Y2lhbCBpbgo+IHRoaXMgcmVnYXJkLiBJZiBpdCBpbmRlZWQgd2FzLCBwZXJoYXBzIHRoZSBiYXJy
aWVyIGludm9jYXRpb24gY291bGQKPiBhbHNvIGJlIHRpZWQgdG8gY2VydGFpbiBTWVNfU1RBVEVf
KiB2YWx1ZXM/CgpJdCdzIG5vdCBzcGVjaWFsIC0gaW4gZmFjdCBpdCBzdGFydHMgYWZ0ZXIgUkNV
IGlzIGluaXRpYWxpemVkLiBUaGUgaXNzdWUKaXMsIGFzIHlvdSBzYWlkLCB1bm5lY2Vzc2FyeSBv
dmVyaGVhZC4gSSdkIHByZWZlciB0byBhdm9pZCBhbnkgY29uZGl0aW9uYWwKbWFnaWMgYW5kIGlu
c3RlYWQgY2FsbCAibm9zeW5jIiB2ZXJzaW9uIGRpcmVjdGx5IGZyb20gc2V0dXAgY29kZS4KCkln
b3IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
