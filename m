Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 787FFBF4E5
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 16:17:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDUX4-0006RM-KU; Thu, 26 Sep 2019 14:14:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Aa/x=XV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iDUX2-0006RH-OX
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 14:14:08 +0000
X-Inumbo-ID: e724b93e-e067-11e9-9655-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by localhost (Halon) with ESMTPS
 id e724b93e-e067-11e9-9655-12813bfff9fa;
 Thu, 26 Sep 2019 14:14:08 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n14so2669023wrw.9
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 07:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=C/YUomk0Ubb0h0402bfkhmzhdKKt82Kb4YJio3e1Ooo=;
 b=fFFYi6dNMjQur7TVZ5mhzyaCh7Siwpb8m9Mneu1JibcblVXAsNg0KRztVVLK+HB9KQ
 RCNLNwpVWlnwS8S1M/hqxTqHoBBmIbG/moFeTnl4UIYj+GLkb/hKKPrCZF8iqM1AvLQK
 6MSWGY49W30ts+xKFPoRS5nOJZeKedxQtTtq2ra0nQ8NlzIDgOYAswxD0oIdpnRsQwUD
 b19tTUbwthHCP1xZKrqATP3/UWNQ8+A9sqAj+fyYbERiD4UDhZ2lWZ1UljyqdmYDfIOj
 AtCE0Q03spvWorhjq3pzW7s8Y5LOoa1L/fS4ZjaNk0J5Nl3ej79NrZA7d1oLBGwR1JXM
 HFGw==
X-Gm-Message-State: APjAAAW5sxwG9wJBYkRy88RLJsB2OA9VYnmLfYmmhY5HYL0cZ0hrYYP8
 i07GSA22fwforCffa7N6rtQ=
X-Google-Smtp-Source: APXvYqwM0hYpSEAgXj36jRV0NCg6TwXK5S4VfwQkiGB079LGcKVFaIQr2DUiXRJhLxvr4Df2OZkUKQ==
X-Received: by 2002:adf:b648:: with SMTP id i8mr2995098wre.372.1569507247272; 
 Thu, 26 Sep 2019 07:14:07 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id y13sm7686526wrg.8.2019.09.26.07.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 07:14:06 -0700 (PDT)
Date: Thu, 26 Sep 2019 15:14:05 +0100
From: Wei Liu <wl@xen.org>
To: hongyax@amazon.com
Message-ID: <20190926141405.bpx7fujqf7fbacz7@debian>
References: <cover.1569489002.git.hongyax@amazon.com>
 <10c0b97f3f378af07012628afc685905af43148f.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <10c0b97f3f378af07012628afc685905af43148f.1569489002.git.hongyax@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [RFC PATCH 67/84] x86/domain_page: remove direct
 map code and initialise idle mapcache.
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
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTA6NDY6MzBBTSArMDEwMCwgaG9uZ3lheEBhbWF6b24u
Y29tIHdyb3RlOgo+IEZyb206IEhvbmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Cj4gCj4g
VGhlc2UgYXJlIGZvdW5kIGluIHRoZSBOREVCVUcgYnVpbGQuCj4gCj4gU2lnbmVkLW9mZi1ieTog
SG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gveDg2L2Rv
bWFpbl9wYWdlLmMgfCAxMCAtLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbWFpbl9wYWdlLmMgYi94ZW4v
YXJjaC94ODYvZG9tYWluX3BhZ2UuYwo+IGluZGV4IGY0ZjUzYTJhMzMuLmY2MDY2NzdhZTYgMTAw
NjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2RvbWFpbl9wYWdlLmMKPiArKysgYi94ZW4vYXJjaC94
ODYvZG9tYWluX3BhZ2UuYwo+IEBAIC03OCwxMSArNzgsNiBAQCB2b2lkICptYXBfZG9tYWluX3Bh
Z2UobWZuX3QgbWZuKQo+ICAgICAgc3RydWN0IG1hcGNhY2hlX3ZjcHUgKnZjYWNoZTsKPiAgICAg
IHN0cnVjdCB2Y3B1X21hcGhhc2hfZW50cnkgKmhhc2hlbnQ7Cj4gIAo+IC0jaWZkZWYgTkRFQlVH
Cj4gLSAgICBpZiAoIG1mbl94KG1mbikgPD0gUEZOX0RPV04oX19wYShIWVBFUlZJU09SX1ZJUlRf
RU5EIC0gMSkpICkKPiAtICAgICAgICByZXR1cm4gbWZuX3RvX3ZpcnQobWZuX3gobWZuKSk7Cj4g
LSNlbmRpZgo+IC0KCkFnYWluLCB0aGlzIGlzIGRyb3BwaW5nIGEgZmFzdCBwYXRoLiBXaGVyZSBp
cyB0aGUgY29ycmVzcG9uZGluZyBjaGFuZ2UKdG8gdW5hbXBfZG9tYWluX3BhZ2U/Cgo+ICAgICAg
diA9IG1hcGNhY2hlX2N1cnJlbnRfdmNwdSgpOwo+ICAgICAgaWYgKCAhdiApCj4gICAgICB7Cj4g
QEAgLTI1NywxMSArMjUyLDYgQEAgaW50IG1hcGNhY2hlX2RvbWFpbl9pbml0KHN0cnVjdCBkb21h
aW4gKmQpCj4gICAgICBzdHJ1Y3QgbWFwY2FjaGVfZG9tYWluICpkY2FjaGUgPSAmZC0+YXJjaC5t
YXBjYWNoZTsKPiAgICAgIHVuc2lnbmVkIGludCBiaXRtYXBfcGFnZXM7Cj4gIAo+IC0jaWZkZWYg
TkRFQlVHCj4gLSAgICBpZiAoICFtZW1faG90cGx1ZyAmJiBtYXhfcGFnZSA8PSBQRk5fRE9XTihf
X3BhKEhZUEVSVklTT1JfVklSVF9FTkQgLSAxKSkgKQo+IC0gICAgICAgIHJldHVybiAwOwo+IC0j
ZW5kaWYKPiAtCgpUaGlzIHNob3VsZCBiZSBpbiBpdHMgb3duIGNvbW1pdCB3aXRoIGp1c3RpZmlj
YXRpb24uCgpXZWkuCgo+ICAgICAgQlVJTERfQlVHX09OKE1BUENBQ0hFX1ZJUlRfRU5EICsgUEFH
RV9TSVpFICogKDMgKwo+ICAgICAgICAgICAgICAgICAgIDIgKiBQRk5fVVAoQklUU19UT19MT05H
UyhNQVBDQUNIRV9FTlRSSUVTKSAqIHNpemVvZihsb25nKSkpID4KPiAgICAgICAgICAgICAgICAg
ICBNQVBDQUNIRV9WSVJUX1NUQVJUICsgKFBFUkRPTUFJTl9TTE9UX01CWVRFUyA8PCAyMCkpOwo+
IC0tIAo+IDIuMTcuMQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
