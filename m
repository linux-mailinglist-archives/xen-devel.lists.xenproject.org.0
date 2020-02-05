Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBF41535A4
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 17:53:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izNtX-0000VR-US; Wed, 05 Feb 2020 16:51:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TaP3=3Z=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1izNtV-0000Ug-Mt
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 16:51:17 +0000
X-Inumbo-ID: b3951216-4837-11ea-ad98-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3951216-4837-11ea-ad98-bc764e2007e4;
 Wed, 05 Feb 2020 16:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580921466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=XOn1aGJowhLxP+fjsrtFOac5vlSPUDqREW49qXLnIIE=;
 b=Gq7DIBq/Jr2FOdeCfEaa87zfOfoIO6UIdZyjTrZLAoTvpTcNlwkrE6RQ
 cVSWtiWMHLrg35EoZ4drqM/K2wwEqkd3Ffa4hIOqLTuZuxyoh9j39G8ui
 TxTodug40g9M1UADWqJpCnCbyxuJrTkMlR1AruQiBH/EJ1hhk4SeF/KDu o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SpBRXGKvCX08i12FVu/xpGSeRPKqR2elnti/u4gQJ75BmaXNepaatH66wjEMSzHaX9/EkBsqDs
 HznIaevi4CG86tyraCjniuz1D3+IksJPwNjrSXjoCoZGCbixoxOvBNvjhvzeUQj2HwABkXstQ2
 dmpN+h4LnJ6qD8Hkt4mwWlTBVaykksTxvY8MqqOsbQxuApieNeG7NkVxPOKo98+UQgw1HI6ywa
 +NkJI5xxJ0T9hu7wMcmHaSQ/gtLOOqi7q6hoAbsLmTRC/+BuHqpsFUVLNsM6qul1Onn0CdHfgN
 72k=
