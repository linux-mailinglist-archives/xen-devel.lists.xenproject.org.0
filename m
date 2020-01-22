Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79529145CEA
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 21:11:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuMIE-0004fK-F9; Wed, 22 Jan 2020 20:08:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TTyG=3L=amazon.com=prvs=2835880c2=anchalag@srs-us1.protection.inumbo.net>)
 id 1iuMIC-0004fF-Hs
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 20:08:00 +0000
X-Inumbo-ID: dd9b5a10-3d52-11ea-b833-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd9b5a10-3d52-11ea-b833-bc764e2007e4;
 Wed, 22 Jan 2020 20:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579723671; x=1611259671;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ueX0G7wIXquYs+8WYX9TErA6JaqRVAVxKMvnUG5/Yoo=;
 b=LiJj9BVlaLYBKzgt6NUbhpX9m9fAnS839vX9L2Q5VLxLDZT4qDSPDNRd
 MnFt7E1BxaENliYqt0rTiyIgdnHZGfvYTDCe5RtHb6nSkVnn3xYLRmqvX
 CRDItgE3iQg8LE6wgxTEWo0ligIBXQTjBZc1fIOMetlm8sC7mP2HTvM0h I=;
IronPort-SDR: Xn8mshXB0Ao/qFRS4wJxFHAsfw6z7a6GBgtyZHvuY4eA8gMw2T1rrcekTeYFCht0KkS6ClcY/i
 qeTvoquzNZiA==
X-IronPort-AV: E=Sophos;i="5.70,350,1574121600"; d="scan'208";a="21818317"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-c5104f52.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 22 Jan 2020 20:07:28 +0000
Received: from EX13MTAUEB002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-c5104f52.us-west-2.amazon.com (Postfix) with ESMTPS
 id BEDB6A1E0B; Wed, 22 Jan 2020 20:07:26 +0000 (UTC)
Received: from EX13D08UEB002.ant.amazon.com (10.43.60.107) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 22 Jan 2020 20:07:10 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D08UEB002.ant.amazon.com (10.43.60.107) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 22 Jan 2020 20:07:10 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Wed, 22 Jan 2020 20:07:10 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 3816740F17; Wed, 22 Jan 2020 20:07:10 +0000 (UTC)
Date: Wed, 22 Jan 2020 20:07:10 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Message-ID: <20200122200710.GA3071@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
References: <20200107234526.GA19034@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200108105011.GY2827@hirez.programming.kicks-ass.net>
 <20200110153520.GC8214@u40b0340c692b58f6553c.ant.amazon.com>
 <20200113101609.GT2844@hirez.programming.kicks-ass.net>
 <857b42b2e86b2ae09a23f488daada3b1b2836116.camel@amazon.com>
 <20200113124247.GG2827@hirez.programming.kicks-ass.net>
 <CAJZ5v0jv+5aLY3N4wFSitu61o9S8tJWEWGGn1Xyw-P82_TwFdQ@mail.gmail.com>
 <CAJZ5v0imNbbch=NWAdgVKf_hjwRrEiWAL8SFNwe6rW_SjgYzrw@mail.gmail.com>
 <20200114192952.GA26755@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200114192952.GA26755@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: Re: [Xen-devel] [RFC PATCH V2 11/11] x86: tsc: avoid system
 instability in hibernation
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Kamata, Munehisa" <kamatam@amazon.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>, "Valentin,
 Eduardo" <eduval@amazon.com>, "x86@kernel.org" <x86@kernel.org>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Singh,
 Balbir" <sblbir@amazon.com>, "len.brown@intel.com" <len.brown@intel.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, anchalag@amazon.com,
 "bp@alien8.de" <bp@alien8.de>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "axboe@kernel.dk" <axboe@kernel.dk>,
 "konrad.wilk@oracle.co" <konrad.wilk@oracle.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "fllinden@amaozn.com" <fllinden@amazon.com>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>, "Woodhouse, 
 David" <dwmw@amazon.co.uk>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMTQsIDIwMjAgYXQgMDc6Mjk6NTJQTSArMDAwMCwgQW5jaGFsIEFnYXJ3YWwg
