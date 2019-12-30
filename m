Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C978512D024
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2019 13:59:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ilubU-0002Z7-SS; Mon, 30 Dec 2019 12:57:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4aY4=2U=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ilubT-0002Yz-0o
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2019 12:56:59 +0000
X-Inumbo-ID: d8109706-2b03-11ea-b6f1-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8109706-2b03-11ea-b6f1-bc764e2007e4;
 Mon, 30 Dec 2019 12:56:50 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c14so32561498wrn.7
 for <xen-devel@lists.xenproject.org>; Mon, 30 Dec 2019 04:56:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=qTdaehSRmR+z0AGfDLVwETlqwmr/5RJ134Js/ySOb2I=;
 b=rVV7Kk9m+lp4Z4a8Om10WbPgA8UUgbNjZI9kcg2wm5wpQ1MadUxJxJ5dlk7pa17kxK
 npIMC9FgvCJTkKpiG0UcskObRl1CAyyn9LEmBQqbVDRuwREnaJS0ea1zMMgVqPZTHFCD
 tIxXCxwysH9jN73Q0gsU1SykRH8XiqIIVrNC+0T2yrHSfjpQCaHBikYZ967aowDiffl6
 IVtD2cNREQ+0lfB/i27bCram/RtULjPyXJSS6NbpE0dy1XVRKzXwRt7F+56eCmE3Jiq4
 5EO0oJIVsuLdNvuAO2Ru2jMJg3vFuFc4S327/dgQHo6ONA/n2ecGbyNRAFUKu/6C5H5V
 hzDQ==
X-Gm-Message-State: APjAAAVYnPkPbT/Hy93vLuIAnZq3g3ZrytTeHNz+BpWf7kg6bQXcFWCv
 ep6RNMWfKUu1ML951hyyWJ8=
X-Google-Smtp-Source: APXvYqxhwkKTm//8fm5m4Ba8rflXS/PaOLMbBsPeVwU+EWrkBR5uBbvMVS9PKobUzf80cKl6jDFkmw==
X-Received: by 2002:adf:ee45:: with SMTP id w5mr64725441wro.352.1577710609513; 
 Mon, 30 Dec 2019 04:56:49 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id h2sm49675571wrt.45.2019.12.30.04.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2019 04:56:49 -0800 (PST)
Date: Mon, 30 Dec 2019 12:56:47 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191230125647.rthgr5llgy5hdybs@debian>
References: <20191227134516.15530-1-andrew.cooper3@citrix.com>
 <5660e951-4fa3-a37d-31e9-30e9da97486e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5660e951-4fa3-a37d-31e9-30e9da97486e@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] tools/libxl: Reposition build_pre() logic
 between architectures
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMjcsIDIwMTkgYXQgMDI6NTA6NThQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjcuMTIuMjAxOSAxNDo0NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiA+IFRoZSBj
YWxsIHRvIHhjX2RvbWFpbl9kaXNhYmxlX21pZ3JhdGUoKSBpcyBtYWRlIG9ubHkgZnJvbSB4ODYs
IHdoaWxlIGl0cwo+ID4gaGFuZGxpbmcgaW4gWGVuIGlzIGNvbW1vbi4gIE1vdmUgaXQgdG8gdGhl
IGxpYnhsX19idWlsZF9wcmUoKS4KPiA+IAo+ID4gaHZtX3NldF9jb25mX3BhcmFtcygpLCBodm1f
c2V0X3ZpcmlkaWFuX2ZlYXR1cmVzKCksCj4gPiBodm1fc2V0X21jYV9jYXBhYmlsaXRpZXMoKSwg
YW5kIHRoZSBhbHRwMm0gbG9naWMgaXMgYWxsIGluIGNvbW1vbgo+ID4gY29kZSAocGFydHMgaWZk
ZWYnZCkgYnV0IGRlc3BpdGUgdGhpcywgaXMgYWxsIGFjdHVhbGx5IHg4NiBzcGVjaWZpYy4KPiA+
IAo+ID4gTW92ZSBpdCBpbnRvIHg4NiBzcGVjaWZpYyBjb2RlLCBhbmQgZm9sZCBhbGwgb2YgdGhl
IHhjX2h2bV9wYXJhbV9zZXQoKSBjYWxscwo+ID4gdG9nZXRoZXIgaW50byBodm1fc2V0X2NvbmZf
cGFyYW1zKCkgaW4gYSBmYXIgbW9yZSBjb2hlcmVudCB3YXkuCj4gPiAKPiA+IEZpbmFsbHkgLSBl
bnN1cmUgdGhhdCBhbGwgaHlwZXJjYWxscyBoYXZlIHRoZWlyIHJldHVybiB2YWx1ZXMgY2hlY2tl
ZC4KPiA+IAo+ID4gTm8gcHJhY3RpY2FsIGNoYW5nZSBpbiBjb25zdHJ1Y3RlZCBkb21haW5zLiAg
RmV3ZXIgdXNlbGVzcyBoeXBlcmNhbGxzIG5vdyB0bwo+ID4gY29uc3RydWN0IGFuIEFSTSBndWVz
dC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KPiA+IC0tLQo+ID4gQ0M6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRy
aXguY29tPgo+ID4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gPiBDQzogQW50aG9ueSBQZXJh
cmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gPiBDQzogSmFuIEJldWxpY2ggPEpCZXVs
aWNoQHN1c2UuY29tPgo+ID4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gPiBDQzogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiBDQzogU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+ID4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+Cj4gPiBDQzogVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVw
YW0uY29tPgo+ID4gLS0tCj4gPiAgdG9vbHMvbGlieGwvbGlieGxfZG9tLmMgfCAxODMgKystLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgdG9vbHMvbGli
eGwvbGlieGxfeDg2LmMgfCAxODEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0KPiAKPiBJJ2xsIGRlZmVyIHRvIHRoZSB0b29sIHN0YWNrIG1haW50YWluZXJz
IGhlcmUuIEltbyB0aGlzIGZpbGUgd291bGQKPiBiZXR0ZXIgYmUgc3BsaXQgLSBvbmUgdG8gY29u
dGFpbiBzdHVmZiBiZXR0ZXIgZmFsbGluZyB1bmRlciB4ODYKPiBtYWludGFpbmVyc2hpcCwgYW5k
IHRoZSBvdGhlciBmb3IgZXZlcnl0aGluZyBmYWxsaW5nIGluIHRoZSB0b29sCj4gc3RhY2sgcmVh
bG0uCgooQXNzdW1pbmcgeW91J3JlIHRhbGtpbmcgYWJvdXQgbGlieGxfeDg2LmMpCgpUaGF0IHdv
cmtzIGZvciBtZS4KCkl0IGlzIHVuY2xlYXIgdG8gbWUgaG93IGNsZWFuIHRoYXQgc3BsaXQgY2Fu
IGJlIHRob3VnaC4uLgoKV2VpLgoKPiAKPiBKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
