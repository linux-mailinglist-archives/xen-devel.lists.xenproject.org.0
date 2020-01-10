Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A860413719C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 16:45:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipwQf-0006BJ-7s; Fri, 10 Jan 2020 15:42:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=trJr=27=amazon.com=prvs=271c61783=eduval@srs-us1.protection.inumbo.net>)
 id 1ipwKU-0005QZ-SG
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 15:36:06 +0000
X-Inumbo-ID: ea5d7f3c-33be-11ea-bf44-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea5d7f3c-33be-11ea-bf44-12813bfff9fa;
 Fri, 10 Jan 2020 15:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578670567; x=1610206567;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SgZqy3XTPlr7N1P3ccJM4s/BqmaQ1P0z1Cl70TTTVVg=;
 b=QX8ELhOVqUPkiOteB4nT3AzdArBqpMvK9R6qQ+cHNy97A54TZ6SGJFLc
 HiJAWKDDE2WC/TViPCRtYyQR8H6nBHhqHjMPAcyu6qvXjW67vyAXAahtw
 d1Zbv3bVzUFP4Dq/hJrh/yWRNDcdOnNKB/Z1SsTHFQUzWYblmo6lEIR63 Y=;
IronPort-SDR: vO0XLbMQgitppzP2QpWLx/9TWANK+p+D6rx2ItFgJb7JazVRZhu9IZvwDPQiY2YXRlIwTKxqQ2
 K0Gg7agBJwZQ==
X-IronPort-AV: E=Sophos;i="5.69,417,1571702400"; d="scan'208";a="17985115"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 10 Jan 2020 15:35:54 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 1C7D0A0716; Fri, 10 Jan 2020 15:35:45 +0000 (UTC)
Received: from EX13D10UWA003.ant.amazon.com (10.43.160.248) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 10 Jan 2020 15:35:21 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D10UWA003.ant.amazon.com (10.43.160.248) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 10 Jan 2020 15:35:21 +0000
Received: from localhost (10.85.220.176) by mail-relay.amazon.com
 (10.43.162.232) with Microsoft SMTP Server id 15.0.1367.3 via Frontend
 Transport; Fri, 10 Jan 2020 15:35:21 +0000
Date: Fri, 10 Jan 2020 07:35:20 -0800
From: Eduardo Valentin <eduval@amazon.com>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <20200110153520.GC8214@u40b0340c692b58f6553c.ant.amazon.com>
References: <20200107234526.GA19034@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200108105011.GY2827@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108105011.GY2827@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: Bulk
X-Mailman-Approved-At: Fri, 10 Jan 2020 15:42:27 +0000
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
Cc: konrad.wilk@oracle.co, eduval@amazon.com, x86@kernel.org,
 linux-mm@kvack.org, axboe@kernel.dk, pavel@ucw.cz, hpa@zytor.com,
 boris.ostrovsky@oracle.com, sstabellini@kernel.org, fllinden@amaozn.com,
 kamatam@amazon.com, mingo@redhat.com, xen-devel@lists.xenproject.org,
 sblbir@amazon.com, len.brown@intel.com, linux-pm@vger.kernel.org,
 Anchal Agarwal <anchalag@amazon.com>, bp@alien8.de, tglx@linutronix.de,
 jgross@suse.com, netdev@vger.kernel.org,
 Woodhouse@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, vkuznets@redhat.com, davem@davemloft.net,
 dwmw@amazon.co.uk, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGV5IFBldGVyLAoKT24gV2VkLCBKYW4gMDgsIDIwMjAgYXQgMTE6NTA6MTFBTSArMDEwMCwgUGV0
