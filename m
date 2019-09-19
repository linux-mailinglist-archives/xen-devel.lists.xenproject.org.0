Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F80B7824
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 13:07:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAuEz-00036Z-7y; Thu, 19 Sep 2019 11:04:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iAuEx-000363-Qa
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 11:04:47 +0000
X-Inumbo-ID: 4a8b99e8-dacd-11e9-9656-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a8b99e8-dacd-11e9-9656-12813bfff9fa;
 Thu, 19 Sep 2019 11:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568891087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mfUZwIzuuuh/8WmQvMze2vYPiSlJtD/slSslvGjSweM=;
 b=SMBHNn37t/rpggUBx8K7wbHIpXIKNIeNoIS60YUqqvbY69M1vqierRAV
 TjXqdPdSGIVIXrwLZzCNmAK8y00tqaOTnRqYNqNm8HZdok95kPMLhjzOz
 ATD47zWkY8O0hrRDrp5DDyaODLP5GTi8J4c5qx0zfNLPZbECnJp4hC++Q U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: oZGbtYrxfOMH/DQrRI8r+nhGdBJo4BpUFeg83EMa7GMgJR9EmtOk1l7AZg0Wl3RmMsAWBtaLFj
 weWuPRLcmmtPIKUL2YSJX9MQMfwP5HSOPuDw72x/PYt8/XwwYh1eHKslpMUf8femkFE5jrjqye
 Prtj975t0iyXe4JFWl9xjIfeJdNLYsOmvjOnX+pOIxMTfGmiLzqrDwZ0OZSGiCEUn7nBzLS2k5
 C9ZRazGRetfolDsW4pg52zQ/03cjDKvXc64E93BEj5qm2y7ZHT7qqUD+fIw/Wm/0IPllcO7dVP
 IyU=
X-SBRS: 2.7
X-MesageID: 5777957
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,523,1559534400"; 
   d="scan'208";a="5777957"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Sep 2019 12:04:41 +0100
