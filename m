Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B55229A3B
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 16:46:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUBPO-0005VS-Ix; Fri, 24 May 2019 14:42:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=a/0B=TY=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1hUBPN-0005VN-Ei
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 14:42:57 +0000
X-Inumbo-ID: 37903574-7e32-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 37903574-7e32-11e9-8980-bc764e045a96;
 Fri, 24 May 2019 14:42:56 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: L92NSaSjxlBdCrBZmCT7+KZG4Ypxl9hxObzcbTlTGj1ik8mZ/QurcPRcudyPz0wT7NEsSH7sP3
 MJXkDS/mgE6r+D8y+MZKfLXq0xyFTms518AlB8qdQXaw6+EL7Pe0M6+KaigzDGzS12uuU9pYHq
 Q+lrpr3VMvhzt24mGoUa15wMAbtzddgMkHVzVVor0dUXNW9kxpO4KKE0DN8R2SvfRDQELlhvBt
 48OfDLveutAj2VxKV7f4KrqfSNilCmX8emHh+m/YsH9zlv2Zw5LxMiRFE01CtKoNNfcn+c+UIS
 WFc=
X-SBRS: 2.7
X-MesageID: 860160
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,507,1549947600"; 
   d="scan'208";a="860160"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <iommu@lists.linux-foundation.org>, <xen-devel@lists.xenproject.org>,
 <linux-kernel@vger.kernel.org>
