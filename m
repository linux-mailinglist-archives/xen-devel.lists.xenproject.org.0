Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A32469A12
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 19:42:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn4wV-0003bc-FE; Mon, 15 Jul 2019 17:39:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Co6f=VM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hn4wU-0003bX-80
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 17:39:14 +0000
X-Inumbo-ID: 737990b4-a727-11e9-8fc5-7be8e6520a76
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 737990b4-a727-11e9-8fc5-7be8e6520a76;
 Mon, 15 Jul 2019 17:39:10 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: u/JBkRit5XP7yvl74tHg1kfCvEnm5OePMdaR6Tzg2LTzdDM/p4lGc1p5B+l956932N7gRRLXiN
 pGUGxuh8B8SEKu1RcWNoFdYFuM1pkNrP2uSHXq0DoBA/IbQ7bZHqAIo2TR8fGuD7UDAsBJtwpm
 RcTWq0bnkIfGGeSlUGAFRRQbkPLjJmMh9u/MQCKMuDrOS8hRRcAks5MO+33iUWXkQJh3QRoSEd
 0VUecKmccu2B4Uq+4NFzFaQcxQ7O5IWEAciw29BSc/JI83RDDPameeoRRAvpXzg+HsOBmJ4zPm
 OB8=
X-SBRS: 2.7
X-MesageID: 2995352
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="2995352"
To: Andy Lutomirski <luto@kernel.org>, Andi Kleen <ak@linux.intel.com>
References: <20190715113739.17694-1-jgross@suse.com>
 <87y30zfe9z.fsf@linux.intel.com>
 <CALCETrUn=gho5Oug-yYvF2d1WYCe7gvtx+bXuhJ8LTjb9guvuA@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <bbf1ea2d-1206-eb54-3611-4c9b9fad4aa4@citrix.com>
Date: Mon, 15 Jul 2019 18:39:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CALCETrUn=gho5Oug-yYvF2d1WYCe7gvtx+bXuhJ8LTjb9guvuA@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 0/2] Remove 32-bit Xen PV guest support
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux
 Virtualization <virtualization@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Alok Kataria <akataria@vmware.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMDcvMjAxOSAxODoyOCwgQW5keSBMdXRvbWlyc2tpIHdyb3RlOgo+IE9uIE1vbiwgSnVs
