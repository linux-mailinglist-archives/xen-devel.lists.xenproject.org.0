Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9687488294
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 20:34:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw9hB-0005BK-Ll; Fri, 09 Aug 2019 18:32:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KhBG=WF=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1hw9hA-0005BE-MX
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 18:32:56 +0000
X-Inumbo-ID: 193b4866-bad4-11e9-abb7-6f075c24ed52
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 193b4866-bad4-11e9-abb7-6f075c24ed52;
 Fri, 09 Aug 2019 18:32:53 +0000 (UTC)
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH] xen/page_alloc: Keep away MFN 0 from the buddy allocator
Thread-Index: AQHVTqw/OFC4iXiK+065fjQRWTtISqbzFUoAgAAHzMCAAEfWgP//vYBA
Date: Fri, 9 Aug 2019 18:34:19 +0000
Message-ID: <edf1b7aaef154e4991a68d148b3e5fdc@dornerworks.com>
References: <20190809121440.5668-1-julien.grall@arm.com>
 <e9d6353c-fd4d-116e-2531-7db46abf2b23@suse.com>
 <62e082b025d8483d8b577c283fce1873@dornerworks.com>
 <alpine.DEB.2.21.1908091123020.7788@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1908091123020.7788@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.58.139.1]
MIME-Version: 1.0
X-spam-status: No, score=3.3 required=5.0 tests=BAYES_00, RCVD_IN_PBL,
 RCVD_IN_XBL, MAILSHELL_SCORE_0_4, RDNS_NONE, HELO_NO_DOMAIN
X-Spam-Flag: NO
Subject: Re: [Xen-devel] [PATCH] xen/page_alloc: Keep away MFN 0 from the
 buddy allocator
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
Cc: Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpZGF5LCBBdWd1c3QgOSwgMjAxOSAyOjI0IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj5PbiBGcmksIDkgQXVnIDIwMTksIFN0ZXdhcnQgSGlsZGVi
cmFuZCB3cm90ZToKPj4gSGVyZSBpcyBKZWZmJ3MgaW5pdGlhbCBwYXRjaCBmb3IgdGhlIGlzc3Vl
Lgo+Cj5JIGNvbW1pdHRlZCBKdWxpZW4ncyBwYXRjaCBmb3Igbm93LAoKR3JlYXQhIFRoYW5rcyEK
Cj5idXQgaWYgd2UgbmVlZCB0byBtYWtlIGFueSBjaGFuZ2VzCj5vciBkZWNpZGUgZm9yIGEgYmV0
dGVyIGFsdGVybmF0aXZlLCB3ZSBjYW4gYWx3YXlzIHJldmVydCBpdC4KCkNhbiB3ZSBlbnRlcnRh
aW4gY29tbWl0dGluZyBib3RoIHBhdGNoZXM/ClRvIHBhcmFwaHJhc2UgR2VvcmdlIGZyb20gYW4g
ZWFybGllciBkaXNjdXNzaW9uOiBSZW1vdmluZyBNRk4gMCBmaXhlcyB0aGUgaXNzdWUgYnkgcmVs
eWluZyBvbiBzaWRlIGVmZmVjdHMuIEFkZGluZyBhbiBleHBsaWNpdCBjaGVjayBpbiB0aGUgbWVy
Z2luZyBsb2dpYyBkaXJlY3RseSBmaXhlcyB0aGUgaXNzdWUuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
