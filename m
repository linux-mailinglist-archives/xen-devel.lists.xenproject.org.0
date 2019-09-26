Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02606BF644
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 17:54:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDW3p-0002oJ-5l; Thu, 26 Sep 2019 15:52:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Aa/x=XV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iDW3n-0002o9-3j
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 15:52:03 +0000
X-Inumbo-ID: 9409b142-e075-11e9-9659-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by localhost (Halon) with ESMTPS
 id 9409b142-e075-11e9-9659-12813bfff9fa;
 Thu, 26 Sep 2019 15:52:01 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a6so3351279wma.5
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 08:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=c+v8RmoqjHPEaOVgDcQzwHPF0uyoqb69SjdomITtBOY=;
 b=hRiCYyHrWyq6fnBxWqHJpHzDUwhZIkuJTWYMjFqP6L6Ht6jlkWmiDCPp8BHUIYp06P
 SjRfWTBh9nRKtHbLksd+/920mHmzqo5/UkjFevY8hnHud7sKTBXiYosVOa0dxEATPge8
 VaStjKpxksIVvvtU11yY6Lcdi9iITLKNYHnz8T39UGxtGwlbGnG9wyMLyEgyiy9HZWzO
 uufcGT7+RS3C72ywCoIhou8sMQ7tr5ZfHXPUuTMOndxa5F3qC9e5JiJlZ/pYHNZS8QDM
 zPwx8rI7UIWuC2B7T1uZlowCnaDSGHycIUgxN4nbfztipfRK/TU/53OpTKftuXzLEeBs
 TyYA==
X-Gm-Message-State: APjAAAW423Aq4wooYzbrxcRF/GCEMxLoxf955wjbyanj7+g86EVLpa2g
 vWYzUxvDD2RlgDinhTJ0kkI=
X-Google-Smtp-Source: APXvYqwd7pKY4vH3OVGre+onVEHerrdiKvRPYO6XVR2mRFuR2xG1E/QMWErCcwloSB+dV0tIDWZpgA==
X-Received: by 2002:a1c:cc0e:: with SMTP id h14mr3649519wmb.117.1569513120822; 
 Thu, 26 Sep 2019 08:52:00 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id u4sm4585649wmg.41.2019.09.26.08.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 08:52:00 -0700 (PDT)
Date: Thu, 26 Sep 2019 16:51:58 +0100
From: Wei Liu <wl@xen.org>
To: hongyax@amazon.com
Message-ID: <20190926155158.idx4iqmwhswuo4nw@debian>
References: <cover.1569489002.git.hongyax@amazon.com>
 <19981ca60bdd61b305946e51fa4ec4e66e2a9408.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <19981ca60bdd61b305946e51fa4ec4e66e2a9408.1569489002.git.hongyax@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [RFC PATCH 84/84] x86/pv: fix a couple of direct
 map assumptions in dom0 building.
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

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTA6NDY6NDdBTSArMDEwMCwgaG9uZ3lheEBhbWF6b24u
Y29tIHdyb3RlOgo+IEZyb206IEhvbmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Cj4gCj4g
U2lnbmVkLW9mZi1ieTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KPiAtLS0KPiAg
eGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYyAgICB8IDcgKysrKy0tLQo+ICB4ZW4vaW5jbHVk
ZS9hc20teDg2L3Byb2Nlc3Nvci5oIHwgMiAtLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3B2
L2RvbTBfYnVpbGQuYyBiL3hlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMKPiBpbmRleCAyMDJl
ZGNhYTE3Li45OGRjYzE4ZDIxIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9wdi9kb20wX2J1
aWxkLmMKPiArKysgYi94ZW4vYXJjaC94ODYvcHYvZG9tMF9idWlsZC5jCj4gQEAgLTYyNiw5ICs2
MjYsMTAgQEAgaW50IF9faW5pdCBkb20wX2NvbnN0cnVjdF9wdihzdHJ1Y3QgZG9tYWluICpkLAo+
ICAgICAgICAgIGw0c3RhcnQgPSBsNHRhYiA9IG1hcF94ZW5fcGFnZXRhYmxlKG1hZGRyX3RvX21m
bihtcHRfYWxsb2MpKTsKPiAgICAgICAgICBtcHRfYWxsb2MgKz0gUEFHRV9TSVpFOwo+ICAgICAg
ICAgIGNsZWFyX3BhZ2UobDR0YWIpOwo+IC0gICAgICAgIGluaXRfeGVuX2w0X3Nsb3RzKGw0dGFi
LCBfbWZuKHZpcnRfdG9fbWZuKGw0c3RhcnQpKSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICBkLCBJTlZBTElEX01GTiwgdHJ1ZSk7Cj4gLSAgICAgICAgdi0+YXJjaC5ndWVzdF90YWJsZSA9
IHBhZ2V0YWJsZV9mcm9tX3BhZGRyKF9fcGEobDRzdGFydCkpOwo+ICsgICAgICAgIGluaXRfeGVu
X2w0X3Nsb3RzKGw0dGFiLCBfbWZuKHZpcnRfdG9fbWZuX3dhbGsobDRzdGFydCkpLCBkLAo+ICsg
ICAgICAgICAgICAgICAgSU5WQUxJRF9NRk4sIHRydWUpOwo+ICsgICAgICAgIHYtPmFyY2guZ3Vl
c3RfdGFibGUgPQo+ICsgICAgICAgICAgICAgICAgcGFnZXRhYmxlX2Zyb21fbWZuKF9tZm4odmly
dF90b19tZm5fd2FsayhsNHN0YXJ0KSkpOwo+ICAgICAgfQo+ICAgICAgZWxzZQo+ICAgICAgewo+
IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L3Byb2Nlc3Nvci5oIGIveGVuL2luY2x1
ZGUvYXNtLXg4Ni9wcm9jZXNzb3IuaAo+IGluZGV4IGY1NzExOTFjZGIuLjdlOGQwMTBkMDcgMTAw
NjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wcm9jZXNzb3IuaAo+ICsrKyBiL3hlbi9p
bmNsdWRlL2FzbS14ODYvcHJvY2Vzc29yLmgKPiBAQCAtNDY1LDggKzQ2NSw2IEBAIHN0YXRpYyBp
bmxpbmUgdm9pZCBkaXNhYmxlX2VhY2hfaXN0KGlkdF9lbnRyeV90ICppZHQpCj4gIGV4dGVybiBp
ZHRfZW50cnlfdCBpZHRfdGFibGVbXTsKPiAgZXh0ZXJuIGlkdF9lbnRyeV90ICppZHRfdGFibGVz
W107Cj4gIAo+IC1ERUNMQVJFX1BFUl9DUFUoc3RydWN0IHRzc19zdHJ1Y3QsIGluaXRfdHNzKTsK
PiAtCgpXaHkgaXMgdGhpcyBkZWxldGVkPwoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
