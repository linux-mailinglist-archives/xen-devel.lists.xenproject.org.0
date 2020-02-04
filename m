Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6C7151B93
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 14:43:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyyRs-0007cl-DT; Tue, 04 Feb 2020 13:41:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fS9R=3Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iyyRq-0007cg-Db
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 13:41:02 +0000
X-Inumbo-ID: fb651e5e-4753-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb651e5e-4753-11ea-b211-bc764e2007e4;
 Tue, 04 Feb 2020 13:41:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CCF12ADB5;
 Tue,  4 Feb 2020 13:41:00 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200204133357.32101-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c24750e9-427b-1208-d220-f5c06e543966@suse.com>
Date: Tue, 4 Feb 2020 14:40:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200204133357.32101-1-julien@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/mm: Avoid assuming PG_state_inuse == 0
 in assign_pages()
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDIuMjAyMCAxNDozMywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IGFzc2lnbl9wYWdlcygpIHJlbGllcyBvbiBQR19zdGF0ZV9pbnVzZSB0byBiZSAwLiBUaGlzCj4g
bWFrZXMgdGhlIGNvZGUgc2xpZ2h0bHkgbW9yZSBkaWZmaWN1bHQgdG8gdW5kZXJzdGFuZC4KCkkg
Y2FuIGNlcnRhaW5seSBzZWUgd2hlcmUgeW91J3JlIGNvbWluZyBmcm9tLCBidXQgLi4uCgo+IC0t
LSBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4gKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9j
LmMKPiBAQCAtMjI4NiwxMCArMjI4NiwxMSBAQCBpbnQgYXNzaWduX3BhZ2VzKAo+ICAgICAgZm9y
ICggaSA9IDA7IGkgPCAoMSA8PCBvcmRlcik7IGkrKyApCj4gICAgICB7Cj4gICAgICAgICAgQVNT
RVJUKHBhZ2VfZ2V0X293bmVyKCZwZ1tpXSkgPT0gTlVMTCk7Cj4gLSAgICAgICAgQVNTRVJUKCFw
Z1tpXS5jb3VudF9pbmZvKTsKPiArICAgICAgICBBU1NFUlQocGFnZV9zdGF0ZV9pcygmcGdbaV0s
IGludXNlKSk7Cj4gKyAgICAgICAgQVNTRVJUKCEocGdbaV0uY291bnRfaW5mbyAmICh+UEdDX3N0
YXRlKSkpOwoKLi4uIEkgdGhpbmsgdGhpcyBvbmUgaXMgYmV0dGVyIGluIGl0cyBvcmlnaW5hbCBm
b3JtLiBBbiBvcHRpb24KbWlnaHQgYmUgdG8gcHV0IGEgQlVJTERfQlVHX09OKCkgbmV4dCB0byBp
dC4gKEluIG5vIGNhc2UsIGltbywKdGhlcmUgc2hvdWxkIGJlIHBhcmVudGhlc2VzIGFyb3VuZCBh
IG5lZ2F0aW9uIGV4cHJlc3Npb24uKQoKPiAgICAgICAgICBwYWdlX3NldF9vd25lcigmcGdbaV0s
IGQpOwo+ICAgICAgICAgIHNtcF93bWIoKTsgLyogRG9tYWluIHBvaW50ZXIgbXVzdCBiZSB2aXNp
YmxlIGJlZm9yZSB1cGRhdGluZyByZWZjbnQuICovCj4gLSAgICAgICAgcGdbaV0uY291bnRfaW5m
byA9IFBHQ19hbGxvY2F0ZWQgfCAxOwo+ICsgICAgICAgIHBnW2ldLmNvdW50X2luZm8gPSBQR0Nf
c3RhdGVfaW51c2UgfCBQR0NfYWxsb2NhdGVkIHwgMTsKCkFzIG9wcG9zZWQgdG8gdGhlIGFib3Zl
LCBJIGNlcnRhaW5seSBhcHByZWNpYXRlIHRoZSBjaGFuZ2UgaGVyZS4KCkphbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
