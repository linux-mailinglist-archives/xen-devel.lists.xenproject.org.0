Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC81111BB1
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 23:34:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icGhZ-00087n-3K; Tue, 03 Dec 2019 22:31:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nD+/=ZZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1icGhX-000870-Jf
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 22:31:23 +0000
X-Inumbo-ID: a20b8d42-161c-11ea-aea8-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a20b8d42-161c-11ea-aea8-bc764e2007e4;
 Tue, 03 Dec 2019 22:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575412283;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Hem8Hhsba0SGjlUNwoELtBwvIxUFS1JBuZ9YIWk22f4=;
 b=MQ2j9VqWxMR2WLgxD1fHI1u+s7wWW3/KxHJ7F0j0qKQW4YyPiqTyate1
 pxxqyWXNHEngk0ola1Ob35uwiEU867bgh+zUDYXf1EW6z4aitvgIZMFkg
 4zsUqC0WvjwaUnAyBzhy7+OXPv++OS5GD5T9gcQH8Is0o8WhevANDRfMV g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 15O0xs/lAX3KfFwM6s6RzB3YXJkSiQsQsEtEtnVq5d1L61aX5HEdhh057BVrGhjnk8oWHpW0GB
 Y3Vj7eYZXnW0Q5J3qFMzgmpiK8TOX938d8lcjIVkchao7fztu6gPI1wc5QRMppApM+UiaJveWC
 PyH+PxY0oaIJ85+JUz/ue+yeQqLxSvNitugZiicB8AJ8TP3SHLcRlQyY+LkQmHKia3CAI09vK3
 GjPe8ghJCLnwEVTXHx+fS/czuTl9yBru2RecWPuGNEcidtJmXE21XlAxFxLKURv4iA0Ffv95W6
 PeA=
X-SBRS: 2.7
X-MesageID: 9160237
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,275,1571716800"; 
   d="scan'208";a="9160237"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 3 Dec 2019 22:30:46 +0000
