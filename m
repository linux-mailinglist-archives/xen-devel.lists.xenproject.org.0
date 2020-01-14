Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA5913B05D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 18:05:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irPaE-0007Wz-DR; Tue, 14 Jan 2020 17:02:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QqHR=3D=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1irPaD-0007Ws-7Q
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 17:02:25 +0000
X-Inumbo-ID: a21ebb30-36ef-11ea-840a-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a21ebb30-36ef-11ea-840a-12813bfff9fa;
 Tue, 14 Jan 2020 17:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579021343;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=FI9xQkJpaBTezO3Uj0ofMPHiC5Tq6WMhbmQfzfnVWtU=;
 b=VA+zNaZDy7HUaY8QR2Vqsvt7UetPLTn5lx5dewGIvKnSFcpe6SHmvnW9
 qIrq4VJGX8I0SHDYu4cKbhDz+hvoGEQ1wXf0eNl4+ssHqq0GMl1k1gNHc
 7B8nIcdVJf3jetskgx4IlHfQt3UskL377rmKzXVzaxnKFjdzm+Dh20nif 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8zUJUmAZIONNLLP4QjqfuOZjyiL/WRe4NIHg6/edmL4yIjVMOHkfqpcnX/LH+jDyuF7+SP1Z9H
 /ZOXU8W2OuOLjPM/dGoNFH2QsfHp4yB6RLATlTn2QpYO+762TYSFrkAKW2MUhJXLlucc6BOUHh
 BiLPOoO6KOzYEyJJDmKimtvzdSkcpnK5/S4Djd2UqZASw7A09kTIbPaBLyMsgNt9ccug51G8Ta
 RBmhAXggwl2tLpMnaeK18NPFuKe7ZynGSOolVd5TClNWJTHr93RwRn4i6lr4RJsuexxSUiH0GC
 m7s=
