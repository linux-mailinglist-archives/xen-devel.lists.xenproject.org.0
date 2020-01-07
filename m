Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 853D81325A8
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 13:08:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iondV-0004rt-A4; Tue, 07 Jan 2020 12:07:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tB6F=24=amazon.com=prvs=2686fb3d9=hongyxia@srs-us1.protection.inumbo.net>)
 id 1iondT-0004rk-Mr
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 12:06:59 +0000
X-Inumbo-ID: 35023b34-3146-11ea-bf56-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35023b34-3146-11ea-bf56-bc764e2007e4;
 Tue, 07 Jan 2020 12:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578398819; x=1609934819;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=vzVo7Pkr115VO+uvn/aEK7YoYU1WoiSKCmOi6chFnk0=;
 b=MhcGEegg4tzLSFp2dGBQ08A74742HBaiX3HbP45fEd4JLk6vjXPgxT5C
 GDoA2yGLiIH5ldFv7lbhgNOeYp/gSTR5o2FZ8eO364bAoKjRkMn/RSsqs
 LB1RvN5yYC8/gQeS5qCRLylsELG52OhoCFuNWNL+aB8+9s1YJEQ63vkSS g=;
IronPort-SDR: ATeL8JZmdWP11cueDdpP047DUpkXCkgw3dM8Ni9yTZGFsTArhm976+dOJMW26/ylL1vCF1OwVj
 kWWs9XpTv09g==
X-IronPort-AV: E=Sophos;i="5.69,406,1571702400"; d="scan'208";a="11237503"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-9ec21598.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 07 Jan 2020 12:06:59 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-9ec21598.us-east-1.amazon.com (Postfix) with ESMTPS
 id 3A1D5A1BEA; Tue,  7 Jan 2020 12:06:56 +0000 (UTC)
Received: from EX13D37EUA002.ant.amazon.com (10.43.165.200) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 12:06:56 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D37EUA002.ant.amazon.com (10.43.165.200) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 12:06:55 +0000
Received: from u0b3720fa96e858.ant.amazon.com (10.125.106.133) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 7 Jan 2020 12:06:52 +0000
From: Hongyan Xia <hongyxia@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 7 Jan 2020 12:06:43 +0000
Message-ID: <3b373c553a15dfdcd26c21e4f39c30404c7c2fa9.1578397252.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578397252.git.hongyxia@amazon.com>
References: <cover.1578397252.git.hongyxia@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v5 1/7] x86: move some xen mm function
 declarations
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wei.liu2@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, jgrall@amazon.com,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClRoZXkgd2VyZSBwdXQgaW50byBw
YWdlLmggYnV0IG1tLmggaXMgbW9yZSBhcHByb3ByaWF0ZS4KClRoZSByZWFsIHJlYXNvbiBpcyB0
aGF0IEkgd2lsbCBiZSBhZGRpbmcgc29tZSBuZXcgZnVuY3Rpb25zIHdoaWNoCnRha2VzIG1mbl90
LiBJdCB0dXJucyBvdXQgaXQgaXMgYSBiaXQgZGlmZmljdWx0IHRvIGRvIGluIHBhZ2UuaC4KCk5v
IGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLQpD
aGFuZ2VkIHNpbmNlIHYzOgotIG1vdmUgWGVuIFBURSBBUEkgZGVjbGFyYXRpb25zIG5leHQgdG8g
ZG9fcGFnZV93YWxrKCkuCi0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oICAgfCA1ICsrKysr
CiB4ZW4vaW5jbHVkZS9hc20teDg2L3BhZ2UuaCB8IDUgLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L2FzbS14ODYvbW0uaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAppbmRleCAxNDc5YmE2NzAz
Li4yY2E4ODgyYWQwIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKKysrIGIv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oCkBAIC01NzksNiArNTc5LDExIEBAIHZvaWQgdXBkYXRl
X2NyMyhzdHJ1Y3QgdmNwdSAqdik7CiBpbnQgdmNwdV9kZXN0cm95X3BhZ2V0YWJsZXMoc3RydWN0
IHZjcHUgKik7CiB2b2lkICpkb19wYWdlX3dhbGsoc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGxv
bmcgYWRkcik7CiAKKy8qIEFsbG9jYXRvciBmdW5jdGlvbnMgZm9yIFhlbiBwYWdldGFibGVzLiAq
Lwordm9pZCAqYWxsb2NfeGVuX3BhZ2V0YWJsZSh2b2lkKTsKK3ZvaWQgZnJlZV94ZW5fcGFnZXRh
YmxlKHZvaWQgKnYpOworbDFfcGdlbnRyeV90ICp2aXJ0X3RvX3hlbl9sMWUodW5zaWduZWQgbG9u
ZyB2KTsKKwogaW50IF9fc3luY19sb2NhbF9leGVjc3RhdGUodm9pZCk7CiAKIC8qIEFyY2gtc3Bl
Y2lmaWMgcG9ydGlvbiBvZiBtZW1vcnlfb3AgaHlwZXJjYWxsLiAqLwpkaWZmIC0tZ2l0IGEveGVu
L2luY2x1ZGUvYXNtLXg4Ni9wYWdlLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L3BhZ2UuaAppbmRl
eCBjMWU5MjkzN2MwLi4wNWE4YjFlZmE2IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2
L3BhZ2UuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3BhZ2UuaApAQCAtMzQ1LDExICszNDUs
NiBAQCB2b2lkIGVmaV91cGRhdGVfbDRfcGd0YWJsZSh1bnNpZ25lZCBpbnQgbDRpZHgsIGw0X3Bn
ZW50cnlfdCk7CiAKICNpZm5kZWYgX19BU1NFTUJMWV9fCiAKLS8qIEFsbG9jYXRvciBmdW5jdGlv
bnMgZm9yIFhlbiBwYWdldGFibGVzLiAqLwotdm9pZCAqYWxsb2NfeGVuX3BhZ2V0YWJsZSh2b2lk
KTsKLXZvaWQgZnJlZV94ZW5fcGFnZXRhYmxlKHZvaWQgKnYpOwotbDFfcGdlbnRyeV90ICp2aXJ0
X3RvX3hlbl9sMWUodW5zaWduZWQgbG9uZyB2KTsKLQogLyogQ29udmVydCBiZXR3ZWVuIFBBVC9Q
Q0QvUFdUIGVtYmVkZGVkIGluIFBURSBmbGFncyBhbmQgMy1iaXQgY2FjaGVhdHRyLiAqLwogc3Rh
dGljIGlubGluZSB1bnNpZ25lZCBpbnQgcHRlX2ZsYWdzX3RvX2NhY2hlYXR0cih1bnNpZ25lZCBp
bnQgZmxhZ3MpCiB7Ci0tIAoyLjE1LjMuQU1aTgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