ZXIgWmlqbHN0cmEgd3JvdGU6Cj4gT24gVHVlLCBKYW4gMDcsIDIwMjAgYXQgMTE6NDU6MjZQTSAr
MDAwMCwgQW5jaGFsIEFnYXJ3YWwgd3JvdGU6Cj4gPiBGcm9tOiBFZHVhcmRvIFZhbGVudGluIDxl
ZHV2YWxAYW1hem9uLmNvbT4KPiA+IAo+ID4gU3lzdGVtIGluc3RhYmlsaXR5IGFyZSBzZWVuIGR1
cmluZyByZXN1bWUgZnJvbSBoaWJlcm5hdGlvbiB3aGVuIHN5c3RlbQo+ID4gaXMgdW5kZXIgaGVh
dnkgQ1BVIGxvYWQuIFRoaXMgaXMgZHVlIHRvIHRoZSBsYWNrIG9mIHVwZGF0ZSBvZiBzY2hlZAo+
ID4gY2xvY2sgZGF0YSwgYW5kIHRoZSBzY2hlZHVsZXIgd291bGQgdGhlbiB0aGluayB0aGF0IGhl
YXZ5IENQVSBob2cKPiA+IHRhc2tzIG5lZWQgbW9yZSB0aW1lIGluIENQVSwgY2F1c2luZyB0aGUg
c3lzdGVtIHRvIGZyZWV6ZQo+ID4gZHVyaW5nIHRoZSB1bmZyZWV6aW5nIG9mIHRhc2tzLiBGb3Ig
ZXhhbXBsZSwgdGhyZWFkZWQgaXJxcywKPiA+IGFuZCBrZXJuZWwgcHJvY2Vzc2VzIHNlcnZpY2lu
ZyBuZXR3b3JrIGludGVyZmFjZSBtYXkgYmUgZGVsYXllZAo+ID4gZm9yIHNldmVyYWwgdGVucyBv
ZiBzZWNvbmRzLCBjYXVzaW5nIHRoZSBzeXN0ZW0gdG8gYmUgdW5yZWFjaGFibGUuCj4gCj4gPiBU
aGUgZml4IGZvciB0aGlzIHNpdHVhdGlvbiBpcyB0byBtYXJrIHRoZSBzY2hlZCBjbG9jayBhcyB1
bnN0YWJsZQo+ID4gYXMgZWFybHkgYXMgcG9zc2libGUgaW4gdGhlIHJlc3VtZSBwYXRoLCBsZWF2
aW5nIGl0IHVuc3RhYmxlCj4gPiBmb3IgdGhlIGR1cmF0aW9uIG9mIHRoZSByZXN1bWUgcHJvY2Vz
cy4gVGhpcyB3aWxsIGZvcmNlIHRoZQo+ID4gc2NoZWR1bGVyIHRvIGF0dGVtcHQgdG8gYWxpZ24g
dGhlIHNjaGVkIGNsb2NrIGFjcm9zcyBDUFVzIHVzaW5nCj4gPiB0aGUgZGVsdGEgd2l0aCB0aW1l
IG9mIGRheSwgdXBkYXRpbmcgc2NoZWQgY2xvY2sgZGF0YS4gSW4gYSBwb3N0Cj4gPiBoaWJlcm5h
dGlvbiBldmVudCwgd2UgY2FuIHRoZW4gbWFyayB0aGUgc2NoZWQgY2xvY2sgYXMgc3RhYmxlCj4g
PiBhZ2FpbiwgYXZvaWRpbmcgdW5uZWNlc3Nhcnkgc3luY3Mgd2l0aCB0aW1lIG9mIGRheSBvbiBz
eXN0ZW1zCj4gPiBpbiB3aGljaCBUU0MgaXMgcmVsaWFibGUuCj4gCj4gVGhpcyBtYWtlcyBubyBm
cmlnZ2luZyBzZW5zZSB3aGF0IHNvIGJsb29keSBldmVyLiBJZiB0aGUgY2xvY2sgaXMKPiBzdGFi
bGUsIHdlIGRvbid0IGNhcmUgYWJvdXQgc2NoZWRfY2xvY2tfZGF0YS4gV2hlbiBpdCBpcyBzdGFi
bGUgeW91IGdldAo+IGEgbGluZWFyIGZ1bmN0aW9uIG9mIHRoZSBUU0Mgd2l0aG91dCBjb21wbGlj
YXRlZCBiaXRzIG9uLgo+IAo+IFdoZW4gaXQgaXMgdW5zdGFibGUsIG9ubHkgdGhlbiBkbyB3ZSBj
YXJlIGFib3V0IHRoZSBzY2hlZF9jbG9ja19kYXRhLgo+IAoKWWVhaCwgbWF5YmUgd2hhdCBpcyBu
b3QgY2xlYXIgaGVyZSBpcyB0aGF0IHdlIGNvdmVyaW5nIGZvciBzaXR1YXRpb24Kd2hlcmUgY2xv
Y2sgc3RhYmlsaXR5IGNoYW5nZXMgb3ZlciB0aW1lLCBlLmcuIGF0IHJlZ3VsYXIgYm9vdCBjbG9j
ayBpcwpzdGFibGUsIGhpYmVybmF0aW9uIGhhcHBlbnMsIHRoZW4gcmVzdG9yZSBoYXBwZW5zIGlu
IGEgbm9uLXN0YWJsZSBjbG9jay4KCj4gPiBSZXZpZXdlZC1ieTogRXJpayBRdWFuc3Ryb20gPHF1
YW5zdHJvQGFtYXpvbi5jb20+Cj4gPiBSZXZpZXdlZC1ieTogRnJhbmsgdmFuIGRlciBMaW5kZW4g
PGZsbGluZGVuQGFtYXpvbi5jb20+Cj4gPiBSZXZpZXdlZC1ieTogQmFsYmlyIFNpbmdoIDxzYmxi
aXJAYW1hem9uLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBNdW5laGlzYSBLYW1hdGEgPGthbWF0YW1A
YW1hem9uLmNvbT4KPiA+IFRlc3RlZC1ieTogQW5jaGFsIEFnYXJ3YWwgPGFuY2hhbGFnQGFtYXpv
bi5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBFZHVhcmRvIFZhbGVudGluIDxlZHV2YWxAYW1hem9u
LmNvbT4KPiA+IC0tLQo+IAo+IE5BSywgdGhlIGNvZGUgdmVyeSBtdWNoIHJlbGllcyBvbiBuZXZl
ciBnZXR0aW5nIG1hcmtlZCBzdGFibGUgYWdhaW4KPiBhZnRlciBpdCBnZXRzIHNldCB0byB1bnN0
YWJsZS4KPiAKCldlbGwgYWN0dWFsbHksIGF0IHRoZSBQTV9QT1NUX0hJQkVSTkFUSU9OLCB3ZSBk
byB0aGUgY2hlY2sgYW5kIHNldCBzdGFibGUgaWYKa25vd24gdG8gYmUgc3RhYmxlLgoKVGhlIGlz
c3VlIG9ubHkgcmVhbGx5IGhhcHBlbnMgZHVyaW5nIHRoZSByZXN0b3JhdGlvbiBwYXRoIHVuZGVy
IHNjaGVkdWxpbmcgcHJlc3N1cmUsCndoaWNoIHRha2VzIGZvcmV2ZXIgdG8gZmluaXNoLCBhcyBk
ZXNjcmliZWQgaW4gdGhlIGNvbW1pdC4KCkRvIHlvdSBzZWUgYSBiZXR0ZXIgc29sdXRpb24gZm9y
IHRoaXMgaXNzdWU/CgoKPiA+IGRpZmYgLS1naXQgYS9rZXJuZWwvc2NoZWQvY2xvY2suYyBiL2tl
cm5lbC9zY2hlZC9jbG9jay5jCj4gPiBpbmRleCAxMTUyMjU5YTRjYTAuLjM3NGQ0MGU1YjFhMiAx
MDA2NDQKPiA+IC0tLSBhL2tlcm5lbC9zY2hlZC9jbG9jay5jCj4gPiArKysgYi9rZXJuZWwvc2No
ZWQvY2xvY2suYwo+ID4gQEAgLTExNiw3ICsxMTYsNyBAQCBzdGF0aWMgdm9pZCBfX3NjZF9zdGFt
cChzdHJ1Y3Qgc2NoZWRfY2xvY2tfZGF0YSAqc2NkKQo+ID4gIAlzY2QtPnRpY2tfcmF3ID0gc2No
ZWRfY2xvY2soKTsKPiA+ICB9Cj4gPiAgCj4gPiAtc3RhdGljIHZvaWQgX19zZXRfc2NoZWRfY2xv
Y2tfc3RhYmxlKHZvaWQpCj4gPiArdm9pZCBzZXRfc2NoZWRfY2xvY2tfc3RhYmxlKHZvaWQpCj4g
PiAgewo+ID4gIAlzdHJ1Y3Qgc2NoZWRfY2xvY2tfZGF0YSAqc2NkOwo+ID4gIAo+ID4gQEAgLTIz
Niw3ICsyMzYsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBzY2hlZF9jbG9ja19pbml0X2xhdGUodm9p
ZCkKPiA+ICAJc21wX21iKCk7IC8qIG1hdGNoZXMge3NldCxjbGVhcn1fc2NoZWRfY2xvY2tfc3Rh
YmxlKCkgKi8KPiA+ICAKPiA+ICAJaWYgKF9fc2NoZWRfY2xvY2tfc3RhYmxlX2Vhcmx5KQo+ID4g
LQkJX19zZXRfc2NoZWRfY2xvY2tfc3RhYmxlKCk7Cj4gPiArCQlzZXRfc2NoZWRfY2xvY2tfc3Rh
YmxlKCk7Cj4gPiAgCj4gPiAgCXJldHVybiAwOwo+ID4gIH0KPiA+IC0tIAo+ID4gMi4xNS4zLkFN
Wk4KPiA+IAoKLS0gCkFsbCB0aGUgYmVzdCwKRWR1YXJkbyBWYWxlbnRpbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
