Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CAF76EC9
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 18:20:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr2uQ-0006BO-AS; Fri, 26 Jul 2019 16:17:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NxDH=VX=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hr2uO-0006BJ-Sw
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 16:17:28 +0000
X-Inumbo-ID: dbc900b3-afc0-11e9-8980-bc764e045a96
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dbc900b3-afc0-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 16:17:27 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r1so55013808wrl.7
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 09:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=NcMsb9by7jwnkgbOtFtBxn+MWREdDrkUh0AKPdJgXMM=;
 b=EEnQq8acXlrS3cQu3f5FIsTeCFNKyhar6IFE8/VB+OryLnro+NhkCOtrOG02LUi4cw
 M0jbIMFbfJplfep1DwykauA1rLPb6PFsx4kMnkStQwfrz087bCQfuqHg0g3m+3Vz/9XP
 fgRT0OeEIiF3TMii2PTHvnrOQzmea2t0XRhG4fyJN+125lSrZ9ZivfG3gmQ6VMENeP1D
 ohn4WjP+VMJhlOIw+89V5MyoFnBgUlQ4vU/XfjzudwfJXoxExt+punTDjqoKXQhg2rVl
 OKe5KQRdtPAFPM+Fd1IkF0k3VsT2JJzaTsr9rH74v3dbqli9e+WrjJP8b+Udctn4HRgX
 hD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=NcMsb9by7jwnkgbOtFtBxn+MWREdDrkUh0AKPdJgXMM=;
 b=UdvVYzZqgjmnrNziObGG8fWHiJBF8RZMMOdGrJH7EG8WQyKznW52ttSF4S9kNAKtFZ
 uSwoZ56OvTV/53XtN8Xkp9BmpJbIdtS27YVVtDF5vSkEqd8RLg/YIR++d5xRN0B4FLjm
 V7DtyBWfdr432sAklfi84V5augoSEYOzWmwu8fX2PCC8s39Srotq9bV0sS5bH5Xs5I4i
 FeM19902986KcyHRnvykx/VA3FOjagvxbwJg0YAwct325tCV6SrFRMm/sb6ZNDH/FB0m
 4rG/349jDM4Uhfh+mNWVU9DIz1i9pbpNigj3ytpJOjvbnKxRMPXy8689IvHw59CeJDgX
 0ddQ==
X-Gm-Message-State: APjAAAWiToB39IdlC7kcjFIuQ64kMX0VJ94C50gyGltgWrpsfcVvMVnC
 6UbX0B/dMCrmg1HtxpKqxTA=
X-Google-Smtp-Source: APXvYqwnjXlL7hkVF/vNfvBimVLbLt/WuDG3Uw+1PXHz9yWL2EzTmGPbvyA3hEb1VPDQiruzLD6HpQ==
X-Received: by 2002:adf:dcc6:: with SMTP id x6mr74114449wrm.322.1564157845750; 
 Fri, 26 Jul 2019 09:17:25 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:ac18:da00:1d44:aeab:d929:303?
 ([2a02:c7f:ac18:da00:1d44:aeab:d929:303])
 by smtp.gmail.com with ESMTPSA id a84sm63643995wmf.29.2019.07.26.09.17.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 09:17:25 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
From: Lars Kurth <lars.kurth.xen@gmail.com>
In-Reply-To: <20190726071758.geuxwscfhs2zftfr@Air-de-Roger>
Date: Fri, 26 Jul 2019 17:17:22 +0100
Message-Id: <49FE39B5-BDC8-43D6-8940-A4BDA6D22F62@gmail.com>
References: <20190725135112.83569-1-roger.pau@citrix.com>
 <AC845283-0555-4296-97B4-EDFB6A4C5882@gmail.com>
 <20190726071758.geuxwscfhs2zftfr@Air-de-Roger>
To: Roger Pau Monne <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Lukasz Hawrylko <lukasz.hawrylko@intel.com>,
 Shane Wang <shane.wang@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Rich Persaud <persaur@gmail.com>
