Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5893118CFD
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 16:50:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iehkC-0002xW-H0; Tue, 10 Dec 2019 15:48:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A1/D=2A=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iehkA-0002x2-Rm
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 15:48:10 +0000
X-Inumbo-ID: 6e5311f8-1b64-11ea-88e7-bc764e2007e4
Received: from mail-qv1-xf44.google.com (unknown [2607:f8b0:4864:20::f44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e5311f8-1b64-11ea-88e7-bc764e2007e4;
 Tue, 10 Dec 2019 15:47:55 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id o18so4362118qvf.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2019 07:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xJtsVD7v/eLGT0PYCbUK6OcDbHvosGa2K6bcDN+U4so=;
 b=O7cyzIDfXsW/cWNr3AOTOBJQFOUwuAHIo6SCquLuU0Ed9Utiebev++ixg6UV2rvbZ1
 6mjoRsgSg2vCgm8IXp0/1mu5StUBtqTrABPgJPzrJreOlDVrTR+24iY+aAxV/eF9b1hI
 6t7YuJkw4LUp+syVagqW2Vdvi1Z5QrSKNovOPY1fAILp7AmKs7uf3J6Ii89SDtR9sTGw
 kBeMgTN14aIXGF8+WjrylLX+K5aPXtQ8CLfUHaAvft0K+toAoDWZLAQxbK2YL482jdJK
 ewEGsOnH3Lj41efkJoZKTQemmEnIC9//aD8sf9RGoobcWcT8TXQY/DPW3QnqoodCw78i
 UCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xJtsVD7v/eLGT0PYCbUK6OcDbHvosGa2K6bcDN+U4so=;
 b=KlevWZ6rm2EJ6PGPaTCPacKHPGHk8y7Ig/6kLcx82/r7oUmJw5raM9bbsf2u5znDvB
 rnD1sF/aKsaj8kjZn+VOkteCFu0JMMFBWabYUoup877iFIMjsjfPIETC+6bgEltxbibG
 ia7i+7a6WvjQE4mgcJFhlU2PEZiwXmwpOpnWD1Bqfp0+9BDN1e39B4fADYrMhfMlB9Y6
 B8DBBWe66w1yDKI+Bz0CMmJVifDbgGSq06AqcLqiPnacTONUXHafREjqhVoOQYWuNZD/
 XPnRLjbcaCdhn4T1lD4rW4rffg75la2GbHbVJXtfCD8HGr+PFzYfdmtT0V5cUsD34OT2
 h+yg==
X-Gm-Message-State: APjAAAUJICtw45dccLXiApfKE8s2ScQZjHI/NU14S2ncGQU8Z4icIzvf
 t1XhlaWLSRjRNsLecz7ipvF1tR62
X-Google-Smtp-Source: APXvYqwRTEm2d+0xw17v2x9ep5VQowpww71DOu/n7kLiC49CxcatED5XEDSH21LEvvMi/V8cRJ5EVg==
X-Received: by 2002:a05:6214:5ce:: with SMTP id
 t14mr4589643qvz.139.1575992874368; 
 Tue, 10 Dec 2019 07:47:54 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id m29sm1247848qtf.1.2019.12.10.07.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 07:47:53 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 10 Dec 2019 10:47:19 -0500
Message-Id: <3e79f8024a55f673f31c1768df0f3e9676a0ae2f.1575990937.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1575990937.git.rosbrookn@ainfosec.com>
References: <cover.1575990937.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 04/22] golang/xenlight: define KeyValueList
 as empty struct
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
 Ian Jackson <ian.jackson@eu.citrix.com>, kerriganb@ainfosec.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KCkRlZmluZSBLZXlW
YWx1ZUxpc3QgYXMgZW1wdHkgc3RydWN0IGFzIHRoZXJlIGlzIGN1cnJlbnRseSBubyByZWFzb24g
Zm9yCnRoaXMgdHlwZSB0byBiZSBhdmFpbGFibGUgaW4gdGhlIEdvIHBhY2thZ2UuCgpJbXBsZW1l
bnQgZnJvbUMgYW5kIHRvQyBmdW5jdGlvbnMgYXMgbm8tb3BzLgoKU2lnbmVkLW9mZi1ieTogTmlj
ayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KUmV2aWV3ZWQtYnk6IEdlb3JnZSBE
dW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gUmUt
ZGVmaW5lIEtleVZhbHVlTGlzdCBhcyBlbXB0eSBzdHJ1Y3QsIGFzIGl0IHdhcyBkZWNpZGVkIHRo
aXMgdHlwZQogIHByb2JhYmx5IHNob3VsZG4ndCBiZSBleHBvc2VkIGluIHRoZSBHbyBwYWNrYWdl
LgotLS0KIHRvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbyB8IDEwICsrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvZ29s
YW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0
LmdvCmluZGV4IDhhYzI2ZTYzZjAuLjNlZGZmMTg0NzEgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2dvbGFu
Zy94ZW5saWdodC94ZW5saWdodC5nbworKysgYi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGln
aHQuZ28KQEAgLTIwMiw2ICsyMDIsMTYgQEAgZnVuYyAoY2h3Y2FwIEMubGlieGxfaHdjYXApIHRv
R28oKSAoZ2h3Y2FwIEh3Y2FwKSB7CiAJcmV0dXJuCiB9CiAKKy8vIEtleVZhbHVlTGlzdCByZXBy
ZXNlbnRzIGEgbGlieGxfa2V5X3ZhbHVlX2xpc3QuCisvLworLy8gUmVwcmVzZW50ZWQgYXMgYW4g
ZW1wdHkgc3RydWN0IGZvciBub3csIGFzIHRoZXJlIGlzIG5vCisvLyBhcHBhcmVudCBuZWVkIGZv
ciB0aGlzIHR5cGUgdG8gYmUgZXhwb3NlZCB0aHJvdWdoIHRoZQorLy8gR28gcGFja2FnZS4KK3R5
cGUgS2V5VmFsdWVMaXN0IHN0cnVjdHt9CisKK2Z1bmMgKGt2bCBLZXlWYWx1ZUxpc3QpIGZyb21D
KGNrdmwgKkMubGlieGxfa2V5X3ZhbHVlX2xpc3QpIGVycm9yICAgICAgeyByZXR1cm4gbmlsIH0K
K2Z1bmMgKGt2bCBLZXlWYWx1ZUxpc3QpIHRvQygpIChja3ZsIEMubGlieGxfa2V5X3ZhbHVlX2xp
c3QsIGVyciBlcnJvcikgeyByZXR1cm4gfQorCiAvLyB0eXBlZGVmIHN0cnVjdCB7CiAvLyAgICAg
dWludDMyX3Qgc2l6ZTsgICAgICAgICAgLyogbnVtYmVyIG9mIGJ5dGVzIGluIG1hcCAqLwogLy8g
ICAgIHVpbnQ4X3QgKm1hcDsKLS0gCjIuMTkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
