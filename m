Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5634718DA1A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 22:28:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFP8m-0003w5-HT; Fri, 20 Mar 2020 21:25:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EUly=5F=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jFP8l-0003v9-8X
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 21:25:15 +0000
X-Inumbo-ID: 425a449b-6af1-11ea-be19-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 425a449b-6af1-11ea-be19-12813bfff9fa;
 Fri, 20 Mar 2020 21:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584739502;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yp/861rLdxwmVg8ZyVF+rmArBo6QMsLefGFaDVLdQSs=;
 b=IsJ86K4j3TmWhgWkUlCjKR8XAkKN6UO39jETlNGcL2aGPRqfalj6NkA6
 280qz5eDajE2zzjWMcCg2q7LZMaaabVvqMwi+uytYjXmAx3Km15TLJuMb
 +6K+Rvi/dGrIOFyTzdZpgV1QIWMX4ZaRwAaei30nD4920fSRoUNGfCxwU I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /VJBbAEGva673Cp9VTThZmy4teoqf/DYPrD+56kE2+xteGpLwnkTX5Qq9w/B0LWymf6KW4zhrV
 UKzxdQWJUK5rMZraHSKArwYubalmx1wrSZFP1aD+7Xt1ZE867Uas2w00k7Rec7MVMfKy1gIrS9
 tVBW/eG1iMtTflvBSrZVH0vlI5FMqinZGXXxrQN+Unjpbfo+G2PhqVlm/XULHm6zzXmZLg1KdN
 sB87NVE9asbQZNg07ndwSnrQWJyiC1tBjk7HvrSiybVgPPqf/hgmtsiqF0XH14VSXsxIlsyhYC
 dOg=
X-SBRS: 2.7
X-MesageID: 14716099
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,286,1580792400"; d="scan'208";a="14716099"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 20 Mar 2020 21:24:51 +0000
Message-ID: <20200320212453.21685-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200320212453.21685-1-andrew.cooper3@citrix.com>
References: <20200320212453.21685-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/4] xen: Drop raw_smp_processor_id()
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
 Jan Beulich <JBeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgaXMgb25seSBhIHNpbmdsZSB1c2VyIG9mIHJhd19zbXBfcHJvY2Vzc29yX2lkKCkgbGVm
