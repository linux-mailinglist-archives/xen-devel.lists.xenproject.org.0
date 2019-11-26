Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB9010A1C4
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 17:17:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZdV0-0004QC-Cd; Tue, 26 Nov 2019 16:15:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rbp+=ZS=amazon.com=prvs=2260bea18=sjpark@srs-us1.protection.inumbo.net>)
 id 1iZctP-0008I0-Bm
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 15:36:43 +0000
X-Inumbo-ID: 8bb8734e-1062-11ea-a55d-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8bb8734e-1062-11ea-a55d-bc764e2007e4;
 Tue, 26 Nov 2019 15:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574782604; x=1606318604;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=W6LVx4gxON2oRR7lI5LBc6xbhhFYl7QITbdcuRcSicE=;
 b=slx+mdOh+P6Yvc9poXPuAGR+rFAzdHWYLSepakHlExeXc89Up5DouC63
 h2fIXy5x1aFKXkrxA78UNPsZsQ0vHVlR/A6XwWLhdyclJgZ0yL9Lw82j4
 0a4RwfohLU+rffN4zohVVr+HGqKnVKdaGIYEZPk5xXWxHiQfociJuElI/ 8=;
IronPort-SDR: 5wWL59AZwO67yqNc5aqVtgEaOhBYBWfL588jw3WwrStdgwZROFHQEOELUJ+fRTE7kLc4lyCuRz
 a7XRWura312g==
X-IronPort-AV: E=Sophos;i="5.69,246,1571702400"; 
   d="scan'208";a="9989878"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 26 Nov 2019 15:36:33 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com (Postfix) with ESMTPS
 id AC79CA2499; Tue, 26 Nov 2019 15:36:31 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 15:36:31 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.162.54) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 15:36:27 +0000
