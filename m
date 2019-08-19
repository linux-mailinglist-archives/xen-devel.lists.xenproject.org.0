Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BBC91AA9
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 03:25:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzWMa-000145-LW; Mon, 19 Aug 2019 01:21:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JIwN=WP=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hzWMY-00013u-P9
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 01:21:34 +0000
X-Inumbo-ID: aeb07cac-c21f-11e9-8be3-12813bfff9fa
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aeb07cac-c21f-11e9-8be3-12813bfff9fa;
 Mon, 19 Aug 2019 01:21:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Aug 2019 18:21:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,403,1559545200"; d="scan'208";a="261683854"
Received: from gao-cwp.sh.intel.com ([10.239.159.26])
 by orsmga001.jf.intel.com with ESMTP; 18 Aug 2019 18:21:32 -0700
From: Chao Gao <chao.gao@intel.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 19 Aug 2019 09:25:16 +0800
Message-Id: <1566177928-19114-4-git-send-email-chao.gao@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
Subject: [Xen-devel] [PATCH v9 03/15] microcode/amd: distinguish old and
 mismatched ucode in microcode_fits()
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
Cc: Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Chao Gao <chao.gao@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U29tZXRpbWVzLCBhbiB1Y29kZSB3aXRoIGEgbGV2ZWwgbG93ZXIgdGhhbiBvciBlcXVhbCB0byBj
dXJyZW50IENQVSdzCnBhdGNoIGxldmVsIGlzIHVzZWZ1bC4gRm9yIGV4YW1wbGUsIHRvIHdvcmsg
YXJvdW5kIGEgYnJva2VuIGJpb3Mgd2hpY2gKb25seSBsb2FkcyB1Y29kZSBmb3IgQlNQLCB3aGVu
IEJTUCBwYXJzZXMgYW4gdWNvZGUgYmxvYiBkdXJpbmcgYm9vdHVwLAppdCBpcyBiZXR0ZXIgdG8g
c2F2ZSBhbiB1Y29kZSB3aXRoIGxvd2VyIG9yIGVxdWFsIGxldmVsIGZvciBBUHMKCk5vIGZ1bmN0
aW9uYWwgY2hhbmdlIGlzIG1hZGUgaW4gdGhpcyBwYXRjaC4gQnV0IGZvbGxvd2luZyBwYXRjaCB3
b3VsZApoYW5kbGUgIm9sZCB1Y29kZSIgYW5kICJtaXNtYXRjaGVkIHVjb2RlIiBzZXBhcmF0ZWx5
LgoKU2lnbmVkLW9mZi1ieTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KUmV2aWV3ZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjg6CiAt
IG5ldwotLS0KIHhlbi9hcmNoL3g4Ni9taWNyb2NvZGVfYW1kLmMgfCAxOCArKysrKysrKystLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21pY3JvY29kZV9hbWQuYyBiL3hlbi9hcmNoL3g4Ni9t
aWNyb2NvZGVfYW1kLmMKaW5kZXggMzA2OTc4NC4uM2RiMzU1NSAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L21pY3JvY29kZV9hbWQuYworKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2FtZC5j
CkBAIC0xNTIsOCArMTUyLDggQEAgc3RhdGljIGJvb2xfdCBmaW5kX2VxdWl2X2NwdV9pZChjb25z
dCBzdHJ1Y3QgZXF1aXZfY3B1X2VudHJ5ICplcXVpdl9jcHVfdGFibGUsCiAgICAgcmV0dXJuIDA7
CiB9CiAKLXN0YXRpYyBib29sX3QgbWljcm9jb2RlX2ZpdHMoY29uc3Qgc3RydWN0IG1pY3JvY29k
ZV9hbWQgKm1jX2FtZCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50
IGNwdSkKK3N0YXRpYyBlbnVtIG1pY3JvY29kZV9tYXRjaF9yZXN1bHQgbWljcm9jb2RlX2ZpdHMo
CisgICAgY29uc3Qgc3RydWN0IG1pY3JvY29kZV9hbWQgKm1jX2FtZCwgdW5zaWduZWQgaW50IGNw
dSkKIHsKICAgICBzdHJ1Y3QgdWNvZGVfY3B1X2luZm8gKnVjaSA9ICZwZXJfY3B1KHVjb2RlX2Nw
dV9pbmZvLCBjcHUpOwogICAgIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfaGVhZGVyX2FtZCAqbWNf
aGVhZGVyID0gbWNfYW1kLT5tcGI7CkBAIC0xNjcsMjcgKzE2NywyNyBAQCBzdGF0aWMgYm9vbF90
IG1pY3JvY29kZV9maXRzKGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfYW1kICptY19hbWQsCiAgICAg
Y3VycmVudF9jcHVfaWQgPSBjcHVpZF9lYXgoMHgwMDAwMDAwMSk7CiAKICAgICBpZiAoICFmaW5k
X2VxdWl2X2NwdV9pZChlcXVpdl9jcHVfdGFibGUsIGN1cnJlbnRfY3B1X2lkLCAmZXF1aXZfY3B1
X2lkKSApCi0gICAgICAgIHJldHVybiAwOworICAgICAgICByZXR1cm4gTUlTX1VDT0RFOwogCiAg
ICAgaWYgKCAobWNfaGVhZGVyLT5wcm9jZXNzb3JfcmV2X2lkKSAhPSBlcXVpdl9jcHVfaWQgKQot
ICAgICAgICByZXR1cm4gMDsKKyAgICAgICAgcmV0dXJuIE1JU19VQ09ERTsKIAogICAgIGlmICgg
IXZlcmlmeV9wYXRjaF9zaXplKG1jX2FtZC0+bXBiX3NpemUpICkKICAgICB7CiAgICAgICAgIHBy
X2RlYnVnKCJtaWNyb2NvZGU6IHBhdGNoIHNpemUgbWlzbWF0Y2hcbiIpOwotICAgICAgICByZXR1
cm4gMDsKKyAgICAgICAgcmV0dXJuIE1JU19VQ09ERTsKICAgICB9CiAKICAgICBpZiAoIG1jX2hl
YWRlci0+cGF0Y2hfaWQgPD0gdWNpLT5jcHVfc2lnLnJldiApCiAgICAgewogICAgICAgICBwcl9k
ZWJ1ZygibWljcm9jb2RlOiBwYXRjaCBpcyBhbHJlYWR5IGF0IHJlcXVpcmVkIGxldmVsIG9yIGdy
ZWF0ZXIuXG4iKTsKLSAgICAgICAgcmV0dXJuIDA7CisgICAgICAgIHJldHVybiBPTERfVUNPREU7
CiAgICAgfQogCiAgICAgcHJfZGVidWcoIm1pY3JvY29kZTogQ1BVJWQgZm91bmQgYSBtYXRjaGlu
ZyBtaWNyb2NvZGUgdXBkYXRlIHdpdGggdmVyc2lvbiAlI3ggKGN1cnJlbnQ9JSN4KVxuIiwKICAg
ICAgICAgICAgICBjcHUsIG1jX2hlYWRlci0+cGF0Y2hfaWQsIHVjaS0+Y3B1X3NpZy5yZXYpOwog
Ci0gICAgcmV0dXJuIDE7CisgICAgcmV0dXJuIE5FV19VQ09ERTsKIH0KIAogc3RhdGljIGludCBh
cHBseV9taWNyb2NvZGUodW5zaWduZWQgaW50IGNwdSkKQEAgLTQ5Niw3ICs0OTYsNyBAQCBzdGF0
aWMgaW50IGNwdV9yZXF1ZXN0X21pY3JvY29kZSh1bnNpZ25lZCBpbnQgY3B1LCBjb25zdCB2b2lk
ICpidWYsCiAgICAgd2hpbGUgKCAoZXJyb3IgPSBnZXRfdWNvZGVfZnJvbV9idWZmZXJfYW1kKG1j
X2FtZCwgYnVmLCBidWZzaXplLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAmb2Zmc2V0KSkgPT0gMCApCiAgICAgewotICAgICAgICBpZiAoIG1pY3JvY29k
ZV9maXRzKG1jX2FtZCwgY3B1KSApCisgICAgICAgIGlmICggbWljcm9jb2RlX2ZpdHMobWNfYW1k
LCBjcHUpID09IE5FV19VQ09ERSApCiAgICAgICAgIHsKICAgICAgICAgICAgIGVycm9yID0gYXBw
bHlfbWljcm9jb2RlKGNwdSk7CiAgICAgICAgICAgICBpZiAoIGVycm9yICkKQEAgLTU3Niw3ICs1
NzYsNyBAQCBzdGF0aWMgaW50IG1pY3JvY29kZV9yZXN1bWVfbWF0Y2godW5zaWduZWQgaW50IGNw
dSwgY29uc3Qgdm9pZCAqbWMpCiAgICAgc3RydWN0IG1pY3JvY29kZV9hbWQgKm1jX2FtZCA9IHVj
aS0+bWMubWNfYW1kOwogICAgIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfYW1kICpzcmMgPSBtYzsK
IAotICAgIGlmICggIW1pY3JvY29kZV9maXRzKHNyYywgY3B1KSApCisgICAgaWYgKCBtaWNyb2Nv
ZGVfZml0cyhzcmMsIGNwdSkgIT0gTkVXX1VDT0RFICkKICAgICAgICAgcmV0dXJuIDA7CiAKICAg
ICBpZiAoIHNyYyAhPSBtY19hbWQgKQotLSAKMS44LjMuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
