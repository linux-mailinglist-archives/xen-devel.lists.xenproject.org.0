Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0314217F85E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 13:47:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBeEu-00080W-9G; Tue, 10 Mar 2020 12:44:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YNok=43=xen.org=prvs=33108a8dd=paul@srs-us1.protection.inumbo.net>)
 id 1jBeEs-00080R-8c
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 12:44:02 +0000
X-Inumbo-ID: d14d323e-62cc-11ea-92cf-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d14d323e-62cc-11ea-92cf-bc764e2007e4;
 Tue, 10 Mar 2020 12:44:01 +0000 (UTC)
IronPort-SDR: OKbgj6z6JFAm2Fy48+mWUE4QxhGcfOxgGNoONaL3g3DWIW9O+fzC1haX3kQtenXY+6AzzizxBM
 gprxO16kXbcg==
X-IronPort-AV: E=Sophos;i="5.70,537,1574121600"; d="scan'208";a="30321223"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 10 Mar 2020 12:44:01 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com (Postfix) with ESMTPS
 id D7629A2879; Tue, 10 Mar 2020 12:43:58 +0000 (UTC)
Received: from EX13D22EUB002.ant.amazon.com (10.43.166.131) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 10 Mar 2020 12:43:57 +0000
Received: from EX13MTAUEA002.ant.amazon.com (10.43.61.77) by
 EX13D22EUB002.ant.amazon.com (10.43.166.131) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 10 Mar 2020 12:43:56 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.169) with Microsoft SMTP Server id
 15.0.1236.3 via Frontend Transport; Tue, 10 Mar 2020 12:43:55 +0000
From: <paul@xen.org>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 10 Mar 2020 12:43:53 +0000
Message-ID: <20200310124353.4337-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v5] x86: irq: Do not BUG_ON multiple unbind
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
SSBjYW4gYWN0dWFsbHkgcmVhc29uIGFib3V0LgoKdjU6CiAtIEJVR19PTighc2hhcmVhYmxlKSBy
YXRoZXIgdGhhbiBBU1NFUlQoc2hhcmVhYmxlKQogLSBEcm9wIEFTU0VSVCBvbiBucl9ndWVzdHMK
CnY0OgogLSBSZS13b3JrIHRoZSBndWVzdCBhcnJheSBzZWFyY2ggdG8gbWFrZSBpdCBjbGVhcmVy
Cgp2MzoKICAtIFN0eWxlIGZpeHVwcwoKdjI6CiAtIFNwbGl0IHRoZSBjaGVjayBvbiBhY3Rpb24t
Pm5yX2d1ZXN0cyA+IDAgYW5kIG1ha2UgaXQgYW4gQVNTRVJUCi0tLQogeGVuL2FyY2gveDg2L2ly
cS5jIHwgMTkgKysrKysrKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2lycS5jIGIv
eGVuL2FyY2gveDg2L2lycS5jCmluZGV4IGNjMmViOGU5MjUuLmEzNzAxMzU0ZTYgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni9pcnEuYworKysgYi94ZW4vYXJjaC94ODYvaXJxLmMKQEAgLTE2ODAs
OSArMTY4MCwyMiBAQCBzdGF0aWMgaXJxX2d1ZXN0X2FjdGlvbl90ICpfX3BpcnFfZ3Vlc3RfdW5i
aW5kKAogCiAgICAgQlVHX09OKCEoZGVzYy0+c3RhdHVzICYgSVJRX0dVRVNUKSk7CiAKLSAgICBm
b3IgKCBpID0gMDsgKGkgPCBhY3Rpb24tPm5yX2d1ZXN0cykgJiYgKGFjdGlvbi0+Z3Vlc3RbaV0g
IT0gZCk7IGkrKyApCi0gICAgICAgIGNvbnRpbnVlOwotICAgIEJVR19PTihpID09IGFjdGlvbi0+
bnJfZ3Vlc3RzKTsKKyAgICBmb3IgKCBpID0gMDsgaSA8IGFjdGlvbi0+bnJfZ3Vlc3RzOyBpKysg
KQorICAgICAgICBpZiAoIGFjdGlvbi0+Z3Vlc3RbaV0gPT0gZCApCisgICAgICAgICAgICBicmVh
azsKKworICAgIGlmICggaSA9PSBhY3Rpb24tPm5yX2d1ZXN0cyApIC8qIE5vIG1hdGNoaW5nIGVu
dHJ5ICovCisgICAgeworICAgICAgICAvKgorICAgICAgICAgKiBJbiBjYXNlIHRoZSBwaXJxIHdh
cyBzaGFyZWQsIHVuYm91bmQgZm9yIHRoaXMgZG9tYWluIGluIGFuIGVhcmxpZXIKKyAgICAgICAg
ICogY2FsbCwgYnV0IHN0aWxsIGV4aXN0ZWQgb24gdGhlIGRvbWFpbidzIHBpcnFfdHJlZSwgd2Ug
c3RpbGwgcmVhY2gKKyAgICAgICAgICogaGVyZSBpZiB0aGVyZSBhcmUgYW55IGxhdGVyIHVuYmlu
ZCBjYWxscyBvbiB0aGUgc2FtZSBwaXJxLiBSZXR1cm4KKyAgICAgICAgICogaWYgc3VjaCBhbiB1
bmJpbmQgaGFwcGVucy4KKyAgICAgICAgICovCisgICAgICAgIEJVR19PTighYWN0aW9uLT5zaGFy
ZWFibGUpOworICAgICAgICByZXR1cm4gTlVMTDsKKyAgICB9CisKICAgICBtZW1tb3ZlKCZhY3Rp
b24tPmd1ZXN0W2ldLCAmYWN0aW9uLT5ndWVzdFtpKzFdLAogICAgICAgICAgICAgKGFjdGlvbi0+
bnJfZ3Vlc3RzLWktMSkgKiBzaXplb2YoYWN0aW9uLT5ndWVzdFswXSkpOwogICAgIGFjdGlvbi0+
bnJfZ3Vlc3RzLS07Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
