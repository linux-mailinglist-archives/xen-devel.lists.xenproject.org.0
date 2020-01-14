Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A027213B301
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 20:34:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irRtW-0004DU-BS; Tue, 14 Jan 2020 19:30:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HMbF=3D=amazon.com=prvs=2750eb746=anchalag@srs-us1.protection.inumbo.net>)
 id 1irRtV-0004DP-35
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 19:30:29 +0000
X-Inumbo-ID: 516a794f-3704-11ea-843c-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 516a794f-3704-11ea-843c-12813bfff9fa;
 Tue, 14 Jan 2020 19:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579030229; x=1610566229;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kERWQcPBD6U7cttKEBKCe+VLCzWuIvbuKzU3wI+3unU=;
 b=FCki7BoyQcfgsyWCOV1o926wDltZEzP8R/VWkvO6f8I/kI5jbYjgkmjm
 gny2ahtfI1tAP+9d3OhyhR7eNZStdqhVy+d8kBtL8S5/lbZQdY/oOgbDO
 u05MvStD+m97Kv8J7gqyugBCu4VFeHbVMibzHWxr2sdl7MiIlrRT++QHK o=;
IronPort-SDR: 1XWTl0ZFPeAlOX/4U8kY6SYcBuV6mXXPHzXHV+KPO++vV8ZqU64Zy3g8i6YkQ3MNzJ1c7HsLNp
 881qx3hEFFTA==
X-IronPort-AV: E=Sophos;i="5.70,319,1574121600"; d="scan'208";a="18710229"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-807d4a99.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 14 Jan 2020 19:30:15 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-807d4a99.us-east-1.amazon.com (Postfix) with ESMTPS
 id F0146A29E9; Tue, 14 Jan 2020 19:30:07 +0000 (UTC)
