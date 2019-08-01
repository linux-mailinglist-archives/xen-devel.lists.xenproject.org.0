Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 669D07D942
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 12:21:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ht8Ai-0001g6-G5; Thu, 01 Aug 2019 10:18:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TV56=V5=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1ht8Ag-0001fL-L6
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 10:18:54 +0000
X-Inumbo-ID: c1242984-b445-11e9-9b09-a71489b10de1
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c1242984-b445-11e9-9b09-a71489b10de1;
 Thu, 01 Aug 2019 10:18:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Aug 2019 03:18:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,333,1559545200"; d="scan'208";a="175207870"
Received: from gao-cwp.sh.intel.com ([10.239.159.26])
 by orsmga003.jf.intel.com with ESMTP; 01 Aug 2019 03:18:50 -0700
From: Chao Gao <chao.gao@intel.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  1 Aug 2019 18:22:37 +0800
Message-Id: <1564654971-31328-3-git-send-email-chao.gao@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
Subject: [Xen-devel] [PATCH v8 02/16] x86/microcode: always
 collect_cpu_info() during boot
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

RnJvbTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgoKQ3VycmVudGx5
IGNwdV9zaWcgc3RydWN0IGlzIG5vdCB1cGRhdGVkIGR1cmluZyBib290IGlmIG5vIG1pY3JvY29k
ZSBibG9iCmlzIHNwZWNpZmllZCBieSAidWNvZGU9WzxpbnRlcmdlcj58IHNjYW5dIi4KCkl0IHdp
bGwgcmVzdWx0IGluIGNwdV9zaWcucmV2IGJlaW5nIDAgd2hpY2ggYWZmZWN0cyBBUElDJ3MKY2hl
Y2tfZGVhZGxpbmVfZXJyYXRhKCkgYW5kIHJldHBvbGluZV9zYWZlKCkgZnVuY3Rpb25zLgoKRml4
IHRoaXMgYnkgZ2V0dGluZyB1Y29kZSByZXZpc2lvbiBlYXJseSBkdXJpbmcgYm9vdCBhbmQgU01Q
IGJyaW5nIHVwLgpXaGlsZSBhdCBpdCwgcHJvdGVjdCBlYXJseV9taWNyb2NvZGVfdXBkYXRlX2Nw
dSgpIGZvciBjYXNlcyB3aGVuCm1pY3JvY29kZV9vcHMgaXMgTlVMTC4KClNpZ25lZC1vZmYtYnk6
IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTog
Q2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjg6CiAtIHJlZmlu
ZSBkZXNjcmlwdGlvbi4KIC0gSmFuIGFza2VkIGlmIHdlIGNvdWxkIGRyb3AgdGhlIGNhbGwgb2Yg
Y29sbGVjdF9jcHVfaW5mbygpIGZyb20KIG1pY3JvY29kZV91cGRhdGVfY3B1KCkuIEluIHRoZW9y
eSwgeWVzLCBidXQgc2hvdWxkIGJlIHBsYWNlZCBsYXRlcgogaW4gdGhlIHNlcmllcy4gQmVjYXVz
ZSB0aGVyZSBpcyBhbiBlcnJvciBwYXRoIChfX21pY3JvY29kZV9maW5pX2NwdSgpKQogaW4gd2hp
Y2ggY3B1X3NpZy5yZXYgaXMgY2xlYXJlZCwgaXQgaXMgaGFyZCB0byBtYWtlIHRoaW5ncyByaWdo
dAogaW4gYWxsIGNhc2VzIHdpdGhvdXQgcmVtb3ZpbmcgdGhlIGVycm9yIHBhdGggKHdoaWNoIGlz
IGRvbmUgYnkgZm9sbG93aW5nCiBwYXRjaGVzKS4gQ29uc2lkZXJpbmcgaXQgaXMgYSBnb29kIGZp
eCwgcHV0IGl0IGhlcmUgc28gdGhhdCBpdCBjYW4KIGJlIG1lcmdlZCB3aXRob3V0IGZvbGxvd2lu
ZyBwYXRjaGVzLgotLS0KIHhlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYyB8IDEyICsrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvbWljcm9jb2RlLmMgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMKaW5kZXggNDE2M2Y1
MC4uNDIxZDU3ZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21pY3JvY29kZS5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9taWNyb2NvZGUuYwpAQCAtMzgzLDEwICszODMsMTUgQEAgc3RhdGljIHN0cnVj
dCBub3RpZmllcl9ibG9jayBtaWNyb2NvZGVfcGVyY3B1X25mYiA9IHsKIAogaW50IF9faW5pdCBl
YXJseV9taWNyb2NvZGVfdXBkYXRlX2NwdShib29sIHN0YXJ0X3VwZGF0ZSkKIHsKKyAgICB1bnNp
Z25lZCBpbnQgY3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOworICAgIHN0cnVjdCB1Y29kZV9jcHVf
aW5mbyAqdWNpID0gJnBlcl9jcHUodWNvZGVfY3B1X2luZm8sIGNwdSk7CiAgICAgaW50IHJjID0g
MDsKICAgICB2b2lkICpkYXRhID0gTlVMTDsKICAgICBzaXplX3QgbGVuOwogCisgICAgaWYgKCAh
bWljcm9jb2RlX29wcyApCisgICAgICAgIHJldHVybiAtRU5PU1lTOworCiAgICAgaWYgKCB1Y29k
ZV9ibG9iLnNpemUgKQogICAgIHsKICAgICAgICAgbGVuID0gdWNvZGVfYmxvYi5zaXplOwpAQCAt
Mzk3LDYgKzQwMiw5IEBAIGludCBfX2luaXQgZWFybHlfbWljcm9jb2RlX3VwZGF0ZV9jcHUoYm9v
bCBzdGFydF91cGRhdGUpCiAgICAgICAgIGxlbiA9IHVjb2RlX21vZC5tb2RfZW5kOwogICAgICAg
ICBkYXRhID0gYm9vdHN0cmFwX21hcCgmdWNvZGVfbW9kKTsKICAgICB9CisKKyAgICBtaWNyb2Nv
ZGVfb3BzLT5jb2xsZWN0X2NwdV9pbmZvKGNwdSwgJnVjaS0+Y3B1X3NpZyk7CisKICAgICBpZiAo
IGRhdGEgKQogICAgIHsKICAgICAgICAgaWYgKCBzdGFydF91cGRhdGUgJiYgbWljcm9jb2RlX29w
cy0+c3RhcnRfdXBkYXRlICkKQEAgLTQxMyw2ICs0MjEsOCBAQCBpbnQgX19pbml0IGVhcmx5X21p
Y3JvY29kZV91cGRhdGVfY3B1KGJvb2wgc3RhcnRfdXBkYXRlKQogCiBpbnQgX19pbml0IGVhcmx5
X21pY3JvY29kZV9pbml0KHZvaWQpCiB7CisgICAgdW5zaWduZWQgaW50IGNwdSA9IHNtcF9wcm9j
ZXNzb3JfaWQoKTsKKyAgICBzdHJ1Y3QgdWNvZGVfY3B1X2luZm8gKnVjaSA9ICZwZXJfY3B1KHVj
b2RlX2NwdV9pbmZvLCBjcHUpOwogICAgIGludCByYzsKIAogICAgIHJjID0gbWljcm9jb2RlX2lu
aXRfaW50ZWwoKTsKQEAgLTQyNSw2ICs0MzUsOCBAQCBpbnQgX19pbml0IGVhcmx5X21pY3JvY29k
ZV9pbml0KHZvaWQpCiAKICAgICBpZiAoIG1pY3JvY29kZV9vcHMgKQogICAgIHsKKyAgICAgICAg
bWljcm9jb2RlX29wcy0+Y29sbGVjdF9jcHVfaW5mbyhjcHUsICZ1Y2ktPmNwdV9zaWcpOworCiAg
ICAgICAgIGlmICggdWNvZGVfbW9kLm1vZF9lbmQgfHwgdWNvZGVfYmxvYi5zaXplICkKICAgICAg
ICAgICAgIHJjID0gZWFybHlfbWljcm9jb2RlX3VwZGF0ZV9jcHUodHJ1ZSk7CiAKLS0gCjEuOC4z
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
