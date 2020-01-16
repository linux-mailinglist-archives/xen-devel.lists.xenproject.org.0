Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E289013D70F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 10:39:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is1Zh-0006du-0F; Thu, 16 Jan 2020 09:36:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TxvK=3F=amazon.co.uk=prvs=27736368b=pdurrant@srs-us1.protection.inumbo.net>)
 id 1is1Zg-0006dm-AA
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 09:36:24 +0000
X-Inumbo-ID: a32fd2b7-3843-11ea-86d6-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a32fd2b7-3843-11ea-86d6-12813bfff9fa;
 Thu, 16 Jan 2020 09:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579167375; x=1610703375;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3V67GdulIUlIp7ax4loPsJWuwUmHAyVEgdp0JH/zDD8=;
 b=fnXIEPC12umrtwVbt1/Az0N1NGXyuTQrwO7zniV7oLhcOD05SQXhCQ3g
 wXxLd7WR6iTvhAIxgh2yA7lZYX9kTbPl8K0Vfhi8q/uMgEMF/Xrjeyd9J
 HREY+IVxVa9sLyPtKMn7iAAaKwxv1rqmffZYAm//xdLpdHXlhSE5KAosG 8=;
IronPort-SDR: jyYb6mM5sQZPY+oVg9MJEsKxp2BV5Gd6UOPMmTQNJQa3o6jKK4rBpowiOBqz/RIF/sbFQ4aPsr
 gug+VpVBO3sg==
X-IronPort-AV: E=Sophos;i="5.70,325,1574121600"; d="scan'208";a="12699623"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 16 Jan 2020 09:36:13 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com (Postfix) with ESMTPS
 id 2C9E5A2DFC; Thu, 16 Jan 2020 09:36:12 +0000 (UTC)
Received: from EX13D32EUB002.ant.amazon.com (10.43.166.114) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 16 Jan 2020 09:36:11 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D32EUB002.ant.amazon.com (10.43.166.114) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 16 Jan 2020 09:36:10 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 16 Jan 2020 09:36:09 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 16 Jan 2020 09:35:57 +0000
Message-ID: <20200116093602.4203-2-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116093602.4203-1-pdurrant@amazon.com>
References: <20200116093602.4203-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 1/6] libxl: add definition of INVALID_DOMID
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
aWJ4bF9jcmVhdGUuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCmluZGV4IDMyZDQ1ZGNl
ZjAuLmJjNDI1ZmVlMzIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCisr
KyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCkBAIC0xNzczLDcgKzE3NzMsNyBAQCBzdGF0
aWMgdm9pZCBkb21jcmVhdGVfY29tcGxldGUobGlieGxfX2VnYyAqZWdjLAogICAgICAgICAgICAg
bGlieGxfX2RvbWFpbl9kZXN0cm95KGVnYywgJmRjcy0+ZGRzKTsKICAgICAgICAgICAgIHJldHVy
bjsKICAgICAgICAgfQotICAgICAgICBkY3MtPmd1ZXN0X2RvbWlkID0gLTE7CisgICAgICAgIGRj
cy0+Z3Vlc3RfZG9taWQgPSBJTlZBTElEX0RPTUlEOwogICAgIH0KICAgICBkY3MtPmNhbGxiYWNr
KGVnYywgZGNzLCByYywgZGNzLT5ndWVzdF9kb21pZCk7CiB9CmRpZmYgLS1naXQgYS90b29scy9s
aWJ4bC9saWJ4bF9pbnRlcm5hbC5oIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAppbmRl
eCBiYThjOWI0MWFiLi4zYjcwOGZiYThmIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9p
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
