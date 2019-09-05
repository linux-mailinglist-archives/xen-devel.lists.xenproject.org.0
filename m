Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2B6A9FC0
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 12:35:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5p47-0003bd-2z; Thu, 05 Sep 2019 10:32:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5p45-0003bW-Om
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 10:32:33 +0000
X-Inumbo-ID: 781ab19c-cfc8-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 781ab19c-cfc8-11e9-b299-bc764e2007e4;
 Thu, 05 Sep 2019 10:32:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5D571AC0C;
 Thu,  5 Sep 2019 10:32:32 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190905093416.2955-1-roger.pau@citrix.com>
 <a7464a0e-c730-d506-d8f6-76804953e2a1@suse.com>
 <20190905100111.tjayxo44f2enaz7t@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3dd459c6-1809-c25e-364b-630497c8e342@suse.com>
Date: Thu, 5 Sep 2019 12:32:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905100111.tjayxo44f2enaz7t@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/libxl: choose a sane default for HAP
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 GeorgeDunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDkuMjAxOSAxMjowMSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVGh1LCBT
ZXAgMDUsIDIwMTkgYXQgMTE6NTI6NTlBTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDA1LjA5LjIwMTkgMTE6MzQsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+IEN1cnJlbnQgbGli
eGwgY29kZSB3aWxsIGFsd2F5cyBlbmFibGUgSGFyZHdhcmUgQXNzaXN0ZWQgUGFnaW5nIChIQVAp
LAo+Pj4gZXhwZWN0aW5nIHRoYXQgdGhlIGh5cGVydmlzb3Igd2lsbCBmYWxsYmFjayB0byBzaGFk
b3cgaWYgSEFQIGlzIG5vdAo+Pj4gYXZhaWxhYmxlLiBXaXRoIHRoZSBjaGFuZ2VzIHRvIHRoZSBk
b21haW4gYnVpbGRlciB0aGF0J3Mgbm90IHRoZSBjYXNlCj4+PiBhbnkgbG9uZ2VyLCBhbmQgdGhl
IGh5cGVydmlzb3Igd2lsbCByYWlzZSBhbiBlcnJvciBpZiBIQVAgaXMgbm90Cj4+PiBhdmFpbGFi
bGUgaW5zdGVhZCBvZiBzaWxlbnRseSBmYWxsaW5nIGJhY2sgdG8gc2hhZG93Lgo+Pgo+PiBXb3Vs
ZCBpdCByZWFsbHkgYmUgbXVjaCBtb3JlIGludm9sdmVkIHRoYW4gdGhlIGNoYW5nZSBoZXJlIHRv
IHJlc3RvcmUKPj4gc2lsZW50IGRlZmF1bHRpbmcgdG8gc2hhZG93Pwo+IAo+IEJ1dCB0aGF0IHdv
dWxkIG1lYW4gdGhhdCBhIHVzZXIgaGF2aW5nIHNlbGVjdGVkIGhhcD0xIG9uIHRoZSBjb25maWcK
PiBmaWxlIHdvdWxkIGdldCBzaWxlbnRseSBkZWZhdWx0ZWQgdG8gc2hhZG93LCB3aGljaCBpcyB3
cm9uZyBJTU8uCgpTaW5jZSB5b3UgYW5kIEFuZHJldyBhZ3JlZSwgc28gYmUgaXQuIFBlcnNvbmFs
bHkgSSdkIGxpa2UgaXQgYmV0dGVyCmlmICJoYXA9MSIgZGlkbid0IHByZXZlbnQgYSBkb21haW4g
ZnJvbSBzdGFydGluZyBvbiBhIEhBUC1pbmNhcGFibGUKaG9zdC4gSSB3b3VsZG4ndCBtaW5kIGEg
d2FybmluZyB0aG91Z2guCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
