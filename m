Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E760912371B
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 21:19:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihJGE-0005LH-Qh; Tue, 17 Dec 2019 20:16:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UMsG=2H=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ihJGD-0005LC-DN
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 20:16:01 +0000
X-Inumbo-ID: 096ab1b4-210a-11ea-8f95-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 096ab1b4-210a-11ea-8f95-12813bfff9fa;
 Tue, 17 Dec 2019 20:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576613758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=a5RkKskjboJj5FOVFNqOmI4Lfq8tJHlMrwioAAGK2lc=;
 b=WhzK9n4P+/1UXaH59e3Gm2BxWcqd2oNdDtHanmXgvGEhY3QjwmSEAXFa
 jtlM0mplCHnezphv7u8o9d31nQ0Hy693KDNeHR2JHvMXzwo0kaHC8XDbk
 fcvztiIv7lpEMJsddDq4rrntYjqBu705Xuglv/0wKgRsrV9+pEcX0z2vq g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pq5o/Buzj0Rt/ZMF6tkZcuQs6wPF2PxQ6ljNDFT/XsO8JOKE8NOyLVoWmianuccTQG/fHK5h3Q
 JSomdCNb6ZbQ4A/oO5eiE/D5AObjHUM9w94Ss+4RljT74pp0hHPwD7f022rOGKU+YFNDVFNwdc
 xZQuwvgjttey4e0y7ND1kb3dKJQ8ZTr8bSlqax5Qt5C/w94v6Uie5RrNikXO4GAdWMHnoo4pcz
 s89O0bcVRa5pQOViOs0bUvnDm4qnEj0VBBryRyveEH4jsoOPtW74C/m+IT+tHLBHFTmF3LduSn
 exU=
X-SBRS: 2.7
X-MesageID: 10255290
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,326,1571716800"; d="scan'208";a="10255290"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 17 Dec 2019 20:15:50 +0000
Message-ID: <20191217201550.15864-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191217201550.15864-1-andrew.cooper3@citrix.com>
References: <20191217201550.15864-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 4/4] tools/dombuilder: Don't allocate
 dom->p2m_host[] for translated domains
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Varad Gautam <vrd@amazon.de>, Ian Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

