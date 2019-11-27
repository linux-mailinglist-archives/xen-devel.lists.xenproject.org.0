Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C49410B326
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 17:24:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia04l-0006Xb-Vt; Wed, 27 Nov 2019 16:21:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LuZI=ZT=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ia04k-0006XW-Qm
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 16:21:58 +0000
X-Inumbo-ID: 087f5684-1132-11ea-83b8-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 087f5684-1132-11ea-83b8-bc764e2007e4;
 Wed, 27 Nov 2019 16:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574871718;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=hhVtQpm4hhQ45wqVx4soqCg7NNKSybFZUWFpRxGyMCc=;
 b=ak6cU0CKZDwXXCCnuYBAaG3QLHuyGRlzbV7gIkVMJWAuP3qy2XLFmo6c
 OUOKXRgBGvbxgtdQajx6K/3VQDtEaE258+ghe/rbXgJu2g42IOrMnT20X
 HVKCTdAQm9MuURb0R/stFk12VA8Vk/RxYLX8YWxmmNG749ftoyyNs5oqA Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: T7C9T3+dQZuEOjNL/gSKuzfzGn/w1ENjn9Lhwg/sZVLkSEaJ7sENtz0feUGhrvsmFfupkXtVxl
 SobzuzxkZ+KD6GeVbXfUvCwwcReaH4dD8cnSHSVLXts2N/aLvdQHqnnJGzMDUBWDaeuCz3qlIX
 XtdgWjtjgI3wCWywRIBdMeqhN33NOgUQKfaB+qWOHp6IGvMTfCwFctpRj8qSPiO0yV+RNM0CUO
 R1+cHSv3r0zjDcqE2SVQXOr96BJiMbI/OfmKHDxAlscpM7KKUvSA6z6o6aaYpevt9NL2MG6lXC
 pok=
X-SBRS: 2.7
X-MesageID: 8920215
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,250,1571716800"; 
   d="scan'208";a="8920215"
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
References: <20191127160108.12490-1-roger.pau@citrix.com>
 <38400e64-4ace-77a9-6b95-58f1754ca690@suse.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <9154ab98-8bb7-d8c7-5310-61c865040ed4@citrix.com>
