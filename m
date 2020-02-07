Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 053A3155980
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 15:29:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j04az-0001cD-U7; Fri, 07 Feb 2020 14:27:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=025r=33=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1j04ay-0001c1-6z
 for xen-devel@lists.xen.org; Fri, 07 Feb 2020 14:27:00 +0000
X-Inumbo-ID: e5a5b754-49b5-11ea-b183-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5a5b754-49b5-11ea-b183-12813bfff9fa;
 Fri, 07 Feb 2020 14:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581085618;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=AQw9NSimR4U12ghjgIVRKEpnFYF65RqKgaPuBmOw1Ec=;
 b=J1eAAW29JduBpz9EK9SPJ32NHYUY2J/67A/OFjyYMeQplv8BmumAMjwr
 1grsNDpexLh87UNyMXJyaaH8zyGRKmcDMcqEWk7hXojDE70jl0GCgJww2
 i/mRyKqsxTe6xcHorVUV6yFaLK+P7pJvXUSazlnWxaAiPHaETtXLTubfY 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
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
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NbCBsYaY7tmZHavhqZHrbPJ2IHI7GEcD1su+OtjP6Feuh7t+T6eFm5iKhfT122oG8TD/O3R8jw
 C5g0kaQf1sgi6i8GcO+rDSWiFdeM6ww+sxchmgZSpu1Ngha9qM0EQzQdNSAaRt8Bu7M5x2Bkbn
 kDUjOTCdTHUFqKjA6qLuOGaJDttPGeQ9ydKYf6zzUacaY7RFxrX6j7R3mqaLyNlRpVq1pDJScF
 Bg8JDVmtoM4n0+LyzPPxNHsH0+1tlVZxNMup64noARhGcmZ/Hao+6WQaKQ8zkTwvKLNKggLICd
 weI=
X-SBRS: 2.7
X-MesageID: 12479583
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,413,1574139600"; d="scan'208";a="12479583"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>, <kasan-dev@googlegroups.com>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 7 Feb 2020 14:26:49 +0000
Message-ID: <20200207142652.670-2-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200207142652.670-1-sergey.dyasli@citrix.com>
References: <20200207142652.670-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 1/4] kasan: introduce set_pmd_early_shadow()
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
 Stefano
 Stabellini <sstabellini@kernel.org>, George Dunlap <george.dunlap@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgaXMgaW5jb3JyZWN0IHRvIGNhbGwgcG1kX3BvcHVsYXRlX2tlcm5lbCgpIG11bHRpcGxlIHRp
