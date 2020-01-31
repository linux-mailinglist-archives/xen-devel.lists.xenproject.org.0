Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9CF14EF1B
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 16:05:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixXo4-0005wl-JE; Fri, 31 Jan 2020 15:02:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qch3=3U=amazon.co.uk=prvs=292a3fd2f=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ixXo2-0005wX-QJ
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 15:02:02 +0000
X-Inumbo-ID: a08d3da2-443a-11ea-b211-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a08d3da2-443a-11ea-b211-bc764e2007e4;
 Fri, 31 Jan 2020 15:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580482919; x=1612018919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UwU9jIJ79IWsZ3Gqe1SBt9ApK0WlCHSaC/FXU5it7pk=;
 b=Oa51lCYp93NjIHHUTd4Y/6A1xP47bdWVyLN6baKDrOBfltNo4c5znP4M
 9pKJtzK5SlQ3HKDANKHRSrZrWcaMnzxPtwL2Zlq6zOmz5BwQnhjZIQgIy
 1vKImcdBWyZd1ULRBMdqNSQS7xQdhBWEZcNKglKesLYvmJWDeK1ds/2qs 8=;
IronPort-SDR: QfWC5aNtDe4V69wKDzbiwaLXNaowIz1ldzam5cyZcPW+TsClfntb2seInjnnUjhmReENKDpoU3
 wdjKGobCr9Vg==
X-IronPort-AV: E=Sophos;i="5.70,386,1574121600"; d="scan'208";a="14194300"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-87a10be6.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 31 Jan 2020 15:01:57 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-87a10be6.us-west-2.amazon.com (Postfix) with ESMTPS
 id D7877A1E09; Fri, 31 Jan 2020 15:01:55 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 31 Jan 2020 15:01:55 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 31 Jan 2020 15:01:54 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 31 Jan 2020 15:01:53 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 31 Jan 2020 15:01:43 +0000