X-SBRS: 2.7
X-MesageID: 11268414
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,433,1574139600"; d="scan'208";a="11268414"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24093.62492.581673.905375@mariner.uk.xensource.com>
Date: Tue, 14 Jan 2020 17:02:20 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20191224151932.6304-9-andrew.cooper3@citrix.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
 <20191224151932.6304-9-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] [PATCH 08/12] libxc/restore: Support v3 streams,
 and cope with v2 compatibilty
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggMDgvMTJdIGxpYnhjL3Jlc3RvcmU6IFN1cHBv
cnQgdjMgc3RyZWFtcywgYW5kIGNvcGUgd2l0aCB2MiBjb21wYXRpYmlsdHkiKToKPiBJbnRyb2R1
Y2UgYSBzdGF0aWNfZGF0YV9jb21wbGV0ZSgpIGhvb2sgd2hpY2ggaXMgY2FsbGVkIHdoZW4gYQo+
IFNUQVRJQ19EQVRBX0VORCByZWNvcmQgaXMgZm91bmQgKHYzKSBvciBpbmZlcnJlZCAodjIpLgo+
IAo+IE1vZGlmeSBoYW5kbGVfcGFnZV9kYXRhKCkgYW5kIGhhbmRsZV94ODZfcHZfcDJtX2ZyYW1l
cygpIHRvIGluZmVyIHRoZQo+IHBvc2l0aW9uIGluIHYyIHN0cmVhbXMuCj4gCj4gVGhlIGltcGxl
bWVudGF0aW9uIG9mIHg4Nl9zdGF0aWNfZGF0YV9jb21wbGV0ZSgpIG5lZWRzIHRvIHdhaXQgdW50
aWwKPiBtb3JlIHBsdW1iaW5nIGlzIGluIHBsYWNlLCB0byBtYWtlIGEgY29tYmluZWQgbGlieGwv
bGlieGMgY2hhbmdlIHRvCj4gbWFpbnRhaW4gKGZ1bmN0aW9uYWwpIGJpc2VjdGFiaWxpdHkuCj4g
Cj4gTm8gcHJhY3RpY2FsIGNoYW5nZSB0byBiZWhhdmlvdXIgLSB0aGlzIGlzIGFsbCBwbHVtYmlu
ZyB3b3JrLgoKVGhlc2UgcGFydHMgYXJlIGNvbmZ1c2luZyB0byBtZToKCj4gKyAgICAvKgo+ICsg
ICAgICogVGhpcyBpcyBhIGJpdCBvZiBhIGJvZGdlLCBidXQgaXQgaXMgbGVzcyBiYWQgdGhhbiBk
dXBsaWNhdGluZwo+ICsgICAgICogaGFuZGxlX3BhZ2VfZGF0YSgpIGJldHdlZW4gZGlmZmVyZW50
IGFyY2hpdGVjdHVyZXMuCj4gKyAgICAgKi8KPiArI2lmIGRlZmluZWQoX19pMzg2X18pIHx8IGRl
ZmluZWQoX194ODZfNjRfXykKPiArICAgIC8qIHYyIGNvbXBhdC4gIEluZmVyIHRoZSBwb3NpdGlv
biBvZiBTVEFUSUNfREFUQV9FTkQuICovCj4gKyAgICBpZiAoIGN0eC0+cmVzdG9yZS5mb3JtYXRf
dmVyc2lvbiA8IDMgJiYgIWN0eC0+cmVzdG9yZS5zZWVuX3N0YXRpY19kYXRhX2VuZCApCj4gKyAg
ICB7Cj4gKyAgICAgICAgcmMgPSBoYW5kbGVfc3RhdGljX2RhdGFfZW5kKGN0eCk7Cj4gKyAgICAg
ICAgaWYgKCByYyApCj4gKyAgICAgICAgewo+ICsgICAgICAgICAgICBFUlJPUigiSW5mZXJyZWQg
U1RBVElDX0RBVEFfRU5EIHJlY29yZCBmYWlsZWQiKTsKPiArICAgICAgICAgICAgZ290byBlcnI7
Cj4gKyAgICAgICAgfQo+ICsgICAgICAgIHJjID0gLTE7Cj4gKyAgICB9Cj4gKwo+ICsgICAgaWYg
KCAhY3R4LT5yZXN0b3JlLnNlZW5fc3RhdGljX2RhdGFfZW5kICkKPiArICAgIHsKPiArICAgICAg
ICBFUlJPUigiTm8gU1RBVElDX0RBVEFfRU5EIHNlZW4iKTsKPiArICAgICAgICBnb3RvIGVycjsK
PiArICAgIH0KPiArI2VuZGlmCgouLi4KCj4gKyAgICAvKiB2MiBjb21wYXQuICBJbmZlciB0aGUg
cG9zaXRpb24gb2YgU1RBVElDX0RBVEFfRU5ELiAqLwo+ICsgICAgaWYgKCBjdHgtPnJlc3RvcmUu
Zm9ybWF0X3ZlcnNpb24gPCAzICYmICFjdHgtPnJlc3RvcmUuc2Vlbl9zdGF0aWNfZGF0YV9lbmQg
KQo+ICsgICAgewo+ICsgICAgICAgIHJjID0gaGFuZGxlX3N0YXRpY19kYXRhX2VuZChjdHgpOwo+
ICsgICAgICAgIGlmICggcmMgKQo+ICsgICAgICAgIHsKPiArICAgICAgICAgICAgRVJST1IoIklu
ZmVycmVkIFNUQVRJQ19EQVRBX0VORCByZWNvcmQgZmFpbGVkIik7Cj4gKyAgICAgICAgICAgIHJl
dHVybiByYzsKPiArICAgICAgICB9Cj4gKyAgICB9Cj4gKwo+ICsgICAgaWYgKCAhY3R4LT5yZXN0
b3JlLnNlZW5fc3RhdGljX2RhdGFfZW5kICkKPiArICAgIHsKPiArICAgICAgICBFUlJPUigiTm8g
U1RBVElDX0RBVEFfRU5EIHNlZW4iKTsKPiArICAgICAgICByZXR1cm4gLTE7Cj4gKyAgICB9CgpG
aXJzdGx5LCB0aGlzIGNvZGUgaXMgcmVtYXJrYWJseSBzaW1pbGFyLiAgU3VyZWx5IGl0IHNob3Vs
ZCBiZQpmYWN0b3JlZCBvdXQgaW50byBzb21ldGhpbmcgbGlrZQogIHBvc3NpYmxlX2ltcGxpY2l0
X3N0YXRpY19kYXRhX2VuZCgpCj8KCkFuZCBzZWNvbmRseSwgSSBkb24ndCB1bmRlcnN0YW5kIHdo
eSB0aGUgZmlyc3QgcGFydCBpbgpoYW5kbGVfcGFnZV9kYXRhIGlzIGFyY2gtcXVhbGlmaWVkLiAg
TWF5YmUgdGhpcyB3b3VsZCBtYWtlIG1vcmUgc2Vuc2UKaWYgSSBsb29rZWQgYXQgdGhlIGNvZGUg
aW4gY29udGV4dCByYXRoZXIgdGhhbiBqdXN0IHRoZSBkaWZmID8KCklhbi4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
