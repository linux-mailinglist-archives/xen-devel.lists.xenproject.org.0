Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2340547BE7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 10:15:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcml8-0003Kt-H3; Mon, 17 Jun 2019 08:12:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hcml6-0003Kk-FT
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 08:12:56 +0000
X-Inumbo-ID: b3b4dd52-90d7-11e9-8929-ff18506b4ad1
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3b4dd52-90d7-11e9-8929-ff18506b4ad1;
 Mon, 17 Jun 2019 08:12:52 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 17 Jun 2019 02:12:51 -0600
Message-Id: <5D074B7F0200007800238B69@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 17 Jun 2019 02:12:47 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CF0ECE80200007800233D41@prv1-mh.provo.novell.com>
 <5D074AE60200007800238B5E@prv1-mh.provo.novell.com>
In-Reply-To: <5D074AE60200007800238B5E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2 1/2] x86/traps: guard top-of-stack reads
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm90aGluZyAoYWZhaWNzKSBndWFyYW50ZWVzIHRoYXQgdGhlIG9yaWdpbmFsIGZyYW1lJ3Mgc3Rh
Y2sgcG9pbnRlcgpwb2ludHMgYXQgcmVhZGFibGUgbWVtb3J5LiBBdm9pZCBhIChsaWtlbHkgbmVz
dGVkKSBjcmFzaCBieSBhdHRhY2hpbmcKZXhjZXB0aW9uIHJlY292ZXJ5IHRvIHRoZSByZWFkICht
YWtpbmcgaXQgYSBzaW5nbGUgcmVhZCBhdCB0aGUgc2FtZQp0aW1lKS4gRG9uJ3QgZXZlbiBpbnZv
a2UgX3Nob3dfdHJhY2UoKSBpbiBjYXNlIG9mIGEgbm9uLXJlYWRhYmxlIHRvcApzbG90LgoKU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KdjI6IE5hbWUg
YXNtKCkgYXJndW1lbnRzLiBVc2UgZXhwbGljaXQgImZhdWx0IiB2YXJpYWJsZS4KCi0tLSBhL3hl
bi9hcmNoL3g4Ni90cmFwcy5jCisrKyBiL3hlbi9hcmNoL3g4Ni90cmFwcy5jCkBAIC00ODQsMTcg
KzQ4NCwzMSBAQCBzdGF0aWMgdm9pZCBfc2hvd190cmFjZSh1bnNpZ25lZCBsb25nIHNwCiAKIHN0
YXRpYyB2b2lkIHNob3dfdHJhY2UoY29uc3Qgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCiB7
Ci0gICAgdW5zaWduZWQgbG9uZyAqc3AgPSBFU1BfQkVGT1JFX0VYQ0VQVElPTihyZWdzKTsKKyAg
ICB1bnNpZ25lZCBsb25nICpzcCA9IEVTUF9CRUZPUkVfRVhDRVBUSU9OKHJlZ3MpLCB0b3MgPSAw
OworICAgIGJvb2wgZmF1bHQgPSBmYWxzZTsKIAogICAgIHByaW50aygiWGVuIGNhbGwgdHJhY2U6
XG4iKTsKIAorICAgIC8qIEd1YXJkZWQgcmVhZCBvZiB0aGUgc3RhY2sgdG9wLiAqLworICAgIGFz
bSAoICIxOiBtb3YgJVtkYXRhXSwgJVt0b3NdOyAyOlxuIgorICAgICAgICAgICIucHVzaHNlY3Rp
b24gLmZpeHVwLFwiYXhcIlxuIgorICAgICAgICAgICIzOiBtb3ZiICQxLCAlW2ZhdWx0XTsgam1w
IDJiXG4iCisgICAgICAgICAgIi5wb3BzZWN0aW9uXG4iCisgICAgICAgICAgX0FTTV9FWFRBQkxF
KDFiLCAzYikKKyAgICAgICAgICA6IFt0b3NdICIrciIgKHRvcyksIFtmYXVsdF0gIitxbSIgKGZh
dWx0KSA6IFtkYXRhXSAibSIgKCpzcCkgKTsKKwogICAgIC8qCiAgICAgICogSWYgUklQIGxvb2tz
IHNlbnNpYmxlLCBvciB0aGUgdG9wIG9mIHRoZSBzdGFjayBkb2Vzbid0LCBwcmludCBSSVAgYXQK
ICAgICAgKiB0aGUgdG9wIG9mIHRoZSBzdGFjayB0cmFjZS4KICAgICAgKi8KICAgICBpZiAoIGlz
X2FjdGl2ZV9rZXJuZWxfdGV4dChyZWdzLT5yaXApIHx8Ci0gICAgICAgICAhaXNfYWN0aXZlX2tl
cm5lbF90ZXh0KCpzcCkgKQorICAgICAgICAgIWlzX2FjdGl2ZV9rZXJuZWxfdGV4dCh0b3MpICkK
ICAgICAgICAgcHJpbnRrKCIgICBbPCVwPl0gJXBTXG4iLCBfcChyZWdzLT5yaXApLCBfcChyZWdz
LT5yaXApKTsKKyAgICBlbHNlIGlmICggZmF1bHQgKQorICAgIHsKKyAgICAgICAgcHJpbnRrKCIg
ICBbRmF1bHQgb24gYWNjZXNzXVxuIik7CisgICAgICAgIHJldHVybjsKKyAgICB9CiAgICAgLyoK
ICAgICAgKiBFbHNlIFJJUCBsb29rcyBiYWQgYnV0IHRoZSB0b3Agb2YgdGhlIHN0YWNrIGxvb2tz
IGdvb2QuICBQZXJoYXBzIHdlCiAgICAgICogZm9sbG93ZWQgYSB3aWxkIGZ1bmN0aW9uIHBvaW50
ZXI/IExldHMgYXNzdW1lIHRoZSB0b3Agb2YgdGhlIHN0YWNrIGlzIGEKQEAgLTUwMyw3ICs1MTcs
NyBAQCBzdGF0aWMgdm9pZCBzaG93X3RyYWNlKGNvbnN0IHN0cnVjdCBjcHVfCiAgICAgICovCiAg
ICAgZWxzZQogICAgIHsKLSAgICAgICAgcHJpbnRrKCIgICBbPCVwPl0gJXBTXG4iLCBfcCgqc3Ap
LCBfcCgqc3ApKTsKKyAgICAgICAgcHJpbnRrKCIgICBbPCVwPl0gJXBTXG4iLCBfcCh0b3MpLCBf
cCh0b3MpKTsKICAgICAgICAgc3ArKzsKICAgICB9CiAKCgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
