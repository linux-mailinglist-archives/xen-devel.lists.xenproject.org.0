Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97322E51FC
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 19:07:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO31U-0000Dv-RY; Fri, 25 Oct 2019 17:05:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eA7w=YS=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iO31T-0000DG-R3
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 17:05:11 +0000
X-Inumbo-ID: 9931babd-f749-11e9-94ca-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9931babd-f749-11e9-94ca-12813bfff9fa;
 Fri, 25 Oct 2019 17:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572023110;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SmAc//pgooso4+IlFU4g65sc6VdhaWuiP3Q3tOeM35I=;
 b=Bn/NoFOVXfQdWrIgzi/6pJ//uwaoxT5O/lh29bH9IVAb82M+PqNRAFy1
 2B3uZ7J0ZMcnXX1YI6fYbJ2IDXH1W4g3A1bPaN7SJbZy54e0zBrQnEwUo
 olbnRHSYdp7vJUOzYu2cydGDj1riDGw0cPQBJA45o0il/1gDF1CBbSJjz g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GvT8EENjJDgLGwzE6hwByoYetBAiFnelG06u8Cybdx+oCd91DzTbJRRv4QRQUfZPwhH/i9Sf0v
 O8r96eGvTPg0x4DUxwxA1l+wzYpsqxqm5QevKEq54q8xA5hVPWEwSx0BI7NtUWXKrMEyTYTcou
 amq0wPMfRdDMGGdI+USHBqeqgJVVFfgkgIGn3C2ssoNnkkDJdIuyIQSqasNakZUZ9ImRGPLLeW
 plY/wlTS5o4pf+b3I8O47r6IBXyOwusxQVwGtd6L+It6owG/2F5IbbV/CYms78gRKuHgmu/TXL
 wC4=
X-SBRS: 2.7
X-MesageID: 7801962
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,229,1569297600"; 
   d="scan'208";a="7801962"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 25 Oct 2019 18:05:04 +0100
Message-ID: <20191025170505.2834957-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191025170505.2834957-1-anthony.perard@citrix.com>
References: <20191025170505.2834957-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC XEN PATCH for-4.13 3/4] libxl: libxl__ev_qmp_send
 now takes an egc
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

