Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F84612F6B5
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 11:26:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inK7P-0005vm-7I; Fri, 03 Jan 2020 10:23:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inK7N-0005vh-Di
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 10:23:45 +0000
X-Inumbo-ID: 1e425d92-2e13-11ea-a442-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e425d92-2e13-11ea-a442-12813bfff9fa;
 Fri, 03 Jan 2020 10:23:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E9DFCB25D;
 Fri,  3 Jan 2020 10:23:42 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <b7a1a7fe-0bc5-1654-ff1c-e5eb787c579e@suse.com>
 <3f78d1dc-720d-6bf3-0911-c19da1a2ddbb@suse.com>
 <a6b26f13-d242-8d51-da89-4c565fda1e33@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1deeaa10-6c55-091c-316a-26549f292cae@suse.com>
Date: Fri, 3 Jan 2020 11:24:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <a6b26f13-d242-8d51-da89-4c565fda1e33@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/3] x86: relax GDT check in
 arch_set_info_guest()
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

T24gMjcuMTIuMjAxOSAxNjowOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMC8xMi8yMDE5
IDEzOjQ5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gSXQgaXMgd3JvbmcgZm9yIHVzIHRvIGNoZWNr
IGZyYW1lcyBiZXlvbmQgdGhlIGd1ZXN0IHNwZWNpZmllZCBsaW1pdAo+PiAoaW4gdGhlIG5hdGl2
ZSBjYXNlLCBvdGhlciB0aGFuIGluIHRoZSBjb21wYXQgb25lKS4KPj4KPj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IEp1c3QgbGlrZSB0aGUgcmVz
dHJpY3Rpb24gb24gc2hhcmluZyBMMidzLCBubyBndWVzdCBpcyBldmVyIGdvaW5nIHRvIGJlCj4g
YWJsZSB0byBub3QgemVybyBhbGwgb2YgdGhpcyB0byBvcGVyYXRlIG9uIG9sZGVyIGh5cGVydmlz
b3JzLgo+IAo+IEkgYWdyZWUgdGhhdCBpdCBpcyBub3QgaWRlYWwgdGhhdCB0aGlzIGdvdCBpbnRv
IHRoZSBBQkkgdG8gYmVnaW4gd2l0aCwKPiBidXQgYXMgSSBzYWlkIGJlZm9yZSwgYWxsIHlvdSBh
cmUgZG9pbmcgaXMgY29tcGxpY2F0aW5nCj4gYXJjaF9zZXRfaW5mb19ndWVzdCgpIGZvciBhIHJl
bGF4YXRpb24gd2hpY2ggbm8gZ3Vlc3QgY2FuIHVzZS4KCkFzIGFza2VkIGJlZm9yZSAtIHdvdWxk
IHlvdSBtaW5kIGNsYXJpZnlpbmcgd2hlcmUgSSdtIGNvbXBsaWNhdGluZwp0aGluZ3M/IEkgdGhp
bmsgSSdtIHJhdGhlciBzaW1wbGlmeWluZyBtYXR0ZXJzLCBieQotIHB1bGxpbmcgb3V0IGEgY2Fs
Y3VsYXRpb24sIHN0b3JpbmcgdGhlIHJlc3VsdCBpbnRvIGEgbm93IGNvbW1vbgogIChiZXR3ZWVu
IG5hdGl2ZSBhbmQgY29tcGF0IGNhc2VzKSBsb2NhbCB2YXJpYWJsZSwKLSBhcyBhIHJlc3VsdCBt
YWtpbmcgbmF0aXZlIGFuZCBjb21wYXQgY2FzZXMgYmVoYXZlIGNvbnNpc3RlbnRseSwKICBlbGlt
aW5hdGluZyB0aGUgbmVlZCBmb3IgcmVhZGVyIHRvICh0cnkgdG8pIGZpZ3VyZSBvdXQgd2h5IHRo
ZXJlCiAgaXMgYSBkaWZmZXJlbmNlIGluIGJlaGF2aW9yLgoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