dCBpbiB0aGUgdHJlZSAoYW5kIGl0CmlzIHVuY29uZGl0aW9uYWxseSBjb21waWxlZCBvdXQpLiAg
RHJvcCB0aGUgYWxpYXMgZnJvbSBhbGwgYXJjaGl0ZWN0dXJlcy4KClNpZ25lZC1vZmYtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxp
Y2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDQzogU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9y
Zz4KQ0M6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4KLS0t
CiB4ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9hbWQuYyB8IDIgKy0KIHhlbi9pbmNsdWRlL2Fz
bS1hcm0vc21wLmggICAgICAgIHwgMiArLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9zbXAuaCAgICAg
ICAgfCAyICstCiB4ZW4vaW5jbHVkZS94ZW4vc21wLmggICAgICAgICAgICB8IDIgLS0KIDQgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL2FtZC5jIGIveGVuL2FyY2gveDg2L2NwdS9taWNy
b2NvZGUvYW1kLmMKaW5kZXggYTA1M2U0MzkyMy4uMDk5OGEzNmI1YyAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L2NwdS9taWNyb2NvZGUvYW1kLmMKKysrIGIveGVuL2FyY2gveDg2L2NwdS9taWNy
b2NvZGUvYW1kLmMKQEAgLTMwNiw3ICszMDYsNyBAQCBzdGF0aWMgaW50IGdldF91Y29kZV9mcm9t
X2J1ZmZlcl9hbWQoCiAgICAgbWVtY3B5KG1jX2FtZC0+bXBiLCBtcGJ1Zi0+ZGF0YSwgbXBidWYt
Pmxlbik7CiAKICAgICBwcl9kZWJ1ZygibWljcm9jb2RlOiBDUFUlZCBzaXplICV6dSwgYmxvY2sg
c2l6ZSAldSBvZmZzZXQgJXp1IGVxdWl2SUQgJSN4IHJldiAlI3hcbiIsCi0gICAgICAgICAgICAg
cmF3X3NtcF9wcm9jZXNzb3JfaWQoKSwgYnVmc2l6ZSwgbXBidWYtPmxlbiwgKm9mZnNldCwKKyAg
ICAgICAgICAgICBzbXBfcHJvY2Vzc29yX2lkKCksIGJ1ZnNpemUsIG1wYnVmLT5sZW4sICpvZmZz
ZXQsCiAgICAgICAgICAgICAgKChzdHJ1Y3QgbWljcm9jb2RlX2hlYWRlcl9hbWQgKiltY19hbWQt
Pm1wYiktPnByb2Nlc3Nvcl9yZXZfaWQsCiAgICAgICAgICAgICAgKChzdHJ1Y3QgbWljcm9jb2Rl
X2hlYWRlcl9hbWQgKiltY19hbWQtPm1wYiktPnBhdGNoX2lkKTsKIApkaWZmIC0tZ2l0IGEveGVu
L2luY2x1ZGUvYXNtLWFybS9zbXAuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vc21wLmgKaW5kZXgg
ZmRiY2VmYTI0MS4uYWY1YTJmZTY1MiAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9z
bXAuaAorKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL3NtcC5oCkBAIC0xMiw3ICsxMiw3IEBAIERF
Q0xBUkVfUEVSX0NQVShjcHVtYXNrX3Zhcl90LCBjcHVfY29yZV9tYXNrKTsKIAogI2RlZmluZSBj
cHVfaXNfb2ZmbGluZShjcHUpIHVubGlrZWx5KCFjcHVfb25saW5lKGNwdSkpCiAKLSNkZWZpbmUg
cmF3X3NtcF9wcm9jZXNzb3JfaWQoKSAoZ2V0X3Byb2Nlc3Nvcl9pZCgpKQorI2RlZmluZSBzbXBf
cHJvY2Vzc29yX2lkKCkgZ2V0X3Byb2Nlc3Nvcl9pZCgpCiAKIC8qCiAgKiBEbyB3ZSwgZm9yIHBs
YXRmb3JtIHJlYXNvbnMsIG5lZWQgdG8gYWN0dWFsbHkga2VlcCBDUFVzIG9ubGluZSB3aGVuIHdl
CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L3NtcC5oIGIveGVuL2luY2x1ZGUvYXNt
LXg4Ni9zbXAuaAppbmRleCA2MTUwMzYzNjU1Li5mNzQ4NWY2MDJlIDEwMDY0NAotLS0gYS94ZW4v
aW5jbHVkZS9hc20teDg2L3NtcC5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvc21wLmgKQEAg
LTUzLDcgKzUzLDcgQEAgaW50IGNwdV9hZGQodWludDMyX3QgYXBpY19pZCwgdWludDMyX3QgYWNw
aV9pZCwgdWludDMyX3QgcHhtKTsKICAqIGZyb20gdGhlIGluaXRpYWwgc3RhcnR1cC4gV2UgbWFw
IEFQSUNfQkFTRSB2ZXJ5IGVhcmx5IGluIHBhZ2Vfc2V0dXAoKSwKICAqIHNvIHRoaXMgaXMgY29y
cmVjdCBpbiB0aGUgeDg2IGNhc2UuCiAgKi8KLSNkZWZpbmUgcmF3X3NtcF9wcm9jZXNzb3JfaWQo
KSAoZ2V0X3Byb2Nlc3Nvcl9pZCgpKQorI2RlZmluZSBzbXBfcHJvY2Vzc29yX2lkKCkgZ2V0X3By
b2Nlc3Nvcl9pZCgpCiAKIHZvaWQgX19zdG9wX3RoaXNfY3B1KHZvaWQpOwogCmRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS94ZW4vc21wLmggYi94ZW4vaW5jbHVkZS94ZW4vc21wLmgKaW5kZXggYTY0
YzliMzg4Mi4uZDVhMzY0NDYxMSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3NtcC5oCisr
KyBiL3hlbi9pbmNsdWRlL3hlbi9zbXAuaApAQCAtNjUsOCArNjUsNiBAQCB2b2lkIHNtcF9jYWxs
X2Z1bmN0aW9uX2ludGVycnVwdCh2b2lkKTsKIAogdm9pZCBzbXBfc2VuZF9jYWxsX2Z1bmN0aW9u
X21hc2soY29uc3QgY3B1bWFza190ICptYXNrKTsKIAotI2RlZmluZSBzbXBfcHJvY2Vzc29yX2lk
KCkgcmF3X3NtcF9wcm9jZXNzb3JfaWQoKQotCiBpbnQgYWxsb2NfY3B1X2lkKHZvaWQpOwogCiBl
eHRlcm4gdm9pZCAqc3RhY2tfYmFzZVtOUl9DUFVTXTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
