Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55903134A40
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 19:10:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipFjx-00080z-1s; Wed, 08 Jan 2020 18:07:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W/T5=25=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ipFjv-00080u-Cq
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 18:07:31 +0000
X-Inumbo-ID: bc442322-3241-11ea-b872-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc442322-3241-11ea-b872-12813bfff9fa;
 Wed, 08 Jan 2020 18:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578506850;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5b6ekiQsbtrXRYceFG87g3hFRHbpw/Ysz69GV6LjYqM=;
 b=K4zyA4qy284VZV5oJfLJmRgKI/Nfps5VEfdYapYJCyl2FmO8vufQCQji
 LikUI2IorQIEqNrqieLkJIJLLzXA5XvmUTUnon4n8/g8kIsc3vDOCo2Sb
 iq4wafs2WzupZVtqDJ4AvMc04y+ztNpWCqNSM87M78nQrxCkrfh/IYeBp I=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /V/4X7J+IAudgBaFRfvRoIQ38xMpeqqICorxsbMGlLLPvGoYDshiCQnuRdAR+jFAIpUTK35x9h
 S914ImO87IBYZK88dPfxgSO7hMcbMu4Zg3+yJx3GWlAdd8PuxZMeLcrXZdl7oeRbkvwdR+NRqm
 wjy4YtfBY1RfHylauq1jhJ3cOCrVRuQE89bpQfGI3fFfktbGwTupdy1HPIupe6gzwJkW2tK2lQ
 aATHg7Rpeyie8QcT6LZPh4kNMWJb8/xvguJuty1wVNo03by0ev0GM2ut647d1Fpub3v6484JpA
 LmI=
X-SBRS: 2.7
X-MesageID: 10657025
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,410,1571716800"; d="scan'208";a="10657025"
Date: Wed, 8 Jan 2020 19:07:22 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: George Dunlap <george.dunlap@citrix.com>
Message-ID: <20200108180722.GU11756@Air-de-Roger>
References: <20191230175900.GF11756@Air-de-Roger>
 <CABfawhkiB=6zvTo6TBCE6y_-to65DFGDVRcqk7ANpSGdwwveFQ@mail.gmail.com>
 <3ff918fc-02a3-1413-4135-a378d65a19ab@xen.org>
 <CABfawh=Wvn16sWp8_MPy0kGAp-OhkCmug4nY272igyg+u4PKBw@mail.gmail.com>
 <CAF3u54B2+3q90jFftH+ZcuhdH6i8cOEpjiOjrVdNJCiBSzBtng@mail.gmail.com>
 <CABfawh=F8dsn4LLtdfYR4nb0djaswofEioDtqi2TKVJ0zCBK0Q@mail.gmail.com>
 <20191231104022.GG11756@Air-de-Roger>
 <CABfawh=tDFzsp61MmFxpmcBbNT2GXa4C=-eXD=044L1gdxPEpw@mail.gmail.com>
 <20191231151107.GJ11756@Air-de-Roger>
 <e05a394d-b5da-85aa-7196-c89664a0a358@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e05a394d-b5da-85aa-7196-c89664a0a358@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 00/20] VM forking
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@gmail.com>,
 Alexandru
 Isaila <aisaila@bitdefender.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMDgsIDIwMjAgYXQgMDQ6MzQ6NDlQTSArMDAwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiAxMi8zMS8xOSAzOjExIFBNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4g
