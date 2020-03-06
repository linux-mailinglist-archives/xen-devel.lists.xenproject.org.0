Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 194A117C286
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 17:05:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAFRG-0002uF-Gq; Fri, 06 Mar 2020 16:03:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h18c=4X=xen.org=prvs=327f7e818=paul@srs-us1.protection.inumbo.net>)
 id 1jAFRF-0002u9-J2
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 16:03:01 +0000
X-Inumbo-ID: f3a3f270-5fc3-11ea-a828-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3a3f270-5fc3-11ea-a828-12813bfff9fa;
 Fri, 06 Mar 2020 16:03:00 +0000 (UTC)
IronPort-SDR: h3EMjcEhLFrl3AWTqNghFICFUcDazPRJCAOStAqqzvlyy05jC3Xd392jo3QKBAVKAdnyeqG47x
 Kx1FEkmPm+Cw==
X-IronPort-AV: E=Sophos;i="5.70,522,1574121600"; d="scan'208";a="29708598"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 06 Mar 2020 16:02:59 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com (Postfix) with ESMTPS
 id B59F6A27BA; Fri,  6 Mar 2020 16:02:58 +0000 (UTC)
Received: from EX13D22EUB002.ant.amazon.com (10.43.166.131) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 6 Mar 2020 16:02:58 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D22EUB002.ant.amazon.com (10.43.166.131) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 6 Mar 2020 16:02:57 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 6 Mar 2020 16:02:55 +0000
From: <paul@xen.org>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 6 Mar 2020 16:02:54 +0000
Message-ID: <20200306160254.8465-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v4] x86: irq: Do not BUG_ON multiple unbind
 calls for shared pirqs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Varad Gautam <vrd@amazon.de>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogVmFyYWQgR2F1dGFtIDx2cmRAYW1hem9uLmRlPgoKWEVOX0RPTUNUTF9kZXN0cm95ZG9t
