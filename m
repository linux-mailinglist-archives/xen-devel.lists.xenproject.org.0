Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D40D510C1
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 17:37:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfR0g-0002o3-N1; Mon, 24 Jun 2019 15:35:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EXrY=UX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hfR0f-0002nb-0b
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 15:35:57 +0000
X-Inumbo-ID: 604ead4b-9695-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 604ead4b-9695-11e9-8980-bc764e045a96;
 Mon, 24 Jun 2019 15:33:12 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: K5kUsN90E5VToN2tpmS2SfG7x98Z94kiLli0DChz2RnWbjCXjckGfa9ZpXH+d42unqqhcEvu1k
 GljG4mhfzqFgczTE9LqCIjgBzT2qL+YWJgHX/9A7a/JyNELUdRZWCI9gfSLt/C7cighXPiJyLC
 4PYm6+npJL4WkNrgwhrjkOEiefvapW+OBq+d+gMvbJid427JxRVyLFGLe9yv5utZdk2np7S2zv
 qVKgP0LFFnOI7YNg7g2HkjP1/1j6S4C0nnGEZ4ZB+NmrZQ2r0XM+Hiw0m1GKT0Igqej9zVM+Fz
 +Y8=
X-SBRS: 2.7
X-MesageID: 2148105
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,412,1557201600"; 
   d="scan'208";a="2148105"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 24 Jun 2019 16:32:54 +0100
Message-ID: <20190624153257.20163-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190624153257.20163-1-anthony.perard@citrix.com>
References: <20190624153257.20163-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PULL 5/8] xen: Avoid VLA
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

