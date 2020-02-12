Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D544015B3DB
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 23:35:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j20Zg-0003NZ-AL; Wed, 12 Feb 2020 22:33:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X/s5=4A=amazon.com=prvs=304f9ffca=anchalag@srs-us1.protection.inumbo.net>)
 id 1j20Zf-0003NQ-6d
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 22:33:39 +0000
X-Inumbo-ID: b6717f8c-4de7-11ea-b803-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b6717f8c-4de7-11ea-b803-12813bfff9fa;
 Wed, 12 Feb 2020 22:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1581546818; x=1613082818;
 h=date:from:to:subject:message-id:mime-version;
 bh=A9MU6ix5doEWHx0Vi3fmKI9vPHFZ3AdrseuapfeQP6E=;
 b=ndQc33T3PKZf0wPd+gV0boFfTZTlL5swL3MOiawMD1M2JbZep2TJuR3j
 8euEYQXYZW3niJlQmyQBe0mey0D7WW7uNU9d73CmdbbplYzgUNXpt7Nh1
 doVv8CVUIh7mqpR1QkRaoOiGVfL6MtVLN5GrhQ/VVRZZ8iVPpHxovOWkS o=;
IronPort-SDR: 6SjWQm0/EyoJwJdeUjL93w2E+e0UXuq767GbG34KzQQlp+sr4MEOYRW+f62srQBgMnRa/xpbuQ
 pYbwJNMLtC2A==
X-IronPort-AV: E=Sophos;i="5.70,434,1574121600"; d="scan'208";a="16031289"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 12 Feb 2020 22:33:26 +0000
Received: from EX13MTAUEB002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com (Postfix) with ESMTPS
 id 9CF35A1F8F; Wed, 12 Feb 2020 22:33:19 +0000 (UTC)
Received: from EX13D08UEB004.ant.amazon.com (10.43.60.142) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 12 Feb 2020 22:33:05 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D08UEB004.ant.amazon.com (10.43.60.142) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 12 Feb 2020 22:33:05 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Wed, 12 Feb 2020 22:33:04 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id BFC29400D1; Wed, 12 Feb 2020 22:33:04 +0000 (UTC)
Date: Wed, 12 Feb 2020 22:33:04 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <hpa@zytor.com>, 
 <x86@kernel.org>, <boris.ostrovsky@oracle.com>, <jgross@suse.com>,
 <linux-pm@vger.kernel.org>, <linux-mm@kvack.org>, <kamatam@amazon.com>,
 <sstabellini@kernel.org>, <konrad.wilk@oracle.com>, <roger.pau@citrix.com>,
 <axboe@kernel.dk>, <davem@davemloft.net>, <rjw@rjwysocki.net>,
 <len.brown@intel.com>, <pavel@ucw.cz>, <peterz@infradead.org>,
 <eduval@amazon.com>, <sblbir@amazon.com>, <anchalag@amazon.com>,
 <xen-devel@lists.xenproject.org>, <vkuznets@redhat.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dwmw@amazon.co.uk>, <fllinden@amaozn.com>, <benh@kernel.crashing.org>
