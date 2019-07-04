Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DADDE5FA73
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 17:00:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj3BI-0005pK-N7; Thu, 04 Jul 2019 14:57:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8gU+=VB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hj3BH-0005ox-J1
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:57:51 +0000
X-Inumbo-ID: 166b43f4-9e6c-11e9-8478-3363075052b0
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 166b43f4-9e6c-11e9-8478-3363075052b0;
 Thu, 04 Jul 2019 14:57:48 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PmNVexK4rwGJS1TZWljA+1KCdOrkSdgMhD54Y4NVusjWbAoUt7xp6ly+Q5GYsQONws2W00lplz
 ia+7QpyoTx4AiEVvjX/w2FRkomCT5O3Hu7Rxmt2nt9xsFNMFm3gXMHK5kgBksUm2ItwNCwNPth
 BwWz/WmLZmVCF3HkD18wuYnj9R5sASmdZ3rZbE97dHSrtb8KFi0ksApSUps97YtEAbAJqokNnq
 OcQOU9jA12dkVIdX3+Xa73yqeyReVCa+1HiCr4Aqt2rewvTG/r6ZnWnuAmftvckKXD6XHCA7me
 IDE=
X-SBRS: 2.7
X-MesageID: 2617751
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2617751"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Thu, 4 Jul 2019 15:42:18 +0100
Message-ID: <20190704144233.27968-21-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704144233.27968-1-anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 20/35] OvmfPkg/XenPlatformPei: Setup
 HyperPages earlier
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgYXJlIGdvaW5nIHRvIG5lZWQgdG8gbWFrZSBhbiBoeXBlcmNhbGwgaW4gb3JkZXIgdG8gcmV0
cmVpdmUgdGhlIEU4MjAKdGFibGUgZnJvbSB0aGUgaHlwZXJ2aXNvciBiZWZvcmUgYmVlbiBhYmxl
IHRvIHNldHVwIHRoZSBtZW1vcnkuCgpDYWxsaW5nIFhlbkNvbm5lY3QgZWFybGllciB3aWxsIGFs
bG93IHRvIHNldHVwIHRoZSBYZW5IeXBlcmNhbGxMaWIKZWFybGllciB0byBhbGxvdyB0byBtYWtl
IGh5cGVyY2FsbHMuCgpXaGlsZSBoZXJlLCBhZGQgc29tZSBjb21tZW50cyBpbiBYZW5Db25uZWN0
KCkuCgpSZWY6IGh0dHBzOi8vYnVnemlsbGEudGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9
MTY4OQpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT4KQWNrZWQtYnk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+Ci0tLQogT3Zt
ZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5oIHwgIDUgKysrKysKIE92bWZQa2cvWGVuUGxh
dGZvcm1QZWkvUGxhdGZvcm0uYyB8ICAyICsrCiBPdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5j
ICAgICAgfCAyMyArKysrKysrKysrKystLS0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAxOSBp
bnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlblBs
YXRmb3JtUGVpL1BsYXRmb3JtLmggYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3JtLmgK
aW5kZXggOTI1ZGYzMWY4OC4uNGE4MDA1N2JkYyAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9YZW5QbGF0
Zm9ybVBlaS9QbGF0Zm9ybS5oCisrKyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZvcm0u
aApAQCAtNzksNiArNzksMTEgQEAgSW5zdGFsbENsZWFyQ2FjaGVDYWxsYmFjayAoCiAgIFZPSUQN
CiAgICk7DQogDQorRUZJX1NUQVRVUw0KK1hlbkNvbm5lY3QgKA0KKyAgVk9JRA0KKyAgKTsNCisN
CiBFRklfU1RBVFVTDQogSW5pdGlhbGl6ZVhlbiAoDQogICBWT0lEDQpkaWZmIC0tZ2l0IGEvT3Zt
ZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5jIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9Q
bGF0Zm9ybS5jCmluZGV4IGM5N2EyZmI2YzEuLjUyZjYwNDhjYTQgMTAwNjQ0Ci0tLSBhL092bWZQ
a2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZvcm0uYworKysgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVp
L1BsYXRmb3JtLmMKQEAgLTQxNiw2ICs0MTYsOCBAQCBJbml0aWFsaXplWGVuUGxhdGZvcm0gKAog
ICAgIENwdURlYWRMb29wICgpOw0KICAgfQ0KIA0KKyAgWGVuQ29ubmVjdCAoKTsNCisNCiAgIEJv
b3RNb2RlSW5pdGlhbGl6YXRpb24gKCk7DQogICBBZGRyZXNzV2lkdGhJbml0aWFsaXphdGlvbiAo
KTsNCiANCmRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jIGIvT3ZtZlBr
Zy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwppbmRleCAzN2U5Y2ZmNGI0Li43ZDE2OTZiYjIyIDEwMDY0
NAotLS0gYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jCisrKyBiL092bWZQa2cvWGVuUGxh
dGZvcm1QZWkvWGVuLmMKQEAgLTcyLDE0ICs3MiwxMSBAQCBYZW5HZXRFODIwTWFwICgKIC8qKg0K
ICAgQ29ubmVjdHMgdG8gdGhlIEh5cGVydmlzb3IuDQogIA0KLSAgQHBhcmFtICBYZW5MZWFmICAg
ICBDUFVJRCBpbmRleCB1c2VkIHRvIGNvbm5lY3QuDQotDQogICBAcmV0dXJuIEVGSV9TVEFUVVMN
CiANCiAqKi8NCiBFRklfU1RBVFVTDQogWGVuQ29ubmVjdCAoDQotICBVSU5UMzIgWGVuTGVhZg0K
ICAgKQ0KIHsNCiAgIFVJTlQzMiBJbmRleDsNCkBAIC05MSw3ICs4OCwxMyBAQCBYZW5Db25uZWN0
ICgKICAgVUlOVDMyICpQVkhSZXNldFZlY3RvckRhdGE7DQogICBSRVRVUk5fU1RBVFVTIFN0YXR1
czsNCiANCi0gIEFzbUNwdWlkIChYZW5MZWFmICsgMiwgJlRyYW5zZmVyUGFnZXMsICZUcmFuc2Zl
clJlZywgTlVMTCwgTlVMTCk7DQorICBBU1NFUlQgKG1YZW5MZWFmICE9IDApOw0KKw0KKyAgLy8N
CisgIC8vIFByZXBhcmUgSHlwZXJQYWdlcyB0byBiZSBhYmxlIHRvIG1ha2UgaHlwZXJjYWxscw0K
KyAgLy8NCisNCisgIEFzbUNwdWlkIChtWGVuTGVhZiArIDIsICZUcmFuc2ZlclBhZ2VzLCAmVHJh
bnNmZXJSZWcsIE5VTEwsIE5VTEwpOw0KICAgbVhlbkluZm8uSHlwZXJQYWdlcyA9IEFsbG9jYXRl
UGFnZXMgKFRyYW5zZmVyUGFnZXMpOw0KICAgaWYgKCFtWGVuSW5mby5IeXBlclBhZ2VzKSB7DQog
ICAgIHJldHVybiBFRklfT1VUX09GX1JFU09VUkNFUzsNCkBAIC0xMDMsNyArMTA2LDExIEBAIFhl
bkNvbm5lY3QgKAogICAgICAgICAgICAgICAgICAgIChJbmRleCA8PCBFRklfUEFHRV9TSElGVCkg
KyBJbmRleCk7DQogICB9DQogDQotICBBc21DcHVpZCAoWGVuTGVhZiArIDEsICZYZW5WZXJzaW9u
LCBOVUxMLCBOVUxMLCBOVUxMKTsNCisgIC8vDQorICAvLyBGaW5kIG91dCB0aGUgWGVuIHZlcnNp
b24NCisgIC8vDQorDQorICBBc21DcHVpZCAobVhlbkxlYWYgKyAxLCAmWGVuVmVyc2lvbiwgTlVM
TCwgTlVMTCwgTlVMTCk7DQogICBERUJVRyAoKEVGSV9EX0VSUk9SLCAiRGV0ZWN0ZWQgWGVuIHZl
cnNpb24gJWQuJWRcbiIsDQogICAgICAgICAgIFhlblZlcnNpb24gPj4gMTYsIFhlblZlcnNpb24g
JiAweEZGRkYpKTsNCiAgIG1YZW5JbmZvLlZlcnNpb25NYWpvciA9IChVSU5UMTYpKFhlblZlcnNp
b24gPj4gMTYpOw0KQEAgLTI2MiwxMiArMjY5LDYgQEAgSW5pdGlhbGl6ZVhlbiAoCiB7DQogICBS
RVRVUk5fU1RBVFVTIFBjZFN0YXR1czsNCiANCi0gIGlmIChtWGVuTGVhZiA9PSAwKSB7DQotICAg
IHJldHVybiBFRklfTk9UX0ZPVU5EOw0KLSAgfQ0KLQ0KLSAgWGVuQ29ubmVjdCAobVhlbkxlYWYp
Ow0KLQ0KICAgLy8NCiAgIC8vIFJlc2VydmUgYXdheSBIVk1MT0FERVIgcmVzZXJ2ZWQgbWVtb3J5
IFsweEZDMDAwMDAwLDB4RkQwMDAwMDApLg0KICAgLy8gVGhpcyBuZWVkcyB0byBtYXRjaCBIVk1M
T0FERVIgUkVTRVJWRURfTUVNQkFTRS9SRVNFUlZFRF9NRU1TSVpFLg0KLS0gCkFudGhvbnkgUEVS
QVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
