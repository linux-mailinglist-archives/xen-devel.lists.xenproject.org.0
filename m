Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B92EC643E8
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 10:58:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hl8Nj-0002fA-RC; Wed, 10 Jul 2019 08:55:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dFy6=VH=amazon.de=prvs=087c1bc88=nmanthey@srs-us1.protection.inumbo.net>)
 id 1hl8Nh-0002f3-NV
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 08:55:17 +0000
X-Inumbo-ID: 6f5e6caa-a2f0-11e9-8980-bc764e045a96
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6f5e6caa-a2f0-11e9-8980-bc764e045a96;
 Wed, 10 Jul 2019 08:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1562748915; x=1594284915;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=HaRuEn6Lh7i1QMxTitC5k2tc6oXbYBFqmEbRKyk702U=;
 b=ZKQ6xpeio6gmMWNk1NEp0sMVBa/pjSgV5PpddzrBqBZqlmHTaXVPMYAh
 Zq4e0StsxoTzhwX70FmWjhj5sIYw9zKPCFukxsHsTb/hfnUQezym9RPfx
 J8YCz+soqe/0Tcgzbb0oLaisuKJzBsWDmL4sttKTRcFKmjektqXSgnGEs U=;
X-IronPort-AV: E=Sophos;i="5.62,473,1554768000"; d="scan'208";a="410067030"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-119b4f96.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 10 Jul 2019 08:55:11 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-119b4f96.us-west-2.amazon.com (Postfix) with ESMTPS
 id 31BF01AA6BA; Wed, 10 Jul 2019 08:55:10 +0000 (UTC)
Received: from EX13D02EUB001.ant.amazon.com (10.43.166.150) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 10 Jul 2019 08:55:09 +0000
Received: from uc1a35a69ae4659.ant.amazon.com (10.43.161.16) by
 EX13D02EUB001.ant.amazon.com (10.43.166.150) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 10 Jul 2019 08:55:02 +0000
To: Jan Beulich <JBeulich@suse.com>
References: <1558424746-24059-1-git-send-email-nmanthey@amazon.de>
 <1558424746-24059-3-git-send-email-nmanthey@amazon.de>
 <5CE6AB600200007800231BF1@prv1-mh.provo.novell.com>
 <a7c5bda7-0759-5b15-1174-8d9e95ef06c5@amazon.de>
 <5CE7D1410200007800231F86@prv1-mh.provo.novell.com>
 <d1205382-17ff-40ac-d66d-2e6edf59364a@amazon.de>
 <627756a7-7a20-b1ae-31f2-bd7affe0e14d@suse.com>
From: Norbert Manthey <nmanthey@amazon.de>
Openpgp: preference=signencrypt
Autocrypt: addr=nmanthey@amazon.de; prefer-encrypt=mutual; keydata=
 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
 pEddsOqYwOs=
Message-ID: <7bbf3298-94d6-0b6a-9809-46f655478167@amazon.de>
Date: Wed, 10 Jul 2019 10:54:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <627756a7-7a20-b1ae-31f2-bd7affe0e14d@suse.com>
Content-Language: en-US
X-Originating-IP: [10.43.161.16]
X-ClientProxiedBy: EX13D06UWC003.ant.amazon.com (10.43.162.86) To
 EX13D02EUB001.ant.amazon.com (10.43.166.150)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH L1TF MDS GT v1 2/3] common/grant_table:
 harden bound accesses
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <JGross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 IanJackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, "wipawel@amazon.de" <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
 "Martin Mazein\(amazein\)" <amazein@amazon.de>,
 xen-devel <xen-devel@lists.xenproject.org>, Bjoern Doebel <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8xMC8xOSAwNTowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDguMDcuMjAxOSAxNDo1
