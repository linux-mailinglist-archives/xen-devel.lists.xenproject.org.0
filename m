Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F271629D0
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 16:50:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j455X-0000Zc-JQ; Tue, 18 Feb 2020 15:47:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=u3z7=4G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j455V-0000ZE-NK
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 15:47:05 +0000
X-Inumbo-ID: e93b4a88-5265-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e93b4a88-5265-11ea-ade5-bc764e2007e4;
 Tue, 18 Feb 2020 15:47:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 35DADAE2A;
 Tue, 18 Feb 2020 15:47:04 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b5d94bd8-9a39-c88b-4c3c-f89e655f3abf@suse.com>
Message-ID: <7c8de367-4833-c603-fcdd-89c1e6ceda3a@suse.com>
Date: Tue, 18 Feb 2020 16:47:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <b5d94bd8-9a39-c88b-4c3c-f89e655f3abf@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 3/5] libxl/PCI: make "rdm=" parsing comply with
 documentation
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RG9jdW1lbnRhdGlvbiBzYXlzICI8UkRNX1JFU0VSVkFUSU9OX1NUUklORz4gaXMgYSBjb21tYSBz
ZXBhcmF0ZWQgbGlzdApvZiA8S0VZPVZBTFVFPiBzZXR0aW5ncywgZnJvbSB0aGUgZm9sbG93aW5n
IGxpc3QiLiBUaGVyZSdzIG5vIG1lbnRpb24Kb2YgYSBzcGVjaWZpYyBvcmRlciwgeWV0IHNvIGZh
ciB0aGUgcGFyc2luZyBsb2dpYyBkaWQgYWNjZXB0IG9ubHkKc3RyYXRlZ3ksIHRoZW4gcG9saWN5
IChhbmQgbmVpdGhlciBvZiB0aGUgdHdvIG9taXR0ZWQpLiBNYWtlICJzdGF0ZSIKbW92ZQotIGJh
Y2sgdG8gU1RBVEVfVFlQRSB3aGVuIGZpbmRpbmcgYSBjb21tYSBhZnRlciBoYXZpbmcgcGFyc2Vk
IHRoZQogIDxWQUxVRT4gcGFydCBvZiBhIHNldHRpbmcsCi0gdG8gU1RBVEVfVEVSTUlOQUwgb3Ro
ZXJ3aXNlLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoK
LS0tIGEvdG9vbHMvbGlieGwvbGlieGx1X3BjaS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsdV9w
Y2kuYwpAQCAtMTk0LDkgKzE5NCwxMiBAQCBpbnQgeGx1X3JkbV9wYXJzZShYTFVfQ29uZmlnICpj
ZmcsIGxpYnhsCiAgICAgICAgIHN3aXRjaChzdGF0ZSkgewogICAgICAgICBjYXNlIFNUQVRFX1RZ
UEU6CiAgICAgICAgICAgICBpZiAoKnB0ciA9PSAnPScpIHsKLSAgICAgICAgICAgICAgICBzdGF0
ZSA9IFNUQVRFX1JETV9TVFJBVEVHWTsKICAgICAgICAgICAgICAgICAqcHRyID0gJ1wwJzsKLSAg
ICAgICAgICAgICAgICBpZiAoc3RyY21wKHRvaywgInN0cmF0ZWd5IikpIHsKKyAgICAgICAgICAg
ICAgICBpZiAoIXN0cmNtcCh0b2ssICJzdHJhdGVneSIpKSB7CisgICAgICAgICAgICAgICAgICAg
IHN0YXRlID0gU1RBVEVfUkRNX1NUUkFURUdZOworICAgICAgICAgICAgICAgIH0gZWxzZSBpZiAo
IXN0cmNtcCh0b2ssICJwb2xpY3kiKSkgeworICAgICAgICAgICAgICAgICAgICBzdGF0ZSA9IFNU
QVRFX1JFU0VSVkVfUE9MSUNZOworICAgICAgICAgICAgICAgIH0gZWxzZSB7CiAgICAgICAgICAg
ICAgICAgICAgIFhMVV9fUENJX0VSUihjZmcsICJVbmtub3duIFJETSBzdGF0ZSBvcHRpb246ICVz
IiwgdG9rKTsKICAgICAgICAgICAgICAgICAgICAgZ290byBwYXJzZV9lcnJvcjsKICAgICAgICAg
ICAgICAgICB9CkBAIC0yMDUsNyArMjA4LDcgQEAgaW50IHhsdV9yZG1fcGFyc2UoWExVX0NvbmZp
ZyAqY2ZnLCBsaWJ4bAogICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgIGNhc2UgU1RBVEVfUkRN
X1NUUkFURUdZOgogICAgICAgICAgICAgaWYgKCpwdHIgPT0gJ1wwJyB8fCAqcHRyID09ICcsJykg
ewotICAgICAgICAgICAgICAgIHN0YXRlID0gU1RBVEVfUkVTRVJWRV9QT0xJQ1k7CisgICAgICAg
ICAgICAgICAgc3RhdGUgPSAqcHRyID09ICcsJyA/IFNUQVRFX1RZUEUgOiBTVEFURV9URVJNSU5B
TDsKICAgICAgICAgICAgICAgICAqcHRyID0gJ1wwJzsKICAgICAgICAgICAgICAgICBpZiAoIXN0
cmNtcCh0b2ssICJob3N0IikpIHsKICAgICAgICAgICAgICAgICAgICAgcmRtLT5zdHJhdGVneSA9
IExJQlhMX1JETV9SRVNFUlZFX1NUUkFURUdZX0hPU1Q7CkBAIC0yMTcsMTkgKzIyMCw4IEBAIGlu
dCB4bHVfcmRtX3BhcnNlKFhMVV9Db25maWcgKmNmZywgbGlieGwKICAgICAgICAgICAgIH0KICAg
ICAgICAgICAgIGJyZWFrOwogICAgICAgICBjYXNlIFNUQVRFX1JFU0VSVkVfUE9MSUNZOgotICAg
ICAgICAgICAgaWYgKCpwdHIgPT0gJz0nKSB7Ci0gICAgICAgICAgICAgICAgc3RhdGUgPSBTVEFU
RV9PUFRJT05TX1Y7Ci0gICAgICAgICAgICAgICAgKnB0ciA9ICdcMCc7Ci0gICAgICAgICAgICAg
ICAgaWYgKHN0cmNtcCh0b2ssICJwb2xpY3kiKSkgewotICAgICAgICAgICAgICAgICAgICBYTFVf
X1BDSV9FUlIoY2ZnLCAiVW5rbm93biBSRE0gcHJvcGVydHkgdmFsdWU6ICVzIiwgdG9rKTsKLSAg
ICAgICAgICAgICAgICAgICAgZ290byBwYXJzZV9lcnJvcjsKLSAgICAgICAgICAgICAgICB9Ci0g
ICAgICAgICAgICAgICAgdG9rID0gcHRyICsgMTsKLSAgICAgICAgICAgIH0KLSAgICAgICAgICAg
IGJyZWFrOwotICAgICAgICBjYXNlIFNUQVRFX09QVElPTlNfVjoKICAgICAgICAgICAgIGlmICgq
cHRyID09ICcsJyB8fCAqcHRyID09ICdcMCcpIHsKLSAgICAgICAgICAgICAgICBzdGF0ZSA9IFNU
QVRFX1RFUk1JTkFMOworICAgICAgICAgICAgICAgIHN0YXRlID0gKnB0ciA9PSAnLCcgPyBTVEFU
RV9UWVBFIDogU1RBVEVfVEVSTUlOQUw7CiAgICAgICAgICAgICAgICAgKnB0ciA9ICdcMCc7CiAg
ICAgICAgICAgICAgICAgaWYgKCFzdHJjbXAodG9rLCAic3RyaWN0IikpIHsKICAgICAgICAgICAg
ICAgICAgICAgcmRtLT5wb2xpY3kgPSBMSUJYTF9SRE1fUkVTRVJWRV9QT0xJQ1lfU1RSSUNUOwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
