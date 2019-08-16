Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 175F4906C2
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 19:24:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyftZ-0005Kg-Ff; Fri, 16 Aug 2019 17:20:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Hd7z=WM=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hyftX-0005H4-Ha
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 17:20:07 +0000
X-Inumbo-ID: 170d0d06-c04a-11e9-a661-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 170d0d06-c04a-11e9-a661-bc764e2007e4;
 Fri, 16 Aug 2019 17:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565976006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OdGW6GVTh4b2kxBBsSlAFuzfQHu1a/ueBoA8DtvJsaY=;
 b=F/2R+yIZ3wx1p1rizJX+ry0Za7jWqjdX6gEx3pGbO5rEHGa1C/hXkuWr
 s9p+pIulgWAmcXNqWrl5oKVTrg+7GIUF/TqQXF+de1sKByMyJFRYwua+V
 6+uCtRRfyY7TQNNcQPqVaMy3Dg6kXc/WJWPmg4v42Sj3wASgXJ+PXhvOP g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: UY2b4Y+xYUe440aZPuKVhWYHG8VtL6HcI5gntoAeo+VjBX02ToQQedpa3hyX3flrXJq180M8aB
 UEOq9cmzlxrpYRNH9Kng8UDixJ5Lhp99QfuGxkvNHCI+CTqCEzeSMwsf9qcXYMi3ulKYTDDjvK
 yYryl4hZuy7P3TjbJxVDnRgse0Ayi36vTSbuMYGI3KW8xQN566mqHj2vG49smDM3sVkxE+baa8
 iFv8muQmQ0xLrPPxdhJzCWeNvA4ZHFdojrJHACjdPMOnXaKIayRBdivOzwKeit+n4sghF1xBA0
 kVU=
X-SBRS: 2.7
X-MesageID: 4596317
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,394,1559534400"; 
   d="scan'208";a="4596317"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 16 Aug 2019 18:19:55 +0100
Message-ID: <20190816172001.3905-5-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20190816172001.3905-1-paul.durrant@citrix.com>
References: <20190816172001.3905-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 04/10] domain: remove the 'is_xenstore' flag
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
 Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgY29udmVuaWVuY2UgbWFjcm8sIGlzX3hlbnN0b3JlX2Rv