X-SBRS: 2.7
X-MesageID: 12612174
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,406,1574139600"; d="scan'208";a="12612174"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 5 Feb 2020 16:50:52 +0000
Message-ID: <20200205165056.11734-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200205165056.11734-1-andrew.cooper3@citrix.com>
References: <20200205165056.11734-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/6] tools/ocaml: Drop cpuid helpers
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2UgaGF2ZSBubyBjYWxsZXJzLCBhbmQgdGhlIHVuZGVybHlpbmcgaW5mcmFzdHJ1Y3R1cmUg
aXMgYWJvdXQgdG8gYmUKcmV3cml0dGVuIGNvbXBsZXRlbHkuCgpTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IENocmlzdGlhbiBM
aW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4KLS0tCiB0b29scy9vY2FtbC9saWJz
L3hjL3hlbmN0cmwubWwgICAgICB8ICA3IC0tLS0tCiB0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0
cmwubWxpICAgICB8ICA3IC0tLS0tCiB0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMu
YyB8IDYyIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDMgZmlsZXMgY2hh
bmdlZCwgNzYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwvbGlicy94Yy94
ZW5jdHJsLm1sIGIvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1sCmluZGV4IGUwMGE3NGQ0
OGQuLjQ5N2RlZDdjZTIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5t
bAorKysgYi90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwKQEAgLTI1NiwxMyArMjU2LDYg
QEAgZXh0ZXJuYWwgZG9tYWluX3NldF9tZW1tYXBfbGltaXQ6IGhhbmRsZSAtPiBkb21pZCAtPiBp
bnQ2NCAtPiB1bml0CiBleHRlcm5hbCBkb21haW5fbWVtb3J5X2luY3JlYXNlX3Jlc2VydmF0aW9u
OiBoYW5kbGUgLT4gZG9taWQgLT4gaW50NjQgLT4gdW5pdAogICAgICAgID0gInN0dWJfeGNfZG9t
YWluX21lbW9yeV9pbmNyZWFzZV9yZXNlcnZhdGlvbiIKIAotZXh0ZXJuYWwgZG9tYWluX2NwdWlk
X3NldDogaGFuZGxlIC0+IGRvbWlkIC0+IChpbnQ2NCAqIChpbnQ2NCBvcHRpb24pKQotICAgICAg
ICAgICAgICAgICAgICAgICAgLT4gc3RyaW5nIG9wdGlvbiBhcnJheQotICAgICAgICAgICAgICAg
ICAgICAgICAgLT4gc3RyaW5nIG9wdGlvbiBhcnJheQotICAgICAgID0gInN0dWJfeGNfZG9tYWlu
X2NwdWlkX3NldCIKLWV4dGVybmFsIGRvbWFpbl9jcHVpZF9hcHBseV9wb2xpY3k6IGhhbmRsZSAt
PiBkb21pZCAtPiB1bml0Ci0gICAgICAgPSAic3R1Yl94Y19kb21haW5fY3B1aWRfYXBwbHlfcG9s
aWN5IgotCiBleHRlcm5hbCBtYXBfZm9yZWlnbl9yYW5nZTogaGFuZGxlIC0+IGRvbWlkIC0+IGlu
dAogICAgICAgICAgICAgICAgICAgICAgICAgIC0+IG5hdGl2ZWludCAtPiBYZW5tbWFwLm1tYXBf
aW50ZXJmYWNlCiAgICAgICAgPSAic3R1Yl9tYXBfZm9yZWlnbl9yYW5nZSIKZGlmZiAtLWdpdCBh
L3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkgYi90b29scy9vY2FtbC9saWJzL3hjL3hl
bmN0cmwubWxpCmluZGV4IDBlNzA0OWQ3MDguLjI2ZWM3ZTU5YjEgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkKKysrIGIvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5j
dHJsLm1saQpAQCAtMjE5LDEwICsyMTksMyBAQCBleHRlcm5hbCBwYWdlc190b19raWIgOiBpbnQ2
NCAtPiBpbnQ2NCA9ICJzdHViX3BhZ2VzX3RvX2tpYiIKIHZhbCBwYWdlc190b19taWIgOiBpbnQ2
NCAtPiBpbnQ2NAogZXh0ZXJuYWwgd2F0Y2hkb2cgOiBoYW5kbGUgLT4gaW50IC0+IGludDMyIC0+
IGludAogICA9ICJzdHViX3hjX3dhdGNoZG9nIgotCi1leHRlcm5hbCBkb21haW5fY3B1aWRfc2V0
OiBoYW5kbGUgLT4gZG9taWQgLT4gKGludDY0ICogKGludDY0IG9wdGlvbikpCi0gICAgICAgICAg
ICAgICAgICAgICAgICAtPiBzdHJpbmcgb3B0aW9uIGFycmF5Ci0gICAgICAgICAgICAgICAgICAg
ICAgICAtPiBzdHJpbmcgb3B0aW9uIGFycmF5Ci0gICAgICAgPSAic3R1Yl94Y19kb21haW5fY3B1
aWRfc2V0IgotZXh0ZXJuYWwgZG9tYWluX2NwdWlkX2FwcGx5X3BvbGljeTogaGFuZGxlIC0+IGRv
bWlkIC0+IHVuaXQKLSAgICAgICA9ICJzdHViX3hjX2RvbWFpbl9jcHVpZF9hcHBseV9wb2xpY3ki
CmRpZmYgLS1naXQgYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYyBiL3Rvb2xz
L29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jCmluZGV4IDQ4ZjM5ZjgxZDUuLjkwNGRhNDVj
NGYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jCisrKyBi
L3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jCkBAIC00OCwxMiArNDgsNiBAQAog
I2RlZmluZSBzdHJpbmdfb2Zfb3B0aW9uX2FycmF5KGFycmF5LCBpbmRleCkgXAogCSgoRmllbGQo
YXJyYXksIGluZGV4KSA9PSBWYWxfbm9uZSkgPyBOVUxMIDogU3RyaW5nX3ZhbChGaWVsZChGaWVs
ZChhcnJheSwgaW5kZXgpLCAwKSkpCiAKLS8qIG1heWJlIGhlcmUgd2Ugc2hvdWxkIGNoZWNrIHRo
ZSByYW5nZSBvZiB0aGUgaW5wdXQgaW5zdGVhZCBvZiBibGluZGx5Ci0gKiBjYXN0aW5nIGl0IHRv
IHVpbnQzMiAqLwotI2RlZmluZSBjcHVpZF9pbnB1dF9vZl92YWwoaTEsIGkyLCBpbnB1dCkgXAot
CWkxID0gKHVpbnQzMl90KSBJbnQ2NF92YWwoRmllbGQoaW5wdXQsIDApKTsgXAotCWkyID0gKChG
aWVsZChpbnB1dCwgMSkgPT0gVmFsX25vbmUpID8gMHhmZmZmZmZmZiA6ICh1aW50MzJfdCkgSW50
NjRfdmFsKEZpZWxkKEZpZWxkKGlucHV0LCAxKSwgMCkpKTsKLQogc3RhdGljIHZvaWQgTm9yZXR1
cm4gZmFpbHdpdGhfeGMoeGNfaW50ZXJmYWNlICp4Y2gpCiB7CiAJY2hhciBlcnJvcl9zdHJbWENf
TUFYX0VSUk9SX01TR19MRU4gKyA2XTsKQEAgLTgyNiw2MiArODIwLDYgQEAgQ0FNTHByaW0gdmFs
dWUgc3R1Yl94Y19kb21haW5fbWVtb3J5X2luY3JlYXNlX3Jlc2VydmF0aW9uKHZhbHVlIHhjaCwK
IAlDQU1McmV0dXJuKFZhbF91bml0KTsKIH0KIAotQ0FNTHByaW0gdmFsdWUgc3R1Yl94Y19kb21h
aW5fY3B1aWRfc2V0KHZhbHVlIHhjaCwgdmFsdWUgZG9taWQsCi0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdmFsdWUgaW5wdXQsCi0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdmFsdWUgY29uZmlnKQotewotCUNBTUxwYXJhbTQoeGNoLCBkb21p
ZCwgaW5wdXQsIGNvbmZpZyk7Ci0JQ0FNTGxvY2FsMihhcnJheSwgdG1wKTsKLSNpZiBkZWZpbmVk
KF9faTM4Nl9fKSB8fCBkZWZpbmVkKF9feDg2XzY0X18pCi0JaW50IHI7Ci0JdW5zaWduZWQgaW50
IGNfaW5wdXRbMl07Ci0JY2hhciAqY19jb25maWdbNF0sICpvdXRfY29uZmlnWzRdOwotCi0JY19j
b25maWdbMF0gPSBzdHJpbmdfb2Zfb3B0aW9uX2FycmF5KGNvbmZpZywgMCk7Ci0JY19jb25maWdb
MV0gPSBzdHJpbmdfb2Zfb3B0aW9uX2FycmF5KGNvbmZpZywgMSk7Ci0JY19jb25maWdbMl0gPSBz
dHJpbmdfb2Zfb3B0aW9uX2FycmF5KGNvbmZpZywgMik7Ci0JY19jb25maWdbM10gPSBzdHJpbmdf
b2Zfb3B0aW9uX2FycmF5KGNvbmZpZywgMyk7Ci0KLQljcHVpZF9pbnB1dF9vZl92YWwoY19pbnB1
dFswXSwgY19pbnB1dFsxXSwgaW5wdXQpOwotCi0JYXJyYXkgPSBjYW1sX2FsbG9jKDQsIDApOwot
CWZvciAociA9IDA7IHIgPCA0OyByKyspIHsKLQkJdG1wID0gVmFsX25vbmU7Ci0JCWlmIChjX2Nv
bmZpZ1tyXSkgewotCQkJdG1wID0gY2FtbF9hbGxvY19zbWFsbCgxLCAwKTsKLQkJCUZpZWxkKHRt
cCwgMCkgPSBjYW1sX2FsbG9jX3N0cmluZygzMik7Ci0JCX0KLQkJU3RvcmVfZmllbGQoYXJyYXks
IHIsIHRtcCk7Ci0JfQotCi0JZm9yIChyID0gMDsgciA8IDQ7IHIrKykKLQkJb3V0X2NvbmZpZ1ty
XSA9IChjX2NvbmZpZ1tyXSkgPyBTdHJpbmdfdmFsKEZpZWxkKEZpZWxkKGFycmF5LCByKSwgMCkp
IDogTlVMTDsKLQotCXIgPSB4Y19jcHVpZF9zZXQoX0goeGNoKSwgX0QoZG9taWQpLAotCQkJIGNf
aW5wdXQsIChjb25zdCBjaGFyICoqKWNfY29uZmlnLCBvdXRfY29uZmlnKTsKLQlpZiAociA8IDAp
Ci0JCWZhaWx3aXRoX3hjKF9IKHhjaCkpOwotI2Vsc2UKLQljYW1sX2ZhaWx3aXRoKCJ4Y19kb21h
aW5fY3B1aWRfc2V0OiBub3QgaW1wbGVtZW50ZWQiKTsKLSNlbmRpZgotCUNBTUxyZXR1cm4oYXJy
YXkpOwotfQotCi1DQU1McHJpbSB2YWx1ZSBzdHViX3hjX2RvbWFpbl9jcHVpZF9hcHBseV9wb2xp
Y3kodmFsdWUgeGNoLCB2YWx1ZSBkb21pZCkKLXsKLQlDQU1McGFyYW0yKHhjaCwgZG9taWQpOwot
I2lmIGRlZmluZWQoX19pMzg2X18pIHx8IGRlZmluZWQoX194ODZfNjRfXykKLQlpbnQgcjsKLQot
CXIgPSB4Y19jcHVpZF9hcHBseV9wb2xpY3koX0goeGNoKSwgX0QoZG9taWQpLCBOVUxMLCAwKTsK
LQlpZiAociA8IDApCi0JCWZhaWx3aXRoX3hjKF9IKHhjaCkpOwotI2Vsc2UKLQljYW1sX2ZhaWx3
aXRoKCJ4Y19kb21haW5fY3B1aWRfYXBwbHlfcG9saWN5OiBub3QgaW1wbGVtZW50ZWQiKTsKLSNl
bmRpZgotCUNBTUxyZXR1cm4oVmFsX3VuaXQpOwotfQotCiBDQU1McHJpbSB2YWx1ZSBzdHViX3hj
X3ZlcnNpb25fdmVyc2lvbih2YWx1ZSB4Y2gpCiB7CiAJQ0FNTHBhcmFtMSh4Y2gpOwotLSAKMi4x
MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
