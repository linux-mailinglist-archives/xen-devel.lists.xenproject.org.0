Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 203EB14C76F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 09:25:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwibU-0001zp-N8; Wed, 29 Jan 2020 08:21:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LL5N=3S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwibT-0001zk-DL
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 08:21:39 +0000
X-Inumbo-ID: 5eabb1c8-4270-11ea-8846-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5eabb1c8-4270-11ea-8846-12813bfff9fa;
 Wed, 29 Jan 2020 08:21:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ACB79AE72;
 Wed, 29 Jan 2020 08:21:37 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <20200124153103.18321-1-pdurrant@amazon.com>
 <20200124153103.18321-6-pdurrant@amazon.com>
 <9376dca1-1bdd-ac08-d84a-e8ac101436d2@suse.com>
 <29425ac0b17d4772a162a097448cfee4@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <30f9919e-fcd8-3b7f-ff23-5fd9ce4ff78c@suse.com>
Date: Wed, 29 Jan 2020 09:21:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <29425ac0b17d4772a162a097448cfee4@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 5/7] mm: make MEMF_no_refcount pages safe
 to assign
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDEuMjAyMCAxODowMSwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gRnJvbTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBTZW50OiAyOCBKYW51YXJ5IDIwMjAgMTU6MjMK
Pj4KPj4gT24gMjQuMDEuMjAyMCAxNjozMSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+Pj4gQ3VycmVu
dGx5IGl0IGlzIHVuc2FmZSB0byBhc3NpZ24gYSBkb21oZWFwIHBhZ2UgYWxsb2NhdGVkIHdpdGgK
Pj4+IE1FTUZfbm9fcmVmY291bnQgdG8gYSBkb21haW4gYmVjYXVzZSB0aGUgZG9tYWluJ3QgJ3Rv
dF9wYWdlcycgd2lsbCBub3QKPj4+IGJlIGluY3JlbWVudGVkLCBidXQgd2lsbCBiZSBkZWNyZW1l
bnQgd2hlbiB0aGUgcGFnZSBpcyBmcmVlZCAoc2luY2UKPj4+IGZyZWVfZG9taGVhcF9wYWdlcygp
IGhhcyBubyB3YXkgb2YgdGVsbGluZyB0aGF0IHRoZSBpbmNyZW1lbnQgd2FzCj4+IHNraXBwZWQp
Lgo+Pj4KPj4+IFRoaXMgcGF0Y2ggYWxsb2NhdGVzIGEgbmV3ICdjb3VudF9pbmZvJyBiaXQgZm9y
IGEgUEdDX25vX3JlZmNvdW50IGZsYWcKPj4+IHdoaWNoIGlzIHRoZW4gdXNlZCB0byBtYXJrIGRv
bWhlYXAgcGFnZXMgYWxsb2NhdGVkIHdpdGgKPj4gTUVNRl9ub19yZWZjb3VudC4KPj4+IFRoaXMg
dGhlbiBhbGxvd3MgZnJlZV9kb21oZWFwX3BhZ2VzKCkgdG8gc2tpcCBkZWNyZW1lbnRpbmcgdG90
X3BhZ2VzCj4+IHdoZW4KPj4+IGFwcHJvcHJpYXRlIGFuZCBoZW5jZSBtYWtlcyB0aGUgcGFnZXMg
c2FmZSB0byBhc3NpZ24uCj4+Pgo+Pj4gTk9URTogVGhlIHBhdGNoIHNldHMgTUVNRl9ub19yZWZj
b3VudCBkaXJlY3RseSBpbiBhbGxvY19kb21oZWFwX3BhZ2VzKCkKPj4+ICAgICAgIHJhdGhlciB0
aGFuIGluIGFzc2lnbl9wYWdlcygpIGJlY2F1c2UgdGhlIGxhdHRlciBpcyBjYWxsZWQgd2l0aAo+
Pj4gICAgICAgTUVNRl9ub19yZWZjb3VudCBieSBtZW1vcnlfZXhjaGFuZ2UoKSBhcyBhbiBvcHRp
bWl6YXRpb24sIHRvIGF2b2lkCj4+PiAgICAgICB0b28gbWFueSBjYWxscyB0byBkb21haW5fYWRq
dXN0X3RvdF9wYWdlcygpICh3aGljaCBhY3F1aXJlcyBhbmQKPj4+ICAgICAgIHJlbGVhc2VzIHRo
ZSBnbG9iYWwgJ2hlYXBfbG9jaycpLgo+Pgo+PiBJIGRvbid0IHRoaW5rIHRoZXJlIHdlcmUgYW55
IG9wdGltaXphdGlvbiB0aG91Z2h0cyB3aXRoIHRoaXMuIFRoZQo+PiBNRU1GX25vX3JlZmNvdW50
IHVzZSBpcyBiZWNhdXNlIG90aGVyd2lzZSBmb3IgYSBkb21haW4gd2l0aAo+PiB0b3RfcGFnZXMg
PT0gbWF4X3BhZ2VzIHRoZSBhc3NpZ25tZW50IHdvdWxkIGZhaWwuCj4+Cj4gCj4gVGhhdCB3b3Vs
ZCBub3QgYmUgdGhlIGNhc2UgaWYgdGhlIGNhbGxzIHRvIHN0ZWFsX3BhZ2UoKSBmdXJ0aGVyIHVw
IGRpZG4ndAo+IHBhc3MgTUVNRl9ub19yZWZjb3VudCAod2hpY2ggd291bGQgYmUgdGhlIGNvcnJl
Y3QgdGhpbmcgdG8gZG8gaWYgbm90Cj4gcGFzc2luZyBpdCB0byBhc3NpZ25fcGFnZXMoKS4KCk5v
LCB0aGF0J3Mgbm90IGFuIG9wdGlvbiBlaXRoZXI6IHN0ZWFsX3BhZ2UoKSB3b3VsZCBvdGhlcndp
c2UgZGVjcmVtZW50Ci0+dG90X3BhZ2VzLCBhbGxvd2luZyB0aGUgZG9tYWluIHRvIGFsbG9jYXRl
IG5ldyBtZW1vcnkgb24gYW5vdGhlciB2Q1BVLgpUaGlzIHdvdWxkIGFnYWluIHJlc3VsdCBpbiB0
aGUgZXhjaGFuZ2UgZmFpbGluZyBmb3Igbm8gcmVhc29uLiAoQW5kIG5vLApJIGRvbid0IHRoaW5r
IGEgZ3Vlc3Qgc2hvdWxkIGJlIHJlcXVpcmVkIHRvIHNlcmlhbGl6ZSBlLmcuIGJhbGxvb25pbmcK
b3BlcmF0aW9ucyB3aXRoIGV4Y2hhbmdlcy4pCgo+Pj4gLS0tIGEveGVuL2NvbW1vbi9wYWdlX2Fs
bG9jLmMKPj4+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4+PiBAQCAtNDYwLDYgKzQ2
MCw5IEBAIHVuc2lnbmVkIGxvbmcgZG9tYWluX2FkanVzdF90b3RfcGFnZXMoc3RydWN0IGRvbWFp
bgo+PiAqZCwgbG9uZyBwYWdlcykKPj4+ICB7Cj4+PiAgICAgIGxvbmcgZG9tX2JlZm9yZSwgZG9t
X2FmdGVyLCBkb21fY2xhaW1lZCwgc3lzX2JlZm9yZSwgc3lzX2FmdGVyOwo+Pj4KPj4+ICsgICAg
aWYgKCAhcGFnZXMgKQo+Pj4gKyAgICAgICAgZ290byBvdXQ7Cj4+Cj4+IFVucmVsYXRlZCBjaGFu
Z2U/IEFyZSB0aGVyZSwgaW4gZmFjdCwgYW55IGNhbGxlcnMgcGFzc2luZyBpbiAwPwo+PiBPaCwg
ZnVydGhlciBkb3duIHlvdSBhZGQgb25lIHdoaWNoIG1heSBkbyBzbywgYnV0IHRoZW4gcGVyaGFw
cwo+PiBiZXR0ZXIgdG8gbWFrZSB0aGUgY2FsbGVyIG5vdCBjYWxsIGhlcmUgKGFzIGlzIGRvbmUg
ZS5nLiBpbgo+PiBtZW1vcnlfZXhjaGFuZ2UoKSk/Cj4gCj4gSSB0aGluayBpdCdzIHByZWZlcmFi
bGUgZm9yIGRvbWFpbl9hZGp1c3RfdG90X3BhZ2VzKCkgdG8gaGFuZGxlIHplcm8KPiBncmFjZWZ1
bGx5LgoKVGhhdCdzIGFuIG9wdGlvbiwgYnV0IGltbyB3b3VsZCB0aGVuIGJldHRlciBiZSBhIHNl
cGFyYXRlIGNoYW5nZSAodG8KYWxzbyBkcm9wIHByZXNlbnQgZ3VhcmRzIG9mIGNhbGxzIHRvIHRo
ZSBmdW5jdGlvbikuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
