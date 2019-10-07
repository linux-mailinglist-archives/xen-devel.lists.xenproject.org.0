Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6568ECE70C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 17:16:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHUhK-0006h5-ER; Mon, 07 Oct 2019 15:13:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0SFq=YA=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iHUhI-0006h0-Mr
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 15:13:16 +0000
X-Inumbo-ID: fcc06b0c-e914-11e9-96dc-bc764e2007e4
Received: from mail-qk1-x72a.google.com (unknown [2607:f8b0:4864:20::72a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fcc06b0c-e914-11e9-96dc-bc764e2007e4;
 Mon, 07 Oct 2019 15:13:16 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id h126so12879866qke.10
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2019 08:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oWJZ5CTiBpzeFNA7EhUYLbX0ZPSm7z4GXDaqYPNz3qY=;
 b=VrcfyKvOjgq2uteiByuJBN/H3Js0c+otDFnOzJefdWL1CkGSgknfFo+moRWfUNn+DU
 zKnxOClcyEt2o2e2wjCi3+jt3yV6ZkSB9Wje2wtK/6rKy5nPmNrBbrOqfaFAALuX4650
 PdIV4A5YD9H48W/hRYcn7OYr8lgXXN0MPUS1Z7vklCuNjqGIupM5yX+lDT5jia1pYdcQ
 OwVg2YYd6DXz5YgHbo02C/CIXYsAWjdLrojcHBC6Rb/ggZXsM8Z5bYa0mjDgag6+fyPb
 KNub7md0SI+uBzUY5I6ZpdVnypHITrW25k2EBcQV056GbiO4FLCt8drmmnSfblJ3bMPQ
 UqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oWJZ5CTiBpzeFNA7EhUYLbX0ZPSm7z4GXDaqYPNz3qY=;
 b=V6r/SCrUav8Pf+CLfU3rX8savMFOQDM4vOCA0myltx1VFn5uCEm5jAPgh5EnnO0wqN
 UFKcl+cvLRxuJlrNBiI3WdlXAMlPlRnpwhDq4BViZwvzI+wLEwHVX9WM/owjm6+ZGL/k
 Fp6qgeezARV4eURxeCPhj4v4eCaals2hWavn5LM/SGlhLprfKyJV3/MaLMHH2vSD49eQ
 ZMH8mRK70xAiyxO1YWd+fiLzkOL5JsJOoWbqVUZDeSpCCENO/Iej76cCT3ocgBoGod6X
 RSoeG+O+s8IiCVb69QVbHXGQNzNq6jzhk3QfxRD4mku3tlY9ZmvAHHDwcvFtAu/iKyJD
 BHPw==
X-Gm-Message-State: APjAAAUcBRNXr4VeQhSJn4PynfqhGJGgiggu+yE9LvxHSOQgLkHAGPju
 PojyV5HL3Fw1qxfOLQFlFcnv9ifeJp4=
X-Google-Smtp-Source: APXvYqx/d1n+e+xPvEYL5sMwPGOsPdzwvrxRnFjC5RMx5RPPyoXJSn0t9Qc3Yf+kj8mv1Pj4qfYewA==
X-Received: by 2002:a37:7d43:: with SMTP id y64mr24200382qkc.168.1570461195176; 
 Mon, 07 Oct 2019 08:13:15 -0700 (PDT)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id c185sm8354313qkg.74.2019.10.07.08.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 08:13:14 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  7 Oct 2019 11:12:47 -0400
Message-Id: <cover.1570456846.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 00/24] generated Go libxl bindings using IDL
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

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KCkFmdGVyIFhlbiBz
dW1taXQsIHdlIHN0YXJ0ZWQgdGhlIGRpc2N1c3Npb24gaW4gdGhpc1sxXSBSRkMgdGhyZWFkCnRv
IGZpZ3VyZSBvdXQgaG93IHRvIGdlbmVyYXRlIEdvIGJpbmRpbmdzIGZvciBsaWJ4bC4gVGhpcyBz
ZXJpZXMKaW1wbGVtZW50cyB0aGF0IEdvIGNvZGUgZ2VuZXJhdGlvbiB1c2luZyB0aGUgZXhpc3Rp
bmcgSURMLCBhbmQgdXBkYXRlcwp0aGUgZXhpc3RpbmcgaGFuZC13cml0dGVuIGNvZGUgaW4geGVu
bGlnaHQuZ28gdG8gdXNlIHRoZSBnZW5lcmF0ZWQKY29kZS4KClRoZSBnb2FsIG9mIHRoaXMgc2Vy
aWVzIGlzIHRvIHByb3ZpZGUgYSBnb29kIGZvdW5kYXRpb24gZm9yIGNvbnRpbnVlZApkZXZlbG9w
bWVudCBvZiB0aGUgR28gcGFja2FnZS4KClRoZXNlIHBhdGNoZXMgY2FuIGFsc28gYmUgZm91bmQg
b24gbXkgR2l0SHViIGJyYW5jaFsyXS4KClsxXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDcvbXNnMDIyNTkuaHRtbApbMl0gaHR0cHM6
Ly9naXRodWIuY29tL2VucjBuL3hlbi90cmVlL2dvbGFuZy1wYXRjaGVzLXYxCgpOaWNrIFJvc2Jy
b29rICgyNCk6CiAgZ29sYW5nL3hlbmxpZ2h0OiBmaXggY2FsbHMgdG8gbGlieGxfZG9tYWluX3Vu
cGF1c2UvcGF1c2UKICBnb2xhbmcveGVubGlnaHQ6IGdlbmVyYXRlIGVudW0gdHlwZXMgZnJvbSBJ
REwKICBnb2xhbmcveGVubGlnaHQ6IGRlZmluZSBEZWZib29sIGJ1aWx0aW4gdHlwZQogIGdvbGFu
Zy94ZW5saWdodDogZGVmaW5lIERldmlkIHR5cGUgYXMgaW50CiAgZ29sYW5nL3hlbmxpZ2h0OiBk
ZWZpbmUgS2V5VmFsdWVMaXN0IGJ1aWx0aW4gdHlwZQogIGdvbGFuZy94ZW5saWdodDogcmUtbmFt
ZSBCaXRtYXAgbWFyc2hhbGluZyBmdW5jdGlvbnMKICBnb2xhbmcveGVubGlnaHQ6IGRlZmluZSBT
dHJpbmdMaXN0IGJ1aWx0aW4gdHlwZQogIGdvbGFuZy94ZW5saWdodDogZGVmaW5lIE1hYyBidWls
dGluIHR5cGUKICBnb2xhbmcveGVubGlnaHQ6IGRlZmluZSBNc1ZtR2VuaWQgYnVpbHRpbiB0eXBl
CiAgZ29sYW5nL3hlbmxpZ2h0OiBkZWZpbmUgRXZMaW5rIGJ1aWx0aW4gYXMgZW1wdHkgc3RydWN0
CiAgZ29sYW5nL3hlbmxpZ2h0OiBkZWZpbmUgQ3B1aWRQb2xpY3lMaXN0IGJ1aWx0aW4gdHlwZQog
IGdvbGFuZy94ZW5saWdodDogcmUtZmFjdG9yIFV1aWQgdHlwZSBpbXBsZW1lbnRhdGlvbgogIGdv
bGFuZy94ZW5saWdodDogcmUtZmFjdG9yIEh3Y2FwIHR5cGUgaW1wbGVtZW50YXRpb24KICBnb2xh
bmcveGVubGlnaHQ6IGdlbmVyYXRlIHN0cnVjdHMgZnJvbSB0aGUgSURMCiAgZ29sYW5nL3hlbmxp
Z2h0OiByZW1vdmUgbm8tbG9uZ2VyIHVzZWQgdHlwZSBNZW1LQgogIGdvbGFuZy94ZW5saWdodDog
YmVnaW4gQyB0byBHbyB0eXBlIG1hcnNoYWxpbmcKICBnb2xhbmcveGVubGlnaHQ6IGltcGxlbWVu
dCBrZXllZCB1bmlvbiBDIHRvIEdvIG1hcnNoYWxpbmcKICBnb2xhbmcveGVubGlnaHQ6IGltcGxl
bWVudCBhcnJheSBDIHRvIEdvIG1hcnNoYWxpbmcKICBnb2xhbmcveGVubGlnaHQ6IGJlZ2luIEdv
IHRvIEMgdHlwZSBtYXJzaGFsaW5nCiAgZ29sYW5nL3hlbmxpZ2h0OiBpbXBsZW1lbnQga2V5ZWQg
dW5pb24gR28gdG8gQyBtYXJzaGFsaW5nCiAgZ29sYW5nL3hlbmxpZ2h0OiBpbXBsZW1lbnQgYXJy
YXkgR28gdG8gQyBtYXJzaGFsaW5nCiAgZ29sYW5nL3hlbmxpZ2h0OiByZXZpc2UgdXNlIG9mIENv
bnRleHQgdHlwZQogIGdvbGFuZy94ZW5saWdodDogYWRkIGVycm9yIHJldHVybiB0eXBlIHRvIENv
bnRleHQuQ3B1cG9vbGluZm8KICBnb2xhbmcveGVubGlnaHQ6IGFkZCBtYWtlIHRhcmdldCBmb3Ig
Z2VuZXJhdGVkIGZpbGVzCgogdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L01ha2VmaWxlICAgICAgICAg
ICAgfCAgIDIyICstCiB0b29scy9nb2xhbmcveGVubGlnaHQvZ2VuZ290eXBlcy5weSAgICAgICB8
ICA2OTggKysrKysKIHRvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbyAgICAgICAgIHwg
IDkyOCArKystLS0KIHRvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodF9oZWxwZXJzLmdvIHwg
MzQwNCArKysrKysrKysrKysrKysrKysrKysKIHRvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdo
dF90eXBlcy5nbyAgIHwgMTIxMiArKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA1NzI3IGluc2Vy
dGlvbnMoKyksIDUzNyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9nb2xh
bmcveGVubGlnaHQvZ2VuZ290eXBlcy5weQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2dvbGFu
Zy94ZW5saWdodC94ZW5saWdodF9oZWxwZXJzLmdvCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMv
Z29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0X3R5cGVzLmdvCgpDYzogR2VvcmdlIER1bmxhcCA8Z2Vv
cmdlLmR1bmxhcEBjaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNp
dHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLSAKMi4xOS4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
