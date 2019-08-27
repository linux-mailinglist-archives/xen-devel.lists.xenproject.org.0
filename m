Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F47E9E986
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 15:35:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2bbE-0004R5-Cg; Tue, 27 Aug 2019 13:33:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8wY6=WX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1i2bbD-0004Qi-7y
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 13:33:27 +0000
X-Inumbo-ID: 37da8e86-c8cf-11e9-ac23-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37da8e86-c8cf-11e9-ac23-bc764e2007e4;
 Tue, 27 Aug 2019 13:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566912793;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pFwuW4Axd7YdiPFuPhw6DuqGqqdqinpa0zNIxL6MtZY=;
 b=PFd73FtPiB8VA18xyDz161dJbfUbKR+/Q45hY3dQ00sLrd9mPkc+iUYL
 m4c5i/nzD72n6BficJvTuD6EMceI03iRnPhwU/dGrfkzfIMirCw51BlXa
 UQI6hXPIyU4pUB71XPsHd8ZpqNIr2HX+pEpeuQ2zzaWp6VFJdPrdO7sjH Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lYPEPaREY4DL5UdRC5M3ckSf4IAECkdpa878CASsb0YtKo3zvfIHnPzbLBK3Tz/Dcfq6CepxMi
 1SnFYEKZXLcoNM8+jp48NF/16gGjKaa1MGOlfox0OdIRroJWslu5iZIuXh4qEMhbO/jZkozFNf
 b2NEJuE101G5wfVQRm5jUZ+GemWqoLIyZpurJLvTrlfJWuLh6FG1iurHzk7VpLXcOa35jO8n8T
 BKmvg9LLvGfXY8DpCQZPFYNTJPrm0yqnTD7FxbdIEgDo7yTrcM7aYYpXgXhKEeospwf5sca6Y3
 UN8=
X-SBRS: 2.7
X-MesageID: 4987744
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,437,1559534400"; 
   d="scan'208";a="4987744"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 27 Aug 2019 14:32:59 +0100
