Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 494F3145827
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 15:47:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuHFj-0000aV-OJ; Wed, 22 Jan 2020 14:45:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8xH2=3L=amazon.co.uk=prvs=28361e846=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iuHFi-0000aC-SZ
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 14:45:06 +0000
X-Inumbo-ID: c656fb70-3d25-11ea-bc69-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c656fb70-3d25-11ea-bc69-12813bfff9fa;
 Wed, 22 Jan 2020 14:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579704305; x=1611240305;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eNf1ol3HLn8Plicep4cSLVZ7PXpyt8oGQgYjN7igPB4=;
 b=W9O/8zaMkE/C7Q2NjwIf+7CtNtrVxUPSpu6BJqdRgZ+c6ofWafZxErI7
 VSdQgbsUgsebUNcg+OfatssN0vswNjrII5qbXmPNTMbSly3PeLFVIWPam
 UpcM3PbWux6V8AKq0kiB2rexH2F7/TB2ZXqL+RPsInlWkYCZVFH3TXckt 0=;
IronPort-SDR: rUVqu/vcGWy5a0ewMd1GbRPdJvhoZs3y3uDRGsiEulaCm50Yz44Bp66FGePva1LY58l48lsqCD
 78lk+VXtYr+g==
X-IronPort-AV: E=Sophos;i="5.70,350,1574121600"; d="scan'208";a="21741780"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 22 Jan 2020 14:44:54 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS
 id 46739C1203; Wed, 22 Jan 2020 14:44:51 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 22 Jan 2020 14:44:51 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 22 Jan 2020 14:44:50 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 22 Jan 2020 14:44:48 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 22 Jan 2020 14:44:40 +0000
Message-ID: <20200122144446.919-2-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200122144446.919-1-pdurrant@amazon.com>
References: <20200122144446.919-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v4 1/7] libxl: add definition of INVALID_DOMID
 to the API
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
eTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgpBY2tlZC1ieTogSWFuIEphY2tz
b24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQpDYzogV2VpIExpdSA8d2xAeGVuLm9y
Zz4KQ2M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIHRv
b2xzL2xpYnhsL2xpYnhsLmggICAgICAgICAgfCA0ICsrKy0KIHRvb2xzL2xpYnhsL2xpYnhsX2Ny
ZWF0ZS5jICAgfCAyICstCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgMSAtCiB0b29s
cy94bC94bF91dGlscy5oICAgICAgICAgIHwgMiAtLQogNCBmaWxlcyBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGwu
aCBiL3Rvb2xzL2xpYnhsL2xpYnhsLmgKaW5kZXggNTRhYmI5ZGIxZi4uMThjMWEyZDZiZiAxMDA2
NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGwuaAorKysgYi90b29scy9saWJ4bC9saWJ4bC5oCkBA
IC0xNTI3LDkgKzE1MjcsMTEgQEAgaW50IGxpYnhsX2N0eF9mcmVlKGxpYnhsX2N0eCAqY3R4IC8q
IDAgaXMgT0sgKi8pOwogCiAvKiBkb21haW4gcmVsYXRlZCBmdW5jdGlvbnMgKi8KIAorI2RlZmlu
ZSBJTlZBTElEX0RPTUlEIH4wCisKIC8qIElmIHRoZSByZXN1bHQgaXMgRVJST1JfQUJPUlRFRCwg
dGhlIGRvbWFpbiBtYXkgb3IgbWF5IG5vdCBleGlzdAogICogKGluIGEgaGFsZi1jcmVhdGVkIHN0
YXRlKS4gICpkb21pZCB3aWxsIGJlIHZhbGlkIGFuZCB3aWxsIGJlIHRoZQotICogZG9tYWluIGlk
LCBvciAtMSwgYXMgYXBwcm9wcmlhdGUgKi8KKyAqIGRvbWFpbiBpZCwgb3IgSU5WQUxJRF9ET01J
RCwgYXMgYXBwcm9wcmlhdGUgKi8KIAogaW50IGxpYnhsX2RvbWFpbl9jcmVhdGVfbmV3KGxpYnhs
X2N0eCAqY3R4LCBsaWJ4bF9kb21haW5fY29uZmlnICpkX2NvbmZpZywKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1aW50MzJfdCAqZG9taWQsCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9s
aWJ4bF9jcmVhdGUuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCmluZGV4IDY5ZmNlZmYw
NjEuLjhhMWJmZjZjZDMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCisr
KyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCkBAIC0xNzczLDcgKzE3NzMsNyBAQCBzdGF0
aWMgdm9pZCBkb21jcmVhdGVfY29tcGxldGUobGlieGxfX2VnYyAqZWdjLAogICAgICAgICAgICAg
bGlieGxfX2RvbWFpbl9kZXN0cm95KGVnYywgJmRjcy0+ZGRzKTsKICAgICAgICAgICAgIHJldHVy
bjsKICAgICAgICAgfQotICAgICAgICBkY3MtPmd1ZXN0X2RvbWlkID0gLTE7CisgICAgICAgIGRj
cy0+Z3Vlc3RfZG9taWQgPSBJTlZBTElEX0RPTUlEOwogICAgIH0KICAgICBkY3MtPmNhbGxiYWNr
KGVnYywgZGNzLCByYywgZGNzLT5ndWVzdF9kb21pZCk7CiB9CmRpZmYgLS1naXQgYS90b29scy9s
aWJ4bC9saWJ4bF9pbnRlcm5hbC5oIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAppbmRl
eCBkOTE5ZjkxODgyLi5mMmY3NTNjNzJiIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9p
bnRlcm5hbC5oCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKQEAgLTEyMSw3ICsx
MjEsNiBAQAogI2RlZmluZSBTVFVCRE9NX1NQRUNJQUxfQ09OU09MRVMgMwogI2RlZmluZSBUQVBf
REVWSUNFX1NVRkZJWCAiLWVtdSIKICNkZWZpbmUgRE9NSURfWFNfUEFUSCAiZG9taWQiCi0jZGVm
aW5lIElOVkFMSURfRE9NSUQgfjAKICNkZWZpbmUgUFZTSElNX0JBU0VOQU1FICJ4ZW4tc2hpbSIK
ICNkZWZpbmUgUFZTSElNX0NNRExJTkUgInB2LXNoaW0gY29uc29sZT14ZW4scHYiCiAKZGlmZiAt
LWdpdCBhL3Rvb2xzL3hsL3hsX3V0aWxzLmggYi90b29scy94bC94bF91dGlscy5oCmluZGV4IDdi
OWNjY2EzMGEuLmQ5OGI0MTlmMTAgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3hsL3hsX3V0aWxzLmgKKysr
IGIvdG9vbHMveGwveGxfdXRpbHMuaApAQCAtNTIsOCArNTIsNiBAQAogI2RlZmluZSBTVFJfU0tJ
UF9QUkVGSVgoIGEsIGIgKSBcCiAgICAgKCBTVFJfSEFTX1BSRUZJWChhLCBiKSA/ICgoYSkgKz0g
c3RybGVuKGIpLCAxKSA6IDAgKQogCi0jZGVmaW5lIElOVkFMSURfRE9NSUQgfjAKLQogI2RlZmlu
ZSBMT0coX2YsIF9hLi4uKSAgIGRvbG9nKF9fRklMRV9fLCBfX0xJTkVfXywgX19mdW5jX18sIF9m
ICJcbiIsICMjX2EpCiAKIC8qCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
