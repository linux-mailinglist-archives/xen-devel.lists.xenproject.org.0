Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C33FE5F9
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 20:48:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVhXO-0001bm-0w; Fri, 15 Nov 2019 19:45:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1SQg=ZH=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iVhXM-0001aq-H4
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 19:45:44 +0000
X-Inumbo-ID: 6ea6e856-07e0-11ea-984a-bc764e2007e4
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ea6e856-07e0-11ea-984a-bc764e2007e4;
 Fri, 15 Nov 2019 19:45:09 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id g50so12019001qtb.4
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 11:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yIKE28IiCJePAebvr71To/XfB6LztVzOY2vbjyqk3z4=;
 b=CuaLg6r+bTujubNErxZLKyRvtZbIPUl8+b17QmVXbM0MynzIy8WlHveySxmSUTXwns
 Nz37Tm9FQGyMcfZiYMLB9UmJkfQF71aeyf2kCwVQvMJtL10KfSynvmD8Fw4gING2A/Zu
 0+QUg5InLo/KuvSn0VjQ6hPAYTdhXy9klYtcas9euG6EkJy3P0+ammqjPYKZS0S3Y9hH
 2hPoeX25GEbjH/XFPiNg35wxqhXh+SOk/hx1NBlXxWRTj+tLKGa2LGLprD7QNb7x7jRn
 NnP6x80mPyq5MKmfwNo3WUeK7XiumKmftmgFYmVx8JFbFn7ZRWmJKtHCtKyNE7a4QCAd
 LA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yIKE28IiCJePAebvr71To/XfB6LztVzOY2vbjyqk3z4=;
 b=AegV5pLTlGqA49S5DKbqXPbhKGIPXkQJyGOwkTjQCFeakSQ/bYs0l6bPgAIKddH97T
 vdUVO/nNRhwGee4j/o4xYIZ50a1W46MzKDd6Rc9cdMSkdbOThlevvkwo9gmI1tK4QlKa
 Gh/YHYMI+iOtlUIszdMMVuSjBGhxhFnIhTuFku9mWX0yva6oGnYajztregy7ov+oGt68
 /3r6eJaObkekGV9eZsJs1yDXYtB96LEIRa19UF1GF4mikpCeOLKGetcpxafC/wLvfpX3
 R+ESCIn14F0TaZu41mu68lfKmWNEBiabjFPnYzCb89Utkra07MvsSL+41+35ftwe353H
 FpzA==
X-Gm-Message-State: APjAAAWrFpSrz34b3vwQs0QM8BbfY2bVewChBjn7S6KkW1X9YRiJspzB
 C2tjspLtj6UM1Q7JobAXJ5WvQNDo
X-Google-Smtp-Source: APXvYqzPeul66xhKuVn3nB2zDBbjXNf2YxW/20bUKwdHivXWe6jY43iTXuvtLEo3k67Pxdx7z8vnIw==
X-Received: by 2002:ac8:289d:: with SMTP id i29mr16060038qti.24.1573847109214; 
 Fri, 15 Nov 2019 11:45:09 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id y10sm4649679qkb.55.2019.11.15.11.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 11:45:08 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 15 Nov 2019 14:44:16 -0500
Message-Id: <20897c448928542edca3493e54c589611dd81948.1573840474.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1573840473.git.rosbrookn@ainfosec.com>
References: <cover.1573840473.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 09/22] golang/xenlight: define EvLink builtin
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
Z29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCmluZGV4IDEwOGI1MDEyNGEuLmQ1N2Y3ODAxMTYg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbworKysgYi90b29s
cy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KQEAgLTIzOSw2ICsyMzksMTYgQEAgZnVuYyAo
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