Date: Wed, 27 Nov 2019 16:21:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <38400e64-4ace-77a9-6b95-58f1754ca690@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] clang: do not enable live-patching
 support
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMjcvMTkgNDoxNCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjcuMTEuMjAxOSAx
NzowMSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+PiBMaXZlLXBhdGNoaW5nIHJlcXVpcmVzIHVu
aXF1ZSBzeW1ib2xzLCBhbmQgc2FkbHkgdGhlIGNsYW5nIGJ1aWxkCj4+IGdlbmVyYXRlcyBhIGxv
dCBvZiBkdXBsaWNhdGUgc3ltYm9sczoKPj4KPj4gRHVwbGljYXRlIHN5bWJvbCAnYXNpZC5jI2dl
dF9jcHVfaW5mbycgKGZmZmY4MmQwODAzMDMyYzAgIT0gZmZmZjgyZDA4MDJlMGY1MCkKPj4gRHVw
bGljYXRlIHN5bWJvbCAnYXNpZC5jI2dldF9jcHVfaW5mb19mcm9tX3N0YWNrJyAoZmZmZjgyZDA4
MDJlMTA4MCAhPSBmZmZmODJkMDgwMzAzMmYwKQo+PiBEdXBsaWNhdGUgc3ltYm9sICdhdHMuYyNf
X2xpc3RfYWRkJyAoZmZmZjgyZDA4MDI2MGEwMCAhPSBmZmZmODJkMDgwMjY3YzcwKQo+PiBEdXBs
aWNhdGUgc3ltYm9sICdib290LmMjY29uc3RhbnRfdGVzdF9iaXQnIChmZmZmODJkMDgwNDBlYTYw
ICE9IGZmZmY4MmQwODA0MzcyZjApCj4+IER1cGxpY2F0ZSBzeW1ib2wgJ2NvbW1vbi5jI2NsZWFy
X2JpdCcgKGZmZmY4MmQwODAzMzI0NDAgIT0gZmZmZjgyZDA4MDJkMzNiMCkKPj4gRHVwbGljYXRl
IHN5bWJvbCAnY29tbW9uLmMjY29uc3RhbnRfdGVzdF9iaXQnIChmZmZmODJkMDgwMzMyMzQwICE9
IGZmZmY4MmQwODAyZDIyMjApCj4+IER1cGxpY2F0ZSBzeW1ib2wgJ2NvbW1vbi5jI2NwdW1hc2tf
Y2hlY2snIChmZmZmODJkMDgwMmQzMzcwICE9IGZmZmY4MmQwODAzMzdiNjApCj4+IER1cGxpY2F0
ZSBzeW1ib2wgJ2NvbW1vbi5jI2dldF9jcHVfaW5mbycgKGZmZmY4MmQwODAyZDIyYjAgIT0gZmZm
ZjgyZDA4MDMzMTU5MCkKPj4gRHVwbGljYXRlIHN5bWJvbCAnY29tbW9uLmMjZ2V0X2NwdV9pbmZv
X2Zyb21fc3RhY2snIChmZmZmODJkMDgwMmQzMWMwICE9IGZmZmY4MmQwODAzMzc0YjApCj4+IER1
cGxpY2F0ZSBzeW1ib2wgJ2NvbW1vbi5jI3Bmbl90b19wZHgnIChmZmZmODJkMDgwMmQzMjcwICE9
IGZmZmY4MmQwODAzMzFlMDApCj4+IER1cGxpY2F0ZSBzeW1ib2wgJ2NvbW1vbi5jI3Rlc3RfYW5k
X3NldF9iaXQnIChmZmZmODJkMDgwMmQzMzYwICE9IGZmZmY4MmQwODAzMzIyNTApCj4+IER1cGxp
Y2F0ZSBzeW1ib2wgJ2NvbW1vbi5jI3ZhcmlhYmxlX2NsZWFyX2JpdCcgKGZmZmY4MmQwODAyZDIy
NzAgIT0gZmZmZjgyZDA4MDMzN2I1MCkKPj4gRHVwbGljYXRlIHN5bWJvbCAnY29tcGF0LmMjZ2V0
X2NwdV9pbmZvJyAoZmZmZjgyZDA4MDI2ZWFiMCAhPSBmZmZmODJkMDgwMjAwNDYwKQo+PiBEdXBs
aWNhdGUgc3ltYm9sICdjb21wYXQuYyNnZXRfY3B1X2luZm9fZnJvbV9zdGFjaycgKGZmZmY4MmQw
ODAyNmViZDAgIT0gZmZmZjgyZDA4MDIwMGY3MCkKPj4gRHVwbGljYXRlIHN5bWJvbCAnY3B1X2lk
bGUuYyNnZXRfY3B1X2luZm8nIChmZmZmODJkMDgwMmNjYjAwICE9IGZmZmY4MmQwODAzNWZjYzAp
Cj4+IFsuLi5dCj4+Cj4+IEZvciB0aGUgdGltZSBiZWluZyBkaXNhYmxlIGxpdmUtcGF0Y2hpbmcg
d2hlbiBidWlsZGluZyB3aXRoIGNsYW5nLAo+PiBzaW5jZSBkdXBsaWNhdGUgc3ltYm9scyB3aWxs
IHRyaWdnZXIgYSBidWlsZCBmYWlsdXJlIGJlY2F1c2UKPj4gRU5GT1JDRV9VTklRVUVfU1lNQk9M
UyBpcyBub3cgYWxzbyBlbmFibGVkIGJ5IGRlZmF1bHQgaW4gY29uanVuY3Rpb24KPj4gd2l0aCBs
aXZlLXBhdGNoaW5nLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KPiAKPiBUbyBiZSBob25lc3QsIGFzIGluZGljYXRlZCBiZWZvcmUg
SSdtIGluY2xpbmVkIHRvIG5hayB0aGlzIHBhdGNoCj4gb24gdGhlIGJhc2lzIHRoYXQgYSBwcm9w
ZXIgc29sdXRpb24gaGFzIGJlZW4gcG9zdGVkIGFsbW9zdCAzIHdlZWtzCj4gYWdvIChhbmQgdGhp
cyB3YXMgYWxyZWFkeSB2MikuCgpXaGF0J3MgdGhhdCBwYXRjaCB3YWl0aW5nIG9uPwoKIC1HZW9y
Z2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
