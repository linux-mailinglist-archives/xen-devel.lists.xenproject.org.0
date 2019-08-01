Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA41C7D94F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 12:22:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ht8Aq-0001kl-Fm; Thu, 01 Aug 2019 10:19:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TV56=V5=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1ht8Ao-0001jn-W5
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 10:19:03 +0000
X-Inumbo-ID: c69f26a2-b445-11e9-8aea-af7a2c1d869f
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c69f26a2-b445-11e9-8aea-af7a2c1d869f;
 Thu, 01 Aug 2019 10:18:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Aug 2019 03:18:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,333,1559545200"; d="scan'208";a="175207894"
Received: from gao-cwp.sh.intel.com ([10.239.159.26])
 by orsmga003.jf.intel.com with ESMTP; 01 Aug 2019 03:18:57 -0700
From: Chao Gao <chao.gao@intel.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  1 Aug 2019 18:22:40 +0800
Message-Id: <1564654971-31328-6-git-send-email-chao.gao@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
Subject: [Xen-devel] [PATCH v8 05/16] microcode/amd: distinguish old and
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
LgoKU2lnbmVkLW9mZi1ieTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KLS0tCkNoYW5n
ZXMgaW4gdjg6CiAtIG5ldwotLS0KIHhlbi9hcmNoL3g4Ni9taWNyb2NvZGVfYW1kLmMgfCAxOCAr
KysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21pY3JvY29kZV9hbWQuYyBiL3hl
bi9hcmNoL3g4Ni9taWNyb2NvZGVfYW1kLmMKaW5kZXggYWZjYTUxZi4uZTlhNTY3ZiAxMDA2NDQK
LS0tIGEveGVuL2FyY2gveDg2L21pY3JvY29kZV9hbWQuYworKysgYi94ZW4vYXJjaC94ODYvbWlj
cm9jb2RlX2FtZC5jCkBAIC0xNTIsOCArMTUyLDggQEAgc3RhdGljIGJvb2xfdCBmaW5kX2VxdWl2
X2NwdV9pZChjb25zdCBzdHJ1Y3QgZXF1aXZfY3B1X2VudHJ5ICplcXVpdl9jcHVfdGFibGUsCiAg
ICAgcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBib29sX3QgbWljcm9jb2RlX2ZpdHMoY29uc3Qgc3Ry
dWN0IG1pY3JvY29kZV9hbWQgKm1jX2FtZCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgaW50IGNwdSkKK3N0YXRpYyBlbnVtIG1pY3JvY29kZV9tYXRjaF9yZXN1bHQgbWlj
cm9jb2RlX2ZpdHMoCisgICAgY29uc3Qgc3RydWN0IG1pY3JvY29kZV9hbWQgKm1jX2FtZCwgdW5z
aWduZWQgaW50IGNwdSkKIHsKICAgICBzdHJ1Y3QgdWNvZGVfY3B1X2luZm8gKnVjaSA9ICZwZXJf
Y3B1KHVjb2RlX2NwdV9pbmZvLCBjcHUpOwogICAgIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfaGVh
ZGVyX2FtZCAqbWNfaGVhZGVyID0gbWNfYW1kLT5tcGI7CkBAIC0xNjcsMjcgKzE2NywyNyBAQCBz
dGF0aWMgYm9vbF90IG1pY3JvY29kZV9maXRzKGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfYW1kICpt
Y19hbWQsCiAgICAgY3VycmVudF9jcHVfaWQgPSBjcHVpZF9lYXgoMHgwMDAwMDAwMSk7CiAKICAg
ICBpZiAoICFmaW5kX2VxdWl2X2NwdV9pZChlcXVpdl9jcHVfdGFibGUsIGN1cnJlbnRfY3B1X2lk
LCAmZXF1aXZfY3B1X2lkKSApCi0gICAgICAgIHJldHVybiAwOworICAgICAgICByZXR1cm4gTUlT
X1VDT0RFOwogCiAgICAgaWYgKCAobWNfaGVhZGVyLT5wcm9jZXNzb3JfcmV2X2lkKSAhPSBlcXVp
dl9jcHVfaWQgKQotICAgICAgICByZXR1cm4gMDsKKyAgICAgICAgcmV0dXJuIE1JU19VQ09ERTsK
IAogICAgIGlmICggIXZlcmlmeV9wYXRjaF9zaXplKG1jX2FtZC0+bXBiX3NpemUpICkKICAgICB7
CiAgICAgICAgIHByX2RlYnVnKCJtaWNyb2NvZGU6IHBhdGNoIHNpemUgbWlzbWF0Y2hcbiIpOwot
ICAgICAgICByZXR1cm4gMDsKKyAgICAgICAgcmV0dXJuIE1JU19VQ09ERTsKICAgICB9CiAKICAg
ICBpZiAoIG1jX2hlYWRlci0+cGF0Y2hfaWQgPD0gdWNpLT5jcHVfc2lnLnJldiApCiAgICAgewog
ICAgICAgICBwcl9kZWJ1ZygibWljcm9jb2RlOiBwYXRjaCBpcyBhbHJlYWR5IGF0IHJlcXVpcmVk
IGxldmVsIG9yIGdyZWF0ZXIuXG4iKTsKLSAgICAgICAgcmV0dXJuIDA7CisgICAgICAgIHJldHVy
biBPTERfVUNPREU7CiAgICAgfQogCiAgICAgcHJfZGVidWcoIm1pY3JvY29kZTogQ1BVJWQgZm91
bmQgYSBtYXRjaGluZyBtaWNyb2NvZGUgdXBkYXRlIHdpdGggdmVyc2lvbiAlI3ggKGN1cnJlbnQ9
JSN4KVxuIiwKICAgICAgICAgICAgICBjcHUsIG1jX2hlYWRlci0+cGF0Y2hfaWQsIHVjaS0+Y3B1
X3NpZy5yZXYpOwogCi0gICAgcmV0dXJuIDE7CisgICAgcmV0dXJuIE5FV19VQ09ERTsKIH0KIAog
c3RhdGljIGludCBhcHBseV9taWNyb2NvZGUodW5zaWduZWQgaW50IGNwdSkKQEAgLTUwMiw3ICs1
MDIsNyBAQCBzdGF0aWMgaW50IGNwdV9yZXF1ZXN0X21pY3JvY29kZSh1bnNpZ25lZCBpbnQgY3B1
LCBjb25zdCB2b2lkICpidWYsCiAgICAgd2hpbGUgKCAoZXJyb3IgPSBnZXRfdWNvZGVfZnJvbV9i
dWZmZXJfYW1kKG1jX2FtZCwgYnVmLCBidWZzaXplLAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAmb2Zmc2V0KSkgPT0gMCApCiAgICAgewotICAgICAgICBp
ZiAoIG1pY3JvY29kZV9maXRzKG1jX2FtZCwgY3B1KSApCisgICAgICAgIGlmICggbWljcm9jb2Rl
X2ZpdHMobWNfYW1kLCBjcHUpID09IE5FV19VQ09ERSApCiAgICAgICAgIHsKICAgICAgICAgICAg
IGVycm9yID0gYXBwbHlfbWljcm9jb2RlKGNwdSk7CiAgICAgICAgICAgICBpZiAoIGVycm9yICkK
QEAgLTU4Myw3ICs1ODMsNyBAQCBzdGF0aWMgaW50IG1pY3JvY29kZV9yZXN1bWVfbWF0Y2godW5z
aWduZWQgaW50IGNwdSwgY29uc3Qgdm9pZCAqbWMpCiAgICAgc3RydWN0IG1pY3JvY29kZV9hbWQg
Km1jX2FtZCA9IHVjaS0+bWMubWNfYW1kOwogICAgIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfYW1k
ICpzcmMgPSBtYzsKIAotICAgIGlmICggIW1pY3JvY29kZV9maXRzKHNyYywgY3B1KSApCisgICAg
aWYgKCBtaWNyb2NvZGVfZml0cyhzcmMsIGNwdSkgIT0gTkVXX1VDT0RFICkKICAgICAgICAgcmV0
dXJuIDA7CiAKICAgICBpZiAoIHNyYyAhPSBtY19hbWQgKQotLSAKMS44LjMuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
