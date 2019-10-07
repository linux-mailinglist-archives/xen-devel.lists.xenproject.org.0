Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 938E2CE70E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 17:16:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHUi8-00071p-9N; Mon, 07 Oct 2019 15:14:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0SFq=YA=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iHUi6-00071B-Nf
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 15:14:06 +0000
X-Inumbo-ID: 03da0830-e915-11e9-96dc-bc764e2007e4
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03da0830-e915-11e9-96dc-bc764e2007e4;
 Mon, 07 Oct 2019 15:13:28 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id y144so12883638qkb.7
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2019 08:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fLq7XQ92BeMVsT2m2BhvNxEhlUOlCOEk5KSB4uowWIE=;
 b=Q81wZkCsKx46eQhWV8L2sbayyfCOfVFL5x9+nYg9mRIx/Gb9AFIkQsmo73a3w4hzST
 4Kdp3GSOLBuXDf5NDmSaoMZ2kFwTs80YjNivzD8zbQeZ0cSvW8s88Rmn8zXZVcJMaxdw
 B0ypi8Mkk+5JmX5jpps/N5cDP4fcOaQwlDXE2xUpHp7UcEayVCe6no9DmuNQj7rVRZjJ
 8TX2x6hF9bND+hoK5SA6Tj1kMrY8oTHSF1h564vdUKNTtBeLUAoNRWX3t+jfVVuf3TYt
 96A5peu0xp2juJQk8lAJ/D6CfR4UGthbLEyuk+fFVycQvQdb8Rk8Jj9Z6kVNY4mWqaD7
 rDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fLq7XQ92BeMVsT2m2BhvNxEhlUOlCOEk5KSB4uowWIE=;
 b=i9sot6GPVC5L/bdCQynK23VCP3VnRzQ66wBT9AWGyiuD4K1UWja0UbCmA96FtYzKKs
 9nAD7SxfnMYMRxU5axYPnDP4pqORxxrkR0ztd9KbfVq8EUzrZnU2j2CS0eDRACUpzk8+
 8qh1OJcAsg1uMwQJAHZFzdHPsxI5vVGXBPW5TeewGmBB9BAnXlR6uFhJzZGxS3M7X9BR
 tp1DqJbSsc2yaBNThKSQAULUK84L0wpN5fcOc4883IE1d3K+TZDqgI1Kcb3Y2UVIbIPY
 yxwiNDNFYJDLk70AD2xQa210C6838jk1Y1+KTUyzBL2PrwqG/9RiGyXYvqrBstxAvTqc
 OhYQ==
X-Gm-Message-State: APjAAAXFROvGstzuU2F0jQrh6XpY6MOxC7cN9MA8wmqaq40+O//b4VYn
 5yhSCscbi+u8xC1mBOv5EirKR9ar
X-Google-Smtp-Source: APXvYqyExoxNgEv29+weTL5IDJS5aSgcK3LVbAaklEnbAST8oZ4pYomZHz/1p/4zPZx8Brwyvj9umw==
X-Received: by 2002:a37:488d:: with SMTP id
 v135mr22142824qka.284.1570461207332; 
 Mon, 07 Oct 2019 08:13:27 -0700 (PDT)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id c185sm8354313qkg.74.2019.10.07.08.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 08:13:26 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  7 Oct 2019 11:12:57 -0400
Message-Id: <d79f3b7c36f636c42700cf977e2c769cc15bf255.1570456846.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1570456846.git.rosbrookn@ainfosec.com>
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 10/24] golang/xenlight: define EvLink builtin as
 empty struct
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
b29rIDxyb3Nicm9va25AYWluZm9zZWMuY29tPgotLS0KQ2M6IEdlb3JnZSBEdW5sYXAgPGdlb3Jn
ZS5kdW5sYXBAY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRy
aXguY29tPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KCiB0b29scy9nb2xhbmcveGVubGlnaHQv
eGVubGlnaHQuZ28gfCAxMCArKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbyBiL3Rv
b2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbwppbmRleCA2YWNhNWI4OWMwLi5kNDFkZTI1
M2YzIDEwMDY0NAotLS0gYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KKysrIGIv
dG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCkBAIC0yMzksNiArMjM5LDE2IEBAIGZ1
bmMgKG12ZyAqTXNWbUdlbmlkKSB0b0MoKSAoQy5saWJ4bF9tc192bV9nZW5pZCwgZXJyb3IpIHsK
IAlyZXR1cm4gY212ZywgbmlsCiB9CiAKKy8vIEV2TGluayByZXByZXNlbnRzIGEgbGlieGxfZXZf
bGluay4KKy8vCisvLyBSZXByZXNlbnRlZCBhcyBhbiBlbXB0eSBzdHJ1Y3QgZm9yIG5vdywgYXMg
dGhlcmUgaXMgbm8KKy8vIGFwcGFyZW50IG5lZWQgZm9yIHRoZSBpbnRlcm5hbHMgb2YgdGhpcyB0
eXBlIHRvIGJlIGV4cG9zZWQKKy8vIHRocm91Z2ggdGhlIEdvIHBhY2thZ2UuCit0eXBlIEV2TGlu
ayBzdHJ1Y3R7fQorCitmdW5jIChlbCAqRXZMaW5rKSBmcm9tQyhjZWwgKkMubGlieGxfZXZfbGlu
aykgZXJyb3IgICAgICB7IHJldHVybiBuaWwgfQorZnVuYyAoZWwgKkV2TGluaykgdG9DKCkgKGNl
bCBDLmxpYnhsX2V2X2xpbmssIGVyciBlcnJvcikgeyByZXR1cm4gfQorCiB0eXBlIENvbnRleHQg
c3RydWN0IHsKIAljdHggICAgKkMubGlieGxfY3R4CiAJbG9nZ2VyICpDLnhlbnRvb2xsb2dfbG9n
Z2VyX3N0ZGlvc3RyZWFtCi0tIAoyLjE5LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