bWFpbigpLCB3aGljaAp0ZXN0cyB0aGUgZG9tYWluICdvcHRpb25zJyBkaXJlY3RseSBhbmQgdGhl
biB1c2VzIHRoYXQgaW4gcGxhY2Ugb2YKdGhlICdpc194ZW5zdG9yZScgZmxhZy4KClNpZ25lZC1v
ZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+ClJldmlld2VkLWJ5
OiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpBY2tlZC1ieTogR2Vv
cmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgotLS0KQ2M6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
Q2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CkNjOiBLb25yYWQgUnplc3p1
dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KQ2M6
IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNjOiBEYW5pZWwgRGUgR3JhYWYgPGRnZGVncmFAdHljaG8u
bnNhLmdvdj4KCnYyOgogLSBTZXQgJ2Rpc2FibGVfbWlncmF0ZScgdG8gdHJ1ZSByYXRoZXIgMQot
LS0KIHhlbi9jb21tb24vZG9tYWluLmMgICAgIHwgOSArKystLS0tLS0KIHhlbi9jb21tb24vZG9t
Y3RsLmMgICAgIHwgMiArLQogeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggfCA3ICsrKysrLS0KIHhl
bi9pbmNsdWRlL3hzbS9kdW1teS5oIHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRp
b25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RvbWFpbi5j
IGIveGVuL2NvbW1vbi9kb21haW4uYwppbmRleCA5NTMyMTQ4MmVmLi43NmU2OTc2NjE3IDEwMDY0
NAotLS0gYS94ZW4vY29tbW9uL2RvbWFpbi5jCisrKyBiL3hlbi9jb21tb24vZG9tYWluLmMKQEAg
LTM2Myw3ICszNjMsNyBAQCBzdHJ1Y3QgZG9tYWluICpkb21haW5fY3JlYXRlKGRvbWlkX3QgZG9t
aWQsCiAgICAgICAgIGlmICggaGFyZHdhcmVfZG9taWQgPCAwIHx8IGhhcmR3YXJlX2RvbWlkID49
IERPTUlEX0ZJUlNUX1JFU0VSVkVEICkKICAgICAgICAgICAgIHBhbmljKCJUaGUgdmFsdWUgb2Yg
aGFyZHdhcmVfZG9tIG11c3QgYmUgYSB2YWxpZCBkb21haW4gSURcbiIpOwogCi0gICAgICAgIGQt
PmRpc2FibGVfbWlncmF0ZSA9IDE7CisgICAgICAgIGQtPmRpc2FibGVfbWlncmF0ZSA9IHRydWU7
CiAgICAgICAgIG9sZF9od2RvbSA9IGhhcmR3YXJlX2RvbWFpbjsKICAgICAgICAgaGFyZHdhcmVf
ZG9tYWluID0gZDsKICAgICB9CkBAIC00NDIsMTEgKzQ0Miw4IEBAIHN0cnVjdCBkb21haW4gKmRv
bWFpbl9jcmVhdGUoZG9taWRfdCBkb21pZCwKICAgICAgICAgd2F0Y2hkb2dfZG9tYWluX2luaXQo
ZCk7CiAgICAgICAgIGluaXRfc3RhdHVzIHw9IElOSVRfd2F0Y2hkb2c7CiAKLSAgICAgICAgaWYg
KCBkLT5vcHRpb25zICYgWEVOX0RPTUNUTF9DREZfeHNfZG9tYWluICkKLSAgICAgICAgewotICAg
ICAgICAgICAgZC0+aXNfeGVuc3RvcmUgPSAxOwotICAgICAgICAgICAgZC0+ZGlzYWJsZV9taWdy
YXRlID0gMTsKLSAgICAgICAgfQorICAgICAgICBpZiAoIGlzX3hlbnN0b3JlX2RvbWFpbihkKSAp
CisgICAgICAgICAgICBkLT5kaXNhYmxlX21pZ3JhdGUgPSB0cnVlOwogCiAgICAgICAgIGQtPmlv
bWVtX2NhcHMgPSByYW5nZXNldF9uZXcoZCwgIkkvTyBNZW1vcnkiLCBSQU5HRVNFVEZfcHJldHR5
cHJpbnRfaGV4KTsKICAgICAgICAgZC0+aXJxX2NhcHMgICA9IHJhbmdlc2V0X25ldyhkLCAiSW50
ZXJydXB0cyIsIDApOwpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kb21jdGwuYyBiL3hlbi9jb21t
b24vZG9tY3RsLmMKaW5kZXggYjQ4ZTQwODU4My4uNmU2ZTliOTg2NiAxMDA2NDQKLS0tIGEveGVu
L2NvbW1vbi9kb21jdGwuYworKysgYi94ZW4vY29tbW9uL2RvbWN0bC5jCkBAIC0xODYsNyArMTg2
LDcgQEAgdm9pZCBnZXRkb21haW5pbmZvKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB4ZW5fZG9t
Y3RsX2dldGRvbWFpbmluZm8gKmluZm8pCiAgICAgICAgIChkLT5pc19zaHV0X2Rvd24gICAgICAg
ICAgICAgICAgPyBYRU5fRE9NSU5GX3NodXRkb3duICA6IDApIHwKICAgICAgICAgKGQtPmNvbnRy
b2xsZXJfcGF1c2VfY291bnQgPiAwICA/IFhFTl9ET01JTkZfcGF1c2VkICAgIDogMCkgfAogICAg
ICAgICAoZC0+ZGVidWdnZXJfYXR0YWNoZWQgICAgICAgICAgID8gWEVOX0RPTUlORl9kZWJ1Z2dl
ZCAgOiAwKSB8Ci0gICAgICAgIChkLT5pc194ZW5zdG9yZSAgICAgICAgICAgICAgICAgPyBYRU5f
RE9NSU5GX3hzX2RvbWFpbiA6IDApIHwKKyAgICAgICAgKGlzX3hlbnN0b3JlX2RvbWFpbihkKSAg
ICAgICAgICA/IFhFTl9ET01JTkZfeHNfZG9tYWluIDogMCkgfAogICAgICAgICAoaXNfaHZtX2Rv
bWFpbihkKSAgICAgICAgICAgICAgID8gWEVOX0RPTUlORl9odm1fZ3Vlc3QgOiAwKSB8CiAgICAg
ICAgIGQtPnNodXRkb3duX2NvZGUgPDwgWEVOX0RPTUlORl9zaHV0ZG93bnNoaWZ0OwogCmRpZmYg
LS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5o
CmluZGV4IDA3YTY0OTQ3ZWQuLmRmMzMxYTNiYjAgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hl
bi9zY2hlZC5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCkBAIC0zNzUsOCArMzc1LDYg
QEAgc3RydWN0IGRvbWFpbgogICAgIGJvb2wgICAgICAgICAgICAgaXNfcHJpdmlsZWdlZDsKICAg
ICAvKiBDYW4gdGhpcyBndWVzdCBhY2Nlc3MgdGhlIFhlbiBjb25zb2xlPyAqLwogICAgIGJvb2wg
ICAgICAgICAgICAgaXNfY29uc29sZTsKLSAgICAvKiBJcyB0aGlzIGEgeGVuc3RvcmUgZG9tYWlu
IChub3QgZG9tMCk/ICovCi0gICAgYm9vbCAgICAgICAgICAgICBpc194ZW5zdG9yZTsKICAgICAv
KiBOb24tbWlncmF0YWJsZSBhbmQgbm9uLXJlc3RvcmVhYmxlPyAqLwogICAgIGJvb2wgICAgICAg
ICAgICAgZGlzYWJsZV9taWdyYXRlOwogICAgIC8qIElzIHRoaXMgZ3Vlc3QgYmVpbmcgZGVidWdn
ZWQgYnkgZG9tMD8gKi8KQEAgLTk3OSw2ICs5NzcsMTEgQEAgc3RhdGljIGlubGluZSBib29sIGlz
X3ZjcHVfb25saW5lKGNvbnN0IHN0cnVjdCB2Y3B1ICp2KQogICAgIHJldHVybiAhdGVzdF9iaXQo
X1ZQRl9kb3duLCAmdi0+cGF1c2VfZmxhZ3MpOwogfQogCitzdGF0aWMgaW5saW5lIGJvb2wgaXNf
eGVuc3RvcmVfZG9tYWluKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpCit7CisgICAgcmV0dXJuIGQt
Pm9wdGlvbnMgJiBYRU5fRE9NQ1RMX0NERl94c19kb21haW47Cit9CisKIGV4dGVybiBib29sIHNj
aGVkX3NtdF9wb3dlcl9zYXZpbmdzOwogCiBleHRlcm4gZW51bSBjcHVmcmVxX2NvbnRyb2xsZXIg
ewpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveHNtL2R1bW15LmggYi94ZW4vaW5jbHVkZS94c20v
ZHVtbXkuaAppbmRleCBlZjUyYmIxNzY0Li5iOGUxODVlNmZhIDEwMDY0NAotLS0gYS94ZW4vaW5j
bHVkZS94c20vZHVtbXkuaAorKysgYi94ZW4vaW5jbHVkZS94c20vZHVtbXkuaApAQCAtNzksNyAr
NzksNyBAQCBzdGF0aWMgYWx3YXlzX2lubGluZSBpbnQgeHNtX2RlZmF1bHRfYWN0aW9uKAogICAg
ICAgICB7CiAgICAgICAgICAgICByZXR1cm4gMDsKICAgICBjYXNlIFhTTV9YU19QUklWOgotICAg
ICAgICAgICAgaWYgKCBzcmMtPmlzX3hlbnN0b3JlICkKKyAgICAgICAgICAgIGlmICggaXNfeGVu
c3RvcmVfZG9tYWluKHNyYykgKQogICAgICAgICAgICAgICAgIHJldHVybiAwOwogICAgICAgICB9
CiAgICAgICAgIC8qIGZhbGwgdGhyb3VnaCAqLwotLSAKMi4yMC4xLjIuZ2IyMWViYjY3MQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
