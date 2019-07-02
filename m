Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F62F5CA2E
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 09:59:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiDcP-0005KT-VT; Tue, 02 Jul 2019 07:54:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Fr47=U7=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hiDcP-0005KO-2z
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 07:54:25 +0000
X-Inumbo-ID: 99c499dc-9c9e-11e9-91fa-23c460302157
Received: from mga18.intel.com (unknown [134.134.136.126])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99c499dc-9c9e-11e9-91fa-23c460302157;
 Tue, 02 Jul 2019 07:54:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jul 2019 00:42:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,442,1557212400"; d="scan'208";a="362532214"
Received: from gao-cwp.sh.intel.com ([10.239.159.26])
 by fmsmga006.fm.intel.com with ESMTP; 02 Jul 2019 00:42:30 -0700
From: Chao Gao <chao.gao@intel.com>
To: xen-devel@lists.xenproject.org
Date: Tue,  2 Jul 2019 15:46:40 +0800
Message-Id: <1562053600-32685-1-git-send-email-chao.gao@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [Xen-devel] [PATCH] libxl_qmp: wait for completion of device removal
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Chao Gao <chao.gao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VG8gcmVtb3ZlIGEgZGV2aWNlIGZyb20gYSBkb21haW4sIGEgcW1wIGNvbW1hbmQgaXMgc2VudCB0
byBxZW11LiBCdXQgaXQgaXMKaGFuZGxlZCBieSBxZW11IGFzeWNocm9ub3VzbHkuIEV2ZW4gdGhl
IHFtcCBjb21tYW5kIGlzIGNsYWltZWQgdG8gYmUgZG9uZSwKdGhlIGFjdHVhbCBoYW5kbGluZyBp
biBxZW11IHNpZGUgbWF5IGhhcHBlbiBsYXRlci4KVGhpcyBiZWhhdmlvciBicmluZ3MgdHdvIHF1
ZXN0aW9uczoKMS4gQXR0YWNoaW5nIGEgZGV2aWNlIGJhY2sgdG8gYSBkb21haW4gcmlnaHQgYWZ0
ZXIgZGV0YWNoaW5nIHRoZSBkZXZpY2UgZnJvbQp0aGF0IGRvbWFpbiB3b3VsZCBmYWlsIHdpdGgg
ZXJyb3I6CgpsaWJ4bDogZXJyb3I6IGxpYnhsX3FtcC5jOjM0MTpxbXBfaGFuZGxlX2Vycm9yX3Jl
c3BvbnNlOiBEb21haW4gMTpyZWNlaXZlZCBhbgplcnJvciBtZXNzYWdlIGZyb20gUU1QIHNlcnZl
cjogRHVwbGljYXRlIElEICdwY2ktcHQtNjBfMDAuMCcgZm9yIGRldmljZQoKMi4gQWNjZXNzZXMg
dG8gUENJIGNvbmZpZ3VyYXRpb24gc3BhY2UgaW4gUWVtdSBtYXkgb3ZlcmxhcCB3aXRoIGxhdGVy
IGRldmljZQpyZXNldCBpc3N1ZWQgYnkgJ3hsJyBvciBieSBwY2liYWNrLgoKSW4gb3JkZXIgdG8g
YXZvaWQgbWVudGlvbmVkIHF1ZXN0aW9ucywgd2FpdCBmb3IgdGhlIGNvbXBsZXRpb24gb2YgZGV2
aWNlCnJlbW92YWwgYnkgcXVlcnlpbmcgYWxsIHBjaSBkZXZpY2VzIHVzaW5nIHFtcCBjb21tYW5k
IGFuZCBlbnN1cmluZyB0aGUgdGFyZ2V0CmRldmljZSBpc24ndCBsaXN0ZWQuIE9ubHkgcmV0cnkg
NSB0aW1lcyB0byBhdm9pZCAneGwnIHBvdGVudGlhbGx5IGJlaW5nIGJsb2NrZWQKYnkgcWVtdS4K
ClNpZ25lZC1vZmYtYnk6IENoYW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+Ci0tLQogdG9vbHMv
bGlieGwvbGlieGxfcW1wLmMgfCA1NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX3FtcC5jIGIvdG9vbHMvbGli
eGwvbGlieGxfcW1wLmMKaW5kZXggNDJjOGFiOC4uMThmNjEyNiAxMDA2NDQKLS0tIGEvdG9vbHMv
bGlieGwvbGlieGxfcW1wLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMKQEAgLTkxNiw2
ICs5MTYsMzggQEAgb3V0OgogICAgIHJldHVybiByYzsKIH0KIAorc3RhdGljIGludCBwY2lfZGVs
X2NhbGxiYWNrKGxpYnhsX19xbXBfaGFuZGxlciAqcW1wLAorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnN0IGxpYnhsX19qc29uX29iamVjdCAqcmVzcG9uc2UsIHZvaWQgKm9wYXF1ZSkK
K3sKKyAgICBjb25zdCBjaGFyICphc2tlZF9pZCA9IG9wYXF1ZTsKKyAgICBjb25zdCBsaWJ4bF9f
anNvbl9vYmplY3QgKmJ1cyA9IE5VTEw7CisgICAgR0NfSU5JVChxbXAtPmN0eCk7CisgICAgaW50
IGksIGosIHJjID0gMDsKKworICAgIGZvciAoaSA9IDA7IChidXMgPSBsaWJ4bF9fanNvbl9hcnJh
eV9nZXQocmVzcG9uc2UsIGkpKTsgaSsrKSB7CisgICAgICAgIGNvbnN0IGxpYnhsX19qc29uX29i
amVjdCAqZGV2aWNlcyA9IE5VTEw7CisgICAgICAgIGNvbnN0IGxpYnhsX19qc29uX29iamVjdCAq
ZGV2aWNlID0gTlVMTDsKKyAgICAgICAgY29uc3QgbGlieGxfX2pzb25fb2JqZWN0ICpvID0gTlVM
TDsKKyAgICAgICAgY29uc3QgY2hhciAqaWQgPSBOVUxMOworCisgICAgICAgIGRldmljZXMgPSBs
aWJ4bF9fanNvbl9tYXBfZ2V0KCJkZXZpY2VzIiwgYnVzLCBKU09OX0FSUkFZKTsKKworICAgICAg
ICBmb3IgKGogPSAwOyAoZGV2aWNlID0gbGlieGxfX2pzb25fYXJyYXlfZ2V0KGRldmljZXMsIGop
KTsgaisrKSB7CisgICAgICAgICAgICAgbyA9IGxpYnhsX19qc29uX21hcF9nZXQoInFkZXZfaWQi
LCBkZXZpY2UsIEpTT05fU1RSSU5HKTsKKyAgICAgICAgICAgICBpZCA9IGxpYnhsX19qc29uX29i
amVjdF9nZXRfc3RyaW5nKG8pOworCisgICAgICAgICAgICAgaWYgKGlkICYmIHN0cmNtcChhc2tl
ZF9pZCwgaWQpID09IDApIHsKKyAgICAgICAgICAgICAgICAgcmMgPSAxOworICAgICAgICAgICAg
ICAgICBnb3RvIG91dDsKKyAgICAgICAgICAgICB9CisgICAgICAgIH0KKyAgICB9CisKK291dDoK
KyAgICBHQ19GUkVFOworICAgIHJldHVybiByYzsKK30KKwogc3RhdGljIGludCBxbXBfcnVuX2Nv
bW1hbmQobGlieGxfX2djICpnYywgaW50IGRvbWlkLAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY29uc3QgY2hhciAqY21kLCBsaWJ4bF9fanNvbl9vYmplY3QgKmFyZ3MsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBxbXBfY2FsbGJhY2tfdCBjYWxsYmFjaywgdm9pZCAqb3BhcXVlKQpA
QCAtMTAwMCw5ICsxMDMyLDMyIEBAIGludCBsaWJ4bF9fcW1wX3BjaV9hZGQobGlieGxfX2djICpn
YywgaW50IGRvbWlkLCBsaWJ4bF9kZXZpY2VfcGNpICpwY2lkZXYpCiBzdGF0aWMgaW50IHFtcF9k
ZXZpY2VfZGVsKGxpYnhsX19nYyAqZ2MsIGludCBkb21pZCwgY2hhciAqaWQpCiB7CiAgICAgbGli
eGxfX2pzb25fb2JqZWN0ICphcmdzID0gTlVMTDsKKyAgICBsaWJ4bF9fcW1wX2hhbmRsZXIgKnFt
cCA9IE5VTEw7CisgICAgaW50IHJjID0gMDsKKworICAgIHFtcCA9IGxpYnhsX19xbXBfaW5pdGlh
bGl6ZShnYywgZG9taWQpOworICAgIGlmICghcW1wKQorICAgICAgICByZXR1cm4gRVJST1JfRkFJ
TDsKIAogICAgIHFtcF9wYXJhbWV0ZXJzX2FkZF9zdHJpbmcoZ2MsICZhcmdzLCAiaWQiLCBpZCk7
Ci0gICAgcmV0dXJuIHFtcF9ydW5fY29tbWFuZChnYywgZG9taWQsICJkZXZpY2VfZGVsIiwgYXJn
cywgTlVMTCwgTlVMTCk7CisgICAgcmMgPSBxbXBfc3luY2hyb25vdXNfc2VuZChxbXAsICJkZXZp
Y2VfZGVsIiwgYXJncywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwsIE5VTEws
IHFtcC0+dGltZW91dCk7CisgICAgaWYgKHJjID09IDApIHsKKyAgICAgICAgdW5zaWduZWQgaW50
IHJldHJ5ID0gMDsKKworICAgICAgICBkbyB7CisgICAgICAgICAgICBpZiAocW1wX3N5bmNocm9u
b3VzX3NlbmQocW1wLCAicXVlcnktcGNpIiwgTlVMTCwKKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwY2lfZGVsX2NhbGxiYWNrLCBpZCwgcW1wLT50aW1lb3V0KSA9PSAwKSB7
CisgICAgICAgICAgICAgICAgYnJlYWs7CisgICAgICAgICAgICB9CisgICAgICAgICAgICBMT0dE
KERFQlVHLCBxbXAtPmRvbWlkLAorICAgICAgICAgICAgICAgICAiV2FpdGluZyBmb3IgY29tcGxl
dGlvbiBvZiBkZWxldGluZyBkZXZpY2UgJXMiLCBpZCk7CisgICAgICAgICAgICBzbGVlcCgxKTsK
KyAgICAgICAgfSB3aGlsZSAocmV0cnkrKyA8IDUpOworICAgIH0KKworICAgIGxpYnhsX19xbXBf
Y2xvc2UocW1wKTsKKyAgICByZXR1cm4gcmM7CiB9CiAKIGludCBsaWJ4bF9fcW1wX3BjaV9kZWwo
bGlieGxfX2djICpnYywgaW50IGRvbWlkLCBsaWJ4bF9kZXZpY2VfcGNpICpwY2lkZXYpCi0tIAox
LjkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
