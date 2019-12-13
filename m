Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 112C011E71E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 16:53:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifnER-0005Qn-Vy; Fri, 13 Dec 2019 15:51:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8pyZ=2D=amazon.com=prvs=24328bf02=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ifnEQ-0005Qf-GA
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 15:51:54 +0000
X-Inumbo-ID: 7c1f4cee-1dc0-11ea-88e7-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c1f4cee-1dc0-11ea-88e7-bc764e2007e4;
 Fri, 13 Dec 2019 15:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576252314; x=1607788314;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yJcquBl3qgjy9JF7h1fzXlWgWBuPd41njEBIXiYE9VM=;
 b=jGtc6iBoMzapzuesx/2pZBxXqSDh1Qv5FxoJhCSHI/OSIwOu+WJxr5Nn
 8oLSJ2/AxkJK559lps/8NnLZFToIbkGqzMR5iP3MXfCN/msV2JeCyQTUm
 i8H4aTH7ozHH+9VYF3YgMBWqB1hAxtSmf+WzJh/M3CNNpNyw1lk1+C6pl o=;
IronPort-SDR: dk8M0okXTqrvKaOzPYge+IluIhuUw3hcx2YRzLa7k0e51ZbXcmhg8vmkX4Pyt0rdqfow2Qe8rX
 AnTmi25G4Yyw==
X-IronPort-AV: E=Sophos;i="5.69,309,1571702400"; 
   d="scan'208";a="8449933"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 13 Dec 2019 15:51:53 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 0270A282065; Fri, 13 Dec 2019 15:51:52 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Dec 2019 15:51:52 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Dec 2019 15:51:51 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 13 Dec 2019 15:51:50 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 13 Dec 2019 15:51:45 +0000
Message-ID: <20191213155145.31945-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2] public/io/netif.h: document a mechanism to
 advertise carrier state
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Paul Durrant <pdurrant@amazon.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBhZGRzIGEgc3BlY2lmaWNhdGlvbiBmb3IgYSAnY2Fycmllcicgbm9kZSBpbiB4
ZW5zdG9yZSB0byBhbGxvdwphIGJhY2tlbmQgdG8gbm90aWZ5IGEgZnJvbnRlbmQgb2YgaXQncyB2
aXJ0dWFsIGNhcnJpZXIvbGluayBzdGF0ZS4gRS5nLgphIGJhY2tlbmQgdGhhdCBpcyB1bmFibGUg
dG8gZm9yd2FyZCBwYWNrZXRzIGZyb20gdGhlIGd1ZXN0IGJlY2F1c2UgaXQgaXMKbm90IGF0dGFj
aGVkIHRvIGEgYnJpZGdlIG1heSB3aXNoIHRvIGFkdmVydGlzZSAnbm8gY2FycmllcicuCgpXaGls
ZSBpbiB0aGUgYXJlYSBhbHNvIGZpeCBhbiBlcnJvbmVvdXMgYmFja2VuZCBwYXRoIGRlc2NyaXB0
aW9uLgoKTk9URTogVGhpcyBpcyBwdXJlbHkgYSBkb2N1bWVudGF0aW9uIHBhdGNoLiBObyBmdW5j
dGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1h
em9uLmNvbT4KLS0tCkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNs
ZS5jb20+CkNjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cgp2MjoKIC0gRml4IHRl
eHQKIC0gRml4IHBhdGgKLS0tCiB4ZW4vaW5jbHVkZS9wdWJsaWMvaW8vbmV0aWYuaCB8IDE2ICsr
KysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL2lvL25ldGlmLmggYi94ZW4v
aW5jbHVkZS9wdWJsaWMvaW8vbmV0aWYuaAppbmRleCAyNDU0NDQ4YmFhLi41MmRkMjA4N2NkIDEw
MDY0NAotLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvaW8vbmV0aWYuaAorKysgYi94ZW4vaW5jbHVk
ZS9wdWJsaWMvaW8vbmV0aWYuaApAQCAtMTcxLDcgKzE3MSw3IEBACiAgKiBUaGUgYWJpbGl0eSBv
ZiB0aGUgYmFja2VuZCB0byB1c2UgYSBjb250cm9sIHJpbmcgaXMgYWR2ZXJ0aXNlZCBieQogICog
c2V0dGluZzoKICAqCi0gKiAvbG9jYWwvZG9tYWluL1gvYmFja2VuZC88ZG9taWQ+Lzx2aWY+L2Zl
YXR1cmUtY3RybC1yaW5nID0gIjEiCisgKiAvbG9jYWwvZG9tYWluL1gvYmFja2VuZC92aWYvPGRv
bWlkPi88dmlmPi9mZWF0dXJlLWN0cmwtcmluZyA9ICIxIgogICoKICAqIFRoZSBmcm9udGVuZCBw
cm92aWRlcyBhIGNvbnRyb2wgcmluZyB0byB0aGUgYmFja2VuZCBieSBzZXR0aW5nOgogICoKQEAg
LTE5MCw2ICsxOTAsMjAgQEAKICAqIG9yZGVyIGFzIHJlcXVlc3RzLgogICovCiAKKy8qCisgKiBM
aW5rIHN0YXRlCisgKiA9PT09PT09PT09CisgKgorICogVGhlIGJhY2tlbmQgY2FuIGFkdmVydGlz
ZSBpdHMgY3VycmVudCBsaW5rIChjYXJyaWVyKSBzdGF0ZSB0byB0aGUKKyAqIGZyb250ZW5kIHVz
aW5nIHRoZSAvbG9jYWwvZG9tYWluL1gvYmFja2VuZC92aWYvPGRvbWlkPi88dmlmPi9jYXJyaWVy
CisgKiBub2RlLiBJZiB0aGlzIG5vZGUgaXMgbm90IHByZXNlbnQsIHRoZW4gdGhlIGZyb250ZW5k
IHNob3VsZCBhc3N1bWUgdGhhdAorICogdGhlIGxpbmsgaXMgdXAgKGZvciBjb21wYXRpYmlsaXR5
IHdpdGggYmFja2VuZHMgdGhhdCBkbyBubyBpbXBsZW1lbnQKKyAqIHRoaXMgZmVhdHVyZSkuIElm
IHRoaXMgbm9kZSBpcyBwcmVzZW50LCB0aGVuIGEgdmFsdWUgb2YgIjAiIHNob3VsZCBiZQorICog
aW50ZXJwcmV0ZWQgYnkgdGhlIGZyb250ZW5kIGFzIHRoZSBsaW5rIGJlaW5nIGRvd24gKG5vIGNh
cnJpZXIpIGFuZCBhCisgKiB2YWx1ZSBvZiAiMSIgc2hvdWxkIGJlIGludGVycHJldGVkIGFzIHRo
ZSBsaW5rIGJlaW5nIHVwIChjYXJyaWVyCisgKiBwcmVzZW50KS4KKyAqLworCiAvKgogICogSGFz
aCB0eXBlcwogICogPT09PT09PT09PQotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
