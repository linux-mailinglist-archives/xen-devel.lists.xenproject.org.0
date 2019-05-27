Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A3E2B149
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 11:29:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVBsz-0001yJ-OK; Mon, 27 May 2019 09:25:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7auh=T3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVBsy-0001y9-8Q
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 09:25:40 +0000
X-Inumbo-ID: 626fc76c-8061-11e9-a569-b3e17191d818
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 626fc76c-8061-11e9-a569-b3e17191d818;
 Mon, 27 May 2019 09:25:37 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 27 May 2019 03:25:36 -0600
Message-Id: <5CEBAD0C0200007800232B47@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 27 May 2019 03:25:32 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5C88F524020000780021E12C@prv1-mh.provo.novell.com>
 <5C88F9F3020000780021E180@prv1-mh.provo.novell.com>
 <5C88F9F30200000000104057@prv1-mh.provo.novell.com>
 <5C88F9F3020000780023294C@prv1-mh.provo.novell.com>
In-Reply-To: <5C88F9F3020000780023294C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] Ping: [PATCH 4/4] x86/PV: remove unnecessary
 toggle_guest_pt() overhead
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEzLjAzLjE5IGF0IDEzOjM5LCAgd3JvdGU6Cj4gV2hpbGUgdGhlIG1lcmUgdXBkYXRp
bmcgb2YgLT5wdl9jcjMgYW5kIC0+cm9vdF9wZ3RfY2hhbmdlZCBhcmVuJ3Qgb3Zlcmx5Cj4gZXhw
ZW5zaXZlIChidXQgc3RpbGwgbmVlZGVkIG9ubHkgZm9yIHRoZSB0b2dnbGVfZ3Vlc3RfbW9kZSgp
IHBhdGgpLCB0aGUKPiBlZmZlY3Qgb2YgdGhlIGxhdHRlciBvbiB0aGUgZXhpdC10by1ndWVzdCBw
YXRoIGlzIG5vdCBpbnNpZ25pZmljYW50Lgo+IE1vdmUgdGhlIGxvZ2ljIGludG8gdG9nZ2xlX2d1
ZXN0X21vZGUoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CgpJIHRoaW5rIEkgZGlkIGFkZHJlc3MgdGhlIG9uZSBjb25jZXJuIHlvdSBoYWQuCgpK
YW4KCj4gLS0tIGEveGVuL2FyY2gveDg2L3B2L2RvbWFpbi5jCj4gKysrIGIveGVuL2FyY2gveDg2
L3B2L2RvbWFpbi5jCj4gQEAgLTM0OSwxOCArMzQ5LDEwIEBAIGJvb2wgX19pbml0IHhwdGlfcGNp
ZF9lbmFibGVkKHZvaWQpCj4gIAo+ICBzdGF0aWMgdm9pZCBfdG9nZ2xlX2d1ZXN0X3B0KHN0cnVj
dCB2Y3B1ICp2KQo+ICB7Cj4gLSAgICBjb25zdCBzdHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWlu
Owo+IC0gICAgc3RydWN0IGNwdV9pbmZvICpjcHVfaW5mbyA9IGdldF9jcHVfaW5mbygpOwo+ICAg
ICAgdW5zaWduZWQgbG9uZyBjcjM7Cj4gIAo+ICAgICAgdi0+YXJjaC5mbGFncyBePSBURl9rZXJu
ZWxfbW9kZTsKPiAgICAgIHVwZGF0ZV9jcjModik7Cj4gLSAgICBpZiAoIGQtPmFyY2gucHYueHB0
aSApCj4gLSAgICB7Cj4gLSAgICAgICAgY3B1X2luZm8tPnJvb3RfcGd0X2NoYW5nZWQgPSB0cnVl
Owo+IC0gICAgICAgIGNwdV9pbmZvLT5wdl9jcjMgPSBfX3BhKHRoaXNfY3B1KHJvb3RfcGd0KSkg
fAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAoZC0+YXJjaC5wdi5wY2lkID8gZ2V0X3Bj
aWRfYml0cyh2LCB0cnVlKSA6IDApOwo+IC0gICAgfQo+ICAKPiAgICAgIC8qCj4gICAgICAgKiBE
b24ndCBmbHVzaCB1c2VyIGdsb2JhbCBtYXBwaW5ncyBmcm9tIHRoZSBUTEIuIERvbid0IHRpY2sg
VExCIGNsb2NrLgo+IEBAIC0zNjgsMTUgKzM2MCwxMSBAQCBzdGF0aWMgdm9pZCBfdG9nZ2xlX2d1
ZXN0X3B0KHN0cnVjdCB2Y3B1Cj4gICAgICAgKiBJbiBzaGFkb3cgbW9kZSwgdGhvdWdoLCB1cGRh
dGVfY3IzKCkgbWF5IG5lZWQgdG8gYmUgYWNjb21wYW5pZWQgYnkgYQo+ICAgICAgICogVExCIGZs
dXNoIChmb3IganVzdCB0aGUgaW5jb21pbmcgUENJRCksIGFzIHRoZSB0b3AgbGV2ZWwgcGFnZSB0
YWJsZSAKPiBtYXkKPiAgICAgICAqIGhhdmUgY2hhbmdlZCBiZWhpbmQgb3VyIGJhY2tzLiBUbyBi
ZSBvbiB0aGUgc2FmZSBzaWRlLCBzdXBwcmVzcyB0aGUKPiAtICAgICAqIG5vLWZsdXNoIHVuY29u
ZGl0aW9uYWxseSBpbiB0aGlzIGNhc2UuIFRoZSBYUFRJIENSMyB3cml0ZSwgaWYgCj4gZW5hYmxl
ZCwKPiAtICAgICAqIHdpbGwgdGhlbiBuZWVkIHRvIGJlIGEgZmx1c2hpbmcgb25lIHRvby4KPiAr
ICAgICAqIG5vLWZsdXNoIHVuY29uZGl0aW9uYWxseSBpbiB0aGlzIGNhc2UuCj4gICAgICAgKi8K
PiAgICAgIGNyMyA9IHYtPmFyY2guY3IzOwo+IC0gICAgaWYgKCBzaGFkb3dfbW9kZV9lbmFibGVk
KGQpICkKPiAtICAgIHsKPiArICAgIGlmICggc2hhZG93X21vZGVfZW5hYmxlZCh2LT5kb21haW4p
ICkKPiAgICAgICAgICBjcjMgJj0gflg4Nl9DUjNfTk9GTFVTSDsKPiAtICAgICAgICBjcHVfaW5m
by0+cHZfY3IzICY9IH5YODZfQ1IzX05PRkxVU0g7Cj4gLSAgICB9Cj4gICAgICB3cml0ZV9jcjMo
Y3IzKTsKPiAgCj4gICAgICBpZiAoICEodi0+YXJjaC5mbGFncyAmIFRGX2tlcm5lbF9tb2RlKSAp
Cj4gQEAgLTM5Miw2ICszODAsOCBAQCBzdGF0aWMgdm9pZCBfdG9nZ2xlX2d1ZXN0X3B0KHN0cnVj
dCB2Y3B1Cj4gIAo+ICB2b2lkIHRvZ2dsZV9ndWVzdF9tb2RlKHN0cnVjdCB2Y3B1ICp2KQo+ICB7
Cj4gKyAgICBjb25zdCBzdHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWluOwo+ICsKPiAgICAgIEFT
U0VSVCghaXNfcHZfMzJiaXRfdmNwdSh2KSk7Cj4gIAo+ICAgICAgLyogJWZzLyVncyBiYXNlcyBj
YW4gb25seSBiZSBzdGFsZSBpZiBXUntGUyxHU31CQVNFIGFyZSB1c2FibGUuICovCj4gQEAgLTQw
NSw2ICszOTUsMjEgQEAgdm9pZCB0b2dnbGVfZ3Vlc3RfbW9kZShzdHJ1Y3QgdmNwdSAqdikKPiAg
ICAgIGFzbSB2b2xhdGlsZSAoICJzd2FwZ3MiICk7Cj4gIAo+ICAgICAgX3RvZ2dsZV9ndWVzdF9w
dCh2KTsKPiArCj4gKyAgICBpZiAoIGQtPmFyY2gucHYueHB0aSApCj4gKyAgICB7Cj4gKyAgICAg
ICAgc3RydWN0IGNwdV9pbmZvICpjcHVfaW5mbyA9IGdldF9jcHVfaW5mbygpOwo+ICsKPiArICAg
ICAgICBjcHVfaW5mby0+cm9vdF9wZ3RfY2hhbmdlZCA9IHRydWU7Cj4gKyAgICAgICAgY3B1X2lu
Zm8tPnB2X2NyMyA9IF9fcGEodGhpc19jcHUocm9vdF9wZ3QpKSB8Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgIChkLT5hcmNoLnB2LnBjaWQgPyBnZXRfcGNpZF9iaXRzKHYsIHRydWUpIDog
MCk7Cj4gKyAgICAgICAgLyoKPiArICAgICAgICAgKiBBcyBpbiBfdG9nZ2xlX2d1ZXN0X3B0KCkg
dGhlIFhQVEkgQ1IzIHdyaXRlIG5lZWRzIHRvIGJlIGEgVExCLQo+ICsgICAgICAgICAqIGZsdXNo
aW5nIG9uZSB0b28gZm9yIHNoYWRvdyBtb2RlIGd1ZXN0cy4KPiArICAgICAgICAgKi8KPiArICAg
ICAgICBpZiAoIHNoYWRvd19tb2RlX2VuYWJsZWQoZCkgKQo+ICsgICAgICAgICAgICBjcHVfaW5m
by0+cHZfY3IzICY9IH5YODZfQ1IzX05PRkxVU0g7Cj4gKyAgICB9Cj4gIH0KPiAgCj4gIHZvaWQg
dG9nZ2xlX2d1ZXN0X3B0KHN0cnVjdCB2Y3B1ICp2KQo+IAo+IAo+IAo+IAoKCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
