Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D4F87D6A
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 17:01:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw6MR-0007SR-3O; Fri, 09 Aug 2019 14:59:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yG4W=WF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hw6M5-0006hp-LY
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 14:58:57 +0000
X-Inumbo-ID: 33e2c9d2-bab6-11e9-a3d6-8bce01c347c5
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33e2c9d2-bab6-11e9-a3d6-8bce01c347c5;
 Fri, 09 Aug 2019 14:58:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9A21CB03C;
 Fri,  9 Aug 2019 14:58:52 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  9 Aug 2019 16:58:26 +0200
Message-Id: <20190809145833.1020-42-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190809145833.1020-1-jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 41/48] xen/sched: prepare per-cpupool
 scheduling granularity
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24tIGFuZCBvZmZsaW5pbmcgY3B1cyB3aXRoIGNvcmUgc2NoZWR1bGluZyBpcyByYXRoZXIgY29t
cGxpY2F0ZWQgYXMKdGhlIGNwdXMgYXJlIHRha2VuIG9uLSBvciBvZmZsaW5lIG9uZSBieSBvbmUs
IGJ1dCBzY2hlZHVsaW5nIHdhbnRzIHRoZW0KcmF0aGVyIHRvIGJlIGhhbmRsZWQgcGVyIGNvcmUu
CgpBcyB0aGUgZnV0dXJlIHBsYW4gaXMgdG8gYmUgYWJsZSB0byBzZWxlY3Qgc2NoZWR1bGluZyBn
cmFudWxhcml0eSBwZXIKY3B1cG9vbCBwcmVwYXJlIHRoYXQgYnkgc3RvcmluZyB0aGUgZ3JhbnVs
YXJpdHkgaW4gc3RydWN0IGNwdXBvb2wgYW5kCnN0cnVjdCBzY2hlZF9yZXNvdXJjZSAod2UgbmVl
ZCBpdCB0aGVyZSBmb3IgZnJlZSBjcHVzIHdoaWNoIGFyZSBub3QKYXNzb2NpYXRlZCB0byBhbnkg
Y3B1cG9vbCkuIEZyZWUgY3B1cyB3aWxsIGFsd2F5cyB1c2UgZ3JhbnVsYXJpdHkgMS4KClN0b3Jl
IHRoZSBzZWxlY3RlZCBncmFudWxhcml0eSBvcHRpb24gKGNwdSwgY29yZSBvciBzb2NrZXQpIGlu
IHRoZQpjcHVwb29sIGFzIHdlbGwsIGFzIHdlIHdpbGwgbmVlZCBpdCB0byBzZWxlY3QgdGhlIGFw
cHJvcHJpYXRlIGNwdSBtYXNrCndoZW4gcG9wdWxhdGluZyB0aGUgY3B1cG9vbCB3aXRoIGNwdXMu
CgpUaGlzIHdpbGwgbWFrZSBvbi0gYW5kIG9mZmxpbmluZyBvZiBjcHVzIG11Y2ggZWFzaWVyIGFu
ZCBhdm9pZHMKd3JpdGluZyBjb2RlIHdoaWNoIHdvdWxkIG5lZWRlZCB0byBiZSB0aHJvd24gYXdh
eSBsYXRlci4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
LS0tClYxOiBuZXcgcGF0Y2gKLS0tCiB4ZW4vY29tbW9uL2NwdXBvb2wuYyAgICAgICB8ICAyICsr
CiB4ZW4vY29tbW9uL3NjaGVkdWxlLmMgICAgICB8IDIzICsrKysrKysrKysrKysrKy0tLS0tLS0t
CiB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaCB8IDEyICsrKysrKysrKysrKwogMyBmaWxlcyBj
aGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9jb21tb24vY3B1cG9vbC5jIGIveGVuL2NvbW1vbi9jcHVwb29sLmMKaW5kZXggYmFjZTY4NDQ2
NC4uODc4OWZkZTNjNCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9jcHVwb29sLmMKKysrIGIveGVu
L2NvbW1vbi9jcHVwb29sLmMKQEAgLTE3Nyw2ICsxNzcsOCBAQCBzdGF0aWMgc3RydWN0IGNwdXBv
b2wgKmNwdXBvb2xfY3JlYXRlKAogICAgICAgICAgICAgcmV0dXJuIE5VTEw7CiAgICAgICAgIH0K
ICAgICB9CisgICAgYy0+Z3JhbnVsYXJpdHkgPSBzY2hlZF9ncmFudWxhcml0eTsKKyAgICBjLT5v
cHRfZ3JhbnVsYXJpdHkgPSBvcHRfc2NoZWRfZ3JhbnVsYXJpdHk7CiAKICAgICAqcSA9IGM7CiAK
ZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWR1bGUuYyBiL3hlbi9jb21tb24vc2NoZWR1bGUu
YwppbmRleCBiOTRmZDI0MzFhLi43ODIzYjQ4ZTMyIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3Nj
aGVkdWxlLmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCkBAIC01Niw3ICs1Niw4IEBAIGlu
dCBzY2hlZF9yYXRlbGltaXRfdXMgPSBTQ0hFRF9ERUZBVUxUX1JBVEVMSU1JVF9VUzsKIGludGVn
ZXJfcGFyYW0oInNjaGVkX3JhdGVsaW1pdF91cyIsIHNjaGVkX3JhdGVsaW1pdF91cyk7CiAKIC8q
IE51bWJlciBvZiB2Y3B1cyBwZXIgc3RydWN0IHNjaGVkX3VuaXQuICovCi1zdGF0aWMgdW5zaWdu
ZWQgaW50IF9fcmVhZF9tb3N0bHkgc2NoZWRfZ3JhbnVsYXJpdHkgPSAxOworZW51bSBzY2hlZF9n
cmFuIF9fcmVhZF9tb3N0bHkgb3B0X3NjaGVkX2dyYW51bGFyaXR5ID0gU0NIRURfR1JBTl9jcHU7
Cit1bnNpZ25lZCBpbnQgX19yZWFkX21vc3RseSBzY2hlZF9ncmFudWxhcml0eSA9IDE7CiBib29s
IF9fcmVhZF9tb3N0bHkgc2NoZWRfZGlzYWJsZV9zbXRfc3dpdGNoaW5nOwogY29uc3QgY3B1bWFz
a190ICpzY2hlZF9yZXNfbWFzayA9ICZjcHVtYXNrX2FsbDsKIApAQCAtNDA5LDEwICs0MTAsMTAg
QEAgc3RhdGljIHN0cnVjdCBzY2hlZF91bml0ICpzY2hlZF9hbGxvY191bml0KHN0cnVjdCB2Y3B1
ICp2KQogewogICAgIHN0cnVjdCBzY2hlZF91bml0ICp1bml0LCAqKnByZXZfdW5pdDsKICAgICBz
dHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWluOworICAgIHVuc2lnbmVkIGludCBncmFuID0gZC0+
Y3B1cG9vbCA/IGQtPmNwdXBvb2wtPmdyYW51bGFyaXR5IDogMTsKIAogICAgIGZvcl9lYWNoX3Nj
aGVkX3VuaXQgKCBkLCB1bml0ICkKLSAgICAgICAgaWYgKCB1bml0LT52Y3B1X2xpc3QtPnZjcHVf
aWQgLyBzY2hlZF9ncmFudWxhcml0eSA9PQotICAgICAgICAgICAgIHYtPnZjcHVfaWQgLyBzY2hl
ZF9ncmFudWxhcml0eSApCisgICAgICAgIGlmICggdW5pdC0+dmNwdV9saXN0LT52Y3B1X2lkIC8g
Z3JhbiA9PSB2LT52Y3B1X2lkIC8gZ3JhbiApCiAgICAgICAgICAgICBicmVhazsKIAogICAgIGlm
ICggdW5pdCApCkBAIC0xODA1LDExICsxODA2LDExIEBAIHN0YXRpYyB2b2lkIHNjaGVkX3N3aXRj
aF91bml0cyhzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2UgKnNkLAogICAgICAgICBpZiAoIGlzX2lkbGVf
dW5pdChwcmV2KSApCiAgICAgICAgIHsKICAgICAgICAgICAgIHByZXYtPnJ1bnN0YXRlX2NudFtS
VU5TVEFURV9ydW5uaW5nXSA9IDA7Ci0gICAgICAgICAgICBwcmV2LT5ydW5zdGF0ZV9jbnRbUlVO
U1RBVEVfcnVubmFibGVdID0gc2NoZWRfZ3JhbnVsYXJpdHk7CisgICAgICAgICAgICBwcmV2LT5y
dW5zdGF0ZV9jbnRbUlVOU1RBVEVfcnVubmFibGVdID0gc2QtPmdyYW51bGFyaXR5OwogICAgICAg
ICB9CiAgICAgICAgIGlmICggaXNfaWRsZV91bml0KG5leHQpICkKICAgICAgICAgewotICAgICAg
ICAgICAgbmV4dC0+cnVuc3RhdGVfY250W1JVTlNUQVRFX3J1bm5pbmddID0gc2NoZWRfZ3JhbnVs
YXJpdHk7CisgICAgICAgICAgICBuZXh0LT5ydW5zdGF0ZV9jbnRbUlVOU1RBVEVfcnVubmluZ10g
PSBzZC0+Z3JhbnVsYXJpdHk7CiAgICAgICAgICAgICBuZXh0LT5ydW5zdGF0ZV9jbnRbUlVOU1RB
VEVfcnVubmFibGVdID0gMDsKICAgICAgICAgfQogICAgIH0KQEAgLTIwNzIsMTEgKzIwNzMsMTIg
QEAgc3RhdGljIHN0cnVjdCBzY2hlZF91bml0ICpzY2hlZF93YWl0X3JlbmRlenZvdXNfaW4oc3Ry
dWN0IHNjaGVkX3VuaXQgKnByZXYsCiB7CiAgICAgc3RydWN0IHNjaGVkX3VuaXQgKm5leHQ7CiAg
ICAgc3RydWN0IHZjcHUgKnY7CisgICAgdW5zaWduZWQgaW50IGdyYW4gPSBnZXRfc2NoZWRfcmVz
KGNwdSktPmdyYW51bGFyaXR5OwogCiAgICAgaWYgKCAhLS1wcmV2LT5yZW5kZXp2b3VzX2luX2Nu
dCApCiAgICAgewogICAgICAgICBuZXh0ID0gZG9fc2NoZWR1bGUocHJldiwgbm93LCBjcHUpOwot
ICAgICAgICBhdG9taWNfc2V0KCZuZXh0LT5yZW5kZXp2b3VzX291dF9jbnQsIHNjaGVkX2dyYW51
bGFyaXR5ICsgMSk7CisgICAgICAgIGF0b21pY19zZXQoJm5leHQtPnJlbmRlenZvdXNfb3V0X2Nu
dCwgZ3JhbiArIDEpOwogICAgICAgICByZXR1cm4gbmV4dDsKICAgICB9CiAKQEAgLTIxOTYsNiAr
MjE5OCw3IEBAIHN0YXRpYyB2b2lkIHNjaGVkdWxlKHZvaWQpCiAgICAgc3RydWN0IHNjaGVkX3Jl
c291cmNlICpzZDsKICAgICBzcGlubG9ja190ICAgICAgICAgICAqbG9jazsKICAgICBpbnQgY3B1
ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOworICAgIHVuc2lnbmVkIGludCAgICAgICAgICBncmFuID0g
Z2V0X3NjaGVkX3JlcyhjcHUpLT5ncmFudWxhcml0eTsKIAogICAgIEFTU0VSVF9OT1RfSU5fQVRP
TUlDKCk7CiAKQEAgLTIyMjEsMTEgKzIyMjQsMTEgQEAgc3RhdGljIHZvaWQgc2NoZWR1bGUodm9p
ZCkKIAogICAgIHN0b3BfdGltZXIoJnNkLT5zX3RpbWVyKTsKIAotICAgIGlmICggc2NoZWRfZ3Jh
bnVsYXJpdHkgPiAxICkKKyAgICBpZiAoIGdyYW4gPiAxICkKICAgICB7CiAgICAgICAgIGNwdW1h
c2tfdCBtYXNrOwogCi0gICAgICAgIHByZXYtPnJlbmRlenZvdXNfaW5fY250ID0gc2NoZWRfZ3Jh
bnVsYXJpdHk7CisgICAgICAgIHByZXYtPnJlbmRlenZvdXNfaW5fY250ID0gZ3JhbjsKICAgICAg
ICAgY3B1bWFza19hbmRub3QoJm1hc2ssIHNkLT5jcHVzLCBjcHVtYXNrX29mKGNwdSkpOwogICAg
ICAgICBjcHVtYXNrX3JhaXNlX3NvZnRpcnEoJm1hc2ssIFNDSEVEX1NMQVZFX1NPRlRJUlEpOwog
ICAgICAgICBuZXh0ID0gc2NoZWRfd2FpdF9yZW5kZXp2b3VzX2luKHByZXYsICZsb2NrLCBjcHUs
IG5vdyk7CkBAIC0yMjkxLDYgKzIyOTQsOSBAQCBzdGF0aWMgaW50IGNwdV9zY2hlZHVsZV91cCh1
bnNpZ25lZCBpbnQgY3B1KQogICAgIGluaXRfdGltZXIoJnNkLT5zX3RpbWVyLCBzX3RpbWVyX2Zu
LCBOVUxMLCBjcHUpOwogICAgIGF0b21pY19zZXQoJnNkLT51cmdlbnRfY291bnQsIDApOwogCisg
ICAgLyogV2Ugc3RhcnQgd2l0aCBjcHUgZ3JhbnVsYXJpdHkuICovCisgICAgc2QtPmdyYW51bGFy
aXR5ID0gMTsKKwogICAgIC8qIEJvb3QgQ1BVIGlzIGRlYWx0IHdpdGggbGF0ZXIgaW4gc2NoZWR1
bGVyX2luaXQoKS4gKi8KICAgICBpZiAoIGNwdSA9PSAwICkKICAgICAgICAgcmV0dXJuIDA7CkBA
IC0yNTgxLDYgKzI1ODcsNyBAQCBpbnQgc2NoZWR1bGVfY3B1X3N3aXRjaCh1bnNpZ25lZCBpbnQg
Y3B1LCBzdHJ1Y3QgY3B1cG9vbCAqYykKICAgICBzY2hlZF9mcmVlX3ZkYXRhKG9sZF9vcHMsIHZw
cml2X29sZCk7CiAgICAgc2NoZWRfZnJlZV9wZGF0YShvbGRfb3BzLCBwcHJpdl9vbGQsIGNwdSk7
CiAKKyAgICBnZXRfc2NoZWRfcmVzKGNwdSktPmdyYW51bGFyaXR5ID0gYyA/IGMtPmdyYW51bGFy
aXR5IDogMTsKICAgICBnZXRfc2NoZWRfcmVzKGNwdSktPmNwdXBvb2wgPSBjOwogICAgIC8qIFdo
ZW4gYSBjcHUgaXMgYWRkZWQgdG8gYSBwb29sLCB0cmlnZ2VyIGl0IHRvIGdvIHBpY2sgdXAgc29t
ZSB3b3JrICovCiAgICAgaWYgKCBjICE9IE5VTEwgKQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUv
eGVuL3NjaGVkLWlmLmggYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaAppbmRleCA3M2IxOWEy
NzYzLi42MDZhMGQ0YTI1IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaAor
KysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaApAQCAtMjUsNiArMjUsMTUgQEAgZXh0ZXJu
IGludCBzY2hlZF9yYXRlbGltaXRfdXM7CiAvKiBTY2hlZHVsaW5nIHJlc291cmNlIG1hc2suICov
CiBleHRlcm4gY29uc3QgY3B1bWFza190ICpzY2hlZF9yZXNfbWFzazsKIAorLyogTnVtYmVyIG9m
IHZjcHVzIHBlciBzdHJ1Y3Qgc2NoZWRfdW5pdC4gKi8KK2VudW0gc2NoZWRfZ3JhbiB7CisgICAg
U0NIRURfR1JBTl9jcHUsCisgICAgU0NIRURfR1JBTl9jb3JlLAorICAgIFNDSEVEX0dSQU5fc29j
a2V0Cit9OworZXh0ZXJuIGVudW0gc2NoZWRfZ3JhbiBvcHRfc2NoZWRfZ3JhbnVsYXJpdHk7Citl
eHRlcm4gdW5zaWduZWQgaW50IHNjaGVkX2dyYW51bGFyaXR5OworCiAvKgogICogSW4gb3JkZXIg
dG8gYWxsb3cgYSBzY2hlZHVsZXIgdG8gcmVtYXAgdGhlIGxvY2stPmNwdSBtYXBwaW5nLAogICog
d2UgaGF2ZSBhIHBlci1jcHUgcG9pbnRlciwgYWxvbmcgd2l0aCBhIHByZS1hbGxvY2F0ZWQgc2V0
IG9mCkBAIC00Nyw2ICs1Niw3IEBAIHN0cnVjdCBzY2hlZF9yZXNvdXJjZSB7CiAgICAgc3RydWN0
IHRpbWVyICAgICAgICBzX3RpbWVyOyAgICAgICAgLyogc2NoZWR1bGluZyB0aW1lciAgICAgICAg
ICAgICAgICAqLwogICAgIGF0b21pY190ICAgICAgICAgICAgdXJnZW50X2NvdW50OyAgIC8qIGhv
dyBtYW55IHVyZ2VudCB2Y3B1cyAgICAgICAgICAgKi8KICAgICB1bnNpZ25lZCBpbnQgICAgICAg
IHByb2Nlc3NvcjsKKyAgICB1bnNpZ25lZCBpbnQgICAgICAgIGdyYW51bGFyaXR5OwogICAgIGNv
bnN0IGNwdW1hc2tfdCAgICAqY3B1czsgICAgICAgICAgIC8qIGNwdXMgY292ZXJlZCBieSB0aGlz
IHN0cnVjdCAgICAgKi8KIH07CiAKQEAgLTUzMSw2ICs1NDEsOCBAQCBzdHJ1Y3QgY3B1cG9vbAog
ICAgIHN0cnVjdCBjcHVwb29sICAgKm5leHQ7CiAgICAgc3RydWN0IHNjaGVkdWxlciAqc2NoZWQ7
CiAgICAgYXRvbWljX3QgICAgICAgICByZWZjbnQ7CisgICAgdW5zaWduZWQgaW50ICAgICBncmFu
dWxhcml0eTsKKyAgICBlbnVtIHNjaGVkX2dyYW4gIG9wdF9ncmFudWxhcml0eTsKIH07CiAKICNk
ZWZpbmUgY3B1cG9vbF9vbmxpbmVfY3B1bWFzayhfcG9vbCkgXAotLSAKMi4xNi40CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
