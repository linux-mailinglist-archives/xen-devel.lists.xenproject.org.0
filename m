Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1577B2B03B
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 10:31:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVAys-0004GI-UG; Mon, 27 May 2019 08:27:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vl5o=T3=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hVAyr-0004FG-F9
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 08:27:41 +0000
X-Inumbo-ID: 4a960c5d-8059-11e9-8980-bc764e045a96
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4a960c5d-8059-11e9-8980-bc764e045a96;
 Mon, 27 May 2019 08:27:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 May 2019 01:27:40 -0700
X-ExtLoop1: 1
Received: from gao-cwp.sh.intel.com ([10.239.159.26])
 by orsmga005.jf.intel.com with ESMTP; 27 May 2019 01:27:38 -0700
From: Chao Gao <chao.gao@intel.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 27 May 2019 16:31:28 +0800
Message-Id: <1558945891-3015-8-git-send-email-chao.gao@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
Subject: [Xen-devel] [PATCH v7 07/10] microcode/intel: Writeback and
 invalidate caches before updating microcode
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Chao Gao <chao.gao@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXBkYXRpbmcgbWljcm9jb2RlIGlzIGxlc3MgZXJyb3IgcHJvbmUgd2hlbiBjYWNoZXMgaGF2ZSBi
ZWVuIGZsdXNoZWQgYW5kCmRlcGVuZGluZyBvbiB3aGF0IGV4YWN0bHkgdGhlIG1pY3JvY29kZSBp
cyB1cGRhdGluZy4gRm9yIGV4YW1wbGUsIHNvbWUKb2YgdGhlIGlzc3VlcyBhcm91bmQgY2VydGFp
biBCcm9hZHdlbGwgcGFydHMgY2FuIGJlIGFkZHJlc3NlZCBieSBkb2luZyBhCmZ1bGwgY2FjaGUg
Zmx1c2guCgpXaXRoIHBhcmFsbGVsIG1pY3JvY29kZSB1cGRhdGUsIHRoZSBjb3N0IG9mIHRoaXMg
cGF0Y2ggaXMgaGFyZGx5Cm5vdGljYWJsZS4gQWx0aG91Z2ggb25seSBCRFggd2l0aCBhbiBvbGQg
bWljcm9jb2RlIG5lZWRzIHRoaXMgZml4LCB3ZQp3b3VsZCBsaWtlIHRvIGF2b2lkIGZ1dHVyZSBp
c3N1ZXMgaW4gY2FzZSB0aGV5IGNvbWUgYnkgbGF0ZXIgZHVlIHRvCm90aGVyIHJlYXNvbnMuCgpb
bGludXggY29tbWl0OiA5MWRmOWZkZjUxNDkyYWVjOWZlZDZiNGNiZDMzMTYwODg2NzQwZjQ3XQpT
aWduZWQtb2ZmLWJ5OiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPgpDYzogQXNob2sgUmFq
IDxhc2hvay5yYWpAaW50ZWwuY29tPgotLS0KQ2hhbmdlcyBpbiB2NzoKIC0gZXhwbGFpbiB3aHkg
d2UgZG8gJ3diaW52ZCcgdW5jb25kaXRpb25hbGx5IHJhdGhlciB0aGFuIG9ubHkgZm9yIEJEWAog
aW4gY29tbWl0IG1lc3NhZ2UKCkNoYW5nZXMgaW4gdjY6CiAtIG5ldwotLS0KIHhlbi9hcmNoL3g4
Ni9taWNyb2NvZGVfaW50ZWwuYyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21pY3JvY29kZV9pbnRlbC5jIGIveGVu
L2FyY2gveDg2L21pY3JvY29kZV9pbnRlbC5jCmluZGV4IDY1MDQ5NWQuLmJmYjQ4Y2UgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfaW50ZWwuYworKysgYi94ZW4vYXJjaC94ODYv
bWljcm9jb2RlX2ludGVsLmMKQEAgLTMxMCw2ICszMTAsMTIgQEAgc3RhdGljIGludCBhcHBseV9t
aWNyb2NvZGUoY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqcGF0Y2gpCiAgICAgLyogc2Vy
aWFsaXplIGFjY2VzcyB0byB0aGUgcGh5c2ljYWwgd3JpdGUgdG8gTVNSIDB4NzkgKi8KICAgICBz
cGluX2xvY2tfaXJxc2F2ZSgmbWljcm9jb2RlX3VwZGF0ZV9sb2NrLCBmbGFncyk7CiAKKyAgICAv
KgorICAgICAqIFdyaXRlYmFjayBhbmQgaW52YWxpZGF0ZSBjYWNoZXMgYmVmb3JlIHVwZGF0aW5n
IG1pY3JvY29kZSB0byBhdm9pZAorICAgICAqIGludGVybmFsIGlzc3VlcyBkZXBlbmRpbmcgb24g
d2hhdCB0aGUgbWljcm9jb2RlIGlzIHVwZGF0aW5nLgorICAgICAqLworICAgIHdiaW52ZCgpOwor
CiAgICAgLyogd3JpdGUgbWljcm9jb2RlIHZpYSBNU1IgMHg3OSAqLwogICAgIHdybXNybChNU1Jf
SUEzMl9VQ09ERV9XUklURSwgKHVuc2lnbmVkIGxvbmcpbWNfaW50ZWwtPmJpdHMpOwogICAgIHdy
bXNybChNU1JfSUEzMl9VQ09ERV9SRVYsIDB4MFVMTCk7Ci0tIAoxLjguMy4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