T24gVHVlLCBEZWMgMzEsIDIwMTkgYXQgMDg6MDA6MTdBTSAtMDcwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+ID4+IE9uIFR1ZSwgRGVjIDMxLCAyMDE5IGF0IDM6NDAgQU0gUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+Pgo+ID4+PiBPbiBNb24sIERl
YyAzMCwgMjAxOSBhdCAwNTozNzozOFBNIC0wNzAwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4g
Pj4+PiBPbiBNb24sIERlYyAzMCwgMjAxOSBhdCA1OjIwIFBNIEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPj4+Pj4KPiA+Pj4+PiBIaSwKPiA+Pj4+Pgo+ID4+
Pj4+IE9uIE1vbiwgMzAgRGVjIDIwMTksIDIwOjQ5IFRhbWFzIEsgTGVuZ3llbCwgPHRhbWFzQHRr
bGVuZ3llbC5jb20+IHdyb3RlOgo+ID4+Pj4+Pgo+ID4+Pj4+PiBPbiBNb24sIERlYyAzMCwgMjAx
OSBhdCAxMTo0MyBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToKPiA+Pj4+
Pj4gQnV0IGtlZXAgaW4gbWluZCB0aGF0IHRoZSAiZm9yay12bSIgY29tbWFuZCBldmVuIHdpdGgg
dGhpcyB1cGRhdGUKPiA+Pj4+Pj4gd291bGQgc3RpbGwgbm90IHByb2R1Y2UgZm9yIHlvdSBhICJm
dWxseSBmdW5jdGlvbmFsIiBWTSBvbiBpdHMgb3duLgo+ID4+Pj4+PiBUaGUgdXNlciBzdGlsbCBo
YXMgdG8gcHJvZHVjZSBhIG5ldyBWTSBjb25maWcgZmlsZSwgY3JlYXRlIHRoZSBuZXcKPiA+Pj4+
Pj4gZGlzaywgc2F2ZSB0aGUgUUVNVSBzdGF0ZSwgZXRjLgo+ID4+Pgo+ID4+PiBJTU8gdGhlIGRl
ZmF1bHQgYmVoYXZpb3Igb2YgdGhlIGZvcmsgY29tbWFuZCBzaG91bGQgYmUgdG8gbGVhdmUgdGhl
Cj4gPj4+IG9yaWdpbmFsIFZNIHBhdXNlZCwgc28gdGhhdCB5b3UgY2FuIGNvbnRpbnVlIHVzaW5n
IHRoZSBzYW1lIGRpc2sgYW5kCj4gPj4+IG5ldHdvcmsgY29uZmlnIGluIHRoZSBmb3JrIGFuZCB5
b3Ugd29uJ3QgbmVlZCB0byBwYXNzIGEgbmV3IGNvbmZpZwo+ID4+PiBmaWxlLgo+ID4+Pgo+ID4+
PiBBcyBKdWxpZW4gYWxyZWFkeSBzYWlkLCBtYXliZSBJIHdhc24ndCBjbGVhciBpbiBteSBwcmV2
aW91cyByZXBsaWVzOgo+ID4+PiBJJ20gbm90IGFza2luZyB5b3UgdG8gaW1wbGVtZW50IGFsbCB0
aGlzLCBpdCdzIGZpbmUgaWYgdGhlCj4gPj4+IGltcGxlbWVudGF0aW9uIG9mIHRoZSBmb3JrLXZt
IHhsIGNvbW1hbmQgcmVxdWlyZXMgeW91IHRvIHBhc3MgY2VydGFpbgo+ID4+PiBvcHRpb25zLCBh
bmQgdGhhdCB0aGUgZGVmYXVsdCBiZWhhdmlvciBpcyBub3QgaW1wbGVtZW50ZWQuCj4gPj4+Cj4g
Pj4+IFdlIG5lZWQgYW4gaW50ZXJmYWNlIHRoYXQncyBzYW5lLCBhbmQgdGhhdCdzIGRlc2lnbmVk
IHRvIGJlIGVhc3kgYW5kCj4gPj4+IGNvbXByZWhlbnNpdmUgdG8gdXNlLCBub3QgYW4gaW50ZXJm
YWNlIGJ1aWx0IGFyb3VuZCB3aGF0J3MgY3VycmVudGx5Cj4gPj4+IGltcGxlbWVudGVkLgo+ID4+
Cj4gPj4gT0ssIHNvIEkgdGhpbmsgdGhhdCB3b3VsZCBsb29rIGxpa2UgInhsIGZvcmstdm0gPHBh
cmVudF9kb21pZD4iIHdpdGgKPiA+PiBhZGRpdGlvbmFsIG9wdGlvbnMgZm9yIHRoaW5ncyBsaWtl
IG5hbWUsIGRpc2ssIHZsYW4sIG9yIGEgY29tcGxldGVseQo+ID4+IG5ldyBjb25maWcsIGFsbCBv
ZiB3aGljaCBhcmUgY3VycmVudGx5IG5vdCBpbXBsZW1lbnRlZCwgKyBhbgo+ID4+IGFkZGl0aW9u
YWwgb3B0aW9uIHRvIG5vdCBsYXVuY2ggUUVNVSBhdCBhbGwsIHdoaWNoIHdvdWxkIGJlIHRoZSBv
bmx5Cj4gPj4gb25lIGN1cnJlbnRseSB3b3JraW5nLiBBbHNvIGtlZXBpbmcgdGhlIHNlcGFyYXRl
ICJ4bCBmb3JrLWxhdW5jaC1kbSIKPiA+PiBhcyBpcy4gSXMgdGhhdCB3aGF0IHdlIGFyZSB0YWxr
aW5nIGFib3V0Pwo+ID4gCj4gPiBJIHRoaW5rIGZvcmstbGF1bmNoLXZtIHNob3VsZCBqdXN0IGJl
IGFuIG9wdGlvbiBvZiBmb3JrLXZtIChpZToKPiA+IC0tbGF1bmNoLWRtLW9ubHkgb3Igc29tZSBz
dWNoKS4gSSBkb24ndCB0aGluayB0aGVyZSdzIGEgcmVhc29uIHRvIGhhdmUKPiA+IGEgc2VwYXJh
dGUgdG9wLWxldmVsIGNvbW1hbmQgdG8ganVzdCBsYXVuY2ggdGhlIGRldmljZSBtb2RlbC4KPiAK
PiBTbyBmaXJzdCBvZiBhbGwsIFRhbWFzIC0tIGRvIHlvdSBhY3R1YWxseSBuZWVkIHRvIGV4ZWMg
eGwgaGVyZT8gIFdvdWxkCj4gaXQgbWFrZSBzZW5zZSBmb3IgdGhlc2UgdG8gc3RhcnQgb3V0IHNp
bXBseSBhcyBsaWJ4bCBmdW5jdGlvbnMgdGhhdCBhcmUKPiBjYWxsZWQgYnkgeW91ciBzeXN0ZW0/
Cj4gCj4gSSBhY3R1YWxseSBkaXNhZ3JlZSB0aGF0IHdlIHdhbnQgYSBzaW5nbGUgY29tbWFuZCB0
byBkbyBhbGwgb2YgdGhlc2UuCj4gSWYgd2UgZGlkIHdhbnQgYGV4ZWMgeGxgIHRvIGJlIG9uZSBv
ZiB0aGUgc3VwcG9ydGVkIGludGVyZmFjZXMsIEkgdGhpbmsKPiBpdCB3b3VsZCBicmVhayBkb3du
IHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4gCj4gYHhsIGZvcmstZG9tYWluYDogT25seSBmb3JrcyB0
aGUgZG9tYWluLgo+IGB4bCBmb3JrLWxhdW5jaC1kbWA6IChvciBhdHRhY2gtZG0/KTogU3RhcnQg
dXAgYW5kIGF0dGFjaCB0aGUKPiBkZXZpY2Vtb2RlbCB0byB0aGUgZG9tYWluCj4gCj4gVGhlbiBg
eGwgZm9ya2AgKG9yIG1heWJlIGB4bCBmb3JrLXZtYCkgd291bGQgYmUgc29tZXRoaW5nIGltcGxl
bWVudGVkIGluCj4gdGhlIGZ1dHVyZSB0aGF0IHdvdWxkIGZvcmsgdGhlIGVudGlyZSBkb21haW4u
CgpJIGRvbid0IGhhdmUgYSBzdHJvbmcgb3BpbmlvbiBvbiB3aGV0aGVyIHdlIHNob3VsZCBoYXZl
IGEgYnVuY2ggb2YKZm9yay0qIGNvbW1hbmRzIG9yIGEgc2luZ2xlIG9uZS4gTXkgcHJlZmVyZW5j
ZSB3b3VsZCBiZSBmb3IgYSBzaW5nbGUKb25lIGJlY2F1c2UgSSB0aGluayBvdGhlciBjb21tYW5k
cyBjYW4gYmUgaW1wbGVtZW50ZWQgYXMgb3B0aW9ucy4KCldoYXQgSSB3b3VsZCBsaWtlIHRvIHBy
ZXZlbnQgaXMgZW5kaW5nIHVwIHdpdGggc29tZXRoaW5nIGxpa2UKZm9yay1kb21haW4gYW5kIGZv
cmstdm0gY29tbWFuZHMsIHdoaWNoIGxvb2sgbGlrZSBhbGlhc2VzLCBhbmQgY2FuCmxlYWQgdG8g
Y29uZnVzaW9uLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
