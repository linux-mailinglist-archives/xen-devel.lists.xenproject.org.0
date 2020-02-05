Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 836D615359E
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 17:53:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izNtN-0000Q2-Nk; Wed, 05 Feb 2020 16:51:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TaP3=3Z=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1izNtM-0000Pi-Cq
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 16:51:08 +0000
X-Inumbo-ID: b1389f38-4837-11ea-915c-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1389f38-4837-11ea-915c-12813bfff9fa;
 Wed, 05 Feb 2020 16:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580921463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wt9JPNfDaTiVVEOj4fX5wmVP6nuaEv41Cj0T1A9EtMU=;
 b=BjIzVxWefP4IX1AepZEI+xbLm+JjOjtGxkeR41OJ30bU7lhxAfMFKbAq
 T82r5H6ptgCD1HNWbcyAJVipCoZdAhnQlHquu5iw8wd1sbL6fYMjgR/Cv
 p2HUr0SvWougmObOOzVeVTdKJ3k3BEKWy2AGxwsbD4SyNEi2jIazNP/6G g=;
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
IronPort-SDR: fNJAwZA3Zt6X/angS7jPEVClGH0loHKIrj+8woOELPJxB5EiV7TAuz1NDCijUKjZWyl019ldb5
 h6muKODVdWQGyPVWaQGECl/tvH+HuVqjJ4q+wfvGw796IyXt9h05HBH9+hYxIeneQ5N7mNx7jk
 CaCO87UY675mpsaEIcKujRGDYI2W+IVnGdcEMbbEAaE3s3P522jsJJrX+XrYgNWAz0DQ5fkVaE
 xwqoqHuFaIqvkLmEUUD9YTPZ1iKXrOzNMwa2sPn6nxzJC5GHFOU5zVfHk3PVMfKb3zeU/8HaDr
 SH8=