Message-ID: <20200131150149.2008-2-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200131150149.2008-1-pdurrant@amazon.com>
References: <20200131150149.2008-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v5 1/7] libxl: add definition of INVALID_DOMID
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
ZWF0ZV9uZXcvcmVzdG9yZSgpIGlzIGFjY29yZGluZ2x5Cm1vZGlmaWVkLgoKTk9URTogVGhlIHZh
bHVlIG9mIElOVkFMSURfRE9NSUQgKH4wKSBpcyBkaXN0aW5jdCBmcm9tIHRoZSBoeXBlcnZpc29y
J3MKICAgICAgRE9NSURfSU5WQUxJRC4gVGhpcyBwYXRjaCBwcmVzZXJ2ZXMgdGhhdCB2YWx1ZS4K
ClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KQWNrZWQt
Ynk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KQ2M6IFdlaSBM
aXUgPHdsQHhlbi5vcmc+CkNjOiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT4KCnY1OgogLSBFeHBhbmQgY29tbWl0IGNvbW1lbnQKLS0tCiB0b29scy9saWJ4bC9saWJ4
bC5oICAgICAgICAgIHwgNCArKystCiB0b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyAgIHwgMiAr
LQogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCB8IDEgLQogdG9vbHMveGwveGxfdXRpbHMu
aCAgICAgICAgICB8IDIgLS0KIDQgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsLmggYi90b29scy9saWJ4
bC9saWJ4bC5oCmluZGV4IDU0YWJiOWRiMWYuLjE4YzFhMmQ2YmYgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L2xpYnhsL2xpYnhsLmgKKysrIGIvdG9vbHMvbGlieGwvbGlieGwuaApAQCAtMTUyNyw5ICsxNTI3
LDExIEBAIGludCBsaWJ4bF9jdHhfZnJlZShsaWJ4bF9jdHggKmN0eCAvKiAwIGlzIE9LICovKTsK
IAogLyogZG9tYWluIHJlbGF0ZWQgZnVuY3Rpb25zICovCiAKKyNkZWZpbmUgSU5WQUxJRF9ET01J
RCB+MAorCiAvKiBJZiB0aGUgcmVzdWx0IGlzIEVSUk9SX0FCT1JURUQsIHRoZSBkb21haW4gbWF5
IG9yIG1heSBub3QgZXhpc3QKICAqIChpbiBhIGhhbGYtY3JlYXRlZCBzdGF0ZSkuICAqZG9taWQg
d2lsbCBiZSB2YWxpZCBhbmQgd2lsbCBiZSB0aGUKLSAqIGRvbWFpbiBpZCwgb3IgLTEsIGFzIGFw
cHJvcHJpYXRlICovCisgKiBkb21haW4gaWQsIG9yIElOVkFMSURfRE9NSUQsIGFzIGFwcHJvcHJp
YXRlICovCiAKIGludCBsaWJ4bF9kb21haW5fY3JlYXRlX25ldyhsaWJ4bF9jdHggKmN0eCwgbGli
eGxfZG9tYWluX2NvbmZpZyAqZF9jb25maWcsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dWludDMyX3QgKmRvbWlkLApkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMg
Yi90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwppbmRleCAzMmQ0NWRjZWYwLi5iYzQyNWZlZTMy
IDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYworKysgYi90b29scy9saWJ4
bC9saWJ4bF9jcmVhdGUuYwpAQCAtMTc3Myw3ICsxNzczLDcgQEAgc3RhdGljIHZvaWQgZG9tY3Jl
YXRlX2NvbXBsZXRlKGxpYnhsX19lZ2MgKmVnYywKICAgICAgICAgICAgIGxpYnhsX19kb21haW5f
ZGVzdHJveShlZ2MsICZkY3MtPmRkcyk7CiAgICAgICAgICAgICByZXR1cm47CiAgICAgICAgIH0K
LSAgICAgICAgZGNzLT5ndWVzdF9kb21pZCA9IC0xOworICAgICAgICBkY3MtPmd1ZXN0X2RvbWlk
ID0gSU5WQUxJRF9ET01JRDsKICAgICB9CiAgICAgZGNzLT5jYWxsYmFjayhlZ2MsIGRjcywgcmMs
IGRjcy0+Z3Vlc3RfZG9taWQpOwogfQpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfaW50
ZXJuYWwuaCBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKaW5kZXggMjU1NWFhNDU3NS4u
NzIyOTBjNmYyOCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAorKysg
Yi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCkBAIC0xMjEsNyArMTIxLDYgQEAKICNkZWZp
bmUgU1RVQkRPTV9TUEVDSUFMX0NPTlNPTEVTIDMKICNkZWZpbmUgVEFQX0RFVklDRV9TVUZGSVgg
Ii1lbXUiCiAjZGVmaW5lIERPTUlEX1hTX1BBVEggImRvbWlkIgotI2RlZmluZSBJTlZBTElEX0RP
TUlEIH4wCiAjZGVmaW5lIFBWU0hJTV9CQVNFTkFNRSAieGVuLXNoaW0iCiAjZGVmaW5lIFBWU0hJ
TV9DTURMSU5FICJwdi1zaGltIGNvbnNvbGU9eGVuLHB2IgogCmRpZmYgLS1naXQgYS90b29scy94
bC94bF91dGlscy5oIGIvdG9vbHMveGwveGxfdXRpbHMuaAppbmRleCA3YjljY2NhMzBhLi5kOThi
NDE5ZjEwIDEwMDY0NAotLS0gYS90b29scy94bC94bF91dGlscy5oCisrKyBiL3Rvb2xzL3hsL3hs
X3V0aWxzLmgKQEAgLTUyLDggKzUyLDYgQEAKICNkZWZpbmUgU1RSX1NLSVBfUFJFRklYKCBhLCBi
ICkgXAogICAgICggU1RSX0hBU19QUkVGSVgoYSwgYikgPyAoKGEpICs9IHN0cmxlbihiKSwgMSkg
OiAwICkKIAotI2RlZmluZSBJTlZBTElEX0RPTUlEIH4wCi0KICNkZWZpbmUgTE9HKF9mLCBfYS4u
LikgICBkb2xvZyhfX0ZJTEVfXywgX19MSU5FX18sIF9fZnVuY19fLCBfZiAiXG4iLCAjI19hKQog
CiAvKgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
