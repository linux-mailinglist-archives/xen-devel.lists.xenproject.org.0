Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE74915598B
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 15:29:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j04a7-0001YD-7T; Fri, 07 Feb 2020 14:26:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C2i2=33=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j04a5-0001Y8-3s
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2020 14:26:05 +0000
X-Inumbo-ID: c5a25d72-49b5-11ea-b2cb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5a25d72-49b5-11ea-b2cb-bc764e2007e4;
 Fri, 07 Feb 2020 14:26:04 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j04a2-0001zH-UA; Fri, 07 Feb 2020 14:26:02 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j04a2-0004ce-KL; Fri, 07 Feb 2020 14:26:02 +0000
Date: Fri, 7 Feb 2020 14:25:59 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200207142559.rsgsq56utzlcx4eb@debian>
References: <3deb0df2-5389-9567-3534-23e2ba57c68e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3deb0df2-5389-9567-3534-23e2ba57c68e@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] x86/MCFG: fix off-by-one in E820 check
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMDcsIDIwMjAgYXQgMDI6MjU6MTdQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQWxzbyBhZGp1c3QgdGhlIGNvbW1lbnQgYWhlYWQgb2YgZTgyMF9hbGxfbWFwcGVkKCkg
dG8gY2xhcmlmeSB0aGF0IHRoZQo+IHJhbmdlIGlzIG5vdCBpbmNsdXNpdmUgYXQgaXRzIGVuZC4K
PiAKPiBSZXBvcnRlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3
ZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cgo+IAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9lODIw
LmMKPiArKysgYi94ZW4vYXJjaC94ODYvZTgyMC5jCj4gQEAgLTM4LDcgKzM4LDcgQEAgc3RydWN0
IGU4MjBtYXAgZTgyMDsKPiAgc3RydWN0IGU4MjBtYXAgX19pbml0ZGF0YSBlODIwX3JhdzsKPiAg
Cj4gIC8qCj4gLSAqIFRoaXMgZnVuY3Rpb24gY2hlY2tzIGlmIHRoZSBlbnRpcmUgcmFuZ2UgPHN0
YXJ0LGVuZD4gaXMgbWFwcGVkIHdpdGggdHlwZS4KPiArICogVGhpcyBmdW5jdGlvbiBjaGVja3Mg
aWYgdGhlIGVudGlyZSByYW5nZSBbc3RhcnQsZW5kKSBpcyBtYXBwZWQgd2l0aCB0eXBlLgoKVGhl
cmUgaXMgYW5vdGhlciBpbnN0YW5jZSBvZiA8PiBpbnNpZGUgZTgyMF9hbGxfbWFwcGVkLiBJdCB3
b3VsZCBiZSBnb29kCmlmIHRoYXQncyBmaXhlZCB0b28uCgo+ICAgKgo+ICAgKiBOb3RlOiB0aGlz
IGZ1bmN0aW9uIG9ubHkgd29ya3MgY29ycmVjdCBpZiB0aGUgZTgyMCB0YWJsZSBpcyBzb3J0ZWQg
YW5kCj4gICAqIG5vdC1vdmVybGFwcGluZywgd2hpY2ggaXMgdGhlIGNhc2UKPiAtLS0gYS94ZW4v
YXJjaC94ODYveDg2XzY0L21tY29uZmlnLXNoYXJlZC5jCj4gKysrIGIveGVuL2FyY2gveDg2L3g4
Nl82NC9tbWNvbmZpZy1zaGFyZWQuYwo+IEBAIC0zMzcsNyArMzM3LDcgQEAgc3RhdGljIGludCBf
X2luaXQgaXNfbW1jb25mX3Jlc2VydmVkKAo+ICAgICAgdTY0IG9sZF9zaXplID0gc2l6ZTsKPiAg
ICAgIGludCB2YWxpZCA9IDA7Cj4gIAo+IC0gICAgd2hpbGUgKCFlODIwX2FsbF9tYXBwZWQoYWRk
ciwgYWRkciArIHNpemUgLSAxLCBFODIwX1JFU0VSVkVEKSkgewo+ICsgICAgd2hpbGUgKCFlODIw
X2FsbF9tYXBwZWQoYWRkciwgYWRkciArIHNpemUsIEU4MjBfUkVTRVJWRUQpKSB7Cj4gICAgICAg
ICAgc2l6ZSA+Pj0gMTsKPiAgICAgICAgICBpZiAoc2l6ZSA8ICgxNlVMPDwyMCkpCj4gICAgICAg
ICAgICAgIGJyZWFrOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
