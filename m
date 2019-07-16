Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBAA6ACA4
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 18:28:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnQFU-00017g-Lj; Tue, 16 Jul 2019 16:24:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WCCO=VN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hnQFT-00017b-Q4
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 16:24:15 +0000
X-Inumbo-ID: 265a3de2-a7e6-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 265a3de2-a7e6-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 16:24:14 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kKI1dKnECExF3SzwBlPdlrWFpAqX4cZ9JTYO+SVN4akUy2Fn5qFTY7WE10vgYbvUfQMXVuuMLB
 1emP/XD51lBrMKDR41JbGVfy975zjv1tC9ocN9pQ957hCt5BFwhpDsSNjX4flx7SpqRI4jmiTu
 0sFYd3tRFwPVlIdSCgicVH4drTyWP+ScFA5iOicQM3alHw9Qf1IYfFVlnBrTzzzxrjIC6n7pHN
 6w6SAL6RSk8HRtbOK/clIpgjFp4ribqaFAbVVezIaTLeIo/W0Pg+N/jCs5nWN9s9fiHr/nq4ir
 V/E=
X-SBRS: 2.7
X-MesageID: 3119422
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,498,1557201600"; 
   d="scan'208";a="3119422"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 16 Jul 2019 17:23:55 +0100
Message-ID: <20190716162355.1321-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3] passthrough/vtd: Don't DMA to the stack in
 queue_invalidate_wait()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RE1BLWluZyB0byB0aGUgc3RhY2sgaXMgY29uc2lkZXJlZCBiYWQgcHJhY3RpY2UuICBJbiB0aGlz
