Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BFA5D478
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 18:41:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiLnt-0001ig-Qh; Tue, 02 Jul 2019 16:38:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A/Ug=U7=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hiLnr-0001iH-UO
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 16:38:47 +0000
X-Inumbo-ID: dc2bda94-9ce7-11e9-83a6-5349a050a6a1
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc2bda94-9ce7-11e9-83a6-5349a050a6a1;
 Tue, 02 Jul 2019 16:38:46 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1HVVlpBeEyqFY8ue3C4/YfjNRVbEb+HZuPKDv/1luvh/ZkjLiWOFyH5ggji4vddcvDj0msDkW3
 7/QbVmFO/gyX6b/o/QkytEcYlSztTizZ4hZHsEC7JY9/cFVNNPhiJ+K9zuJKXL8E2HceVYefgY
 9JQu06DMojCgLWNNOVYwfwNnkLa0nrFGWEuztZD50UWoQ+EvmZ9rWFa83pD4kLP7WHRFDYFB7v
 2spnYLX9nUL6dmRhP/5a9hcVWrrFWZI/X+RbqZSl6fpISdhgv2SH/9WV1Ph1sj3/QhhorMPN4y
 NIU=
X-SBRS: 2.7
X-MesageID: 2501599
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,443,1557201600"; 
   d="scan'208";a="2501599"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 2 Jul 2019 17:38:39 +0100
Message-ID: <20190702163840.2107-3-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20190702163840.2107-1-paul.durrant@citrix.com>
References: <20190702163840.2107-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/3] xmalloc: don't evaluate ADD_REGION without
 holding the pool lock
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQncyBub3Qgc2FmZSB0byBhZGQgYSByZWdpb24gd2l0aG91dCBob2xkaW5nIHRoZSBsb2NrLCBi
dXQgdGhpcyBpcwpleGFjdGx5IHdoYXQgbWF5IGhhcHBlbiBpZiB0d28gdGhyZWFkcyByYWNlIGVu
dGVyaW5nIHhtZW1fcG9vbF9hbGxvYygpCmJlZm9yZSB0aGUgaW5pdF9yZWdpb24gaXMgc2V0LgoK
VGhpcyBwYXRjaCBpbnN0ZWFkIGNoZWNrcyBmb3IgaW5pdF9yZWdpb24gdW5kZXIgbG9jaywgZHJv
cHMgdGhlIGxvY2sgaWYgaXQKbmVlZHMgdG8gYWxsb2NhdGUgYSBwYWdlLCB0YWtlcyB0aGUgbG9j
aywgYWRkcyB0aGUgcmVnaW9uIGFuZCB0aGVuIGNvbmZpcm1zCmluaXRfcmVnaW9uIGlzIHN0aWxs
IHVuc2V0IGJlZm9yZSBwb2ludGluZyBpdCBhdCB0aGUgbmV3bHkgYWRkZWQgcmVnaW9uLgpUaHVz
LCBpdCBpcyBwb3NzaWJsZSB0aGF0IGEgcmFjZSBtYXkgY2F1c2UgYW4gZXh0cmEgcmVnaW9uIHRv
IGJlIGFkZGVkLApidXQgdGhlcmUgd2lsbCBiZSBubyBwb29sIG1ldGFkYXRhIGNvcnJ1cHRpb24u
CgpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgot
LS0KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBHZW9y
Z2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8
aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CkNjOiBLb25yYWQg
Unplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9y
Zz4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Ci0tLQogeGVuL2NvbW1vbi94bWFsbG9jX3Rsc2Yu
YyB8IDggKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi94bWFsbG9jX3Rsc2YuYyBiL3hlbi9jb21t
b24veG1hbGxvY190bHNmLmMKaW5kZXggNmQ4ODliN2JkYy4uNzE1OTdjMzU5MCAxMDA2NDQKLS0t
IGEveGVuL2NvbW1vbi94bWFsbG9jX3Rsc2YuYworKysgYi94ZW4vY29tbW9uL3htYWxsb2NfdGxz
Zi5jCkBAIC0zODAsMTggKzM4MCwyMiBAQCB2b2lkICp4bWVtX3Bvb2xfYWxsb2ModW5zaWduZWQg
bG9uZyBzaXplLCBzdHJ1Y3QgeG1lbV9wb29sICpwb29sKQogICAgIGludCBmbCwgc2w7CiAgICAg
dW5zaWduZWQgbG9uZyB0bXBfc2l6ZTsKIAorICAgIHNwaW5fbG9jaygmcG9vbC0+bG9jayk7CiAg
ICAgaWYgKCBwb29sLT5pbml0X3JlZ2lvbiA9PSBOVUxMICkKICAgICB7CisgICAgICAgIHNwaW5f
dW5sb2NrKCZwb29sLT5sb2NrKTsKICAgICAgICAgaWYgKCAocmVnaW9uID0gcG9vbC0+Z2V0X21l
bShwb29sLT5pbml0X3NpemUpKSA9PSBOVUxMICkKICAgICAgICAgICAgIGdvdG8gb3V0OworICAg
ICAgICBzcGluX2xvY2soJnBvb2wtPmxvY2spOwogICAgICAgICBBRERfUkVHSU9OKHJlZ2lvbiwg
cG9vbC0+aW5pdF9zaXplLCBwb29sKTsKLSAgICAgICAgcG9vbC0+aW5pdF9yZWdpb24gPSByZWdp
b247CisgICAgICAgIC8qIFJlLWNoZWNrIHNpbmNlIHRoZSBsb2NrIHdhcyBkcm9wcGVkICovCisg
ICAgICAgIGlmICggcG9vbC0+aW5pdF9yZWdpb24gPT0gTlVMTCApCisgICAgICAgICAgICBwb29s
LT5pbml0X3JlZ2lvbiA9IHJlZ2lvbjsKICAgICB9CiAKICAgICBzaXplID0gKHNpemUgPCBNSU5f
QkxPQ0tfU0laRSkgPyBNSU5fQkxPQ0tfU0laRSA6IFJPVU5EVVBfU0laRShzaXplKTsKICAgICAv
KiBSb3VuZGluZyB1cCB0aGUgcmVxdWVzdGVkIHNpemUgYW5kIGNhbGN1bGF0aW5nIGZsIGFuZCBz
bCAqLwogCi0gICAgc3Bpbl9sb2NrKCZwb29sLT5sb2NrKTsKICByZXRyeV9maW5kOgogICAgIE1B
UFBJTkdfU0VBUkNIKCZzaXplLCAmZmwsICZzbCk7CiAKLS0gCjIuMjAuMS4yLmdiMjFlYmI2NzEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
