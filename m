Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E177386FB
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 11:25:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZB5f-0002Xv-Dd; Fri, 07 Jun 2019 09:23:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GsDR=UG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hZB5d-0002XK-NU
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 09:23:13 +0000
X-Inumbo-ID: dd66e78c-8905-11e9-9855-93a71a789764
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd66e78c-8905-11e9-9855-93a71a789764;
 Fri, 07 Jun 2019 09:23:09 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2oFTU/XWjGqFffuw67bLTka8YA5pAEe1vLiNBnsgA1RQlKto7p0Q+rKxeolkt7GMglzBMZP9rj
 Z4aPKVOjCeQ9Cczm4z5vtAMQUVXscL+/SjmsV9LxZTduSgpwo5DkxEecEc0PIv8c0TSTjoJh+i
 pe/iwQe/PvDh/GPr+TYJ1AuTBTwzMBeeNanOANvW2mDOqGCWf/JlBgz8sAeGN2x/YZBXDzbQx0
 Kpql7oZtj0sj71QDwzubJDQfTLNiLEnQ8FcAY3SJ/PuEwjp6RfAYniz3m1jobc6jUkTM+56SB5
 PSs=
X-SBRS: -0.9
X-MesageID: 1419347
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,562,1557201600"; 
   d="scan'208";a="1419347"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 7 Jun 2019 11:22:23 +0200
Message-ID: <20190607092232.83179-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190607092232.83179-1-roger.pau@citrix.com>
References: <20190607092232.83179-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 04/13] pci: make PCI_SBDF return a pci_sbdf_t
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kIGZpeCBpdCdzIG9ubHkgY2FsbGVyLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwu
ZHVycmFudEBjaXRyaXguY29tPgotLS0KQ2M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwu
Y29tPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEdl
b3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IEtvbnJh
ZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4u
b3JnPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KLS0tCkNoYW5nZXMgc2luY2UgdjE6CiAtIE5l
dyBpbiB0aGlzIHZlcnNpb24uCi0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2RtYXIu
YyB8IDMgKystCiB4ZW4vaW5jbHVkZS94ZW4vcGNpLmggICAgICAgICAgICAgIHwgMyArKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9kbWFyLmMgYi94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC92dGQvZG1hci5jCmluZGV4IDljYzg2MjNlNTMuLjU5YTQ2Y2QxYzYgMTAwNjQ0Ci0t
LSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9kbWFyLmMKKysrIGIveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvdnRkL2RtYXIuYwpAQCAtMTExNSw3ICsxMTE1LDggQEAgc3RhdGljIGludCBf
X2luaXQgcGFyc2Vfcm1ycl9wYXJhbShjb25zdCBjaGFyICpzdHIpCiAKICAgICAgICAgICAgIC8q
IEtlZXAgc2JkZidzIGV2ZW4gaWYgdGhleSBkaWZmZXIgYW5kIGxhdGVyIHJlcG9ydCBhbiBlcnJv
ci4gKi8KICAgICAgICAgICAgIGRldl9jb3VudCA9IHVzZXJfcm1ycnNbbnJfcm1ycl0uZGV2X2Nv
dW50OwotICAgICAgICAgICAgdXNlcl9ybXJyc1tucl9ybXJyXS5zYmRmW2Rldl9jb3VudF0gPSBQ
Q0lfU0JERihzZWcsIGJ1cywgZGV2LCBmdW5jKTsKKyAgICAgICAgICAgIHVzZXJfcm1ycnNbbnJf
cm1ycl0uc2JkZltkZXZfY291bnRdID0KKyAgICAgICAgICAgICAgIFBDSV9TQkRGKHNlZywgYnVz
LCBkZXYsIGZ1bmMpLnNiZGY7CiAKICAgICAgICAgICAgIHVzZXJfcm1ycnNbbnJfcm1ycl0uZGV2
X2NvdW50Kys7CiAgICAgICAgICAgICBzID0gc3RtcDsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L3hlbi9wY2kuaCBiL3hlbi9pbmNsdWRlL3hlbi9wY2kuaAppbmRleCBiMDM5MjdjZDI4Li4xMmYx
Y2VhMTliIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vcGNpLmgKKysrIGIveGVuL2luY2x1
ZGUveGVuL3BjaS5oCkBAIC0zNCw3ICszNCw4IEBACiAjZGVmaW5lIFBDSV9ERVZGTjIoYmRmKSAo
KGJkZikgJiAweGZmKQogI2RlZmluZSBQQ0lfQkRGKGIsZCxmKSAgKCgoKGIpICYgMHhmZikgPDwg
OCkgfCBQQ0lfREVWRk4oZCxmKSkKICNkZWZpbmUgUENJX0JERjIoYixkZikgICgoKChiKSAmIDB4
ZmYpIDw8IDgpIHwgKChkZikgJiAweGZmKSkKLSNkZWZpbmUgUENJX1NCREYocyxiLGQsZikgKCgo
KHMpICYgMHhmZmZmKSA8PCAxNikgfCBQQ0lfQkRGKGIsZCxmKSkKKyNkZWZpbmUgUENJX1NCREYo
cyxiLGQsZikgXAorICAgICgocGNpX3NiZGZfdCkgeyAuc2JkZiA9ICgoKHMpICYgMHhmZmZmKSA8
PCAxNikgfCBQQ0lfQkRGKGIsZCxmKSB9KQogI2RlZmluZSBQQ0lfU0JERjIocyxiZGYpICgoKChz
KSAmIDB4ZmZmZikgPDwgMTYpIHwgKChiZGYpICYgMHhmZmZmKSkKICNkZWZpbmUgUENJX1NCREYz
KHMsYixkZikgKCgoKHMpICYgMHhmZmZmKSA8PCAxNikgfCBQQ0lfQkRGMihiLCBkZikpCiAKLS0g
CjIuMjAuMSAoQXBwbGUgR2l0LTExNykKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
