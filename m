Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EA59E3C6
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 11:16:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2XX6-0007Vr-1N; Tue, 27 Aug 2019 09:12:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sv2a=WX=twosheds.srs.infradead.org=batv+d6b5d8d91af00b0fd28a+5847+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1i2XX5-0007Vm-8j
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 09:12:55 +0000
X-Inumbo-ID: d1348d5e-c8aa-11e9-8980-bc764e2007e4
Received: from twosheds.infradead.org (unknown
 [2001:8b0:10b:1:21d:7dff:fe04:dbe2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1348d5e-c8aa-11e9-8980-bc764e2007e4;
 Tue, 27 Aug 2019 09:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=twosheds.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Cc:To:From:Subject:Date:References:In-Reply-To:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y5BnX+XHUd7jtxzbO52/X49dMXr6KhJ7J8hBm/7Qb2Y=; b=QQFc1QXmumyU26ZRLfGKhX2nQ
 xWkWEVGkP7c9TLso3+1ty/lr3mTJHPCZ+siODO2VlC3J069kg8ChsqIKMkvIMbDSBlajj+JIXHkww
 V5Tml3eWKZ5BID3NorXSxpqx13b2mhlzRixT7z6mfelQWU8rxo8HbtG2azxzmDD1BYrnZkIHWcwZF
 CMs1ADE+MNQTz4yp0Vv8Rm8+hZePT5B9Kf9rM2/4bQTELTUoIrboh5PzHv9KiH72z13FgJuF/mY66
 WdtwHqJR2j3SyvokLayUL8QyHAY5jzYNGZ35i+5iu4qF4q7h/tQHZ5WpYOBv0IWcdCP3vYaYc9vgO
 wdPNc+dgw==;
Received: from localhost ([127.0.0.1] helo=twosheds.infradead.org)
 by twosheds.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1i2XWk-006rr7-AB; Tue, 27 Aug 2019 09:12:34 +0000
Received: from 2a01:4c8:100c:7dd1:5f27:ed70:63ce:f1e5
 (SquirrelMail authenticated user dwmw2)
 by twosheds.infradead.org with HTTP; Tue, 27 Aug 2019 09:12:34 -0000
Message-ID: <443fba7003f2ba68364d4567be597904.squirrel@twosheds.infradead.org>
In-Reply-To: <c139b11c-a10a-3e13-ac0a-0ce28f31eef5@suse.com>
References: <cover.1565362089.git.dwmw@amazon.co.uk>
 <c0e531fc665c9ad7595d853e2ce631a13974c022.camel@infradead.org>
 <5f867a0d-036f-9800-5347-7c4d109cce47@suse.com>
 <a2143ee639599afb848e168d0f741c5130f7a241.camel@infradead.org>
 <c139b11c-a10a-3e13-ac0a-0ce28f31eef5@suse.com>
Date: Tue, 27 Aug 2019 09:12:34 -0000
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Jan Beulich" <jbeulich@suse.com>
User-Agent: SquirrelMail/1.4.23 [SVN]-1.fc30.20180816
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 twosheds.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] [PATCH v2 6/6] x86/boot: Do not use trampoline for
 no-real-mode boot paths
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 David Woodhouse <dwmw2@infradead.org>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?utf-8?B?IlJvZ2VyIFBhdSBNb25uw6ki?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDE5LjA4LjIwMTkgMTc6MjUsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPj4gT24gTW9u
LCAyMDE5LTA4LTEyIGF0IDEyOjU1ICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IE9uIDA5
LjA4LjIwMTkgMTc6MDIsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPj4+PiBAQCAtOTcsNyArMTAw
LDcgQEAgR0xPQkFMKHRyYW1wb2xpbmVfcmVhbG1vZGVfZW50cnkpCj4+Pj4gICAgICAgICAgIGNs
ZAo+Pj4+ICAgICAgICAgICBjbGkKPj4+PiAgICAgICAgICAgbGlkdCAgICB0cmFtcHN5bShpZHRf
NDgpCj4+Pj4gLSAgICAgICAgbGdkdCAgICB0cmFtcHN5bShnZHRfNDgpCj4+Pj4gKyAgICAgICAg
bGdkdGwgICB0cmFtcHN5bShnZHRfNDgpCj4+Pgo+Pj4gU3RyYXkgLyB1bnJlbGF0ZWQgY2hhbmdl
IChhbmQgaWYgbmVlZGVkLCB0aGVuIGFsc28gZm9yIGxpZHQpPwo+Pgo+PiBUaGUgZGlmZmVyZW5j
ZSBiZXR3ZWVuIDE2Yml0IGwuZHQgYW5kIDMyLWJpdCBsLmR0bCBpcyB0aGF0IHRoZSBmb3JtZXIK
Pj4gb25seSBsb2FkcyAyNCBiaXRzIG9mIHRoZSBhY3R1YWwgdGFibGUgYWRkcmVzcyAodHJhbXBv
bGluZV9nZHQgaW4gdGhpcwo+PiBjYXNlKS4KPj4KPj4gVGh1cywgd2hlbiB0cmFtcG9saW5lX2dk
dCBpcyBiZWluZyB1c2VkIGluLXBsYWNlLCBhcyBpdCBpcyBkdXJpbmcgZWFybHkKPj4gYm9vdCwg
YW5kICppZiogdGhlIFhlbiBpbWFnZSBpcyBsb2FkZWQgaGlnaGVyIHRoYW4gMTZNaUIsIGxnZHQg
ZG9lc24ndAo+PiB3b3JrLiBUaGF0J3MgaGFsZiBhIGRheSBvZiBteSBsaWZlIEkgd2FudCBiYWNr
Lgo+Cj4gQnV0IGlzbid0IHRoaXMgYW4gaXNzdWUgZXZlbiBpbmRlcGVuZGVudCBvZiB5b3VyIHNl
cmllcz8gSS5lLiBkb2Vzbid0Cj4gdGhpcyB3YW50IHRvIGJlIGZpeGVkIGluIGEgc2VwYXJhdGUg
KHRvIGJlIGJhY2twb3J0ZWQpIHBhdGNoPwoKQmVmb3JlIG15IHNlcmllcyBpdCBpc24ndCB1c2Vk
IGluIHBsYWNlIGluIHRoZSBYZW4gaW1hZ2U7IGl0J3MgYWxzbwoobW9zdGx5IGdyYXR1aXRvdXNs
eSkgY29waWVkIHRvIGxvdyBtZW1vcnkuCgotLSAKZHdtdzIKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
