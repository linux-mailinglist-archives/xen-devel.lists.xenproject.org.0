Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07054F44C0
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 11:38:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT1cc-00055h-O8; Fri, 08 Nov 2019 10:36:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5eKS=ZA=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iT1cb-00055W-Pq
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 10:36:05 +0000
X-Inumbo-ID: 90c37738-0213-11ea-b678-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90c37738-0213-11ea-b678-bc764e2007e4;
 Fri, 08 Nov 2019 10:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573209364;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=FdNiA5BExpJUAFvzmZPgEHN4Wbp01jlZjUIwodlOsZg=;
 b=adpDxGhZAp3lpirjtXNWw5fuI8Ex4y9RG7qBICnzuiaC+YLOtZF8mScr
 4XGfruQItaQ50S6L3QCYT5KSYV6AxyRzpnU/LC1V7ajzke5+Fkc3MGSJu
 yTx843bnwnqSaRpwMbfUiN94AaE10ZzSEY0tZ4YLHuhAmhvxk+SqTQFTI I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6C0y1kNHHCTbqnDnVRjEbjHeZB+bVu3dmWCmqkwi4biecGyG/c1w58vmow/mqkDsJ5t1TV7NWS
 xHgpi7Irz/2+ii+Pctud+OVaKwCRz52pxiX409oSpLhPICcIqw/2fnI6MmHWgpsxy9CBdvwVGN
 t097NjcoVu27cuZ04cyVXQsXp3DBoN4sgDKVfVVrKkLxaMMOMK8dnrIfbQnH1FtPdTAICLJQM7
 MC6ufXjweDy1p8zw2YEThKOFzShzVRHbzLL5bnjtpv0ErvQG+CA+XoIRkKZgpATXTeqd35H+oy
 X2s=
X-SBRS: 2.7
X-MesageID: 8457654
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,281,1569297600"; 
   d="scan'208";a="8457654"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xenproject.org>
References: <20190928151305.127380-1-wipawel@amazon.de>
 <20190928151305.127380-3-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <d7ad3ce9-9b2a-da4e-6d8e-cfb64f4ece66@citrix.com>
