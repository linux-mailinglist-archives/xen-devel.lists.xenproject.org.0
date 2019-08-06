Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D53A683338
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 15:45:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huziy-0007Wg-Hl; Tue, 06 Aug 2019 13:42:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qF5n=WC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1huziw-0007Wb-CZ
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 13:41:58 +0000
X-Inumbo-ID: f3dc65ea-b84f-11e9-a75a-d79b443c81cc
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3dc65ea-b84f-11e9-a75a-d79b443c81cc;
 Tue, 06 Aug 2019 13:41:55 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NCU3j+moesrGQIdAiEFx14tUca25+2SwUx/XyJfR5cpvlRKoNDyPy8pfnQ/+mP9c6ki9fWA26u
 hWgn2fP+pyYk14EV/J/X7KCJivp4jX6ZVI9y2qKkDYmyb/+kYbFcc4Mg6vD/UTnL0NCpB9zZ9C
 oveg1W9tFZAOsBcum94GZ3l9IFUHKKRqEwpai+Cg8aGvoUvXNJIdh7IlG6vJz0BbOJbQtXSwxX
 zH//kB9Mf0d8qQ3ICGKxsZAjkhpJmoQas9yYOcdBW6st784cUlOA/Uf9Z7/v23R2FbNjOVy1Q5
 q80=
X-SBRS: 2.7
X-MesageID: 4089946
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,353,1559534400"; 
   d="scan'208";a="4089946"
