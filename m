Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7259F16A055
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 09:48:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j69Lz-0001jW-Uw; Mon, 24 Feb 2020 08:44:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j69Ly-0001jR-Vt
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 08:44:39 +0000
X-Inumbo-ID: e17293a8-56e1-11ea-8ad0-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e17293a8-56e1-11ea-8ad0-12813bfff9fa;
 Mon, 24 Feb 2020 08:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582533874;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bS39wVl3XFNMZ12sjHRKZl3ESjEQTHScX0sJ5tSBhjI=;
 b=fqhOvlhGTCvYi39L43o4CBac3ztULqbmIUQp8NvZs/6lnnwVbAKISfe7
 LfdePYjxUSBPxjxTokunj8qsgipo4qk7DY84U3pHJVPvZVS1VJwF67P+t
 w4axpx8A8EYT3Wa/FSC5syw0sokVhtYfY+AuB5x+xtRnB9k6a3XncU9xv 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7Ir8UrxunJwrmA6olcBUWE49QDgM4HiRW9MZ+2Oaw+05CfKMuuvNPmCoU5O4G/8i5dZgwhH2RY
 H3T63ZemWqBLMeqeRout7/He0+doCjtt9SfQet2dhE88Gn5of5c9H2EHRBYFeGj2XQo5f87Z0K
 /bQWccBFa2S0ZShPNfs1zzhx6uPVQ/Ruppcx/ucrHHThyoLoH8eUHVVHzJrBTHD5op7AxmBEUM
 gSETbpsKem/5sw2giyIOctw27YTEIup3weOSnjOsHn/3gbZQD1Ih8Zi611NX2TkejmhuUOFcrY
 p20=