Date: Fri, 8 Nov 2019 10:36:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190928151305.127380-3-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 02/12] livepatch: Allow to override
 inter-modules buildid dependency
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
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8yOC8xOSA0OjEyIFBNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBCeSBkZWZh
dWx0IExpdmVwYXRjaCBlbmZvcmNlcyB0aGUgZm9sbG93aW5nIGJ1aWxkaWQtYmFzZWQgZGVwZW5k
ZW5jeQo+IGNoYWluIGJldHdlZW4gbGl2ZXBhdGNoIG1vZHVsZXM6Cj4gICAxKSBmaXJzdCBtb2R1
bGUgZGVwZW5kcyBvbiBnaXZlbiBoeXBlcnZpc29yIGJ1aWxkaWQKPiAgIDIpIGV2ZXJ5IGNvbnNl
Y3V0aXZlIG1vZHVsZSBkZXBlbmRzIG9uIHByZXZpb3VzIG1vZHVsZSdzIGJ1aWxkaWQKPiBUaGlz
IHdheSBwcm9wZXIgbGl2ZXBhdGNoIHN0YWNrIG9yZGVyIGlzIG1haW50YWluZWQgYW5kIGVuZm9y
Y2VkLgo+IFdoaWxlIGl0IGlzIGltcG9ydGFudCBmb3IgcHJvZHVjdGlvbiBsaXZlcGF0Y2hlcyBp
dCBsaW1pdHMgYWdpbGl0eSBhbmQKPiBibG9ja3MgdXNhZ2Ugb2YgdGVzdGluZyBvciBkZWJ1ZyBs
aXZlcGF0Y2hlcy4gVGhlc2Uga2luZHMgb2YgbGl2ZXBhdGNoCj4gbW9kdWxlcyBhcmUgdHlwaWNh
bGx5IGV4cGVjdGVkIHRvIGJlIGxvYWRlZCBhdCBhbnkgdGltZSBpcnJlc3BlY3RpdmUKPiBvZiBj
dXJyZW50IHN0YXRlIG9mIHRoZSBtb2R1bGVzIHN0YWNrLgo+IAo+IFRvIGVuYWJsZSB0ZXN0aW5n
IGFuZCBkZWJ1ZyBsaXZlcGF0Y2hlcyBhbGxvdyB1c2VyIGR5bmFtaWNhbGx5IGlnbm9yZQo+IHRo
ZSBpbnRlci1tb2R1bGVzIGRlcGVuZGVuY3kuIEluIHRoaXMgY2FzZSBvbmx5IGh5cGVydmlzb3Ig
YnVpbGRpZAo+IG1hdGNoIGlzIHZlcmlmaWVkIGFuZCBlbmZvcmNlZC4KPiAKPiBUbyBhbGxvdyB1
c2VybGFuZCBwYXNzIGFkZGl0aW9uYWwgcGFyZW1ldGVycyBmb3IgbGl2ZXBhdGNoIGFjdGlvbnMK
PiBhZGQgc3VwcG9ydCBmb3IgYWN0aW9uIGZsYWdzLgo+IEVhY2ggb2YgdGhlIGFwcGx5LCByZXZl
cnQsIHVubG9hZCBhbmQgcmV2ZXJ0IGFjdGlvbiBnZXRzIGFkZGl0aW9uYWwKPiA2NC1iaXQgcGFy
YW1ldGVyICdmbGFncycgd2hlcmUgZXh0cmEgZmxhZ3MgY2FuIGJlIGFwcGxpZWQgaW4gYSBtYXNr
Cj4gZm9ybS4KPiBJbml0aWFsbHkgb25seSBvbmUgZmxhZyAnLS1ub2RlcHMnIGlzIGFkZGVkIGZv
ciB0aGUgYXBwbHkgYWN0aW9uLgo+IFRoaXMgZmxhZyBtb2RpZmllcyB0aGUgZGVmYXVsdCBidWls
ZGlkIGRlcGVuZGVuY3kgY2hlY2sgYXMgZGVzY3JpYmVkCj4gYWJvdmUuCj4gVGhlIGdsb2JhbCBz
eXNjdGwgaW50ZXJmYWNlIGlucHV0IGZsYWcgcGFyYW1ldGVyIGlzIGRlZmluZWQgd2l0aCBhCj4g
c2luZ2xlIGNvcnJlc3BvbmRpbmcgZmxhZyBtYWNybzoKPiAgIExJVkVQQVRDSF9BQ1RJT05fQVBQ
TFlfTk9ERVBTICgxIDw8IDApCj4gCj4gVGhlIHVzZXJsYW5kIHhlbi1saXZlcGF0Y2ggdG9vbCBp
cyBtb2RpZmllZCB0byBzdXBwb3J0IHRoZSAnLS1ub2RlcHMnCj4gZmxhZyBmb3IgYXBwbHkgYW5k
IGxvYWQgY29tbWFuZHMuIEEgZ2VuZXJhbCBtZWNoYW5pc20gZm9yIHNwZWNpZnlpbmcKPiBtb3Jl
IGZsYWdzIGluIHRoZSBmdXR1cmUgZm9yIGFwcGx5IGFuZCBvdGhlciBhY3Rpb24gaXMgaG93ZXZl
ciBhZGRlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdl
bEBhbWF6b24uZGU+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJhLUlyaW5hIFBhcmFzY2hpdiA8YW5kcmFw
cnNAYW1hem9uLmNvbT4KPiBSZXZpZXdlZC1ieTogRXNsYW0gRWxuaWtldHkgPGVsbmlrZXR5QGFt
YXpvbi5kZT4KPiBSZXZpZXdlZC1ieTogUGV0cmUgRWZ0aW1lIDxlcGV0cmVAYW1hem9uLmNvbT4K
PiBSZXZpZXdlZC1ieTogTGVvbmFyZCBGb2Vyc3RlciA8Zm9lcnNsZW9AYW1hem9uLmRlPgo+IFJl
dmlld2VkLWJ5OiBNYXJ0aW4gUG9obGFjayA8bXBvaGxhY2tAYW1hem9uLmRlPgo+IFJldmlld2Vk
LWJ5OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KPiBTaWduZWQtb2ZmLWJ5
OiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cj4gLS0tCj4g
Q2hhbmdlZCBzaW5jZSB2MzoKPiAgICogc2ltcGxpZmllZCBsb29wIGluIHhlbi1saXZlcGF0Y2gu
Ywo+IApSZXZpZXdlZC1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
