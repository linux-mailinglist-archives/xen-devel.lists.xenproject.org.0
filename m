Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A658B096F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 09:22:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8JOO-0002AM-SH; Thu, 12 Sep 2019 07:19:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+knL=XH=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1i8JON-000290-7S
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 07:19:47 +0000
X-Inumbo-ID: a27761e6-d52d-11e9-83e3-12813bfff9fa
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a27761e6-d52d-11e9-83e3-12813bfff9fa;
 Thu, 12 Sep 2019 07:19:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Sep 2019 00:19:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="189906404"
Received: from gao-cwp.sh.intel.com ([10.239.159.26])
 by orsmga006.jf.intel.com with ESMTP; 12 Sep 2019 00:19:16 -0700
From: Chao Gao <chao.gao@intel.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 12 Sep 2019 15:22:29 +0800
Message-Id: <1568272949-1086-17-git-send-email-chao.gao@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1568272949-1086-1-git-send-email-chao.gao@intel.com>
References: <1568272949-1086-1-git-send-email-chao.gao@intel.com>
Subject: [Xen-devel] [PATCH v10 16/16] microcode/intel: writeback and
 invalidate cache conditionally
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

SXQgaXMgbmVlZGVkIHRvIG1pdGlnYXRlIHNvbWUgaXNzdWVzIG9uIHRoaXMgc3BlY2lmaWMgQnJv
YWR3ZWxsIENQVS4KClNpZ25lZC1vZmYtYnk6IENoYW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+
Ci0tLQogeGVuL2FyY2gveDg2L21pY3JvY29kZV9pbnRlbC5jIHwgMjcgKysrKysrKysrKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfaW50ZWwuYyBiL3hlbi9hcmNoL3g4Ni9taWNyb2Nv
ZGVfaW50ZWwuYwppbmRleCBiY2VmNjY4Li40ZTVlN2Y5IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94
ODYvbWljcm9jb2RlX2ludGVsLmMKKysrIGIveGVuL2FyY2gveDg2L21pY3JvY29kZV9pbnRlbC5j
CkBAIC0zMDUsNiArMzA1LDMxIEBAIHN0YXRpYyBib29sIGlzX2JsYWNrbGlzdGVkKHZvaWQpCiAg
ICAgcmV0dXJuIGZhbHNlOwogfQogCitzdGF0aWMgdm9pZCBtaWNyb2NvZGVfcXVpcmsodm9pZCkK
K3sKKyAgICBzdHJ1Y3QgY3B1aW5mb194ODYgKmM7CisgICAgdWludDY0X3QgbGxjX3NpemU7CisK
KyAgICAvKgorICAgICAqIERvbid0IHJlZmVyIHRvIGN1cnJlbnRfY3B1X2RhdGEsIHdoaWNoIGlz
bid0IGZ1bGx5IGluaXRpYWxpemVkCisgICAgICogYmVmb3JlIHRoaXMgc3RhZ2UuCisgICAgICov
CisgICAgaWYgKCBzeXN0ZW1fc3RhdGUgPCBTWVNfU1RBVEVfc21wX2Jvb3QgKQorICAgICAgICBy
ZXR1cm47CisKKyAgICBjID0gJmN1cnJlbnRfY3B1X2RhdGE7CisgICAgbGxjX3NpemUgPSBjLT54
ODZfY2FjaGVfc2l6ZSAqIDEwMjRVTEw7CisgICAgZG9fZGl2KGxsY19zaXplLCBjLT54ODZfbWF4
X2NvcmVzKTsKKworICAgIC8qCisgICAgICogVG8gbWl0aWdhdGUgc29tZSBpc3N1ZXMgb24gdGhp
cyBzcGVjaWZpYyBCcm9hZHdlbGwgQ1BVLCB3cml0ZWJhY2sgYW5kCisgICAgICogaW52YWxpZGF0
ZSBjYWNoZSByZWdhcmRsZXNzIG9mIHVjb2RlIHJldmlzaW9uLgorICAgICAqLworICAgIGlmICgg
Yy0+eDg2ID09IDYgJiYgYy0+eDg2X21vZGVsID09IDB4NEYgJiYgYy0+eDg2X21hc2sgPT0gMHgx
ICYmCisgICAgICAgICBsbGNfc2l6ZSA+IDI2MjE0NDAgKQorICAgICAgICB3YmludmQoKTsKK30K
Kwogc3RhdGljIGludCBhcHBseV9taWNyb2NvZGUoY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRj
aCAqcGF0Y2gpCiB7CiAgICAgdWludDY0X3QgbXNyX2NvbnRlbnQ7CkBAIC0zMjMsNiArMzQ4LDgg
QEAgc3RhdGljIGludCBhcHBseV9taWNyb2NvZGUoY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRj
aCAqcGF0Y2gpCiAKICAgICBCVUdfT04obG9jYWxfaXJxX2lzX2VuYWJsZWQoKSk7CiAKKyAgICBt
aWNyb2NvZGVfcXVpcmsoKTsKKwogICAgIC8qIHdyaXRlIG1pY3JvY29kZSB2aWEgTVNSIDB4Nzkg
Ki8KICAgICB3cm1zcmwoTVNSX0lBMzJfVUNPREVfV1JJVEUsICh1bnNpZ25lZCBsb25nKW1jX2lu
dGVsLT5iaXRzKTsKICAgICB3cm1zcmwoTVNSX0lBMzJfVUNPREVfUkVWLCAweDBVTEwpOwotLSAK
MS44LjMuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
