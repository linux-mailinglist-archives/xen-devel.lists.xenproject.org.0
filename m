Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BF912A198
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 14:07:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijjrm-0005Ph-P6; Tue, 24 Dec 2019 13:04:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZIBU=2O=amazon.com=prvs=254c36092=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ijjrk-0005P1-Ro
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 13:04:48 +0000
X-Inumbo-ID: f04e20ab-264d-11ea-97ba-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f04e20ab-264d-11ea-97ba-12813bfff9fa;
 Tue, 24 Dec 2019 13:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1577192678; x=1608728678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8yV9OhAFczXqA60/NNY/VsUpkx8SzXjkFLHYyVQtSoM=;
 b=lakU7nnVSnQBPp5Xzh2wyZb/1cfjj2JI2Y/4ntQdXmWZUonETBotCPac
 u175uPu/ik0NI9gl5KoAPLMRYAjNqcn/S6evmE0jEVBVa+FUOSNW2TkiH
 RCkAnRJASv8WLzEnsaSLGHzOCBH0baBBsJsfxe0E6FRZz2sps8y8U0bfy Q=;
IronPort-SDR: m+VxJJKoPG0Qmt6ee74Z7AG07kGp8Tiht3iydkfPSO+RGFJUChfsZ+uPxkfm5YVsgJPd/6kkXk
 lb2nnLmLh9dw==
X-IronPort-AV: E=Sophos;i="5.69,351,1571702400"; 
   d="scan'208";a="6955867"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 24 Dec 2019 13:04:28 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com (Postfix) with ESMTPS
 id B56E2A2CF9; Tue, 24 Dec 2019 13:04:25 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 24 Dec 2019 13:04:24 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 24 Dec 2019 13:04:24 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 24 Dec 2019 13:04:21 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 24 Dec 2019 13:04:11 +0000
