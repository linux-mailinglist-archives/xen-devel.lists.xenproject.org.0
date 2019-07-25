Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5F974FD2
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 15:42:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqdy4-00009U-Pq; Thu, 25 Jul 2019 13:39:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=owr5=VW=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hqdy3-00007k-2g
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 13:39:35 +0000
X-Inumbo-ID: a262a804-aee1-11e9-86b6-dbc9c5df9cdd
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a262a804-aee1-11e9-86b6-dbc9c5df9cdd;
 Thu, 25 Jul 2019 13:39:32 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9bxae4ntBAD8bLW23e+ZTx8jAYXvOWrzM3J/QnD1DAmbecj/ghB/vRD9AgkkUqh4A97F4QKvZa
 rFzD4WPKC+I0l+CdDeMOf4FfL+8Z8Zm25FuoXOElRsui0XaUXS/8GxfgWuDTysIqee0KXBIqvx
 EChs3MYb6ExLhT3YEKtHpQqdlc4qldBrfFxoPgZpGuVqJFDw9W3Fc2XDu7Ecz1kfNH1B61pEeq
 MsKWYmeoARbyyI5vSn/EwXHVYXBaRYUPmQHz8MtrVrgsJLTEFNCm0IAW9FO9b0CineVRMnY9Hj
 Gas=
