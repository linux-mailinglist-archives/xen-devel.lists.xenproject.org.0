Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0FACBEF4
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 17:19:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGPKb-0001QN-Nh; Fri, 04 Oct 2019 15:17:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lQ+Z=X5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iGPKZ-0001Pd-RD
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 15:17:19 +0000
X-Inumbo-ID: 0ba540d2-e6ba-11e9-975c-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ba540d2-e6ba-11e9-975c-12813bfff9fa;
 Fri, 04 Oct 2019 15:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570202235;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=ejtxueo//d1vv4O4jSC/uAB6+fKy3X+6YBFUa2DC4tk=;
 b=BoayMenFok4e/E0kr/NMDq/zuClNQI/vdXnRpFlWc//kEXl68vvjagY7
 D+Z+yw4WH0RM8rbeL4P/CQOxlz4kHQGwJxkPD9DZ0IvcmNmCZDxIis+l4
 bNubbdsLlMTnKcJGPQpBpLcUWMMlT+0pTof/Ub6f7YQUPzy+uSvaybKWR w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0Q45YtNN4Xto5qfZ+zEEvdHEYwXNaKSf0tuUj1nWS18miJ4ILP/ZTEslZTHc//NRJEG/FTxKjw
 Mus4fWMpytgakHdrH1pyM+spBhUFybQWx5vubv+KyJdEnCMRdU1mTHdPCWm+MyX3r1zykoN+SM
 tJiyaQBB7oagNw+z40nZEmu1hFvbDwPXvldauh116SuHnAtSxCriq27eSSwye1+7wAN8HmQuCl
 eF5FIugxGV02AyHfT1VdWAAv6zPUKW7zrNEhIPMD+Eo/Q0MFePSY4q99PpPYXuhsnak5vHNByk
 q50=
X-SBRS: 2.7
X-MesageID: 6846604
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,256,1566878400"; 
   d="scan'208";a="6846604"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 4 Oct 2019 16:17:06 +0100
Message-ID: <20191004151707.24844-6-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191004151707.24844-1-ian.jackson@eu.citrix.com>
References: <20191004151707.24844-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 5/6] libxl: Move shadow_memkb and
 iommu_memkb defaulting into libxl
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
 =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGVmYXVsdGluZyBpcyBzdXBwb3NlZCB0byBiZSBkb25lIGJ5IGxpYnhsLiAgU28gdGhlc2UgY2Fs
