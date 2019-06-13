Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3694367F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 15:27:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbPik-0001UW-Vr; Thu, 13 Jun 2019 13:24:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BOU1=UM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hbPii-0001UE-V2
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 13:24:48 +0000
X-Inumbo-ID: 9d77f425-8dde-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9d77f425-8dde-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 13:24:47 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 13 Jun 2019 07:24:47 -0600
Message-Id: <5D024E9C0200007800237E28@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 13 Jun 2019 07:24:44 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
In-Reply-To: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 5/9] AMD/IOMMU: split amd_iommu_init_one()
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
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TWFwcGluZyB0aGUgTU1JTyBzcGFjZSBhbmQgb2J0YWluaW5nIGZlYXR1cmUgaW5mb3JtYXRpb24g
bmVlZHMgdG8gaGFwcGVuCnNsaWdodGx5IGVhcmxpZXIsIHN1Y2ggdGhhdCBmb3IgeDJBUElDIHN1
cHBvcnQgd2UgY2FuIHNldCBYVEVuIHByaW9yIHRvCmNhbGxpbmcgYW1kX2lvbW11X3VwZGF0ZV9p
dnJzX21hcHBpbmdfYWNwaSgpIGFuZAphbWRfaW9tbXVfc2V0dXBfaW9hcGljX3JlbWFwcGluZygp
LgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYworKysgYi94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCkBAIC05NzAsMTQgKzk3MCw2IEBAIHN0YXRp
YyB2b2lkICogX19pbml0IGFsbG9jYXRlX3Bwcl9sb2coc3QKIAogc3RhdGljIGludCBfX2luaXQg
YW1kX2lvbW11X2luaXRfb25lKHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11KQogewotICAgIGlmICgg
bWFwX2lvbW11X21taW9fcmVnaW9uKGlvbW11KSAhPSAwICkKLSAgICAgICAgZ290byBlcnJvcl9v
dXQ7Ci0KLSAgICBnZXRfaW9tbXVfZmVhdHVyZXMoaW9tbXUpOwotCi0gICAgaWYgKCBpb21tdS0+
ZmVhdHVyZXMucmF3ICkKLSAgICAgICAgaW9tbXV2Ml9lbmFibGVkID0gMTsKLQogICAgIGlmICgg
YWxsb2NhdGVfY21kX2J1ZmZlcihpb21tdSkgPT0gTlVMTCApCiAgICAgICAgIGdvdG8gZXJyb3Jf
b3V0OwogCkBAIC0xMTk3LDYgKzExODksMjMgQEAgc3RhdGljIGJvb2xfdCBfX2luaXQgYW1kX3Nw
NTEwMF9lcnJhdHVtMgogICAgIHJldHVybiAwOwogfQogCitzdGF0aWMgaW50IF9faW5pdCBhbWRf
aW9tbXVfcHJlcGFyZV9vbmUoc3RydWN0IGFtZF9pb21tdSAqaW9tbXUpCit7CisgICAgaW50IHJj
ID0gYWxsb2NfaXZyc19tYXBwaW5ncyhpb21tdS0+c2VnKTsKKworICAgIGlmICggIXJjICkKKyAg
ICAgICAgcmMgPSBtYXBfaW9tbXVfbW1pb19yZWdpb24oaW9tbXUpOworICAgIGlmICggcmMgKQor
ICAgICAgICByZXR1cm4gcmM7CisKKyAgICBnZXRfaW9tbXVfZmVhdHVyZXMoaW9tbXUpOworCisg
ICAgaWYgKCBpb21tdS0+ZmVhdHVyZXMucmF3ICkKKyAgICAgICAgaW9tbXV2Ml9lbmFibGVkID0g
dHJ1ZTsKKworICAgIHJldHVybiAwOworfQorCiBpbnQgX19pbml0IGFtZF9pb21tdV9pbml0KHZv
aWQpCiB7CiAgICAgc3RydWN0IGFtZF9pb21tdSAqaW9tbXU7CkBAIC0xMjI3LDcgKzEyMzYsNyBA
QCBpbnQgX19pbml0IGFtZF9pb21tdV9pbml0KHZvaWQpCiAgICAgcmFkaXhfdHJlZV9pbml0KCZp
dnJzX21hcHMpOwogICAgIGZvcl9lYWNoX2FtZF9pb21tdSAoIGlvbW11ICkKICAgICB7Ci0gICAg
ICAgIHJjID0gYWxsb2NfaXZyc19tYXBwaW5ncyhpb21tdS0+c2VnKTsKKyAgICAgICAgcmMgPSBh
bWRfaW9tbXVfcHJlcGFyZV9vbmUoaW9tbXUpOwogICAgICAgICBpZiAoIHJjICkKICAgICAgICAg
ICAgIGdvdG8gZXJyb3Jfb3V0OwogICAgIH0KCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