X-SBRS: 2.7
X-MesageID: 3459694
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3459694"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 25 Jul 2019 14:39:19 +0100
Message-ID: <20190725133920.40673-6-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20190725133920.40673-1-paul.durrant@citrix.com>
References: <20190725133920.40673-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 5/6] domain: remove the 'is_xenstore' flag
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
OiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2M6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxH
ZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CkNjOiBLb25yYWQgUnplc3p1dGVrIFdp
bGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KQ2M6IFdlaSBM
aXUgPHdsQHhlbi5vcmc+CkNjOiBEYW5pZWwgRGUgR3JhYWYgPGRnZGVncmFAdHljaG8ubnNhLmdv
dj4KCnYyOgogLSBTZXQgJ2Rpc2FibGVfbWlncmF0ZScgdG8gdHJ1ZSByYXRoZXIgMQotLS0KIHhl
bi9jb21tb24vZG9tYWluLmMgICAgIHwgOSArKystLS0tLS0KIHhlbi9jb21tb24vZG9tY3RsLmMg
ICAgIHwgMiArLQogeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggfCA3ICsrKysrLS0KIHhlbi9pbmNs
dWRlL3hzbS9kdW1teS5oIHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCsp
LCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RvbWFpbi5jIGIveGVu
L2NvbW1vbi9kb21haW4uYwppbmRleCA2ZWUyODFiZDAzLi45ZGI3Y2JhZTcyIDEwMDY0NAotLS0g
YS94ZW4vY29tbW9uL2RvbWFpbi5jCisrKyBiL3hlbi9jb21tb24vZG9tYWluLmMKQEAgLTM0OCw3
ICszNDgsNyBAQCBzdHJ1Y3QgZG9tYWluICpkb21haW5fY3JlYXRlKGRvbWlkX3QgZG9taWQsCiAg
ICAgICAgIGlmICggaGFyZHdhcmVfZG9taWQgPCAwIHx8IGhhcmR3YXJlX2RvbWlkID49IERPTUlE
X0ZJUlNUX1JFU0VSVkVEICkKICAgICAgICAgICAgIHBhbmljKCJUaGUgdmFsdWUgb2YgaGFyZHdh
cmVfZG9tIG11c3QgYmUgYSB2YWxpZCBkb21haW4gSURcbiIpOwogCi0gICAgICAgIGQtPmRpc2Fi
bGVfbWlncmF0ZSA9IDE7CisgICAgICAgIGQtPmRpc2FibGVfbWlncmF0ZSA9IHRydWU7CiAgICAg
ICAgIG9sZF9od2RvbSA9IGhhcmR3YXJlX2RvbWFpbjsKICAgICAgICAgaGFyZHdhcmVfZG9tYWlu
ID0gZDsKICAgICB9CkBAIC00MjcsMTEgKzQyNyw4IEBAIHN0cnVjdCBkb21haW4gKmRvbWFpbl9j
cmVhdGUoZG9taWRfdCBkb21pZCwKICAgICAgICAgd2F0Y2hkb2dfZG9tYWluX2luaXQoZCk7CiAg
ICAgICAgIGluaXRfc3RhdHVzIHw9IElOSVRfd2F0Y2hkb2c7CiAKLSAgICAgICAgaWYgKCBkLT5v
cHRpb25zICYgWEVOX0RPTUNUTF9DREZfeHNfZG9tYWluICkKLSAgICAgICAgewotICAgICAgICAg
ICAgZC0+aXNfeGVuc3RvcmUgPSAxOwotICAgICAgICAgICAgZC0+ZGlzYWJsZV9taWdyYXRlID0g
MTsKLSAgICAgICAgfQorICAgICAgICBpZiAoIGlzX3hlbnN0b3JlX2RvbWFpbihkKSApCisgICAg
ICAgICAgICBkLT5kaXNhYmxlX21pZ3JhdGUgPSB0cnVlOwogCiAgICAgICAgIGQtPmlvbWVtX2Nh
cHMgPSByYW5nZXNldF9uZXcoZCwgIkkvTyBNZW1vcnkiLCBSQU5HRVNFVEZfcHJldHR5cHJpbnRf
aGV4KTsKICAgICAgICAgZC0+aXJxX2NhcHMgICA9IHJhbmdlc2V0X25ldyhkLCAiSW50ZXJydXB0
cyIsIDApOwpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kb21jdGwuYyBiL3hlbi9jb21tb24vZG9t
Y3RsLmMKaW5kZXggZWY2NzE0YzBhYS4uZjJiNTgyODEyYyAxMDA2NDQKLS0tIGEveGVuL2NvbW1v
bi9kb21jdGwuYworKysgYi94ZW4vY29tbW9uL2RvbWN0bC5jCkBAIC0xODYsNyArMTg2LDcgQEAg
dm9pZCBnZXRkb21haW5pbmZvKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB4ZW5fZG9tY3RsX2dl
dGRvbWFpbmluZm8gKmluZm8pCiAgICAgICAgIChkLT5pc19zaHV0X2Rvd24gICAgICAgICAgICAg
ICAgPyBYRU5fRE9NSU5GX3NodXRkb3duICA6IDApIHwKICAgICAgICAgKGQtPmNvbnRyb2xsZXJf
cGF1c2VfY291bnQgPiAwICA/IFhFTl9ET01JTkZfcGF1c2VkICAgIDogMCkgfAogICAgICAgICAo
ZC0+ZGVidWdnZXJfYXR0YWNoZWQgICAgICAgICAgID8gWEVOX0RPTUlORl9kZWJ1Z2dlZCAgOiAw
KSB8Ci0gICAgICAgIChkLT5pc194ZW5zdG9yZSAgICAgICAgICAgICAgICAgPyBYRU5fRE9NSU5G
X3hzX2RvbWFpbiA6IDApIHwKKyAgICAgICAgKGlzX3hlbnN0b3JlX2RvbWFpbihkKSAgICAgICAg
ICA/IFhFTl9ET01JTkZfeHNfZG9tYWluIDogMCkgfAogICAgICAgICAoaXNfaHZtX2RvbWFpbihk
KSAgICAgICAgICAgICAgID8gWEVOX0RPTUlORl9odm1fZ3Vlc3QgOiAwKSB8CiAgICAgICAgIGQt
PnNodXRkb3duX2NvZGUgPDwgWEVOX0RPTUlORl9zaHV0ZG93bnNoaWZ0OwogCmRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCmluZGV4
IGFhMDlkMmM1NzQuLjk3Mzk5OGIyODggMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hl
ZC5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCkBAIC0zNzIsOCArMzcyLDYgQEAgc3Ry
dWN0IGRvbWFpbgogICAgIGJvb2wgICAgICAgICAgICAgaXNfcHJpdmlsZWdlZDsKICAgICAvKiBD
YW4gdGhpcyBndWVzdCBhY2Nlc3MgdGhlIFhlbiBjb25zb2xlPyAqLwogICAgIGJvb2wgICAgICAg
ICAgICAgaXNfY29uc29sZTsKLSAgICAvKiBJcyB0aGlzIGEgeGVuc3RvcmUgZG9tYWluIChub3Qg
ZG9tMCk/ICovCi0gICAgYm9vbCAgICAgICAgICAgICBpc194ZW5zdG9yZTsKICAgICAvKiBOb24t
bWlncmF0YWJsZSBhbmQgbm9uLXJlc3RvcmVhYmxlPyAqLwogICAgIGJvb2wgICAgICAgICAgICAg
ZGlzYWJsZV9taWdyYXRlOwogICAgIC8qIElzIHRoaXMgZ3Vlc3QgYmVpbmcgZGVidWdnZWQgYnkg
ZG9tMD8gKi8KQEAgLTk3MCw2ICs5NjgsMTEgQEAgc3RhdGljIGlubGluZSBib29sIGlzX3ZjcHVf
b25saW5lKGNvbnN0IHN0cnVjdCB2Y3B1ICp2KQogICAgIHJldHVybiAhdGVzdF9iaXQoX1ZQRl9k
b3duLCAmdi0+cGF1c2VfZmxhZ3MpOwogfQogCitzdGF0aWMgaW5saW5lIGJvb2wgaXNfeGVuc3Rv
cmVfZG9tYWluKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpCit7CisgICAgcmV0dXJuIGQtPm9wdGlv
bnMgJiBYRU5fRE9NQ1RMX0NERl94c19kb21haW47Cit9CisKIGV4dGVybiBib29sIHNjaGVkX3Nt
dF9wb3dlcl9zYXZpbmdzOwogCiBleHRlcm4gZW51bSBjcHVmcmVxX2NvbnRyb2xsZXIgewpkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUveHNtL2R1bW15LmggYi94ZW4vaW5jbHVkZS94c20vZHVtbXku
aAppbmRleCBlZjUyYmIxNzY0Li5iOGUxODVlNmZhIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94
c20vZHVtbXkuaAorKysgYi94ZW4vaW5jbHVkZS94c20vZHVtbXkuaApAQCAtNzksNyArNzksNyBA
QCBzdGF0aWMgYWx3YXlzX2lubGluZSBpbnQgeHNtX2RlZmF1bHRfYWN0aW9uKAogICAgICAgICB7
CiAgICAgICAgICAgICByZXR1cm4gMDsKICAgICBjYXNlIFhTTV9YU19QUklWOgotICAgICAgICAg
ICAgaWYgKCBzcmMtPmlzX3hlbnN0b3JlICkKKyAgICAgICAgICAgIGlmICggaXNfeGVuc3RvcmVf
ZG9tYWluKHNyYykgKQogICAgICAgICAgICAgICAgIHJldHVybiAwOwogICAgICAgICB9CiAgICAg
ICAgIC8qIGZhbGwgdGhyb3VnaCAqLwotLSAKMi4yMC4xLjIuZ2IyMWViYjY3MQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
