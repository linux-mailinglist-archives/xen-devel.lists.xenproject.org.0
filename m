Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AACE414B802
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 15:20:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwRgV-0001By-Eb; Tue, 28 Jan 2020 14:17:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pdAI=3R=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iwRgT-0001Bq-PB
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 14:17:41 +0000
X-Inumbo-ID: f17d743e-41d8-11ea-86d9-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f17d743e-41d8-11ea-86d9-12813bfff9fa;
 Tue, 28 Jan 2020 14:17:41 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwRgS-0001Jh-6h; Tue, 28 Jan 2020 14:17:40 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwRgR-0005Y7-RW; Tue, 28 Jan 2020 14:17:40 +0000
Date: Tue, 28 Jan 2020 14:17:36 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20200128141736.223qryuo3p2ss4ma@debian>
References: <20200127181115.82709-1-roger.pau@citrix.com>
 <20200127181115.82709-8-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127181115.82709-8-roger.pau@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v3 7/7] x86/tlb: use Xen L0 assisted TLB
 flush when available
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
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMDc6MTE6MTVQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgpbLi4uXQo+ICAKPiAgY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzICpfX2luaXQg
eGdfcHJvYmUodm9pZCkKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NtcC5jIGIveGVuL2Fy
Y2gveDg2L3NtcC5jCj4gaW5kZXggNjVlYjdjYmRhOC4uOWJjOTI1NjE2YSAxMDA2NDQKPiAtLS0g
YS94ZW4vYXJjaC94ODYvc21wLmMKPiArKysgYi94ZW4vYXJjaC94ODYvc21wLmMKPiBAQCAtMTUs
NiArMTUsNyBAQAo+ICAjaW5jbHVkZSA8eGVuL3BlcmZjLmg+Cj4gICNpbmNsdWRlIDx4ZW4vc3Bp
bmxvY2suaD4KPiAgI2luY2x1ZGUgPGFzbS9jdXJyZW50Lmg+Cj4gKyNpbmNsdWRlIDxhc20vZ3Vl
c3QuaD4KPiAgI2luY2x1ZGUgPGFzbS9zbXAuaD4KPiAgI2luY2x1ZGUgPGFzbS9tYzE0NjgxOHJ0
Yy5oPgo+ICAjaW5jbHVkZSA8YXNtL2ZsdXNodGxiLmg+Cj4gQEAgLTI1Niw2ICsyNTcsMTYgQEAg
dm9pZCBmbHVzaF9hcmVhX21hc2soY29uc3QgY3B1bWFza190ICptYXNrLCBjb25zdCB2b2lkICp2
YSwgdW5zaWduZWQgaW50IGZsYWdzKQo+ICAgICAgaWYgKCAoZmxhZ3MgJiB+RkxVU0hfT1JERVJf
TUFTSykgJiYKPiAgICAgICAgICAgIWNwdW1hc2tfc3Vic2V0KG1hc2ssIGNwdW1hc2tfb2YoY3B1
KSkgKQo+ICAgICAgewo+ICsgICAgICAgIGlmICggY3B1X2hhc19oeXBlcnZpc29yICYmCj4gKyAg
ICAgICAgICAgICAhKGZsYWdzICYgfihGTFVTSF9UTEIgfCBGTFVTSF9UTEJfR0xPQkFMIHwgRkxV
U0hfVkFfVkFMSUQgfAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgRkxVU0hfT1JERVJfTUFT
SykpICYmCj4gKyAgICAgICAgICAgICAhaHlwZXJ2aXNvcl9mbHVzaF90bGIobWFzaywgdmEsIGZs
YWdzICYgRkxVU0hfT1JERVJfTUFTSykgKQo+ICsgICAgICAgIHsKPiArICAgICAgICAgICAgaWYg
KCB0bGJfY2xrX2VuYWJsZWQgKQo+ICsgICAgICAgICAgICAgICAgdGxiX2Nsa19lbmFibGVkID0g
ZmFsc2U7CgpZb3UgbWF5IGRlbGV0ZSB0aGUgaWYgaGVyZSB0byBtYWtlIHRoZSBnZW5lcmF0ZWQg
bWFjaGluZSBjb2RlIHNob3J0ZXIuCgpPT0kgd2h5IGlzbid0IHRsYl9jbGtfZW5hYmxlZCBzZXQg
dG8gZmFsc2Ugd2hlbiBYZW4gZGV0ZXJtaW5lcyB0byB1c2UgTDAKYXNzaXN0ZWQgZmx1c2g/Cgoo
U29ycnkgSSBoYXZlbid0IHJlYWQgcHJldmlvdXMgcGF0Y2hlcyBpbiBkZXRhaWwpCgpXZWkuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
