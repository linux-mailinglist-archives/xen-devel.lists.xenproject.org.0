Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AFE7D8BA
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 11:40:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ht7WV-0005Sb-Qe; Thu, 01 Aug 2019 09:37:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qeGT=V5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ht7WU-0005Ri-95
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 09:37:22 +0000
X-Inumbo-ID: f4acbed4-b43f-11e9-b41f-c7483450b360
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f4acbed4-b43f-11e9-b41f-c7483450b360;
 Thu, 01 Aug 2019 09:37:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8D86344;
 Thu,  1 Aug 2019 02:37:18 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DC8B3F694;
 Thu,  1 Aug 2019 02:37:18 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-2-git-send-email-andrii.anisov@gmail.com>
 <ad2a343e-1a65-6569-17a2-e5b676908e49@arm.com>
 <de4feda4-d8b6-4922-26f5-ea3d3f940563@gmail.com>
 <2da153e4-2e11-18af-5a0d-cdc12beaf858@arm.com>
 <be1d31db-60d6-6e05-e50d-d5bc6963d9e7@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <096ebef8-0bc5-8b49-9b59-10fdb7e6c1de@arm.com>
Date: Thu, 1 Aug 2019 10:37:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <be1d31db-60d6-6e05-e50d-d5bc6963d9e7@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 1/6] xen/arm: Re-enable interrupt later in the
 trap path
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwMS8wOC8yMDE5IDA3OjQ1LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IE9uIDMwLjA3
LjE5IDIzOjEwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gCj4+PiBJbiB0aGlzIHNlcmllcyBJIHRo
aW5rIEkgbmVlZCBpbnRlcnJ1cHRzIGxvY2tlZCB1bnRpbCBJIHN0YXJ0IHRpbWUgYWNjb3VudGlu
ZyAKPj4+IGZvciBoeXBlcnZpc29yLiBUaW1lIGFjY291bnRpbmcgaXMgc3RhcnRlZCBieSBgdGFj
Y19oZWFkKClgIGZ1bmN0aW9uLiBJIAo+Pj4gcHJlZmVyIHRvIGhhdmUgaXQgY2FsbGVkIGZyb20g
QywgYmVjYXVzZSBpdCBpcyBtb3JlIGNvbnZlbmllbnQgYW5kIG9idmlvdXMgCj4+PiBmb3IgdGhv
c2Ugd2hvIGFyZSBsZXNzIGZhbWlsaWFyIHdpdGggdGhlIEFSTSBjb2RlLgo+IAo+IEhlcmUgaXMg
dGhlIHF1ZXN0aW9uIHRvIHlvdTogd2hhdCBpcyB0aGUgYmVzdCBwbGFjZSAoYW5kIHdheSkgdG8g
c3RhcnQgCj4gaHlwZXJ2aXNvciB0aW1lIHRyYWNraW5nPwoKTG9va2luZyBhdCB0aGUgcGF0Y2gs
IGh5cGVydmlzb3IgdGltZSBhY2NvdW50aW5nIGlzIGZvcjoKICAgICAxKSBzb2Z0aXJxcwogICAg
IDIpIGhhcmRpcnFzCgpGb3IgaGFyZGlycXMsIHlvdSBhbHdheXMgZW50ZXIgaW4gQyB3aXRoIGlu
dGVycnVwdCBkaXNhYmxlZC4gU28gdGhpcyBjYW4gYmUgCmNhbGxlZCBkaXJlY3RseSBmcm9tIHRo
ZXJlLgoKRm9yIHNvZnRpcnFzLCB0aGV5IGFyZSBxdWl0ZSBhIGZldyBwbGFjZXMgd2hlcmUgZG9f
c29maXJxKCkgaXMgY2FsbGVkLiBTbyB5b3UgCmVpdGhlciB3YW50IHRvIHRyYWNrIHRoZSB0aW1l
IGluIHRoZSBmdW5jdGlvbiBkaXJlY3RseSBvciBvbiBlYWNoIGNhbGxlcnMuCgpJIGFtIG5vdCBz
dXJlIHdoaWNoIG9uZSBpcyB0aGUgYmVzdCB3YXkuCgo+IAo+Pj4KPj4+PiBSZXNlbmRpbmcgdGhl
IHBhdGNoIHdpdGhvdXQgdGhpbmdzIGFkZHJlc3NlZCBpcyBvbmx5IGdvaW5nIHRvIG1ha2UgaXQg
d29yc3QuCj4+Pgo+Pj4gSSdtIHN0aWxsIGNvbnZpbmNlZCB0aGUgcGF0Y2ggd291bGQgaW1wcm92
ZSBpbnRlcnJ1cHQgbGF0ZW5jeSBmb3IgaGlnaCAKPj4+IGludGVycnVwdCByYXRlIHVzZSBjYXNl
cy4KPj4+IEJ1dCBJIHVuZGVyc3RhbmQgdGhhdCBJIGhhdmUgbm8gZXhwZXJpbWVudCB0byBwcm92
ZSB0aGUgZWZmZWN0LCBzbyBJJ20gbm90IAo+Pj4gd2lsbGluZyB0byBwdXNoIHRocm91Z2ggdGhl
IHBhdGNoLgo+Pgo+PiBUaGUgb25seSB0aGluZyBJIGFzayBpcyBqdXN0aWZpY2F0aW9uIGluIHlv
dXIgY29tbWl0IG1lc3NhZ2UgcmF0aGVyIHRoYW4gCj4+IHRocm93aW5nIHRoaW5ncyBhbmQgZXhw
ZWN0aW5nIHRoZSByZXZpZXdlciB0byB1bmRlcnN0YW5kIHdoeSB5b3UgZG8gdGhhdC4gSSAKPj4g
d291bGQgcmVjb21tZW5kIHRvIHJlZnJlc2ggeW91cnNlbGYgaG93IHRvIHN1Ym1pdCBhIHBhdGNo
IHNlcmllcyBbMV0uCj4gCj4gSSdsbCBmb2xsb3cgeW91IHJlY29tbWVuZGF0aW9uLgo+IAo+Pj4g
QWxzbywgSSBoYXZlIGEgcXVlc3Rpb24gdG8geW91IGFib3V0IGFub3RoZXIgYXNwZWN0IG9mIHRo
aXMgcGF0Y2guIEluIHRoZSAKPj4+IGZ1bmN0aW9uIGBlbnRlcl9oeXBlcnZpc29yX2hlYWQoKWAg
dGhlcmUgaXMgYSBjaGVjayBmb3IgYSBkaXNhYmxlZCB3b3JrYXJvdW5kIAo+Pj4gYW5kIHR1cm5p
bmcgaXQgb24uIElmIHdlIGhhdmUgdGhlIGludGVycnVwdHMgZW5hYmxlZCB1bnRpbCB0aGVyZSwg
d2UgaGF2ZSAKPj4+IGdvb2QgY2hhbmNlcyB0byBnbyB0aHJvdWdoIHRoZSBpbnRlcnJ1cHQgcHJv
Y2Vzc2luZyBgZG9fSVJRKClgIGJlZm9yZSBXQSAKPj4+IGVuYWJsZWQuIElzIGl0IHN0aWxsIE9L
Pwo+Pgo+PiBIbW1tLCB0aGF0J3MgY29ycmVjdC4KPiAKPiBTb3JyeSBJIGRpZCBub3QgZ2V0IHlv
dXIgcG9pbnQuIFdoYXQgZXhhY3RseSBpcyBjb3JyZWN0PyBNeSBvYnNlcnZhdGlvbiBvZiB0aGUg
Cj4gc2NlbmFyaW8gd2hlcmUgd2UgY2FuIGdvIHRocm91Z2ggdGhlIGJpZyBwaWVjZSBvZiB0aGUg
aHlwZXJ2aXNvciB3aXRob3V0IFdBIAo+IGVuYWJsZWQ/IE9yIHByb2Nlc3NpbmcgSVJRcyB3aXRo
b3V0IFdBIGVuYWJsZWQgaXMgdGhlIGNvcnJlY3Qgd2F5IHRvIGRvPwoKImJpZyBwaWVjZSIgaXMg
c29tZXdoYXQgaGFsZi1jb3JyZWN0Li4uLiBBbGwgdGhlIGh5cGVyY2FsbHMgd2lsbCBiZSBjb3Jy
ZWN0bHkgCnByb3RlY3RlZCwgc28gdGhlIHByb2JsZW0gaXMgb25seSBpZiB5b3UgcmVjZWl2ZSBh
biBpbnRlcnJ1cHQgYmVmb3JlIFNTQkQgaXMgCmVuYWJsZWQuCgpJIHdvdWxkIG1vdmUgdGhlIGVu
YWJsZW1lbnQgaW4gYXNzZW1ibHkgY29kZSBhcyBwYXJ0IG9mIGVudHJ5LgoKQ2hlZXJzLAoKLS0g
Ckp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