eGNfZG9tX3AybSgpIGFuZCBkb20tPnAybV9ob3N0W10gaW1wbGVtZW50IGEgbGluZWFyIHRyYW5z
Zm9ybSBmb3IgdHJhbnNsYXRlZApkb21haW5zLCBidXQgd2FzdGUgYSBzdWJzdGFudGlhbCBjaHVu
ayBvZiBSQU0gZG9pbmcgc28uCgpBUk0gbGl0ZXJhbGx5IG5ldmVyIHJlYWRzIGRvbS0+cDJtX2hv
c3RbXSAoYmVjYXVzZSBvZiB0aGUgeGNfZG9tX3RyYW5zbGF0ZWQoKQpzaG9ydCBjaXJjdWl0IGlu
IHhjX2RvbV9wMm0oKSkuICBEcm9wIGl0IGFsbC4KCng4NiBIVk0gZG9lcyB1c2UgZG9tLT5wMm1f
aG9zdFtdIGZvciB4Y19kb21haW5fcG9wdWxhdGVfcGh5c21hcF9leGFjdCgpIGNhbGxzCndoZW4g
cG9wdWxhdGluZyA0ayBwYWdlcy4gIFJldXNlIHRoZSBzYW1lIHRhY3RpYyBmcm9tIDJNLzFHIHJh
bmdlcyBhbmQgdXNlIGFuCm9uLXN0YWNrIGFycmF5IGluc3RlYWQuICBEcm9wIHRoZSBtZW1vcnkg
YWxsb2NhdGlvbi4KCng4NiBQViBndWVzdHMgZG8gdXNlIGRvbS0+cDJtX2hvc3RbXSBhcyBhIG5v
bi1pZGVudGl0eSB0cmFuc2Zvcm0uICBSZW5hbWUgdGhlCmZpZWxkIHRvIHB2X3AybSB0byBtYWtl
IGl0IGNsZWFyIGl0IGlzIFBWLW9ubHkuCgpObyBjaGFuZ2UgaW4gdGhlIGNvbnN0cnVjdGVkIGd1
ZXN0cy4KClJlcG9ydGVkLWJ5OiBWYXJhZCBHYXV0YW0gPHZyZEBhbWF6b24uZGU+ClJlcG9ydGVk
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IElhbiBKYWNr
c29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ0M6IEp1bGllbiBH
cmFsbCA8anVsaWVuQHhlbi5vcmc+CkNDOiBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0Jh
YmNodWtAZXBhbS5jb20+CkNDOiBWYXJhZCBHYXV0YW0gPHZyZEBhbWF6b24uZGU+Ci0tLQogc3R1
YmRvbS9ncnViL2tleGVjLmMgICAgICAgICB8IDI4ICsrKysrKysrLS0tLS0tLS0tCiB0b29scy9s
aWJ4Yy9pbmNsdWRlL3hjX2RvbS5oIHwgMTkgKysrKysrLS0tLS0tCiB0b29scy9saWJ4Yy94Y19k
b21fYXJtLmMgICAgIHwgIDkgLS0tLS0tCiB0b29scy9saWJ4Yy94Y19kb21feDg2LmMgICAgIHwg
NzIgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDQgZmlsZXMg
Y2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKSwgNzYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
c3R1YmRvbS9ncnViL2tleGVjLmMgYi9zdHViZG9tL2dydWIva2V4ZWMuYwppbmRleCAxMDg5MWVh
YmNjLi4wZTY4Yjk2OWEyIDEwMDY0NAotLS0gYS9zdHViZG9tL2dydWIva2V4ZWMuYworKysgYi9z
dHViZG9tL2dydWIva2V4ZWMuYwpAQCAtODcsMTcgKzg3LDE3IEBAIHN0YXRpYyB2b2lkIGRvX2V4
Y2hhbmdlKHN0cnVjdCB4Y19kb21faW1hZ2UgKmRvbSwgeGVuX3Bmbl90IHRhcmdldF9wZm4sIHhl
bl9wZm5fCiAgICAgeGVuX3Bmbl90IHRhcmdldF9tZm47CiAKICAgICBmb3IgKHNvdXJjZV9wZm4g
PSAwOyBzb3VyY2VfcGZuIDwgc3RhcnRfaW5mby5ucl9wYWdlczsgc291cmNlX3BmbisrKQotICAg
ICAgICBpZiAoZG9tLT5wMm1faG9zdFtzb3VyY2VfcGZuXSA9PSBzb3VyY2VfbWZuKQorICAgICAg
ICBpZiAoZG9tLT5wdl9wMm1bc291cmNlX3Bmbl0gPT0gc291cmNlX21mbikKICAgICAgICAgICAg
IGJyZWFrOwogICAgIEFTU0VSVChzb3VyY2VfcGZuIDwgc3RhcnRfaW5mby5ucl9wYWdlcyk7CiAK
LSAgICB0YXJnZXRfbWZuID0gZG9tLT5wMm1faG9zdFt0YXJnZXRfcGZuXTsKKyAgICB0YXJnZXRf
bWZuID0gZG9tLT5wdl9wMm1bdGFyZ2V0X3Bmbl07CiAKICAgICAvKiBQdXQgdGFyZ2V0IE1GTiBh
dCBzb3VyY2UgUEZOICovCi0gICAgZG9tLT5wMm1faG9zdFtzb3VyY2VfcGZuXSA9IHRhcmdldF9t
Zm47CisgICAgZG9tLT5wdl9wMm1bc291cmNlX3Bmbl0gPSB0YXJnZXRfbWZuOwogCiAgICAgLyog
UHV0IHNvdXJjZSBNRk4gYXQgdGFyZ2V0IFBGTiAqLwotICAgIGRvbS0+cDJtX2hvc3RbdGFyZ2V0
X3Bmbl0gPSBzb3VyY2VfbWZuOworICAgIGRvbS0+cHZfcDJtW3RhcmdldF9wZm5dID0gc291cmNl
X21mbjsKIH0KIAogaW50IGtleGVjX2FsbG9jYXRlKHN0cnVjdCB4Y19kb21faW1hZ2UgKmRvbSkK
QEAgLTExMCw3ICsxMTAsNyBAQCBpbnQga2V4ZWNfYWxsb2NhdGUoc3RydWN0IHhjX2RvbV9pbWFn
ZSAqZG9tKQogICAgIHBhZ2VzX21vdmVkMnBmbnMgPSByZWFsbG9jKHBhZ2VzX21vdmVkMnBmbnMs
IG5ld19hbGxvY2F0ZWQgKiBzaXplb2YoKnBhZ2VzX21vdmVkMnBmbnMpKTsKICAgICBmb3IgKGkg
PSBhbGxvY2F0ZWQ7IGkgPCBuZXdfYWxsb2NhdGVkOyBpKyspIHsKICAgICAgICAgLyogRXhjaGFu
Z2Ugb2xkIHBhZ2Ugb2YgUEZOIGkgd2l0aCBhIG5ld2x5IGFsbG9jYXRlZCBwYWdlLiAgKi8KLSAg
ICAgICAgeGVuX3Bmbl90IG9sZF9tZm4gPSBkb20tPnAybV9ob3N0W2ldOworICAgICAgICB4ZW5f
cGZuX3Qgb2xkX21mbiA9IGRvbS0+cHZfcDJtW2ldOwogICAgICAgICB4ZW5fcGZuX3QgbmV3X3Bm
bjsKICAgICAgICAgeGVuX3Bmbl90IG5ld19tZm47CiAKQEAgLTEyMiw3ICsxMjIsNyBAQCBpbnQg
a2V4ZWNfYWxsb2NhdGUoc3RydWN0IHhjX2RvbV9pbWFnZSAqZG9tKQogCS8qCiAJICogSWYgUEZO
IG9mIG5ld2x5IGFsbG9jYXRlZCBwYWdlIChuZXdfcGZuKSBpcyBsZXNzIHRoZW4gY3VycmVudGx5
CiAJICogcmVxdWVzdGVkIFBGTiAoaSkgdGhlbiBsb29rIGZvciByZWxldmFudCBQRk4vTUZOIHBh
aXIuIEluIHRoaXMKLQkgKiBzaXR1YXRpb24gZG9tLT5wMm1faG9zdFtuZXdfcGZuXSBubyBsb25n
ZXIgY29udGFpbnMgcHJvcGVyIE1GTgorCSAqIHNpdHVhdGlvbiBkb20tPnB2X3AybVtuZXdfcGZu
XSBubyBsb25nZXIgY29udGFpbnMgcHJvcGVyIE1GTgogCSAqIGJlY2F1c2Ugb3JpZ2luYWwgcGFn
ZSB3aXRoIG5ld19wZm4gd2FzIG1vdmVkIGVhcmxpZXIKIAkgKiB0byBkaWZmZXJlbnQgbG9jYXRp
b24uCiAJICovCkBAIC0xMzIsMTAgKzEzMiwxMCBAQCBpbnQga2V4ZWNfYWxsb2NhdGUoc3RydWN0
IHhjX2RvbV9pbWFnZSAqZG9tKQogCXBhZ2VzX21vdmVkMnBmbnNbaV0gPSBuZXdfcGZuOwogCiAg
ICAgICAgIC8qIFB1dCBvbGQgcGFnZSBhdCBuZXcgUEZOICovCi0gICAgICAgIGRvbS0+cDJtX2hv
c3RbbmV3X3Bmbl0gPSBvbGRfbWZuOworICAgICAgICBkb20tPnB2X3AybVtuZXdfcGZuXSA9IG9s
ZF9tZm47CiAKICAgICAgICAgLyogUHV0IG5ldyBwYWdlIGF0IFBGTiBpICovCi0gICAgICAgIGRv
bS0+cDJtX2hvc3RbaV0gPSBuZXdfbWZuOworICAgICAgICBkb20tPnB2X3AybVtpXSA9IG5ld19t
Zm47CiAgICAgfQogCiAgICAgYWxsb2NhdGVkID0gbmV3X2FsbG9jYXRlZDsKQEAgLTI4MiwxMSAr
MjgyLDExIEBAIHZvaWQga2V4ZWModm9pZCAqa2VybmVsLCBsb25nIGtlcm5lbF9zaXplLCB2b2lk
ICptb2R1bGUsIGxvbmcgbW9kdWxlX3NpemUsIGNoYXIKICAgICBkb20tPnAybV9zaXplID0gZG9t
LT50b3RhbF9wYWdlczsKIAogICAgIC8qIHNldHVwIGluaXRpYWwgcDJtICovCi0gICAgZG9tLT5w
Mm1faG9zdCA9IG1hbGxvYyhzaXplb2YoKmRvbS0+cDJtX2hvc3QpICogZG9tLT5wMm1fc2l6ZSk7
CisgICAgZG9tLT5wdl9wMm0gPSBtYWxsb2Moc2l6ZW9mKCpkb20tPnB2X3AybSkgKiBkb20tPnAy
bV9zaXplKTsKIAogICAgIC8qIFN0YXJ0IHdpdGggb3VyIGN1cnJlbnQgUDJNICovCiAgICAgZm9y
IChpID0gMDsgaSA8IGRvbS0+cDJtX3NpemU7IGkrKykKLSAgICAgICAgZG9tLT5wMm1faG9zdFtp
XSA9IHBmbl90b19tZm4oaSk7CisgICAgICAgIGRvbS0+cHZfcDJtW2ldID0gcGZuX3RvX21mbihp
KTsKIAogICAgIGlmICggKHJjID0geGNfZG9tX2J1aWxkX2ltYWdlKGRvbSkpICE9IDAgKSB7CiAg
ICAgICAgIHByaW50aygieGNfZG9tX2J1aWxkX2ltYWdlIHJldHVybmVkICVkXG4iLCByYyk7CkBA
IC0zNzMsNyArMzczLDcgQEAgdm9pZCBrZXhlYyh2b2lkICprZXJuZWwsIGxvbmcga2VybmVsX3Np
emUsIHZvaWQgKm1vZHVsZSwgbG9uZyBtb2R1bGVfc2l6ZSwgY2hhcgogICAgIF9ib290X29sZHBk
bWZuID0gdmlydF90b19tZm4oc3RhcnRfaW5mby5wdF9iYXNlKTsKICAgICBERUJVRygiYm9vdCBv
bGQgcGQgbWZuICVseFxuIiwgX2Jvb3Rfb2xkcGRtZm4pOwogICAgIERFQlVHKCJib290IHBkIHZp
cnQgJWx4XG4iLCBkb20tPnBndGFibGVzX3NlZy52c3RhcnQpOwotICAgIF9ib290X3BkbWZuID0g
ZG9tLT5wMm1faG9zdFtQSFlTX1BGTihkb20tPnBndGFibGVzX3NlZy52c3RhcnQgLSBkb20tPnBh
cm1zLnZpcnRfYmFzZSldOworICAgIF9ib290X3BkbWZuID0gZG9tLT5wdl9wMm1bUEhZU19QRk4o
ZG9tLT5wZ3RhYmxlc19zZWcudnN0YXJ0IC0gZG9tLT5wYXJtcy52aXJ0X2Jhc2UpXTsKICAgICBE
RUJVRygiYm9vdCBwZCBtZm4gJWx4XG4iLCBfYm9vdF9wZG1mbik7CiAgICAgX2Jvb3Rfc3RhY2sg
PSBfYm9vdF90YXJnZXQgKyBQQUdFX1NJWkU7CiAgICAgREVCVUcoImJvb3Qgc3RhY2sgJWx4XG4i
LCBfYm9vdF9zdGFjayk7CkBAIC0zODQsMTMgKzM4NCwxMyBAQCB2b2lkIGtleGVjKHZvaWQgKmtl
cm5lbCwgbG9uZyBrZXJuZWxfc2l6ZSwgdm9pZCAqbW9kdWxlLCBsb25nIG1vZHVsZV9zaXplLCBj
aGFyCiAKICAgICAvKiBLZWVwIG9ubHkgdXNlZnVsIGVudHJpZXMgKi8KICAgICBmb3IgKG5yX20y
cF91cGRhdGVzID0gcGZuID0gMDsgcGZuIDwgc3RhcnRfaW5mby5ucl9wYWdlczsgcGZuKyspCi0g
ICAgICAgIGlmIChkb20tPnAybV9ob3N0W3Bmbl0gIT0gcGZuX3RvX21mbihwZm4pKQorICAgICAg
ICBpZiAoZG9tLT5wdl9wMm1bcGZuXSAhPSBwZm5fdG9fbWZuKHBmbikpCiAgICAgICAgICAgICBu
cl9tMnBfdXBkYXRlcysrOwogCiAgICAgbTJwX3VwZGF0ZXMgPSBtYWxsb2Moc2l6ZW9mKCptMnBf
dXBkYXRlcykgKiBucl9tMnBfdXBkYXRlcyk7CiAgICAgZm9yIChpID0gcGZuID0gMDsgcGZuIDwg
c3RhcnRfaW5mby5ucl9wYWdlczsgcGZuKyspCi0gICAgICAgIGlmIChkb20tPnAybV9ob3N0W3Bm
bl0gIT0gcGZuX3RvX21mbihwZm4pKSB7Ci0gICAgICAgICAgICBtMnBfdXBkYXRlc1tpXS5wdHIg
PSBQRk5fUEhZUyhkb20tPnAybV9ob3N0W3Bmbl0pIHwgTU1VX01BQ0hQSFlTX1VQREFURTsKKyAg
ICAgICAgaWYgKGRvbS0+cHZfcDJtW3Bmbl0gIT0gcGZuX3RvX21mbihwZm4pKSB7CisgICAgICAg
ICAgICBtMnBfdXBkYXRlc1tpXS5wdHIgPSBQRk5fUEhZUyhkb20tPnB2X3AybVtwZm5dKSB8IE1N
VV9NQUNIUEhZU19VUERBVEU7CiAgICAgICAgICAgICBtMnBfdXBkYXRlc1tpXS52YWwgPSBwZm47
CiAgICAgICAgICAgICBpKys7CiAgICAgICAgIH0KZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhjL2lu
Y2x1ZGUveGNfZG9tLmggYi90b29scy9saWJ4Yy9pbmNsdWRlL3hjX2RvbS5oCmluZGV4IGI3ZDBm
YWY3ZTEuLmQyZTMxNmYzNWUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhjL2luY2x1ZGUveGNfZG9t
LmgKKysrIGIvdG9vbHMvbGlieGMvaW5jbHVkZS94Y19kb20uaApAQCAtMTIzLDE2ICsxMjMsMTIg
QEAgc3RydWN0IHhjX2RvbV9pbWFnZSB7CiAKICAgICAvKiBvdGhlciBzdGF0ZSBpbmZvICovCiAg
ICAgdWludDMyX3QgZl9hY3RpdmVbWEVORkVBVF9OUl9TVUJNQVBTXTsKKwogICAgIC8qCi0gICAg
ICogcDJtX2hvc3QgbWFwcyBndWVzdCBwaHlzaWNhbCBhZGRyZXNzZXMgYW4gb2Zmc2V0IGZyb20K
LSAgICAgKiByYW1iYXNlX3BmbiAoc2VlIGJlbG93KSBpbnRvIGdmbnMuCi0gICAgICoKLSAgICAg
KiBGb3IgYSBwdXJlIFBWIGd1ZXN0IHRoaXMgbWVhbnMgdGhhdCBpdCBtYXBzIEdQRk5zIGludG8g
TUZOcyBmb3IKLSAgICAgKiBhIGh5YnJpZCBndWVzdCB0aGlzIG1lYW5zIHRoYXQgaXQgbWFwcyBH
UEZOcyB0byBHUEZOUy4KLSAgICAgKgotICAgICAqIE5vdGUgdGhhdCB0aGUgaW5wdXQgaXMgb2Zm
c2V0IGJ5IHJhbWJhc2UuCisgICAgICogcHZfcDJtIGlzIHNwZWNpZmljIHRvIHg4NiBQViBndWVz
dHMsIGFuZCBtYXBzIEdGTnMgdG8gTUZOcy4gIEl0IGlzCisgICAgICogZXZlbnR1YWxseSBjb3Bp
ZWQgaW50byBndWVzdCBjb250ZXh0LgogICAgICAqLwotICAgIHhlbl9wZm5fdCAqcDJtX2hvc3Q7
CisgICAgeGVuX3Bmbl90ICpwdl9wMm07CiAKICAgICAvKiBwaHlzaWNhbCBtZW1vcnkKICAgICAg
KgpAQCAtNDMzLDkgKzQyOSwxMiBAQCBzdGF0aWMgaW5saW5lIHhlbl9wZm5fdCB4Y19kb21fcDJt
KHN0cnVjdCB4Y19kb21faW1hZ2UgKmRvbSwgeGVuX3Bmbl90IHBmbikKIHsKICAgICBpZiAoIHhj
X2RvbV90cmFuc2xhdGVkKGRvbSkgKQogICAgICAgICByZXR1cm4gcGZuOwotICAgIGlmIChwZm4g
PCBkb20tPnJhbWJhc2VfcGZuIHx8IHBmbiA+PSBkb20tPnJhbWJhc2VfcGZuICsgZG9tLT50b3Rh
bF9wYWdlcykKKworICAgIC8qIHg4NiBQViBvbmx5IG5vdy4gKi8KKyAgICBpZiAoIHBmbiA+PSBk
b20tPnRvdGFsX3BhZ2VzICkKICAgICAgICAgcmV0dXJuIElOVkFMSURfTUZOOwotICAgIHJldHVy
biBkb20tPnAybV9ob3N0W3BmbiAtIGRvbS0+cmFtYmFzZV9wZm5dOworCisgICAgcmV0dXJuIGRv
bS0+cHZfcDJtW3Bmbl07CiB9CiAKICNlbmRpZiAvKiBfWENfRE9NX0ggKi8KZGlmZiAtLWdpdCBh
L3Rvb2xzL2xpYnhjL3hjX2RvbV9hcm0uYyBiL3Rvb2xzL2xpYnhjL3hjX2RvbV9hcm0uYwppbmRl
eCA3ZTBmYjkxNjlmLi45MzE0MDRjMjIyIDEwMDY0NAotLS0gYS90b29scy9saWJ4Yy94Y19kb21f
YXJtLmMKKysrIGIvdG9vbHMvbGlieGMveGNfZG9tX2FybS5jCkBAIC0zNDgsOSArMzQ4LDYgQEAg
c3RhdGljIGludCBwb3B1bGF0ZV9ndWVzdF9tZW1vcnkoc3RydWN0IHhjX2RvbV9pbWFnZSAqZG9t
LAogICAgICAgICB9CiAgICAgfQogCi0gICAgZm9yICggcGZuID0gMDsgcGZuIDwgbnJfcGZuczsg
cGZuKysgKQotICAgICAgICBkb20tPnAybV9ob3N0W3Bmbl0gPSBiYXNlX3BmbiArIHBmbjsKLQog
b3V0OgogICAgIGZyZWUoZXh0ZW50cyk7CiAgICAgcmV0dXJuIHJjIDwgMCA/IHJjIDogMDsKQEAg
LTM1OSw3ICszNTYsNiBAQCBzdGF0aWMgaW50IHBvcHVsYXRlX2d1ZXN0X21lbW9yeShzdHJ1Y3Qg
eGNfZG9tX2ltYWdlICpkb20sCiBzdGF0aWMgaW50IG1lbWluaXQoc3RydWN0IHhjX2RvbV9pbWFn
ZSAqZG9tKQogewogICAgIGludCBpLCByYzsKLSAgICB4ZW5fcGZuX3QgcGZuOwogICAgIHVpbnQ2
NF90IG1vZGJhc2U7CiAKICAgICB1aW50NjRfdCByYW1zaXplID0gKHVpbnQ2NF90KWRvbS0+dG90
YWxfcGFnZXMgPDwgWENfUEFHRV9TSElGVDsKQEAgLTQyMywxMSArNDE5LDYgQEAgc3RhdGljIGlu
dCBtZW1pbml0KHN0cnVjdCB4Y19kb21faW1hZ2UgKmRvbSkKICAgICBhc3NlcnQocmFtc2l6ZSA9
PSAwKTsgLyogVG9vIG11Y2ggUkFNIGlzIHJlamVjdGVkIGFib3ZlICovCiAKICAgICBkb20tPnAy
bV9zaXplID0gcDJtX3NpemU7Ci0gICAgZG9tLT5wMm1faG9zdCA9IHhjX2RvbV9tYWxsb2MoZG9t
LCBzaXplb2YoeGVuX3Bmbl90KSAqIHAybV9zaXplKTsKLSAgICBpZiAoIGRvbS0+cDJtX2hvc3Qg
PT0gTlVMTCApCi0gICAgICAgIHJldHVybiAtRUlOVkFMOwotICAgIGZvciAoIHBmbiA9IDA7IHBm
biA8IHAybV9zaXplOyBwZm4rKyApCi0gICAgICAgIGRvbS0+cDJtX2hvc3RbcGZuXSA9IElOVkFM
SURfUEZOOwogCiAgICAgLyogc2V0dXAgaW5pdGlhbCBwMm0gYW5kIGFsbG9jYXRlIGd1ZXN0IG1l
bW9yeSAqLwogICAgIGZvciAoIGkgPSAwOyBpIDwgR1VFU1RfUkFNX0JBTktTICYmIGRvbS0+cmFt
YmFua19zaXplW2ldOyBpKysgKQpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMveGNfZG9tX3g4Ni5j
IGIvdG9vbHMvbGlieGMveGNfZG9tX3g4Ni5jCmluZGV4IGYyMTY2MmM4YjkuLjgxOWFmY2IwM2Yg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhjL3hjX2RvbV94ODYuYworKysgYi90b29scy9saWJ4Yy94
Y19kb21feDg2LmMKQEAgLTMxOCw3ICszMTgsNyBAQCBzdGF0aWMgeGVuX3Bmbl90IG1vdmVfbDNf
YmVsb3dfNEcoc3RydWN0IHhjX2RvbV9pbWFnZSAqZG9tLAogICAgIGlmICggIW5ld19sM21mbiAp
CiAgICAgICAgIGdvdG8gb3V0OwogCi0gICAgcDJtX2d1ZXN0W2wzcGZuXSA9IGRvbS0+cDJtX2hv
c3RbbDNwZm5dID0gbmV3X2wzbWZuOworICAgIHAybV9ndWVzdFtsM3Bmbl0gPSBkb20tPnB2X3Ay
bVtsM3Bmbl0gPSBuZXdfbDNtZm47CiAKICAgICBpZiAoIHhjX2FkZF9tbXVfdXBkYXRlKGRvbS0+
eGNoLCBtbXUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAoKCh1bnNpZ25lZCBsb25nIGxv
bmcpbmV3X2wzbWZuKQpAQCAtNDUwLDExICs0NTAsMTEgQEAgc3RhdGljIGludCBzZXR1cF9wZ3Rh
Ymxlc194ODZfMzJfcGFlKHN0cnVjdCB4Y19kb21faW1hZ2UgKmRvbSkKICAgICB1aW50MzJfdCAq
cDJtX2d1ZXN0ID0gZG9teDg2LT5wMm1fZ3Vlc3Q7CiAgICAgeGVuX3Bmbl90IGwzbWZuLCBsM3Bm
biwgaTsKIAotICAgIC8qIENvcHkgZG9tLT5wMm1faG9zdFtdIGludG8gdGhlIGd1ZXN0LiAqLwor
ICAgIC8qIENvcHkgZG9tLT5wdl9wMm1bXSBpbnRvIHRoZSBndWVzdC4gKi8KICAgICBmb3IgKCBp
ID0gMDsgaSA8IGRvbS0+cDJtX3NpemU7ICsraSApCiAgICAgewotICAgICAgICBpZiAoIGRvbS0+
cDJtX2hvc3RbaV0gIT0gSU5WQUxJRF9QRk4gKQotICAgICAgICAgICAgcDJtX2d1ZXN0W2ldID0g
ZG9tLT5wMm1faG9zdFtpXTsKKyAgICAgICAgaWYgKCBkb20tPnB2X3AybVtpXSAhPSBJTlZBTElE
X1BGTiApCisgICAgICAgICAgICBwMm1fZ3Vlc3RbaV0gPSBkb20tPnB2X3AybVtpXTsKICAgICAg
ICAgZWxzZQogICAgICAgICAgICAgcDJtX2d1ZXN0W2ldID0gLTE7CiAgICAgfQpAQCAtNTA1LDEx
ICs1MDUsMTEgQEAgc3RhdGljIGludCBzZXR1cF9wZ3RhYmxlc194ODZfNjQoc3RydWN0IHhjX2Rv
bV9pbWFnZSAqZG9tKQogICAgIHVpbnQ2NF90ICpwMm1fZ3Vlc3QgPSBkb214ODYtPnAybV9ndWVz
dDsKICAgICB4ZW5fcGZuX3QgaTsKIAotICAgIC8qIENvcHkgZG9tLT5wMm1faG9zdFtdIGludG8g
dGhlIGd1ZXN0LiAqLworICAgIC8qIENvcHkgZG9tLT5wdl9wMm1bXSBpbnRvIHRoZSBndWVzdC4g
Ki8KICAgICBmb3IgKCBpID0gMDsgaSA8IGRvbS0+cDJtX3NpemU7ICsraSApCiAgICAgewotICAg
ICAgICBpZiAoIGRvbS0+cDJtX2hvc3RbaV0gIT0gSU5WQUxJRF9QRk4gKQotICAgICAgICAgICAg
cDJtX2d1ZXN0W2ldID0gZG9tLT5wMm1faG9zdFtpXTsKKyAgICAgICAgaWYgKCBkb20tPnB2X3Ay
bVtpXSAhPSBJTlZBTElEX1BGTiApCisgICAgICAgICAgICBwMm1fZ3Vlc3RbaV0gPSBkb20tPnB2
X3AybVtpXTsKICAgICAgICAgZWxzZQogICAgICAgICAgICAgcDJtX2d1ZXN0W2ldID0gLTE7CiAg
ICAgfQpAQCAtMTI0NSwxMSArMTI0NSwxMSBAQCBzdGF0aWMgaW50IG1lbWluaXRfcHYoc3RydWN0
IHhjX2RvbV9pbWFnZSAqZG9tKQogICAgICAgICByZXR1cm4gLUVJTlZBTDsKICAgICB9CiAKLSAg
ICBkb20tPnAybV9ob3N0ID0geGNfZG9tX21hbGxvYyhkb20sIHNpemVvZih4ZW5fcGZuX3QpICog
ZG9tLT5wMm1fc2l6ZSk7Ci0gICAgaWYgKCBkb20tPnAybV9ob3N0ID09IE5VTEwgKQorICAgIGRv
bS0+cHZfcDJtID0geGNfZG9tX21hbGxvYyhkb20sIHNpemVvZih4ZW5fcGZuX3QpICogZG9tLT5w
Mm1fc2l6ZSk7CisgICAgaWYgKCBkb20tPnB2X3AybSA9PSBOVUxMICkKICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7CiAgICAgZm9yICggcGZuID0gMDsgcGZuIDwgZG9tLT5wMm1fc2l6ZTsgcGZuKysg
KQotICAgICAgICBkb20tPnAybV9ob3N0W3Bmbl0gPSBJTlZBTElEX1BGTjsKKyAgICAgICAgZG9t
LT5wdl9wMm1bcGZuXSA9IElOVkFMSURfUEZOOwogCiAgICAgLyogYWxsb2NhdGUgZ3Vlc3QgbWVt
b3J5ICovCiAgICAgZm9yICggaSA9IDA7IGkgPCBucl92bWVtcmFuZ2VzOyBpKysgKQpAQCAtMTI2
OSw3ICsxMjY5LDcgQEAgc3RhdGljIGludCBtZW1pbml0X3B2KHN0cnVjdCB4Y19kb21faW1hZ2Ug
KmRvbSkKICAgICAgICAgcGZuX2Jhc2UgPSB2bWVtcmFuZ2VzW2ldLnN0YXJ0ID4+IFBBR0VfU0hJ
RlQ7CiAKICAgICAgICAgZm9yICggcGZuID0gcGZuX2Jhc2U7IHBmbiA8IHBmbl9iYXNlK3BhZ2Vz
OyBwZm4rKyApCi0gICAgICAgICAgICBkb20tPnAybV9ob3N0W3Bmbl0gPSBwZm47CisgICAgICAg
ICAgICBkb20tPnB2X3AybVtwZm5dID0gcGZuOwogCiAgICAgICAgIHBmbl9iYXNlX2lkeCA9IHBm
bl9iYXNlOwogICAgICAgICB3aGlsZSAoIHN1cGVyX3BhZ2VzICkgewpAQCAtMTI3OSw3ICsxMjc5
LDcgQEAgc3RhdGljIGludCBtZW1pbml0X3B2KHN0cnVjdCB4Y19kb21faW1hZ2UgKmRvbSkKICAg
ICAgICAgICAgIGZvciAoIHBmbiA9IHBmbl9iYXNlX2lkeCwgaiA9IDA7CiAgICAgICAgICAgICAg
ICAgICBwZm4gPCBwZm5fYmFzZV9pZHggKyAoY291bnQgPDwgU1VQRVJQQUdFXzJNQl9TSElGVCk7
CiAgICAgICAgICAgICAgICAgICBwZm4gKz0gU1VQRVJQQUdFXzJNQl9OUl9QRk5TLCBqKysgKQot
ICAgICAgICAgICAgICAgIGV4dGVudHNbal0gPSBkb20tPnAybV9ob3N0W3Bmbl07CisgICAgICAg
ICAgICAgICAgZXh0ZW50c1tqXSA9IGRvbS0+cHZfcDJtW3Bmbl07CiAgICAgICAgICAgICByYyA9
IHhjX2RvbWFpbl9wb3B1bGF0ZV9waHlzbWFwKGRvbS0+eGNoLCBkb20tPmd1ZXN0X2RvbWlkLCBj
b3VudCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU1VQRVJQ
QUdFXzJNQl9TSElGVCwgbWVtZmxhZ3MsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGV4dGVudHMpOwpAQCAtMTI5Miw3ICsxMjkyLDcgQEAgc3RhdGljIGludCBt
ZW1pbml0X3B2KHN0cnVjdCB4Y19kb21faW1hZ2UgKmRvbSkKICAgICAgICAgICAgIHsKICAgICAg
ICAgICAgICAgICBtZm4gPSBleHRlbnRzW2pdOwogICAgICAgICAgICAgICAgIGZvciAoIGsgPSAw
OyBrIDwgU1VQRVJQQUdFXzJNQl9OUl9QRk5TOyBrKyssIHBmbisrICkKLSAgICAgICAgICAgICAg
ICAgICAgZG9tLT5wMm1faG9zdFtwZm5dID0gbWZuICsgazsKKyAgICAgICAgICAgICAgICAgICAg
ZG9tLT5wdl9wMm1bcGZuXSA9IG1mbiArIGs7CiAgICAgICAgICAgICB9CiAgICAgICAgICAgICBw
Zm5fYmFzZV9pZHggPSBwZm47CiAgICAgICAgIH0KQEAgLTEzMDEsNyArMTMwMSw3IEBAIHN0YXRp
YyBpbnQgbWVtaW5pdF9wdihzdHJ1Y3QgeGNfZG9tX2ltYWdlICpkb20pCiAgICAgICAgIHsKICAg
ICAgICAgICAgIGFsbG9jc3ogPSBtaW5fdCh1aW50NjRfdCwgMTAyNCAqIDEwMjQsIHBhZ2VzIC0g
aik7CiAgICAgICAgICAgICByYyA9IHhjX2RvbWFpbl9wb3B1bGF0ZV9waHlzbWFwX2V4YWN0KGRv
bS0+eGNoLCBkb20tPmd1ZXN0X2RvbWlkLAotICAgICAgICAgICAgICAgICAgICAgYWxsb2Nzeiwg
MCwgbWVtZmxhZ3MsICZkb20tPnAybV9ob3N0W3Bmbl9iYXNlICsgal0pOworICAgICAgICAgICAg
ICAgICAgICAgYWxsb2NzeiwgMCwgbWVtZmxhZ3MsICZkb20tPnB2X3AybVtwZm5fYmFzZSArIGpd
KTsKIAogICAgICAgICAgICAgaWYgKCByYyApCiAgICAgICAgICAgICB7CkBAIC0xNDI4LDI1ICsx
NDI4LDYgQEAgc3RhdGljIGludCBtZW1pbml0X2h2bShzdHJ1Y3QgeGNfZG9tX2ltYWdlICpkb20p
CiAgICAgfQogCiAgICAgZG9tLT5wMm1fc2l6ZSA9IHAybV9zaXplOwotICAgIGRvbS0+cDJtX2hv
c3QgPSB4Y19kb21fbWFsbG9jKGRvbSwgc2l6ZW9mKHhlbl9wZm5fdCkgKgotICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBkb20tPnAybV9zaXplKTsKLSAgICBpZiAoIGRvbS0+
cDJtX2hvc3QgPT0gTlVMTCApCi0gICAgewotICAgICAgICBET01QUklOVEYoIkNvdWxkIG5vdCBh
bGxvY2F0ZSBwMm0iKTsKLSAgICAgICAgZ290byBlcnJvcl9vdXQ7Ci0gICAgfQotCi0gICAgZm9y
ICggaSA9IDA7IGkgPCBwMm1fc2l6ZTsgaSsrICkKLSAgICAgICAgZG9tLT5wMm1faG9zdFtpXSA9
ICgoeGVuX3Bmbl90KS0xKTsKLSAgICBmb3IgKCB2bWVtaWQgPSAwOyB2bWVtaWQgPCBucl92bWVt
cmFuZ2VzOyB2bWVtaWQrKyApCi0gICAgewotICAgICAgICB1aW50NjRfdCBwZm47Ci0KLSAgICAg
ICAgZm9yICggcGZuID0gdm1lbXJhbmdlc1t2bWVtaWRdLnN0YXJ0ID4+IFBBR0VfU0hJRlQ7Ci0g
ICAgICAgICAgICAgIHBmbiA8IHZtZW1yYW5nZXNbdm1lbWlkXS5lbmQgPj4gUEFHRV9TSElGVDsK
LSAgICAgICAgICAgICAgcGZuKysgKQotICAgICAgICAgICAgZG9tLT5wMm1faG9zdFtwZm5dID0g
cGZuOwotICAgIH0KIAogICAgIC8qCiAgICAgICogVHJ5IHRvIGNsYWltIHBhZ2VzIGZvciBlYXJs
eSB3YXJuaW5nIG9mIGluc3VmZmljaWVudCBtZW1vcnkgYXZhaWxhYmxlLgpAQCAtMTQ4OCwxNCAr
MTQ2OSwxNiBAQCBzdGF0aWMgaW50IG1lbWluaXRfaHZtKHN0cnVjdCB4Y19kb21faW1hZ2UgKmRv
bSkKICAgICAgKiBXZSBhdHRlbXB0IHRvIGFsbG9jYXRlIDFHQiBwYWdlcyBpZiBwb3NzaWJsZS4g
SXQgZmFsbHMgYmFjayBvbiAyTUIKICAgICAgKiBwYWdlcyBpZiAxR0IgYWxsb2NhdGlvbiBmYWls
cy4gNEtCIHBhZ2VzIHdpbGwgYmUgdXNlZCBldmVudHVhbGx5IGlmCiAgICAgICogYm90aCBmYWls
LgotICAgICAqIAotICAgICAqIFVuZGVyIDJNQiBtb2RlLCB3ZSBhbGxvY2F0ZSBwYWdlcyBpbiBi
YXRjaGVzIG9mIG5vIG1vcmUgdGhhbiA4TUIgdG8gCi0gICAgICogZW5zdXJlIHRoYXQgd2UgY2Fu
IGJlIHByZWVtcHRlZCBhbmQgaGVuY2UgZG9tMCByZW1haW5zIHJlc3BvbnNpdmUuCiAgICAgICov
CiAgICAgaWYgKCBkb20tPmRldmljZV9tb2RlbCApCiAgICAgeworICAgICAgICB4ZW5fcGZuX3Qg
ZXh0ZW50c1sweGEwXTsKKworICAgICAgICBmb3IgKCBpID0gMDsgaSA8IEFSUkFZX1NJWkUoZXh0
ZW50cyk7ICsraSApCisgICAgICAgICAgICBleHRlbnRzW2ldID0gaTsKKwogICAgICAgICByYyA9
IHhjX2RvbWFpbl9wb3B1bGF0ZV9waHlzbWFwX2V4YWN0KAotICAgICAgICAgICAgeGNoLCBkb21p
ZCwgMHhhMCwgMCwgbWVtZmxhZ3MsICZkb20tPnAybV9ob3N0WzB4MDBdKTsKKyAgICAgICAgICAg
IHhjaCwgZG9taWQsIDB4YTAsIDAsIG1lbWZsYWdzLCBleHRlbnRzKTsKICAgICAgICAgaWYgKCBy
YyAhPSAwICkKICAgICAgICAgewogICAgICAgICAgICAgRE9NUFJJTlRGKCJDb3VsZCBub3QgcG9w
dWxhdGUgbG93IG1lbW9yeSAoPCAweEEwKS5cbiIpOwpAQCAtMTUzOCw3ICsxNTIxLDcgQEAgc3Rh
dGljIGludCBtZW1pbml0X2h2bShzdHJ1Y3QgeGNfZG9tX2ltYWdlICpkb20pCiAgICAgICAgICAg
ICBpZiAoIGNvdW50ID4gbWF4X3BhZ2VzICkKICAgICAgICAgICAgICAgICBjb3VudCA9IG1heF9w
YWdlczsKIAotICAgICAgICAgICAgY3VyX3BmbiA9IGRvbS0+cDJtX2hvc3RbY3VyX3BhZ2VzXTsK
KyAgICAgICAgICAgIGN1cl9wZm4gPSBjdXJfcGFnZXM7CiAKICAgICAgICAgICAgIC8qIFRha2Ug
Y2FyZSB0aGUgY29ybmVyIGNhc2VzIG9mIHN1cGVyIHBhZ2UgdGFpbHMgKi8KICAgICAgICAgICAg
IGlmICggKChjdXJfcGZuICYgKFNVUEVSUEFHRV8xR0JfTlJfUEZOUy0xKSkgIT0gMCkgJiYKQEAg
LTE1NjQsOCArMTU0Nyw3IEBAIHN0YXRpYyBpbnQgbWVtaW5pdF9odm0oc3RydWN0IHhjX2RvbV9p
bWFnZSAqZG9tKQogICAgICAgICAgICAgICAgIHhlbl9wZm5fdCBzcF9leHRlbnRzW25yX2V4dGVu
dHNdOwogCiAgICAgICAgICAgICAgICAgZm9yICggaSA9IDA7IGkgPCBucl9leHRlbnRzOyBpKysg
KQotICAgICAgICAgICAgICAgICAgICBzcF9leHRlbnRzW2ldID0KLSAgICAgICAgICAgICAgICAg
ICAgICAgIGRvbS0+cDJtX2hvc3RbY3VyX3BhZ2VzKyhpPDxTVVBFUlBBR0VfMUdCX1NISUZUKV07
CisgICAgICAgICAgICAgICAgICAgIHNwX2V4dGVudHNbaV0gPSBjdXJfcGFnZXMgKyAoaSA8PCBT
VVBFUlBBR0VfMUdCX1NISUZUKTsKIAogICAgICAgICAgICAgICAgIGRvbmUgPSB4Y19kb21haW5f
cG9wdWxhdGVfcGh5c21hcCh4Y2gsIGRvbWlkLCBucl9leHRlbnRzLAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVVBFUlBBR0VfMUdCX1NISUZULApA
QCAtMTYwNCw4ICsxNTg2LDcgQEAgc3RhdGljIGludCBtZW1pbml0X2h2bShzdHJ1Y3QgeGNfZG9t
X2ltYWdlICpkb20pCiAgICAgICAgICAgICAgICAgICAgIHhlbl9wZm5fdCBzcF9leHRlbnRzW25y
X2V4dGVudHNdOwogCiAgICAgICAgICAgICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgbnJfZXh0
ZW50czsgaSsrICkKLSAgICAgICAgICAgICAgICAgICAgICAgIHNwX2V4dGVudHNbaV0gPQotICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGRvbS0+cDJtX2hvc3RbY3VyX3BhZ2VzKyhpPDxTVVBF
UlBBR0VfMk1CX1NISUZUKV07CisgICAgICAgICAgICAgICAgICAgICAgICBzcF9leHRlbnRzW2ld
ID0gY3VyX3BhZ2VzICsgKGkgPDwgU1VQRVJQQUdFXzJNQl9TSElGVCk7CiAKICAgICAgICAgICAg
ICAgICAgICAgZG9uZSA9IHhjX2RvbWFpbl9wb3B1bGF0ZV9waHlzbWFwKHhjaCwgZG9taWQsIG5y
X2V4dGVudHMsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBTVVBFUlBBR0VfMk1CX1NISUZULApAQCAtMTYyNCw4ICsxNjA1LDEzIEBAIHN0YXRp
YyBpbnQgbWVtaW5pdF9odm0oc3RydWN0IHhjX2RvbV9pbWFnZSAqZG9tKQogICAgICAgICAgICAg
LyogRmFsbCBiYWNrIHRvIDRrQiBleHRlbnRzLiAqLwogICAgICAgICAgICAgaWYgKCBjb3VudCAh
PSAwICkKICAgICAgICAgICAgIHsKKyAgICAgICAgICAgICAgICB4ZW5fcGZuX3QgZXh0ZW50c1tj
b3VudF07CisKKyAgICAgICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8IGNvdW50OyArK2kgKQor
ICAgICAgICAgICAgICAgICAgICBleHRlbnRzW2ldID0gY3VyX3BhZ2VzICsgaTsKKwogICAgICAg
ICAgICAgICAgIHJjID0geGNfZG9tYWluX3BvcHVsYXRlX3BoeXNtYXBfZXhhY3QoCi0gICAgICAg
ICAgICAgICAgICAgIHhjaCwgZG9taWQsIGNvdW50LCAwLCBuZXdfbWVtZmxhZ3MsICZkb20tPnAy
bV9ob3N0W2N1cl9wYWdlc10pOworICAgICAgICAgICAgICAgICAgICB4Y2gsIGRvbWlkLCBjb3Vu
dCwgMCwgbmV3X21lbWZsYWdzLCBleHRlbnRzKTsKICAgICAgICAgICAgICAgICBjdXJfcGFnZXMg
Kz0gY291bnQ7CiAgICAgICAgICAgICAgICAgc3RhdF9ub3JtYWxfcGFnZXMgKz0gY291bnQ7CiAg
ICAgICAgICAgICB9Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
