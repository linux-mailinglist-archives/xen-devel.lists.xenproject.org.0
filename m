Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE196140E70
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 16:59:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isU0X-0002Y8-CZ; Fri, 17 Jan 2020 15:58:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V5CB=3G=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1isU0W-0002Xs-AN
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 15:58:00 +0000
X-Inumbo-ID: 1900756e-3942-11ea-b833-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1900756e-3942-11ea-b833-bc764e2007e4;
 Fri, 17 Jan 2020 15:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579276664;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VuZJzWZghr54Ihbi9LwnW7Xlt5ouevKSKJb7hSv05Wk=;
 b=QcJ7OEKbXGlwlvYdF15kAOc2vjT6HNgpLtT7VrRqEnNdGFJeKsBbRn7t
 v53wgI329wEVMKeQxzRN+FJMyBWGX7rRh3sHG4VK9UstTk8HnCtmeprb9
 gEhyrhooaK5vyLuESS9u3lL500DA31yMEAgOyCiOijRtlwx8Gpg5c9/yu E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bX1ymuBVfVruhi2tmvXrgWHvEW3aysskTMhoAMxWx5Lj+ZTeubfNF5bhsq6I7RZrj1FORmrb8B
 sdX3M+tYs24E24ks8sqe2/uualkAxktcKeFINH4D9HgJSR+R4Y/ddckoSQx2AZCObKvF8Rtqo7
 3iIJ14dDowKonxX7p1HKlx9yjAzdobGV67AbWI1IxFm9103oY5ghjTZq9GZ2WjEsDkRoX/IxS0
 5hqu7crBrwjTdfVT7y7F5HyPfV33yZueDKO+5AgpFVfKMktp4yBdcaPDZ0yK+q7RsMkI5jIzvW
 RSw=
X-SBRS: 2.7
X-MesageID: 11674363
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11674363"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 15:57:28 +0000
Message-ID: <20200117155734.1067550-2-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117155734.1067550-1-george.dunlap@citrix.com>
References: <20200117155734.1067550-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 2/8] go/xenlight: Fix CpuidPoliclyList
 conversion
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RW1wdHkgR28gc3RyaW5ncyBzaG91bGQgYmUgY29udmVydGVkIHRvIGBuaWxgIGxpYnhsX2NwdWlk
X3BvbGljeV9saXN0OwpvdGhlcndpc2UgbGlieGxfY3B1aWRfcGFyc2VfY29uZmlnIGdldHMgY29u
ZnVzZWQuCgpBbHNvLCBsaWJ4bF9jcHVpZF9wb2xpY3lfbGlzdCByZXR1cm5zIGEgd2VpcmQgZXJy
b3IsIG5vdCBhICJub3JtYWwiCmxpYnhsIGVycm9yOyBpZiBpdCByZXR1cm5zIG9uZSBvZiB0aGVz
ZSBub24tc3RhbmRhcmQgZXJyb3JzLCBjb252ZXJ0Cml0IHRvIEVycm9ySW52YWwuCgpGaW5hbGx5
LCBtYWtlIHRoZSBmcm9tQygpIG1ldGhvZCB0YWtlIGEgcG9pbnRlciwgYW5kIHNldCB0aGUgdmFs
dWUgb2YKQ3B1aWRQb2xpY3lMaXN0IHN1Y2ggdGhhdCBpdCB3aWxsIGdlbmVyYXRlIGEgdmFsaWQg
Q3B1aWRQb2xpY3lMaXN0IGluCnJlc3BvbnNlLgoKU2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxh
cCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgotLS0KdjI6Ci0gUG9ydCBvdmVyIHRvQygpIGZ1
bmN0aW9uIHNpZ25hdHVyZSBjaGFuZ2UKLSBIYXZlIGZyb21DIHNldCB0aGUgc3RyaW5nIHRvICIi
CgpDQzogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KLS0tCiB0b29scy9n
b2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28gfCAxMCArKysrKysrKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2dv
bGFuZy94ZW5saWdodC94ZW5saWdodC5nbyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdo
dC5nbwppbmRleCBiMTU4N2I5NjRmLi4xMjk5OTgxNzEzIDEwMDY0NAotLS0gYS90b29scy9nb2xh
bmcveGVubGlnaHQveGVubGlnaHQuZ28KKysrIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxp
Z2h0LmdvCkBAIC0zMDYsOSArMzA2LDE0IEBAIGZ1bmMgKGVsICpFdkxpbmspIHRvQyhjZWwgKkMu
bGlieGxfZXZfbGluaykgKGVyciBlcnJvcikgeyByZXR1cm4gfQogLy8gZW1wdHkgd2hlbiBpdCBp
cyByZXR1cm5lZCBmcm9tIGxpYnhsLgogdHlwZSBDcHVpZFBvbGljeUxpc3Qgc3RyaW5nCiAKLWZ1
bmMgKGNwbCBDcHVpZFBvbGljeUxpc3QpIGZyb21DKGNjcGwgKkMubGlieGxfY3B1aWRfcG9saWN5
X2xpc3QpIGVycm9yIHsgcmV0dXJuIG5pbCB9CitmdW5jIChjcGwgKkNwdWlkUG9saWN5TGlzdCkg
ZnJvbUMoY2NwbCAqQy5saWJ4bF9jcHVpZF9wb2xpY3lfbGlzdCkgZXJyb3IgeyAqY3BsID0gIiI7
IHJldHVybiBuaWwgfQogCiBmdW5jIChjcGwgQ3B1aWRQb2xpY3lMaXN0KSB0b0MoY2NwbCAqQy5s
aWJ4bF9jcHVpZF9wb2xpY3lfbGlzdCkgZXJyb3IgeworCWlmIGNwbCA9PSAiIiB7CisJCSpjY3Bs
ID0gbmlsCisJCXJldHVybiBuaWwKKwl9CisKIAlzIDo9IEMuQ1N0cmluZyhzdHJpbmcoY3BsKSkK
IAlkZWZlciBDLmZyZWUodW5zYWZlLlBvaW50ZXIocykpCiAKQEAgLTMxNiw3ICszMjEsOCBAQCBm
dW5jIChjcGwgQ3B1aWRQb2xpY3lMaXN0KSB0b0MoY2NwbCAqQy5saWJ4bF9jcHVpZF9wb2xpY3lf
bGlzdCkgZXJyb3IgewogCWlmIHJldCAhPSAwIHsKIAkJQy5saWJ4bF9jcHVpZF9kaXNwb3NlKGNj
cGwpCiAKLQkJcmV0dXJuIEVycm9yKC1yZXQpCisJCS8vIGxpYnhsX2NwdWlkX3BhcnNlX2NvbmZp
ZyBkb2Vzbid0IHJldHVybiBhIG5vcm1hbCBsaWJ4bCBlcnJvci4KKwkJcmV0dXJuIEVycm9ySW52
YWwKIAl9CiAKIAlyZXR1cm4gbmlsCi0tIAoyLjI0LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