YWluIGNyZWF0ZXMgYSBjb250aW51YXRpb24gaWYgZG9tYWluX2tpbGwgLUVSRVNUQVJUUy4KSW4g
dGhhdCBzY2VuYXJpbywgaXQgaXMgcG9zc2libGUgdG8gcmVjZWl2ZSBtdWx0aXBsZSBfX3BpcnFf
Z3Vlc3RfdW5iaW5kCmNhbGxzIGZvciB0aGUgc2FtZSBwaXJxIGZyb20gZG9tYWluX2tpbGwsIGlm
IHRoZSBwaXJxIGhhcyBub3QgeWV0IGJlZW4KcmVtb3ZlZCBmcm9tIHRoZSBkb21haW4ncyBwaXJx
X3RyZWUsIGFzOgogIGRvbWFpbl9raWxsKCkKICAgIC0+IGRvbWFpbl9yZWxpbnF1aXNoX3Jlc291
cmNlcygpCiAgICAgIC0+IHBjaV9yZWxlYXNlX2RldmljZXMoKQogICAgICAgIC0+IHBjaV9jbGVh
bl9kcGNpX2lycSgpCiAgICAgICAgICAtPiBwaXJxX2d1ZXN0X3VuYmluZCgpCiAgICAgICAgICAg
IC0+IF9fcGlycV9ndWVzdF91bmJpbmQoKQoKRm9yIGEgc2hhcmVkIHBpcnEgKG5yX2d1ZXN0cyA+
IDEpLCB0aGUgZmlyc3QgY2FsbCB3b3VsZCB6YXAgdGhlIGN1cnJlbnQKZG9tYWluIGZyb20gdGhl
IHBpcnEncyBndWVzdHNbXSBsaXN0LCBidXQgdGhlIGFjdGlvbiBoYW5kbGVyIGlzIG5ldmVyIGZy
ZWVkCmFzIHRoZXJlIGFyZSBvdGhlciBndWVzdHMgdXNpbmcgdGhpcyBwaXJxLiBBcyBhIHJlc3Vs
dCwgb24gdGhlIHNlY29uZCBjYWxsLApfX3BpcnFfZ3Vlc3RfdW5iaW5kIHNlYXJjaGVzIGZvciB0
aGUgY3VycmVudCBkb21haW4gd2hpY2ggaGFzIGJlZW4gcmVtb3ZlZApmcm9tIHRoZSBndWVzdHNb
XSBsaXN0LCBhbmQgaGl0cyBhIEJVR19PTi4KCk1ha2UgX19waXJxX2d1ZXN0X3VuYmluZCBzYWZl
IHRvIGJlIGNhbGxlZCBtdWx0aXBsZSB0aW1lcyBieSBsZXR0aW5nIHhlbgpjb250aW51ZSBpZiBh
IHNoYXJlZCBwaXJxIGhhcyBhbHJlYWR5IGJlZW4gdW5ib3VuZCBmcm9tIHRoaXMgZ3Vlc3QuIFRo
ZQpQSVJRIHdpbGwgYmUgY2xlYW5lZCB1cCBmcm9tIHRoZSBkb21haW4ncyBwaXJxX3RyZWUgZHVy
aW5nIHRoZSBkZXN0cnVjdGlvbgppbiBjb21wbGV0ZV9kb21haW5fZGVzdHJveSBhbnl3YXkuCgpT
aWduZWQtb2ZmLWJ5OiBWYXJhZCBHYXV0YW0gPHZyZEBhbWF6b24uZGU+Clt0YWtpbmcgb3ZlciBm
cm9tIFZhcmFkIGF0IHY0XQpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9y
Zz4KLS0tCkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPgpDYzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUm9n
ZXIgc3VnZ2VzdGVkIGNsZWFuaW5nIHRoZSBlbnRyeSBmcm9tIHRoZSBkb21haW4gcGlycV90cmVl
IHNvIHRoYXQKd2UgbmVlZCBub3QgbWFrZSBpdCBzYWZlIHRvIHJlLWNhbGwgX19waXJxX2d1ZXN0
X3VuYmluZCgpLiBUaGlzIHNlZW1zIGxpa2UKYSByZWFzb25hYmxlIHN1Z2dlc3Rpb24gYnV0IHRo
ZSBzZW1hbnRpY3Mgb2YgdGhlIGNvZGUgYXJlIGFsbW9zdAppbXBlbmV0cmFibGUgKGUuZy4gJ3Bp
cnEnIGlzIHVzZWQgdG8gbWVhbiBhbiBpbmRleCwgYSBwb2ludGVyIGFuZCBpcyBhbHNvCnRoZSBu
YW1lIG9mIHN0cnVjdCBzbyB5b3UgZ2VuZXJhbGx5IGhhdmUgbGl0dGxlIGlkZWEgd2hhdCBpdCBh
Y3RhbGx5IG1lYW5zKQpzbyBJIHByZWZlciB0byBzdGljayB3aXRoIGEgc21hbGwgZml4IHRoYXQg
SSBjYW4gYWN0dWFsbHkgcmVhc29uIGFib3V0LgoKdjQ6CiAtIFJlLXdvcmsgdGhlIGd1ZXN0IGFy
cmF5IHNlYXJjaCB0byBtYWtlIGl0IGNsZWFyZXIKCnYzOgogIC0gU3R5bGUgZml4dXBzCgp2MjoK
IC0gU3BsaXQgdGhlIGNoZWNrIG9uIGFjdGlvbi0+bnJfZ3Vlc3RzID4gMCBhbmQgbWFrZSBpdCBh
biBBU1NFUlQKLS0tCiB4ZW4vYXJjaC94ODYvaXJxLmMgfCAyMCArKysrKysrKysrKysrKysrKy0t
LQogMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L2lycS5jIGIveGVuL2FyY2gveDg2L2lycS5jCmluZGV4IGNj
MmViOGU5MjUuLjMyZmNiNjI0ZGMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYworKysg
Yi94ZW4vYXJjaC94ODYvaXJxLmMKQEAgLTE2ODAsOSArMTY4MCwyMyBAQCBzdGF0aWMgaXJxX2d1
ZXN0X2FjdGlvbl90ICpfX3BpcnFfZ3Vlc3RfdW5iaW5kKAogCiAgICAgQlVHX09OKCEoZGVzYy0+
c3RhdHVzICYgSVJRX0dVRVNUKSk7CiAKLSAgICBmb3IgKCBpID0gMDsgKGkgPCBhY3Rpb24tPm5y
X2d1ZXN0cykgJiYgKGFjdGlvbi0+Z3Vlc3RbaV0gIT0gZCk7IGkrKyApCi0gICAgICAgIGNvbnRp
bnVlOwotICAgIEJVR19PTihpID09IGFjdGlvbi0+bnJfZ3Vlc3RzKTsKKyAgICBmb3IgKCBpID0g
MDsgaSA8IGFjdGlvbi0+bnJfZ3Vlc3RzOyBpKysgKQorICAgICAgICBpZiAoIGFjdGlvbi0+Z3Vl
c3RbaV0gPT0gZCApCisgICAgICAgICAgICBicmVhazsKKworICAgIGlmICggaSA9PSBhY3Rpb24t
Pm5yX2d1ZXN0cyApIC8qIE5vIG1hdGNoaW5nIGVudHJ5ICovCisgICAgeworICAgICAgICAvKgor
ICAgICAgICAgKiBJbiBjYXNlIHRoZSBwaXJxIHdhcyBzaGFyZWQsIHVuYm91bmQgZm9yIHRoaXMg
ZG9tYWluIGluIGFuIGVhcmxpZXIKKyAgICAgICAgICogY2FsbCwgYnV0IHN0aWxsIGV4aXN0ZWQg
b24gdGhlIGRvbWFpbidzIHBpcnFfdHJlZSwgd2Ugc3RpbGwgcmVhY2gKKyAgICAgICAgICogaGVy
ZSBpZiB0aGVyZSBhcmUgYW55IGxhdGVyIHVuYmluZCBjYWxscyBvbiB0aGUgc2FtZSBwaXJxLiBS
ZXR1cm4KKyAgICAgICAgICogaWYgc3VjaCBhbiB1bmJpbmQgaGFwcGVucy4KKyAgICAgICAgICov
CisgICAgICAgIEFTU0VSVChhY3Rpb24tPnNoYXJlYWJsZSk7CisgICAgICAgIHJldHVybiBOVUxM
OworICAgIH0KKworICAgIEFTU0VSVChhY3Rpb24tPm5yX2d1ZXN0cyA+IDApOwogICAgIG1lbW1v
dmUoJmFjdGlvbi0+Z3Vlc3RbaV0sICZhY3Rpb24tPmd1ZXN0W2krMV0sCiAgICAgICAgICAgICAo
YWN0aW9uLT5ucl9ndWVzdHMtaS0xKSAqIHNpemVvZihhY3Rpb24tPmd1ZXN0WzBdKSk7CiAgICAg
YWN0aW9uLT5ucl9ndWVzdHMtLTsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
