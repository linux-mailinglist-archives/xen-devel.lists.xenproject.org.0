Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D104A045B
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 16:13:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2yeg-0006Cl-DF; Wed, 28 Aug 2019 14:10:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uWOn=WY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2yee-0006Cg-OI
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 14:10:32 +0000
X-Inumbo-ID: 983419ea-c99d-11e9-ae47-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 983419ea-c99d-11e9-ae47-12813bfff9fa;
 Wed, 28 Aug 2019 14:10:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CDAEFAE92;
 Wed, 28 Aug 2019 14:10:30 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190812182125.18094-1-andrew.cooper3@citrix.com>
 <20190812182125.18094-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <68191410-eb79-f1b5-f2ee-70059e08e3f8@suse.com>
Date: Wed, 28 Aug 2019 16:10:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812182125.18094-4-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/suspend: Simplify system table handling
 on resume
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDguMjAxOSAyMDoyMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBsb2FkX1RSKCkgaXMg
dXNlZCBleGNsdXNpdmVseSBpbiB0aGUgcmVzdW1lIHBhdGgsIGJ1dCBqdW1wcyB0aHJvdWdoIGEg
bG90IG9mCj4gdW5uZWNlc3NhcnkgaG9vcHMuCj4gCj4gQXMgc3VzcGVuZC9yZXN1bWUgaXMgc3Ry
aWN0bHkgb24gQ1BVMCBpbiBpZGxlIGNvbnRleHQsIHRoZSBjb3JyZWN0IEdEVCB0byB1c2UKPiBp
cyBib290X2dkdCwgd2hpY2ggbWVhbnMgaXQgZG9lc24ndCBuZWVkIHNhdmluZyBvbiBzdXNwZW5k
LiAgU2ltaWxhcmx5LCB0aGUKPiBjb3JyZWN0IElEVCB0byB1c2UgY2FuIGJlIGRlcml2ZWQsIGFu
ZCB0aGUgTERUIGlzIGd1YXJhbnRlZWQgdG8gYmUgTlVMLgo+IAo+IFRoZSBUUiBpcyBzdGlsbCBj
b3JyZWN0IGluIHRoZSBHRFQsIGJ1dCBuZWVkcyB0aGUgYnVzeSBiaXQgY2xlYXJpbmcgYmVmb3Jl
IHdlCj4gY2FuIHJlbG9hZCBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IC0tLQo+IENDOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+Cj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gQ0M6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IAo+IEEgc2xpZ2h0bHkgZGlmZmVyZW50IG9w
dGlvbiB3b3VsZCBiZSB0byBjYWxsIGxvYWRfc3lzdGVtX3RhYmxlcygpIHJhdGhlciB0aGFuCj4g
b3BlbmNvZGluZyBwYXJ0IG9mIGl0IGluIHJlc3RvcmVfcmVzdF9wcm9jZXNzb3Jfc3RhdGUoKS4g
IEhvd2V2ZXIsIHRoYXQgaXMKPiBtb3JlIHNldHVwIHRoYW4gaXMgbmVjZXNzYXJ5LiAgVGhvdWdo
dHM/CgpUaGlzIG1pZ2h0IGluZGVlZCBiZSBiZXR0ZXIgKGRlc3BpdGUgdGhlIHBhcnRzIG5vdCBu
ZWVkZWQgb24gdGhpcwpwYXRoKSwgYXMgaXQgd291bGQgZnVydGhlciBjZW50cmFsaXplIHRoZSBo
YW5kbGluZy4gT2YgY291cnNlIG9ubHkKYXMgbG9uZyBhcyB0aGVyZSdzIG5vIChzaWduaWZpY2Fu
dCkgY2hhbmdlIG5lZWRlZCB0byB0aGUgZnVuY3Rpb24KaW4gb3JkZXIgdG8gYmUgdXNlZCBoZXJl
LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