d3JvdGU6Cj4gT24gVHVlLCBKYW4gMTQsIDIwMjAgYXQgMTI6MzA6MDJBTSArMDEwMCwgUmFmYWVs
IEouIFd5c29ja2kgd3JvdGU6Cj4gPiBPbiBNb24sIEphbiAxMywgMjAyMCBhdCAxMDo1MCBQTSBS
YWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBP
biBNb24sIEphbiAxMywgMjAyMCBhdCAxOjQzIFBNIFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5m
cmFkZWFkLm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBNb24sIEphbiAxMywgMjAyMCBh
dCAxMTo0MzoxOEFNICswMDAwLCBTaW5naCwgQmFsYmlyIHdyb3RlOgo+ID4gPiA+ID4gRm9yIHlv
dXIgb3JpZ2luYWwgY29tbWVudCwganVzdCB3YW50ZWQgdG8gY2xhcmlmeSB0aGUgZm9sbG93aW5n
Ogo+ID4gPiA+ID4KPiA+ID4gPiA+IDEuIEFmdGVyIGhpYmVybmF0aW9uLCB0aGUgbWFjaGluZSBj
YW4gYmUgcmVzdW1lZCBvbiBhIGRpZmZlcmVudCBidXQgY29tcGF0aWJsZQo+ID4gPiA+ID4gaG9z
dCAodGhlc2UgYXJlIFZNIGltYWdlcyBoaWJlcm5hdGVkKQo+ID4gPiA+ID4gMi4gVGhpcyBtZWFu
cyB0aGUgY2xvY2sgYmV0d2VlbiBob3N0MSBhbmQgaG9zdDIgY2FuL3dpbGwgYmUgZGlmZmVyZW50
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSW4geW91ciBjb21tZW50cyBhcmUgeW91IG1ha2luZyB0aGUg
YXNzdW1wdGlvbiB0aGF0IHRoZSBob3N0KHMpIGlzL2FyZSB0aGUKPiA+ID4gPiA+IHNhbWU/IEp1
c3QgY2hlY2tpbmcgdGhlIGFzc3VtcHRpb25zIGJlaW5nIG1hZGUgYW5kIGJlaW5nIG9uIHRoZSBz
YW1lIHBhZ2Ugd2l0aAo+ID4gPiA+ID4gdGhlbS4KPiA+ID4gPgo+ID4gPiA+IEkgd291bGQgZXhw
ZWN0IHRoaXMgdG8gYmUgdGhlIHNhbWUgcHJvYmxlbSB3ZSBoYXZlIGFzIHJlZ3VsYXIgc3VzcGVu
ZCwKPiA+ID4gPiBhZnRlciBwb3dlciBvZmYgdGhlIFRTQyB3aWxsIGhhdmUgYmVlbiByZXNldCwg
c28gcmVzdW1lIHdpbGwgaGF2ZSB0bwo+ID4gPiA+IHNvbWVob3cgYnJpZGdlIHRoYXQgZ2FwLiBJ
J3ZlIG5vIGlkZWEgaWYvaG93IGl0IGRvZXMgdGhhdC4KPiA+ID4KPiA+ID4gSW4gZ2VuZXJhbCwg
dGhpcyBpcyBkb25lIGJ5IHRpbWVrZWVwaW5nX3Jlc3VtZSgpIGFuZCB0aGUgb25seSBzcGVjaWFs
Cj4gPiA+IHRoaW5nIGRvbmUgZm9yIHRoZSBUU0MgYXBwZWFycyB0byBiZSB0aGUgdHNjX3Zlcmlm
eV90c2NfYWRqdXN0KHRydWUpCj4gPiA+IGNhbGwgaW4gdHNjX3Jlc3VtZSgpLgo+ID4gCj4gPiBB
bmQgSSBmb3Jnb3QgYWJvdXQgdHNjX3Jlc3RvcmVfc2NoZWRfY2xvY2tfc3RhdGUoKSB0aGF0IGdl
dHMgY2FsbGVkCj4gPiB2aWEgcmVzdG9yZV9wcm9jZXNzb3Jfc3RhdGUoKSBvbiB4ODYsIGJlZm9y
ZSBjYWxsaW5nCj4gPiB0aW1la2VlcGluZ19yZXN1bWUoKS4KPiA+Cj4gSW4gdGhpcyBjYXNlIHRz
Y192ZXJpZnlfdHNjX2FkanVzdCh0cnVlKSB0aGlzIGRvZXMgbm90aGluZyBhcwo+IGZlYXR1cmUg
Yml0IFg4Nl9GRUFUVVJFX1RTQ19BREpVU1QgaXMgbm90IGF2YWlsYWJsZSB0byBndWVzdC4gCj4g
SSBhbSBubyBleHBlcnQgaW4gdGhpcyBhcmVhLCBidXQgY291bGQgdGhpcyBiZSBtZXNzaW5nIHRo
aW5ncyB1cD8KPiAKPiBUaGFua3MsCj4gQW5jaGFsCkdlbnRsZSBudWRnZSBvbiB0aGlzLiBJIHdp
bGwgYWRkIG1vcmUgZGF0YSBoZXJlIGluIGNhc2UgdGhhdCBoZWxwcy4KCjEuIEJlZm9yZSB0aGlz
IHBhdGNoLCB0c2MgaXMgc3RhYmxlIGJ1dCBoaWJlcm5hdGlvbiBkb2VzIG5vdCB3b3JrCjEwMCUg
b2YgdGhlIHRpbWUuIEkgYWdyZWUgaWYgdHNjIGlzIHN0YWJsZSBpdCBzaG91bGQgbm90IGJlIG1h
cmtlZAp1bnN0YWJsZSBob3dldmVyLCBpbiB0aGlzIGNhc2UgaWYgSSBydW4gYSBjcHUgaW50ZW5z
aXZlIHdvcmtsb2FkCmluIHRoZSBiYWNrZ3JvdW5kIGFuZCB0cmlnZ2VyIHJlYm9vdC1oaWJlcm5h
dGlvbiBsb29wIEkgc2VlIGEgCndvcmtxdWV1ZSBsb2NrdXAuIAoKMi4gVGhlIGxvY2t1cCBkb2Vz
IG5vdCBob3NlIHRoZSBzeXN0ZW0gY29tcGxldGVseSwKdGhlIHJlYm9vdC1oaWJlcm5hdGlvbiBj
YXJyaWVzIG91dCBhbmQgc3lzdGVtIHJlY292ZXJzLiAKSG93ZXZlciwgYXMgbWVudGlvbmVkIGlu
IHRoZSBjb21taXQgbWVzc2FnZSBzeXN0ZW0gZG9lcyAKYmVjb21lIHVucmVhY2hhYmxlIGZvciBj
b3VwbGUgb2Ygc2Vjb25kcy4KCjMuIFhlbiBzdXNwZW5kL3Jlc3VtZSBzZWVtcyB0byBzYXZlL3Jl
c3RvcmUgdGltZV9tZW1vcnkgYXJlYSBpbiBpdHMKeGVuX2FyY2hfcHJlX3N1c3BlbmQgYW5kIHhl
bl9hcmNoX3Bvc3Rfc3VzcGVuZC4gVGhlIHhlbiBjbG9jayB2YWx1ZQppcyBzYXZlZC4geGVuX3Nj
aGVkX2Nsb2NrX29mZnNldCBpcyBzZXQgYXQgcmVzdW1lIHRpbWUgdG8gZW5zdXJlIGEKbW9ub3Rv
bmljIGNsb2NrIHZhbHVlCgo0LiBBbHNvLCB0aGUgaW5zdGFuY2VzIGRvIG5vdCBoYXZlIEludmFy
aWFudFRTQyBleHBvc2VkLiBGZWF0dXJlIGJpdApYODZfRkVBVFVSRV9UU0NfQURKVVNUIGlzIG5v
dCBhdmFpbGFibGUgdG8gZ3Vlc3QgYW5kIHhlbiBjbG9ja3NvdXJjZQppcyB1c2VkIGJ5IGd1ZXN0
cy4KCkkgYW0gbm90IHN1cmUgaWYgc29tZXRoaW5nIG5lZWRzIHRvIGJlIGZpeGVkIG9uIGhpYmVy
bmF0ZSBwYXRoIGl0c2VsZgpvciBpdHMgdmVyeSBtdWNoIHRpZXMgdG8gdGltZSBoYW5kbGluZyBv
biB4ZW4gZ3Vlc3QgaGliZXJuYXRpb24KCkhlcmUgaXMgYSBwYXJ0IG9mIGxvZyBmcm9tIGxhc3Qg
aGliZXJuYXRpb24gZXhpdCB0byBuZXh0IGhpYmVybmF0aW9uCmVudHJ5LiBUaGUgbG9vcCB3YXMg
cnVubmluZyBmb3IgYSB3aGlsZSBzbyBib290IHRvIGxvY2t1cCBsb2cgd2lsbCBiZQpodWdlLiBJ
IGFtIHNwZWNpZmljYWxseSBpbmNsdWRpbmcgdGhlIHRpbWVzdGFtcHMuCgouLi4KMDFoIDU3bSAx
NS42MjdzKCAgMTZtcyk6IFsgICAgNS44MjI3MDFdIE9PTSBraWxsZXIgZW5hYmxlZC4KMDFoIDU3
bSAxNS42MjdzKCAgIDBtcyk6IFsgICAgNS44MjQ5ODFdIFJlc3RhcnRpbmcgdGFza3MgLi4uIGRv
bmUuCjAxaCA1N20gMTUuNjI3cyggICAwbXMpOiBbICAgIDUuODM2Mzk3XSBQTTogaGliZXJuYXRp
b24gZXhpdAowMWggNTdtIDE3LjYzNnMoMjAwOW1zKTogWyAgICA3Ljg0NDQ3MV0gUE06IGhpYmVy
bmF0aW9uIGVudHJ5CjAxaCA1N20gNTIuNzI1cygzNTA4OW1zKTogWyAgIDQyLjkzNDU0Ml0gQlVH
OiB3b3JrcXVldWUgbG9ja3VwIC0gcG9vbCBjcHVzPTAKbm9kZT0wIGZsYWdzPTB4MCBuaWNlPTAg
c3R1Y2sgZm9yIDM3cyEKMDFoIDU3bSA1Mi43MzBzKCAgIDVtcyk6IFsgICA0Mi45NDE0NjhdIFNo
b3dpbmcgYnVzeSB3b3JrcXVldWVzIGFuZCB3b3JrZXIKcG9vbHM6CjAxaCA1N20gNTIuNzM0cygg
ICA0bXMpOiBbICAgNDIuOTQ1MDg4XSB3b3JrcXVldWUgZXZlbnRzOiBmbGFncz0weDAKMDFoIDU3
bSA1Mi43MzdzKCAgIDNtcyk6IFsgICA0Mi45NDgzODVdICAgcHdxIDA6IGNwdXM9MCBub2RlPTAg
ZmxhZ3M9MHgwIG5pY2U9MAphY3RpdmU9Mi8yNTYKMDFoIDU3bSA1Mi43NDJzKCAgIDVtcyk6IFsg
ICA0Mi45NTI4MzhdICAgICBwZW5kaW5nOiB2bXN0YXRfc2hlcGhlcmQsCmNoZWNrX2NvcnJ1cHRp
b24KMDFoIDU3bSA1Mi43NDZzKCAgIDRtcyk6IFsgICA0Mi45NTY5MjddIHdvcmtxdWV1ZSBldmVu
dHNfcG93ZXJfZWZmaWNpZW50OgpmbGFncz0weDgwCjAxaCA1N20gNTIuNzQ5cyggICAzbXMpOiBb
ICAgNDIuOTYwNzMxXSAgIHB3cSAwOiBjcHVzPTAgbm9kZT0wIGZsYWdzPTB4MCBuaWNlPTAKYWN0
aXZlPTQvMjU2CjAxaCA1N20gNTIuNzU0cyggICA1bXMpOiBbICAgNDIuOTY0ODM1XSAgICAgcGVu
ZGluZzogbmVpZ2hfcGVyaW9kaWNfd29yaywKZG9fY2FjaGVfY2xlYW4gW3N1bnJwY10sIG5laWdo
X3BlcmlvZGljX3dvcmssIGNoZWNrX2xpZmV0aW1lCjAxaCA1N20gNTIuNzgxcyggIDI3bXMpOiBb
ICAgNDIuOTcxNDE5XSB3b3JrcXVldWUgbW1fcGVyY3B1X3dxOiBmbGFncz0weDgKMDFoIDU3bSA1
Mi43ODFzKCAgIDBtcyk6IFsgICA0Mi45NzQ2MjhdICAgcHdxIDA6IGNwdXM9MCBub2RlPTAgZmxh
Z3M9MHgwIG5pY2U9MAphY3RpdmU9MS8yNTYKMDFoIDU3bSA1Mi43ODFzKCAgIDBtcyk6IFsgICA0
Mi45Nzg5MDFdICAgICBwZW5kaW5nOiB2bXN0YXRfdXBkYXRlCjAxaCA1N20gNTIuNzgxcyggICAw
bXMpOiBbICAgNDIuOTgxODIyXSB3b3JrcXVldWUgaXB2Nl9hZGRyY29uZjogZmxhZ3M9MHg0MDAw
OAowMWggNTdtIDUyLjc4MXMoICAgMG1zKTogWyAgIDQyLjk4NTUyNF0gICBwd3EgMDogY3B1cz0w
IG5vZGU9MCBmbGFncz0weDAgbmljZT0wCmFjdGl2ZT0xLzEKMDFoIDU3bSA1Mi43ODFzKCAgIDBt
cyk6IFsgICA0Mi45ODk2NzBdICAgICBwZW5kaW5nOiBhZGRyY29uZl92ZXJpZnlfd29yayBbaXB2
Nl0KMDFoIDU3bSA1Mi43ODJzKCAgIDFtcyk6IFsgICA0Mi45OTMyODJdIHdvcmtxdWV1ZSB4ZnMt
Y29udi94dmRhMTogZmxhZ3M9MHhjCjAxaCA1N20gNTIuNzg2cyggICA0bXMpOiBbICAgNDIuOTk2
NzA4XSAgIHB3cSAwOiBjcHVzPTAgbm9kZT0wIGZsYWdzPTB4MCBuaWNlPTAKYWN0aXZlPTMvMjU2
CjAxaCA1N20gNTIuNzkwcyggICA0bXMpOiBbICAgNDMuMDAwOTU0XSAgICAgcGVuZGluZzogeGZz
X2VuZF9pbyBbeGZzXSwKeGZzX2VuZF9pbyBbeGZzXSwgeGZzX2VuZF9pbyBbeGZzXQowMWggNTdt
IDUyLjc5NXMoICAgNW1zKTogWyAgIDQzLjAwNTYxMF0gd29ya3F1ZXVlIHhmcy1yZWNsYWltL3h2
ZGExOiBmbGFncz0weGMKMDFoIDU3bSA1Mi43OThzKCAgIDNtcyk6IFsgICA0My4wMDg5NDVdICAg
cHdxIDA6IGNwdXM9MCBub2RlPTAgZmxhZ3M9MHgwIG5pY2U9MAphY3RpdmU9MS8yNTYKMDFoIDU3
bSA1Mi44MDJzKCAgIDRtcyk6IFsgICA0My4wMTI2NzVdICAgICBwZW5kaW5nOiB4ZnNfcmVjbGFp
bV93b3JrZXIgW3hmc10KMDFoIDU3bSA1Mi44MDVzKCAgIDNtcyk6IFsgICA0My4wMTU3NDFdIHdv
cmtxdWV1ZSB4ZnMtc3luYy94dmRhMTogZmxhZ3M9MHg0CjAxaCA1N20gNTIuODA4cyggICAzbXMp
OiBbICAgNDMuMDE4NzIzXSAgIHB3cSAwOiBjcHVzPTAgbm9kZT0wIGZsYWdzPTB4MCBuaWNlPTAK
YWN0aXZlPTEvMjU2CjAxaCA1N20gNTIuODExcyggICAzbXMpOiBbICAgNDMuMDIyNDM2XSAgICAg
cGVuZGluZzogeGZzX2xvZ193b3JrZXIgW3hmc10KMDFoIDU3bSA1Mi44MTRzKCAgIDNtcyk6IFsg
ICA0My4wNDM1MTldIEZpbGVzeXN0ZW1zIHN5bmM6IDM1LjIzNCBzZWNvbmRzCjAxaCA1N20gNTIu
ODM3cyggIDIzbXMpOiBbICAgNDMuMDQ4MTMzXSBGcmVlemluZyB1c2VyIHNwYWNlIHByb2Nlc3Nl
cyAuLi4KKGVsYXBzZWQgMC4wMDEgc2Vjb25kcykgZG9uZS4KMDFoIDU3bSA1Mi44NDRzKCAgIDdt
cyk6IFsgICA0My4wNTU5OTZdIE9PTSBraWxsZXIgZGlzYWJsZWQuCjAxaCA1N20gNTMuODM4cygg
OTk0bXMpOiBbICAgNDMuMDYxNTEyXSBQTTogUHJlYWxsb2NhdGluZyBpbWFnZSBtZW1vcnkuLi4g
ZG9uZQooYWxsb2NhdGVkIDM4NTg1OSBwYWdlcykKMDFoIDU3bSA1My44NDNzKCAgIDVtcyk6IFsg
ICA0NC4wNTQ3MjBdIFBNOiBBbGxvY2F0ZWQgMTU0MzQzNiBrYnl0ZXMgaW4gMS4wNgpzZWNvbmRz
ICgxNDU2LjA3IE1CL3MpCjAxaCA1N20gNTMuODYxcyggIDE4bXMpOiBbICAgNDQuMDYwODg1XSBG
cmVlemluZyByZW1haW5pbmcgZnJlZXphYmxlIHRhc2tzIC4uLgooZWxhcHNlZCAwLjAwMSBzZWNv
bmRzKSBkb25lLgowMWggNTdtIDUzLjg2MXMoICAgMG1zKTogWyAgIDQ0LjA2OTcxNV0gcHJpbnRr
OiBTdXNwZW5kaW5nIGNvbnNvbGUocykgKHVzZQpub19jb25zb2xlX3N1c3BlbmQgdG8gZGVidWcp
CjAxaCA1N20gNTYuMjc4cygyNDE3bXMpOiBbICAgNDQuMTE2NjAxXSBEaXNhYmxpbmcgbm9uLWJv
b3QgQ1BVcyAuLi4KLi4uLi4KaGliZXJuYXRlLXJlc3VtZSBsb29wIGNvbnRpbnVlcyBhZnRlciB0
aGlzLiBBcyBtZW50aW9uZWQgYWJvdmUsIEkgbG9vc2UKY29ubmVjdGl2aXR5IGZvciBhIHdoaWxl
LgoKClRoYW5rcywKQW5jaGFsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
