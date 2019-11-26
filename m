Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB54109DE9
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 13:27:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZZud-0004Yh-Gv; Tue, 26 Nov 2019 12:25:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XQNV=ZS=amazon.de=prvs=226749d31=wipawel@srs-us1.protection.inumbo.net>)
 id 1iZZuc-0004YL-Dv
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 12:25:46 +0000
X-Inumbo-ID: dbf9f51e-1047-11ea-a39f-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dbf9f51e-1047-11ea-a39f-12813bfff9fa;
 Tue, 26 Nov 2019 12:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1574771141; x=1606307141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=ZXAJjfmjhp5i95fpbuZn3bmZpshZMAdvbhZBgLG/CAQ=;
 b=tmRC7YRZdRoDDow1RAeCcSHA2mLH5VRbx3l+kOG/OaBkUdEkc8nAowtA
 CbVw2r963lPqiDBaOm8vgbwtzpqmTqUjqktPDRpoY6b6ADYIRrgj2LJ9p
 H5sWawdE4SSlPDuKnArnlWTlqlNhZ5ag6vq3Bpo/Ng043OsNwvoA98j09 k=;
IronPort-SDR: Cp+alx7SbV8IYhB+g9t7n5hN/byFmDN3bn835+lcF/vId2tDGXccyxQDC3zasCZfG5hy6sx/n8
 aTS55vH6ZBVw==
X-IronPort-AV: E=Sophos;i="5.69,245,1571702400"; d="scan'208";a="11319307"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-87a10be6.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 26 Nov 2019 12:25:30 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-87a10be6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 5534DA21D9; Tue, 26 Nov 2019 12:25:29 +0000 (UTC)
Received: from EX13D05EUC003.ant.amazon.com (10.43.164.207) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 12:25:28 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D05EUC003.ant.amazon.com (10.43.164.207) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 12:25:27 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Tue, 26 Nov 2019 12:25:25 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 26 Nov 2019 12:25:07 +0000
Message-ID: <20191126122511.7409-4-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20191126122511.7409-1-wipawel@amazon.de>
References: <20191126122511.7409-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 3/7] create-diff-object: Handle optional
 apply|revert hooks
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

SW5jbHVkZSBuZXcgc2VjdGlvbnMgY29udGFpbmluZyBvcHRpb25hbCBhcHBseSBhbmQgcmV2ZXJ0
IGFjdGlvbgpob29rcy4KClRoZSBmb2xsb3dpbmcgbmV3IHNlY3Rpb24gbmFtZXMgYXJlIHN1cHBv
cnRlZDoKICAtIC5saXZlcGF0Y2guaG9va3MuYXBwbHkKICAtIC5saXZlcGF0Y2guaG9va3MucmV2
ZXJ0CgpTaWduZWQtb2ZmLWJ5OiBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24u
ZGU+ClJldmlld2VkLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNv
bT4KLS0tCiBjcmVhdGUtZGlmZi1vYmplY3QuYyB8IDEwICsrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvY3JlYXRlLWRpZmYtb2JqZWN0LmMg
Yi9jcmVhdGUtZGlmZi1vYmplY3QuYwppbmRleCA3ZmY1NmM3Li5mZWQ0N2NkIDEwMDY0NAotLS0g
YS9jcmVhdGUtZGlmZi1vYmplY3QuYworKysgYi9jcmVhdGUtZGlmZi1vYmplY3QuYwpAQCAtMTEx
OCw2ICsxMTE4LDE0IEBAIHN0YXRpYyBzdHJ1Y3Qgc3BlY2lhbF9zZWN0aW9uIHNwZWNpYWxfc2Vj
dGlvbnNbXSA9IHsKIAkJLm5hbWUJCT0gIi5saXZlcGF0Y2guaG9va3MucG9zdHJldmVydCIsCiAJ
CS5ncm91cF9zaXplCT0gbGl2ZXBhdGNoX2hvb2tzX2dyb3VwX3NpemUsCiAJfSwKKwl7CisJCS5u
YW1lCQk9ICIubGl2ZXBhdGNoLmhvb2tzLmFwcGx5IiwKKwkJLmdyb3VwX3NpemUJPSBsaXZlcGF0
Y2hfaG9va3NfZ3JvdXBfc2l6ZSwKKwl9LAorCXsKKwkJLm5hbWUJCT0gIi5saXZlcGF0Y2guaG9v
a3MucmV2ZXJ0IiwKKwkJLmdyb3VwX3NpemUJPSBsaXZlcGF0Y2hfaG9va3NfZ3JvdXBfc2l6ZSwK
Kwl9LAogCXt9LAogfTsKIApAQCAtMTQ4OCw2ICsxNDk2LDcgQEAgc3RhdGljIHZvaWQga3BhdGNo
X2luY2x1ZGVfZGVidWdfc2VjdGlvbnMoc3RydWN0IGtwYXRjaF9lbGYgKmtlbGYpCiAKICNkZWZp
bmUgSVNfQUNUSU9OX0hPT0tfU0VDVElPTihzZWN0aW9uLCBhY3Rpb24pICh7IFwKICAgICAgICAg
SVNfSE9PS19TRUNUSU9OKHNlY3Rpb24sICJwcmUiIGFjdGlvbikgfHwgXAorICAgICAgICBJU19I
T09LX1NFQ1RJT04oc2VjdGlvbiwgYWN0aW9uKSB8fCBcCiAgICAgICAgIElTX0hPT0tfU0VDVElP
TihzZWN0aW9uLCAicG9zdCIgYWN0aW9uKTsgXAogfSkKIApAQCAtMTQ5Nyw2ICsxNTA2LDcgQEAg
c3RhdGljIHZvaWQga3BhdGNoX2luY2x1ZGVfZGVidWdfc2VjdGlvbnMoc3RydWN0IGtwYXRjaF9l
bGYgKmtlbGYpCiAKICNkZWZpbmUgSVNfQUNUSU9OX0hPT0tfU1lNX05BTUUoc3ltYm9sLCBhY3Rp
b24pICh7IFwKICAgICAgICAgSVNfSE9PS19TWU1fTkFNRShzeW1ib2wsICJwcmUiIGFjdGlvbikg
fHwgXAorICAgICAgICBJU19IT09LX1NZTV9OQU1FKHN5bWJvbCwgYWN0aW9uKSB8fCBcCiAgICAg
ICAgIElTX0hPT0tfU1lNX05BTUUoc3ltYm9sLCAicG9zdCIgYWN0aW9uKTsgXAogfSkKIAotLSAK
Mi4xNi41CgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vu
c3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFl
Z2VyLCBSYWxmIEhlcmJyaWNoCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5i
dXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3
OQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