Tm8gZnVuY3Rpb25uYWwgY2hhbmdlcy4KClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2Rpc2suYyAg
ICAgICAgfCAgNiArKystLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2RtLmMgICAgICAgICAgfCAgOCAr
KysrLS0tLQogdG9vbHMvbGlieGwvbGlieGxfZG9tX3NhdmUuYyAgICB8ICAyICstCiB0b29scy9s
aWJ4bC9saWJ4bF9kb21fc3VzcGVuZC5jIHwgIDIgKy0KIHRvb2xzL2xpYnhsL2xpYnhsX2RvbWFp
bi5jICAgICAgfCAgOCArKysrLS0tLQogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCAgICB8
ICAyICstCiB0b29scy9saWJ4bC9saWJ4bF9wY2kuYyAgICAgICAgIHwgIDggKysrKy0tLS0KIHRv
b2xzL2xpYnhsL2xpYnhsX3FtcC5jICAgICAgICAgfCAxMCArKysrKy0tLS0tCiB0b29scy9saWJ4
bC9saWJ4bF91c2IuYyAgICAgICAgIHwgMjggKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQog
OSBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9kaXNrLmMgYi90b29scy9saWJ4bC9saWJ4bF9kaXNr
LmMKaW5kZXggNzMzYWQyODRjODY2Li43Y2JlZTM5NTMzMjAgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xp
YnhsL2xpYnhsX2Rpc2suYworKysgYi90b29scy9saWJ4bC9saWJ4bF9kaXNrLmMKQEAgLTc3Niw3
ICs3NzYsNyBAQCBzdGF0aWMgdm9pZCBjZHJvbV9pbnNlcnRfbG9ja19hY3F1aXJlZChsaWJ4bF9f
ZWdjICplZ2MsCiAKICAgICAgICAgUU1QX1BBUkFNRVRFUlNfU1BSSU5URigmYXJncywgImRldmlj
ZSIsICJpZGUtJWkiLCBkZXZpZCk7CiAgICAgICAgIGNpcy0+cW1wLmNhbGxiYWNrID0gY2Ryb21f
aW5zZXJ0X2VqZWN0ZWQ7Ci0gICAgICAgIHJjID0gbGlieGxfX2V2X3FtcF9zZW5kKGdjLCAmY2lz
LT5xbXAsICJlamVjdCIsIGFyZ3MpOworICAgICAgICByYyA9IGxpYnhsX19ldl9xbXBfc2VuZChl
Z2MsICZjaXMtPnFtcCwgImVqZWN0IiwgYXJncyk7CiAgICAgICAgIGlmIChyYykgZ290byBvdXQ7
CiAgICAgfSBlbHNlIHsKICAgICAgICAgY2Ryb21faW5zZXJ0X2VqZWN0ZWQoZWdjLCAmY2lzLT5x
bXAsIE5VTEwsIDApOyAvKiBtdXN0IGJlIGxhc3QgKi8KQEAgLTg4NCw3ICs4ODQsNyBAQCBzdGF0
aWMgdm9pZCBjZHJvbV9pbnNlcnRfZWplY3RlZChsaWJ4bF9fZWdjICplZ2MsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgbGlieGxfZGlza19mb3JtYXRfdG9fc3RyaW5nKGRpc2stPmZv
cm1hdCksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGlzay0+cGRldl9wYXRoKTsK
ICAgICAgICAgcW1wLT5jYWxsYmFjayA9IGNkcm9tX2luc2VydF9hZGRmZF9jYjsKLSAgICAgICAg
cmMgPSBsaWJ4bF9fZXZfcW1wX3NlbmQoZ2MsIHFtcCwgImFkZC1mZCIsIGFyZ3MpOworICAgICAg
ICByYyA9IGxpYnhsX19ldl9xbXBfc2VuZChlZ2MsIHFtcCwgImFkZC1mZCIsIGFyZ3MpOwogICAg
ICAgICBpZiAocmMpIGdvdG8gb3V0OwogICAgICAgICBoYXNfY2FsbGJhY2sgPSB0cnVlOwogICAg
IH0gZWxzZSB7CkBAIC05MzgsNyArOTM4LDcgQEAgc3RhdGljIHZvaWQgY2Ryb21faW5zZXJ0X2Fk
ZGZkX2NiKGxpYnhsX19lZ2MgKmVnYywKICAgICBsaWJ4bF9fcW1wX3BhcmFtX2FkZF9zdHJpbmco
Z2MsICZhcmdzLCAiYXJnIiwKICAgICAgICAgbGlieGxfX3FlbXVfZGlza19mb3JtYXRfc3RyaW5n
KGRpc2stPmZvcm1hdCkpOwogICAgIHFtcC0+Y2FsbGJhY2sgPSBjZHJvbV9pbnNlcnRfaW5zZXJ0
ZWQ7Ci0gICAgcmMgPSBsaWJ4bF9fZXZfcW1wX3NlbmQoZ2MsIHFtcCwgImNoYW5nZSIsIGFyZ3Mp
OworICAgIHJjID0gbGlieGxfX2V2X3FtcF9zZW5kKGVnYywgcW1wLCAiY2hhbmdlIiwgYXJncyk7
CiBvdXQ6CiAgICAgaWYgKHJjKQogICAgICAgICBjZHJvbV9pbnNlcnRfZG9uZShlZ2MsIGNpcywg
cmMpOyAvKiBtdXN0IGJlIGxhc3QgKi8KZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2Rt
LmMgYi90b29scy9saWJ4bC9saWJ4bF9kbS5jCmluZGV4IGMwMDM1NmEyZjE2YS4uNDdjZjZkZGE3
ZWMxIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9kbS5jCisrKyBiL3Rvb2xzL2xpYnhs
L2xpYnhsX2RtLmMKQEAgLTI2NTAsNyArMjY1MCw3IEBAIHZvaWQgbGlieGxfX3NwYXduX2xvY2Fs
X2RtKGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX2RtX3NwYXduX3N0YXRlICpkbXNzKQogICAgICAg
ICBkbXNzLT5xbXAuY2FsbGJhY2sgPSBkZXZpY2VfbW9kZWxfcW1wX2NiOwogICAgICAgICBkbXNz
LT5xbXAuZG9taWQgPSBkb21pZDsKICAgICAgICAgZG1zcy0+cW1wLnBheWxvYWRfZmQgPSAtMTsK
LSAgICAgICAgcmMgPSBsaWJ4bF9fZXZfcW1wX3NlbmQoZ2MsICZkbXNzLT5xbXAsICJxdWVyeS1z
dGF0dXMiLCBOVUxMKTsKKyAgICAgICAgcmMgPSBsaWJ4bF9fZXZfcW1wX3NlbmQoZWdjLCAmZG1z
cy0+cW1wLCAicXVlcnktc3RhdHVzIiwgTlVMTCk7CiAgICAgICAgIGlmIChyYykgZ290byBvdXRf
Y2xvc2U7CiAgICAgfQogCkBAIC0yODA4LDcgKzI4MDgsNyBAQCBzdGF0aWMgdm9pZCBkZXZpY2Vf
bW9kZWxfc3Bhd25fb3V0Y29tZShsaWJ4bF9fZWdjICplZ2MsCiAgICAgICAgIGRtc3MtPnFtcC5k
b21pZCA9IGRtc3MtPmd1ZXN0X2RvbWlkOwogICAgICAgICBkbXNzLT5xbXAucGF5bG9hZF9mZCA9
IC0xOwogICAgICAgICBkbXNzLT5xbXAuY2FsbGJhY2sgPSBkZXZpY2VfbW9kZWxfcG9zdGNvbmZp
Z19jaGFyZGV2OwotICAgICAgICByYyA9IGxpYnhsX19ldl9xbXBfc2VuZChnYywgJmRtc3MtPnFt
cCwgInF1ZXJ5LWNoYXJkZXYiLCBOVUxMKTsKKyAgICAgICAgcmMgPSBsaWJ4bF9fZXZfcW1wX3Nl
bmQoZWdjLCAmZG1zcy0+cW1wLCAicXVlcnktY2hhcmRldiIsIE5VTEwpOwogICAgICAgICBpZiAo
cmMpIGdvdG8gb3V0OwogICAgICAgICByZXR1cm47CiAgICAgfQpAQCAtMjg4MCw3ICsyODgwLDcg
QEAgc3RhdGljIHZvaWQgZGV2aWNlX21vZGVsX3Bvc3Rjb25maWdfY2hhcmRldihsaWJ4bF9fZWdj
ICplZ2MsCiAgICAgfQogCiAgICAgcW1wLT5jYWxsYmFjayA9IGRldmljZV9tb2RlbF9wb3N0Y29u
ZmlnX3ZuYzsKLSAgICByYyA9IGxpYnhsX19ldl9xbXBfc2VuZChnYywgcW1wLCAicXVlcnktdm5j
IiwgTlVMTCk7CisgICAgcmMgPSBsaWJ4bF9fZXZfcW1wX3NlbmQoZWdjLCBxbXAsICJxdWVyeS12
bmMiLCBOVUxMKTsKICAgICBpZiAocmMpIGdvdG8gb3V0OwogICAgIHJldHVybjsKIApAQCAtMjk0
MCw3ICsyOTQwLDcgQEAgc3RhdGljIHZvaWQgZGV2aWNlX21vZGVsX3Bvc3Rjb25maWdfdm5jKGxp
YnhsX19lZ2MgKmVnYywKICAgICBpZiAodm5jICYmIHZuYy0+cGFzc3dkKSB7CiAgICAgICAgIHFt
cC0+Y2FsbGJhY2sgPSBkZXZpY2VfbW9kZWxfcG9zdGNvbmZpZ192bmNfcGFzc3dkOwogICAgICAg
ICBsaWJ4bF9fcW1wX3BhcmFtX2FkZF9zdHJpbmcoZ2MsICZhcmdzLCAicGFzc3dvcmQiLCB2bmMt
PnBhc3N3ZCk7Ci0gICAgICAgIHJjID0gbGlieGxfX2V2X3FtcF9zZW5kKGdjLCBxbXAsICJjaGFu
Z2Utdm5jLXBhc3N3b3JkIiwgYXJncyk7CisgICAgICAgIHJjID0gbGlieGxfX2V2X3FtcF9zZW5k
KGVnYywgcW1wLCAiY2hhbmdlLXZuYy1wYXNzd29yZCIsIGFyZ3MpOwogICAgICAgICBpZiAocmMp
IGdvdG8gb3V0OwogICAgICAgICByZXR1cm47CiAgICAgfQpkaWZmIC0tZ2l0IGEvdG9vbHMvbGli
eGwvbGlieGxfZG9tX3NhdmUuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbV9zYXZlLmMKaW5kZXgg
ZTcwYWExNTg1OTc2Li42NTYxMGU2MDU1YTcgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhs
X2RvbV9zYXZlLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfZG9tX3NhdmUuYwpAQCAtMjI2LDcg
KzIyNiw3IEBAIHN0YXRpYyB2b2lkIGRvbWFpbl9zdXNwZW5kX3N3aXRjaF9xZW11X3hlbl9sb2dk
aXJ0eQogICAgIHFtcC0+cGF5bG9hZF9mZCA9IC0xOwogICAgIHFtcC0+Y2FsbGJhY2sgPSBzd2l0
Y2hfcWVtdV94ZW5fbG9nZGlydHlfZG9uZTsKICAgICBsaWJ4bF9fcW1wX3BhcmFtX2FkZF9ib29s
KGdjLCAmYXJncywgImVuYWJsZSIsIGVuYWJsZSk7Ci0gICAgcmMgPSBsaWJ4bF9fZXZfcW1wX3Nl
bmQoZ2MsIHFtcCwgInhlbi1zZXQtZ2xvYmFsLWRpcnR5LWxvZyIsIGFyZ3MpOworICAgIHJjID0g
bGlieGxfX2V2X3FtcF9zZW5kKGVnYywgcW1wLCAieGVuLXNldC1nbG9iYWwtZGlydHktbG9nIiwg
YXJncyk7CiAgICAgaWYgKHJjKSBnb3RvIG91dDsKIAogICAgIHJldHVybjsKZGlmZiAtLWdpdCBh
L3Rvb2xzL2xpYnhsL2xpYnhsX2RvbV9zdXNwZW5kLmMgYi90b29scy9saWJ4bC9saWJ4bF9kb21f
c3VzcGVuZC5jCmluZGV4IDI0OGRiYzMzZTM4NC4uOTQwYWMzMzRmNGIxIDEwMDY0NAotLS0gYS90
b29scy9saWJ4bC9saWJ4bF9kb21fc3VzcGVuZC5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2Rv
bV9zdXNwZW5kLmMKQEAgLTU0NSw3ICs1NDUsNyBAQCB2b2lkIGxpYnhsX19kbV9yZXN1bWUobGli
eGxfX2VnYyAqZWdjLAogICAgICAgICBxbXAtPmRvbWlkID0gZG9taWQ7CiAgICAgICAgIHFtcC0+
Y2FsbGJhY2sgPSBkbV9yZXN1bWVfcW1wX2RvbmU7CiAgICAgICAgIHFtcC0+cGF5bG9hZF9mZCA9
IC0xOwotICAgICAgICByYyA9IGxpYnhsX19ldl9xbXBfc2VuZChnYywgcW1wLCAiY29udCIsIE5V
TEwpOworICAgICAgICByYyA9IGxpYnhsX19ldl9xbXBfc2VuZChlZ2MsIHFtcCwgImNvbnQiLCBO
VUxMKTsKICAgICAgICAgaWYgKHJjKSBnb3RvIG91dDsKICAgICAgICAgYnJlYWs7CiAgICAgZGVm
YXVsdDoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jIGIvdG9vbHMvbGli
eGwvbGlieGxfZG9tYWluLmMKaW5kZXggOWQwZWI1YWVkMTFkLi42MjFkZjMyYzVkZDggMTAwNjQ0
Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhs
X2RvbWFpbi5jCkBAIC0xNjAwLDcgKzE2MDAsNyBAQCBpbnQgbGlieGxfc2V0X3ZjcHVvbmxpbmUo
bGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkLAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgTElCWExfUU1QX0NNRF9USU1FT1VUICogMTAwMCk7CiAgICAg
ICAgICAgICBpZiAocmMpIGdvdG8gb3V0OwogICAgICAgICAgICAgcW1wLT5jYWxsYmFjayA9IHNl
dF92Y3B1b25saW5lX3FtcF9jcHVzX3F1ZXJpZWQ7Ci0gICAgICAgICAgICByYyA9IGxpYnhsX19l
dl9xbXBfc2VuZChnYywgcW1wLCAicXVlcnktY3B1cyIsIE5VTEwpOworICAgICAgICAgICAgcmMg
PSBsaWJ4bF9fZXZfcW1wX3NlbmQoZWdjLCBxbXAsICJxdWVyeS1jcHVzIiwgTlVMTCk7CiAgICAg
ICAgICAgICBpZiAocmMpIGdvdG8gb3V0OwogICAgICAgICAgICAgcmV0dXJuIEFPX0lOUFJPR1JF
U1M7CiAgICAgICAgIGRlZmF1bHQ6CkBAIC0xNjY2LDcgKzE2NjYsNyBAQCBzdGF0aWMgdm9pZCBz
ZXRfdmNwdW9ubGluZV9xbXBfYWRkX2NwdShsaWJ4bF9fZWdjICplZ2MsCiAgICAgICAgIGlmIChs
aWJ4bF9iaXRtYXBfdGVzdChtYXAsIHN2b3MtPmluZGV4KSkgewogICAgICAgICAgICAgcW1wLT5j
YWxsYmFjayA9IHNldF92Y3B1b25saW5lX3FtcF9hZGRfY3B1OwogICAgICAgICAgICAgbGlieGxf
X3FtcF9wYXJhbV9hZGRfaW50ZWdlcihnYywgJmFyZ3MsICJpZCIsIHN2b3MtPmluZGV4KTsKLSAg
ICAgICAgICAgIHJjID0gbGlieGxfX2V2X3FtcF9zZW5kKGdjLCBxbXAsICJjcHUtYWRkIiwgYXJn
cyk7CisgICAgICAgICAgICByYyA9IGxpYnhsX19ldl9xbXBfc2VuZChlZ2MsIHFtcCwgImNwdS1h
ZGQiLCBhcmdzKTsKICAgICAgICAgICAgIGlmIChyYykgZ290byBvdXQ7CiAgICAgICAgICAgICBy
ZXR1cm47CiAgICAgICAgIH0KQEAgLTE3NDAsNyArMTc0MCw3IEBAIHN0YXRpYyB2b2lkIGRvbWFp
bl9zM19yZXN1bWUobGlieGxfX2FvICphbywgbGlieGxfX2VnYyAqZWdjLCBpbnQgZG9taWQpCiAg
ICAgICAgICAgICB9CiAgICAgICAgICAgICBicmVhazsKICAgICAgICAgY2FzZSBMSUJYTF9ERVZJ
Q0VfTU9ERUxfVkVSU0lPTl9RRU1VX1hFTjoKLSAgICAgICAgICAgIHJjID0gbGlieGxfX2V2X3Ft
cF9zZW5kKGdjLCBxbXAsICJzeXN0ZW1fd2FrZXVwIiwgTlVMTCk7CisgICAgICAgICAgICByYyA9
IGxpYnhsX19ldl9xbXBfc2VuZChlZ2MsIHFtcCwgInN5c3RlbV93YWtldXAiLCBOVUxMKTsKICAg
ICAgICAgICAgIGlmIChyYykgZ290byBvdXQ7CiAgICAgICAgICAgICByZXR1cm47CiAgICAgICAg
IGRlZmF1bHQ6CkBAIC0xOTU4LDcgKzE5NTgsNyBAQCBzdGF0aWMgdm9pZCByZXRyaWV2ZV9kb21h
aW5fY29uZmlndXJhdGlvbl9sb2NrX2FjcXVpcmVkKAogICAgICAgICBsaWJ4bF9iaXRtYXBfYWxs
b2MoQ1RYLCAmcmRjcy0+cWVtdXVfY3B1cywKICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRf
Y29uZmlnLT5iX2luZm8ubWF4X3ZjcHVzKTsKICAgICAgICAgcmRjcy0+cW1wLmNhbGxiYWNrID0g
cmV0cmlldmVfZG9tYWluX2NvbmZpZ3VyYXRpb25fY3B1X3F1ZXJpZWQ7Ci0gICAgICAgIHJjID0g
bGlieGxfX2V2X3FtcF9zZW5kKGdjLCAmcmRjcy0+cW1wLCAicXVlcnktY3B1cyIsIE5VTEwpOwor
ICAgICAgICByYyA9IGxpYnhsX19ldl9xbXBfc2VuZChlZ2MsICZyZGNzLT5xbXAsICJxdWVyeS1j
cHVzIiwgTlVMTCk7CiAgICAgICAgIGlmIChyYykgZ290byBvdXQ7CiAgICAgICAgIGhhc19jYWxs
YmFjayA9IHRydWU7CiAgICAgfQpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJu
YWwuaCBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKaW5kZXggMTE1Yzc5ZDAzNGQ0Li5l
ZjY2NTU1ODdiNzkgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKKysr
IGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaApAQCAtNDIxLDcgKzQyMSw3IEBAIHR5cGVk
ZWYgdm9pZCBsaWJ4bF9fZXZfcW1wX2NhbGxiYWNrKGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX2V2
X3FtcCAqZXYsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgcmMpOwog
CiBfaGlkZGVuIHZvaWQgbGlieGxfX2V2X3FtcF9pbml0KGxpYnhsX19ldl9xbXAgKmV2KTsKLV9o
aWRkZW4gaW50IGxpYnhsX19ldl9xbXBfc2VuZChsaWJ4bF9fZ2MgKmdjLCBsaWJ4bF9fZXZfcW1w
ICpldiwKK19oaWRkZW4gaW50IGxpYnhsX19ldl9xbXBfc2VuZChsaWJ4bF9fZWdjICplZ2MsIGxp
YnhsX19ldl9xbXAgKmV2LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNo
YXIgKmNtZCwgbGlieGxfX2pzb25fb2JqZWN0ICphcmdzKTsKIF9oaWRkZW4gdm9pZCBsaWJ4bF9f
ZXZfcW1wX2Rpc3Bvc2UobGlieGxfX2djICpnYywgbGlieGxfX2V2X3FtcCAqZXYpOwogCmRpZmYg
LS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9wY2kuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3BjaS5j
CmluZGV4IGI1NDQ0ZDE1NTIzYS4uMGRjNGE4M2UxNjZkIDEwMDY0NAotLS0gYS90b29scy9saWJ4
bC9saWJ4bF9wY2kuYworKysgYi90b29scy9saWJ4bC9saWJ4bF9wY2kuYwpAQCAtMTE2Myw3ICsx
MTYzLDcgQEAgc3RhdGljIHZvaWQgcGNpX2FkZF9xbXBfZGV2aWNlX2FkZChsaWJ4bF9fZWdjICpl
Z2MsIHBjaV9hZGRfc3RhdGUgKnBhcykKICAgICBxbXAtPmRvbWlkID0gZG9taWQ7CiAgICAgcW1w
LT5wYXlsb2FkX2ZkID0gLTE7CiAgICAgcW1wLT5jYWxsYmFjayA9IHBjaV9hZGRfcW1wX2Rldmlj
ZV9hZGRfY2I7Ci0gICAgcmMgPSBsaWJ4bF9fZXZfcW1wX3NlbmQoZ2MsIHFtcCwgImRldmljZV9h
ZGQiLCBhcmdzKTsKKyAgICByYyA9IGxpYnhsX19ldl9xbXBfc2VuZChlZ2MsIHFtcCwgImRldmlj
ZV9hZGQiLCBhcmdzKTsKICAgICBpZiAocmMpIGdvdG8gb3V0OwogICAgIHJldHVybjsKIApAQCAt
MTE4Miw3ICsxMTgyLDcgQEAgc3RhdGljIHZvaWQgcGNpX2FkZF9xbXBfZGV2aWNlX2FkZF9jYihs
aWJ4bF9fZWdjICplZ2MsCiAgICAgaWYgKHJjKSBnb3RvIG91dDsKIAogICAgIHFtcC0+Y2FsbGJh
Y2sgPSBwY2lfYWRkX3FtcF9xdWVyeV9wY2lfY2I7Ci0gICAgcmMgPSBsaWJ4bF9fZXZfcW1wX3Nl
bmQoZ2MsIHFtcCwgInF1ZXJ5LXBjaSIsIE5VTEwpOworICAgIHJjID0gbGlieGxfX2V2X3FtcF9z
ZW5kKGVnYywgcW1wLCAicXVlcnktcGNpIiwgTlVMTCk7CiAgICAgaWYgKHJjKSBnb3RvIG91dDsK
ICAgICByZXR1cm47CiAKQEAgLTE5OTcsNyArMTk5Nyw3IEBAIHN0YXRpYyB2b2lkIHBjaV9yZW1v
dmVfcW1wX2RldmljZV9kZWwobGlieGxfX2VnYyAqZWdjLAogICAgIFFNUF9QQVJBTUVURVJTX1NQ
UklOVEYoJmFyZ3MsICJpZCIsIFBDSV9QVF9RREVWX0lELAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGNpZGV2LT5idXMsIHBjaWRldi0+ZGV2LCBwY2lkZXYtPmZ1bmMpOwogICAgIHBycy0+
cW1wLmNhbGxiYWNrID0gcGNpX3JlbW92ZV9xbXBfZGV2aWNlX2RlbF9jYjsKLSAgICByYyA9IGxp
YnhsX19ldl9xbXBfc2VuZChnYywgJnBycy0+cW1wLCAiZGV2aWNlX2RlbCIsIGFyZ3MpOworICAg
IHJjID0gbGlieGxfX2V2X3FtcF9zZW5kKGVnYywgJnBycy0+cW1wLCAiZGV2aWNlX2RlbCIsIGFy
Z3MpOwogICAgIGlmIChyYykgZ290byBvdXQ7CiAgICAgcmV0dXJuOwogCkBAIC0yMDM2LDcgKzIw
MzYsNyBAQCBzdGF0aWMgdm9pZCBwY2lfcmVtb3ZlX3FtcF9yZXRyeV90aW1lcl9jYihsaWJ4bF9f
ZWdjICplZ2MsIGxpYnhsX19ldl90aW1lICpldiwKICAgICBwY2lfcmVtb3ZlX3N0YXRlICpwcnMg
PSBDT05UQUlORVJfT0YoZXYsICpwcnMsIHJldHJ5X3RpbWVyKTsKIAogICAgIHBycy0+cW1wLmNh
bGxiYWNrID0gcGNpX3JlbW92ZV9xbXBfcXVlcnlfY2I7Ci0gICAgcmMgPSBsaWJ4bF9fZXZfcW1w
X3NlbmQoZ2MsICZwcnMtPnFtcCwgInF1ZXJ5LXBjaSIsIE5VTEwpOworICAgIHJjID0gbGlieGxf
X2V2X3FtcF9zZW5kKGVnYywgJnBycy0+cW1wLCAicXVlcnktcGNpIiwgTlVMTCk7CiAgICAgaWYg
KHJjKSBnb3RvIG91dDsKICAgICByZXR1cm47CiAKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xp
YnhsX3FtcC5jIGIvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMKaW5kZXggOWFhYmFkNzRmYWJkLi5m
MGUwYjUwYmQxYzUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX3FtcC5jCisrKyBiL3Rv
b2xzL2xpYnhsL2xpYnhsX3FtcC5jCkBAIC05MjQsNyArOTI0LDcgQEAgaW50IGxpYnhsX3FlbXVf
bW9uaXRvcl9jb21tYW5kKGxpYnhsX2N0eCAqY3R4LCB1aW50MzJfdCBkb21pZCwKICAgICBxbWNz
LT5xbXAuY2FsbGJhY2sgPSBxZW11X21vbml0b3JfY29tbWFuZF9kb25lOwogICAgIHFtY3MtPm91
dHB1dCA9IG91dHB1dDsKICAgICBsaWJ4bF9fcW1wX3BhcmFtX2FkZF9zdHJpbmcoZ2MsICZhcmdz
LCAiY29tbWFuZC1saW5lIiwgY29tbWFuZF9saW5lKTsKLSAgICByYyA9IGxpYnhsX19ldl9xbXBf
c2VuZChnYywgJnFtY3MtPnFtcCwgImh1bWFuLW1vbml0b3ItY29tbWFuZCIsIGFyZ3MpOworICAg
IHJjID0gbGlieGxfX2V2X3FtcF9zZW5kKGVnYywgJnFtY3MtPnFtcCwgImh1bWFuLW1vbml0b3It
Y29tbWFuZCIsIGFyZ3MpOwogb3V0OgogICAgIGlmIChyYykgcmV0dXJuIEFPX0NSRUFURV9GQUlM
KHJjKTsKICAgICByZXR1cm4gQU9fSU5QUk9HUkVTUzsKQEAgLTk3OCw3ICs5NzgsNyBAQCB2b2lk
IGxpYnhsX19xbXBfc3VzcGVuZF9zYXZlKGxpYnhsX19lZ2MgKmVnYywKICAgICBldi0+Y2FsbGJh
Y2sgPSBkbV9zdG9wcGVkOwogICAgIGV2LT5wYXlsb2FkX2ZkID0gLTE7CiAKLSAgICByYyA9IGxp
YnhsX19ldl9xbXBfc2VuZChnYywgZXYsICJzdG9wIiwgTlVMTCk7CisgICAgcmMgPSBsaWJ4bF9f
ZXZfcW1wX3NlbmQoZWdjLCBldiwgInN0b3AiLCBOVUxMKTsKICAgICBpZiAocmMpCiAgICAgICAg
IGdvdG8gZXJyb3I7CiAKQEAgLTEwMDcsNyArMTAwNyw3IEBAIHN0YXRpYyB2b2lkIGRtX3N0b3Bw
ZWQobGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9fZXZfcW1wICpldiwKICAgICB9CiAKICAgICBldi0+
Y2FsbGJhY2sgPSBkbV9zdGF0ZV9mZF9yZWFkeTsKLSAgICByYyA9IGxpYnhsX19ldl9xbXBfc2Vu
ZChnYywgZXYsICJhZGQtZmQiLCBOVUxMKTsKKyAgICByYyA9IGxpYnhsX19ldl9xbXBfc2VuZChl
Z2MsIGV2LCAiYWRkLWZkIiwgTlVMTCk7CiAgICAgaWYgKHJjKQogICAgICAgICBnb3RvIGVycm9y
OwogCkBAIC0xMDUyLDcgKzEwNTIsNyBAQCBzdGF0aWMgdm9pZCBkbV9zdGF0ZV9mZF9yZWFkeShs
aWJ4bF9fZWdjICplZ2MsIGxpYnhsX19ldl9xbXAgKmV2LAogICAgIGlmIChxbXBfZXZfcWVtdV9j
b21wYXJlX3ZlcnNpb24oZXYsIDIsIDExLCAwKSA+PSAwKQogICAgICAgICBsaWJ4bF9fcW1wX3Bh
cmFtX2FkZF9ib29sKGdjLCAmYXJncywgImxpdmUiLCBkc3BzLT5saXZlKTsKICAgICBRTVBfUEFS
QU1FVEVSU19TUFJJTlRGKCZhcmdzLCAiZmlsZW5hbWUiLCAiL2Rldi9mZHNldC8lZCIsIGZkc2V0
KTsKLSAgICByYyA9IGxpYnhsX19ldl9xbXBfc2VuZChnYywgZXYsICJ4ZW4tc2F2ZS1kZXZpY2Vz
LXN0YXRlIiwgYXJncyk7CisgICAgcmMgPSBsaWJ4bF9fZXZfcW1wX3NlbmQoZWdjLCBldiwgInhl
bi1zYXZlLWRldmljZXMtc3RhdGUiLCBhcmdzKTsKICAgICBpZiAocmMpCiAgICAgICAgIGdvdG8g
ZXJyb3I7CiAKQEAgLTE3ODEsNyArMTc4MSw3IEBAIHZvaWQgbGlieGxfX2V2X3FtcF9pbml0KGxp
YnhsX19ldl9xbXAgKmV2KQogICAgIGV2LT5xZW11X3ZlcnNpb24ubWljcm8gPSAtMTsKIH0KIAot
aW50IGxpYnhsX19ldl9xbXBfc2VuZChsaWJ4bF9fZ2MgKnVudXNlZF9nYywgbGlieGxfX2V2X3Ft
cCAqZXYsCitpbnQgbGlieGxfX2V2X3FtcF9zZW5kKGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX2V2
X3FtcCAqZXYsCiAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKmNtZCwgbGlieGxf
X2pzb25fb2JqZWN0ICphcmdzKQogICAgIC8qIGRpc2Nvbm5lY3RlZCAtPiBjb25uZWN0aW5nCiAg
ICAgICogY29ubmVjdGVkIC0+IHdhaXRpbmdfcmVwbHkgKHdpdGggbXNnIHNldCkKZGlmZiAtLWdp
dCBhL3Rvb2xzL2xpYnhsL2xpYnhsX3VzYi5jIGIvdG9vbHMvbGlieGwvbGlieGxfdXNiLmMKaW5k
ZXggMWZjN2NjZjQxZjg2Li5kYTVlMzcwOGU2Y2YgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xp
YnhsX3VzYi5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3VzYi5jCkBAIC0zNDksOSArMzQ5LDEw
IEBAIHN0YXRpYyBjaGFyICpwdnVzYl9nZXRfZGV2aWNlX3R5cGUobGlieGxfdXNiY3RybF90eXBl
IHR5cGUpCiAgKiAtIHVzYi1laGNpICAgICAgICh2ZXJzaW9uPTIpLCBhbHdheXMgNiBwb3J0cwog
ICogLSBuZWMtdXNiLXhoY2kgICAodmVyc2lvbj0zKSwgdXAgdG8gMTUgcG9ydHMKICAqLwotc3Rh
dGljIGludCBsaWJ4bF9fZGV2aWNlX3VzYmN0cmxfYWRkX2h2bShsaWJ4bF9fZ2MgKmdjLCBsaWJ4
bF9fZXZfcW1wICpxbXAsCitzdGF0aWMgaW50IGxpYnhsX19kZXZpY2VfdXNiY3RybF9hZGRfaHZt
KGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX2V2X3FtcCAqcW1wLAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9kZXZpY2VfdXNiY3RybCAqdXNiY3RybCkKIHsK
KyAgICBFR0NfR0M7CiAgICAgbGlieGxfX2pzb25fb2JqZWN0ICpxbXBfYXJncyA9IE5VTEw7CiAK
ICAgICBzd2l0Y2ggKHVzYmN0cmwtPnZlcnNpb24pIHsKQEAgLTM3OCwyNiArMzc5LDI4IEBAIHN0
YXRpYyBpbnQgbGlieGxfX2RldmljZV91c2JjdHJsX2FkZF9odm0obGlieGxfX2djICpnYywgbGli
eGxfX2V2X3FtcCAqcW1wLAogICAgIGxpYnhsX19xbXBfcGFyYW1fYWRkX3N0cmluZyhnYywgJnFt
cF9hcmdzLCAiaWQiLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHQ1NQUklOVEYo
InhlbnVzYi0lZCIsIHVzYmN0cmwtPmRldmlkKSk7CiAKLSAgICByZXR1cm4gbGlieGxfX2V2X3Ft
cF9zZW5kKGdjLCBxbXAsICJkZXZpY2VfYWRkIiwgcW1wX2FyZ3MpOworICAgIHJldHVybiBsaWJ4
bF9fZXZfcW1wX3NlbmQoZWdjLCBxbXAsICJkZXZpY2VfYWRkIiwgcW1wX2FyZ3MpOwogfQogCiAv
KiBTZW5kIHFtcCBjb21tYW5kcyB0byBkZWxldGUgYSB1c2IgY29udHJvbGxlciBpbiBxZW11LiAg
Ki8KLXN0YXRpYyBpbnQgbGlieGxfX2RldmljZV91c2JjdHJsX2RlbF9odm0obGlieGxfX2djICpn
YywKK3N0YXRpYyBpbnQgbGlieGxfX2RldmljZV91c2JjdHJsX2RlbF9odm0obGlieGxfX2VnYyAq
ZWdjLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9fZXZf
cW1wICpxbXAsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBk
ZXZpZCkKIHsKKyAgICBFR0NfR0M7CiAgICAgbGlieGxfX2pzb25fb2JqZWN0ICpxbXBfYXJncyA9
IE5VTEw7CiAKICAgICBsaWJ4bF9fcW1wX3BhcmFtX2FkZF9zdHJpbmcoZ2MsICZxbXBfYXJncywK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImlkIiwgR0NTUFJJTlRGKCJ4ZW51c2It
JWQiLCBkZXZpZCkpOwogCi0gICAgcmV0dXJuIGxpYnhsX19ldl9xbXBfc2VuZChnYywgcW1wLCAi
ZGV2aWNlX2RlbCIsIHFtcF9hcmdzKTsKKyAgICByZXR1cm4gbGlieGxfX2V2X3FtcF9zZW5kKGVn
YywgcW1wLCAiZGV2aWNlX2RlbCIsIHFtcF9hcmdzKTsKIH0KIAogLyogU2VuZCBxbXAgY29tbWFu
ZHMgdG8gY3JlYXRlIGEgdXNiIGRldmljZSBpbiBxZW11LiAqLwotc3RhdGljIGludCBsaWJ4bF9f
ZGV2aWNlX3VzYmRldl9hZGRfaHZtKGxpYnhsX19nYyAqZ2MsIGxpYnhsX19ldl9xbXAgKnFtcCwK
K3N0YXRpYyBpbnQgbGlieGxfX2RldmljZV91c2JkZXZfYWRkX2h2bShsaWJ4bF9fZWdjICplZ2Ms
IGxpYnhsX19ldl9xbXAgKnFtcCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBsaWJ4bF9kZXZpY2VfdXNiZGV2ICp1c2JkZXYpCiB7CisgICAgRUdDX0dDOwogICAgIGxp
YnhsX19qc29uX29iamVjdCAqcW1wX2FyZ3MgPSBOVUxMOwogCiAgICAgbGlieGxfX3FtcF9wYXJh
bV9hZGRfc3RyaW5nKGdjLCAmcW1wX2FyZ3MsICJpZCIsCkBAIC00MTMsMjAgKzQxNiwyMSBAQCBz
dGF0aWMgaW50IGxpYnhsX19kZXZpY2VfdXNiZGV2X2FkZF9odm0obGlieGxfX2djICpnYywgbGli
eGxfX2V2X3FtcCAqcW1wLAogICAgIGxpYnhsX19xbXBfcGFyYW1fYWRkX3N0cmluZyhnYywgJnFt
cF9hcmdzLCAiaG9zdGFkZHIiLAogICAgICAgICBHQ1NQUklOVEYoIiVkIiwgdXNiZGV2LT51Lmhv
c3RkZXYuaG9zdGFkZHIpKTsKIAotICAgIHJldHVybiBsaWJ4bF9fZXZfcW1wX3NlbmQoZ2MsIHFt
cCwgImRldmljZV9hZGQiLCBxbXBfYXJncyk7CisgICAgcmV0dXJuIGxpYnhsX19ldl9xbXBfc2Vu
ZChlZ2MsIHFtcCwgImRldmljZV9hZGQiLCBxbXBfYXJncyk7CiB9CiAKIC8qIFNlbmQgcW1wIGNv
bW1hbmRzIHRvIGRlbGV0ZSBhIHVzYiBkZXZpY2UgaW4gcWVtdS4gKi8KLXN0YXRpYyBpbnQgbGli
eGxfX2RldmljZV91c2JkZXZfZGVsX2h2bShsaWJ4bF9fZ2MgKmdjLCBsaWJ4bF9fZXZfcW1wICpx
bXAsCitzdGF0aWMgaW50IGxpYnhsX19kZXZpY2VfdXNiZGV2X2RlbF9odm0obGlieGxfX2VnYyAq
ZWdjLCBsaWJ4bF9fZXZfcW1wICpxbXAsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbGlieGxfZGV2aWNlX3VzYmRldiAqdXNiZGV2KQogeworICAgIEVHQ19HQzsKICAg
ICBsaWJ4bF9fanNvbl9vYmplY3QgKnFtcF9hcmdzID0gTlVMTDsKIAogICAgIGxpYnhsX19xbXBf
cGFyYW1fYWRkX3N0cmluZyhnYywgJnFtcF9hcmdzLCAiaWQiLAogICAgICAgICBHQ1NQUklOVEYo
InhlbnVzYi0lZC0lZCIsIHVzYmRldi0+dS5ob3N0ZGV2Lmhvc3RidXMsCiAgICAgICAgICAgICAg
ICAgICB1c2JkZXYtPnUuaG9zdGRldi5ob3N0YWRkcikpOwogCi0gICAgcmV0dXJuIGxpYnhsX19l
dl9xbXBfc2VuZChnYywgcW1wLCAiZGV2aWNlX2RlbCIsIHFtcF9hcmdzKTsKKyAgICByZXR1cm4g
bGlieGxfX2V2X3FtcF9zZW5kKGVnYywgcW1wLCAiZGV2aWNlX2RlbCIsIHFtcF9hcmdzKTsKIH0K
IAogc3RhdGljIExJQlhMX0RFRklORV9VUERBVEVfREVWSUQodXNiY3RybCkKQEAgLTQ5MCw3ICs0
OTQsNyBAQCBzdGF0aWMgdm9pZCBsaWJ4bF9fZGV2aWNlX3VzYmN0cmxfYWRkKGxpYnhsX19lZ2Mg
KmVnYywgdWludDMyX3QgZG9taWQsCiAgICAgICAgIHFtcC0+ZG9taWQgPSBkb21pZDsKICAgICAg
ICAgcW1wLT5wYXlsb2FkX2ZkID0gLTE7CiAgICAgICAgIHFtcC0+Y2FsbGJhY2sgPSBkZXZpY2Vf
dXNiY3RybF9hZGRfcW1wX2NiOwotICAgICAgICByYyA9IGxpYnhsX19kZXZpY2VfdXNiY3RybF9h
ZGRfaHZtKGdjLCBxbXAsIHVzYmN0cmwpOworICAgICAgICByYyA9IGxpYnhsX19kZXZpY2VfdXNi
Y3RybF9hZGRfaHZtKGVnYywgcW1wLCB1c2JjdHJsKTsKICAgICAgICAgaWYgKHJjKSBnb3RvIG91
dHJtOwogICAgICAgICByZXR1cm47CiAgICAgfQpAQCAtNjQ3LDcgKzY1MSw3IEBAIHN0YXRpYyB2
b2lkIGRldmljZV91c2JjdHJsX3VzYmRldnNfcmVtb3ZlZChsaWJ4bF9fZWdjICplZ2MsCiAgICAg
ICAgIHFtcC0+ZG9taWQgPSBhb2Rldi0+ZGV2LT5kb21pZDsKICAgICAgICAgcW1wLT5jYWxsYmFj
ayA9IGRldmljZV91c2JjdHJsX3JlbW92ZV9xbXBfY2I7CiAgICAgICAgIHFtcC0+cGF5bG9hZF9m
ZCA9IC0xOwotICAgICAgICByYyA9IGxpYnhsX19kZXZpY2VfdXNiY3RybF9kZWxfaHZtKGdjLCBx
bXAsIGFvZGV2LT5kZXYtPmRldmlkKTsKKyAgICAgICAgcmMgPSBsaWJ4bF9fZGV2aWNlX3VzYmN0
cmxfZGVsX2h2bShlZ2MsIHFtcCwgYW9kZXYtPmRldi0+ZGV2aWQpOwogICAgICAgICBpZiAocmMp
IGdvdG8gb3V0OwogICAgICAgICByZXR1cm47CiAgICAgfQpAQCAtMTc5Nyw3ICsxODAxLDcgQEAg
c3RhdGljIHZvaWQgbGlieGxfX2RldmljZV91c2JkZXZfYWRkKGxpYnhsX19lZ2MgKmVnYywgdWlu
dDMyX3QgZG9taWQsCiAgICAgICAgIGFvZGV2LT5xbXAuZG9taWQgPSBkb21pZDsKICAgICAgICAg
YW9kZXYtPnFtcC5jYWxsYmFjayA9IGRldmljZV91c2JkZXZfYWRkX3FtcF9jYjsKICAgICAgICAg
YW9kZXYtPnFtcC5wYXlsb2FkX2ZkID0gLTE7Ci0gICAgICAgIHJjID0gbGlieGxfX2RldmljZV91
c2JkZXZfYWRkX2h2bShnYywgJmFvZGV2LT5xbXAsIHVzYmRldik7CisgICAgICAgIHJjID0gbGli
eGxfX2RldmljZV91c2JkZXZfYWRkX2h2bShlZ2MsICZhb2Rldi0+cW1wLCB1c2JkZXYpOwogICAg
ICAgICBpZiAocmMpIHsKICAgICAgICAgICAgIGxpYnhsX19kZXZpY2VfdXNiZGV2X3JlbW92ZV94
ZW5zdG9yZShnYywgZG9taWQsIHVzYmRldiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIExJQlhMX1VTQkNUUkxfVFlQRV9ERVZJQ0VNT0RFTCk7CkBAIC0xOTc5
LDcgKzE5ODMsNyBAQCBzdGF0aWMgdm9pZCBsaWJ4bF9fZGV2aWNlX3VzYmRldl9yZW1vdmUobGli
eGxfX2VnYyAqZWdjLCB1aW50MzJfdCBkb21pZCwKICAgICAgICAgYW9kZXYtPnFtcC5kb21pZCA9
IGRvbWlkOwogICAgICAgICBhb2Rldi0+cW1wLmNhbGxiYWNrID0gZGV2aWNlX3VzYmRldl9yZW1v
dmVfcW1wX2NiOwogICAgICAgICBhb2Rldi0+cW1wLnBheWxvYWRfZmQgPSAtMTsKLSAgICAgICAg
cmMgPSBsaWJ4bF9fZGV2aWNlX3VzYmRldl9kZWxfaHZtKGdjLCAmYW9kZXYtPnFtcCwgdXNiZGV2
KTsKKyAgICAgICAgcmMgPSBsaWJ4bF9fZGV2aWNlX3VzYmRldl9kZWxfaHZtKGVnYywgJmFvZGV2
LT5xbXAsIHVzYmRldik7CiAgICAgICAgIGlmIChyYykgewogICAgICAgICAgICAgbGlieGxfX2Rl
dmljZV91c2JkZXZfYWRkX3hlbnN0b3JlKGdjLCBkb21pZCwgdXNiZGV2LAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIExJQlhMX1VTQkNUUkxfVFlQRV9ERVZJ
Q0VNT0RFTCwKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
