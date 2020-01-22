Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A2F145EA7
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 23:34:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuOWl-0001HT-Gt; Wed, 22 Jan 2020 22:31:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ac9L=3L=amazon.com=prvs=2839ba572=elnikety@srs-us1.protection.inumbo.net>)
 id 1iuOWk-0001HO-G8
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 22:31:10 +0000
X-Inumbo-ID: e3853e28-3d66-11ea-bd76-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3853e28-3d66-11ea-bd76-12813bfff9fa;
 Wed, 22 Jan 2020 22:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579732271; x=1611268271;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=xUMhbhziUmqV6hKmdOGDbUUR7CRPaThJEjSKS64dYSc=;
 b=v7qaQo0svDRnIHjWxmQMSn75hALEy/ci/aLeHvznMmS9EDplbvPI/ila
 gDJn+c9ELhAozlWvM1bA6gloh72DAW3EyrSiVk1MsaSgZnoEviPDJkzw8
 K0tWC7Uu/2uyBQPmoJ6rGuEJ8ztuKjyzT0HrLyG44GAfhsJtbbFA62LRs o=;
IronPort-SDR: etZ0XOmsK3R3QIJUzxISyABS77u/853P/Tvcck8vkmB8peng2B0iWr+NOYdTGKtfaUMlBcuOUE
 2ehswjrS2png==
X-IronPort-AV: E=Sophos;i="5.70,351,1574121600"; d="scan'208";a="13763715"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-baacba05.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 22 Jan 2020 22:31:09 +0000
Received: from EX13MTAUEB002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-baacba05.us-west-2.amazon.com (Postfix) with ESMTPS
 id 4CC81A23A5; Wed, 22 Jan 2020 22:31:08 +0000 (UTC)
Received: from EX13D08UEB003.ant.amazon.com (10.43.60.11) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 22 Jan 2020 22:31:07 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D08UEB003.ant.amazon.com (10.43.60.11) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 22 Jan 2020 22:31:07 +0000
Received: from dev-dsk-elnikety-1b-cd63f796.eu-west-1.amazon.com (10.15.63.96)
 by mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Wed, 22 Jan 2020 22:31:06 +0000
Received: by dev-dsk-elnikety-1b-cd63f796.eu-west-1.amazon.com (Postfix,
 from userid 6438462)
 id 50466A013F; Wed, 22 Jan 2020 22:31:06 +0000 (UTC)
From: Eslam Elnikety <elnikety@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 22 Jan 2020 22:30:42 +0000
Message-ID: <cover.1579727989.git.elnikety@amazon.com>
X-Mailer: git-send-email 2.16.6
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v1 0/4] x86/microcode: Improve documentation and
 code
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Eslam
 Elnikety <elnikety@amazon.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyBpbXByb3ZlbWVudHMgdG8gdGhlIGV4aXN0aW5n
IGRvY3VtZW50YXRpb24KYW5kIGNvZGUgb2YgeDg2L21pY3JvY29kZS4gUGF0Y2hlcyAxIGFuZCAy
IGltcHJvdmUgdGhlIGRvY3VtZW50YXRpb24gYW5kCnBhcnNpbmcgZm9yIGB1Y29kZT1gLiBQYXRj
aGVzIDMgYW5kIDQgaW50cm9kdWNlIG5pdHMvaW1wcm92ZW1lbnRzIHRvIHRoZQptaWNyb2NvZGUg
ZWFybHkgbG9hZGluZyBjb2RlLgoKU29tZSAodmFyaWFudCBvZiB0aGUpIHBhdGNoZXMgaGF2ZSBi
ZWVuIHNlbnQgZWFybGllciB1bmRlciAiU3VwcG9ydCBidWlsdGluIENQVQptaWNyb2NvZGUiIGFz
IHRob3NlIHBhdGNoZXMgd2VyZSBtb3RpdmF0ZWQgYnkgZGlzY3Vzc2lvbnMgZm9sbG93aW5nIHRo
ZSBpbml0aWFsCnN1Ym1pc3Npb24gb2YgdGhlIGJ1aWx0aW4gbWljcm9jb2RlLiBPbiBhIHNlY29u
ZCB0aG91Z2h0LCBzdWNoIGltcHJvdmVtZW50cwpzaG91bGQgaGF2ZSBnb25lIGluZGVwZW5kZW50
bHkuIFNvIGhlcmUgaXQgZ29lcy4gKFRob3NlIGltcHJvdmVtZW50cyB3aWxsIGJlCmRyb3BwZWQg
ZnJvbSB0aGUgYnVpbHRpbiBtaWNyb2NvZGUgc2VyaWVzIGFzIEkgc3VibWl0IGl0cyB2MykuCgpD
aGFuZ2VzIHNpbmNlIHN1Ym1pdHRlZCB1bmRlciBbdjJdIHg4Ni9taWNyb2NvZGU6IFN1cHBvcnQg
YnVpbHRpbiBDUFUgbWljcm9jb2RlCi0gUGF0Y2ggMTogTmV3IC8gZXhwbGljaXRseSBkb2N1bWVu
dCB0aGUgY3VycmVudCBiZWhhdmlvdXIgb2YgdWNvZGU9c2NhbiB3aXRoIEVGSQotIFBhdGNoIDI6
IEZpeCBpbmRleCBkYXRhIHR5cGUsIGRyb3AgdW53ZWxjb21lZCBmdW5jdGlvbiByZW5hbWUKLSBQ
YXRjaCAzIGFuZCA0OiBBZGRlZCBBY2tlZC1ieSwgb3RoZXJ3aXNlIGFzIGJlZm9yZQoKRXNsYW0g
RWxuaWtldHkgKDQpOgogIHg4Ni9taWNyb2NvZGU6IEltcHJvdmUgZG9jdW1lbnRhdGlvbiBmb3Ig
dWNvZGU9CiAgeDg2L21pY3JvY29kZTogSW1wcm92ZSBwYXJzaW5nIGZvciB1Y29kZT0KICB4ODYv
bWljcm9jb2RlOiBhdm9pZCB1bm5lY2Vzc2FyeSB4bWFsbG9jL21lbWNweSBvZiB1Y29kZSBkYXRh
CiAgeDg2L21pY3JvY29kZTogdXNlIGNvbnN0IHF1YWxpZmllciBmb3IgbWljcm9jb2RlIGJ1ZmZl
cgoKIGRvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyB8IDE0ICsrKystLQogeGVuL2Fy
Y2gveDg2L21pY3JvY29kZS5jICAgICAgICAgIHwgNzQgKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCA1MSBkZWxldGlvbnMo
LSkKCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
