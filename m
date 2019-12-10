Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1380E118CFA
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 16:50:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iehkb-0003C2-Bn; Tue, 10 Dec 2019 15:48:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A1/D=2A=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iehkZ-0003BG-S9
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 15:48:35 +0000
X-Inumbo-ID: 72036a14-1b64-11ea-b6f1-bc764e2007e4
Received: from mail-qv1-xf43.google.com (unknown [2607:f8b0:4864:20::f43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72036a14-1b64-11ea-b6f1-bc764e2007e4;
 Tue, 10 Dec 2019 15:48:01 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id b18so4361473qvy.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2019 07:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7XDtT+R+j+Gort2OZw6NF6IRipFP5JGZB9Hq2a/P3nk=;
 b=Lc5cvUekzkyLziO9fb5pfZnbiBbOH+gLF8yk6gu32Y682jmjszG2KeVLFI01AMs7MW
 e9zl88qYRoC7dLqHyng3vjm+RARX7T9cp+w8hWbP9kAUIdUytjucIMSiaMHkA/26iM6k
 vnG1qSMN2bbDIRnXnbURRP0+qR2fpEDCi9zeeQbLZAyvoZKLAOoikMPPu//Hn3gNDOqP
 WFGmxqHVUtvVy2tfHfT0cgy+nwWGdIIULtYp2jqYUzFrSDS8P5sQjO/gWOGfoPZ3mUkU
 Yd5LOgGX6Xgu+NqMc6XbUC3Z8WgGLIyc073eRisPVkLH2Xo3LIlul9G7/qMNr0R3T+Kx
 Ib1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7XDtT+R+j+Gort2OZw6NF6IRipFP5JGZB9Hq2a/P3nk=;
 b=h+PoqQgYDr834UVWFFy5KqE9SN05vYbyUeEbubVXW7qwvkp39cgyg3jWlq2m6CxIHl
 rpSEbRlmKD2aR6m6nsowXtyI2xFDpkWRqh3kb5vkAw+LmdMsJ1d6gDoDYYH0Bo1Glbus
 dh7lKI7A7Q2W4UakgYI1m0oYhDqnb+46JSmRKfNEX9OGMc1BTfoSPvjjZjvFFhngbX/G
 RlNNBgvTaGdVyu7aWsVeL4Wyv30J3NgQCmdONB9kqc2+Y6EQ1uyl4fPgIXC7+RzF8Puz
 evBkviQWltrjCYQhWPVT6t++dsIg2BY+Mi69bOrxmL2Pj7c8DioLuoodRKJlZwbEMDHF
 MxYA==
X-Gm-Message-State: APjAAAXdPrsg6RXN8NqmO2P8ZcYu3xpAFdQ4uFpkBcn8HTzsnOZKzVqg
 j+I7Gafg/Ljd0f4bWAqgIg7kOfsv
X-Google-Smtp-Source: APXvYqyVSYwvynQbLNatqp0j54rTE7mMPz8nZCukOyzPs1xZO8BdIO9pt0+fZQMlKrTxN9Tw9kyvdw==
X-Received: by 2002:a05:6214:5ac:: with SMTP id
 by12mr28750820qvb.74.1575992880505; 
 Tue, 10 Dec 2019 07:48:00 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id m29sm1247848qtf.1.2019.12.10.07.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 07:47:59 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 10 Dec 2019 10:47:24 -0500
Message-Id: <82d9e6cb433d40ceb490a49d0aaafb6ec00bda06.1575990937.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1575990937.git.rosbrookn@ainfosec.com>
References: <cover.1575990937.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 09/22] golang/xenlight: define EvLink builtin
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

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KCkRlZmluZSBFdkxp
bmsgYXMgZW1wdHkgc3RydWN0IGFzIHRoZXJlIGlzIGN1cnJlbnRseSBubyByZWFzb24gdGhlIGlu
dGVybmFsIG9mCnRoaXMgdHlwZSBzaG91bGQgYmUgdXNlZCBpbiBHby4KCkltcGxlbWVudCBmcm9t
QyBhbmQgdG9DIGZ1bmN0aW9ucyBhcyBuby1vcHMuCgpTaWduZWQtb2ZmLWJ5OiBOaWNrIFJvc2Jy
b29rIDxyb3Nicm9va25AYWluZm9zZWMuY29tPgpSZXZpZXdlZC1ieTogR2VvcmdlIER1bmxhcCA8
Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgotLS0KIHRvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5s
aWdodC5nbyB8IDEwICsrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvIGIvdG9vbHMv
Z29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCmluZGV4IDZjMzg2OGNkNjkuLmMxZDlmZTg1ZmQg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbworKysgYi90b29s
cy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KQEAgLTIzNSw2ICsyMzUsMTYgQEAgZnVuYyAo
bXZnICpNc1ZtR2VuaWQpIHRvQygpIChDLmxpYnhsX21zX3ZtX2dlbmlkLCBlcnJvcikgewogCXJl
dHVybiBjbXZnLCBuaWwKIH0KIAorLy8gRXZMaW5rIHJlcHJlc2VudHMgYSBsaWJ4bF9ldl9saW5r
LgorLy8KKy8vIFJlcHJlc2VudGVkIGFzIGFuIGVtcHR5IHN0cnVjdCBmb3Igbm93LCBhcyB0aGVy
ZSBpcyBubworLy8gYXBwYXJlbnQgbmVlZCBmb3IgdGhlIGludGVybmFscyBvZiB0aGlzIHR5cGUg
dG8gYmUgZXhwb3NlZAorLy8gdGhyb3VnaCB0aGUgR28gcGFja2FnZS4KK3R5cGUgRXZMaW5rIHN0
cnVjdHt9CisKK2Z1bmMgKGVsICpFdkxpbmspIGZyb21DKGNlbCAqQy5saWJ4bF9ldl9saW5rKSBl
cnJvciAgICAgIHsgcmV0dXJuIG5pbCB9CitmdW5jIChlbCAqRXZMaW5rKSB0b0MoKSAoY2VsIEMu
bGlieGxfZXZfbGluaywgZXJyIGVycm9yKSB7IHJldHVybiB9CisKIHR5cGUgQ29udGV4dCBzdHJ1
Y3QgewogCWN0eCAgICAqQy5saWJ4bF9jdHgKIAlsb2dnZXIgKkMueGVudG9vbGxvZ19sb2dnZXJf
c3RkaW9zdHJlYW0KLS0gCjIuMTkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
