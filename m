Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33740171FCC
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 15:39:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7KFS-0001N9-6C; Thu, 27 Feb 2020 14:34:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qtag=4P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7KFQ-0001N2-HM
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 14:34:44 +0000
X-Inumbo-ID: 4aada9a0-596e-11ea-96af-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4aada9a0-596e-11ea-96af-12813bfff9fa;
 Thu, 27 Feb 2020 14:34:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7BAE8B2CC;
 Thu, 27 Feb 2020 14:34:41 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <640545a6-689a-6ba9-4978-a83183df2e1b@suse.com>
Date: Thu, 27 Feb 2020 15:34:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] AMD/IOMMU: correct handling when XT's prereq
 features are unavailable
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2Ugc2hvdWxkIG5laXRoZXIgY2F1c2UgSU9NTVUgaW5pdGlhbGl6YXRpb24gYXMgYSB3aG9sZSB0
byBmYWlsIGluIHRoaXMKY2FzZSAod2Ugc2hvdWxkIHN0aWxsIGJlIGFibGUgdG8gYnJpbmcgdXAg
dGhlIHN5c3RlbSBpbiBub24teDJBUElDIG9yCngyQVBJQyBwaHlzaWNhbCBtb2RlKSwgbm9yIHNo
b3VsZCB0aGUgcmVtYWluZGVyIG9mIHRoZSBmdW5jdGlvbiBiZQpza2lwcGVkIChhcyB0aGUgbWFp
biBwYXJ0IG9mIGl0IHdvbid0IGdldCBlbnRlcmVkIGEgMm5kIHRpbWUpIGluIHN1Y2ggYW4KZXZl
bnQuIEl0IGlzIG1lcmVseSBuZWNlc3NhcnkgZm9yIHRoZSBmdW5jdGlvbiB0byBpbmRpY2F0ZSB0
byB0aGUgY2FsbGVyCihpb3Zfc3VwcG9ydHNfeHQoKSkgdGhhdCBzZXR1cCBmYWlsZWQgYXMgZmFy
IGFzIHgyQVBJQyBpcyBjb25jZXJuZWQuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVf
aW5pdC5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKQEAg
LTEzNjQsNiArMTM2NCw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGFtZF9pb21tdV9wcmVwYXJlX29u
ZSgKIGludCBfX2luaXQgYW1kX2lvbW11X3ByZXBhcmUoYm9vbCB4dCkKIHsKICAgICBzdHJ1Y3Qg
YW1kX2lvbW11ICppb21tdTsKKyAgICBib29sIG5vX3h0ID0gZmFsc2U7CiAgICAgaW50IHJjID0g
LUVOT0RFVjsKIAogICAgIEJVR19PTiggIWlvbW11X2ZvdW5kKCkgKTsKQEAgLTE0MDAsOSArMTQw
MSw4IEBAIGludCBfX2luaXQgYW1kX2lvbW11X3ByZXBhcmUoYm9vbCB4dCkKICAgICAgICAgaWYg
KCByYyApCiAgICAgICAgICAgICBnb3RvIGVycm9yX291dDsKIAotICAgICAgICByYyA9IC1FTk9E
RVY7Ci0gICAgICAgIGlmICggeHQgJiYgKCFpb21tdS0+ZmVhdHVyZXMuZmxkcy5nYV9zdXAgfHwg
IWlvbW11LT5mZWF0dXJlcy5mbGRzLnh0X3N1cCkgKQotICAgICAgICAgICAgZ290byBlcnJvcl9v
dXQ7CisgICAgICAgIGlmICggIWlvbW11LT5mZWF0dXJlcy5mbGRzLmdhX3N1cCB8fCAhaW9tbXUt
PmZlYXR1cmVzLmZsZHMueHRfc3VwICkKKyAgICAgICAgICAgIG5vX3h0ID0gdHJ1ZTsKICAgICB9
CiAKICAgICBmb3JfZWFjaF9hbWRfaW9tbXUgKCBpb21tdSApCkBAIC0xNDIyLDcgKzE0MjIsNyBA
QCBpbnQgX19pbml0IGFtZF9pb21tdV9wcmVwYXJlKGJvb2wgeHQpCiAgICAgICAgIGl2aGRfdHlw
ZSA9IDA7CiAgICAgfQogCi0gICAgcmV0dXJuIHJjOworICAgIHJldHVybiByYyA/OiB4dCAmJiBu
b194dCA/IC1FTk9ERVYgOiAwOwogfQogCiBpbnQgX19pbml0IGFtZF9pb21tdV9pbml0KGJvb2wg
eHQpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
