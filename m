Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D651629D2
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 16:50:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j455C-0000Vw-A6; Tue, 18 Feb 2020 15:46:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=u3z7=4G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j455B-0000Vo-6s
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 15:46:45 +0000
X-Inumbo-ID: dcfc6dce-5265-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dcfc6dce-5265-11ea-ade5-bc764e2007e4;
 Tue, 18 Feb 2020 15:46:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D16F7AE17;
 Tue, 18 Feb 2020 15:46:43 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b5d94bd8-9a39-c88b-4c3c-f89e655f3abf@suse.com>
Message-ID: <2124c861-bd26-1ec4-3b38-0cf24ee87c79@suse.com>
Date: Tue, 18 Feb 2020 16:46:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <b5d94bd8-9a39-c88b-4c3c-f89e655f3abf@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 2/5] libxl/PCI: establish per-device reserved
 memory policy earlier
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

UmVzZXJ2ZWQgZGV2aWNlIG1lbW9yeSByZWdpb24gcHJvY2Vzc2luZyBhcyB3ZWxsIGFzIEU4MjAg
dGFibGUgY3JlYXRpb24KaGFwcGVuIGVhcmxpZXIgdGhhbiB0aGUgYWRkaW5nIG9mIChQQ0kpIGRl
dmljZXMsIHlldCB0aGV5IGNvbnN1bWUgdGhlCnBvbGljeSAoZS5nLiB0byBkZWNpZGUgd2hldGhl
ciB0byBhZGQgZW50cmllcyB0byB0aGUgRTgyMCB0YWJsZSkuIEJ1dCBzbwpmYXIgaXQgd2FzIG9u
bHkgYXQgdGhlIHN0YWdlIG9mIFBDSSBkZXZpY2UgYWRkaXRpb24gdGhhdCB0aGUgZmluYWwKcG9s
aWN5IHdhcyBlc3RhYmxpc2hlZCAoaS5lLiBpZiBub3QgZXhwbGljaXRseSBzcGVjaWZpZWQgYnkg
dGhlIGd1ZXN0CmNvbmZpZyBmaWxlKS4KCk5vdGUgdGhhdCBJIGNvdWxkbid0IGZpbmQgdGhlIGRv
bWFpbiBJRCB0byBiZSBhdmFpbGFibGUgaW4KbGlieGxfX2RvbWFpbl9kZXZpY2VfY29uc3RydWN0
X3JkbSgpLCBidXQgb2JzZXJ2aW5nIHRoYXQKbGlieGxfX2RldmljZV9wY2lfc2V0ZGVmYXVsdCgp
IGFsc28gZG9lc24ndCB1c2UgaXQsIGZvciB0aGUgdGltZSBiZWluZwpET01JRF9JTlZBTElEIGdl
dHMgcGFzc2VkLiBBbiBvYnZpb3VzIGFsdGVybmF0aXZlIHdvdWxkIGJlIHRvIGRyb3AgdGhlCnVu
dXNlZCBwYXJhbWV0ZXIvYXJndW1lbnQsIHlldCBhdCB0aGF0IHRpbWUgdGhlIHF1ZXN0aW9uIHdv
dWxkIGJlCndoZXRoZXIgdG8gYWxzbyBkcm9wIG90aGVyIHVudXNlZCBvbmVzLgoKU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEvdG9vbHMvbGlieGwv
bGlieGxfZG0uYworKysgYi90b29scy9saWJ4bC9saWJ4bF9kbS5jCkBAIC00ODgsNiArNDg4LDEx
IEBAIGludCBsaWJ4bF9fZG9tYWluX2RldmljZV9jb25zdHJ1Y3RfcmRtKGwKIAogICAgICAgICBh
c3NlcnQoeHJkbSk7CiAKKyAgICAgICAgcmMgPSBsaWJ4bF9fZGV2aWNlX3BjaV9zZXRkZWZhdWx0
KGdjLCBET01JRF9JTlZBTElELAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgJmRfY29uZmlnLT5wY2lkZXZzW2ldLCBmYWxzZSk7CisgICAgICAgIGlmIChyYykKKyAg
ICAgICAgICAgIGdvdG8gb3V0OworCiAgICAgICAgIGZvciAobiA9IDA7IG4gPCBucl9lbnRyaWVz
OyArK24pIHsKICAgICAgICAgICAgIGJvb2wgbmV3ID0gdHJ1ZTsKIAotLS0gYS90b29scy9saWJ4
bC9saWJ4bF9pbnRlcm5hbC5oCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKQEAg
LTE3MDksNiArMTcwOSw4IEBAIF9oaWRkZW4gdm9pZCBsaWJ4bF9fZGV2aWNlX3BjaV9hZGQobGli
eGwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfX2FvX2RldmljZSAq
YW9kZXYpOwogX2hpZGRlbiB2b2lkIGxpYnhsX19kZXZpY2VfcGNpX2Rlc3Ryb3lfYWxsKGxpYnhs
X19lZ2MgKmVnYywgdWludDMyX3QgZG9taWQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgbGlieGxfX211bHRpZGV2ICopOworX2hpZGRlbiBpbnQgbGlieGxfX2Rl
dmljZV9wY2lfc2V0ZGVmYXVsdChsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCwKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfZGV2aWNlX3BjaSAqcGNp
LCBib29sIGhvdHBsdWcpOwogX2hpZGRlbiBib29sIGxpYnhsX19pc19pZ2RfdmdhX3Bhc3N0aHJ1
KGxpYnhsX19nYyAqZ2MsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Y29uc3QgbGlieGxfZG9tYWluX2NvbmZpZyAqZF9jb25maWcpOwogCi0tLSBhL3Rvb2xzL2xpYnhs
L2xpYnhsX3BjaS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3BjaS5jCkBAIC0xNDgzLDggKzE0
ODMsOCBAQCBzdGF0aWMgaW50IGxpYnhsX19kZXZpY2VfcGNpX3Jlc2V0KGxpYnhsCiAgICAgcmV0
dXJuIC0xOwogfQogCi1zdGF0aWMgaW50IGxpYnhsX19kZXZpY2VfcGNpX3NldGRlZmF1bHQobGli
eGxfX2djICpnYywgdWludDMyX3QgZG9taWQsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbGlieGxfZGV2aWNlX3BjaSAqcGNpLCBib29sIGhvdHBsdWcpCitpbnQgbGli
eGxfX2RldmljZV9wY2lfc2V0ZGVmYXVsdChsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCwK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2RldmljZV9wY2kgKnBjaSwg
Ym9vbCBob3RwbHVnKQogewogICAgIC8qIFdlJ2QgbGlrZSB0byBmb3JjZSByZXNlcnZlIHJkbSBz
cGVjaWZpYyB0byBhIGRldmljZSBieSBkZWZhdWx0LiovCiAgICAgaWYgKHBjaS0+cmRtX3BvbGlj
eSA9PSBMSUJYTF9SRE1fUkVTRVJWRV9QT0xJQ1lfSU5WQUxJRCkKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
