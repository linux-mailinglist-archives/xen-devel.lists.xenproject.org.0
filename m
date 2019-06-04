Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D7C34CFE
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 18:13:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYC1o-00086T-TL; Tue, 04 Jun 2019 16:11:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0KbE=UD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYC1n-00086K-AL
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 16:11:11 +0000
X-Inumbo-ID: 5d94743e-86e3-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 5d94743e-86e3-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 16:11:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B396A78;
 Tue,  4 Jun 2019 09:11:09 -0700 (PDT)
Received: from [10.37.8.2] (unknown [10.37.8.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7046E3F5AF;
 Tue,  4 Jun 2019 09:11:08 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5CF0F8530200007800233DE0@prv1-mh.provo.novell.com>
 <5CF0F9A30200007800233E07@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <706bde95-dbde-7291-83ab-efba17d6b291@arm.com>
Date: Tue, 4 Jun 2019 17:11:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF0F9A30200007800233E07@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC 3/4] Arm64: further speed-up to
 hweight{32, 64}()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gNS8zMS8xOSAxMDo1MyBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQWNjb3Jk
aW5nIHRvIExpbnV4IGNvbW1pdCBlNzViZWYyYTRmICgiYXJtNjQ6IFNlbGVjdAo+IEFSQ0hfSEFT
X0ZBU1RfTVVMVElQTElFUiIpIHRoaXMgaXMgYSBmdXJ0aGVyIGltcHJvdmVtZW50IG92ZXIgdGhl
Cj4gdmFyaWFudCB1c2luZyBvbmx5IGJpdHdpc2Ugb3BlcmF0aW9ucyBvbiBhdCBsZWFzdCBzb21l
IGhhcmR3YXJlLCBhbmQgbm8KPiB3b3JzZSBvbiBvdGhlci4KPiAKPiBTdWdnZXN0ZWQtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IC0tLQo+IFJGQzogVG8gYmUgaG9uZXN0
IEknbSBub3QgZnVsbHkgY29udmluY2VkIHRoaXMgaXMgYSB3aW4gaW4gcGFydGljdWxhciBpbgo+
ICAgICAgIHRoZSBod2VpZ2h0MzIoKSBjYXNlLCBhcyB0aGVyZSdzIG5vIGFjdHVhbCBzaGlmdCBp
bnNuIHdoaWNoIGdldHMKPiAgICAgICByZXBsYWNlZCBieSB0aGUgbXVsdGlwbGljYXRpb24uIEV2
ZW4gZm9yIGh3ZWlnaHQ2NCgpIHRoZSBjb21waWxlcgo+ICAgICAgIGNvdWxkIGVtaXQgYmV0dGVy
IGNvZGUgYW5kIGF2b2lkIHRoZSBleHBsaWNpdCBzaGlmdCBieSAzMiAod2hpY2ggaXQKPiAgICAg
ICBlbWl0cyBhdCBsZWFzdCBmb3IgbWUpLgoKSSBjYW4gc2VlIG11bHRpcGxpY2F0aW9uIGluc3Ry
dWN0aW9uIHVzZWQgaW4gYm90aCBod2VpZ2h0MzIoKSBhbmQgCmh3ZWlnaHQ2NCgpIHdpdGggdGhl
IGNvbXBpbGVyIEkgYW0gdXNpbmcuCgpJIHdvdWxkIGV4cGVjdCB0aGUgY29tcGlsZXIgY291bGQg
ZWFzaWx5IHJlcGxhY2UgYSBtdWx0aXBseSBieSBhIHNlcmllcyAKb2Ygc2hpZnQgYnV0IGl0IHdv
dWxkIGJlIG1vcmUgZGlmZmljdWx0IHRvIGRvIHRoZSBpbnZlcnQuCgpBbHNvLCB0aGlzIGhhcyBi
ZWVuIGluIExpbnV4IGZvciBhIHllYXIgbm93LCBzbyBJIGFtIGFzc3VtaW5nIExpbnV4IApmb2xr
cyBhcmUgaGFwcHkgd2l0aCBjaGFuZ2VzIChDQ2luZyBSb2JpbiBqdXN0IGluIGNhc2UgSSBtaXNz
ZWQgCmFueXRoaW5nKS4gVGhlcmVmb3JlIEkgYW0gaGFwcHkgdG8gZ2l2ZSBpdCBhIGdvIG9uIFhl
biBhcyB3ZWxsLgoKQ2hlZXJzLAoKPiAKPiAtLS0gYS94ZW4vYXJjaC9hcm0vS2NvbmZpZwo+ICsr
KyBiL3hlbi9hcmNoL2FybS9LY29uZmlnCj4gQEAgLTEyLDYgKzEyLDcgQEAgY29uZmlnIEFSTV8z
Mgo+ICAgY29uZmlnIEFSTV82NAo+ICAgCWRlZl9ib29sIHkKPiAgIAlkZXBlbmRzIG9uIDY0QklU
Cj4gKwlzZWxlY3QgSEFTX0ZBU1RfTVVMVElQTFkKPiAgIAo+ICAgY29uZmlnIEFSTQo+ICAgCWRl
Zl9ib29sIHkKPiAKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
