Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6D8B396C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 13:33:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9pDz-0002wr-4o; Mon, 16 Sep 2019 11:31:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GGTU=XL=amazon.de=prvs=1553567f6=wipawel@srs-us1.protection.inumbo.net>)
 id 1i9pDw-0002we-QB
 for xen-devel@lists.xen.org; Mon, 16 Sep 2019 11:31:16 +0000
X-Inumbo-ID: 7ed36303-d875-11e9-95e0-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ed36303-d875-11e9-95e0-12813bfff9fa;
 Mon, 16 Sep 2019 11:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1568633475; x=1600169475;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=BJ3llmNExx4LGrtqBAjidOvKBIgGwrzONaJDbG/QghM=;
 b=FhYo1F7TMBNjqPY7AeRCRWpxF/ypVUzS+WMkPWbJkwJLIPC33kdzFkNv
 twv3YzYSEF4BS1V8NGZTUC1j/+wRDkFqBpLiRME4H33+GSeraWq1WsbDJ
 6wTtcwsgjiKct8CohX7CCaGJl7gEDvsTE9MR8Y4qYJpTD5jygwswhEooI Y=;
X-IronPort-AV: E=Sophos;i="5.64,512,1559520000"; d="scan'208";a="421366255"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 16 Sep 2019 11:31:15 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (Postfix) with ESMTPS
 id CBFB6A06F2; Mon, 16 Sep 2019 11:31:12 +0000 (UTC)
