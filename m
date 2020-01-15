Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF31613C10C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 13:33:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irhpM-0007Ae-Im; Wed, 15 Jan 2020 12:31:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OV/N=3E=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1irhpK-0007AZ-SO
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 12:31:14 +0000
X-Inumbo-ID: e98de45c-3792-11ea-8530-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e98de45c-3792-11ea-8530-12813bfff9fa;
 Wed, 15 Jan 2020 12:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579091471;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=SvVs6uuSTIa9Uu1leCkh0aTsDY9cSameooyTcRVWNMw=;
 b=TANz36Zv3cmGCQECStgmizJgxDXUaJ8CJGqm0JuPzONYI+K3wP+QK7ba
 j4g6Ku+o5utoSVw5Yb1Ox+e3zpkHRCjFdNkSKay4OgvFxIojXgQho5AqQ
 Bdn2h02+/RXhUAHZTZi4rRYl4au9c5wd8qI3fK86U3lyC4qxTfdJ29q9Z U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ms1ufK48ETu+x5BA2ZfzohtFDhzwyyax5MezU1sagk7RAY8I/6LjtToXAdo72kzWmsCG4aBhg6
 J2YkhyOEa46DP8gqgVnDT9rpNZ1TTRIXPR2l64Vn5gBCaIFvyGMaExx1Xe7XErDfoUUV7mmM5Z
 e8ikmdhbAPMq8ausdl2f00G1T2Lc7cl8xrn3Vo2/Rv9+0atd5qDuvDM2IiPOxpnj2QPdie4T5T
 wINZownYZkRvfDmwZ4dLNbPLYUoPrk3ebI0lEu4AK6PXK6ssSz2v0sRPVQvky2DTNvu83qhQZC
 +B4=
X-SBRS: 2.7
X-MesageID: 11309174
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,322,1574139600"; d="scan'208";a="11309174"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <1579030581-7929-1-git-send-email-igor.druzhinin@citrix.com>
 <20200115094703.GH11756@Air-de-Roger>
 <f9b7c06e-54df-bfb2-44d5-b3ef38f2a725@suse.com>
 <af5e509b-e24e-2fcc-c131-bb63e9e40790@citrix.com>
Message-ID: <f9b39389-c1d4-c8e5-defd-b30d95d1159b@citrix.com>
Date: Wed, 15 Jan 2020 12:31:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <af5e509b-e24e-2fcc-c131-bb63e9e40790@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/time: update TSC stamp on restore from
 deep C-state
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMDEvMjAyMCAxMjoyNSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMTUvMDEvMjAy
MCAxMTo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE1LjAxLjIwMjAgMTA6NDcsIFJvZ2Vy
IFBhdSBNb25uw6kgd3JvdGU6Cj4+PiBPbiBUdWUsIEphbiAxNCwgMjAyMCBhdCAwNzozNjoyMVBN
ICswMDAwLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvdGlt
ZS5jCj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L3RpbWUuYwo+Pj4+IEBAIC05NTUsMTAgKzk1NSwx
NiBAQCB1NjQgc3RpbWUydHNjKHNfdGltZV90IHN0aW1lKQo+Pj4+ICAKPj4+PiAgdm9pZCBjc3Rh
dGVfcmVzdG9yZV90c2Modm9pZCkKPj4+PiAgewo+Pj4+ICsgICAgc3RydWN0IGNwdV90aW1lICp0
ID0gJnRoaXNfY3B1KGNwdV90aW1lKTsKPj4+PiArCj4+Pj4gICAgICBpZiAoIGJvb3RfY3B1X2hh
cyhYODZfRkVBVFVSRV9OT05TVE9QX1RTQykgKQo+Pj4+ICAgICAgICAgIHJldHVybjsKPj4+PiAg
Cj4+Pj4gLSAgICB3cml0ZV90c2Moc3RpbWUydHNjKHJlYWRfcGxhdGZvcm1fc3RpbWUoTlVMTCkp
KTsKPj4+PiArICAgIHQtPnN0YW1wLm1hc3Rlcl9zdGltZSA9IHJlYWRfcGxhdGZvcm1fc3RpbWUo
TlVMTCk7Cj4+Pj4gKyAgICB0LT5zdGFtcC5sb2NhbF90c2MgPSBzdGltZTJ0c2ModC0+c3RhbXAu
bWFzdGVyX3N0aW1lKTsKPj4+PiArICAgIHQtPnN0YW1wLmxvY2FsX3N0aW1lID0gdC0+c3RhbXAu
bWFzdGVyX3N0aW1lOwo+Pj4+ICsKPj4+PiArICAgIHdyaXRlX3RzYyh0LT5zdGFtcC5sb2NhbF90
c2MpOwo+Pj4KPj4+IEluIG9yZGVyIHRvIGF2b2lkIHRoZSBUU0Mgd3JpdGUgKGFuZCB0aGUgbGlr
ZWx5IGFzc29jaWF0ZWQgdm1leGl0KSwKPj4+IGNvdWxkIHlvdSBpbnN0ZWFkIGRvOgo+Pj4KPj4+
IHQtPnN0YW1wLmxvY2FsX3N0aW1lID0gdC0+c3RhbXAubWFzdGVyX3N0aW1lID0gcmVhZF9wbGF0
Zm9ybV9zdGltZShOVUxMKTsKPj4+IHQtPnN0YW1wLmxvY2FsX3RzYyA9IHJkdHNjX29yZGVyZWQo
KTsKPj4+Cj4+PiBJIHRoaW5rIGl0IHNob3VsZCBhY2hpZXZlIHRoZSBzYW1lIGFzIGl0IHN5bmNz
IHRoZSBsb2NhbCBUU0Mgc3RhbXAgYW5kCj4+PiB0aW1lcywgd291bGQgYXZvaWQgdGhlIFRTQyB3
cml0ZSBhbmQgc2xpZ2h0bHkgc2ltcGxpZmllcyB0aGUgbG9naWMuCj4+Cj4+IFdvdWxkbid0IHRo
aXMgcmVzdWx0IGluIGd1ZXN0cyBwb3NzaWJseSBvYnNlcnZpbmcgdGhlIFRTQyBtb3ZpbmcKPj4g
YmFja3dhcmRzPwo+IAo+IFllcywgSSB0aGluayBzby4gV291bGQgcmVzdG9yaW5nIGZyb20gVFND
IHN0YW1wIGlmIGl0J3MgaGlnaGVyIHRoYW4KPiBwbGF0Zm9ybSB0aW1lIGJldHRlciB5b3UgdGhp
bms/Cj4gCgpJZ25vcmUgbXkgcmVwbHkuIEkgd2FzIHRoaW5raW5nIHlvdSdyZSBhc2tpbmcgd2hl
dGhlciB0aGUgb3JpZ2luYWwgY29kZQp3b3VsZCBkbyBzdWNoIGEgdGhpbmcuIEFsdGhvdWdoIEkn
bSBjb25jZXJuZWQgaWYgd2hhdCB5b3Ugc2F5IGFjdHVhbGx5CmFwcGxpZXMgdG8gdGhlIG9yaWdp
bmFsIGNvZGUgYXMgd2VsbC4gV291bGQgeW91IHRoaW5rIHRoZSBleGlzdGluZyBsb2dpYwpoYW5k
bGVzIGl0IGFscmVhZHk/CgpJZ29yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
