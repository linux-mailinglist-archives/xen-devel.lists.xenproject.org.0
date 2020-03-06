Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C30D717BDDE
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 14:12:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jACkA-0001st-Ax; Fri, 06 Mar 2020 13:10:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W/Eu=4X=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jACk8-0001sZ-FS
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 13:10:20 +0000
X-Inumbo-ID: d42b554a-5fab-11ea-a7cd-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d42b554a-5fab-11ea-a7cd-12813bfff9fa;
 Fri, 06 Mar 2020 13:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583500219;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=r7QP2aeAZjcT78JbI8ZaXRKa/Oq33gtWayOkS0rr6GU=;
 b=T39Cz3ZrE8x7dIweGoGnLNsB1PBx/SSlM6se1I075n9MKss384xmtpe4
 +F8r8RB4K836m3AVqVyHA1cmrLNihkWDZs3zekY0LKrcUzVw3awZ+icms
 JBOLEH51KoMKZrBOjjkl5ex1MkbmMKvnQkCC2k4TiXwXNvWX6hgU4JbVx M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kBXBQO1HC5sbtLnjawQqu+q1BsjuuIeNJbcqzWe6DMoXLgnacpkDdTUcMXtEXD15ltY1qiKIoq
 qrTHoSt8bu7BzHw/JXszqIuuqsQ0/mylLclEMA0TxLQLYL7bS561y/BtKul0tMw0TdDOoXuL0G
 ZoycQOIxP1ZerWsT1AiET9Czrv+K7HOlWXjwJahDD/MGk5On5tHbYxdQruF+wzp01C3RjUvYXR
 1gc9Lo6cp1vE1evSalBII/BPrlYDae/J8Z/OYJs7jjYMK8hfhYAcrucl9yF9Tx44sPShT7Nq7S
 L0k=
X-SBRS: 2.7
X-MesageID: 13534076
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,522,1574139600"; d="scan'208";a="13534076"
To: Jan Beulich <jbeulich@suse.com>
References: <1583336008-10123-1-git-send-email-igor.druzhinin@citrix.com>
 <6175e008-2b25-0232-8fe1-073fe4325b99@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <2dfb6eee-847d-4aa6-aa79-6daddcaf67be@citrix.com>
