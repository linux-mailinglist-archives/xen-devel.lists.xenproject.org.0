Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDFE16A3D9
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 11:26:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6AuC-0002um-Pa; Mon, 24 Feb 2020 10:24:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6AuB-0002uh-OV
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 10:24:03 +0000
X-Inumbo-ID: c73d3f02-56ef-11ea-8add-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c73d3f02-56ef-11ea-8add-12813bfff9fa;
 Mon, 24 Feb 2020 10:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582539843;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2zS6Uh/9FQk572MW3R9gCfHnQi1BConB6pyYTgWPtfk=;
 b=Rosl8PXQRiokBze3OYFbVLqi/PZ4reaGJJtK7OkcpMIdUwTBWUrS2EFu
 3EvdFABcki8WWK7j0Vx5gD6AvCp8PQEugDu4UorcI/s1Ru+fibFzwlt9r
 8qG8TUTMwD//qjQ4k41QiIKXZqN/6/eqI8eVRz2k5y4/QImrnQdsB2Euh c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tFqdxVx/im8lHcxEVIhkiCN/85w0V7Z4XhdjvnhYIRKdiDf4fUNuybF/KeNgUtWu7+uQBLR3R0
 r5dFQ5ykepLGqBnUeeq9WXYBg0dT3PdTCEAfE5trQ8QuEWLMXS08aV6BF12/Y1ft6KSrkoocFD
 8tdic4CZavqC2KuVpsDEzr2fzcgr2JOUmzJH985G/Hx5nCZzMCur6gRogB2y27JYkOKUA5zYj7
 nF5oU/zIN1GODCqyxdjVEdcApzCyi3Gi1KhROisPSQOFOj3FKMaFDkq3WnKfqAkwAFV1TkJCLq
 yxg=
