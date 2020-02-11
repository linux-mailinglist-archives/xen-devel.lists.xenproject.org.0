Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E4B15905C
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 14:51:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1VuY-0006FA-Ks; Tue, 11 Feb 2020 13:49:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0zdE=37=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j1VuX-0006F5-9F
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 13:49:09 +0000
X-Inumbo-ID: 464b6956-4cd5-11ea-8bf0-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 464b6956-4cd5-11ea-8bf0-bc764e2007e4;
 Tue, 11 Feb 2020 13:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581428948;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=DbEL/WQsiTQLXuRUwHjKK7T5tgGvJqPIAvoudVSsDuo=;
 b=gUP4cQwYbzWa6x/ipmyIAQ/GLt03NHyz0oezwwtm0hQcDtDmakQReMU6
 u8vVIxiUzoxx6jzWa/qNem5hnkLYKymK8pQLQ9OXC7Uf4k/QuGsDcbmI/
 ZjO6ZTBJlFVCEj9F9QGwai+Bdro5BZPu+6WO/WZrHMVd/N2i8L8KabAxo o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aMqQDhTPMlbS5fmD7kw63qc8ExfEFnZCdTLtyvy+Jpu2cyKpEeWwypZMzGI1ya5Zb6PIpgPECA
 HUolxn48VijQlWEgyMgdgOZ+kz7+HlbLc3d2hnxd1au7lBVnf8U/uejs5tzhebdPRBMHZhUTib
 22QPoCUPtv1TPtEoguxruHGfRI1STbYpBvTQwueBxZMZg2LmKEsc/Yx6jyEYAvnV0c1CTbqBal
 3JsyjJhLIo1JrnhQVfGixzhDmAFligQ543v1RQKViC8xH5Cc9peSxOf8T5OU+7e+cr45LA+CzJ
 8PI=
