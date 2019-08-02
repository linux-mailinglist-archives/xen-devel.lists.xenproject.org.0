Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9197FDED
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 18:00:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZwi-0006AU-LP; Fri, 02 Aug 2019 15:58:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qji5=V6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1htZwf-00066P-QL
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:58:17 +0000
X-Inumbo-ID: 56cb0470-b53e-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 56cb0470-b53e-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 15:58:16 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8SXjRg9qcptp5ea2C5Jc+Z1rSfAeunhsiXNVuexUmMacf8PdAY4/MSnTox7vnTa/3Z4X+EiMF5
 WK+LKUPIUZ06TuU9RDMMnP8TlQCJPy+p7X8BwWUgCqcXKHvLJJNGPZ7RUFyL3J24IMuFLodJ7n
 5/k4VlPPfdIqfJMKaXzAiNXx/K5GG1/i1PPJWG88Q7zSXfpLfZn1Kj8dIBf1ZKI/astLOi74sh
 /l6xpW2AZYncIG351NIZpr8QTDtl/l5CoGzy3zheNYWxecKHhp+FCLAeCnLTcGIFXnr+Tl+87b
 5BI=
X-SBRS: 2.7
X-MesageID: 3787825
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,338,1559534400"; 
   d="scan'208";a="3787825"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 2 Aug 2019 16:35:57 +0100
Message-ID: <20190802153606.32061-27-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802153606.32061-1-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 26/35] libxl_pci: Only check if qemu-dm is
 running in qemu-trad case
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UUVNVSB1cHN0cmVhbSAob3IgcWVtdS14ZW4pIG1heSBub3QgaGF2ZSBzZXQgInJ1bm5pbmciIHN0
YXRlIGluCnhlbnN0b3JlLiAicnVubmluZyIgd2l0aCBRRU1VIGRvZXNuJ3QgbWVhbiB0aGF0IHRo
ZSBiaW5hcnkgaXMKcnVubmluZywgaXQgbWVhbnMgdGhhdCB0aGUgZW11bGF0aW9uIGhhdmUgc3Rh
cnRlZC4gV2hlbiBhZGRpbmcgYQpwY2ktcGFzc3Rocm91Z2ggZGV2aWNlIHRvIFFFTVUsIHdlIGRv
IHNvIHZpYSBRTVAsIHdlIGhhdmUgYSBkaXJlY3QKYW5zd2VyIHRvIHdoZXRoZXIgUUVNVSBpcyBy
dW5uaW5nIG9yIG5vdCwgbm8gbmVlZCB0byBjaGVjayBhaGVhZC4KCk1vdmluZyB0aGUgY2hlY2sg
dG8gZG8gaXQgb25seSB3aXRoIHFlbXUtdHJhZCBtYWtlcyB1cGNvbWluZyBjaGFuZ2VzCnNpbXBs
ZXIuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9wY2kuYyB8IDE3ICsrKysrKysrLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX3BjaS5jIGIvdG9vbHMvbGlieGwvbGlieGxfcGNpLmMK
aW5kZXggYjljYTY5ZjVmMC4uMDcxODgwYjg1NSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGli
eGxfcGNpLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfcGNpLmMKQEAgLTEwMDQsMTMgKzEwMDQs
MTMgQEAgc3RhdGljIGludCBkb19wY2lfYWRkKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlk
LAogCiAgICAgaWYgKHR5cGUgPT0gTElCWExfRE9NQUlOX1RZUEVfSFZNKSB7CiAgICAgICAgIGh2
bSA9IDE7Ci0gICAgICAgIGlmIChsaWJ4bF9fd2FpdF9mb3JfZGV2aWNlX21vZGVsX2RlcHJlY2F0
ZWQoZ2MsIGRvbWlkLCAicnVubmluZyIsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIE5VTEwsIE5VTEwsIE5VTEwpIDwgMCkgewotICAgICAgICAgICAgcmMgPSBFUlJP
Ul9GQUlMOwotICAgICAgICAgICAgZ290byBvdXQ7Ci0gICAgICAgIH0KICAgICAgICAgc3dpdGNo
IChsaWJ4bF9fZGV2aWNlX21vZGVsX3ZlcnNpb25fcnVubmluZyhnYywgZG9taWQpKSB7CiAgICAg
ICAgICAgICBjYXNlIExJQlhMX0RFVklDRV9NT0RFTF9WRVJTSU9OX1FFTVVfWEVOX1RSQURJVElP
TkFMOgorICAgICAgICAgICAgICAgIGlmIChsaWJ4bF9fd2FpdF9mb3JfZGV2aWNlX21vZGVsX2Rl
cHJlY2F0ZWQoZ2MsIGRvbWlkLAorICAgICAgICAgICAgICAgICAgICAgICAgInJ1bm5pbmciLCBO
VUxMLCBOVUxMLCBOVUxMKSA8IDApIHsKKyAgICAgICAgICAgICAgICAgICAgcmMgPSBFUlJPUl9G
QUlMOworICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKKyAgICAgICAgICAgICAgICB9CiAg
ICAgICAgICAgICAgICAgcmMgPSBxZW11X3BjaV9hZGRfeGVuc3RvcmUoZ2MsIGRvbWlkLCBwY2lk
ZXYpOwogICAgICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICAgICAgY2FzZSBMSUJYTF9ERVZJ
Q0VfTU9ERUxfVkVSU0lPTl9RRU1VX1hFTjoKQEAgLTEzOTUsMTIgKzEzOTUsMTEgQEAgc3RhdGlj
IGludCBkb19wY2lfcmVtb3ZlKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkLAogICAgIHJj
ID0gRVJST1JfRkFJTDsKICAgICBpZiAodHlwZSA9PSBMSUJYTF9ET01BSU5fVFlQRV9IVk0pIHsK
ICAgICAgICAgaHZtID0gMTsKLSAgICAgICAgaWYgKGxpYnhsX193YWl0X2Zvcl9kZXZpY2VfbW9k
ZWxfZGVwcmVjYXRlZChnYywgZG9taWQsICJydW5uaW5nIiwKLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgTlVMTCwgTlVMTCwgTlVMTCkgPCAwKQotICAgICAgICAgICAg
Z290byBvdXRfZmFpbDsKLQogICAgICAgICBzd2l0Y2ggKGxpYnhsX19kZXZpY2VfbW9kZWxfdmVy
c2lvbl9ydW5uaW5nKGdjLCBkb21pZCkpIHsKICAgICAgICAgY2FzZSBMSUJYTF9ERVZJQ0VfTU9E
RUxfVkVSU0lPTl9RRU1VX1hFTl9UUkFESVRJT05BTDoKKyAgICAgICAgICAgIGlmIChsaWJ4bF9f
d2FpdF9mb3JfZGV2aWNlX21vZGVsX2RlcHJlY2F0ZWQoZ2MsIGRvbWlkLAorICAgICAgICAgICAg
ICAgICAgICAicnVubmluZyIsIE5VTEwsIE5VTEwsIE5VTEwpIDwgMCkKKyAgICAgICAgICAgICAg
ICBnb3RvIG91dF9mYWlsOwogICAgICAgICAgICAgcmMgPSBxZW11X3BjaV9yZW1vdmVfeGVuc3Rv
cmUoZ2MsIGRvbWlkLCBwY2lkZXYsIGZvcmNlKTsKICAgICAgICAgICAgIGJyZWFrOwogICAgICAg
ICBjYXNlIExJQlhMX0RFVklDRV9NT0RFTF9WRVJTSU9OX1FFTVVfWEVOOgotLSAKQW50aG9ueSBQ
RVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