X-SBRS: 2.7
X-MesageID: 12001772
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,406,1574139600"; d="scan'208";a="12001772"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 5 Feb 2020 16:50:53 +0000
Message-ID: <20200205165056.11734-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200205165056.11734-1-andrew.cooper3@citrix.com>
References: <20200205165056.11734-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/6] tools/python: Drop cpuid helpers
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
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2UgYXJlIGJlbGlldmVkLXVudXNlZCwgYW5kIHRoZSB1bmRlcmx5aW5nIGluZnJhc3RydWN0
dXJlIGlzIGFib3V0IHRvIGJlCnJld3JpdHRlbiBjb21wbGV0ZWx5LgoKU2lnbmVkLW9mZi1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBJYW4gSmFj
a3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkND
OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xh
Yi5jb20+Ci0tLQogdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5jIHwgOTggLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOTggZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5j
IGIvdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5jCmluZGV4IGE3NTFlODU5MTAuLmFj
MGUyNmE3NDIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3B5dGhvbi94ZW4vbG93bGV2ZWwveGMveGMuYwor
KysgYi90b29scy9weXRob24veGVuL2xvd2xldmVsL3hjL3hjLmMKQEAgLTY5NCw4NCArNjk0LDYg
QEAgc3RhdGljIFB5T2JqZWN0ICpweXhjX2dldF9kZXZpY2VfZ3JvdXAoWGNPYmplY3QgKnNlbGYs
CiAgICAgcmV0dXJuIFB5c3RyOwogfQogCi0jaWYgZGVmaW5lZChfX2kzODZfXykgfHwgZGVmaW5l
ZChfX3g4Nl82NF9fKQotc3RhdGljIHZvaWQgcHl4Y19kb21fZXh0cmFjdF9jcHVpZChQeU9iamVj
dCAqY29uZmlnLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNoYXIgKipyZWdz
KQotewotICAgIGNvbnN0IGNoYXIgKnJlZ3NfZXh0cmFjdFs0XSA9IHsgImVheCIsICJlYngiLCAi
ZWN4IiwgImVkeCIgfTsKLSAgICBQeU9iamVjdCAqb2JqOwotICAgIGludCBpOwotCi0gICAgbWVt
c2V0KHJlZ3MsIDAsIDQqc2l6ZW9mKCpyZWdzKSk7Ci0KLSAgICBpZiAoICFQeURpY3RfQ2hlY2so
Y29uZmlnKSApCi0gICAgICAgIHJldHVybjsKLQotICAgIGZvciAoIGkgPSAwOyBpIDwgNDsgaSsr
ICkKLSAgICAgICAgaWYgKCAob2JqID0gUHlEaWN0X0dldEl0ZW1TdHJpbmcoY29uZmlnLCByZWdz
X2V4dHJhY3RbaV0pKSAhPSBOVUxMICkKLSAgICAgICAgICAgIHJlZ3NbaV0gPSBQeUJ5dGVzX0FT
X1NUUklORyhvYmopOwotfQotCi1zdGF0aWMgUHlPYmplY3QgKnB5eGNfY3JlYXRlX2NwdWlkX2Rp
Y3QoY2hhciAqKnJlZ3MpCi17Ci0gICBjb25zdCBjaGFyICpyZWdzX2V4dHJhY3RbNF0gPSB7ICJl
YXgiLCAiZWJ4IiwgImVjeCIsICJlZHgiIH07Ci0gICBQeU9iamVjdCAqZGljdDsKLSAgIGludCBp
OwotCi0gICBkaWN0ID0gUHlEaWN0X05ldygpOwotICAgZm9yICggaSA9IDA7IGkgPCA0OyBpKysg
KQotICAgewotICAgICAgIGlmICggcmVnc1tpXSA9PSBOVUxMICkKLSAgICAgICAgICAgY29udGlu
dWU7Ci0gICAgICAgUHlEaWN0X1NldEl0ZW1TdHJpbmcoZGljdCwgcmVnc19leHRyYWN0W2ldLAot
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFB5Qnl0ZXNfRnJvbVN0cmluZyhyZWdzW2ldKSk7
Ci0gICAgICAgZnJlZShyZWdzW2ldKTsKLSAgICAgICByZWdzW2ldID0gTlVMTDsKLSAgIH0KLSAg
IHJldHVybiBkaWN0OwotfQotCi1zdGF0aWMgUHlPYmplY3QgKnB5eGNfZG9tX3NldF9wb2xpY3lf
Y3B1aWQoWGNPYmplY3QgKnNlbGYsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgUHlPYmplY3QgKmFyZ3MpCi17Ci0gICAgaW50IGRvbWlkOwotCi0gICAgaWYgKCAh
UHlBcmdfUGFyc2VUdXBsZShhcmdzLCAiaSIsICZkb21pZCkgKQotICAgICAgICByZXR1cm4gTlVM
TDsKLQotICAgIGlmICggeGNfY3B1aWRfYXBwbHlfcG9saWN5KHNlbGYtPnhjX2hhbmRsZSwgZG9t
aWQsIE5VTEwsIDApICkKLSAgICAgICAgcmV0dXJuIHB5eGNfZXJyb3JfdG9fZXhjZXB0aW9uKHNl
bGYtPnhjX2hhbmRsZSk7Ci0KLSAgICBQeV9JTkNSRUYoemVybyk7Ci0gICAgcmV0dXJuIHplcm87
Ci19Ci0KLQotc3RhdGljIFB5T2JqZWN0ICpweXhjX2RvbV9zZXRfY3B1aWQoWGNPYmplY3QgKnNl
bGYsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQeU9iamVjdCAqYXJncykK
LXsKLSAgICBQeU9iamVjdCAqc3ViX2lucHV0LCAqY29uZmlnOwotICAgIHVuc2lnbmVkIGludCBk
b21pZCwgaW5wdXRbMl07Ci0gICAgY2hhciAqcmVnc1s0XSwgKnJlZ3NfdHJhbnNmb3JtWzRdOwot
Ci0gICAgaWYgKCAhUHlBcmdfUGFyc2VUdXBsZShhcmdzLCAiSUlPTyIsICZkb21pZCwKLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICZpbnB1dFswXSwgJnN1Yl9pbnB1dCwgJmNvbmZpZykgKQot
ICAgICAgICByZXR1cm4gTlVMTDsKLQotICAgIHB5eGNfZG9tX2V4dHJhY3RfY3B1aWQoY29uZmln
LCByZWdzKTsKLQotICAgIGlucHV0WzFdID0gWEVOX0NQVUlEX0lOUFVUX1VOVVNFRDsKLSAgICBp
ZiAoIFB5TG9uZ19DaGVjayhzdWJfaW5wdXQpICkKLSAgICAgICAgaW5wdXRbMV0gPSBQeUxvbmdf
QXNVbnNpZ25lZExvbmcoc3ViX2lucHV0KTsKLQotICAgIGlmICggeGNfY3B1aWRfc2V0KHNlbGYt
PnhjX2hhbmRsZSwgZG9taWQsIGlucHV0LCAoY29uc3QgY2hhciAqKilyZWdzLAotICAgICAgICAg
ICAgICAgICAgICAgIHJlZ3NfdHJhbnNmb3JtKSApCi0gICAgICAgIHJldHVybiBweXhjX2Vycm9y
X3RvX2V4Y2VwdGlvbihzZWxmLT54Y19oYW5kbGUpOwotCi0gICAgcmV0dXJuIHB5eGNfY3JlYXRl
X2NwdWlkX2RpY3QocmVnc190cmFuc2Zvcm0pOwotfQotI2VuZGlmIC8qIF9faTM4Nl9fIHx8IF9f
eDg2XzY0X18gKi8KLQogc3RhdGljIFB5T2JqZWN0ICpweXhjX2dudHRhYl9odm1fc2VlZChYY09i
amVjdCAqc2VsZiwKIAkJCQkgICAgICBQeU9iamVjdCAqYXJncywKIAkJCQkgICAgICBQeU9iamVj
dCAqa3dkcykKQEAgLTI0MDYsMjYgKzIzMjgsNiBAQCBzdGF0aWMgUHlNZXRob2REZWYgcHl4Y19t
ZXRob2RzW10gPSB7CiAgICAgICAiSW5qZWN0IGRlYnVnIGtleXMgaW50byBYZW4uXG4iCiAgICAg
ICAiIGtleXMgICAgW3N0cl06IFN0cmluZyBvZiBrZXlzIHRvIGluamVjdC5cbiIgfSwKIAotI2lm
IGRlZmluZWQoX19pMzg2X18pIHx8IGRlZmluZWQoX194ODZfNjRfXykKLSAgICB7ICJkb21haW5f
c2V0X2NwdWlkIiwgCi0gICAgICAoUHlDRnVuY3Rpb24pcHl4Y19kb21fc2V0X2NwdWlkLCAKLSAg
ICAgIE1FVEhfVkFSQVJHUywgIlxuIgotICAgICAgIlNldCBjcHVpZCByZXNwb25zZSBmb3IgYW4g
aW5wdXQgYW5kIGEgZG9tYWluLlxuIgotICAgICAgIiBkb20gW2ludF06IElkZW50aWZpZXIgb2Yg
ZG9tYWluLlxuIgotICAgICAgIiBpbnB1dCBbbG9uZ106IElucHV0IGZvciBjcHVpZCBpbnN0cnVj
dGlvbiAoZWF4KVxuIgotICAgICAgIiBzdWJfaW5wdXQgW2xvbmddOiBTZWNvbmQgaW5wdXQgKG9w
dGlvbmFsLCBtYXkgYmUgTm9uZSkgZm9yIGNwdWlkICIKLSAgICAgICIgICAgICAgICAgICAgICAg
ICAgICBpbnN0cnVjdGlvbiAoZWN4KVxuIgotICAgICAgIiBjb25maWcgW2RpY3RdOiBEaWN0aW9u
YXJ5IG9mIHJlZ2lzdGVyXG5cbiIKLSAgICAgICJSZXR1cm5zOiBbaW50XSAwIG9uIHN1Y2Nlc3M7
IGV4Y2VwdGlvbiBvbiBlcnJvci5cbiIgfSwKLQotICAgIHsgImRvbWFpbl9zZXRfcG9saWN5X2Nw
dWlkIiwgCi0gICAgICAoUHlDRnVuY3Rpb24pcHl4Y19kb21fc2V0X3BvbGljeV9jcHVpZCwgCi0g
ICAgICBNRVRIX1ZBUkFSR1MsICJcbiIKLSAgICAgICJTZXQgdGhlIGRlZmF1bHQgY3B1aWQgcG9s
aWN5IGZvciBhIGRvbWFpbi5cbiIKLSAgICAgICIgZG9tIFtpbnRdOiBJZGVudGlmaWVyIG9mIGRv
bWFpbi5cblxuIgotICAgICAgIlJldHVybnM6IFtpbnRdIDAgb24gc3VjY2VzczsgZXhjZXB0aW9u
IG9uIGVycm9yLlxuIiB9LAotI2VuZGlmCi0KICAgICB7ICJkb21fc2V0X21lbXNociIsIAogICAg
ICAgKFB5Q0Z1bmN0aW9uKXB5eGNfZG9tX3NldF9tZW1zaHIsCiAgICAgICBNRVRIX1ZBUkFSR1Ms
ICJcbiIKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