Date: Tue, 6 Aug 2019 15:41:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <20190806134126.kaocxz2ssfrhxcpf@Air-de-Roger>
References: <f5ff77af-d2d5-1a89-06d4-6049f607ec80@suse.com>
 <20190719090202.vzeernrydawwnzan@Air-de-Roger.citrite.net>
 <b7d4e591-a5e3-94f1-6870-f0b6e7e9daf7@suse.com>
 <20190805134424.GJ1549@mail-itl>
 <c16737dc-f5f1-45f7-e743-970016820aab@suse.com>
 <20190806094601.GG1250@mail-itl>
 <b62dcc6f-7239-b3a2-9c8b-bec931ee023c@suse.com>
 <20190806105317.GH1250@mail-itl>
 <d9021dde-efa3-1ba8-bb63-98e99d424a32@suse.com>
 <20190806124349.GI1250@mail-itl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806124349.GI1250@mail-itl>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v5 5/6] xen/x86: add PHYSDEVOP_msi_control
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDI6NDM6NDlQTSArMDIwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IE9uIFR1ZSwgQXVnIDA2LCAyMDE5IGF0IDAyOjA1OjQ4UE0g
KzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gT24gMDYuMDguMjAxOSAxMjo1MywgTWFyZWsg
TWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToKPiA+ID4gT24gVHVlLCBBdWcgMDYsIDIwMTkg
YXQgMTI6MzM6MzlQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiA+ID4gT24gMDYuMDgu
MjAxOSAxMTo0NiwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToKPiA+ID4gPiA+
IE9uIFR1ZSwgQXVnIDA2LCAyMDE5IGF0IDA3OjU2OjM5QU0gKzAwMDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+ID4gPiA+ID4gPiBPbiAwNS4wOC4yMDE5IDE1OjQ0LCBNYXJlayBNYXJjenlrb3dza2kt
R8OzcmVja2kgIHdyb3RlOgo+ID4gPiA+ID4gPiA+IEknbSB0cnlpbmcgdG8gZ2V0IGl0IHdvcmtp
bmcgYW5kIGl0IGlzbid0IGNsZWFyIHRvIG1lIHdoYXQgc2hvdWxkIEkKPiA+ID4gPiA+ID4gPiBj
aGVjayBmb3IgIklOVHggaXMgYWxzbyBlbmFibGVkIi4gSSBhc3N1bWVkIFBDSV9DT01NQU5EX0lO
VFhfRElTQUJMRQo+ID4gPiA+ID4gPiA+IGJpdCwgYnV0IGl0IGxvb2tzIGxpa2UgZ3Vlc3QgaGFz
IG5vIGNvbnRyb2wgb3ZlciB0aGlzIGJpdCwgZXZlbiBpbgo+ID4gPiA+ID4gPiA+IHBlcm1pc3Np
dmUgbW9kZS4gIFRoaXMgbWVhbnMgZW5hYmxpbmcgTVNJKC1YKSBhbHdheXMgZmFpbHMgYmVjYXVz
ZSBndWVzdAo+ID4gPiA+ID4gPiA+IGhhcyBubyB3YXkgdG8gc2V0IFBDSV9DT01NQU5EX0lOVFhf
RElTQUJMRSBiaXQgYmVmb3JlLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gV2VsbCwgdGhlIGd1
ZXN0IGhhcyBubyBjb250cm9sLCBidXQgaW4gb3JkZXIgdG8gZW5hYmxlIE1TSXssLVh9IEknZAo+
ID4gPiA+ID4gPiBoYXZlIGV4cGVjdGVkIHFlbXUgb3IgdGhlIERvbTAga2VybmVsIHRvIHNldCB0
aGlzIGJpdCB1cCBmcm9udC4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gcWVtdSB3b3VsZCBkbyB0aGF0
LCB3aGVuIHJ1bm5pbmcgaW4gZG9tMC4gQnV0IGluIFBWIHN0dWJkb21haW4gaXQgdGFsa3MKPiA+
ID4gPiA+IHRvIHBjaWJhY2ssIHdoaWNoIGZpbHRlcnMgaXQgb3V0Lgo+ID4gPiA+IAo+ID4gPiA+
IEZpbHRlcmluZyBvdXQgdGhlIGd1ZXN0IGF0dGVtcHQgaXMgZmluZSwgYnV0IGl0IHNob3VsZCB0
aGVuIHNldCB0aGUKPiA+ID4gPiBiaXQgd2hpbGUgcHJlcGFyaW5nIE1TSS9NU0ktWCBmb3IgdGhl
IGd1ZXN0LiAoSSdtIG5vdCBzdXJlIGl0IHdvdWxkCj4gPiA+ID4gbmVlZCB0byBkbyBzbyBleHBs
aWNpdGx5LCBvciB3aGV0aGVyIGl0IGNvdWxkbid0IHJlbHkgb24gY29kZQo+ID4gPiA+IGVsc2V3
aGVyZSBpbiB0aGUga2VybmVsIGRvaW5nIHNvLikKPiA+ID4gLi4uCj4gPiA+ID4gV2VsbCwgSSB0
aGluayBJJ3ZlIG1hZGUgbXkgcG9zaXRpb24gY2xlYXI6IFNvIGZhciB3ZSB1c2UgcGNpX2ludHgo
KQo+ID4gPiA+IG9ubHkgb24gZGV2aWNlcyB1c2VkIGJ5IFhlbiBpdHNlbGYuIEkgdGhpbmsgdGhp
cyBzaG91bGQgcmVtYWluIHRvIGJlCj4gPiA+ID4gdGhhdCB3YXkuIERldmljZXMgaW4gcG9zc2Vz
c2lvbiBvZiBkb21haW5zIChpbmNsdWRpbmcgRG9tMCkgc2hvdWxkCj4gPiA+ID4gYmUgdW5kZXIg
RG9tMCdzIGNvbnRyb2wgaW4gdGhpcyByZWdhcmQuCj4gPiA+IAo+ID4gPiBUaGUgdGhpbmcgaXMs
IGluIGNhc2Ugb2YgdXNpbmcgc3R1YmRvbWFpbiwgaXQncyBtb3N0bHkgc3R1YmRvbWFpbgo+ID4g
PiBoYW5kbGluZyBpdC4gRXNwZWNpYWxseSBhbGwgdGhlIGNvbmZpZyBzcGFjZSBpbnRlcmNlcHRp
b24gYW5kIGFwcGx5aW5nCj4gPiA+IGxvZ2ljIHRvIGl0IGlzIGRvbmUgYnkgcWVtdSBpbiBzdHVi
ZG9tYWluLiBEbyB5b3Ugc3VnZ2VzdCBkdXBsaWNhdGluZyAvCj4gPiA+IG1vdmluZyB0aGF0IHBh
cnQgdG8gZG9tMCBpbnN0ZWFkPyBXaGF0IHdvdWxkIGJlIHRoZSBwb2ludCBmb3Igc3R1YmRvbWFp
bgo+ID4gPiB0aGVuPwo+ID4gCj4gPiBOb3RoaW5nIHNob3VsZCBiZSBtb3ZlZCBiZXR3ZWVuIGNv
bXBvbmVudHMgaWYgcG9zc2libGUgKGFuZCBpZiBwbGFjZWQKPiA+IHNlbnNpYmx5KS4gQnV0IGlz
bid0IHN0dWJkb20gKGJlaW5nIGEgUFYgRG9tVSkgcmVseWluZyBvbiBwY2liYWNrIGluCj4gPiBE
b20wIGFueXdheT8gQW5kIGhlbmNlIGRvZXNuJ3QgdGhlIGZsb3cgb2YgZXZlbnRzIGluY2x1ZGUK
PiA+IHBjaV9lbmFibGVfbXNpeyx4fSgpIGludm9rZWQgYnkgcGNpYmFjaz8gSSdkIGhhdmUgZXhw
ZWN0ZWQgdGhhdCB0bwo+ID4gKGFsc28pIHRha2UgY2FyZSBvZiBJTlR4Lgo+IAo+IFRoaXMgd2Fz
IGRpc2N1c3NlZCBpbiB2MiBvZiB0aGlzIHNlcmllc1sxXSwgd2hlcmUgeW91IGFsc28gcmVzcG9u
ZGVkLgo+IFJlbGV2YW50IHBhcnQgb2YgUm9nZXIncyBlbWFpbDoKPiAKPiAgICAgT2ggZ3JlYXQs
IHRoYXQncyB1bmZvcnR1bmF0ZS4gQm90aCBwY2liYWNrIGZ1bmN0aW9ucyBlbmQgdXAgY2FsbGlu
Zwo+ICAgICBpbnRvIG1zaV9jYXBhYmlsaXR5X2luaXQgaW4gdGhlIExpbnV4IGtlcm5lbCwgd2hp
Y2ggZG9lcyBpbmRlZWQgbW9yZQo+ICAgICB0aGFuIGp1c3QgdG9nZ2xpbmcgdGhlIFBDSSBjb25m
aWcgc3BhY2UgZW5hYmxlIGJpdC4KPiAKPiAgICAgT1RPSCBhZGRpbmcgYSBieXBhc3MgdG8gcGNp
YmFjayBzbyB0aGUgc3R1YmRvbSBpcyBhYmxlIHRvIHdyaXRlIHRvIHRoZQo+ICAgICBQQ0kgcmVn
aXN0ZXIgaW4gb3JkZXIgdG8gdG9nZ2xlIHRoZSBlbmFibGUgYml0IHNlZW1zIHF1aXRlIGNsdW1z
eS4gTm90Cj4gICAgIHRvIG1lbnRpb24gdGhhdCB5b3Ugd291bGQgYmUgcmVxdWlyZWQgdG8gdXBk
YXRlIERvbTAga2VybmVsIGluIG9yZGVyIHRvCj4gICAgIGZpeCB0aGUgaXNzdWUuCj4gCj4gICAg
IERvIHlvdSB0aGluayBpdCBtYWtlcyBzZW5zZSB0byBhZGQgYSBkb21jdGwgdG8gZW5hYmxlL2Rp
c2FibGUgTVNJKFgpPwo+IAo+ICAgICBUaGlzIHdheSB0aGUgYnVnIGNvdWxkIGJlIGZpeGVkIGJ5
IGp1c3QgdXBkYXRpbmcgWGVuIChhbmQgdGhlCj4gICAgIHN0dWJkb21haW4pLgo+IAo+IFsxXSBo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTkt
MDEvbXNnMDEyNzEuaHRtbAoKVGhlIG1haW4gcHJvYmxlbSBoZXJlIGlzIHRoYXQgUENJIHBhc3N0
aHJvdWdoIGZvciBQViBpcyBjb21wbGV0ZWx5CmRpZmZlcmVudCB0aGFuIHBhc3N0aHJvdWdoIGZv
ciBIVk0sIGFuZCBoZW5jZSB0cnlpbmcgdG8gdXNlIHRoZSBQVgpwYXNzdGhyb3VnaCBpbnRlcmZh
Y2UgYXMgYSBwcm94eSB0byB0aGUgSFZNIGludGVyZmFjZSAoYW5kCmltcGxlbWVudGF0aW9uIGlu
IFFFTVUpIGlzIGxpa2VseSB0byBmaW5kIGlzc3VlcyBhcyB3ZSBoYXZlIHNlZW4uCgpJIHN0aWxs
IHRoaW5rIHRoYXQgbW9kaWZ5aW5nIHBjaWJhY2sgaXMgbm90IHRoZSByaWdodCBjYWxsLCBhcyB0
aGF0CmlzIGp1c3QgYWRkaW5nIGJvZGdlcyB0byB0aGUgcGNpaWYgUFYgaW50ZXJmYWNlIHRvIHN1
aXQgYSBub24tUFYKdXNlLWNhc2UsIHdoaWNoIHBjaWJhY2svcGNpZnJvbnQgd2Fzbid0IGRlc2ln
bmVkIHRvIGhhbmRsZSAoYXMgbGlrZWx5Cm5vIG9uZSB0aG91Z2h0IG9mIGhhbmRsaW5nIHBhc3N0
aHJvdWdoIGluIGEgc3R1YmRvbWFpbikuCgpJIHN0aWxsIHRoaW5rIHRoYXQgYWRkaW5nIHRoZXNl
IG1pc3NpbmcgcGllY2VzIHRvIGFuIGh5cGVyY2FsbCBpcwpsaWtlbHkgdGhlIGJlc3Qgc29sdXRp
b24gaGVyZSwgYnV0IHdlIG5lZWQgdG8ga25vdyBiZWZvcmVoYW5kIHdoYXRldmVyCnRoZSBzdHVk
b21haW4gbmVlZHMgdG8gZG8gc28gdGhhdCBpdCBjYW4gYmUgcHV0IGluc2lkZSBvZiBhIHNpbmds
ZQpoeXBlcmNhbGwgaWYgcG9zc2libGUuIFNvIGZhciB0aGlzIGlzOiBtb2RpZnkgdGhlIE1TSS9N
U0ktWCBjb250cm9sCmJpdCBhbmQgdGhlIElOVHggYml0IGluIHRoZSBjb21tYW5kIHJlZ2lzdGVy
PwoKSW4gd2hpY2ggY2FzZSB0aGUgaHlwZXJjYWxsIHNob3VsZCBtYXliZSBiZSBuYW1lZApQSFlT
REVWT1BfaW50ZXJydXB0X2NvbnRyb2wgb3Igc29tZSBzdWNoPwoKVGhhbmtzLCBSb2dlci4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
