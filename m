Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB501173864
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 14:31:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7fgg-0006Q6-8n; Fri, 28 Feb 2020 13:28:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ncfg=4Q=amazon.co.uk=prvs=320a9563e=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j7fge-0006Pu-SI
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 13:28:16 +0000
X-Inumbo-ID: 2be6c91e-5a2e-11ea-993b-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2be6c91e-5a2e-11ea-993b-12813bfff9fa;
 Fri, 28 Feb 2020 13:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1582896495; x=1614432495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CRxmGjVAt9sHh2hAJkmrZyAPX/LtvzvpSoGA012X7iQ=;
 b=iKDrsps5yU/6/7UlQ1XBkQ1GBDLHNgLXnyJuEItLb2HvN42uJtzztJ7S
 eSvRegzp8YZdII3Fno2GGMgjnUZBuAZT8L+lxrVOaK9Ob1vcX6p0g+Zmk
 pdckhn9PyXr7yjUK9j+sPXkV1QMooO37Iyzd9VrnXINbn1xsprNtP9xIP A=;
IronPort-SDR: 6dbgpjqf9BF4fzBWxqUneo2EJTUqCh/jvHkLreXhvb1KtnEjjNeFsmPpTSg1xQKj8pj5HY9fJa
 Ps3h/KqC7hgg==
X-IronPort-AV: E=Sophos;i="5.70,496,1574121600"; d="scan'208";a="28113496"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-55156cd4.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 28 Feb 2020 13:28:12 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-55156cd4.us-west-2.amazon.com (Postfix) with ESMTPS
 id 5CED9A2D30; Fri, 28 Feb 2020 13:28:11 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 28 Feb 2020 13:28:10 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 28 Feb 2020 13:28:08 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 28 Feb 2020 13:28:00 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 28 Feb 2020 13:27:44 +0000
Message-ID: <20200228132749.2929-2-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228132749.2929-1-pdurrant@amazon.com>
References: <20200228132749.2929-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 1/6] domain: introduce alloc/free_shared_info()
 helpers...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uIGFuZCBzYXZlIHRoZSBNRk4uCgpUaGlzIHBhdGNoIG1vZGlmaWVzIHRoZSAnc2hhcmVkX2lu
