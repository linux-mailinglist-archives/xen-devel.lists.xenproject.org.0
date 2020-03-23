Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C59518F297
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 11:20:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGK9L-0007Vk-IE; Mon, 23 Mar 2020 10:17:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0LFc=5I=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jGK9J-0007VF-Gv
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 10:17:37 +0000
X-Inumbo-ID: 816027e1-6cef-11ea-829d-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 816027e1-6cef-11ea-829d-12813bfff9fa;
 Mon, 23 Mar 2020 10:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584958652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6EHUmISE0rB4Cji1BaxN5Ahahi+xG3W8SbhZePFiOBA=;
 b=fZk3aMQgJsMp8fHHaZcWBD2qVtIlWmZN7K7db5cyH7uFTAlH7dVMEfO3
 3QTCd0fHeXjJIwBRhP37+ZYALnMlv3uB/AvjdQga7v7rnxEYzQFA5V6Q7
 B0QYoIJyndC+E/8+eTQ0BDC0ruPcOdk7bebZm1iD0FNzA8tSjdTzT6U7u U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: erf+zgqO8iNIhBxXT49sTVGEdckxSl7VDMfVDjGRbbWl7caz4FuDWOfTutBt7Z+LSacQSvAesx
 ygUBqTy3gbVLvr5ZfcmMRp7TNvnVuN/ut3V4p82Hu2AmtPyz7OCqBusTlkAJn7XjoytHFZtyAs
 lR1qlO8k72xYwaQrboL7+t2jQxM13uWfUOmLhQqUVuN6GoA74nR9KTkhenpYnAsWTZPr0vswoP
 YwAFfz/jmunmw6LocQlFC+N9J2Of0uNIWmHh6jalAgUP1qA8xwpY076lh4JoxKQK+CwlPzCBoj
 nTY=
