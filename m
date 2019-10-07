Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A354CE70D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 17:16:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHUhy-0006wQ-IR; Mon, 07 Oct 2019 15:13:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0SFq=YA=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iHUhw-0006vi-N6
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 15:13:56 +0000
X-Inumbo-ID: 02433816-e915-11e9-9bee-bc764e2007e4
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02433816-e915-11e9-9bee-bc764e2007e4;
 Mon, 07 Oct 2019 15:13:25 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id u22so12880653qkk.11
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2019 08:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HAvGISQ6Hj/ngZwWekmPgCL2zhfgRNQEGjJgKrLszak=;
 b=ItZvXRStLPiJaiwubiuFCppj/IPOZ9MNMXmcKn6ljBwlV6kULoAURJ2HhKdo1jyVah
 mn7p3Axl9DoEoo5uXYQfQQiyaozttI6kL2xtNM2lhfrPVJkz1/wn99mxjqxcuFefo+jx
 gMfyjwEqlLToqCipAyIVvFCzsXR6LkXHe6brkoPyYq5Qw2j3Z/Vn8dzuQ2OW8govHRvs
 iVAopQt/bUjhZwTr0oDFpkBfdZJ5ow9GzFVgui0LvAFLdpEQm3tnF8JrS1wpfYmqZn3b
 QSp4tAeSzLA9u67WZA9A0//9fk6uMfz85WiFqGWkZBmRB/JMz87QRZvFUZn4vN1JWdGw
 2lyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HAvGISQ6Hj/ngZwWekmPgCL2zhfgRNQEGjJgKrLszak=;
 b=nj+ttLMJDW8SQ2oiAti2BrYMugPsKWM0auQVFL/9WtBrvmwUljj7/sVud1g2neukz8
 NOKy8lZS4h2Agavvh1EPXPJIjqZ9BqLVQZl/YrdyDtX2FdAw7wdjmZE4KmnuJkG25RXZ
 qmmFlEFAvABYZncHESRsfy+YzLS09IVzRoRbKheZNteJaQgJtzCAbapC3fHAUsDhdJY6
 8eKr9vIhh0B8HWz4g2SBilDwCdC1S0AQhRIACVOw+u3tW3ZEcfAQAOCRMj5fUodJ1gpY
 HLBZSxrSnRctVii6I6Ju9QWIlZxUHjCIVc4zGtbQEzal07WdEF/bPJEN0VDoVYVo/l7z
 omag==
X-Gm-Message-State: APjAAAXIuAzUeHT8L25is2P49gIqeRR7EFEG62Pp/yStQ5RUqDueDQ2a
 qrXB3xceVKNhDKCYWFxyEE6abBHN
X-Google-Smtp-Source: APXvYqwOrh3eWMn2yfCqFXSG2w+ztOflgE+1c8MnNwX9tU/HIqErc3YMQ6CCpUv/VyMnC+nsiDqrdg==
X-Received: by 2002:a37:684f:: with SMTP id d76mr8217403qkc.415.1570461204706; 
 Mon, 07 Oct 2019 08:13:24 -0700 (PDT)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id c185sm8354313qkg.74.2019.10.07.08.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 08:13:24 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  7 Oct 2019 11:12:55 -0400
Message-Id: <c3740e59a9c5aecb69c9b075aab23d4a427c07bf.1570456846.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1570456846.git.rosbrookn@ainfosec.com>
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 08/24] golang/xenlight: define Mac builtin type
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

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KCkRlZmluZSBNYWMg
YXMgWzZdYnl0ZSBhbmQgaW1wbGVtZW50IGZyb21DLCB0b0MsIGFuZCBTdHJpbmcgZnVuY3Rpb25z
LgoKU2lnbmVkLW9mZi1ieTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4K
LS0tCkNjOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CkNjOiBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5v
cmc+CgogdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvIHwgMzUgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28gYi90b29scy9nb2xh
bmcveGVubGlnaHQveGVubGlnaHQuZ28KaW5kZXggYTNhMTgzNmQzMS4uM2I3ODI0YjI4NCAxMDA2
NDQKLS0tIGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCisrKyBiL3Rvb2xzL2dv
bGFuZy94ZW5saWdodC94ZW5saWdodC5nbwpAQCAtMTgxLDYgKzE4MSw0MSBAQCBmdW5jIChkICpE
ZWZib29sKSB0b0MoKSAoQy5saWJ4bF9kZWZib29sLCBlcnJvcikgewogCXJldHVybiBjLCBuaWwK
IH0KIAorLy8gTWFjIHJlcHJlc2VudHMgYSBsaWJ4bF9tYWMsIG9yIHNpbXBseSBhIE1BQyBhZGRy
ZXNzLgordHlwZSBNYWMgWzZdYnl0ZQorCisvLyBTdHJpbmcgZm9ybWF0cyBhIE1hYyBhZGRyZXNz
IHRvIHN0cmluZyByZXByZXNlbnRhdGlvbi4KK2Z1bmMgKG1hYyBNYWMpIFN0cmluZygpIHN0cmlu
ZyB7CisJcyA6PSAiJXg6JXg6JXg6JXg6JXg6JXgiCisJb3B0cyA6PSBtYWtlKFtdaW50ZXJmYWNl
e30sIDYpCisKKwlmb3IgaSwgdiA6PSByYW5nZSBtYWMgeworCQlvcHRzW2ldID0gdgorCX0KKwor
CXJldHVybiBmbXQuU3ByaW50ZihzLCBvcHRzLi4uKQorfQorCitmdW5jIChtYWMgKk1hYykgZnJv
bUMoY21hYyAqQy5saWJ4bF9tYWMpIGVycm9yIHsKKwliIDo9ICgqWzZdQy51aW50OF90KSh1bnNh
ZmUuUG9pbnRlcihjbWFjKSkKKworCWZvciBpLCB2IDo9IHJhbmdlIGIgeworCQltYWNbaV0gPSBi
eXRlKHYpCisJfQorCisJcmV0dXJuIG5pbAorfQorCitmdW5jIChtYWMgKk1hYykgdG9DKCkgKEMu
bGlieGxfbWFjLCBlcnJvcikgeworCXZhciBjbWFjIEMubGlieGxfbWFjCisKKwlmb3IgaSwgdiA6
PSByYW5nZSBtYWMgeworCQljbWFjW2ldID0gQy51aW50OF90KHYpCisJfQorCisJcmV0dXJuIGNt
YWMsIG5pbAorfQorCiB0eXBlIENvbnRleHQgc3RydWN0IHsKIAljdHggICAgKkMubGlieGxfY3R4
CiAJbG9nZ2VyICpDLnhlbnRvb2xsb2dfbG9nZ2VyX3N0ZGlvc3RyZWFtCi0tIAoyLjE5LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
