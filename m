Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9560161F2E
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 15:01:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkTE4-0004iV-3b; Mon, 08 Jul 2019 12:58:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JLYo=VF=amazon.de=prvs=08506611a=nmanthey@srs-us1.protection.inumbo.net>)
 id 1hkTE2-0004iQ-IY
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 12:58:34 +0000
X-Inumbo-ID: 15bfe2d6-a180-11e9-b6b6-5b549273a286
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15bfe2d6-a180-11e9-b6b6-5b549273a286;
 Mon, 08 Jul 2019 12:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1562590710; x=1594126710;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=GoRMmG+bVRZ+y572BxnCq+4f3ASbKvz2bQnmUSM/0E0=;
 b=GaQD3Ks6+mAXT2HvaFoIikZ6izUpMkbSr4uJ1dtfCtXJHA+PlDYWJaV9
 9+7WcWCNWmyg0i6E/mKkFwBRbwpSnllRIzmRZL5wk+UzQxWqYF9SUkDjK
 TN5SPv6sSrFfjNiu5YajK4I+VsqCC9ryYEJiYemyktPBff+LVtyk3Ge5o 0=;
X-IronPort-AV: E=Sophos;i="5.62,466,1554768000"; d="scan'208";a="809940466"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1e-57e1d233.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 08 Jul 2019 12:58:27 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-57e1d233.us-east-1.amazon.com (Postfix) with ESMTPS
 id 69CB91416F8; Mon,  8 Jul 2019 12:58:24 +0000 (UTC)
Received: from EX13D02EUB001.ant.amazon.com (10.43.166.150) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 8 Jul 2019 12:58:23 +0000
Received: from uc1a35a69ae4659.ant.amazon.com (10.43.160.177) by
 EX13D02EUB001.ant.amazon.com (10.43.166.150) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 8 Jul 2019 12:58:17 +0000
To: Jan Beulich <JBeulich@suse.com>
References: <1558424746-24059-1-git-send-email-nmanthey@amazon.de>
 <1558424746-24059-3-git-send-email-nmanthey@amazon.de>
 <5CE6AB600200007800231BF1@prv1-mh.provo.novell.com>
 <a7c5bda7-0759-5b15-1174-8d9e95ef06c5@amazon.de>
 <5CE7D1410200007800231F86@prv1-mh.provo.novell.com>
From: Norbert Manthey <nmanthey@amazon.de>
Openpgp: preference=signencrypt
Autocrypt: addr=nmanthey@amazon.de; prefer-encrypt=mutual; keydata=
 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
 pEddsOqYwOs=
Message-ID: <d1205382-17ff-40ac-d66d-2e6edf59364a@amazon.de>
Date: Mon, 8 Jul 2019 14:58:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <5CE7D1410200007800231F86@prv1-mh.provo.novell.com>
Content-Language: en-US
X-Originating-IP: [10.43.160.177]
X-ClientProxiedBy: EX13D04UWB004.ant.amazon.com (10.43.161.103) To
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de,
 Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
 "Martin Mazein\(amazein\)" <amazein@amazon.de>,
 xen-devel <xen-devel@lists.xenproject.org>, Bjoern Doebel <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LiBJIHRyeSB0byBwaWNrIHVwIHdoZXJlIHdlIGxlZnQg
