Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B70181100FF
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 16:16:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic9sp-0003jz-GN; Tue, 03 Dec 2019 15:14:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zSMg=ZZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ic9so-0003jt-Jv
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 15:14:34 +0000
X-Inumbo-ID: 9ca1464a-15df-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ca1464a-15df-11ea-a55d-bc764e2007e4;
 Tue, 03 Dec 2019 15:14:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8803BB513;
 Tue,  3 Dec 2019 15:14:33 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191129112851.19273-1-roger.pau@citrix.com>
 <20191129112851.19273-3-roger.pau@citrix.com>
 <20191129113813.GX980@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c06efe66-389c-2124-d4c1-f26a54d5ac5f@suse.com>
Date: Tue, 3 Dec 2019 16:14:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191129113813.GX980@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/4] x86/apic: force phys mode if
 interrupt remapping is disabled
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

T24gMjkuMTEuMjAxOSAxMjozOCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gRnJpLCBO
b3YgMjksIDIwMTkgYXQgMTI6Mjg6NDlQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+
PiBDbHVzdGVyIG1vZGUgY2FuIG9ubHkgYmUgdXNlZCB3aXRoIGludGVycnVwdCByZW1hcHBpbmcg
c3VwcG9ydCwgc2luY2UKPj4gdGhlIHRvcCAxNmJpdHMgb2YgdGhlIEFQSUMgSUQgYXJlIGZpbGxl
ZCB3aXRoIHRoZSBjbHVzdGVyIElELCBhbmQKPj4gaGVuY2Ugb24gc3lzdGVtcyB3aGVyZSB0aGUg
cGh5c2ljYWwgSUQgaXMgc3RpbGwgc21hbGxlciB0aGFuIDI1NSB0aGUKPj4gY2x1c3RlciBJRCBp
cyBub3QuIEZvcmNlIHgyQVBJQyB0byB1c2UgcGh5c2ljYWwgbW9kZSBpZiB0aGVyZSdzIG5vCj4+
IGludGVycnVwdCByZW1hcHBpbmcgc3VwcG9ydC4KPj4KPj4gTm90ZSB0aGF0IHRoaXMgcmVxdWly
ZXMgYSBmdXJ0aGVyIHBhdGNoIGluIG9yZGVyIHRvIGVuYWJsZSB4MkFQSUMKPj4gd2l0aG91dCBp
bnRlcnJ1cHQgcmVtYXBwaW5nIHN1cHBvcnQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IAo+IFRoaXMgaXMgbWlzc2luZyBhIGNv
bW1hbmQgbGluZSBkb2MgdXBkYXRlIGFuZCB0aGUgbG9naWMgYmVsb3cgaWdub3Jlcwo+IGEgdXNl
ci1zZXQgeDJhcGljX3BoeXMgdmFsdWUuCgpTbyB3aGF0IHdvdWxkIHRoZSBiZWhhdmlvciBiZSBp
biB5b3VyIG9waW5pb24gd2hlbiB0aGUgdXNlcgpoYXMgcmVxdWVzdGVkIGNsdXN0ZXIgbW9kZT8g
SSBjYW4ndCBzZWUgeW91IGRvIG11Y2ggb3RoZXIKdGhhbiBwYW5pYygpLWluZywgcGVyaGFwcyBp
dCdzIGJldHRlciB0byBvdmVycmlkZSB0aGUgcmVxdWVzdAooYXMgeW91IGFscmVhZHkgZG8pPwoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
