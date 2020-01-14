Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE24613B1B1
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 19:08:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irQZQ-00059p-Jd; Tue, 14 Jan 2020 18:05:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aAXM=3D=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1irQZO-00059k-IS
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 18:05:38 +0000
X-Inumbo-ID: 72bfd550-36f8-11ea-b89f-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72bfd550-36f8-11ea-b89f-bc764e2007e4;
 Tue, 14 Jan 2020 18:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579025129;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=crf+I3wnXQ44AOltWJZ4HXcnTWZ7HnfpUxIZ9muk0MY=;
 b=e21hwtLhIWjyuoNwh4CRqfNnBI5PUKwSJZ/BnqF4DkmPDw9I6XYuj4zo
 FZmV9+xmnVTWQL1c5aIoxzxKSVbjG56Tlp2j9KlbCF6cxtb5tpSEV4E2S
 osmvMmMch1ZNhAk/B5ImhZ83B5/FS9DKAVBmhbUXsDTgtUs+f4v6er3MQ 0=;
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
IronPort-SDR: Sc3x1A6ID8s2CRScL6qhKxLOGme1y5VckC7IpP3FcCYuozqQgeLOBq5bi3GutB0/k9Jr+AM8RA
 mU85K38Cx6AHDCJrfOyNYaekmecteLwAasW/qnzbYI/JTz2nNowJ6DBTcM3GD857w6wHs7ItyB
 UpKil7h9e9V7Kl+DmQssouvx0GpMt/q8h+KeuP4d8vT+ZuAkYgXyennTr7jzIyA4+16qzA7idK
 QPlUNfnA23yAJeN611WaAszBuoKJT930wcyrXNLTy/rbPg6a/kmtIQk/ubIJMsfod6yRFdfh/4
 HZM=