dGhlIGRpc2N1c3Npb24KdGhlIGxhc3QgdGltZS4KCk9uIDUvMjQvMTkgMTM6MTAsIEphbiBCZXVs
aWNoIHdyb3RlOgo+Pj4+IE9uIDI0LjA1LjE5IGF0IDExOjU0LCA8bm1hbnRoZXlAYW1hem9uLmRl
PiB3cm90ZToKPj4gT24gNS8yMy8xOSAxNjoxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBP
biAyMS4wNS4xOSBhdCAwOTo0NSwgPG5tYW50aGV5QGFtYXpvbi5kZT4gd3JvdGU6Cj4+Pj4gR3Vl
c3RzIGNhbiBpc3N1ZSBncmFudCB0YWJsZSBvcGVyYXRpb25zIGFuZCBwcm92aWRlIGd1ZXN0IGNv
bnRyb2xsZWQKPj4+PiBkYXRhIHRvIHRoZW0uIFRoaXMgZGF0YSBpcyB1c2VkIGFzIGluZGV4IGZv
ciBtZW1vcnkgbG9hZHMgYWZ0ZXIgYm91bmQKPj4+PiBjaGVja3MgaGF2ZSBiZWVuIGRvbmUuIFRv
IGF2b2lkIHNwZWN1bGF0aXZlIG91dC1vZi1ib3VuZCBhY2Nlc3Nlcywgd2UKPj4+PiB1c2UgdGhl
IGFycmF5X2luZGV4X25vc3BlYyBtYWNybyB3aGVyZSBhcHBsaWNhYmxlLCBvciB0aGUgbWFjcm8K
Pj4+PiBibG9ja19zcGVjdWxhdGlvbi4gTm90ZSwgdGhhdCB0aGUgYmxvY2tfc3BlY3VsYXRpb24g
aXMgYWx3YXlzIHVzZWQgaW4KPj4+IHMvYWx3YXlzL2FscmVhZHkvID8KPj4gVGhleSBib3RoIHdv
cmssIGJ1dCB0aGUgJ2Fsd2F5cycgdW5kZXJsaW5lcyB0aGF0IGEgY2FsbGVyIGNhbiByZWx5IG9u
Cj4+IHRoZSBmYWN0IHRoYXQgdGhpcyB3aWxsIGhhcHBlbiBvbiBhbGwgZXhlY3V0aW9uIHBhdGgg
b2YgdGhhdCBmdW5jdGlvbi4KPj4gSGVuY2UsIEkgbGlrZSB0byBzdGljayB0byAnYWx3YXlzJyBo
ZXJlLgo+IFdlbGwsIEknbSBub3QgYSBuYXRpdmUgc3BlYWtlciwgYnV0IHRvIG1lICJhbHdheXMi
IGRvZXNuJ3QgZXhwcmVzcwo+IHdoYXQgeW91IHdhbnQgdG8gZXhwcmVzcyBoZXJlLiBXaGF0IHlv
dSBtZWFuIEknZCB3b3JkICIuLi4gaXMgdXNlZAo+IG9uIGFsbCBwYXRocyBvZiAuLi4iCkkgd2ls
bCByZXBocmFzZSBhY2NvcmRpbmdseS4KPgo+Pj4+IHRoZSBjYWxscyB0byBzaGFyZWRfZW50cnlf
aGVhZGVyIGFuZCBucl9ncmFudF9lbnRyaWVzLCBzbyB0aGF0IG5vCj4+Pj4gYWRkaXRpb25hbCBw
cm90ZWN0aW9uIGlzIHJlcXVpcmVkIG9uY2UgdGhlc2UgZnVuY3Rpb25zIGhhdmUgYmVlbgo+Pj4+
IGNhbGxlZC4KPiBBcyBhbiBhc2lkZSwgeW91ciB1c2Ugb2YgImluIHRoZSBjYWxscyB0byIgbG9v
a3MgYWxzbyBtaXNsZWFkaW5nIHRvIG1lLAo+IGJlY2F1c2UgdGhlIGZlbmNlcyBzaXQgaW4gdGhl
IGZ1bmN0aW9ucywgbm90IGF0IHRoZSBjYWxsIHNpdGVzLgpXaWxsIGZpeC4KPgo+Pj4+IC0tLSBh
L3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwo+Pj4+ICsrKyBiL3hlbi9jb21tb24vZ3JhbnRfdGFi
bGUuYwo+Pj4+IEBAIC05ODgsOSArOTg4LDEwIEBAIG1hcF9ncmFudF9yZWYoCj4+Pj4gICAgICAg
ICAgUElOX0ZBSUwodW5sb2NrX291dCwgR05UU1RfYmFkX2dudHJlZiwgIkJhZCByZWYgJSN4IGZv
ciBkJWRcbiIsCj4+Pj4gICAgICAgICAgICAgICAgICAgb3AtPnJlZiwgcmd0LT5kb21haW4tPmRv
bWFpbl9pZCk7Cj4+Pj4gIAo+Pj4+IC0gICAgYWN0ID0gYWN0aXZlX2VudHJ5X2FjcXVpcmUocmd0
LCBvcC0+cmVmKTsKPj4+PiArICAgIC8qIFRoaXMgY2FsbCBhbHNvIGVuc3VyZXMgdGhlIGFib3Zl
IGNoZWNrIGNhbm5vdCBiZSBwYXNzZWQgc3BlY3VsYXRpdmVseSAqLwo+Pj4+ICAgICAgc2hhaCA9
IHNoYXJlZF9lbnRyeV9oZWFkZXIocmd0LCBvcC0+cmVmKTsKPj4+PiAgICAgIHN0YXR1cyA9IHJn
dC0+Z3RfdmVyc2lvbiA9PSAxID8gJnNoYWgtPmZsYWdzIDogJnN0YXR1c19lbnRyeShyZ3QsIG9w
LT5yZWYpOwo+Pj4+ICsgICAgYWN0ID0gYWN0aXZlX2VudHJ5X2FjcXVpcmUocmd0LCBvcC0+cmVm
KTsKPj4+IEkga25vdyB3ZSd2ZSBiZWVuIHRoZXJlIGJlZm9yZSwgYnV0IHdoYXQgZ3VhcmFudGVl
cyB0aGF0IHRoZQo+Pj4gY29tcGlsZXIgd29uJ3QgcmVsb2FkIG9wLT5yZWYgZnJvbSBtZW1vcnkg
Zm9yIGVpdGhlciBvZiB0aGUKPj4+IGxhdHRlciB0d28gYWNjZXNzZXM/IEluIGZhY3QgYWZhaWN0
IGl0IGFsd2F5cyB3aWxsLCBkdWUgdG8gdGhlCj4+PiBtZW1vcnkgY2xvYmJlciBpbiBhbHRlcm5h
dGl2ZSgpLgo+PiBUaGUgY29tcGlsZXIgY2FuIHJlbG9hZCBvcC0+cmVmIGZyb20gbWVtb3J5LCB0
aGF0IGlzIGZpbmUgaGVyZSwgYXMgdGhlCj4+IGJvdW5kIGNoZWNrIGhhcHBlbnMgYWJvdmUsIGFu
ZCB0aGUgc2hhcmVkX2VudHJ5IGNhbGwgY29tZXMgd2l0aCBhbgo+PiBsZmVuY2UoKSBieSBub3cs
IHNvIHRoYXQgd2Ugd2lsbCBub3QgY29udGludWUgZXhlY3V0aW5nIHNwZWN1bGF0aXZlbHkKPj4g
d2l0aCBvcC0+cmVmIGJlaW5nIG91dC1vZi1ib3VuZHMsIGluZGVwZW5kZW50bHkgb2Ygd2hldGhl
ciBpdCdzIGZyb20KPj4gbWVtb3J5IG9yIHJlZ2lzdGVycy4KPiBJIGRvbid0IGJ1eSB0aGlzIGFy
Z3VtZW50YXRpb246IEluIHBhcnRpY3VsYXIgaWYgdGhlIGNhY2hlIGxpbmUgZ290Cj4gZmx1c2hl
ZCBmb3Igd2hhdGV2ZXIgcmVhc29uLCB0aGUgbG9hZCBtYXkgdGFrZSBhbG1vc3QgYXJiaXRyYXJp
bHkKPiBsb25nLCBvcGVuaW5nIHVwIGEgbGFyZ2Ugc3BlY3VsYXRpb24gd2luZG93IGFnYWluIHVz
aW5nIHRoZQo+IGRlc3RpbmF0aW9uIHJlZ2lzdGVyIG9mIHRoZSBsb2FkICh3aGF0ZXZlciAtIG5v
dCBib3VuZHMgY2hlY2tlZCAtCj4gdmFsdWUgdGhhdCBlbmRzIHVwIGhvbGRpbmcpLgpJIGFncmVl
LCB0aGUgZ2l2ZW4gcHJvdGVjdGlvbiBkb2VzIG5vdCBmb3JjZSB0aGUgQ1BVIHRvIHBpY2sgdXAg
dGhlCmZpeGVkIHZhbHVlLiBBcyB5b3UgYWxyZWFkeSBub3RpY2VkLCB0aGUgcHJlc2VudGVkIGZp
eCBtaWdodCBub3Qgd29yayBpbgphbGwgY2FzZXMsIGJ1dCBpcyBhbW9uZyB0aGUgc3VpdGFibGUg
c29sdXRpb25zIHdlIGhhdmUgdG9kYXkgdG8gcHJldmVudApzaW1wbGUgdXNlciBjb250cm9sbGVk
IG91dC1vZi1ib3VuZCBhY2Nlc3NlcyBkdXJpbmcgc3BlY3VsYXRpb24uIFJlbHlpbmcKb24gdGhl
IHN0YWxlIHZhbHVlIG9mIHRoZSByZWdpc3RlciB0aGF0IG1pZ2h0IGJlIHVzZWQgZHVyaW5nIHNw
ZWN1bGF0aW9uCm1ha2VzIGEgcG90ZW50aWFsIG91dC1vZi1ib3VuZCBhY2Nlc3MgbXVjaCBtb3Jl
IGRpZmZpY3VsdC4gSGVuY2UsIHRoZQpwcm9wb3NlZCBzb2x1dGlvbiBsb29rcyBnb29kIGVub3Vn
aCB0byBtZS4KPgo+Pj4+IEBAIC0zODYzLDYgKzM4ODMsOSBAQCBzdGF0aWMgaW50IGdudHRhYl9n
ZXRfc3RhdHVzX2ZyYW1lX21mbihzdHJ1Y3QgZG9tYWluICpkLAo+Pj4+ICAgICAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKPj4+PiAgICAgIH0KPj4+PiAgCj4+Pj4gKyAgICAvKiBNYWtlIHN1cmUg
aWR4IGlzIGJvdW5kZWQgd3J0IG5yX3N0YXR1c19mcmFtZXMgKi8KPj4+PiArICAgIGJsb2NrX3Nw
ZWN1bGF0aW9uKCk7Cj4+Pj4gKwo+Pj4+ICAgICAgKm1mbiA9IF9tZm4odmlydF90b19tZm4oZ3Qt
PnN0YXR1c1tpZHhdKSk7Cj4+Pj4gICAgICByZXR1cm4gMDsKPj4+PiAgfQo+Pj4gV2h5IGRvbid0
IHlvdSB1c2UgYXJyYXlfaW5kZXhfbm9zcGVjKCkgaGVyZT8gQW5kIGhvdyBjb21lCj4+IFRoZXJl
IGlzIG5vIHNwZWNpZmljIHJlYXNvbi4gSSB3aWxsIHN3YXAuCj4+PiBzcGVjdWxhdGlvbiBpbnRv
IHEoKSBpcyBmaW5lIGEgZmV3IGxpbmVzIGFib3ZlPwo+PiBJIGRvIG5vdCBzZWUgYSByZWFzb24g
d2h5IGl0IHdvdWxkIGJlIGJhZCB0byBlbnRlciB0aGF0IGZ1bmN0aW9uCj4+IHNwZWN1bGF0aXZl
bHkuIFRoZXJlIGFyZSBubyBhY2Nlc3NlcyB0aGF0IHdvdWxkIGhhdmUgdG8gYmUgcHJvdGVjdGVk
IGJ5Cj4+IGV4dHJhIGNoZWNrcywgYWZhaWN0LiBPdGhlcndpc2UsIHRoYXQgZnVuY3Rpb24gc2hv
dWxkIGJlIHByb3RlY3RlZCBieQo+PiBpdHMgb3duLgo+IFdoaWNoIGluIGZhY3QgaGFwcGVucywg
YnV0IG9ubHkgaW4gcGF0Y2ggMy4gVGhpcyBtYXkgYmUgd29ydGggc2F5aW5nCj4gZXhwbGljaXRs
eSBoZXJlLgoKRG8geW91IHdhbnQgbWUgdG8gZXhwbGljaXRseSBtZW50aW9uIHRoaXMgaW4gdGhl
IGNvbW1pdCBtZXNzYWdlLCBvciBhZGQKYSBjb21tZW50IGhlcmUsIHdoaWNoIEkgaGF2ZSB0byBk
cm9wIGluIHBhdGNoIDMgYWdhaW4/IEZvciBub3csIEknZCBqdXN0CmxlYXZlIGl0IGFzIGlzLCBh
cyB0aGUgdmVyc2lvbiBiYXNlZCBmaXhlcyBhcmUgaGFuZGxlZCBpbiB0aGUgb3RoZXIgY29tbWl0
LgoKQmVzdCwKTm9yYmVydAoKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBH
bWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlz
dGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQg
Q2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERF
IDI4OSAyMzcgODc5CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