Zm8nIGZpZWxkIG9mIHN0cnVjdCBkb21haW4gdG8gYmUKYSBzdHJ1Y3R1cmUgY29tcHJpc2luZyBh
biBNRk4gYW5kIGEgdmlydHVhbCBhZGRyZXNzLiBBbGxvY2F0aW9ucyBhcmUKc3RpbGwgZG9uZSBm
cm9tIHhlbmhlYXAsIHNvIHRoZSB2aXJ0dWFsIGFkZHJlc3Mgc3RpbGwgZXF1YXRlcyB0bwp2aXJ0
X3RvX21mbigpIGNhbGxlZCBvbiB0aGUgTUZOIGJ1dCBzdWJzZXF1ZW50IHBhdGNoIHdpbGwgY2hh
bmdlIHRoaXMuCkhlbmNlIHRoZSBuZWVkIHRvIHNhdmUgdGhlIE1GTi4KCk5PVEU6IFdoaXN0IGRl
ZmluaW5nIHRoZSBuZXcgaGVscGVycywgdmlydF90b19tZm4oKSBpbiBjb21tb24vZG9tYWluLmMK
ICAgICAgaXMgbWFkZSB0eXBlIHNhZmUuCiAgICAgIFRoZSBkZWZpbml0aW9uIG9mIG5taV9yZWFz
b24oKSBpbiBhc20teDg2L3NoYXJlZC5oIGlzIGFsc28gcmUtCiAgICAgIGZsb3dlZCB0byBhdm9p
ZCBvdmVybHkgbG9uZyBsaW5lcy4KClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJh
bnRAYW1hem9uLmNvbT4KUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+
Ci0tLQpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzog
Vm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPgpDYzogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEdlb3JnZSBEdW5sYXAgPGdl
b3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5j
aXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogS29ucmFk
IFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDYzogV2VpIExpdSA8d2xA
eGVuLm9yZz4KQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0t
LQogeGVuL2FyY2gvYXJtL2RvbWFpbi5jICAgICAgICB8ICA4ICsrLS0tLS0tCiB4ZW4vYXJjaC9h
cm0vbW0uYyAgICAgICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICAg
fCAxMSArKysrLS0tLS0tLQogeGVuL2FyY2gveDg2L21tLmMgICAgICAgICAgICB8ICAyICstCiB4
ZW4vYXJjaC94ODYvcHYvZG9tMF9idWlsZC5jIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9wdi9zaGlt
LmMgICAgICAgfCAgMiArLQogeGVuL2NvbW1vbi9kb21haW4uYyAgICAgICAgICB8IDI2ICsrKysr
KysrKysrKysrKysrKysrKysrKysrCiB4ZW4vY29tbW9uL2RvbWN0bC5jICAgICAgICAgIHwgIDIg
Ky0KIHhlbi9jb21tb24vdGltZS5jICAgICAgICAgICAgfCAgNCArKy0tCiB4ZW4vaW5jbHVkZS9h
c20teDg2L3NoYXJlZC5oIHwgMTUgKysrKysrKystLS0tLS0tCiB4ZW4vaW5jbHVkZS94ZW4vZG9t
YWluLmggICAgIHwgIDMgKysrCiB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCAgICAgIHwgIDUgKysr
Ky0KIHhlbi9pbmNsdWRlL3hlbi9zaGFyZWQuaCAgICAgfCAgMiArLQogMTMgZmlsZXMgY2hhbmdl
ZCwgNTUgaW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL2RvbWFpbi5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jCmluZGV4IGFhM2RmM2IzYmEu
LjJjYmNkYWFjMDggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9kb21haW4uYworKysgYi94ZW4v
YXJjaC9hcm0vZG9tYWluLmMKQEAgLTY5MCwxMyArNjkwLDkgQEAgaW50IGFyY2hfZG9tYWluX2Ny
ZWF0ZShzdHJ1Y3QgZG9tYWluICpkLAogICAgIGlmICggKHJjID0gcDJtX2luaXQoZCkpICE9IDAg
KQogICAgICAgICBnb3RvIGZhaWw7CiAKLSAgICByYyA9IC1FTk9NRU07Ci0gICAgaWYgKCAoZC0+
c2hhcmVkX2luZm8gPSBhbGxvY194ZW5oZWFwX3BhZ2VzKDAsIDApKSA9PSBOVUxMICkKKyAgICBp
ZiAoIChyYyA9IGFsbG9jX3NoYXJlZF9pbmZvKGQsIDApKSAhPSAwICkKICAgICAgICAgZ290byBm
YWlsOwogCi0gICAgY2xlYXJfcGFnZShkLT5zaGFyZWRfaW5mbyk7Ci0gICAgc2hhcmVfeGVuX3Bh
Z2Vfd2l0aF9ndWVzdCh2aXJ0X3RvX3BhZ2UoZC0+c2hhcmVkX2luZm8pLCBkLCBTSEFSRV9ydyk7
Ci0KICAgICBzd2l0Y2ggKCBjb25maWctPmFyY2guZ2ljX3ZlcnNpb24gKQogICAgIHsKICAgICBj
YXNlIFhFTl9ET01DVExfQ09ORklHX0dJQ19WMjoKQEAgLTc2Nyw3ICs3NjMsNyBAQCB2b2lkIGFy
Y2hfZG9tYWluX2Rlc3Ryb3koc3RydWN0IGRvbWFpbiAqZCkKICAgICBwMm1fdGVhcmRvd24oZCk7
CiAgICAgZG9tYWluX3ZnaWNfZnJlZShkKTsKICAgICBkb21haW5fdnVhcnRfZnJlZShkKTsKLSAg
ICBmcmVlX3hlbmhlYXBfcGFnZShkLT5zaGFyZWRfaW5mbyk7CisgICAgZnJlZV9zaGFyZWRfaW5m
byhkKTsKICNpZmRlZiBDT05GSUdfQUNQSQogICAgIGZyZWVfeGVuaGVhcF9wYWdlcyhkLT5hcmNo
LmVmaV9hY3BpX3RhYmxlLAogICAgICAgICAgICAgICAgICAgICAgICBnZXRfb3JkZXJfZnJvbV9i
eXRlcyhkLT5hcmNoLmVmaV9hY3BpX2xlbikpOwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21t
LmMgYi94ZW4vYXJjaC9hcm0vbW0uYwppbmRleCA3MjcxMDdlZWZhLi4yYmI1OTIxMDFkIDEwMDY0
NAotLS0gYS94ZW4vYXJjaC9hcm0vbW0uYworKysgYi94ZW4vYXJjaC9hcm0vbW0uYwpAQCAtMTQy
NCw3ICsxNDI0LDcgQEAgaW50IHhlbm1lbV9hZGRfdG9fcGh5c21hcF9vbmUoCiAgICAgICAgIGlm
ICggaWR4ICE9IDAgKQogICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CiAKLSAgICAgICAgbWZu
ID0gdmlydF90b19tZm4oZC0+c2hhcmVkX2luZm8pOworICAgICAgICBtZm4gPSBkLT5zaGFyZWRf
aW5mby5tZm47CiAgICAgICAgIHQgPSBwMm1fcmFtX3J3OwogCiAgICAgICAgIGJyZWFrOwpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbWFpbi5jIGIveGVuL2FyY2gveDg2L2RvbWFpbi5jCmlu
ZGV4IGZlNjNjMjM2NzYuLmViN2IwZmM1MWMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9kb21h
aW4uYworKysgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKQEAgLTYxMiwxMiArNjEyLDkgQEAgaW50
IGFyY2hfZG9tYWluX2NyZWF0ZShzdHJ1Y3QgZG9tYWluICpkLAogICAgICAqIFRoZSBzaGFyZWRf
aW5mbyBtYWNoaW5lIGFkZHJlc3MgbXVzdCBmaXQgaW4gYSAzMi1iaXQgZmllbGQgd2l0aGluIGEK
ICAgICAgKiAzMi1iaXQgZ3Vlc3QncyBzdGFydF9pbmZvIHN0cnVjdHVyZS4gSGVuY2Ugd2Ugc3Bl
Y2lmeSBNRU1GX2JpdHMoMzIpLgogICAgICAqLwotICAgIGlmICggKGQtPnNoYXJlZF9pbmZvID0g
YWxsb2NfeGVuaGVhcF9wYWdlcygwLCBNRU1GX2JpdHMoMzIpKSkgPT0gTlVMTCApCisgICAgaWYg
KCAocmMgPSBhbGxvY19zaGFyZWRfaW5mbyhkLCBNRU1GX2JpdHMoMzIpKSkgIT0gMCApCiAgICAg
ICAgIGdvdG8gZmFpbDsKIAotICAgIGNsZWFyX3BhZ2UoZC0+c2hhcmVkX2luZm8pOwotICAgIHNo
YXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3QodmlydF90b19wYWdlKGQtPnNoYXJlZF9pbmZvKSwgZCwg
U0hBUkVfcncpOwotCiAgICAgaWYgKCAocmMgPSBpbml0X2RvbWFpbl9pcnFfbWFwcGluZyhkKSkg
IT0gMCApCiAgICAgICAgIGdvdG8gZmFpbDsKIApAQCAtNjY1LDcgKzY2Miw3IEBAIGludCBhcmNo
X2RvbWFpbl9jcmVhdGUoc3RydWN0IGRvbWFpbiAqZCwKICAgICBwc3JfZG9tYWluX2ZyZWUoZCk7
CiAgICAgaW9tbXVfZG9tYWluX2Rlc3Ryb3koZCk7CiAgICAgY2xlYW51cF9kb21haW5faXJxX21h
cHBpbmcoZCk7Ci0gICAgZnJlZV94ZW5oZWFwX3BhZ2UoZC0+c2hhcmVkX2luZm8pOworICAgIGZy
ZWVfc2hhcmVkX2luZm8oZCk7CiAgICAgeGZyZWUoZC0+YXJjaC5jcHVpZCk7CiAgICAgeGZyZWUo
ZC0+YXJjaC5tc3IpOwogICAgIGlmICggcGFnaW5nX2luaXRpYWxpc2VkICkKQEAgLTY5NCw3ICs2
OTEsNyBAQCB2b2lkIGFyY2hfZG9tYWluX2Rlc3Ryb3koc3RydWN0IGRvbWFpbiAqZCkKICAgICAg
ICAgcHZfZG9tYWluX2Rlc3Ryb3koZCk7CiAgICAgZnJlZV9wZXJkb21haW5fbWFwcGluZ3MoZCk7
CiAKLSAgICBmcmVlX3hlbmhlYXBfcGFnZShkLT5zaGFyZWRfaW5mbyk7CisgICAgZnJlZV9zaGFy
ZWRfaW5mbyhkKTsKICAgICBjbGVhbnVwX2RvbWFpbl9pcnFfbWFwcGluZyhkKTsKIAogICAgIHBz
cl9kb21haW5fZnJlZShkKTsKQEAgLTcyMCw3ICs3MTcsNyBAQCB2b2lkIGFyY2hfZG9tYWluX3Vu
cGF1c2Uoc3RydWN0IGRvbWFpbiAqZCkKIAogaW50IGFyY2hfZG9tYWluX3NvZnRfcmVzZXQoc3Ry
dWN0IGRvbWFpbiAqZCkKIHsKLSAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlID0gdmlydF90b19w
YWdlKGQtPnNoYXJlZF9pbmZvKSwgKm5ld19wYWdlOworICAgIHN0cnVjdCBwYWdlX2luZm8gKnBh
Z2UgPSBtZm5fdG9fcGFnZShkLT5zaGFyZWRfaW5mby5tZm4pLCAqbmV3X3BhZ2U7CiAgICAgaW50
IHJldCA9IDA7CiAgICAgc3RydWN0IGRvbWFpbiAqb3duZXI7CiAgICAgbWZuX3QgbWZuOwpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L21tLmMgYi94ZW4vYXJjaC94ODYvbW0uYwppbmRleCA3MGI4
N2M0ODMwLi41MDY3MTI1Y2JiIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0uYworKysgYi94
ZW4vYXJjaC94ODYvbW0uYwpAQCAtNDUzOCw3ICs0NTM4LDcgQEAgaW50IHhlbm1lbV9hZGRfdG9f
cGh5c21hcF9vbmUoCiAgICAgewogICAgICAgICBjYXNlIFhFTk1BUFNQQUNFX3NoYXJlZF9pbmZv
OgogICAgICAgICAgICAgaWYgKCBpZHggPT0gMCApCi0gICAgICAgICAgICAgICAgbWZuID0gdmly
dF90b19tZm4oZC0+c2hhcmVkX2luZm8pOworICAgICAgICAgICAgICAgIG1mbiA9IGQtPnNoYXJl
ZF9pbmZvLm1mbjsKICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICBjYXNlIFhFTk1BUFNQQUNF
X2dyYW50X3RhYmxlOgogICAgICAgICAgICAgcmMgPSBnbnR0YWJfbWFwX2ZyYW1lKGQsIGlkeCwg
Z3BmbiwgJm1mbik7CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvcHYvZG9tMF9idWlsZC5jIGIv
eGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYwppbmRleCA1Njc4ZGE3ODJkLi5kYzE2ZWYyZTc5
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvcHYvZG9tMF9idWlsZC5jCisrKyBiL3hlbi9hcmNo
L3g4Ni9wdi9kb20wX2J1aWxkLmMKQEAgLTc0Myw3ICs3NDMsNyBAQCBpbnQgX19pbml0IGRvbTBf
Y29uc3RydWN0X3B2KHN0cnVjdCBkb21haW4gKmQsCiAgICAgY2xlYXJfcGFnZShzaSk7CiAgICAg
c2ktPm5yX3BhZ2VzID0gbnJfcGFnZXM7CiAKLSAgICBzaS0+c2hhcmVkX2luZm8gPSB2aXJ0X3Rv
X21hZGRyKGQtPnNoYXJlZF9pbmZvKTsKKyAgICBzaS0+c2hhcmVkX2luZm8gPSBtZm5fdG9fbWFk
ZHIoZC0+c2hhcmVkX2luZm8ubWZuKTsKIAogICAgIGlmICggIXB2X3NoaW0gKQogICAgICAgICBz
aS0+ZmxhZ3MgICAgPSBTSUZfUFJJVklMRUdFRCB8IFNJRl9JTklURE9NQUlOOwpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L3B2L3NoaW0uYyBiL3hlbi9hcmNoL3g4Ni9wdi9zaGltLmMKaW5kZXgg
ZDg2ZTJkZTExOC4uZjUxMjgwOWRhZCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3B2L3NoaW0u
YworKysgYi94ZW4vYXJjaC94ODYvcHYvc2hpbS5jCkBAIC0yODIsNyArMjgyLDcgQEAgc3RhdGlj
IHZvaWQgd3JpdGVfc3RhcnRfaW5mbyhzdHJ1Y3QgZG9tYWluICpkKQogICAgIHNucHJpbnRmKHNp
LT5tYWdpYywgc2l6ZW9mKHNpLT5tYWdpYyksICJ4ZW4tMy4wLXg4Nl8lcyIsCiAgICAgICAgICAg
ICAgaXNfcHZfMzJiaXRfZG9tYWluKGQpID8gIjMycCIgOiAiNjQiKTsKICAgICBzaS0+bnJfcGFn
ZXMgPSBkb21haW5fdG90X3BhZ2VzKGQpOwotICAgIHNpLT5zaGFyZWRfaW5mbyA9IHZpcnRfdG9f
bWFkZHIoZC0+c2hhcmVkX2luZm8pOworICAgIHNpLT5zaGFyZWRfaW5mbyA9IG1mbl90b19tYWRk
cihkLT5zaGFyZWRfaW5mby5tZm4pOwogICAgIHNpLT5mbGFncyA9IDA7CiAgICAgQlVHX09OKHhl
bl9oeXBlcmNhbGxfaHZtX2dldF9wYXJhbShIVk1fUEFSQU1fU1RPUkVfUEZOLCAmc2ktPnN0b3Jl
X21mbikpOwogICAgIEJVR19PTih4ZW5faHlwZXJjYWxsX2h2bV9nZXRfcGFyYW0oSFZNX1BBUkFN
X1NUT1JFX0VWVENITiwgJnBhcmFtKSk7CmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RvbWFpbi5j
IGIveGVuL2NvbW1vbi9kb21haW4uYwppbmRleCA2YWQ0NThmYTZiLi5iYTdhOTA1MjU4IDEwMDY0
NAotLS0gYS94ZW4vY29tbW9uL2RvbWFpbi5jCisrKyBiL3hlbi9jb21tb24vZG9tYWluLmMKQEAg
LTQ3LDYgKzQ3LDEwIEBACiAjaW5jbHVkZSA8YXNtL2d1ZXN0Lmg+CiAjZW5kaWYKIAorLyogT3Zl
cnJpZGUgbWFjcm9zIGZyb20gYXNtL3BhZ2UuaCB0byBtYWtlIHRoZW0gd29yayB3aXRoIG1mbl90
ICovCisjdW5kZWYgdmlydF90b19tZm4KKyNkZWZpbmUgdmlydF90b19tZm4odikgX21mbihfX3Zp
cnRfdG9fbWZuKHYpKQorCiAvKiBMaW51eCBjb25maWcgb3B0aW9uOiBwcm9wYWdldGVkIHRvIGRv
bWFpbjAgKi8KIC8qIHhlbl9wcm9jZXNzb3JfcG1iaXRzOiB4ZW4gY29udHJvbCBDeCwgUHgsIC4u
LiAqLwogdW5zaWduZWQgaW50IHhlbl9wcm9jZXNzb3JfcG1iaXRzID0gWEVOX1BST0NFU1NPUl9Q
TV9QWDsKQEAgLTE2NDQsNiArMTY0OCwyOCBAQCBpbnQgY29udGludWVfaHlwZXJjYWxsX29uX2Nw
dSgKICAgICByZXR1cm4gMDsKIH0KIAoraW50IGFsbG9jX3NoYXJlZF9pbmZvKHN0cnVjdCBkb21h
aW4gKmQsIHVuc2lnbmVkIGludCBtZW1mbGFncykKK3sKKyAgICBpZiAoIChkLT5zaGFyZWRfaW5m
by52aXJ0ID0gYWxsb2NfeGVuaGVhcF9wYWdlcygwLCBtZW1mbGFncykpID09IE5VTEwgKQorICAg
ICAgICByZXR1cm4gLUVOT01FTTsKKworICAgIGQtPnNoYXJlZF9pbmZvLm1mbiA9IHZpcnRfdG9f
bWZuKGQtPnNoYXJlZF9pbmZvLnZpcnQpOworCisgICAgY2xlYXJfcGFnZShkLT5zaGFyZWRfaW5m
by52aXJ0KTsKKyAgICBzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0KG1mbl90b19wYWdlKGQtPnNo
YXJlZF9pbmZvLm1mbiksIGQsIFNIQVJFX3J3KTsKKworICAgIHJldHVybiAwOworfQorCit2b2lk
IGZyZWVfc2hhcmVkX2luZm8oc3RydWN0IGRvbWFpbiAqZCkKK3sKKyAgICBpZiAoICFkLT5zaGFy
ZWRfaW5mby52aXJ0ICkKKyAgICAgICAgcmV0dXJuOworCisgICAgZnJlZV94ZW5oZWFwX3BhZ2Uo
ZC0+c2hhcmVkX2luZm8udmlydCk7CisgICAgZC0+c2hhcmVkX2luZm8udmlydCA9IE5VTEw7Cit9
CisKIC8qCiAgKiBMb2NhbCB2YXJpYWJsZXM6CiAgKiBtb2RlOiBDCmRpZmYgLS1naXQgYS94ZW4v
Y29tbW9uL2RvbWN0bC5jIGIveGVuL2NvbW1vbi9kb21jdGwuYwppbmRleCBhNjliM2I1OWE4Li44
MWYxOGU2M2E3IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2RvbWN0bC5jCisrKyBiL3hlbi9jb21t
b24vZG9tY3RsLmMKQEAgLTE5Niw3ICsxOTYsNyBAQCB2b2lkIGdldGRvbWFpbmluZm8oc3RydWN0
IGRvbWFpbiAqZCwgc3RydWN0IHhlbl9kb21jdGxfZ2V0ZG9tYWluaW5mbyAqaW5mbykKICAgICBp
bmZvLT5vdXRzdGFuZGluZ19wYWdlcyA9IGQtPm91dHN0YW5kaW5nX3BhZ2VzOwogICAgIGluZm8t
PnNocl9wYWdlcyAgICAgICAgID0gYXRvbWljX3JlYWQoJmQtPnNocl9wYWdlcyk7CiAgICAgaW5m
by0+cGFnZWRfcGFnZXMgICAgICAgPSBhdG9taWNfcmVhZCgmZC0+cGFnZWRfcGFnZXMpOwotICAg
IGluZm8tPnNoYXJlZF9pbmZvX2ZyYW1lID0gbWZuX3RvX2dtZm4oZCwgdmlydF90b19tZm4oZC0+
c2hhcmVkX2luZm8pKTsKKyAgICBpbmZvLT5zaGFyZWRfaW5mb19mcmFtZSA9IG1mbl90b19nbWZu
KGQsIG1mbl94KGQtPnNoYXJlZF9pbmZvLm1mbikpOwogICAgIEJVR19PTihTSEFSRURfTTJQKGlu
Zm8tPnNoYXJlZF9pbmZvX2ZyYW1lKSk7CiAKICAgICBpbmZvLT5jcHVwb29sID0gY3B1cG9vbF9n
ZXRfaWQoZCk7CmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3RpbWUuYyBiL3hlbi9jb21tb24vdGlt
ZS5jCmluZGV4IDgyMzM2ZTJkNWEuLjU4ZmE5YWJjNDAgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24v
dGltZS5jCisrKyBiL3hlbi9jb21tb24vdGltZS5jCkBAIC0xMTAsOSArMTEwLDkgQEAgdm9pZCB1
cGRhdGVfZG9tYWluX3dhbGxjbG9ja190aW1lKHN0cnVjdCBkb21haW4gKmQpCiAgICAgc2hhcmVk
X2luZm8oZCwgd2NfbnNlYykgICA9IHdjX25zZWM7CiAjaWZkZWYgQ09ORklHX1g4NgogICAgIGlm
ICggbGlrZWx5KCFoYXNfMzJiaXRfc2hpbmZvKGQpKSApCi0gICAgICAgIGQtPnNoYXJlZF9pbmZv
LT5uYXRpdmUud2Nfc2VjX2hpID0gc2VjID4+IDMyOworICAgICAgICBkLT5zaGFyZWRfaW5mby52
aXJ0LT5uYXRpdmUud2Nfc2VjX2hpID0gc2VjID4+IDMyOwogICAgIGVsc2UKLSAgICAgICAgZC0+
c2hhcmVkX2luZm8tPmNvbXBhdC5hcmNoLndjX3NlY19oaSA9IHNlYyA+PiAzMjsKKyAgICAgICAg
ZC0+c2hhcmVkX2luZm8udmlydC0+Y29tcGF0LmFyY2gud2Nfc2VjX2hpID0gc2VjID4+IDMyOwog
I2Vsc2UKICAgICBzaGFyZWRfaW5mbyhkLCB3Y19zZWNfaGkpID0gc2VjID4+IDMyOwogI2VuZGlm
CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L3NoYXJlZC5oIGIveGVuL2luY2x1ZGUv
YXNtLXg4Ni9zaGFyZWQuaAppbmRleCBhZjVkOTU5ZDA0Li5kNDU4OGUwOGE2IDEwMDY0NAotLS0g
YS94ZW4vaW5jbHVkZS9hc20teDg2L3NoYXJlZC5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYv
c2hhcmVkLmgKQEAgLTEsMjQgKzEsMjUgQEAKICNpZm5kZWYgX19YRU5fWDg2X1NIQVJFRF9IX18K
ICNkZWZpbmUgX19YRU5fWDg2X1NIQVJFRF9IX18KIAotI2RlZmluZSBubWlfcmVhc29uKGQpICgh
aGFzXzMyYml0X3NoaW5mbyhkKSA/ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCi0gICAg
ICAgICAgICAgICAgICAgICAgICh1MzIgKikmKGQpLT5zaGFyZWRfaW5mby0+bmF0aXZlLmFyY2gu
bm1pX3JlYXNvbiA6IFwKLSAgICAgICAgICAgICAgICAgICAgICAgKHUzMiAqKSYoZCktPnNoYXJl
ZF9pbmZvLT5jb21wYXQuYXJjaC5ubWlfcmVhc29uKQorI2RlZmluZSBubWlfcmVhc29uKGQpICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICAoIWhhc18zMmJp
dF9zaGluZm8oZCkgPyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgICAg
ICh1MzIgKikmKGQpLT5zaGFyZWRfaW5mby52aXJ0LT5uYXRpdmUuYXJjaC5ubWlfcmVhc29uIDog
ICAgXAorICAgICAodTMyICopJihkKS0+c2hhcmVkX2luZm8udmlydC0+Y29tcGF0LmFyY2gubm1p
X3JlYXNvbikKIAogI2RlZmluZSBHRVRfU0VUX1NIQVJFRCh0eXBlLCBmaWVsZCkgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKIHN0YXRpYyBpbmxpbmUgdHlwZSBhcmNoX2dldF8jI2ZpZWxk
KGNvbnN0IHN0cnVjdCBkb21haW4gKmQpICAgICBcCiB7ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgIHJldHVybiAhaGFz
XzMyYml0X3NoaW5mbyhkKSA/ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKLSAgICAg
ICAgICAgZC0+c2hhcmVkX2luZm8tPm5hdGl2ZS5hcmNoLmZpZWxkIDogICAgICAgICAgICAgICAg
ICBcCi0gICAgICAgICAgIGQtPnNoYXJlZF9pbmZvLT5jb21wYXQuYXJjaC5maWVsZDsgICAgICAg
ICAgICAgICAgICAgXAorICAgICAgICAgICBkLT5zaGFyZWRfaW5mby52aXJ0LT5uYXRpdmUuYXJj
aC5maWVsZCA6ICAgICAgICAgICAgIFwKKyAgICAgICAgICAgZC0+c2hhcmVkX2luZm8udmlydC0+
Y29tcGF0LmFyY2guZmllbGQ7ICAgICAgICAgICAgICBcCiB9ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogc3RhdGljIGlubGlu
ZSB2b2lkIGFyY2hfc2V0XyMjZmllbGQoc3RydWN0IGRvbWFpbiAqZCwgICAgICAgICAgIFwKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHR5cGUgdmFsKSAgICAgICAgICAgICAg
ICAgICBcCiB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAogICAgIGlmICggIWhhc18zMmJpdF9zaGluZm8oZCkgKSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKLSAgICAgICAgZC0+c2hhcmVkX2luZm8tPm5hdGl2
ZS5hcmNoLmZpZWxkID0gdmFsOyAgICAgICAgICAgICAgICBcCisgICAgICAgIGQtPnNoYXJlZF9p
bmZvLnZpcnQtPm5hdGl2ZS5hcmNoLmZpZWxkID0gdmFsOyAgICAgICAgICAgXAogICAgIGVsc2Ug
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
LSAgICAgICAgZC0+c2hhcmVkX2luZm8tPmNvbXBhdC5hcmNoLmZpZWxkID0gdmFsOyAgICAgICAg
ICAgICAgICBcCisgICAgICAgIGQtPnNoYXJlZF9pbmZvLnZpcnQtPmNvbXBhdC5hcmNoLmZpZWxk
ID0gdmFsOyAgICAgICAgICAgXAogfQogCiAjZGVmaW5lIEdFVF9TRVRfVkNQVSh0eXBlLCBmaWVs
ZCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXApkaWZmIC0tZ2l0IGEveGVuL2luY2x1
ZGUveGVuL2RvbWFpbi5oIGIveGVuL2luY2x1ZGUveGVuL2RvbWFpbi5oCmluZGV4IDdlNTFkMzYx
ZGUuLjc0MGUyMDMyYWQgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9kb21haW4uaAorKysg
Yi94ZW4vaW5jbHVkZS94ZW4vZG9tYWluLmgKQEAgLTEzMCw0ICsxMzAsNyBAQCBzdHJ1Y3Qgdm51
bWFfaW5mbyB7CiAKIHZvaWQgdm51bWFfZGVzdHJveShzdHJ1Y3Qgdm51bWFfaW5mbyAqdm51bWEp
OwogCitpbnQgYWxsb2Nfc2hhcmVkX2luZm8oc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50
IG1lbWZsYWdzKTsKK3ZvaWQgZnJlZV9zaGFyZWRfaW5mbyhzdHJ1Y3QgZG9tYWluICpkKTsKKwog
I2VuZGlmIC8qIF9fWEVOX0RPTUFJTl9IX18gKi8KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hl
bi9zY2hlZC5oIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKaW5kZXggM2E0ZjQzMDk4Yy4uZjQx
ZDBhZDJhMCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKKysrIGIveGVuL2lu
Y2x1ZGUveGVuL3NjaGVkLmgKQEAgLTM0Niw3ICszNDYsMTAgQEAgc3RydWN0IGRvbWFpbgogICAg
IHVuc2lnbmVkIGludCAgICAgbWF4X3ZjcHVzOwogICAgIHN0cnVjdCB2Y3B1ICAgICoqdmNwdTsK
IAotICAgIHNoYXJlZF9pbmZvX3QgICAqc2hhcmVkX2luZm87ICAgICAvKiBzaGFyZWQgZGF0YSBh
cmVhICovCisgICAgc3RydWN0IHsKKyAgICAgICAgbWZuX3QgbWZuOworICAgICAgICBzaGFyZWRf
aW5mb190ICp2aXJ0OworICAgIH0gc2hhcmVkX2luZm87IC8qIHNoYXJlZCBkYXRhIGFyZWEgKi8K
IAogICAgIHNwaW5sb2NrX3QgICAgICAgZG9tYWluX2xvY2s7CiAKZGlmZiAtLWdpdCBhL3hlbi9p
bmNsdWRlL3hlbi9zaGFyZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9zaGFyZWQuaAppbmRleCBhNDEx
YThhM2UzLi41N2IyZmYxZTM0IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2hhcmVkLmgK
KysrIGIveGVuL2luY2x1ZGUveGVuL3NoYXJlZC5oCkBAIC00Myw3ICs0Myw3IEBAIHR5cGVkZWYg
c3RydWN0IHZjcHVfaW5mbyB2Y3B1X2luZm9fdDsKIAogZXh0ZXJuIHZjcHVfaW5mb190IGR1bW15
X3ZjcHVfaW5mbzsKIAotI2RlZmluZSBzaGFyZWRfaW5mbyhkLCBmaWVsZCkgICAgICBfX3NoYXJl
ZF9pbmZvKGQsIChkKS0+c2hhcmVkX2luZm8sIGZpZWxkKQorI2RlZmluZSBzaGFyZWRfaW5mbyhk
LCBmaWVsZCkgICAgICBfX3NoYXJlZF9pbmZvKGQsIChkKS0+c2hhcmVkX2luZm8udmlydCwgZmll
bGQpCiAjZGVmaW5lIHZjcHVfaW5mbyh2LCBmaWVsZCkgICAgICAgIF9fdmNwdV9pbmZvKHYsICh2
KS0+dmNwdV9pbmZvLCBmaWVsZCkKIAogI2VuZGlmIC8qIF9fWEVOX1NIQVJFRF9IX18gKi8KLS0g
CjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