X-Mailer: Apple Mail (2.3445.9.1)
Subject: Re: [Xen-devel] [PATCH] tboot: remove maintainers and declare
 orphaned
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
Cc: =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, tboot-devel@lists.sourceforge.net,
 "Tim \(Xen.org\)" <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>,
 Julien Grall <julien.grall@arm.com>, 'Jan Beulich' <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDI2IEp1bCAyMDE5LCBhdCAwODoxNywgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+IHdyb3RlOgo+IAo+IE9uIFRodSwgSnVsIDI1LCAyMDE5IGF0IDAzOjA4OjA3
UE0gLTA0MDAsIFJpY2ggUGVyc2F1ZCB3cm90ZToKPj4gKGNjIEludGVsIGFuZCB0Ym9vdC1kZXZl
bCkKPj4gCj4+IEhpIFJvZ2VyLAo+PiAKPj4gVGhhbmtzIGZvciB5b3VyIGludGVyZXN0IGluIGRv
Y3VtZW50aW5nIHRoZSBzdGF0dXMgb2YgbWFpbnRlbmFuY2UgZm9yIEludGVsIFRYVCBzdXBwb3J0
IGluIFhlbi4gIEludGVsIFRYVCBhbmQgWGVuIGFyZSBkZXBsb3llZCBpbiBwcm9kdWN0aW9uIHRv
ZGF5IGJ5IE9wZW5YVCBhbmQgUXViZXNPUyBmb3IgYm9vdCBpbnRlZ3JpdHkuICBYZW4gd2FzIGEg
cGlvbmVlcmluZyBhZG9wdGVyIG9mIERSVE0sIGFsbW9zdCBhIGRlY2FkZSBhZ28sIGJ1dCBtYWlu
c3RyZWFtIGVudGVycHJpc2UgY29tcHV0aW5nIGlzIG5vdyBjYXRjaGluZyB1cCB3aXRoIHRoZSBN
YXkgMjAxOSByZWxlYXNlIG9mIFdpbmRvd3MgMTAgU3lzdGVtR3VhcmQuICBJdCB3b3VsZCBiZSBu
aWNlIHRvIGF2b2lkICJvcnBoYW5pbmciIG9uZSBvZiBYZW4ncyBjb21wZXRpdGl2ZSBhZHZhbnRh
Z2VzIGluIDIwMTkuCj4gCj4gVGhhbmtzIGZvciB0aGUgZmVlZGJhY2shIEp1c3QgdG8gYmUgY2xl
YXIsIHRoaXMgaXMgbm90IGEgcGxhbiB0bwo+IHJlbW92ZSB0aGUgdGJvb3QgY29kZSBmcm9tIFhl
biBpbiBhbnkgd2F5LCBpdCdzIGp1c3QgYSBJTU8gbmVlZGVkIHN0ZXAKPiBpbiBvcmRlciB0byBy
ZWZsZWN0IHRoZSBjdXJyZW50IG1haW50YWluZXJzaGlwIHN0YXR1cyBvZiB0aGUgY29kZSwgYW5k
Cj4gbGlrZWx5IGEgd2F5IHRvIG1vdmUgZm9yd2FyZCwgcGxlYXNlIHNlZSBiZWxvdy4KCgo+Pj4g
T24gSnVsIDI1LCAyMDE5LCBhdCAwOTo1MSwgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4gd3JvdGU6Cj4+PiAKPj4+IEdhbmcgV2VpIEludGVsIGVtYWlsIGFkZHJlc3MgaGFz
IGJlZW4gYm91bmNpbmcgZm9yIHNvbWUgdGltZSBub3csCj4+IAo+PiBHYW5nIFdlaSdzIHJlcGxh
Y2VtZW50IGlzIEx1a2FzeiBIYXdyeWxrbywgd2hvIHBvc3RlZCBvbiBNYXJjaCA2LCAyMDE5Ogo+
PiBodHRwczovL2xpc3RzLmd0Lm5ldC94ZW4vZGV2ZWwvNTQ2NDAxCj4+IAo+PiBDb3VsZCB5b3Ug
aW5jbHVkZSBMdWthc3ogcGF0Y2gsIGFsb25nIHdpdGggSnVsaWVuJ3MgcmVxdWVzdGVkIGZvcm1h
dHRpbmcgY2hhbmdlcywgaW4geW91ciB1cGRhdGUgdG8gdGhlIE1BSU5UQUlORVJTIGZpbGU/Cj4g
Cj4gSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgaWYgTHVrYXN6IGNvdWxkIHJlc2VuZCBoaXMg
cGF0Y2gsIG5vdyB0aGF0Cj4gdGhlIHNlY3Rpb24gZW50cnkgaXMgb3JwaGFuZWQgd2UgY2FuIGFk
ZC9yZW1vdmUgcmV2aWV3ZXJzIGFuZAo+IG1haW50YWluZXJzIHdpdGhvdXQgYmVpbmcgYmxvY2tl
ZC4KCkkgYWRkZWQgVGFtYXMgd2hvIEkgYmVsaWV2ZSB3b3JrcyBmb3IgSW50ZWwgaW4gdGhlIHNl
Y3VyaXR5IGFyZWEgYW5kIG1heWJlIGhlIGNhbiBjb25uZWN0IHNvbWUgZG90cyBoZXJlLiBJIGJl
bGlldmUgdGhhdCBJbnRlbCdzIHNlY3VyaXR5IG9yZ2FuaXNhdGlvbiBpcyBlbnRpcmVseSBkaWZm
ZXJlbnQgZnJvbSBvdXIgbm9ybWFsIGludGVyZmFjZXMgd2l0aCBJbnRlbCwgc28gaGUgbWF5IGJl
IGFibGUgdG8gaGVscC4gCgpATHVrYXN6OiBjb3VsZCB5b3UgcmUtc2VuZCB0aGUgcGF0Y2ggcmVs
YXRlZCB0byBtYWludGFpbmVyc2hpcCBhZnRlciB0aGUgcGF0Y2ggaGFzIGJlZW4gYXBwbGllZD8g
UmVnYXJkaW5nIEphbidzIGFuZCBKdWxpZW4ncyBjb25jZXJucyBhYm91dCBhd2FyZGluZyBtYWlu
dGFpbmVyc2hpcCBzdHJhaWdodCBhd2F5LiBXZSB0ZW5kIHRvIGFzayBwcm9zcGVjdGl2ZSBtYWlu
dGFpbmVycyB3aG8gZG9uJ3QgaGF2ZSBhIHRyYWNrIHJlY29yZCBvZiByZXZpZXdpbmcgY29kZSBp
biB0aGUgY29tbXVuaXR5IHRvIHN0YXJ0IGFzIHJldmlld2Vycy4gQW4gZXhhbXBsZSBvZiB0aGlz
IGlzIHRoZSBWTSBFVkVOVCwgTUVNIEFDQ0VTUyBhbmQgTU9OSVRPUiBjb21wb25lbnQgd2hlcmUg
UmF6dmFuIGlzIGhhbmRpbmcgb3ZlciBtYWludGFpbmVyc2hpcCB0byB0d28gb3RoZXIgYml0ZGVm
ZW5kZXIgc3RhZmYgbWVtYmVycy4gSW4gcHJhY3RpY2UsIHRoaXMgbWFrZXMgbm90IGEgbG90IG9m
IGRpZmZlcmVuY2UgaWYgeW91IHJldmlldyBjb250cmlidXRpb25zIHRvIFRYVC4gCgpSZWdhcmRp
bmcgcmVtb3ZpbmcgU2hhbmUgV2FuZyBhcyBtYWludGFpbmVyLCB0aGUgY2FzZSBmb3IgdGhpcyBp
cyBzb21ld2hhdCBzdHJvbmdlciB0aGFuIHNpbXBseSBub3QgcmVwbHlpbmcgdG8gWzBdLiBUaGUg
bGFzdCBtYWlsIFNoYW5lIHNlbnQgdG8geGVuLWRldmVsQCB3YXMgaW4gMjAxMS4gVGhpcyAtIGFj
Y29yZGluZyB0byBoaXMgTGlua2VkSW4gcHJvZmlsZSAtIHJlbGF0ZXMgdG8gYSBjYXJlZXIgY2hh
bmdlIHRvd2FyZHMgYmVjb21pbmcgYSBtYW5hZ2VyIGFuZCBiZWluZyByZXNwb25zaWJsZSBmb3Ig
Y29tcG9uZW50cyB0aGF0IGFyZSBub3QgcmVsYXRlZCB0byB2aXJ0dWFsaXNhdGlvbi4gU2hhbmUg
c2hvdWxkIHByb2JhYmx5IGhhdmUgc3RlcHBlZCBkb3duIGFzIGEgbWFpbnRhaW5lciBwcm8tYWN0
aXZlbHksIGJ1dCB3ZSBub3JtYWxseSBkb24ndCByZW1vdmUgbWFpbnRhaW5lcnMgdW5sZXNzIHRo
ZXJlIGlzIGEgcHJvYmxlbS4gQ2xlYXJseSB0aGUgbGFjayBvZiBhIHJlc3BvbnNpdmUgbWFpbnRh
aW5lciBpcyBub3cgYSBwcm9ibGVtOiB3ZSBhbHJlYWR5IGhhdmUgYmVlbiB1bmFibGUgdG8gaW5z
dGF0ZSBMdWthc3ogYXMgbWFpbnRhaW5lciBpbiBNYXJjaCBmb3IgdGhhdCByZWFzb24gYXMgdGVj
aG5pY2FsbHkgYW4gQUNLIGZyb20gYW4gZXhpc3RpbmcgbWFpbnRhaW5lciBpcyBuZWVkZWQuCgpA
Um9nZXI6IHRoaXMgc2hvdWxkIGJlIHJlY29yZGVkIGluIHRoZSBjb21taXQgbWVzc2FnZS4gSSB3
b3VsZCBhbHNvIHN1Z2dlc3QgeW91IHJlZmVyIHRvIHRoZSB0aHJlYWQgcmVsYXRlZCB0byBMdWth
c3ogdGFraW5nIG92ZXIgbWFpbnRhaW5lcnNoaXAsIHdoaWNoIHdhcyBlc3NlbnRpYWxseSBibG9j
a2VkIGJlY2F1c2UgR2FuZyBoYWQgcHJvYmFibHkgc2VudCB0aGUgbWFpbnRhaW5lcnNoaXAgY2hh
bmdlIHJlcXVlc3QgdG9vIGxhdGUgYW5kIGNvdWxkbid0IEFDSyBpdCBiZWNhdXNlIGhlIHByb2Jh
Ymx5IGRpZG4ndCBoYXZlIGFjY2VzcyB0byBoaXMgSW50ZWwgZW1haWwgYWRkcmVzcyBhbnltb3Jl
LgoKU28gSSB0aGluayByZW1vdmluZyBTaGFuZSBpcyBmYWlyIGVub3VnaC4gSW4gcGFydGljdWxh
ciBpZiBpdCBoZWxwcyBpbnN0YXRlIGEgcmVwbGFjZW1lbnQgbWFpbnRhaW5lci4gCgo+PiBBcyBh
IG5ldyBYZW4gbWFpbnRhaW5lciBhbmQgY29udHJpYnV0b3IsIEx1a2FzeiBtYXkgbm90IHlldCBi
ZSBmYW1pbGlhciB3aXRoIHRoZSBwcm9jZWR1cmVzIGFuZCBwcmFjdGljZXMgb2YgdGhlIFhlbiBj
b21tdW5pdHkuICBXZSBjYW4gd2VsY29tZSBoaXMgbmV3IG1haW50YWluZXJzaGlwIHJvbGUgd2l0
aG91dCBkcm9wcGluZyBzdXBwb3J0IGZvciBhIGZlYXR1cmUsIHRoYXQgKGEpIGhlIGlzIG1haW50
YWluaW5nLCAoYikgaXMgdXNlZCBieSBYZW4uCj4gCj4gU3VyZSwgbXkgcGxhbiBpcyB0byBkZWNs
YXJlIHRoZSBzdXBwb3J0IG9ycGhhbmVkLCBzbyB0aGF0IEx1a2FzeiAob3IKPiBhbnlvbmUgd2hv
IGhhcyBpbnRlcmVzdCBpbiB0aGlzIGNvZGUpIGNhbiBiZSBhZGRlZCBhcyBhIHJldmlld2VyCj4g
YWZ0ZXJ3YXJkcyB3aXRob3V0IHVzIGJlaW5nIGJsb2NrZWQgb24gYW4gQWNrIGZyb20gU2hhbmUg
V2FuZywgd2hvIGlzCj4gdW5yZXNwb25zaXZlIChhcyBwZXIgdGhlIHRocmVhZCBwb2ludGVkIHRv
IGluIHRoZSBjb21taXQgbWVzc2FnZSkuCgoKPj4+IGFuZAo+Pj4gdGhlIG90aGVyIG1haW50YWlu
ZXIgaXMgbm9uLXJlc3BvbnNpdmUgdG8gcGF0Y2hlcyBbMF0sIHNvIHJlbW92ZQo+Pj4gbWFpbnRh
aW5lcnMgYW5kIGRlY2xhcmUgSU5URUwoUikgVFJVU1RFRCBFWEVDVVRJT04gVEVDSE5PTE9HWSAo
VFhUKQo+Pj4gb3JwaGFuZWQuCj4+PiAKPj4+IFswXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDUvbXNnMDA1NjMuaHRtbAo+PiAKPj4g
U2luY2Ugd2UgaGF2ZSBhdCBsZWFzdCBvbmUgSW50ZWwgbWFpbnRhaW5lciwgTHVrYXN6LCB0aGUg
ZmVhdHVyZSBuZWVkIG5vdCBiZSBvcnBoYW5lZC4gIElmIFNoYXduIGlzIG5vdCByZXNwb25kaW5n
IHRvIHRoZSByZXF1ZXN0IHRvIGNvbmZpcm0gTHVrYXN6IGFzIG1haW50YWluZXIsIHRoZSBYZW4g
Y29tbXVuaXR5IGhhcyBtdWx0aXBsZSBjb21tdW5pY2F0aW9uIGNoYW5uZWxzIHdpdGggSW50ZWwu
ICBQcmFnbWF0aWNhbGx5LCBhIHJldmlldyBvZiB0aGUgdGJvb3QtZGV2ZWwgYXJjaGl2ZXMgc2hv
d3MgdGhhdCBMdWthc3ogaXMgd29ya2luZyBvbiB0Ym9vdCBkZXZlbG9wbWVudC4gIAo+IAo+IFRo
ZSBvcnBoYW5lZCBzdGVwIGlzIElNTyBuZWVkZWQgaW4gb3JkZXIgdG8gbW92ZSBmb3J3YXJkIGFu
ZCBhZGQgYSBuZXcKPiByZXZpZXdlci9tYWludGFpbmVyLiBXaXRob3V0IHJlbW92aW5nIHRoZSBj
dXJyZW50IG1haW50YWluZXJzIGFuZAo+IGRlY2xhcmluZyBpdCBvcnBoYW5lZCB3ZSB3b3VsZCBi
ZSBibG9ja2VkIG9uIGFuIEFjayBmcm9tIFNoYW5lIFdhbmcgaW4KPiBvcmRlciB0byBhZGQgb3Ig
cmVtb3ZlIG1haW50YWluZXJzLiBSZW1vdmluZyBjdXJyZW50IG1haW50YWluZXJzIGFuZAo+IGFk
ZGluZyBMdWthc3ogaW4gdGhlIHNhbWUgcGF0Y2ggd291bGQgc3RpbGwgcmVxdWlyZSBhbiBBY2sg
ZnJvbSB0aGUKPiBjdXJyZW50IG93bmVycy4KCkBBbGw6IHdlIHByb2JhYmx5IG5lZWQgdG8gbG9v
ayBhdCB0aGUgaGFuZC1vdmVyIG9mIG1haW50YWluZXJzaGlwLCBnaXZlbiB0aGlzIGlzc3VlLiBX
ZSBzaG91bGQgcmVhbGx5IG5vdCBiZSBpbiB0aGlzIHBvc2l0aW9uIGFuZCBzaG91bGQgaGF2ZSBh
IHdheSB0byBkZWFsIHdpdGggdGhpcyBpbiBhIG1vcmUgZWZmaWNpZW50IHdheS4gCgoKQmVzdCBS
ZWdhcmRzCkxhcnMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
