Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2C8E1E33
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 16:31:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNHd2-0000XZ-KE; Wed, 23 Oct 2019 14:28:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JVcx=YQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iNHd1-0000XU-TI
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 14:28:47 +0000
X-Inumbo-ID: 6c42af10-f5a1-11e9-beca-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c42af10-f5a1-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 14:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571840928;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SC2bEn2NruC9zrYm6iiRCMugZCOYvWpsupsM1sqhTF4=;
 b=YfmHwNcvNEzjw7d7A+F6pIEZ7AeSsOmFYteW9Yx1tuu2PClvLm0Mr/Pr
 Upc6xssaw9KtjvDgdIqUXhEEhCYz/lAjS9J2kvCKruPS4pORDL1yTlxkF
 +2FqZ4GwN4odLVX32POxIYcxq3MBhbSBN1fMQxPVuTr3ouvv/XqY27uuE Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qGwUNCXe86HlGV5P3J1nUCKppompeoD+RYDj+WIfdY7b8f7dk/0Qhc6TUOyWXPosN0d+CuUv7j
 x2yJoAlJOKFEJT2oy96FD/oQZtFitzsxUZeOCLAs5/nXlBeXKcghXHA/Y8777eoNBCj4Z7fM9B
 9B3WBMZcYcK81x5tPe+5jEslZaqWJOlBV49FrfQ0w9NnFfqCzx6TIobxuZxmuhxNScMBOKwQtX
 D6xYlDGu+N4sF+I7/qb5mhwpD26uujAHbyJ+73Xrrx4n/LogYo6Q9NBfHK1b9Y7D8UsEMG1drm
 QMg=
