Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A51BA109B81
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 10:52:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZXUF-0005gv-Oq; Tue, 26 Nov 2019 09:50:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sBoB=ZS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iZXUE-0005gq-2H
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 09:50:22 +0000
X-Inumbo-ID: 28ed7438-1032-11ea-9db0-bc764e2007e4
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28ed7438-1032-11ea-9db0-bc764e2007e4;
 Tue, 26 Nov 2019 09:50:21 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b11so2435484wmj.4
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2019 01:50:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3droLOD4K/JwPpt9s2Zear4XAt/XVnjXGbD3F1jiO10=;
 b=HMOZQRch7yAY1kOx6D1IqaeHgyAuiDeCuanufwWOPHQRWg5utLDeYzCJWwO8xU2dXY
 g0fwW3MDDNClyHymy5SL/GAqUbKcak+LN9kFViTrZuWAQLHXTr3mfPqoJbAzP71qD9Hn
 bWA+0d9WlujwwoSSrHy7nnQaW+abY7+cVzsRHznOexUSst1lD3xQhiX1R+xqiUT9qrWS
 eE1BrB3WNgR/lpARc9lBOII/H/cl/7k6sxsU36I5aiIB5pWJAFYbfVHvwt8SYjTe29J5
 u0FONwKs9y0G1QbkjHENMrw+uj7Ulv7mvbZXeLqk4xcHWcppOpuWPmW+fXSQQwtYP1Ta
 h38g==
X-Gm-Message-State: APjAAAUA5voMgerM9amcsKn6e1qixHJkrnsBXHsbLo7QjWD52Ct4yIB6
 gOyVZ1bSbNudJzy/jQaYc6Y=
X-Google-Smtp-Source: APXvYqwWz4UcOHRfTsOMmMxOuWlQiip56BBmvghGkba4ZhPxUwL0a2egObW0VhWt/gJqkln/F4tLqw==
X-Received: by 2002:a1c:2703:: with SMTP id n3mr1140032wmn.94.1574761820592;
 Tue, 26 Nov 2019 01:50:20 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id d67sm2378891wmd.13.2019.11.26.01.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 01:50:20 -0800 (PST)
Date: Tue, 26 Nov 2019 09:50:18 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191126095018.c7yy2qkqwsodpvhz@debian>
References: <59a11ca9-d0df-f24d-b1df-8b1e02e73e3f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <59a11ca9-d0df-f24d-b1df-8b1e02e73e3f@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] EFI: fix "efi=attr=" handling
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDk6MjU6MjdBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQ29tbWl0IDYzM2E0MDk0NzMyMSAoImRvY3M6IEltcHJvdmUgZG9jdW1lbnRhdGlvbiBh
bmQgcGFyc2luZyBmb3IgZWZpPSIpCj4gZmFpbGVkIHRvIGhvbm9yIHRoZSBzdHJjbXAoKS1saWtl
IHJldHVybiB2YWx1ZSBjb252ZW50aW9uIG9mCj4gY21kbGluZV9zdHJjbXAoKS4KPiAKPiBSZXBv
cnRlZC1ieTogUm9tYW4gU2hhcG9zaG5payA8cm9tYW5AemVkZWRhLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExp
dSA8d2xAeGVuLm9yZz4KCj4gCj4gLS0tIGEveGVuL2NvbW1vbi9lZmkvYm9vdC5jCj4gKysrIGIv
eGVuL2NvbW1vbi9lZmkvYm9vdC5jCj4gQEAgLTE0MzAsOSArMTQzMCw5IEBAIHN0YXRpYyBpbnQg
X19pbml0IHBhcnNlX2VmaV9wYXJhbShjb25zdAo+ICAgICAgICAgIH0KPiAgICAgICAgICBlbHNl
IGlmICggKHNzIC0gcykgPiA1ICYmICFtZW1jbXAocywgImF0dHI9IiwgNSkgKQo+ICAgICAgICAg
IHsKPiAtICAgICAgICAgICAgaWYgKCBjbWRsaW5lX3N0cmNtcChzICsgNSwgInVjIikgKQo+ICsg
ICAgICAgICAgICBpZiAoICFjbWRsaW5lX3N0cmNtcChzICsgNSwgInVjIikgKQo+ICAgICAgICAg
ICAgICAgICAgZWZpX21hcF91YyA9IHRydWU7Cj4gLSAgICAgICAgICAgIGVsc2UgaWYgKCBjbWRs
aW5lX3N0cmNtcChzICsgNSwgIm5vIikgKQo+ICsgICAgICAgICAgICBlbHNlIGlmICggIWNtZGxp
bmVfc3RyY21wKHMgKyA1LCAibm8iKSApCj4gICAgICAgICAgICAgICAgICBlZmlfbWFwX3VjID0g
ZmFsc2U7Cj4gICAgICAgICAgICAgIGVsc2UKPiAgICAgICAgICAgICAgICAgIHJjID0gLUVJTlZB
TDsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
