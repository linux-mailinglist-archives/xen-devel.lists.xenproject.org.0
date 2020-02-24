Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D91AE16A445
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 11:49:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6BGY-0004tV-Pu; Mon, 24 Feb 2020 10:47:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6BGX-0004tO-E4
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 10:47:09 +0000
X-Inumbo-ID: fead051e-56f2-11ea-8ae3-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fead051e-56f2-11ea-8ae3-12813bfff9fa;
 Mon, 24 Feb 2020 10:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582541224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EDk1YsLUMLWJVjWkclCXKphxOd2VjHLbCU+LUCWGXDM=;
 b=B/0jdhqfWbQjmlhBZVkAjNrqwR43aQ+BF/vftGMVuNg4yc0ncYX8EGcy
 jUayV58HClKYs8enaaLCTs9Pu+sIeSMhlDtSStyYGJDgMZ3sIGz5oinZX
 Zz/q9DAQr5VFuIXzbkk3ztpIlcOS4Bwtf5Utqt6yJk17eOxmaKpulmdg/ Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: B5hLawbR4HB9Pr7f13fsNoWoltvdpm5NHqWqNLF8nNM2yVHxq1MXXdaGLgsKFLyWNEUxgQ/FsE
 KOpUi8Ay5Ram+pp+1b2xee9om5baeZbGN5nn09b/M+2mXw37nZhSYE0FsJTGrrMQSqN3Pjchsz
 hWHuigXOCpok5iPCibWaSGhQdSr7pe5XESjUNpoXCz5TmiH/Y5/abNSSrvPISN2duDt8lUDPjC
 TM/j7PImt6ZjB7vhHGblx4wcJyw+2vbBFm8c+Y89maed6vjmnBmFUhgBAraPMreqyoWKPqzPG4
 aII=