Message-ID: <20191224130416.3570-2-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191224130416.3570-1-pdurrant@amazon.com>
References: <20191224130416.3570-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 1/6] libxl: add definition of INVALID_DOMID to
 the API
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudGx5IGJvdGggeGwgYW5kIGxpYnhsIGhhdmUgaW50ZXJuYWwgZGVmaW5pdGlvbnMgb2Yg
SU5WQUxJRF9ET01JRAp3aGljaCBoYXBwZW4gdG8gYmUgaWRlbnRpY2FsLiBIb3dldmVyLCBmb3Ig
dGhlIHB1cnBvc2VzIG9mIGRlc2NyaWJpbmcgdGhlCmJlaGF2aW91ciBvZiBsaWJ4bF9kb21haW5f
Y3JlYXRlX25ldy9yZXN0b3JlKCkgaXQgaXMgdXNlZnVsIHRvIGhhdmUgYQpzcGVjaWZpZWQgaW52
YWxpZCB2YWx1ZSBmb3IgYSBkb21haW4gaWQuCgpUaGlzIHBhdGNoIHRoZXJlZm9yZSBtb3ZlcyB0
aGUgbGlieGwgZGVmaW5pdGlvbiBmcm9tIGxpYnhsX2ludGVybmFsLmggdG8KbGlieGwuaCBhbmQg
cmVtb3ZlcyB0aGUgaW50ZXJuYWwgZGVmaW5pdGlvbiBmcm9tIHhsX3V0aWxzLmguIFRoZSBoYXJk
Y29kZWQKJy0xJyBwYXNzZWQgYmFjayB2aWEgZG9tY3JlYXRlX2NvbXBsZXRlKCkgaXMgdGhlbiB1
cGRhdGVkIHRvIElOVkFMSURfRE9NSUQKYW5kIGNvbW1lbnQgYWJvdmUgbGlieGxfZG9tYWluX2Ny
ZWF0ZV9uZXcvcmVzdG9yZSgpIGlzIGFjY29yZGluZ2x5Cm1vZGlmaWVkLgoKU2lnbmVkLW9mZi1i
eTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgotLS0KQ2M6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ2M6
IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIHRvb2xzL2xp
YnhsL2xpYnhsLmggICAgICAgICAgfCA0ICsrKy0KIHRvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5j
ICAgfCAyICstCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgMSAtCiB0b29scy94bC94
bF91dGlscy5oICAgICAgICAgIHwgMiAtLQogNCBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGwuaCBiL3Rv
b2xzL2xpYnhsL2xpYnhsLmgKaW5kZXggNTRhYmI5ZGIxZi4uMThjMWEyZDZiZiAxMDA2NDQKLS0t
IGEvdG9vbHMvbGlieGwvbGlieGwuaAorKysgYi90b29scy9saWJ4bC9saWJ4bC5oCkBAIC0xNTI3
LDkgKzE1MjcsMTEgQEAgaW50IGxpYnhsX2N0eF9mcmVlKGxpYnhsX2N0eCAqY3R4IC8qIDAgaXMg
T0sgKi8pOwogCiAvKiBkb21haW4gcmVsYXRlZCBmdW5jdGlvbnMgKi8KIAorI2RlZmluZSBJTlZB
TElEX0RPTUlEIH4wCisKIC8qIElmIHRoZSByZXN1bHQgaXMgRVJST1JfQUJPUlRFRCwgdGhlIGRv
bWFpbiBtYXkgb3IgbWF5IG5vdCBleGlzdAogICogKGluIGEgaGFsZi1jcmVhdGVkIHN0YXRlKS4g
ICpkb21pZCB3aWxsIGJlIHZhbGlkIGFuZCB3aWxsIGJlIHRoZQotICogZG9tYWluIGlkLCBvciAt
MSwgYXMgYXBwcm9wcmlhdGUgKi8KKyAqIGRvbWFpbiBpZCwgb3IgSU5WQUxJRF9ET01JRCwgYXMg
YXBwcm9wcmlhdGUgKi8KIAogaW50IGxpYnhsX2RvbWFpbl9jcmVhdGVfbmV3KGxpYnhsX2N0eCAq
Y3R4LCBsaWJ4bF9kb21haW5fY29uZmlnICpkX2NvbmZpZywKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1aW50MzJfdCAqZG9taWQsCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9j
cmVhdGUuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCmluZGV4IDMyZDQ1ZGNlZjAuLmJj
NDI1ZmVlMzIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCisrKyBiL3Rv
b2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCkBAIC0xNzczLDcgKzE3NzMsNyBAQCBzdGF0aWMgdm9p
ZCBkb21jcmVhdGVfY29tcGxldGUobGlieGxfX2VnYyAqZWdjLAogICAgICAgICAgICAgbGlieGxf
X2RvbWFpbl9kZXN0cm95KGVnYywgJmRjcy0+ZGRzKTsKICAgICAgICAgICAgIHJldHVybjsKICAg
ICAgICAgfQotICAgICAgICBkY3MtPmd1ZXN0X2RvbWlkID0gLTE7CisgICAgICAgIGRjcy0+Z3Vl
c3RfZG9taWQgPSBJTlZBTElEX0RPTUlEOwogICAgIH0KICAgICBkY3MtPmNhbGxiYWNrKGVnYywg
ZGNzLCByYywgZGNzLT5ndWVzdF9kb21pZCk7CiB9CmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9s
aWJ4bF9pbnRlcm5hbC5oIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAppbmRleCBiNWFk
YmZlNGI3Li5hMTU3Nzg5NTJjIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5h
bC5oCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKQEAgLTEyMSw3ICsxMjEsNiBA
QAogI2RlZmluZSBTVFVCRE9NX1NQRUNJQUxfQ09OU09MRVMgMwogI2RlZmluZSBUQVBfREVWSUNF
X1NVRkZJWCAiLWVtdSIKICNkZWZpbmUgRE9NSURfWFNfUEFUSCAiZG9taWQiCi0jZGVmaW5lIElO
VkFMSURfRE9NSUQgfjAKICNkZWZpbmUgUFZTSElNX0JBU0VOQU1FICJ4ZW4tc2hpbSIKICNkZWZp
bmUgUFZTSElNX0NNRExJTkUgInB2LXNoaW0gY29uc29sZT14ZW4scHYiCiAKZGlmZiAtLWdpdCBh
L3Rvb2xzL3hsL3hsX3V0aWxzLmggYi90b29scy94bC94bF91dGlscy5oCmluZGV4IDdiOWNjY2Ez
MGEuLmQ5OGI0MTlmMTAgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3hsL3hsX3V0aWxzLmgKKysrIGIvdG9v
bHMveGwveGxfdXRpbHMuaApAQCAtNTIsOCArNTIsNiBAQAogI2RlZmluZSBTVFJfU0tJUF9QUkVG
SVgoIGEsIGIgKSBcCiAgICAgKCBTVFJfSEFTX1BSRUZJWChhLCBiKSA/ICgoYSkgKz0gc3RybGVu
KGIpLCAxKSA6IDAgKQogCi0jZGVmaW5lIElOVkFMSURfRE9NSUQgfjAKLQogI2RlZmluZSBMT0co
X2YsIF9hLi4uKSAgIGRvbG9nKF9fRklMRV9fLCBfX0xJTkVfXywgX19mdW5jX18sIF9mICJcbiIs
ICMjX2EpCiAKIC8qCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
