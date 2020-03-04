Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 881EC178AAC
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 07:36:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9Na9-0001yf-UH; Wed, 04 Mar 2020 06:32:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jt9l=4V=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j9Na9-0001yV-6i
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 06:32:37 +0000
X-Inumbo-ID: e4a16732-5de1-11ea-90c4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4a16732-5de1-11ea-90c4-bc764e2007e4;
 Wed, 04 Mar 2020 06:32:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1F326B265;
 Wed,  4 Mar 2020 06:32:16 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  4 Mar 2020 07:32:12 +0100
Message-Id: <20200304063212.20843-7-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200304063212.20843-1-jgross@suse.com>
References: <20200304063212.20843-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v3 6/6] xen/rcu: add per-lock counter in debug
 builds
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGEgbG9jayBzcGVjaWZpYyBjb3VudGVyIHRvIHJjdSByZWFkIGxvY2tzIGluIGRlYnVnIGJ1
aWxkcy4gVGhpcwphbGxvd3MgdG8gdGVzdCBmb3IgbWF0Y2hpbmcgbG9jay91bmxvY2sgY2FsbHMu
CgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogeGVu
L2luY2x1ZGUveGVuL3JjdXBkYXRlLmggfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDE1IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9yY3VwZGF0ZS5oIGIveGVuL2lu
Y2x1ZGUveGVuL3JjdXBkYXRlLmgKaW5kZXggOWY2ZDQyMDg5OC4uNDRhMzVhODA5YSAxMDA2NDQK
LS0tIGEveGVuL2luY2x1ZGUveGVuL3JjdXBkYXRlLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL3Jj
dXBkYXRlLmgKQEAgLTQwLDE3ICs0MCwyOCBAQAogI2RlZmluZSBfX3JjdQogCiAjaWZuZGVmIE5E
RUJVRworLyogKiBMb2NrIHR5cGUgZm9yIHBhc3NpbmcgdG8gcmN1X3JlYWRfe2xvY2ssdW5sb2Nr
fS4gKi8KK3N0cnVjdCBfcmN1X3JlYWRfbG9jayB7CisgICAgYXRvbWljX3QgY250OworfTsKK3R5
cGVkZWYgc3RydWN0IF9yY3VfcmVhZF9sb2NrIHJjdV9yZWFkX2xvY2tfdDsKKyNkZWZpbmUgREVG
SU5FX1JDVV9SRUFEX0xPQ0soeCkgcmN1X3JlYWRfbG9ja190IHggPSB7IC5jbnQgPSBBVE9NSUNf
SU5JVCgwKSB9CisjZGVmaW5lIFJDVV9SRUFEX0xPQ0tfSU5JVCh4KSAgIGF0b21pY19zZXQoJih4
KS0+Y250LCAwKQorCiBERUNMQVJFX1BFUl9DUFUodW5zaWduZWQgaW50LCByY3VfbG9ja19jbnQp
OwogCi1zdGF0aWMgaW5saW5lIHZvaWQgcmN1X3F1aWVzY2VfZGlzYWJsZSh2b2lkKQorc3RhdGlj
IGlubGluZSB2b2lkIHJjdV9xdWllc2NlX2Rpc2FibGUocmN1X3JlYWRfbG9ja190ICpsb2NrKQog
ewogICAgIHRoaXNfY3B1KHJjdV9sb2NrX2NudCkrKzsKKyAgICBhdG9taWNfaW5jKCZsb2NrLT5j
bnQpOwogICAgIGFyY2hfbG9ja19hY3F1aXJlX2JhcnJpZXIoKTsKIH0KIAotc3RhdGljIGlubGlu
ZSB2b2lkIHJjdV9xdWllc2NlX2VuYWJsZSh2b2lkKQorc3RhdGljIGlubGluZSB2b2lkIHJjdV9x
dWllc2NlX2VuYWJsZShyY3VfcmVhZF9sb2NrX3QgKmxvY2spCiB7CiAgICAgYXJjaF9sb2NrX3Jl
bGVhc2VfYmFycmllcigpOworICAgIEFTU0VSVChhdG9taWNfcmVhZCgmbG9jay0+Y250KSk7Cisg
ICAgYXRvbWljX2RlYygmbG9jay0+Y250KTsKICAgICB0aGlzX2NwdShyY3VfbG9ja19jbnQpLS07
CiB9CiAKQEAgLTYwLDggKzcxLDE3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCByY3VfcXVpZXNjZV9h
bGxvd2VkKHZvaWQpCiB9CiAKICNlbHNlCi1zdGF0aWMgaW5saW5lIHZvaWQgcmN1X3F1aWVzY2Vf
ZGlzYWJsZSh2b2lkKSB7IH0KLXN0YXRpYyBpbmxpbmUgdm9pZCByY3VfcXVpZXNjZV9lbmFibGUo
dm9pZCkgeyB9CisvKgorICogRHVtbXkgbG9jayB0eXBlIGZvciBwYXNzaW5nIHRvIHJjdV9yZWFk
X3tsb2NrLHVubG9ja30uIEN1cnJlbnRseSBleGlzdHMKKyAqIG9ubHkgdG8gZG9jdW1lbnQgdGhl
IHJlYXNvbiBmb3IgcmN1X3JlYWRfbG9jaygpIGNyaXRpY2FsIHNlY3Rpb25zLgorICovCitzdHJ1
Y3QgX3JjdV9yZWFkX2xvY2sge307Cit0eXBlZGVmIHN0cnVjdCBfcmN1X3JlYWRfbG9jayByY3Vf
cmVhZF9sb2NrX3Q7CisjZGVmaW5lIERFRklORV9SQ1VfUkVBRF9MT0NLKHgpIHJjdV9yZWFkX2xv
Y2tfdCB4CisjZGVmaW5lIFJDVV9SRUFEX0xPQ0tfSU5JVCh4KQorCitzdGF0aWMgaW5saW5lIHZv
aWQgcmN1X3F1aWVzY2VfZGlzYWJsZShyY3VfcmVhZF9sb2NrX3QgKmxvY2spIHsgfQorc3RhdGlj
IGlubGluZSB2b2lkIHJjdV9xdWllc2NlX2VuYWJsZShyY3VfcmVhZF9sb2NrX3QgKmxvY2spIHsg
fQogc3RhdGljIGlubGluZSBib29sIHJjdV9xdWllc2NlX2FsbG93ZWQodm9pZCkKIHsKICAgICBy
ZXR1cm4gdHJ1ZTsKQEAgLTg4LDE1ICsxMDgsNiBAQCBzdHJ1Y3QgcmN1X2hlYWQgewogaW50IHJj
dV9wZW5kaW5nKGludCBjcHUpOwogaW50IHJjdV9uZWVkc19jcHUoaW50IGNwdSk7CiAKLS8qCi0g
KiBEdW1teSBsb2NrIHR5cGUgZm9yIHBhc3NpbmcgdG8gcmN1X3JlYWRfe2xvY2ssdW5sb2NrfS4g
Q3VycmVudGx5IGV4aXN0cwotICogb25seSB0byBkb2N1bWVudCB0aGUgcmVhc29uIGZvciByY3Vf
cmVhZF9sb2NrKCkgY3JpdGljYWwgc2VjdGlvbnMuCi0gKi8KLXN0cnVjdCBfcmN1X3JlYWRfbG9j
ayB7fTsKLXR5cGVkZWYgc3RydWN0IF9yY3VfcmVhZF9sb2NrIHJjdV9yZWFkX2xvY2tfdDsKLSNk
ZWZpbmUgREVGSU5FX1JDVV9SRUFEX0xPQ0soeCkgcmN1X3JlYWRfbG9ja190IHgKLSNkZWZpbmUg
UkNVX1JFQURfTE9DS19JTklUKHgpCi0KIC8qKgogICogcmN1X3JlYWRfbG9jayAtIG1hcmsgdGhl
IGJlZ2lubmluZyBvZiBhbiBSQ1UgcmVhZC1zaWRlIGNyaXRpY2FsIHNlY3Rpb24uCiAgKgpAQCAt
MTI1LDcgKzEzNiw3IEBAIHR5cGVkZWYgc3RydWN0IF9yY3VfcmVhZF9sb2NrIHJjdV9yZWFkX2xv
Y2tfdDsKICAqLwogc3RhdGljIGlubGluZSB2b2lkIHJjdV9yZWFkX2xvY2socmN1X3JlYWRfbG9j
a190ICpsb2NrKQogewotICAgIHJjdV9xdWllc2NlX2Rpc2FibGUoKTsKKyAgICByY3VfcXVpZXNj
ZV9kaXNhYmxlKGxvY2spOwogfQogCiAvKioKQEAgLTEzNiw3ICsxNDcsNyBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgcmN1X3JlYWRfbG9jayhyY3VfcmVhZF9sb2NrX3QgKmxvY2spCiBzdGF0aWMgaW5s
aW5lIHZvaWQgcmN1X3JlYWRfdW5sb2NrKHJjdV9yZWFkX2xvY2tfdCAqbG9jaykKIHsKICAgICBB
U1NFUlQoIXJjdV9xdWllc2NlX2FsbG93ZWQoKSk7Ci0gICAgcmN1X3F1aWVzY2VfZW5hYmxlKCk7
CisgICAgcmN1X3F1aWVzY2VfZW5hYmxlKGxvY2spOwogfQogCiAvKgotLSAKMi4xNi40CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