Message-ID: <20200212223304.GA4262@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH v3 07/12] genirq: Shutdown irq chips in
 suspend/resume during hibernation
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgYXJlIG5vIHBtIGhhbmRsZXJzIGZvciB0aGUgbGVnYWN5IGRldmljZXMsIHNvIGR1cmlu
ZyB0ZWFyIGRvd24Kc3RhbGUgZXZlbnQgY2hhbm5lbCA8PiBJUlEgbWFwcGluZyBtYXkgc3RpbGwg
cmVtYWluIGluIHRoZSBpbWFnZSBhbmQKcmVzdW1lIG1heSBmYWlsLiBUbyBhdm9pZCBhZGRpbmcg
bXVjaCBjb2RlIGJ5IGltcGxlbWVudGluZyBoYW5kbGVycyBmb3IKbGVnYWN5IGRldmljZXMsIGFk
ZCBhIG5ldyBpcnFfY2hpcCBmbGFnIElSUUNISVBfU0hVVERPV05fT05fU1VTUEVORCB3aGljaAp3
aGVuIGVuYWJsZWQgb24gYW4gaXJxLWNoaXAgZS5nIHhlbi1waXJxLCBpdCB3aWxsIGxldCBjb3Jl
IHN1c3BlbmQvcmVzdW1lCmlycSBjb2RlIHRvIHNodXRkb3duIGFuZCByZXN0YXJ0IHRoZSBhY3Rp
dmUgaXJxcy4gUE0gc3VzcGVuZC9oaWJlcm5hdGlvbgpjb2RlIHdpbGwgcmVseSBvbiB0aGlzLgpX
aXRob3V0IHRoaXMsIGluIFBNIGhpYmVybmF0aW9uLCBpbmZvcm1hdGlvbiBhYm91dCB0aGUgZXZl
bnQgY2hhbm5lbApyZW1haW5zIGluIGhpYmVybmF0aW9uIGltYWdlLCBidXQgdGhlcmUgaXMgbm8g
Z3VhcmFudGVlIHRoYXQgdGhlIHNhbWUKZXZlbnQgY2hhbm5lbCBudW1iZXJzIGFyZSBhc3NpZ25l
ZCB0byB0aGUgZGV2aWNlcyB3aGVuIHJlc3RvcmluZyB0aGUKc3lzdGVtLiBUaGlzIG1heSBjYXVz
ZSBjb25mbGljdCBsaWtlIHRoZSBmb2xsb3dpbmcgYW5kIHByZXZlbnQgc29tZQpkZXZpY2VzIGZy
b20gYmVpbmcgcmVzdG9yZWQgY29ycmVjdGx5LgoKU2lnbmVkLW9mZi1ieTogQW5jaGFsIEFnYXJ3
YWwgPGFuY2hhbGFnQGFtYXpvbi5jb20+ClN1Z2dlc3RlZC1ieTogVGhvbWFzIEdsZWl4bmVyIDx0
Z2x4QGxpbnV0cm9uaXguZGU+CgotLS0KQ2hhbmdlcyBzaW5jZSBWMjoKICAgICogSXRzIG5ldyAg
cGF0Y2ggdG8gZml4IHNodXRkb3duL3Jlc3RvcmUgcGlycXMgZHVyaW5nIGhpYmVybmF0aW9uCiAg
ICAqIFJlbW92ZWQgcHJldmlvdXMgMiBwYXRjaGVzIHRvIHNodXRkb3duL3Jlc3RvcmUgcGlycXMg
aW4geGVuIGNvZGUKLS0tCiBkcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYyB8ICAxICsK
IGluY2x1ZGUvbGludXgvaXJxLmggICAgICAgICAgICAgIHwgIDIgKysKIGtlcm5lbC9pcnEvY2hp
cC5jICAgICAgICAgICAgICAgIHwgIDIgKy0KIGtlcm5lbC9pcnEvaW50ZXJuYWxzLmggICAgICAg
ICAgIHwgIDEgKwoga2VybmVsL2lycS9wbS5jICAgICAgICAgICAgICAgICAgfCAzMSArKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tCiA1IGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMo
KyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVu
dHNfYmFzZS5jIGIvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMKaW5kZXggNmM4ODQz
OTY4YTUyLi5lNDRmMjdiNDViZWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVu
dHNfYmFzZS5jCisrKyBiL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jCkBAIC0xNjIw
LDYgKzE2MjAsNyBAQCBzdGF0aWMgc3RydWN0IGlycV9jaGlwIHhlbl9waXJxX2NoaXAgX19yZWFk
X21vc3RseSA9IHsKIAkuaXJxX3NldF9hZmZpbml0eQk9IHNldF9hZmZpbml0eV9pcnEsCiAKIAku
aXJxX3JldHJpZ2dlcgkJPSByZXRyaWdnZXJfZHluaXJxLAorCS5mbGFncyAgICAgICAgICAgICAg
ICAgID0gSVJRQ0hJUF9TSFVURE9XTl9PTl9TVVNQRU5ELAogfTsKIAogc3RhdGljIHN0cnVjdCBp
cnFfY2hpcCB4ZW5fcGVyY3B1X2NoaXAgX19yZWFkX21vc3RseSA9IHsKZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvbGludXgvaXJxLmggYi9pbmNsdWRlL2xpbnV4L2lycS5oCmluZGV4IGZiMzAxY2YyOTE0
OC4uMjg3M2E1NzlmZDlkIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2lycS5oCisrKyBiL2lu
Y2x1ZGUvbGludXgvaXJxLmgKQEAgLTUxMSw2ICs1MTEsNyBAQCBzdHJ1Y3QgaXJxX2NoaXAgewog
ICogSVJRQ0hJUF9FT0lfVEhSRUFERUQ6CUNoaXAgcmVxdWlyZXMgZW9pKCkgb24gdW5tYXNrIGlu
IHRocmVhZGVkIG1vZGUKICAqIElSUUNISVBfU1VQUE9SVFNfTEVWRUxfTVNJCUNoaXAgY2FuIHBy
b3ZpZGUgdHdvIGRvb3JiZWxscyBmb3IgTGV2ZWwgTVNJcwogICogSVJRQ0hJUF9TVVBQT1JUU19O
TUk6CUNoaXAgY2FuIGRlbGl2ZXIgTk1Jcywgb25seSBmb3Igcm9vdCBpcnFjaGlwcworICogSVJR
Q0hJUF9TSFVURE9XTl9PTl9TVVNQRU5EOiBTaHV0ZG93biBub24gd2FrZSBpcnFzIGluIHRoZSBz
dXNwZW5kIHBhdGgKICAqLwogZW51bSB7CiAJSVJRQ0hJUF9TRVRfVFlQRV9NQVNLRUQJCT0gKDEg
PDwgIDApLApAQCAtNTIyLDYgKzUyMyw3IEBAIGVudW0gewogCUlSUUNISVBfRU9JX1RIUkVBREVE
CQk9ICgxIDw8ICA2KSwKIAlJUlFDSElQX1NVUFBPUlRTX0xFVkVMX01TSQk9ICgxIDw8ICA3KSwK
IAlJUlFDSElQX1NVUFBPUlRTX05NSQkJPSAoMSA8PCAgOCksCisJSVJRQ0hJUF9TSFVURE9XTl9P
Tl9TVVNQRU5EICAgICA9ICgxIDw8ICA5KSwKIH07CiAKICNpbmNsdWRlIDxsaW51eC9pcnFkZXNj
Lmg+CmRpZmYgLS1naXQgYS9rZXJuZWwvaXJxL2NoaXAuYyBiL2tlcm5lbC9pcnEvY2hpcC5jCmlu
ZGV4IGI3NjcwM2IyYzBhZi4uYTFlOGRmNTE5M2JhIDEwMDY0NAotLS0gYS9rZXJuZWwvaXJxL2No
aXAuYworKysgYi9rZXJuZWwvaXJxL2NoaXAuYwpAQCAtMjMzLDcgKzIzMyw3IEBAIF9faXJxX3N0
YXJ0dXBfbWFuYWdlZChzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MsIHN0cnVjdCBjcHVtYXNrICphZmYs
IGJvb2wgZm9yY2UpCiB9CiAjZW5kaWYKIAotc3RhdGljIGludCBfX2lycV9zdGFydHVwKHN0cnVj
dCBpcnFfZGVzYyAqZGVzYykKK2ludCBfX2lycV9zdGFydHVwKHN0cnVjdCBpcnFfZGVzYyAqZGVz
YykKIHsKIAlzdHJ1Y3QgaXJxX2RhdGEgKmQgPSBpcnFfZGVzY19nZXRfaXJxX2RhdGEoZGVzYyk7
CiAJaW50IHJldCA9IDA7CmRpZmYgLS1naXQgYS9rZXJuZWwvaXJxL2ludGVybmFscy5oIGIva2Vy
bmVsL2lycS9pbnRlcm5hbHMuaAppbmRleCAzOTI0ZmJlODI5ZDQuLjExYzdjNTViZGE2MyAxMDA2
NDQKLS0tIGEva2VybmVsL2lycS9pbnRlcm5hbHMuaAorKysgYi9rZXJuZWwvaXJxL2ludGVybmFs
cy5oCkBAIC04MCw2ICs4MCw3IEBAIGV4dGVybiB2b2lkIF9fZW5hYmxlX2lycShzdHJ1Y3QgaXJx
X2Rlc2MgKmRlc2MpOwogZXh0ZXJuIGludCBpcnFfYWN0aXZhdGUoc3RydWN0IGlycV9kZXNjICpk
ZXNjKTsKIGV4dGVybiBpbnQgaXJxX2FjdGl2YXRlX2FuZF9zdGFydHVwKHN0cnVjdCBpcnFfZGVz
YyAqZGVzYywgYm9vbCByZXNlbmQpOwogZXh0ZXJuIGludCBpcnFfc3RhcnR1cChzdHJ1Y3QgaXJx
X2Rlc2MgKmRlc2MsIGJvb2wgcmVzZW5kLCBib29sIGZvcmNlKTsKK2V4dGVybiBpbnQgX19pcnFf
c3RhcnR1cChzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MpOwogCiBleHRlcm4gdm9pZCBpcnFfc2h1dGRv
d24oc3RydWN0IGlycV9kZXNjICpkZXNjKTsKIGV4dGVybiB2b2lkIGlycV9zaHV0ZG93bl9hbmRf
ZGVhY3RpdmF0ZShzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MpOwpkaWZmIC0tZ2l0IGEva2VybmVsL2ly
cS9wbS5jIGIva2VybmVsL2lycS9wbS5jCmluZGV4IDhmNTU3ZmExZjRmZS4uZGM0OGEyNWYxNzU2
IDEwMDY0NAotLS0gYS9rZXJuZWwvaXJxL3BtLmMKKysrIGIva2VybmVsL2lycS9wbS5jCkBAIC04
NSwxNiArODUsMjUgQEAgc3RhdGljIGJvb2wgc3VzcGVuZF9kZXZpY2VfaXJxKHN0cnVjdCBpcnFf
ZGVzYyAqZGVzYykKIAl9CiAKIAlkZXNjLT5pc3RhdGUgfD0gSVJRU19TVVNQRU5ERUQ7Ci0JX19k
aXNhYmxlX2lycShkZXNjKTsKLQogCS8qCi0JICogSGFyZHdhcmUgd2hpY2ggaGFzIG5vIHdha2V1
cCBzb3VyY2UgY29uZmlndXJhdGlvbiBmYWNpbGl0eQotCSAqIHJlcXVpcmVzIHRoYXQgdGhlIG5v
biB3YWtldXAgaW50ZXJydXB0cyBhcmUgbWFza2VkIGF0IHRoZQotCSAqIGNoaXAgbGV2ZWwuIFRo
ZSBjaGlwIGltcGxlbWVudGF0aW9uIGluZGljYXRlcyB0aGF0IHdpdGgKLQkgKiBJUlFDSElQX01B
U0tfT05fU1VTUEVORC4KKwkgKiBTb21lIGlycSBjaGlwcyAoZS5nLiBYRU4gUElSUSkgcmVxdWly
ZSBhIGZ1bGwgc2h1dGRvd24gb24gc3VzcGVuZAorCSAqIGFzIHNvbWUgb2YgdGhlIGxlZ2FjeSBk
cml2ZXJzKGUuZy4gZmxvcHB5KSBkbyBub3RoaW5nIGR1cmluZyB0aGUKKwkgKiBzdXNwZW5kIHBh
dGgKIAkgKi8KLQlpZiAoaXJxX2Rlc2NfZ2V0X2NoaXAoZGVzYyktPmZsYWdzICYgSVJRQ0hJUF9N
QVNLX09OX1NVU1BFTkQpCi0JCW1hc2tfaXJxKGRlc2MpOworCWlmIChpcnFfZGVzY19nZXRfY2hp
cChkZXNjKS0+ZmxhZ3MgJiBJUlFDSElQX1NIVVRET1dOX09OX1NVU1BFTkQpIHsKKwkJaXJxX3No
dXRkb3duKGRlc2MpOworCX0gZWxzZSB7CisJCV9fZGlzYWJsZV9pcnEoZGVzYyk7CisKKwkgICAg
ICAgLyoKKwkJKiBIYXJkd2FyZSB3aGljaCBoYXMgbm8gd2FrZXVwIHNvdXJjZSBjb25maWd1cmF0
aW9uIGZhY2lsaXR5CisJCSogcmVxdWlyZXMgdGhhdCB0aGUgbm9uIHdha2V1cCBpbnRlcnJ1cHRz
IGFyZSBtYXNrZWQgYXQgdGhlCisJCSogY2hpcCBsZXZlbC4gVGhlIGNoaXAgaW1wbGVtZW50YXRp
b24gaW5kaWNhdGVzIHRoYXQgd2l0aAorCQkqIElSUUNISVBfTUFTS19PTl9TVVNQRU5ELgorCQkq
LworCQlpZiAoaXJxX2Rlc2NfZ2V0X2NoaXAoZGVzYyktPmZsYWdzICYgSVJRQ0hJUF9NQVNLX09O
X1NVU1BFTkQpCisJCQltYXNrX2lycShkZXNjKTsKKwl9CiAJcmV0dXJuIHRydWU7CiB9CiAKQEAg
LTE1Miw3ICsxNjEsMTEgQEAgc3RhdGljIHZvaWQgcmVzdW1lX2lycShzdHJ1Y3QgaXJxX2Rlc2Mg
KmRlc2MpCiAJaXJxX3N0YXRlX3NldF9tYXNrZWQoZGVzYyk7CiByZXN1bWU6CiAJZGVzYy0+aXN0
YXRlICY9IH5JUlFTX1NVU1BFTkRFRDsKLQlfX2VuYWJsZV9pcnEoZGVzYyk7CisKKwlpZiAoaXJx
X2Rlc2NfZ2V0X2NoaXAoZGVzYyktPmZsYWdzICYgSVJRQ0hJUF9TSFVURE9XTl9PTl9TVVNQRU5E
KQorCQlfX2lycV9zdGFydHVwKGRlc2MpOworCWVsc2UKKwkJX19lbmFibGVfaXJxKGRlc2MpOwog
fQogCiBzdGF0aWMgdm9pZCByZXN1bWVfaXJxcyhib29sIHdhbnRfZWFybHkpCi0tIAoyLjI0LjEu
QU1aTgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
