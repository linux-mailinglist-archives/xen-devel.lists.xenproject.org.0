Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF05317A592
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 13:47:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9psw-0000AX-Dm; Thu, 05 Mar 2020 12:45:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5BTO=4W=amzn.com=prvs=326a7180f=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j9psv-0000AI-Fb
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 12:45:53 +0000
X-Inumbo-ID: 3d1927c6-5edf-11ea-b52f-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d1927c6-5edf-11ea-b52f-bc764e2007e4;
 Thu, 05 Mar 2020 12:45:48 +0000 (UTC)
IronPort-SDR: 3b3n3eUG1D8tuzjbvuVJMCoHAjoZu7ezOEAKNJvUTK7gGek8yIXD5anwqyyAx4lNox2rFllQME
 ig2NcsrXJfZg==
X-IronPort-AV: E=Sophos;i="5.70,518,1574121600"; d="scan'208";a="21060558"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 05 Mar 2020 12:45:47 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com (Postfix) with ESMTPS
 id 059D1A2568; Thu,  5 Mar 2020 12:45:44 +0000 (UTC)
Received: from EX13D32EUB003.ant.amazon.com (10.43.166.165) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 5 Mar 2020 12:45:19 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D32EUB003.ant.amazon.com (10.43.166.165) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Mar 2020 12:45:18 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 5 Mar 2020 12:45:15 +0000
From: <pdurrant@amzn.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 5 Mar 2020 12:45:00 +0000
Message-ID: <20200305124504.3564-3-pdurrant@amzn.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305124504.3564-1-pdurrant@amzn.com>
References: <20200305124504.3564-1-pdurrant@amzn.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 2/6] x86 / p2m: remove page_list check in
 p2m_alloc_table
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgoKVGhlcmUgZG9lcyBub3Qg
c2VlbSB0byBiZSBhbnkganVzdGlmaWNhdGlvbiBmb3IgcmVmdXNpbmcgdG8gY3JlYXRlIHRoZQpk
b21haW4ncyBwMm0gdGFibGUgc2ltcGx5IGJlY2F1c2UgaXQgbWF5IGhhdmUgYXNzaWduZWQgcGFn
ZXMuIFBhcnRpY3VsYXJseQppdCBwcmV2ZW50cyB0aGUgcHJpb3IgYWxsb2NhdGlvbiBvZiBQR0Nf
ZXh0cmEgcGFnZXMuCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpv
bi5jb20+Ci0tLQpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEdlb3JnZSBEdW5sYXAgPGdl
b3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNjOiAiUm9n
ZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKdjI6CiAtIE5ldyBpbiB2Mgot
LS0KIHhlbi9hcmNoL3g4Ni9tbS9wMm0uYyB8IDggLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYyBiL3hlbi9h
cmNoL3g4Ni9tbS9wMm0uYwppbmRleCAzNzE5ZGVhZTc3Li45ZmQ0YjExNWJlIDEwMDY0NAotLS0g
YS94ZW4vYXJjaC94ODYvbW0vcDJtLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCkBAIC02
OTUsMTQgKzY5NSw2IEBAIGludCBwMm1fYWxsb2NfdGFibGUoc3RydWN0IHAybV9kb21haW4gKnAy
bSkKIAogICAgIHAybV9sb2NrKHAybSk7CiAKLSAgICBpZiAoIHAybV9pc19ob3N0cDJtKHAybSkK
LSAgICAgICAgICYmICFwYWdlX2xpc3RfZW1wdHkoJmQtPnBhZ2VfbGlzdCkgKQotICAgIHsKLSAg
ICAgICAgUDJNX0VSUk9SKCJkb20gJWQgYWxyZWFkeSBoYXMgbWVtb3J5IGFsbG9jYXRlZFxuIiwg
ZC0+ZG9tYWluX2lkKTsKLSAgICAgICAgcDJtX3VubG9jayhwMm0pOwotICAgICAgICByZXR1cm4g
LUVJTlZBTDsKLSAgICB9Ci0KICAgICBpZiAoIHBhZ2V0YWJsZV9nZXRfcGZuKHAybV9nZXRfcGFn
ZXRhYmxlKHAybSkpICE9IDAgKQogICAgIHsKICAgICAgICAgUDJNX0VSUk9SKCJwMm0gYWxyZWFk
eSBhbGxvY2F0ZWQgZm9yIHRoaXMgZG9tYWluXG4iKTsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
