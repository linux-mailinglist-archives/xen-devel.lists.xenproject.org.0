Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A815DA556F
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 14:01:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4kyF-0005fO-Nm; Mon, 02 Sep 2019 11:58:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i4kyD-0005fJ-Tm
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 11:58:05 +0000
X-Inumbo-ID: eb7946dc-cd78-11e9-b95f-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb7946dc-cd78-11e9-b95f-bc764e2007e4;
 Mon, 02 Sep 2019 11:58:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9935FAE14;
 Mon,  2 Sep 2019 11:58:03 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>
References: <20190902113034.97934-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e4afc421-17ef-32a7-21f4-3ecb65ebb44a@suse.com>
Date: Mon, 2 Sep 2019 13:58:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902113034.97934-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] vpci: don't allow access to devices not
 assigned to the domain
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
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDkuMjAxOSAxMzozMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IERvbid0IGFsbG93
IHRoZSBoYXJkd2FyZSBkb21haW4gdG8gYWNjZXNzIHRoZSBQQ0kgY29uZmlnIHNwYWNlIG9mCj4g
ZGV2aWNlcyBub3QgYXNzaWduZWQgdG8gaXQuIEllOiB0aGUgY29uZmlnIHNwYWNlIG9mIGlvbW11
IGRldmljZXMKPiBpbiB1c2UgYnkgWGVuIHNob3VsZCBub3QgYmUgYWNjZXNzaWJsZSB0byB0aGUg
aGFyZHdhcmUgZG9tYWluLgoKV2VsbCwgSSBhZ3JlZSB3aXRoIHdoYXQgeW91IHNheSBhYm92ZSwg
YnV0IHRoZSBjb2RlIGNoYW5nZSBkaXNhbGxvd3MKbXVjaCBtb3JlIHRoYW4gdGhpcy4gSW4gcGFy
dGljdWxhciBEb20wIChhbmQgbWF5YmUgc3R1YiBkb21haW5zIHRvbykKbmVlZCB0byBiZSBhYmxl
IHRvIGFjY2VzcyB0aGUgY29uZmlnIHNwYWNlIG9mIGRldmljZXMgYXNzaWduZWQgdG8KZ3Vlc3Rz
LCBlLmcuIGZvciBxZW11IHRvIGNvbnRyb2wgTVNJIGFuZC9vciBNU0ktWC4KCj4gLS0tIGEveGVu
L2RyaXZlcnMvdnBjaS92cGNpLmMKPiArKysgYi94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYwo+IEBA
IC0zMTksNyArMzE5LDIxIEBAIHVpbnQzMl90IHZwY2lfcmVhZChwY2lfc2JkZl90IHNiZGYsIHVu
c2lnbmVkIGludCByZWcsIHVuc2lnbmVkIGludCBzaXplKQo+ICAgICAgLyogRmluZCB0aGUgUENJ
IGRldiBtYXRjaGluZyB0aGUgYWRkcmVzcy4gKi8KPiAgICAgIHBkZXYgPSBwY2lfZ2V0X3BkZXZf
YnlfZG9tYWluKGQsIHNiZGYuc2VnLCBzYmRmLmJ1cywgc2JkZi5kZXZmbik7Cj4gICAgICBpZiAo
ICFwZGV2ICkKPiArICAgIHsKPiArICAgICAgICBwY2lkZXZzX2xvY2soKTsKPiArICAgICAgICBw
ZGV2ID0gcGNpX2dldF9wZGV2KHNiZGYuc2VnLCBzYmRmLmJ1cywgc2JkZi5kZXZmbik7Cj4gKyAg
ICAgICAgcGNpZGV2c191bmxvY2soKTsKClRoZSBsb2NraW5nIGhlcmUgcG9pbnRzIG91dCBhIHBy
ZS1leGlzdGluZyBpc3N1ZTogV2hpbGUKcGNpX2dldF9wZGV2X2J5X2RvbWFpbigpIGRvZXNuJ3Qg
Y2hlY2sgdGhhdCB0aGUgcGNpZGV2cyBsb2NrIGlzCmJlaW5nIGhlbGQsIGl0IHJlYWxseSBzaG91
bGQuIEl0IG5vdCBkb2luZyBzbyBpcyAoSSBndWVzcykgYmVjYXVzZQpWVC1kIGNvZGUgdG9vIGxv
b2tzIHRvIGJlIHZpb2xhdGluZyB0aGlzLiBLZXZpbiAtIHRob3VnaHRzPwoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