X-SBRS: 2.7
X-MesageID: 7325195
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7325195"
Date: Wed, 23 Oct 2019 16:28:39 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191023142839.GT17494@Air-de-Roger>
References: <20191023135644.46847-1-roger.pau@citrix.com>
 <46488d97-7416-624c-1af4-6a0201bd6711@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46488d97-7416-624c-1af4-6a0201bd6711@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/tsc: limit the usage of synchronization
 rendezvous
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMDQ6MTc6MTFQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjMuMTAuMjAxOSAxNTo1NiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gSWYg
WGVuIGRldGVjdHMgdGhlIFRTQyBpcyB1bnJlbGlhYmxlIGl0IHdpbGwgc2V0IGEgcmVuZGV6dm91
cyBoZWxwZXIKPiA+IHRoYXQgdHJpZXMgdG8gc3luY2hyb25pemUgdGhlIGRpZmZlcmVudCBDUFVz
IFRTQyB2YWx1ZSBieSBwcm9wYWdhdGluZwo+ID4gdGhlIG9uZSBmcm9tIENQVSMwIGFuZCB3cml0
aW5nIGl0IGludG8gdGhlIElBMzJfVFNDIE1TUiBvbiBlYWNoIENQVS4KPiA+IAo+ID4gV2hlbiB0
aGUgc3lzdGVtIGhhcyBhIHNpbmdsZSB0aHJlYWQgYW5kIHRoZXJlIGFyZSBubyBob3RwbHVnYWJs
ZSBDUFVzCj4gPiBkb2luZyB0aGUgYWJvdmUganVzdCByZXN1bHRzIGluIHJlYWRpbmcgdGhlIFRT
QyBmcm9tIENQVSMwIGFuZCB3cml0aW5nCj4gPiBpdCBpbnRvIHRoZSBJQTMyX1RTQyBNU1Igb2Yg
Q1BVIzAsIHdoaWNoIGlzIHBvaW50bGVzcywgc28gbGltaXQgdGhlCj4gPiB1c2FnZSBvZiB0aGUg
c3luY2hyb25pemF0aW9uIHJlbmRlenZvdXMgdG8gc3lzdGVtcyB0aGF0IGhhdmUgbW9yZSB0aGFu
Cj4gPiBvbmUgQ1BVLCBldmVuIGlmIHRob3NlIENQVXMgYXJlIHlldCB0byBiZSBob3RwbHVnZ2Vk
Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KPiA+IC0tLQo+ID4gSSdtIG5vdCBzdXJlIHdoZXRoZXIgdGhpcyBpcyBzdWl0YWJs
ZSBmb3IgNC4xMywgYmVpbmcgYSBwZXJmb3JtYW5jZQo+ID4gaW1wcm92ZW1lbnQgYnV0IG5vdCBm
aXhpbmcgYSBmdW5jdGlvbmFsIGJ1Zy4KPiAKPiBVbmxlc3Mgd2Uga25vdyB0aGVyZSdzIGEgbG90
IG9mIHVzZSBvZiBYZW4gaW4gVVAgbW9kZSwgSSdkIHNheQo+IHJhdGhlciBub3QuIF9JZl8gdGhl
cmUgd2FzIGEgbG90IG9mIHN1Y2ggdXNlLCB0aGVuIEkgdGhpbmsgd2UKPiBvdWdodCB0byBkbyBt
b3JlIHdvcmsgdG93YXJkcyBwZXJmb3JtYW5jZSB0aGVyZSAobGlrZSByZS0KPiBpbnRyb2R1Y2lu
ZyBTTVAgYWx0ZXJuYXRpdmVzIHBhdGNoaW5nKS4KPiAKPiBPZiBjb3Vyc2UgaW4gdGhlIGVuZCB0
aGUgZGVjaXNpb24gaXMgdG8gYmUgdGFrZW4gYnkgSsO8cmdlbiwKPiB3aG9tIHlvdSBkaWRuJ3Qg
ZXZlbiBDYy4KClNpbmNlIHRoaXMgaXMgYSBwZXJmb3JtYW5jZSBmaXggSSBmZWx0IGxpa2UgaXQg
d2Fzbid0IHJlYWxseQphcHByb3ByaWF0ZSBmb3IgNC4xMywgaGVuY2UgSSBkaWRuJ3QgQ2MgSsO8
cmdlbiBidXQgYWRkZWQgdGhpcyBub3RlLgoKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni90aW1lLmMK
PiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni90aW1lLmMKPiA+IEBAIC0xODIxLDcgKzE4MjEsOCBAQCBz
dGF0aWMgaW50IF9faW5pdCB2ZXJpZnlfdHNjX3JlbGlhYmlsaXR5KHZvaWQpCj4gPiAgICAgICAq
IGFyZSBub3QgbWFya2VkIGFzICdyZWxpYWJsZScsIHJlLXN5bmMgZHVyaW5nIHJlbmRlenZvdXMu
Cj4gPiAgICAgICAqLwo+ID4gICAgICBpZiAoIGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9DT05T
VEFOVF9UU0MpICYmCj4gPiAtICAgICAgICAgIWJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9UU0Nf
UkVMSUFCTEUpICkKPiA+ICsgICAgICAgICAhYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX1RTQ19S
RUxJQUJMRSkgJiYKPiA+ICsgICAgICAgICBudW1fcHJlc2VudF9jcHVzKCkgPiAxICkKPiA+ICAg
ICAgICAgIHRpbWVfY2FsaWJyYXRpb25fcmVuZGV6dm91c19mbiA9IHRpbWVfY2FsaWJyYXRpb25f
dHNjX3JlbmRlenZvdXM7Cj4gCj4gRGlkIHlvdSBjb25zaWRlciB0aGUgYWx0ZXJuYXRpdmUgb2Yg
c3dpdGNoaW5nIHRoZSByZW5kZXp2b3VzCj4gZnVuY3Rpb24gd2hlbiBnb2luZyBmcm9tIFVQIHRv
IE1QIG1vZGUgKG9yIGJhY2spPwoKSSB3aWxsIGxvb2sgaW50byB0aGF0LiBUaGUgdXNlZnVsbmVz
cyBvZiB0aGlzIGZpeCBpcyBxdWl0ZSBsaW1pdGVkLApnaXZlbiBpdCBvbmx5IGFwcGxpZXMgdG8g
VVAsIHNvIEkgZGlkbid0IHdhbnQgdG8gYWRkIGEgbG90IG9mCmNvbXBsZXhpdHkgZm9yIGEgbm90
IHZlcnkgY29tbW9uIHNjZW5hcmlvIElNTy4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
