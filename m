Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCDC16FFB6
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 14:13:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6wSX-0006E4-WD; Wed, 26 Feb 2020 13:10:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=joxT=4O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6wSW-0006Do-EY
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 13:10:40 +0000
X-Inumbo-ID: 61ce0092-5899-11ea-941c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61ce0092-5899-11ea-941c-12813bfff9fa;
 Wed, 26 Feb 2020 13:10:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B8F06B1A6;
 Wed, 26 Feb 2020 13:10:37 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200226121921.28627-5-roger.pau@citrix.com>
 <20200226123844.29519-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3cea2d54-345b-d632-2d2f-320fe586e0ea@suse.com>
Date: Wed, 26 Feb 2020 14:10:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226123844.29519-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 4/4] x86/smp: do not use scratch_cpumask
 when in interrupt or exception context
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
Cc: xen-devel@lists.xenproject.org, Sander Eikelenboom <linux@eikelenboom.it>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAxMzozOCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFVzaW5nIHNjcmF0
Y2hfY3B1bWFzayBpbiBzZW5kX0lQSV9tYXNrIGlzIG5vdCBzYWZlIGluIElSUSBvciBleGNlcHRp
b24KPiBjb250ZXh0IGJlY2F1c2UgaXQgY2FuIG5lc3QsIGFuZCBoZW5jZSBzZW5kX0lQSV9tYXNr
IGNvdWxkIGJlCj4gb3ZlcndyaXRpbmcgYW5vdGhlciB1c2VyIHNjcmF0Y2ggY3B1bWFzayBkYXRh
IHdoZW4gdXNlZCBpbiBzdWNoCj4gY29udGV4dHMuCj4gCj4gSW5zdGVhZCBpbnRyb2R1Y2UgYSBu
ZXcgY3B1bWFzayB0byBiZSB1c2VkIGJ5IHNlbmRfSVBJX21hc2ssIGFuZAo+IGRpc2FibGUgaW50
ZXJydXB0cyB3aGlsZSB1c2luZyBpdC4KCldpdGggdGhpcyBub3cgYXBwYXJlbnRseSBzdGFsZSBz
ZW50ZW5jZSBkcm9wcGVkIChlYXNpbHkgZG9uZQp3aGlsZSBjb21taXR0aW5nKQoKPiBGYWxsYmFj
ayB0byBub3QgdXNpbmcgdGhlIHNjcmF0Y2ggY3B1bWFzayAoYW5kIGhlbmNlIG5vdCBhdHRlbXBp
bmcgdG8KPiBvcHRpbWl6ZSBJUEkgc2VuZGluZyBieSB1c2luZyBhIHNob3J0aGFuZCkgd2hlbiBp
biBJUlEgb3IgZXhjZXB0aW9uCj4gY29udGV4dC4gTm90ZSB0aGF0IHRoZSBzY3JhdGNoIGNwdW1h
c2sgY2Fubm90IGJlIHVzZWQgd2hlbgo+IG5vbi1tYXNrYWJsZSBpbnRlcnJ1cHRzIGFyZSBiZWlu
ZyBzZXJ2aWNlZCAoTk1JIG9yICNNQykgYW5kIGhlbmNlCj4gZmFsbGJhY2sgdG8gbm90IHVzaW5n
IHRoZSBzaG9ydGhhbmQgaW4gdGhhdCBjYXNlLCBsaWtlIGl0IHdhcyBkb25lCj4gcHJldmlvdXNs
eS4KPiAKPiBGaXhlczogNTUwMGQyNjVhMmE4ICgneDg2L3NtcDogdXNlIEFQSUMgQUxMQlVUIGRl
c3RpbmF0aW9uIHNob3J0aGFuZCB3aGVuIHBvc3NpYmxlJykKPiBSZXBvcnRlZC1ieTogU2FuZGVy
IEVpa2VsZW5ib29tIDxsaW51eEBlaWtlbGVuYm9vbS5pdD4KPiBTaWduZWQtb2ZmLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