QXZvaWQgdXNpbmcgYSB2YXJpYWJsZSBsZW5ndGggYXJyYXkuCgpXZSBhbGxvY2F0ZSB0aGUgYGRp
cnR5X2JpdG1hcCcgYnVmZmVyIG9ubHkgb25jZSB3aGVuIHdlIHN0YXJ0IHRyYWNraW5nCmZvciBk
aXJ0eSBiaXRzLgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJk
QGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRy
aXguY29tPgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRo
YXQuY29tPgpNZXNzYWdlLUlkOiA8MjAxOTA2MTgxMTIzNDEuNTEzLTUtYW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT4KLS0tCiBody9pMzg2L3hlbi94ZW4taHZtLmMgfCAxNSArKysrKysrKysrKy0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2h3L2kzODYveGVuL3hlbi1odm0uYyBiL2h3L2kzODYveGVuL3hlbi1odm0uYwpp
bmRleCAyOTM5MTIyZTdjLi5lZDljMzdjNzJkIDEwMDY0NAotLS0gYS9ody9pMzg2L3hlbi94ZW4t
aHZtLmMKKysrIGIvaHcvaTM4Ni94ZW4veGVuLWh2bS5jCkBAIC0xMjAsNiArMTIwLDggQEAgdHlw
ZWRlZiBzdHJ1Y3QgWGVuSU9TdGF0ZSB7CiAgICAgRGV2aWNlTGlzdGVuZXIgZGV2aWNlX2xpc3Rl
bmVyOwogICAgIGh3YWRkciBmcmVlX3BoeXNfb2Zmc2V0OwogICAgIGNvbnN0IFhlblBoeXNtYXAg
KmxvZ19mb3JfZGlydHliaXQ7CisgICAgLyogQnVmZmVyIHVzZWQgYnkgeGVuX3N5bmNfZGlydHlf
Yml0bWFwICovCisgICAgdW5zaWduZWQgbG9uZyAqZGlydHlfYml0bWFwOwogCiAgICAgTm90aWZp
ZXIgZXhpdDsKICAgICBOb3RpZmllciBzdXNwZW5kOwpAQCAtNDY1LDYgKzQ2Nyw4IEBAIHN0YXRp
YyBpbnQgeGVuX3JlbW92ZV9mcm9tX3BoeXNtYXAoWGVuSU9TdGF0ZSAqc3RhdGUsCiAgICAgUUxJ
U1RfUkVNT1ZFKHBoeXNtYXAsIGxpc3QpOwogICAgIGlmIChzdGF0ZS0+bG9nX2Zvcl9kaXJ0eWJp
dCA9PSBwaHlzbWFwKSB7CiAgICAgICAgIHN0YXRlLT5sb2dfZm9yX2RpcnR5Yml0ID0gTlVMTDsK
KyAgICAgICAgZ19mcmVlKHN0YXRlLT5kaXJ0eV9iaXRtYXApOworICAgICAgICBzdGF0ZS0+ZGly
dHlfYml0bWFwID0gTlVMTDsKICAgICB9CiAgICAgZ19mcmVlKHBoeXNtYXApOwogCkBAIC02MTUs
NyArNjE5LDcgQEAgc3RhdGljIHZvaWQgeGVuX3N5bmNfZGlydHlfYml0bWFwKFhlbklPU3RhdGUg
KnN0YXRlLAogewogICAgIGh3YWRkciBucGFnZXMgPSBzaXplID4+IFRBUkdFVF9QQUdFX0JJVFM7
CiAgICAgY29uc3QgaW50IHdpZHRoID0gc2l6ZW9mKHVuc2lnbmVkIGxvbmcpICogODsKLSAgICB1
bnNpZ25lZCBsb25nIGJpdG1hcFtESVZfUk9VTkRfVVAobnBhZ2VzLCB3aWR0aCldOworICAgIHNp
emVfdCBiaXRtYXBfc2l6ZSA9IERJVl9ST1VORF9VUChucGFnZXMsIHdpZHRoKTsKICAgICBpbnQg
cmMsIGksIGo7CiAgICAgY29uc3QgWGVuUGh5c21hcCAqcGh5c21hcCA9IE5VTEw7CiAKQEAgLTYy
NywxMyArNjMxLDE0IEBAIHN0YXRpYyB2b2lkIHhlbl9zeW5jX2RpcnR5X2JpdG1hcChYZW5JT1N0
YXRlICpzdGF0ZSwKIAogICAgIGlmIChzdGF0ZS0+bG9nX2Zvcl9kaXJ0eWJpdCA9PSBOVUxMKSB7
CiAgICAgICAgIHN0YXRlLT5sb2dfZm9yX2RpcnR5Yml0ID0gcGh5c21hcDsKKyAgICAgICAgc3Rh
dGUtPmRpcnR5X2JpdG1hcCA9IGdfbmV3KHVuc2lnbmVkIGxvbmcsIGJpdG1hcF9zaXplKTsKICAg
ICB9IGVsc2UgaWYgKHN0YXRlLT5sb2dfZm9yX2RpcnR5Yml0ICE9IHBoeXNtYXApIHsKICAgICAg
ICAgLyogT25seSBvbmUgcmFuZ2UgZm9yIGRpcnR5IGJpdG1hcCBjYW4gYmUgdHJhY2tlZC4gKi8K
ICAgICAgICAgcmV0dXJuOwogICAgIH0KIAogICAgIHJjID0geGVuX3RyYWNrX2RpcnR5X3ZyYW0o
eGVuX2RvbWlkLCBzdGFydF9hZGRyID4+IFRBUkdFVF9QQUdFX0JJVFMsCi0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBucGFnZXMsIGJpdG1hcCk7CisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBucGFnZXMsIHN0YXRlLT5kaXJ0eV9iaXRtYXApOwogICAgIGlmIChyYyA8IDApIHsK
ICNpZm5kZWYgRU5PREFUQQogI2RlZmluZSBFTk9EQVRBICBFTk9FTlQKQEAgLTY0Nyw4ICs2NTIs
OCBAQCBzdGF0aWMgdm9pZCB4ZW5fc3luY19kaXJ0eV9iaXRtYXAoWGVuSU9TdGF0ZSAqc3RhdGUs
CiAgICAgICAgIHJldHVybjsKICAgICB9CiAKLSAgICBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0la
RShiaXRtYXApOyBpKyspIHsKLSAgICAgICAgdW5zaWduZWQgbG9uZyBtYXAgPSBiaXRtYXBbaV07
CisgICAgZm9yIChpID0gMDsgaSA8IGJpdG1hcF9zaXplOyBpKyspIHsKKyAgICAgICAgdW5zaWdu
ZWQgbG9uZyBtYXAgPSBzdGF0ZS0+ZGlydHlfYml0bWFwW2ldOwogICAgICAgICB3aGlsZSAobWFw
ICE9IDApIHsKICAgICAgICAgICAgIGogPSBjdHpsKG1hcCk7CiAgICAgICAgICAgICBtYXAgJj0g
figxdWwgPDwgaik7CkBAIC02NzgsNiArNjgzLDggQEAgc3RhdGljIHZvaWQgeGVuX2xvZ19zdG9w
KE1lbW9yeUxpc3RlbmVyICpsaXN0ZW5lciwgTWVtb3J5UmVnaW9uU2VjdGlvbiAqc2VjdGlvbiwK
IAogICAgIGlmIChvbGQgJiB+bmV3ICYgKDEgPDwgRElSVFlfTUVNT1JZX1ZHQSkpIHsKICAgICAg
ICAgc3RhdGUtPmxvZ19mb3JfZGlydHliaXQgPSBOVUxMOworICAgICAgICBnX2ZyZWUoc3RhdGUt
PmRpcnR5X2JpdG1hcCk7CisgICAgICAgIHN0YXRlLT5kaXJ0eV9iaXRtYXAgPSBOVUxMOwogICAg
ICAgICAvKiBEaXNhYmxlIGRpcnR5IGJpdCB0cmFja2luZyAqLwogICAgICAgICB4ZW5fdHJhY2tf
ZGlydHlfdnJhbSh4ZW5fZG9taWQsIDAsIDAsIE5VTEwpOwogICAgIH0KLS0gCkFudGhvbnkgUEVS
QVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
