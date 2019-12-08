Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B2C116182
	for <lists+xen-devel@lfdr.de>; Sun,  8 Dec 2019 13:22:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idvWU-00024O-LT; Sun, 08 Dec 2019 12:18:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+SuD=Z6=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1idvWT-00024J-7Z
 for xen-devel@lists.xenproject.org; Sun, 08 Dec 2019 12:18:49 +0000
X-Inumbo-ID: e1e3fcf7-19b4-11ea-86b4-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1e3fcf7-19b4-11ea-86b4-12813bfff9fa;
 Sun, 08 Dec 2019 12:18:47 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w15so12928302wru.4
 for <xen-devel@lists.xenproject.org>; Sun, 08 Dec 2019 04:18:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JMityAnGUYcIyMLuZzC9xhNmi70qsskFxYCA6C2M1E0=;
 b=UMbYM5XGl1XwAOlxz09iMCN0PTySVUbzNM6tI7Kvc3SE8vfgxkpvuOQxiGxG9KyrSd
 T66JWEhUGKXCsAokog/KB+zHcNfIJYjTQOOTQS39B770udg64MiGjPBlCQiJGlddcG4w
 5/QWpAmMfNijJ9se35B21V3l5PRHerJ9DqjZn1mY+TKShl6XhPDrf4HsI7NM9Hnkebiz
 tODnDuQjmjUoMBkXTZEXs+vDwkqOic7scL7XVDI9zU6hv8KcqQMWuhBOf+QpCKtmTcej
 ODR1d8vxT6nOMf4FBZWy51RzMmhOOq0jth/L8yIdoblsC8Jvdnv1tN+dmQKAlKjusN+u
 mqYQ==
X-Gm-Message-State: APjAAAUrJNCwYWgCRYkJSGWvpsnPQuWFlSxrdJBUheNhrRs0YE0wUj05
 elpXvDHa4JojKEs4xhE+emI=
X-Google-Smtp-Source: APXvYqy+5DmdtG3OLBPmuoyuDQ4DPHRS5qFwGlOyk+Hu0wRlXW3+zwK9udRwcYjlIOIrF9PVfkVY9g==
X-Received: by 2002:adf:ce87:: with SMTP id r7mr24815484wrn.245.1575807526820; 
 Sun, 08 Dec 2019 04:18:46 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-225.amazon.com.
 [54.240.197.225])
 by smtp.gmail.com with ESMTPSA id i10sm23627162wru.16.2019.12.08.04.18.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Dec 2019 04:18:46 -0800 (PST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191205223008.8623-1-andrew.cooper3@citrix.com>
 <20191205223008.8623-4-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b64d0f83-dd3d-9c5b-8f48-784464bd18ef@xen.org>
Date: Sun, 8 Dec 2019 12:18:44 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191205223008.8623-4-andrew.cooper3@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 3/6] xen/domctl: Consolidate hypercall
 continuation handling at the top level
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwNS8xMi8yMDE5IDIyOjMwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE1vcmUgcGF0
aHMgYXJlIGdvaW5nIHN0YXJ0IHVzaW5nIGh5cGVyY2FsbCBjb250aW51YXRpb25zLiAgV2UgY291
bGQgYWRkIGV4dHJhCj4gY2FsbHMgdG8gaHlwZXJjYWxsX2NyZWF0ZV9jb250aW51YXRpb24oKSBi
dXQgaXQgaXMgbXVjaCBlYXNpZXIgdG8gaGFuZGxlCj4gLUVSRVNUQVJUIG9uY2UgYXQgdGhlIHRv
cCBsZXZlbC4KPiAKPiBPbmUgY29tcGxpY2F0aW9uIGlzIFhFTl9ET01DVExfc2hhZG93X29wLCB3
aGljaCBmb3IgWFNBLTk3IGFuZCBBQkkKPiBjb21wYXRpYmlsaXR5IGluIGEgc2VjdXJpdHkgZml4
LCB0dXJuIGEgRE9NQ1RMIGNvbnRpbnVhdGlvbiBpbnRvCj4gX19IWVBFUlZJU09SX2FyY2hfMS4g
IFRoaXMgcmVtYWlucyBhcyBpdCB3YXMsIGdhaW5pbmcgYSBjb21tZW50IGV4cGxhaW5pbmcKPiB3
aGF0IGlzIGdvaW5nIG9uLgo+IAo+IFdpdGggLUVSRVNUQVJUIGhhbmRsaW5nIGluIHBsYWNlLCB0
aGUgIWRvbWN0bF9sb2NrX2FjcXVpcmUoKSBwYXRoIGNhbiB1c2UgdGhlCj4gbm9ybWFsIGV4aXQg
cGF0aCwgaW5zdGVhZCBvZiBvcGVuY29kaW5nIGEgc3Vic2V0IG9mIGl0IGxvY2FsbHkuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
PiAtLS0KPiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgo+IENDOiBXZWkgTGl1
IDx3bEB4ZW4ub3JnPgo+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KPiBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IEND
OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgo+IENDOiBWb2xvZHlteXIgQmFiY2h1ayA8
Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+Cj4gLS0tCj4gICB4ZW4vYXJjaC94ODYvZG9tY3Rs
LmMgICAgICAgICAgIHwgIDUgKysrKy0KPiAgIHhlbi9hcmNoL3g4Ni9tbS9oYXAvaGFwLmMgICAg
ICAgfCAgMyArLS0KPiAgIHhlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9uLmMgfCAgMyArLS0K
PiAgIHhlbi9jb21tb24vZG9tY3RsLmMgICAgICAgICAgICAgfCAxOSArKysrKy0tLS0tLS0tLS0t
LS0tCgpZb3Ugc2VlbSB0byBoYXZlIG1pc3NlZCB0aGUgaHlwZXJjYWxsX2NyZWF0ZV9jb250aW51
YXRpb24oKSBjYWxsIGluIAppb21tdV9kb19wY2lfZG9tY3RsKCkuCgpDaGVlcnMsCgotLSAKSnVs
aWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
