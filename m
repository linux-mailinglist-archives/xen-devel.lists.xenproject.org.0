Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB6FA9CC2
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 10:18:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5muq-000701-VD; Thu, 05 Sep 2019 08:14:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QhBR=XA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i5mup-0006zw-EV
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 08:14:51 +0000
X-Inumbo-ID: 3b39a1d8-cfb5-11e9-b76c-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b39a1d8-cfb5-11e9-b76c-bc764e2007e4;
 Thu, 05 Sep 2019 08:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567671291;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=K8uaWvSJfAcR++/KZI2DzuaQItfm1hSakduLmvu7HLQ=;
 b=L1WmtYEJN8Er4rv02oc6fuq0LUc7vT5EkWKmt8DRISG/3yxxD0S98Mjz
 AHdqNVuOIUj+I7NkCF2Jsv30bSsB5yHmujaTaGV+r8l+0C6CtmktD5vyJ
 ozbhPHqw9AZNwMBYQXX+5ezvz9Z7kTEZQnvpQFN2DK1BmShwEZN7oaVF5 I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kG8JA0gPBxQ83m13XeXtDtd/GXnwZgf8YcbD8yOG09n2doP+TVvNu5sPKFaIvssFuTkphgPXu3
 6Zu9VbgWnMHQ0Vo6C4vxvqNXEg3aJ7jYnI1BAYJmXB9kuXGE1jicTIbFjKzz5E1jN3mlkWtGFP
 9ZkDwIYvUNOTnYm+XiMzuYnbmcwlRSea34L2veFdyh9wyTJTlCuxEN7KJGWOKF+JLRjr+onntl
 bluEr0sSTWHbKdYRwSscCtwL5HFPWCh0TY2CKBe05w66Sa4uEzCiltE2BkOJsQbJfCwjEj+ygP
 mDI=
X-SBRS: 2.7
X-MesageID: 5217103
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,470,1559534400"; 
   d="scan'208";a="5217103"
To: Lars Kurth <lars.kurth@citrix.com>, Rich Persaud <persaur@gmail.com>, "Jan
 Beulich" <jbeulich@suse.com>
References: <6DA859DE-62FD-48C1-BBEE-C7A63D751B3E@citrix.com>
 <E8BC34C9-934A-4383-833B-B9AE6C9540A9@gmail.com>
 <b434d04f-d4e8-3b00-4efb-bf71c02e5075@suse.com>
 <11D8BF8A-BF9E-4610-8A80-8698B705AFAB@gmail.com>
 <FA118783-4079-460A-95F8-B628F3320637@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <95800deb-8c7f-aaef-8ff2-8a4f87e6b5e6@citrix.com>
Date: Thu, 5 Sep 2019 09:14:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <FA118783-4079-460A-95F8-B628F3320637@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [ANNOUNCE] Call for agenda items for September 5th
 Community Call @ 15:00 UTC
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
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Doug Goldstein <cardoe@cardoe.com>, Julien Grall <julien.grall@arm.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>,
 Janakarajan Natarajan <jnataraj@amd.com>,
 "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 Matt Spencer <Matt.Spencer@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Rian Quinn <rianquinn@gmail.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Ian
 Jackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>, Juergen Gross <jgross@suse.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, John Ji <john.ji@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUvMDkvMjAxOSAwODo0OSwgTGFycyBLdXJ0aCB3cm90ZToKPiDvu79PbiAwNS8wOS8yMDE5
