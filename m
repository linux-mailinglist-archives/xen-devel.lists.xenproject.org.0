Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAF536EF4
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 10:43:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYnwm-0003ZE-HO; Thu, 06 Jun 2019 08:40:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2G1I=UF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYnwk-0003Z8-G2
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 08:40:30 +0000
X-Inumbo-ID: bcdb0075-8836-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id bcdb0075-8836-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 08:40:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6C61341;
 Thu,  6 Jun 2019 01:40:28 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06B0E3F690;
 Thu,  6 Jun 2019 01:40:26 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5CF664580200007800235089@prv1-mh.provo.novell.com>
 <5CF667780200007800235142@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <abd426c8-7381-39cd-594b-66ece32e8ca7@arm.com>
Date: Thu, 6 Jun 2019 09:40:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF667780200007800235142@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 3/4] adjust special domain creation (and
 call it earlier on x86)
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMDQvMDYvMjAxOSAxMzo0MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gU3BsaXQg
b3V0IHRoaXMgbW9zdGx5IGFyY2gtaW5kZXBlbmRlbnQgY29kZSBpbnRvIGEgY29tbW9uLWNvZGUg
aGVscGVyCj4gZnVuY3Rpb24uIChUaGlzIGRvZXMgYXdheSB3aXRoIEFybSdzIGFyY2hfaW5pdF9t
ZW1vcnkoKSBhbHRvZ2V0aGVyLikKPiAKPiBPbiB4ODYgdGhpcyBuZWVkcyB0byBoYXBwZW4gYmVm
b3JlIGFjcGlfYm9vdF9pbml0KCk6IENvbW1pdCA5ZmE5NGUxMDU4Cj4gKCJ4ODYvQUNQSTogYWxz
byBwYXJzZSBBTUQgSU9NTVUgdGFibGVzIGVhcmx5Iikgb25seSBhcHBlYXJlZCB0byB3b3JrCj4g
ZmluZSAtIGl0J3MgcmVhbGx5IGJyb2tlbiwgYW5kIGRvZXNuJ3QgY3Jhc2ggKG9uIG5vbi1FRkkg
QU1EIHN5c3RlbXMpCj4gb25seSBiZWNhdXNlIG9mIHRoZXJlIGJlaW5nIGEgbWFwcGluZyBvZiBs
aW5lYXIgYWRkcmVzcyAwIGR1cmluZyBlYXJseQo+IGJvb3QuIE9uIEVGSSB0aGVyZSBpczoKPiAK
PiAgIEVhcmx5IGZhdGFsIHBhZ2UgZmF1bHQgYXQgZTAwODpmZmZmODJkMDgwMjRkNThlIChjcjI9
MDAwMDAwMDAwMDAwMDIyMCwgZWM9MDAwMCkKPiAgIC0tLS1bIFhlbi00LjEzLXVuc3RhYmxlICB4
ODZfNjQgIGRlYnVnPXkgICBOb3QgdGFpbnRlZCBdLS0tLQo+ICAgQ1BVOiAgICAwCj4gICBSSVA6
ICAgIGUwMDg6WzxmZmZmODJkMDgwMjRkNThlPl0gcGNpLmMjX3BjaV9oaWRlX2RldmljZSsweDE3
LzB4M2EKPiAgIFJGTEFHUzogMDAwMDAwMDAwMDAxMDA0NiAgIENPTlRFWFQ6IGh5cGVydmlzb3IK
PiAgIHJheDogMDAwMDAwMDAwMDAwMDAwMCAgIHJieDogMDAwMDAwMDAwMDAwNjAwMCAgIHJjeDog
MDAwMDAwMDAwMDAwMDAwMAo+ICAgcmR4OiBmZmZmODMxMDRmMmVlOWIwICAgcnNpOiBmZmZmODJl
MDIwOWU1ZDQ4ICAgcmRpOiBmZmZmODMxMDRmMmVlOWEwCj4gICByYnA6IGZmZmY4MmQwODA4MWZj
ZTAgICByc3A6IGZmZmY4MmQwODA4MWZjYjggICByODogIDAwMDAwMDAwMDAwMDAwMDAKPiAgIHI5
OiAgODAwMDAwMDAwMDAwMDAwMCAgIHIxMDogMDE4MDAwMDAwMDAwMDAwMCAgIHIxMTogN2ZmZmZm
ZmZmZmZmZmZmZgo+ICAgcjEyOiBmZmZmODMxMDRmMmVlOWEwICAgcjEzOiAwMDAwMDAwMDAwMDAw
MDAyICAgcjE0OiBmZmZmODMxMDRmMmVlNGIwCj4gICByMTU6IDAwMDAwMDAwMDAwMDAwNjQgICBj
cjA6IDAwMDAwMDAwODAwNTAwMzMgICBjcjQ6IDAwMDAwMDAwMDAwMDAwYTAKPiAgIGNyMzogMDAw
MDAwMDA5ZjYxNDAwMCAgIGNyMjogMDAwMDAwMDAwMDAwMDIyMAo+ICAgZnNiOiAwMDAwMDAwMDAw
MDAwMDAwICAgZ3NiOiAwMDAwMDAwMDAwMDAwMDAwICAgZ3NzOiAwMDAwMDAwMDAwMDAwMDAwCj4g
ICBkczogMDAwMCAgIGVzOiAwMDAwICAgZnM6IDAwMDAgICBnczogMDAwMCAgIHNzOiAwMDAwICAg
Y3M6IGUwMDgKPiAgIFhlbiBjb2RlIGFyb3VuZCA8ZmZmZjgyZDA4MDI0ZDU4ZT4gKHBjaS5jI19w
Y2lfaGlkZV9kZXZpY2UrMHgxNy8weDNhKToKPiAgICA0OCA4OSA0NyAzOCA0OCA4ZCA1NyAxMCA8
NDg+IDhiIDg4IDIwIDAyIDAwIDAwIDQ4IDg5IDUxIDA4IDQ4IDg5IDRmIDEwIDQ4Cj4gICBYZW4g
c3RhY2sgdHJhY2UgZnJvbSByc3A9ZmZmZjgyZDA4MDgxZmNiODoKPiBbLi4uXQo+ICAgWGVuIGNh
bGwgdHJhY2U6Cj4gICAgICBbPGZmZmY4MmQwODAyNGQ1OGU+XSBwY2kuYyNfcGNpX2hpZGVfZGV2
aWNlKzB4MTcvMHgzYQo+IFsgICBbPCAgICAgICAgICAgICAgICA+XSBwY2lfcm9fZGV2aWNlKy4u
Ll0KPiAgICAgIFs8ZmZmZjgyZDA4MDYxN2ZlMT5dIGFtZF9pb21tdV9kZXRlY3Rfb25lX2FjcGkr
MHgxNjEvMHgyNDkKPiAgICAgIFs8ZmZmZjgyZDA4MDYxODZhYz5dIGlvbW11X2FjcGkuYyNkZXRl
Y3RfaW9tbXVfYWNwaSsweGI1LzB4ZTcKPiAgICAgIFs8ZmZmZjgyZDA4MDYxY2RlMD5dIGFjcGlf
dGFibGVfcGFyc2UrMHg2MS8weDkwCj4gICAgICBbPGZmZmY4MmQwODA2MTllN2Q+XSBhbWRfaW9t
bXVfZGV0ZWN0X2FjcGkrMHgxNy8weDE5Cj4gICAgICBbPGZmZmY4MmQwODA2MTc5MGI+XSBhY3Bp
X2l2cnNfaW5pdCsweDIwLzB4NWIKPiAgICAgIFs8ZmZmZjgyZDA4MDYyZTgzOD5dIGFjcGlfYm9v
dF9pbml0KzB4MzAxLzB4MzBmCj4gICAgICBbPGZmZmY4MmQwODA2MjhiMTA+XSBfX3N0YXJ0X3hl
bisweDFkYWYvMHgyOGEyCj4gICAKPiAgIFBhZ2V0YWJsZSB3YWxrIGZyb20gMDAwMDAwMDAwMDAw
MDIyMDoKPiAgICBMNFsweDAwMF0gPSAwMDAwMDAwMDlmNDRmMDYzIGZmZmZmZmZmZmZmZmZmZmYK
PiAgICBMM1sweDAwMF0gPSAwMDAwMDAwMDlmNDRiMDYzIGZmZmZmZmZmZmZmZmZmZmYKPiAgICBM
MlsweDAwMF0gPSAwMDAwMDAwMDAwMDAwMDAwIGZmZmZmZmZmZmZmZmZmZmYKPiAgIAo+ICAgKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+ICAgUGFuaWMgb24gQ1BVIDA6
Cj4gICBGQVRBTCBUUkFQOiB2ZWN0b3IgPSAxNCAocGFnZSBmYXVsdCkKPiAgIFtlcnJvcl9jb2Rl
PTAwMDBdICwgSU4gSU5URVJSVVBUIENPTlRFWFQKPiAgICoqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioKPiAKPiBPZiBjb3Vyc2UgdGhlIGJ1ZyB3b3VsZCBuZXZlcnRoZWxl
c3MgaGF2ZSBsZWFkIHRvIHBvc3QtYm9vdCBjcmFzaGVzIGFzCj4gc29vbiBhcyB0aGUgbGlzdCB3
b3VsZCBhY3R1YWxseSBnZXQgdHJhdmVyc2VkLgo+IAo+IFRha2UgdGhlIG9wcG9ydHVuaXR5IGFu
ZAo+IC0gY29udmVydCBCVUdfT04oKXMgYmVpbmcgbW92ZWQgdG8gcGFuaWMoKSwKPiAtIGFkZCBf
X3JlYWRfbW9zdGx5IGFubm90YXRpb25zIHRvIHRoZSBkb21fKiBkZWZpbml0aW9ucy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpGb3IgQXJtOgoK
QWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMsCgot
LSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
