Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E1B17EC35
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 23:39:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBR1Z-00021e-M0; Mon, 09 Mar 2020 22:37:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WdwL=42=amazon.com=prvs=330b6d83d=anchalag@srs-us1.protection.inumbo.net>)
 id 1jBR1X-000205-O3
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 22:37:23 +0000
X-Inumbo-ID: 8a4750b6-6256-11ea-acb0-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a4750b6-6256-11ea-acb0-12813bfff9fa;
 Mon, 09 Mar 2020 22:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1583793442; x=1615329442;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nm/K+hs17EKcRVzHSvMbu0ne+AtNnO2mJL12xgMBEqU=;
 b=M1BvI8m/KpYo1UUyoqj2zpbeLR31a2EWnp8puAlgmUTUwsPyi3R+LQmq
 l/4dGTVquB+ed3eWGPWyUFPld5UxroxCobwDiOzRucs4v7Ki2f1iioOeo
 T42/FP9oG1CtqKWwH2a7auLc9n2MQ8KMBsObXIwsAo3IRX1bildxeyFnL E=;
IronPort-SDR: NHag6RFlU2mvRcJeDLBg74Cs4Z7ht0ObfH2JR56T3a1uxhtCZDsJ8DmJX73OAE6jYthefr21k9
 1hhjxqoVWmpQ==
X-IronPort-AV: E=Sophos;i="5.70,534,1574121600"; d="scan'208";a="31596269"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-53356bf6.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 09 Mar 2020 22:37:20 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-53356bf6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 72D19A2582; Mon,  9 Mar 2020 22:37:18 +0000 (UTC)
Received: from EX13D08UEE003.ant.amazon.com (10.43.62.118) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Mar 2020 22:37:03 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D08UEE003.ant.amazon.com (10.43.62.118) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 9 Mar 2020 22:37:03 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Mon, 9 Mar 2020 22:37:02 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id CBD26408BA; Mon,  9 Mar 2020 22:37:02 +0000 (UTC)
Date: Mon, 9 Mar 2020 22:37:02 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20200309223702.GA8513@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
References: <e782c510916c8c05dc95ace151aba4eced207b31.1581721799.git.anchalag@amazon.com>
 <87ftelaxwn.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ftelaxwn.fsf@nanos.tec.linutronix.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: Re: [Xen-devel] [EXTERNAL][RFC PATCH v3 07/12] genirq: Shutdown irq
 chips in suspend/resume during hibernation
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: eduval@amazon.com, len.brown@intel.com, peterz@infradead.org,
 benh@kernel.crashing.org, x86@kernel.org, linux-mm@kvack.org, pavel@ucw.cz,
 hpa@zytor.com, sstabellini@kernel.org, fllinden@amaozn.com, kamatam@amazon.com,
 mingo@redhat.com, xen-devel@lists.xenproject.org, sblbir@amazon.com,
 axboe@kernel.dk, konrad.wilk@oracle.com, bp@alien8.de,
 boris.ostrovsky@oracle.com, jgross@suse.com, netdev@vger.kernel.org,
 linux-pm@vger.kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 vkuznets@redhat.com, davem@davemloft.net, dwmw@amazon.co.uk,
 roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCBNYXIgMDcsIDIwMjAgYXQgMTI6MDM6NTJBTSArMDEwMCwgVGhvbWFzIEdsZWl4bmVy
