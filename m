Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A58CAB802C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 19:43:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB0QQ-0004Hx-6l; Thu, 19 Sep 2019 17:41:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iB0QO-0004H7-84
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 17:41:00 +0000
X-Inumbo-ID: 9b73e626-db04-11e9-966e-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b73e626-db04-11e9-966e-12813bfff9fa;
 Thu, 19 Sep 2019 17:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568914845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ct3y9VN4/oARq6HH2/+/acuA16pIcgYioXDNbJ6HwRc=;
 b=NR6+Fh6Mgt6VfoUPkBia54uDTWpoJ9hbLZCIbfhn/XAh5VTdX2AeOBxs
 0CI4+o5JOp6aGC1oiNgk8m/7Ec0or1gOywQ4xP47GYZYZF1+5b3SKingg
 pLWulKOvc4bdLtwiHEC+J1nTPY8fkMXtLEkVE4zX75IJCK7yswV8iaW3A Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 26kMB7hzM7IuVtEMWl3B7GS+GOwpzhg6yilkY0XyPb2v3zgAWJ/pqQxCJT8tW+MdcIlN1GrrXS
 jW2fYNymhU3rHhG+aFJg/IKXy5Pb3uqZP0RFS7gJ2zi0NNNYol2obNzKW19hOJ31T0gTzgSM29
 /oKXlJ9rumDAp+NfWdM4RpBp/Kq0oOGYquSp4fTtXzyMcUnXPByL/aT2e6rUqxLtOPcVh5jnny
 6lFA4J0gd+mRAPd9/mlaJ07Bk2Fw365zKowbM0J7sdzOBODqrk7aFM8U7f5liAKJWVoOgzw3ij
 o+8=
X-SBRS: 2.7
X-MesageID: 6010733
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,524,1559534400"; 
   d="scan'208";a="6010733"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Sep 2019 18:16:32 +0100
Message-ID: <20190919171656.899649-13-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919171656.899649-1-anthony.perard@citrix.com>
References: <20190919171656.899649-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 12/35] libxl: Re-introduce
 libxl__domain_unpause
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