Message-ID: <20190919110443.817594-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919110443.817594-1-anthony.perard@citrix.com>
References: <20190919110443.817594-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 7/9] libxl_disk: Implement missing timeout
 for libxl_cdrom_insert
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWZ0ZXIgdGhlIHBhdGNoICJsaWJ4bF9kaXNrOiBVc2UgZXZfcW1wIGluIGxpYnhsX2Nkcm9tX2lu
c2VydCIKdGhlcmUgd2lsbCBub3QgYmUgYW55IGtpbmQgb2YgdGltZW91dCwgYWRkIG9uZSBiYWNr
LgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5j
b20+CkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0t
CgpOb3RlczoKICAgIElhbiwgaW4gdGhpcyBwYXRjaCwgdGhlIHRpbWVvdXQgaXMgc2V0dXAgYWZ0
ZXIgd2UgaGF2ZSBhcXVpcmVkIHRoZSBsb2NrLgogICAgU2hvdWxkIHdlIGNoYW5nZSB0aGF0IHRv
IGFsc28gaGF2ZSBhIHRpbWVvdXQgd2FpdGluZyBmb3IgdGhlIGxvY2sgdG8gYmUKICAgIHJlbGVh
c2VkPwogICAgCiAgICB2MjoKICAgIC0gcGF0Y2ggbW92ZSBlYXJsaWVyIGluIHRoZSBzZXJpZXMg
dG8ga2VlcCBiaXNlY3RhYmlsaXR5LgoKIHRvb2xzL2xpYnhsL2xpYnhsX2Rpc2suYyB8IDIxICsr
KysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9kaXNrLmMgYi90b29scy9saWJ4bC9saWJ4bF9k
aXNrLmMKaW5kZXggOTgwMjNmMTY5Y2U2Li41Y2MyMTU5MDZmY2MgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L2xpYnhsL2xpYnhsX2Rpc2suYworKysgYi90b29scy9saWJ4bC9saWJ4bF9kaXNrLmMKQEAgLTY0
OSw2ICs2NDksNyBAQCB0eXBlZGVmIHN0cnVjdCB7CiAgICAgbGlieGxfZGV2aWNlX2Rpc2sgZGlz
a19zYXZlZDsKICAgICBsaWJ4bF9fZXZfZGV2bG9jayBxbXBfbG9jazsKICAgICBpbnQgZG1fdmVy
OworICAgIGxpYnhsX19ldl90aW1lIHRpbWU7CiB9IGxpYnhsX19jZHJvbV9pbnNlcnRfc3RhdGU7
CiAKIHN0YXRpYyB2b2lkIGNkcm9tX2luc2VydF9sb2NrX2FjcXVpcmVkKGxpYnhsX19lZ2MgKiwg
bGlieGxfX2V2X2RldmxvY2sgKiwKQEAgLTY1Nyw2ICs2NTgsOSBAQCBzdGF0aWMgdm9pZCBjZHJv
bV9pbnNlcnRfZWplY3RlZChsaWJ4bF9fZWdjICplZ2MsCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBsaWJ4bF9fY2Ryb21faW5zZXJ0X3N0YXRlICpjaXMpOwogc3RhdGljIHZvaWQg
Y2Ryb21faW5zZXJ0X2luc2VydGVkKGxpYnhsX19lZ2MgKmVnYywKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBsaWJ4bF9fY2Ryb21faW5zZXJ0X3N0YXRlICpjaXMpOworc3RhdGlj
IHZvaWQgY2Ryb21faW5zZXJ0X3RpbW91dChsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19ldl90aW1l
ICpldiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IHRpbWV2
YWwgKnJlcXVlc3RlZF9hYnMsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBy
Yyk7CiBzdGF0aWMgdm9pZCBjZHJvbV9pbnNlcnRfZG9uZShsaWJ4bF9fZWdjICplZ2MsCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9fY2Ryb21faW5zZXJ0X3N0YXRlICpjaXMs
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgcmMpOwpAQCAtNjc5LDYgKzY4Myw3
IEBAIGludCBsaWJ4bF9jZHJvbV9pbnNlcnQobGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlk
LCBsaWJ4bF9kZXZpY2VfZGlzayAqZGlzaywKICAgICBsaWJ4bF9fZXZfZGV2bG9ja19pbml0KCZj
aXMtPnFtcF9sb2NrKTsKICAgICBjaXMtPnFtcF9sb2NrLmFvID0gYW87CiAgICAgY2lzLT5xbXBf
bG9jay5kb21pZCA9IGRvbWlkOworICAgIGxpYnhsX19ldl90aW1lX2luaXQoJmNpcy0+dGltZSk7
CiAKICAgICBsaWJ4bF9kb21haW5fdHlwZSB0eXBlID0gbGlieGxfX2RvbWFpbl90eXBlKGdjLCBk
b21pZCk7CiAgICAgaWYgKHR5cGUgPT0gTElCWExfRE9NQUlOX1RZUEVfSU5WQUxJRCkgewpAQCAt
NzQ3LDYgKzc1MiwxMSBAQCBzdGF0aWMgdm9pZCBjZHJvbV9pbnNlcnRfbG9ja19hY3F1aXJlZChs
aWJ4bF9fZWdjICplZ2MsCiAKICAgICBpZiAocmMpIGdvdG8gb3V0OwogCisgICAgcmMgPSBsaWJ4
bF9fZXZfdGltZV9yZWdpc3Rlcl9yZWwoYW8sICZjaXMtPnRpbWUsCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY2Ryb21faW5zZXJ0X3RpbW91dCwKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBMSUJYTF9IT1RQTFVHX1RJTUVPVVQgKiAxMDAwKTsKKyAg
ICBpZiAocmMpIGdvdG8gb3V0OworCiAgICAgLyogV2UgbmVlZCB0byBlamVjdCB0aGUgb3JpZ2lu
YWwgaW1hZ2UgZmlyc3QuIFRoaXMgaXMgaW1wbGVtZW50ZWQKICAgICAgKiBieSBpbnNlcnRpbmcg
ZW1wdHkgbWVkaWEuIEpTT04gaXMgbm90IHVwZGF0ZWQuCiAgICAgICovCkBAIC05NTAsMTIgKzk2
MCwyMyBAQCBzdGF0aWMgdm9pZCBjZHJvbV9pbnNlcnRfaW5zZXJ0ZWQobGlieGxfX2VnYyAqZWdj
LAogICAgIGNkcm9tX2luc2VydF9kb25lKGVnYywgY2lzLCByYyk7IC8qIG11c3QgYmUgbGFzdCAq
LwogfQogCitzdGF0aWMgdm9pZCBjZHJvbV9pbnNlcnRfdGltb3V0KGxpYnhsX19lZ2MgKmVnYywg
bGlieGxfX2V2X3RpbWUgKmV2LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25z
dCBzdHJ1Y3QgdGltZXZhbCAqcmVxdWVzdGVkX2FicywKKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaW50IHJjKQoreworICAgIEVHQ19HQzsKKyAgICBsaWJ4bF9fY2Ryb21faW5zZXJ0
X3N0YXRlICpjaXMgPSBDT05UQUlORVJfT0YoZXYsICpjaXMsIHRpbWUpOworICAgIExPR0QoRVJS
T1IsIGNpcy0+ZG9taWQsICJjZHJvbSBpbnNlcnRpb24gdGltZWQgb3V0Iik7CisgICAgY2Ryb21f
aW5zZXJ0X2RvbmUoZWdjLCBjaXMsIHJjKTsKK30KKwogc3RhdGljIHZvaWQgY2Ryb21faW5zZXJ0
X2RvbmUobGlieGxfX2VnYyAqZWdjLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGli
eGxfX2Nkcm9tX2luc2VydF9zdGF0ZSAqY2lzLAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaW50IHJjKQogewogICAgIEVHQ19HQzsKIAorICAgIGxpYnhsX19ldl90aW1lX2RlcmVnaXN0
ZXIoZ2MsICZjaXMtPnRpbWUpOwogICAgIGxpYnhsX19ldl9kZXZsb2NrX3VubG9jayhnYywgJmNp
cy0+cW1wX2xvY2spOwogICAgIGxpYnhsX2RldmljZV9kaXNrX2Rpc3Bvc2UoJmNpcy0+ZGlza19z
YXZlZCk7CiAgICAgbGlieGxfX2FvX2NvbXBsZXRlKGVnYywgY2lzLT5hbywgcmMpOwotLSAKQW50
aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
