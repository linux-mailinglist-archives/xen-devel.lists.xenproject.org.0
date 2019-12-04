Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0730B113097
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 18:15:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icYCC-0003v5-UT; Wed, 04 Dec 2019 17:12:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pQYo=Z2=amazon.com=prvs=234ed30ac=hongyxia@srs-us1.protection.inumbo.net>)
 id 1icYCB-0003ul-DM
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 17:12:11 +0000
X-Inumbo-ID: 32eda435-16b9-11ea-8206-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 32eda435-16b9-11ea-8206-12813bfff9fa;
 Wed, 04 Dec 2019 17:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575479528; x=1607015528;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=F69oeC+I9o1RId2wDCynxVHw6va1gbdhZMOXkbHEQXc=;
 b=gdrIYU0MRwWImlZP0mDtaBJQspwjQlluPb+Hk8UWW3KotRWtBCo8HOEO
 IkKitJ/mtvZnonmq+m3X0O7vVhxPR6aSiY3UDosUQOh9PXsfEY70xyiwC
 Tw/KMhWbjieZQkEV3h5s5kXJwxUJuTel5Rg1DOy5Er0uDYBkIt708nw1G M=;
IronPort-SDR: GLZrgAaMXineJli8k1OwRGLftS2rArBHcOoyiEmudbD0xJpRp7HrZekxUy7xMra/JGRpWJmU5Q
 4DNy8YoAqlng==
X-IronPort-AV: E=Sophos;i="5.69,277,1571702400"; d="scan'208";a="11630523"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 04 Dec 2019 17:11:06 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com (Postfix) with ESMTPS
 id 824F7C2969; Wed,  4 Dec 2019 17:11:05 +0000 (UTC)
Received: from EX13D06UWA004.ant.amazon.com (10.43.160.164) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 17:11:05 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D06UWA004.ant.amazon.com (10.43.160.164) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 17:11:04 +0000
Received: from u60d575063b1f53.ant.amazon.com (10.125.106.64) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 4 Dec 2019 17:11:04 +0000
From: Hongyan Xia <hongyxia@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 4 Dec 2019 17:10:53 +0000
Message-ID: <a2812cb872ce70312fa26cb11ab950e1674c58b8.1575477921.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1575477921.git.hongyxia@amazon.com>
References: <cover.1575477921.git.hongyxia@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v4 1/9] x86: move some xen mm function
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
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
L2FzbS14ODYvbW0uaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAppbmRleCAzMjBjNmNkMTk2
Li45ZDJiODMzNTc5IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKKysrIGIv
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
bnQgZmxhZ3MpCiB7Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