bGlieGxfX2RvbWFpbl91bnBhdXNlIGlzIGEgcmVpbXBsZW1lbnRhdGlvbiBvZgpsaWJ4bF9fZG9t
YWluX3VucGF1c2VfZGVwcmVjYXRlZCB3aXRoIGFzeW5jaHJvbm91cyBvcGVyYXRpb24uCgpTaWdu
ZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KQWNr
ZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRvb2xz
L2xpYnhsL2xpYnhsX2RvbWFpbi5jICAgfCA1MiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggfCAgNSArKystCiAyIGZpbGVz
IGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90
b29scy9saWJ4bC9saWJ4bF9kb21haW4uYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jCmlu
ZGV4IGQ3OGZmYTZiNjAxOS4uNTJhOGJkNzg5NWNiIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9s
aWJ4bF9kb21haW4uYworKysgYi90b29scy9saWJ4bC9saWJ4bF9kb21haW4uYwpAQCAtNjM5LDYg
KzYzOSw1OCBAQCBpbnQgbGlieGxfX2RvbWFpbl91bnBhdXNlX2RlcHJlY2F0ZWQobGlieGxfX2dj
ICpnYywgbGlieGxfZG9taWQgZG9taWQpCiAgICAgcmV0dXJuIHJjOwogfQogCitzdGF0aWMgdm9p
ZCBkb21haW5fdW5wYXVzZV9kb25lKGxpYnhsX19lZ2MgKmVnYywKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgbGlieGxfX2RtX3Jlc3VtZV9zdGF0ZSAqLAorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBpbnQgcmMpOworCit2b2lkIGxpYnhsX19kb21haW5fdW5wYXVzZShs
aWJ4bF9fZWdjICplZ2MsCisgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9fZG1fcmVz
dW1lX3N0YXRlICpkbXJzKQoreworICAgIFNUQVRFX0FPX0dDKGRtcnMtPmFvKTsKKyAgICBpbnQg
cmMgPSAwOworCisgICAgLyogQ29udmVuaWVuY2UgYWxpYXNlcyAqLworICAgIGxpYnhsX2RvbWlk
IGRvbWlkID0gZG1ycy0+ZG9taWQ7CisKKyAgICBsaWJ4bF9kb21haW5fdHlwZSB0eXBlID0gbGli
eGxfX2RvbWFpbl90eXBlKGdjLCBkb21pZCk7CisgICAgaWYgKHR5cGUgPT0gTElCWExfRE9NQUlO
X1RZUEVfSU5WQUxJRCkgeworICAgICAgICByYyA9IEVSUk9SX0ZBSUw7CisgICAgICAgIGdvdG8g
b3V0OworICAgIH0KKworICAgIGlmICh0eXBlID09IExJQlhMX0RPTUFJTl9UWVBFX0hWTSkgewor
ICAgICAgICBkbXJzLT5kbV9yZXN1bWVkX2NhbGxiYWNrID0gZG9tYWluX3VucGF1c2VfZG9uZTsK
KyAgICAgICAgbGlieGxfX2RtX3Jlc3VtZShlZ2MsIGRtcnMpOyAvKiBtdXN0IGJlIGxhc3QgKi8K
KyAgICAgICAgcmV0dXJuOworICAgIH0KKyAgICByYyA9IDA7CitvdXQ6CisgICAgZG9tYWluX3Vu
cGF1c2VfZG9uZShlZ2MsIGRtcnMsIHJjKTsKK30KKworc3RhdGljIHZvaWQgZG9tYWluX3VucGF1
c2VfZG9uZShsaWJ4bF9fZWdjICplZ2MsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGxpYnhsX19kbV9yZXN1bWVfc3RhdGUgKmRtcnMsCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGludCByYykKK3sKKyAgICBFR0NfR0M7CisgICAgaW50IHI7CisKKyAgICAvKiBDb252
ZW5pZW5jZSBhbGlhc2VzICovCisgICAgbGlieGxfZG9taWQgZG9taWQgPSBkbXJzLT5kb21pZDsK
KworICAgIGlmIChyYykgZ290byBvdXQ7CisKKyAgICByID0geGNfZG9tYWluX3VucGF1c2UoQ1RY
LT54Y2gsIGRvbWlkKTsKKyAgICBpZiAociA8IDApIHsKKyAgICAgICAgTE9HRUQoRVJST1IsIGRv
bWlkLCAiVW5wYXVzaW5nIGRvbWFpbiIpOworICAgICAgICByYyA9IEVSUk9SX0ZBSUw7CisgICAg
ICAgIGdvdG8gb3V0OworICAgIH0KKyAgICByYyA9IDA7CitvdXQ6CisgICAgZG1ycy0+Y2FsbGJh
Y2soZWdjLCBkbXJzLCByYyk7Cit9CisKIGludCBsaWJ4bF9kb21haW5fdW5wYXVzZShsaWJ4bF9j
dHggKmN0eCwgdWludDMyX3QgZG9taWQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
bGlieGxfYXN5bmNvcF9ob3cgKmFvX2hvdykKIHsKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xp
YnhsX2ludGVybmFsLmggYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCmluZGV4IDZiYjZk
NmQyZTE2Ni4uYTBjYjZkMjg4NThmIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9pbnRl
cm5hbC5oCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKQEAgLTEzNTEsOSArMTM1
MSwxMCBAQCBzdHJ1Y3QgbGlieGxfX2RtX3Jlc3VtZV9zdGF0ZSB7CiAgICAgbGlieGxfZG9taWQg
ZG9taWQ7CiAgICAgdm9pZCAoKmNhbGxiYWNrKShsaWJ4bF9fZWdjICosIGxpYnhsX19kbV9yZXN1
bWVfc3RhdGUgKiwgaW50IHJjKTsKIAotICAgIC8qIHByaXZhdGUgdG8gbGlieGxfX2RvbWFpbl9y
ZXN1bWUgKi8KKyAgICAvKiBwcml2YXRlIHRvIGxpYnhsX19kb21haW5fcmVzdW1lIGFuZCBsaWJ4
bF9fZG9tYWluX3VucGF1c2UgKi8KICAgICB2b2lkICgqZG1fcmVzdW1lZF9jYWxsYmFjaykobGli
eGxfX2VnYyAqLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9fZG1fcmVz
dW1lX3N0YXRlICosIGludCByYyk7CisgICAgLyogcHJpdmF0ZSB0byBsaWJ4bF9fZG9tYWluX3Jl
c3VtZSAqLwogICAgIGJvb2wgc3VzcGVuZF9jYW5jZWw7CiAKICAgICAvKiBwcml2YXRlIHRvIGxp
YnhsX19kbV9yZXN1bWUgKi8KQEAgLTEzNjYsNiArMTM2Nyw4IEBAIF9oaWRkZW4gdm9pZCBsaWJ4
bF9fZG1fcmVzdW1lKGxpYnhsX19lZ2MgKmVnYywKIF9oaWRkZW4gdm9pZCBsaWJ4bF9fZG9tYWlu
X3Jlc3VtZShsaWJ4bF9fZWdjICplZ2MsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbGlieGxfX2RtX3Jlc3VtZV9zdGF0ZSAqZG1ycywKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBib29sIHN1c3BlbmRfY2FuY2VsKTsKK19oaWRkZW4gdm9pZCBsaWJ4bF9fZG9t
YWluX3VucGF1c2UobGlieGxfX2VnYyAqLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBsaWJ4bF9fZG1fcmVzdW1lX3N0YXRlICpkbXJzKTsKIAogLyogcmV0dXJucyAwIG9yIDEs
IG9yIGEgbGlieGwgZXJyb3IgY29kZSAqLwogX2hpZGRlbiBpbnQgbGlieGxfX2RvbWFpbl9wdmNv
bnRyb2xfYXZhaWxhYmxlKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkKTsKLS0gCkFudGhv
bnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
