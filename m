Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C70ADB7EC5
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 18:08:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAyvW-0002wd-1Y; Thu, 19 Sep 2019 16:05:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iAyvU-0002wY-H7
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 16:05:00 +0000
X-Inumbo-ID: 3b118d54-daf7-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b118d54-daf7-11e9-a337-bc764e2007e4;
 Thu, 19 Sep 2019 16:04:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0C04069902;
 Thu, 19 Sep 2019 16:04:59 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <48d6972c-c15a-6f74-1726-ff4154f04c4d@suse.com>
Message-ID: <bd5cb83e-c886-81b6-a233-c2e934736aa1@suse.com>
Date: Thu, 19 Sep 2019 18:05:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <48d6972c-c15a-6f74-1726-ff4154f04c4d@suse.com>
Content-Language: en-US
Subject: [Xen-devel] Ping: [PATCH v3 0/2] x86/traps: improve show_trace()'s
 top-of-stack handling
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
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3LAoKT24gMTUuMDcuMjAxOSAxNjo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gMTogZ3Vh
cmQgdG9wLW9mLXN0YWNrIHJlYWRzCj4gMjogd2lkZW4gY29uZGl0aW9uIGZvciBsb2dnaW5nIHRv
cC1vZi1zdGFjawo+IAo+IFRoZSBpc3N1ZSBwYXRjaCAyIGZpeGVzIChhIGN1cmlvdXMgbGFjayBv
ZiBhbiBpbnRlcm1lZGlhdGUgY2FsbCBzdGFjawo+IGVudHJ5KSB3YXMgb2JzZXJ2ZWQgaW4gcHJh
Y3RpY2U7IHBhdGNoIDEgaXMgYSByZXN1bHQgb2YgbWUganVzdCBsb29raW5nCj4gYXQgdGhlIGNv
ZGUuCgpJIHJlYWxpemUgeW91J3JlIG5vdCBpbiB0aGUgb2ZmaWNlIGZvciB0aGUgbmV4dCBzZXZl
cmFsIGRheXMgKGFuZAppbiBwYXJ0aWN1bGFyIG5vdCB1bnRpbCBjb2RlIGZyZWV6ZSksIGJ1dCBJ
IHRoaW5rIHRoaXMgaXMgYW5vdGhlcgppdGVtIHdoaWNoIHdvdWxkIGJlIG5pY2UgaWYgd2UgY291
bGQgaGF2ZSBpbiA0LjEzLCBhbmQgaXQncyBiZWVuCnBlbmRpbmcgZm9yIHF1aXRlIHNvbWUgdGlt
ZS4gT2YgY291cnNlLCBpZiB3ZSBjYW4ndCByZWFjaCBhZ3JlZW1lbnQKb24gaG93IHRoaXMgc2hv
dWxkIHdvcmssIHRoZW4gc28gYmUgaXQgKGFuZCBJJ2xsIGNhcnJ5IHRoZSBwYXRjaGVzCmxvY2Fs
bHkgZm9yIHRoZSBmb3Jlc2VlYWJsZSBmdXR1cmUpIC4uLgoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
