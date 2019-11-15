Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 662F8FDBEE
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 12:04:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVZLk-0006II-8D; Fri, 15 Nov 2019 11:01:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Up3T=ZH=posteo.de=hfp@srs-us1.protection.inumbo.net>)
 id 1iVZLi-0006ID-U9
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 11:01:11 +0000
X-Inumbo-ID: 39a887ac-0797-11ea-a264-12813bfff9fa
Received: from mout02.posteo.de (unknown [185.67.36.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39a887ac-0797-11ea-a264-12813bfff9fa;
 Fri, 15 Nov 2019 11:01:09 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id B0207240103
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 12:01:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1573815666; bh=F64Y5egZD/J3ZGnftrlJI1ISd4KB3Au1hpvRNcUFPIQ=;
 h=From:Subject:To:Cc:Date:From;
 b=I2tX36QUH4fAhtRZWc5AtgXEG8Pzj/Oo7N7OcRGW+4jv/jUBCTGi2VZq7t/PtFIt9
 vxY0tV/3FLFdTH5vyqNrR5JgU0k4ZDaErFODoBIAyt92gDwhB9t7sVFR0zn6s9o6/Q
 V8pzBnD3vi5uKBX1mcTTk3DBpwpx8gqowaqMmaEpnCLRoU+mRFpP0qve1YyzRdjdKE
 IqGQFF6r/9TYa5oebBaKF4QKLeMyCNVlokDeUsXvHsq7gXXbbqV6dp2AuQYn2+hFck
 y0vgjLGBJZklr2y3H2czFRsZ1wZU9iCsKmKLI5vHBKrE63jpZiFAC4qSQctCG3RK83
 l7rN6EwY9u7sw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 47DwPs4Np6z9rxb;
 Fri, 15 Nov 2019 12:01:05 +0100 (CET)
From: Andreas Kinzler <hfp@posteo.de>
To: Jan Beulich <jbeulich@suse.com>
References: <4bc44777-103b-ada5-839a-809da33ba00c@posteo.de>
 <10fe632c-0f08-5399-0342-f6dfd9ca9b19@posteo.de>
 <ab806fa6-bd5f-84e1-1c4b-b704b18fd020@suse.com>
Message-ID: <9d781f63-c565-01fa-b289-10b31c9ad4f1@posteo.de>
Date: Fri, 15 Nov 2019 12:01:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <ab806fa6-bd5f-84e1-1c4b-b704b18fd020@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] wall clock drift on Coffee Lake / C24x mainboard
 (HPET broken?), best practices
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <Paul.Durrant@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMTEuMjAxOSAxMjoyOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTQuMTEuMjAxOSAw
MDoxMCwgQW5kcmVhcyBLaW56bGVyIHdyb3RlOgo+PiBJIGNhbWUgYWNyb3NzIHRoZSBmb2xsb3dp
bmc6IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzgvMjkvNTM2Cj4+IENvdWxkIHRoYXQgYmUg
dGhlIHJlYXNvbiBmb3IgdGhlIHByb2JsZW0gbWVudGlvbmVkIGJlbG93PyBYZW4gaXMgdXNpbmcK
Pj4gSFBFVCBhcyBjbG9ja3NvdXJjZSBvbiB0aGUgcGxhdGZvcm0vbWFpbmJvYXJkLiBJcyB0aGVy
ZSBhbiAoZWFzeSkgd2F5IHRvCj4+IHZlcmlmeSBpZiBYZW4gdXNlcyBQQzEwPwo+IEluIHByaW5j
aXBsZSB0aGlzIGNhbiBiZSBvYnRhaW5lZCB2aWEgYm90aCB0aGUgeGVucG0gdXRpbGl0eSBhbmQK
PiB0aGUgJ2MnIGRlYnVnIGtleS4KCkJvdGggeGVucG0gYW5kICdjJyBkZWJ1ZyBrZXkgc2hvdyBv
bmx5IHVwIHRvIGxldmVsIDcgaW4gWGVuIDQuMTAueCAKKHVubW9kaWZpZWQgY29kZSkuCgo+IEZv
ciBDb2ZmZWUgTGFrZSwgaG93ZXZlciwgSSBjYW4ndCBmaW5kIGFueQo+IGluZGljYXRpb24gaW4g
dGhlIFNETSB0aGF0IGEgUEMxMCByZXNpZGVuY3kgTVNSIHdvdWxkIGV4aXN0LgoKSSB1c2VkIHR1
cmJvc3RhdCAKKGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci90
b29scy9wb3dlci94ODYvdHVyYm9zdGF0L3R1cmJvc3RhdC5jKSAKYXMgYSBoZWxwLiBTZWUgZnVu
Y3Rpb25zIGhhc19jODkxMF9tc3JzIGFuZCBpbnRlbF9tb2RlbF9kdXBsaWNhdGVzLgoKSSB0aGVu
IGFkZGVkIENvZmZlZSBMYWtlIHdpdGggUEM4LzkvMTAgdG8gZG9fZ2V0X2h3X3Jlc2lkZW5jaWVz
IGFuZCB0aGVuIApJIGdvdCBoaWdoIGNvdW50cyBpbiBQQzgrUEM5IGFuZCB6ZXJvIGluIFBDMTAu
Cgo+IEhlbmNlIEkgY2FuIG9ubHkgc3VnZ2VzdCB0aGF0IHlvdSB0cnkgYWdhaW4gd2l0aCBsaW1p
dGVkIG9yIG5vCj4gdXNlIG9mIEMgc3RhdGVzLCB0byBhdCBsZWFzdCBnZXQgYSBoaW50IGFzIHRv
IGEgcG9zc2libGUKCkkgY2hhbmdlZCB0aGUgQklPUyBzZXR0aW5nIHRvIGEgbGltaXQgb2YgUEM3
IGFuZCBpdCBpcyBub3cgcnVubmluZy4gSSAKaGF2ZSB0byB3YWl0IGZvciB0aGUgcmVzdWx0LiBU
aGFua3MuCgpSZWdhcmRzIEFuZHJlYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
