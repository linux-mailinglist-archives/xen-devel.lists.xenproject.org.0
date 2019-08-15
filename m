Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B908EFCA
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 17:50:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyHzX-0004ho-4w; Thu, 15 Aug 2019 15:48:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=i92w=WL=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hyHzV-0004hj-Fw
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 15:48:41 +0000
X-Inumbo-ID: 26bf50b4-bf74-11e9-b90c-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26bf50b4-bf74-11e9-b90c-bc764e2007e4;
 Thu, 15 Aug 2019 15:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565884120;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=epK3x7z6X9995TT5L1aDMdAFVbJCTwjcOD96KcO14gw=;
 b=ZXLHkEria/Ip/zv/F38eBZnjeh0g4sP1p22ig0BQahAzN1p98cFTx/94
 GFvHi2syQfwH1B24FDJB2IknYofprL+BiyUwfys8pr7yUFuLo9JgGl2KZ
 jOztaP5oj6aqrF6mDfztZ3YYT4tiMF6GxqKG2OQurj8vncvxq18q6wCLj s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 04CvLL3uA5rJmw2cy+NFs4L6DxdlL2eAda208tkZUWxlC7YkKfXSWUVexxgRdfZmICpCto/VIy
 q1H9YFs1O0uX6pDX+WmBaflKqmWHps/botiYAYx1OZ/L36RUUk9t2JdOrCkW8BoqQeB90xS0kd
 jN0C9a7qhqKJsbQoP/A4UcL31+EZAoOmDo84OmmMRmXbYFdnbbkWeboqDDQILhnVFkkrHQ9eRH
 GhTnTklsEP94K5h3/pNHSsLX881rEmrdTiYAawH17iNWlZVkEzW2trj0Pwkcj3dERpr2ZkpthZ
 LvU=
X-SBRS: 2.7
X-MesageID: 4511814
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,389,1559534400"; 
   d="scan'208";a="4511814"
To: Julien Grall <julien.grall@arm.com>, "Wieczorkiewicz, Pawel"
 <wipawel@amazon.de>, Lars Kurth <lars.kurth.xen@gmail.com>
References: <20190815112708.11474-1-wipawel@amazon.de>
 <8d5350af-2ca8-a651-c43c-07372779322d@arm.com>
 <3E431F27-7D89-4CE8-8FBA-86A38EBA580F@xenproject.org>
 <A373327B-1B2B-4892-97DB-132D1EA7084E@amazon.com>
 <664a5f94-bf16-42b1-ff99-e3cee5170563@arm.com>
 <8dd1e706-72a9-da4f-89a1-cde419b6c11d@citrix.com>
 <e8b045af-92c3-0cd6-c8f0-fad184569408@arm.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <792bef63-0ddf-f928-97c0-03c7c0ecb8ed@citrix.com>