Received: from EX13D05EUC004.ant.amazon.com (10.43.164.38) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Sep 2019 11:31:12 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D05EUC004.ant.amazon.com (10.43.164.38) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Sep 2019 11:31:10 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Mon, 16 Sep 2019 11:31:07 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>, <xen-devel@lists.xenproject.org>
Date: Mon, 16 Sep 2019 11:30:49 +0000
Message-ID: <20190916113056.16592-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 0/7] livepatch-build-tools: new features and
 fixes
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzZXJpZXMgaW50cm9kdWNlcyBuZXcgZmVhdHVyZXMgdG8gdGhlIGxpdmVwYXRjaCBmdW5j
dGlvbmFsaXR5IGFzCmJyaWVmbHkgZGlzY3Vzc2VkIGR1cmluZyBYZW4gRGV2ZWxvcGVyIFN1bW1p
dCAyMDE5OiBbYV0gYW5kIFtiXS4KSXQgYWxzbyBwcm92aWRlcyBhIGZldyBmaXhlcyBhbmQgc29t
ZSBzbWFsbCBpbXByb3ZlbWVudHMuCgpJTVBST1ZFTUVOVFM6CgoxLiBTdHJpcCByZWR1bmRhbnQg
b3IgdHJhbnNpZW50IHN5bWJvbHMgZnJvbSByZXN1bHRpbmcgb2JqZWN0IGZpbGVzOgogICBbNl0s
IFs3XQoKICBUaGlzIGNoYW5nZSBsaW1pdHMgdGhlIHNpemUgb2YgcmVzdWx0aW5nIG1vZHVsZXMg
YnkgZHJvcHBpbmcgdW5uZWVkZWQKICBiaXRzLgoKRkVBVFVSRVM6CgpGb3IgZGV0YWlscyBzZWUg
Y292ZXIgbGV0dGVyIG9mIHhlbiBzZXJpZXM6IFtjXQoKMS4gaW5kZXBlbmRlbnQgbW9kdWxlcyAo
cGF0Y2hlczogWzFdKQoyLiBwcmUtIGFuZCBwb3N0LSBhcHBseXxyZXZlcnQgYWN0aW9ucyBob29r
cyAocGF0Y2hlczogWzJdKQozLiBhcHBseXxyZXZlcnQgYWN0aW9ucyByZXBsYWNlbWVudCBob29r
cyAocGF0Y2hlczogWzNdLCBbNF0pCjQuIGlubGluZSBhc20gaG90cGF0Y2hpbmcgZXhwZWN0YXRp
b25zIChwYXRjaGVzOiBbNV0pCgoKW2FdIGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtp
L0Rlc2lnbl9TZXNzaW9uc18yMDE5I0xpdmVQYXRjaF9pbXByb3ZlbWVudHNfYW5kX2ZlYXR1cmVz
CltiXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVs
LzIwMTktMDcvbXNnMDA4NDYuaHRtbAoKW2NdIFtQQVRDSCAwMC8xNF0gbGl2ZXBhdGNoOiBuZXcg
ZmVhdHVyZXMgYW5kIGZpeGVzCgpNZXJnZWQgaW4gdjE6CiAgbGl2ZXBhdGNoLWdjYzogQWxsb3cg
dG9vbGNoYWluIGNvbW1hbmQgd2l0aCB2ZXJzaW9ucwogIGxpdmVwYXRjaC1nY2M6IElnbm9yZSBi
dWlsdF9pbi5vIGFuZCBwcmVsaW5rLm8gb2JqZWN0IGZpbGVzCiAgbGl2ZXBhdGNoLWJ1aWxkOiBE
byBub3QgZm9sbG93IGV2ZXJ5IHN5bWxpbmsgZm9yIHBhdGNoIGZpbGUKICBsaXZlcGF0Y2gtYnVp
bGQ6IEhhbmRsZSBuZXdseSBjcmVhdGVkIG9iamVjdCBmaWxlcwogIGNvbW1vbjogQWRkIGlzX3N0
YW5kYXJkX3NlY3Rpb24oKSBoZWxwZXIgZnVuY3Rpb24KICBjb21tb246IEFkZCBpc19yZWZlcmVu
Y2VkX3NlY3Rpb24oKSBoZWxwZXIgZnVuY3Rpb24KICBjcmVhdGUtZGlmZi1vYmplY3Q6IEFkZCBp
c19zcGVjaWFsX3NlY3Rpb24oKSBoZWxwZXIgZnVuY3Rpb24KICBsaXZlcGF0Y2gtYnVpbGQ6IGRl
dGVjdCBzcGVjaWFsIHNlY3Rpb24gZ3JvdXAgc2l6ZXMKICBjcmVhdGUtZGlmZi1vYmplY3Q6IEFk
ZCBuZXcgZW50cmllcyB0byBzcGVjaWFsIHNlY3Rpb25zIGFycmF5CiAgY3JlYXRlLWRpZmYtb2Jq
ZWN0OiBEbyBub3QgaW5jbHVkZSBhbGwgLnJvZGF0YSBzZWN0aW9ucwogIGNyZWF0ZS1kaWZmLW9i
amVjdDogRG8gbm90IGNyZWF0ZSBlbXB0eSAubGl2ZXBhdGNoLmZ1bmNzIHNlY3Rpb24KICBjcmVh
dGUtZGlmZi1vYmplY3Q6IEV4dGVuZCBwYXRjaGFiaWxpdHkgdmVyaWZpY2F0aW9uOiBTVE5fVU5E
RUYKICBjcmVhdGUtZGlmZi1vYmplY3Q6IFN0cmlwIGFsbCB1bmRlZmluZWQgZW50aXJlcyBvZiBr
bm93biBzaXplCgpQYXdlbCBXaWVjem9ya2lld2ljeiAoNyk6CiAgWzFdIGxpdmVwYXRjaC1idWls
ZDogRW1iZWQgaHlwZXJ2aXNvciBidWlsZCBpZCBpbnRvIGV2ZXJ5IGhvdHBhdGNoCiAgWzJdIGNy
ZWF0ZS1kaWZmLW9iamVjdDogSGFuZGxlIGV4dHJhIHByZS18cG9zdC0gaG9va3MKICBbM10gY3Jl
YXRlLWRpZmYtb2JqZWN0OiBIYW5kbGUgb3B0aW9uYWwgYXBwbHl8cmV2ZXJ0IGhvb2tzCiAgWzRd
IGNyZWF0ZS1kaWZmLW9iamVjdDogQWRkIHN1cHBvcnQgZm9yIGFwcGxpZWQvcmV2ZXJ0ZWQgbWFy
a2VyCiAgWzVdIGNyZWF0ZS1kaWZmLW9iamVjdDogQWRkIHN1cHBvcnQgZm9yIGV4cGVjdGF0aW9u
cwogIFs2XSBsaXZlcGF0Y2gtYnVpbGQ6IFN0cmlwIHRyYW5zaWVudCBvciB1bm5lZWRlZCBzeW1i
b2xzCiAgWzddIGxpdmVwYXRjaC1idWlsZDogU3RyaXAgYWxsIG1ldGFkYXRhIHN5bWJvbHMgZnJv
bSBob3RwYXRjaCBtb2R1bGVzCgogY29tbW9uLmggICAgICAgICAgICAgfCAxMyArKysrKysrLQog
Y3JlYXRlLWRpZmYtb2JqZWN0LmMgfCA4MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tCiBsaXZlcGF0Y2gtYnVpbGQgICAgICB8IDkyICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIDMgZmlsZXMgY2hhbmdlZCwg
MTcxIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKLS0gCjIuMTYuNQoKCgoKQW1hem9u
IERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVy
bGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmlj
aApFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5
MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
