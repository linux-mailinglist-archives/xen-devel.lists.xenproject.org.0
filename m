Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB984A6C8C
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 17:11:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5AQm-0004IT-A9; Tue, 03 Sep 2019 15:09:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5AQk-0004IN-G0
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 15:09:14 +0000
X-Inumbo-ID: c9f491f8-ce5c-11e9-b76c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9f491f8-ce5c-11e9-b76c-bc764e2007e4;
 Tue, 03 Sep 2019 15:09:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9F621AF54;
 Tue,  3 Sep 2019 15:09:12 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190829101846.21369-1-jgross@suse.com>
 <20190829101846.21369-6-jgross@suse.com>
 <87905a2d-acd5-90b7-1c40-bf81f5ac005b@suse.com>
 <75a52d2d-a482-c62d-8d30-b02aba00d349@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2a7b100c-2403-6bf2-7a73-3f2b0a2461a4@suse.com>
Date: Tue, 3 Sep 2019 17:09:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <75a52d2d-a482-c62d-8d30-b02aba00d349@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 5/5] xen: modify several static locks to
 unique names
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMjAxOSAxNzowMywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwMy4wOS4xOSAx
Njo1MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI5LjA4LjIwMTkgMTI6MTgsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBJbiBvcmRlciB0byBoYXZlIHVuaXF1ZSBuYW1lcyB3aGVuIGRvaW5n
IGxvY2sgcHJvZmlsaW5nIHNldmVyYWwgbG9jYWwKPj4+IGxvY2tzICJsb2NrIiBuZWVkIHRvIGJl
IHJlbmFtZWQuCj4+Cj4+IEJ1dCB0aGVzZSBhcmUgYWxsIG5hbWVkIHNpbXBseSAibG9jayIgZm9y
IGEgZ29vZCByZWFzb24sIGluY2x1ZGluZwo+PiBiZWNhdXNlIHRoZXkncmUgYWxsIGZ1bmN0aW9u
IHNjb3BlIHN5bWJvbHMgKGFuZCB0eXBpY2FsbHkgdGhlCj4+IGZ1bmN0aW9ucyBhcmUgYWxsIHN1
ZmZpY2llbnRseSBzaG9ydCkuIFRoZSBpc3N1ZSBzdGVtcyBmcm9tIHRoZQo+PiBkdWFsIHVzZSBv
ZiAibmFtZSIgaW4KPj4KPj4gI2RlZmluZSBfTE9DS19QUk9GSUxFKG5hbWUpIHsgMCwgI25hbWUs
ICZuYW1lLCAwLCAwLCAwLCAwLCAwIH0KPj4KPj4gc28gSSdkIHJhdGhlciBzdWdnZXN0IG1ha2lu
ZyB0aGlzIGEgZGVyaXZhdGlvbiBvZiBhIG5ldwo+Pgo+PiAjZGVmaW5lIF9MT0NLX1BST0ZJTEVf
TkFNRShsb2NrLCBuYW1lKSB7IDAsICNuYW1lLCAmbG9jaywgMCwgMCwgMCwgMCwgMCB9Cj4+Cj4+
IGlmIHRoZXJlJ3Mgbm8gb3RoZXIgKHRyYW5zcGFyZW50KSB3YXkgb2YgZGlzYW1iaWd1YXRpbmcg
dGhlIG5hbWVzLgo+IAo+IFRoaXMgd2lsbCByZXF1aXJlIHRvIHVzZSBhIGRpZmZlcmVudCBERUZJ
TkVfU1BJTkxPQ0soKSB2YXJpYW50LCBzbyBlLmcuCj4gREVGSU5FX1NQSU5MT0NLX0xPQ0FMKCks
IHdoaWNoIHdpbGwgdGhlbiBpbmNsdWRlIHRoZSBuZWVkZWQgInN0YXRpYyIgYW5kCj4gYWRkICJA
PGZ1bmM+IiB0byB0aGUgbG9jayBwcm9maWxpbmcgbmFtZS4gSXMgdGhpcyBva2F5PwoKVG8gYmUg
ZnJhbmsgLSBub3QgcmVhbGx5LiBJIGRpc2xpa2UgYm90aCwgYW5kIHdvdWxkIGhlbmNlIHByZWZl
ciB0bwpzdGljayB0byB3aGF0IHRoZXJlIGlzIGN1cnJlbnRseSwgdW50aWwgc29tZW9uZSBpbnZl
bnRzIGEgdHJhbnNwYXJlbnQKd2F5IHRvIGRpc2FtYmlndWF0ZSB0aGVzZS4gSSdtIHNvcnJ5IGZv
ciBiZWluZyB1bmhlbHBmdWwgaGVyZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
