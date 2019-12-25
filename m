Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2199312A87E
	for <lists+xen-devel@lfdr.de>; Wed, 25 Dec 2019 17:18:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ik9IL-0006JO-2A; Wed, 25 Dec 2019 16:13:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yjib=2P=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ik9IJ-0006JJ-OU
 for xen-devel@lists.xenproject.org; Wed, 25 Dec 2019 16:13:55 +0000
X-Inumbo-ID: 87477eaa-2731-11ea-b6f1-bc764e2007e4
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87477eaa-2731-11ea-b6f1-bc764e2007e4;
 Wed, 25 Dec 2019 16:13:47 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j42so21962184wrj.12
 for <xen-devel@lists.xenproject.org>; Wed, 25 Dec 2019 08:13:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=oMPAsRGe3YO7E3jWw6Zm2snUsVUl06Geb0T9muRTGjc=;
 b=FcRtajZM0tQZ00B3BTJNnpdAMw7A56dsJF4raqdrc8hR9+O9mjiEPX5idIWAHThPNW
 xvmd7Gx1xLd2H80yOCQwDYJb/lRVg+c6WAjyM5BKzJ2E1VA/pprJsx3pOWxKd9iODYWK
 xPURDOw3N8GodmkPwPfA9hZwPFFlLD17MJMlyHBDCpUj3G3pZgE4119KN7alr+EByaPB
 vauvQYaPuRRmG5uRShh5ptrWmcDs1xyPSfMOwt9/Rt6sIhZG9IHWlIJyP13E4Y5QaOd0
 R2AudGj1lMS7+RrdAQcNh+gvCi8Ex6Xy/ATJPjKpC2Djm/dYtCvx4rE0geRD3p70/RoK
 6GtA==
X-Gm-Message-State: APjAAAVj/QcACbBzyxRX/gQItgUFYC4K2Nr/dtw7xhZ4p3kSED3iLDVY
 dLpG8RfaxHnNEvRxeAsY7Mo=
X-Google-Smtp-Source: APXvYqxoR+1ncjQ2wPa4KzqzmeNGA6M/b8yS9+zrWOf2tB8pn1PI7A3zFntyTVlsjYtxIfOvYDcPSw==
X-Received: by 2002:a5d:5273:: with SMTP id l19mr41949365wrc.175.1577290426147; 
 Wed, 25 Dec 2019 08:13:46 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id g21sm29769873wrb.48.2019.12.25.08.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Dec 2019 08:13:45 -0800 (PST)
