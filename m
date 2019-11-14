Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40701FD11D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 23:47:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVNrH-00056v-Gt; Thu, 14 Nov 2019 22:44:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=isnB=ZG=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iVNrG-00056o-PO
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 22:44:58 +0000
X-Inumbo-ID: 62549e96-0730-11ea-9631-bc764e2007e4
Received: from mail-qv1-xf43.google.com (unknown [2607:f8b0:4864:20::f43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62549e96-0730-11ea-9631-bc764e2007e4;
 Thu, 14 Nov 2019 22:44:57 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id g12so3052377qvy.12
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2019 14:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qqte1Gd9n54GQgmDTxPdzZs/4KvBl1CI+0xxWgyW0XA=;
 b=iv1dyiipQ8NMv8bER+5Og54OFhMP5GOsdHHlvARMyqTSxcUlCtVbsTwxVZ8nYBc6Iw
 D6ePhSzLU9MYOqSsQTN6xtH+r9b01jl5/nSP8PD2zHj9vZOS48Z4WQKD9lZsr9fimyn4
 dOM/iFJS3nGIkZQX/jVXeUHYpumpuaqdCJrVvcNrqcZaBTwEu5Yj/PoJ9xiHzrhyw9YV
 WEP6jIP8c9s79dGTvFcfAwZnSi7H7OhKeN8T2Z4KxZuwIG9XUQLqJZtBPSa2NPrgbUS5
 JsxIfhlZrSBaIrSXJL3uxlvHCleO3ZZ4zYgMHP35FjLqYOggDTwEj+hwGvCUnvD1Xzz6
 euDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qqte1Gd9n54GQgmDTxPdzZs/4KvBl1CI+0xxWgyW0XA=;
 b=a0oevVUx7S/JcRu2gutwx+DX1bI7WzvkpBqBuVfxTfr+XCp6wTpSScoEJ/Jqgq0TgK
 X0Fb4SEn+/cK60l67lEojmKwucQfY3Xt+eLTUrQzgWvNOcF2yc/Mubu4YTWDkN+XClpm
 25UMuseaiKdKDg2XuN2mlgGZbEeKLlNCTwRP9MbedvZUffXQSUjUYuk+JrGpiPVgNlbF
 y2DFjdFTQ1oo9EAAIaj9KQaWwQ0OtVSxwlYRzlvLCgZatQUzQ54EC0za+9j3mWsaD0PK
 l3Z7EWIkC12fT1H+2pcEyzdPxjmiqC7SJN+qm1J27pTf6znA3P9eRIS92TGKugpiCutR
 caNQ==
X-Gm-Message-State: APjAAAXTw85wh7DZ9Keo7/btUF/tTZ9FPnlkQxwXHMAfHFFFczKRBN/R
 fbLFmfyGcLHtSjIWqjWL0pVZENvI
X-Google-Smtp-Source: APXvYqz4OAQNkMFl3g/ZMhNAXwf1LKdouqD1yvUP51QSLG3kLbmwgi7YhVGPNTrdBkI0YwCdhtYHQA==
X-Received: by 2002:ad4:4c4e:: with SMTP id
 cs14mr10599869qvb.198.1573771496966; 
 Thu, 14 Nov 2019 14:44:56 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id x30sm4212277qtc.7.2019.11.14.14.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 14:44:55 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 14 Nov 2019 17:44:45 -0500
Message-Id: <603fd9f6b118b05c68858a9bf93c65d98b7efd9c.1573771485.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] golang/xenlight: add missing arguments to
 libxl_domain_shutdown/reboot
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KClRoZXNlIGZ1bmN0
aW9ucyBub3cgaGF2ZSBhIHRoaXJkIHBhcmFtZXRlciBvZiB0eXBlIGNvbnN0ICpsaWJ4bF9hc3lu
Y29wX2hvdy4KClBhc3MgbmlsIGZvciB0aGlzIGFyZ3VtZW50IHRvIGZpeCBjb21waWxhdGlvbiBh
bmQgbWFpbnRhaW4gdGhlCnN5bmNocm9ub3VzIGJlaGF2aW9yLgoKU2lnbmVkLW9mZi1ieTogTmlj
ayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KLS0tCiB0b29scy9nb2xhbmcveGVu
bGlnaHQveGVubGlnaHQuZ28gfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hl
bmxpZ2h0LmdvIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCmluZGV4IDU5Yjgx
ODZhNjQuLjkwMmNiYjgzOWUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5s
aWdodC5nbworKysgYi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KQEAgLTEwNDEs
NyArMTA0MSw3IEBAIGZ1bmMgKEN0eCAqQ29udGV4dCkgRG9tYWluU2h1dGRvd24oaWQgRG9taWQp
IChlcnIgZXJyb3IpIHsKIAkJcmV0dXJuCiAJfQogCi0JcmV0IDo9IEMubGlieGxfZG9tYWluX3No
dXRkb3duKEN0eC5jdHgsIEMudWludDMyX3QoaWQpKQorCXJldCA6PSBDLmxpYnhsX2RvbWFpbl9z
aHV0ZG93bihDdHguY3R4LCBDLnVpbnQzMl90KGlkKSwgbmlsKQogCiAJaWYgcmV0ICE9IDAgewog
CQllcnIgPSBFcnJvcigtcmV0KQpAQCAtMTA1Niw3ICsxMDU2LDcgQEAgZnVuYyAoQ3R4ICpDb250
ZXh0KSBEb21haW5SZWJvb3QoaWQgRG9taWQpIChlcnIgZXJyb3IpIHsKIAkJcmV0dXJuCiAJfQog
Ci0JcmV0IDo9IEMubGlieGxfZG9tYWluX3JlYm9vdChDdHguY3R4LCBDLnVpbnQzMl90KGlkKSkK
KwlyZXQgOj0gQy5saWJ4bF9kb21haW5fcmVib290KEN0eC5jdHgsIEMudWludDMyX3QoaWQpLCBu
aWwpCiAKIAlpZiByZXQgIT0gMCB7CiAJCWVyciA9IEVycm9yKC1yZXQpCi0tIAoyLjE5LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
