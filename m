Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B3B118D03
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 16:51:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iehkW-00038T-Pg; Tue, 10 Dec 2019 15:48:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A1/D=2A=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iehkU-00037Q-RH
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 15:48:30 +0000
X-Inumbo-ID: 713c9574-1b64-11ea-b6f1-bc764e2007e4
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 713c9574-1b64-11ea-b6f1-bc764e2007e4;
 Tue, 10 Dec 2019 15:47:59 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id s8so3207832qte.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2019 07:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FHv28KVI1LuPzWrTOCFa+sts2+d/6qshGJxnHHNJjD4=;
 b=T4JR5lkMiFThm4g2hlVchv7XpPP1BLqo5e/qNpwseqT25AKe88Lp2Ad8J1mqs0HAw9
 Wx+jo35oujweyMcXlSTqZCssCfSXJyqFmED6LNDJIqecJDqWoOTF0Qu56UoNUDnltiGb
 K61j3xWLYHa+O3hHBXqfwqOZzzQBC4USpddnQYRWFgWDya1Ii1YPsSzNy7F2jJd6Rw14
 AyWF2fElS16McXbwOy1FsAZRePjLrcSSWmlFU2RPzvqkfKdvo7mG87vDkap8gJcpI0dA
 PBxD3JTf5P/E+55d6tCsocUeZPZAeWhnDHvmrXcU9JOGLL2LXCPWNF6NDkMuBIEBh24+
 IHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FHv28KVI1LuPzWrTOCFa+sts2+d/6qshGJxnHHNJjD4=;
 b=Zwthfoi4NgpplWjEeOs3EklZ2LvCSJSJaMYq92gwvv/1oum2nyBk/1vYRyWEu7Dg6E
 Bv18uZSZCm8ll12ZDIO7OfRFOWSY2f7hc2lrmcjdR6XKJ1L4MMDOCxeX6JOY8+RzpIG0
 gbRoRIu4HwXiXh1sKZ1QvM8rei/I17b9jWfe/tPC+F6obJd3WrdcAW4eCEMHRVsfPMyQ
 2J58WaWtYRXNCMJtW96aPGBCG4IMRQrPgqYmhMR0IDK8vsnD/9wFrRd+f3ZEjFSgruad
 uRkZ3phfeaysnhYIa+QQycO0oN4YqZkC0hdRyMx0LlwLi4U2zjlpEZM3u3JfQ2+jKOBh
 33EA==
X-Gm-Message-State: APjAAAUBf7NzWmNKWwhA1BQOXvJEFASJeD8QY4JTNuYWTLPsINxmloNz
 0go00ZrOkpAKmEn0hAs5hEBVf19J
X-Google-Smtp-Source: APXvYqwFBtgEAx+3xnGXkptZqxPJjk3sldGF7iRNpzN44/XCdc52kc37ApJeJLCuPaT9gxWW8f9lIw==
X-Received: by 2002:ac8:6f73:: with SMTP id u19mr30205732qtv.326.1575992879261; 
 Tue, 10 Dec 2019 07:47:59 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id m29sm1247848qtf.1.2019.12.10.07.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 07:47:58 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 10 Dec 2019 10:47:23 -0500
Message-Id: <a5533270711b1961602189bbd1e5b349c36d7418.1575990937.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1575990937.git.rosbrookn@ainfosec.com>
References: <cover.1575990937.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 08/22] golang/xenlight: define MsVmGenid
 builtin type
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

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KCkRlZmluZSBNc1Zt
R2VuaWQgYXMgW2ludChDLkxJQlhMX01TX1ZNX0dFTklEX0xFTildYnl0ZSBhbmQgaW1wbGVtZW50
IGZyb21DIGFuZCB0b0MgZnVuY3Rpb25zLgoKU2lnbmVkLW9mZi1ieTogTmljayBSb3Nicm9vayA8
cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KUmV2aWV3ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3Jn
ZS5kdW5sYXBAY2l0cml4LmNvbT4KLS0tCkNoYW5nZXMgaW4gdjM6Ci0gSW4gZnJvbUMsIGl0ZXJh
dGUgb3ZlciB0aGUgaW5kaXJlY3Qgb2YgbXZnIGluc3RlYWQgb2YgY3JlYXRpbmcKICBhIHNsaWNl
IGZyb20gdGhlIEMgdHlwZS4KLS0tCiB0b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28g
fCAyMSArKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvIGIvdG9v
bHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCmluZGV4IDE3ZDE0Njc3MWUuLjZjMzg2OGNk
NjkgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbworKysgYi90
b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KQEAgLTIxNCw2ICsyMTQsMjcgQEAgZnVu
YyAobWFjIE1hYykgdG9DKCkgKEMubGlieGxfbWFjLCBlcnJvcikgewogCXJldHVybiBjbWFjLCBu
aWwKIH0KIAorLy8gTXNWbUdlbmlkIHJlcHJlc2VudHMgYSBsaWJ4bF9tc192bV9nZW5pZC4KK3R5
cGUgTXNWbUdlbmlkIFtpbnQoQy5MSUJYTF9NU19WTV9HRU5JRF9MRU4pXWJ5dGUKKworZnVuYyAo
bXZnICpNc1ZtR2VuaWQpIGZyb21DKGNtdmcgKkMubGlieGxfbXNfdm1fZ2VuaWQpIGVycm9yIHsK
Kwlmb3IgaSA6PSByYW5nZSAqbXZnIHsKKwkJbXZnW2ldID0gYnl0ZShjbXZnLmJ5dGVzW2ldKQor
CX0KKworCXJldHVybiBuaWwKK30KKworZnVuYyAobXZnICpNc1ZtR2VuaWQpIHRvQygpIChDLmxp
YnhsX21zX3ZtX2dlbmlkLCBlcnJvcikgeworCXZhciBjbXZnIEMubGlieGxfbXNfdm1fZ2VuaWQK
KworCWZvciBpLCB2IDo9IHJhbmdlIG12ZyB7CisJCWNtdmcuYnl0ZXNbaV0gPSBDLnVpbnQ4X3Qo
dikKKwl9CisKKwlyZXR1cm4gY212ZywgbmlsCit9CisKIHR5cGUgQ29udGV4dCBzdHJ1Y3Qgewog
CWN0eCAgICAqQy5saWJ4bF9jdHgKIAlsb2dnZXIgKkMueGVudG9vbGxvZ19sb2dnZXJfc3RkaW9z
dHJlYW0KLS0gCjIuMTkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
