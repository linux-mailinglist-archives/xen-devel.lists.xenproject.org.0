Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E6F109DF2
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 13:28:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZZuQ-0004Uw-0m; Tue, 26 Nov 2019 12:25:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XQNV=ZS=amazon.de=prvs=226749d31=wipawel@srs-us1.protection.inumbo.net>)
 id 1iZZuP-0004Ur-2b
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 12:25:33 +0000
X-Inumbo-ID: d6bd669e-1047-11ea-9db0-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6bd669e-1047-11ea-9db0-bc764e2007e4;
 Tue, 26 Nov 2019 12:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1574771133; x=1606307133;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=VgUH1ERZ/ftwsq9cIecciJKoBLsLE3AEV/qb1c7b1NU=;
 b=PSyzcAGZlZB62Gnev8RnsJAiPeBdZJuKFlwdz4tiZjF2Uj9OZc8iy549
 JGPIJcNcR9Rq38nGlBjXeT1FCnO9ntFwHYZ/3FJQQga424kEJuMjjbiDt
 e0QwESJrPZvbBQdqFn3vrYQyd5abVL0gzl9Wr2nhUUHtTQZXBnRrQsJ8K M=;
IronPort-SDR: WDXA7GpefCC/WIZZlTX+hmi4pZflAJn8MM2XcNzxesaiRPUQHhZMeHXIOiK6zamIQ9ZKxe3Szk
 Nfo71EmO783g==
X-IronPort-AV: E=Sophos;i="5.69,245,1571702400"; 
   d="scan'208";a="9942791"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 26 Nov 2019 12:25:21 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com (Postfix) with ESMTPS
 id ED80EA2507; Tue, 26 Nov 2019 12:25:20 +0000 (UTC)
Received: from EX13D03EUA003.ant.amazon.com (10.43.165.89) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 12:25:20 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D03EUA003.ant.amazon.com (10.43.165.89) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 12:25:19 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Tue, 26 Nov 2019 12:25:17 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 26 Nov 2019 12:25:04 +0000
Message-ID: <20191126122511.7409-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 0/7] livepatch-build-tools: new features and
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
Cc: Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, mpohlack@amazon.com, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>
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
bSBob3RwYXRjaCBtb2R1bGVzCgogY29tbW9uLmggICAgICAgICAgICAgfCAxMyArKysrKystCiBj
cmVhdGUtZGlmZi1vYmplY3QuYyB8IDgyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0KIGxpdmVwYXRjaC1idWlsZCAgICAgIHwgOTggKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogMyBmaWxlcyBjaGFuZ2VkLCAxNzcg
aW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgotLSAKMi4xNi41CgoKCgpBbWF6b24gRGV2
ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4K
R2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoCkVp
bmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMg
QgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
