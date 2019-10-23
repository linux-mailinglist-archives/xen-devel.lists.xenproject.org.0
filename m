Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 253B2E1DBA
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 16:10:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNHJR-0006qM-KI; Wed, 23 Oct 2019 14:08:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNHJP-0006qH-F1
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 14:08:31 +0000
X-Inumbo-ID: 9720b360-f59e-11e9-947f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9720b360-f59e-11e9-947f-12813bfff9fa;
 Wed, 23 Oct 2019 14:08:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A80EDB129;
 Wed, 23 Oct 2019 14:08:29 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191023085739.43585-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <16dbe2c5-f83e-6bc9-ff56-46c822b3ccd5@suse.com>
Date: Wed, 23 Oct 2019 16:08:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023085739.43585-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/tsc: update vcpu time info on
 guest TSC adjustments
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMjAxOSAxMDo1NywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IElmIGEgSFZNL1BW
SCBndWVzdCB3cml0ZXMgdG8gTVNSX0lBMzJfVFNDe19BREpVU1R9IGFuZCB0aHVzIGNoYW5nZXMK
PiB0aGUgdmFsdWUgb2YgdGhlIHRpbWUgc3RhbXAgY291bnRlciB0aGUgdmNwdSB0aW1lIGluZm8g
bXVzdCBhbHNvIGJlCj4gdXBkYXRlZCwgb3IgdGhlIHRpbWUgY2FsY3VsYXRlZCBieSB0aGUgZ3Vl
c3QgdXNpbmcgdGhlIFhlbiBQViBjbG9jawo+IGludGVyZmFjZSB3aWxsIGJlIHNrZXdlZC4KPiAK
PiBVcGRhdGUgdGhlIHZjcHUgdGltZSBpbmZvIHdoZW4gdGhlIGd1ZXN0IHdyaXRlcyB0byBlaXRo
ZXIgTVNSX0lBMzJfVFNDCj4gb3IgTVNSX0lBMzJfVFNDX0FESlVTVC4gVGhpcyBmaXhlcyBsb2Nr
dXBzIHNlZW4gd2hlbiBydW5uaW5nIHRoZQo+IHB2LXNoaW0gb24gQU1EIGhhcmR3YXJlLCBzaW5j
ZSB0aGUgc2hpbSB3aWxsIGFnZ3Jlc3NpdmVseSB0cnkgdG8ga2VlcAo+IFRTQ3MgaW4gc3luYyBi
eSBwZXJpb2RpY2FsbHkgd3JpdGluZyB0byBNU1JfSUEzMl9UU0MgaWYgdGhlIFRTQyBpcyBub3QK
PiByZWxpYWJsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