X-SBRS: 2.7
X-MesageID: 11335295
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,319,1574139600"; d="scan'208";a="11335295"
Date: Tue, 14 Jan 2020 19:04:57 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
Message-ID: <20200114180457.GG11756@Air-de-Roger>
References: <ee0da83d3f054e72ae450437c8834d04@AMSPEX02CL02.citrite.net>
 <CAKf6xpujVs3RPJcb+2vqPZFcYwhdDcjbt=S_+awjPuPFpFHsPw@mail.gmail.com>
 <57dc1083d20a469785f05a2e5250a820@AMSPEX02CL02.citrite.net>
 <cd5f1ecc-576f-b7d0-3090-4f3e4faf6148@citrix.com>
 <CAKf6xpt4XYXn2xHJoVY_ibcaHSw-ED10V7ZGNKuDdkiJ93RS0A@mail.gmail.com>
 <20190322030936.fkiajz5ifgaejkd4@MacBook-Air-de-Roger.local>
 <CAKf6xptP_b-+FuscjsTK9G7pMeVS8drvA_t+xb5bdF2zxxmWfA@mail.gmail.com>
 <CAKf6xpscx9Yukphv7mfK2BPM8HoGW0ddt9zbOZxpV+9LzWxz4g@mail.gmail.com>
 <20200114100406.GF11756@Air-de-Roger>
 <CAKf6xpuDo=FGTOJ9ipmk7nY+qs+pKBWESqY0ah6B1vS3kZsT=A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKf6xpuDo=FGTOJ9ipmk7nY+qs+pKBWESqY0ah6B1vS3kZsT=A@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 6/6] xen-pt: Round pci regions sizes to
 XEN_PAGE_SIZE
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Simon Gaiser <simon@invisiblethingslab.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMTQsIDIwMjAgYXQgMDk6NDE6NDZBTSAtMDUwMCwgSmFzb24gQW5kcnl1ayB3
cm90ZToKPiBPbiBUdWUsIEphbiAxNCwgMjAyMCBhdCA1OjA0IEFNIFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIEphbiAxMywgMjAy
MCBhdCAwMjowMTo0N1BNIC0wNTAwLCBKYXNvbiBBbmRyeXVrIHdyb3RlOgo+ID4gPiBPbiBGcmks
IE1hciAyMiwgMjAxOSBhdCAzOjQzIFBNIEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNv
bT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBUaHUsIE1hciAyMSwgMjAxOSBhdCAxMTowOSBQ
TSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPiA+ID4g
Pgo+ID4gPiA+ID4gVGhlIHBhdGNoIGJlbG93IHNob3VsZCBwcmV2ZW50IGh2bWxvYWRlciBmcm9t
IHBsYWNpbmcgbXVsdGlwbGUgQkFScyBvbgo+ID4gPiA+ID4gdGhlIHNhbWUgcGFnZSwgY291bGQg
eW91IGdpdmUgaXQgYSB0cnk/Cj4gPiA+ID4gPgo+ID4gPiA+ID4gTm90ZSB0aGF0IHRoaXMgaXMg
bm90IGdvaW5nIHRvIHByZXZlbnQgdGhlIGd1ZXN0IGZyb20gbW92aW5nIHRob3NlCj4gPiA+ID4g
PiBCQVJzIGFyb3VuZCBhbmQgcGxhY2UgdGhlbSBpbiB0aGUgc2FtZSBwYWdlLCB0aHVzIGJyZWFr
aW5nIHRoZSBpbml0aWFsCj4gPiA+ID4gPiBwbGFjZW1lbnQgZG9uZSBieSBodm1sb2FkZXIuCj4g
PiA+ID4gPgo+ID4gPiA+ID4gVGhhbmtzLCBSb2dlci4KPiA+ID4gPgo+ID4gPiA+IEhpLCBSb2dl
ci4KPiA+ID4gPgo+ID4gPiA+IEkndmUgbWluaW1hbGx5IHRlc3RlZCB0aGlzLiAgWWVzLCB0aGlz
IHBhdGNoIHNlZW1zIHRvIHBsYWNlIHNtYWxsIEJBUnMKPiA+ID4gPiBpbnRvIHNlcGFyYXRlIHBh
Z2VzLiAgVGhlIGxpbnV4IHN0dWJkb20gYW5kIFFFTVUgdGhlbiB1c2UgdGhlIHNwYWNpbmcKPiA+
ID4gPiBhcyBwcm92aWRlZCBieSBodm1sb2FkZXIuCj4gPiA+Cj4gPiA+IFJvZ2VyLAo+ID4gPgo+
ID4gPiBXb3VsZCB5b3UgbWluZCBzdWJtaXR0aW5nIHRoaXMgcGF0Y2ggdG8gWGVuPwo+ID4KPiA+
IEhtLCBJJ20gaGFsZiBtaW5kZWQgcmVnYXJkaW5nIHRoaXMgcGF0Y2guIEl0IGZlZWxzIG1vcmUg
bGlrZSBhIGJhbmRhaWQKPiA+IHRoYW4gYSBwcm9wZXIgc29sdXRpb24uIE1hcHBpbmcgQkFScyBu
b3QgbXVsdGlwbGUgb2YgcGFnZS1zaXplcyBpcwo+ID4gZGFuZ2Vyb3VzIGJlY2F1c2UgQUZBSUsg
dGhlcmUncyBubyBlbnRpdHkgdGhhdCBhc3NlcnRzIHRoZXJlIGlzbid0IGFueQo+ID4gb3RoZXIg
QkFSIGZyb20gYSBkaWZmZXJlbnQgZGV2aWNlIG9uIHRoZSBzYW1lIHBhZ2UsIGFuZCBoZW5jZSB5
b3UKPiA+IG1pZ2h0IGVuZCB1cCBtYXBwaW5nIHNvbWUgTU1JTyByZWdpb24gZnJvbSBhbm90aGVy
IGRldmljZQo+ID4gaW5hZHZlcnRlbnRseS4KPiAKPiBXZSBoYXZlIHRoZSBndWVzdCwgbGludXgg
c3R1YmRvbSB3aXRoIHFlbXUsICYgZG9tMC4gQXJlIHlvdSBjb25jZXJuZWQKPiB0aGF0IGFsbCBv
ZiB0aGVtIG5lZWQgYSBtaW5pbXVtIG9mIHBhZ2UgYWxpZ25tZW50PwoKTm8sIG5vdCByZWFsbHku
IFRoZSBoYXJkd2FyZSBkb21haW4gKGRvbTAgaW4gbm9ybWFsIGRlcGxveW1lbnRzKQpzaG91bGQg
YmUgdGhlIG9uZSB0aGF0IG1ha2VzIHN1cmUgdGhlcmUgYXJlIG5vIEJBUnMgc2hhcmluZyBwaHlz
aWNhbApwYWdlcy4KCj4gTGludXggUENJIHN1YnN5dGVtIGhhcyBhbiBvcHRpb24gcmVzb3VyY2Vf
YWxpZ25tZW50IHRoYXQgY2FuIGJlCj4gYXBwbGllZCB0byBlaXRoZXIgYSBzaW5nbGUgZGV2aWNl
IG9yIGFsbCBkZXZpY2VzLiAgQm9vdGluZyB3aXRoCj4gcGNpPXJlc291cmNlX2FsaWdtZW50PTQw
OTYgd2lsbCBhbGlnbiBlYWNoIGRldmljZSB0byBhIHBhZ2UuICBEbyB5b3UKPiB0aGluayBwY2li
YWNrIHNob3VsZCBmb3JjZSByZXNvdXJjZV9hbGlnbm1lbnQ9NDA5NiBmb3IgZG9tMD8KCklkZWFs
bHkgWGVuIHNob3VsZCBrZWVwIHRyYWNrIG9mIHRoZSBCQVJzIHBvc2l0aW9uIGFuZCBzaXplIGFu
ZCByZWZ1c2UKdG8gcGFzc3Rocm91Z2ggZGV2aWNlcyB0aGF0IGhhdmUgQkFScyBzaGFyaW5nIGEg
cGFnZSB3aXRoIG90aGVyCmRldmljZXMgQkFScy4KCj4gQXJlCj4gdGhlcmUgb3RoZXIgTU1JTyBy
YW5nZXMgdG8gYmUgY29uY2VybmVkIGFib3V0IGFkamFjZW50IHRvIEJBUnM/CgpJSVJDIHlvdSBj
YW4gaGF2ZSB0d28gQkFScyBvZiBkaWZmZXJlbnQgZGV2aWNlcyBpbiB0aGUgc2FtZSA0SyBwYWdl
LApCQVJzIGFyZSBvbmx5IGFsaWduZWQgdG8gaXQncyBzaXplLCBzbyBCQVJzIHNtYWxsZXIgdGhh
biA0SyBhcmUgbm90CnJlcXVpcmVkIHRvIGJlIHBhZ2UgYWxpZ25lZC4KCj4gT24gbXkgb25lIHRl
c3QgbWFjaGluZSB3aXRoIGEgQkFSIHNtYWxsZXIgdGhhbiA0MDk2LCB0aGUgZmlybXdhcmUKPiBh
bHJlYWR5IHNldHMgYW4gYWxpZ25tZW50IG9mIDQwOTYuICBMaW51eCBkb20wIHNlZW1zIHRvIGtl
ZXAgdGhlCj4gZmlybXdhcmUgQkFSIGFsaWdubWVudCBieSBkZWZhdWx0LgoKVGhlIFBDSSBzcGVj
IHJlY29tbWVuZCBCQVJzIHRvIGJlIHNpemVkIHRvIGEgbXVsdGlwbGUgb2YgYSBwYWdlIHNpemUs
IGJ1dApzYWRseSB0aGF0J3Mgbm90IGEgbWFuZGF0b3J5IHJlcXVpcmVtZW50LgoKV2lsbCBzdWJt
aXQgdGhlIHBhdGNoIG5vdywgdGhhbmtzIGZvciB0aGUgcGluZywgSSBjb21wbGV0ZWx5IGZvcmdv
dAphYm91dCB0aGlzIFRCSC4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