IHdyb3RlOgo+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2Yg
dGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMg
dW5sZXNzIHlvdSBjYW4gY29uZmlybSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlz
IHNhZmUuCj4gCj4gCj4gCj4gQW5jaGFsIEFnYXJ3YWwgPGFuY2hhbGFnQGFtYXpvbi5jb20+IHdy
aXRlczoKPiAKPiA+IFRoZXJlIGFyZSBubyBwbSBoYW5kbGVycyBmb3IgdGhlIGxlZ2FjeSBkZXZp
Y2VzLCBzbyBkdXJpbmcgdGVhciBkb3duCj4gPiBzdGFsZSBldmVudCBjaGFubmVsIDw+IElSUSBt
YXBwaW5nIG1heSBzdGlsbCByZW1haW4gaW4gdGhlIGltYWdlIGFuZAo+ID4gcmVzdW1lIG1heSBm
YWlsLiBUbyBhdm9pZCBhZGRpbmcgbXVjaCBjb2RlIGJ5IGltcGxlbWVudGluZyBoYW5kbGVycyBm
b3IKPiA+IGxlZ2FjeSBkZXZpY2VzLCBhZGQgYSBuZXcgaXJxX2NoaXAgZmxhZyBJUlFDSElQX1NI
VVRET1dOX09OX1NVU1BFTkQgd2hpY2gKPiA+IHdoZW4gZW5hYmxlZCBvbiBhbiBpcnEtY2hpcCBl
LmcgeGVuLXBpcnEsIGl0IHdpbGwgbGV0IGNvcmUgc3VzcGVuZC9yZXN1bWUKPiA+IGlycSBjb2Rl
IHRvIHNodXRkb3duIGFuZCByZXN0YXJ0IHRoZSBhY3RpdmUgaXJxcy4gUE0gc3VzcGVuZC9oaWJl
cm5hdGlvbgo+ID4gY29kZSB3aWxsIHJlbHkgb24gdGhpcy4KPiA+IFdpdGhvdXQgdGhpcywgaW4g
UE0gaGliZXJuYXRpb24sIGluZm9ybWF0aW9uIGFib3V0IHRoZSBldmVudCBjaGFubmVsCj4gPiBy
ZW1haW5zIGluIGhpYmVybmF0aW9uIGltYWdlLCBidXQgdGhlcmUgaXMgbm8gZ3VhcmFudGVlIHRo
YXQgdGhlIHNhbWUKPiA+IGV2ZW50IGNoYW5uZWwgbnVtYmVycyBhcmUgYXNzaWduZWQgdG8gdGhl
IGRldmljZXMgd2hlbiByZXN0b3JpbmcgdGhlCj4gPiBzeXN0ZW0uIFRoaXMgbWF5IGNhdXNlIGNv
bmZsaWN0IGxpa2UgdGhlIGZvbGxvd2luZyBhbmQgcHJldmVudCBzb21lCj4gPiBkZXZpY2VzIGZy
b20gYmVpbmcgcmVzdG9yZWQgY29ycmVjdGx5Lgo+IAo+IFRoZSBhYm92ZSBpcyBqdXN0IGFuIGFn
Z2xvbWVyYXRpb24gb2Ygd29yZHMgYW5kIGFjcm9ueW1zIGFuZCBzb21lIG9mCj4gdGhlc2Ugc2Vu
dGVuY2VzIGRvIG5vdCBldmVuIG1ha2Ugc2Vuc2UuIEFueW9uZSB3aG8gaXMgbm90IGF3YXJlIG9m
IGV2ZW50Cj4gY2hhbm5lbHMgYW5kIHdoYXRldmVyIFhFTmlzbXMgeW91IHRhbGsgYWJvdXQgd2ls
bCBiZSBlbnRpcmVseQo+IGNvbmZ1c2VkLiBDaGFuZ2Vsb2dzIHJlYWxseSBuZWVkIHRvIGJlIHVu
ZGVyc3RhbmRhYmxlIGZvciBtZXJlIG1vcnRhbHMKPiBhbmQgdGhlcmUgaXMgbm8gc3BhY2UgcmVz
dHJpY3Rpb24gc28gYWNyb255bXMgY2FuIGJlIHdyaXR0ZW4gb3V0Lgo+IApJIGRvbid0IHVuZGVy
c3RhbmQgd2hhdCBkb2VzIG5vdCBtYWtlcyBzZW5zZSBoZXJlLiBPZiBjb3Vyc2UgdGhlIG9uZSB5
b3UKZGVzY3JpYmVkIGlzIG1vcmUgZWxhYm9yYXRlIGFuZCBleHBsYW5hdG9yeSBhbmQgSSBhZ3Jl
ZSBJIGp1c3Qgd3JvdGUgYSBzaG9ydCAKb25lIGZyb20gcGVyc3BlY3RpdmUgb2YgUE0gaGliZXJu
YXRpb24gcmVsYXRlZCB0byBYZW4gZG9tVS4gCkFsbCBJIGV4cGxhaW5lZCB3YXMgd2h5IHRlYXJk
b3duIGlzIG5lZWRlZCwgd2hhdCBpcyB0aGUgc29sdXRpb24gYW5kIAp3aGF0IHdpbGwgaGFwcGVu
IGlmIHdlIGRvIG5vdCBjbGVhciB0aG9zZSBtYXBwaW5ncy4gCj4gU29tZXRoaW5nIGxpa2UgdGhp
czoKPiAKPiAgIE1hbnkgbGVnYWN5IGRldmljZSBkcml2ZXJzIGRvIG5vdCBpbXBsZW1lbnQgcG93
ZXIgbWFuYWdlbWVudCAoUE0pCj4gICBmdW5jdGlvbnMgd2hpY2ggbWVhbnMgdGhhdCBpbnRlcnJ1
cHRzIHJlcXVlc3RlZCBieSB0aGVzZSBkcml2ZXJzIHN0YXkKPiAgIGluIGFjdGl2ZSBzdGF0ZSB3
aGVuIHRoZSBrZXJuZWwgaXMgaGliZXJuYXRlZC4KPiAKPiAgIFRoaXMgZG9lcyBub3QgbWF0dGVy
IG9uIGJhcmUgbWV0YWwgYW5kIG9uIG1vc3QgaHlwZXJ2aXNvcnMgYmVjYXVzZSB0aGUKPiAgIGlu
dGVycnVwdCBpcyByZXN0b3JlZCBvbiByZXN1bWUgd2l0aG91dCBhbnkgbm90aWNhYmxlIHNpZGUg
ZWZmZWN0cyBhcwo+ICAgaXQgc3RheXMgY29ubmVjdGVkIHRvIHRoZSBzYW1lIHBoeXNpY2FsIG9y
IHZpcnR1YWwgaW50ZXJydXB0IGxpbmUuCj4gCj4gICBUaGUgWEVOIGludGVycnVwdCBtZWNoYW5p
c20gaXMgZGlmZmVyZW50IGFzIGl0IG1haW50YWlucyBhIG1hcHBpbmcKPiAgIGJldHdlZW4gdGhl
IExpbnV4IGludGVycnVwdCBudW1iZXIgYW5kIGEgWEVOIGV2ZW50IGNoYW5uZWwuIElmIHRoZQo+
ICAgaW50ZXJydXB0IHN0YXlzIGFjdGl2ZSBvbiBoaWJlcm5hdGlvbiB0aGlzIG1hcHBpbmcgaXMg
cHJlc2VydmVkIGJ1dAo+ICAgdGhlcmUgaXMgdW5mb3J0dW5hdGVseSBubyBndWFyYW50ZWUgdGhh
dCBvbiByZXN1bWUgdGhlIHNhbWUgZXZlbnQKPiAgIGNoYW5uZWxzIGFyZSByZWFzc2lnbmVkIHRv
IHRoZXNlIGRldmljZXMuIFRoaXMgY2FuIHJlc3VsdCBpbiBldmVudAo+ICAgY2hhbm5lbCBjb25m
bGljdHMgd2hpY2ggcHJldmVudCB0aGUgYWZmZWN0ZWQgZGV2aWNlcyBmcm9tIGJlaW5nCj4gICBy
ZXN0b3JlZCBjb3JyZWN0bHkuCj4gCj4gICBPbmUgd2F5IHRvIHNvbHZlIHRoaXMgd291bGQgYmUg
dG8gYWRkIHRoZSBuZWNlc3NhcnkgcG93ZXIgbWFuYWdlbWVudAo+ICAgZnVuY3Rpb25zIHRvIGFs
bCBhZmZlY3RlZCBsZWdhY3kgZGV2aWNlIGRyaXZlcnMsIGJ1dCB0aGF0J3MgYQo+ICAgcXVlc3Rp
b25hYmxlIGVmZm9ydCB3aGljaCBkb2VzIG5vdCBwcm92aWRlIGFueSBiZW5lZml0cyBvbiBub24t
WEVOCj4gICBlbnZpcm9ubWVudHMuCj4gCj4gICBUaGUgbGVhc3QgaW50cnVzaXZlIGFuZCBtb3N0
IGVmZmljaWVudCBzb2x1dGlvbiBpcyB0byBwcm92aWRlIGEKPiAgIG1lY2hhbmlzbSB3aGljaCBh
bGxvd3MgdGhlIGNvcmUgaW50ZXJydXB0IGNvZGUgdG8gdGVhciBkb3duIHRoZXNlCj4gICBpbnRl
cnJ1cHRzIG9uIGhpYmVybmF0aW9uIGFuZCBicmluZyB0aGVtIGJhY2sgdXAgYWdhaW4gb24gcmVz
dW1lLiBUaGlzCj4gICBhbGxvd3MgdGhlIFhFTiBldmVudCBjaGFubmVsIG1lY2hhbmlzbSB0byBh
c3NpZ24gYW4gYXJiaXRyYXJ5IGV2ZW50Cj4gICBjaGFubmVsIG9uIHJlc3VtZSB3aXRob3V0IGFm
ZmVjdGluZyB0aGUgZnVuY3Rpb25hbGl0eSBvZiB0aGVzZQo+ICAgZGV2aWNlcy4KPiAKPiAgIEZv
cnR1bmF0ZWx5IGFsbCB0aGVzZSBkZXZpY2UgaW50ZXJydXB0cyBhcmUgaGFuZGxlZCBieSBhIGRl
ZGljYXRlZCBYRU4KPiAgIGludGVycnVwdCBjaGlwIHNvIHRoZSBjaGlwIGNhbiBiZSBtYXJrZWQg
dGhhdCBhbGwgaW50ZXJydXB0cyBjb25uZWN0ZWQKPiAgIHRvIGl0IGFyZSBoYW5kbGVkIHRoaXMg
d2F5LiBUaGlzIGlzIHByZXR0eSBtdWNoIGluIGxpbmUgd2l0aCB0aGUgb3RoZXIKPiAgIGludGVy
cnVwdCBjaGlwIHNwZWNpZmljIHF1aXJrcywgZS5nLiBJUlFDSElQX01BU0tfT05fU1VTUEVORC4K
PiAKPiAgIEFkZCBhIG5ldyBxdWlyayBmbGFnIElSUUNISVBfU0hVVERPV05fT05fU1VTUEVORCBh
bmQgYWRkIHN1cHBvcnQgZm9yCj4gICBpdCB0aGUgY29yZSBpbnRlcnJ1cHQgc3VzcGVuZC9yZXN1
bWUgcGF0aHMuCj4gCj4gSG1tPwo+IApTdXJlLgo+ID4gU2lnbmVkLW9mZi1ieTogQW5jaGFsIEFn
YXJ3YWwgPGFuY2hhbGFnQGFtYXpvbi5jb20+Cj4gPiBTdWdnZXN0ZWQtYnk6IFRob21hcyBHbGVp
eG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+IAo+IE5vdCB0aGF0IEkgY2FyZSBtdWNoLCBidXQg
bm93IHRoYXQgSSd2ZSB3cml0dGVuIGJvdGggdGhlIHBhdGNoIGFuZCB0aGUKPiBjaGFuZ2Vsb2cg
eW91IG1pZ2h0IGNoYW5nZSB0aGF0IGF0dHJpYnV0aW9uIHNsaWdodGx5LiBGb3IgY29tcGxldGVu
ZXNzCj4gc2FrZToKPiAKV2h5IG5vdC4gVGhhdCdzIG1hbmRhdGVkIG5vdyA6KQo+ICBTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiAKPiBUaGFua3Ms
Cj4gCj4gICAgICAgICB0Z2x4ClRoYW5rcywKQW5jaGFsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