Message-ID: <20191203223046.15011-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/svm: Fix handling of EFLAGS.RF on task
 switch
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VlQteCB1cGRhdGVzIFJGIGJlZm9yZSB2bWV4aXQsIHNvIGVmbGFncyB3cml0dGVuIGludG8gdGhl
IG91dGdvaW5nIFRTUyBoYXBwZW5zCnRvIGJlIGNvcnJlY3QuICBTVk0gZG9lcyBub3QgdXBkYXRl
IFJGIGJlZm9yZSB2bWV4aXQsIGFuZCBpbnN0ZWFkIHByb3ZpZGVzIGl0CnZpYSBhIGJpdCBpbiBl
eGl0aW5mbzIuCgpJbiBwcmFjdGljZSwgbmVlZGluZyBSRiBzZXQgaW4gdGhlIG91dGdvaW5nIHN0
YXRlIG9jY3VycyB3aGVuIGEgdGFzayBnYXRlIGlzCnVzZWQgdG8gaGFuZGxlIGZhdWx0cy4KCkV4
dGVuZCBodm1fdGFza19zd2l0Y2goKSB3aXRoIGFuIGV4dHJhX2VmbGFncyBwYXJhbWV0ZXIgd2hp
Y2ggZ2V0cyBmZWQgaW50bwp0aGUgb3V0Z29pbmcgVFNTLCBhbmQgZmlsbCBpdCBpbiBzdWl0YWJs
eSBmcm9tIHRoZSBTVk0gdm1leGl0IGluZm9ybWF0aW9uLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8
SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNDOiBKdW4gTmFrYWppbWEgPGp1bi5uYWth
amltYUBpbnRlbC5jb20+CkNDOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KQ0M6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCktldmluOiBUaGVyZSBpcyBubyBoZWxw
IGluIHRoZSBTRE0gYWJvdXQgdGhpcy4gIFJGIGlzIG5vdCBtZW50aW9uZWQgaW4gdGhlCmxpc3Qg
b2Ygc3RhdGUgZWl0aGVyIG1vZGlmaWVkIG9yIHVubW9kaWZpZWQgYnkgaGFyZHdhcmUgb24gYSB0
YXNrIHN3aXRjaAp2bWV4aXQuICBUaGlzIGNvbmNsdXNpb24gaGFzIGJlZW4gZHJhd24gZnJvbSBs
b29raW5nIGF0IHRoZSBhY3R1YWwgVk1FeGl0CnN0YXRlIGdpdmVuIGFuIFhURiB0ZXN0IHBva2lu
ZyBldmVyeSBjb3JuZXIgb2YgVEFTS19TV0lUQ0ggVk1FeGl0cy4KCkp1ZXJnZW46IEkga25vdyBp
dHMgZ2V0dGluZyBzdHVwaWRseSBsYXRlIGluIHRoZSBkYXksIGJ1dCB0aGlzLCBsaWtlIHRoZQpw
cmV2aW91cyBmaXhlcywgd2FudCBiYWNrcG9ydGluZy4gIE9UT0gsIHRoZSBsaWtlbGlob29kIG9m
IG5vdCBmaXhpbmcgaXQKY2F1c2luZyBoYXJtIHRvIFZNcyBpcyBtaW5pbWFsLCB1bmxpa2UgdGhl
IGVhcmxpZXIgdGFzayBzd2l0Y2ggZml4ZXMuCi0tLQogeGVuL2FyY2gveDg2L2h2bS9odm0uYyAg
ICAgICAgfCA0ICsrLS0KIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jICAgIHwgMyArKy0KIHhl
bi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jICAgIHwgMyArKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYv
aHZtL2h2bS5oIHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9odm0uYyBiL3hlbi9hcmNo
L3g4Ni9odm0vaHZtLmMKaW5kZXggN2Y1NTYxNzFiZC4uNDc1NzNmNzFiOCAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L2h2bS9odm0uYworKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCkBAIC0y
OTEzLDcgKzI5MTMsNyBAQCB2b2lkIGh2bV9wcmVwYXJlX3ZtODZfdHNzKHN0cnVjdCB2Y3B1ICp2
LCB1aW50MzJfdCBiYXNlLCB1aW50MzJfdCBsaW1pdCkKIAogdm9pZCBodm1fdGFza19zd2l0Y2go
CiAgICAgdWludDE2X3QgdHNzX3NlbCwgZW51bSBodm1fdGFza19zd2l0Y2hfcmVhc29uIHRhc2tz
d2l0Y2hfcmVhc29uLAotICAgIGludDMyX3QgZXJyY29kZSwgdW5zaWduZWQgaW50IGluc25fbGVu
KQorICAgIGludDMyX3QgZXJyY29kZSwgdW5zaWduZWQgaW50IGluc25fbGVuLCB1bnNpZ25lZCBp
bnQgZXh0cmFfZWZsYWdzKQogewogICAgIHN0cnVjdCB2Y3B1ICp2ID0gY3VycmVudDsKICAgICBz
dHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncyA9IGd1ZXN0X2NwdV91c2VyX3JlZ3MoKTsKQEAgLTI5
ODgsNyArMjk4OCw3IEBAIHZvaWQgaHZtX3Rhc2tfc3dpdGNoKAogICAgICAgICBlZmxhZ3MgJj0g
flg4Nl9FRkxBR1NfTlQ7CiAKICAgICB0c3MuZWlwICAgID0gcmVncy0+ZWlwICsgaW5zbl9sZW47
Ci0gICAgdHNzLmVmbGFncyA9IGVmbGFnczsKKyAgICB0c3MuZWZsYWdzID0gZWZsYWdzIHwgZXh0
cmFfZWZsYWdzOwogICAgIHRzcy5lYXggICAgPSByZWdzLT5lYXg7CiAgICAgdHNzLmVjeCAgICA9
IHJlZ3MtPmVjeDsKICAgICB0c3MuZWR4ICAgID0gcmVncy0+ZWR4OwpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYwppbmRl
eCAwZmIxOTA4YzE4Li42YWU0Mzk5OWZmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2
bS9zdm0uYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYwpAQCAtMjgxMiw3ICsyODEy
LDggQEAgdm9pZCBzdm1fdm1leGl0X2hhbmRsZXIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3Mp
CiAgICAgICAgIGlmICggKHZtY2ItPmV4aXRpbmZvMiA+PiA0NCkgJiAxICkKICAgICAgICAgICAg
IGVycmNvZGUgPSAodWludDMyX3Qpdm1jYi0+ZXhpdGluZm8yOwogCi0gICAgICAgIGh2bV90YXNr
X3N3aXRjaCh2bWNiLT5leGl0aW5mbzEsIHJlYXNvbiwgZXJyY29kZSwgaW5zbl9sZW4pOworICAg
ICAgICBodm1fdGFza19zd2l0Y2godm1jYi0+ZXhpdGluZm8xLCByZWFzb24sIGVycmNvZGUsIGlu
c25fbGVuLAorICAgICAgICAgICAgICAgICAgICAgICAgKHZtY2ItPmV4aXRpbmZvMiAmICgxdWwg
PDwgNDgpKSA/IFg4Nl9FRkxBR1NfUkYgOiAwKTsKICAgICAgICAgYnJlYWs7CiAgICAgfQogCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyBiL3hlbi9hcmNoL3g4Ni9odm0v
dm14L3ZteC5jCmluZGV4IDc0NTBjYmU0MGQuLmJhZmMzYjMwYzUgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vdm14L3ZteC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCkBA
IC0zOTYzLDcgKzM5NjMsOCBAQCB2b2lkIHZteF92bWV4aXRfaGFuZGxlcihzdHJ1Y3QgY3B1X3Vz
ZXJfcmVncyAqcmVncykKICAgICAgICAgZWxzZQogICAgICAgICAgICAgIGVjb2RlID0gLTE7CiAK
LSAgICAgICAgaHZtX3Rhc2tfc3dpdGNoKGV4aXRfcXVhbGlmaWNhdGlvbiwgcmVhc29uc1tzb3Vy
Y2VdLCBlY29kZSwgaW5zdF9sZW4pOworICAgICAgICBodm1fdGFza19zd2l0Y2goZXhpdF9xdWFs
aWZpY2F0aW9uLCByZWFzb25zW3NvdXJjZV0sIGVjb2RlLCBpbnN0X2xlbiwKKyAgICAgICAgICAg
ICAgICAgICAgICAgIDAgLyogRUZMQUdTLlJGIGFscmVhZHkgdXBkYXRlZC4gKi8pOwogICAgICAg
ICBicmVhazsKICAgICB9CiAgICAgY2FzZSBFWElUX1JFQVNPTl9DUFVJRDoKZGlmZiAtLWdpdCBh
L3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0v
aHZtLmgKaW5kZXggMTdmYjdlZmE2ZS4uMWQ3YjY2ZjkyNyAxMDA2NDQKLS0tIGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9odm0vaHZtLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmgK
QEAgLTI5Niw3ICsyOTYsNyBAQCB2b2lkIGh2bV9zZXRfcmR0c2NfZXhpdGluZyhzdHJ1Y3QgZG9t
YWluICpkLCBib29sX3QgZW5hYmxlKTsKIGVudW0gaHZtX3Rhc2tfc3dpdGNoX3JlYXNvbiB7IFRT
V19qbXAsIFRTV19pcmV0LCBUU1dfY2FsbF9vcl9pbnQgfTsKIHZvaWQgaHZtX3Rhc2tfc3dpdGNo
KAogICAgIHVpbnQxNl90IHRzc19zZWwsIGVudW0gaHZtX3Rhc2tfc3dpdGNoX3JlYXNvbiB0YXNr
c3dpdGNoX3JlYXNvbiwKLSAgICBpbnQzMl90IGVycmNvZGUsIHVuc2lnbmVkIGludCBpbnNuX2xl
bik7CisgICAgaW50MzJfdCBlcnJjb2RlLCB1bnNpZ25lZCBpbnQgaW5zbl9sZW4sIHVuc2lnbmVk
IGludCBleHRyYV9lZmxhZ3MpOwogCiBlbnVtIGh2bV9hY2Nlc3NfdHlwZSB7CiAgICAgaHZtX2Fj
Y2Vzc19pbnNuX2ZldGNoLAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