LCAwODo0MSwgIlJpY2ggUGVyc2F1ZCIgPHBlcnNhdXJAZ21haWwuY29tPiB3cm90ZToKPgo+ICAg
ICA+IE9uIFNlcCA1LCAyMDE5LCBhdCAwMzoxOSwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPiB3cm90ZToKPiAgICAgPiAKPiAgICAgPiBGb3JnaXZlIG1lIGFza2luZywgYnV0IHdoeSBp
cyB0aGlzIHB1dCB1cCBhcyBhbiBhZ2VuZGEgaXRlbSBoZXJlPwo+ICAgICA+IElNTyB0aGlzIGlz
IHRoZSBraW5kIG9mIHRoaW5nIHdoZXJlIHlvdSB3b3VsZCBzZW5kIGEgcHJvcG9zYWwgYW5kCj4g
ICAgID4gcmVxdWVzdCBmZWVkYmFjayBieSBlbWFpbCBmaXJzdCwgYW5kIHB1dCBpdCB1cCBhcyBh
biBhZ2VuZGEgaXRlbQo+ICAgICA+IGhlcmUgb25seSBpZiBpdCBnb3Qgc3RhbGxlZCB0aGVyZS4g
KEFwb2xvZ2llcyBpZiBJJ3ZlIG92ZXJsb29rZWQKPiAgICAgPiBzdWNoIGEgc3RhbGxlZCB0aHJl
YWQuKQo+ICAgICAKPiAgICAgSWYgWGVuIGNvbW11bml0eSBjYWxsIHRvcGljcyBhcmUgbGltaXRl
ZCB0byBlc2NhbGF0aW9ucyBvZiB4ZW4tZGV2ZWwgdGhyZWFkcywgdGhlbiBhIG5ldyB0aHJlYWQg
Y2FuIGJlIGNyZWF0ZWQgZm9yIHRoaXMgdG9waWMuIFhlbiBjb21tdW5pdHkgY2FsbHMgaGF2ZSBh
bHNvIHByb3ZpZGVkIHJlYWwtdGltZSwgaW50ZXJhY3RpdmUgZmVlZGJhY2sgb24gY2FuZGlkYXRl
IHByb3Bvc2FscywgYWxvbmcgd2l0aCBndWlkYW5jZSBvbiBhcmVhcyB3aGljaCBuZWVkIGRvY3Vt
ZW50YXRpb24gYmVmb3JlIGEgZm9ybWFsIHByb3Bvc2FsIGlzIG1hZGUgdG8geGVuLWRldmVsLiAg
IFN1Y2ggYWdlbmRhIGl0ZW1zIGFyZSB0eXBpY2FsbHkgY292ZXJlZCBhZnRlciBhbGwgc2VyaWVz
IGFuZCBwcmlvcml0eSB0b3BpY3MgaGF2ZSBiZWVuIGFkZHJlc3NlZC4KPiAgICAgCj4gSSBkb24n
dCBtaW5kIGhhdmluZyBpdGVtcyBzdWNoIHRoZXNlIG9uIHRoZSBhZ2VuZGEgYW5kIHRvIGJlIGZh
aXIgaGF2ZSBhZGRlZCBzaW1pbGFyIGl0ZW1zIG9udG8gdGhlIGFnZW5kYSBpbiB0aGUgcGFzdC4K
PiBDbGVhcmx5LCB0aGV5IGFyZSBmb3J3YXJkIGxvb2tpbmcgW2xpa2UgYW4gUkZDXSwgZm9yIHdo
aWNoIHJlYXNvbiBJIHRlbmQgdG8gYWRkIHRoZW0gdG8gdGhlIGVuZCBvZiBhbiBhZ2VuZGEgaWYg
dGhlcmUgaXMgYSBidXN5IHNjaGVkdWxlCj4KPiBQZXJzb25hbGx5LCBvbiB0aGlzIHNwZWNpZmlj
IGl0ZW0sIGl0IGlzIG5vdCByZWFsbHkgY2xlYXIgd2hhdCB0aGUgcXVlc3Rpb25zIGFyZS4gIElu
IG90aGVyIHdvcmRzOiBpcyB0aGlzIGFib3V0IFVVSURTL2RvbWFpbiBpZHMgb25seSwgb3IgaXMg
dGhlcmUgc29tZXRoaW5nIGVsc2UuCgpSZXF1aXJpbmcgc29tZXRoaW5nIHRvIGJlIGJsb2NrZWQg
b24geGVuLWRldmVsIGJlZm9yZSB3ZSBkaXNjdXNzIGl0IG9uCnRoZSBjYWxsIGlzIG1vbnVtZW50
YWxseSBzaG9ydCBzaWdodGVkLCBhbmQgb2ZmLXB1dHRpbmcgZm9yIGNvbnRyaWJ1dG9ycy4KCklu
IHRoaXMgY2FzZSwgaXQgaXMgdmVyeSBkZWZpbml0ZWx5IG5vdCB0aGUgZmlyc3QgdGltZSB0aGlz
IHByb2JsZW0gaGFzCmJlZW4gcmFpc2VkLCBhcyBpdCBpcyBhbiBYU0Egc2hhcGVkIGVsZXBoYW50
IGluIHRoZSByb29tLsKgIEl0cyBubyBzZWNyZXQKdGhhdCBpZCB3cmFwcyBjYXVzZSBwcm9ibGVt
cywgYW5kIHdoaWxlIG91ciBzZWN1cml0eSBwb2xpY3kgZG9lc24ndApjb21tZW50IG9uIHRoZSBt
YXR0ZXIsIGl0IGFsc28gZG9lc24ndCBzYXkgIndhcm5pbmcgLSBzdHVmZiAqd2lsbCogYnJlYWsK
aW4gd2VpcmQsIHdvbmRlcmZ1bCwgYW5kIHNlY3VyaXR5LXJlbGV2YW50IHdheXMgd2hlbiBkb21p
ZCdzIHdyYXAiLgoKVGhlIG9yZGVyIG9mIHRoZSBhZ2VuZGEgaXMgaW1wb3J0YW50LCBhbmQgSSBk
b24ndCB0aGluayB0aGlzIHNob3VsZCBiZQphdCB0aGUgdG9wLCBidXQgZXZlbiBpZiB3ZSBvbmx5
IGVuZCB1cCB3aXRoIDIgbWludXRlcyB0byBkaXNjdXNzIGl0LAp0aGVuIHNvIGJlIGl0LsKgICgy
IG1pbnV0ZXMgb2YgdGFsa2luZyBjYW4gc3RpbGwgYmUgZmFyIG1vcmUgdmFsdWFibGUKdGhhbiBh
IHdlZWtzIHdvcnRoIG9mIGVtYWlsaW5nLikKCldoYXQgaXMgbm90IGFjY2VwdGFibGUgaXMgc3Vn
Z2VzdGluZyB0aGF0IGl0IHNob3VsZCBiZSB2ZXRvJ2Qgc2ltcGx5CmJlY2F1c2UgaXQgaXMgcGVy
Y2VpdmVkIHRvIGJlIGEgdmVyeSBmcmVzaCBpZGVhL3F1ZXJ5LgoKfkFuZHJldwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
