Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BB015C272
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 16:34:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2GTO-0004NZ-NY; Thu, 13 Feb 2020 15:32:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V1im=4B=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j2GTM-0004NT-OR
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 15:32:12 +0000
X-Inumbo-ID: 0140870e-4e76-11ea-ade5-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0140870e-4e76-11ea-ade5-bc764e2007e4;
 Thu, 13 Feb 2020 15:32:12 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j2GTL-0002Qi-Tl; Thu, 13 Feb 2020 15:32:11 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j2GTL-00087X-K1; Thu, 13 Feb 2020 15:32:11 +0000
Date: Thu, 13 Feb 2020 15:32:08 +0000
From: Wei Liu <wl@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20200213153208.qibj3klzicfwvi7o@debian>
References: <20200213152751.3837-1-wl@xen.org>
 <20200213153019.GF85066@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200213153019.GF85066@perard.uk.xensource.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] libxl: fix libxl__cpuid_legacy in
 libxl_nocpuid.c
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMTMsIDIwMjAgYXQgMDM6MzA6MTlQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gVGh1LCBGZWIgMTMsIDIwMjAgYXQgMDM6Mjc6NTFQTSArMDAwMCwgV2VpIExp
dSB3cm90ZToKPiA+IEl0cyBsYXN0IHBhcmFtZXRlciBzaG91bGQgYmUgbGlieGxfZG9tYWluX2J1
aWxkX2luZm8uCj4gPiAKPiA+IEZpeGVzOiAxYjNjZWM2OSAoInRvb2xzL2xpYnhsOiBDb21iaW5l
IGxlZ2FjeSBDUFVJRCBoYW5kbGluZyBsb2dpYyIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1
IDx3bEB4ZW4ub3JnPgo+ID4gLS0tCj4gPiAgdG9vbHMvbGlieGwvbGlieGxfbm9jcHVpZC5jIHwg
MiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
ID4gCj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfbm9jcHVpZC5jIGIvdG9vbHMv
bGlieGwvbGlieGxfbm9jcHVpZC5jCj4gPiBpbmRleCA3Nzc2NTc0YTBjLi4zZjMwZTE0OGJlIDEw
MDY0NAo+ID4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfbm9jcHVpZC5jCj4gPiArKysgYi90b29s
cy9saWJ4bC9saWJ4bF9ub2NwdWlkLmMKPiA+IEBAIC0zNSw3ICszNSw3IEBAIGludCBsaWJ4bF9j
cHVpZF9wYXJzZV9jb25maWdfeGVuZChsaWJ4bF9jcHVpZF9wb2xpY3lfbGlzdCAqY3B1aWQsCj4g
PiAgfQo+ID4gIAo+ID4gIHZvaWQgbGlieGxfX2NwdWlkX2xlZ2FjeShsaWJ4bF9jdHggKmN0eCwg
dWludDMyX3QgZG9taWQsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2RvbWFp
bl9jb25maWcgKmRfY29uZmlnKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9k
b21haW5fYnVpbGRfaW5mbyAqaW5mbykKPiA+ICB7Cj4gPiAgfQo+ID4gIAo+IAo+IEFja2VkLWJ5
OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KClRoYW5rcywgcHVz
aGVkLgoKVGhpcyBzaG91bGQgdW5ibG9jayBPc3N0ZXN0IGFuZCBHaXRsYWIgQ0kuCgpXZWkuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
