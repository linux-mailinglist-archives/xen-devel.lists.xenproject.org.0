Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79919184777
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 14:08:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCk1C-00019D-3a; Fri, 13 Mar 2020 13:06:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHM7=46=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jCk1A-00018w-5B
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 13:06:24 +0000
X-Inumbo-ID: 6c6a5ebd-652b-11ea-b2f0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c6a5ebd-652b-11ea-b2f0-12813bfff9fa;
 Fri, 13 Mar 2020 13:06:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 673FEAFCA;
 Fri, 13 Mar 2020 13:06:17 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 13 Mar 2020 14:06:14 +0100
Message-Id: <20200313130614.27265-5-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200313130614.27265-1-jgross@suse.com>
References: <20200313130614.27265-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v6 4/4] xen/rcu: add per-lock counter in debug
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
CgpUaGlzIHdpbGwgaGVscCB0byBhdm9pZCBjYXNlcyBsaWtlIHRoZSBvbmUgZml4ZWQgYnkgY29t
bWl0Cjk4ZWQxZjQzY2MyYzg5IHdoZXJlIGRpZmZlcmVudCByY3UgcmVhZCBsb2NrcyB3ZXJlIHJl
ZmVyZW5jZWQgaW4gdGhlCmxvY2sgYW5kIHVubG9jayBjYWxscy4KClNpZ25lZC1vZmYtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tClY1OgotIHVwZGF0ZWQgY29tbWl0IG1l
c3NhZ2UgKEphbiBCZXVsaWNoKQotLS0KIHhlbi9pbmNsdWRlL3hlbi9yY3VwZGF0ZS5oIHwgNDYg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL3hlbi9yY3VwZGF0ZS5oIGIveGVuL2luY2x1ZGUveGVuL3JjdXBkYXRlLmgKaW5k
ZXggZDNjMmI3YjA5My4uZTBjM2IxNmU3ZCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3Jj
dXBkYXRlLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL3JjdXBkYXRlLmgKQEAgLTM3LDIxICszNyw1
MCBAQAogI2luY2x1ZGUgPHhlbi9jcHVtYXNrLmg+CiAjaW5jbHVkZSA8eGVuL3BlcmNwdS5oPgog
I2luY2x1ZGUgPHhlbi9wcmVlbXB0Lmg+CisjaW5jbHVkZSA8YXNtL2F0b21pYy5oPgogCiAjZGVm
aW5lIF9fcmN1CiAKKyNpZm5kZWYgTkRFQlVHCisvKiAqIExvY2sgdHlwZSBmb3IgcGFzc2luZyB0
byByY3VfcmVhZF97bG9jayx1bmxvY2t9LiAqLworc3RydWN0IF9yY3VfcmVhZF9sb2NrIHsKKyAg
ICBhdG9taWNfdCBjbnQ7Cit9OwordHlwZWRlZiBzdHJ1Y3QgX3JjdV9yZWFkX2xvY2sgcmN1X3Jl
YWRfbG9ja190OworI2RlZmluZSBERUZJTkVfUkNVX1JFQURfTE9DSyh4KSByY3VfcmVhZF9sb2Nr
X3QgeCA9IHsgLmNudCA9IEFUT01JQ19JTklUKDApIH0KKyNkZWZpbmUgUkNVX1JFQURfTE9DS19J
TklUKHgpICAgYXRvbWljX3NldCgmKHgpLT5jbnQsIDApCisKKyNlbHNlCisvKgorICogRHVtbXkg
bG9jayB0eXBlIGZvciBwYXNzaW5nIHRvIHJjdV9yZWFkX3tsb2NrLHVubG9ja30uIEN1cnJlbnRs
eSBleGlzdHMKKyAqIG9ubHkgdG8gZG9jdW1lbnQgdGhlIHJlYXNvbiBmb3IgcmN1X3JlYWRfbG9j
aygpIGNyaXRpY2FsIHNlY3Rpb25zLgorICovCitzdHJ1Y3QgX3JjdV9yZWFkX2xvY2sge307Cit0
eXBlZGVmIHN0cnVjdCBfcmN1X3JlYWRfbG9jayByY3VfcmVhZF9sb2NrX3Q7CisjZGVmaW5lIERF
RklORV9SQ1VfUkVBRF9MT0NLKHgpIHJjdV9yZWFkX2xvY2tfdCB4CisjZGVmaW5lIFJDVV9SRUFE
X0xPQ0tfSU5JVCh4KQorCisjZW5kaWYKKwogREVDTEFSRV9QRVJfQ1BVKHVuc2lnbmVkIGludCwg
cmN1X2xvY2tfY250KTsKIAotc3RhdGljIGlubGluZSB2b2lkIHJjdV9xdWllc2NlX2Rpc2FibGUo
dm9pZCkKK3N0YXRpYyBpbmxpbmUgdm9pZCByY3VfcXVpZXNjZV9kaXNhYmxlKHJjdV9yZWFkX2xv
Y2tfdCAqbG9jaykKIHsKICAgICBwcmVlbXB0X2Rpc2FibGUoKTsKICAgICB0aGlzX2NwdShyY3Vf
bG9ja19jbnQpKys7CisjaWZuZGVmIE5ERUJVRworICAgIGF0b21pY19pbmMoJmxvY2stPmNudCk7
CisjZW5kaWYKICAgICBiYXJyaWVyKCk7CiB9CiAKLXN0YXRpYyBpbmxpbmUgdm9pZCByY3VfcXVp
ZXNjZV9lbmFibGUodm9pZCkKK3N0YXRpYyBpbmxpbmUgdm9pZCByY3VfcXVpZXNjZV9lbmFibGUo
cmN1X3JlYWRfbG9ja190ICpsb2NrKQogewogICAgIGJhcnJpZXIoKTsKKyNpZm5kZWYgTkRFQlVH
CisgICAgQVNTRVJUKGF0b21pY19yZWFkKCZsb2NrLT5jbnQpKTsKKyAgICBhdG9taWNfZGVjKCZs
b2NrLT5jbnQpOworI2VuZGlmCiAgICAgdGhpc19jcHUocmN1X2xvY2tfY250KS0tOwogICAgIHBy
ZWVtcHRfZW5hYmxlKCk7CiB9CkBAIC04MSwxNSArMTEwLDYgQEAgc3RydWN0IHJjdV9oZWFkIHsK
IGludCByY3VfcGVuZGluZyhpbnQgY3B1KTsKIGludCByY3VfbmVlZHNfY3B1KGludCBjcHUpOwog
Ci0vKgotICogRHVtbXkgbG9jayB0eXBlIGZvciBwYXNzaW5nIHRvIHJjdV9yZWFkX3tsb2NrLHVu
bG9ja30uIEN1cnJlbnRseSBleGlzdHMKLSAqIG9ubHkgdG8gZG9jdW1lbnQgdGhlIHJlYXNvbiBm
b3IgcmN1X3JlYWRfbG9jaygpIGNyaXRpY2FsIHNlY3Rpb25zLgotICovCi1zdHJ1Y3QgX3JjdV9y
ZWFkX2xvY2sge307Ci10eXBlZGVmIHN0cnVjdCBfcmN1X3JlYWRfbG9jayByY3VfcmVhZF9sb2Nr
X3Q7Ci0jZGVmaW5lIERFRklORV9SQ1VfUkVBRF9MT0NLKHgpIHJjdV9yZWFkX2xvY2tfdCB4Ci0j
ZGVmaW5lIFJDVV9SRUFEX0xPQ0tfSU5JVCh4KQotCiAvKioKICAqIHJjdV9yZWFkX2xvY2sgLSBt
YXJrIHRoZSBiZWdpbm5pbmcgb2YgYW4gUkNVIHJlYWQtc2lkZSBjcml0aWNhbCBzZWN0aW9uLgog
ICoKQEAgLTExOCw3ICsxMzgsNyBAQCB0eXBlZGVmIHN0cnVjdCBfcmN1X3JlYWRfbG9jayByY3Vf
cmVhZF9sb2NrX3Q7CiAgKi8KIHN0YXRpYyBpbmxpbmUgdm9pZCByY3VfcmVhZF9sb2NrKHJjdV9y
ZWFkX2xvY2tfdCAqbG9jaykKIHsKLSAgICByY3VfcXVpZXNjZV9kaXNhYmxlKCk7CisgICAgcmN1
X3F1aWVzY2VfZGlzYWJsZShsb2NrKTsKIH0KIAogLyoqCkBAIC0xMjksNyArMTQ5LDcgQEAgc3Rh
dGljIGlubGluZSB2b2lkIHJjdV9yZWFkX2xvY2socmN1X3JlYWRfbG9ja190ICpsb2NrKQogc3Rh
dGljIGlubGluZSB2b2lkIHJjdV9yZWFkX3VubG9jayhyY3VfcmVhZF9sb2NrX3QgKmxvY2spCiB7
CiAgICAgQVNTRVJUKCFyY3VfcXVpZXNjZV9hbGxvd2VkKCkpOwotICAgIHJjdV9xdWllc2NlX2Vu
YWJsZSgpOworICAgIHJjdV9xdWllc2NlX2VuYWJsZShsb2NrKTsKIH0KIAogLyoKLS0gCjIuMTYu
NAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