X-SBRS: 2.7
X-MesageID: 12443921
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12443921"
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>
References: <2b7826d9-8822-97c8-0637-03bcb98d6418@citrix.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <19d2231c-10fd-c9bc-61d5-572b95154594@citrix.com>
Date: Tue, 11 Feb 2020 13:49:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2b7826d9-8822-97c8-0637-03bcb98d6418@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] PV Shim ballooning
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMDIvMjAyMCAxMzozOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBCYWxsb29uaW5nIGlu
c2lkZSBQViBzaGltIGlzIGN1cnJlbnRseSB2ZXJ5IGJyb2tlbi4KPiAKPiBGcm9tIGFuIGluc3Ry
dW1lbnRlZCBYZW4gYW5kIDMyYml0IFBWIFhURiB0ZXN0Ogo+IAo+IChkMykgKGQzKSAtLS0gWGVu
IFRlc3QgRnJhbWV3b3JrIC0tLQo+IChkMykgKGQzKSBCYWxsb29uaW5nOiBQViAzMmJpdCAoUEFF
IDMgbGV2ZWxzKQo+IChkMykgKGQzKSBtciB7IDAwMTBhOTQwLCAxMDI0LCAweDdmZjAgfQo+IChk
MykgKGQzKSBBYm91dCB0byBkZWNyZWFzZQo+IChkMykgKFhFTikgKioqIEQgeyBmZmZmODIwMDgw
MDAwMDIwLCBuciAxMDIwLCBkb25lIDAgfQo+IChkMykgKFhFTikgZDN2MCBmYWlsZWQgdG8gcmVz
ZXJ2ZSAyNjcgZXh0ZW50cyBvZiBvcmRlciAwIGZvciBvZmZsaW5pbmcKPiAoZDMpIChYRU4pICoq
KiBEIHsgZmZmZjgyMDA3ZmZmZTA0MCwgbnIgMTAyNCwgZG9uZSAxMDIwIH0KPiAoZDMpIChYRU4p
IGQzdjAgZmFpbGVkIHRvIHJlc2VydmUgMTAyNCBleHRlbnRzIG9mIG9yZGVyIDAgZm9yIG9mZmxp
bmluZwo+IChkMykgKGQzKSA9PiBnb3QgMTAyNAo+IAo+IFRoaXMgdGVzdCB0YWtlcyAxMDI0IGZy
YW1lcyBhbmQgY2FsbHMgZGVjcmVhc2UgcmVzZXJ2YXRpb24gb24gdGhlbSwKPiBiZWZvcmUgdW5t
YXBwaW5nLsKgIGkuZS4gdGhlIGRlY3JlYXNlIHJlc2VydmF0aW9uIHNob3VsZCBmYWlsLsKgIFNo
aW0KPiBzdWNjZXNzZnVsbHkgb2ZmbGluZXMgNzUzIHBhZ2VzIChub3RoaW5nIHRvIGRvIHdpdGgg
dGhlIGZyYW1lcyB0aGUgZ3Vlc3QKPiBzZWxlY3RlZCksIGFuZCBmYWlscyB0byBvZmZsaW5lIDEy
OTEsIGFuZCBkZXNwaXRlIHRoaXMsIHJldHVybnMgc3VjY2Vzcy4KPiAKPiBGaXJzdCBvZiBhbGws
IHRoZSAiZmFpbGVkIHRvIHJlc2VydmUiIGlzIGluIHB2X3NoaW1fb2ZmbGluZV9tZW1vcnkoKQo+
IHdoaWNoIGlzIGEgdm9pZCBmdW5jdGlvbiB0aGF0IGhhcyBhIHNlbWFudGljYWxseSByZWxldmFu
dCBmYWlsdXJlIGNhc2UuwqAKPiBUaGlzIG9idmlvdXNseSBpc24ndCBvay4KPiAKPiBTZWNvbmQs
IHRoZSB3YXkgdGhlIGNvbXBhdCBjb2RlIGxvb3BzIG92ZXIgdGhlIHRyYW5zbGF0ZWQgZGF0YSBp
cwo+IGluY29tcGF0aWJsZSB3aXRoIGhvdyBhcmdzLm5yX2RvbmUgaXMgdXNlZCBmb3IgdGhlIGNh
bGwgaW50bwo+IHB2X3NoaW1fb2ZmbGluZV9tZW1vcnkoKS4KPiAKPiBXaHkgaXMgcHZfc2hpbV9v
ZmZsaW5lX21lbW9yeSgpIG5vdCBpbiBkZWNyZWFzZV9yZXNlcnZhdGlvbigpIHRvIGJlZ2luIHdp
dGg/CgpDb3VsZCBiZSBtb3ZlZCBhc3N1bWluZyBpdCB3aWxsIGp1c3Qgb2ZmbGluZSB0aGUgZnJh
bWVzIHRoYXQgYWxyZWFkeSBwcm9jZXNzZWQuCgo+IEZ1cnRoZXJtb3JlLCB0aGVyZSBpcyBhIGZ1
bmRhbWVudGFsIGRpZmZlcmVuY2UgaW4gYmFsbG9vbmluZyBiZWhhdmlvdXIKPiBiZXR3ZWVuIFBW
IGFuZCBIVk0gZ3Vlc3RzLCB3aGljaCBJIGRvbid0IHRoaW5rIHdlIGNhbiBjb21wZW5zYXRlIGZv
ci7CoAo+IFBWIGd1ZXN0cyBuZWVkIHRvIGNhbGwgZGVjcmVhc2UgcmVzZXJ2YXRpb24gb25jZSB0
byByZWxlYXNlIHRoZSBmcmFtZXMsCj4gYW5kIHVubWFwIHRoZSBmcmFtZXMgKGluIGFueSBvcmRl
cikuwqAgSFZNIGd1ZXN0cyBjYWxsaW5nIGRlY3JlYXNlCj4gcmVzZXJ2YXRpb24gYXV0b21hdGlj
YWxseSBtYWtlIHRoZSBmcmFtZSB1bnVzYWJsZSBubyBtYXR0ZXIgaG93IG1hbnkKPiBvdXRzdGFu
ZGluZyByZWZlcmVuY2VzIGV4aXN0Lgo+IAo+IFNoaW0gY2FuJ3QgZGVjcmVhc2UgcmVzZXJ2YXRp
b24gKEhWTSB3aXRoIEwwIFhlbikgb24gYW55IGZyYW1lIHdobydzCj4gcmVmZXJlbmNlIGNvdW50
IGRpZG4ndCBkcm9wIHRvIDAgZnJvbSB0aGUgUFYgZ3Vlc3RzJyBjYWxsLCBhbmQgdGhlcmUgaXMK
PiBub3RoaW5nIHByZXNlbnRseSB0byBjaGVjayB0aGlzIGNvbmRpdGlvbi4KCkl0IHdpbGwgYWxs
b2NhdGVkIHRoZSBwYWdlcyBmcm9tIGFsbG9jYXRvciAtIHllcywgaXQgY2hlY2tzIHRoYXQgY291
bnRlcgppcyBkcm9wcGVkIHRvIDAuCgpJZ29yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