Received: from EX13D10UWB004.ant.amazon.com (10.43.161.121) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 14 Jan 2020 19:29:52 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D10UWB004.ant.amazon.com (10.43.161.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 14 Jan 2020 19:29:52 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Tue, 14 Jan 2020 19:29:52 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 2E01D40E7F; Tue, 14 Jan 2020 19:29:52 +0000 (UTC)
Date: Tue, 14 Jan 2020 19:29:52 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Message-ID: <20200114192952.GA26755@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
References: <20200107234526.GA19034@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200108105011.GY2827@hirez.programming.kicks-ass.net>
 <20200110153520.GC8214@u40b0340c692b58f6553c.ant.amazon.com>
 <20200113101609.GT2844@hirez.programming.kicks-ass.net>
 <857b42b2e86b2ae09a23f488daada3b1b2836116.camel@amazon.com>
 <20200113124247.GG2827@hirez.programming.kicks-ass.net>
 <CAJZ5v0jv+5aLY3N4wFSitu61o9S8tJWEWGGn1Xyw-P82_TwFdQ@mail.gmail.com>
 <CAJZ5v0imNbbch=NWAdgVKf_hjwRrEiWAL8SFNwe6rW_SjgYzrw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0imNbbch=NWAdgVKf_hjwRrEiWAL8SFNwe6rW_SjgYzrw@mail.gmail.com>
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
Cc: "konrad.wilk@oracle.co" <konrad.wilk@oracle.co>, "Kamata,
 Munehisa" <kamatam@amazon.com>, Peter Zijlstra <peterz@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "fllinden@amaozn.com" <fllinden@amaozn.com>, "Valentin,
 Eduardo" <eduval@amazon.com>, "x86@kernel.org" <x86@kernel.org>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Singh,
 Balbir" <sblbir@amazon.com>, "len.brown@intel.com" <len.brown@intel.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, anchalag@amazon.com,
 "bp@alien8.de" <bp@alien8.de>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "axboe@kernel.dk" <axboe@kernel.dk>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>, "Woodhouse, 
 David" <dwmw@amazon.co.uk>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMTQsIDIwMjAgYXQgMTI6MzA6MDJBTSArMDEwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gTW9uLCBKYW4gMTMsIDIwMjAgYXQgMTA6NTAgUE0gUmFmYWVsIEouIFd5
c29ja2kgPHJhZmFlbEBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIEphbiAxMywg
MjAyMCBhdCAxOjQzIFBNIFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IE9uIE1vbiwgSmFuIDEzLCAyMDIwIGF0IDExOjQzOjE4QU0gKzAwMDAs
IFNpbmdoLCBCYWxiaXIgd3JvdGU6Cj4gPiA+ID4gRm9yIHlvdXIgb3JpZ2luYWwgY29tbWVudCwg
anVzdCB3YW50ZWQgdG8gY2xhcmlmeSB0aGUgZm9sbG93aW5nOgo+ID4gPiA+Cj4gPiA+ID4gMS4g
QWZ0ZXIgaGliZXJuYXRpb24sIHRoZSBtYWNoaW5lIGNhbiBiZSByZXN1bWVkIG9uIGEgZGlmZmVy
ZW50IGJ1dCBjb21wYXRpYmxlCj4gPiA+ID4gaG9zdCAodGhlc2UgYXJlIFZNIGltYWdlcyBoaWJl
cm5hdGVkKQo+ID4gPiA+IDIuIFRoaXMgbWVhbnMgdGhlIGNsb2NrIGJldHdlZW4gaG9zdDEgYW5k
IGhvc3QyIGNhbi93aWxsIGJlIGRpZmZlcmVudAo+ID4gPiA+Cj4gPiA+ID4gSW4geW91ciBjb21t
ZW50cyBhcmUgeW91IG1ha2luZyB0aGUgYXNzdW1wdGlvbiB0aGF0IHRoZSBob3N0KHMpIGlzL2Fy
ZSB0aGUKPiA+ID4gPiBzYW1lPyBKdXN0IGNoZWNraW5nIHRoZSBhc3N1bXB0aW9ucyBiZWluZyBt
YWRlIGFuZCBiZWluZyBvbiB0aGUgc2FtZSBwYWdlIHdpdGgKPiA+ID4gPiB0aGVtLgo+ID4gPgo+
ID4gPiBJIHdvdWxkIGV4cGVjdCB0aGlzIHRvIGJlIHRoZSBzYW1lIHByb2JsZW0gd2UgaGF2ZSBh
cyByZWd1bGFyIHN1c3BlbmQsCj4gPiA+IGFmdGVyIHBvd2VyIG9mZiB0aGUgVFNDIHdpbGwgaGF2
ZSBiZWVuIHJlc2V0LCBzbyByZXN1bWUgd2lsbCBoYXZlIHRvCj4gPiA+IHNvbWVob3cgYnJpZGdl
IHRoYXQgZ2FwLiBJJ3ZlIG5vIGlkZWEgaWYvaG93IGl0IGRvZXMgdGhhdC4KPiA+Cj4gPiBJbiBn
ZW5lcmFsLCB0aGlzIGlzIGRvbmUgYnkgdGltZWtlZXBpbmdfcmVzdW1lKCkgYW5kIHRoZSBvbmx5
IHNwZWNpYWwKPiA+IHRoaW5nIGRvbmUgZm9yIHRoZSBUU0MgYXBwZWFycyB0byBiZSB0aGUgdHNj
X3ZlcmlmeV90c2NfYWRqdXN0KHRydWUpCj4gPiBjYWxsIGluIHRzY19yZXN1bWUoKS4KPiAKPiBB
bmQgSSBmb3Jnb3QgYWJvdXQgdHNjX3Jlc3RvcmVfc2NoZWRfY2xvY2tfc3RhdGUoKSB0aGF0IGdl
dHMgY2FsbGVkCj4gdmlhIHJlc3RvcmVfcHJvY2Vzc29yX3N0YXRlKCkgb24geDg2LCBiZWZvcmUg
Y2FsbGluZwo+IHRpbWVrZWVwaW5nX3Jlc3VtZSgpLgo+CkluIHRoaXMgY2FzZSB0c2NfdmVyaWZ5
X3RzY19hZGp1c3QodHJ1ZSkgdGhpcyBkb2VzIG5vdGhpbmcgYXMKZmVhdHVyZSBiaXQgWDg2X0ZF
QVRVUkVfVFNDX0FESlVTVCBpcyBub3QgYXZhaWxhYmxlIHRvIGd1ZXN0LiAKSSBhbSBubyBleHBl
cnQgaW4gdGhpcyBhcmVhLCBidXQgY291bGQgdGhpcyBiZSBtZXNzaW5nIHRoaW5ncyB1cD8KClRo
YW5rcywKQW5jaGFsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