Date: Fri, 6 Mar 2020 13:10:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6175e008-2b25-0232-8fe1-073fe4325b99@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] x86/cpu: Sync any remaining RCU
 callbacks before CPU up/down
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
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYvMDMvMjAyMCAwOTo0MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDQuMDMuMjAyMCAx
NjozMywgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9hY3BpL3Bv
d2VyLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYwo+PiBAQCAtMzA1LDcgKzMw
NSw2IEBAIHN0YXRpYyBpbnQgZW50ZXJfc3RhdGUodTMyIHN0YXRlKQo+PiAgICAgIGNwdWZyZXFf
YWRkX2NwdSgwKTsKPj4gIAo+PiAgIGVuYWJsZV9jcHU6Cj4+IC0gICAgcmN1X2JhcnJpZXIoKTsK
Pj4gICAgICBtdHJyX2Fwc19zeW5jX2JlZ2luKCk7Cj4+ICAgICAgZW5hYmxlX25vbmJvb3RfY3B1
cygpOwo+PiAgICAgIG10cnJfYXBzX3N5bmNfZW5kKCk7Cj4gCj4gSSB0YWtlIGl0IHlvdSByZW1v
dmUgdGhlIGludm9jYXRpb24gaGVyZSBiZWNhdXNlIG9mIGJlaW5nIHJlZHVuZGFudAo+IHdpdGgg
dGhlIGNwdV91cCgpIGluIGVuYWJsZV9ub25ib290X2NwdXMoKS4gSXMgdGhpcyBzYWZlIC8gY29y
cmVjdAo+IGluIGFsbCBjYXNlcz8gRm9yIG9uZSwgaXQncyBub3Qgb2J2aW91cyB0byBtZSB0aGF0
Cj4gbXRycl9hcHNfc3luY19iZWdpbigpIGNvdWxkbid0IHJlbHkgb24gUkNVIHN5bmNpbmcgdG8g
aGF2ZSBoYXBwZW5lZC4KCkZyb20gdGhlIGhpc3RvcnkgKDlkOWFmN2RjYTg3OCksIHJjdV9iYXJy
aWVyIHRoZXJlIHdhcyBpbnRyb2R1Y2UgZm9yCmV4YWN0bHkgc2FtZSByZWFzb24gSSBwdXQgaXQg
aW50byBjcHVfdXAvZG93bi4gSSdtIHByZXR0eSBjZXJ0YWluCml0J3Mgc2FmZSBhcyB0aGVyZSBp
cyBubyBvdGhlciBvYnZpb3VzIHJlYXNvbiB0byBoYXZlIGl0IGhlcmUuCgpUaGUgb25seSBmdW5j
dGlvbiB0aGF0IGNvdWxkIGFmZmVjdCBtdHJyX2Fwc19zeW5jX2JlZ2luKCkgaXMKbXRycl9hcHNf
c3luY19lbmQoKSBhbmQgdGhhdCBvbmUgaXMgY2FsbGVkIG9ubHkgYmVsb3cuCgo+IEFuZCB0aGVu
IGVuYWJsZV9ub25ib290X2NwdXMoKSBtYXkgbm90IGNhbGwgY3B1X3VwKCkgYXQgYWxsLAo+IGJl
Y2F1c2Ugb2YgdGhlIHBhcmtfb2ZmbGluZV9jcHVzLWJhc2VkIGVhcmx5IGxvb3AgY29udGludWF0
aW9uIGluCj4gdGhlIGZ1bmN0aW9uLgoKSSBjYW4ndCBzZWUgaG93IHRoYXQgaXMgcmVsYXRlZC4K
Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zeXNjdGwuYwo+PiArKysgYi94ZW4vYXJjaC94ODYvc3lz
Y3RsLmMKPj4gQEAgLTg1LDExICs4NSw3IEBAIGxvbmcgY3B1X3VwX2hlbHBlcih2b2lkICpkYXRh
KQo+PiAgICAgIGludCByZXQgPSBjcHVfdXAoY3B1KTsKPj4gIAo+PiAgICAgIGlmICggcmV0ID09
IC1FQlVTWSApCj4+IC0gICAgewo+PiAtICAgICAgICAvKiBPbiBFQlVTWSwgZmx1c2ggUkNVIHdv
cmsgYW5kIGhhdmUgb25lIG1vcmUgZ28uICovCj4+IC0gICAgICAgIHJjdV9iYXJyaWVyKCk7Cj4+
ICAgICAgICAgIHJldCA9IGNwdV91cChjcHUpOwo+PiAtICAgIH0KPj4gIAo+PiAgICAgIGlmICgg
IXJldCAmJiAhb3B0X3NtdCAmJgo+PiAgICAgICAgICAgY3B1X2RhdGFbY3B1XS5jb21wdXRlX3Vu
aXRfaWQgPT0gSU5WQUxJRF9DVUlEICYmCj4+IEBAIC0xMTAsMTEgKzEwNiw3IEBAIGxvbmcgY3B1
X2Rvd25faGVscGVyKHZvaWQgKmRhdGEpCj4+ICAgICAgaW50IGNwdSA9ICh1bnNpZ25lZCBsb25n
KWRhdGE7Cj4+ICAgICAgaW50IHJldCA9IGNwdV9kb3duKGNwdSk7Cj4+ICAgICAgaWYgKCByZXQg
PT0gLUVCVVNZICkKPj4gLSAgICB7Cj4+IC0gICAgICAgIC8qIE9uIEVCVVNZLCBmbHVzaCBSQ1Ug
d29yayBhbmQgaGF2ZSBvbmUgbW9yZSBnby4gKi8KPj4gLSAgICAgICAgcmN1X2JhcnJpZXIoKTsK
Pj4gICAgICAgICAgcmV0ID0gY3B1X2Rvd24oY3B1KTsKPj4gLSAgICB9Cj4gCj4gSW4gYm90aCBj
YXNlcyBJIHRoaW5rIHRoZSBjb21tZW50cyB3b3VsZCBiZXR0ZXIgYmUgcmV0YWluZWQgKGluCj4g
YW4gYWRqdXN0ZWQgc2hhcGUpLgoKT2suCgpJZ29yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