Message-ID: <20190827133259.32084-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827133259.32084-1-anthony.perard@citrix.com>
References: <20190827133259.32084-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PULL 4/4] xen-bus: Avoid rewriting identical values to
 xenstore
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBRRU1VIHJlY2VpdmVzIGEgeGVuc3RvcmUgd2F0Y2ggZXZlbnQgc3VnZ2VzdGluZyB0aGF0
IHRoZSAic3RhdGUiCm9mIHRoZSBmcm9udGVuZCBjaGFuZ2VkLCBpdCByZWNvcmRzIHRoaXMgaW4g
aXRzIG93biBzdGF0ZSBidXQgaXQgYWxzbwpyZS13cml0ZSB0aGUgdmFsdWUgYmFjayBpbnRvIHhl
bnN0b3JlIGV2ZW4gc28gdGhlcmUgd2VyZSBubyBjaGFuZ2UuClRoaXMgdHJpZ2dlcnMgYW4gdW5u
ZWNlc3NhcnkgeGVuc3RvcmUgd2F0Y2ggZXZlbnQgd2hpY2ggUUVNVSB3aWxsCnByb2Nlc3MgYWdh
aW4gKGFuZCBtYXliZSB0aGUgZnJvbnRlbmQgYXMgd2VsbCkuIEFsc28gUUVNVSBjb3VsZApwb3Rl
bnRpYWxseSB3cml0ZSBhbiBhbHJlYWR5IG9sZCB2YWx1ZS4KClNpZ25lZC1vZmYtYnk6IEFudGhv
bnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgpSZXZpZXdlZC1ieTogUGF1bCBE
dXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KTWVzc2FnZS1JZDogPDIwMTkwODIzMTAx
NTM0LjQ2NS0zLWFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogaHcveGVuL3hlbi1idXMu
YyB8IDExICsrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3L3hlbi94ZW4tYnVzLmMgYi9ody94ZW4veGVuLWJ1
cy5jCmluZGV4IDYyYzEyN2I5MjYuLmEwNDQ3OGFkNGYgMTAwNjQ0Ci0tLSBhL2h3L3hlbi94ZW4t
YnVzLmMKKysrIGIvaHcveGVuL3hlbi1idXMuYwpAQCAtNjk4LDcgKzY5OCw4IEBAIGludCB4ZW5f
ZGV2aWNlX2Zyb250ZW5kX3NjYW5mKFhlbkRldmljZSAqeGVuZGV2LCBjb25zdCBjaGFyICprZXks
CiB9CiAKIHN0YXRpYyB2b2lkIHhlbl9kZXZpY2VfZnJvbnRlbmRfc2V0X3N0YXRlKFhlbkRldmlj
ZSAqeGVuZGV2LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW51
bSB4ZW5idXNfc3RhdGUgc3RhdGUpCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBlbnVtIHhlbmJ1c19zdGF0ZSBzdGF0ZSwKKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGJvb2wgcHVibGlzaCkKIHsKICAgICBjb25zdCBjaGFyICp0eXBl
ID0gb2JqZWN0X2dldF90eXBlbmFtZShPQkpFQ1QoeGVuZGV2KSk7CiAKQEAgLTcxMCw3ICs3MTEs
OSBAQCBzdGF0aWMgdm9pZCB4ZW5fZGV2aWNlX2Zyb250ZW5kX3NldF9zdGF0ZShYZW5EZXZpY2Ug
KnhlbmRldiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHhzX3N0cnN0YXRl
KHN0YXRlKSk7CiAKICAgICB4ZW5kZXYtPmZyb250ZW5kX3N0YXRlID0gc3RhdGU7Ci0gICAgeGVu
X2RldmljZV9mcm9udGVuZF9wcmludGYoeGVuZGV2LCAic3RhdGUiLCAiJXUiLCBzdGF0ZSk7Cisg
ICAgaWYgKHB1Ymxpc2gpIHsKKyAgICAgICAgeGVuX2RldmljZV9mcm9udGVuZF9wcmludGYoeGVu
ZGV2LCAic3RhdGUiLCAiJXUiLCBzdGF0ZSk7CisgICAgfQogfQogCiBzdGF0aWMgdm9pZCB4ZW5f
ZGV2aWNlX2Zyb250ZW5kX2NoYW5nZWQodm9pZCAqb3BhcXVlKQpAQCAtNzI2LDcgKzcyOSw3IEBA
IHN0YXRpYyB2b2lkIHhlbl9kZXZpY2VfZnJvbnRlbmRfY2hhbmdlZCh2b2lkICpvcGFxdWUpCiAg
ICAgICAgIHN0YXRlID0gWGVuYnVzU3RhdGVVbmtub3duOwogICAgIH0KIAotICAgIHhlbl9kZXZp
Y2VfZnJvbnRlbmRfc2V0X3N0YXRlKHhlbmRldiwgc3RhdGUpOworICAgIHhlbl9kZXZpY2VfZnJv
bnRlbmRfc2V0X3N0YXRlKHhlbmRldiwgc3RhdGUsIGZhbHNlKTsKIAogICAgIGlmIChzdGF0ZSA9
PSBYZW5idXNTdGF0ZUluaXRpYWxpc2luZyAmJgogICAgICAgICB4ZW5kZXYtPmJhY2tlbmRfc3Rh
dGUgPT0gWGVuYnVzU3RhdGVDbG9zZWQgJiYKQEAgLTExNjksNyArMTE3Miw3IEBAIHN0YXRpYyB2
b2lkIHhlbl9kZXZpY2VfcmVhbGl6ZShEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnApCiAg
ICAgeGVuX2RldmljZV9mcm9udGVuZF9wcmludGYoeGVuZGV2LCAiYmFja2VuZC1pZCIsICIldSIs
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgeGVuYnVzLT5iYWNrZW5kX2lkKTsKIAot
ICAgIHhlbl9kZXZpY2VfZnJvbnRlbmRfc2V0X3N0YXRlKHhlbmRldiwgWGVuYnVzU3RhdGVJbml0
aWFsaXNpbmcpOworICAgIHhlbl9kZXZpY2VfZnJvbnRlbmRfc2V0X3N0YXRlKHhlbmRldiwgWGVu
YnVzU3RhdGVJbml0aWFsaXNpbmcsIHRydWUpOwogCiAgICAgeGVuZGV2LT5leGl0Lm5vdGlmeSA9
IHhlbl9kZXZpY2VfZXhpdDsKICAgICBxZW11X2FkZF9leGl0X25vdGlmaWVyKCZ4ZW5kZXYtPmV4
aXQpOwotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
