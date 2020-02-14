Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA48815E599
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2020 17:43:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2e0a-0005Vh-PT; Fri, 14 Feb 2020 16:40:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ut5K=4C=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j2e0Z-0005JH-49
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 16:40:03 +0000
X-Inumbo-ID: a47d3142-4f48-11ea-babf-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a47d3142-4f48-11ea-babf-12813bfff9fa;
 Fri, 14 Feb 2020 16:40:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5A277B00A;
 Fri, 14 Feb 2020 16:39:59 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org
References: <20200211093527.6811-1-jgross@suse.com>
 <40df666d-246a-656a-94e5-00a85b9280fc@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f7397b04-80f2-1e2a-0899-427570f8f878@suse.com>
Date: Fri, 14 Feb 2020 17:39:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <40df666d-246a-656a-94e5-00a85b9280fc@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: make sure stop_machine_run() is always
 called in a tasklet
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDIuMjAgMTU6MDYsIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+IE9uIDExLzAyLzIwMjAg
MDk6MzUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFdpdGggY29yZSBzY2hlZHVsaW5nIGFjdGl2
ZSBpdCBpcyBtYW5kYXRvcnkgZm9yIHN0b3BfbWFjaGluZV9ydW4oKSB0bwo+PiBiZSBjYWxsZWQg
aW4gYSB0YXNrbGV0IG9ubHksIGFzIG90aGVyd2lzZSBhIHNjaGVkdWxpbmcgZGVhZGxvY2sgd291
bGQKPj4gb2NjdXI6IHN0b3BfbWFjaGluZV9ydW4oKSBkb2VzIGEgY3B1IHJlbmRlenZvdXMgYnkg
YWN0aXZhdGluZyBhIHRhc2tsZXQKPj4gb24gYWxsIG90aGVyIGNwdXMuIEluIGNhc2Ugc3RvcF9t
YWNoaW5lX3J1bigpIHdhcyBub3QgY2FsbGVkIGluIGFuIGlkbGUKPj4gdmNwdSBpdCB3b3VsZCBi
bG9jayBzY2hlZHVsaW5nIHRoZSBpZGxlIHZjcHUgb24gaXRzIHNpYmxpbmdzIHdpdGggY29yZQo+
PiBzY2hlZHVsaW5nIGJlaW5nIGFjdGl2ZSwgcmVzdWx0aW5nIGluIGEgaGFuZy4KPiAKPiBJIHN1
cHBvc2UgcmN1X2JhcnJpZXIoKSBpcyBmaW5lIGR1ZSB0byBwcm9jZXNzX3BlbmRpbmdfc29mdGly
cXMoKSBiZWluZwo+IGNhbGxlZCBpbnNpZGU/IEknbSBhIGxpdHRsZSBjb25jZXJuZWQgYnkgaW1w
b3NpbmcgaXNfdmNwdV9pZGxlKCkgcmVzdHJpY3Rpb24KPiBpbiB0aGF0IGNhc2UgYXMgcmN1X2Jh
cnJpZXIoKSBjb3VsZCBiZSB0ZWNobmljYWxseSBjYWxsZWQgZnJvbSBhIG5vbi10YXNrbGV0Cj4g
Y29udGV4dC4KCk5vLCBzdG9wX21hY2hpbmVfcnVuKCkgd2l0aCBjb3JlIHNjaGVkdWxpbmcgYWN0
aXZlIGNhbiBvbmx5IHdvcmsgd2hlbgpjYWxsZWQgaW4gYW4gaWRsZSB2Y3B1LgoKT1RPSCBpdCB3
b3VsZCBiZSBmYWlybHkgZWFzeSB0byBhZGQgYW5vdGhlciBzb2Z0aXJxIGZvciBhIHNpbWlsYXIK
cHVycG9zZSBhbmQgaGF2ZSBhIHN5bmNfbWFjaGluZV9ydW4oKSB1c2luZyB0aGF0IGluc3RlYWQg
b2YgdGFza2xldHMuClRoaXMgY291bGQgYmUgdXNlZCBmb3IgdWNvZGUgbG9hZGluZywgdG9vLgoK
c3RvcF9tYWNoaW5lX3J1bigpIGFuZCBzeW5jX21hY2hpbmVfcnVuKCkgY291bGQgdXNlIGEgY29t
bW9uIG1haW4KZnVuY3Rpb24uIFRoZSBwYXRjaCBzaG91bGQgYmUgcmF0aGVyIHNpbXBsZS4KClRo
b3VnaHRzPwoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
