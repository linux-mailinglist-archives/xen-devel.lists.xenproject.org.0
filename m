Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B99BF510
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 16:29:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDUjW-0007sa-D6; Thu, 26 Sep 2019 14:27:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Aa/x=XV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iDUjV-0007sJ-4H
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 14:27:01 +0000
X-Inumbo-ID: b36d1c24-e069-11e9-b588-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by localhost (Halon) with ESMTPS
 id b36d1c24-e069-11e9-b588-bc764e2007e4;
 Thu, 26 Sep 2019 14:27:00 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y19so3033482wrd.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 07:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qeXYiH24wLvMPRFHYJR5aW269O9ocZoXYGe1g5KQa84=;
 b=su9PSOObKKtp+C2/u1Uhftb3mur6k2+LkuSHhuJTG9UUHVDOp3KTNvw4tMIuZMb0KO
 oS4hvz0Ngqaip+NNxAs1BtwSl/7SyGHYhJA3PWNPOqv7bceof22/92g5VBguuHwTc3Wy
 GZ25mh38l0D6C8rq80ryTVss1urWcKsf3iL7tmGskAnTmXJWn7F3umOE9qnY+/GZUyOq
 oOoYh74UXT/KJMTGCoMBcZAOk3ZtC1HYbwB/8JXtBR2eec9PRKmhnhLNIsy7WqiLGinY
 Vd3dX+mI08AARfSW4EypeM3oy4iYTOptRTEo293geAri4lo1Z80E5RIqW1OAH40GCnNf
 1cIQ==
X-Gm-Message-State: APjAAAVp0rHQmacLeZGXhyj4cKt/zQBRpzgFZntPN573OFJD1Dixc5tl
 s0y7VsjXnvGh59+5/e3y7ps=
X-Google-Smtp-Source: APXvYqweaST6eRe7dYZhWxpVI+5718Li5WdQ4AI1wyUEC15Q3jy12LyXSj5zjniW6YdyUBjQqwfYqg==
X-Received: by 2002:adf:ef8f:: with SMTP id d15mr2296269wro.67.1569508019515; 
 Thu, 26 Sep 2019 07:26:59 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id 79sm4362930wmb.7.2019.09.26.07.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 07:26:59 -0700 (PDT)
Date: Thu, 26 Sep 2019 15:26:57 +0100
From: Wei Liu <wl@xen.org>
To: hongyax@amazon.com
Message-ID: <20190926142657.mc3y7i4ovz6hvua6@debian>
References: <cover.1569489002.git.hongyax@amazon.com>
 <ccabf9b1ce3142ca65e453ec9a5ae1d34d28a992.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ccabf9b1ce3142ca65e453ec9a5ae1d34d28a992.1569489002.git.hongyax@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [RFC PATCH 71/84] x86/setup: start tearing down the
 direct map.
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTA6NDY6MzRBTSArMDEwMCwgaG9uZ3lheEBhbWF6b24u
Y29tIHdyb3RlOgo+IEZyb206IEhvbmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Cj4gCj4g
U2lnbmVkLW9mZi1ieTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KPiAtLS0KPiAg
eGVuL2FyY2gveDg2L3NldHVwLmMgICAgfCA0ICsrLS0KPiAgeGVuL2NvbW1vbi9wYWdlX2FsbG9j
LmMgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc2V0dXAuYyBiL3hlbi9hcmNoL3g4
Ni9zZXR1cC5jCj4gaW5kZXggZTk2NGMwMzJmNi4uM2RjMmZhZDk4NyAxMDA2NDQKPiAtLS0gYS94
ZW4vYXJjaC94ODYvc2V0dXAuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4gQEAgLTEz
NjcsNyArMTM2Nyw3IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVk
IGxvbmcgbWJpX3ApCj4gIAo+ICAgICAgICAgICAgICBpZiAoIG1hcF9lIDwgZW5kICkKPiAgICAg
ICAgICAgICAgewo+IC0gICAgICAgICAgICAgICAgbWFwX3BhZ2VzX3RvX3hlbigodW5zaWduZWQg
bG9uZylfX3ZhKG1hcF9lKSwgbWFkZHJfdG9fbWZuKG1hcF9lKSwKPiArICAgICAgICAgICAgICAg
IG1hcF9wYWdlc190b194ZW4oKHVuc2lnbmVkIGxvbmcpX192YShtYXBfZSksIElOVkFMSURfTUZO
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQRk5fRE9XTihlbmQgLSBtYXBf
ZSksIFBBR0VfSFlQRVJWSVNPUik7CgpXaHkgZG9uJ3QgeW91IGp1c3QgcmVtb3ZlIHRoZSBjYWxs
cyB0byBtYXBfcGFnZXNfdG9feGVuPwoKPiAgICAgICAgICAgICAgICAgIGluaXRfYm9vdF9wYWdl
cyhtYXBfZSwgZW5kKTsKPiAgICAgICAgICAgICAgICAgIG1hcF9lID0gZW5kOwo+IEBAIC0xMzgy
LDcgKzEzODIsNyBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBs
b25nIG1iaV9wKQo+ICAgICAgICAgIH0KPiAgICAgICAgICBpZiAoIHMgPCBtYXBfcyApCj4gICAg
ICAgICAgewo+IC0gICAgICAgICAgICBtYXBfcGFnZXNfdG9feGVuKCh1bnNpZ25lZCBsb25nKV9f
dmEocyksIG1hZGRyX3RvX21mbihzKSwKPiArICAgICAgICAgICAgbWFwX3BhZ2VzX3RvX3hlbigo
dW5zaWduZWQgbG9uZylfX3ZhKHMpLCBJTlZBTElEX01GTiwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBQRk5fRE9XTihtYXBfcyAtIHMpLCBQQUdFX0hZUEVSVklTT1IpOwo+ICAgICAg
ICAgICAgICBpbml0X2Jvb3RfcGFnZXMocywgbWFwX3MpOwo+ICAgICAgICAgIH0KPiBkaWZmIC0t
Z2l0IGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+
IGluZGV4IGEwMGRiNGMwZDkuLmRlZWVhYzA2NWMgMTAwNjQ0Cj4gLS0tIGEveGVuL2NvbW1vbi9w
YWdlX2FsbG9jLmMKPiArKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+IEBAIC0yMTU3LDcg
KzIxNTcsNyBAQCB2b2lkICphbGxvY194ZW5oZWFwX3BhZ2VzKHVuc2lnbmVkIGludCBvcmRlciwg
dW5zaWduZWQgaW50IG1lbWZsYWdzKQo+ICAgICAgbWFwX3BhZ2VzX3RvX3hlbigodW5zaWduZWQg
bG9uZylyZXQsIHBhZ2VfdG9fbWZuKHBnKSwKPiAgICAgICAgICAgICAgICAgICAgICAgMVVMIDw8
IG9yZGVyLCBQQUdFX0hZUEVSVklTT1IpOwo+ICAKPiAtICAgIHJldHVybiBwYWdlX3RvX3ZpcnQo
cGcpOwo+ICsgICAgcmV0dXJuIHJldDsKClRoaXMgaHVuayBpcyBhIGZpeCB0byBhIHByZXZpb3Vz
IHBhdGNoLiBJdCBkb2Vzbid0IGJlbG93IGhlcmUuCgpXZWkuCgo+ICB9Cj4gIAo+ICAKPiAtLSAK
PiAyLjE3LjEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