Date: Thu, 15 Aug 2019 16:48:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <e8b045af-92c3-0cd6-c8f0-fad184569408@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH lp-metadata 2/3] livepatch: Handle arbitrary
 size names with the list operation
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
Cc: "Tim \(Xen.org\)" <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8xNS8xOSA0OjM2IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgR2VvcmdlLAo+IAo+
IE9uIDE1LzA4LzIwMTkgMTY6MzIsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+IE9uIDgvMTUvMTkg
NDoyOSBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4KPj4+Cj4+PiBPbiAxNS8wOC8yMDE5IDE2
OjE5LCBXaWVjem9ya2lld2ljeiwgUGF3ZWwgd3JvdGU6Cj4+Pj4gSGkgTGFycywgSnVsaWVuLAo+
Pj4KPj4+IEhpLAo+Pj4KPj4+PiBUaGFua3MgZm9yIHRoZSBwb2ludGVycywgSSB3aWxsIHJlYWQg
dGhlbSB1cCBhbmQgZm9sbG93IHRoZQo+Pj4+IHJlY29tbWVuZGF0aW9ucyB3aXRoIG15IGZ1dHVy
ZSBjb250cmlidXRpb25zLgo+Pj4+IFNvcnJ5IGZvciB0aGUgbWVzc+KApgo+Pj4+Cj4+Pj4gQnV0
LCBsZXQgbWUgYXNrIGZpcnN0IGJlZm9yZSByZWFkaW5nIHRoZSB3aWtpcywgaG93IGRvIHlvdSBw
cmVmZXIKPj4+PiBzdWJtaXR0aW5nIHNlcmllcyB0aGF0IGNvbnRhaW4gcGF0Y2hlcyBiZWxvbmdp
bmcgdG8gMiBkaXN0aW5jdCByZXBvcwo+Pj4+IChlLmcuIHhlbiBhbmQgbGl2ZXBhdGNoLWJ1aWxk
LXRvb2xzKT8KPj4+Cj4+PiBJIGNhbiBzZWUgdHdvIHdheXM6Cj4+Pgo+Pj4gwqDCoCAxKSBPbmUg
c2VyaWVzIHBlciBwcm9qZWN0IGFuZCBtZW50aW9uIGluIHRoZSBjb3ZlciBsZXR0ZXIgdGhhdAo+
Pj4gbW9kaWZpY2F0aW9ucyBhcmUgcmVxdWlyZWQgaW4gYW5vdGhlciBwcm9qZWN0ICh3aXRoIGxp
bmsvdGl0bGUpLgo+Pj4gwqDCoCAyKSBDb21iaW5lIGFsbCB0aGUgcGF0Y2hlcyBpbiBvbmUgc2Vy
aWVzIGFuZCB0YWcgdGhlbSBkaWZmZXJlbnRseS4KPj4+IEkuZQo+Pj4gW1hFTl0gW0xJVkVQQVRD
SF0uCj4+Pgo+Pj4gMSkgaXMgcHJlZmVyYWJsZSBpZiB5b3UgaGF2ZSBhIGxvdCBvZiBwYXRjaGVz
IGluIGVhY2ggcmVwby4gMikgY2FuIGJlCj4+PiBoYW5keSBpZiB5b3UgaGF2ZSBvbmx5IGEgY291
cGxlIG9mIHBhdGNoZXMgZm9yIG9uZSByZXBvLgo+Pgo+PiAxIGlzIGFsc28gZWFzaWVyIGZvciBh
dXRvbWF0ZWQgdG9vbHMgKGxpa2UgcGF0Y2hldykgdG8gZGVhbCB3aXRoLgo+IAo+IE91dCBvZiBp
bnRlcmVzdCwgaW4gZ2VuZXJhbCBkZXZlbG9wZXIgd2lsbCB0ZW5kIHRvIGNyb3NzLXBvc3QgdGhv
c2UKPiBwYXRjaGVzLiBTbyBpbiB3aGF0IHdheSB0aGlzIHdvdWxkIG1ha2UgaXQgZWFzaWVyPwoK
SWYgeW91IGhhdmUgdHdvIHNlcGFyYXRlIHNlcmllcywgdGhlbiBwYXRjaGV3IHdpbGwgYmUgYWJs
ZSB0byBoYW5kbGUgb25lCmFuZCBub3QgaGFuZGxlIHRoZSBvdGhlci4gIElmIHRoZXkncmUgbWl4
ZWQgaW4gYSBzaW5nbGUgc2VyaWVzLCBwYXRjaGV3Cndvbid0IGJlIGFibGUgdG8gaGFuZGxlIGl0
IGF0IGFsbC4gIEF0IHRoZSBtb21lbnQgcGF0Y2hldyBkb2Vzbid0IGRvCmFueXRoaW5nIGJ1dCBn
aXZlIHlvdSBhIG5pY2UgbWJveCAvIGdpdCBicmFuY2ggdG8gcHVsbDsgYnV0IGV2ZW50dWFsbHkK
dGhlIGlkZWEgaXMgdGhhdCBpdCB3aWxsIGRvIHNvbWUgbGV2ZWwgb2YgdGVzdGluZyBhbmQgZ2l2
ZSBmZWVkYmFjawoocGF0Y2ggZG9lcy9uJ3QgYXBwbHksIHBhdGNoIGRvZXMvbid0IGJ1aWxkLCBw
YXRjaCBkb2VzL24ndCBwYXNzIHNtb2tlCnRlc3RzIC8gJmMpLgoKIC1HZW9yZ2UKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