IDE1LCAyMDE5IGF0IDk6MzQgQU0gQW5kaSBLbGVlbiA8YWtAbGludXguaW50ZWwuY29tPiB3cm90
ZToKPj4gSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiB3cml0ZXM6Cj4+Cj4+PiBUaGUg
bG9uZyB0ZXJtIHBsYW4gaGFzIGJlZW4gdG8gcmVwbGFjZSBYZW4gUFYgZ3Vlc3RzIGJ5IFBWSC4g
VGhlIGZpcnN0Cj4+PiB2aWN0aW0gb2YgdGhhdCBwbGFuIGFyZSBub3cgMzItYml0IFBWIGd1ZXN0
cywgYXMgdGhvc2UgYXJlIHVzZWQgb25seQo+Pj4gcmF0aGVyIHNlbGRvbSB0aGVzZSBkYXlzLiBY
ZW4gb24geDg2IHJlcXVpcmVzIDY0LWJpdCBzdXBwb3J0IGFuZCB3aXRoCj4+PiBHcnViMiBub3cg
c3VwcG9ydGluZyBQVkggb2ZmaWNpYWxseSBzaW5jZSB2ZXJzaW9uIDIuMDQgdGhlcmUgaXMgbm8K
Pj4+IG5lZWQgdG8ga2VlcCAzMi1iaXQgUFYgZ3Vlc3Qgc3VwcG9ydCBhbGl2ZSBpbiB0aGUgTGlu
dXgga2VybmVsLgo+Pj4gQWRkaXRpb25hbGx5IE1lbHRkb3duIG1pdGlnYXRpb24gaXMgbm90IGF2
YWlsYWJsZSBpbiB0aGUga2VybmVsIHJ1bm5pbmcKPj4+IGFzIDMyLWJpdCBQViBndWVzdCwgc28g
ZHJvcHBpbmcgdGhpcyBtb2RlIG1ha2VzIHNlbnNlIGZyb20gc2VjdXJpdHkKPj4+IHBvaW50IG9m
IHZpZXcsIHRvby4KPj4gTm9ybWFsbHkgd2UgaGF2ZSBhIGRlcHJlY2F0aW9uIHBlcmlvZCBmb3Ig
ZmVhdHVyZSByZW1vdmFscyBsaWtlIHRoaXMuCj4+IFlvdSB3b3VsZCBtYWtlIHRoZSBrZXJuZWwg
cHJpbnQgYSB3YXJuaW5nIGZvciBzb21lIHJlbGVhc2VzLCBhbmQgd2hlbgo+PiBubyB1c2VyIGNv
bXBsYWlucyB5b3UgY2FuIHRoZW4gcmVtb3ZlLiBJZiBhIHVzZXIgY29tcGxhaW5zIHlvdSBjYW4n
dC4KPj4KPiBBcyBJIHVuZGVyc3RhbmQgaXQsIHRoZSBrZXJuZWwgcnVsZXMgZG8gYWxsb3cgY2hh
bmdlcyBsaWtlIHRoaXMgZXZlbgo+IGlmIHRoZXJlJ3MgYSBjb21wbGFpbnQ6IHRoaXMgaXMgYSBw
YXRjaCB0aGF0IHJlbW92ZXMgd2hhdCBpcwo+IGVmZmVjdGl2ZWx5IGhhcmR3YXJlIHN1cHBvcnQu
ICBJZiB0aGUgbWFpbnRlbmFuY2UgY29zdCBleGNlZWRzIHRoZQo+IHZhbHVlLCB0aGVuIHJlbW92
YWwgaXMgZmFpciBnYW1lLiAgKE9idmlvdXNseSB3ZSB3ZWlnaHQgdGhlIHZhbHVlIHRvCj4gcHJl
c2VydmluZyBjb21wYXRpYmlsaXR5IHF1aXRlIGhpZ2hseSwgYnV0IGluIHRoaXMgY2FzZSwgWGVu
IGRyb3BwZWQKPiAzMi1iaXQgaGFyZHdhcmUgc3VwcG9ydCBhIGxvbmcgdGltZSBhZ28uICBJZiB0
aGUgWGVuIGh5cGVydmlzb3Igc2F5cwo+IHRoYXQgMzItYml0IFBWIGd1ZXN0IHN1cHBvcnQgaXMg
ZGVwcmVjYXRlZCwgaXQncyBkZXByZWNhdGVkLikKPgo+IFRoYXQgYmVpbmcgc2FpZCwgYSB3YXJu
aW5nIG1pZ2h0IG5vdCBiZSBhIGJhZCBpZGVhLiAgV2hhdCdzIHRoZQo+IGN1cnJlbnQgc3RhdHVz
IG9mIHRoaXMgaW4gdXBzdHJlYW0gWGVuPwoKU28gcGVyc29uYWxseSwgSSdkIHByZWZlciB0byBz
ZWUgc3VwcG9ydCBzdGF5LCBidXQgYXQgdGhlIGVuZCBvZiB0aGUgZGF5Cml0IGlzIEp1ZXJnZW4n
cyBjaG9pY2UgYXMgdGhlIG1haW50YWluZXIgb2YgdGhlIGNvZGUuCgpYZW4gaXRzZWxmIGhhcyBi
ZWVuIGV4Y2x1c2l2ZWx5IDY0LWJpdCBzaW5jZSBYZW4gNC4zIChyZWxlYXNlZCBpbiAyMDEzKS4K
Ck92ZXIgdGltZSwgdmFyaW91cyBmZWF0dXJlcyBsaWtlIFNNRVAvU01BUCBoYXZlIGJlZW4gbWFr
aW5nIDMyYml0IFBWCmd1ZXN0cyBwcm9ncmVzc2l2ZWx5IHNsb3dlciwgYmVjYXVzZSByaW5nIDEg
aXMgc3VwZXJ2aXNvciByYXRoZXIgdGhhbgp1c2VyLsKgIFRoaW5ncyBoYXZlIGdvdCBldmVuIHdv
cnNlIHdpdGggSUJSUywgdG8gdGhlIHBvaW50IGF0IHdoaWNoIDMyYml0ClBWIGd1ZXN0cyBhcmUg
c3RhcnRpbmcgdG8gcnVuIGxpa2UgdHJlYWNsZS4KClRoZXJlIGFyZSBubyBjdXJyZW50IHBsYW5z
IHRvIHJlbW92ZSBzdXBwb3J0IGZvciAzMmJpdCBQViBndWVzdHMgZnJvbQpYZW4sIGJ1dCBpdCBp
cyB2ZXJ5IG11Y2ggaW4gdGhlIGNhdGVnb3J5IG9mICJ5b3Ugc2hvdWxkbid0IGJlIHVzaW5nIHRo
aXMKbW9kZSBhbnkgbW9yZSIuCgp+QW5kcmV3CgpQLlMuIEkgZG9uJ3Qgc2VlIDY0Yml0IFBWIGd1
ZXN0IHN1cHBvcnQgZ29pbmcgYW55d2hlcmUsIGJlY2F1c2UgdGhlcmUKYXJlIHN0aWxsIGEgbnVt
YmVyIG9mIG9wZW4gcGVyZm9ybWFuY2UgcXVlc3Rpb25zIGR1ZSB0byB0aGUgaW5oZXJlbnQKZGlm
ZmVyZW5jZXMgYmV0d2VlbiBzeXNjYWxsIGFuZCB2bWV4aXQsIGFuZCB0aGUgZGlmZmVyZW5jZSBF
UFQvTlBUCnRhYmxlcyBtYWtlIG9uIGNyb3NzLWRvbWFpbiBtYXBwaW5ncy4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
