Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9582CEE152
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 14:34:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRcTY-0004iS-5j; Mon, 04 Nov 2019 13:32:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M3pU=Y4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iRcTW-0004iL-Pv
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 13:32:54 +0000
X-Inumbo-ID: 9aa51446-ff07-11e9-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9aa51446-ff07-11e9-9631-bc764e2007e4;
 Mon, 04 Nov 2019 13:32:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2F6B5AF99;
 Mon,  4 Nov 2019 13:32:53 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191101202502.31750-1-andrew.cooper3@citrix.com>
 <20191101202502.31750-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6eedb8a2-4c12-c615-edf5-abbe19c278f1@suse.com>
Date: Mon, 4 Nov 2019 14:32:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191101202502.31750-3-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/3] x86/boot: Cache cpu_has_hypervisor very
 early on boot
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTEuMjAxOSAyMToyNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS94ZW4vYXJj
aC94ODYvYm9vdC9oZWFkLlMKPiArKysgYi94ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMKPiBAQCAt
NjMwLDYgKzYzMCwxMCBAQCB0cmFtcG9saW5lX3NldHVwOgo+ICAKPiAgMToKPiAgICAgICAgICAv
KiBJbnRlcnJvZ2F0ZSBDUFUgZXh0ZW5kZWQgZmVhdHVyZXMgdmlhIENQVUlELiAqLwo+ICsgICAg
ICAgIG1vdiAgICAgJDEsICVlYXgKPiArICAgICAgICBjcHVpZAo+ICsgICAgICAgIG1vdiAgICAg
JWVjeCwgc3ltX2ZzKGJvb3RfY3B1X2RhdGEpICsgQ1BVSU5GT19GRUFUVVJFX09GRlNFVChYODZf
RkVBVFVSRV9IWVBFUlZJU09SKQoKSSB1bmRlcnN0YW5kIHRoZSBFQ1ggb3V0cHV0IGlzIGFsbCB3
ZSBuZWVkIHJpZ2h0IG5vdy4gQnV0IHdvdWxkbid0Cml0IGJlIGJldHRlciB0byB0aGVuIHN0b3Jl
IEVEWCBhcyB3ZWxsIChhbmQgc2ltaWxhcmx5IEVDWCBvZgoweDgwMDAwMDAxIG91dHB1dCk/CgpB
bHNvLCBhbG9uZyB0aGUgbGluZXMgb2YgYSBxdWVzdGlvbiBiYWNrIHRvIFNlcmdleSBvbiBoaXMK
c3RhbmRhbG9uZSBwYXRjaCwgd291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIHRha2UgdGhlIG9wcG9y
dHVuaXR5CmFuZCBjaGVjayBoZXJlIHRoYXQgQ1BVSUQgbGVhZiAxIGlzIGFjdHVhbGx5IHZhbGlk
PwoKT2YgY291cnNlIHRoZSBxdWVzdGlvbiBvbiB0aGUgKGludGVuZGVkKSBlZmZlY3Qgb2YKImNw
dWlkPW5vLWh5cGVydmlzb3IiIGFsc28gcmVtYWlucy4gQXMgc2FpZCBiZWZvcmUsIEkgdGhpbmsg
dGhpcwpzaG91bGQgYmUgaG9ub3JlZCBieSBhbGwgb2Ygb3VyIGNvZGUgdGhhdCBwb3NzaWJseSBj
YW4gKGkuZS4gYXQKbGVhc3QgZXZlcnl0aGluZyBmb2xsb3dpbmcgY29tbWFuZCBsaW5lIHBhcnNp
bmcpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
