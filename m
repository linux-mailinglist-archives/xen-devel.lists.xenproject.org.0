Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DF3140E6E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 16:59:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isTye-0002Pt-5h; Fri, 17 Jan 2020 15:56:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1isTyc-0002Po-SU
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 15:56:02 +0000
X-Inumbo-ID: d9d9b620-3941-11ea-b571-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9d9b620-3941-11ea-b571-12813bfff9fa;
 Fri, 17 Jan 2020 15:55:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 79CAAAC2F;
 Fri, 17 Jan 2020 15:55:57 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200117150948.45014-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <27d19d98-2209-8add-c66c-e06e51834172@suse.com>
Date: Fri, 17 Jan 2020 16:56:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200117150948.45014-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/apic: fix disabling LVT0 in
 disconnect_bsp_APIC
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

T24gMTcuMDEuMjAyMCAxNjowOSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFRoZSBJbnRlbCBT
RE0gc3RhdGVzOgo+IAo+ICJXaGVuIGFuIGlsbGVnYWwgdmVjdG9yIHZhbHVlICgwIHRvIDE1KSBp
cyB3cml0dGVuIHRvIGEgTFZUIGVudHJ5IGFuZAo+IHRoZSBkZWxpdmVyeSBtb2RlIGlzIEZpeGVk
IChiaXRzIDgtMTEgZXF1YWwgMCksIHRoZSBBUElDIG1heSBzaWduYWwgYW4KPiBpbGxlZ2FsIHZl
Y3RvciBlcnJvciwgd2l0aG91dCByZWdhcmQgdG8gd2hldGhlciB0aGUgbWFzayBiaXQgaXMgc2V0
IG9yCj4gd2hldGhlciBhbiBpbnRlcnJ1cHQgaXMgYWN0dWFsbHkgc2VlbiBvbiB0aGUgaW5wdXQu
Igo+IAo+IEFuZCB0aGF0J3MgZXhhY3RseSB3aGF0J3MgY3VycmVudGx5IGRvbmUgaW4gZGlzY29u
bmVjdF9ic3BfQVBJQyB3aGVuCj4gdmlydF93aXJlX3NldHVwIGlzIHRydWUgYW5kIExWVCBMSU5U
MCBpcyBiZWluZyBtYXNrZWQuIEJ5IHdyaXRpbmcgb25seQo+IEFQSUNfTFZUX01BU0tFRCBYZW4g
aXMgYWN0dWFsbHkgc2V0dGluZyB0aGUgdmVjdG9yIHRvIDAgYW5kIHRoZQo+IGRlbGl2ZXJ5IG1v
ZGUgdG8gRml4ZWQgKDApLCBhbmQgaGVuY2UgaXQgdHJpZ2dlcnMgYW4gQVBJQyBlcnJvciBldmVu
Cj4gd2hlbiB0aGUgTFZUIGVudHJ5IGlzIG1hc2tlZC4KCkJ1dCB0aGVyZSBhcmUgbWFueSBtb3Jl
IGluc3RhbmNlcyB3aGVyZSB3ZSAoaGF2ZSBhIHJpc2sgdG8pIGRvIHNvLAptb3N0IG5vdGFibHkg
aW4gY2xlYXJfbG9jYWxfQVBJQygpLiBUaGUgdHdvIHN0ZXAgbG9naWMgdGhlcmUgaXMKYW55d2F5
IHNvbWV3aGF0IGluIGNvbmZsaWN0IHdpdGggdGhlIGNpdGF0aW9uIGFib3ZlLgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