From: SeongJae Park <sjpark@amazon.com>
To: <konrad.wilk@oracle.com>, <roger.pau@citrix.com>
Date: Tue, 26 Nov 2019 16:36:05 +0100
Message-ID: <20191126153605.27564-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.43.162.54]
X-ClientProxiedBy: EX13D01UWB003.ant.amazon.com (10.43.161.94) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: Bulk
X-Mailman-Approved-At: Tue, 26 Nov 2019 16:15:33 +0000
Subject: [Xen-devel] [PATCH] xen/blkback: Avoid unmapping unmapped grant
 pages
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: axboe@kernel.dk, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 SeongJae Park <sjpark@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KCkZvciBlYWNoIEkvTyByZXF1
ZXN0LCBibGtiYWNrIGZpcnN0IG1hcHMgdGhlIGZvcmVpZ24gcGFnZXMgZm9yIHRoZQpyZXF1ZXN0
IHRvIGl0cyBsb2NhbCBwYWdlcy4gIElmIGFuIGFsbG9jYXRpb24gb2YgYSBsb2NhbCBwYWdlIGZv
ciB0aGUKbWFwcGluZyBmYWlscywgaXQgc2hvdWxkIHVubWFwIGV2ZXJ5IG1hcHBpbmcgYWxyZWFk
eSBtYWRlIGZvciB0aGUKcmVxdWVzdC4KCkhvd2V2ZXIsIGJsa2JhY2sncyBoYW5kbGluZyBtZWNo
YW5pc20gZm9yIHRoZSBhbGxvY2F0aW9uIGZhaWx1cmUgZG9lcwpub3QgbWFyayB0aGUgcmVtYWlu
aW5nIGZvcmVpZ24gcGFnZXMgYXMgdW5tYXBwZWQuICBUaGVyZWZvcmUsIHRoZSB1bm1hcApmdW5j
dGlvbiBtZXJlbHkgdHJpZXMgdG8gdW5tYXAgZXZlcnkgdmFsaWQgZ3JhbnQgcGFnZSBmb3IgdGhl
IHJlcXVlc3QsCmluY2x1ZGluZyB0aGUgcGFnZXMgbm90IG1hcHBlZCBkdWUgdG8gdGhlIGFsbG9j
YXRpb24gZmFpbHVyZS4gIE9uIGEKc3lzdGVtIHRoYXQgZmFpbHMgdGhlIGFsbG9jYXRpb24gZnJl
cXVlbnRseSwgdGhpcyBwcm9ibGVtIGxlYWRzIHRvCmZvbGxvd2luZyBrZXJuZWwgY3Jhc2guCgog
IFsgIDM3Mi4wMTI1MzhdIEJVRzogdW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVy
IGRlcmVmZXJlbmNlIGF0IDAwMDAwMDAwMDAwMDAwMDEKICBbICAzNzIuMDEyNTQ2XSBJUDogWzxm
ZmZmZmZmZjgxNDA3MWFjPl0gZ250dGFiX3VubWFwX3JlZnMucGFydC43KzB4MWMvMHg0MAogIFsg
IDM3Mi4wMTI1NTddIFBHRCAxNmYzZTkwNjcgUFVEIDE2NDI2ZTA2NyBQTUQgMAogIFsgIDM3Mi4w
MTI1NjJdIE9vcHM6IDAwMDIgWyMxXSBTTVAKICBbICAzNzIuMDEyNTY2XSBNb2R1bGVzIGxpbmtl
ZCBpbjogYWN0X3BvbGljZSBzY2hfaW5ncmVzcyBjbHNfdTMyCiAgLi4uCiAgWyAgMzcyLjAxMjc0
Nl0gQ2FsbCBUcmFjZToKICBbICAzNzIuMDEyNzUyXSAgWzxmZmZmZmZmZjgxNDA3MjA0Pl0gZ250
dGFiX3VubWFwX3JlZnMrMHgzNC8weDQwCiAgWyAgMzcyLjAxMjc1OV0gIFs8ZmZmZmZmZmZhMDMz
NWFlMz5dIHhlbl9ibGtia191bm1hcCsweDgzLzB4MTUwIFt4ZW5fYmxrYmFja10KICAuLi4KICBb
ICAzNzIuMDEyODAyXSAgWzxmZmZmZmZmZmEwMzM2YzUwPl0gZGlzcGF0Y2hfcndfYmxvY2tfaW8r
MHg5NzAvMHg5ODAgW3hlbl9ibGtiYWNrXQogIC4uLgogIERlY29tcHJlc3NpbmcgTGludXguLi4g
UGFyc2luZyBFTEYuLi4gZG9uZS4KICBCb290aW5nIHRoZSBrZXJuZWwuCiAgWyAgICAwLjAwMDAw
MF0gSW5pdGlhbGl6aW5nIGNncm91cCBzdWJzeXMgY3B1c2V0CgpUaGlzIGNvbW1pdCBmaXhlcyB0
aGlzIHByb2JsZW0gYnkgbWFya2luZyB0aGUgZ3JhbnQgcGFnZXMgb2YgdGhlIGdpdmVuCnJlcXVl
c3QgdGhhdCBkaWRuJ3QgbWFwcGVkIGR1ZSB0byB0aGUgYWxsb2NhdGlvbiBmYWlsdXJlIGFzIGlu
dmFsaWQuCgpGaXhlczogYzZjYzE0MmRhYzUyICgieGVuLWJsa2JhY2s6IHVzZSBiYWxsb29uIHBh
Z2VzIGZvciBhbGwgbWFwcGluZ3MiKQoKU2lnbmVkLW9mZi1ieTogU2VvbmdKYWUgUGFyayA8c2pw
YXJrQGFtYXpvbi5kZT4KUmV2aWV3ZWQtYnk6IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24u
ZGU+ClJldmlld2VkLWJ5OiBNYXhpbWlsaWFuIEhleW5lIDxtaGV5bmVAYW1hem9uLmRlPgpSZXZp
ZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY28udWs+Ci0tLQogZHJpdmVy
cy9ibG9jay94ZW4tYmxrYmFjay9ibGtiYWNrLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9ibGti
YWNrLmMgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2Jsa2JhY2suYwppbmRleCBmZDFlMTlm
MWE0OWYuLjM2NjZhZmE2MzlkMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFj
ay9ibGtiYWNrLmMKKysrIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9ibGtiYWNrLmMKQEAg
LTkzNiw2ICs5MzYsOCBAQCBzdGF0aWMgaW50IHhlbl9ibGtia19tYXAoc3RydWN0IHhlbl9ibGtp
Zl9yaW5nICpyaW5nLAogb3V0X29mX21lbW9yeToKIAlwcl9hbGVydCgiJXM6IG91dCBvZiBtZW1v
cnlcbiIsIF9fZnVuY19fKTsKIAlwdXRfZnJlZV9wYWdlcyhyaW5nLCBwYWdlc190b19nbnQsIHNl
Z3NfdG9fbWFwKTsKKwlmb3IgKGkgPSBsYXN0X21hcDsgaSA8IG51bTsgaSsrKQorCQlwYWdlc1tp
XS0+aGFuZGxlID0gQkxLQkFDS19JTlZBTElEX0hBTkRMRTsKIAlyZXR1cm4gLUVOT01FTTsKIH0K
IAotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
