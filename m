Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B73A1BC6F2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 13:35:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCj2R-000773-3P; Tue, 24 Sep 2019 11:31:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LhKX=XT=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iCj2P-00075a-7E
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 11:31:21 +0000
X-Inumbo-ID: d213735a-debe-11e9-9616-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id d213735a-debe-11e9-9616-12813bfff9fa;
 Tue, 24 Sep 2019 11:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569324677;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V2U8e+HabmdsYmqhlEYja60hkM+cXhexkTTFzMhph6o=;
 b=AzWRIHCzIw4jdoDl3yOfRrs5zF1grQ4fEFmi0lDvBWQaJSs/9xY6lPGF
 8pk0/keOtsqXDS61mToqqyE2rx870l2xcrmK1l8fHPn+GjoUwYUHu0zXJ
 O6yoHH4X/CIJRXDgTtJtJtZUdcbMKaVUtluTcrPIk5CBmF5x4fACF9oSs o=;
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
IronPort-SDR: dTgdXBjAfZSQKKdPxguNNicmHzVINOidnNlI99CdZGJ1no/tvOOLuQmjLrEzZW3UrwZjZXNHDh
 3xCHu+LcGBgk0wjkYNN0lvqh558z5q4Z3nYwAX1PLxwe8ClA5hJk5iaboXAcQtDqaS0+S2q7ai
 4TEfUC/jzkqydd//J0Nc6qKXVa8QoCAwHds6+I3rKNxJzIqeJXbHg5Z2yqxRuxaNwUKj+MfdOx
 XOCWFcHysxuivn1dt9Nzyg0eSim+ca6zKg1zjVJtNJgZH8SpZDDBS95XHtZUmauqP1p8uxlvPO
 0xs=
X-SBRS: 2.7
X-MesageID: 5977600
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,543,1559534400"; 
   d="scan'208";a="5977600"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 24 Sep 2019 12:30:22 +0100