X-SBRS: 2.7
X-MesageID: 13524163
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,479,1574139600"; d="scan'208";a="13524163"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 24 Feb 2020 11:46:41 +0100
Message-ID: <20200224104645.96381-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224104645.96381-1-roger.pau@citrix.com>
References: <20200224104645.96381-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 1/5] x86: introduce a nmi_count tracking
 variable
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBtb2RlbGVkIGFmdGVyIHRoZSBpcnFfY291bnQgdmFyaWFibGUsIGFuZCBpcyB1c2Vk
IHRvIGFjY291bnQKZm9yIGFsbCB0aGUgTk1JcyBoYW5kbGVkIGJ5IHRoZSBzeXN0ZW0uCgpUaGlz
IHdpbGwgYWxsb3cgdG8gcmVwdXJwb3NlIHRoZSBubWlfY291bnQoKSBoZWxwZXIgc28gaXQgY2Fu
IGJlIHVzZWQKaW4gYSBzaW1pbGFyIG1hbm5lciBhcyBsb2NhbF9pcnFfY291bnQoKTogYWNjb3Vu
dCBmb3IgdGhlIE5NSXMKY3VycmVudGx5IGluIHNlcnZpY2UuCgpTaWduZWQtb2ZmLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbm1p
LmMgICAgICAgIHwgMTEgKysrKystLS0tLS0KIHhlbi9hcmNoL3g4Ni90cmFwcy5jICAgICAgfCAg
NCArKystCiB4ZW4vaW5jbHVkZS9hc20teDg2L25taS5oIHwgIDIgKysKIDMgZmlsZXMgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvbm1pLmMgYi94ZW4vYXJjaC94ODYvbm1pLmMKaW5kZXggYTY5YjkxYTkyNC4uYzNmOTJl
ZDIzMSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L25taS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9u
bWkuYwpAQCAtMTUxLDE1ICsxNTEsMTQgQEAgaW50IG5taV9hY3RpdmU7CiAKIHN0YXRpYyB2b2lk
IF9faW5pdCB3YWl0X2Zvcl9ubWlzKHZvaWQgKnApCiB7Ci0gICAgdW5zaWduZWQgaW50IGNwdSA9
IHNtcF9wcm9jZXNzb3JfaWQoKTsKLSAgICB1bnNpZ25lZCBpbnQgc3RhcnRfY291bnQgPSBubWlf
Y291bnQoY3B1KTsKKyAgICB1bnNpZ25lZCBpbnQgc3RhcnRfY291bnQgPSB0aGlzX2NwdShubWlf
Y291bnQpOwogICAgIHVuc2lnbmVkIGxvbmcgdGlja3MgPSAxMCAqIDEwMDAgKiBjcHVfa2h6IC8g
bm1pX2h6OwogICAgIHVuc2lnbmVkIGxvbmcgcywgZTsKIAogICAgIHMgPSByZHRzYygpOwogICAg
IGRvIHsKICAgICAgICAgY3B1X3JlbGF4KCk7Ci0gICAgICAgIGlmICggbm1pX2NvdW50KGNwdSkg
Pj0gc3RhcnRfY291bnQgKyAyICkKKyAgICAgICAgaWYgKCB0aGlzX2NwdShubWlfY291bnQpID49
IHN0YXJ0X2NvdW50ICsgMiApCiAgICAgICAgICAgICBicmVhazsKICAgICAgICAgZSA9IHJkdHNj
KCk7CiAgICAgfSB3aGlsZSggZSAtIHMgPCB0aWNrcyApOwpAQCAtMTc3LDcgKzE3Niw3IEBAIHZv
aWQgX19pbml0IGNoZWNrX25taV93YXRjaGRvZyh2b2lkKQogICAgIHByaW50aygiVGVzdGluZyBO
TUkgd2F0Y2hkb2cgb24gYWxsIENQVXM6Iik7CiAKICAgICBmb3JfZWFjaF9vbmxpbmVfY3B1ICgg
Y3B1ICkKLSAgICAgICAgcHJldl9ubWlfY291bnRbY3B1XSA9IG5taV9jb3VudChjcHUpOworICAg
ICAgICBwcmV2X25taV9jb3VudFtjcHVdID0gcGVyX2NwdShubWlfY291bnQsIGNwdSk7CiAKICAg
ICAvKgogICAgICAqIFdhaXQgYXQgbW9zdCAxMCB0aWNrcyBmb3IgMiB3YXRjaGRvZyBOTUlzIG9u
IGVhY2ggQ1BVLgpAQCAtMTg4LDcgKzE4Nyw3IEBAIHZvaWQgX19pbml0IGNoZWNrX25taV93YXRj
aGRvZyh2b2lkKQogCiAgICAgZm9yX2VhY2hfb25saW5lX2NwdSAoIGNwdSApCiAgICAgewotICAg
ICAgICBpZiAoIG5taV9jb3VudChjcHUpIC0gcHJldl9ubWlfY291bnRbY3B1XSA8IDIgKQorICAg
ICAgICBpZiAoIHBlcl9jcHUobm1pX2NvdW50LCBjcHUpIC0gcHJldl9ubWlfY291bnRbY3B1XSA8
IDIgKQogICAgICAgICB7CiAgICAgICAgICAgICBwcmludGsoIiAlZCIsIGNwdSk7CiAgICAgICAg
ICAgICBvayA9IGZhbHNlOwpAQCAtNTkzLDcgKzU5Miw3IEBAIHN0YXRpYyB2b2lkIGRvX25taV9z
dGF0cyh1bnNpZ25lZCBjaGFyIGtleSkKIAogICAgIHByaW50aygiQ1BVXHROTUlcbiIpOwogICAg
IGZvcl9lYWNoX29ubGluZV9jcHUgKCBjcHUgKQotICAgICAgICBwcmludGsoIiUzdVx0JTN1XG4i
LCBjcHUsIG5taV9jb3VudChjcHUpKTsKKyAgICAgICAgcHJpbnRrKCIlM3VcdCUzdVxuIiwgY3B1
LCBwZXJfY3B1KG5taV9jb3VudCwgY3B1KSk7CiAKICAgICBpZiAoICFoYXJkd2FyZV9kb21haW4g
fHwgISh2ID0gZG9tYWluX3ZjcHUoaGFyZHdhcmVfZG9tYWluLCAwKSkgKQogICAgICAgICByZXR1
cm47CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvdHJhcHMuYyBiL3hlbi9hcmNoL3g4Ni90cmFw
cy5jCmluZGV4IDU2MDY3Zjg1ZDEuLjNkYmM2NmJiNjQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni90cmFwcy5jCisrKyBiL3hlbi9hcmNoL3g4Ni90cmFwcy5jCkBAIC0xNjgzLDEzICsxNjgzLDE1
IEBAIHN0YXRpYyBpbnQgZHVtbXlfbm1pX2NhbGxiYWNrKGNvbnN0IHN0cnVjdCBjcHVfdXNlcl9y
ZWdzICpyZWdzLCBpbnQgY3B1KQogCiBzdGF0aWMgbm1pX2NhbGxiYWNrX3QgKm5taV9jYWxsYmFj
ayA9IGR1bW15X25taV9jYWxsYmFjazsKIAorREVGSU5FX1BFUl9DUFUodW5zaWduZWQgaW50LCBu
bWlfY291bnQpOworCiB2b2lkIGRvX25taShjb25zdCBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVn
cykKIHsKICAgICB1bnNpZ25lZCBpbnQgY3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOwogICAgIHVu
c2lnbmVkIGNoYXIgcmVhc29uID0gMDsKICAgICBib29sIGhhbmRsZV91bmtub3duID0gZmFsc2U7
CiAKLSAgICArK25taV9jb3VudChjcHUpOworICAgIHRoaXNfY3B1KG5taV9jb3VudCkrKzsKIAog
ICAgIGlmICggbm1pX2NhbGxiYWNrKHJlZ3MsIGNwdSkgKQogICAgICAgICByZXR1cm47CmRpZmYg
LS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L25taS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9u
bWkuaAppbmRleCBmOWRmY2E2YWZiLi5hMjg4ZjAyYTUwIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVk
ZS9hc20teDg2L25taS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbm1pLmgKQEAgLTMxLDUg
KzMxLDcgQEAgbm1pX2NhbGxiYWNrX3QgKnNldF9ubWlfY2FsbGJhY2sobm1pX2NhbGxiYWNrX3Qg
KmNhbGxiYWNrKTsKICAqIFJlbW92ZSB0aGUgaGFuZGxlciBwcmV2aW91c2x5IHNldC4KICAqLwog
dm9pZCB1bnNldF9ubWlfY2FsbGJhY2sodm9pZCk7CisKK0RFQ0xBUkVfUEVSX0NQVSh1bnNpZ25l
ZCBpbnQsIG5taV9jb3VudCk7CiAgCiAjZW5kaWYgLyogQVNNX05NSV9IICovCi0tIAoyLjI1LjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