X-SBRS: 2.7
X-MesageID: 13251359
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,479,1574139600"; d="scan'208";a="13251359"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 24 Feb 2020 09:43:59 +0100
Message-ID: <20200224084400.94482-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224084400.94482-1-roger.pau@citrix.com>
References: <20200224084400.94482-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 1/2] atomic: add atomic_and operations
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VG8geDg2IGFuZCBBcm0uIFRoaXMgcGVyZm9ybXMgYW4gYXRvbWljIEFORCBvcGVyYXRpb24gYWdh
aW5zdCBhbgphdG9taWNfdCB2YXJpYWJsZSB3aXRoIHRoZSBwcm92aWRlZCBtYXNrLgoKUmVxdWVz
dGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClNpZ25lZC1vZmYtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9pbmNsdWRlL2Fz
bS1hcm0vYXJtMzIvYXRvbWljLmggfCAxNyArKysrKysrKysrKysrKysrKwogeGVuL2luY2x1ZGUv
YXNtLWFybS9hcm02NC9hdG9taWMuaCB8IDE0ICsrKysrKysrKysrKysrCiB4ZW4vaW5jbHVkZS9h
c20teDg2L2F0b21pYy5oICAgICAgIHwgIDggKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMzkg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJtMzIvYXRv
bWljLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTMyL2F0b21pYy5oCmluZGV4IGMwM2ViNjg0
Y2QuLjQ2MzczODFiY2MgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJtMzIvYXRv
bWljLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9hcm0zMi9hdG9taWMuaApAQCAtOTYsNiAr
OTYsMjMgQEAgc3RhdGljIGlubGluZSBpbnQgYXRvbWljX3N1Yl9yZXR1cm4oaW50IGksIGF0b21p
Y190ICp2KQogCXJldHVybiByZXN1bHQ7CiB9CiAKK3N0YXRpYyBpbmxpbmUgdm9pZCBhdG9taWNf
YW5kKHVuc2lnbmVkIGludCBtLCBhdG9taWNfdCAqdikKK3sKKwl1bnNpZ25lZCBsb25nIHRtcDsK
KwlpbnQgcmVzdWx0OworCisJcHJlZmV0Y2h3KCZ2LT5jb3VudGVyKTsKKwlfX2FzbV9fIF9fdm9s
YXRpbGVfXygiQCBhdG9taWNfYW5kXG4iCisiMToJbGRyZXgJJTAsIFslM11cbiIKKyIJYW5kCSUw
LCAlMCwgJTRcbiIKKyIJc3RyZXgJJTEsICUwLCBbJTNdXG4iCisiCXRlcQklMSwgIzBcbiIKKyIJ
Ym5lCTFiIgorCTogIj0mciIgKHJlc3VsdCksICI9JnIiICh0bXApLCAiK1FvIiAodi0+Y291bnRl
cikKKwk6ICJyIiAoJnYtPmNvdW50ZXIpLCAiSXIiIChtKQorCTogImNjIik7Cit9CisKIHN0YXRp
YyBpbmxpbmUgaW50IGF0b21pY19jbXB4Y2hnKGF0b21pY190ICpwdHIsIGludCBvbGQsIGludCBu
ZXcpCiB7CiAJaW50IG9sZHZhbDsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJt
NjQvYXRvbWljLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0L2F0b21pYy5oCmluZGV4IGJj
ZTM4ZDRjYTIuLjJmOTA2ZjAyNjUgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJt
NjQvYXRvbWljLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9hcm02NC9hdG9taWMuaApAQCAt
OTEsNiArOTEsMjAgQEAgc3RhdGljIGlubGluZSBpbnQgYXRvbWljX3N1Yl9yZXR1cm4oaW50IGks
IGF0b21pY190ICp2KQogCXJldHVybiByZXN1bHQ7CiB9CiAKK3N0YXRpYyBpbmxpbmUgdm9pZCBh
dG9taWNfYW5kKHVuc2lnbmVkIGludCBtLCBhdG9taWNfdCAqdikKK3sKKwl1bnNpZ25lZCBsb25n
IHRtcDsKKwlpbnQgcmVzdWx0OworCisJYXNtIHZvbGF0aWxlKCIvLyBhdG9taWNfYW5kXG4iCisi
MToJbGR4cgkldzAsICUyXG4iCisiCWFuZAkldzAsICV3MCwgJXczXG4iCisiCXN0eHIJJXcxLCAl
dzAsICUyXG4iCisiCWNibnoJJXcxLCAxYiIKKwk6ICI9JnIiIChyZXN1bHQpLCAiPSZyIiAodG1w
KSwgIitRIiAodi0+Y291bnRlcikKKwk6ICJJciIgKG0pKTsKK30KKwogc3RhdGljIGlubGluZSBp
bnQgYXRvbWljX2NtcHhjaGcoYXRvbWljX3QgKnB0ciwgaW50IG9sZCwgaW50IG5ldykKIHsKIAl1
bnNpZ25lZCBsb25nIHRtcDsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvYXRvbWlj
LmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2F0b21pYy5oCmluZGV4IDY4MmJjZjkxYjEuLjIxNzk0
YmZlN2IgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvYXRvbWljLmgKKysrIGIveGVu
L2luY2x1ZGUvYXNtLXg4Ni9hdG9taWMuaApAQCAtMjI0LDYgKzIyNCwxNCBAQCBzdGF0aWMgaW5s
aW5lIGludCBhdG9taWNfYWRkX3VubGVzcyhhdG9taWNfdCAqdiwgaW50IGEsIGludCB1KQogICAg
IHJldHVybiBjOwogfQogCitzdGF0aWMgaW5saW5lIHZvaWQgYXRvbWljX2FuZCh1bnNpZ25lZCBp
bnQgbSwgYXRvbWljX3QgKnYpCit7CisgICAgYXNtIHZvbGF0aWxlICgKKyAgICAgICAgImxvY2s7
IGFuZGwgJTEsJTAiCisgICAgICAgIDogIj1tIiAoKih2b2xhdGlsZSBpbnQgKikmdi0+Y291bnRl
cikKKyAgICAgICAgOiAiaXIiIChtKSwgIm0iICgqKHZvbGF0aWxlIGludCAqKSZ2LT5jb3VudGVy
KSApOworfQorCiAjZGVmaW5lIGF0b21pY194Y2hnKHYsIG5ldykgKHhjaGcoJigodiktPmNvdW50
ZXIpLCBuZXcpKQogCiAjZW5kaWYgLyogX19BUkNIX1g4Nl9BVE9NSUNfXyAqLwotLSAKMi4yNS4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