Date: Wed, 25 Dec 2019 16:13:43 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20191225161343.jfvh4vinirezfo7q@debian>
References: <20191224132616.47441-1-roger.pau@citrix.com>
 <20191224132616.47441-3-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191224132616.47441-3-roger.pau@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 2/2] x86/tlb: use Xen L0 assisted TLB flush
 when available
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMjQsIDIwMTkgYXQgMDI6MjY6MTZQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFVzZSBYZW4ncyBMMCBIVk1PUF9mbHVzaF90bGJzIGh5cGVyY2FsbCB3aGVuIGF2
YWlsYWJsZSBpbiBvcmRlciB0bwo+IHBlcmZvcm0gZmx1c2hlcy4gVGhpcyBncmVhdGx5IGluY3Jl
YXNlcyB0aGUgcGVyZm9ybWFuY2Ugb2YgdGxiIGZsdXNoZXMKPiB3aGVuIHJ1bm5pbmcgd2l0aCBh
IGhpZ2ggYW1vdW50IG9mIHZDUFVzIGFzIGEgWGVuIGd1ZXN0LCBhbmQgaXMKPiBzcGVjaWFsbHkg
aW1wb3J0YW50IHdoZW4gcnVubmluZyBpbiBzaGltIG1vZGUuCj4gCj4gVGhlIGZvbGxvd2luZyBm
aWd1cmVzIGFyZSBmcm9tIGEgUFYgZ3Vlc3QgcnVubmluZyBgbWFrZSAtajM0MiB4ZW5gIGluCj4g
c2hpbSBtb2RlIHdpdGggMzIgdkNQVXMuCj4gCj4gVXNpbmcgeDJBUElDIGFuZCBBTExCVVQgc2hv
cnRoYW5kOgo+IHJlYWwJNG0zNS45NzNzCj4gdXNlcgk0bTM1LjExMHMKPiBzeXMJMzZtMjQuMTE3
cwo+IAo+IFVzaW5nIEwwIGFzc2lzdGVkIGZsdXNoOgo+IHJlYWwJMW0xNy4zOTFzCj4gdXNlcgk0
bTQyLjQxM3MKPiBzeXMJNm0yMC43NzNzCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9ndWVzdC94
ZW4veGVuLmMgICAgfCAxMSArKysrKysrKysrKwo+ICB4ZW4vYXJjaC94ODYvc21wLmMgICAgICAg
ICAgICAgIHwgIDYgKysrKysrCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QveGVuLmggfCAg
NyArKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jIGIveGVuL2FyY2gveDg2L2d1ZXN0
L3hlbi94ZW4uYwo+IGluZGV4IDZkYmM1Zjk1M2YuLmU2NDkzY2FlY2YgMTAwNjQ0Cj4gLS0tIGEv
eGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC94
ZW4veGVuLmMKPiBAQCAtMjgxLDYgKzI4MSwxNyBAQCBpbnQgeGdfZnJlZV91bnVzZWRfcGFnZSht
Zm5fdCBtZm4pCj4gICAgICByZXR1cm4gcmFuZ2VzZXRfcmVtb3ZlX3JhbmdlKG1lbSwgbWZuX3go
bWZuKSwgbWZuX3gobWZuKSk7Cj4gIH0KPiAgCj4gK2ludCB4Z19mbHVzaF90bGJzKHZvaWQpCj4g
K3sKPiArICAgIGludCByYzsKPiArCj4gKyAgICBkbyB7Cj4gKyAgICAgICAgcmMgPSB4ZW5faHlw
ZXJjYWxsX2h2bV9vcChIVk1PUF9mbHVzaF90bGJzLCBOVUxMKTsKPiArICAgIH0gd2hpbGUgKCBy
YyA9PSAtRVJFU1RBUlQgKTsKPiArCj4gKyAgICByZXR1cm4gcmM7Cj4gK30KPiArCgpJcyBpdCBw
b3NzaWJsZSB0byBtYWtlIHRoaXMgYSBob29rIGluIHRoZSBoeXBlcnZpc29yX29wPwoKSSBjYW4g
Zm9yZXNlZSB0aGVyZSB3aWxsIGJlIHNvbWV0aGluZyBzaW1pbGFyIGZvciBIeXBlci1WLgoKPiAg
c3RhdGljIHZvaWQgYXBfcmVzdW1lKHZvaWQgKnVudXNlZCkKPiAgewo+ICAgICAgbWFwX3ZjcHVp
bmZvKCk7Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zbXAuYyBiL3hlbi9hcmNoL3g4Ni9z
bXAuYwo+IGluZGV4IDQyN2MzM2RiOWQuLmE4OTJkYjI4YzEgMTAwNjQ0Cj4gLS0tIGEveGVuL2Fy
Y2gveDg2L3NtcC5jCj4gKysrIGIveGVuL2FyY2gveDg2L3NtcC5jCj4gQEAgLTE1LDYgKzE1LDcg
QEAKPiAgI2luY2x1ZGUgPHhlbi9wZXJmYy5oPgo+ICAjaW5jbHVkZSA8eGVuL3NwaW5sb2NrLmg+
Cj4gICNpbmNsdWRlIDxhc20vY3VycmVudC5oPgo+ICsjaW5jbHVkZSA8YXNtL2d1ZXN0Lmg+Cj4g
ICNpbmNsdWRlIDxhc20vc21wLmg+Cj4gICNpbmNsdWRlIDxhc20vbWMxNDY4MThydGMuaD4KPiAg
I2luY2x1ZGUgPGFzbS9mbHVzaHRsYi5oPgo+IEBAIC0yMzUsNiArMjM2LDExIEBAIHZvaWQgZmx1
c2hfYXJlYV9tYXNrKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgY29uc3Qgdm9pZCAqdmEsIHVuc2ln
bmVkIGludCBmbGFncykKPiAgICAgIHsKPiAgICAgICAgICBib29sIGNwdXNfbG9ja2VkID0gZmFs
c2U7Cj4gIAo+ICsgICAgICAgIGlmICggeGVuX2d1ZXN0ICYmCgpBbHNvIGl0IHdvdWxkIGJlIGJl
dHRlciB0byBub3QgZXhwb3NlIHhlbl9ndWVzdCBoZXJlLiBJdCBpcyB4ODYgZ2VuZXJpYwpjb2Rl
IGFmdGVyIGFsbC4KCkkgd291bGQgcHJvYmFibHkgaW50cm9kdWNlIGEgZnVuY3Rpb24gdG8gdGVs
bCBpZiBYZW4gaXMgcnVubmluZwp2aXJ0dWFsaXNlZCBvciBub3QuCgpXZWkuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