Message-ID: <20190924113026.255634-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924113026.255634-1-anthony.perard@citrix.com>
References: <20190924113026.255634-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PULL 3/7] xen: introduce separate XenWatchList for
 XenDevice objects
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KClRoaXMgcGF0Y2gg
dXNlcyB0aGUgWGVuV2F0Y2hMaXN0IGFic3RyYWN0aW9uIHRvIGFkZCBhIHNlcGFyYXRlIHdhdGNo
IGxpc3QKZm9yIGVhY2ggZGV2aWNlLiBUaGlzIGlzIG1vcmUgc2NhbGFibGUgdGhhbiB3YWxraW5n
IGEgc2luZ2xlIG5vdGlmaWVyCmxpc3QgZm9yIGFsbCB3YXRjaGVzIGFuZCBpcyBhbHNvIG5lY2Vz
c2FyeSB0byBpbXBsZW1lbnQgYSBidWctZml4IGluIGEKc3Vic2VxdWVudCBwYXRjaC4KClNpZ25l
ZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+ClJldmlld2Vk
LWJ5OiBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KTWVzc2FnZS1J
ZDogPDIwMTkwOTEzMDgyMTU5LjMxMzM4LTMtcGF1bC5kdXJyYW50QGNpdHJpeC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0K
IGh3L3hlbi90cmFjZS1ldmVudHMgICAgICB8ICAyICsrCiBody94ZW4veGVuLWJ1cy5jICAgICAg
ICAgfCA3MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCiBpbmNsdWRl
L2h3L3hlbi94ZW4tYnVzLmggfCAgMiArKwogMyBmaWxlcyBjaGFuZ2VkLCA2MiBpbnNlcnRpb25z
KCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ody94ZW4vdHJhY2UtZXZlbnRzIGIv
aHcveGVuL3RyYWNlLWV2ZW50cwppbmRleCBhYzhkOWMyMGQyLi44MGNlM2RhZmFkIDEwMDY0NAot
LS0gYS9ody94ZW4vdHJhY2UtZXZlbnRzCisrKyBiL2h3L3hlbi90cmFjZS1ldmVudHMKQEAgLTI5
LDYgKzI5LDggQEAgeGVuX2RldmljZV9iYWNrZW5kX2NoYW5nZWQoY29uc3QgY2hhciAqdHlwZSwg
Y2hhciAqbmFtZSkgInR5cGU6ICVzIG5hbWU6ICVzIgogeGVuX2RldmljZV9mcm9udGVuZF9zdGF0
ZShjb25zdCBjaGFyICp0eXBlLCBjaGFyICpuYW1lLCBjb25zdCBjaGFyICpzdGF0ZSkgInR5cGU6
ICVzIG5hbWU6ICVzIC0+ICVzIgogeGVuX2RldmljZV9mcm9udGVuZF9jaGFuZ2VkKGNvbnN0IGNo
YXIgKnR5cGUsIGNoYXIgKm5hbWUpICJ0eXBlOiAlcyBuYW1lOiAlcyIKIHhlbl9kZXZpY2VfdW5w
bHVnKGNvbnN0IGNoYXIgKnR5cGUsIGNoYXIgKm5hbWUpICJ0eXBlOiAlcyBuYW1lOiAlcyIKK3hl
bl9kZXZpY2VfYWRkX3dhdGNoKGNvbnN0IGNoYXIgKnR5cGUsIGNoYXIgKm5hbWUsIGNvbnN0IGNo
YXIgKm5vZGUsIGNvbnN0IGNoYXIgKmtleSkgInR5cGU6ICVzIG5hbWU6ICVzIG5vZGU6ICVzIGtl
eTogJXMiCit4ZW5fZGV2aWNlX3JlbW92ZV93YXRjaChjb25zdCBjaGFyICp0eXBlLCBjaGFyICpu
YW1lLCBjb25zdCBjaGFyICpub2RlLCBjb25zdCBjaGFyICprZXkpICJ0eXBlOiAlcyBuYW1lOiAl
cyBub2RlOiAlcyBrZXk6ICVzIgogCiAjIHhlbi1idXMtaGVscGVyLmMKIHhzX25vZGVfY3JlYXRl
KGNvbnN0IGNoYXIgKm5vZGUpICIlcyIKZGlmZiAtLWdpdCBhL2h3L3hlbi94ZW4tYnVzLmMgYi9o
dy94ZW4veGVuLWJ1cy5jCmluZGV4IDI4ZWZhY2NmZjIuLjgxMGE0ZTJkZjMgMTAwNjQ0Ci0tLSBh
L2h3L3hlbi94ZW4tYnVzLmMKKysrIGIvaHcveGVuL3hlbi1idXMuYwpAQCAtMjM1LDExICsyMzUs
MTEgQEAgc3RhdGljIHZvaWQgd2F0Y2hfbGlzdF9yZW1vdmUoWGVuV2F0Y2hMaXN0ICp3YXRjaF9s
aXN0LCBYZW5XYXRjaCAqd2F0Y2gsCiAKIHN0YXRpYyBYZW5XYXRjaCAqeGVuX2J1c19hZGRfd2F0
Y2goWGVuQnVzICp4ZW5idXMsIGNvbnN0IGNoYXIgKm5vZGUsCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKmtleSwgWGVuV2F0Y2hIYW5kbGVyIGhhbmRsZXIs
Ci0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKm9wYXF1ZSwgRXJyb3Ig
KiplcnJwKQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFcnJvciAqKmVycnAp
CiB7CiAgICAgdHJhY2VfeGVuX2J1c19hZGRfd2F0Y2gobm9kZSwga2V5KTsKIAotICAgIHJldHVy
biB3YXRjaF9saXN0X2FkZCh4ZW5idXMtPndhdGNoX2xpc3QsIG5vZGUsIGtleSwgaGFuZGxlciwg
b3BhcXVlLAorICAgIHJldHVybiB3YXRjaF9saXN0X2FkZCh4ZW5idXMtPndhdGNoX2xpc3QsIG5v
ZGUsIGtleSwgaGFuZGxlciwgeGVuYnVzLAogICAgICAgICAgICAgICAgICAgICAgICAgICBlcnJw
KTsKIH0KIApAQCAtNDMzLDcgKzQzMyw3IEBAIHN0YXRpYyB2b2lkIHhlbl9idXNfcmVhbGl6ZShC
dXNTdGF0ZSAqYnVzLCBFcnJvciAqKmVycnApCiAKICAgICB4ZW5idXMtPmJhY2tlbmRfd2F0Y2gg
PQogICAgICAgICB4ZW5fYnVzX2FkZF93YXRjaCh4ZW5idXMsICIiLCAvKiBkb21haW4gcm9vdCBu
b2RlICovCi0gICAgICAgICAgICAgICAgICAgICAgICAgICJiYWNrZW5kIiwgeGVuX2J1c19lbnVt
ZXJhdGUsIHhlbmJ1cywgJmxvY2FsX2Vycik7CisgICAgICAgICAgICAgICAgICAgICAgICAgICJi
YWNrZW5kIiwgeGVuX2J1c19lbnVtZXJhdGUsICZsb2NhbF9lcnIpOwogICAgIGlmIChsb2NhbF9l
cnIpIHsKICAgICAgICAgLyogVGhpcyBuZWVkIG5vdCBiZSB0cmVhdGVkIGFzIGEgaGFyZCBlcnJv
ciBzbyBkb24ndCBwcm9wYWdhdGUgKi8KICAgICAgICAgZXJyb3JfcmVwb3J0Zl9lcnIobG9jYWxf
ZXJyLApAQCAtNjIxLDYgKzYyMSwzMSBAQCBzdGF0aWMgdm9pZCB4ZW5fZGV2aWNlX2JhY2tlbmRf
Y2hhbmdlZCh2b2lkICpvcGFxdWUpCiAgICAgfQogfQogCitzdGF0aWMgWGVuV2F0Y2ggKnhlbl9k
ZXZpY2VfYWRkX3dhdGNoKFhlbkRldmljZSAqeGVuZGV2LCBjb25zdCBjaGFyICpub2RlLAorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICprZXksCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFhlbldhdGNoSGFuZGxlciBoYW5kbGVy
LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFcnJvciAqKmVycnApCit7
CisgICAgY29uc3QgY2hhciAqdHlwZSA9IG9iamVjdF9nZXRfdHlwZW5hbWUoT0JKRUNUKHhlbmRl
dikpOworCisgICAgdHJhY2VfeGVuX2RldmljZV9hZGRfd2F0Y2godHlwZSwgeGVuZGV2LT5uYW1l
LCBub2RlLCBrZXkpOworCisgICAgcmV0dXJuIHdhdGNoX2xpc3RfYWRkKHhlbmRldi0+d2F0Y2hf
bGlzdCwgbm9kZSwga2V5LCBoYW5kbGVyLCB4ZW5kZXYsCisgICAgICAgICAgICAgICAgICAgICAg
ICAgIGVycnApOworfQorCitzdGF0aWMgdm9pZCB4ZW5fZGV2aWNlX3JlbW92ZV93YXRjaChYZW5E
ZXZpY2UgKnhlbmRldiwgWGVuV2F0Y2ggKndhdGNoLAorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgRXJyb3IgKiplcnJwKQoreworICAgIGNvbnN0IGNoYXIgKnR5cGUgPSBvYmpl
Y3RfZ2V0X3R5cGVuYW1lKE9CSkVDVCh4ZW5kZXYpKTsKKworICAgIHRyYWNlX3hlbl9kZXZpY2Vf
cmVtb3ZlX3dhdGNoKHR5cGUsIHhlbmRldi0+bmFtZSwgd2F0Y2gtPm5vZGUsCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgd2F0Y2gtPmtleSk7CisKKyAgICB3YXRjaF9saXN0X3Jl
bW92ZSh4ZW5kZXYtPndhdGNoX2xpc3QsIHdhdGNoLCBlcnJwKTsKK30KKworCiBzdGF0aWMgdm9p
ZCB4ZW5fZGV2aWNlX2JhY2tlbmRfY3JlYXRlKFhlbkRldmljZSAqeGVuZGV2LCBFcnJvciAqKmVy
cnApCiB7CiAgICAgWGVuQnVzICp4ZW5idXMgPSBYRU5fQlVTKHFkZXZfZ2V0X3BhcmVudF9idXMo
REVWSUNFKHhlbmRldikpKTsKQEAgLTY0NSw5ICs2NzAsOSBAQCBzdGF0aWMgdm9pZCB4ZW5fZGV2
aWNlX2JhY2tlbmRfY3JlYXRlKFhlbkRldmljZSAqeGVuZGV2LCBFcnJvciAqKmVycnApCiAgICAg
fQogCiAgICAgeGVuZGV2LT5iYWNrZW5kX3N0YXRlX3dhdGNoID0KLSAgICAgICAgeGVuX2J1c19h
ZGRfd2F0Y2goeGVuYnVzLCB4ZW5kZXYtPmJhY2tlbmRfcGF0aCwKLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgInN0YXRlIiwgeGVuX2RldmljZV9iYWNrZW5kX2NoYW5nZWQsCi0gICAgICAgICAg
ICAgICAgICAgICAgICAgIHhlbmRldiwgJmxvY2FsX2Vycik7CisgICAgICAgIHhlbl9kZXZpY2Vf
YWRkX3dhdGNoKHhlbmRldiwgeGVuZGV2LT5iYWNrZW5kX3BhdGgsCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICJzdGF0ZSIsIHhlbl9kZXZpY2VfYmFja2VuZF9jaGFuZ2VkLAorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAmbG9jYWxfZXJyKTsKICAgICBpZiAobG9jYWxfZXJyKSB7
CiAgICAgICAgIGVycm9yX3Byb3BhZ2F0ZV9wcmVwZW5kKGVycnAsIGxvY2FsX2VyciwKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgImZhaWxlZCB0byB3YXRjaCBiYWNrZW5kIHN0YXRl
OiAiKTsKQEAgLTY1NSw5ICs2ODAsOSBAQCBzdGF0aWMgdm9pZCB4ZW5fZGV2aWNlX2JhY2tlbmRf
Y3JlYXRlKFhlbkRldmljZSAqeGVuZGV2LCBFcnJvciAqKmVycnApCiAgICAgfQogCiAgICAgeGVu
ZGV2LT5iYWNrZW5kX29ubGluZV93YXRjaCA9Ci0gICAgICAgIHhlbl9idXNfYWRkX3dhdGNoKHhl
bmJ1cywgeGVuZGV2LT5iYWNrZW5kX3BhdGgsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICJv
bmxpbmUiLCB4ZW5fZGV2aWNlX2JhY2tlbmRfY2hhbmdlZCwKLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgeGVuZGV2LCAmbG9jYWxfZXJyKTsKKyAgICAgICAgeGVuX2RldmljZV9hZGRfd2F0Y2go
eGVuZGV2LCB4ZW5kZXYtPmJhY2tlbmRfcGF0aCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIm9ubGluZSIsIHhlbl9kZXZpY2VfYmFja2VuZF9jaGFuZ2VkLAorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAmbG9jYWxfZXJyKTsKICAgICBpZiAobG9jYWxfZXJyKSB7CiAgICAgICAg
IGVycm9yX3Byb3BhZ2F0ZV9wcmVwZW5kKGVycnAsIGxvY2FsX2VyciwKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgImZhaWxlZCB0byB3YXRjaCBiYWNrZW5kIG9ubGluZTogIik7CkBA
IC02NzEsMTIgKzY5NiwxMiBAQCBzdGF0aWMgdm9pZCB4ZW5fZGV2aWNlX2JhY2tlbmRfZGVzdHJv
eShYZW5EZXZpY2UgKnhlbmRldikKICAgICBFcnJvciAqbG9jYWxfZXJyID0gTlVMTDsKIAogICAg
IGlmICh4ZW5kZXYtPmJhY2tlbmRfb25saW5lX3dhdGNoKSB7Ci0gICAgICAgIHhlbl9idXNfcmVt
b3ZlX3dhdGNoKHhlbmJ1cywgeGVuZGV2LT5iYWNrZW5kX29ubGluZV93YXRjaCwgTlVMTCk7Cisg
ICAgICAgIHhlbl9kZXZpY2VfcmVtb3ZlX3dhdGNoKHhlbmRldiwgeGVuZGV2LT5iYWNrZW5kX29u
bGluZV93YXRjaCwgTlVMTCk7CiAgICAgICAgIHhlbmRldi0+YmFja2VuZF9vbmxpbmVfd2F0Y2gg
PSBOVUxMOwogICAgIH0KIAogICAgIGlmICh4ZW5kZXYtPmJhY2tlbmRfc3RhdGVfd2F0Y2gpIHsK
LSAgICAgICAgeGVuX2J1c19yZW1vdmVfd2F0Y2goeGVuYnVzLCB4ZW5kZXYtPmJhY2tlbmRfc3Rh
dGVfd2F0Y2gsIE5VTEwpOworICAgICAgICB4ZW5fZGV2aWNlX3JlbW92ZV93YXRjaCh4ZW5kZXYs
IHhlbmRldi0+YmFja2VuZF9zdGF0ZV93YXRjaCwgTlVMTCk7CiAgICAgICAgIHhlbmRldi0+YmFj
a2VuZF9zdGF0ZV93YXRjaCA9IE5VTEw7CiAgICAgfQogCkBAIC04MTIsOCArODM3LDggQEAgc3Rh
dGljIHZvaWQgeGVuX2RldmljZV9mcm9udGVuZF9jcmVhdGUoWGVuRGV2aWNlICp4ZW5kZXYsIEVy
cm9yICoqZXJycCkKICAgICB9CiAKICAgICB4ZW5kZXYtPmZyb250ZW5kX3N0YXRlX3dhdGNoID0K
LSAgICAgICAgeGVuX2J1c19hZGRfd2F0Y2goeGVuYnVzLCB4ZW5kZXYtPmZyb250ZW5kX3BhdGgs
ICJzdGF0ZSIsCi0gICAgICAgICAgICAgICAgICAgICAgICAgIHhlbl9kZXZpY2VfZnJvbnRlbmRf
Y2hhbmdlZCwgeGVuZGV2LCAmbG9jYWxfZXJyKTsKKyAgICAgICAgeGVuX2RldmljZV9hZGRfd2F0
Y2goeGVuZGV2LCB4ZW5kZXYtPmZyb250ZW5kX3BhdGgsICJzdGF0ZSIsCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHhlbl9kZXZpY2VfZnJvbnRlbmRfY2hhbmdlZCwgJmxvY2FsX2Vycik7
CiAgICAgaWYgKGxvY2FsX2VycikgewogICAgICAgICBlcnJvcl9wcm9wYWdhdGVfcHJlcGVuZChl
cnJwLCBsb2NhbF9lcnIsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJmYWlsZWQg
dG8gd2F0Y2ggZnJvbnRlbmQgc3RhdGU6ICIpOwpAQCAtODI2LDcgKzg1MSw4IEBAIHN0YXRpYyB2
b2lkIHhlbl9kZXZpY2VfZnJvbnRlbmRfZGVzdHJveShYZW5EZXZpY2UgKnhlbmRldikKICAgICBF
cnJvciAqbG9jYWxfZXJyID0gTlVMTDsKIAogICAgIGlmICh4ZW5kZXYtPmZyb250ZW5kX3N0YXRl
X3dhdGNoKSB7Ci0gICAgICAgIHhlbl9idXNfcmVtb3ZlX3dhdGNoKHhlbmJ1cywgeGVuZGV2LT5m
cm9udGVuZF9zdGF0ZV93YXRjaCwgTlVMTCk7CisgICAgICAgIHhlbl9kZXZpY2VfcmVtb3ZlX3dh
dGNoKHhlbmRldiwgeGVuZGV2LT5mcm9udGVuZF9zdGF0ZV93YXRjaCwKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgTlVMTCk7CiAgICAgICAgIHhlbmRldi0+ZnJvbnRlbmRfc3RhdGVf
d2F0Y2ggPSBOVUxMOwogICAgIH0KIApAQCAtMTEyMiw2ICsxMTQ4LDE2IEBAIHN0YXRpYyB2b2lk
IHhlbl9kZXZpY2VfdW5yZWFsaXplKERldmljZVN0YXRlICpkZXYsIEVycm9yICoqZXJycCkKICAg
ICAgICAgeGVuZGV2LT54Z3RoID0gTlVMTDsKICAgICB9CiAKKyAgICBpZiAoeGVuZGV2LT53YXRj
aF9saXN0KSB7CisgICAgICAgIHdhdGNoX2xpc3RfZGVzdHJveSh4ZW5kZXYtPndhdGNoX2xpc3Qp
OworICAgICAgICB4ZW5kZXYtPndhdGNoX2xpc3QgPSBOVUxMOworICAgIH0KKworICAgIGlmICh4
ZW5kZXYtPnhzaCkgeworICAgICAgICB4c19jbG9zZSh4ZW5kZXYtPnhzaCk7CisgICAgICAgIHhl
bmRldi0+eHNoID0gTlVMTDsKKyAgICB9CisKICAgICBnX2ZyZWUoeGVuZGV2LT5uYW1lKTsKICAg
ICB4ZW5kZXYtPm5hbWUgPSBOVUxMOwogfQpAQCAtMTE2NCw2ICsxMjAwLDE0IEBAIHN0YXRpYyB2
b2lkIHhlbl9kZXZpY2VfcmVhbGl6ZShEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnApCiAK
ICAgICB0cmFjZV94ZW5fZGV2aWNlX3JlYWxpemUodHlwZSwgeGVuZGV2LT5uYW1lKTsKIAorICAg
IHhlbmRldi0+eHNoID0geHNfb3BlbigwKTsKKyAgICBpZiAoIXhlbmRldi0+eHNoKSB7CisgICAg
ICAgIGVycm9yX3NldGdfZXJybm8oZXJycCwgZXJybm8sICJmYWlsZWQgeHNfb3BlbiIpOworICAg
ICAgICBnb3RvIHVucmVhbGl6ZTsKKyAgICB9CisKKyAgICB4ZW5kZXYtPndhdGNoX2xpc3QgPSB3
YXRjaF9saXN0X2NyZWF0ZSh4ZW5kZXYtPnhzaCk7CisKICAgICB4ZW5kZXYtPnhndGggPSB4ZW5n
bnR0YWJfb3BlbihOVUxMLCAwKTsKICAgICBpZiAoIXhlbmRldi0+eGd0aCkgewogICAgICAgICBl
cnJvcl9zZXRnX2Vycm5vKGVycnAsIGVycm5vLCAiZmFpbGVkIHhlbmdudHRhYl9vcGVuIik7CmRp
ZmYgLS1naXQgYS9pbmNsdWRlL2h3L3hlbi94ZW4tYnVzLmggYi9pbmNsdWRlL2h3L3hlbi94ZW4t
YnVzLmgKaW5kZXggODhiODRlMjliYi4uMGQxOTgxNDhmNiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9o
dy94ZW4veGVuLWJ1cy5oCisrKyBiL2luY2x1ZGUvaHcveGVuL3hlbi1idXMuaApAQCAtMjIsNiAr
MjIsOCBAQCB0eXBlZGVmIHN0cnVjdCBYZW5EZXZpY2UgewogICAgIERldmljZVN0YXRlIHFkZXY7
CiAgICAgZG9taWRfdCBmcm9udGVuZF9pZDsKICAgICBjaGFyICpuYW1lOworICAgIHN0cnVjdCB4
c19oYW5kbGUgKnhzaDsKKyAgICBYZW5XYXRjaExpc3QgKndhdGNoX2xpc3Q7CiAgICAgY2hhciAq
YmFja2VuZF9wYXRoLCAqZnJvbnRlbmRfcGF0aDsKICAgICBlbnVtIHhlbmJ1c19zdGF0ZSBiYWNr
ZW5kX3N0YXRlLCBmcm9udGVuZF9zdGF0ZTsKICAgICBOb3RpZmllciBleGl0OwotLSAKQW50aG9u
eSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