IGNhc2UsIGlmIGEKdGltZW91dCBvY2N1cnMgYmVjYXVzZSBvZiBhIHNsdWdnaXNoIGRldmljZSB3
aGljaCBpcyBwcm9jZXNzaW5nIHRoZQpyZXF1ZXN0LCB0aGUgY29tcGxldGlvbiBub3RpZmljYXRp
b24gd2lsbCBjb3JydXB0IHRoZSBzdGFjayBvZiBhCnN1YnNlcXVlbnQgZGVlcGVyIGNhbGwgdHJl
ZS4KClBsYWNlIHRoZSBwb2xsX3Nsb3QgaW4gYSBwZXJjcHUgYXJlYSBhbmQgRE1BIHRvIHRoYXQg
aW5zdGVhZC4KCkZpeCB0aGUgZGVjbGFyYXRpb24gb2Ygc2FkZHIgaW4gc3RydWN0IHFpbnZhbF9l
bnRyeSwgdG8gYXZvaWQgYSBzaGlmdCBieQp0d28uICBUaGUgcmVxdWlyZW1lbnQgaGVyZSBpcyB0
aGF0IHRoZSBETUEgYWRkcmVzcyBpcyBkd29yZCBhbGlnbmVkLAp3aGljaCBpcyBjb3ZlcmVkIGJ5
IHBvbGxfc2xvdCdzIHR5cGUuCgpUaGlzIGNoYW5nZSBkb2VzIG5vdCBhZGRyZXNzIG90aGVyIGlz
c3Vlcy4gIENvcnJlbGF0aW5nIGNvbXBsZXRpb25zCmFmdGVyIGEgdGltZW91dCB3aXRoIHRoZWly
IHJlcXVlc3QgaXMgYSBtb3JlIGNvbXBsaWNhdGVkIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxp
Y2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5j
b20+CgpJdCB0dXJucyBvdXQgdGhhdCB0aGlzIGhhcyBiZWVuIHBlbmRpbmcgc2luY2UgNC4xMCwg
YW5kIGdyb3NzbHkgbGF0ZS4KCnYzOgogKiBGaXggc2FkZHIgZGVjbGFyaW9uIHRvIGRyb3AgYSBz
aGlmdC1ieS10d28uCiAqIERyb3Agdm9sYXRpbGUgYXR0cmlidXRlLiAgVXNlIEFDQ0VTU19PTkNF
KCkgaW5zdGVhZC4KLS0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuaCAgfCAz
ICstLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL3FpbnZhbC5jIHwgOSArKysrKy0tLS0K
IDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5oIGIveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvdnRkL2lvbW11LmgKaW5kZXggMWE5OTJmNzJkNi4uYzkyOTBhMzk5NiAxMDA2
NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmgKKysrIGIveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmgKQEAgLTQ0NCw4ICs0NDQsNyBAQCBzdHJ1Y3Qg
cWludmFsX2VudHJ5IHsKICAgICAgICAgICAgICAgICAgICAgc2RhdGEgICA6IDMyOwogICAgICAg
ICAgICAgfWxvOwogICAgICAgICAgICAgc3RydWN0IHsKLSAgICAgICAgICAgICAgICB1NjQgcmVz
XzEgICA6IDIsCi0gICAgICAgICAgICAgICAgICAgIHNhZGRyICAgOiA2MjsKKyAgICAgICAgICAg
ICAgICB1NjQgc2FkZHI7CiAgICAgICAgICAgICB9aGk7CiAgICAgICAgIH1pbnZfd2FpdF9kc2M7
CiAgICAgfXE7CmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvcWludmFs
LmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvcWludmFsLmMKaW5kZXggMDE0NDdjZjlh
OC4uMDljYmQzNmViYiAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL3Fp
bnZhbC5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9xaW52YWwuYwpAQCAtMTQ3
LDEzICsxNDcsMTUgQEAgc3RhdGljIGludCBfX211c3RfY2hlY2sgcXVldWVfaW52YWxpZGF0ZV93
YWl0KHN0cnVjdCBpb21tdSAqaW9tbXUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdTggaWZsYWcsIHU4IHN3LCB1OCBmbiwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sX3QgZmx1c2hfZGV2X2lvdGxiKQogewot
ICAgIHZvbGF0aWxlIHUzMiBwb2xsX3Nsb3QgPSBRSU5WQUxfU1RBVF9JTklUOworICAgIHN0YXRp
YyBERUZJTkVfUEVSX0NQVSh1aW50MzJfdCwgcG9sbF9zbG90KTsKICAgICB1bnNpZ25lZCBpbnQg
aW5kZXg7CiAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKICAgICB1NjQgZW50cnlfYmFzZTsKICAg
ICBzdHJ1Y3QgcWludmFsX2VudHJ5ICpxaW52YWxfZW50cnksICpxaW52YWxfZW50cmllczsKKyAg
ICB1aW50MzJfdCAqdGhpc19wb2xsX3Nsb3QgPSAmdGhpc19jcHUocG9sbF9zbG90KTsKIAogICAg
IHNwaW5fbG9ja19pcnFzYXZlKCZpb21tdS0+cmVnaXN0ZXJfbG9jaywgZmxhZ3MpOworICAgIEFD
Q0VTU19PTkNFKCp0aGlzX3BvbGxfc2xvdCkgPSBRSU5WQUxfU1RBVF9JTklUOwogICAgIGluZGV4
ID0gcWludmFsX25leHRfaW5kZXgoaW9tbXUpOwogICAgIGVudHJ5X2Jhc2UgPSBpb21tdV9xaV9j
dHJsKGlvbW11KS0+cWludmFsX21hZGRyICsKICAgICAgICAgICAgICAgICAgKChpbmRleCA+PiBR
SU5WQUxfRU5UUllfT1JERVIpIDw8IFBBR0VfU0hJRlQpOwpAQCAtMTY2LDggKzE2OCw3IEBAIHN0
YXRpYyBpbnQgX19tdXN0X2NoZWNrIHF1ZXVlX2ludmFsaWRhdGVfd2FpdChzdHJ1Y3QgaW9tbXUg
KmlvbW11LAogICAgIHFpbnZhbF9lbnRyeS0+cS5pbnZfd2FpdF9kc2MubG8uZm4gPSBmbjsKICAg
ICBxaW52YWxfZW50cnktPnEuaW52X3dhaXRfZHNjLmxvLnJlc18xID0gMDsKICAgICBxaW52YWxf
ZW50cnktPnEuaW52X3dhaXRfZHNjLmxvLnNkYXRhID0gUUlOVkFMX1NUQVRfRE9ORTsKLSAgICBx
aW52YWxfZW50cnktPnEuaW52X3dhaXRfZHNjLmhpLnJlc18xID0gMDsKLSAgICBxaW52YWxfZW50
cnktPnEuaW52X3dhaXRfZHNjLmhpLnNhZGRyID0gdmlydF90b19tYWRkcigmcG9sbF9zbG90KSA+
PiAyOworICAgIHFpbnZhbF9lbnRyeS0+cS5pbnZfd2FpdF9kc2MuaGkuc2FkZHIgPSB2aXJ0X3Rv
X21hZGRyKHRoaXNfcG9sbF9zbG90KTsKIAogICAgIHVubWFwX3Z0ZF9kb21haW5fcGFnZShxaW52
YWxfZW50cmllcyk7CiAgICAgcWludmFsX3VwZGF0ZV9xdGFpbChpb21tdSwgaW5kZXgpOwpAQCAt
MTgyLDcgKzE4Myw3IEBAIHN0YXRpYyBpbnQgX19tdXN0X2NoZWNrIHF1ZXVlX2ludmFsaWRhdGVf
d2FpdChzdHJ1Y3QgaW9tbXUgKmlvbW11LAogICAgICAgICB0aW1lb3V0ID0gTk9XKCkgKyBNSUxM
SVNFQ1MoZmx1c2hfZGV2X2lvdGxiID8KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGlvbW11X2Rldl9pb3RsYl90aW1lb3V0IDogVlREX1FJX1RJTUVPVVQpOwogCi0gICAgICAg
IHdoaWxlICggcG9sbF9zbG90ICE9IFFJTlZBTF9TVEFUX0RPTkUgKQorICAgICAgICB3aGlsZSAo
IEFDQ0VTU19PTkNFKCp0aGlzX3BvbGxfc2xvdCkgIT0gUUlOVkFMX1NUQVRfRE9ORSApCiAgICAg
ICAgIHsKICAgICAgICAgICAgIGlmICggTk9XKCkgPiB0aW1lb3V0ICkKICAgICAgICAgICAgIHsK
LS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