Date: Fri, 24 May 2019 15:42:50 +0100
Message-ID: <20190524144250.5102-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v1] xen/swiotlb: rework early repeat code
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudCByZXBlYXQgY29kZSBpcyBwbGFpbiBicm9rZW4gZm9yIHRoZSBlYXJseT10cnVlIGNh
c2UuIFhlbiBleGNoYW5nZXMKYWxsIERNQSAoPDRHQikgcGFnZXMgdGhhdCBpdCBjYW4gb24gdGhl
IGZpcnN0IHhlbl9zd2lvdGxiX2ZpeHVwKCkgYXR0ZW1wdC4KQWxsIGZ1cnRoZXIgYXR0ZW1wdHMg
d2l0aCBhIGhhbHZlZCByZWdpb24gd2lsbCBmYWlsIGltbWVkaWF0ZWx5IGJlY2F1c2UKYWxsIERN
QSBwYWdlcyBhbHJlYWR5IGJlbG9uZyB0byBEb20wLgoKSW50cm9kdWNlIGNvbnRpZ19wYWdlcyBw
YXJhbSBmb3IgeGVuX3N3aW90bGJfZml4dXAoKSB0byB0cmFjayB0aGUgbnVtYmVyCm9mIHBhZ2Vz
IHRoYXQgd2VyZSBtYWRlIGNvbnRpZ3VvdXMgaW4gTUZOIHNwYWNlIGFuZCB1c2UgdGhlIHNhbWUg
Ym9vdG1lbQpyZWdpb24gd2hpbGUgaGFsdmluZyB0aGUgbWVtb3J5IHJlcXVpcmVtZW50cy4KClNp
Z25lZC1vZmYtYnk6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KLS0t
CkNDOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNDOiBC
b3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgpDQzogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgpDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPgpDQzogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4K
LS0tCiBkcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jIHwgMzYgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jIGIvZHJpdmVy
cy94ZW4vc3dpb3RsYi14ZW4uYwppbmRleCA1ZGNiMDZmZTk2NjcuLmQyYWJhODA0ZDA2YyAxMDA2
NDQKLS0tIGEvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYworKysgYi9kcml2ZXJzL3hlbi9zd2lv
dGxiLXhlbi5jCkBAIC0xNDIsNyArMTQyLDggQEAgc3RhdGljIGludCBpc194ZW5fc3dpb3RsYl9i
dWZmZXIoZG1hX2FkZHJfdCBkbWFfYWRkcikKIHN0YXRpYyBpbnQgbWF4X2RtYV9iaXRzID0gMzI7
CiAKIHN0YXRpYyBpbnQKLXhlbl9zd2lvdGxiX2ZpeHVwKHZvaWQgKmJ1Ziwgc2l6ZV90IHNpemUs
IHVuc2lnbmVkIGxvbmcgbnNsYWJzKQoreGVuX3N3aW90bGJfZml4dXAodm9pZCAqYnVmLCBzaXpl
X3Qgc2l6ZSwgdW5zaWduZWQgbG9uZyBuc2xhYnMsCisJCSAgdW5zaWduZWQgbG9uZyAqY29udGln
X3BhZ2VzKQogewogCWludCBpLCByYzsKIAlpbnQgZG1hX2JpdHM7CkBAIC0xNTYsMTAgKzE1Nywx
MyBAQCB4ZW5fc3dpb3RsYl9maXh1cCh2b2lkICpidWYsIHNpemVfdCBzaXplLCB1bnNpZ25lZCBs
b25nIG5zbGFicykKIAkJaW50IHNsYWJzID0gbWluKG5zbGFicyAtIGksICh1bnNpZ25lZCBsb25n
KUlPX1RMQl9TRUdTSVpFKTsKIAogCQlkbyB7CisJCQl1bnNpZ25lZCBpbnQgb3JkZXIgPSBnZXRf
b3JkZXIoc2xhYnMgPDwgSU9fVExCX1NISUZUKTsKIAkJCXJjID0geGVuX2NyZWF0ZV9jb250aWd1
b3VzX3JlZ2lvbigKIAkJCQlwICsgKGkgPDwgSU9fVExCX1NISUZUKSwKLQkJCQlnZXRfb3JkZXIo
c2xhYnMgPDwgSU9fVExCX1NISUZUKSwKKwkJCQlvcmRlciwKIAkJCQlkbWFfYml0cywgJmRtYV9o
YW5kbGUpOworCQkJaWYgKHJjID09IDApCisJCQkJKmNvbnRpZ19wYWdlcyArPSAxIDw8IG9yZGVy
OwogCQl9IHdoaWxlIChyYyAmJiBkbWFfYml0cysrIDwgbWF4X2RtYV9iaXRzKTsKIAkJaWYgKHJj
KQogCQkJcmV0dXJuIHJjOwpAQCAtMjAyLDcgKzIwNiw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICp4
ZW5fc3dpb3RsYl9lcnJvcihlbnVtIHhlbl9zd2lvdGxiX2VyciBlcnIpCiB9CiBpbnQgX19yZWYg
eGVuX3N3aW90bGJfaW5pdChpbnQgdmVyYm9zZSwgYm9vbCBlYXJseSkKIHsKLQl1bnNpZ25lZCBs
b25nIGJ5dGVzLCBvcmRlcjsKKwl1bnNpZ25lZCBsb25nIGJ5dGVzLCBvcmRlciwgY29udGlnX3Bh
Z2VzOwogCWludCByYyA9IC1FTk9NRU07CiAJZW51bSB4ZW5fc3dpb3RsYl9lcnIgbV9yZXQgPSBY
RU5fU1dJT1RMQl9VTktOT1dOOwogCXVuc2lnbmVkIGludCByZXBlYXQgPSAzOwpAQCAtMjQ0LDEz
ICsyNDgsMzIgQEAgaW50IF9fcmVmIHhlbl9zd2lvdGxiX2luaXQoaW50IHZlcmJvc2UsIGJvb2wg
ZWFybHkpCiAJLyoKIAkgKiBBbmQgcmVwbGFjZSB0aGF0IG1lbW9yeSB3aXRoIHBhZ2VzIHVuZGVy
IDRHQi4KIAkgKi8KKwljb250aWdfcGFnZXMgPSAwOwogCXJjID0geGVuX3N3aW90bGJfZml4dXAo
eGVuX2lvX3RsYl9zdGFydCwKIAkJCSAgICAgICBieXRlcywKLQkJCSAgICAgICB4ZW5faW9fdGxi
X25zbGFicyk7CisJCQkgICAgICAgeGVuX2lvX3RsYl9uc2xhYnMsCisJCQkgICAgICAgJmNvbnRp
Z19wYWdlcyk7CiAJaWYgKHJjKSB7Ci0JCWlmIChlYXJseSkKKwkJaWYgKGVhcmx5KSB7CisJCQl1
bnNpZ25lZCBsb25nIG9yaWdfYnl0ZXMgPSBieXRlczsKKwkJCXdoaWxlIChyZXBlYXQtLSA+IDAp
IHsKKwkJCQl4ZW5faW9fdGxiX25zbGFicyA9IG1heCgxMDI0VUwsIC8qIE1pbiBpcyAyTUIgKi8K
KwkJCQkJCSAgICAgICh4ZW5faW9fdGxiX25zbGFicyA+PiAxKSk7CisJCQkJcHJfaW5mbygiTG93
ZXJpbmcgdG8gJWx1TUJcbiIsCisJCQkJICAgICAoeGVuX2lvX3RsYl9uc2xhYnMgPDwgSU9fVExC
X1NISUZUKSA+PiAyMCk7CisJCQkJYnl0ZXMgPSB4ZW5fc2V0X25zbGFicyh4ZW5faW9fdGxiX25z
bGFicyk7CisJCQkJb3JkZXIgPSBnZXRfb3JkZXIoeGVuX2lvX3RsYl9uc2xhYnMgPDwgSU9fVExC
X1NISUZUKTsKKwkJCQl4ZW5faW9fdGxiX2VuZCA9IHhlbl9pb190bGJfc3RhcnQgKyBieXRlczsK
KwkJCQlpZiAoY29udGlnX3BhZ2VzID49ICgxdWwgPDwgb3JkZXIpKSB7CisJCQkJCS8qIEVub3Vn
aCBwYWdlcyB3ZXJlIG1hZGUgY29udGlndW91cyAqLworCQkJCQltZW1ibG9ja19mcmVlKF9fcGEo
eGVuX2lvX3RsYl9zdGFydCArIGJ5dGVzKSwKKwkJCQkJCSAgICAgUEFHRV9BTElHTihvcmlnX2J5
dGVzIC0gYnl0ZXMpKTsKKwkJCQkJZ290byBmaXh1cF9kb25lOworCQkJCX0KKwkJCX0KIAkJCW1l
bWJsb2NrX2ZyZWUoX19wYSh4ZW5faW9fdGxiX3N0YXJ0KSwKIAkJCQkgICAgICBQQUdFX0FMSUdO
KGJ5dGVzKSk7CisJCX0KIAkJZWxzZSB7CiAJCQlmcmVlX3BhZ2VzKCh1bnNpZ25lZCBsb25nKXhl
bl9pb190bGJfc3RhcnQsIG9yZGVyKTsKIAkJCXhlbl9pb190bGJfc3RhcnQgPSBOVUxMOwpAQCAt
MjU4LDYgKzI4MSw3IEBAIGludCBfX3JlZiB4ZW5fc3dpb3RsYl9pbml0KGludCB2ZXJib3NlLCBi
b29sIGVhcmx5KQogCQltX3JldCA9IFhFTl9TV0lPVExCX0VGSVhVUDsKIAkJZ290byBlcnJvcjsK
IAl9CitmaXh1cF9kb25lOgogCXN0YXJ0X2RtYV9hZGRyID0geGVuX3ZpcnRfdG9fYnVzKHhlbl9p
b190bGJfc3RhcnQpOwogCWlmIChlYXJseSkgewogCQlpZiAoc3dpb3RsYl9pbml0X3dpdGhfdGJs
KHhlbl9pb190bGJfc3RhcnQsIHhlbl9pb190bGJfbnNsYWJzLApAQCAtMjcyLDcgKzI5Niw3IEBA
IGludCBfX3JlZiB4ZW5fc3dpb3RsYl9pbml0KGludCB2ZXJib3NlLCBib29sIGVhcmx5KQogCiAJ
cmV0dXJuIHJjOwogZXJyb3I6Ci0JaWYgKHJlcGVhdC0tKSB7CisJaWYgKHJlcGVhdC0tID4gMCkg
ewogCQl4ZW5faW9fdGxiX25zbGFicyA9IG1heCgxMDI0VUwsIC8qIE1pbiBpcyAyTUIgKi8KIAkJ
CQkJKHhlbl9pb190bGJfbnNsYWJzID4+IDEpKTsKIAkJcHJfaW5mbygiTG93ZXJpbmcgdG8gJWx1
TUJcbiIsCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