X-SBRS: 2.7
X-MesageID: 13329297
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,479,1574139600"; d="scan'208";a="13329297"
Date: Mon, 24 Feb 2020 11:23:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200224102355.GJ4679@Air-de-Roger>
References: <20200224084400.94482-1-roger.pau@citrix.com>
 <20200224084400.94482-2-roger.pau@citrix.com>
 <6a22dad2-946a-ae9f-2304-61f60e0d7f8c@xen.org>
 <20200224100919.GH4679@Air-de-Roger>
 <63c23677-1dbd-3dce-d67a-ea86c5683cc7@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <63c23677-1dbd-3dce-d67a-ea86c5683cc7@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 1/2] atomic: add atomic_and operations
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMTA6MTk6NDRBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpLAo+IAo+IE9uIDI0LzAyLzIwMjAgMTA6MDksIFJvZ2VyIFBhdSBNb25uw6kgd3Jv
dGU6Cj4gPiBPbiBNb24sIEZlYiAyNCwgMjAyMCBhdCAxMDowMjo1M0FNICswMDAwLCBKdWxpZW4g
R3JhbGwgd3JvdGU6Cj4gPiA+IEhpIFJvZ2VyLAo+ID4gPiAKPiA+ID4gVGhlIGxvZ2ljIGZvciBB
cm02NCBhbmQgQXJtMzIgbG9va3MgZ29vZCB0byBtZS4gSSBqdXN0IGhhdmUgb25lIHF1ZXN0aW9u
Cj4gPiA+IGJlbG93Lgo+ID4gPiAKPiA+ID4gT24gMjQvMDIvMjAyMCAwODo0MywgUm9nZXIgUGF1
IE1vbm5lIHdyb3RlOgo+ID4gPiA+IFRvIHg4NiBhbmQgQXJtLiBUaGlzIHBlcmZvcm1zIGFuIGF0
b21pYyBBTkQgb3BlcmF0aW9uIGFnYWluc3QgYW4KPiA+ID4gPiBhdG9taWNfdCB2YXJpYWJsZSB3
aXRoIHRoZSBwcm92aWRlZCBtYXNrLgo+ID4gPiA+IAo+ID4gPiA+IFJlcXVlc3RlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICAg
IHhlbi9pbmNsdWRlL2FzbS1hcm0vYXJtMzIvYXRvbWljLmggfCAxNyArKysrKysrKysrKysrKysr
Kwo+ID4gPiA+ICAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vYXJtNjQvYXRvbWljLmggfCAxNCArKysr
KysrKysrKysrKwo+ID4gPiA+ICAgIHhlbi9pbmNsdWRlL2FzbS14ODYvYXRvbWljLmggICAgICAg
fCAgOCArKysrKysrKwo+ID4gPiA+ICAgIDMgZmlsZXMgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygr
KQo+ID4gPiA+IAo+ID4gPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTMy
L2F0b21pYy5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9hcm0zMi9hdG9taWMuaAo+ID4gPiA+IGlu
ZGV4IGMwM2ViNjg0Y2QuLjQ2MzczODFiY2MgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEveGVuL2luY2x1
ZGUvYXNtLWFybS9hcm0zMi9hdG9taWMuaAo+ID4gPiA+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1h
cm0vYXJtMzIvYXRvbWljLmgKPiA+ID4gPiBAQCAtOTYsNiArOTYsMjMgQEAgc3RhdGljIGlubGlu
ZSBpbnQgYXRvbWljX3N1Yl9yZXR1cm4oaW50IGksIGF0b21pY190ICp2KQo+ID4gPiA+ICAgIAly
ZXR1cm4gcmVzdWx0Owo+ID4gPiA+ICAgIH0KPiA+ID4gPiArc3RhdGljIGlubGluZSB2b2lkIGF0
b21pY19hbmQodW5zaWduZWQgaW50IG0sIGF0b21pY190ICp2KQo+ID4gPiAKPiA+ID4gQWxsIHRo
ZSBhdG9taWMgaGVscGVycyBoYXZlIHRha2VuIGEgc2lnbmVkIGludCBzbyBmYXIgYmVjYXVzZSB0
aGUgY291bnRlciBpcwo+ID4gPiBhbiBpbnQuIEFueSByZWFzb24gdG8gZGl2ZXJnZSBmcm9tIHRo
YXQ/Cj4gPiAKPiA+IFNpbmNlIHRoaXMgaXMgbm90IGFuIGFyaXRobWV0aWMgb3BlcmF0aW9uIEkg
ZmVsdCB1bnNpZ25lZCBpbnQgd2FzIGEKPiA+IG1vcmUgc3VpdGFibGUgdHlwZSB0byBkZXNjcmli
ZSBhIGJpdG1hc2s6IGl0IGZlbHQgd2VpcmQgdG8gcGFzcyBhCj4gPiBiaXRtYXNrIHdpdGggdHlw
ZSBpbnQsIGJlY2F1c2Ugc2lnbmVkbmVzcyBkb2Vzbid0IG1ha2Ugc2Vuc2Ugd2hlbgo+ID4gcmVm
ZXJyaW5nIHRvIGEgbWFzay4KPiAKPiBBdCBzb21lIHBvaW50IEkgd291bGQgbGlrZSB0byBoYXZl
IG1hY3JvIGdlbmVyYXRpbmcgYWxsIHRoZSBhdG9taWNzIGluIG9uCj4gQXJtIGluIHRoZSBzYW1l
IHdheSBhIExpbnV4IChzZWUgYXNtLWdlbmVyaWMvYXRvbWljLmgpLiBUaGlzIGlzIHRvIGF2b2lk
Cj4gZHVwbGljYXRpb24gYW5kIG1ha2UgZWFzeSB0byBpbnRyb2R1Y2UgQXJtdjguMSBMU0UgYXRv
bWljcy4gU28gSSB3b3VsZCBsaWtlCj4gdG8gYXZvaWQgaW50cm9kdWNpbmcgZGlmZmVyZW5jZSBp
biB0aGUgcHJvdG90eXBlIHVubGVzcyBpdCBpcyBzdHJpY2x5Cj4gbmVjZXNzYXJ5LgoKV2h5IG5v
dCBoYXZlIHRoZSBtYWNybyBnZW5lcmF0b3IgZnVuY3Rpb24gZ2V0IHBhc3NlZCB0aGUgdHlwZSBv
ZiB0aGUKcGFyYW1ldGVyPwoKRWFzaWx5IGVub3VnaCB5b3UgY291bGQgZXZlbiBoYXZlIGEgc2Vj
b25kIHdyYXBwZXIgYXJvdW5kIHRoYXQKZ2VuZXJhdG9yIG1hY3JvLCBpZTogR0VOX0FUT01JQ197
QVJJVEhNRVRJQy9CSVRNQVNLfSBvciBzb21lIHN1Y2ggdGhhdApoaWRlcyB0aGUgcGFyYW1ldGVy
IHR5cGUgdW5kZXJuZWF0aC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