bWVzIGZvciB0aGUKc2FtZSBwYWdlIHRhYmxlIGZyb20gaW5zaWRlIFhlbiBQViBkb21haW5zLiBY
ZW4gbm90aWNlcyBpdCBkdXJpbmcKa2FzYW5fcG9wdWxhdGVfZWFybHlfc2hhZG93KCk6CgogICAg
KFhFTikgbW0uYzozMjIyOmQxNTV2MCBtZm4gMzcwNGIgYWxyZWFkeSBwaW5uZWQKClRoaXMgaGFw
cGVucyBmb3Iga2FzYW5fZWFybHlfc2hhZG93X3B0ZSB3aGVuIFVTRV9TUExJVF9QVEVfUFRMT0NL
UyBpcwplbmFibGVkLiBGaXggdGhpcyBieSBpbnRyb2R1Y2luZyBzZXRfcG1kX2Vhcmx5X3NoYWRv
dygpIHdoaWNoIGNhbGxzCnBtZF9wb3B1bGF0ZV9rZXJuZWwoKSBvbmx5IG9uY2UgYW5kIHVzZXMg
c2V0X3BtZCgpIGFmdGVyd2FyZHMuCgpTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgRHlhc2xpIDxzZXJn
ZXkuZHlhc2xpQGNpdHJpeC5jb20+Ci0tLQp2MiAtLT4gdjM6IG5vIGNoYW5nZXMKCnYxIC0tPiB2
MjoKLSBGaXggY29tcGlsYXRpb24gd2l0aG91dCBDT05GSUdfWEVOX1BWCi0gU2xpZ2h0bHkgdXBk
YXRlZCBkZXNjcmlwdGlvbgoKUkZDIC0tPiB2MToKLSBOZXcgcGF0Y2gKLS0tCiBtbS9rYXNhbi9p
bml0LmMgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDI0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbW0va2Fz
YW4vaW5pdC5jIGIvbW0va2FzYW4vaW5pdC5jCmluZGV4IGNlNDVjNDkxZWJjZC4uNzc5MWZlMGE3
NzA0IDEwMDY0NAotLS0gYS9tbS9rYXNhbi9pbml0LmMKKysrIGIvbW0va2FzYW4vaW5pdC5jCkBA
IC04MSw2ICs4MSwyNiBAQCBzdGF0aWMgaW5saW5lIGJvb2wga2FzYW5fZWFybHlfc2hhZG93X3Bh
Z2VfZW50cnkocHRlX3QgcHRlKQogCXJldHVybiBwdGVfcGFnZShwdGUpID09IHZpcnRfdG9fcGFn
ZShsbV9hbGlhcyhrYXNhbl9lYXJseV9zaGFkb3dfcGFnZSkpOwogfQogCisjaWZkZWYgQ09ORklH
X1hFTl9QVgorc3RhdGljIGlubGluZSB2b2lkIHNldF9wbWRfZWFybHlfc2hhZG93KHBtZF90ICpw
bWQpCit7CisJc3RhdGljIGJvb2wgcG1kX3BvcHVsYXRlZCA9IGZhbHNlOworCXB0ZV90ICplYXJs
eV9zaGFkb3cgPSBsbV9hbGlhcyhrYXNhbl9lYXJseV9zaGFkb3dfcHRlKTsKKworCWlmIChsaWtl
bHkocG1kX3BvcHVsYXRlZCkpIHsKKwkJc2V0X3BtZChwbWQsIF9fcG1kKF9fcGEoZWFybHlfc2hh
ZG93KSB8IF9QQUdFX1RBQkxFKSk7CisJfSBlbHNlIHsKKwkJcG1kX3BvcHVsYXRlX2tlcm5lbCgm
aW5pdF9tbSwgcG1kLCBlYXJseV9zaGFkb3cpOworCQlwbWRfcG9wdWxhdGVkID0gdHJ1ZTsKKwl9
Cit9CisjZWxzZQorc3RhdGljIGlubGluZSB2b2lkIHNldF9wbWRfZWFybHlfc2hhZG93KHBtZF90
ICpwbWQpCit7CisJcG1kX3BvcHVsYXRlX2tlcm5lbCgmaW5pdF9tbSwgcG1kLCBsbV9hbGlhcyhr
YXNhbl9lYXJseV9zaGFkb3dfcHRlKSk7Cit9CisjZW5kaWYgLyogaWZkZWYgQ09ORklHX1hFTl9Q
ViAqLworCiBzdGF0aWMgX19pbml0IHZvaWQgKmVhcmx5X2FsbG9jKHNpemVfdCBzaXplLCBpbnQg
bm9kZSkKIHsKIAl2b2lkICpwdHIgPSBtZW1ibG9ja19hbGxvY190cnlfbmlkKHNpemUsIHNpemUs
IF9fcGEoTUFYX0RNQV9BRERSRVNTKSwKQEAgLTEyMCw4ICsxNDAsNyBAQCBzdGF0aWMgaW50IF9f
cmVmIHplcm9fcG1kX3BvcHVsYXRlKHB1ZF90ICpwdWQsIHVuc2lnbmVkIGxvbmcgYWRkciwKIAkJ
bmV4dCA9IHBtZF9hZGRyX2VuZChhZGRyLCBlbmQpOwogCiAJCWlmIChJU19BTElHTkVEKGFkZHIs
IFBNRF9TSVpFKSAmJiBlbmQgLSBhZGRyID49IFBNRF9TSVpFKSB7Ci0JCQlwbWRfcG9wdWxhdGVf
a2VybmVsKCZpbml0X21tLCBwbWQsCi0JCQkJCWxtX2FsaWFzKGthc2FuX2Vhcmx5X3NoYWRvd19w
dGUpKTsKKwkJCXNldF9wbWRfZWFybHlfc2hhZG93KHBtZCk7CiAJCQljb250aW51ZTsKIAkJfQog
CkBAIC0xNTcsOCArMTc2LDcgQEAgc3RhdGljIGludCBfX3JlZiB6ZXJvX3B1ZF9wb3B1bGF0ZShw
NGRfdCAqcDRkLCB1bnNpZ25lZCBsb25nIGFkZHIsCiAJCQlwdWRfcG9wdWxhdGUoJmluaXRfbW0s
IHB1ZCwKIAkJCQkJbG1fYWxpYXMoa2FzYW5fZWFybHlfc2hhZG93X3BtZCkpOwogCQkJcG1kID0g
cG1kX29mZnNldChwdWQsIGFkZHIpOwotCQkJcG1kX3BvcHVsYXRlX2tlcm5lbCgmaW5pdF9tbSwg
cG1kLAotCQkJCQlsbV9hbGlhcyhrYXNhbl9lYXJseV9zaGFkb3dfcHRlKSk7CisJCQlzZXRfcG1k
X2Vhcmx5X3NoYWRvdyhwbWQpOwogCQkJY29udGludWU7CiAJCX0KIApAQCAtMTk4LDggKzIxNiw3
IEBAIHN0YXRpYyBpbnQgX19yZWYgemVyb19wNGRfcG9wdWxhdGUocGdkX3QgKnBnZCwgdW5zaWdu
ZWQgbG9uZyBhZGRyLAogCQkJcHVkX3BvcHVsYXRlKCZpbml0X21tLCBwdWQsCiAJCQkJCWxtX2Fs
aWFzKGthc2FuX2Vhcmx5X3NoYWRvd19wbWQpKTsKIAkJCXBtZCA9IHBtZF9vZmZzZXQocHVkLCBh
ZGRyKTsKLQkJCXBtZF9wb3B1bGF0ZV9rZXJuZWwoJmluaXRfbW0sIHBtZCwKLQkJCQkJbG1fYWxp
YXMoa2FzYW5fZWFybHlfc2hhZG93X3B0ZSkpOworCQkJc2V0X3BtZF9lYXJseV9zaGFkb3cocG1k
KTsKIAkJCWNvbnRpbnVlOwogCQl9CiAKQEAgLTI3MSw4ICsyODgsNyBAQCBpbnQgX19yZWYga2Fz
YW5fcG9wdWxhdGVfZWFybHlfc2hhZG93KGNvbnN0IHZvaWQgKnNoYWRvd19zdGFydCwKIAkJCXB1
ZF9wb3B1bGF0ZSgmaW5pdF9tbSwgcHVkLAogCQkJCQlsbV9hbGlhcyhrYXNhbl9lYXJseV9zaGFk
b3dfcG1kKSk7CiAJCQlwbWQgPSBwbWRfb2Zmc2V0KHB1ZCwgYWRkcik7Ci0JCQlwbWRfcG9wdWxh
dGVfa2VybmVsKCZpbml0X21tLCBwbWQsCi0JCQkJCWxtX2FsaWFzKGthc2FuX2Vhcmx5X3NoYWRv
d19wdGUpKTsKKwkJCXNldF9wbWRfZWFybHlfc2hhZG93KHBtZCk7CiAJCQljb250aW51ZTsKIAkJ
fQogCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