X-SBRS: 2.7
X-MesageID: 14866919
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,296,1580792400"; d="scan'208";a="14866919"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 23 Mar 2020 10:17:18 +0000
Message-ID: <20200323101724.15655-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200323101724.15655-1-andrew.cooper3@citrix.com>
References: <20200323101724.15655-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/7] x86/ucode: Document the behaviour of the
 microcode_ops hooks
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uIGFuZCBzdHJ1Y3QgY3B1X3NpZ25hdHVyZSBmb3IgZ29vZCBtZWFzdXJlLgoKTm8gY29tbWVu
dCBpcyBwYXNzZWQgb24gdGhlIHN1aXRhYmlsaXR5IG9mIHRoZSBiZWhhdmlvdXIuLi4KClNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpD
QzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9y
Zz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9h
cmNoL3g4Ni9jcHUvbWljcm9jb2RlL3ByaXZhdGUuaCB8IDQ2ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9taWNyb2NvZGUuaCAgICAgIHwg
IDUgKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUvcHJpdmF0ZS5oIGIveGVuL2FyY2gveDg2L2NwdS9t
aWNyb2NvZGUvcHJpdmF0ZS5oCmluZGV4IGU2NDE2OGE1MDIuLmEyYWVjNTMwNDcgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL3ByaXZhdGUuaAorKysgYi94ZW4vYXJjaC94
ODYvY3B1L21pY3JvY29kZS9wcml2YXRlLmgKQEAgLTE0LDE0ICsxNCw2MCBAQCBlbnVtIG1pY3Jv
Y29kZV9tYXRjaF9yZXN1bHQgewogc3RydWN0IG1pY3JvY29kZV9wYXRjaDsgLyogT3BhcXVlICov
CiAKIHN0cnVjdCBtaWNyb2NvZGVfb3BzIHsKKyAgICAvKgorICAgICAqIFBhcnNlIGEgbWljcm9j
b2RlIGNvbnRhaW5lci4gIEZvcm1hdCBpcyB2ZW5kb3Itc3BlY2lmaWMuCisgICAgICoKKyAgICAg
KiBTZWFyY2ggd2l0aGluIHRoZSBjb250YWluZXIgZm9yIHRoZSBwYXRjaCwgc3VpdGFibGUgZm9y
IHRoZSBjdXJyZW50CisgICAgICogQ1BVLCB3aGljaCBoYXMgdGhlIGhpZ2hlc3QgcmV2aXNpb24u
ICAoTm90ZTogTWF5IGJlIGEgcGF0Y2ggd2hpY2ggaXMKKyAgICAgKiBvbGRlciB0aGF0IHdoYXQg
aXMgcnVubmluZyBpbiB0aGUgQ1BVLiAgVGhpcyBpcyBhIGZlYXR1cmUsIHRvIGJldHRlcgorICAg
ICAqIGNvcGUgd2l0aCBjb3JuZXIgY2FzZXMgZnJvbSBidWdneSBmaXJtd2FyZS4pCisgICAgICoK
KyAgICAgKiBJZiBvbmUgaXMgZm91bmQsIGFsbG9jYXRlIGFuZCByZXR1cm4gYSBzdHJ1Y3QgbWlj
cm9jb2RlX3BhdGNoCisgICAgICogZW5jYXBzdWxhdGluZyB0aGUgYXBwcm9wcmlhdGUgbWljcm9j
b2RlIHBhdGNoLiAgRG9lcyBub3QgYWxpYXMgdGhlCisgICAgICogb3JpZ2luYWwgYnVmZmVyLgor
ICAgICAqCisgICAgICogSWYgb25lIGlzIG5vdCBmb3VuZCwgKG5vdGhpbmcgbWF0Y2hlcyB0aGUg
Y3VycmVudCBDUFUpLCByZXR1cm4gTlVMTC4KKyAgICAgKiBBbHNvIG1heSByZXR1cm4gRVJSX1BU
UigtZXJyKSwgZS5nLiBiYWQgY29udGFpbmVyLCBvdXQgb2YgbWVtb3J5LgorICAgICAqLwogICAg
IHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKigqY3B1X3JlcXVlc3RfbWljcm9jb2RlKShjb25zdCB2
b2lkICpidWYsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHNpemVfdCBzaXplKTsKKworICAgIC8qIE9idGFpbiBtaWNyb2NvZGUtcmVsZXZhbnQg
ZGV0YWlscyBmb3IgdGhlIGN1cnJlbnQgQ1BVLiAqLwogICAgIGludCAoKmNvbGxlY3RfY3B1X2lu
Zm8pKHN0cnVjdCBjcHVfc2lnbmF0dXJlICpjc2lnKTsKKworICAgIC8qCisgICAgICogQXR0ZW1w
dCB0byBsb2FkIHRoZSBwcm92aWRlZCBwYXRjaCBpbnRvIHRoZSBDUFUuICBSZXR1cm5zIC1FSU8g
aWYKKyAgICAgKiBhbnl0aGluZyBkaWRuJ3QgZ28gYXMgZXhwZWN0ZWQuCisgICAgICovCiAgICAg
aW50ICgqYXBwbHlfbWljcm9jb2RlKShjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRj
aCk7CisKKyAgICAvKgorICAgICAqIE9wdGlvbmFsLiAgSWYgcHJvdmlkZWQgYW5kIGFwcGxpY2Fi
bGUgdG8gdGhlIHNwZWNpZmljIHVwZGF0ZSBhdHRlbXB0LAorICAgICAqIGlzIHJ1biBvbmNlIGJ5
IHRoZSBpbml0aWF0aW5nIENQVS4gIFJldHVybmluZyBhbiBlcnJvciB3aWxsIGFib3J0IHRoZQor
ICAgICAqIGxvYWQgYXR0ZW1wdC4KKyAgICAgKi8KICAgICBpbnQgKCpzdGFydF91cGRhdGUpKHZv
aWQpOworCisgICAgLyoKKyAgICAgKiBPcHRpb25hbC4gIElmIHByb3ZpZGVkLCBjYWxsZWQgb24g
ZXZlcnkgQ1BVIHdoaWNoIGNvbXBsZXRlcyBhIG1pY3JvY29kZQorICAgICAqIGxvYWQuICBNYXkg
YmUgY2FsbGVkIGluIHRoZSBjYXNlIG9mIHNvbWUgZXJyb3JzLCBhbmQgbm90IG90aGVycy4gIE1h
eQorICAgICAqIGJlIGNhbGxlZCBldmVuIGlmIHN0YXJ0X3VwZGF0ZSgpIHdhc24ndC4KKyAgICAg
Ki8KICAgICB2b2lkICgqZW5kX3VwZGF0ZV9wZXJjcHUpKHZvaWQpOworCisgICAgLyogRnJlZSBh
IHBhdGNoIHByZXZpb3VzbHkgYWxsb2NhdGVkIGJ5IGNwdV9yZXF1ZXN0X21pY3JvY29kZSgpLiAq
LwogICAgIHZvaWQgKCpmcmVlX3BhdGNoKShzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRjaCk7
CisKKyAgICAvKgorICAgICAqIElzIHRoZSBtaWNyb2NvZGUgcGF0Y2ggYXBwbGljYWJsZSBmb3Ig
dGhlIGN1cnJlbnQgQ1BVLCBhbmQgbmV3ZXIgdGhhbgorICAgICAqIHRoZSBjdXJyZW50bHkgcnVu
bmluZyBwYXRjaD8KKyAgICAgKi8KICAgICBib29sICgqbWF0Y2hfY3B1KShjb25zdCBzdHJ1Y3Qg
bWljcm9jb2RlX3BhdGNoICpwYXRjaCk7CisKKyAgICAvKgorICAgICAqIEdpdmVuIHR3byBwYXRj
aGVzLCBhcmUgdGhleSBib3RoIGFwcGxpY2FibGUgdG8gdGhlIGN1cnJlbnQgQ1BVLCBhbmQgaXMK
KyAgICAgKiBuZXcgYSBoaWdoZXIgcmV2aXNpb24gdGhhbiBvbGQ/CisgICAgICovCiAgICAgZW51
bSBtaWNyb2NvZGVfbWF0Y2hfcmVzdWx0ICgqY29tcGFyZV9wYXRjaCkoCiAgICAgICAgIGNvbnN0
IHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKm5ldywgY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRj
aCAqb2xkKTsKIH07CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L21pY3JvY29kZS5o
IGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9taWNyb2NvZGUuaAppbmRleCA4OWI5YWFhMDJkLi40MWU4
NWEyNGQyIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21pY3JvY29kZS5oCisrKyBi
L3hlbi9pbmNsdWRlL2FzbS14ODYvbWljcm9jb2RlLmgKQEAgLTcsOCArNywxMyBAQAogI2luY2x1
ZGUgPHB1YmxpYy94ZW4uaD4KIAogc3RydWN0IGNwdV9zaWduYXR1cmUgeworICAgIC8qIENQVSBz
aWduYXR1cmUgKENQVUlELjEuRUFYKS4gIE9ubHkgd3JpdHRlbiBvbiBJbnRlbC4gKi8KICAgICB1
bnNpZ25lZCBpbnQgc2lnOworCisgICAgLyogUGxhdGZvcm0gRmxhZ3MgKG9ubHkgYWN0dWFsbHkg
MSBiaXQpLiAgT25seSBhcHBsaWNhYmxlIHRvIEludGVsLiAqLwogICAgIHVuc2lnbmVkIGludCBw
ZjsKKworICAgIC8qIE1pY3JvY29kZSBSZXZpc2lvbi4gKi8KICAgICB1bnNpZ25lZCBpbnQgcmV2
OwogfTsKIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