Y3VsYXRpb25zCnNob3VsZCBiZSBoZXJlIGluIGxpYnhsLiAgbGlieGxfX2RvbWFpbl9jb25maWdf
c2V0ZGVmYXVsdCBoYXMgYWxsIHRoZQpuZWNlc3NhcnkgaW5mb3JtYXRpb24gaW5jbHVkaW5nIHRo
ZSB2YWx1ZXMgb2YgbWF4X21lbWtiIGFuZCBtYXhfdmNwdXMuCgpUaGUgb3ZlcmFsbCBmdW5jdGlv
bmFsIGVmZmVjdCBkZXBlbmRzIG9uIHRoZSBjYWxsZXI6CgpGb3IgeGwsIG5vIGNoYW5nZS4gIFRo
ZSBjb2RlIG1vdmVzIGZyb20geGwgdG8gbGlieGwuCgpGb3IgY2FsbGVycyB3aG8gc2V0IG9uZSBv
ciBib3RoIHNoYWRvd19tZW1rYiBhbmQgaW9tbXVfbWVta2IgKHdoZXRoZXIKZnJvbSBsaWJ4bF9n
ZXRfcmVxdWlyZWRfc2hhZG93X21lbW9yeSBvciBvdGhlcndpc2UpIGJlZm9yZSBjYWxsaW5nCmxp
YnhsX2RvbWFpbl9uZWVkX21lbW9yeSAoYW55IHZlcnNpb24pOiB0aGUgbmV3IGNvZGUgd2lsbCBs
ZWF2ZSB0aGVpcgpzZXR0aW5nKHMpIHVuY2hhbmdlZC4KCkZvciBjYWxsZXJzIHdobyBkbyBub3Qg
Y2FsbCBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnkgYXQgYWxsLCBhbmQgd2hvCmZhaWwgdG8gc2V0
IG9uZSBvZiB0aGVzZSBtZW1vcnkgdmFsdWVzOiBub3cgdGhleSBhcmUgYm90aCBhcmUgcHJvcGVy
bHkKc2V0LiAgVGhlIHNoYWRvdyBhbmQgaW9tbXUgbWVtb3J5IHRvIGJlIHByb3Blcmx5IGFjY291
bnRlZCBmb3IgYXMKaW50ZW5kZWQuCgpGb3IgY2FsbGVycyB3aGljaCBjYWxsIGxpYnhsX2RvbWFp
bl9uZWVkX21lbW9yeSBhbmQgcmVxdWVzdCB0aGUKY3VycmVudCBBUEkgKDQuMTMpIG9yIHdoaWNo
IHRyYWNrIGxpYnhsLCB0aGUgZGVmYXVsdCB2YWx1ZXMgYXJlIGFsc28Kbm93IHJpZ2h0IGFuZCBl
dmVyeXRoaW5nIHdvcmtzIGFzIGludGVuZGVkLgoKRm9yIGNhbGxlcnMgd2hpY2ggY2FsbCBsaWJ4
bF9kb21haW5fbmVlZF9tZW1vcnksIGFuZCByZXF1ZXN0IGFuIG9sZApwcmUtNC4xMyBsaWJ4bCBB
UEksIGFuZCB3aGljaCBsZWF2ZSBvbmUgb2YgdGhlc2UgbWVta2Igc2V0dGluZ3MgdW5zZXQsCndl
IHRha2Ugc3BlY2lhbCBtZWFzdXJlcyB0byBwcmVzZXJ2ZSB0aGUgb2xkIGJlaGF2aW91ci4KClRo
aXMgbWVhbnMgdGhhdCB0aGV5IGRvbid0IGdldCB0aGUgYWRkaXRpb25hbCBpb21tdSBtZW1vcnkg
YW5kIGFyZSBhdApyaXNrIG9mIHRoZSBkb21haW4gcnVubmluZyBvdXQgb2YgbWVtb3J5IGFzIGEg
cmVzdWx0IG9mIGY4OWY1NTU4MjdhNgoicmVtb3ZlIGxhdGUgKG9uLWRlbWFuZCkgY29uc3RydWN0
aW9uIG9mIElPTU1VIHBhZ2UgdGFibGVzIi4gIEJ1dCB0aGlzCmlzIG5vIHdvcnNlIHRoYW4gdGhl
IHN0YXRlIGp1c3QgYWZ0ZXIgZjg5ZjU1NTgyN2E2LCB3aGljaCBhbHJlYWR5CmJyb2tlIHN1Y2gg
Y2FsbGVycyBpbiB0aGF0IHdheS4gIFRoaXMgaXMgcGVyaGFwcyBqdXN0aWZpYWJsZSBiZWNhdXNl
Cm9mIHRoZSBBUEkgc3RhYmlsaXR5IHdhcm5pbmcgbmV4dCB0byBsaWJ4bF9kb21haW5fbmVlZF9t
ZW1vcnkuCgpBbiBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byBkcm9wIHRoZSBzcGVjaWFsLWNhc2lu
ZyBvZiB0aGVzZSBjYWxsZXJzLgpUaGF0IHdvdWxkIGNhdXNlIGEgZGlzY3JlcGFuY3kgYmV0d2Vl
biBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnkgYW5kCmxpYnhsX2RvbWFpbl9jcmVhdGU6IHRoZSBm
b3JtZXIgd291bGQgbm90IGluY2x1ZGUgdGhlIGlvbW11IG1lbW9yeSBhbmQKdGhlIGxhdHRlciB3
b3VsZC4gIFRoYXQgc2VlbXMgd29yc2UsIGJ1dCBpdCdzIGRlYmF0ZWFibGUuCgpTaWduZWQtb2Zm
LWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0b29scy9s
aWJ4bC9saWJ4bF9jcmVhdGUuYyAgIHwgNDAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCB8ICAzICsrKwogdG9vbHMv
bGlieGwvbGlieGxfbWVtLmMgICAgICB8ICA0ICsrKysKIHRvb2xzL3hsL3hsX3BhcnNlLmMgICAg
ICAgICAgfCAxNSArKy0tLS0tLS0tLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgNDkgaW5zZXJ0aW9u
cygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfY3Jl
YXRlLmMgYi90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwppbmRleCA0NTdiZWI2NDYyLi4zYzUw
MzNiMDViIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYworKysgYi90b29s
cy9saWJ4bC9saWJ4bF9jcmVhdGUuYwpAQCAtMjUwLDYgKzI1MCw3IEBAIGludCBsaWJ4bF9fZG9t
YWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdChsaWJ4bF9fZ2MgKmdjLAogICAgIHN3aXRjaCAoYl9p
bmZvLT50eXBlKSB7CiAgICAgY2FzZSBMSUJYTF9ET01BSU5fVFlQRV9IVk06CiAgICAgICAgIGlm
IChiX2luZm8tPnNoYWRvd19tZW1rYiA9PSBMSUJYTF9NRU1LQl9ERUZBVUxUKQorICAgICAgICAg
ICAgLyogTm9ybWFsbHkgZGVmYXVsdGVkIGluIGxpYnhsX19kb21haW5fY3JlYXRlX2luZm9fc2V0
ZGVmYXVsdCAqLwogICAgICAgICAgICAgYl9pbmZvLT5zaGFkb3dfbWVta2IgPSAwOwogICAgICAg
ICBpZiAoYl9pbmZvLT51Lmh2bS5tbWlvX2hvbGVfbWVta2IgPT0gTElCWExfTUVNS0JfREVGQVVM
VCkKICAgICAgICAgICAgIGJfaW5mby0+dS5odm0ubW1pb19ob2xlX21lbWtiID0gMDsKQEAgLTM5
NSw2ICszOTYsNyBAQCBpbnQgbGlieGxfX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQobGli
eGxfX2djICpnYywKICAgICAgICAgaWYgKGJfaW5mby0+dmlkZW9fbWVta2IgPT0gTElCWExfTUVN
S0JfREVGQVVMVCkKICAgICAgICAgICAgIGJfaW5mby0+dmlkZW9fbWVta2IgPSAwOwogICAgICAg
ICBpZiAoYl9pbmZvLT5zaGFkb3dfbWVta2IgPT0gTElCWExfTUVNS0JfREVGQVVMVCkKKyAgICAg
ICAgICAgIC8qIE5vcm1hbGx5IGRlZmF1bHRlZCBpbiBsaWJ4bF9fZG9tYWluX2NyZWF0ZV9pbmZv
X3NldGRlZmF1bHQgKi8KICAgICAgICAgICAgIGJfaW5mby0+c2hhZG93X21lbWtiID0gMDsKICAg
ICAgICAgaWYgKGJfaW5mby0+dS5wdi5zbGFja19tZW1rYiA9PSBMSUJYTF9NRU1LQl9ERUZBVUxU
KQogICAgICAgICAgICAgYl9pbmZvLT51LnB2LnNsYWNrX21lbWtiID0gMDsKQEAgLTg2Miw2ICs4
NjQsMzAgQEAgc3RhdGljIHZvaWQgZG9tY3JlYXRlX2Rlc3RydWN0aW9uX2NiKGxpYnhsX19lZ2Mg
KmVnYywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9fZG9tYWlu
X2Rlc3Ryb3lfc3RhdGUgKmRkcywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBpbnQgcmMpOwogCitzdGF0aWMgX0Jvb2wgb2tfdG9fZGVmYXVsdF9tZW1rYl9pbl9jcmVhdGUo
bGlieGxfX2djICpnYykKK3sKKyAgICAvKgorICAgICAqIFRoaXMgaXMgYSBmdWRnZS4gIFdlIGFy
ZSB0cnlpbmcgdG8gZmluZCB3aGV0aGVyIHRoZSBjYWxsZXIKKyAgICAgKiBjYWxscyB0aGUgb2xk
IHZlcnNpb24gb2YgbGlieGxfZG9tYWluX25lZWRfbWVtb3J5LiAgSWYgdGhleSBkbworICAgICAq
IHRoZW4sIGJlY2F1c2UgaXQgb25seSBnZXRzIHRoZSBiX2luZm8sIGFuZCBiZWNhdXNlIGl0IGNh
bid0CisgICAgICogdXBkYXRlIHRoZSBiX2luZm8gKGJlY2F1c2UgaXQncyBjb25zdCksIGl0IHdp
bGwgYmFzZSBpdHMKKyAgICAgKiBjYWxjdWxhdGlvbnMgb24gZGVmYXVsdGluZyBzaGFkb3dfbWVt
a2IgYW5kIGlvbW11X21lbWtiIHRvIDAKKyAgICAgKiBJbiB0aGF0IGNhc2Ugd2UgcHJvYmFibHkg
c2hvdWxkbid0IGRlZmF1bHQgdGhlbSBkaWZmZXJlbnRseQorICAgICAqIGR1cmluZyBsaWJ4bF9k
b21haW5fY3JlYXRlLgorICAgICAqCisgICAgICogVGhlIHJlc3VsdCBpcyB0aGF0IHRoZSBiZWhh
dmlvdXIgd2l0aCBvbGQgY2FsbGVycyBpcyB0aGUgc2FtZQorICAgICAqIGFzIGluIDQuMTM6IG5v
IGFkZGl0aW9uYWwgbWVtb3J5IGlzIGFsbG9jYXRlZCBmb3Igc2hhZG93IGFuZAorICAgICAqIGlv
bW11ICh1bmxlc3MgdGhlIGNhbGxlciBzZXQgc2hhZG93X21lbWtiLCBlZyBmcm9tIGEgY2FsbCB0
bworICAgICAqIGxpYnhsX2dldF9yZXF1aXJlZF9zaGFkb3dfbWVtb3J5KS4KKyAgICAgKi8KKyAg
ICByZXR1cm4gQ1RYLT5saWJ4bF9kb21haW5fbmVlZF9tZW1vcnlfMHgwNDEyMDBfY2FsbGVkICYm
CisgICAgICAgICAgIUNUWC0+bGlieGxfZG9tYWluX25lZWRfbWVtb3J5X2NhbGxlZDsKKyAgICAv
KgorICAgICAqIFRyZWF0IG1peGVkIGNhbGxlcnMgYXMgbmV3IGNhbGxlcnMuICBQcmVzdW1hYmx5
IHRoZXkga25vdyB3aGF0CisgICAgICogdGhleSBhcmUgZG9pbmcuCisgICAgICovCit9CisKIGlu
dCBsaWJ4bF9fZG9tYWluX2NvbmZpZ19zZXRkZWZhdWx0KGxpYnhsX19nYyAqZ2MsCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9kb21haW5fY29uZmlnICpkX2NvbmZp
ZywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGRvbWlkKQpA
QCAtOTc0LDYgKzEwMDAsMjAgQEAgaW50IGxpYnhsX19kb21haW5fY29uZmlnX3NldGRlZmF1bHQo
bGlieGxfX2djICpnYywKICAgICAgICAgZ290byBlcnJvcl9vdXQ7CiAgICAgfQogCisgICAgaWYg
KGRfY29uZmlnLT5iX2luZm8uc2hhZG93X21lbWtiID09IExJQlhMX01FTUtCX0RFRkFVTFQKKyAg
ICAgICAgJiYgb2tfdG9fZGVmYXVsdF9tZW1rYl9pbl9jcmVhdGUoZ2MpKQorICAgICAgICBkX2Nv
bmZpZy0+Yl9pbmZvLnNoYWRvd19tZW1rYiA9CisgICAgICAgICAgICBsaWJ4bF9nZXRfcmVxdWly
ZWRfc2hhZG93X21lbW9yeShkX2NvbmZpZy0+Yl9pbmZvLm1heF9tZW1rYiwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRfY29uZmlnLT5iX2luZm8ubWF4X3Zj
cHVzKTsKKworICAgIC8qIE5vIElPTU1VIHJlc2VydmF0aW9uIGlzIG5lZWRlZCBpZiBwYXNzdGhy
b3VnaCBtb2RlIGlzIG5vdCAnc3luY19wdCcgKi8KKyAgICBpZiAoZF9jb25maWctPmJfaW5mby5p
b21tdV9tZW1rYiA9PSBMSUJYTF9NRU1LQl9ERUZBVUxUCisgICAgICAgICYmIG9rX3RvX2RlZmF1
bHRfbWVta2JfaW5fY3JlYXRlKGdjKSkKKyAgICAgICAgZF9jb25maWctPmJfaW5mby5pb21tdV9t
ZW1rYiA9CisgICAgICAgICAgICAoZF9jb25maWctPmNfaW5mby5wYXNzdGhyb3VnaCA9PSBMSUJY
TF9QQVNTVEhST1VHSF9TWU5DX1BUKQorICAgICAgICAgICAgPyBsaWJ4bF9nZXRfcmVxdWlyZWRf
aW9tbXVfbWVtb3J5KGRfY29uZmlnLT5iX2luZm8ubWF4X21lbWtiKQorICAgICAgICAgICAgOiAw
OworCiAgICAgcmV0ID0gbGlieGxfX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQoZ2MsICZk
X2NvbmZpZy0+Yl9pbmZvKTsKICAgICBpZiAocmV0KSB7CiAgICAgICAgIExPR0QoRVJST1IsIGRv
bWlkLCAiVW5hYmxlIHRvIHNldCBkb21haW4gYnVpbGQgaW5mbyBkZWZhdWx0cyIpOwpkaWZmIC0t
Z2l0IGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCBiL3Rvb2xzL2xpYnhsL2xpYnhsX2lu
dGVybmFsLmgKaW5kZXggMDFkZTU1NzZkOS4uM2UzMDZhZDRmNiAxMDA2NDQKLS0tIGEvdG9vbHMv
bGlieGwvbGlieGxfaW50ZXJuYWwuaAorKysgYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5o
CkBAIC02MzcsNiArNjM3LDkgQEAgc3RydWN0IGxpYnhsX19jdHggewogICAgIExJQlhMX0xJU1Rf
RU5UUlkobGlieGxfY3R4KSBzaWdjaGxkX3VzZXJzX2VudHJ5OwogCiAgICAgbGlieGxfdmVyc2lv
bl9pbmZvIHZlcnNpb25faW5mbzsKKworICAgIF9Cb29sIGxpYnhsX2RvbWFpbl9uZWVkX21lbW9y
eV8weDA0MTIwMF9jYWxsZWQsCisgICAgICAgICAgbGlieGxfZG9tYWluX25lZWRfbWVtb3J5X2Nh
bGxlZDsKIH07CiAKIC8qCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9tZW0uYyBiL3Rv
b2xzL2xpYnhsL2xpYnhsX21lbS5jCmluZGV4IDI2Y2YxMzZhYzIuLjA1Mzc4NDZlZTIgMTAwNjQ0
Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX21lbS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX21l
bS5jCkBAIC00ODUsNiArNDg1LDggQEAgaW50IGxpYnhsX2RvbWFpbl9uZWVkX21lbW9yeShsaWJ4
bF9jdHggKmN0eCwKICAgICBHQ19JTklUKGN0eCk7CiAgICAgaW50IHJjOwogCisgICAgY3R4LT5s
aWJ4bF9kb21haW5fbmVlZF9tZW1vcnlfY2FsbGVkID0gMTsKKwogICAgIHJjID0gbGlieGxfX2Rv
bWFpbl9jb25maWdfc2V0ZGVmYXVsdChnYywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZF9jb25maWcsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGRvbWlkX2Zvcl9sb2dnaW5nKTsKQEAgLTUwOCw2ICs1MTAsOCBAQCBpbnQgbGlieGxf
ZG9tYWluX25lZWRfbWVtb3J5XzB4MDQxMjAwKGxpYnhsX2N0eCAqY3R4LAogICAgIEdDX0lOSVQo
Y3R4KTsKICAgICBpbnQgcmM7CiAKKyAgICBjdHgtPmxpYnhsX2RvbWFpbl9uZWVkX21lbW9yeV8w
eDA0MTIwMF9jYWxsZWQgPSAxOworCiAgICAgbGlieGxfZG9tYWluX2J1aWxkX2luZm8gYl9pbmZv
WzFdOwogICAgIGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvX2luaXQoYl9pbmZvKTsKICAgICBsaWJ4
bF9kb21haW5fYnVpbGRfaW5mb19jb3B5KGN0eCwgYl9pbmZvLCBiX2luZm9faW4pOwpkaWZmIC0t
Z2l0IGEvdG9vbHMveGwveGxfcGFyc2UuYyBiL3Rvb2xzL3hsL3hsX3BhcnNlLmMKaW5kZXggMDNh
MmM1NGRkMi4uNzk4NzFjMjJkMCAxMDA2NDQKLS0tIGEvdG9vbHMveGwveGxfcGFyc2UuYworKysg
Yi90b29scy94bC94bF9wYXJzZS5jCkBAIC0xNTcyLDE5ICsxNTcyLDggQEAgdm9pZCBwYXJzZV9j
b25maWdfZGF0YShjb25zdCBjaGFyICpjb25maWdfc291cmNlLAogICAgICAgICBleGl0KC1FUlJP
Ul9GQUlMKTsKICAgICB9CiAKLSAgICAvKiBsaWJ4bF9nZXRfcmVxdWlyZWRfc2hhZG93X21lbW9y
eSgpIGFuZAotICAgICAqIGxpYnhsX2dldF9yZXF1aXJlZF9pb21tdV9tZW1vcnkoKSBtdXN0IGJl
IGNhbGxlZCBhZnRlciBmaW5hbCB2YWx1ZXMKLSAgICAgKiAoZGVmYXVsdCBvciBzcGVjaWZpZWQp
IGZvciB2Y3B1cyBhbmQgbWVtb3J5IGFyZSBzZXQsIGJlY2F1c2UgdGhlCi0gICAgICogY2FsY3Vs
YXRpb25zIGRlcGVuZCBvbiB0aG9zZSB2YWx1ZXMuICovCi0gICAgYl9pbmZvLT5zaGFkb3dfbWVt
a2IgPSAheGx1X2NmZ19nZXRfbG9uZyhjb25maWcsICJzaGFkb3dfbWVtb3J5IiwgJmwsIDApCi0g
ICAgICAgID8gbCAqIDEwMjQKLSAgICAgICAgOiBsaWJ4bF9nZXRfcmVxdWlyZWRfc2hhZG93X21l
bW9yeShiX2luZm8tPm1heF9tZW1rYiwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBiX2luZm8tPm1heF92Y3B1cyk7Ci0KLSAgICAvKiBObyBJT01NVSByZXNlcnZh
dGlvbiBpcyBuZWVkZWQgaWYgcGFzc3Rocm91Z2ggbW9kZSBpcyBub3QgJ3N5bmNfcHQnICovCi0g
ICAgYl9pbmZvLT5pb21tdV9tZW1rYiA9IChjX2luZm8tPnBhc3N0aHJvdWdoID09IExJQlhMX1BB
U1NUSFJPVUdIX1NZTkNfUFQpCi0gICAgICAgID8gbGlieGxfZ2V0X3JlcXVpcmVkX2lvbW11X21l
bW9yeShiX2luZm8tPm1heF9tZW1rYikKLSAgICAgICAgOiAwOworICAgIGlmICgheGx1X2NmZ19n
ZXRfbG9uZyhjb25maWcsICJzaGFkb3dfbWVtb3J5IiwgJmwsIDApKQorICAgICAgICBiX2luZm8t
PnNoYWRvd19tZW1rYiA9IGwgKiAxMDI0OwogCiAgICAgeGx1X2NmZ19nZXRfZGVmYm9vbChjb25m
aWcsICJub21pZ3JhdGUiLCAmYl9pbmZvLT5kaXNhYmxlX21pZ3JhdGUsIDApOwogCi0tIAoyLjEx
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
