Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CD4CE720
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 17:17:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHUi3-0006zF-Sg; Mon, 07 Oct 2019 15:14:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0SFq=YA=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iHUi1-0006yV-Q9
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 15:14:01 +0000
X-Inumbo-ID: 030b7d3a-e915-11e9-9bee-bc764e2007e4
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 030b7d3a-e915-11e9-9bee-bc764e2007e4;
 Mon, 07 Oct 2019 15:13:26 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id f16so12888805qkl.9
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2019 08:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lBukk/qlgORTmMR549JWa59xhwON8qeH+/C+qvTackQ=;
 b=Nx8zhUBR7MhDgZLMPKV1MYx26hLVuDv48SlVMp55+0tV2v7erCTSDFJAz4/Zfh/E2T
 PnvdobvwWHgqniIkI6JRvX0HEvXc+BPpwqwDsfF/qbiaZic97CggKURyRA3FplGMPTaQ
 nnU/aSlqpHZvwHSG3vUCBghJx+15oUE88oLeoWaOR8aYIRcIy4ms4OJ3umNK4SBUSMwL
 Lu4wNkDRF+YjU9yLApOXsrGo3EBbvgOIXetSYjuL+ojlHA2uqUZFzKTkgmipMLM8Qbk8
 TGLfPjk+ECDQ+w6rpFZaKOJYksEO9YKvjYGzSU1ntcFcbu1Jbqv76zI2RNt7KNXa6Kwe
 lUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lBukk/qlgORTmMR549JWa59xhwON8qeH+/C+qvTackQ=;
 b=dvLK5bdGBqT9EvG5YfPLB6EcCvZfHbOLwsAxYosXW/p8Mjtp4bOJ0wyz+90/ffebJM
 DmVatPvirF3hs0KLxsImID+59a0YZ5eQTS8k8em9xtDsnQnORuyXUfhDno2bQzsPGSWI
 I/h8eKv+Qg85NeBumc8Dr2d79eBwwbv7zAGcsuaEm5tnwI09qIpH9bzAJiJIpZtbqqDx
 btQnSB77iNHL/j3hxMFQsJa5sLsc1460n0Dx3gx6g4/4m1y3pVdwjOww9axtVnIRmQle
 1HItf9GjtvEIDEuWGsbKPBEQBX25DWIW/tRZX2dPoUvoz0uBfNeUXAO0mKHcgkVqpDqO
 FlWw==
X-Gm-Message-State: APjAAAVIT2Be0V2dCeqovJRPLTwuLQTLOfAxfoWPr/+hAy7uXPMW90dO
 4TIyiSMzq1wUw8Rx+kw/Wj0vapYt
X-Google-Smtp-Source: APXvYqzyNSFxMzsUFzZgx++d4TzbQSTKYONgvX306foWV1039FRm3amb3UcVbB/exY9KfT6KtEMZ2g==
X-Received: by 2002:a05:620a:49b:: with SMTP id
 27mr22388047qkr.89.1570461205990; 
 Mon, 07 Oct 2019 08:13:25 -0700 (PDT)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id c185sm8354313qkg.74.2019.10.07.08.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 08:13:25 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  7 Oct 2019 11:12:56 -0400
Message-Id: <87f082bdf06e820e911256138a7380d0cf7019a2.1570456846.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1570456846.git.rosbrookn@ainfosec.com>
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 09/24] golang/xenlight: define MsVmGenid builtin
 type
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
cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KLS0tCkNjOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CgogdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxp
Z2h0LmdvIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMyBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0
LmdvIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCmluZGV4IDNiNzgyNGIyODQu
LjZhY2E1Yjg5YzAgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5n
bworKysgYi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KQEAgLTIxNiw2ICsyMTYs
MjkgQEAgZnVuYyAobWFjICpNYWMpIHRvQygpIChDLmxpYnhsX21hYywgZXJyb3IpIHsKIAlyZXR1
cm4gY21hYywgbmlsCiB9CiAKKy8vIE1zVm1HZW5pZCByZXByZXNlbnRzIGEgbGlieGxfbXNfdm1f
Z2VuaWQuCit0eXBlIE1zVm1HZW5pZCBbaW50KEMuTElCWExfTVNfVk1fR0VOSURfTEVOKV1ieXRl
CisKK2Z1bmMgKG12ZyAqTXNWbUdlbmlkKSBmcm9tQyhjbXZnICpDLmxpYnhsX21zX3ZtX2dlbmlk
KSBlcnJvciB7CisJYiA6PSAoKltpbnQoQy5MSUJYTF9NU19WTV9HRU5JRF9MRU4pXUMudWludDhf
dCkodW5zYWZlLlBvaW50ZXIoJmNtdmcuYnl0ZXNbMF0pKQorCisJZm9yIGksIHYgOj0gcmFuZ2Ug
YiB7CisJCW12Z1tpXSA9IGJ5dGUodikKKwl9CisKKwlyZXR1cm4gbmlsCit9CisKK2Z1bmMgKG12
ZyAqTXNWbUdlbmlkKSB0b0MoKSAoQy5saWJ4bF9tc192bV9nZW5pZCwgZXJyb3IpIHsKKwl2YXIg
Y212ZyBDLmxpYnhsX21zX3ZtX2dlbmlkCisKKwlmb3IgaSwgdiA6PSByYW5nZSBtdmcgeworCQlj
bXZnLmJ5dGVzW2ldID0gQy51aW50OF90KHYpCisJfQorCisJcmV0dXJuIGNtdmcsIG5pbAorfQor
CiB0eXBlIENvbnRleHQgc3RydWN0IHsKIAljdHggICAgKkMubGlieGxfY3R4CiAJbG9nZ2VyICpD
LnhlbnRvb2xsb2dfbG9nZ2VyX3N0ZGlvc3RyZWFtCi0tIAoyLjE5LjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