OCwgTm9yYmVydCBNYW50aGV5IHdyb3RlOgo+PiBPbiA1LzI0LzE5IDEzOjEwLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+Pj4+IE9uIDI0LjA1LjE5IGF0IDExOjU0LCA8bm1hbnRoZXlAYW1hem9uLmRl
PiB3cm90ZToKPj4+PiBPbiA1LzIzLzE5IDE2OjE3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+
Pj4gT24gMjEuMDUuMTkgYXQgMDk6NDUsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+Pj4+
Pj4gLS0tIGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCj4+Pj4+PiArKysgYi94ZW4vY29tbW9u
L2dyYW50X3RhYmxlLmMKPj4+Pj4+IEBAIC05ODgsOSArOTg4LDEwIEBAIG1hcF9ncmFudF9yZWYo
Cj4+Pj4+PiAgICAgICAgICAgUElOX0ZBSUwodW5sb2NrX291dCwgR05UU1RfYmFkX2dudHJlZiwg
IkJhZCByZWYgJSN4IGZvciBkJWRcbiIsCj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgb3AtPnJl
Ziwgcmd0LT5kb21haW4tPmRvbWFpbl9pZCk7Cj4+Pj4+PiAgIAo+Pj4+Pj4gLSAgICBhY3QgPSBh
Y3RpdmVfZW50cnlfYWNxdWlyZShyZ3QsIG9wLT5yZWYpOwo+Pj4+Pj4gKyAgICAvKiBUaGlzIGNh
bGwgYWxzbyBlbnN1cmVzIHRoZSBhYm92ZSBjaGVjayBjYW5ub3QgYmUgcGFzc2VkIHNwZWN1bGF0
aXZlbHkgKi8KPj4+Pj4+ICAgICAgIHNoYWggPSBzaGFyZWRfZW50cnlfaGVhZGVyKHJndCwgb3At
PnJlZik7Cj4+Pj4+PiAgICAgICBzdGF0dXMgPSByZ3QtPmd0X3ZlcnNpb24gPT0gMSA/ICZzaGFo
LT5mbGFncyA6ICZzdGF0dXNfZW50cnkocmd0LCBvcC0+cmVmKTsKPj4+Pj4+ICsgICAgYWN0ID0g
YWN0aXZlX2VudHJ5X2FjcXVpcmUocmd0LCBvcC0+cmVmKTsKPj4+Pj4gSSBrbm93IHdlJ3ZlIGJl
ZW4gdGhlcmUgYmVmb3JlLCBidXQgd2hhdCBndWFyYW50ZWVzIHRoYXQgdGhlCj4+Pj4+IGNvbXBp
bGVyIHdvbid0IHJlbG9hZCBvcC0+cmVmIGZyb20gbWVtb3J5IGZvciBlaXRoZXIgb2YgdGhlCj4+
Pj4+IGxhdHRlciB0d28gYWNjZXNzZXM/IEluIGZhY3QgYWZhaWN0IGl0IGFsd2F5cyB3aWxsLCBk
dWUgdG8gdGhlCj4+Pj4+IG1lbW9yeSBjbG9iYmVyIGluIGFsdGVybmF0aXZlKCkuCj4+Pj4gVGhl
IGNvbXBpbGVyIGNhbiByZWxvYWQgb3AtPnJlZiBmcm9tIG1lbW9yeSwgdGhhdCBpcyBmaW5lIGhl
cmUsIGFzIHRoZQo+Pj4+IGJvdW5kIGNoZWNrIGhhcHBlbnMgYWJvdmUsIGFuZCB0aGUgc2hhcmVk
X2VudHJ5IGNhbGwgY29tZXMgd2l0aCBhbgo+Pj4+IGxmZW5jZSgpIGJ5IG5vdywgc28gdGhhdCB3
ZSB3aWxsIG5vdCBjb250aW51ZSBleGVjdXRpbmcgc3BlY3VsYXRpdmVseQo+Pj4+IHdpdGggb3At
PnJlZiBiZWluZyBvdXQtb2YtYm91bmRzLCBpbmRlcGVuZGVudGx5IG9mIHdoZXRoZXIgaXQncyBm
cm9tCj4+Pj4gbWVtb3J5IG9yIHJlZ2lzdGVycy4KPj4+IEkgZG9uJ3QgYnV5IHRoaXMgYXJndW1l
bnRhdGlvbjogSW4gcGFydGljdWxhciBpZiB0aGUgY2FjaGUgbGluZSBnb3QKPj4+IGZsdXNoZWQg
Zm9yIHdoYXRldmVyIHJlYXNvbiwgdGhlIGxvYWQgbWF5IHRha2UgYWxtb3N0IGFyYml0cmFyaWx5
Cj4+PiBsb25nLCBvcGVuaW5nIHVwIGEgbGFyZ2Ugc3BlY3VsYXRpb24gd2luZG93IGFnYWluIHVz
aW5nIHRoZQo+Pj4gZGVzdGluYXRpb24gcmVnaXN0ZXIgb2YgdGhlIGxvYWQgKHdoYXRldmVyIC0g
bm90IGJvdW5kcyBjaGVja2VkIC0KPj4+IHZhbHVlIHRoYXQgZW5kcyB1cCBob2xkaW5nKS4KPj4g
SSBhZ3JlZSwgdGhlIGdpdmVuIHByb3RlY3Rpb24gZG9lcyBub3QgZm9yY2UgdGhlIENQVSB0byBw
aWNrIHVwIHRoZQo+PiBmaXhlZCB2YWx1ZS4gQXMgeW91IGFscmVhZHkgbm90aWNlZCwgdGhlIHBy
ZXNlbnRlZCBmaXggbWlnaHQgbm90IHdvcmsgaW4KPj4gYWxsIGNhc2VzLCBidXQgaXMgYW1vbmcg
dGhlIHN1aXRhYmxlIHNvbHV0aW9ucyB3ZSBoYXZlIHRvZGF5IHRvIHByZXZlbnQKPj4gc2ltcGxl
IHVzZXIgY29udHJvbGxlZCBvdXQtb2YtYm91bmQgYWNjZXNzZXMgZHVyaW5nIHNwZWN1bGF0aW9u
LiBSZWx5aW5nCj4+IG9uIHRoZSBzdGFsZSB2YWx1ZSBvZiB0aGUgcmVnaXN0ZXIgdGhhdCBtaWdo
dCBiZSB1c2VkIGR1cmluZyBzcGVjdWxhdGlvbgo+PiBtYWtlcyBhIHBvdGVudGlhbCBvdXQtb2Yt
Ym91bmQgYWNjZXNzIG11Y2ggbW9yZSBkaWZmaWN1bHQuIEhlbmNlLCB0aGUKPj4gcHJvcG9zZWQg
c29sdXRpb24gbG9va3MgZ29vZCBlbm91Z2ggdG8gbWUuCj4gQnV0IHVzaW5nIGEgbG9jYWwgdmFy
aWFibGUgZnVydGhlciByZWR1Y2VzIHRoZSByaXNrIGFmYWljdDogRWl0aGVyCj4gdGhlIGNvbXBp
bGVyIHB1dHMgaXQgaW50byBhIHJlZ2lzdGVyLCBpbiB3aGljaCBjYXNlIHdlJ3JlIGVudGlyZWx5
Cj4gZmluZS4gT3IgaXQgcHV0cyBpdCBvbiB0aGUgc3RhY2ssIHdoaWNoIEkgYXNzdW1lIGlzIG1v
cmUgbGlrZWx5IHRvCj4gc3RheSBpbiBjYWNoZSB0aGFuIGEgcmVmZXJlbmNlIHRvIHNvbWUgb3Ro
ZXIgZGF0YSBzdHJ1Y3R1cmUgKGlpcmMKPiBhbHNvIG9uIHRoZSBzdGFjaywgYnV0IG5vdCBpbiB0
aGUgY3VycmVudCBmcmFtZSkuCklmIHlvdSB3YW50IG1lIHRvIGludHJvZHVjZSBhIGxvY2FsIHZh
cmlhYmxlLCBJIGNhbiBkbyB0aGF0LiBJIHJlbWVtYmVyCndlIGhhZCBkaXNjdXNzaW9ucyBhcm91
bmQgdGhhdCBhcyB3ZWxsLgo+Cj4+Pj4+PiBAQCAtMzg2Myw2ICszODgzLDkgQEAgc3RhdGljIGlu
dCBnbnR0YWJfZ2V0X3N0YXR1c19mcmFtZV9tZm4oc3RydWN0IGRvbWFpbiAqZCwKPj4+Pj4+ICAg
ICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+Pj4+PiAgICAgICB9Cj4+Pj4+PiAgIAo+Pj4+
Pj4gKyAgICAvKiBNYWtlIHN1cmUgaWR4IGlzIGJvdW5kZWQgd3J0IG5yX3N0YXR1c19mcmFtZXMg
Ki8KPj4+Pj4+ICsgICAgYmxvY2tfc3BlY3VsYXRpb24oKTsKPj4+Pj4+ICsKPj4+Pj4+ICAgICAg
ICptZm4gPSBfbWZuKHZpcnRfdG9fbWZuKGd0LT5zdGF0dXNbaWR4XSkpOwo+Pj4+Pj4gICAgICAg
cmV0dXJuIDA7Cj4+Pj4+PiAgIH0KPj4+Pj4gV2h5IGRvbid0IHlvdSB1c2UgYXJyYXlfaW5kZXhf
bm9zcGVjKCkgaGVyZT8gQW5kIGhvdyBjb21lCj4+Pj4gVGhlcmUgaXMgbm8gc3BlY2lmaWMgcmVh
c29uLiBJIHdpbGwgc3dhcC4KPj4+Pj4gc3BlY3VsYXRpb24gaW50byBxKCkgaXMgZmluZSBhIGZl
dyBsaW5lcyBhYm92ZT8KPj4+PiBJIGRvIG5vdCBzZWUgYSByZWFzb24gd2h5IGl0IHdvdWxkIGJl
IGJhZCB0byBlbnRlciB0aGF0IGZ1bmN0aW9uCj4+Pj4gc3BlY3VsYXRpdmVseS4gVGhlcmUgYXJl
IG5vIGFjY2Vzc2VzIHRoYXQgd291bGQgaGF2ZSB0byBiZSBwcm90ZWN0ZWQgYnkKPj4+PiBleHRy
YSBjaGVja3MsIGFmYWljdC4gT3RoZXJ3aXNlLCB0aGF0IGZ1bmN0aW9uIHNob3VsZCBiZSBwcm90
ZWN0ZWQgYnkKPj4+PiBpdHMgb3duLgo+Pj4gV2hpY2ggaW4gZmFjdCBoYXBwZW5zLCBidXQgb25s
eSBpbiBwYXRjaCAzLiBUaGlzIG1heSBiZSB3b3J0aCBzYXlpbmcKPj4+IGV4cGxpY2l0bHkgaGVy
ZS4KPj4gRG8geW91IHdhbnQgbWUgdG8gZXhwbGljaXRseSBtZW50aW9uIHRoaXMgaW4gdGhlIGNv
bW1pdCBtZXNzYWdlLCBvciBhZGQKPj4gYSBjb21tZW50IGhlcmUsIHdoaWNoIEkgaGF2ZSB0byBk
cm9wIGluIHBhdGNoIDMgYWdhaW4/IEZvciBub3csIEknZCBqdXN0Cj4+IGxlYXZlIGl0IGFzIGlz
LCBhcyB0aGUgdmVyc2lvbiBiYXNlZCBmaXhlcyBhcmUgaGFuZGxlZCBpbiB0aGUgb3RoZXIgY29t
bWl0Lgo+IEEgY29tbWl0IG1lc3NhZ2UgcmVtYXJrIHdvdWxkIGJvdGggaGVscCB1bmRlcnN0YW5k
IHRoaW5ncyBub3cgYW5kCj4gaW4gdGhlIGZ1dHVyZSwgYW5kIGF0IHRoZSBzYW1lIHRpbWUgYXZv
aWQgbWUgb3Igc29tZW9uZSBlbHNlIHJlLQo+IHJhaXNpbmcgdGhlIHF1ZXN0aW9uIG5leHQgdGlt
ZSByb3VuZCwgbm90IHRoZSBsZWFzdCBiZWNhdXNlIG9mIHRoZQo+IG5vdGljYWJsZSBnYXBzIGJl
dHdlZW4gdmVyc2lvbnMuCgpJIHdpbGwgZXh0ZW5kIHRoZSBjb21taXQgbWVzc2FnZSBhY2NvcmRp
bmdseS4KCkJlc3QsCk5vcmJlcnQKCgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1h
bnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBD
aHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJp
Y2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4KVXN0LUlE
OiBERSAyODkgMjM3IDg3OQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
